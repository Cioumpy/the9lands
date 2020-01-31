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
-- Table structure for table `racedesc`
--

DROP TABLE IF EXISTS `racedesc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `racedesc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `race` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `manual` varchar(45) DEFAULT NULL,
  `page` int DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `intro` text,
  `strength` int NOT NULL DEFAULT '0',
  `dexterity` int NOT NULL DEFAULT '0',
  `constitution` int NOT NULL DEFAULT '0',
  `intelligence` int NOT NULL DEFAULT '0',
  `wisdom` int NOT NULL DEFAULT '0',
  `charisma` int NOT NULL DEFAULT '0',
  `abilitydesc` text,
  `size` varchar(45) NOT NULL DEFAULT 'Medium',
  `speed` int NOT NULL DEFAULT '30',
  `encumbered` int NOT NULL DEFAULT '20',
  `favclass` varchar(45) NOT NULL DEFAULT 'Any',
  `autolangs` varchar(45) NOT NULL DEFAULT 'Common',
  `bonuslangs` varchar(45) DEFAULT NULL,
  `skillpoints` int NOT NULL DEFAULT '0',
  `skillbonus` longtext,
  `bonusfeats` longtext,
  `weapfamil` varchar(45) DEFAULT NULL,
  `darkvision` int DEFAULT NULL,
  `lowlightvision` int DEFAULT NULL,
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
INSERT INTO `racedesc` VALUES
	(1,'Human',NULL,'Player&#39;s Handbook v3.5',12,'ddHuman.png','Most humans are the descendants of pioneers, conquerors, traders, travelers, refugees, and other people on the move. As a result, human lands are home to a mix of people&#8212;physically, culturally, religiously, and politically different. Hardy or fine, light-skinned or dark, showy or austere, primitive or civilized, devout or impious, humans run the gamut.',0,0,0,0,0,0,NULL,'Medium',30,20,'Any','Common','Any',1,NULL,'1',NULL,NULL,NULL,'1 extra feat at 1st level, because humans are quick to master specialized tasks and varied in their talents.;;4 extra skill points at 1st level and 1 extra skill point at each additional level, since humans are versatile and capable.'),
	(2,'Dwarf',NULL,'Player&#39;s Handbook v3.5',14,'ddDwarf.png','Dwarves are known for their skill in warfare, their ability to withstand physical and magical punishment, their knowledge of the earth&#39;s secrets, their hard work, and their capacity for drinking ale. Their mysterious kingdoms, carved out from the insides of mountains, are renowned for the marvelous treasures that they produce as gifts or for trade.',0,0,2,0,0,-2,'Dwarves are stout and tough but tend to be gruff and reserved.','Medium',20,20,'Fighter','Common;Dwarven','Giant;Gnome;Goblin;Orc;Terran;Undercommon',0,NULL,'0','dwarwen',60,NULL,'Stonecunning: This ability grants a dwarf a +2 racial bonus on Search checks to notice unusual stonework, such as sliding walls, stonework traps, new construction (even when built to match the old), unsafe stone surfaces, shaky stone ceilings, and the like. Something that isn&#8217;t stone but that is disguised as stone also counts as unusual stonework. A dwarf who merely comes within 10 feet of unusual stonework can make a Search check as if he were actively searching, and a dwarf can use the Search skill to find stonework traps as a rogue can. A dwarf can also intuit depth, sensing his approximate depth underground as naturally as a human can sense which way is up. Dwarves have a sixth sense about stonework, an innate ability that they get plenty of opportunity to practice and hone in their underground homes.;;Stability: Dwarves are exceptionally stable on their feet. A dwarf gains a +4 bonus on ability checks made to resist being bull rushed or tripped when standing on the ground (but not when climbing, flying, riding, or otherwise not standing firmly on the ground).;;+2 racial bonus on saving throws against poison: Dwarves are hardy and resistant to toxins.;;+2 racial bonus on saving throws against spells and spell-like effects: Dwarves have an innate resistance to magic spells.;;+1 racial bonus on attack rolls against orcs (including half-orcs) and goblinoids (including goblins, hobgoblins, and bugbears): Dwarves are trained in the special combat techniques that allow them to fight their common enemies more effectively.;;+4 dodge bonus to Armor Class against monsters of the giant type (such as ogres, trolls, and hill giants): This bonus represents special training that dwarves undergo, during which they learn tricks that previous generations developed in their battles with giants. Any time a creature loses its Dexterity bonus (if any) to Armor Class, such as when it&#8217;s caught flat-footed, it loses its dodge bonus, too.;;+2 racial bonus on Appraise checks that are related to stone or metal items: Dwarves are familiar with valuable items of all kinds, especially those made of stone or metal.;;+2 racial bonus on Craft checks that are related to stone or metal: Dwarves are especially capable with stonework and metalwork.'),
	(3,'Elf',NULL,'Player&#39;s Handbook v3.5',15,'ddElf.png','Elves mingle freely in human lands, always welcome yet never at home there. They are well known for their poetry, dance, song, lore, and magical arts. Elves favor things of natural and simple beauty. When danger threatens their woodland homes, however, elves reveal a more martial side, demonstrating skill with sword, bow, and battle strategy.',0,2,-2,0,0,0,'Elves are graceful but frail. An elf&#39;s grace makes her naturally better at stealth and archery.','Medium',30,20,'Wizard','Common;Elven','Draconic;Gnoll;Gnome;Goblin;Orc;Sylvan',0,'Listen;2;Search;2;Spot;2','0;Martial Weapon Proficiency (longsword);Martial Weapon Proficiency (rapier);Martial Weapon Proficiency (longbow);Martial Weapon Proficiency (shortbow)','elven',NULL,2,'Immunity to magic sleep effects, and a +2 racial saving throw bonus against enchantment spells or effects.;;Low-Light Vision: An elf can see twice as far as a human in starlight, moonlight, torchlight, and similar conditions of poor illumination. She retains the ability to distinguish color and detail under these conditions.;;Weapon Proficiency: Elves receive the Martial Weapon Proficiency feats for the longsword, rapier, longbow (including composite longbow), and shortbow (including composite shortbow) as bonus feats. Elves esteem the arts of swordplay and archery, so all elves are familiar with these weapons.;;+2 racial bonus on Listen, Search, and Spot checks. An elf who merely passes within 5 feet of a secret or concealed door is entitled to a Search check to notice it as if she were actively looking for it. An elf&#8217;s senses are so keen that she practically has a sixth sense about hidden portals.'),
	(4,'Gnome',NULL,'Player&#39;s Handbook v3.5',16,'ddGnome.png','Gnomes are welcome everywhere as technicians, alchemists, and inventors. Despite the demand for their skills, most gnomes prefer to remain among their own kind, living in comfortable burrows beneath rolling, wooded hills where animals abound.',-2,0,2,0,0,0,'Like dwarves, gnomes are tough, but they are small and therefore not as strong as larger humanoids.','Small',20,15,'Bard','Common;Gnome','Draconic;Dwarven;Elven;Giant;Goblin;Orc',0,'Craft (alchemy);2;Listen;2','0','gnome',NULL,2,'Low-Light Vision: A gnome can see twice as far as a human in starlight, moonlight, torchlight, and similar conditions of poor illumination. He retains the ability to distinguish color and detail under these conditions.;;Weapon Familiarity: Gnomes may treat gnome hooked hammers as martial weapons rather than exotic weapons.;;+2 racial bonus on saving throws against illusions: Gnomes are innately familiar with illusions of all kinds.;;Add +1 to the Difficulty Class for all saving throws against illusion spells cast by gnomes. Their innate familiarity with these effects make their illusions more difficult to see through. This adjustment stacks with those from similar effects, such as the Spell Focus feat.;;+1 racial bonus on attack rolls against kobolds and goblinoids (including goblins, hobgoblins, and bugbears): Gnomes battle these creatures frequently and practice special techniques for fighting them.;;+4 dodge bonus to Armor Class against monsters of the giant type (such as ogres, trolls, and hill giants): This bonus represents special training that gnomes undergo, during which they learn tricks that previous generations developed in their battles with giants. Any time a creature loses its Dexterity bonus (if any) to Armor Class, such as when it&#8217;s caught flat-footed, it loses its dodge bonus, too. The Monster Manual has information on which creatures are of the giant type.;;+2 racial bonus on Listen checks: Gnomes have keen ears.;;+2 racial bonus on Craft (alchemy) checks: A gnome&#8217;s sensitive nose allows him to monitor alchemical processes by smell.;;Spell-Like Abilities: 1/day&#8212;speak with animals (burrowing mammal only, duration 1 minute). A gnome with a Charisma score of at least 10 also has the following spell-like abilities: 1/day&#8212;dancing lights, ghost sound, prestidigitation. Caster level 1st; save DC 10 + gnome&#8217;s Cha modifier + spell level.'),
	(5,'Half-Elf',NULL,'Player&#39;s Handbook v3.5',18,'ddHalf-Elf.png','Humans and elves sometimes wed, the elf attracted to the human&#39;s energy and the human to the elf&#39;s grace. These marriages end quickly as elves count years because a human&#39;s life is so brief, but they leave an enduring legacy&#8212;half-elf children.<br><br>The life of a half-elf can be hard. If raised by elves, the half-elf seems to grow with astounding speed, reaching maturity within two decades. The half-elf becomes an adult long before she has had time to learn the intricacies of elven art and culture, or even grammar. She leaves behind her childhood friends, becoming physically an adult but culturally still a child by elven standards. Typically, she leaves her elven home, which is no longer familiar, and finds her way among humans.<br><br>If, on the other hand, she is raised by humans, the half-elf finds herself different from her peers: more aloof, more sensitive, less ambitious, and slower to mature. Some half-elves try to fit in among humans, while others find their identities in their difference. Most find places for themselves in human lands, but some feel like outsiders all their lives.',0,0,0,0,0,0,NULL,'Medium',30,20,'Any','Common;Elven','Any',0,'Listen;1;Search;1;Spot;1;Diplomacy;2;Gather Informations;2','0',NULL,NULL,2,'Immunity to sleep spells and similar magical effects, and a +2 racial bonus on saving throws against enchantment spells or effects.;;Low-Light Vision: A half-elf can see twice as far as a human in starlight, moonlight, torchlight, and similar conditions of poor illumination. She retains the ability to distinguish color and detail under these conditions.;;+1 racial bonus on Listen, Search, and Spot checks: A half-elf does not have the elf&#8217;s ability to notice secret doors simply by passing near them. Half-elves have keen senses, but not as keen as those of an elf.;;+2 racial bonus on Diplomacy and Gather Information checks: Half-elves get along naturally with all people.;;Elven Blood: For all effects related to race, a half-elf is considered an elf. Half-elves, for example, are just as vulnerable to special effects that affect elves as their elf ancestors are, and they can use magic items that are only usable by elves.'),
	(6,'Half-Orc',NULL,'Player&#39;s Handbook v3.5',18,'ddHalf-Orc.png','In the wild frontiers, tribes of human and orc barbarians live in uneasy balance, fighting in times of war and trading in times of peace. Half-orcs who are born in the frontier may live with either human or orc parents, but they are nevertheless exposed to both cultures. Some, for whatever reason, leave their homeland and travel to civilized lands, bringing with them the tenacity, courage, and combat prowess that they developed in the wilds.',2,0,0,-2,0,-2,'Half-orcs are strong, but their orc lineage makes them dull and crude.','Medium',30,20,'Barbarian','Common;Orc','Draconic;Giant;Gnoll;Goblin;Abyssal',0,NULL,'0',NULL,60,NULL,'Darkvision: Half-orcs (and orcs) can see in the dark up to 60 feet. Darkvision is black and white only, but it is otherwise like normal sight, and half-orcs can function just fine with no light at all.;;Orc Blood: For all effects related to race, a half-orc is considered an orc. Half-orcs, for example, are just as vulnerable to special effects that affect orcs as their orc ancestors are, and they can use magic items that are only usable by orcs.'),
	(7,'Halfling',NULL,'Player&#39;s Handbook v3.5',19,'ddHalfling.png','Halflings are clever, capable opportunists. Halfling individuals and clans find room for themselves wherever they can. Often they are strangers and wanderers, and others react to them with suspicion or curiosity. Depending on the clan, halflings might be reliable, hard-working (if clannish) citizens, or they might be thieves just waiting for the opportunity to make a big score and disappear in the dead of night. Regardless, halflings are cunning, resourceful survivors.',-2,2,0,0,0,0,'Halflings are quick, agile, and good with ranged weapons, but they are small and therefore not as strong as other humanoids.','Small',20,15,'Rogue','Common;Halfling','Dwarven;Elven;Gnome;Goblin;Orc',0,'Climb;2;Jump;2;Listen;2;Move Silently;2;','0','halfling',NULL,NULL,'+2 racial bonus on Climb, Jump, and Move Silently checks: Halflings are agile, surefooted, and athletic.;;+1 racial bonus on all saving throws: Halflings are surprisingly capable of avoiding mishaps.;;+2 morale bonus on saving throws against fear: This bonus stacks with the halfling&#8217;s +1 bonus on saving throws in general.;+1 racial bonus on attack rolls with thrown weapons and slings: Throwing and slinging stones is a universal sport among halflings, and they develop especially good aim.;+2 racial bonus on Listen checks: Halflings have keen ears.');
/*!40000 ALTER TABLE `racedesc` ENABLE KEYS */;
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
