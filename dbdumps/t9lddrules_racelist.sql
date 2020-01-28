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
-- Table structure for table `racelist`
--

DROP TABLE IF EXISTS `racelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `racelist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `race` varchar(45) DEFAULT NULL,
  `strength` int NOT NULL DEFAULT '0',
  `dexterity` int NOT NULL DEFAULT '0',
  `constitution` int NOT NULL DEFAULT '0',
  `intelligence` int NOT NULL DEFAULT '0',
  `wisdom` int NOT NULL DEFAULT '0',
  `charisma` int NOT NULL DEFAULT '0',
  `size` varchar(45) NOT NULL DEFAULT 'Medium',
  `speed` int NOT NULL DEFAULT '30',
  `encumbered` int NOT NULL DEFAULT '20',
  `favclass` varchar(45) NOT NULL DEFAULT 'Any',
  `autolangs` varchar(45) NOT NULL DEFAULT 'Common',
  `bonuslangs` varchar(45) DEFAULT NULL,
  `skillpoints` int NOT NULL DEFAULT '0',
  `skillbonus` longtext,
  `bonusfeats` smallint NOT NULL DEFAULT '0',
  `proficiencies` longtext,
  `weapfamil` varchar(45) DEFAULT NULL,
  `darkvision` int DEFAULT NULL,
  `lowlightvision` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `racelist`
--

LOCK TABLES `racelist` WRITE;
/*!40000 ALTER TABLE `racelist` DISABLE KEYS */;
INSERT INTO `racelist` VALUES (1,'Human',0,0,0,0,0,0,'Medium',30,20,'Any','Common','Any',1,NULL,1,NULL,NULL,NULL,NULL),(2,'Dwarf',0,0,2,0,0,-2,'Medium',20,20,'Fighter','Common;Dwarven','Giant;Gnome;Goblin;Orc;Terran;Undercommon',0,NULL,0,NULL,'dwarwen',60,NULL),(3,'Elf',0,2,-2,0,0,0,'Medium',30,20,'Wizard','Common;Elven','Draconic;Gnoll;Gnome;Goblin;Orc;Sylvan',0,'Listen;2;Search;2;Spot;2',0,'Martial Weapon Proficiency (longsword);;Martial Weapon Proficiency (rapier);;Martial Weapon Proficiency (longbow);;Martial Weapon Proficiency (shortbow)','elven',NULL,2),(4,'Gnome',-2,0,2,0,0,0,'Small',20,15,'Bard','Common;Gnome','Draconic;Dwarven;Elven;Giant;Goblin;Orc',0,'Craft (alchemy);2;Listen;2',0,NULL,'gnome',NULL,2),(5,'Half-Elf',0,0,0,0,0,0,'Medium',30,20,'Any','Common;Elven','Any',0,'Listen;1;Search;1;Spot;1;Diplomacy;2;Gather Informations;2',0,NULL,NULL,NULL,2),(6,'Half-Orc',2,0,0,-2,0,-2,'Medium',30,20,'Barbarian','Common;Orc','Draconic;Giant;Gnoll;Goblin;Abyssal',0,NULL,0,NULL,NULL,60,NULL),(7,'Halfling',-2,2,0,0,0,0,'Small',20,15,'Rogue','Common;Halfling','Dwarven;Elven;Gnome;Goblin;Orc',0,'Climb;2;Jump;2;Listen;2;Move Silently;2;',0,NULL,'halfling',NULL,NULL);
/*!40000 ALTER TABLE `racelist` ENABLE KEYS */;
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
