CREATE DATABASE  IF NOT EXISTS `the9lands` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `the9lands`;
-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: the9lands
-- ------------------------------------------------------
-- Server version	5.7.23

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

-- Dump completed on 2018-10-01  2:26:31
CREATE DATABASE  IF NOT EXISTS `t9lddrules` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `t9lddrules`;
-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: t9lddrules
-- ------------------------------------------------------
-- Server version	5.7.23

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
  `ability` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `shtname` varchar(3) NOT NULL,
  `score` varchar(45) DEFAULT NULL,
  `modifier` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ability`),
  UNIQUE KEY `name_UNIQUE` (`ability`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abilities`
--

LOCK TABLES `abilities` WRITE;
/*!40000 ALTER TABLE `abilities` DISABLE KEYS */;
INSERT INTO `abilities` VALUES ('charisma','Charisma','CHA',NULL,NULL),('constitution','Constitution','CON',NULL,NULL),('dexterity','Dexterity','DEX',NULL,NULL),('intelligence','Intelligence','INT',NULL,NULL),('strength','Strength','STR',NULL,NULL),('wisdom','Wisdom','WIS',NULL,NULL);
/*!40000 ALTER TABLE `abilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseclasslist`
--

DROP TABLE IF EXISTS `baseclasslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseclasslist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(45) DEFAULT NULL,
  `shtname` varchar(5) DEFAULT NULL,
  `shtdesc` mediumtext,
  `hd` int(2) DEFAULT NULL,
  `bab` float DEFAULT NULL,
  `fort` varchar(4) DEFAULT NULL,
  `refl` varchar(4) DEFAULT NULL,
  `will` varchar(4) DEFAULT NULL,
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
-- Dumping data for table `baseclasslist`
--

LOCK TABLES `baseclasslist` WRITE;
/*!40000 ALTER TABLE `baseclasslist` DISABLE KEYS */;
INSERT INTO `baseclasslist` VALUES (1,'Barbarian','Brb','A ferocious warrior who uses fury and instinct to bring down foes.',12,1,'good',NULL,NULL,'Player\'s Handbook v3.5','24','ddBarbarian.jpg','From the frozen wastes of the north and the hellish jungles of the south come brave, even reckless, warriors. Civilized people call them barbarians or berserkers and suspect them of mayhem, impiety, and atrocities. These &quot;barbarians&quot;, however, have proven their mettle and their value to those who would be their allies. To enemies who underestimated them, they have proved their cunning, resourcefulness, persistence, and mercilessness.','Adventuring is the best chance barbarians have of finding a place in a civilized society. They&#39;re not well suited to the monotony of guard duty or other mundane tasks. Barbarians also have no trouble with the dangers, the uncertainties, and the wandering that adventuring involves. They may adventure to defeat hated enemies. They have a noted distaste for that which they consider unnatural, including undead, demons, and devils.','The barbarian is an excellent warrior. Where the fighter&#39;s skill in combat comes from training and discipline, however, the barbarian has a powerful rage. While in this berserk fury, he becomes stronger and tougher, better able to defeat his foes and withstand their attacks. These rages leave him winded, and he has the energy for only a few such spectacular displays per day, but those few rages are usually sufficient. He is at home in the wild, and he runs at great speed.','Barbarians are never lawful. They may be honorable, but at heart they are wild. This wildness is their strength, and it could not live in a lawful soul. At best, barbarians of chaotic alignment are free and expressive. At worst, they are thoughtlessly destructive.','Some barbarians distrust established religions and prefer an intuitive, natural relationship to the cosmos over formal worship. Others devote themselves to powerful deities, such as Kord (god of strength), Obad-Hai (god of nature), or Erythnul (god of slaughter). A barbarian is capable of fierce devotion to his god.','Barbarians come from uncivilized lands or from barbaric tribes on the outskirts of civilization. A barbarian adventurer may have been lured to the settled lands by the promise of riches, may have escaped after being captured in his homeland and sold into &quot;civilized&quot; slavery, may have been recruited as a soldier, or may have been driven out of his homeland by invaders. Barbarians share no bond with each other unless they come from the same tribe or land. In fact, they think of themselves not as barbarians but as warriors.','Human barbarians come from the distant wild lands on the edge of civilization. Most half-orc barbarians lived among orcs before abandoning them for human lands. Dwarf barbarians are rare, usually hailing from dwarven kingdoms that have fallen into barbarism as a result of recurrent war with goblinoids, orcs, and giants. Barbarians of other races are very rare. Among the brutal humanoids, barbarians are more common than fighters. Orcs and ogres are especially likely to be barbarians.','As people of the wild, barbarians are most comfortable in the company of rangers, druids, and clerics of nature deities, such as Obad-Hai or Ehlonna. Many barbarians admire the talents and spontaneity of bards, and some are enthusiastic lovers of music. Barbarians don&#39;t trust that which they don&#39;t understand, and that includes wizardry, which they call &quot;book magic&quot;. They find sorcerers more understandable than wizards, but maybe that&#39;s just because sorcerers tend to be more charismatic. Monks, with their studied, practiced, deliberate approach to combat, sometimes have a hard time seeing eye to eye with barbarians, but members of these classes aren&#39;t necessarily hostile to each other. Barbarians have no special attitudes toward fighters, paladins, clerics, or rogues.','A barbarian&#39;s typical primary role in a group of adventurers is as a front-line combat specialist. No other character can match his sheer toughness. He can also serve as a good scout, thanks to his speed, skill selection, and trap sense.'),(2,'Bard','Brd','A performer whose music works magic &#8212; a wanderer, a taleteller, and a jack-of-all trades.',6,0.75,NULL,'good','good','Player\'s Handbook v3.5','26','ddBard.jpg','It is said that music has a special magic, and the bard proves that saying true. Wandering across the land, gathering lore, telling stories, working magic with his music, and living on the gratitude of his audience &#8212; such is the life of a bard. When chance or opportunity draws them into a conflict, bards serve as diplomats, negotiators, messengers, scouts, and spies. A bard&#39;s magic comes from the heart. If his heart is good, a bard brings hope and courage to the downtrodden and uses his tricks, music, and magic to thwart the schemes of evildoers. If the nobles of the land are corrupt, the good bard is an enemy of the state, cunningly evading capture and raising the spirits of the oppressed. But music can spring from an evil heart as well. Evil bards forego blatant violence in favor of manipulation, holding sway over the hearts and minds of others and taking what enraptured audiences &quot;willingly&quot; give.','Bards see adventures as opportunities to learn. They practice their many skills and abilities, and they especially relish the opportunity to enter a long-forgotten tomb, to discover ancient works of magic, to decipher old tomes, to travel to strange places, to encounter exotic creatures, and to learn new songs and stories. Bards love to accompany heroes (and villains), joining their entourage to witness their deeds firsthand &#8212; a bard who can tell a marvelous story from personal experience earns renown among his fellows. Indeed, after telling so many stories about heroes doing mighty deeds, many bards take these themes to heart and assume heroic roles themselves.','A bard brings forth magic from his soul, not from a book. He can cast only a small number of spells, but he can do so without selecting or preparing them in advance. His magic emphasizes charms and illusions over the more dramatic evocation spells that wizards and sorcerers often use. In addition to spells, a bard works magic with his music and poetry. He can encourage allies, hold his audiences rapt, and counter magical effects that rely on speech or sound. Bards have some of the skills that rogues have, although bards they are not as focused on skill mastery as rogues are. A bard listens to stories as well as telling them, of course, so he has a vast knowledge of local events and noteworthy items.','Bards are wanderers, guided by whim and intuition rather than by tradition or law. The spontaneous talent, magic, and lifestyle of the bard are incompatible with a lawful alignment.','Bards revere Fharlanghn (god of roads). They sometimes camp near his wayside shrines, hoping to earn some coin from the travelers who stop to leave offerings for the god. Many bards, even those who are not elves, worship Corellon Larethian, god of elves and patron of poetry and music. Many good bards are partial to Pelor (god of the sun), believing that he watches over them in their travels. Bards given to chaos and occasional larceny favor Olidammara (god of thieves). Those who have turned to evil ways are known to worship Erythnul (the god of slaughter), though few will admit to it. In any event, bards spend so much time on the road that, while they may be devoted to a deity, they are rarely devoted to any particular temple.','An apprentice bard learns his skills from a single experienced bard, whom he follows and serves until he is ready to strike out on his own. Many bards were once young runaways or orphans, befriended by wandering bards who became their mentors. Since bards occasionally congregate in informal &quot;colleges&quot;, the apprentice bard may meet many of the more prominent bards in the area. Still, the bard has no strong allegiance to bards as a whole. In fact, some bards are highly competitive with other bards, jealous of their reputations and defensive about their territories.','Bards are commonly human, gnome, elf, or half-elf. Humans take well to the wandering life and adapt easily to new lands and customs. Gnomes have a sense of humor and trickery that lends itself to a bardic career. Elves are talented in music and magic, so the career of the bard comes naturally to them. A bard&#39;s wandering ways suit many half-elves, who often feel like strangers even when at home. Half-orcs, even those raised among humans, find themselves ill suited to the demands of a bard&#39;s career. There are no bardic traditions among dwarves, or halflings, though occasional individuals of these races find teachers to train them in the ways of the bard. Bards are exceedingly rare among the savage humanoids, except among centaurs. Centaur bards sometimes train the children of humans or other humanoids.','A bard works well with companions of other classes. He often serves as the spokesman of the party, using his social skills for the party&#39;s benefit. In a party without a wizard or sorcerer, the bard contributes his magic. In a party without a rogue, he uses his skills. A bard is curious about the ways of more focused or dedicated adventurers, so he often tries to pick up pointers from fighters, sorcerers, and rogues.','The bard is perhaps the ultimate generalist. In most adventuring groups, he works best in a supporting role. He can&#39;t usually match the stealth of the ranger or the rogue, the spellcasting power of the cleric or the wizard, or the combat prowess of the barbarian or the fighter. However, he makes all the other characters better at what they do, and he can often fill in for another character when needed. For a typical group of four characters, the bard is perhaps the most useful fifth character to consider adding, and he can make a great team leader.'),(3,'Cleric','Clr','A master of divine magic and a capable warrior as well.',8,0.75,'good',NULL,'good','Player\'s Handbook v3.5','30','ddCleric.jpg','The handiwork of the gods is everywhere&#8212;in places of natural beauty, in mighty crusades, in soaring temples, and in the hearts of worshipers. Like people, gods run the gamut from benevolent to malicious, reserved to intrusive, simple to inscrutable. The gods, however, work mostly through intermediaries&#8212;their clerics. Good clerics heal, protect, and avenge. Evil clerics pillage, destroy, and sabotage. A cleric uses the power of his god to make his god&#39;s will manifest. And if a cleric uses his god&#39;s power to improve his own lot, that&#39;s to be expected, too.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Druid','Drd','One who draws energy from the natural world to cast divine spells and gain strange magical powers.',8,0.75,'good',NULL,'good','Player\'s Handbook v3.5','33','ddDruid.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'Fighter','Ftr','A warrior with exceptional combat capability and unequaled skill with weapons.',10,1,'good',NULL,NULL,'Player\'s Handbook v3.5','37','ddFighter.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Monk','Mnk','A martial artist whose unarmed strikes hit fast and hard &#8212; a master of exotic powers.',8,0.75,'good','good','good','Player\'s Handbook v3.5','39','ddMonk.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'Paladin','Pal','A champion of justice and destroyer of evil, protected and strengthened by an array of divine powers.',10,1,'good',NULL,NULL,'Player\'s Handbook v3.5','42','ddPaladin.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'Ranger','Rgr','A cunning, skilled warrior of the wilderness. ',8,1,'good','good',NULL,'Player\'s Handbook v3.5','46','ddRanger.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'Rogue','Rog','A tricky, skillful scout and spy who wins the battle by stealth rather than brute force.',6,0.75,NULL,'good',NULL,'Player\'s Handbook v3.5','49','ddRogue.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'Sorcerer','Sor','A spellcaster with inborn magical ability.',4,0.5,NULL,NULL,'good','Player\'s Handbook v3.5','51','ddSorcerer.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'Wizard','Wiz','A potent spellcaster schooled in the arcane arts.',4,0.5,NULL,NULL,'good','Player\'s Handbook v3.5','55','ddWizard.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `baseclasslist` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `racelist`
--

LOCK TABLES `racelist` WRITE;
/*!40000 ALTER TABLE `racelist` DISABLE KEYS */;
INSERT INTO `racelist` VALUES (1,'Human',0,0,0,0,0,0,'Medium',30),(2,'Dwarf',0,0,2,0,0,-2,'Medium',20),(3,'Elf',0,2,-2,0,0,0,'Medium',30),(4,'Gnome',-2,0,2,0,0,0,'Small',20),(5,'Half-Elf',0,0,0,0,0,0,'Medium',30),(6,'Half-Orc',2,0,0,-2,0,-2,'Medium',30),(7,'Halfling',-2,2,0,0,0,0,'Small',20);
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

-- Dump completed on 2018-10-01  2:26:32
