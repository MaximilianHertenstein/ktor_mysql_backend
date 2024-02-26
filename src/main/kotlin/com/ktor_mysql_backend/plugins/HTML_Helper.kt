package com.ktor_mysql_backend.plugins


import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.html.*
import io.ktor.server.routing.*
import kotlinx.html.*


fun h(columnNames: List<String>, tableData: List<List<String>>): HTML.() -> Unit {
    return {
        body {

            table {
                makeRowHelper(columnNames) { re: String -> th { +re } }
                for (row in tableData) {
                    makeRowHelper(row) { re: String -> td { +re } }
                }
            }
        }
    }
}

private fun TABLE.makeRowHelper(row: List<String>, helper: TR.(String) -> Unit) {
    tr {
        for (re in row) {
            helper(re)
        }
    }
}

fun stringToHTML(message: String): HTML.() -> Unit {
    return {
        body {
            p { +message }
        }

    }
}
//private fun TABLE.rowElementsToTableRow(row: List<String>) {
//    makeRowHelper(row) {re:String -> td { +re } }
//}
//
//private fun TABLE.colNamesToTableHeader(columnNames: List<String>) {
//    makeRowHelper(columnNames) {re:String -> th { +re } }
//}


fun Application.respondHTML() {
    routing {
        get("/runQueriesGetHTML") {
            val dbName = call.request.queryParameters["d"] ?: ""
            val queryString = call.request.queryParameters["q"] ?: ""
            try {
                val x = runQueryOnDB(dbName, queryString)
                call.respondHtml(HttpStatusCode.OK, h(x.first, x.second))
            } catch (e: Exception) {
                call.respondHtml(HttpStatusCode.NotAcceptable, stringToHTML(causeToString(e)))
            }
        }
    }
}

//val testColNames = listOf("a","b","c")
//val testTD= listOf(listOf("d","e","f"), listOf("g", "h", "i") )

//fun Application.respondHTML2() {
//    routing {
//        get("/testHTMLRoute") {
//            call.respondHtml(HttpStatusCode.OK,h(testColNames,testTD))
//
//        }
//    }
//}
