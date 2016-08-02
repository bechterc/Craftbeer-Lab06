-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: craftbeer
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Current Database: `craftbeer`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `craftbeer` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `craftbeer`;

--
-- Table structure for table `beer`
--

DROP TABLE IF EXISTS `beer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beer` (
  `beerID` int(11) NOT NULL AUTO_INCREMENT,
  `beerName` varchar(55) DEFAULT NULL,
  `beerDescription` varchar(255) DEFAULT NULL,
  `beerAlcohol` decimal(3,1) NOT NULL,
  `styleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`beerID`),
  KEY `styleID` (`styleID`),
  CONSTRAINT `beer_ibfk_1` FOREIGN KEY (`styleID`) REFERENCES `style` (`styleID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beer`
--

LOCK TABLES `beer` WRITE;
/*!40000 ALTER TABLE `beer` DISABLE KEYS */;
INSERT INTO `beer` VALUES (1,'60 Minute','lots of citrusy hops',6.0,1),(2,'Number 9','sort of dry, crisp and refreshing',5.1,2),(3,'JavaHead','creamy oatmeal flavor',7.5,3),(4,'DirtWolf','dark hops strong taste',8.7,4),(5,'Double Bock','intense double malt roast',9.5,5),(6,'A Little Sumpin Sumpin','filtered pale wheat ale with a strong hop finish',7.5,6);
/*!40000 ALTER TABLE `beer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brewery`
--

DROP TABLE IF EXISTS `brewery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brewery` (
  `breweryID` int(11) NOT NULL AUTO_INCREMENT,
  `breweryName` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`breweryID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brewery`
--

LOCK TABLES `brewery` WRITE;
/*!40000 ALTER TABLE `brewery` DISABLE KEYS */;
INSERT INTO `brewery` VALUES (1,'Dogfish Head'),(2,'Magic Hat'),(3,'Troeggs'),(4,'Victory'),(5,'Sam Adams'),(6,'Lagunitas');
/*!40000 ALTER TABLE `brewery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style`
--

DROP TABLE IF EXISTS `style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `style` (
  `styleID` int(11) NOT NULL AUTO_INCREMENT,
  `styleName` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`styleID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style`
--

LOCK TABLES `style` WRITE;
/*!40000 ALTER TABLE `style` DISABLE KEYS */;
INSERT INTO `style` VALUES (1,'India Pale Ale'),(2,'Pale Ale'),(3,'Stout'),(4,'Double IPA'),(5,'Doppelbock'),(6,'Wheat Ale');
/*!40000 ALTER TABLE `style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taste`
--

DROP TABLE IF EXISTS `taste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taste` (
  `styleID` int(11) DEFAULT NULL,
  `breweryID` int(11) DEFAULT NULL,
  `tasteMetaData` blob,
  UNIQUE KEY `pkTaste` (`styleID`,`breweryID`),
  KEY `breweryID` (`breweryID`),
  CONSTRAINT `taste_ibfk_1` FOREIGN KEY (`styleID`) REFERENCES `style` (`styleID`),
  CONSTRAINT `taste_ibfk_2` FOREIGN KEY (`breweryID`) REFERENCES `brewery` (`breweryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taste`
--

LOCK TABLES `taste` WRITE;
/*!40000 ALTER TABLE `taste` DISABLE KEYS */;
INSERT INTO `taste` VALUES (1,1,'delightful'),(2,4,'very rare find'),(3,2,'delicious'),(6,2,'brewmasters'),(4,5,'not very tastey'),(5,6,'never tried');
/*!40000 ALTER TABLE `taste` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-02  0:50:32
