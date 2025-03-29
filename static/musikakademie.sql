



-- -----------------------------------------------------
-- Table `schueler`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `schueler` ;

CREATE TABLE IF NOT EXISTS `schueler` (
  `schuelerNr` INT NOT NULL,
  `vorname` VARCHAR(45) NULL,
  `nachname` VARCHAR(45) NULL,
  `geburtsdatum` DATE NULL,
  PRIMARY KEY (`schuelerNr`))
;


-- -----------------------------------------------------
-- Table `lehrer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lehrer` ;

CREATE TABLE IF NOT EXISTS `lehrer` (
  `lehrerNr` INT NOT NULL,
  `vorname` VARCHAR(45) NULL,
  `nachname` VARCHAR(45) NULL,
  `preis_pro_stunde` DOUBLE NULL,
  PRIMARY KEY (`lehrerNr`))
;


-- -----------------------------------------------------
-- Table `instrumente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instrumente` ;

CREATE TABLE IF NOT EXISTS `instrumente` (
  `instrumentNr` INT NOT NULL,
  `bezeichnung` VARCHAR(45) NULL,
  `zuschlagssatz` DOUBLE NULL,
  PRIMARY KEY (`instrumentNr`))
;


-- -----------------------------------------------------
-- Table `unterrichte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `unterrichte` ;

CREATE TABLE IF NOT EXISTS `unterrichte` (
  `unterrichtNr` INT NOT NULL,
  `instrumentNr` INT NOT NULL,
  `lehrerNr` INT NOT NULL,
  PRIMARY KEY (`unterrichtNr`),
  INDEX `fk_unterrichte_instrumente_idx` (`instrumentNr` ASC),
  INDEX `fk_unterrichte_lehrer1_idx` (`lehrerNr` ASC),
  CONSTRAINT `fk_unterrichte_instrumente`
    FOREIGN KEY (`instrumentNr`)
    REFERENCES `instrumente` (`instrumentNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_unterrichte_lehrer1`
    FOREIGN KEY (`lehrerNr`)
    REFERENCES `lehrer` (`lehrerNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `unterrichtsstunden`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `unterrichtsstunden` ;

CREATE TABLE IF NOT EXISTS `unterrichtsstunden` (
  `stundenNr` INT NOT NULL,
  `datum` DATE NULL,
  `schuelerNr` INT NOT NULL,
  `unterrichtNr` INT NOT NULL,
  PRIMARY KEY (`stundenNr`),
  INDEX `fk_unterrichtsstunden_unterrichte1_idx` (`unterrichtNr` ASC),
  INDEX `fk_unterrichtsstunden_schueler1_idx` (`schuelerNr` ASC),
  CONSTRAINT `fk_unterrichtsstunden_unterrichte1`
    FOREIGN KEY (`unterrichtNr`)
    REFERENCES `unterrichte` (`unterrichtNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_unterrichtsstunden_schueler1`
    FOREIGN KEY (`schuelerNr`)
    REFERENCES `schueler` (`schuelerNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;




INSERT INTO schueler VALUES (1, 'Liam', 'Schulze', '2002-03-12'),
(2, 'Lisa', 'Dohl', '2003-07-15'),
(3, 'Annika', 'Schubert', '2008-05-25'),
(4, 'Leon', 'Schmitz', '2006-03-21'),
(5, 'Jonah', 'Müller', '2005-12-24'),
(6, 'Paula', 'Wehrle', '2009-11-01'),
(7, 'Johanna', 'Bohn', '1999-10-17'),
(8, 'Dominik', 'Kuhn', '2010-08-08'),
(9, 'Katrin', 'Spatz', '2004-03-30'),
(10, 'Alexandra', 'Ehret', '2002-01-31');

INSERT INTO lehrer VALUES (1, 'Karl', 'Geiger', 16),
(2, 'Meike', 'Schmidt', 12.8),
(3, 'Johann', 'Bach', 18.5),
(4, 'Renate', 'Assmus', 14),
(5, 'Sebastian', 'Kroll', 12.5);

INSERT INTO instrumente VALUES (1, 'Klavier', 1),
(2, 'Trompete', 1.3),
(3, 'Blockflöte', 1.1),
(4, 'Querflöte', 1.6),
(5, 'Tuba', 1.7),
(6, 'Geige', 1.8),
(7, 'Cello', 1.5);

INSERT INTO unterrichte VALUES (1, 2, 2),
(2, 5, 2),
(3, 1, 4),
(4, 1, 3),
(5, 3, 3),
(6, 4, 5),
(7, 2, 5),
(8, 6, 1),
(9, 6, 4),
(10, 7, 1),
(11, 7, 5);

INSERT INTO unterrichtsstunden VALUES (1, '2021-01-07', 1, 1),
(2, '2021-01-14', 1, 1),
(3, '2021-01-21', 1, 1),
(4, '2021-01-28', 1, 1),
(5, '2021-02-04', 1, 1),
(6, '2021-02-11', 1, 1),
(7, '2021-03-14', 1, 1),
(8, '2021-03-21', 1, 1),
(9, '2021-03-28', 1, 1),
(10, '2021-04-04', 2, 3),
(11, '2021-04-11', 2, 3),
(12, '2021-01-14', 2, 3),
(13, '2021-01-21', 2, 3),
(14, '2021-01-28', 2, 3),
(15, '2021-02-04', 2, 4),
(16, '2021-02-11', 2, 4),
(17, '2021-03-14', 2, 4),
(18, '2021-03-21', 2, 4),
(19, '2021-03-28', 2, 4),
(20, '2021-06-04', 4, 3),
(21, '2021-06-11', 4, 3),
(22, '2021-05-14', 4, 3),
(23, '2021-05-21', 4, 3),
(24, '2021-05-28', 4, 3),
(25, '2021-07-04', 4, 3),
(26, '2021-07-11', 4, 5),
(27, '2021-08-14', 4, 5),
(28, '2021-08-21', 4, 5),
(29, '2021-08-28', 4, 5),
(30, '2021-06-04', 3, 3),
(31, '2021-06-11', 3, 3),
(32, '2021-05-14', 3, 3),
(33, '2021-05-21', 3, 3),
(34, '2021-05-28', 5, 3),
(35, '2021-07-04', 5, 3),
(36, '2021-07-11', 5, 10),
(37, '2021-08-14', 5, 10),
(38, '2021-08-21', 5, 10),
(39, '2021-08-28', 5, 10),
(40, '2021-06-04', 6, 4),
(41, '2021-06-11', 6, 4),
(42, '2021-05-14', 7, 7),
(43, '2021-05-21', 7, 7),
(44, '2021-05-28', 7, 7),
(45, '2021-07-04', 8, 11),
(46, '2021-07-11', 8, 11),
(47, '2021-08-14', 8, 11),
(48, '2021-08-21', 8, 11),
(49, '2021-08-28', 8, 11),
(50, '2021-06-04', 9, 8),
(51, '2021-06-11', 9, 8),
(52, '2022-05-14', 9, 9),
(53, '2022-05-21', 9, 9),
(54, '2022-05-28', 10, 3),
(55, '2022-01-04', 10, 3),
(56, '2022-03-11', 10, 3),
(57, '2022-03-14', 10, 3),
(58, '2022-03-21', 10, 4),
(59, '2022-03-28', 10, 4);
