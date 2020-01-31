-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: the9lands
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `invites`
--

DROP TABLE IF EXISTS `invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `master` varchar(45) DEFAULT NULL,
  `player` varchar(45) DEFAULT NULL,
  `camp_id` int DEFAULT NULL,
  `roll1` int DEFAULT NULL,
  `roll2` int DEFAULT NULL,
  `roll3` int DEFAULT NULL,
  `roll4` int DEFAULT NULL,
  `roll5` int DEFAULT NULL,
  `roll6` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invites`
--

LOCK TABLES `invites` WRITE;
/*!40000 ALTER TABLE `invites` DISABLE KEYS */;
INSERT INTO `invites` VALUES
	(1,NULL,'cioumpy@gmail.com',1,20,20,18,18,17,16),
	(2,NULL,'mnea85@email.com',1,24,20,18,17,16,16),
	(3,NULL,'claretta992@gmail.com',3,18,18,17,16,15,14),
	(4,NULL,'mnea85@email.com',3,18,18,17,16,15,14),
	(5,NULL,'rucor85@email.com',3,18,18,17,16,15,14),
	(6,NULL,'cioumpy@gmail.com',3,18,18,17,16,15,14),
	(7,NULL,'claretta992@gmail.com',4,NULL,NULL,NULL,NULL,NULL,NULL),
	(8,NULL,'claretta992@gmail.com',2,NULL,NULL,NULL,NULL,NULL,NULL),
	(9,NULL,'cioumpy@gmail.com',2,NULL,NULL,NULL,NULL,NULL,NULL),
	(10,NULL,'cioumpy@gmail.com',4,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `invites` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-29  0:16:08
