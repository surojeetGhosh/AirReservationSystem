-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `fname` varchar(40) DEFAULT NULL,
  `flightno` varchar(6) DEFAULT NULL,
  `source` varchar(40) DEFAULT NULL,
  `dest` varchar(40) DEFAULT NULL,
  `sourceTime` varchar(5) DEFAULT NULL,
  `destTime` varchar(5) DEFAULT NULL,
  `cost` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES ('indigo','G-1024','pune','kolkata','17:30','19:50',2400),('Vistara','V-1024','pune','kolkata','14:30','16:50',3600),('Indigo','I-1024','pune','new delhi','12:30','14:50',3600),('indigo','I-074','mumbai','new delhi','04:00','06:20',4869),('spicejet','S-455','mumbai','new delhi','12:00','2:30',6569),('vistara','V-071','new delhi','mumbai','8:00','10:30',3869),('indigo','I-955','new delhi','mumbai','14:00','4:30',6165),('vistara','V-455','mumbai','kolkata','10:00','2:30',7879),('spicejet','S-566','mumbai','kolkata','11:00','15:00',4777),('indigo','I-066','kolkata','mumbai','4:00','18:00',5454),('spicejet','S-166','kolkata','mumbai','14:00','20:00',6556),('vistara','V-286','mumbai','chennai','12:00','2:20',4556),('indigo','I-246','mumbai','chennai','16:00','19:20',3556),('Vistara','V-166','chennai','mumbai','8:00','11:00',2556),('spicejet','S-266','chennai','mumbai','13:00','18:00',4556),('indigo','I-026','chennai','kolkata','11:00','13:30',4556),('spicejet','S-126','chennai','kolkata','19:00','21:30',3556),('spicejet','S-326','chennai','new delhi','19:00','21:30',3556),('Vistara','V-426','chennai','new delhi','10:00','12:30',4056),('Vistara','V-426','new delhi','chennai','11:00','14:30',5056),('indigo','I-890','new delhi','kolkata','08:00','10:30',2056);
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-29 19:41:00
