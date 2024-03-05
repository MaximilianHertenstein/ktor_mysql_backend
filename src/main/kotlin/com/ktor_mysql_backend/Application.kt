package com.ktor_mysql_backend

import com.ktor_mysql_backend.plugins.*
import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.plugins.cors.routing.*


fun main(args: Array<String>) {
    io.ktor.server.netty.EngineMain.main(args)
}

 fun Application.module() {
     install(CORS){//allowHeader(HttpHeaders.ContentType)
         allowHeader(HttpHeaders.AccessControlAllowOrigin)
         anyHost()}
     configureSerialization()
     configureDatabases()
     configureMonitoring()
     configureRouting()
     respondHTML ()
 }

//fun main(args: Array<String>): Unit = io.ktor.server.netty.EngineMain.main(args)


//fun main(args: Array<String>) {


   

//   embeddedServer(Netty, port = 8080, host = "0.0.0.0") {
//       install(CORS){//allowHeader(HttpHeaders.ContentType)
//           allowHeader(HttpHeaders.AccessControlAllowOrigin)
//           anyHost()}
//
//   configureSerialization()
//   configureDatabases()
//   configureMonitoring()
//   configureRouting()
//   respondHTML ()}
//}