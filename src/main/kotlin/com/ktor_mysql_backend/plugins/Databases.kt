package com.ktor_mysql_backend.plugins


import io.ktor.server.application.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import org.jdbi.v3.core.Handle
import org.jdbi.v3.core.Jdbi
import org.jdbi.v3.core.JdbiException
import org.jdbi.v3.core.kotlin.KotlinPlugin
import org.jdbi.v3.core.statement.Script
import org.jdbi.v3.sqlobject.kotlin.KotlinSqlObjectPlugin
import java.io.File


fun prepareJDBI(slqScriptName: String): Jdbi {
    val jdbi = Jdbi.create("jdbc:h2:mem:$slqScriptName;MODE=MYSQL;DB_CLOSE_DELAY=-1;", "username", "password")
    //val jdbi = Jdbi.create("jdbc:mysql://localhost:3306/$slqScriptName", "root", "rootpassword")
    jdbi.installPlugin(KotlinPlugin())
    jdbi.installPlugin(KotlinSqlObjectPlugin())
    val h: Handle = jdbi.open()
    var file = File("static/$slqScriptName.sql")
    val fileContent = file.readText()
    println("\n\nexecute$slqScriptName\n\n")
    val script = Script(h, fileContent)
    script.execute()
    h.close()
    script.close()
    return jdbi
}

fun  runQueries(jdbi: Jdbi,queryString: String): Pair<List<String>, List<List<String>>> {
    val h: Handle = jdbi.open()
    h.setReadOnly(true)
    val script = Script(h, queryString)
    val statements = script.statements
    val results = statements.map { stmt -> h.createQuery(stmt).mapToMap().list()}
    val lastRes = results.last()
    val colNames = lastRes[0].keys.toList()
    val td = lastRes.map { m -> m.values.map{ v -> v?.toString() ?: "null" }}
    return Pair (colNames, td)
}

val dbMap = createDBMap(arrayOf("fahrradverleih","mondial"))

val z = dbMap["mondial"]
val x = z.let {
    if (it != null) {
        runQueries(it,"select * from country;")
    }
}
val y = println(x)



fun Application.hostDB(){


    //val jdbi = prepareJDBI(slqScriptName)
    //val dbMap = createDBMap(arrayOf("fahrradverleih","mondial"))
    routing {get("/runQueriesTo"){
        val dbName = call.request.queryParameters["d"] ?: ""
        val queryString = call.request.queryParameters["q"] ?: ""
        val db = dbMap[dbName]
        if (db == null)
            call.respond("database not found")
        else {
            try {
                val queryRes =  runQueries(db,queryString)
                call.respond(queryRes)
            }
            catch (error: JdbiException){
                val x = if (error.cause !=null)  {
                    error.cause!!.message} else {error.message}
                call.respond(x ?: "Error")
            }

        }




    }
}
}

fun createDBMap (dbNames: Array<String>): Map<String, Jdbi> {
    return dbNames.associateWith { dbName -> prepareJDBI(dbName) }

}


fun Application.configureDatabases() {
    hostDB()
}
