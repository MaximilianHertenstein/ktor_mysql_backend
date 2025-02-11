


-- -----------------------------------------------------
-- Table `besitzer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `besitzer` (
  `besitzerNr` INT NOT NULL,
  `vorname` VARCHAR(45) NULL,
  `nachname` VARCHAR(45) NULL,
  `telefonnummer` VARCHAR(45) NULL,
  PRIMARY KEY (`besitzerNr`))
;


-- -----------------------------------------------------
-- Table `hunde`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hunde` (
  `hundNr` INT NOT NULL,
  `hundename` VARCHAR(45) NULL,
  `geburtsdatum` DATE NULL,
  `besitzerNr` INT NOT NULL,
  PRIMARY KEY (`hundNr`),
  INDEX `fk_hunde_besitzer_idx` (`besitzerNr` ASC),
  CONSTRAINT `fk_hunde_besitzer`
    FOREIGN KEY (`besitzerNr`)
    REFERENCES `besitzer` (`besitzerNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `trainer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trainer` (
  `trainerNr` INT NOT NULL,
  `vorname` VARCHAR(45) NULL,
  `nachname` VARCHAR(45) NULL,
  PRIMARY KEY (`trainerNr`))
;


-- -----------------------------------------------------
-- Table `kurse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kurse` (
  `kursNr` INT NOT NULL,
  `bezeichnung` VARCHAR(45) NULL,
  `preis` DOUBLE NULL,
  `trainerNr` INT NOT NULL,
  PRIMARY KEY (`kursNr`),
  INDEX `fk_kurse_trainer1_idx` (`trainerNr` ASC),
  CONSTRAINT `fk_kurse_trainer1`
    FOREIGN KEY (`trainerNr`)
    REFERENCES `trainer` (`trainerNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `belegungen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `belegungen` (
  `belegungNr` INT NOT NULL,
  `hundNr` INT NOT NULL,
  `kursNr` INT NOT NULL,
  PRIMARY KEY (`belegungNr`),
  INDEX `fk_hunde_has_kurse_kurse1_idx` (`kursNr` ASC),
  INDEX `fk_hunde_has_kurse_hunde1_idx` (`hundNr` ASC),
  CONSTRAINT `fk_hunde_has_kurse_hunde1`
    FOREIGN KEY (`hundNr`)
    REFERENCES `hunde` (`hundNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hunde_has_kurse_kurse1`
    FOREIGN KEY (`kursNr`)
    REFERENCES `kurse` (`kursNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;





INSERT INTO trainer VALUES (1, 'Martin', 'Koch'),
(2, 'Cordula', 'Anselm'),
(3, 'Anna', 'Egloff'),
(4, 'Ömer', 'Toprak');

INSERT INTO kurse VALUES (10, 'Welpenschule', 200, 2),
(11, 'Apportieren für Fortgeschrittene', 150, 2),
(12, 'Obedience', 150, 1),
(13, 'Dog Dance I', 300, 3),
(14, 'Vorbereitung für die Begleithundeprüfung', 250, 1),
(15, 'Dog Dance II', 200, 4),
(16, 'An der Leine laufen für Anfänger', 250, 3),
(17, 'Agility', 250, 4),
(18, 'Objektsuche', 350, 1);

INSERT INTO besitzer VALUES (1, 'Arne', 'Wetzel', '0761-459876'),
(2, 'Nina', 'Rütter', '0761-359872'),
(3, 'Bernd', 'Höfler', '0761-9657824'),
(4, 'Marina', 'Petersen', '0761-6687559'),
(5, 'Karla', 'Streich', '0761-9955378'),
(6, 'Christian', 'Höler', '0761-8524978'),
(7, 'Lena', 'Günther', '0761-226598'),
(8, 'Michaela', 'Paganini', '0761-3154896');

INSERT INTO hunde VALUES (100, 'Waldi', '2022-12-24', 3),
(101, 'Lotto', '2021-04-05', 1),
(102, 'Bello', '2022-11-11', 2),
(103, 'Paula', '2020-09-21', 3),
(104, 'Arthos', '2022-07-20', 4),
(105, 'Hella', '2019-12-30', 5),
(106, 'Cookie', '2022-05-11', 7),
(107, 'Struppi', '2023-01-11', 6),
(108, 'Laila', '2023-02-02', 8),
(109, 'Bello', '2023-03-16', 6);

INSERT INTO belegungen VALUES (1000, 100, 16),
(1001, 101, 10),
(1002, 102, 11),
(1003, 103, 10),
(1004, 104, 11),
(1005, 103, 16),
(1006, 105, 12),
(1007, 100, 13),
(1008, 106, 15),
(1009, 107, 12),
(1010, 108, 13),
(1011, 101, 10),
(1012, 104, 17),
(1013, 100, 14),
(1014, 102, 16),
(1015, 100, 10),
(1016, 108, 18),
(1017, 109, 16),
(1018, 102, 11),
(1019, 106, 14),
(1020, 104, 12),
(1021, 105, 17);
