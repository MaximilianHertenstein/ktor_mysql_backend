
--
-- Table structure for table `kursbelegungen`
--

DROP TABLE IF EXISTS `lehrer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lehrer` (
                          `lehrerNr` int(11) NOT NULL,
                          `nachname` varchar(45) DEFAULT NULL,
                          `vorname` varchar(45) DEFAULT NULL,
                          PRIMARY KEY (`lehrerNr`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `kurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kurse` (
                         `kursNr` int(11) NOT NULL,
                         `kursbezeichnung` varchar(45) DEFAULT NULL,
                         `lehrerNr` int(11) NOT NULL,
                         PRIMARY KEY (`kursNr`),
                         KEY `fk_kurse_lehrer1_idx` (`lehrerNr`),
                         CONSTRAINT `fk_kurse_lehrer1` FOREIGN KEY (`lehrerNr`) REFERENCES `lehrer` (`lehrerNr`) ON DELETE NO ACTION ON UPDATE NO ACTION
);
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `schueler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schueler` (
                            `schuelerNr` int(11) NOT NULL,
                            `nachname` varchar(45) DEFAULT NULL,
                            `vorname` varchar(45) DEFAULT NULL,
                            PRIMARY KEY (`schuelerNr`)
);
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `kursbelegungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kursbelegungen` (
  `belegungsNr` int(11) NOT NULL,
  `schuelerNr` int(11) NOT NULL,
  `kursNr` int(11) NOT NULL,
  PRIMARY KEY (`belegungsNr`),
  KEY `fk_kursbelegungen_schueler1_idx` (`schuelerNr`),
  KEY `fk_kursbelegungen_kurse1_idx` (`kursNr`),
  CONSTRAINT `fk_kursbelegungen_kurse1` FOREIGN KEY (`kursNr`) REFERENCES `kurse` (`kursNr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_kursbelegungen_schueler1` FOREIGN KEY (`schuelerNr`) REFERENCES `schueler` (`schuelerNr`) ON DELETE NO ACTION ON UPDATE NO ACTION
);
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `zimmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zimmer` (
                          `zimmerNr` int(11) NOT NULL,
                          `raumbezeichnung` varchar(45) DEFAULT NULL,
                          `anzahl_plaetze` int(11) DEFAULT NULL,
                          PRIMARY KEY (`zimmerNr`)
);
--
-- Table structure for table `kurse`
--



--
-- Table structure for table `lehrer`
--



--
-- Table structure for table `schueler`
--



--
-- Table structure for table `unterrichte`
--

DROP TABLE IF EXISTS `unterrichte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unterrichte` (
  `unterrichtsNr` int(11) NOT NULL,
  `von` varchar(5) DEFAULT NULL,
  `bis` varchar(5) DEFAULT NULL,
  `wochentag` varchar(45) DEFAULT NULL,
  `zimmerNr` int(11) NOT NULL,
  `kursNr` int(11) NOT NULL,
  PRIMARY KEY (`unterrichtsNr`),
  KEY `fk_unterrichte_zimmer_idx` (`zimmerNr`),
  KEY `fk_unterrichte_kurse1_idx` (`kursNr`),
  CONSTRAINT `fk_unterrichte_kurse1` FOREIGN KEY (`kursNr`) REFERENCES `kurse` (`kursNr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_unterrichte_zimmer` FOREIGN KEY (`zimmerNr`) REFERENCES `zimmer` (`zimmerNr`) ON DELETE NO ACTION ON UPDATE NO ACTION
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zimmer`
--


/*!40000 ALTER TABLE `zimmer` DISABLE KEYS */;
INSERT INTO `zimmer` VALUES (1,'101',20),(2,'117',30),(3,'118',29);
/*!40000 ALTER TABLE `zimmer` ENABLE KEYS */;

/*!40000 ALTER TABLE `lehrer` DISABLE KEYS */;
INSERT INTO `lehrer` VALUES (1,'Maier','Jochen'),(2,'Brandt','Sabine'),(3,'Jundt','Michael');
/*!40000 ALTER TABLE `lehrer` ENABLE KEYS */;


--
-- Dumping data for table `schueler`
--


/*!40000 ALTER TABLE `schueler` DISABLE KEYS */;
INSERT INTO `schueler` VALUES (1,'Pfeifer','Leon'),(2,'Horn','Julia'),(3,'Klatt','Maren'),(4,'Schneider','Sophie'),(5,'Strick','Jana'),(6,'Florath','Fabian'),(7,'Heine','Markus'),(8,'Frey','Nadine'),(9,'Maler','Michael'),(10,'Schmidt','Fabienne'),(11,'Schwab','Sina'),(12,'Richter','Mirko'),(13,'Bauer','Stefan'),(14,'Bernhard','Marina'),(15,'Voss','Stefanie'),(16,'Fischer','Theo'),(17,'Weber','Kathrin'),(18,'Wirth','Mike'),(19,'Becker','Sandra'),(20,'Stark','Bernd'),(21,'Hoffmann','Jan'),(22,'Krause','Lara'),(23,'König','Janina'),(24,'Zeller','Ralf'),(25,'Ackermann','Maike'),(26,'Braun','Anna'),(27,'Lippert','Sina'),(28,'Peters','Angelika'),(29,'Fuchs','Daniel'),(30,'Wulf','Stefanie'),(31,'Bartsch','Dirk'),(32,'Köhler','Moritz'),(33,'Hinz','Julia'),(34,'Döring','Melanie'),(35,'Ehrhardt','Frank'),(36,'Böhm','Luisa'),(37,'Winter','Alexandra'),(38,'Uhl','Ulrike'),(39,'Hempel','Paul'),(40,'Reich','Matthias'),(41,'Schumacher','Eva'),(42,'Schuster','Joel'),(43,'Vogt','Anina'),(44,'Kieler','Rahel'),(45,'Witte','Sarah'),(46,'Horn','Tanja');
/*!40000 ALTER TABLE `schueler` ENABLE KEYS */;
--
-- Dumping data for table `kursbelegungen`
--

/*!40000 ALTER TABLE `kurse` DISABLE KEYS */;
INSERT INTO `kurse` VALUES (1,'Informatik1',2),(2,'Informatik2',3),(3,'Mathematik1',1),(4,'Mathematik2',2),(5,'Deutsch1',3),(6,'Deutsch2',1);
/*!40000 ALTER TABLE `kurse` ENABLE KEYS */;

/*!40000 ALTER TABLE `kursbelegungen` DISABLE KEYS */;
INSERT INTO `kursbelegungen` VALUES (1,1,3),(2,1,6),(3,2,2),(4,2,4),(5,3,4),(6,3,6),(7,4,1),(8,4,3),(9,5,2),(10,5,5),(11,6,4),(12,6,6),(13,7,3),(14,7,1),(15,8,4),(16,8,5),(17,9,3),(18,9,6),(19,10,4),(20,10,5),(21,11,3),(22,11,6),(23,12,4),(24,12,5),(25,13,2),(26,13,4),(27,14,1),(28,14,4),(29,15,2),(30,15,5),(31,16,1),(32,16,6),(33,17,3),(34,17,5),(35,18,3),(36,18,6),(37,19,4),(38,19,5),(39,20,4),(40,20,6),(41,21,2),(42,21,3),(43,22,2),(44,22,4),(45,23,1),(46,23,3),(47,24,1),(48,24,4),(49,25,3),(50,25,5),(51,26,4),(52,26,6),(53,27,3),(54,27,5),(55,28,4),(56,28,6),(57,29,1),(58,29,5),(59,30,1),(60,30,6),(61,31,2),(62,31,5),(63,32,2),(64,32,6),(65,33,1),(66,33,3),(67,34,2),(68,34,4),(69,35,3),(70,35,5),(71,36,4),(72,36,6),(73,37,1),(74,37,5),(75,38,2),(76,38,6),(77,39,3),(78,39,6),(79,40,4),(80,40,5),(81,41,2),(82,41,3),(83,42,1),(84,42,4),(85,43,3),(86,43,5),(87,44,3),(88,44,6),(89,45,4),(90,45,6),(91,46,2),(92,46,4);
/*!40000 ALTER TABLE `kursbelegungen` ENABLE KEYS */;

--
-- Dumping data for table `kurse`
--





--
-- Dumping data for table `lehrer`
--




--
-- Dumping data for table `unterrichte`
--


/*!40000 ALTER TABLE `unterrichte` DISABLE KEYS */;
INSERT INTO `unterrichte` VALUES (1,'13:45','15:15','Mittwoch',1,1),(2,'9:35','11:05','Freitag',1,2),(3,'7:45','9:15','Montag',2,3),(4,'9:35','11:05','Donnerstag',2,3),(5,'7:45','9:15','Dienstag',2,4),(6,'7:45','9:15','Freitag',3,4),(7,'9:35','11:05','Montag',3,5),(8,'11:20','12:50','Freitag',3,5),(9,'11:20','12:50','Dienstag',2,6),(10,'7:45','9:15','Donnerstag',3,6);
/*!40000 ALTER TABLE `unterrichte` ENABLE KEYS */;


--
-- Dumping data for table `zimmer`
--


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-25 11:46:50
