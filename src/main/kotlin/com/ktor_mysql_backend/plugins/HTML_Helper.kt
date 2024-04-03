package com.ktor_mysql_backend.plugins


import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.html.*
import io.ktor.server.request.*
import io.ktor.server.routing.*
import kotlinx.html.*


private fun tableDataToHTMLTable(columnNames: List<String>, tableData: List<List<String>>): HTML.() -> Unit {
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

private fun stringToHTML(message: String): HTML.() -> Unit {
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
        post("/runQueriesGetHTML") {
            val queryParameters = call.receiveParameters()


            val queryString = queryParameters["q"] ?: ""
            println("the fom parameters are " + queryParameters)

            println("the fom parameters are  q : " + queryString + " d : " + queryParameters["d"])
            try {
                val dbName = if (queryParameters["d"] != null) {queryParameters["d"].toString()}else {throw Exception("No database selected")}
                val tableData = runQueryOnDB(dbName, queryString)
                call.respondHtml(HttpStatusCode.OK, tableDataToHTMLTable(tableData.first, tableData.second))
            } catch (e: Exception) {
                call.respondHtml(HttpStatusCode.OK, stringToHTML(causeToString(e)))
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
