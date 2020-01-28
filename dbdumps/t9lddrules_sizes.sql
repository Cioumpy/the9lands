-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: t9lddrules
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
-- Table structure for table `sizes`
--

DROP TABLE IF EXISTS `sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sizes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `size` varchar(45) DEFAULT NULL,
  `atkacmod` tinyint DEFAULT NULL,
  `spatkmod` tinyint DEFAULT NULL COMMENT 'This modifier applies to the bull rush, grapple, overrun, and trip special attacks.',
  `hide` tinyint DEFAULT NULL COMMENT 'This modifier applies to the hide skill modifier.',
  `min_length` float DEFAULT NULL COMMENT 'Biped''s height, quadruped''s body length (nose to base of tail).',
  `max_length` float DEFAULT NULL COMMENT 'Biped''s height, quadruped''s body length (nose to base of tail).',
  `min_weight` float DEFAULT NULL COMMENT 'Assumes that the creature is roughly as dense as a regular animal. A creature made of stone will weigh considerably more. A gaseous creature will weigh much less.',
  `max_weight` float DEFAULT NULL COMMENT 'Assumes that the creature is roughly as dense as a regular animal. A creature made of stone will weigh considerably more. A gaseous creature will weigh much less.',
  `space` float DEFAULT NULL COMMENT 'These values are typical for creatures of the indicated size. Some exceptions exist.',
  `reach_tall` tinyint DEFAULT NULL COMMENT 'These values are typical for creatures of the indicated size. Some exceptions exist.',
  `reach_long` tinyint DEFAULT NULL COMMENT 'These values are typical for creatures of the indicated size. Some exceptions exist.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sizes`
--

LOCK TABLES `sizes` WRITE;
/*!40000 ALTER TABLE `sizes` DISABLE KEYS */;
INSERT INTO `sizes` VALUES (1,'Fine',8,-16,16,NULL,0.5,NULL,0.125,0.5,0,0),(2,'Diminutive',4,-12,12,0.5,1,0.125,1,1,0,0),(3,'Tiny',2,-8,8,1,2,1,8,2.5,0,0),(4,'Small',1,-4,4,2,4,8,60,5,5,5),(5,'Medium',0,0,0,4,8,60,500,5,5,5),(6,'Large',-1,4,-4,8,16,500,4000,10,10,5),(7,'Huge',-2,8,-8,16,32,4000,32000,15,15,10),(8,'Gargantuan',-4,12,-12,32,64,32000,250000,20,20,15),(9,'Colossal',-8,16,-16,64,NULL,250000,NULL,30,30,20);
/*!40000 ALTER TABLE `sizes` ENABLE KEYS */;
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
