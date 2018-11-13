CREATE DATABASE  IF NOT EXISTS `the9lands` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `the9lands`;
-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: the9lands
-- ------------------------------------------------------
-- Server version	5.7.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('ayasha','stese82','Clara','Marasa\'','claretta992@gmail.com'),('cioumpy','syse85','Stefano','Sellone','cioumpy@gmail.com'),('mnea','masa89','Paolo','Carella','mnea85@email.com'),('roger','macor83','Ruggero','Cortini','rucor85@email.com');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign` varchar(45) DEFAULT NULL,
  `startlevel` int(11) NOT NULL DEFAULT '1',
  `gestalt` varchar(45) NOT NULL DEFAULT 'no',
  `game` varchar(45) NOT NULL DEFAULT 'dd',
  `campdesc` longtext,
  `player1` varchar(45) DEFAULT NULL,
  `player2` varchar(45) DEFAULT NULL,
  `player3` varchar(45) DEFAULT NULL,
  `player4` varchar(45) DEFAULT NULL,
  `player5` varchar(45) DEFAULT NULL,
  `player6` varchar(45) DEFAULT NULL,
  `roll1` int(11) DEFAULT NULL,
  `roll2` int(11) DEFAULT NULL,
  `roll3` int(11) DEFAULT NULL,
  `roll4` int(11) DEFAULT NULL,
  `roll5` int(11) DEFAULT NULL,
  `roll6` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
INSERT INTO `campaigns` VALUES (1,'Kyralia - The Origins',6,'yes','dd',NULL,'cioumpy','ayasha',NULL,NULL,NULL,NULL,20,20,18,18,17,16),(2,'Evergreen',1,'no','dd',NULL,'ayasha','cioumpy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'The Portal of Darkness',6,'yes','pf','Come to explore the Nine Lands, a world that connects worlds.','ayasha','cioumpy',NULL,NULL,NULL,NULL,18,18,17,16,15,14),(4,'Bloody Leaf',1,'no','dd',NULL,'ayasha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `game` varchar(5) NOT NULL DEFAULT 'dd',
  `campaign` varchar(45) DEFAULT NULL,
  `charname` varchar(45) NOT NULL DEFAULT 'Hero McLight',
  `avatar` varchar(45) NOT NULL DEFAULT 'testavatar.jpg',
  `race` varchar(45) NOT NULL DEFAULT 'Human',
  `alignment` varchar(45) NOT NULL DEFAULT 'True Neutral',
  `currhp` int(11) NOT NULL DEFAULT '0',
  `currxp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invites`
--

DROP TABLE IF EXISTS `invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `campaign` int(11) DEFAULT NULL,
  `roll1` int(11) DEFAULT NULL,
  `roll2` int(11) DEFAULT NULL,
  `roll3` int(11) DEFAULT NULL,
  `roll4` int(11) DEFAULT NULL,
  `roll5` int(11) DEFAULT NULL,
  `roll6` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invites`
--

LOCK TABLES `invites` WRITE;
/*!40000 ALTER TABLE `invites` DISABLE KEYS */;
INSERT INTO `invites` VALUES (1,'cioumpy',1,20,20,18,18,17,16);
/*!40000 ALTER TABLE `invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progrchar0`
--

DROP TABLE IF EXISTS `progrchar0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progrchar0` (
  `level` int(11) NOT NULL AUTO_INCREMENT,
  `class1` varchar(45) NOT NULL DEFAULT 'Fighter',
  `class2` varchar(45) DEFAULT NULL,
  `bab` float DEFAULT NULL,
  `hp` int(11) DEFAULT NULL,
  `strength` varchar(45) DEFAULT NULL,
  `dexterity` varchar(45) DEFAULT NULL,
  `constitution` varchar(45) DEFAULT NULL,
  `intelligence` varchar(45) DEFAULT NULL,
  `wisdom` varchar(45) DEFAULT NULL,
  `charisma` varchar(45) DEFAULT NULL,
  `ap` varchar(45) DEFAULT NULL,
  `feat` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`level`),
  UNIQUE KEY `level_UNIQUE` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progrchar0`
--

LOCK TABLES `progrchar0` WRITE;
/*!40000 ALTER TABLE `progrchar0` DISABLE KEYS */;
/*!40000 ALTER TABLE `progrchar0` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-17  4:24:48
