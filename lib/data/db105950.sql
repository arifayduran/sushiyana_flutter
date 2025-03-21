-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql12.manitu.net
-- Erstellungszeit: 21. Mrz 2025 um 04:17
-- Server-Version: 10.11.10-MariaDB-log
-- PHP-Version: 8.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db105950`
--
CREATE DATABASE IF NOT EXISTS `db105950` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db105950`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bowls`
--

CREATE TABLE `bowls` (
  `id` int(11) NOT NULL,
  `artikelnummer` int(11) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `bowls`
--

INSERT INTO `bowls` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(620, 620, 'Poke Bowls Lachs', '12.90 €', '- mit Lachs (ca.100g), Hausgemachter Cocktailsauce und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(621, 621, 'Poke Bowls Chrispy Sticks', '12.90 €', '- mit Tempura gebackene Garnelen (4 Sticks), Hausgemachter Cocktailsauce und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n15 - Phenylalaninquelle<br>\n17 - Süßungsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(622, 622, 'Poke Bowls Crispy Chicken', '12.70 €', '- mit Crispy Chicken (1 Schnitzel), Hausgemachter Cocktailsauce und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br><br>\n\nZusatzstoffe:<br><br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(625, 625, 'Poke Bowl Sashimi Mix', '14.90 €', '- mit 2x Lachs, 2x Tunfisch und 2x Ebi (als Scheiben), Hausgemachter Cocktailsauce und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(626, 626, 'Poke Bowl California', '12.90 €', '- mit 4x Surimi Sticks, Hausgemachter Cocktailsauce und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n10 - Krebsfleischimitat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(627, 627, 'Poke Bowl Ebi', '13.90 €', '- mit 4x Ebi (als Scheiben), Hausgemachter Cocktailsauce und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(628, 628, 'Poke Bowl Tekka', '13.90 €', '- mit 4x Tunfisch (als Scheiben), Hausgemachter Cocktailsauce und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(629, 629, 'Poke Bowl Ente Kross', '15.90 €', '- mit Ente Kross (1 Schnitzel), Hausgemachter Cocktailsauce und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n14 - Phosphat<br>\n16 - Stabilisatoren: E1442<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(630, 630, 'Poke Bowl Sake Baked', '13.50 €', '- mit Fritierten Lachs (ca.100g), Hausgemachter Cocktailsauce und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(631, 631, 'Poke Bowl White', '13.90 €', '- mit 4x Butterfisch (als Scheiben), Hausgemachter Cocktailsauce und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(632, 632, 'Poke Bowl Nordsee', '15.90 €', '- mit Nordseekrabben (ca.70g), Hausgemachter Cocktailsauce und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(633, 633, 'Poke Bowl Shrimps', '14.90 €', '- mit Fritierten Großgarnelen (5 Stück), Hausgemachter Cocktailsauce und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(634, 634, 'Poke Bowl Wantan', '13.90 €', '- mit Gebacknen Wantan (3 Stück), Hausgemachter Cocktailsauce und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n14 - Phosphat<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(635, 635, 'Poke Bowl Tamago', '11.40 €', '- mit Japanischem Omelett (4 Scheiben), - Hausgemachter Cocktailsauce und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\nC - Eier / Eiererzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(636, 636, 'Poke Bowl Nem Chay', '11.90 €', '- mit Fritierten Vegetarische Mini Frühlingsrolle (6 Stück), und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(637, 637, 'Poke Bowl Mozarella sticks', '12.90 €', '- mit Mozarella Sticks (4 Sticks), und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nA2 - enthält Roggen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n14 - Phosphat<br>\n16 - Stabilisatoren: E1442<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(638, 638, 'Poke Bowl Vegan Mix', '15.90 €', '- mit Japanischem Tofu, eingelegten Kürbisstrien, eingelegtem Rettisch, Japanischem Pilzen, und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n11 - Säuerungsmittel<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n15 - Phenylalaninquelle<br>\n16 - Stabilisatoren: E1442<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(639, 639, 'Poke Bowl Inari', '11.40 €', '- mit Japanischen Tofu, und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n17 - Süßungsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(640, 640, 'Poke Bowl Oshinki', '11.40 €', '- mit Eingelegtem Rettisch, und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n11 - Säuerungsmittel<br>\n14 - Phosphat<br>\n15 - Phenylalaninquelle<br>\n17 - Süßungsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(641, 641, 'Poke Bowl Shiitake', '11.40 €', '- mit Japanischen Pilzen (ca.100g), und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n14 - Phosphat<br>\n17 - Süßungsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(642, 642, 'Poke Bowl Kampy', '11.40 €', '- mit eingeleten Kürbisstreifen, und Sweetsauce on Top.', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n12 - Geschmacksverstärker<br>\n14 - Phosphat<br>\n16 - Stabilisatoren<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(623, 623, 'Poke Bowls Tofu Vegan', '11.40 €', '- mit Natur Tofu (ca.100g), und Sweetsauce on Top.', 'Allergene:<br><br> A - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br> A1 - enthält Weizen<br> E - Erdnuss / Erdnusserzeugnisse<br> F - Soja / Sojaerzeugnisse<br> K - Senf / Senferzeugnisse<br> L - Sesamsamen / Sesamsamenerzeugnisse<br> M - Schwefeldioxid / Sulfite<br><br>  Zusatzstoffe:<br><br> 14 - Phosphat<br> 19 - E150, E171, E161g, E129, E150a Farbstoff<br> 20 - Konservierungsstoffe<br>', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(624, 624, 'Poke Bowls Natur', '10.70 €', 'Standard', 'Allergene:<br><br> A - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br> A1 - enthält Weizen<br> E - Erdnuss / Erdnusserzeugnisse<br> F - Soja / Sojaerzeugnisse<br> K - Senf / Senferzeugnisse<br> L - Sesamsamen / Sesamsamenerzeugnisse<br> M - Schwefeldioxid / Sulfite<br><br>  Zusatzstoffe:<br><br> 14 - Phosphat<br> 19 - E150, E171, E161g, E129, E150a Farbstoff<br> 20 - Konservierungsstoffe<br>', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `chopsuey`
--

CREATE TABLE `chopsuey` (
  `id` int(11) NOT NULL,
  `artikelnummer` varchar(2) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `chopsuey`
--

INSERT INTO `chopsuey` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(71, '7A', 'Gemüse', '9.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nP - Weichtiere / Weichtiererzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker<br>\n16 - Stabilisatoren<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(72, '7B', 'Tofu', '10.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nP - Weichtiere / Weichtiererzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker<br>\n16 - Stabilisatoren<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(73, '7C', 'Hähnchen', '10.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\nP - Weichtiere / Weichtiererzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker<br>\n14 - Phosphat<br>\n16 - Stabilisatoren<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(74, '7D', 'Rindfleisch', '12.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nP - Weichtiere / Weichtiererzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker<br>\n16 - Stabilisatoren<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(75, '7E', 'Ente kross', '13.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\nP - Weichtiere / Weichtiererzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker<br>\n14 - Phosphat<br>\n16 - Stabilisatoren<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(76, '7F', 'Hähnchen kross', '12.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\nP - Weichtiere / Weichtiererzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker<br>\n14 - Phosphat<br>\n16 - Stabilisatoren<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(77, '7G', 'Groß-Garnele', '12.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br><br>\n\nZusatzstoffe:<br><br>\n12 - Geschmacksverstärker<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `desserts`
--

CREATE TABLE `desserts` (
  `id` int(11) NOT NULL,
  `artikelnummer` int(11) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `desserts`
--

INSERT INTO `desserts` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(514, 514, 'Krabbenchips', '2.00 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nB - Krebstiere / Krebstiererzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n12 - Geschmacksverstärker<br>\n14 - Phosphat<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(515, 515, 'Kokosnussbällchen - 3 Stück', '3.60 €', '', 'Allergene:<br><br>\r\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\r\nA1 - enthält Weizen<br>\r\nC - Eier / Eiererzeugnisse<br>\r\nF - Soja / Sojaerzeugnisse<br>\r\nH - Schalenfrüchte / Schalenfrüchteerzeugnisse<br>\r\nK - Senf / Senferzeugnisse<br>\r\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\r\nM - Schwefeldioxid / Sulfite<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(505, 505, 'Sesambällchen - 4 Stück', '3.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nH - Schalenfrüchte / Schalenfrüchteerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(508, 508, 'Gebackene Banane - Stück', '3.50 €', '  - mit Honigsoße übergossen ', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(510, 510, 'Gebackene Ananas - Stück', '3.50 €', ' - mit Honig übergossen', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(511, 511, 'Choc Cookies - 2 Stück', '2.90 €', '  - mit Tempura gebacken', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nH - Schalenfrüchte / Schalenfrüchteerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br><br>\n\nZusatzstoffe:<br><br>\n16 - Stabilisatoren<br>\n', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `erdnussgericht`
--

CREATE TABLE `erdnussgericht` (
  `id` int(11) NOT NULL,
  `artikelnummer` varchar(2) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `erdnussgericht`
--

INSERT INTO `erdnussgericht` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(61, '6A', 'Gemüse', '9.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br><br>\n\nZusatzstoffe:<br><br>\n12 - Geschmacksverstärker<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(62, '6B', 'Tofu', '10.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br><br>\n\nZusatzstoffe:<br><br>\n12 - Geschmacksverstärker<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>\n', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(63, '6C', 'Hähnchen', '10.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n12 - Geschmacksverstärker<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>\n', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(64, '6D', 'Rindfleisch', '12.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br><br>\n\nZusatzstoffe:<br><br>\n12 - Geschmacksverstärker<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(65, '6E', 'Ente kross', '13.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br><br>\n\nZusatzstoffe:<br><br>\n12 - Geschmacksverstärker<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(66, '6F', 'Hähnchen kross', '12.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n12 - Geschmacksverstärker<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>\n', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(67, '6G', 'Groß-Garnele', '12.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br><br>\n\nZusatzstoffe:<br><br>\n12 - Geschmacksverstärker<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `extras`
--

CREATE TABLE `extras` (
  `id` int(11) NOT NULL,
  `artikelnummer` int(11) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `extras`
--

INSERT INTO `extras` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(904, 904, 'Ingwer', '0.70 €', '', 'Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker<br>\n15 - Phenylalaninquelle<br>\n17 - Süßungsmittel<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(905, 905, 'Soja Sauce', '0.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(906, 906, 'Wassabi', '0.80 €', '', 'Allergene:<br><br>\nK - Senf / Senferzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(907, 907, 'Sweet Sauce', '1,00 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(908, 908, 'Por. Jasminreis', '2.20 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(909, 909, 'Cocktail Sauce', '1.00 €', '', 'A,C,F,K,M,14,19,20', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(910, 910, 'Por. Sushi Reis', '2.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(911, 911, 'Chili Sauce', '0.80 €', '', 'Zusatzstoffe:<br><br>\n11 - Säuerungsmittel<br>\n12 - Geschmacksverstärker<br>\n16 - Stabilisatoren<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(912, 912, 'Honig Sauce', '0.90 €', '', 'nicht vorhanden', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(913, 913, 'Süß Sauer Sauce', '0.80 €', '', 'Zusatzstoffe:<br><br>\n4 - E202 Konservierungsmittel<br>\n5 - E415<br>\n11 - Säuerungsmittel<br>\n16 - Stabilisatoren<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(914, 914, 'Fisch-Sauce', '1.10 €', '', 'Allergene:<br><br>\nD - Fisch / Fischerzeugnisse<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(915, 915, 'Sesamsauce', '1.20 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n11 - Säuerungsmittel<br>\n12 - Geschmacksverstärker<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(916, 916, 'Spezial Unagi Sauce', '1.00 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(917, 917, 'Erdnusssauce', '2.70 €', '', 'Allergene:<br><br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(918, 918, 'Extra Röstzwiebeln', '1.20 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(919, 919, 'Extra Chop Suey', '2.70 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nP - Weichtiere / Weichtiererzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker<br>\n16 - Stabilisatoren<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(920, 920, 'Extra Red Curry', '2.70 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br><br>\n\nZusatzstoffe:<br><br>\n12 - Geschmacksverstärker<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>\n', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(921, 921, 'Extra Spicy', '0.90 €', '', 'Zusatzstoffe:<br><br>\n11 - Säuerungsmittel<br>\n12 - Geschmacksverstärker<br>\n16 - Stabilisatoren<br>\n20 - Konservierungsstoffe<br><br>\n\nAllergene:<br><br>\nC - Eier / Eiererzeugnisse<br>\nK - Senf / Senferzeugnisse<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(929, 929, 'Mit Extra Frischkäse', '0.50 €', '', 'nicht vorhanden', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `extrasWarm`
--

CREATE TABLE `extrasWarm` (
  `id` int(11) NOT NULL,
  `artikelnummer` int(11) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `extrasWarm`
--

INSERT INTO `extrasWarm` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(908, 908, 'Por. Jasminreis', '2.20 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(917, 917, 'Erdnusssauce', '2.70 €', '', 'Allergene:<br><br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(918, 918, 'Extra Röstzwiebeln', '1.20 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(919, 919, 'Extra Chop Suey', '2.70 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nP - Weichtiere / Weichtiererzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker<br>\n16 - Stabilisatoren<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(920, 920, 'Extra Red Curry', '2.70 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br><br>\n\nZusatzstoffe:<br><br>\n12 - Geschmacksverstärker<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>\n', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(921, 921, 'Extra Spicy', '0.90 €', '', 'Zusatzstoffe:<br><br>\n11 - Säuerungsmittel<br>\n12 - Geschmacksverstärker<br>\n16 - Stabilisatoren<br>\n20 - Konservierungsstoffe<br><br>\n\nAllergene:<br><br>\nC - Eier / Eiererzeugnisse<br>\nK - Senf / Senferzeugnisse<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(954, 954, 'Nudeln Statt Reis ', '2,70 €', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fingerfood`
--

