

-- -----------------------------------------------------
-- Table `abteilungen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `abteilungen` ;

CREATE TABLE IF NOT EXISTS `abteilungen` (
  `abteilungsnr` INT NOT NULL,
  `bezeichnung` VARCHAR(45) NULL,  
  PRIMARY KEY (`abteilungsnr`))
;


-- -----------------------------------------------------
-- Table `mitarbeiter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mitarbeiter` ;

CREATE TABLE IF NOT EXISTS `mitarbeiter` (
  `mitarbeiternr` INT NOT NULL,
  `nachname` VARCHAR(45) NULL,
  `vorname` varchar(45) NULL,
  `geschlecht` varchar(1) NULL,
  `stundensatz` double NULL,
  `gehalt` double NULL,
  `abteilungsnr` INT NOT NULL,
  PRIMARY KEY (`mitarbeiternr`),

CONSTRAINT `fk_mitarbeiter_abteilungen`
    FOREIGN KEY (`abteilungsnr`)
    REFERENCES `abteilungen` (`abteilungsnr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `projekte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `projekte` ;

CREATE TABLE IF NOT EXISTS `projekte` (
  `projektnr` INT NOT NULL,
  `projektbezeichnung` VARCHAR(45) NULL,
  `projektstart` date NULL,
  `projektende` date NULL, 
  PRIMARY KEY (`projektnr`))  
;


-- -----------------------------------------------------
-- Table `personaleinsaetze`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `personaleinsaetze` ;

CREATE TABLE IF NOT EXISTS `personaleinsaetze` (
  `einsatznr` INT NOT NULL,
  `anzahlStunden` INT NULL,
  `mitarbeiternr` INT NOT NULL,
  `projektnr` INT NOT NULL,
  PRIMARY KEY (`einsatznr`),
  CONSTRAINT `fk_personaleinsaetze_mitarbeiter`
    FOREIGN KEY (`mitarbeiternr`)
    REFERENCES `mitarbeiter` (`mitarbeiternr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personaleinsaetze_projekte`
    FOREIGN KEY (`projektnr`)
    REFERENCES `projekte` (`projektnr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;






INSERT INTO abteilungen VALUES (1,'Gesundheitsmanagemnent'),
(2,'Geronto-Sport'),
(3,'Jugendsport'),
(4,'Online-Sport');

INSERT INTO mitarbeiter VALUES (1,'Aber','Ralf','m',48,3200,3),
(2,'Keipler','Sara','w',40,2900,1),
(3,'Wechsel','Theo','m',55,3800,3),
(4,'Cleve','Sven','m',70,4200,4),
(5,'Newermann','Paul','m',65,3900,1),
(6,'Trebitz','Mike','m',75,4500,4),
(7,'Kerze','Karl','m',60,4000,4),
(8,'Rest','Mary','w',60,3900,3),
(9,'Mentor','Anna','w',58,4100,1),
(10,'Leitner','Fred','m',80,6000,1),
(11,'Hanler','Paul','m',68,3500,3),
(12,'Nanet','Hans','m',60,3300,2),
(13,'Rust','Finn','m',62,3600,2);

INSERT INTO projekte VALUES (1,'Gesundheitsmanagement im Betrieb','2021-06-20','2021-06-25'),
(2,'Jugendarbeit im Sportverein','2021-04-01','2021-04-06'),
(3,'Fitness im Altersheim','2021-05-20','2021-05-25'),
(4,'Sport im Strafvollzug','2021-05-26','2021-05-30'),
(5,'Motivationsverbesserung von Jugendtrainern','2021-06-10','2021-06-14'),
(6,'Online-Kurse für Jugendliche','2021-07-05','2021-07-10'),
(7,'Konzepte für den Cardio-Sport','2021-07-10','2021-07-14');

INSERT INTO personaleinsaetze VALUES (1,40,2,1),
(2,35,5,1),
(3,30,1,2),
(4,35,7,7),
(5,35,8,7),
(6,30,9,7),
(7,35,5,7),
(8,35,13,7),
(9,20,10,1),
(10,30,9,1),
(11,25,7,1),
(12,10,10,3),
(13,15,6,3),
(14,30,9,4),
(15,30,1,4),
(16,23,12,4),
(17,35,4,4),
(18,15,1,5),
(19,20,8,5),
(20,30,3,5),
(21,25,2,5),
(22,35,11,5),
(23,15,5,6);


 
