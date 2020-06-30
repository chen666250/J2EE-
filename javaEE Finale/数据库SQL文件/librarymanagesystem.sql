CREATE DATABASE  IF NOT EXISTS `librarymanagesystem` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `librarymanagesystem`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: librarymanagesystem
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(255) NOT NULL,
  `adminPassword` varchar(255) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','admin'),(2,'admin2','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(255) NOT NULL,
  `status` varchar(45) DEFAULT 'STOCK',
  `describes` varchar(255) DEFAULT 'null',
  `note` varchar(255) DEFAULT 'null',
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'math之线性代数','CHECKING','李永乐','null'),(2,'math2','RENT','null','null'),(3,'JAVA','STOCK','null','null'),(4,'PYTHON','RENT','null','null'),(5,'mysql','STOCK','null','null'),(6,'english','CHECKING','null','null'),(7,'葫芦娃','STOCK','null','null'),(8,'格列佛游记','CHECKING','null','null'),(12,'神经漫游者','CHECKING','null','null'),(13,'山口山','STOCK','null','null'),(14,'一本催人泪下的小说','STOCK','null','null'),(15,'j2EE ','CHECKING','null','null'),(16,'python3','STOCK','OREILLY','null'),(22,'阿Q正传','STOCK','','null'),(23,'math之线性代数','STOCK','李永乐','null');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `bookId` int(11) NOT NULL,
  `rentTime` date NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'CHECKING',
  `note` varchar(255) DEFAULT NULL,
  `bookName` varchar(45) NOT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,3,'2020-04-10','DONE',NULL,'JAVA'),(2,1,4,'2020-04-10','RENT',NULL,'PYTHON'),(3,1,2,'2020-04-10','RENT',NULL,'math2'),(4,1,5,'2020-04-10','DONE',NULL,'mysql'),(5,1,1,'2020-04-11','DONE',NULL,'math1'),(6,1,3,'2020-04-11','DONE',NULL,'JAVA'),(7,1,8,'2020-04-11','CHECKING',NULL,'格列佛游记'),(8,14,6,'2020-04-11','CHECKING',NULL,'english'),(9,14,12,'2020-04-11','CHECKING',NULL,'神经漫游者'),(10,1,15,'2020-04-11','CHECKING',NULL,'j2EE '),(11,1,5,'2020-04-12','CHECKING',NULL,'mysql'),(12,1,1,'2020-04-14','CHECKING',NULL,'math之线性代数'),(13,3,13,'2020-04-15','DONE',NULL,'山口山');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(256) NOT NULL,
  `passWord` varchar(256) NOT NULL,
  `userStatus` varchar(10) DEFAULT 'LIVE',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'chen','123','LIVE'),(2,'zhang','123','LIVE'),(4,'wang','123','LIVE'),(5,'zhao','123','LIVE'),(6,'gao','123','LIVE'),(7,'zhi','123','LIVE'),(8,'tao','123','LIVE'),(9,'hu','123','LIVE'),(10,'yu','123','LIVE'),(11,'huwan','123','LIVE'),(12,'gui','123','LIVE'),(13,'wu','123','LIVE'),(14,'yan','123','LIVE'),(15,'tian','123','LIVE'),(16,'SUN','123','LIVE');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-16 17:01:30
