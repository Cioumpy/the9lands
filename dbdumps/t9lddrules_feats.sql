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
-- Table structure for table `feats`
--

DROP TABLE IF EXISTS `feats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `feat` varchar(45) DEFAULT NULL,
  `parameter` varchar(45) DEFAULT NULL,
  `type` varchar(45) NOT NULL DEFAULT 'general',
  `subtypes` text,
  `requisites` text COMMENT 'This generates an array of strings to be evaluated into formulas.',
  `desc` longtext,
  `taken` int NOT NULL DEFAULT '0',
  `multi` int NOT NULL DEFAULT '0' COMMENT '0 = No, 1 = Stackable, 2 = Not Stackable.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feats`
--

LOCK TABLES `feats` WRITE;
/*!40000 ALTER TABLE `feats` DISABLE KEYS */;
INSERT INTO `feats` VALUES
	(1,'Acrobatic',NULL,'general',NULL,NULL,'You have excellent body awareness and coordination.;;Benefit;;You get a +2 bonus on all Jump checks and Tumble checks.',0,0),
	(2,'Agile',NULL,'general',NULL,NULL,'You are particularly flexible and poised.;;Benefit;;You get a +2 bonus on all Balance checks and Escape Artist checks.',0,0),
	(3,'Alertness',NULL,'general',NULL,NULL,'You have finely tuned senses.;;Benefit;;You get a +2 bonus on all Listen checks and Spot checks.;;Special;;The master of a familiar gains the benefit of the Alertness feat whenever the familiar is within arm&#39;s reach.',0,0),
	(4,'Animal Affinity',NULL,'general',NULL,NULL,'You are good with animals.;;Benefit;;You get a +2 bonus on all Handle Animal checks and Ride checks.',0,0),
	(5,'Armor Proficiency (light)',NULL,'general',NULL,NULL,'You are proficient with light armor.;;Benefit;;When you wear a type of armor with which you are proficient, the armor check penalty for that armor applies only on Balance, Climb, Escape Artist, Hide, Jump, Move Silently, Sleight of Hand, and Tumble checks. Double the normal penalty applies on Swim checks.;;Normal;;A character who is wearing armor with which she is not proficient applies its armor check penalty on attack rolls and on all Strength-based or Dexterity-based ability and skill checks.;;Special;;All characters except wizards, sorcerers, and monks automatically have Armor Proficiency (light) as a bonus feat. They need not select it.',0,0),
	(6,'Armor Proficiency (medium)',NULL,'general',NULL,'reqFeat;;Armor Proficiency (light)','You are proficient with medium armor.;;Prerequisite;;Armor Proficiency (light).;;Benefit;;See Armor Proficiency (light).;;Normal;;See Armor Proficiency (light).;;Special;;Fighters, barbarians, paladins, clerics, and druids automatically have Armor Proficiency (medium) as a bonus feat. They need not select it.',0,0),
	(7,'Armor Proficiency (heavy)',NULL,'general',NULL,'reqFeat;;Armor Proficiency (medium)','You are proficient with heavy armor.;;Prerequisites;;Armor Proficiency (light), Armor Proficiency (medium).;;Benefit;;See Armor Proficiency (light).;;Normal;;See Armor Proficiency (light).;;Special;;Fighters, paladins, and clerics automatically have Armor Proficiency (heavy) as a bonus feat. They need not select it.',0,0),
	(8,'Athletic',NULL,'general',NULL,NULL,'You have a knack for athletic endeavors.;;Benefit;;You get a +2 bonus on all Climb checks and Swim checks.',0,0),
	(9,'Augment Summoning',NULL,'general',NULL,'reqFeat;;Spell Focus (conjuration)','Your summoned creatures are more powerful than normal.;;Prerequisite;;Spell Focus (conjuration).;;Benefit;;Each creature you conjure with any summon spell gains a +4 enhancement bonus to Strength and Constitution for the duration of the spell that summoned it.',0,0),
	(10,'Blind-Fight',NULL,'general','fighter',NULL,'You know how to fight in melee without being able to see your foes.;;Benefit;;In melee, every time you miss because of concealment, you can reroll your miss chance percentile roll one time to see if you actually hit. An invisible attacker gets no advantages related to hitting you in melee. That is, you don&#39;t lose your Dexterity bonus to Armor Class, and the attacker doesn&#39;t get the usual +2 bonus for being invisible. The invisible attacker&#39;s bonuses do still apply for ranged attacks, however. You take only half the usual penalty to speed for being unable to see. Darkness and poor visibility in general reduces your speed to three-quarters normal, instead of one-half.;;Normal;;Regular attack roll modifiers for invisible attackers trying to hit you apply, and you lose your Dexterity bonus to AC. The speed reduction for darkness and poor visibility also applies.;;Special;;The Blind-Fight feat is of no use against a character who is the subject of a blink spell. A fighter may select Blind-Fight as one of his fighter bonus feats.',0,0),
	(11,'Combat Casting',NULL,'general',NULL,NULL,'You are adept at casting spells in combat.;;Benefit;;You get a +4 bonus on Concentration checks made to cast a spell or use a spell-like ability while on the defensive or while you are grappling or pinned.',0,0),
	(12,'Combat Expertise',NULL,'general','fighter','reqAbility;;intelligence=13','You are trained at using your combat skill for defense as well as offense.;;Prerequisite;;Int 13.;;Benefit;;When you use the attack action or the full attack action in melee, you can take a penalty of as much as –5 on your attack roll and add the same number (+5 or less) as a dodge bonus to your Armor Class. This number may not exceed your base attack bonus. The changes to attack rolls and Armor Class last until your next action.;;Normal;;A character without the Combat Expertise feat can fight defensively while using the attack or full attack action to take a –4 penalty on attack rolls and gain a +2 dodge bonus to Armor Class.;;Special;;A fighter may select Combat Expertise as one of his fighter bonus feats.',0,0),
	(13,'Improved Disarm',NULL,'general','fighter','reqFeat;;Combat Expertise','You know how to disarm opponents in melee combat.;;Prerequisites;;Int 13, Combat Expertise.;;Benefit;;You do not provoke an attack of opportunity when you attempt to disarm an opponent, nor does the opponent have a chance to disarm you. You also gain a +4 bonus on the opposed attack roll you make to disarm your opponent.;;Normal;;See the normal disarm rules, on page 155 of the Player&#39;s Handbook.;;Special;;A fighter may select Improved Disarm as one of his fighter bonus feats.<br>A monk may select Improved Disarm as a bonus feat at 6th level, even if she does not meet the prerequisites.',0,0),
	(14,'Improved Feint',NULL,'general','fighter','reqFeat;;Combat Expertise','You are skilled at misdirecting your opponent’s attention in combat.;;Prerequisites;;Int 13, Combat Expertise.;;Benefit;;You can make a Bluff check to feint in combat as a move action.;;Normal;;Feinting in combat is a standard action.;;Special;;A fighter may select Improved Feint as one of his fighter bonus feats.',0,0),
	(15,'Improved Trip',NULL,'general','fighter','reqFeat;;Combat Expertise','You are trained not only in tripping opponents safely but also in following through with an attack.;;Prerequisites;;Int 13, Combat Expertise.;;Benefit;;You do not provoke an attack of opportunity when you attempt to trip an opponent while you are unarmed. You also gain a +4 bonus on your Strength check to trip your opponent.<br>If you trip an opponent in melee combat, you immediately get a melee attack against that 	opponent as if you hadn’t used your attack for the trip attempt. For example, at 11th level, Tordek gets three attacks at bonuses of +11, +6, and +1. In the current round, he attempts to trip his opponent. His first attempt fails (using up his first attack). His second attempt succeeds, and he immediately makes a melee attack against his opponent with a bonus of +6. Finally, he takes his last attack at a bonus of +1.;;Normal;;Without this feat, you provoke an attack of opportunity when you 	attempt to trip an opponent while you are unarmed.;;Special;;At 6th level, a monk may select Improved Trip as a bonus feat, even if she does not have the prerequisites.<br>A fighter may select Improved Trip as one of his fighter bonus feats.',0,0),
	(16,'Whirlwind Attack',NULL,'general','fighter','reqFeat;;Combat Expertise;;reqFeat;;Spring Attack',NULL,0,0),
	(17,'Combat Reflexes',NULL,'general','fighter',NULL,NULL,0,0),
	(18,'Deceitful',NULL,'general',NULL,NULL,NULL,0,0),
	(19,'Deft Hands',NULL,'general',NULL,NULL,NULL,0,0),
	(20,'Diligent',NULL,'general',NULL,NULL,NULL,0,0),
	(21,'Dodge',NULL,'general','fighter','reqAbility;;dexterity=13',NULL,0,0),
	(22,'Mobility',NULL,'general','fighter','reqFeat;;Dodge',NULL,0,0),
	(23,'Spring Attack',NULL,'general','fighter','reqFeat;;Mobility;;reqBAB;;4',NULL,0,0),
	(24,'Endurance',NULL,'general',NULL,NULL,NULL,0,0),
	(25,'Diehard',NULL,'general',NULL,'reqFeat;;Endurance',NULL,0,0),
	(26,'Eschew Materials',NULL,'general',NULL,NULL,NULL,0,0),
	(27,'Exotic Weapon Proficiency','weapons;;exotic','general','fighter','reqBAB;;1',NULL,0,2),
	(28,'Extra Turning',NULL,'general',NULL,'reqFeature;;Turn creatures',NULL,0,1),
	(29,'Great Fortitude',NULL,'general',NULL,NULL,NULL,0,0),
	(30,'Improved Counterspell',NULL,'general',NULL,NULL,NULL,0,0),
	(31,'Improved Critical','weapons','general','fighter','reqProficiency;;weapons;;reqBAB;;8',NULL,0,2),
	(32,'Improved Initiative',NULL,'general','fighter',NULL,NULL,0,0),
	(33,'Improved Turning',NULL,'general',NULL,'reqFeature;;Turn creatures',NULL,0,0),
	(34,'Improved Unarmed Strike',NULL,'general','fighter',NULL,NULL,0,0),
	(35,'Improved Grapple',NULL,'general','fighter','reqAbility;;dexterity=13;;reqFeat;;Improved Unarmed Strike',NULL,0,0),
	(36,'Deflect Arrows',NULL,'general','fighter','reqAbility;;dexterity=13;;reqFeat;;Improved Unarmed Strike',NULL,0,0),
	(37,'Snatch Arrows',NULL,'general','fighter','reqAbility;;dexterity=15;;reqFeat;;Deflect Arrows',NULL,0,0),
	(38,'Stunning Fist',NULL,'general','fighter','reqAbility;;dexterity=13;;reqAbility;;wisdom=13;;reqFeat;;Improved Unarmed Strike;;reqBAB;;8',NULL,0,0),
	(39,'Investigator',NULL,'general',NULL,NULL,NULL,0,0),
	(40,'Iron Will',NULL,'general',NULL,NULL,NULL,0,0),
	(41,'Leadership',NULL,'general',NULL,NULL,NULL,0,0),
	(42,'Lightning Reflexes ',NULL,'general',NULL,NULL,NULL,0,0),
	(43,'Magical Aptitude',NULL,'general',NULL,NULL,NULL,0,0),
	(44,'Martial Weapon Proficiency','weapons;;martial','general',NULL,NULL,NULL,0,2),
	(45,'Mounted Combat',NULL,'general','fighter',NULL,NULL,0,0),
	(46,'Mounted Archery',NULL,'general','fighter',NULL,NULL,0,0),
	(47,'Ride-By Attack',NULL,'general','fighter',NULL,NULL,0,0),
	(48,'Spirited Charge',NULL,'general','fighter',NULL,NULL,0,0),
	(49,'Trample',NULL,'general','fighter',NULL,NULL,0,0),
	(50,'Natural Spell',NULL,'general',NULL,NULL,NULL,0,0),
	(51,'Negotiator',NULL,'general',NULL,NULL,NULL,0,0),
	(52,'Nimble Fingers',NULL,'general',NULL,NULL,NULL,0,0),
	(53,'Persuasive',NULL,'general',NULL,NULL,NULL,0,0),
	(54,'Point Blank Shot',NULL,'general','fighter',NULL,NULL,0,0),
	(55,'Far Shot',NULL,'general','fighter',NULL,NULL,0,0),
	(56,'Precise Shot',NULL,'general','fighter',NULL,NULL,0,0),
	(57,'Improved Precise Shot',NULL,'general','fighter',NULL,NULL,0,0),
	(58,'Rapid Shot',NULL,'general','fighter',NULL,NULL,0,0),
	(59,'Manyshot',NULL,'general','fighter',NULL,NULL,0,0),
	(60,'Shot on the Run',NULL,'general','fighter',NULL,NULL,0,0),
	(61,'Power Attack',NULL,'general','fighter','reqAbility;;strength=13',NULL,0,0),
	(62,'Cleave',NULL,'general','fighter','reqFeat;;Power Attack',NULL,0,0),
	(63,'Great Cleave',NULL,'general','fighter','reqFeat;;Cleave;;reqBAB;;4',NULL,0,0),
	(64,'Improved Bull Rush',NULL,'general','fighter','reqFeat;;Power Attack',NULL,0,0),
	(65,'Improved Overrun',NULL,'general','fighter','reqFeat;;Power Attack',NULL,0,0),
	(66,'Improved Sunder',NULL,'general','fighter','reqFeat;;Power Attack',NULL,0,0),
	(67,'Quick Draw',NULL,'general','fighter','reqBAB;;1',NULL,0,0),
	(68,'Rapid Reload',NULL,'general','fighter',NULL,NULL,0,0),
	(69,'Run',NULL,'general',NULL,NULL,NULL,0,0),
	(70,'Self-Sufficient',NULL,'general',NULL,NULL,NULL,0,0),
	(71,'Shield Proficiency',NULL,'general',NULL,NULL,NULL,0,0),
	(72,'Improved Shield Bash',NULL,'general','fighter','reqFeat;;Shield Proficiency',NULL,0,0),
	(73,'Tower Shield Proficiency',NULL,'general',NULL,'reqFeat;;Shield Proficiency',NULL,0,0),
	(74,'Simple Weapon Proficiency',NULL,'general',NULL,NULL,NULL,0,0),
	(75,'Skill Focus','skills','general',NULL,NULL,NULL,0,2),
	(76,'Spell Focus','school','general',NULL,NULL,NULL,0,2),
	(77,'Greater Spell Focus','school','general',NULL,NULL,NULL,0,2),
	(78,'Spell Mastery',NULL,'general',NULL,NULL,NULL,0,0),
	(79,'Spell Penetration',NULL,'general',NULL,NULL,NULL,0,0),
	(80,'Greater Spell Penetration',NULL,'general',NULL,'reqFeat;;Spell Penetration',NULL,0,0),
	(81,'Stealthy',NULL,'general',NULL,NULL,NULL,0,0),
	(82,'Toughness',NULL,'general',NULL,NULL,NULL,0,0),
	(83,'Track',NULL,'general',NULL,NULL,NULL,0,0),
	(84,'Two-Weapon Fighting',NULL,'general','fighter','reqAbility;;dexterity=15',NULL,0,0),
	(85,'Two-Weapon Defense',NULL,'general','fighter','reqFeat;;Two-Weapon Fighting',NULL,0,0),
	(86,'Improved Two-Weapon Fighting',NULL,'general','fighter','reqAbility;;dexterity=17;;reqFeat;;Two-Weapon Fighting;;reqBAB;;6',NULL,0,0),
	(87,'Greater Two-Weapon Fighting',NULL,'general','fighter','reqAbility;;dexterity=19;;reqFeat;;Improved Two-Weapon Fighting;;reqBAB;;11',NULL,0,0),
	(88,'Weapon Finesse',NULL,'general','fighter','reqBAB;;1',NULL,0,0),
	(89,'Weapon Focus','weapons','general','fighter',NULL,NULL,0,2),
	(90,'Weapon Specialization','weapons','general','fighter',NULL,NULL,0,2),
	(91,'Greater Weapon Focus','weapons','general','fighter',NULL,NULL,0,2),
	(92,'Greater Weapon Specialization','weapons','general','fighter',NULL,NULL,0,2),
	(93,'Brew Potion',NULL,'item creation',NULL,NULL,NULL,0,0),
	(94,'Craft Magic Arms and Armor',NULL,'item creation',NULL,NULL,NULL,0,0),
	(95,'Craft Rod',NULL,'item creation',NULL,NULL,NULL,0,0),
	(96,'Craft Staff',NULL,'item creation',NULL,NULL,NULL,0,0),
	(97,'Craft Wand',NULL,'item creation',NULL,NULL,NULL,0,0),
	(98,'Craft Wondrous Item',NULL,'item creation',NULL,NULL,NULL,0,0),
	(99,'Forge Ring',NULL,'item creation',NULL,NULL,NULL,0,0),
	(100,'Scribe Scroll',NULL,'item creation',NULL,NULL,NULL,0,0),
	(101,'Empower Spell',NULL,'metamagic',NULL,NULL,NULL,0,0),
	(102,'Enlarge Spell',NULL,'metamagic',NULL,NULL,NULL,0,0),
	(103,'Extend Spell',NULL,'metamagic',NULL,NULL,NULL,0,0),
	(104,'Heighten Spell',NULL,'metamagic',NULL,NULL,NULL,0,0),
	(105,'Maximize Spell',NULL,'metamagic',NULL,NULL,NULL,0,0),
	(106,'Quicken Spell',NULL,'metamagic',NULL,NULL,NULL,0,0),
	(107,'Silent Spell',NULL,'metamagic',NULL,NULL,NULL,0,0),
	(108,'Still Spell',NULL,'metamagic',NULL,NULL,NULL,0,0),
	(109,'Widen Spell',NULL,'metamagic',NULL,NULL,NULL,0,0);
/*!40000 ALTER TABLE `feats` ENABLE KEYS */;
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
