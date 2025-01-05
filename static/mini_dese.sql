-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: mini_dese
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text,
  `type` text,
  `city` text,
  `state` text,
  `zip` text,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Abby Kelley Foster Charter Public (District)','Charter District','Worcester','MA','01606'),(2,'Abington','Public School District','Abington','MA','02351'),(3,'Academy Of the Pacific Rim Charter Public (District)','Charter District','Hyde Park','MA','02136');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;

--
-- Table structure for table `expenditures`
--

DROP TABLE IF EXISTS `expenditures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenditures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `district_id` int DEFAULT NULL,
  `pupils` int DEFAULT NULL,
  `per_pupil_expenditure` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expenditures_FK_0_0` (`district_id`),
  CONSTRAINT `expenditures_FK_0_0` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenditures`
--

/*!40000 ALTER TABLE `expenditures` DISABLE KEYS */;
INSERT INTO `expenditures` VALUES (1,1,1424,16854),(2,2,2244,16143),(3,3,539,21216);
/*!40000 ALTER TABLE `expenditures` ENABLE KEYS */;

--
-- Table structure for table `graduation_rates`
--


/*!40000 ALTER TABLE `graduation_rates` ENABLE KEYS */;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schools` (
  `id` int NOT NULL AUTO_INCREMENT,
  `district_id` int DEFAULT NULL,
  `name` text,
  `type` text,
  `city` text,
  `state` text,
  `zip` text,
  PRIMARY KEY (`id`),
  KEY `schools_FK_0_0` (`district_id`),
  CONSTRAINT `schools_FK_0_0` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` VALUES (1,1,'Abby Kelley Foster Charter Public School','Charter School','Worcester','MA','01606'),(2,2,'Abington Early Education Program','Public School','Abington','MA','02351'),(3,2,'Abington High','Public School','Abington','MA','02351'),(4,2,'Abington Middle School','Public School','Abington','MA','02351'),(5,2,'Beaver Brook Elementary','Public School','Abington','MA','02351'),(6,2,'Woodsdale Elementary School','Public School','Abington','MA','02351'),(7,3,'Academy Of the Pacific Rim Charter Public School','Charter School','Hyde Park','MA','02136');
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;



DROP TABLE IF EXISTS `graduation_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `graduation_rates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_id` int DEFAULT NULL,
  `graduated` bigint DEFAULT NULL,
  `dropped` bigint DEFAULT NULL,
  `excluded` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `graduation_rates_FK_0_0` (`school_id`),
  CONSTRAINT `graduation_rates_FK_0_0` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graduation_rates`
--

/*!40000 ALTER TABLE `graduation_rates` DISABLE KEYS */;
INSERT INTO `graduation_rates` VALUES (1,1,99,1,0),(2,3,94,4,0),(3,7,93,0,0);





-- Table structure for table `staff_evaluations`
--

DROP TABLE IF EXISTS `staff_evaluations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_evaluations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `district_id` int DEFAULT NULL,
  `evaluated` bigint DEFAULT NULL,
  `exemplary` bigint DEFAULT NULL,
  `proficient` bigint DEFAULT NULL,
  `needs_improvement` bigint DEFAULT NULL,
  `unsatisfactory` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_evaluations_FK_0_0` (`district_id`),
  CONSTRAINT `staff_evaluations_FK_0_0` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_evaluations`
--

/*!40000 ALTER TABLE `staff_evaluations` DISABLE KEYS */;
INSERT INTO `staff_evaluations` VALUES (1,1,100,5,95,0,0),(2,2,98,15,83,1,1),(3,3,100,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `staff_evaluations` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-05  9:01:51
