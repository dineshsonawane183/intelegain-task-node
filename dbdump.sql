-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: testdb
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `joining_date` datetime DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Dinesh','my address','939393393','dienshz@gmail.com','programmer analyst','2020-10-22 00:00:00','1997-10-22 00:00:00'),(9,'dfjbdf','dfdf','34545656777','fd@gmail.com',NULL,'2021-02-18 00:00:00','2021-02-24 00:00:00'),(11,'hello1','sdsdd1','43435567671','thsi@gmail.com1',NULL,'2021-02-23 00:00:00','2021-02-26 00:00:00');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_table`
--

DROP TABLE IF EXISTS `permissions_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions_table` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PERMISSION_CODE` varchar(20) NOT NULL,
  `PERMISSION_DESC` varchar(100) NOT NULL,
  `CREATED_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_table`
--

LOCK TABLES `permissions_table` WRITE;
/*!40000 ALTER TABLE `permissions_table` DISABLE KEYS */;
INSERT INTO `permissions_table` VALUES (1,'CREATE','user can create user','2021-02-02 18:43:51'),(2,'ALL','user have all access','2021-02-02 18:48:15'),(3,'READ','user can view details','2021-02-03 13:03:28'),(4,'WRITE','user can write ','2021-02-05 12:51:45'),(5,'READ+','read+','2021-02-05 13:11:48'),(6,'WRITE+','write+','2021-02-05 13:12:06');
/*!40000 ALTER TABLE `permissions_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ROLE_TYPE` varchar(255) DEFAULT NULL,
  `ROLE_DESCRIPTION` varchar(100) NOT NULL,
  `CREATED_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `PERMISSION_ID_FK` int NOT NULL,
  `parent` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PERMISSION_ID_FK` (`PERMISSION_ID_FK`),
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`PERMISSION_ID_FK`) REFERENCES `permissions_table` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'CHAIRMAN','ALL','2021-02-05 11:26:08',2,0),(2,'GUEST','READ','2021-02-05 11:37:57',3,5),(5,'CEO','CEO','2021-02-05 11:59:57',1,1),(14,'CTO','CTO','2021-02-05 12:23:11',2,5),(15,'CFO','CFO','2021-02-05 12:27:02',2,14),(16,'CMO','CMO','2021-02-05 13:13:21',6,5),(17,'VICE PRESIDENT','VICE PRESIDENT','2021-02-05 13:14:15',6,16),(18,'MANAGER','MANAGER','2021-02-05 13:14:42',6,17),(19,'ASSOCIATE MANAGEGER','ASSOCIATE MANAGEGER','2021-02-05 13:15:37',6,17),(20,'PROGRAMMER ANALYST','PROGRAMMER ANALYST','2021-02-05 13:16:11',5,18),(21,'JR.PROGRAMMER ANALYST','JR.PROGRAMMER ANALYST','2021-02-05 13:22:41',5,18),(22,'ADMIN','ADMIN','2021-02-05 17:29:45',2,14);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_table`
--

DROP TABLE IF EXISTS `users_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_table` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(20) NOT NULL,
  `password` text NOT NULL,
  `FIRST_NAME` varchar(100) NOT NULL,
  `LAST_NAME` varchar(100) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `ROLE_ID_FK` int NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROLE_ID_FK` (`ROLE_ID_FK`),
  CONSTRAINT `users_table_ibfk_1` FOREIGN KEY (`ROLE_ID_FK`) REFERENCES `user_roles` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_table`
--

LOCK TABLES `users_table` WRITE;
/*!40000 ALTER TABLE `users_table` DISABLE KEYS */;
INSERT INTO `users_table` VALUES (34,'usr1','$2b$10$YTHXNyZEXzCPtfFqe1uCwOcJbT9WTr2C0o.XRT6oL40G/r9kXsKiK','Dinesh','Sonawane','2021-02-05 11:39:50',22,'sonawane@gmail.com'),(37,'test','$2b$10$d1HMR5Ipqb8Y3apDTsaB0O0I/5Uj6zS3bhrKmb3JImQKYCJVeldGu','test user','fddfg','2021-02-05 18:54:34',2,'test@gmail.com');
/*!40000 ALTER TABLE `users_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-06 10:00:26
