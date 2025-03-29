-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 01. Mai 2023 um 18:24
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.2.31



--
-- Datenbank: `skigebiet`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `betreiber`
--

CREATE TABLE `betreiber` (
  `betreiberNr` int(11) NOT NULL,
  `nachname` varchar(45) DEFAULT NULL,
  `vorname` varchar(45) DEFAULT NULL,
    PRIMARY KEY (`betreiberNr`)
) ;

--
-- Daten für Tabelle `betreiber`
--

INSERT INTO `betreiber` (`betreiberNr`, `nachname`, `vorname`) VALUES
(1, 'Messner', 'Reinhold'),
(2, 'Trenkler', 'Luis'),
(3, 'Hütter', 'Barbara'),
(4, 'Trautstein', 'Hilde'),
(5, 'Trenkler', 'Christoph');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorien`
--

CREATE TABLE `kategorien` (
  `kategorieNr` int(11) NOT NULL,
  `farbe` varchar(45) DEFAULT NULL,
  `schwierigkeit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`kategorieNr`)
) ;

--
-- Daten für Tabelle `kategorien`
--

INSERT INTO `kategorien` (`kategorieNr`, `farbe`, `schwierigkeit`) VALUES
(1, 'blau', 'leicht'),
(2, 'rot', 'mittel'),
(3, 'schwarz', 'schwer');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `liftarten`
--

CREATE TABLE `liftarten` (
  `artNr` int(11) NOT NULL,
  `artname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`artNr`)
) ;

--
-- Daten für Tabelle `liftarten`
--

INSERT INTO `liftarten` (`artNr`, `artname`) VALUES
(1, 'Tellerlift'),
(2, 'Schlepplift'),
(3, 'Sessellift'),
(4, 'Gondel');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lifte`
--

CREATE TABLE `lifte` (
  `liftNr` int(11) NOT NULL,
  `bezeichnung` varchar(45) DEFAULT NULL,
  `laenge` double DEFAULT NULL,
  `plaetze` int(11) DEFAULT NULL,
  `betreiberNr` int(11) NOT NULL,
  `artNr` int(11) NOT NULL,
  PRIMARY KEY (`liftNr`)
) ;

--
-- Daten für Tabelle `lifte`
--

INSERT INTO `lifte` (`liftNr`, `bezeichnung`, `laenge`, `plaetze`, `betreiberNr`, `artNr`) VALUES
(1, 'Elsenkopf', 750, 6, 1, 3),
(2, 'Uga-Express', 1600, 4, 2, 3),
(3, 'Übungslift Sunnegg', 220, 1, 1, 1),
(4, 'Walisgaden', 600, 2, 2, 3),
(5, 'Hasenbühel', 1900, 6, 2, 3),
(6, 'Ragaz', 1433, 6, 4, 3),
(7, 'Oberdamüls', 300, 6, 5, 3),
(8, 'Furka', 600, 4, 2, 3),
(9, 'Hohes Licht', 1200, 2, 4, 2),
(10, 'Gipfelbahn', 600, 8, 1, 4),
(11, 'Easy Cheese', 150, 2, 2, 2),
(12, 'Mellaubahn', 2080, 10, 5, 4),
(13, 'Hasenlift', 112, 1, 5, 1),
(14, 'Roßstelle', 638, 8, 2, 3),
(15, 'Hohe Wacht', 1060, 6, 3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lifte_zu_pisten`
--

CREATE TABLE `lifte_zu_pisten` (
  `lfdNr` int(11) NOT NULL,
  `liftNr` int(11) NOT NULL,
  `pistenNr` int(11) NOT NULL,
  PRIMARY KEY (`lfdNr`)
) ;

--
-- Daten für Tabelle `lifte_zu_pisten`
--

INSERT INTO `lifte_zu_pisten` (`lfdNr`, `liftNr`, `pistenNr`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 11),
(4, 1, 12),
(5, 2, 1),
(6, 2, 2),
(7, 2, 11),
(8, 3, 1),
(9, 4, 2),
(10, 5, 4),
(11, 5, 3),
(12, 6, 15),
(13, 6, 16),
(14, 7, 5),
(15, 7, 7),
(16, 7, 17),
(17, 7, 10),
(18, 7, 8),
(19, 8, 7),
(20, 8, 8),
(21, 8, 9),
(22, 9, 3),
(23, 9, 4),
(24, 10, 13),
(25, 10, 14),
(26, 11, 10),
(27, 12, 9),
(28, 12, 3),
(29, 13, 8),
(30, 14, 13),
(31, 14, 14),
(32, 15, 13),
(33, 15, 14);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pisten`
--

CREATE TABLE `pisten` (
  `pistenNr` int(11) NOT NULL,
  `bezeichnung` varchar(45) DEFAULT NULL,
  `laenge` double DEFAULT NULL,
  `hoehenmeter` double DEFAULT NULL,
  `kategorieNr` int(11) NOT NULL,
  PRIMARY KEY (`pistenNr`)
) ;

--
-- Daten für Tabelle `pisten`
--

INSERT INTO `pisten` (`pistenNr`, `bezeichnung`, `laenge`, `hoehenmeter`, `kategorieNr`) VALUES
(1, 'Herzegg', 3800, 500, 1),
(2, 'Uga', 2200, 430, 2),
(3, 'Hohes Licht', 1540, 210, 1),
(4, 'Zilla', 2950, 515, 2),
(5, 'Hasenbühel', 500, 300, 3),
(6, 'Grüsch', 950, 400, 2),
(7, 'Halde', 700, 300, 1),
(8, 'Stofel', 1000, 160, 1),
(9, 'Furka', 700, 160, 3),
(10, 'Sonnenheim', 1200, 300, 1),
(11, 'Nordhang', 1100, 180, 1),
(12, 'Glaublicht', 900, 180, 2),
(13, 'Hohe Wacht', 1750, 375, 2),
(14, 'Hochalpe', 2850, 385, 1),
(15, 'Ragaz', 1600, 240, 1),
(16, 'Hochblanken', 1550, 240, 2),
(17, 'Wäldle', 1430, 350, 2);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `betreiber`

--
-- Indizes für die Tabelle `kategorien`


--
-- Indizes für die Tabelle `liftarten`

--
-- Indizes für die Tabelle `lifte`
--


--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `lifte`
--