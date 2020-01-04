CREATE DATABASE  IF NOT EXISTS `t9lddrules` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t9lddrules`;
-- MySQL dump 10.13  Distrib 8.0.18, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: t9lddrules
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `alignments`
--

DROP TABLE IF EXISTS `alignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-05  0:06:45
