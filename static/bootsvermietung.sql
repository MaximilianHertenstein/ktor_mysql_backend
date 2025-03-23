-- ----------------------------------------------------------------------
-- MySQL Migration Toolkit
-- SQL Create Script
-- ----------------------------------------------------------------------


-- -------------------------------------
-- Tables


CREATE TABLE `bootstypen` (
  `typnr` int NOT NULL,
  `typbezeichnung` VARCHAR(50) NULL,
   PRIMARY KEY (`typnr`)
);



CREATE TABLE `kunden` (
  `kundennr` int NOT NULL,
  `nachname` VARCHAR(30) NULL,
  `vorname` VARCHAR(20) NULL,
  PRIMARY KEY (`kundennr`)
);

CREATE TABLE `Boote` (
  `bootsnr` int NOT NULL,
  `bezeichnung` VARCHAR(50) ,
  `stundenpreis` DOUBLE ,
  `wert` DOUBLE,
  `typnr` int,
   PRIMARY KEY (`bootsnr`),
   CONSTRAINT `BootstypenBoote` FOREIGN KEY  (`typnr`)   REFERENCES `bootstypen` (`typnr`)
);
#

CREATE TABLE `vermietungen` (
  `mietnr` int NOT NULL,
  `mietdatum` DATE NULL,
  `mietdauer` INT NULL,
  `bootsnr` int NULL,
  `kundennr` int NULL,
  PRIMARY KEY (`mietnr`),
  INDEX `BooteVermietungen` (`bootsnr`),
  INDEX `KundenVermietungen` (`kundennr`),
  CONSTRAINT `BooteVermietungen` FOREIGN KEY (`bootsnr`)
    REFERENCES `boote` (`bootsnr`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `KundenVermietungen` FOREIGN KEY  (`kundennr`)
    REFERENCES `kunden` (`kundennr`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
)
;



-- ----------------------------------------------------------------------

INSERT INTO `bootstypen`(`typnr`, `typbezeichnung`)
VALUES
  (1, 'Jolle'),
  (2, 'Yacht'),
  (3, 'Surfbrett'),
  (4, 'Ruderboot');



INSERT INTO `kunden`(`kundennr`, `nachname`, `vorname`)
VALUES
  (1, 'Müller', 'Thomas'),
  (2, 'Augenstein', 'Roland'),
  (3, 'Noller', 'Andrea'),
  (4, 'Girrbach', 'Christine'),
  (5, 'Groß', 'Albert'),
  (6, 'Hübener', 'Anton'),
  (7, 'Schwarz', 'Toni'),
  (8, 'Bernbacher', 'Günter'),
  (9, 'Klittich', 'Rudolf'),
  (10, 'Haider', 'Franz'),
  (11, 'Brandauer', 'Gerd'),
  (12, 'Thum', 'Joachim'),
  (13, 'Reuter', 'Andreas'),
  (14, 'Schneider', 'Torsten'),
  (15, 'Winter', 'Ute'),
  (16, 'Hermann', 'Gernott'),
  (17, 'Martin', 'Uwe'),
  (18, 'Boss', 'Karl'),
  (19, 'Berner', 'Klara'),
  (20, 'Büttner', 'Gerlinde'),
  (21, 'Strecker', 'Tom'),
  (22, 'Heck', 'Dieter'),
  (23, 'Frühwind', 'Thomas'),
  (24, 'Wengle', 'Hannes'),
  (25, 'Albert', 'Rolf'),
  (26, 'Fauser', 'Michael'),
  (27, 'Fritz', 'Barbara');


INSERT INTO `boote`(`bootsnr`, `bezeichnung`, `stundenpreis`, `wert`, `typnr`)
VALUES
  (1, 'Jollenkreuzer 15', 15, 12000,'1'),
  (2, 'Sailhorse', 12, 8000,'1'),
  (3, 'Sprinta DS', 20, 20000,'2'),
  (4, 'Varianta 18', 18, 18500,'2'),
  (5, 'Koralle', 8, 5000,'1'),
  (6, 'Laser', 10, 7000,'1'),
  (7, 'Sailart 18', 20, 30000,'2'),
  (8, 'Sailart 20', 25, 40000,'2'),
  (9, 'Ruderer1', 6, 4000,'4'),
  (10, 'Ruderer2', 6, 4500,'4'),
  (11, 'Pirat', 10, 7000,'1'),
  (12, 'FD', 22, 7000,'1'),
  (13, 'Highfly', 10, 2000,'3');




INSERT INTO `vermietungen`(`mietnr`, `mietdatum`, `mietdauer`, `bootsnr`, `kundennr`)
VALUES
  (1, '2021-04-19', 4, 7, 9),
  (2, '2021-04-24', 1, 4, 22),
  (3, '2021-05-01', 2, 12, 15),
  (4, '2021-05-05', 8, 3, 1),
  (5, '2021-05-05', 7, 4, 20),
  (6, '2021-05-06', 4, 7, 17),
  (7, '2021-05-07', 6, 3, 20),
  (8, '2021-05-14', 2, 7, 16),
  (9, '2021-05-22', 1, 8, 10),
  (10, '2021-05-30', 2, 11, 22),
  (11, '2021-05-30', 2, 12, 1),
  (12, '2021-05-02', 2, 2, 25),
  (13, '2021-06-02', 2, 7, 18);
