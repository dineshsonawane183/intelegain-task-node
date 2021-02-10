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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Dinesh','my address','939393393','dienshz@gmail.com','PROGRAMMER ANALYST','2020-10-22 00:00:00','1997-10-22 00:00:00'),(9,'dfjbdf','dfdf','34545656777','hello@gmail.com','CMO','2021-02-18 00:00:00','2021-02-24 00:00:00'),(11,'hello1','sdsdd1','43435567671','this@gmail.com1','JR.PROGRAMMER ANALYST','2021-02-23 00:00:00','2021-02-26 00:00:00'),(12,'cretae emp','addr','929292929','test@gmail.com','GUEST','2021-02-10 00:00:00','1986-07-24 00:00:00'),(13,'Test Employee','Adreess','9191919191','gmail@gmai.com','PROGRAMMER ANALYST','2021-02-10 00:00:00','1998-07-22 00:00:00'),(14,'test empl','test addreess','9191919191','sonanne@gmail.com','JR.PROGRAMMER ANALYST','2021-02-04 00:00:00','1997-07-17 00:00:00');
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
  `PERMISSION_ARRAY` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_table`
--

LOCK TABLES `permissions_table` WRITE;
/*!40000 ALTER TABLE `permissions_table` DISABLE KEYS */;
INSERT INTO `permissions_table` VALUES (2,'ALL','user have all access','2021-02-02 18:48:15','[\"View Employees\",\"Create Employee\",\"Edit Employee\",\"Delete Employee\",\"View Users\",\"Edit Users\",\"Delete Users\",\"View Role\",\"Edit Role\",\"Create Role\",\"Delete Role\",\"Delete Permission\",\"Create Permission\",\"Edit Permission\"]'),(12,'my PERMISSION','permission','2021-02-09 17:50:49','[\"View Employees\",\"Edit Employee\",\"Delete Employee\",\"View Role\",\"Edit Role\",\"Create Role\",\"Delete Role\"]'),(13,'my Permission 1','my Permission 1','2021-02-09 19:06:44','[\"Create Employee\",\"Edit Employee\",\"Edit Users\",\"Create Role\",\"View Role\",\"Edit Role\"]'),(15,'My Permissions 3','desc','2021-02-09 22:54:27','[\"View Employees\",\"Create Employee\",\"Edit Employee\",\"Delete Employee\"]'),(16,'My Permissions 4','desc','2021-02-09 23:10:30','[\"View Employees\",\"Create Employee\",\"Edit Employee\",\"Delete Employee\"]'),(18,'My Permissions 5','description','2021-02-10 00:22:11','[\"Create Employee\",\"Edit Employee\",\"View Role\",\"Delete Role\",\"Edit Role\",\"Delete Permission\",\"Create Role\"]'),(20,'CEO PERMISSIONS','CEO PERMISSIONS','2021-02-10 13:08:38','[\"View Employees\",\"Create Employee\",\"Edit Employee\",\"Delete Employee\",\"View Users\",\"Edit Users\",\"Delete Users\",\"View Role\",\"Edit Role\",\"Create Role\",\"Delete Role\",\"Delete Permission\",\"Create Permission\"]'),(30,'Test Permission','Test Permission','2021-02-10 15:40:53','[\"Edit Employee\",\"Delete Users\",\"Create Role\",\"Delete Permission\",\"Edit Role\",\"Edit Users\",\"Create Employee\"]'),(31,'Test Permission2','Test Permission2','2021-02-10 15:47:01','[\"View Employees\",\"Edit Employee\",\"Delete Users\",\"Delete Role\",\"Edit Permission\",\"Create Employee\",\"Edit Role\"]'),(32,'Test Permission 3','Test Permission 3','2021-02-10 15:56:57','[\"Create Employee\",\"Delete Employee\",\"Delete Users\"]');
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'CHAIRMAN','ALL','2021-02-05 11:26:08',2,0),(2,'GUEST','READ','2021-02-05 11:37:57',16,5),(5,'CEO','CEO','2021-02-05 11:59:57',20,1),(14,'CTO','CTO','2021-02-05 12:23:11',2,5),(15,'CFO','CFO','2021-02-05 12:27:02',2,5),(16,'CMO','CMO','2021-02-05 13:13:21',12,5),(17,'VICE PRESIDENT','VICE PRESIDENT','2021-02-05 13:14:15',13,16),(19,'ASSOCIATE MANAGEGER','ASSOCIATE MANAGEGER','2021-02-05 13:15:37',15,17),(20,'PROGRAMMER ANALYST','PROGRAMMER ANALYST','2021-02-05 13:16:11',15,35),(21,'JR.PROGRAMMER ANALYST','JR.PROGRAMMER ANALYST','2021-02-05 13:22:41',13,21),(22,'ADMIN','ADMIN','2021-02-05 17:29:45',2,14),(27,'SR. MANGAER1','SR. MANGAER1','2021-02-06 12:28:14',18,17),(32,'ASSISTANT MANAGER','ASSISTANT MANAGER','2021-02-09 11:41:26',12,18),(33,'CHRO','CHRO','2021-02-09 13:10:11',18,5),(35,'MANGER','MANGER','2021-02-09 16:09:04',18,17),(37,'ASSiSTANT VP','ASSiSTANT VP','2021-02-09 16:31:44',13,14);
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
  `PERMISSION_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROLE_ID_FK` (`ROLE_ID_FK`),
  CONSTRAINT `users_table_ibfk_1` FOREIGN KEY (`ROLE_ID_FK`) REFERENCES `user_roles` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_table`
--

LOCK TABLES `users_table` WRITE;
/*!40000 ALTER TABLE `users_table` DISABLE KEYS */;
INSERT INTO `users_table` VALUES (34,'usr1','$2b$10$YTHXNyZEXzCPtfFqe1uCwOcJbT9WTr2C0o.XRT6oL40G/r9kXsKiK','Dinesh','Sonawane','2021-02-05 11:39:50',22,'sonawane@gmail.com',2),(39,'usr2','$2b$10$ZBX73QPH.9rsM6XPpDbQ1uCeCd7WRVRBKiFsArc/NINa1ILKwSQI.','test1','test2','2021-02-06 16:12:09',37,'usr@gmai.com',32),(43,'usr3','$2b$10$5Fb30Mh9x5tblTOSRg7/0uCU6DJkd/CpHxQSFU82oPqqDV7jLw45e','test','user','2021-02-10 11:24:20',5,'gmail@gmail.com',20);
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

-- Dump completed on 2021-02-10 16:17:08
