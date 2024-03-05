package com.ktor_mysql_backend.plugins


import io.ktor.server.application.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import org.jdbi.v3.core.Jdbi
import org.jdbi.v3.core.JdbiException
import org.jdbi.v3.core.kotlin.KotlinPlugin
import org.jdbi.v3.core.statement.Script
import org.jdbi.v3.sqlobject.kotlin.KotlinSqlObjectPlugin
import java.io.File


private fun prepareJDBI(slqScriptName: String): Jdbi {
    // val jdbi = Jdbi.create("jdbc:h2:mem:$slqScriptName;MODE=MYSQL;DB_CLOSE_DELAY=-1;", "username", "")
//    val jdbi = Jdbi.create(
//        "jdbc:mysql://localhost:3306/$slqScriptName?createDatabaseIfNotExist=true&autoReconnect=true", "max", "blabla"
//    )
   Class.forName("com.mysql.cj.jdbc.Driver");
   val jdbi = Jdbi.create(
       "jdbc:mysql://172.17.0.1:3306/$slqScriptName?createDatabaseIfNotExist=true&autoReconnect=true", "max", "blabla"
   )
    jdbi.installPlugin(KotlinPlugin())
    jdbi.installPlugin(KotlinSqlObjectPlugin())
    val file = File("static/$slqScriptName.sql")
    val fileContent = file.readText()
    jdbi.withHandle<Unit, JdbiException> { h ->
        run {
            val script = Script(h, fileContent)
            script.execute()
            script.close()
        }
    }
    return jdbi
}

private fun runQueries(jdbi: Jdbi, queryString: String): Pair<List<String>, List<List<String>>> {
    return (jdbi.withHandle<Pair<List<String>, List<List<String>>>, JdbiException> { h ->
        run {
            h.setReadOnly(true)
            val script = Script(h, queryString.replace("\"" ,"\'"))
            val statements = script.statements
            if (statements.isEmpty()){ return@withHandle Pair(
                emptyList(), emptyList()
            )}

            val results = statements.map { stmt -> h.createQuery(stmt).mapToMap().list() }
//            if (results.isEmpty()) {
//                return@withHandle Pair(
//                    emptyList(), emptyList()
//                )
//            }
//            else {

            val lastRes = results.last()
            val colNames = if (lastRes.isEmpty()) emptyList()  else  lastRes.first().keys.toList()
            val td = lastRes.map { m -> m.values.map { v -> v?.toString() ?: "null" } }
            return@withHandle Pair(colNames, td)}
        //}
    })
}



private val dbMap = createDBMap(arrayOf("fahrradverleih", "mondial"))

//val z = dbMap["fahrradverleih"]
//val x = z.let {
//    if (it != null) {
//        runQueries(it, "select * from kunden where name = \"s\"; ")
//    }
//}
//val y = println(x)

private fun createDBMap(dbNames: Array<String>): Map<String, Jdbi> {
    return dbNames.associateWith { dbName -> prepareJDBI(dbName) }
}

fun runQueryOnDB(dbName: String, queryString: String): Pair<List<String>, List<List<String>>> {
    val db = dbMap[dbName] ?: throw Exception("database not found")
    return runQueries(db, queryString)
}

fun causeToString(e: Exception): String {
    val eCause = if (e.cause != null) {
        e.cause!!.message
    } else {
        e.message
    }
    return (eCause ?: "Bad Error")
}

private fun Application.hostDB() {
    routing {
        get("/runQueriesTo") {
            val dbName = call.request.queryParameters["d"] ?: ""
            val queryString = call.request.queryParameters["q"] ?: ""
            try {
                val x = runQueryOnDB(dbName, queryString)
                call.respond(x)
            } catch (e: Exception) {
                call.respond(causeToString(e))
            }
        }
    }
}


fun Application.configureDatabases() {
    hostDB()
}