CREATE TABLE `fingerfood` (
  `id` int(11) NOT NULL,
  `artikelnummer` int(11) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `fingerfood`
--

INSERT INTO `fingerfood` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(506, 506, 'Crispy Sticks - 6 Stück', '6,40 €', '  - serviert mit Cocktailsoße', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nC - Eier / Eiererzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n12 - Geschmacksverstärker<br>\n15 - Phenylalaninquelle<br>\n17 - Süßungsmittel<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(507, 507, 'Vegetarische Frühlingsrolle  - 6 Stück ', '3.70 €', '   - serviert mit Süß-Saußer-Soße', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n14 - Phosphat<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(509, 509, 'Mozarella Sticks  - 6 Stück', '5.40 €', '  - serviert mit Süß-Sauer-Soße', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nA2 - enthält Roggen<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br><br>\n\nZusatzstoffe:<br><br>\n16 - Stabilisatoren<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(654, 654, 'Edamame', '4.90 €', '  - serviert mit Meersalz', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(512, 512, 'Gegrillte Hühnerspieße - 3 Stück', '5.90 €', '  - serviert mit Erdnusssoße', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(513, 513, 'Wan Tan  - 6 Stück', '5.40 €', '  - serviert mit Süß-Sauer-Soße', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n14 - Phosphat<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gemuese`
--

CREATE TABLE `gemuese` (
  `id` int(11) NOT NULL,
  `artikelnummer` varchar(2) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `gemuese`
--

INSERT INTO `gemuese` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(31, '3A', 'Gebratenes Gemüse', '9.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(32, '3B', 'Gebratenes Gemüse mit Tofu', '10.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(33, '3C', 'Gebratenes Gemüse mit Hähnchen', '10.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(34, '3D', 'Gebratenes Gemüse mit Rindfleisch', '12.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(35, '3E', 'Gebratenes Gemüse mit Ente kross', '13.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker<br>\n14 - Phosphat<br>\n16 - Stabilisatoren<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(36, '3F', 'Gebratenes Gemüse mit Hähnchen kross', '12.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker<br>\n14 - Phosphat<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(37, '3G', 'Gebratenes Gemüse mit Groß-Garnele', '12.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `getraenke`
--

CREATE TABLE `getraenke` (
  `id` int(11) NOT NULL,
  `artikelnummer` int(11) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `getraenke`
--

INSERT INTO `getraenke` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(1, 1, 'Alle Coca-Cola Sorten 1L', '3,00 €', '', 'Mezzo Mix:<br><br> 19 - E150, E171, E161g, E129, E150a Farbstoff<br> 11 - Säuerungsmittel<br> 16 - Stabilisatoren<br><br>  Cola:<br><br> 11 - Säuerungsmittel<br> 13 - koffeinhaltig<br> 19 - E150, E171, E161g, E129, E150a Farbstoff<br><br>  Cola Light:<br><br> 11 - Säuerungsmittel<br> 13 - koffeinhaltig<br> 15 - Phenylalaninquelle<br> 17 - Süßungsmittel<br><br>  Cola Zero:<br><br> 11 - Säuerungsmittel<br> 19 - E150, E171, E161g, E129, E150a Farbstoff<br> 17 - Süßungsmittel<br><br>  Fanta:<br><br> 11 - Säuerungsmittel<br> 18 - Antioxidationsmittel<br> 19 - E150, E171, E161g, E129, E150a Farbstoff<br><br>  Sprite:<br><br> 11 - Säuerungsmittel<br><br>', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(2, 2, 'Apfelschorle 1L', '3,00 €', '', '20 - Konservierungsstoffe<br>', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(3, 3, 'Mineralwasser 1L', '3,00 €', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(4, 4, 'Fassbrause 1L', '3,00 €', '', 'Allergene:<br><br>\nA3 - enthält Gerste<br><br>\n\nZusatzstoffe:<br><br>\n11 - Säuerungsmittel<br>', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(5, 5, 'Alle Coca-cola Sorten 0,3L & 0,2L', '2,20 €', '', 'Mezzo Mix:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n11 - Säuerungsmittel<br>\n16 - Stabilisatoren<br><br>\n\nCola:<br><br>\n11 - Säuerungsmittel<br>\n13 - koffeinhaltig<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br><br>\n\nCola Light:<br><br>\n11 - Säuerungsmittel<br>\n13 - koffeinhaltig<br>\n15 - Phenylalaninquelle<br>\n17 - Süßungsmittel<br><br>\n\nCola Zero:<br><br>\n11 - Säuerungsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n17 - Süßungsmittel<br><br>\n\nFanta:<br><br>\n11 - Säuerungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br><br>\n\nSprite:<br><br>\n11 - Säuerungsmittel<br><br>', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(6, 6, 'Alle Fritz-Kola Sorten 0,3L', '2,20 €', '', 'Fritz Kola:<br><br>\n11 - Säuerungsmittel<br>\n13 - koffeinhaltig<br>\n17 - Süßungsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nFritz Kola Zuckerfrei:<br><br>\n11 - Säuerungsmittel<br>\n13 - koffeinhaltig<br>\n15 - Phenylalaninquelle<br>\n17 - Süßungsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\nM - Schwefeldioxid / Sulfite<br><br>\n\nFritz Apfelkirsch Holunder:<br><br>\n11 - Säuerungsmittel<br>\n16 - Stabilisatoren<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br><br>\n\nFritz Rhababer:<br><br>\n11 - Säuerungsmittel<br>\n17 - Süßungsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br><br>\n\nFritz Apfelschorle:<br><br>\n13 - koffeinhaltig<br>\n17 - Süßungsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br><br>\n\nFritz Zitrone:<br><br>\n16 - Stabilisatoren<br>\n18 - Antioxidationsmittel<br><br>\n\nFritz Orange:<br><br>\n11 - Säuerungsmittel<br>\n16 - Stabilisatoren<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br><br>\n\nFritz Misch Masch:<br><br>\n11 - Säuerungsmittel<br>\n13 - koffeinhaltig<br>\n16 - Stabilisatoren<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br><br>\n\nFritz Melone:<br><br>\n17 - Süßungsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br><br>\n\nVita Malz:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA3 - enthält Gerste<br><br>\n\nClub Mate:<br><br>\n11 - Säuerungsmittel<br>\n13 - koffeinhaltig<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(7, 7, 'Wasser Laut 0,2L', '3,00 €', '', '', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(8, 8, 'Wasser Still 0,2L', '3,00 €', '', '', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(9, 9, 'Orangensaft 0,2L', '3,00 €', '', '', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(10, 10, 'Apfelsaft 0,2L', '3,00 €', '', '', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(11, 11, 'Mangosaft 0,2L', '3,00 €', '', '', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(12, 12, 'Ginger Beer 0,2L', '3,00 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA3 - enthält Gerste<br><br>\n\nZusatzstoffe:<br><br>\n12 - Geschmacksverstärker<br>\n16 - Stabilisatoren<br>\n18 - Antioxidationsmittel<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(13, 12, 'Fritz Kola 0.33 l', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Farbstoff\r\nEnthält Koffein\r\nErhöhter Koffeingehalt. Für Kinder, Schwangere und stillende Frauen nicht empfohlen\r\nEnthält Koffein. Kindern und Schwangeren wird vom Konsum abgeraten.\r\nmit Säuerungsmittel\r\nAllergene\r\nEnthält Schwefeldioxid/Sulfite', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(14, 12, 'Fritz Misch Masch 0,33l ', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Farbstoff\r\nEnthält Koffein\r\nEnthält Koffein. Kindern und Schwangeren wird vom Konsum abgeraten.\r\nenthält Stabilisatoren', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(15, 12, 'Fritz Limo Orange 0,33l ', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Farbstoff\r\nMit Antioxidationsmittel\r\nenthält Stabilisatoren', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(16, 12, 'Fritz Kola Zuckerfrei 0,33l', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Farbstoff\r\nMit Süßungsmittel(n)\r\nenthält Phenylalanin\r\nEnthält Koffein\r\nErhöhter Koffeingehalt. Für Kinder, Schwangere und stillende Frauen nicht empfohlen\r\nmit Säuerungsmittel\r\nAllergene\r\nEnthält Schwefeldioxid/Sulfite', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(17, 12, 'Fritz Limo Zitrone 0,33l', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Antioxidationsmittel\r\nenthält Stabilisatoren', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(18, 12, 'Fritz Limo Melone 0,33l', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Farbstoff\r\n', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(19, 12, 'Fritz Bio Apfelschorle 0,33l ', '3,00 €', '', '', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(20, 12, 'Fritz Limo Apfel-Kirsch-Holunder 0,33l', '3,00 €', '', '', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(21, 12, 'Fritz Bio Rhabarberschorle 0,33l', '3,00 €', '', '', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(22, 12, 'Fritz Ajola (Ananas & Limette) 0,33l', '3,00 €', '', '', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(23, 12, 'Vita Malz 0,33l', '3,00 €', '', 'Allergene\r\nEnthält glutenhaltige/s Getreide/-Erzeugnisse\r\nGerste', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(24, 12, 'Christinen Multi-Vitamin 0,33l ', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Konservierungsstoffen\r\nMit Antioxidationsmittel\r\nenthält Stabilisatoren', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(25, 12, 'Christinen Rubin-Vitamin 0,33l', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Konservierungsstoffen\r\nenthält Stabilisatoren', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(26, 12, 'Elephant Bay Mango & Ananas (Pineapple) 0,33l ', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Farbstoff\r\nSulfite', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(27, 12, 'Elephant Bay Lemon 0,33l ', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Farbstoff\r\nSulfite', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(28, 12, 'Elephant Bay Melone 0,33l ', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Farbstoff\r\nSulfite', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(29, 12, 'Elephant Bay Pfirsich 0,33l \r\n', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Farbstoff\r\nSulfite', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(30, 12, 'Elephant Bay Blueberry 0,33l ', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Farbstoff\r\nSulfite', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(31, 12, 'Elephant Bay Granatapfel 0,33l ', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Farbstoff\r\nSulfite', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(32, 12, 'Elephant Bay Green Tea 0,33l ', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Farbstoff\r\nSulfite', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(33, 12, 'Elephant Bay Mandarine 0,33l \r\n', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Farbstoff\r\nSulfite', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(34, 12, 'Elephant Bay Passion fruit 0,33l ', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Farbstoff\r\nSulfite', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(35, 12, 'Elephant Bay Pfirsich Zero 0,33l ', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Farbstoff\r\nSulfite', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(36, 12, 'Elephant Bay Limo Exotic 0,33l', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Farbstoff\r\nSulfite', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(37, 12, 'Elephant Bay Lime Mint 0,33l ', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Farbstoff\r\nSulfite', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(38, 12, 'Elephant Bay Pink Grapefruit 0,33l', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Farbstoff\r\nSulfite', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(39, 12, 'Elephant Bay Mango & Ananas (Pineapple) 0,33l ', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nMit Farbstoff\r\nSulfite', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(40, 12, 'Rixdorfer Fassbrause 0,33l ', '3,00 €', '', 'Substanzen oder Produkte, die Allergien oder Intoleranzen hervorrufen können.\r\nmit Säuerungsmitte', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gyoza`
--

CREATE TABLE `gyoza` (
  `id` int(11) NOT NULL,
  `artikelnummer` int(11) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `gyoza`
--

INSERT INTO `gyoza` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(516, 516, 'Gyoza Vegetarisch - 4 Stück', '3,50 €', '  - serviert mit Süß-Sauer-Soße', 'Allergene:<br><br>\r\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\r\nA1 - enthält Weizen<br>\r\nC - Eier / Eiererzeugnisse<br>\r\nF - Soja / Sojaerzeugnisse<br>\r\nJ - Sellerie / Sellerieerzeugnisse<br>\r\nL - Sesamsamen / Sesamsamenerzeugnisse<br><br>\r\n\r\n', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(517, 517, 'Gyoza Vegetarisch Tofu - 4 Stück', '4,00 €', '  - serviert mit Süß-Sauer-Soße', 'Allergene:<br><br>\r\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\r\nA1 - enthält Weizen<br>\r\nC - Eier / Eiererzeugnisse<br>\r\nF - Soja / Sojaerzeugnisse<br>\r\nJ - Sellerie / Sellerieerzeugnisse<br>\r\nL - Sesamsamen / Sesamsamenerzeugnisse<br><br>\r\n\r\n', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(518, 518, 'Gyoza Ebi - 4 Stück', '4,50 €', '  - serviert mit Süß-Sauer-Soße', 'Allergene:<br><br>\r\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\r\nA1 - enthält Weizen<br>\r\nC - Eier / Eiererzeugnisse<br>\r\nF - Soja / Sojaerzeugnisse<br>\r\nJ - Sellerie / Sellerieerzeugnisse<br>\r\nL - Sesamsamen / Sesamsamenerzeugnisse<br><br>\r\n\r\n', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(519, 519, 'Gyoza Apfel - 3 Stück', '3,00 €', '', 'Allergene:<br><br>\r\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\r\nA1 - enthält Weizen<br>\r\nC - Eier / Eiererzeugnisse<br>\r\nF - Soja / Sojaerzeugnisse<br>\r\nJ - Sellerie / Sellerieerzeugnisse<br>\r\nL - Sesamsamen / Sesamsamenerzeugnisse<br><br>\r\n\r\n', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(522, 522, 'Gyoza Chicken- 4 Stück', '4,50,00 €', ' - serviert mit Süß-Sauer-Soße', 'Allergene:<br><br>\r\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\r\nA1 - enthält Weizen<br>\r\nC - Eier / Eiererzeugnisse<br>\r\nF - Soja / Sojaerzeugnisse<br>\r\nJ - Sellerie / Sellerieerzeugnisse<br>\r\nL - Sesamsamen / Sesamsamenerzeugnisse<br><br>\r\n\r\n', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(521, 521, 'Gyoza Ente- 4 Stück', '4,50,00 €', ' - serviert mit Süß-Sauer-Soße', 'Allergene:<br><br>\r\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\r\nA1 - enthält Weizen<br>\r\nC - Eier / Eiererzeugnisse<br>\r\nF - Soja / Sojaerzeugnisse<br>\r\nJ - Sellerie / Sellerieerzeugnisse<br>\r\nL - Sesamsamen / Sesamsamenerzeugnisse<br><br>\r\n\r\n', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `insideoutrolls`
--

CREATE TABLE `insideoutrolls` (
  `id` int(11) NOT NULL,
  `artikelnummer` varchar(11) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `insideoutrolls`
--

INSERT INTO `insideoutrolls` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(301, '301', 'Inside Outside Chicken', '7.40 €', 'mit Hähnchenfleisch, Gurke, Frischkäse, Frühlingszwiebeln', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(302, '302', 'Inside Outside Ebi Avocado', '8.40 €', 'mit Garnele, Avocado', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(3021, '302a', 'Inside Outside Ebi Kappa', '8.10 €', 'mit Garnele, Gurke und Frischkäse', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(303, '303', 'Inside Outside Ebi Tempura', '7.90 €', 'in Tempura gebackene Garnele, mit Rucola und Frischkäse', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n15 - Phenylalaninquelle<br>\n17 - Süßungsmittel<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(304, '304', 'Inside Outside  Kappa', '6.90 €', 'mit Gurke, Frischkäse, Sesam', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(305, '305', 'Inside Outside Nordseekrabben', '8.90 €', 'mit Nordseekrabben, Frischkäse, Gurke und Frühlingszwiebeln', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\n<br>Zusatzstoffe:<br><br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(306, '306', 'Inside Outside Salmon', '7.60 €', 'mit gegrilltem Lachs, Gurke, Frischkäse, Frühlingszwiebeln', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nM - Schwefeldioxid / Sulfite<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(307, '307', 'Inside Outside Sake Kappa', '7.90 €', 'mit Lachs, Gurke und Frischkäse', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nD - Fisch / Fischerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(308, '308', 'Inside Outside Sake Avocado', '7.90 €', 'mit Lachs und Avocado', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(309, '309', 'Inside Outside Ente', '7.60 €', 'mit gebratener Entenbrust, Gurke, Mayonnaise', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n16 - Stabilisatoren: E1442<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(310, '310', 'Inside Outside California', '7.10 €', 'mit Surimi und Avocado', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n10 - Krebsfleischimitat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(311, '311', 'Inside Outside Tekka', '8.00 €', 'mit Thunfisch, Gurke, Frischkäse und Frühlingszwiebeln', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(312, '312', 'Inside Outside Sake Rucola', '7.70 €', 'mit Rucola, Lachs, Frischkäse\r\n', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(313, '313', 'Inside Outside Mozarella', '7.30 €', 'mit Mozzarella, Frischkäse und Rucola', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(314, '314', 'Inside Outside Tuna', '7.30 €', 'mit Frühlingszwiebeln, gekochtem Thunfisch, Chili, Mayonnaise und Gurke', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(315, '315', 'Inside Outside Fukuda', '7.10 €', 'mit Frischkäse, Rucola und Surimi', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\n<br>Zusatzstoffe:<br><br>\n10 - Krebsfleischimitat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(316, '316', 'Inside Outside Vegetaria', '7.00 €', 'mit Paprika, Frischkäse, Gurke, Frühlingszwiebeln\r\n', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(317, '317', 'Inside Outside Kampy', '7.00 €', 'mit Frischkäse, Sesam, Rettich und Kürbis', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n11 - Säuerungsmittel<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n15 - Phenylalaninquelle<br>\n16 - Stabilisatoren: E1442<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(318, '318', 'Inside Outside Inari', '6.50 €', 'mit japanischem Tofu, Gurke, Kampyo und Frischkäse', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n16 - Stabilisatoren: E1442<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(319, '319', 'Inside Outside Crispy Chicken', '8.00 €', 'mit krossem Hähnchenfleisch, Gurke und Frischkäse', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `makis`
--

CREATE TABLE `makis` (
  `id` int(11) NOT NULL,
  `artikelnummer` varchar(11) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `makis`
--

INSERT INTO `makis` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(101, '101', 'Maki Avocado', '5.00 €', 'mit Avocado', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(102, '102', 'Maki Sake Avocado', '5.60 €', 'mit Lachs sund Avocado', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(103, '103', 'Maki Salmon', '5.50 €', 'mit gegrilltem Lachs, Sweet Sauce und Sesam', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(104, '104', 'Maki Chicken', '5.40 €', 'mit Chicken, Frischkäse und Frühlingszwiebeln', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(105, '105', 'Maki Ebi', '5.80 €', 'mit Garnelen', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1051, '105a', 'Maki Ebi Avo', '5.90 €', 'mit Garnelen und Avocado', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(106, '106', 'Maki Kappa', '4.90 €', 'mit Gurke, Frischkäse und Sesam\r\n', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(107, '107', 'Maki Nordsee-Krabben', '7.00 €', 'mit Nordseekrabben, Frischkäse und Frühlingszwiebeln', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\n<br>Zusatzstoffe:<br><br>\n20 - Konservierungsstoffe<br>\n', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(108, '108', 'Maki Unagi', '6.10 €', 'mit gegrilltem Flussaal, Sweet Sauce und Sesam', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n14 - Phosphat<br>\n15 - Phenylalaninquelle<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(109, '109', 'Maki Sake', '5.60 €', 'mit Lachs', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(110, '110', 'Maki California', '5.40 €', 'mit Surimi und Avocado', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n10 - Krebsfleischimitat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(111, '111', 'Maki Tekka', '6.10 €', 'mit Thunfisch', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(112, '112', 'Maki Tamago', '4.90 €', 'mit japanischem Omelett', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(113, '113', 'Maki Rucola', '4.90 €', 'mit Rucola, Frischkäse und Sesam', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(114, '114', 'Maki Ebi Tempura', '6.00 €', 'in Tempura gebackene Garnele', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n15 - Phenylalaninquelle<br>\n17 - Süßungsmittel<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(115, '115', 'Maki Mozarella', '5.10 €', 'mit Mozzarella, Frischkäse und Rucola', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(116, '116', 'Maki Tuna', '5.70 €', 'mit gekochtem Thunfisch, Frühlingszwiebeln, Chili und Mayonnaise', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(117, '117', 'Maki Sake Kappa', '5.60 €', 'mit Lachs und Gurke', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(118, '118', 'Maki Paprika', '5.20 €', 'mit Frischkäse und Sesam', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(119, '119', 'Maki Oshinki', '4.90 €', 'mit eingelegtem Rettich\r\n', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\n<br>Zusatzstoffe:<br><br>\n11 - Säuerungsmittel<br>\n15 - Phenylalaninquelle<br>\n17 - Süßungsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(120, '120', 'Maki Kampyo', '5.00 €', 'mit eingelegten Kürbisstreifen', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n16 - Stabilisatoren: E1442<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(121, '121', 'Maki White', '5.60 €', 'mit Butterfisch', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(122, '122', 'Maki Shiitlake', '5.00 €', 'mit japanischen Pilzen', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\n<br>Zusatzstoffe:<br><br>\n17 - Süßungsmittel<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(123, '123', 'Maki Wakame', '5.00 €', 'mit Algensalat und Sesam', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(124, '124', 'Maki Inari', '5.00 €', 'mit japanischem Tofu', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n17 - Süßungsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(125, '125', 'Maki Crispy Chicken', '5.90 €', 'mit Crispy Chicken, Frischkäse', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1111, '111a', 'Maki Tekka Avocado', '6.40 €', 'mit Thunfisch', 'Allergene:<br><br>\r\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\r\nA1 - enthält Weizen<br>\r\nD - Fisch / Fischerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mangochutney`
--

CREATE TABLE `mangochutney` (
  `id` int(11) NOT NULL,
  `artikelnummer` varchar(2) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `mangochutney`
--

INSERT INTO `mangochutney` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(51, '5A', 'mit Gemüse', '9.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\n<br>Zusatzstoffe:<br><br>\n11 - Säuerungsmittel<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(52, '5B', 'mit Tofu', '10.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\n<br>Zusatzstoffe:<br><br>\n11 - Säuerungsmittel<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(53, '5C', 'mit Hähnchen', '10.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n11 - Säuerungsmittel<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>\n', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(54, '5D', 'mit Rindfleisch', '12.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\n<br>Zusatzstoffe:<br><br>\n11 - Säuerungsmittel<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(55, '5E', 'mit Ente kross', '13.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n11 - Säuerungsmittel<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>\n16 - Stabilisatoren: E1442<br>\n18 - Antioxidationsmittel<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(56, '5F', 'mit Hähnchen kross', '12.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n11 - Säuerungsmittel<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>\n', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(57, '5G', 'mit Groß-Garnele', '12.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n11 - Säuerungsmittel<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `menues`
--

CREATE TABLE `menues` (
  `id` int(11) NOT NULL,
  `artikelnummer` int(11) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `menues`
--

INSERT INTO `menues` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(1014, 1014, 'Single Menü 1 - 18 Stück', '19.90 €', '4 Stück Inside-Out California Masago<br>6 Stück Maki Sake Avocado<br>6 Stück Yana Roll Lachs<br>1 Stück Nigiri Sake<br>1 Stück Nigiri White Butterfisch', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n9 - E110<br>\n10 - Krebsfleischimitat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1015, 1015, 'Single Menü 2 - 18 Stück', '18.90 €', '4 Stück Inside-Out Kampy - Sesam<br>6 Stück Maki Avocado<br>6 Stück Yana Roll Vegetarier<br>1 Stück Nigiri Inari<br>1 Stück Nigiri Tamago', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n11 - Säuerungsmittel<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n15 - Phenylalaninquelle<br>\n16 - Stabilisatoren: E1442<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1016, 1016, 'Single Menü 3 - 18 Stück', '19.50 €', '4 Stück Inside-Out Sake Avocado - Sesam<br>6 Stück Maki Tuna<br>6 Stück Yana Roll Vegetarier<br>1 Stück Nigiri Sake<br>1 Stück Nigiri Tamago', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>\n', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1017, 1017, 'Crispy Chicken Menü - 20 Stück', '18.90 €', '8 Stück Inside-Out Crispy Chicken - Sesam<br>6 Stück Yana Roll Crispy Chicken<br>6 Stück Maki Crispy Chicken', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>\n', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1001, 1001, 'Maki Menü - 18 Stück', '12,50 €', '6 Stück Maki Sake<br>6 Stück Maki Kappa<br>6 Stück Maki Tekka', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1002, 1002, 'Lachs Menü - 24 Stück', '19,90 €', '8 Stück Inside-Out Sake Kappa - Schnittlauch<br>8 Stück Inside-Out Sake Avocado - Sesam<br>6 Stück Maki Sake<br>2 Stück Nigiri Sake', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1003, 1003, 'Yana Roll Menü - 18 Stück', '21.90 €', '6 Stück Yana Roll Lachs<br>6 Stück Yana Roll Garnele<br>6 Stück Yana Roll Chicken', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1009, 1009, 'Mini Yana Roll Menü - 18 Stück', '16.90 €', '6 Stück Mini Yana Roll Ebi<br>6 Stück Mini Yana Roll Sake<br>6 Stück Mini Yana Roll Mozzarella', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1004, 1004, 'Vegetarier Menü - 26 Stück', '19.90 €', '8 Stück Inside-Out Inari - Sesam<br>6 Stück Yana Roll Vegetaria<br>6 Stück Maki Oshinki<br>6 Stück Maki Kappan', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n11 - Säuerungsmittel<br>\n15 - Phenylalaninquelle<br>\n17 - Süßungsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1005, 1005, 'Nigiri Menü - 6 Stück', '17,50 €', '2 Stück Nigiri Sake<br>2 Stück Nigiri Ebi<br>2 Stück Nigiri Maguro', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1006, 1006, 'Kayo Menü - 18 Stück', '18.90 €', '8 Stück Inside-Out Sake Avocado - Masago<br>6 Stück Maki Sake Avocado<br>2 Stück Nigiri Sake<br>2 Stück Nigiri Maguro', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n9 - E110<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1018, 1018, 'Ebi Menü - 22 Stück', '23.90 €', '8 Stück Inside-Out Ebi Avocado - Sesam<br>6 Stück Yana Roll Garnele<br>6 Stück Maki Ebi<br>2 Stück Nigiri Ebi', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1007, 1007, 'Party Platte - 40 Stück', '34.50 €', '8 Stück Inside-Out Sake Kappa - Schnittlauch<br>8 Stück Inside-Out Ebi Avocado - Masago<br>6 Stück Maki Tekka<br>6 Stück Maki Sake<br>6 Stück Maki Kappa<br>2 Stück Nigiri Maguro<br>2 Stück Nigiri Sake<br>2 Stück Nigiri Ebi', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n9 - E110<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1008, 1008, 'XL Platte - 60 Stück', '44.95 €', '8 Stück Inside-Out California Avocado - Masago<br>8 Stück Inside-Out Sake Kappa - Schnittlauch<br>8 Stück Inside-Out Ebi Avocado - Sesam<br>6 Stück Maki Sake<br>6 Stück Maki Ebi<br>6 Stück Maki Kappa<br>6 Stück Maki Tekka<br>6 Stück Maki Sake Avocado<br>2 Stück Nigiri Sake<br>2 Stück Nigiri Ebi<br>2 Stück Nigiri Maguro', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n9 - E110<br>\n10 - Krebsfleischimitat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1010, 1010, 'Kaschimi Platte - 40 Stück', '32.95 €', '8 Stück Inside-Out Sake Rucola - Sesam<br>8 Stück Inside-Out Mozzarella - Schnittlauch<br>6 Stück Maki Mozzarella<br>6 Stück Maki Kappa<br>6 Stück Maki Ebi<br>2 Stück Nigiri Sake<br>2 Stück Nigiri Ebi<br>2 Stück Nigiri Maguro', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1011, 1011, 'Fukuda Menü - 28 Stück', '26.90 €', '8 Stück Inside-Out Fukuda - Masago<br>6 Stück Maki Salmon<br>6 Stück Maki Kappa<br>6 Stück Yana Roll Sake Rucola<br>2 Stück Nigiri Sake', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n9 - E110<br>\n10 - Krebsfleischimitat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1012, 1012, 'Sanada Menü - 26 Stück', '21.90 €', '8 Stück Inside-Out Sake Rucola - Schnittlauch<br>6 Stück Maki Rucola<br>6 Stück Maki Sake Avocado<br>6 Stück Yana Roll Lachs', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1013, 1013, 'XXL Platte - 96 Stück', '74,95 €', '16 Stück Inside-Out California Avocado - Masago<br>16 Stück Inside-Out Sake Kappa - Schnittlauch<br>16 Stück Inside-Out Ebi Avocado - Sesam<br>12 Stück Maki Kappa<br>12 Stück Maki Sake<br>12 Stück Maki Tekka<br>4 Stück Nigiri Sake<br>4 Stück Nigiri Ebi<br>4 Stück Nigiri Maguro', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n9 - E110<br>\n10 - Krebsfleischimitat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `miniyanarolls`
--

CREATE TABLE `miniyanarolls` (
  `id` int(11) NOT NULL,
  `artikelnummer` varchar(11) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `miniyanarolls`
--

INSERT INTO `miniyanarolls` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(801, '801', 'Mini Yana Roll Salmon', '6.40 €', 'mit gegrilltem Lachs mit Haut', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(802, '802', 'Mini Yana Roll Tamago', '5.60 €', 'mit japanischem Omelett', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(803, '803', 'Mini Yana Roll California', '6.20 €', 'mit Surimi und Avocado', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n10 - Krebsfleischimitat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(804, '804', 'Mini Yana Roll Mozarella', '5.90 €', 'mit Frischkäse und Rucola', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(805, '805', 'Mini Yana Roll Ebi', '6.80 €', 'mit Garnele', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(8051, '805a', 'Mini Yana Roll Ebi Avo', '7.10 €', 'mit Garnele und Avocado', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(806, '806', 'Mini Yana Roll Sake', '6.50 €', 'mit Lachs', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(807, '807', 'Mini Yana Roll Sake Avo', '7.00 €', 'mit Lachs und Avocado', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(808, '808', 'Mini Yana Roll Kappa', '6.00 €', 'mit Gurke, Frischkäse und Sesam', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(809, '809', 'Mini Yana Roll Tekka', '7.00 €', 'mit Thunfisch\r\n', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(8091, '809a', 'Mini Yana Roll Tekka Avo', '7.10 €', 'mit Thunfisch Avocado', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(810, '810', 'Mini Yana Roll Avocado', '6.00 €', 'mit Avocado', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(811, '811', 'Mini Yana Roll Chicken', '6.50 €', 'mit Frischkäse und Frühlingszwiebeln', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n2 - E621 Mononatriumglutamat<br>\n14 - Phosphat<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(812, '812', 'Mini Yana Roll Tuna', '6.40 €', 'mit gekochtem Thunfisch, Frühlingszwiebeln, Chili und Mayonnaise\r\n', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(813, '813', 'Mini Yana Roll Rucola', '6.00 €', 'mit Frischkäse und Sesam', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(814, '814', 'Mini Yana Roll Paprika', '6.20 €', 'mit Frischkäse und Sesam', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(815, '815', 'Mini Yana Roll Sake Kappa', '6.70 €', 'mit Lachs und Gurke', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(816, '816', 'Mini Yana Roll Oshinki', '5.90 €', 'mit eingelegtem Rettich', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n11 - Säuerungsmittel<br>\n15 - Phenylalaninquelle<br>\n17 - Süßungsmittel<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(817, '817', 'Mini Yana Roll Kampyo', '5.90 €', 'mit eingelegten Kürbisstreifen', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n16 - Stabilisatoren: E1442<br>\n18 - Antioxidationsmittel<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(818, '818', 'Mini Yana Roll White', '6.40 €', 'mit Butterfisch', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(819, '819', 'Mini Yana Roll Inari', '5.90 €', 'mit japanischem Tofu', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n17 - Süßungsmittel<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `nigiris`
--

CREATE TABLE `nigiris` (
  `id` int(11) NOT NULL,
  `artikelnummer` varchar(11) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `nigiris`
--

INSERT INTO `nigiris` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(201, '201', 'Nigiri Maguro', '3.10 €', 'mit Thunfisch', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(2011, '201a', 'Nigiri Maguro Flambiert', '3.20 €', 'mit flambiertem Thunfisch', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(202, '202', 'Nigiri Sake', '2.90 €', 'mit Lachs', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(2022, '202a', 'Nigiri Sake Flambiert', '3.10 €', 'mit flambiertem Lachs', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(203, '203', 'Nigiri Tamago', '2.70 €', 'mit japanischem Omelett\r\n', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(204, '204', 'Nigiri Unagi', '3.10 €', 'mit gegrilltem Flussaal\r\n', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n14 - Phosphat<br>\n15 - Phenylalaninquelle<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(205, '205', 'Nigiri Ebi', '3.00 €', 'mit Garnele', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(206, '206', 'Nigiri Surimi', '2.70 €', 'mit Krebsfleischimitat\r\n', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n10 - Krebsfleischimitat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(207, '207', 'Nigiri Oshinki', '2.70 €', 'mit eingelegtem Rettich\r\n', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\n<br>Zusatzstoffe:<br><br>\n11 - Säuerungsmittel<br>\n15 - Phenylalaninquelle<br>\n17 - Süßungsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>\n', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(208, '208', 'Nigiri White', '2.70 €', 'mit Butterfisch', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(209, '209', 'Nigiri Inari', '2.70 €', 'mit japanischem Tofu', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n17 - Süßungsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(210, '210', 'Nigiri Avocado', '2.70 €', 'mit Avocado', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `nudeln`
--

CREATE TABLE `nudeln` (
  `id` int(11) NOT NULL,
  `artikelnummer` varchar(2) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `nudeln`
--

INSERT INTO `nudeln` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(11, '1A', 'Gebratene Nudeln mit Gemüse', '8.70 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(12, '1B', 'Gebratene Nudeln mit Tofu', '9.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(13, '1C', 'Gebratene Nudeln mit Hähnchen', '9.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(14, '1D', 'Gebratene Nudeln mit Rindfleisch', '12.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(15, '1E', 'Gebratene Nudeln mit Ente kross', '13.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n16 - Stabilisatoren: E1442<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(16, '1F', 'Gebratene Nudeln mit Hähnchen kross', '12.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(17, '1G', 'Gebratene Nudeln mit Groß-Garnele', '12.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `redcurry`
--

CREATE TABLE `redcurry` (
  `id` int(11) NOT NULL,
  `artikelnummer` varchar(2) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `redcurry`
--

INSERT INTO `redcurry` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(81, '8A', 'mit Gemüse', '9.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(82, '8B', 'mit Tofu', '10.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nF - Soja / Sojaerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(83, '8C', 'mit Hähnchen', '10.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>\n', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(84, '8D', 'mit Rindfleisch', '12.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(85, '8E', 'mit Ente kross', '13.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>\n16 - Stabilisatoren: E1442<br>\n18 - Antioxidationsmittel<br>', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(86, '8F', 'mit Hähnchen kross', '12.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>\n', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(87, '8G', 'mit Groß-Garnele', '12.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reis`
--

CREATE TABLE `reis` (
  `id` int(11) NOT NULL,
  `artikelnummer` varchar(2) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `reis`
--

INSERT INTO `reis` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(21, '2A', 'Gebratener Reis mit Gemüse', '8.70 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(22, '2B', 'Gebratener Reis mit Tofu', '9.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(23, '2C', 'Gebratener Reis mit Hähnchen', '9.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n14 - Phosphat<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(24, '2D', 'Gebratener Reis mit Rindfleisch', '12.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(25, '2E', 'Gebratener Reis mit Ente kross', '13.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n14 - Phosphat<br>\n16 - Stabilisatoren: E1442<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(26, '2F', 'Gebratener Reis mit Hähnchen kross', '12.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n14 - Phosphat<br>\n20 - Konservierungsstoffe<br>\n', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(27, '2G', 'Gebratener Reis mit Groß-Garnele', '12.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `salate`
--

CREATE TABLE `salate` (
  `id` int(11) NOT NULL,
  `artikelnummer` int(11) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `salate`
--

INSERT INTO `salate` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(648, 648, 'Glasnudelsalat Natur', '6.50 €', 'mit Sojasprossen, Karotten, Koriander, frischem Chili, Knoblauch, Eisbergsalat, Erdnüssen, Röstzwiebeln und Fischsauce', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(649, 649, 'Glasnudelsalat mit Tofu', '7.50 €', 'mit Sojasprossen, Karotten, Koriander, frischem Chili, Knoblauch, Eisbergsalat, Erdnüssen, Röstzwiebeln und Fischsauce', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(650, 650, 'Glasnudelsalat mit Chicken', '7.90 €', 'mit Sojasprossen, Karotten, Koriander, frischem Chili, Knoblauch, Eisbergsalat, Erdnüssen, Röstzwiebeln und Fischsauce\r\n', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(651, 651, 'Glasnudelsalat mit Scampis', '8.90 €', 'mit Sojasprossen, Karotten, Koriander, frischem Chili, Knoblauch, Eisbergsalat, Erdnüssen, Röstzwiebeln und Fischsauce', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(652, 652, 'Glasnudelsalat mit Tuna', '7.90 €', 'mit Sojasprossen, Karotten, Koriander, frischem Chili, Knoblauch, Eisbergsalat, Erdnüssen, Röstzwiebeln und Fischsauce', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(655, 655, 'Glasnudelsalat mit geschnetzeltem Rindfleisch', '8.40 €', 'mit Sojasprossen, Karotten, Koriander, frischem Chili, Knoblauch, Eisbergsalat, Erdnüssen, Röstzwiebeln und Fischsauce', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(653, 653, 'Algensalat', '5.40 €', 'mit würzigem Sesam-Dressing', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sashimi`
--

CREATE TABLE `sashimi` (
  `id` int(11) NOT NULL,
  `artikelnummer` int(11) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `sashimi`
--

INSERT INTO `sashimi` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(1100, 1100, 'Sashimi Sake (12 Stück)', '17.90 €', 'Lachs mit Reis und Sesam', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1101, 1101, 'Sashimi Maguro (10 Stück)', '19.90 €', 'Thunfisch mit Reis und Sesam', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1102, 1102, 'Sashimi Mix (12 Stück)', '20.90 €', '• 4 Lachs Sashimi\r\n• 4 Thunfisch Sashimi\r\n• 4 Garnelen Sashimi\r\n• Reis\r\n• Sesam', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sommerrollen`
--

CREATE TABLE `sommerrollen` (
  `id` int(11) NOT NULL,
  `artikelnummer` int(11) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `sommerrollen`
--

INSERT INTO `sommerrollen` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(604, 604, 'Sommerrollen mit Chicken', '3.40 €', '- gefüllt mit frischem Salat, Hühnerfleisch, Erdnüssen, Glasnudeln und Süß-Sauer-Sauce', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(605, 605, 'Sommerrollen mit Ebi', '3.90 €', '-gefüllt mit frischem Salat, Garnelen, Erdnüssen, Glasnudeln und Süß-Sauer-Sauce', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(606, 606, 'Sommerrollen mit Tuna', '3.80 €', '- gefüllt mit frischem Salat, Thunfisch, Erdnüssen, Glasnudeln und Süß-Sauer-Sauce', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br><br>\n\nZusatzstoffe:<br><br>\n12 - Geschmacksverstärker<br>\n17 - Süßungsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(607, 607, 'Sommerrollen mit Natur', '2.90 €', '- gefüllt mit frischem Salat, Erdnüssen, Glasnudeln und Süß-Sauer-Sauce', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(608, 608, 'Sommerrollen mit Tofu', '3.30 €', '- gefüllt mit frischem Salat, Tofu, Erdnüssen, Glasnudeln und Süß-Sauer-Sauce', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `specialRolls`
--

CREATE TABLE `specialRolls` (
  `id` int(11) NOT NULL,
  `artikelnummer` int(11) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `specialRolls`
--

INSERT INTO `specialRolls` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(350, 350, 'Special Roll Vegetarisch', '12.50 €', 'in Tempura gebackene Paprika, Frühlingszwiebeln, Gurke und Frischkäse, dazu Cocktailsauce und Unagi Sauce', 'Allergene:<br><br> A - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br> A1 - enthält Weizen<br> C - Eier / Eiererzeugnisse<br> F - Soja / Sojaerzeugnisse<br> G - Milch / Milcherzeugnisse einschließlich Laktose<br> K - Senf / Senferzeugnisse<br> L - Sesamsamen / Sesamsamenerzeugnisse<br> M - Schwefeldioxid / Sulfite<br> <br>Zusatzstoffe:<br><br> 14 - Phosphat<br> 19 - E150, E171, E161g, E129, E150a Farbstoff<br> 20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(351, 351, 'Sake Lachs on top flambiert Temaki', '14.90 €', 'in Tempura gebackene Garnele, Rucola, Frischkäse und Gurke, dazu Cocktailsauce und Unagi Sauce', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n15 - Phenylalaninquelle<br>\n17 - Süßungsmittel<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `suesssauersauce`
--

CREATE TABLE `suesssauersauce` (
  `id` int(11) NOT NULL,
  `artikelnummer` varchar(2) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `suesssauersauce`
--

INSERT INTO `suesssauersauce` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(91, '9A', 'mit Gemüse', '9.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(92, '9B', 'mit Tofu', '10.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(93, '9C', 'mit Hähnchen', '10.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(94, '9D', 'mit Rindfleisch', '12.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(95, '9E', 'mit Ente kross', '13.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>\n16 - Stabilisatoren: E1442<br>\n18 - Antioxidationsmittel<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(96, '9F', 'mit Hähnchen kross', '12.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(97, '9G', 'mit Groß-Garnele', '12.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `suppen`
--

CREATE TABLE `suppen` (
  `id` int(11) NOT NULL,
  `artikelnummer` int(11) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `suppen`
--

INSERT INTO `suppen` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(495, 495, 'Sauer-Scharf Suppe', '3.90 €', '- mit Hühnerhackfleisch, Paprika, Champignons, Karotten, Bambus, Morcheln und Ei', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(496, 496, 'Wan Tan Suppe', '4.40 €', '- gefüllte Teigtaschen mit Hühnerhackfleisch, Koriander und Blätterkohl in Suppenbrühe', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nC - Eier / Eiererzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>\n', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(497, 497, 'Pikante Suppe mit Tofu', '4.40 €', '- mit Ananas, Tomaten, Paprika, Champignons, Sojasprossen und Koriander', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(498, 498, 'Pikante Suppe mit Hühnerfleisch', '4.90 €', '- mit Ananas, Tomaten, Paprika, Champignons, Sojasprossen und Koriander', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(499, 499, 'Pikante Suppe mit Garnelen', '5.40 €', '- mit Ananas, Tomaten, Paprika, Champignons, Sojasprossen und Koriander', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(500, 500, 'Tofu-Kokomilsch-Suppe ', '4.80 €', '- mit Gemüse und Koriander\r\n', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(501, 501, 'Hühnerfleisch-Kokomilsch-Suppe ', '4.90 €', '- mit Hühnerfleisch, Gemüse und Koriander', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(502, 502, 'Garnelen-Kokosmilch-Suppe (sauer-scharf)', '5.40 €', '- mit Garnelen, Gemüse und Koriander', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nJ - Sellerie / Sellerieerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n2 - E621 Mononatriumglutamat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n17 - Süßungsmittel<br>\n18 - Antioxidationsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(503, 503, 'Miso Suppe', '3.90 €', '- typisch gewürzt, mit Tofu, Seetang und Frühlingszwiebeln', 'Allergene:<br><br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(504, 504, 'Lachs Suppe', '4.70 €', '- Misosuppe mit Frühlingszwiebeln und Lachsfiletstücken', 'Allergene:<br><br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `temaki`
--

CREATE TABLE `temaki` (
  `id` int(11) NOT NULL,
  `artikelnummer` int(11) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `temaki`
--

INSERT INTO `temaki` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(97, 97, 'Vegetarische Temaki', '6.00 €', 'mit Rucola, Paprika, Gurke, Oshinki , Frischkäse und Sesam\r\n', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n11 - Säuerungsmittel<br>\n15 - Phenylalaninquelle<br>\n17 - Süßungsmittel<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(98, 98, 'Sake Temaki', '6.40 €', 'mit Avocado, Gurke, Frischkäse, Lachs und Sesam', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(99, 99, 'California Temaki', '6.40 €', 'mit Surimi, Gurke, Avocado, Frischkäse und Sesam', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nC - Eier / Eiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n10 - Krebsfleischimitat<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `warmgetraenke`
--

CREATE TABLE `warmgetraenke` (
  `id` int(11) NOT NULL,
  `artikelnummer` int(11) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `warmgetraenke`
--

INSERT INTO `warmgetraenke` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(1, 1, 'Café Crème', '3,00 €', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(2, 2, 'Cappucino', '3,20 €', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(3, 3, 'Cappucino Plus', '3,40 €', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(6, 6, 'Ingwer Tee', '3,20 €', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(5, 5, 'Latte Macciato', '3,50 €', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(4, 4, 'Espresso', '2,50 €', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `yanarolls`
--

CREATE TABLE `yanarolls` (
  `id` int(11) NOT NULL,
  `artikelnummer` int(11) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `yanarolls`
--

INSERT INTO `yanarolls` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(401, 401, 'Yana Roll Chicken', '8.90 €', 'mit Hähnchenfleisch, Frischkäse, Frühlingszwiebeln und Gurke', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n2 - E621 Mononatriumglutamat<br>\n14 - Phosphat<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(402, 402, 'Yana Roll Garnele', '9.40 €', 'mit Garnele, Frischkäse, Frühlingszwiebeln und Gurke', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(403, 403, 'Yana Roll Lachs', '9.40 €', 'mit Lachs, Avocado, Frischkäse und Gurke', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(404, 404, 'Yana Roll Salmon', '8.90 €', 'mit gegrilltem Lachs, Frischkäse, Gurke und Frühlingszwiebeln', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(405, 405, 'Yana Roll Vegetarier', '9.00 €', 'mit Avocado, Frischkäse, Frühlingszwiebeln, Gurke und Paprika', 'Allergene:<br><br> A - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br> A1 - enthält Weizen<br> F - Soja / Sojaerzeugnisse<br> G - Milch / Milcherzeugnisse einschließlich Laktose<br> L - Sesamsamen / Sesamsamenerzeugnisse<br> <br>Zusatzstoffe:<br><br> 19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(406, 406, 'Yana Roll Tekka', '9.40 €', 'mit gebratenem Thunfisch, Gurke, Frühlingszwiebeln und Frischkäse\r\n', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(407, 407, 'Yana Roll Tuna', '8.90 €', 'mit gekochtem Thunfisch, Gurke, Frühlingszwiebeln, Chili und Mayonnaise', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(408, 408, 'Yana Roll Sake Rucola', '9.40 €', 'mit Frischkäse, Lachs und Rucola', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(409, 409, 'Yana Roll Sake Mozarella', '9.40 €', 'mit Frischkäse, Lachs, Mozzarella und Rucola', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(410, 410, 'Yana Roll Sake Ebi', '9.60 €', 'mit Lachs, Garnelen, Gurke und Frischkäse\r\n', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\nD - Fisch / Fischerzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(411, 411, 'Yana Roll Ente', '9.60 €', 'mit gebratener Entenbrust, Gurke, Frühlingszwiebeln und Frischkäse', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n16 - Stabilisatoren: E1442<br>\n18 - Antioxidationsmittel<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(412, 412, 'Yana Roll Crispy Chicken', '9.20 €', 'mit krossem Hähnchenfleisch, Gurken und Frischkäse', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nK - Senf / Senferzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n20 - Konservierungsstoffe<br>', 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `yellowcurry`
--

CREATE TABLE `yellowcurry` (
  `id` int(11) NOT NULL,
  `artikelnummer` varchar(2) NOT NULL,
  `artikelname` varchar(255) NOT NULL,
  `preis` varchar(10) NOT NULL,
  `beschreibung` text NOT NULL,
  `allergene_zusatz` text DEFAULT NULL,
  `pikant` tinyint(1) NOT NULL,
  `vegetarisch` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `bestellbar` tinyint(1) NOT NULL,
  `charlottenburg` tinyint(1) DEFAULT 1,
  `friedrichshain` tinyint(1) DEFAULT 1,
  `lichtenrade` tinyint(1) DEFAULT 1,
  `mitte` tinyint(1) DEFAULT 1,
  `moabit` tinyint(1) DEFAULT 1,
  `neukoelln` tinyint(1) DEFAULT 1,
  `potsdam` tinyint(1) DEFAULT 1,
  `rudow` tinyint(1) DEFAULT 1,
  `spandau` tinyint(1) DEFAULT 1,
  `tegel` tinyint(1) DEFAULT 1,
  `weissensee` tinyint(1) DEFAULT 1,
  `zehlendorf` tinyint(1) DEFAULT 1,
  `FFO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `yellowcurry`
--

INSERT INTO `yellowcurry` (`id`, `artikelnummer`, `artikelname`, `preis`, `beschreibung`, `allergene_zusatz`, `pikant`, `vegetarisch`, `vegan`, `bestellbar`, `charlottenburg`, `friedrichshain`, `lichtenrade`, `mitte`, `moabit`, `neukoelln`, `potsdam`, `rudow`, `spandau`, `tegel`, `weissensee`, `zehlendorf`, `FFO`) VALUES
(41, '4A', 'mit Gemüse', '9.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(42, '4B', 'mit Tofu', '10.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(43, '4C', 'mit Hähnchen', '10.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(44, '4D', 'mit Rindfleisch', '12.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(45, '4E', 'mit Ente kross', '13.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>\n16 - Stabilisatoren: E1442<br>\n18 - Antioxidationsmittel<br>', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(46, '4F', 'mit Hähnchen kross', '12.50 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(47, '4G', 'mit Groß-Garnele', '12.90 €', '', 'Allergene:<br><br>\nA - Glutenhaltiges Getreide / Glutenhaltige Getreideerzeugnisse<br>\nA1 - enthält Weizen<br>\nE - Erdnuss / Erdnusserzeugnisse<br>\nF - Soja / Sojaerzeugnisse<br>\nG - Milch / Milcherzeugnisse einschließlich Laktose<br>\nK - Senf / Senferzeugnisse<br>\nL - Sesamsamen / Sesamsamenerzeugnisse<br>\nM - Schwefeldioxid / Sulfite<br>\nB - Krebstiere / Krebstiererzeugnisse<br>\n<br>Zusatzstoffe:<br><br>\n12 - Geschmacksverstärker: E627, E631, E508<br>\n14 - Phosphat<br>\n19 - E150, E171, E161g, E129, E150a Farbstoff<br>\n20 - Konservierungsstoffe<br>', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `bowls`
--
ALTER TABLE `bowls`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `chopsuey`
--
ALTER TABLE `chopsuey`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `desserts`
--
ALTER TABLE `desserts`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `erdnussgericht`
--
ALTER TABLE `erdnussgericht`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `extrasWarm`
--
ALTER TABLE `extrasWarm`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `fingerfood`
--
ALTER TABLE `fingerfood`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `gemuese`
--
ALTER TABLE `gemuese`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `getraenke`
--
ALTER TABLE `getraenke`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `gyoza`
--
ALTER TABLE `gyoza`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `insideoutrolls`
--
ALTER TABLE `insideoutrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `makis`
--
ALTER TABLE `makis`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `mangochutney`
--
ALTER TABLE `mangochutney`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `menues`
--
ALTER TABLE `menues`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `miniyanarolls`
--
ALTER TABLE `miniyanarolls`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `nigiris`
--
ALTER TABLE `nigiris`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `nudeln`
--
ALTER TABLE `nudeln`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `redcurry`
--
ALTER TABLE `redcurry`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `reis`
--
ALTER TABLE `reis`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `salate`
--
ALTER TABLE `salate`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `sashimi`
--
ALTER TABLE `sashimi`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `sommerrollen`
--
ALTER TABLE `sommerrollen`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `specialRolls`
--
ALTER TABLE `specialRolls`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `suesssauersauce`
--
ALTER TABLE `suesssauersauce`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `suppen`
--
ALTER TABLE `suppen`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `temaki`
--
ALTER TABLE `temaki`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `warmgetraenke`
--
ALTER TABLE `warmgetraenke`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `yanarolls`
--
ALTER TABLE `yanarolls`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `yellowcurry`
--
ALTER TABLE `yellowcurry`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `chopsuey`
--
ALTER TABLE `chopsuey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT für Tabelle `getraenke`
--
ALTER TABLE `getraenke`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT für Tabelle `makis`
--
ALTER TABLE `makis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1112;

--
-- AUTO_INCREMENT für Tabelle `warmgetraenke`
--
ALTER TABLE `warmgetraenke`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
