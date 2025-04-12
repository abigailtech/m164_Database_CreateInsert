-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_freifach`
--

DROP TABLE IF EXISTS `tbl_freifach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_freifach` (
  `ID_Freifach` int(11) NOT NULL,
  `Beschreibung` varchar(50) NOT NULL,
  `Tag` varchar(10) DEFAULT NULL,
  `Zimmer` varchar(10) DEFAULT NULL,
  `FK_FF_LehrerIn` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Freifach`),
  KEY `fk_freifach_lehrer` (`FK_FF_LehrerIn`),
  CONSTRAINT `fk_freifach_lehrer` FOREIGN KEY (`FK_FF_LehrerIn`) REFERENCES `tbl_lehrerin` (`ID_Lehrer`),
  CONSTRAINT `tbl_freifach_ibfk_1` FOREIGN KEY (`FK_FF_LehrerIn`) REFERENCES `tbl_lehrerin` (`ID_Lehrer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_freifach`
--

LOCK TABLES `tbl_freifach` WRITE;
/*!40000 ALTER TABLE `tbl_freifach` DISABLE KEYS */;
INSERT INTO `tbl_freifach` VALUES (1,'Tanz','Mo','112',1),(2,'Chor','Mi','Aula',2),(3,'Elektronik','Di','110',2),(4,'Tanz','Mo','112',2),(5,'Chor','Mi','Aula',2),(6,'Tanz','Mo','112',3),(7,'Elektronik','Di','110',2),(8,'Chor','Mi','Aula',3),(9,'Elektronik','Di','110',4),(10,'Elektronik','Di','110',4);
/*!40000 ALTER TABLE `tbl_freifach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_klasse`
--

DROP TABLE IF EXISTS `tbl_klasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_klasse` (
  `Klasse` varchar(5) NOT NULL,
  `Klassenlehrer` varchar(100) NOT NULL,
  PRIMARY KEY (`Klasse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_klasse`
--

LOCK TABLES `tbl_klasse` WRITE;
/*!40000 ALTER TABLE `tbl_klasse` DISABLE KEYS */;
INSERT INTO `tbl_klasse` VALUES ('11a','Lempel Theo'),('11b','Sommer Inge'),('12a','Breier Guido'),('12c','Klausen Franz');
/*!40000 ALTER TABLE `tbl_klasse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_lehrerin`
--

DROP TABLE IF EXISTS `tbl_lehrerin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_lehrerin` (
  `ID_Lehrer` int(11) NOT NULL,
  `Vorname` varchar(50) NOT NULL,
  `Nachname` varchar(50) NOT NULL,
  `Geburtsdatum` date DEFAULT NULL,
  PRIMARY KEY (`ID_Lehrer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_lehrerin`
--

LOCK TABLES `tbl_lehrerin` WRITE;
/*!40000 ALTER TABLE `tbl_lehrerin` DISABLE KEYS */;
INSERT INTO `tbl_lehrerin` VALUES (1,'Theo','Lempel ','1984-05-12'),(2,'Guido','Breier ','1987-06-21'),(3,'Inge','Sommer ','1978-11-14'),(4,'Franz','Klausen ','1977-02-10'),(5,'Horst','Klee ','1984-05-11'),(6,'Donald','Trampel ','1979-10-02'),(7,'Sonja','Rohner ',NULL);
/*!40000 ALTER TABLE `tbl_lehrerin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_schülerin`
--

DROP TABLE IF EXISTS `tbl_schülerin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_schülerin` (
  `SchülerNr` int(11) NOT NULL,
  `Vorname` varchar(50) NOT NULL,
  `Nachname` varchar(50) NOT NULL,
  `Geb_Datum` date DEFAULT NULL,
  `FK_Klasse` varchar(5) NOT NULL,
  PRIMARY KEY (`SchülerNr`),
  KEY `FK_Klasse` (`FK_Klasse`),
  CONSTRAINT `tbl_schülerin_ibfk_1` FOREIGN KEY (`FK_Klasse`) REFERENCES `tbl_klasse` (`Klasse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_schülerin`
--

LOCK TABLES `tbl_schülerin` WRITE;
/*!40000 ALTER TABLE `tbl_schülerin` DISABLE KEYS */;
INSERT INTO `tbl_schülerin` VALUES (1,'Ulla','Jürgens ','2003-05-12','11a'),(2,'Harry','Schmidt ','2002-06-21','12a'),(3,'Sepp','Jäger ','2003-11-14','11a'),(4,'Evan','Olsen ','2004-02-10','11b'),(5,'Tom','Jürgens ','2002-05-11','12a'),(6,'Justus','Hasler ','2003-10-02','11b'),(8,'Igor','Kustov ','2004-12-11','12c'),(11,'Cedric','Kast ','2004-01-30','12c');
/*!40000 ALTER TABLE `tbl_schülerin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_teilnahme`
--

DROP TABLE IF EXISTS `tbl_teilnahme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_teilnahme` (
  `FK_Freifach` int(11) NOT NULL,
  `FK_Schüler` int(11) NOT NULL,
  PRIMARY KEY (`FK_Freifach`,`FK_Schüler`),
  KEY `FK_Schüler` (`FK_Schüler`),
  CONSTRAINT `tbl_teilnahme_ibfk_1` FOREIGN KEY (`FK_Freifach`) REFERENCES `tbl_freifach` (`ID_Freifach`),
  CONSTRAINT `tbl_teilnahme_ibfk_2` FOREIGN KEY (`FK_Schüler`) REFERENCES `tbl_schülerin` (`SchülerNr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_teilnahme`
--

LOCK TABLES `tbl_teilnahme` WRITE;
/*!40000 ALTER TABLE `tbl_teilnahme` DISABLE KEYS */;
INSERT INTO `tbl_teilnahme` VALUES (1,3),(1,5),(1,8),(1,11),(2,1),(2,3),(2,4),(3,2),(3,3),(3,6),(4,6),(4,8),(4,11);
/*!40000 ALTER TABLE `tbl_teilnahme` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-12 19:10:43
