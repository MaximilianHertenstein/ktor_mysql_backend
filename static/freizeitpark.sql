

DROP SCHEMA IF EXISTS `freizeitpark` ;
CREATE SCHEMA IF NOT EXISTS `freizeitpark`;
USE `freizeitpark` ;

-- -----------------------------------------------------
-- Table `freizeitpark`.`kategorien`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `freizeitpark`.`kategorien` (
  `kategorieNr` INT NOT NULL,
  `bezeichnung` VARCHAR(45) NULL,
  PRIMARY KEY (`kategorieNr`));


-- -----------------------------------------------------
-- Table `freizeitpark`.`artikel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `freizeitpark`.`artikel` (
  `artikelNr` INT NOT NULL,
  `bezeichnung` VARCHAR(45) NULL,
  `preis` DOUBLE NULL,
  `kategorieNr` INT NOT NULL,
  PRIMARY KEY (`artikelNr`),
  INDEX `fk_artikel_kategorien1_idx` (`kategorieNr` ASC),
  CONSTRAINT `fk_artikel_kategorien1`
    FOREIGN KEY (`kategorieNr`)
    REFERENCES `freizeitpark`.`kategorien` (`kategorieNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `freizeitpark`.`mitarbeiter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `freizeitpark`.`mitarbeiter` (
  `mitarbeiterNr` INT NOT NULL,
  `vorname` VARCHAR(45) NULL,
  `nachname` VARCHAR(45) NULL,
  PRIMARY KEY (`mitarbeiterNr`));


-- -----------------------------------------------------
-- Table `freizeitpark`.`verkaeufe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `freizeitpark`.`verkaeufe` (
  `verkaufNr` INT NOT NULL,
  `datum` DATE NULL,
  `mitarbeiterNr` INT NOT NULL,
  PRIMARY KEY (`verkaufNr`),
  INDEX `fk_verkaeufe_mitarbeiter1_idx` (`mitarbeiterNr` ASC),
  CONSTRAINT `fk_verkaeufe_mitarbeiter1`
    FOREIGN KEY (`mitarbeiterNr`)
    REFERENCES `freizeitpark`.`mitarbeiter` (`mitarbeiterNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `freizeitpark`.`verkaufpositionen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `freizeitpark`.`verkaufspositionen` (
  `positionNr` INT NOT NULL,
  `anzahl` INT NULL,
  `artikelNr` INT NOT NULL,
  `verkaufNr` INT NOT NULL,
  PRIMARY KEY (`positionNr`),
  INDEX `fk_verkaufspositionen_artikel1_idx` (`artikelNr` ASC),
  INDEX `fk_verkaufspositionen_verkaeufe1_idx` (`verkaufNr` ASC),
  CONSTRAINT `fk_verkaufspositionen_artikel1`
    FOREIGN KEY (`artikelNr`)
    REFERENCES `freizeitpark`.`artikel` (`artikelNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_verkaufspositionen_verkaeufe1`
    FOREIGN KEY (`verkaufNr`)
    REFERENCES `freizeitpark`.`verkaeufe` (`verkaufNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



INSERT INTO mitarbeiter VALUES (100, 'Jasmin', 'Müller'),
(101, 'Jürgen', 'Matt'),
(102, 'Michael', 'Schmid'),
(103, 'Petra', 'Weishaar'),
(104, 'Waltraud', 'Kahle'),
(105, 'Alexandra', 'Bancevic'),
(106, 'Katharina', 'Müller'),
(107, 'Bernd', 'Kahle');

INSERT INTO kategorien VALUES (1, 'Schreibwaren'),
(2, 'Plüschtiere'),
(3, 'Sticker'),
(4, 'Kleidung'),
(5, 'Süßwaren');

INSERT INTO artikel VALUES (1000, 'Kugelschreiber EURO-Water', 1.99, 1),
(1001, 'Riesen Bleistift EURO-Water', 2.59, 1),
(1002, 'Schreibblock Sealight', 3.55, 1),
(1003, 'Notizblock klein', 0.99, 1),
(1004, 'Buntstifte Undersea', 5.85, 1),
(1005, 'Krabbe Erwin (klein)', 7.99, 2),
(1006, 'Robbe Happy Sea', 11.5, 2),
(1007, 'Delfin Flip (blau)', 12.5, 2),
(1008, 'Krabbe Erwin (groß)', 18.5, 2),
(1009, 'Delfin Flip (grau)', 12.5, 2),
(1010, 'Aufkleber EURO-Water', 1.99, 3),
(1011, 'Leuchtsticker Robbe Happy Sea', 3.59, 3),
(1012, 'Aufkleber Krabbe Erwin', 2.5, 3),
(1013, 'Stickerheft Maskottchen EURO-Water', 8.99, 3),
(1014, 'T-Shirt Erwin (S)', 15.99, 4),
(1015, 'T-Shirt Erwin (M)', 15.99, 4),
(1016, 'T-Shirt Erwin (L)', 15.99, 4),
(1017, 'T-Shirt Erwin (XL)', 15.99, 4),
(1018, 'T-Shirt EURO-Water', 12.5, 4),
(1019, 'Badehose seablue', 22.5, 4),
(1020, 'Badehose lightgreen', 22.5, 4),
(1021, 'Badehose darkred', 22.5, 4),
(1022, 'Sweatshirt Delfin Flip', 32.85, 4),
(1023, 'Sweatshirt EURO-Water', 31.5, 4),
(1024, 'Lolly Krabbe Erwin', 2.5, 5),
(1025, 'Lolly Delfin Flip', 2.5, 5),
(1026, 'Lolly Robbe Happy Sea', 2.5, 5),
(1027, 'Lebkuchenherz', 4.99, 5),
(1028, 'Schoko-Robbe', 4.5, 5),
(1029, 'Schoko-Delfin', 3.8, 5),
(1030, 'Schokoladentafel Maskottchen EURO-Water', 2.3, 5);

INSERT INTO verkaeufe VALUES (10, '2023-01-03', 100),
(11, '2023-01-03', 102),
(12, '2023-01-02', 104),
(13, '2023-01-04', 106),
(14, '2023-01-03', 101),
(15, '2022-12-03', 103),
(16, '2023-01-04', 105),
(17, '2023-01-09', 107),
(18, '2022-12-15', 107),
(19, '2023-01-12', 103),
(20, '2023-01-03', 104),
(21, '2023-01-11', 104),
(22, '2023-01-21', 102),
(23, '2023-01-07', 102),
(24, '2022-12-20', 101),
(25, '2023-01-03', 101),
(26, '2023-01-14', 103),
(27, '2022-12-11', 105),
(28, '2023-01-14', 101),
(29, '2023-01-03', 100),
(30, '2023-01-09', 106);

INSERT INTO verkaufspositionen VALUES (10, 2, 1000, 10),
(11,4,1001,11),
(12,4,1002,12),
(13,2,1003,13),
(14,4,1004,14),
(15,1,1005,15),
(16,1,1006,23),
(17,2,1007,22),
(18,3,1008,21),
(19,1,1009,20),
(20,2,1010,19),
(21,4,1011,18),
(22,1,1012,17),
(23,1,1013,16),
(24,2,1014,24),
(25,3,1015,25),
(26,1,1016,26),
(27,2,1017,27),
(28,4,1018,28),
(29,1,1019,29),
(30,1,1020,30),
(31,2,1021,10),
(32,2,1022,11),
(33,1,1023,15),
(34,2,1024,14),
(35,4,1025,13),
(36,1,1026,12),
(37,1,1027,16),
(38,2,1028,17),
(39,3,1029,18),
(40,1,1030,19),
(41,2,1000,20),
(42,4,1001,21),
(43,1,1002,22),
(44,1,1003,23),
(45,2,1004,24),
(46,3,1005,25),
(47,1,1006,26),
(48,2,1007,27),
(49,4,1008,28),
(50,1,1009,29),
(51,1,1010,30),
(52,2,1011,10),
(53,1,1012,11),
(54,1,1013,12),
(55,2,1014,13),
(56,4,1015,14),
(57,1,1005,15),
(58,1,1006,16),
(59,2,1007,17),
(60,3,1008,18),
(61,1,1009,19),
(62,2,1010,20),
(63,4,1011,21),
(64,1,1012,22),
(65,1,1013,23),
(66,2,1022,24),
(67,2,1023,12),
(68,1,1024,13),
(69,2,1025,14),
(70,4,1026,15),
(71,1,1000,16),
(72,1,1001,17),
(73,2,1002,18),
(74,3,1003,19),
(75,1,1004,20),
(76,2,1005,21),
(77,4,1006,22),
(78,1,1007,23),
(79,1,1008,24),
(80,2,1009,25),
(81,2,1010,26);
