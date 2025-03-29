
--

CREATE TABLE `hilfsmittel` (
  `hilfmittelNr` int(11) NOT NULL,
  `bezeichnung` varchar(45) DEFAULT NULL,
    PRIMARY KEY (`hilfmittelNr`)
) ;


INSERT INTO `hilfsmittel` (`hilfmittelNr`, `bezeichnung`) VALUES
                                                              (1, 'Rührschüssel'),
                                                              (2, 'Pfanne'),
                                                              (3, 'Handrührgerät'),
                                                              (4, 'Backblech'),
                                                              (5, 'Backform (rund)'),
                                                              (6, 'Gemüsereibe'),
                                                              (7, 'Pürierstab'),
                                                              (8, 'Suppentopf'),
                                                              (9, 'Milchtopf'),
                                                              (10, 'Saftpresse');

--
-- Daten für Tabelle `hilfsmittel`
--

CREATE TABLE `kategorien` (
                              `kategorieNr` int(11) NOT NULL,
                              `kategoriename` varchar(45) DEFAULT NULL,
                              PRIMARY KEY (`kategorieNr`)
) ;


CREATE TABLE `rezepte` (
                           `rezeptNr` int(11) NOT NULL,
                           `bezeichnung` varchar(45) DEFAULT NULL,
                           `zubereitungsdauer` int(11) DEFAULT NULL,
                           `kategorieNr` int(11) NOT NULL,
                           PRIMARY KEY (`rezeptNr`)
) ;

ALTER TABLE `rezepte`

    ADD KEY `fk_rezepte_kategorien1_idx` (`kategorieNr`);

