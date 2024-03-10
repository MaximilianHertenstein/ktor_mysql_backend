-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: fahrrad2020
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.23.10.1


-- DROP SCHEMA IF EXISTS fahrradverleih;
-- CREATE SCHEMA IF NOT EXISTS `fahrradverleih`;
-- USE `fahrradverleih`;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;


--
-- Table structure for table `orte`
--

DROP TABLE IF EXISTS `orte`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orte`
(
    `ortNr` int NOT NULL AUTO_INCREMENT,
    `plz`   varchar(5),
    `ort`   varchar(50),
    PRIMARY KEY (`ortNr`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orte`
--


/*!40000 ALTER TABLE `orte`
    DISABLE KEYS */;
INSERT INTO `orte`
VALUES (2911, '07745', 'Jena'),
       (3092, '08100', 'Zwickau'),
       (4008, '10825', 'Berlin'),
       (4019, '10865', 'Berlin'),
       (4157, '12113', 'Berlin'),
       (6326, '17221', 'Neustrelitz'),
       (8314, '20738', 'Hamburg'),
       (8339, '20763', 'Hamburg'),
       (8414, '21022', 'Hamburg'),
       (10010, '24122', 'Kiel'),
       (11553, '26476', 'Wangerooge, Nordseebad'),
       (12282, '28068', 'Bremen'),
       (12291, '28077', 'Bremen'),
       (17019, '40047', 'Düsseldorf'),
       (18111, '44285', 'Dortmund'),
       (18200, '44607', 'Herne, Westf'),
       (18446, '45289', 'Essen, Ruhr'),
       (19007, '47151', 'Duisburg'),
       (19031, '47206', 'Duisburg'),
       (19765, '49084', 'Osnabrück'),
       (20345, '50446', 'Köln'),
       (20359, '50460', 'Köln'),
       (20501, '50683', 'Köln'),
       (20740, '51153', 'Köln'),
       (20788, '51333', 'Leverkusen'),
       (20807, '51381', 'Leverkusen'),
       (20811, '51390', 'Burscheid, Rheinl'),
       (20927, '51616', 'Gummersbach'),
       (21000, '52021', 'Aachen'),
       (21005, '52026', 'Aachen'),
       (21042, '52089', 'Aachen'),
       (21108, '52310', 'Düren, Rheinl'),
       (21335, '53170', 'Bonn'),
       (21414, '53404', 'Remagen'),
       (22444, '55040', 'Mainz a Rhein'),
       (22512, '55220', 'Alzey'),
       (22553, '55247', 'Mainz-Kastel'),
       (22583, '55278', 'Dalheim b Mainz'),
       (24010, '57030', 'Siegen'),
       (25420, '60423', 'Frankfurt am Main'),
       (25427, '60433', 'Frankfurt am Main'),
       (25555, '61103', 'Bad Vilbel'),
       (27301, '66711', 'Saarlouis'),
       (27522, '66932', 'Pirmasens'),
       (27850, '67445', 'Haßloch, Pfalz'),
       (27953, '67610', 'Kaiserslautern'),
       (28255, '68146', 'Mannheim'),
       (28262, '68161', 'Mannheim'),
       (28299, '68264', 'Mannheim'),
       (28380, '68705', 'Schwetzingen'),
       (28499, '69080', 'Heidelberg, Neckar'),
       (28511, '69126', 'Heidelberg, Neckar'),
       (28609, '69459', 'Weinheim, Bergstr'),
       (28878, '72766', 'Reutlingen'),
       (28933, '73031', 'Göppingen'),
       (28935, '73033', 'Göppingen'),
       (28936, '73035', 'Göppingen'),
       (28952, '73061', 'Ebersbach an der Fils'),
       (28955, '73066', 'Uhingen'),
       (29003, '73207', 'Plochingen'),
       (29008, '73223', 'Kirchheim unter Teck'),
       (29009, '73230', 'Kirchheim unter Teck'),
       (29017, '73240', 'Wendlingen am Neckar'),
       (29022, '73249', 'Berghof b Wernau, Neckar'),
       (29023, '73249', 'Wernau (Neckar)'),
       (29053, '73312', 'Geislingen an der Steige'),
       (29087, '73426', 'Aalen, Württ'),
       (29089, '73430', 'Aalen, Württ'),
       (29172, '73525', 'Schwäbisch Gmünd'),
       (29238, '73608', 'Schorndorf, Württ'),
       (29267, '73650', 'Winterbach b Schorndorf, Württ'),
       (29287, '73705', 'Esslingen am Neckar'),
       (29303, '73730', 'Esslingen am Neckar'),
       (29305, '73733', 'Esslingen am Neckar'),
       (29306, '73734', 'Esslingen am Neckar'),
       (29307, '73744', 'Ostfildern'),
       (29311, '73750', 'Ostfildern'),
       (29315, '73760', 'Ostfildern'),
       (29318, '73765', 'Neuhausen auf den Fildern'),
       (29321, '73770', 'Denkendorf, Württ'),
       (29331, '74004', 'Heilbronn, Neckar'),
       (29367, '74074', 'Heilbronn, Neckar'),
       (29375, '74100', 'Heilbronn, Neckar'),
       (29391, '74169', 'Neckarsulm'),
       (29466, '74321', 'Bietigheim-Bissingen'),
       (29502, '74385', 'Pleidelsheim'),
       (29521, '70173', 'Stuttgart'),
       (29531, '70191', 'Stuttgart'),
       (29573, '70376', 'Stuttgart'),
       (29575, '70378', 'Stuttgart'),
       (29641, '70523', 'Stuttgart'),
       (29654, '70555', 'Stuttgart'),
       (29657, '70559', 'Stuttgart'),
       (29675, '70599', 'Stuttgart'),
       (29722, '70771', 'Leinfelden-Echterdingen'),
       (29724, '70773', 'Filderstadt'),
       (29740, '70794', 'Filderstadt'),
       (29764, '70839', 'Gerlingen, Württ'),
       (29774, '71010', 'Böblingen'),
       (29785, '71032', 'Böblingen'),
       (29797, '71059', 'Sindelfingen'),
       (29799, '71063', 'Sindelfingen'),
       (29805, '71072', 'Herrenberg im Gäu'),
       (29810, '71083', 'Herrenberg im Gäu'),
       (29875, '71229', 'Leonberg, Württ'),
       (29892, '71263', 'Weil der Stadt'),
       (29897, '71272', 'Renningen'),
       (29927, '71319', 'Waiblingen, Rems'),
       (29981, '71512', 'Backnang'),
       (30044, '71628', 'Ludwigsburg, Württ'),
       (30047, '71634', 'Ludwigsburg, Württ'),
       (30050, '71640', 'Ludwigsburg, Württ'),
       (30059, '71667', 'Marbach am Neckar'),
       (30075, '71691', 'Freiberg am Neckar'),
       (30124, '72014', 'Tübingen'),
       (30222, '72238', 'Freudenstadt'),
       (30225, '72250', 'Freudenstadt'),
       (30266, '72310', 'Balingen'),
       (30296, '72375', 'Hechingen'),
       (30334, '72440', 'Albstadt, Württ'),
       (30350, '72482', 'Sigmaringen'),
       (30389, '72555', 'Metzingen, Württ'),
       (30414, '72609', 'Nürtingen'),
       (30418, '72622', 'Nürtingen'),
       (30426, '72639', 'Neuffen'),
       (30470, '74510', 'Schwäbisch Hall'),
       (30479, '74523', 'Schwäbisch Hall'),
       (30504, '74564', 'Crailsheim'),
       (30541, '74606', 'Öhringen'),
       (30556, '74638', 'Waldenburg, Württ'),
       (30563, '74649', 'Künzelsau'),
       (30585, '74714', 'Buchen (Odenwald)'),
       (30587, '74722', 'Buchen (Odenwald)'),
       (30589, '74724', 'Walldürn'),
       (30615, '74819', 'Mosbach, Baden'),
       (30654, '74879', 'Sinsheim, Elsenz'),
       (30662, '74906', 'Bad Rappenau'),
       (30775, '75181', 'Pforzheim'),
       (30840, '75358', 'Calw'),
       (30842, '75365', 'Calw'),
       (30873, '75415', 'Mühlacker'),
       (30985, '76131', 'Karlsruhe, Baden'),
       (31038, '76233', 'Karlsruhe, Baden'),
       (31052, '76252', 'Karlsruhe, Baden'),
       (31066, '76273', 'Ettlingen'),
       (31122, '76407', 'Rastatt'),
       (31129, '76414', 'Rastatt'),
       (31159, '76482', 'Baden-Baden'),
       (31179, '76514', 'Baden-Baden'),
       (31182, '76517', 'Baden-Baden'),
       (31193, '76530', 'Baden-Baden'),
       (31194, '76532', 'Baden-Baden'),
       (31200, '76552', 'Gaggenau'),
       (31213, '76586', 'Gernsbach'),
       (31237, '76624', 'Bruchsal'),
       (31241, '76629', 'Bruchsal'),
       (31474, '77582', 'Offenburg'),
       (31491, '77599', 'Offenburg'),
       (31540, '77656', 'Offenburg'),
       (31553, '77675', 'Kehl, Rhein'),
       (31561, '77683', 'Kehl, Rhein'),
       (31651, '77813', 'Bühl, Baden'),
       (31652, '77815', 'Bühl, Baden'),
       (31670, '77854', 'Achern, Baden'),
       (31671, '77855', 'Achern, Baden'),
       (31704, '77914', 'Lahr, Schwarzwald'),
       (31767, '78052', 'Villingen-Schwenningen'),
       (31777, '78073', 'Bad Dürrheim, Schwarzw'),
       (31800, '78114', 'Furtwangen im Schwarzwald'),
       (31830, '78158', 'Donaueschingen'),
       (31840, '82031', 'Grünwald'),
       (31953, '78441', 'Konstanz'),
       (31963, '78465', 'Konstanz'),
       (31974, '78506', 'Tuttlingen'),
       (32031, '78609', 'Tuningen'),
       (32154, '79088', 'Freiburg im Breisgau'),
       (32168, '79110', 'Freiburg im Breisgau'),
       (32175, '79121', 'Freiburg im Breisgau'),
       (32269, '79302', 'Emmendingen'),
       (32354, '79512', 'Lörrach'),
       (32374, '79555', 'Weil am Rhein'),
       (32381, '79576', 'Weil am Rhein'),
       (32404, '79613', 'Rheinfelden (Baden)'),
       (32523, '79811', 'Titisee-Neustadt'),
       (32644, '80152', 'München'),
       (32802, '80538', 'München'),
       (32803, '80539', 'München'),
       (32931, '80999', 'München'),
       (33019, '81241', 'München'),
       (33165, '81733', 'München'),
       (33177, '81823', 'München'),
       (33195, '81929', 'München'),
       (33393, '82315', 'Starnberg'),
       (33770, '83359', 'Ettendorf'),
       (33918, '83462', 'Berchtesgaden'),
       (33960, '83540', 'Rott a. Inn'),
       (34547, '85219', 'Dachau'),
       (34976, '86150', 'Augsburg, Bay'),
       (35615, '88023', 'Friedrichshafen'),
       (35623, '88045', 'Friedrichshafen'),
       (35625, '88048', 'Friedrichshafen'),
       (35668, '88131', 'Lindau (Bodensee)'),
       (35705, '88187', 'Ravensburg, Württ'),
       (35720, '88212', 'Ravensburg, Württ'),
       (35733, '88239', 'Wangen im Allgäu'),
       (35830, '88388', 'Biberach an der Riß'),
       (35933, '88620', 'Pfullendorf, Baden'),
       (35949, '88644', 'Überlingen, Bodensee'),
       (36023, '89073', 'Ulm, Donau'),
       (36025, '89077', 'Ulm, Donau'),
       (36113, '89250', 'Senden, Iller'),
       (36217, '89505', 'Heidenheim an der Brenz'),
       (36225, '89518', 'Heidenheim an der Brenz'),
       (36236, '89534', 'Giengen an der Brenz'),
       (36262, '89573', 'Ehingen (Donau)'),
       (36322, '90103', 'Nürnberg, Mittelfr'),
       (36997, '91802', 'Meinheim'),
       (37504, '94001', 'Passau'),
       (38484, '97062', 'Würzburg'),
       (38490, '97070', 'Würzburg'),
       (38909, '97867', 'Wertheim a Main'),
       (38936, '97935', 'Tauberbischofsheim'),
       (38951, '97961', 'Bad Mergentheim'),
       (39325, '99094', 'Erfurt'),
       (39753, '99805', 'Eisenach, Thüringen'),
       (39814, '99867', 'Gotha, Thüringen'),
       (39815, '89143', 'Blaubeuren'),
       (39816, '89150', 'Laichingen'),
       (39820, '89155', 'Erbach');
