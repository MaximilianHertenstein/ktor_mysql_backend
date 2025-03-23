
val ktor_version: String by project
val kotlin_version: String by project
val logback_version: String by project
val mysqlVersion:String by project
val h2_version: String by project
val jdbi_version: String by project

plugins {
    kotlin("jvm") version "2.1.20"
    id("io.ktor.plugin") version "3.1.1"
    id("org.jetbrains.kotlin.plugin.serialization") version "2.1.20"
    //id("com.github.johnrengelman.shadow") version "8.1.1"

    //id("com.gradleup.shadow") version "8.3.5"
}

group = "com.ktor_mysql_backend"
version = "0.0.1"

application {
    mainClass.set("io.ktor.server.netty.EngineMain")
//    mainClass.set("com.example.ApplicationKt")
    val isDevelopment: Boolean = project.ext.has("development")
    applicationDefaultJvmArgs = listOf("-Dio.ktor.development=$isDevelopment")
}

repositories {
    mavenCentral()
}

dependencies {
    runtimeOnly("com.gradleup.shadow:shadow-gradle-plugin:8.3.6")
    implementation("io.ktor:ktor-server-core-jvm")
    //implementation(kotlin("stdlib-jdk10"))
    implementation("io.ktor:ktor-serialization-kotlinx-json-jvm")
    implementation("io.ktor:ktor-server-content-negotiation-jvm")
//    implementation("org.jetbrains.exposed:exposed-core:$exposed_version")
//    implementation("org.jetbrains.exposed:exposed-jdbc:$exposed_version")
    implementation("com.h2database:h2:$h2_version")
    implementation("io.ktor:ktor-server-call-logging:$ktor_version")
    //implementation("io.ktor:ktor-server-call-logging-jvm")
//    implementation("io.ktor:ktor-server-netty-jvm")
    implementation("io.ktor:ktor-server-netty:$ktor_version")
    implementation("ch.qos.logback:logback-classic:$logback_version")
    //testImplementation("io.ktor:ktor-server-tests-jvm")
    testImplementation("org.jetbrains.kotlin:kotlin-test-junit:$kotlin_version")
    implementation("com.mysql:mysql-connector-j:$mysqlVersion")
    //implementation("mysql:mysql-connector-java:$mysqlVersion")
    // https://mvnrepository.com/artifact/com.mysql/mysql-connector-j
//    implementation("com.mysql:mysql-connector-j:8.3.0")

//    implementation("com.mysql:mysql-connector-j:8.3.0")

    implementation("org.jdbi:jdbi3-core:$jdbi_version")
    //implementation("com.h2database:h2:1.4.200")
    implementation("org.jdbi:jdbi3-kotlin:$jdbi_version")
    implementation("org.jdbi:jdbi3-kotlin-sqlobject:$jdbi_version")
    implementation("io.ktor:ktor-server-cors:$ktor_version")
    implementation("io.ktor:ktor-server-html-builder:$ktor_version")
    //implementation("org.jetbrains.kotlinx:kotlinx-html:0.8.0")
    // implementation(kotlin("script-runtime"))

    //implementation("io.insert-koin:koin-ktor:$koinKtor")
    //connection pooling
    //implementation("com.zaxxer:HikariCP:$hikaricpVersion")
    //implementation("org.jdbi:jdbi3-core:3.44.2-SNAPSHOT")
    //implementation(platform("org.jdbi:jdbi3-bom:3.44.2-SNAPSHOT"))

//    implementation("org.jdbi:jdbi3-kotlin")
//    implementation("org.jdbi:jdbi3-kotlin-sqlobject")
}
