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
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaigns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `startlevel` int NOT NULL DEFAULT '1',
  `gestalt` varchar(45) NOT NULL DEFAULT 'no',
  `game` varchar(45) NOT NULL DEFAULT 'dd',
  `banner` varchar(45) NOT NULL DEFAULT 'default.jpg',
  `description` longtext,
  `gm` varchar(45) DEFAULT NULL,
  `player1` varchar(45) DEFAULT NULL,
  `player2` varchar(45) DEFAULT NULL,
  `player3` varchar(45) DEFAULT NULL,
  `player4` varchar(45) DEFAULT NULL,
  `player5` varchar(45) DEFAULT NULL,
  `player6` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
INSERT INTO `campaigns` VALUES (1,'Kyralia - The Origins',6,'yes','dd','default.jpg','Be a divinity in the Lands of the Gods.','messiah@email.com','cioumpy@gmail.com','mnea85@email.com',NULL,NULL,NULL,NULL),(2,'Evergreen',1,'no','dd','greenleafs.jpg','Enjoy adventurous life in this low level campaign.','cioumpy@gmail.com','claretta992@gmail.com','cioumpy@gmail.com',NULL,NULL,NULL,NULL),(3,'The Portal of Darkness',6,'yes','pf','darkportal.jpg','Come to explore the Nine Lands, a world that connects worlds.','cioumpy@gmail.com','claretta992@gmail.com','cioumpy@gmail.com','mnea85@email.com','rucor85@email.com',NULL,NULL),(4,'Bloody Leaf',1,'no','dd','bloodyleaf.jpg','Fight in the war between vampires and elves.','cioumpy@gmail.com','claretta992@gmail.com',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-29  0:16:07
