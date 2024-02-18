package com.ktor_mysql_backend

import com.ktor_mysql_backend.plugins.configureDatabases
import com.ktor_mysql_backend.plugins.configureMonitoring
import com.ktor_mysql_backend.plugins.configureRouting
import com.ktor_mysql_backend.plugins.configureSerialization
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
}
