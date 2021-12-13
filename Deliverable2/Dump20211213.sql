-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agency`
--

CREATE DATABASE myDB;
USE myDB;

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agency` (
  `agencyID` varchar(30) NOT NULL,
  `name` varchar(60) NOT NULL,
  `country` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`agencyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agency_has_mission`
--

DROP TABLE IF EXISTS `agency_has_mission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agency_has_mission` (
  `agencyID` varchar(30) NOT NULL,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`agencyID`,`name`),
  KEY `fk_Agency_has_Mission_Mission1_idx` (`name`),
  KEY `fk_Agency_has_Mission_Agency1_idx` (`agencyID`),
  CONSTRAINT `fk_Agency_has_Mission_Agency1` FOREIGN KEY (`agencyID`) REFERENCES `agency` (`agencyID`),
  CONSTRAINT `fk_Agency_has_Mission_Mission1` FOREIGN KEY (`name`) REFERENCES `mission` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency_has_mission`
--

LOCK TABLES `agency_has_mission` WRITE;
/*!40000 ALTER TABLE `agency_has_mission` DISABLE KEYS */;
/*!40000 ALTER TABLE `agency_has_mission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alien`
--

DROP TABLE IF EXISTS `alien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alien` (
  `species` varchar(60) NOT NULL,
  `planet` varchar(60) NOT NULL,
  `colour` varchar(60) DEFAULT NULL,
  `intelligence` enum('Low','Medium','High') DEFAULT NULL,
  `Mission_name` varchar(60) NOT NULL,
  PRIMARY KEY (`species`),
  KEY `fk_Alien_Mission1_idx` (`Mission_name`),
  CONSTRAINT `fk_Alien_Mission1` FOREIGN KEY (`Mission_name`) REFERENCES `mission` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alien`
--

LOCK TABLES `alien` WRITE;
/*!40000 ALTER TABLE `alien` DISABLE KEYS */;
/*!40000 ALTER TABLE `alien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crew`
--

DROP TABLE IF EXISTS `crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crew` (
  `crewID` int NOT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `experience` int DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`crewID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew`
--

LOCK TABLES `crew` WRITE;
/*!40000 ALTER TABLE `crew` DISABLE KEYS */;
/*!40000 ALTER TABLE `crew` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Crew_BEFORE_INSERT` BEFORE INSERT ON `crew` FOR EACH ROW BEGIN
	IF(NEW.experience >= 50) THEN
		SIGNAL sqlstate '45000' SET message_text = 'TOO MANY YEARS. PLEASE RETIRE';
    END IF;    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Crew_BEFORE_UPDATE` BEFORE UPDATE ON `crew` FOR EACH ROW BEGIN
	IF(NEW.experience >= 50) THEN
		SIGNAL sqlstate '45000' SET message_text = 'TOO MANY YEARS. PLEASE RETIRE';
    END IF;    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ground station`
--

DROP TABLE IF EXISTS `ground station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ground station` (
  `stationID` varchar(30) NOT NULL,
  `name` varchar(60) NOT NULL,
  `location` varchar(30) DEFAULT NULL,
  `yearBuilt` int DEFAULT NULL,
  PRIMARY KEY (`stationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ground station`
--

LOCK TABLES `ground station` WRITE;
/*!40000 ALTER TABLE `ground station` DISABLE KEYS */;
/*!40000 ALTER TABLE `ground station` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Ground Station_BEFORE_INSERT` BEFORE INSERT ON `ground station` FOR EACH ROW BEGIN
	IF(NEW.yearBuilt <= 1939) THEN
		SIGNAL sqlstate '45000' SET message_text = 'Year is not valid';
    END IF;  
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Ground Station_BEFORE_UPDATE` BEFORE UPDATE ON `ground station` FOR EACH ROW BEGIN
	IF(NEW.yearBuilt <= 1939) THEN
		SIGNAL sqlstate '45000' SET message_text = 'Year is not valid';
    END IF;  
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mission`
--

DROP TABLE IF EXISTS `mission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission` (
  `name` varchar(60) NOT NULL,
  `duration` int DEFAULT NULL,
  `launchDate` datetime DEFAULT NULL,
  `type` enum('Manned','Unmanned') DEFAULT NULL,
  `visibility` tinyint DEFAULT NULL,
  `destination` varchar(60) DEFAULT NULL,
  `stopLocations` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission`
--

LOCK TABLES `mission` WRITE;
/*!40000 ALTER TABLE `mission` DISABLE KEYS */;
/*!40000 ALTER TABLE `mission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission_has_crew`
--

DROP TABLE IF EXISTS `mission_has_crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission_has_crew` (
  `name` varchar(60) NOT NULL,
  `crewID` int NOT NULL,
  `role` enum('Command Pilot','Pilot','Science Pilot','Flight Engineer','Mission Specialist','Pilot Cosmonaut','Scientist Cosmonaut') DEFAULT NULL,
  PRIMARY KEY (`name`,`crewID`),
  KEY `fk_Mission_has_Crew_Crew1_idx` (`crewID`),
  KEY `fk_Mission_has_Crew_Mission1_idx` (`name`),
  CONSTRAINT `fk_Mission_has_Crew_Crew1` FOREIGN KEY (`crewID`) REFERENCES `crew` (`crewID`),
  CONSTRAINT `fk_Mission_has_Crew_Mission1` FOREIGN KEY (`name`) REFERENCES `mission` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission_has_crew`
--

LOCK TABLES `mission_has_crew` WRITE;
/*!40000 ALTER TABLE `mission_has_crew` DISABLE KEYS */;
/*!40000 ALTER TABLE `mission_has_crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission_has_ground station`
--

DROP TABLE IF EXISTS `mission_has_ground station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission_has_ground station` (
  `name` varchar(60) NOT NULL,
  `stationID` varchar(30) NOT NULL,
  `primary` tinyint DEFAULT NULL,
  PRIMARY KEY (`name`,`stationID`),
  KEY `fk_Mission_has_Ground Station_Ground Station1_idx` (`stationID`),
  KEY `fk_Mission_has_Ground Station_Mission1_idx` (`name`),
  CONSTRAINT `fk_Mission_has_Ground Station_Ground Station1` FOREIGN KEY (`stationID`) REFERENCES `ground station` (`stationID`),
  CONSTRAINT `fk_Mission_has_Ground Station_Mission1` FOREIGN KEY (`name`) REFERENCES `mission` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission_has_ground station`
--

LOCK TABLES `mission_has_ground station` WRITE;
/*!40000 ALTER TABLE `mission_has_ground station` DISABLE KEYS */;
/*!40000 ALTER TABLE `mission_has_ground station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `private company`
--

DROP TABLE IF EXISTS `private company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `private company` (
  `companyID` varchar(30) NOT NULL,
  `name` varchar(60) NOT NULL,
  `country` varchar(30) DEFAULT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `private company`
--

LOCK TABLES `private company` WRITE;
/*!40000 ALTER TABLE `private company` DISABLE KEYS */;
/*!40000 ALTER TABLE `private company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `private company_has_mission`
--

DROP TABLE IF EXISTS `private company_has_mission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `private company_has_mission` (
  `companyID` varchar(30) NOT NULL,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`companyID`,`name`),
  KEY `fk_Private Company_has_Mission_Mission1_idx` (`name`),
  KEY `fk_Private Company_has_Mission_Private Company1_idx` (`companyID`),
  CONSTRAINT `fk_Private Company_has_Mission_Mission1` FOREIGN KEY (`name`) REFERENCES `mission` (`name`),
  CONSTRAINT `fk_Private Company_has_Mission_Private Company1` FOREIGN KEY (`companyID`) REFERENCES `private company` (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `private company_has_mission`
--

LOCK TABLES `private company_has_mission` WRITE;
/*!40000 ALTER TABLE `private company_has_mission` DISABLE KEYS */;
/*!40000 ALTER TABLE `private company_has_mission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-13 18:07:19
