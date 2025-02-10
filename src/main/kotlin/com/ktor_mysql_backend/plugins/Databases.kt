package com.ktor_mysql_backend.plugins


import io.ktor.server.application.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import org.jdbi.v3.core.Jdbi
import org.jdbi.v3.core.JdbiException
import org.jdbi.v3.core.kotlin.KotlinPlugin
import org.jdbi.v3.core.result.ResultIterable
import org.jdbi.v3.core.statement.Script
import org.jdbi.v3.sqlobject.kotlin.KotlinSqlObjectPlugin
import java.io.File


private fun prepareJDBI(slqScriptName: String): Jdbi {
    val jdbi = Jdbi.create("jdbc:h2:mem:$slqScriptName;MODE=MYSQL;DB_CLOSE_DELAY=-1;", "username", "")
//    val jdbi = Jdbi.create(
//        "jdbc:mysql://localhost:3306/$slqScriptName?createDatabaseIfNotExist=true&autoReconnect=true", "max", "blabla"
//    )
    Class.forName("com.mysql.cj.jdbc.Driver")
//    val jdbi = Jdbi.create(
//        "jdbc:mysql://172.17.0.1:3306/$slqScriptName?createDatabaseIfNotExist=true&autoReconnect=true", "max", "blabla"
//    )
//        val jdbi = Jdbi.create(
//        "jdbc:mysql://db:3306/$slqScriptName?createDatabaseIfNotExist=true&autoReconnect=true", "root", "rootpassword"
//    )
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

            val results = statements.map { stmt -> val st = h.createQuery(stmt)  ;st.setQueryTimeout(3); val res = st.mapToMap()
                return@map mutableMaps(res)
            }
            //if (resultAsMap.size > 3000){throw Exception("Result is too big!")}
            //val results = resultAsMap.map { stmt -> stmt.toList() }
//            if (results.isEmpty()) {
//                return@withHandle Pair(
//                    emptyList(), emptyList()
//                )
//            }
//            else {

            val lastRes = results.last().list()
            val colNames = if (lastRes.isEmpty()) emptyList()  else  lastRes.first().keys.toList()
            val td = lastRes.map { m -> m.values.map { v -> if (v == null) "null" else v.toString() } }
            return@withHandle Pair(colNames, td)}
        //}
    })
}

private fun mutableMaps(res: ResultIterable<MutableMap<String, Any>>): ResultIterable<MutableMap<String, Any>> {
    var count = 0
    for (r in res) {
        count += 1;if (count > 3000) {
            throw Exception("Result is too big!")
        }
    }
    return res
}


private val dbMap = createDBMap(arrayOf("fahrradverleih", "mondial", "census", "shark_attack", "dese", "mini_dese", "freizeitpark"))
//
//val z = dbMap["census"]
//val x = z.let {
//    if (it != null) {
//        runQueries(it, "select * from census;")
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
