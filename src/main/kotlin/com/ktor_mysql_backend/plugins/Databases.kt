package com.ktor_mysql_backend.plugins

//import org.jetbrains.exposed.sql.Database
//import org.jetbrains.exposed.sql.transactions.TransactionManager
//import org.jetbrains.exposed.sql.transactions.transaction
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



fun prepareJDBI(): Jdbi {
    val jdbi = Jdbi.create("jdbc:h2:mem:test;MODE=MYSQL;DB_CLOSE_DELAY=-1;", "username", "password")
    jdbi.installPlugin(KotlinPlugin())
    jdbi.installPlugin(KotlinSqlObjectPlugin())
    return jdbi
}
fun prepareDB(jdbi: Jdbi,filepath:String) {
    val h: Handle = jdbi.open()
    val fileContent = File(filepath).readText()

    //val fileContent = File("Fahrrad2022.sql").readText()
    val script = Script(h, fileContent)
    script.execute()
    script.close()
    h.close()
    //h.setReadOnly(true)
    //return h
}
fun  runQueries(jdbi: Jdbi,queryString: String): Pair<List<String>, List<List<String>>> {
    //val q = h.createQuery("select 1 + 1, 2 * 2, 5 * 5;");
    val h: Handle = jdbi.open()
    h.setReadOnly(true)
    val script = Script(h, queryString)
    val statements = script.statements
    val results = statements.map { stmt -> h.createQuery(stmt).mapToMap().list()}
    val lastRes = results.last()
    //val q = h.createQuery(queryString);
    //val l = q.mapToMap().list()
    val colNames = lastRes[0].keys.toList()
    val td = lastRes.map { m -> m.values.map{ v -> v.toString() } }
    //h.close()
    return Pair (colNames, td)
}

fun Application.hostDB(slqScriptName:String){
    val jdbi = prepareJDBI()
    prepareDB(jdbi, "static/" + "$slqScriptName.sql")
    routing {get("/runQueriesTo$slqScriptName"){
        val queryString = call.request.queryParameters["q"] ?: ""
        try {
            val queryRes =  runQueries(jdbi,queryString)
            call.respond(queryRes)
        }
        catch (error: JdbiException){

            call.respond(error.message.toString())
        }


    }
}}

fun Application.configureDatabases() {
    hostDB("fahrradverleih")
    hostDB("mondial")

}
