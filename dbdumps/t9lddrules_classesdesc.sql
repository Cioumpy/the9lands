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
-- Table structure for table `classesdesc`
--

DROP TABLE IF EXISTS `classesdesc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classesdesc` (
  `id` int NOT NULL AUTO_INCREMENT,
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
INSERT INTO `classesdesc` VALUES
	(1,'Barbarian','A ferocious warrior who uses fury and instinct to bring down foes.','Player&#39;s Handbook v3.5','24','ddBarbarian.png','From the frozen wastes of the north and the hellish jungles of the south come brave, even reckless, warriors. Civilized people call them barbarians or berserkers and suspect them of mayhem, impiety, and atrocities. These &quot;barbarians&quot;, however, have proven their mettle and their value to those who would be their allies. To enemies who underestimated them, they have proved their cunning, resourcefulness, persistence, and mercilessness.','Adventuring is the best chance barbarians have of finding a place in a civilized society. They&#39;re not well suited to the monotony of guard duty or other mundane tasks. Barbarians also have no trouble with the dangers, the uncertainties, and the wandering that adventuring involves. They may adventure to defeat hated enemies. They have a noted distaste for that which they consider unnatural, including undead, demons, and devils.','The barbarian is an excellent warrior. Where the fighter&#39;s skill in combat comes from training and discipline, however, the barbarian has a powerful rage. While in this berserk fury, he becomes stronger and tougher, better able to defeat his foes and withstand their attacks. These rages leave him winded, and he has the energy for only a few such spectacular displays per day, but those few rages are usually sufficient. He is at home in the wild, and he runs at great speed.','Barbarians are never lawful. They may be honorable, but at heart they are wild. This wildness is their strength, and it could not live in a lawful soul. At best, barbarians of chaotic alignment are free and expressive. At worst, they are thoughtlessly destructive.','Some barbarians distrust established religions and prefer an intuitive, natural relationship to the cosmos over formal worship. Others devote themselves to powerful deities, such as Kord (god of strength), Obad-Hai (god of nature), or Erythnul (god of slaughter). A barbarian is capable of fierce devotion to his god.','Barbarians come from uncivilized lands or from barbaric tribes on the outskirts of civilization. A barbarian adventurer may have been lured to the settled lands by the promise of riches, may have escaped after being captured in his homeland and sold into &quot;civilized&quot; slavery, may have been recruited as a soldier, or may have been driven out of his homeland by invaders. Barbarians share no bond with each other unless they come from the same tribe or land. In fact, they think of themselves not as barbarians but as warriors.','Human barbarians come from the distant wild lands on the edge of civilization. Most half-orc barbarians lived among orcs before abandoning them for human lands. Dwarf barbarians are rare, usually hailing from dwarven kingdoms that have fallen into barbarism as a result of recurrent war with goblinoids, orcs, and giants. Barbarians of other races are very rare. Among the brutal humanoids, barbarians are more common than fighters. Orcs and ogres are especially likely to be barbarians.','As people of the wild, barbarians are most comfortable in the company of rangers, druids, and clerics of nature deities, such as Obad-Hai or Ehlonna. Many barbarians admire the talents and spontaneity of bards, and some are enthusiastic lovers of music. Barbarians don&#39;t trust that which they don&#39;t understand, and that includes wizardry, which they call &quot;book magic&quot;. They find sorcerers more understandable than wizards, but maybe that&#39;s just because sorcerers tend to be more charismatic. Monks, with their studied, practiced, deliberate approach to combat, sometimes have a hard time seeing eye to eye with barbarians, but members of these classes aren&#39;t necessarily hostile to each other. Barbarians have no special attitudes toward fighters, paladins, clerics, or rogues.','A barbarian&#39;s typical primary role in a group of adventurers is as a front-line combat specialist. No other character can match his sheer toughness. He can also serve as a good scout, thanks to his speed, skill selection, and trap sense.'),
	(2,'Bard','A performer whose music works magic &#8212; a wanderer, a taleteller, and a jack-of-all trades.','Player&#39;s Handbook v3.5','26','ddBard.png','It is said that music has a special magic, and the bard proves that saying true. Wandering across the land, gathering lore, telling stories, working magic with his music, and living on the gratitude of his audience &#8212; such is the life of a bard. When chance or opportunity draws them into a conflict, bards serve as diplomats, negotiators, messengers, scouts, and spies. A bard&#39;s magic comes from the heart. If his heart is good, a bard brings hope and courage to the downtrodden and uses his tricks, music, and magic to thwart the schemes of evildoers. If the nobles of the land are corrupt, the good bard is an enemy of the state, cunningly evading capture and raising the spirits of the oppressed. But music can spring from an evil heart as well. Evil bards forego blatant violence in favor of manipulation, holding sway over the hearts and minds of others and taking what enraptured audiences &quot;willingly&quot; give.','Bards see adventures as opportunities to learn. They practice their many skills and abilities, and they especially relish the opportunity to enter a long-forgotten tomb, to discover ancient works of magic, to decipher old tomes, to travel to strange places, to encounter exotic creatures, and to learn new songs and stories. Bards love to accompany heroes (and villains), joining their entourage to witness their deeds firsthand &#8212; a bard who can tell a marvelous story from personal experience earns renown among his fellows. Indeed, after telling so many stories about heroes doing mighty deeds, many bards take these themes to heart and assume heroic roles themselves.','A bard brings forth magic from his soul, not from a book. He can cast only a small number of spells, but he can do so without selecting or preparing them in advance. His magic emphasizes charms and illusions over the more dramatic evocation spells that wizards and sorcerers often use. In addition to spells, a bard works magic with his music and poetry. He can encourage allies, hold his audiences rapt, and counter magical effects that rely on speech or sound. Bards have some of the skills that rogues have, although bards they are not as focused on skill mastery as rogues are. A bard listens to stories as well as telling them, of course, so he has a vast knowledge of local events and noteworthy items.','Bards are wanderers, guided by whim and intuition rather than by tradition or law. The spontaneous talent, magic, and lifestyle of the bard are incompatible with a lawful alignment.','Bards revere Fharlanghn (god of roads). They sometimes camp near his wayside shrines, hoping to earn some coin from the travelers who stop to leave offerings for the god. Many bards, even those who are not elves, worship Corellon Larethian, god of elves and patron of poetry and music. Many good bards are partial to Pelor (god of the sun), believing that he watches over them in their travels. Bards given to chaos and occasional larceny favor Olidammara (god of thieves). Those who have turned to evil ways are known to worship Erythnul (the god of slaughter), though few will admit to it. In any event, bards spend so much time on the road that, while they may be devoted to a deity, they are rarely devoted to any particular temple.','An apprentice bard learns his skills from a single experienced bard, whom he follows and serves until he is ready to strike out on his own. Many bards were once young runaways or orphans, befriended by wandering bards who became their mentors. Since bards occasionally congregate in informal &quot;colleges&quot;, the apprentice bard may meet many of the more prominent bards in the area. Still, the bard has no strong allegiance to bards as a whole. In fact, some bards are highly competitive with other bards, jealous of their reputations and defensive about their territories.','Bards are commonly human, gnome, elf, or half-elf. Humans take well to the wandering life and adapt easily to new lands and customs. Gnomes have a sense of humor and trickery that lends itself to a bardic career. Elves are talented in music and magic, so the career of the bard comes naturally to them. A bard&#39;s wandering ways suit many half-elves, who often feel like strangers even when at home. Half-orcs, even those raised among humans, find themselves ill suited to the demands of a bard&#39;s career. There are no bardic traditions among dwarves, or halflings, though occasional individuals of these races find teachers to train them in the ways of the bard. Bards are exceedingly rare among the savage humanoids, except among centaurs. Centaur bards sometimes train the children of humans or other humanoids.','A bard works well with companions of other classes. He often serves as the spokesman of the party, using his social skills for the party&#39;s benefit. In a party without a wizard or sorcerer, the bard contributes his magic. In a party without a rogue, he uses his skills. A bard is curious about the ways of more focused or dedicated adventurers, so he often tries to pick up pointers from fighters, sorcerers, and rogues.','The bard is perhaps the ultimate generalist. In most adventuring groups, he works best in a supporting role. He can&#39;t usually match the stealth of the ranger or the rogue, the spellcasting power of the cleric or the wizard, or the combat prowess of the barbarian or the fighter. However, he makes all the other characters better at what they do, and he can often fill in for another character when needed. For a typical group of four characters, the bard is perhaps the most useful fifth character to consider adding, and he can make a great team leader.'),
	(3,'Cleric','A master of divine magic and a capable warrior as well.','Player&#39;s Handbook v3.5','30','ddCleric.png','The handiwork of the gods is everywhere&#8212;in places of natural beauty, in mighty crusades, in soaring temples, and in the hearts of worshipers. Like people, gods run the gamut from benevolent to malicious, reserved to intrusive, simple to inscrutable. The gods, however, work mostly through intermediaries&#8212;their clerics. Good clerics heal, protect, and avenge. Evil clerics pillage, destroy, and sabotage. A cleric uses the power of his god to make his god&#39;s will manifest. And if a cleric uses his god&#39;s power to improve his own lot, that&#39;s to be expected, too.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,'Druid','One who draws energy from the natural world to cast divine spells and gain strange magical powers.','Player&#39;s Handbook v3.5','33','ddDruid.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(5,'Fighter','A warrior with exceptional combat capability and unequaled skill with weapons.','Player&#39;s Handbook v3.5','37','ddFighter.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(6,'Monk','A martial artist whose unarmed strikes hit fast and hard &#8212; a master of exotic powers.','Player&#39;s Handbook v3.5','39','ddMonk.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(7,'Paladin','A champion of justice and destroyer of evil, protected and strengthened by an array of divine powers.','Player&#39;s Handbook v3.5','42','ddPaladin.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(8,'Ranger','A cunning, skilled warrior of the wilderness. ','Player&#39;s Handbook v3.5','46','ddRanger.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(9,'Rogue','A tricky, skillful scout and spy who wins the battle by stealth rather than brute force.','Player&#39;s Handbook v3.5','49','ddRogue.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(10,'Sorcerer','A spellcaster with inborn magical ability.','Player&#39;s Handbook v3.5','51','ddSorcerer.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(11,'Wizard','A potent spellcaster schooled in the arcane arts.','Player&#39;s Handbook v3.5','55','ddWizard.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `classesdesc` ENABLE KEYS */;
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