/*!40000 ALTER TABLE `orte`
    ENABLE KEYS */;


--
-- Table structure for table `vermietungen`
--
--
-- Table structure for table `fahrradarten`
--
DROP TABLE IF EXISTS `hersteller`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hersteller`
(
    `herstellerNr`   int NOT NULL AUTO_INCREMENT,
    `herstellerName` varchar(30),
    `portal`         varchar(50),
    `email`          varchar(20),
    `fax`            varchar(10),
    `strasse`        varchar(20),
    `ortNr`          int DEFAULT NULL,
    PRIMARY KEY (`herstellerNr`),

    CONSTRAINT `hersteller_FK_0_0` FOREIGN KEY (`ortNr`) REFERENCES `orte` (`ortNr`)
);

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hersteller`
--

/*!40000 ALTER TABLE `hersteller`
    DISABLE KEYS */;
INSERT INTO `hersteller`
VALUES (1, 'Kettler', NULL, NULL, NULL, NULL, 31840),
       (2, 'Bianci', NULL, NULL, NULL, NULL, NULL),
       (3, 'Fishbone', NULL, NULL, NULL, NULL, NULL),
       (4, 'Scott', NULL, NULL, NULL, NULL, NULL),
       (5, 'Yazoo', NULL, NULL, NULL, NULL, NULL),
       (6, 'Arcona', NULL, NULL, NULL, NULL, NULL),
       (7, 'BBF', NULL, NULL, NULL, NULL, NULL),
       (8, 'Cateye', NULL, NULL, NULL, NULL, NULL),
       (9, 'Bulls', NULL, NULL, NULL, NULL, NULL),
       (10, 'Dahon', NULL, NULL, NULL, NULL, NULL),
       (11, 'Centano', NULL, NULL, NULL, NULL, NULL),
       (12, 'Ergon', NULL, NULL, NULL, NULL, NULL),
       (13, 'Flyke', NULL, NULL, NULL, NULL, NULL),
       (14, 'GIANT', NULL, NULL, NULL, NULL, NULL),
       (15, 'Hercules', NULL, NULL, NULL, NULL, NULL),
       (16, 'KTM Bikes', NULL, NULL, NULL, NULL, NULL),
       (17, 'Puky', NULL, NULL, NULL, NULL, NULL),
       (18, 'Römer', NULL, NULL, NULL, NULL, NULL),
       (19, 'Schwalbe', NULL, NULL, NULL, NULL, NULL),
       (20, 'Panther', NULL, NULL, NULL, NULL, NULL),
       (21, 'Cube', NULL, NULL, NULL, NULL, NULL),
       (22, 'Comus', NULL, NULL, NULL, NULL, NULL),
       (23, 'Koga-Miyata', NULL, NULL, NULL, NULL, NULL),
       (24, 'Maxcycles', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `hersteller`
    ENABLE KEYS */;



DROP TABLE IF EXISTS `fahrradarten`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fahrradarten`
(
    `fahrradartNr`     int NOT NULL AUTO_INCREMENT,
    `bezeichnung`      varchar(50),
    `kurzerlaeuterung` varchar(60),
    PRIMARY KEY (`fahrradartNr`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fahrradarten`
--

/*!40000 ALTER TABLE `fahrradarten`
    DISABLE KEYS */;
INSERT INTO `fahrradarten`
VALUES (1, 'Mountain-Bike', 'Geländefahrrad meist mit Federung'),
       (2, 'Cross-Bike', 'sportlicher Einsatz Straße & Gelände (Trekking-Touren)'),
       (3, 'BMX-Bike', 'Fahrräder ohne Zulassung StVZO für Bahnen'),
       (4, 'DirtBike', 'Extremkletterer zum Springen und für Tourniere ohne StVZO'),
       (5, 'Einrad', 'Funrad mit nur einem Rad'),
       (6, 'Tandem', 'Fahrrad für 2 Personen'),
       (7, 'Kinderfahrrad ab 20 Zoll', 'Fahrrad für Kinder ab 5 Jahren'),
       (8, 'Jugendfahrrad', 'Fahrrad für Jugendliche'),
       (9, 'Kinderrad Fahrrad 12-18 Zoll', 'Fahrrad ab 3 Jahre'),
       (10, 'Jugendfahrrad ab 26 Zoll', 'Fahrrad ab 7 Jahren'),
       (11, 'Rennrad', 'Straßenrennrad'),
       (12, 'Damen City-Bike', 'Damenräder für Straßen und Wege'),
       (13, 'Herren City-Bike', 'Herrenräder für Straßen und Wege'),
       (14, 'Kinderanhänger', 'Anhänger für den Transport von Kindern');
/*!40000 ALTER TABLE `fahrradarten`
    ENABLE KEYS */;

--
-- Table structure for table `fahrraeder`
--

DROP TABLE IF EXISTS `fahrraeder`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fahrraeder`
(
    `fahrradNr`        int NOT NULL AUTO_INCREMENT,
    `bezeichnung`      varchar(50),
    `rahmenNummer`     varchar(10),
    `tagesmietpreis`   double DEFAULT NULL,
    `anschaffungswert` double DEFAULT NULL,
    `kaufdatum`        date   DEFAULT NULL,
    `fahrradartNr`     int    DEFAULT NULL,
    `herstellerNr`     int    DEFAULT NULL,
    PRIMARY KEY (`fahrradNr`),
    CONSTRAINT `fahrraeder_FK_0_0` FOREIGN KEY (`fahrradartNr`) REFERENCES `fahrradarten` (`fahrradartNr`),
    CONSTRAINT `fahrraeder_FK_1_0` FOREIGN KEY (`herstellerNr`) REFERENCES `hersteller` (`herstellerNr`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fahrraeder`
--

/*!40000 ALTER TABLE `fahrraeder`
    DISABLE KEYS */;
INSERT INTO `fahrraeder`
VALUES (1, 'Comus Einrad', '4590/H2', 8.40000, 56.00000, '2021-05-23', 5, 22),
       (2, 'Panther Thedy', '340/90089', 9.45000, 145.00000, '2022-01-17', 9, 5),
       (3, 'Scott Comtessa', '56/32', 10.50000, 189.00000, '2022-05-05', 9, 4),
       (4, 'Scott Voltage Jr 16', '76/67654e', 12.60000, 246.00000, '2021-09-05', 9, 4),
       (5, 'Yazoo FSV-3.6N', '198H45', 17.85000, 310.00000, '2021-09-21', 10, 5),
       (6, 'Scott Aspect 50', 'MTB/B88', 19.95000, 398.00000, '2021-07-23', 1, 4),
       (7, 'Yazoo FSV-3.6N', '198H47', 17.85000, 310.00000, '2021-09-21', 10, 5),
       (8, 'Comus Einrad XM', '4890/H2', 8.40000, 56.00000, '2022-01-02', 5, 22),
       (9, 'Fishbone FR 100', 'U/H2345', 19.95000, 285.00000, '2020-10-11', 3, 3),
       (10, 'Fishbone FR 100', 'U/H3445', 19.95000, 285.00000, '2020-10-11', 3, 3),
       (11, 'Fishbone FR 100', 'U/H6745', 19.95000, 285.00000, '2020-10-11', 3, 3),
       (12, 'Fishbone FR 100', 'U/H8907', 19.95000, 285.00000, '2020-10-11', 3, 3),
       (13, 'Fishbone FR 100', 'U/H341', 19.95000, 285.00000, '2020-10-11', 3, 3),
       (14, 'Scott Comtessa', '75/32', 10.50000, 189.00000, '2022-05-27', 9, 4),
       (15, 'Yazoo FSV-3.6N', '298H46', 17.85000, 310.00000, '2022-05-27', 10, 5),
       (16, 'Scott Aspect 50', 'MTB/B34', 19.95000, 398.00000, '2021-07-23', 1, 4),
       (17, 'Scott Aspect 50', 'MTB/C34', 19.95000, 398.00000, '2022-05-27', 1, 4),
       (18, 'Bulls Sharptail 2', 'MTB/R34', 21.00000, 412.00000, '2022-05-15', 1, 9),
       (19, 'Bulls Sharptail 2', 'MTB/R36', 21.00000, 412.00000, '2022-05-15', 1, 9),
       (20, 'Bulls Sharptail 2', 'MTB/R49', 21.00000, 412.00000, '2022-05-15', 1, 9),
       (21, 'Bulls Sharptail 2', 'MTB/H34', 21.00000, 412.00000, '2022-05-15', 1, 9),
       (22, 'Bulls Sharptail 2', 'MTB/G11', 21.00000, 412.00000, '2022-05-15', 1, 9),
       (23, 'Cube ATTENTION HS 11', 'MTB/Z65', 35.70000, 689.00000, '2022-05-05', 2, 21),
       (24, 'Cube ATTENTION HS 11', 'MTB/Z66', 35.70000, 689.00000, '2022-05-05', 2, 21),
       (25, 'Cube ATTENTION HS 11', 'MTB/Z67', 35.70000, 689.00000, '2022-05-05', 2, 21),
       (26, 'Cube ATTENTION HS 11', 'MTB/Z68', 35.70000, 689.00000, '2022-05-05', 2, 21),
       (27, 'Koga-Miyata Infinti', 'CT/r456', 24.15000, 1650.00000, '2022-05-27', 13, 23),
       (28, 'Koga-Miyata Infinti', 'CT/e352', 24.15000, 1650.00000, '2022-05-27', 13, 23),
       (29, 'Koga-Miyata Infinti', 'CT/x788', 24.15000, 1650.00000, '2022-05-27', 13, 23),
       (30, 'Maxcycles Lady Lite Comfort', 'CB/098', 11.55000, 780.00000, '2022-05-16', 12, 24),
       (31, 'Maxcycles Lady Lite Comfort', 'CB/28', 11.55000, 780.00000, '2022-05-16', 12, 24),
       (32, 'Maxcycles Lady Lite Comfort', 'CB/555', 11.55000, 780.00000, '2022-05-16', 12, 24),
       (33, 'Kindertransportanhänger mit Federung', '0001', 12.60000, 234.00000, '2022-03-11', 14, 4),
       (34, 'Kindertransportanhänger mit Federung', '0002', 12.60000, 234.00000, '2022-03-11', 14, 4),
       (35, 'Viale Abruzzi Gent', '55-88-333', 15.75000, 399.00000, '2022-06-22', 3, 2),
       (36, 'Scale 70', '88/07', 22.05000, 750.00000, '2022-03-10', 1, 4);
/*!40000 ALTER TABLE `fahrraeder`
    ENABLE KEYS */;

--
-- Table structure for table `hersteller`
--


--
-- Table structure for table `kunden`
--

DROP TABLE IF EXISTS `kunden`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kunden`
(
    `kundenNr`   int NOT NULL AUTO_INCREMENT,
    `name`       varchar(30),
    `vorname`    varchar(20),
    `strasse`    varchar(30),
    `ortNr`      int  DEFAULT NULL,
    `geschlecht` varchar(1),
    `gebTag`     date DEFAULT NULL,
    PRIMARY KEY (`kundenNr`),
    CONSTRAINT `kunden_FK_0_0` FOREIGN KEY (`ortNr`) REFERENCES `orte` (`ortNr`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kunden`
--

/*!40000 ALTER TABLE `kunden`
    DISABLE KEYS */;
INSERT INTO `kunden`
VALUES (232, 'Schneider', 'Heinrich', 'Goezstraße 25', 29740, 'm', '1985-06-16'),
       (233, 'Schlauch', 'Franz', 'Ulmer Weg 56', 30050, 'm', '1993-08-23'),
       (234, 'Schlauch', 'Franziska', 'Ulmer Weg 56', 30050, 'w', '2013-05-24'),
       (235, 'Böckle', 'Jennifer', 'Hermann-Hesse-Str. 3', 11553, 'w', '2013-04-21'),
       (236, 'Hauffe', 'Johann', 'Seestraße 21', 29003, 'm', '1997-07-31'),
       (237, 'Yilmaz', 'Ali', 'Wehrstraße 87', 29315, 'm', '2011-03-13'),
       (238, 'Berger', 'Johann', 'Vaihinger Str. 103', 29875, 'm', '2012-03-25'),
       (239, 'Schweizer', 'Anton', 'Schillingstraße 18', 28952, 'm', '2000-08-17'),
       (240, 'Lambert', 'Hans', 'Molkereigässle 7', 29575, 'm', '1993-08-31'),
       (241, 'Sautter', 'Fritz', 'Karlstraße 23', 39815, 'm', '1994-10-21'),
       (242, 'Branduardi', 'Francesco', 'Rosenweg 11A', 29531, 'm', '2004-04-12'),
       (243, 'Dreizler', 'Helmut', 'Karl-Marx-Str. 2', 29575, 'm', '1995-02-22'),
       (244, 'Heller', 'Ulrich', 'Lindenallee 78', 32644, 'm', '2001-05-20'),
       (245, 'Linker', 'Torsten', 'Neckarstraße 23', 29875, 'm', '1990-06-14'),
       (246, 'Sommer', 'Achim', 'Talwiese 39', 22553, 'm', '2012-09-05'),
       (247, 'Kratzer', 'Franz', 'R.-Wagner Str. 38', 22553, 'm', '2012-04-13'),
       (248, 'Dreiss', 'Uwe', 'Ringstraße 73', 27301, 'm', '1994-01-23'),
       (249, 'Anschütz', 'Günter', 'Tulpenweg 31', 22583, 'm', '2011-07-06'),
       (250, 'Blaschke', 'Hilde', 'Brückenstraße 44', 29022, 'w', '1992-03-03'),
       (251, 'Bittner', 'Helmut', 'Hügelstraße 36', 21414, 'm', '2013-12-30'),
       (252, 'Steck', 'Gerlinde', 'Adenauerstr. 39', 27522, 'w', '1999-06-23'),
       (253, 'Watzke', 'Bernd', 'Filderweg 44', 29306, 'm', '2007-08-22'),
       (254, 'Dihlmann', 'Thomas', 'Auf der Insel 3', 29306, 'm', '1985-09-23'),
       (255, 'Köber', 'Hannes', 'Hauptstr. 31', 39816, 'm', '1989-12-05'),
       (256, 'Alber', 'Rolf', 'Vogelweg 84', 20740, 'm', '2007-07-10'),
       (257, 'Karl', 'Malte', 'Heilbronner Str. 22', 19765, 'm', '2014-10-11'),
       (258, 'Bitto', 'Barbara', 'W.-Röntgen-Str. 44', 19007, 'w', '1994-08-15'),
       (259, 'Borst', 'Casper', 'Benzstraße 73', 29764, 'm', '2007-09-23'),
       (260, 'Gutbier', 'Gerhard', 'Schwarzwaldweg 1', 29657, 'm', '1990-06-10'),
       (261, 'Engel', 'Fabian', 'Wasenweg 33', 29657, 'm', '2012-06-22'),
       (262, 'Maier', 'Ingrid', 'Hohe Straße 87', 29740, 'w', '1996-03-22'),
       (263, 'Schweizer', 'Karin', 'Th.-Heuss-Allee 73', 24010, 'w', '2001-05-24'),
       (264, 'Dörner', 'Julia', 'Rosenweg 15A', 30418, 'w', '2005-12-12'),
       (265, 'Jaksch', 'Danijel', 'Maurener Weg 67', 37504, 'm', '2002-07-26'),
       (266, 'Toppmöller', 'Vanessa', 'Eichenweg 3', 39325, 'w', '2010-06-24'),
       (267, 'Kolesnik', 'Walter', 'Webergasse 1', 33770, 'm', '2010-08-16'),
       (268, 'Mainzer', 'Heinz', 'Allee 34', 33918, 'm', '2008-04-22'),
       (269, 'Mainzer', 'Erwin', 'Marktplatz 1', 34547, 'm', '2003-01-23'),
       (270, 'Knaller', 'Willi', 'Königsweg 56', 29311, 'm', '2010-05-22'),
       (271, 'Berger', 'Nora', 'Wehrstraße 87', 37504, 'w', '2017-08-09'),
       (272, 'Dieterle', 'Samuel', 'Gartenstraße 78', 22512, 'm', '2001-08-12'),
       (273, 'Bajrami', 'Frosina', 'Schillingstraße 18', 27953, 'w', '1984-06-13'),
       (274, 'Hennes', 'Andreas', 'Lindenallee 12', 21335, 'm', '2002-07-08'),
       (275, 'Dettinger', 'Mainhard', 'Haupstraße 120', 30418, 'm', '2002-11-14'),
       (276, 'König', 'Jürgen', 'Gärtringer Str. 7', 29722, 'm', '2007-07-08'),
       (277, 'Gissing', 'Beate', 'Olgastraß1 123', 29740, 'w', '2011-09-22'),
       (278, 'Lenker', 'Erwin', 'Helfensteinerstr. 31', 29740, 'm', '2005-04-18'),
       (279, 'Albanesi', 'Dario', 'Molkereigasse 2', 29318, 'm', '2015-05-12'),
       (280, 'Gössler', 'Rainer', 'Schmiedstraße 8/C', 29318, 'm', '1984-12-11'),
       (281, 'Schlauch', 'Rudolf', 'Karlstraße 12', 29764, 'm', '2012-11-13'),
       (282, 'Egeler', 'Karl-Friedrich', 'Tannenstr. 2', 30050, 'm', '2013-04-21'),
       (283, 'Erikson', 'Judith', 'Wagnerstr.15', 30426, 'w', '2013-12-30'),
       (284, 'Landenberger', 'Sabine', 'Marktplatz 12', 39815, 'w', '2003-05-16'),
       (285, 'Kessler', 'Melani', 'Vaihinger Str. 103', 29740, 'w', '2012-02-21'),
       (286, 'Kolar', 'Pavel', 'Geranienstraße 76', 20740, 'm', '2006-07-23'),
       (287, 'Pessoa', 'Erwin', 'Am Oberen See 12', 21042, 'm', '2012-02-06'),
       (288, 'Kienle', 'Kristine', 'Schillerstraß 46', 39815, 'w', '2012-05-22'),
       (289, 'Lauxmann', 'Klaus', 'Jasminweg 18', 28936, 'm', '2002-09-17'),
       (290, 'Ragusa', 'Michael', 'Augustinerstr. 8', 29003, 'm', '1993-12-11'),
       (291, 'Jakovljewic', 'Emira', 'Seestraße 21', 29023, 'w', '1998-05-24'),
       (292, 'Delfini', 'Romolo', 'Krokusstraße 7', 29531, 'm', '2012-03-05'),
       (293, 'Passinhas', 'Fernando', 'Molkereigässle 7', 30050, 'm', '2006-09-25'),
       (294, 'Binder', 'Elke', 'Altdorfer Str. 87', 29764, 'w', '2011-05-14'),
       (295, 'Tabucchi', 'Antonia', 'Stuttgarter Str. 68', 30426, 'w', '1995-08-23'),
       (296, 'Hörmann', 'Barbara', 'Adelbortenstraße 22', 29305, 'w', '2000-05-24'),
       (297, 'Schettler', 'Christoph', 'Guttenbrunnstraße 88', 29573, 'm', '2012-08-23'),
       (298, 'Mielnik', 'Hans', 'Hermann-Hesse-Str. 3', 29740, 'm', '2001-05-24'),
       (299, 'Dengler', 'Manfred', 'Marktplatz 3', 20788, 'm', '2003-02-14'),
       (300, 'Banzhaff', 'Jörg', 'Ehninger Weg 8', 29307, 'm', '1984-05-14'),
       (301, 'Anters', 'Vera', 'Karlsplatz 3', 27953, 'w', '2006-11-12'),
       (302, 'Daumer', 'Ulla', 'Karlstraße 23', 27850, 'w', '2015-03-02'),
       (303, 'Hauffe', 'Johanna', 'Teckstraße 77', 39816, 'w', '1999-02-23'),
       (304, 'Schlauch', 'Angelika', 'Neck-Allee 81', 2911, 'w', '1995-12-30'),
       (305, 'Harr', 'Egon', 'Ulmer Weg 56', 3092, 'm', '2006-05-23'),
       (306, 'Lutz', 'Hans-Dieter', 'Rosenstraße 8/1', 29009, 'm', '1991-12-30'),
       (307, 'Frey', 'Donald', 'Weite Str. 12', 29009, 'm', '1991-12-30'),
       (308, 'Lambert', 'Franziska', 'Veilchenstraße 13', 6326, 'w', '2004-07-23'),
       (309, 'Kesser', 'Alina', 'Kuhbergstraße 22', 36023, 'w', '2013-06-04');
/*!40000 ALTER TABLE `kunden`
    ENABLE KEYS */;



DROP TABLE IF EXISTS `vermietungen`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vermietungen`
(
    `vermietNr` int NOT NULL AUTO_INCREMENT,
    `von`       datetime DEFAULT NULL,
    `bis`       datetime DEFAULT NULL,
    `fahrradNr` int      DEFAULT NULL,
    `kundenNr`  int      DEFAULT NULL,
    PRIMARY KEY (`vermietNr`),
    CONSTRAINT `vermietungen_FK_0_0` FOREIGN KEY (`kundenNr`) REFERENCES `kunden` (`kundenNr`),
    CONSTRAINT `vermietungen_FK_1_0` FOREIGN KEY (`fahrradNr`) REFERENCES `fahrraeder` (`fahrradNr`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vermietungen`
--

/*!40000 ALTER TABLE `vermietungen`
    DISABLE KEYS */;
INSERT INTO `vermietungen`
VALUES (524, '2021-09-19 00:00:00', '2021-09-23 00:00:00', 13, 233),
       (525, '2021-10-06 00:00:00', '2021-10-07 00:00:00', 16, 234),
       (526, '2022-05-18 00:00:00', '2022-05-25 00:00:00', 22, 234),
       (527, '2022-09-04 00:00:00', '2022-09-07 00:00:00', 1, 234),
       (528, '2022-01-16 00:00:00', '2022-01-21 00:00:00', 31, 236),
       (529, '2022-03-10 00:00:00', '2022-03-14 00:00:00', 19, 236),
       (530, '2021-12-01 00:00:00', '2021-12-04 00:00:00', 9, 237),
       (531, '2021-12-23 00:00:00', '2021-12-24 00:00:00', 23, 237),
       (532, '2021-10-08 00:00:00', '2021-10-13 00:00:00', 21, 238),
       (533, '2021-12-28 00:00:00', '2022-01-02 00:00:00', 2, 239),
       (534, '2022-09-01 00:00:00', '2022-09-05 00:00:00', 17, 239),
       (535, '2021-11-28 00:00:00', '2021-12-01 00:00:00', 16, 241),
       (536, '2022-08-27 00:00:00', '2022-09-01 00:00:00', 17, 241),
       (537, '2021-10-20 00:00:00', '2021-10-24 00:00:00', 22, 242),
       (538, '2022-10-08 00:00:00', '2022-10-13 00:00:00', 11, 242),
       (539, '2022-03-18 00:00:00', '2022-03-21 00:00:00', 33, 243),
       (540, '2021-12-31 00:00:00', '2022-01-07 00:00:00', 25, 244),
       (541, '2022-05-31 00:00:00', '2022-06-01 00:00:00', 30, 244),
       (542, '2022-07-08 00:00:00', '2022-07-12 00:00:00', 22, 244),
       (543, '2022-08-23 00:00:00', '2022-08-28 00:00:00', 27, 244),
       (544, '2021-12-12 00:00:00', '2021-12-17 00:00:00', 29, 245),
       (545, '2021-11-20 00:00:00', '2021-11-27 00:00:00', 25, 246),
       (546, '2022-03-27 00:00:00', '2022-04-01 00:00:00', 14, 247),
       (547, '2022-06-04 00:00:00', '2022-06-11 00:00:00', 31, 248),
       (548, '2022-06-26 00:00:00', '2022-06-29 00:00:00', 35, 249),
       (549, '2021-10-19 00:00:00', '2021-10-26 00:00:00', 29, 250),
       (550, '2022-03-01 00:00:00', '2022-03-06 00:00:00', 27, 250),
       (551, '2022-07-06 00:00:00', '2022-07-13 00:00:00', 32, 250),
       (552, '2022-01-16 00:00:00', '2022-01-17 00:00:00', 35, 251),
       (553, '2022-04-29 00:00:00', '2022-05-03 00:00:00', 16, 252),
       (554, '2021-12-12 00:00:00', '2021-12-16 00:00:00', 26, 256),
       (555, '2022-04-11 00:00:00', '2022-04-15 00:00:00', 24, 256),
       (556, '2022-01-05 00:00:00', '2022-01-08 00:00:00', 9, 257),
       (557, '2022-02-26 00:00:00', '2022-02-27 00:00:00', 25, 257),
       (558, '2022-04-29 00:00:00', '2022-05-02 00:00:00', 14, 257),
       (559, '2022-06-09 00:00:00', '2022-06-13 00:00:00', 19, 257),
       (560, '2022-09-10 00:00:00', '2022-09-14 00:00:00', 18, 257),
       (561, '2022-09-21 00:00:00', '2022-09-24 00:00:00', 32, 257),
       (562, '2021-09-23 00:00:00', '2021-09-26 00:00:00', 21, 262),
       (563, '2022-02-22 00:00:00', '2022-02-25 00:00:00', 33, 262),
       (564, '2022-07-01 00:00:00', '2022-07-04 00:00:00', 13, 262),
       (565, '2022-07-10 00:00:00', '2022-07-13 00:00:00', 6, 263),
       (566, '2022-05-19 00:00:00', '2022-05-22 00:00:00', 14, 264),
       (567, '2022-06-29 00:00:00', '2022-07-06 00:00:00', 1, 264),
       (568, '2021-08-23 00:00:00', '2021-08-24 00:00:00', 9, 265),
       (569, '2022-10-06 00:00:00', '2022-10-07 00:00:00', 2, 265),
       (570, '2022-07-03 00:00:00', '2022-07-08 00:00:00', 13, 267),
       (571, '2022-07-16 00:00:00', '2022-07-17 00:00:00', 28, 267),
       (572, '2022-07-02 00:00:00', '2022-07-03 00:00:00', 7, 268),
       (573, '2021-12-22 00:00:00', '2021-12-25 00:00:00', 22, 269),
       (574, '2022-09-01 00:00:00', '2022-09-08 00:00:00', 1, 272),
       (575, '2022-08-13 00:00:00', '2022-08-20 00:00:00', 31, 273),
       (576, '2021-11-19 00:00:00', '2021-11-24 00:00:00', 25, 275),
       (577, '2021-12-08 00:00:00', '2021-12-09 00:00:00', 31, 275),
       (578, '2022-07-09 00:00:00', '2022-07-12 00:00:00', 28, 275),
       (579, '2021-12-20 00:00:00', '2021-12-23 00:00:00', 7, 276),
       (580, '2022-05-02 00:00:00', '2022-05-03 00:00:00', 10, 276),
       (581, '2021-12-03 00:00:00', '2021-12-04 00:00:00', 14, 277),
       (582, '2022-01-26 00:00:00', '2022-01-31 00:00:00', 21, 277),
       (583, '2022-02-10 00:00:00', '2022-02-13 00:00:00', 3, 277),
       (584, '2022-02-11 00:00:00', '2022-02-12 00:00:00', 16, 277),
       (585, '2022-09-09 00:00:00', '2022-09-16 00:00:00', 14, 277),
       (586, '2022-02-10 00:00:00', '2022-02-13 00:00:00', 22, 278),
       (587, '2022-04-18 00:00:00', '2022-04-21 00:00:00', 2, 279),
       (588, '2022-04-30 00:00:00', '2022-05-03 00:00:00', 14, 282),
       (589, '2022-09-24 00:00:00', '2022-09-27 00:00:00', 31, 284),
       (590, '2021-10-03 00:00:00', '2021-10-06 00:00:00', 7, 285),
       (591, '2021-10-28 00:00:00', '2021-10-31 00:00:00', 25, 285),
       (592, '2022-02-15 00:00:00', '2022-02-20 00:00:00', 19, 285),
       (593, '2022-04-04 00:00:00', '2022-04-09 00:00:00', 22, 285),
       (594, '2021-11-17 00:00:00', '2021-11-18 00:00:00', 7, 286),
       (595, '2022-07-21 00:00:00', '2022-07-26 00:00:00', 32, 287),
       (596, '2022-01-13 00:00:00', '2022-01-14 00:00:00', 2, 288),
       (597, '2022-01-05 00:00:00', '2022-01-08 00:00:00', 16, 289),
       (598, '2022-05-31 00:00:00', '2022-06-05 00:00:00', 18, 291),
       (599, '2021-11-07 00:00:00', '2021-11-08 00:00:00', 6, 292),
       (600, '2022-02-01 00:00:00', '2022-02-08 00:00:00', 9, 293),
       (601, '2022-03-26 00:00:00', '2022-03-27 00:00:00', 4, 293),
       (602, '2022-04-04 00:00:00', '2022-04-11 00:00:00', 26, 293),
       (603, '2021-10-26 00:00:00', '2021-10-29 00:00:00', 23, 294),
       (604, '2021-11-27 00:00:00', '2021-12-01 00:00:00', 29, 294),
       (605, '2022-08-14 00:00:00', '2022-08-18 00:00:00', 5, 294),
       (606, '2022-08-16 00:00:00', '2022-08-19 00:00:00', 1, 294),
       (607, '2021-12-06 00:00:00', '2021-12-11 00:00:00', 27, 295),
       (608, '2022-04-23 00:00:00', '2022-04-30 00:00:00', 31, 295),
       (609, '2022-02-02 00:00:00', '2022-02-06 00:00:00', 12, 296),
       (610, '2021-09-10 00:00:00', '2021-09-17 00:00:00', 24, 297),
       (611, '2022-01-25 00:00:00', '2022-01-30 00:00:00', 17, 297),
       (612, '2022-03-04 00:00:00', '2022-03-11 00:00:00', 13, 297),
       (613, '2021-08-23 00:00:00', '2021-08-26 00:00:00', 11, 299),
       (614, '2021-11-08 00:00:00', '2021-11-13 00:00:00', 33, 300),
       (615, '2022-04-23 00:00:00', '2022-04-26 00:00:00', 21, 301),
       (616, '2021-08-27 00:00:00', '2021-09-01 00:00:00', 4, 302),
       (617, '2022-01-01 00:00:00', '2022-01-05 00:00:00', 7, 302),
       (618, '2022-07-26 00:00:00', '2022-07-31 00:00:00', 1, 302),
       (619, '2022-08-17 00:00:00', '2022-08-18 00:00:00', 21, 302),
       (620, '2022-05-13 00:00:00', '2022-05-18 00:00:00', 12, 303),
       (621, '2022-03-14 00:00:00', '2022-03-17 00:00:00', 20, 305),
       (623, '2022-02-22 00:00:00', '2022-02-28 00:00:00', 23, 307),
       (624, '2022-09-15 00:00:00', '2022-09-16 00:00:00', 28, 260),
       (625, '2022-08-03 00:00:00', '2022-08-06 00:00:00', 7, 253),
       (626, '2022-06-28 00:00:00', '2022-06-30 00:00:00', 10, 235),
       (627, '2022-07-17 00:00:00', '2022-07-22 00:00:00', 14, 295),
       (628, '2022-10-02 00:00:00', '2022-10-06 00:00:00', 26, 240),
       (629, '2022-10-04 00:00:00', '2022-10-06 00:00:00', 23, 266),
       (630, '2022-07-18 00:00:00', '2022-07-23 00:00:00', 29, 301),
       (631, '2022-08-16 00:00:00', '2022-08-21 00:00:00', 5, 286),
       (632, '2022-07-15 00:00:00', '2022-07-19 00:00:00', 1, 304),
       (633, '2022-09-28 00:00:00', '2022-09-29 00:00:00', 27, 254),
       (634, '2022-09-28 00:00:00', '2022-10-01 00:00:00', 31, 258),
       (635, '2022-07-31 00:00:00', '2022-08-02 00:00:00', 2, 271),
       (636, '2022-06-08 00:00:00', '2022-06-13 00:00:00', 16, 274),
       (637, '2022-09-10 00:00:00', '2022-09-15 00:00:00', 18, 255),
       (638, '2022-08-31 00:00:00', '2022-09-04 00:00:00', 26, 261),
       (639, '2022-06-03 00:00:00', '2022-06-06 00:00:00', 23, 298),
       (640, '2022-09-25 00:00:00', '2022-09-27 00:00:00', 29, 266),
       (642, '2022-09-28 00:00:00', '2022-10-03 00:00:00', 1, 271),
       (643, '2022-10-05 00:00:00', '2022-10-09 00:00:00', 6, 259),
       (644, '2022-07-08 00:00:00', '2022-07-12 00:00:00', 9, 283),
       (645, '2022-06-04 00:00:00', '2022-06-05 00:00:00', 4, 290),
       (646, '2022-08-23 00:00:00', '2022-08-26 00:00:00', 26, 232),
       (647, '2022-07-15 00:00:00', '2022-07-20 00:00:00', 4, 270),
       (648, '2022-07-23 00:00:00', '2022-07-27 00:00:00', 26, 305),
       (649, '2022-06-18 00:00:00', '2022-06-23 00:00:00', 23, 254),
       (650, '2022-07-16 00:00:00', '2022-07-21 00:00:00', 29, 290),
       (651, '2022-10-02 00:00:00', '2022-10-07 00:00:00', 5, 281),
       (652, '2022-07-26 00:00:00', '2022-07-30 00:00:00', 1, 270),
       (653, '2022-09-16 00:00:00', '2022-09-17 00:00:00', 31, 280),
       (654, '2022-08-10 00:00:00', '2022-08-20 00:00:00', 30, 309),
       (655, '2022-07-20 00:00:00', '2022-07-20 00:00:00', 31, 307),
       (656, '2022-07-15 00:00:00', '2022-07-31 00:00:00', 31, 307),
       (657, '2022-07-15 00:00:00', '2022-07-31 00:00:00', 31, 307);
/*!40000 ALTER TABLE `vermietungen`
    ENABLE KEYS */;

--
-- Dumping events for database 'fahrrad2020'
--

--
-- Dumping routines for database 'fahrrad2020'
--
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2024-02-11  9:31:16
