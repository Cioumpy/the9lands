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
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class` varchar(45) DEFAULT NULL,
  `shtname` varchar(5) DEFAULT NULL,
  `hd` int DEFAULT NULL,
  `maxlvl` int NOT NULL DEFAULT '20',
  `bab` float DEFAULT NULL,
  `fort` varchar(4) DEFAULT NULL,
  `refl` varchar(4) DEFAULT NULL,
  `will` varchar(4) DEFAULT NULL,
  `alignments` varchar(45) DEFAULT NULL,
  `classskills` text,
  `skillpoints` int NOT NULL DEFAULT '2',
  `bonuslangs` varchar(45) DEFAULT NULL,
  `proficiencies` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'Barbarian','Bbn',12,20,1,'good',NULL,NULL,'ng;cg;nn;cn;ne;ce','Climb;Craft;Handle Animal;Intimidate;Jump;Listen;Ride;Survival;Swim',2,NULL,'Simple Weapon Proficiency;;Martial Weapon Proficiency;;Armor Proficiency (light);;Armor Proficiency (medium);;Shield Proficiency'),(2,'Bard','Brd',6,20,0.75,NULL,'good','good','ng;cg;nn;cn;ne;ce','Appraise;Balance;Bluff;Climb;Concentration;Craft;Decipher Script;Diplomacy;Disguise;Escape Artist;Gather Information;Hide;Jump;Knowledge;;Listen;Move Silently;Perform;Profession;Sense Motive;Sleight of Hand;Speak Language;Spellcraft;Swim;Tumble;Use Magic Device',6,NULL,NULL),(3,'Cleric','Clr',8,20,0.75,'good',NULL,'good','lg;ng;cg;ln;nn;cn;le;ne;ce','Concentration;Craft;Diplomacy;Heal;Knowledge (arcana);Knowledge (history);Knowledge (religion);Knowledge (the planes);Profession;Spellcraft',2,'Abyssal;Celestial;Infernal',NULL),(4,'Druid','Drd',8,20,0.75,'good',NULL,'good','ng;ln;nn;cn;ne','Concentration;Craft;Diplomacy;Handle Animal;Heal;Knowledge (nature);Listen;Profession;Ride;Spellcraft;Spot;Survival;Swim',2,'Sylvan',NULL),(5,'Fighter','Ftr',10,20,1,'good',NULL,NULL,'lg;ng;cg;ln;nn;cn;le;ne;ce','Climb;Craft;Handle Animal;Intimidate;Jump;Ride;Swim',2,NULL,NULL),(6,'Monk','Mnk',8,20,0.75,'good','good','good','lg;ln;le','Balance;Climb;Concentration;Craft;Diplomacy;Escape Artist;Hide;Jump;Knowledge (arcana);Knowledge (religion);Listen;Move Silently;Perform;Profession;Sense Motive;Spot;Swim;Tumble',4,NULL,NULL),(7,'Paladin','Pal',10,20,1,'good',NULL,NULL,'lg','Concentration;Craft;Diplomacy;Handle Animal;Heal;Knowledge (nobility and royalty);Knowledge (religion);Profession;Ride;Sense Motive',2,NULL,'Simple Weapon Proficiency;;Martial Weapon Proficiency;;Armor Proficiency (light);;Armor Proficiency (medium);;Armor Proficiency (heavy);;Shield Proficiency'),(8,'Ranger','Rgr',8,20,1,'good','good',NULL,'lg;ng;cg;ln;nn;cn;le;ne;ce','Climb;Concentration;Craft;Handle Animal;Heal;Hide;Jump;Knowledge (dungeoneering);Knowledge (geography);Knowledge (nature);Listen;Move Silently;Profession;Ride;Search;Spot;Survival;Swim;Use Rope',2,NULL,NULL),(9,'Rogue','Rog',6,20,0.75,NULL,'good',NULL,'lg;ng;cg;ln;nn;cn;le;ne;ce','Appraise;Balance;Bluff;Climb;Craft;Decipher Script;Diplomacy;Disable Device;Disguise;Escape Artist;Forgery;Gather Information;Hide;Intimidate;Jump;Knowledge (local);Listen;Move Silently;Open Lock;Perform;Profession;Search;Sense Motive;Sleight of Hand;Spot;Swim;Tumble;Use Magic Device;Use Rope',8,NULL,NULL),(10,'Sorcerer','Sor',4,20,0.5,NULL,NULL,'good','lg;ng;cg;ln;nn;cn;le;ne;ce','Bluff;Concentration;Craft;Knowledge (arcana);Profession;Spellcraft',2,NULL,NULL),(11,'Wizard','Wiz',4,20,0.5,NULL,NULL,'good','lg;ng;cg;ln;nn;cn;le;ne;ce','Concentration;Craft;Decipher Script;Knowledge;Profession;Spellcraft',2,'Draconic',NULL);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-29  0:16:09
