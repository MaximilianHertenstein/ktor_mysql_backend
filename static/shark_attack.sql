-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: shark-attacks
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `CONSERVATION_STATUS`
--

DROP TABLE IF EXISTS `CONSERVATION_STATUS`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CONSERVATION_STATUS`
(
    `id`      varchar(2)  NOT NULL,
    `id_long` varchar(25)   DEFAULT NULL,
    `cat`     varchar(20)   DEFAULT NULL,
    `desc`    varchar(100)  DEFAULT NULL,
    PRIMARY KEY (`id`)
) ;

--
-- Dumping data for table `CONSERVATION_STATUS`
--


INSERT INTO `CONSERVATION_STATUS`
VALUES ('CD', 'CONSERVATION_DEPENDANT', 'LOWER_RISK',
        'Low risk; is conserved to prevent being near threatened, certain events may lead it to being a highe'),
       ('CR', 'CRITICALLY_ENDANGERED', 'THREATENED', 'Extremely high risk of extinction in the wild'),
       ('DD', 'DATA_DEFICIENT', 'OTHER_CATEGORIES', 'Not enough data to make an assessment of its risk of extinction'),
       ('EN', 'ENDANGERED', 'THREATENED', 'Higher risk of extinction in the wild'),
       ('EW', 'EXTINCT_IN_THE_WILD', 'EXTINCT',
        'Known only to survive in captivity, or as a naturalized population outside its historic range'),
       ('EX', 'EXTINCT', 'EXTINCT', 'No known living individuals'),
       ('LC', 'LEAST_CONCERN', 'LOWER_RISK',
        'Very Low risk; does not qualify for a higher risk category and not likely to be threatened in the ne'),
       ('NE', 'NOT_EVALUATED', 'OTHER_CATEGORIES', 'Has not yet been evaluated against the criteria.'),
       ('NT', 'NEAR_THREATENED', 'LOWER_RISK', 'Likely to become endangered in the near future'),
       ('VU', 'VULNERABLE', 'THREATENED', 'High risk of extinction in the wild');

--
-- Table structure for table `LUNAR_PHASIS`
--

CREATE TABLE `LUNAR_PHASIS`
(
    `id`                           varchar(255)  NOT NULL,
    `phase`                        varchar(255)  DEFAULT NULL,
    `illuminated_portion_northern` varchar(255)  DEFAULT NULL,
    `illuminated_portion_south`    varchar(255)  DEFAULT NULL,
    `visibility`                   varchar(255)  DEFAULT NULL,
    `average_moonrise_time`        varchar(255)  DEFAULT NULL,
    `culmination`                  varchar(255)  DEFAULT NULL,
    `average_moonset_time`         varchar(255)  DEFAULT NULL,
    PRIMARY KEY (`id`)
) ;

-- Dumping data for table `LUNAR_PHASIS`
--


INSERT INTO `LUNAR_PHASIS`
VALUES ('FIRST_QUARTER', 'First quarter', 'Right side, 50.1% lit disc', 'Left side, 50.1% lit disc',
        'Afternoon and early night ', '12:00', '18:00', '00:00'),
       ('FULL_MOON', 'Full Moon', '100% illuminated disc', '100% illuminated disc', 'Sunset to sunrise (all night)',
        '18:00', '00:00', '06:00'),
       ('LAST_QUARTER', 'Last quarter', 'Left side, 50.1% lit disc', 'Right side, 50.1% lit disc',
        'Late night and morning', '00:00', '06:00', '12:00'),
       ('NEW_MOON', 'New Moon', 'Disc completely in Suns shadow (lit by earthshine only)',
        'Disc completely in Suns\ shadow (lit by earthshine only)',
        'Invisible (too close to Sun) except during a solar eclipse', '06:00', '12:00', '18:00'),
       ('WANING_CRESCENT', 'Waning crescent', 'Left side, (50%–0%) lit disc', 'Right side, (50%–0%) lit disc ',
        'Pre-dawn to early afternoon', '03:00', '09:00', '15:00'),
       ('WANING_GIBBOUS', 'Waning gibbous ', 'Left side, (100%–50%) lit disc ', 'Right side, (100%–50%) lit disc',
        'Most of night and early morning ', '21:00', '03:00', '09:00'),
       ('WAXING_CRESCENT', 'Waxing crescent', 'Right side, (0%–50%) lit disc ', 'Left side, (0%–50%) lit disc ',
        'Late morning to post-dusk ', '09:00', '15:00', '21:00'),
       ('WAXING_GIBBOUS', 'Waxing gibbous', 'Left side, (50%–100%) lit disc ', 'Late afternoon and most of night ',
        'Late afternoon and most of night', '15:00', '21:00', '03:00');


--
-- Table structure for table `SHARKS`
--


CREATE TABLE `SHARKS`
(
    `id`                  varchar(20)  NOT NULL,
    `description`         varchar(23)  DEFAULT NULL,
    `scientific_name`     varchar(26)  DEFAULT NULL,
    `conservation_status` varchar(2)   DEFAULT NULL,
    PRIMARY KEY (`id`),
    -- KEY `SHARKS_FK_0_0` (`conservation_status`),
    CONSTRAINT `SHARKS_FK_0_0` FOREIGN KEY (`conservation_status`) REFERENCES `CONSERVATION_STATUS` (`id`)
) ;
-- Dumping data for table `SHARKS`
--


INSERT INTO `SHARKS`
VALUES ('BLACK_TIP_REEF_SHARK', 'Requin à pointes noires', 'Carcharhinus melanopterus', 'NT'),
       ('BULL_SHARK', 'Requin bouledogue', 'Carcharhinus leucas', 'NT'),
       ('GIANT_GUITAR_FISH', 'Grande raie-guitare', 'Rhynchobatus djiddensis', 'CR'),
       ('GREAT_HAMMER_HEAD', 'Requin Marteau', 'Sphyrna mokarran', 'EN'),
       ('GREAT_WHITE_SHARK', 'Grand requin blanc', 'Carcharodon carcharias', 'VU'),
       ('GREY_REEF_SHARK', 'Requin gris de récif', 'Carcharhinus amblyrhynchos', 'NT'),
       ('LEMON_SHARK', 'Requin citron', 'Negaprion brevirostris', 'NT'),
       ('NURSE_SHARK', 'Requin nourrice', 'Ginglymostoma cirratum', 'VU'),
       ('SAND_TIGER_SHARK', 'Requin-taureau', 'Carcharias taurus', 'CR'),
       ('SHORT_FIN_MAKO_SHARK', 'Requin mako', 'Isurus oxyrinchus', 'EN'),
       ('TIGER_SHARK', 'Requin tigre', 'Galeocerdo cuvier', 'NT'),
       ('WHALE_SHARK', 'Requin-baleine', 'Rhincodon typus', 'EN');

--
-- Table structure for table `SHARK_ATTACKS_NCL`
--

DROP TABLE IF EXISTS `SHARK_ATTACKS_NCL`;

CREATE TABLE `SHARK_ATTACKS_NCL`
(
    -- `case_number` varchar(12)  NOT NULL,
    `date`            date,
    `moon_phase_rate` int                                     DEFAULT NULL,
    `moon_phase`      varchar(15)   DEFAULT NULL,
    `dow`             varchar(9)    DEFAULT NULL,
    `season`          varchar(6)    DEFAULT NULL,
    `type`            varchar(10)   DEFAULT NULL,
    `country`         varchar(13)   DEFAULT NULL,
    `coast`           varchar(4)    DEFAULT NULL,
    `location`        varchar(30)   DEFAULT NULL,
    `province`        varchar(4)    DEFAULT NULL,
    `activity`        varchar(13)   DEFAULT NULL,
    `name`            varchar(25)   DEFAULT NULL,
    `sex`             varchar(1)    DEFAULT NULL,
    `age`             int                                     DEFAULT NULL,
    `injury`          varchar(15)   DEFAULT NULL,
    `is_fatal`        TINYINT(1)   DEFAULT NULL,
    `day_part`        varchar(3)    DEFAULT NULL,
    `species`       varchar(11)   DEFAULT NULL,
    `source`          varchar(100)  DEFAULT NULL,
    `sharkattack_id`  int   NOT NULL,
    PRIMARY KEY (`sharkattack_id`),
    --KEY `SHARK_ATTACKS_NCL_FK_1_0` (`species`),
    --KEY `SHARK_ATTACKS_NCL_FK_2_0` (`moon_phase`),
    CONSTRAINT `SHARK_ATTACKS_NCL_FK_1_0` FOREIGN KEY (`species`) REFERENCES `SHARKS` (`id`),
    CONSTRAINT `SHARK_ATTACKS_NCL_FK_2_0` FOREIGN KEY (`moon_phase`) REFERENCES `LUNAR_PHASIS` (`id`)
) ;
--
-- Dumping data for table `SHARK_ATTACKS_NCL`
--


INSERT INTO `SHARK_ATTACKS_NCL`
VALUES ('2007-01-25', 50, 'FIRST_QUARTER', 'Thursday', 'SUMMER', 'UNPROVOKED', 'NEW CALEDONIA', 'WEST',
        'Kaala-Gomen', 'NORD', 'SPEARFISHING', 'Jesse Jizdny', 'M', 30, 'LEG', 0, 'EAM', 'TIGER_SHARK',
        'Les Nouvelles Caledoniennes, 1/29/2007', 4926),
       ( '2007-04-09', 61, 'WANING_GIBBOUS', 'Monday', 'SUMMER', 'UNPROVOKED', 'NEW CALEDONIA', 'WEST',
        'Passe de Dumbéa', 'SUD', 'SURFING', 'Olivier Bertholom', 'M', 26, 'FOOT', 0, 'AM', 'TIGER_SHARK',
        'Les Nouvelles Calédoniennes, 4/11/2007', 4940),
       ( '2008-04-26', 99, 'WAXING_GIBBOUS', 'Saturday', 'SUMMER', 'UNPROVOKED', 'NEW CALEDONIA', 'EAST',
        'Poindimié', 'NORD', 'SWIMMING', 'Olivier Vilain ', 'M', 32, 'FOOT', 0, 'AM', 'BULL_SHARK',
        'Les Nouvelles Calédonie, 4/28/2008 & 4/29/2008', 5064),
       ( '2008-10-21', 100, 'NEW_MOON', 'Tuesday', 'SUMMER', 'UNPROVOKED', 'NEW CALEDONIA', 'WEST',
        'Ilot Balabio', 'NORD', 'SPEARFISHING', 'Nicolas Wright', 'M', 24, 'LEG', 0, 'AM', 'LEMON_SHARK',
        'C. Johansson, GSAF', 5135),
       ('2011-05-21', 89, 'WAXING_GIBBOUS', 'Saturday', 'SUMMER', 'UNPROVOKED', 'NEW CALEDONIA', 'WEST',
        'Ilôt Kendec', 'NORD', 'KITESURFING', 'Nathan', 'M', 15, 'THIGH', 1, 'AM', 'TIGER_SHARK',
        'Radio New Zealand & Les Nouvelles Caledoniennes, 5/23/2011', 5407),
       ( '2013-12-25', 98, 'WANING_GIBBOUS', 'Wednesday', 'SUMMER', 'UNPROVOKED', 'NEW CALEDONIA', 'EAST',
        'Falaises de Linderalique', 'NORD', 'SNORKELING', 'Loïc Merlet', 'M', 37, 'LEG', 0, 'AM', 'BULL_SHARK',
        'Les Novelles Caledonie, 12/26/2014', 5740),
       ( '2019-05-25', 60, 'WANING_GIBBOUS', 'Saturday', 'SUMMER', 'UNPROVOKED', 'NEW CALEDONIA', 'WEST',
        'Marina Port du Sud', 'SUD', 'SWIMMING', 'Anthony Guillon Larrouy', 'M', 10, 'LEG', 0, 'PM', 'BULL_SHARK',
        'M. Michaelson, GSAF', 6441);


--
-- Dumping routines for database 'shark-attacks'


-- Dump completed on 2024-09-05 17:25:39