ALTER TABLE `rezepte`
    ADD CONSTRAINT `fk_rezepte_kategorien1` FOREIGN KEY (`kategorieNr`) REFERENCES `kategorien` (`kategorieNr`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Daten für Tabelle `kategorien`
--

INSERT INTO `kategorien` (`kategorieNr`, `kategoriename`) VALUES
                                                              (1, 'Hauptgerichte  - Fleisch'),
                                                              (2, 'Hauptgerichte - Vegetarisch'),
                                                              (3, 'Suppen'),
                                                              (4, 'Kuchen'),
                                                              (5, 'Dessert');


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hilfsmittellisten`
--

CREATE TABLE `hilfsmittellisten` (
  `hilfsmittellisteNr` int(11) NOT NULL,
  `rezeptNr` int(11) NOT NULL,
  `hilfmittelNr` int(11) NOT NULL,
  PRIMARY KEY (`hilfsmittellisteNr`)
) ;



--
-- Daten für Tabelle `hilfsmittellisten`
--



-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorien`
--



-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rezepte`
--



--
-- Daten für Tabelle `rezepte`
--

INSERT INTO `rezepte` (`rezeptNr`, `bezeichnung`, `zubereitungsdauer`, `kategorieNr`) VALUES
(1, 'Kartoffelsuppe', 45, 3),
(2, 'Spargelcremesuppe', 60, 3),
(3, 'Hackbällchen', 45, 1),
(4, 'Kartoffelsalat', 20, 2),
(5, 'Rüblitorte', 75, 4),
(6, 'Hefezopf', 60, 4),
(7, 'Pfannekuchen', 45, 2),
(8, 'Vanillepudding', 15, 5),
(9, 'Schokoladenpudding', 15, 5),
(10, 'Zitronensorbet', 500, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zutaten`
--

CREATE TABLE `zutaten` (
  `zutatenNr` int(11) NOT NULL,
  `zutatenname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`zutatenNr`)
) ;

--
-- Daten für Tabelle `zutaten`
--

INSERT INTO `zutaten` (`zutatenNr`, `zutatenname`) VALUES
(1, 'Zwiebeln'),
(2, 'Mehl'),
(3, 'Eier'),
(4, 'Milch'),
(5, 'Kartoffeln'),
(6, 'Sahne'),
(7, 'Salz'),
(8, 'Pfeffer'),
(9, 'Äpfel'),
(10, 'geriebene Haselnüsse'),
(11, 'Sellerie'),
(12, 'Speck'),
(13, 'Karotten'),
(14, 'Speisestärke'),
(15, 'Butter'),
(16, 'Spargel'),
(17, 'Knoblauch'),
(18, 'Hackfleisch, gemischt'),
(19, 'Senf'),
(20, 'Essig'),
(21, 'Sonnenblumenöl'),
(22, 'Hefe'),
(23, 'Vanilleschote'),
(24, 'Zartbitter-Schokolade'),
(25, 'Zitronensaft'),
(26, 'Wasser'),
(27, 'Zucker');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zutatenlisten`
--

CREATE TABLE `zutatenlisten` (
  `zutatenlisteNr` int(11) NOT NULL,
  `menge` varchar(45) DEFAULT NULL,
  `rezeptNr` int(11) NOT NULL,
  `zutatenNr` int(11) NOT NULL,
  PRIMARY KEY (`zutatenlisteNr`)
) ;


-- Daten für Tabelle `zutatenlisten`
--

INSERT INTO `zutatenlisten` (`zutatenlisteNr`, `menge`, `rezeptNr`, `zutatenNr`) VALUES
(1, '1 Stück', 1, 1),
(2, '100g', 1, 12),
(3, '20g', 1, 21),
(4, '500g', 1, 5),
(5, '700g', 1, 26),
(6, '3 Prisen', 1, 8),
(7, '900g', 2, 26),
(8, '30g', 2, 15),
(9, '1 TL', 2, 27),
(10, '500g', 2, 16),
(11, '1 TL', 2, 25),
(12, '2 Prisen', 2, 8),
(13, '2 TL', 2, 7),
(14, '200g', 2, 6),
(15, '20g', 3, 21),
(16, '1 Stück', 3, 1),
(17, '800g', 3, 18),
(18, '2', 3, 3),
(19, '2 TL', 3, 7),
(20, '1 TL', 3, 8),
(21, '4 EL', 4, 20),
(22, '1 kg', 4, 5),
(23, '2 TL', 4, 7),
(24, '1 TL', 4, 8),
(25, '4 EL', 4, 21),
(26, '1 Stück', 4, 1),
(27, '120g', 5, 21),
(28, '100g', 5, 10),
(29, '200g', 5, 13),
(30, '200g', 5, 27),
(31, '3', 5, 3),
(32, '250g', 5, 2),
(33, '50g', 6, 15),
(34, '300g', 6, 4),
(35, '20g', 6, 22),
(36, '40g', 6, 27),
(37, '550g', 6, 2),
(38, '1 TL', 6, 7),
(39, '600g', 7, 2),
(40, '6 Stück', 7, 3),
(41, '1 Prise', 7, 7),
(42, '500 ml', 7, 4),
(43, '500g', 8, 4),
(44, '2 Stück', 8, 3),
(45, '50g', 8, 27),
(46, '1 Prise', 8, 7),
(47, '30g', 8, 14),
(48, '1 Stück', 8, 23),
(49, '50g', 9, 24),
(50, '500g', 9, 4),
(51, '1 Stück', 9, 3),
(52, '20g', 9, 27),
(53, '20g', 9, 14),
(54, '650g', 10, 26),
(55, '350g', 10, 27),
(56, '200g', 10, 25),
(57, '1 Stück', 10, 3);





--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `hilfsmittel`
--

--
-- Indizes für die Tabelle `hilfsmittellisten`
--




--
-- Indizes für die Tabelle `kategorien`
--

-- Indizes für die Tabelle `rezepte`
--

--
-- Indizes für die Tabelle `zutaten`


--
-- Indizes für die Tabelle `zutatenlisten`
--

-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `hilfsmittellisten`
--

--
-- Constraints der Tabelle `rezepte`
--

--
-- Constraints der Tabelle `zutatenlisten`
--



INSERT INTO `hilfsmittellisten` (`hilfsmittellisteNr`, `rezeptNr`, `hilfmittelNr`) VALUES
                                                                                       (1, 1, 8),
                                                                                       (2, 2, 8),
                                                                                       (3, 2, 7),
                                                                                       (4, 3, 1),
                                                                                       (5, 3, 2),
                                                                                       (6, 4, 1),
                                                                                       (7, 4, 8),
                                                                                       (8, 5, 1),
                                                                                       (9, 5, 3),
                                                                                       (10, 5, 5),
                                                                                       (11, 5, 6),
                                                                                       (12, 6, 1),
                                                                                       (13, 6, 3),
                                                                                       (14, 6, 4),
                                                                                       (15, 6, 9),
                                                                                       (16, 7, 1),
                                                                                       (17, 7, 3),
                                                                                       (18, 7, 2),
                                                                                       (19, 8, 1),
                                                                                       (20, 8, 3),
                                                                                       (21, 9, 1),
                                                                                       (22, 9, 3),
                                                                                       (23, 10, 1),
                                                                                       (24, 10, 3),
                                                                                       (25, 10, 10);


