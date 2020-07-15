-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 15. Jul 2020 um 21:22
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr9_catalin_sacadat_delivery`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `Car_ID` int(11) NOT NULL,
  `car_make` varchar(20) DEFAULT NULL,
  `car_model` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `car`
--

INSERT INTO `car` (`Car_ID`, `car_make`, `car_model`) VALUES
(97, 'Honda', 'Civic'),
(98, 'Porsche', 'Cayenne'),
(99, 'Toyota', 'Prius');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `company`
--

CREATE TABLE `company` (
  `Company_ID` int(11) NOT NULL,
  `Name` varchar(55) DEFAULT NULL,
  `Address` varchar(55) DEFAULT NULL,
  `zip_Code` int(11) DEFAULT NULL,
  `fk_Intermed_ID` int(11) DEFAULT NULL,
  `fk_Mail_ID` int(11) DEFAULT NULL,
  `fk_Employee_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `company`
--

INSERT INTO `company` (`Company_ID`, `Name`, `Address`, `zip_Code`, `fk_Intermed_ID`, `fk_Mail_ID`, `fk_Employee_ID`) VALUES
(29, 'Express Delivery Service', 'Max Mustermann Avenue 25', 1170, 9, 3, 28);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(11) NOT NULL,
  `f_name` varchar(55) DEFAULT NULL,
  `l_name` varchar(55) DEFAULT NULL,
  `adress` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`Customer_ID`, `f_name`, `l_name`, `adress`) VALUES
(5, 'Susi', 'Cooper', 'Happystreet 16');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `delivery_driver`
--

CREATE TABLE `delivery_driver` (
  `Driver_id` int(11) NOT NULL,
  `f_name` varchar(55) DEFAULT NULL,
  `l_name` varchar(55) DEFAULT NULL,
  `address` varchar(70) DEFAULT NULL,
  `fk_Car_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `delivery_driver`
--

INSERT INTO `delivery_driver` (`Driver_id`, `f_name`, `l_name`, `address`, `fk_Car_ID`) VALUES
(69, 'Max', 'Mustermann', 'Boulevard No.88', 99);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `Employee_ID` int(11) NOT NULL,
  `f_name` varchar(55) DEFAULT NULL,
  `l_name` varchar(55) DEFAULT NULL,
  `adress` varchar(100) DEFAULT NULL,
  `fk_Driver_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`Employee_ID`, `f_name`, `l_name`, `adress`, `fk_Driver_ID`) VALUES
(28, 'Jason', 'King', 'Backery Street 55', 69);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `intermediate_loc`
--

CREATE TABLE `intermediate_loc` (
  `Intermediate_ID` int(11) NOT NULL,
  `Name` varchar(55) DEFAULT NULL,
  `Address` varchar(55) DEFAULT NULL,
  `zip_Code` int(11) DEFAULT NULL,
  `fk_Mail_ID` int(11) DEFAULT NULL,
  `fk_Company_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `intermediate_loc`
--

INSERT INTO `intermediate_loc` (`Intermediate_ID`, `Name`, `Address`, `zip_Code`, `fk_Mail_ID`, `fk_Company_ID`) VALUES
(9, 'Lucky Post Office', 'Luckystreet 25', 1020, 3, 29);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `packages_mail`
--

CREATE TABLE `packages_mail` (
  `Mail_ID` int(11) NOT NULL,
  `fk_Customer_ID` int(11) DEFAULT NULL,
  `fk_Recipient_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `packages_mail`
--

INSERT INTO `packages_mail` (`Mail_ID`, `fk_Customer_ID`, `fk_Recipient_ID`) VALUES
(3, 5, 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipient`
--

CREATE TABLE `recipient` (
  `Recipient_ID` int(11) NOT NULL,
  `f_name` varchar(55) DEFAULT NULL,
  `l_name` varchar(55) DEFAULT NULL,
  `adress` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `recipient`
--

INSERT INTO `recipient` (`Recipient_ID`, `f_name`, `l_name`, `adress`) VALUES
(7, 'Mandy', 'Moore', '5th Avenue Street');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`Car_ID`);

--
-- Indizes für die Tabelle `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`Company_ID`),
  ADD KEY `fk_Intermed_ID` (`fk_Intermed_ID`),
  ADD KEY `fk_Mail_ID` (`fk_Mail_ID`),
  ADD KEY `fk_Employee_ID` (`fk_Employee_ID`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indizes für die Tabelle `delivery_driver`
--
ALTER TABLE `delivery_driver`
  ADD PRIMARY KEY (`Driver_id`),
  ADD KEY `fk_Car_ID` (`fk_Car_ID`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Employee_ID`),
  ADD KEY `fk_Driver_ID` (`fk_Driver_ID`);

--
-- Indizes für die Tabelle `intermediate_loc`
--
ALTER TABLE `intermediate_loc`
  ADD PRIMARY KEY (`Intermediate_ID`),
  ADD KEY `fk_Mail_ID` (`fk_Mail_ID`),
  ADD KEY `fk_Company_ID` (`fk_Company_ID`);

--
-- Indizes für die Tabelle `packages_mail`
--
ALTER TABLE `packages_mail`
  ADD PRIMARY KEY (`Mail_ID`),
  ADD KEY `fk_Customer_ID` (`fk_Customer_ID`),
  ADD KEY `fk_Recipient_ID` (`fk_Recipient_ID`);

--
-- Indizes für die Tabelle `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`Recipient_ID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`fk_Intermed_ID`) REFERENCES `intermediate_loc` (`Intermediate_ID`),
  ADD CONSTRAINT `company_ibfk_2` FOREIGN KEY (`fk_Mail_ID`) REFERENCES `packages_mail` (`Mail_ID`),
  ADD CONSTRAINT `company_ibfk_3` FOREIGN KEY (`fk_Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Constraints der Tabelle `delivery_driver`
--
ALTER TABLE `delivery_driver`
  ADD CONSTRAINT `delivery_driver_ibfk_1` FOREIGN KEY (`fk_Car_ID`) REFERENCES `car` (`Car_ID`);

--
-- Constraints der Tabelle `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_Driver_ID`) REFERENCES `delivery_driver` (`Driver_id`);

--
-- Constraints der Tabelle `intermediate_loc`
--
ALTER TABLE `intermediate_loc`
  ADD CONSTRAINT `intermediate_loc_ibfk_1` FOREIGN KEY (`fk_Mail_ID`) REFERENCES `packages_mail` (`Mail_ID`),
  ADD CONSTRAINT `intermediate_loc_ibfk_2` FOREIGN KEY (`fk_Company_ID`) REFERENCES `company` (`Company_ID`);

--
-- Constraints der Tabelle `packages_mail`
--
ALTER TABLE `packages_mail`
  ADD CONSTRAINT `packages_mail_ibfk_1` FOREIGN KEY (`fk_Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `packages_mail_ibfk_2` FOREIGN KEY (`fk_Recipient_ID`) REFERENCES `recipient` (`Recipient_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
