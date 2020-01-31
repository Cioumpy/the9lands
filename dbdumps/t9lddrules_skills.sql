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
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `skill` varchar(45) DEFAULT NULL,
  `ability` varchar(45) DEFAULT NULL,
  `untrained` tinyint(1) NOT NULL DEFAULT '1',
  `armorpenalty` tinyint(1) NOT NULL DEFAULT '0',
  `points` int NOT NULL DEFAULT '0',
  `ranks` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `skill_UNIQUE` (`skill`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES
	(1,'Appraise','intelligence',1,0,0,0),
	(2,'Balance','dexterity',1,1,0,0),
	(3,'Bluff','charisma',1,0,0,0),
	(4,'Climb','strength',1,1,0,0),
	(5,'Concentration','constitution',1,0,0,0),
	(6,'Craft (alchemy)','intelligence',1,0,0,0),
	(7,'Craft (armorsmithing)','intelligence',1,0,0,0),
	(8,'Craft (basketweaving)','intelligence',1,0,0,0),
	(9,'Craft (blacksmithing)','intelligence',1,0,0,0),
	(10,'Craft (bookbinding)','intelligence',1,0,0,0),
	(11,'Craft (bowmaking)','intelligence',1,0,0,0),
	(12,'Craft (calligraphy)','intelligence',1,0,0,0),
	(13,'Craft (carpentry)','intelligence',1,0,0,0),
	(14,'Craft (cobbling)','intelligence',1,0,0,0),
	(15,'Craft (gemcutting)','intelligence',1,0,0,0),
	(16,'Craft (leatherworking)','intelligence',1,0,0,0),
	(17,'Craft (locksmithing)','intelligence',1,0,0,0),
	(18,'Craft (painting)','intelligence',1,0,0,0),
	(19,'Craft (pottery)','intelligence',1,0,0,0),
	(20,'Craft (sculpting)','intelligence',1,0,0,0),
	(21,'Craft (shipmaking)','intelligence',1,0,0,0),
	(22,'Craft (stonemasonry)','intelligence',1,0,0,0),
	(23,'Craft (trapmaking)','intelligence',1,0,0,0),
	(24,'Craft (weaponsmithing)','intelligence',1,0,0,0),
	(25,'Craft (weaving)','intelligence',1,0,0,0),
	(26,'Decipher Script','intelligence',0,0,0,0),
	(27,'Diplomacy','charisma',1,0,0,0),
	(28,'Disable Device','intelligence',0,0,0,0),
	(29,'Disguise','charisma',1,0,0,0),
	(30,'Escape Artist','dexterity',1,1,0,0),
	(31,'Forgery','intelligence',1,0,0,0),
	(32,'Gather Information','charisma',1,0,0,0),
	(33,'Handle Animal','charisma',0,0,0,0),
	(34,'Heal','wisdom',1,0,0,0),
	(35,'Hide','dexterity',1,1,0,0),
	(36,'Intimidate','charisma',1,0,0,0),
	(37,'Jump','strength',1,0,0,0),
	(38,'Knowledge (arcana)','intelligence',0,0,0,0),
	(39,'Knowledge (architecture and engineering)','intelligence',0,0,0,0),
	(40,'Knowledge (dungeoneering)','intelligence',0,0,0,0),
	(41,'Knowledge (geography)','intelligence',0,0,0,0),
	(42,'Knowledge (history)','intelligence',0,0,0,0),
	(43,'Knowledge (local)','intelligence',0,0,0,0),
	(44,'Knowledge (nature)','intelligence',0,0,0,0),
	(45,'Knowledge (nobility and royalty)','intelligence',0,0,0,0),
	(46,'Knowledge (religion)','intelligence',0,0,0,0),
	(47,'Knowledge (the planes)','intelligence',0,0,0,0),
	(48,'Listen','wisdom',1,0,0,0),
	(49,'Move Silently','dexterity',1,1,0,0),
	(50,'Open Lock','dexterity',0,0,0,0),
	(51,'Perform (Act)','charisma',1,0,0,0),
	(52,'Perform (Comedy)','charisma',1,0,0,0),
	(53,'Perform (Dance)','charisma',1,0,0,0),
	(54,'Perform (Keyboard instruments)','charisma',1,0,0,0),
	(55,'Perform (Oratory)','charisma',1,0,0,0),
	(56,'Perform (Percussion instruments)','charisma',1,0,0,0),
	(57,'Perform (Sing)','charisma',1,0,0,0),
	(58,'Perform (String instruments)','charisma',1,0,0,0),
	(59,'Perform (Wind instruments)','charisma',1,0,0,0),
	(60,'Profession (apothecary)','wisdom',0,0,0,0),
	(61,'Profession (boater)','wisdom',0,0,0,0),
	(62,'Profession (bookkeeper)','wisdom',0,0,0,0),
	(63,'Profession (brewer)','wisdom',0,0,0,0),
	(64,'Profession (cook)','wisdom',0,0,0,0),
	(65,'Profession (driver)','wisdom',0,0,0,0),
	(66,'Profession (farmer)','wisdom',0,0,0,0),
	(67,'Profession (fisher)','wisdom',0,0,0,0),
	(68,'Profession (guide)','wisdom',0,0,0,0),
	(69,'Profession (herbalist)','wisdom',0,0,0,0),
	(70,'Profession (herder)','wisdom',0,0,0,0),
	(71,'Profession (hunter)','wisdom',0,0,0,0),
	(72,'Profession (innkeeper)','wisdom',0,0,0,0),
	(73,'Profession (lumberjack)','wisdom',0,0,0,0),
	(74,'Profession (miller)','wisdom',0,0,0,0),
	(75,'Profession (miner)','wisdom',0,0,0,0),
	(76,'Profession (porter)','wisdom',0,0,0,0),
	(77,'Profession (rancher)','wisdom',0,0,0,0),
	(78,'Profession (sailor)','wisdom',0,0,0,0),
	(79,'Profession (scribe)','wisdom',0,0,0,0),
	(80,'Profession (siege engineer)','wisdom',0,0,0,0),
	(81,'Profession (stablehand)','wisdom',0,0,0,0),
	(82,'Profession (tanner)','wisdom',0,0,0,0),
	(83,'Profession (teamster)','wisdom',0,0,0,0),
	(84,'Profession (woodcutter)','wisdom',0,0,0,0),
	(85,'Ride','dexterity',1,1,0,0),
	(86,'Search','intelligence',1,0,0,0),
	(87,'Sense Motive','wisdom',1,0,0,0),
	(88,'Sleight of Hand','dexterity',0,0,0,0),
	(89,'Speak Language',NULL,0,0,0,0),
	(90,'Spellcraft','intelligence',0,0,0,0),
	(91,'Spot','wisdom',1,0,0,0),
	(92,'Survival','wisdom',1,0,0,0),
	(93,'Swim','strength',1,2,0,0),
	(94,'Tumble','dexterity',0,1,0,0),
	(95,'Use Magic Device','charisma',0,0,0,0),
	(96,'Use Rope','dexterity',1,0,0,0);
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
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
