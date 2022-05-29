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
-- Table structure for table `checkin`
--

DROP TABLE IF EXISTS `checkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin` (
  `email` varchar(40) DEFAULT NULL,
  `flightno` varchar(40) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `traveller` int DEFAULT NULL,
  `source` varchar(40) DEFAULT NULL,
  `destination` varchar(40) DEFAULT NULL,
  `sourceTime` varchar(5) DEFAULT NULL,
  `destTime` varchar(5) DEFAULT NULL,
  `date` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkin`
--

LOCK TABLES `checkin` WRITE;
/*!40000 ALTER TABLE `checkin` DISABLE KEYS */;
INSERT INTO `checkin` VALUES ('surojeetghosh89@gmail.com','G-1024',2640,1,'pune','kolkata','17:30','19:50','2022-05-25'),('surojeetghosh89@gmail.com','G-1024',2640,1,'pune','kolkata','17:30','19:50','2022-05-25'),('surojeetghosh89@gmail.com','I-1024',3960,1,'pune','new delhi','12:30','14:50','2022-05-24'),('surojeetghosh39@gmail.com','I-1024',3960,1,'pune','new delhi','12:30','14:50','2022-05-23'),('surojeetghosh39@gmail.com','I-1024',39600,10,'pune','new delhi','12:30','14:50','2022-05-27'),('surojeetghosh89@gmail.com','I-1024',7920,2,'pune','new delhi','12:30','14:50','2022-05-25'),('surojeetghosh89@gmail.com','G-1024',13200,5,'pune','kolkata','17:30','19:50','2022-05-31'),('swayam@gmail.com','S-266',15034.8,3,'chennai','mumbai','13:00','18:00','2022-05-31'),('swayam@gmail.com','I-1024',15840,4,'pune','new delhi','12:30','14:50','2022-05-30');
/*!40000 ALTER TABLE `checkin` ENABLE KEYS */;
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
