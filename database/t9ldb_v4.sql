-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: the9lands
-- ------------------------------------------------------
-- Server version	5.7.25

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'ayasha','stese82','Clara','Marasa\'','claretta992@gmail.com'),(2,'cioumpy','syse85','Stefano','Sellone','cioumpy@gmail.com'),(3,'mnea','masa89','Paolo','Carella','mnea85@email.com'),(4,'roger','macor83','Ruggero','Cortini','rucor85@email.com');
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
  `banner` varchar(45) NOT NULL DEFAULT 'default.jpg',
  `campdesc` longtext,
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
INSERT INTO `campaigns` VALUES (1,'Kyralia - The Origins',6,'yes','dd','default.jpg',NULL,'messiah','cioumpy','mnea',NULL,NULL,NULL,NULL),(2,'Evergreen',1,'no','dd','greenleafs.jpg',NULL,NULL,'ayasha','cioumpy',NULL,NULL,NULL,NULL),(3,'The Portal of Darkness',6,'yes','pf','darkportal.jpg','<p>Come to explore the Nine Lands, a world that connects worlds.</p>',NULL,'ayasha','cioumpy','mnea','roger',NULL,NULL),(4,'Bloody Leaf',1,'no','dd','bloodyleaf.jpg',NULL,'cioumpy','ayasha',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game` varchar(5) NOT NULL DEFAULT 'dd',
  `campaign` varchar(45) DEFAULT NULL,
  `charname` varchar(45) NOT NULL DEFAULT 'Hero McLight',
  `playername` varchar(45) DEFAULT NULL,
  `avatar` varchar(45) NOT NULL DEFAULT 'testavatar.jpg',
  `race` varchar(45) NOT NULL DEFAULT 'Human',
  `gender` varchar(45) NOT NULL DEFAULT 'Male',
  `alignment` varchar(45) NOT NULL DEFAULT 'True Neutral',
  `currhp` int(11) NOT NULL DEFAULT '0',
  `currxp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,'dd','Kyralia - The Origins','Clawd Fangroar','cioumpy','clawd.jpg','Hrdas','Male','Chaotic Good',5,512);
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
  `camp` int(11) DEFAULT NULL,
  `roll1` int(11) DEFAULT NULL,
  `roll2` int(11) DEFAULT NULL,
  `roll3` int(11) DEFAULT NULL,
  `roll4` int(11) DEFAULT NULL,
  `roll5` int(11) DEFAULT NULL,
  `roll6` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invites`
--

LOCK TABLES `invites` WRITE;
/*!40000 ALTER TABLE `invites` DISABLE KEYS */;
INSERT INTO `invites` VALUES (1,'cioumpy',1,20,20,18,18,17,16),(2,'mnea',1,24,20,18,17,16,16),(3,'ayasha',3,18,18,17,16,15,14),(4,'mnea',3,18,18,17,16,15,14),(5,'roger',3,18,18,17,16,15,14),(6,'cioumpy',3,18,18,17,16,15,14),(7,'ayasha',4,NULL,NULL,NULL,NULL,NULL,NULL),(8,'ayasha',2,NULL,NULL,NULL,NULL,NULL,NULL),(9,'cioumpy',2,NULL,NULL,NULL,NULL,NULL,NULL),(10,'cioumpy',4,NULL,NULL,NULL,NULL,NULL,NULL);
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

--
-- Table structure for table `progrchar1`
--

DROP TABLE IF EXISTS `progrchar1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progrchar1` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progrchar1`
--

LOCK TABLES `progrchar1` WRITE;
/*!40000 ALTER TABLE `progrchar1` DISABLE KEYS */;
INSERT INTO `progrchar1` VALUES (1,'Fighter','Rogue',1,10,'22','24','18','16','20','16',NULL,'Weapon Focus (claw)');
/*!40000 ALTER TABLE `progrchar1` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-14 19:05:14
-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: t9lddrules
-- ------------------------------------------------------
-- Server version	5.7.25

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
-- Table structure for table `abilities`
--

DROP TABLE IF EXISTS `abilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ability` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `shtname` varchar(3) NOT NULL,
  `score` varchar(45) DEFAULT NULL,
  `modifier` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`ability`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abilities`
--

LOCK TABLES `abilities` WRITE;
/*!40000 ALTER TABLE `abilities` DISABLE KEYS */;
INSERT INTO `abilities` VALUES (1,'strength','Strength','STR',NULL,NULL),(2,'dexterity','Dexterity','DEX',NULL,NULL),(3,'constitution','Constitution','CON',NULL,NULL),(4,'intelligence','Intelligence','INT',NULL,NULL),(5,'wisdom','Wisdom','WIS',NULL,NULL),(6,'charisma','Charisma','CHA',NULL,NULL);
/*!40000 ALTER TABLE `abilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alignments`
--

DROP TABLE IF EXISTS `alignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alignment` varchar(45) DEFAULT NULL,
  `shtname` varchar(2) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `desc` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alignments`
--

LOCK TABLES `alignments` WRITE;
/*!40000 ALTER TABLE `alignments` DISABLE KEYS */;
INSERT INTO `alignments` VALUES (1,'Lawful Good','lg','&quot;The Crusader&quot;','A lawful good character acts as a good person is expected or required to act. She combines a commitment to oppose evil with the discipline to fight relentlessly. She tells the truth, keeps her word, helps those in need, and speaks out against injustice. A lawful good character hates to see the guilty go unpunished. Alhandra, a paladin who fights evil without mercy and protects the innocent without hesitation, is lawful good.<br><br>Lawful good is the best alignment you can be because it combines honor and compassion.'),(2,'Neutral Good','ng','&quot;The Benefactor&quot;','A neutral good character does the best that a good person can do. He is devoted to helping others. He works with kings and magistrates but does not feel beholden to them. Jozan, a cleric who helps others according to their needs, is neutral good.<br><br>Neutral good is the best alignment you can be because it means doing what is good without bias for or against order.'),(3,'Chaotic Good','cg','&quot;The Rebel&quot;','A chaotic good character acts as his conscience directs him with little regard for what others expect of him. He makes his own way, but he&#39;s kind and benevolent. He believes in goodness and right but has little use for laws and regulations. He hates it when people try to intimidate others and tell them what to do. He follows his own moral compass, which, although good, may not agree with that of society. Soverliss, a ranger who waylays the evil baron&#39;s tax collectors, is chaotic good.<br><br>Chaotic good is the best alignment you can be because it combines a good heart with a free spirit.'),(4,'Lawful Neutral','ln','&quot;The Judge&quot;','A lawful neutral character acts as law, tradition, or a personal code directs her. Order and organization are paramount to her. She may believe in personal order and live by a code or standard, or she may believe in order for all and favor a strong, organized government. Ember, a monk who follows her discipline without being swayed either by the demands of those in need or by the temptations of evil, is lawful neutral.<br><br>Lawful neutral is the best alignment you can be because it means you are reliable and honorable without being a zealot.'),(5,'True Neutral','nn','&quot;The Undecided&quot;','A neutral character does what seems to be a good idea. She doesn&#39;t feel strongly one way or the other when it comes to good vs. evil or law vs. chaos. Most neutral characters exhibit a lack of conviction or bias rather than a commitment to neutrality. Such a character thinks of good as better than evil &#8212; after all, she would rather have good neighbors and rulers than evil ones. Still, she&#39;s not personally committed to upholding good in any abstract or universal way. Mialee, a wizard who devotes herself to her art and is bored by the semantics of moral debate, is neutral.<br><br> Some neutral characters, on the other hand, commit themselves philosophically to neutrality. They see good, evil, law, and chaos as prejudices and dangerous extremes. They advocate the middle way of neutrality as the best, most balanced road in the long run.<br><br>Neutral is the best alignment you can be because it means you act naturally, without prejudice or compulsion.'),(6,'Chaotic Neutral','cn','&quot;The Free Spirit&quot;','A chaotic neutral character follows his whims. He is an individualist first and last. He values his own liberty but doesn&#39;t strive to protect others&#39; freedom. He avoids authority, resents restrictions, and challenges traditions. A chaotic neutral character does not intentionally disrupt organizations as part of a campaign of anarchy. To do so, he would have to be motivated either by good (and a desire to liberate others) or evil (and a desire to make those different from himself suffer). A chaotic neutral character may be unpredictable, but his behavior is not totally random. He is not as likely to jump off a bridge as to cross it. Gimble, a bard who wanders the land living by his wits, is chaotic neutral.<br><br>Chaotic neutral is the best alignment you can be because it represents true freedom from both society&#39;s restrictions and a dogooder&#39;s zeal.'),(7,'Lawful Evil','le','&quot;The Dominator&quot;','A lawful evil villain methodically takes what he wants within the limits of his code of conduct without regard for whom it hurts. He cares about tradition, loyalty, and order but not about freedom, dignity, or life. He plays by the rules but without mercy or compassion. He is comfortable in a hierarchy and would like to rule, but is willing to serve. He condemns others not according to their actions but according to race, religion, homeland, or social rank. He is loath to break laws or promises. This reluctance comes partly from his nature and partly because he depends on order to protect himself from those who oppose him on moral grounds.<br><br>Some lawful evil villains have particular taboos, such as not killing in cold blood (but having underlings do it) or not letting children come to harm (if it can be helped). They imagine that these compunctions put them above unprincipled villains. The scheming baron who expands his power and exploits his people is lawful evil.<br><br>Some lawful evil people and creatures commit themselves to evil with a zeal like that of a crusader committed to good. Beyond being willing to hurt others for their own ends, they take pleasure in spreading evil as an end unto itself. They may also see doing evil as part of a duty to an evil deity or master.<br><br>Lawful evil is sometimes called &quot;diabolical&quot;, because devils are the epitome of lawful evil.<br><br>Lawful evil is the most dangerous alignment because it represents methodical, intentional, and frequently successful evil.'),(8,'Neutral Evil','ne','&quot;The Malefactor&quot;','A neutral evil villain does whatever she can get away with. She is out for herself, pure and simple. She sheds no tears for those she kills, whether for profit, sport, or convenience. She has no love of order and holds no illusion that following laws, traditions, or codes would make her any better or more noble. On the other hand, she doesn&#39;t have the restless nature or love of conflict that a chaotic evil villain has. The criminal who robs and murders to get what she wants is neutral evil.<br><br>Some neutral evil villains hold up evil as an ideal, committing evil for its own sake. Most often, such villains are devoted to evil deities or secret societies.<br><br>Neutral evil is the most dangerous alignment because it represents pure evil without honor and without variation.'),(9,'Chaotic Evil','ce','&quot;The Destroyer&quot;','A chaotic evil character does whatever his greed, hatred, and lust for destruction drive him to do. He is hot-tempered, vicious, arbitrarily violent, and unpredictable. If he is simply out for whatever he can get, he is ruthless and brutal. If he is committed to the spread of evil and chaos, he is even worse. Thankfully, his plans are haphazard, and any groups he joins or forms are poorly organized.<br><br>Typically, chaotic evil people can be made to work together only by force, and their leader lasts only as long as he can thwart attempts to topple or assassinate him. The demented sorcerer pursuing mad schemes of vengeance and havoc is chaotic evil.<br><br>Chaotic evil is sometimes called &quot;demonic&quot; because demons are the epitome of chaotic evil.<br><br>Chaotic evil is the most dangerous alignment because it represents the destruction not only of beauty and life but also of the order on which beauty and life depend.');
/*!40000 ALTER TABLE `alignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(45) DEFAULT NULL,
  `shtname` varchar(5) DEFAULT NULL,
  `hd` int(2) DEFAULT NULL,
  `maxlvl` int(2) NOT NULL DEFAULT '20',
  `bab` float DEFAULT NULL,
  `fort` varchar(4) DEFAULT NULL,
  `refl` varchar(4) DEFAULT NULL,
  `will` varchar(4) DEFAULT NULL,
  `alignments` varchar(45) DEFAULT NULL,
  `classskills` text,
  `skillpoints` int(2) NOT NULL DEFAULT '2',
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
INSERT INTO `classes` VALUES (1,'Barbarian','Bbn',12,20,1,'good',NULL,NULL,'ng;cg;nn;cn;ne;ce','Climb;Craft;Handle Animal;Intimidate;Jump;Listen;Ride;Survival;Swim',2,NULL,'Simple Weapon Proficiency;;Martial Weapon Proficiency;;Armor Proficiency (light);;Armor Proficiency (medium);;Shield Proficiency (basic)'),(2,'Bard','Brd',6,20,0.75,NULL,'good','good','ng;cg;nn;cn;ne;ce','Appraise;Balance;Bluff;Climb;Concentration;Craft;Decipher Script;Diplomacy;Disguise;Escape Artist;Gather Information;Hide;Jump;Knowledge;;Listen;Move Silently;Perform;Profession;Sense Motive;Sleight of Hand;Speak Language;Spellcraft;Swim;Tumble;Use Magic Device',6,NULL,NULL),(3,'Cleric','Clr',8,20,0.75,'good',NULL,'good','lg;ng;cg;ln;nn;cn;le;ne;ce','Concentration;Craft;Diplomacy;Heal;Knowledge (arcana);Knowledge (history);Knowledge (religion);Knowledge (the planes);Profession;Spellcraft',2,'Abyssal;Celestial;Infernal',NULL),(4,'Druid','Drd',8,20,0.75,'good',NULL,'good','ng;ln;nn;cn;ne','Concentration;Craft;Diplomacy;Handle Animal;Heal;Knowledge (nature);Listen;Profession;Ride;Spellcraft;Spot;Survival;Swim',2,'Sylvan',NULL),(5,'Fighter','Ftr',10,20,1,'good',NULL,NULL,'lg;ng;cg;ln;nn;cn;le;ne;ce','Climb;Craft;Handle Animal;Intimidate;Jump;Ride;Swim',2,NULL,NULL),(6,'Monk','Mnk',8,20,0.75,'good','good','good','lg;ln;le','Balance;Climb;Concentration;Craft;Diplomacy;Escape Artist;Hide;Jump;Knowledge (arcana);Knowledge (religion);Listen;Move Silently;Perform;Profession;Sense Motive;Spot;Swim;Tumble',4,NULL,NULL),(7,'Paladin','Pal',10,20,1,'good',NULL,NULL,'lg','Concentration;Craft;Diplomacy;Handle Animal;Heal;Knowledge (nobility and royalty);Knowledge (religion);Profession;Ride;Sense Motive',2,NULL,NULL),(8,'Ranger','Rgr',8,20,1,'good','good',NULL,'lg;ng;cg;ln;nn;cn;le;ne;ce','Climb;Concentration;Craft;Handle Animal;Heal;Hide;Jump;Knowledge (dungeoneering);Knowledge (geography);Knowledge (nature);Listen;Move Silently;Profession;Ride;Search;Spot;Survival;Swim;Use Rope',2,NULL,NULL),(9,'Rogue','Rog',6,20,0.75,NULL,'good',NULL,'lg;ng;cg;ln;nn;cn;le;ne;ce','Appraise;Balance;Bluff;Climb;Craft;Decipher Script;Diplomacy;Disable Device;Disguise;Escape Artist;Forgery;Gather Information;Hide;Intimidate;Jump;Knowledge (local);Listen;Move Silently;Open Lock;Perform;Profession;Search;Sense Motive;Sleight of Hand;Spot;Swim;Tumble;Use Magic Device;Use Rope',8,NULL,NULL),(10,'Sorcerer','Sor',4,20,0.5,NULL,NULL,'good','lg;ng;cg;ln;nn;cn;le;ne;ce','Bluff;Concentration;Craft;Knowledge (arcana);Profession;Spellcraft',2,NULL,NULL),(11,'Wizard','Wiz',4,20,0.5,NULL,NULL,'good','lg;ng;cg;ln;nn;cn;le;ne;ce','Concentration;Craft;Decipher Script;Knowledge;Profession;Spellcraft',2,'Draconic',NULL);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classesdesc`
--

DROP TABLE IF EXISTS `classesdesc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classesdesc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(45) DEFAULT NULL,
  `shtdesc` mediumtext,
  `manual` varchar(45) DEFAULT NULL,
  `page` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `intro` longtext,
  `Adventures` longtext,
  `Characteristics` longtext,
  `Alignment` longtext,
  `Religion` longtext,
  `Background` longtext,
  `Races` longtext,
  `Other_Classes` longtext,
  `Role` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classesdesc`
--

LOCK TABLES `classesdesc` WRITE;
/*!40000 ALTER TABLE `classesdesc` DISABLE KEYS */;
INSERT INTO `classesdesc` VALUES (1,'Barbarian','A ferocious warrior who uses fury and instinct to bring down foes.','Player&#39;s Handbook v3.5','24','ddBarbarian.png','From the frozen wastes of the north and the hellish jungles of the south come brave, even reckless, warriors. Civilized people call them barbarians or berserkers and suspect them of mayhem, impiety, and atrocities. These &quot;barbarians&quot;, however, have proven their mettle and their value to those who would be their allies. To enemies who underestimated them, they have proved their cunning, resourcefulness, persistence, and mercilessness.','Adventuring is the best chance barbarians have of finding a place in a civilized society. They&#39;re not well suited to the monotony of guard duty or other mundane tasks. Barbarians also have no trouble with the dangers, the uncertainties, and the wandering that adventuring involves. They may adventure to defeat hated enemies. They have a noted distaste for that which they consider unnatural, including undead, demons, and devils.','The barbarian is an excellent warrior. Where the fighter&#39;s skill in combat comes from training and discipline, however, the barbarian has a powerful rage. While in this berserk fury, he becomes stronger and tougher, better able to defeat his foes and withstand their attacks. These rages leave him winded, and he has the energy for only a few such spectacular displays per day, but those few rages are usually sufficient. He is at home in the wild, and he runs at great speed.','Barbarians are never lawful. They may be honorable, but at heart they are wild. This wildness is their strength, and it could not live in a lawful soul. At best, barbarians of chaotic alignment are free and expressive. At worst, they are thoughtlessly destructive.','Some barbarians distrust established religions and prefer an intuitive, natural relationship to the cosmos over formal worship. Others devote themselves to powerful deities, such as Kord (god of strength), Obad-Hai (god of nature), or Erythnul (god of slaughter). A barbarian is capable of fierce devotion to his god.','Barbarians come from uncivilized lands or from barbaric tribes on the outskirts of civilization. A barbarian adventurer may have been lured to the settled lands by the promise of riches, may have escaped after being captured in his homeland and sold into &quot;civilized&quot; slavery, may have been recruited as a soldier, or may have been driven out of his homeland by invaders. Barbarians share no bond with each other unless they come from the same tribe or land. In fact, they think of themselves not as barbarians but as warriors.','Human barbarians come from the distant wild lands on the edge of civilization. Most half-orc barbarians lived among orcs before abandoning them for human lands. Dwarf barbarians are rare, usually hailing from dwarven kingdoms that have fallen into barbarism as a result of recurrent war with goblinoids, orcs, and giants. Barbarians of other races are very rare. Among the brutal humanoids, barbarians are more common than fighters. Orcs and ogres are especially likely to be barbarians.','As people of the wild, barbarians are most comfortable in the company of rangers, druids, and clerics of nature deities, such as Obad-Hai or Ehlonna. Many barbarians admire the talents and spontaneity of bards, and some are enthusiastic lovers of music. Barbarians don&#39;t trust that which they don&#39;t understand, and that includes wizardry, which they call &quot;book magic&quot;. They find sorcerers more understandable than wizards, but maybe that&#39;s just because sorcerers tend to be more charismatic. Monks, with their studied, practiced, deliberate approach to combat, sometimes have a hard time seeing eye to eye with barbarians, but members of these classes aren&#39;t necessarily hostile to each other. Barbarians have no special attitudes toward fighters, paladins, clerics, or rogues.','A barbarian&#39;s typical primary role in a group of adventurers is as a front-line combat specialist. No other character can match his sheer toughness. He can also serve as a good scout, thanks to his speed, skill selection, and trap sense.'),(2,'Bard','A performer whose music works magic &#8212; a wanderer, a taleteller, and a jack-of-all trades.','Player&#39;s Handbook v3.5','26','ddBard.png','It is said that music has a special magic, and the bard proves that saying true. Wandering across the land, gathering lore, telling stories, working magic with his music, and living on the gratitude of his audience &#8212; such is the life of a bard. When chance or opportunity draws them into a conflict, bards serve as diplomats, negotiators, messengers, scouts, and spies. A bard&#39;s magic comes from the heart. If his heart is good, a bard brings hope and courage to the downtrodden and uses his tricks, music, and magic to thwart the schemes of evildoers. If the nobles of the land are corrupt, the good bard is an enemy of the state, cunningly evading capture and raising the spirits of the oppressed. But music can spring from an evil heart as well. Evil bards forego blatant violence in favor of manipulation, holding sway over the hearts and minds of others and taking what enraptured audiences &quot;willingly&quot; give.','Bards see adventures as opportunities to learn. They practice their many skills and abilities, and they especially relish the opportunity to enter a long-forgotten tomb, to discover ancient works of magic, to decipher old tomes, to travel to strange places, to encounter exotic creatures, and to learn new songs and stories. Bards love to accompany heroes (and villains), joining their entourage to witness their deeds firsthand &#8212; a bard who can tell a marvelous story from personal experience earns renown among his fellows. Indeed, after telling so many stories about heroes doing mighty deeds, many bards take these themes to heart and assume heroic roles themselves.','A bard brings forth magic from his soul, not from a book. He can cast only a small number of spells, but he can do so without selecting or preparing them in advance. His magic emphasizes charms and illusions over the more dramatic evocation spells that wizards and sorcerers often use. In addition to spells, a bard works magic with his music and poetry. He can encourage allies, hold his audiences rapt, and counter magical effects that rely on speech or sound. Bards have some of the skills that rogues have, although bards they are not as focused on skill mastery as rogues are. A bard listens to stories as well as telling them, of course, so he has a vast knowledge of local events and noteworthy items.','Bards are wanderers, guided by whim and intuition rather than by tradition or law. The spontaneous talent, magic, and lifestyle of the bard are incompatible with a lawful alignment.','Bards revere Fharlanghn (god of roads). They sometimes camp near his wayside shrines, hoping to earn some coin from the travelers who stop to leave offerings for the god. Many bards, even those who are not elves, worship Corellon Larethian, god of elves and patron of poetry and music. Many good bards are partial to Pelor (god of the sun), believing that he watches over them in their travels. Bards given to chaos and occasional larceny favor Olidammara (god of thieves). Those who have turned to evil ways are known to worship Erythnul (the god of slaughter), though few will admit to it. In any event, bards spend so much time on the road that, while they may be devoted to a deity, they are rarely devoted to any particular temple.','An apprentice bard learns his skills from a single experienced bard, whom he follows and serves until he is ready to strike out on his own. Many bards were once young runaways or orphans, befriended by wandering bards who became their mentors. Since bards occasionally congregate in informal &quot;colleges&quot;, the apprentice bard may meet many of the more prominent bards in the area. Still, the bard has no strong allegiance to bards as a whole. In fact, some bards are highly competitive with other bards, jealous of their reputations and defensive about their territories.','Bards are commonly human, gnome, elf, or half-elf. Humans take well to the wandering life and adapt easily to new lands and customs. Gnomes have a sense of humor and trickery that lends itself to a bardic career. Elves are talented in music and magic, so the career of the bard comes naturally to them. A bard&#39;s wandering ways suit many half-elves, who often feel like strangers even when at home. Half-orcs, even those raised among humans, find themselves ill suited to the demands of a bard&#39;s career. There are no bardic traditions among dwarves, or halflings, though occasional individuals of these races find teachers to train them in the ways of the bard. Bards are exceedingly rare among the savage humanoids, except among centaurs. Centaur bards sometimes train the children of humans or other humanoids.','A bard works well with companions of other classes. He often serves as the spokesman of the party, using his social skills for the party&#39;s benefit. In a party without a wizard or sorcerer, the bard contributes his magic. In a party without a rogue, he uses his skills. A bard is curious about the ways of more focused or dedicated adventurers, so he often tries to pick up pointers from fighters, sorcerers, and rogues.','The bard is perhaps the ultimate generalist. In most adventuring groups, he works best in a supporting role. He can&#39;t usually match the stealth of the ranger or the rogue, the spellcasting power of the cleric or the wizard, or the combat prowess of the barbarian or the fighter. However, he makes all the other characters better at what they do, and he can often fill in for another character when needed. For a typical group of four characters, the bard is perhaps the most useful fifth character to consider adding, and he can make a great team leader.'),(3,'Cleric','A master of divine magic and a capable warrior as well.','Player&#39;s Handbook v3.5','30','ddCleric.png','The handiwork of the gods is everywhere&#8212;in places of natural beauty, in mighty crusades, in soaring temples, and in the hearts of worshipers. Like people, gods run the gamut from benevolent to malicious, reserved to intrusive, simple to inscrutable. The gods, however, work mostly through intermediaries&#8212;their clerics. Good clerics heal, protect, and avenge. Evil clerics pillage, destroy, and sabotage. A cleric uses the power of his god to make his god&#39;s will manifest. And if a cleric uses his god&#39;s power to improve his own lot, that&#39;s to be expected, too.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Druid','One who draws energy from the natural world to cast divine spells and gain strange magical powers.','Player&#39;s Handbook v3.5','33','ddDruid.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'Fighter','A warrior with exceptional combat capability and unequaled skill with weapons.','Player&#39;s Handbook v3.5','37','ddFighter.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Monk','A martial artist whose unarmed strikes hit fast and hard &#8212; a master of exotic powers.','Player&#39;s Handbook v3.5','39','ddMonk.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'Paladin','A champion of justice and destroyer of evil, protected and strengthened by an array of divine powers.','Player&#39;s Handbook v3.5','42','ddPaladin.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'Ranger','A cunning, skilled warrior of the wilderness. ','Player&#39;s Handbook v3.5','46','ddRanger.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'Rogue','A tricky, skillful scout and spy who wins the battle by stealth rather than brute force.','Player&#39;s Handbook v3.5','49','ddRogue.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'Sorcerer','A spellcaster with inborn magical ability.','Player&#39;s Handbook v3.5','51','ddSorcerer.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'Wizard','A potent spellcaster schooled in the arcane arts.','Player&#39;s Handbook v3.5','55','ddWizard.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `classesdesc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feats`
--

DROP TABLE IF EXISTS `feats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feat` varchar(45) DEFAULT NULL,
  `type` varchar(45) NOT NULL DEFAULT 'general',
  `desc` longtext,
  `taken` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feats`
--

LOCK TABLES `feats` WRITE;
/*!40000 ALTER TABLE `feats` DISABLE KEYS */;
INSERT INTO `feats` VALUES (1,'Acrobatic','general','You have excellent body awareness and coordination.;;Benefit;;You get a +2 bonus on all Jump checks and Tumble checks.',0),(2,'Agile','general','You are particularly flexible and poised.;;Benefit;;You get a +2 bonus on all Balance checks and Escape Artist checks.',0),(3,'Alertness','general','You have finely tuned senses.;;Benefit;;You get a +2 bonus on all Listen checks and Spot checks.;;Special;;The master of a familiar gains the benefit of the Alertness feat whenever the familiar is within arm&#39;s reach.',0),(4,'Animal Affinity','general','You are good with animals.;;Benefit;;You get a +2 bonus on all Handle Animal checks and Ride checks.',0),(5,'Armor Proficiency (light) ','general','You are proficient with light armor.;;Benefit;;When you wear a type of armor with which you are proficient, the armor check penalty for that armor applies only on Balance, Climb, Escape Artist, Hide, Jump, Move Silently, Sleight of Hand, and Tumble checks. Double the normal penalty applies on Swim checks.;;Normal;;A character who is wearing armor with which she is not proficient applies its armor check penalty on attack rolls and on all Strength-based or Dexterity-based ability and skill checks.;;Special;;All characters except wizards, sorcerers, and monks automatically have Armor Proficiency (light) as a bonus feat. They need not select it.',0),(6,'Armor Proficiency (medium)','general','You are proficient with medium armor.;;Prerequisite;;Armor Proficiency (light).;;Benefit;;See Armor Proficiency (light).;;Normal;;See Armor Proficiency (light).;;Special;;Fighters, barbarians, paladins, clerics, and druids automatically have Armor Proficiency (medium) as a bonus feat. They need not select it.',0),(7,'Armor Proficiency (heavy)','general','You are proficient with heavy armor.;;Prerequisites;;Armor Proficiency (light), Armor Proficiency (medium).;;Benefit;;See Armor Proficiency (light).;;Normal;;See Armor Proficiency (light).;;Special;;Fighters, paladins, and clerics automatically have Armor Proficiency (heavy) as a bonus feat. They need not select it.',0),(8,'Athletic','general','You have a knack for athletic endeavors.;;Benefit;;You get a +2 bonus on all Climb checks and Swim checks.',0),(9,'Augment Summoning','general','Your summoned creatures are more powerful than normal.;;Prerequisite;;Spell Focus (conjuration).;;Benefit;;Each creature you conjure with any summon spell gains a +4 enhancement bonus to Strength and Constitution for the duration of the spell that summoned it.',0),(10,'Blind-Fight','general','You know how to fight in melee without being able to see your foes.;;Benefit;;In melee, every time you miss because of concealment, you can reroll your miss chance percentile roll one time to see if you actually hit. An invisible attacker gets no advantages related to hitting you in melee. That is, you don&#39;t lose your Dexterity bonus to Armor Class, and the attacker doesn&#39;t get the usual +2 bonus for being invisible. The invisible attacker&#39;s bonuses do still apply for ranged attacks, however. You take only half the usual penalty to speed for being unable to see. Darkness and poor visibility in general reduces your speed to three-quarters normal, instead of one-half.;;Normal;;Regular attack roll modifiers for invisible attackers trying to hit you apply, and you lose your Dexterity bonus to AC. The speed reduction for darkness and poor visibility also applies.;;Special;;The Blind-Fight feat is of no use against a character who is the subject of a blink spell. A fighter may select Blind-Fight as one of his fighter bonus feats.',0),(11,'Combat Casting','general',NULL,0),(12,'Combat Expertise','general',NULL,0),(13,'Improved Disarm','general',NULL,0),(14,'Improved Feint','general',NULL,0),(15,'Improved Trip','general',NULL,0),(16,'Whirlwind Attack','general',NULL,0),(17,'Combat Reflexes','general',NULL,0),(18,'Deceitful','general',NULL,0),(19,'Deft Hands','general',NULL,0),(20,'Diligent','general',NULL,0),(21,'Dodge','general',NULL,0),(22,'Mobility','general',NULL,0),(23,'Spring Attack','general',NULL,0),(24,'Endurance','general',NULL,0),(25,'Diehard','general',NULL,0),(26,'Eschew Materials','general',NULL,0),(27,'Exotic Weapon Proficiency','general',NULL,0),(28,'Extra Turning','general',NULL,0),(29,'Great Fortitude','general',NULL,0),(30,'Improved Counterspell','general',NULL,0),(31,'Improved Critical','general',NULL,0),(32,'Improved Initiative','general',NULL,0),(33,'Improved Turning','general',NULL,0),(34,'Improved Unarmed Strike','general',NULL,0),(35,'Improved Grapple','general',NULL,0),(36,'Deflect Arrows','general',NULL,0),(37,'Snatch Arrows','general',NULL,0),(38,'Stunning Fist','general',NULL,0),(39,'Investigator','general',NULL,0),(40,'Iron Will','general',NULL,0),(41,'Leadership','general',NULL,0),(42,'Lightning Reflexes ','general',NULL,0),(43,'Magical Aptitude','general',NULL,0),(44,'Martial Weapon Proficiency','general',NULL,0),(45,'Mounted Combat','general',NULL,0),(46,'Mounted Archery','general',NULL,0),(47,'Ride-By Attack','general',NULL,0),(48,'Spirited Charge','general',NULL,0),(49,'Trample','general',NULL,0),(50,'Natural Spell','general',NULL,0),(51,'Negotiator','general',NULL,0),(52,'Nimble Fingers','general',NULL,0),(53,'Persuasive','general',NULL,0),(54,'Point Blank Shot','general',NULL,0),(55,'Far Shot','general',NULL,0),(56,'Precise Shot','general',NULL,0),(57,'Improved Precise Shot','general',NULL,0),(58,'Rapid Shot','general',NULL,0),(59,'Manyshot','general',NULL,0),(60,'Shot on the Run','general',NULL,0),(61,'Power Attack','general',NULL,0),(62,'Cleave','general',NULL,0),(63,'Great Cleave','general',NULL,0),(64,'Improved Bull Rush','general',NULL,0),(65,'Improved Overrun','general',NULL,0),(66,'Improved Sunder','general',NULL,0),(67,'Quick Draw','general',NULL,0),(68,'Rapid Reload','general',NULL,0),(69,'Run','general',NULL,0),(70,'Self-Sufficient','general',NULL,0),(71,'Shield Proficiency','general',NULL,0),(72,'Improved Shield Bash','general',NULL,0),(73,'Tower Shield Proficiency','general',NULL,0),(74,'Simple Weapon Proficiency','general',NULL,0),(75,'Skill Focus','general',NULL,0),(76,'Spell Focus','general',NULL,0),(77,'Greater Spell Focus','general',NULL,0);
/*!40000 ALTER TABLE `feats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `racedesc`
--

DROP TABLE IF EXISTS `racedesc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `racedesc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `race` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `manual` varchar(45) DEFAULT NULL,
  `page` int(11) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `intro` text,
  `strength` int(11) NOT NULL DEFAULT '0',
  `dexterity` int(11) NOT NULL DEFAULT '0',
  `constitution` int(11) NOT NULL DEFAULT '0',
  `intelligence` int(11) NOT NULL DEFAULT '0',
  `wisdom` int(11) NOT NULL DEFAULT '0',
  `charisma` int(11) NOT NULL DEFAULT '0',
  `abilitydesc` text,
  `size` varchar(45) NOT NULL DEFAULT 'Medium',
  `speed` int(11) NOT NULL DEFAULT '30',
  `encumbered` int(11) NOT NULL DEFAULT '20',
  `favclass` varchar(45) NOT NULL DEFAULT 'Any',
  `autolangs` varchar(45) NOT NULL DEFAULT 'Common',
  `bonuslangs` varchar(45) DEFAULT NULL,
  `skillpoints` int(11) NOT NULL DEFAULT '0',
  `skillbonus` longtext,
  `bonusfeats` longtext,
  `weapfamil` varchar(45) DEFAULT NULL,
  `darkvision` int(4) DEFAULT NULL,
  `lowlightvision` int(4) DEFAULT NULL,
  `othertraits` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `racedesc`
--

LOCK TABLES `racedesc` WRITE;
/*!40000 ALTER TABLE `racedesc` DISABLE KEYS */;
INSERT INTO `racedesc` VALUES (1,'Human',NULL,'Player&#39;s Handbook v3.5',12,'ddHuman.png','Most humans are the descendants of pioneers, conquerors, traders, travelers, refugees, and other people on the move. As a result, human lands are home to a mix of people&#8212;physically, culturally, religiously, and politically different. Hardy or fine, light-skinned or dark, showy or austere, primitive or civilized, devout or impious, humans run the gamut.',0,0,0,0,0,0,NULL,'Medium',30,20,'Any','Common','Any',1,NULL,'1',NULL,NULL,NULL,'1 extra feat at 1st level, because humans are quick to master specialized tasks and varied in their talents.;;4 extra skill points at 1st level and 1 extra skill point at each additional level, since humans are versatile and capable.'),(2,'Dwarf',NULL,'Player&#39;s Handbook v3.5',14,'ddDwarf.png','Dwarves are known for their skill in warfare, their ability to withstand physical and magical punishment, their knowledge of the earth&#39;s secrets, their hard work, and their capacity for drinking ale. Their mysterious kingdoms, carved out from the insides of mountains, are renowned for the marvelous treasures that they produce as gifts or for trade.',0,0,2,0,0,-2,'Dwarves are stout and tough but tend to be gruff and reserved.','Medium',20,20,'Fighter','Common;Dwarven','Giant;Gnome;Goblin;Orc;Terran;Undercommon',0,NULL,'0','dwarwen',60,NULL,'Stonecunning: This ability grants a dwarf a +2 racial bonus on Search checks to notice unusual stonework, such as sliding walls, stonework traps, new construction (even when built to match the old), unsafe stone surfaces, shaky stone ceilings, and the like. Something that isn&#8217;t stone but that is disguised as stone also counts as unusual stonework. A dwarf who merely comes within 10 feet of unusual stonework can make a Search check as if he were actively searching, and a dwarf can use the Search skill to find stonework traps as a rogue can. A dwarf can also intuit depth, sensing his approximate depth underground as naturally as a human can sense which way is up. Dwarves have a sixth sense about stonework, an innate ability that they get plenty of opportunity to practice and hone in their underground homes.;;Stability: Dwarves are exceptionally stable on their feet. A dwarf gains a +4 bonus on ability checks made to resist being bull rushed or tripped when standing on the ground (but not when climbing, flying, riding, or otherwise not standing firmly on the ground).;;+2 racial bonus on saving throws against poison: Dwarves are hardy and resistant to toxins.;;+2 racial bonus on saving throws against spells and spell-like effects: Dwarves have an innate resistance to magic spells.;;+1 racial bonus on attack rolls against orcs (including half-orcs) and goblinoids (including goblins, hobgoblins, and bugbears): Dwarves are trained in the special combat techniques that allow them to fight their common enemies more effectively.;;+4 dodge bonus to Armor Class against monsters of the giant type (such as ogres, trolls, and hill giants): This bonus represents special training that dwarves undergo, during which they learn tricks that previous generations developed in their battles with giants. Any time a creature loses its Dexterity bonus (if any) to Armor Class, such as when it&#8217;s caught flat-footed, it loses its dodge bonus, too.;;+2 racial bonus on Appraise checks that are related to stone or metal items: Dwarves are familiar with valuable items of all kinds, especially those made of stone or metal.;;+2 racial bonus on Craft checks that are related to stone or metal: Dwarves are especially capable with stonework and metalwork.'),(3,'Elf',NULL,'Player&#39;s Handbook v3.5',15,'ddElf.png','Elves mingle freely in human lands, always welcome yet never at home there. They are well known for their poetry, dance, song, lore, and magical arts. Elves favor things of natural and simple beauty. When danger threatens their woodland homes, however, elves reveal a more martial side, demonstrating skill with sword, bow, and battle strategy.',0,2,-2,0,0,0,'Elves are graceful but frail. An elf&#39;s grace makes her naturally better at stealth and archery.','Medium',30,20,'Wizard','Common;Elven','Draconic;Gnoll;Gnome;Goblin;Orc;Sylvan',0,'Listen;2;Search;2;Spot;2','0;Martial Weapon Proficiency (longsword);Martial Weapon Proficiency (rapier);Martial Weapon Proficiency (longbow);Martial Weapon Proficiency (shortbow)','elven',NULL,2,'Immunity to magic sleep effects, and a +2 racial saving throw bonus against enchantment spells or effects.;;Low-Light Vision: An elf can see twice as far as a human in starlight, moonlight, torchlight, and similar conditions of poor illumination. She retains the ability to distinguish color and detail under these conditions.;;Weapon Proficiency: Elves receive the Martial Weapon Proficiency feats for the longsword, rapier, longbow (including composite longbow), and shortbow (including composite shortbow) as bonus feats. Elves esteem the arts of swordplay and archery, so all elves are familiar with these weapons.;;+2 racial bonus on Listen, Search, and Spot checks. An elf who merely passes within 5 feet of a secret or concealed door is entitled to a Search check to notice it as if she were actively looking for it. An elf&#8217;s senses are so keen that she practically has a sixth sense about hidden portals.'),(4,'Gnome',NULL,'Player&#39;s Handbook v3.5',16,'ddGnome.png','Gnomes are welcome everywhere as technicians, alchemists, and inventors. Despite the demand for their skills, most gnomes prefer to remain among their own kind, living in comfortable burrows beneath rolling, wooded hills where animals abound.',-2,0,2,0,0,0,'Like dwarves, gnomes are tough, but they are small and therefore not as strong as larger humanoids.','Small',20,15,'Bard','Common;Gnome','Draconic;Dwarven;Elven;Giant;Goblin;Orc',0,'Craft (alchemy);2;Listen;2','0','gnome',NULL,2,'Low-Light Vision: A gnome can see twice as far as a human in starlight, moonlight, torchlight, and similar conditions of poor illumination. He retains the ability to distinguish color and detail under these conditions.;;Weapon Familiarity: Gnomes may treat gnome hooked hammers as martial weapons rather than exotic weapons.;;+2 racial bonus on saving throws against illusions: Gnomes are innately familiar with illusions of all kinds.;;Add +1 to the Difficulty Class for all saving throws against illusion spells cast by gnomes. Their innate familiarity with these effects make their illusions more difficult to see through. This adjustment stacks with those from similar effects, such as the Spell Focus feat.;;+1 racial bonus on attack rolls against kobolds and goblinoids (including goblins, hobgoblins, and bugbears): Gnomes battle these creatures frequently and practice special techniques for fighting them.;;+4 dodge bonus to Armor Class against monsters of the giant type (such as ogres, trolls, and hill giants): This bonus represents special training that gnomes undergo, during which they learn tricks that previous generations developed in their battles with giants. Any time a creature loses its Dexterity bonus (if any) to Armor Class, such as when it&#8217;s caught flat-footed, it loses its dodge bonus, too. The Monster Manual has information on which creatures are of the giant type.;;+2 racial bonus on Listen checks: Gnomes have keen ears.;;+2 racial bonus on Craft (alchemy) checks: A gnome&#8217;s sensitive nose allows him to monitor alchemical processes by smell.;;Spell-Like Abilities: 1/day&#8212;speak with animals (burrowing mammal only, duration 1 minute). A gnome with a Charisma score of at least 10 also has the following spell-like abilities: 1/day&#8212;dancing lights, ghost sound, prestidigitation. Caster level 1st; save DC 10 + gnome&#8217;s Cha modifier + spell level.'),(5,'Half-Elf',NULL,'Player&#39;s Handbook v3.5',18,'ddHalf-Elf.png','Humans and elves sometimes wed, the elf attracted to the human&#39;s energy and the human to the elf&#39;s grace. These marriages end quickly as elves count years because a human&#39;s life is so brief, but they leave an enduring legacy&#8212;half-elf children.<br><br>The life of a half-elf can be hard. If raised by elves, the half-elf seems to grow with astounding speed, reaching maturity within two decades. The half-elf becomes an adult long before she has had time to learn the intricacies of elven art and culture, or even grammar. She leaves behind her childhood friends, becoming physically an adult but culturally still a child by elven standards. Typically, she leaves her elven home, which is no longer familiar, and finds her way among humans.<br><br>If, on the other hand, she is raised by humans, the half-elf finds herself different from her peers: more aloof, more sensitive, less ambitious, and slower to mature. Some half-elves try to fit in among humans, while others find their identities in their difference. Most find places for themselves in human lands, but some feel like outsiders all their lives.',0,0,0,0,0,0,NULL,'Medium',30,20,'Any','Common;Elven','Any',0,'Listen;1;Search;1;Spot;1;Diplomacy;2;Gather Informations;2','0',NULL,NULL,2,'Immunity to sleep spells and similar magical effects, and a +2 racial bonus on saving throws against enchantment spells or effects.;;Low-Light Vision: A half-elf can see twice as far as a human in starlight, moonlight, torchlight, and similar conditions of poor illumination. She retains the ability to distinguish color and detail under these conditions.;;+1 racial bonus on Listen, Search, and Spot checks: A half-elf does not have the elf&#8217;s ability to notice secret doors simply by passing near them. Half-elves have keen senses, but not as keen as those of an elf.;;+2 racial bonus on Diplomacy and Gather Information checks: Half-elves get along naturally with all people.;;Elven Blood: For all effects related to race, a half-elf is considered an elf. Half-elves, for example, are just as vulnerable to special effects that affect elves as their elf ancestors are, and they can use magic items that are only usable by elves.'),(6,'Half-Orc',NULL,'Player&#39;s Handbook v3.5',18,'ddHalf-Orc.png','In the wild frontiers, tribes of human and orc barbarians live in uneasy balance, fighting in times of war and trading in times of peace. Half-orcs who are born in the frontier may live with either human or orc parents, but they are nevertheless exposed to both cultures. Some, for whatever reason, leave their homeland and travel to civilized lands, bringing with them the tenacity, courage, and combat prowess that they developed in the wilds.',2,0,0,-2,0,-2,'Half-orcs are strong, but their orc lineage makes them dull and crude.','Medium',30,20,'Barbarian','Common;Orc','Draconic;Giant;Gnoll;Goblin;Abyssal',0,NULL,'0',NULL,60,NULL,'Darkvision: Half-orcs (and orcs) can see in the dark up to 60 feet. Darkvision is black and white only, but it is otherwise like normal sight, and half-orcs can function just fine with no light at all.;;Orc Blood: For all effects related to race, a half-orc is considered an orc. Half-orcs, for example, are just as vulnerable to special effects that affect orcs as their orc ancestors are, and they can use magic items that are only usable by orcs.'),(7,'Halfling',NULL,'Player&#39;s Handbook v3.5',19,'ddHalfling.png','Halflings are clever, capable opportunists. Halfling individuals and clans find room for themselves wherever they can. Often they are strangers and wanderers, and others react to them with suspicion or curiosity. Depending on the clan, halflings might be reliable, hard-working (if clannish) citizens, or they might be thieves just waiting for the opportunity to make a big score and disappear in the dead of night. Regardless, halflings are cunning, resourceful survivors.',-2,2,0,0,0,0,'Halflings are quick, agile, and good with ranged weapons, but they are small and therefore not as strong as other humanoids.','Small',20,15,'Rogue','Common;Halfling','Dwarven;Elven;Gnome;Goblin;Orc',0,'Climb;2;Jump;2;Listen;2;Move Silently;2;','0','halfling',NULL,NULL,'+2 racial bonus on Climb, Jump, and Move Silently checks: Halflings are agile, surefooted, and athletic.;;+1 racial bonus on all saving throws: Halflings are surprisingly capable of avoiding mishaps.;;+2 morale bonus on saving throws against fear: This bonus stacks with the halfling&#8217;s +1 bonus on saving throws in general.;+1 racial bonus on attack rolls with thrown weapons and slings: Throwing and slinging stones is a universal sport among halflings, and they develop especially good aim.;+2 racial bonus on Listen checks: Halflings have keen ears.');
/*!40000 ALTER TABLE `racedesc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `racelist`
--

DROP TABLE IF EXISTS `racelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `racelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `race` varchar(45) DEFAULT NULL,
  `strength` int(11) NOT NULL DEFAULT '0',
  `dexterity` int(11) NOT NULL DEFAULT '0',
  `constitution` int(11) NOT NULL DEFAULT '0',
  `intelligence` int(11) NOT NULL DEFAULT '0',
  `wisdom` int(11) NOT NULL DEFAULT '0',
  `charisma` int(11) NOT NULL DEFAULT '0',
  `size` varchar(45) NOT NULL DEFAULT 'Medium',
  `speed` int(11) NOT NULL DEFAULT '30',
  `encumbered` int(11) NOT NULL DEFAULT '20',
  `favclass` varchar(45) NOT NULL DEFAULT 'Any',
  `autolangs` varchar(45) NOT NULL DEFAULT 'Common',
  `bonuslangs` varchar(45) DEFAULT NULL,
  `skillpoints` int(11) NOT NULL DEFAULT '0',
  `skillbonus` longtext,
  `bonusfeats` longtext,
  `weapfamil` varchar(45) DEFAULT NULL,
  `darkvision` int(4) DEFAULT NULL,
  `lowlightvision` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `racelist`
--

LOCK TABLES `racelist` WRITE;
/*!40000 ALTER TABLE `racelist` DISABLE KEYS */;
INSERT INTO `racelist` VALUES (1,'Human',0,0,0,0,0,0,'Medium',30,20,'Any','Common','Any',1,NULL,'1',NULL,NULL,NULL),(2,'Dwarf',0,0,2,0,0,-2,'Medium',20,20,'Fighter','Common;Dwarven','Giant;Gnome;Goblin;Orc;Terran;Undercommon',0,NULL,'0','dwarwen',60,NULL),(3,'Elf',0,2,-2,0,0,0,'Medium',30,20,'Wizard','Common;Elven','Draconic;Gnoll;Gnome;Goblin;Orc;Sylvan',0,'Listen;2;Search;2;Spot;2','0;Martial Weapon Proficiency (longsword);Martial Weapon Proficiency (rapier);Martial Weapon Proficiency (longbow);Martial Weapon Proficiency (shortbow)','elven',NULL,2),(4,'Gnome',-2,0,2,0,0,0,'Small',20,15,'Bard','Common;Gnome','Draconic;Dwarven;Elven;Giant;Goblin;Orc',0,'Craft (alchemy);2;Listen;2','0','gnome',NULL,2),(5,'Half-Elf',0,0,0,0,0,0,'Medium',30,20,'Any','Common;Elven','Any',0,'Listen;1;Search;1;Spot;1;Diplomacy;2;Gather Informations;2','0',NULL,NULL,2),(6,'Half-Orc',2,0,0,-2,0,-2,'Medium',30,20,'Barbarian','Common;Orc','Draconic;Giant;Gnoll;Goblin;Abyssal',0,NULL,'0',NULL,60,NULL),(7,'Halfling',-2,2,0,0,0,0,'Small',20,15,'Rogue','Common;Halfling','Dwarven;Elven;Gnome;Goblin;Orc',0,'Climb;2;Jump;2;Listen;2;Move Silently;2;','0','halfling',NULL,NULL);
/*!40000 ALTER TABLE `racelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sizes`
--

DROP TABLE IF EXISTS `sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size` varchar(45) DEFAULT NULL,
  `atkacmod` tinyint(4) DEFAULT NULL,
  `spatkmod` tinyint(4) DEFAULT NULL COMMENT 'This modifier applies to the bull rush, grapple, overrun, and trip special attacks.',
  `hide` tinyint(4) DEFAULT NULL COMMENT 'This modifier applies to the hide skill modifier.',
  `min_length` float DEFAULT NULL COMMENT 'Biped''s height, quadruped''s body length (nose to base of tail).',
  `max_length` float DEFAULT NULL COMMENT 'Biped''s height, quadruped''s body length (nose to base of tail).',
  `min_weight` float DEFAULT NULL COMMENT 'Assumes that the creature is roughly as dense as a regular animal. A creature made of stone will weigh considerably more. A gaseous creature will weigh much less.',
  `max_weight` float DEFAULT NULL COMMENT 'Assumes that the creature is roughly as dense as a regular animal. A creature made of stone will weigh considerably more. A gaseous creature will weigh much less.',
  `space` float DEFAULT NULL COMMENT 'These values are typical for creatures of the indicated size. Some exceptions exist.',
  `reach_tall` tinyint(4) DEFAULT NULL COMMENT 'These values are typical for creatures of the indicated size. Some exceptions exist.',
  `reach_long` tinyint(4) DEFAULT NULL COMMENT 'These values are typical for creatures of the indicated size. Some exceptions exist.',
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

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill` varchar(45) DEFAULT NULL,
  `ability` varchar(45) DEFAULT NULL,
  `untrained` tinyint(1) NOT NULL DEFAULT '1',
  `armorpenalty` tinyint(1) NOT NULL DEFAULT '0',
  `points` int(11) NOT NULL DEFAULT '0',
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
INSERT INTO `skills` VALUES (1,'Appraise','intelligence',1,0,0,0),(2,'Balance','dexterity',1,1,0,0),(3,'Bluff','charisma',1,0,0,0),(4,'Climb','strength',1,1,0,0),(5,'Concentration','constitution',1,0,0,0),(6,'Craft (alchemy)','intelligence',1,0,0,0),(7,'Craft (armorsmithing)','intelligence',1,0,0,0),(8,'Craft (basketweaving)','intelligence',1,0,0,0),(9,'Craft (blacksmithing)','intelligence',1,0,0,0),(10,'Craft (bookbinding)','intelligence',1,0,0,0),(11,'Craft (bowmaking)','intelligence',1,0,0,0),(12,'Craft (calligraphy)','intelligence',1,0,0,0),(13,'Craft (carpentry)','intelligence',1,0,0,0),(14,'Craft (cobbling)','intelligence',1,0,0,0),(15,'Craft (gemcutting)','intelligence',1,0,0,0),(16,'Craft (leatherworking)','intelligence',1,0,0,0),(17,'Craft (locksmithing)','intelligence',1,0,0,0),(18,'Craft (painting)','intelligence',1,0,0,0),(19,'Craft (pottery)','intelligence',1,0,0,0),(20,'Craft (sculpting)','intelligence',1,0,0,0),(21,'Craft (shipmaking)','intelligence',1,0,0,0),(22,'Craft (stonemasonry)','intelligence',1,0,0,0),(23,'Craft (trapmaking)','intelligence',1,0,0,0),(24,'Craft (weaponsmithing)','intelligence',1,0,0,0),(25,'Craft (weaving)','intelligence',1,0,0,0),(26,'Decipher Script','intelligence',0,0,0,0),(27,'Diplomacy','charisma',1,0,0,0),(28,'Disable Device','intelligence',0,0,0,0),(29,'Disguise','charisma',1,0,0,0),(30,'Escape Artist','dexterity',1,1,0,0),(31,'Forgery','intelligence',1,0,0,0),(32,'Gather Information','charisma',1,0,0,0),(33,'Handle Animal','charisma',0,0,0,0),(34,'Heal','wisdom',1,0,0,0),(35,'Hide','dexterity',1,1,0,0),(36,'Intimidate','charisma',1,0,0,0),(37,'Jump','strength',1,0,0,0),(38,'Knowledge (arcana)','intelligence',0,0,0,0),(39,'Knowledge (architecture and engineering)','intelligence',0,0,0,0),(40,'Knowledge (dungeoneering)','intelligence',0,0,0,0),(41,'Knowledge (geography)','intelligence',0,0,0,0),(42,'Knowledge (history)','intelligence',0,0,0,0),(43,'Knowledge (local)','intelligence',0,0,0,0),(44,'Knowledge (nature)','intelligence',0,0,0,0),(45,'Knowledge (nobility and royalty)','intelligence',0,0,0,0),(46,'Knowledge (religion)','intelligence',0,0,0,0),(47,'Knowledge (the planes)','intelligence',0,0,0,0),(48,'Listen','wisdom',1,0,0,0),(49,'Move Silently','dexterity',1,1,0,0),(50,'Open Lock','dexterity',0,0,0,0),(51,'Perform (Act)','charisma',1,0,0,0),(52,'Perform (Comedy)','charisma',1,0,0,0),(53,'Perform (Dance)','charisma',1,0,0,0),(54,'Perform (Keyboard instruments)','charisma',1,0,0,0),(55,'Perform (Oratory)','charisma',1,0,0,0),(56,'Perform (Percussion instruments)','charisma',1,0,0,0),(57,'Perform (Sing)','charisma',1,0,0,0),(58,'Perform (String instruments)','charisma',1,0,0,0),(59,'Perform (Wind instruments)','charisma',1,0,0,0),(60,'Profession (apothecary)','wisdom',0,0,0,0),(61,'Profession (boater)','wisdom',0,0,0,0),(62,'Profession (bookkeeper)','wisdom',0,0,0,0),(63,'Profession (brewer)','wisdom',0,0,0,0),(64,'Profession (cook)','wisdom',0,0,0,0),(65,'Profession (driver)','wisdom',0,0,0,0),(66,'Profession (farmer)','wisdom',0,0,0,0),(67,'Profession (fisher)','wisdom',0,0,0,0),(68,'Profession (guide)','wisdom',0,0,0,0),(69,'Profession (herbalist)','wisdom',0,0,0,0),(70,'Profession (herder)','wisdom',0,0,0,0),(71,'Profession (hunter)','wisdom',0,0,0,0),(72,'Profession (innkeeper)','wisdom',0,0,0,0),(73,'Profession (lumberjack)','wisdom',0,0,0,0),(74,'Profession (miller)','wisdom',0,0,0,0),(75,'Profession (miner)','wisdom',0,0,0,0),(76,'Profession (porter)','wisdom',0,0,0,0),(77,'Profession (rancher)','wisdom',0,0,0,0),(78,'Profession (sailor)','wisdom',0,0,0,0),(79,'Profession (scribe)','wisdom',0,0,0,0),(80,'Profession (siege engineer)','wisdom',0,0,0,0),(81,'Profession (stablehand)','wisdom',0,0,0,0),(82,'Profession (tanner)','wisdom',0,0,0,0),(83,'Profession (teamster)','wisdom',0,0,0,0),(84,'Profession (woodcutter)','wisdom',0,0,0,0),(85,'Ride','dexterity',1,1,0,0),(86,'Search','intelligence',1,0,0,0),(87,'Sense Motive','wisdom',1,0,0,0),(88,'Sleight of Hand','dexterity',0,0,0,0),(89,'Speak Language',NULL,0,0,0,0),(90,'Spellcraft','intelligence',0,0,0,0),(91,'Spot','wisdom',1,0,0,0),(92,'Survival','wisdom',1,0,0,0),(93,'Swim','strength',1,2,0,0),(94,'Tumble','dexterity',0,1,0,0),(95,'Use Magic Device','charisma',0,0,0,0),(96,'Use Rope','dexterity',1,0,0,0);
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skillsdesc`
--

DROP TABLE IF EXISTS `skillsdesc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skillsdesc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill` varchar(45) DEFAULT NULL,
  `ability` varchar(45) DEFAULT NULL,
  `untrained` tinyint(1) NOT NULL DEFAULT '1',
  `armorpenalty` tinyint(1) NOT NULL DEFAULT '0',
  `intro` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `skill_UNIQUE` (`skill`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skillsdesc`
--

LOCK TABLES `skillsdesc` WRITE;
/*!40000 ALTER TABLE `skillsdesc` DISABLE KEYS */;
INSERT INTO `skillsdesc` VALUES (1,'Appraise','intelligence',1,0,'Use this skill to tell an antique from old junk, a sword that&#39;s old and fancy from an elven heirloom, and high-quality jewelry from cheap stuff made to look good.'),(2,'Balance','dexterity',1,1,'You can keep your balance while walking on a tightrope, a narrow beam, a slippery ledge, or an uneven floor.'),(3,'Bluff','charisma',1,0,'You can make the outrageous or the untrue seem plausible, or use doublespeak or innuendo to deliver a secret message to another character. The skill encompasses acting, conning, fast talking, misdirection, prevarication, and misleading body language. Use a bluff to sow temporary confusion, get someone to turn and look where you point, or simply look innocuous.'),(4,'Climb','strength',1,1,'Use this skill to scale a cliff, to get to the window on the second story of a wizard&#39;s tower, or to climb out of a pit after falling through a trapdoor.'),(5,'Concentration','constitution',1,0,NULL),(6,'Craft (alchemy)','intelligence',1,0,NULL),(7,'Craft (armorsmithing)','intelligence',1,0,NULL),(8,'Craft (basketweaving)','intelligence',1,0,NULL),(9,'Craft (blacksmithing)','intelligence',1,0,NULL),(10,'Craft (bookbinding)','intelligence',1,0,NULL),(11,'Craft (bowmaking)','intelligence',1,0,NULL),(12,'Craft (calligraphy)','intelligence',1,0,NULL),(13,'Craft (carpentry)','intelligence',1,0,NULL),(14,'Craft (cobbling)','intelligence',1,0,NULL),(15,'Craft (gemcutting)','intelligence',1,0,NULL),(16,'Craft (leatherworking)','intelligence',1,0,NULL),(17,'Craft (locksmithing)','intelligence',1,0,NULL),(18,'Craft (painting)','intelligence',1,0,NULL),(19,'Craft (pottery)','intelligence',1,0,NULL),(20,'Craft (sculpting)','intelligence',1,0,NULL),(21,'Craft (shipmaking)','intelligence',1,0,NULL),(22,'Craft (stonemasonry)','intelligence',1,0,NULL),(23,'Craft (trapmaking)','intelligence',1,0,NULL),(24,'Craft (weaponsmithing)','intelligence',1,0,NULL),(25,'Craft (weaving)','intelligence',1,0,NULL),(26,'Decipher Script','intelligence',0,0,NULL),(27,'Diplomacy','charisma',1,0,NULL),(28,'Disable Device','intelligence',0,0,NULL),(29,'Disguise','charisma',1,0,NULL),(30,'Escape Artist','dexterity',1,1,NULL),(31,'Forgery','intelligence',1,0,NULL),(32,'Gather Information','charisma',1,0,NULL),(33,'Handle Animal','charisma',0,0,NULL),(34,'Heal','wisdom',1,0,NULL),(35,'Hide','dexterity',1,1,NULL),(36,'Intimidate','charisma',1,0,NULL),(37,'Jump','strength',1,0,NULL),(38,'Knowledge (arcana)','intelligence',0,0,NULL),(39,'Knowledge (architecture and engineering)','intelligence',0,0,NULL),(40,'Knowledge (dungeoneering)','intelligence',0,0,NULL),(41,'Knowledge (geography)','intelligence',0,0,NULL),(42,'Knowledge (history)','intelligence',0,0,NULL),(43,'Knowledge (local)','intelligence',0,0,NULL),(44,'Knowledge (nature)','intelligence',0,0,NULL),(45,'Knowledge (nobility and royalty)','intelligence',0,0,NULL),(46,'Knowledge (religion)','intelligence',0,0,NULL),(47,'Knowledge (the planes)','intelligence',0,0,NULL),(48,'Listen','wisdom',1,0,NULL),(49,'Move Silently','dexterity',1,1,NULL),(50,'Open Lock','dexterity',0,0,NULL),(51,'Perform (Act)','charisma',1,0,NULL),(52,'Perform (Comedy)','charisma',1,0,NULL),(53,'Perform (Dance)','charisma',1,0,NULL),(54,'Perform (Keyboard instruments)','charisma',1,0,NULL),(55,'Perform (Oratory)','charisma',1,0,NULL),(56,'Perform (Percussion instruments)','charisma',1,0,NULL),(57,'Perform (Sing)','charisma',1,0,NULL),(58,'Perform (String instruments)','charisma',1,0,NULL),(59,'Perform (Wind instruments)','charisma',1,0,NULL),(60,'Profession (apothecary)','wisdom',0,0,NULL),(61,'Profession (boater)','wisdom',0,0,NULL),(62,'Profession (bookkeeper)','wisdom',0,0,NULL),(63,'Profession (brewer)','wisdom',0,0,NULL),(64,'Profession (cook)','wisdom',0,0,NULL),(65,'Profession (driver)','wisdom',0,0,NULL),(66,'Profession (farmer)','wisdom',0,0,NULL),(67,'Profession (fisher)','wisdom',0,0,NULL),(68,'Profession (guide)','wisdom',0,0,NULL),(69,'Profession (herbalist)','wisdom',0,0,NULL),(70,'Profession (herder)','wisdom',0,0,NULL),(71,'Profession (hunter)','wisdom',0,0,NULL),(72,'Profession (innkeeper)','wisdom',0,0,NULL),(73,'Profession (lumberjack)','wisdom',0,0,NULL),(74,'Profession (miller)','wisdom',0,0,NULL),(75,'Profession (miner)','wisdom',0,0,NULL),(76,'Profession (porter)','wisdom',0,0,NULL),(77,'Profession (rancher)','wisdom',0,0,NULL),(78,'Profession (sailor)','wisdom',0,0,NULL),(79,'Profession (scribe)','wisdom',0,0,NULL),(80,'Profession (siege engineer)','wisdom',0,0,NULL),(81,'Profession (stablehand)','wisdom',0,0,NULL),(82,'Profession (tanner)','wisdom',0,0,NULL),(83,'Profession (teamster)','wisdom',0,0,NULL),(84,'Profession (woodcutter)','wisdom',0,0,NULL),(85,'Ride','dexterity',1,1,NULL),(86,'Search','intelligence',1,0,NULL),(87,'Sense Motive','wisdom',1,0,NULL),(88,'Sleight of Hand','dexterity',0,0,NULL),(89,'Speak Language',NULL,0,0,NULL),(90,'Spellcraft','intelligence',0,0,NULL),(91,'Spot','wisdom',1,0,NULL),(92,'Survival','wisdom',1,0,NULL),(93,'Swim','strength',1,2,NULL),(94,'Tumble','dexterity',0,1,NULL),(95,'Use Magic Device','charisma',0,0,NULL),(96,'Use Rope','dexterity',1,0,NULL);
/*!40000 ALTER TABLE `skillsdesc` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-14 19:05:14
