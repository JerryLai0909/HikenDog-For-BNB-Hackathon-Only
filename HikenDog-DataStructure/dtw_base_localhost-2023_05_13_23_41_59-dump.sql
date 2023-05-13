-- MySQL dump 10.13  Distrib 8.0.32, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: dtw_base
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `flag_2_desc_info`
--

DROP TABLE IF EXISTS `flag_2_desc_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flag_2_desc_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `flag_hash` varchar(200) DEFAULT NULL,
  `flag_desc_content` varchar(200) DEFAULT NULL,
  `is_used` int DEFAULT '1',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flag_2_desc_info`
--

LOCK TABLES `flag_2_desc_info` WRITE;
/*!40000 ALTER TABLE `flag_2_desc_info` DISABLE KEYS */;
INSERT INTO `flag_2_desc_info` VALUES (1,'0xFLAG111','春天的内容',1,'2023-05-02 08:40:22','2023-05-02 08:40:22'),(2,'0xFLAG222','夏天的内容',1,'2023-05-02 08:40:22','2023-05-02 08:40:22'),(3,'0xFLAG333','秋天的内容',1,'2023-05-02 08:40:22','2023-05-02 08:40:22'),(4,'0xFLAG444','冬天的内容',1,'2023-05-02 08:40:22','2023-05-02 08:40:22');
/*!40000 ALTER TABLE `flag_2_desc_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flag_2_media_path`
--

DROP TABLE IF EXISTS `flag_2_media_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flag_2_media_path` (
  `id` int NOT NULL AUTO_INCREMENT,
  `flag_hash` varchar(200) DEFAULT NULL,
  `flag_media_path` varchar(200) DEFAULT NULL,
  `is_used` int DEFAULT '1',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flag_2_media_path`
--

LOCK TABLES `flag_2_media_path` WRITE;
/*!40000 ALTER TABLE `flag_2_media_path` DISABLE KEYS */;
INSERT INTO `flag_2_media_path` VALUES (1,'0xFLAG111','PATH1',1,'2023-05-02 08:40:42','2023-05-02 08:40:42'),(2,'0xFLAG222','PATH2',1,'2023-05-02 08:40:42','2023-05-02 08:40:42'),(3,'0xFLAG333','PATH3',1,'2023-05-02 08:40:42','2023-05-02 08:40:42'),(4,'0xFLAG444','PATH4',1,'2023-05-02 08:40:42','2023-05-02 08:40:42');
/*!40000 ALTER TABLE `flag_2_media_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flag_info`
--

DROP TABLE IF EXISTS `flag_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flag_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `flag_hash` varchar(200) DEFAULT NULL,
  `flag_name` varchar(200) DEFAULT NULL,
  `mo_hash` varchar(200) DEFAULT NULL,
  `flag_desc1` varchar(200) DEFAULT NULL,
  `flag_desc2` varchar(200) DEFAULT NULL,
  `flag_media_path1` varchar(200) DEFAULT NULL,
  `flag_media_path2` varchar(200) DEFAULT NULL,
  `flag_lat` double DEFAULT '0',
  `flag_lon` double DEFAULT '0',
  `flag_location_range` int DEFAULT '0',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flag_info`
--

LOCK TABLES `flag_info` WRITE;
/*!40000 ALTER TABLE `flag_info` DISABLE KEYS */;
INSERT INTO `flag_info` VALUES (1,'0xFLAG111','MacLehose Trail','0xXIANGLUSHAN','5000*Enjoy Journey','如春天的风琴一般','PATH','PATH',106.2222,24.6666,10,'2023-05-02 08:39:03','2023-05-02 08:39:03'),(2,'0xFLAG222','Say Hi ','0xXIANGLUSHAN','5000*Enjoy Journey','如夏季的棋盘','PATH','PATH',106.2222,24.6666,10,'2023-05-02 08:39:03','2023-05-02 08:39:03'),(3,'0xFLAG333','Wild bottle crafting','0xXIANGLUSHAN','5000*Enjoy Journey','宛如秋天的书法','PATH','PATH',106.2222,24.6666,10,'2023-05-02 08:39:03','2023-05-02 08:39:03'),(4,'0xFLAG444','Unique energy','0xXIANGLUSHAN','5000*Enjoy Journey','犹如冬日的名画','PATH','PATH',106.2222,24.6666,10,'2023-05-02 08:39:03','2023-05-02 08:39:03');
/*!40000 ALTER TABLE `flag_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_2_desc_info`
--

DROP TABLE IF EXISTS `game_2_desc_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_2_desc_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `game_hash` varchar(200) DEFAULT NULL,
  `game_desc_content` varchar(200) DEFAULT NULL,
  `is_used` int DEFAULT '1',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_2_desc_info`
--

LOCK TABLES `game_2_desc_info` WRITE;
/*!40000 ALTER TABLE `game_2_desc_info` DISABLE KEYS */;
INSERT INTO `game_2_desc_info` VALUES (1,'0xTHISISGAMEHASH0909','这是描述1',1,'2023-04-25 08:13:41','2023-04-25 08:13:41'),(2,'0xTHISISGAMEHASH0909','这是描述2',1,'2023-04-25 08:13:41','2023-04-25 08:13:41');
/*!40000 ALTER TABLE `game_2_desc_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_2_media_info`
--

DROP TABLE IF EXISTS `game_2_media_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_2_media_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `game_hash` varchar(200) DEFAULT NULL,
  `game_media_path` varchar(200) DEFAULT NULL,
  `is_used` int DEFAULT '1',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_2_media_info`
--

LOCK TABLES `game_2_media_info` WRITE;
/*!40000 ALTER TABLE `game_2_media_info` DISABLE KEYS */;
INSERT INTO `game_2_media_info` VALUES (1,'0xTHISISGAMEHASH0909','media_path_1',1,'2023-04-25 08:14:00','2023-04-25 08:14:00'),(2,'0xTHISISGAMEHASH0909','media_path_2',1,'2023-04-25 08:14:00','2023-04-25 08:14:00');
/*!40000 ALTER TABLE `game_2_media_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_2_mission`
--

DROP TABLE IF EXISTS `game_2_mission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_2_mission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `game_hash` varchar(100) DEFAULT NULL,
  `mission_hash` varchar(100) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_2_mission`
--

LOCK TABLES `game_2_mission` WRITE;
/*!40000 ALTER TABLE `game_2_mission` DISABLE KEYS */;
INSERT INTO `game_2_mission` VALUES (1,'0xTHISISGAMEHASH0909','0xMISSIONHASH1000','2023-05-02 05:01:59','2023-05-02 05:01:59'),(2,'0xTHISISGAMEHASH1010','0xMISSIONHASH1111','2023-05-02 05:04:57','2023-05-02 05:04:57');
/*!40000 ALTER TABLE `game_2_mission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_info`
--

DROP TABLE IF EXISTS `game_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `game_hash` varchar(200) DEFAULT NULL,
  `game_name` varchar(200) DEFAULT NULL,
  `game_desc1` varchar(200) DEFAULT NULL,
  `game_desc2` varchar(200) DEFAULT NULL,
  `game_media_path1` varchar(200) DEFAULT NULL,
  `game_media_path2` varchar(200) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_info`
--

LOCK TABLES `game_info` WRITE;
/*!40000 ALTER TABLE `game_info` DISABLE KEYS */;
INSERT INTO `game_info` VALUES (1,'0xTHISISGAMEHASH0909','Sleep Night Task','Explore the Dark Mountains to find 12 bottles *of related energy values and unlock 5 energy NFTs *upon completion of this level.','3','icon_1.png','map_4.jpg','2023-04-25 08:07:37','2023-04-25 08:07:37'),(2,'0xTHISISGAMEHASH1010','Scarce Energy','In the rugged mountains, search for valuable *energy and this path will reward *you with 10 energy NFTs','5','icon_2.png','map_5.jpg','2023-05-01 11:49:04','2023-05-01 11:49:04'),(3,'0xTHISISGAMEHASH1111','Lost Data','Search for lost data and retrieve *those lost memories. *Reward will be 5 NFTS','4','icon_3.png','map_6.jpg','2023-05-01 14:40:21','2023-05-01 14:40:21');
/*!40000 ALTER TABLE `game_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misd_2_desc_info`
--

DROP TABLE IF EXISTS `misd_2_desc_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `misd_2_desc_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `misd_hash` varchar(200) DEFAULT NULL,
  `misd_desc_content` varchar(200) DEFAULT NULL,
  `is_used` int DEFAULT '1',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misd_2_desc_info`
--

LOCK TABLES `misd_2_desc_info` WRITE;
/*!40000 ALTER TABLE `misd_2_desc_info` DISABLE KEYS */;
INSERT INTO `misd_2_desc_info` VALUES (1,'0xMISD111','0xMISD111Content',1,'2023-05-02 08:58:30','2023-05-02 08:58:30'),(2,'0xMISD222','0xMISD222Content',1,'2023-05-02 08:58:30','2023-05-02 08:58:30'),(3,'0xMISD333','0xMISD333Content',1,'2023-05-02 08:58:30','2023-05-02 08:58:30'),(4,'0xMISD444','0xMISD444Content',1,'2023-05-02 08:58:30','2023-05-02 08:58:30');
/*!40000 ALTER TABLE `misd_2_desc_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misd_2_media_info`
--

DROP TABLE IF EXISTS `misd_2_media_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `misd_2_media_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `misd_hash` varchar(200) DEFAULT NULL,
  `misd_media_path` varchar(200) DEFAULT NULL,
  `is_uesd` int DEFAULT '1',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misd_2_media_info`
--

LOCK TABLES `misd_2_media_info` WRITE;
/*!40000 ALTER TABLE `misd_2_media_info` DISABLE KEYS */;
INSERT INTO `misd_2_media_info` VALUES (1,'0xMISD111','0xMISD111ContentPATH',1,'2023-05-02 08:58:52','2023-05-02 08:58:52'),(2,'0xMISD222','0xMISD222ContentPATH',1,'2023-05-02 08:58:52','2023-05-02 08:58:52'),(3,'0xMISD333','0xMISD333ContentPATH',1,'2023-05-02 08:58:52','2023-05-02 08:58:52'),(4,'0xMISD444','0xMISD444ContentPATH',1,'2023-05-02 08:58:52','2023-05-02 08:58:52');
/*!40000 ALTER TABLE `misd_2_media_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misd_2_reward`
--

DROP TABLE IF EXISTS `misd_2_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `misd_2_reward` (
  `id` int NOT NULL AUTO_INCREMENT,
  `misd_hash` varchar(200) DEFAULT NULL,
  `reward_type` varchar(20) DEFAULT NULL,
  `token_type_hash` varchar(20) DEFAULT NULL,
  `token_address` varchar(100) DEFAULT NULL,
  `token_amount` int DEFAULT '0',
  `nft_type_hash` varchar(20) DEFAULT NULL,
  `nft_address` varchar(100) DEFAULT NULL,
  `nft_count` int DEFAULT '0',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misd_2_reward`
--

LOCK TABLES `misd_2_reward` WRITE;
/*!40000 ALTER TABLE `misd_2_reward` DISABLE KEYS */;
INSERT INTO `misd_2_reward` VALUES (1,'0xMISD111','NFT','0xSHAN','0xTOKENCONTRACT_ADDRESS',32,'0xSHAN','0xNFTCONTRACT_ADDRESS',1,'2023-05-02 09:01:21','2023-05-02 09:01:21'),(2,'0xMISD111','NFT','0xSHAN','0xTOKENCONTRACT_ADDRESS',23,'0xSHAN','0xNFTCONTRACT_ADDRESS',2,'2023-05-02 09:01:21','2023-05-02 09:01:21'),(3,'0xMISD222','TOKEN','0xSHAN','0xTOKENCONTRACT_ADDRESS',24,'0xSHAN','0xNFTCONTRACT_ADDRESS',6,'2023-05-02 09:01:21','2023-05-02 09:01:21'),(4,'0xMISD333','TOKEN','0xSHAN','0xTOKENCONTRACT_ADDRESS',63,'0xSHAN','0xNFTCONTRACT_ADDRESS',3,'2023-05-02 09:01:21','2023-05-02 09:01:21'),(5,'0xMISD333','NFT','0xSHAN','0xTOKENCONTRACT_ADDRESS',42,'0xSHAN','0xNFTCONTRACT_ADDRESS',2,'2023-05-02 09:01:21','2023-05-02 09:01:21'),(6,'0xMISD333','NFT','0xSHAN','0xTOKENCONTRACT_ADDRESS',11,'0xSHAN','0xNFTCONTRACT_ADDRESS',1,'2023-05-02 09:01:21','2023-05-02 09:01:21'),(7,'0xMISD444','NFT','0xSHAN','0xTOKENCONTRACT_ADDRESS',23,'0xSHAN','0xNFTCONTRACT_ADDRESS',3,'2023-05-02 09:01:21','2023-05-02 09:01:21');
/*!40000 ALTER TABLE `misd_2_reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission_2_desc_info`
--

DROP TABLE IF EXISTS `mission_2_desc_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission_2_desc_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mission_hash` varchar(200) DEFAULT NULL,
  `mission_desc_content` text,
  `is_used` int DEFAULT '1',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission_2_desc_info`
--

LOCK TABLES `mission_2_desc_info` WRITE;
/*!40000 ALTER TABLE `mission_2_desc_info` DISABLE KEYS */;
INSERT INTO `mission_2_desc_info` VALUES (1,'0xMISSIONHASH1000','Rainbow Road: A legendary racing track through the stars.',1,'2023-05-01 15:00:35','2023-05-01 15:00:35'),(2,'0xMISSIONHASH1000','Thunder Plains: A dangerous area plagued by thunderstorms.',1,'2023-05-01 15:00:35','2023-05-01 15:00:35'),(3,'0xMISSIONHASH1000','Waterfall Level: A treacherous environment with cascading waterfalls.',1,'2023-05-01 15:00:35','2023-05-01 15:00:35'),(4,'0xMISSIONHASH1000','Seaside Kingdom: A vibrant coastal town with a dark secret.',1,'2023-05-01 15:00:35','2023-05-01 15:00:35');
/*!40000 ALTER TABLE `mission_2_desc_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission_2_detail`
--

DROP TABLE IF EXISTS `mission_2_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission_2_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `misd_hash` varchar(200) DEFAULT NULL,
  `mission_hash` varchar(200) DEFAULT NULL,
  `flag_hash` varchar(200) DEFAULT NULL,
  `mission_type` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `misd_desc1` varchar(200) DEFAULT NULL,
  `misd_desc2` varchar(200) DEFAULT NULL,
  `misd_media_path1` varchar(200) DEFAULT NULL,
  `misd_media_path2` varchar(200) DEFAULT NULL,
  `misd_nft_count` int DEFAULT '0',
  `misd_token_count` int DEFAULT '0',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission_2_detail`
--

LOCK TABLES `mission_2_detail` WRITE;
/*!40000 ALTER TABLE `mission_2_detail` DISABLE KEYS */;
INSERT INTO `mission_2_detail` VALUES (1,'0xMISD111','0xMISSIONHASH1000','0xFLAG111','SIMPLE_LOCATE','2023-05-02 08:43:10','2023-05-09 08:43:13','抵达风琴春','在风琴春拍照','shan2.jpg','PATH12',1,32,'2023-05-02 08:45:17','2023-05-02 08:45:17'),(2,'0xMISD222','0xMISSIONHASH1000','0xFLAG222','SIMPLE_LOCATE','2023-05-02 08:43:10','2023-05-09 08:43:13','到达棋盘夏','在棋盘夏打卡','shan3.jpg','PATH22',1,24,'2023-05-02 08:45:17','2023-05-02 08:45:17'),(3,'0xMISD333','0xMISSIONHASH1000','0xFLAG333','SIMPLE_LOCATE','2023-05-02 08:43:10','2023-05-09 08:43:13','在书法秋','在书法秋打卡','shan7.jpg','PATH32',2,54,'2023-05-02 08:45:17','2023-05-02 08:45:17'),(4,'0xMISD444','0xMISSIONHASH1000','0xFLAG444','SIMPLE_LOCATE','2023-05-02 08:43:10','2023-05-09 08:43:13','赏名画冬','在名画冬打卡','shan2.jpg','PATH42',3,21,'2023-05-02 08:45:17','2023-05-02 08:45:17');
/*!40000 ALTER TABLE `mission_2_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission_2_media_info`
--

DROP TABLE IF EXISTS `mission_2_media_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission_2_media_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mission_hash` varchar(200) DEFAULT NULL,
  `mission_media_path` varchar(200) DEFAULT NULL,
  `is_used` int DEFAULT '1',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission_2_media_info`
--

LOCK TABLES `mission_2_media_info` WRITE;
/*!40000 ALTER TABLE `mission_2_media_info` DISABLE KEYS */;
INSERT INTO `mission_2_media_info` VALUES (1,'0xMISSIONHASH1000','media_info_for_mission',1,'2023-05-01 15:00:25','2023-05-01 15:00:25');
/*!40000 ALTER TABLE `mission_2_media_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission_info`
--

DROP TABLE IF EXISTS `mission_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mission_hash` varchar(200) DEFAULT NULL,
  `owner_hash` varchar(200) DEFAULT NULL,
  `mission_name` varchar(100) DEFAULT NULL,
  `mission_type` varchar(20) DEFAULT NULL,
  `mission_desc1` varchar(200) DEFAULT NULL,
  `mission_desc2` varchar(200) DEFAULT NULL,
  `mission_media_path1` varchar(200) DEFAULT NULL,
  `mission_media_path2` varchar(200) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `is_started` int DEFAULT '0',
  `is_finished` int DEFAULT '0',
  `is_used` int DEFAULT '1',
  `has_nft_reward` int DEFAULT '0',
  `has_token_reward` int DEFAULT '0',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission_info`
--

LOCK TABLES `mission_info` WRITE;
/*!40000 ALTER TABLE `mission_info` DISABLE KEYS */;
INSERT INTO `mission_info` VALUES (1,'0xMISSIONHASH1000','Jerry.eth','Fast and Furious','SINGLE','Rainbow Road - Thunder Plains - Waterfall Level - Seaside Kingdom','3','icon_1.png','map_4.jpg','2023-05-01 14:44:56','2023-09-01 14:45:04',1,0,1,1,1,'2023-05-01 14:45:23','2023-05-01 14:45:23'),(2,'0xMISSIONHASH1111','Jerry.eth','香炉山脉','MUTI','寻找药水找回体力','12','icon_2.png','map_1.jpg','2023-05-01 14:44:56','2023-09-01 14:45:04',1,0,1,1,1,'2023-05-02 05:02:58','2023-05-02 05:02:58'),(3,'0xMISSIONHASH2222','Jerry.eth','红悠山脉-火红路径','MUTI','收集枫叶','8','icon_3.png','map_1.jpg','2023-05-01 14:44:56','2023-09-01 14:45:04',1,0,1,1,1,'2023-05-02 05:04:00','2023-05-02 05:04:00');
/*!40000 ALTER TABLE `mission_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mountain_2_desc_info`
--

DROP TABLE IF EXISTS `mountain_2_desc_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mountain_2_desc_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mo_hash` varchar(200) DEFAULT NULL,
  `mo_desc_content` varchar(255) DEFAULT NULL,
  `is_used` int DEFAULT '1',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mountain_2_desc_info`
--

LOCK TABLES `mountain_2_desc_info` WRITE;
/*!40000 ALTER TABLE `mountain_2_desc_info` DISABLE KEYS */;
INSERT INTO `mountain_2_desc_info` VALUES (1,'0xXIANGLUSHAN','XIANGLU_CONTENT',1,'2023-05-02 08:57:44','2023-05-02 08:57:44'),(2,'0xXIANGLUSHAN','XIANGLU_CONTENT',1,'2023-05-02 08:57:44','2023-05-02 08:57:44');
/*!40000 ALTER TABLE `mountain_2_desc_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mountain_2_media_info`
--

DROP TABLE IF EXISTS `mountain_2_media_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mountain_2_media_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mo_hash` varchar(200) DEFAULT NULL,
  `mo_media_path` varchar(200) DEFAULT NULL,
  `is_used` int DEFAULT '1',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mountain_2_media_info`
--

LOCK TABLES `mountain_2_media_info` WRITE;
/*!40000 ALTER TABLE `mountain_2_media_info` DISABLE KEYS */;
INSERT INTO `mountain_2_media_info` VALUES (1,'0xXIANGLUSHAN','XIANGLUSHAN_PATH1',1,'2023-05-02 08:57:22','2023-05-02 08:57:22'),(2,'0xXIANGLUSHAN','XIANGLUSHAN_PATH2',1,'2023-05-02 08:57:22','2023-05-02 08:57:22');
/*!40000 ALTER TABLE `mountain_2_media_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mountain_info`
--

DROP TABLE IF EXISTS `mountain_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mountain_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mo_hash` varchar(200) DEFAULT NULL,
  `mo_name` varchar(200) DEFAULT NULL,
  `mo_desc1` varchar(200) DEFAULT NULL,
  `mo_desc2` varchar(200) DEFAULT NULL,
  `mo_media_path1` varchar(200) DEFAULT NULL,
  `mo_media_path2` varchar(200) DEFAULT NULL,
  `mission_count` int DEFAULT '0',
  `line_count` int DEFAULT '0',
  `nft_count` int DEFAULT '0',
  `token_count` int DEFAULT '0',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mountain_info`
--

LOCK TABLES `mountain_info` WRITE;
/*!40000 ALTER TABLE `mountain_info` DISABLE KEYS */;
INSERT INTO `mountain_info` VALUES (1,'0xXIANGLUSHAN','Burner Mountains','Wilderness Trail','这是一片凄凉之地','PATHMO','PATHMO',0,0,0,0,'2023-05-02 08:35:56','2023-05-02 08:35:56');
/*!40000 ALTER TABLE `mountain_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nft_detail_info`
--

DROP TABLE IF EXISTS `nft_detail_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nft_detail_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nft_hash` varchar(200) DEFAULT NULL,
  `nft_main_desc` varchar(100) DEFAULT NULL,
  `nft_desc1` varchar(100) DEFAULT NULL,
  `nft_desc2` text,
  `nft_desc3` varchar(100) DEFAULT NULL,
  `hot_rank` int DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nft_detail_info`
--

LOCK TABLES `nft_detail_info` WRITE;
/*!40000 ALTER TABLE `nft_detail_info` DISABLE KEYS */;
INSERT INTO `nft_detail_info` VALUES (1,'0xPROOF_1','Challenger','MacLehose','This NFT may provide additional tasks or challenges that grant extra experience points and tokens upon completion.','完成挑战即可获得',232,'2023-05-03 11:48:53','2023-05-03 11:48:53'),(2,'0xPROOF_2','Nature protector','Nature Saver','This NFT may provide environmental protection tasks, such as cleaning up litter, planting trees, and protecting wildlife, that grant extra experience points and tokens upon completion.',' such as cleaning up litter',321,'2023-05-03 11:48:53','2023-05-03 11:48:53'),(3,'0xPROOF_3','Prayer','Prayer','This NFT may provide spiritual tasks or challenges, such as meditation, prayer, and reflection, that grant extra experience points and tokens upon completion.','完成挑战即可获得',1,'2023-05-03 11:48:53','2023-05-03 11:48:53'),(4,'0xPROOF_4','Hero','Hero','This NFT may provide more challenging tasks or challenges, such as defeating powerful enemies or exploring dangerous areas, that grant more experience points and tokens upon completion.','完成挑战即可获得',1,'2023-05-03 11:48:53','2023-05-03 11:48:53'),(5,'0xEQUITY_1','Hotel','Hotel','This NFT may provide access to a virtual hotel, where players can rest and restore their small dog\'s energy and health, and potentially grant bonus tokens.','三方商家合作',1,'2023-05-03 11:48:53','2023-05-03 11:48:53'),(6,'0xEQUITY_2','Hiking stick','Hiking stick','This NFT may provide a virtual hiking stick that can provide additional support and balance for the small dog during outdoor adventures, potentially granting bonus experience points and tokens.','三方商家合作',1,'2023-05-03 11:48:53','2023-05-03 11:48:53'),(7,'0xEQUITY_3','Supplies','Supplies','This NFT may provide a virtual supply kit that includes food, water, and other essential items to help sustain the small dog during outdoor adventures, potentially granting bonus experience points and tokens.','三方商家合作',1,'2023-05-03 11:48:53','2023-05-03 11:48:53'),(8,'0xEQUITY_4','Yoga studio','Yoga studio','This NFT may provide access to a virtual yoga studio, where players can engage in virtual yoga classes that improve their small dog\'s health and potentially grant bonus tokens.','三方商家合作',1,'2023-05-03 11:48:53','2023-05-03 11:48:53'),(9,'0xYIELD_1','Meditation center','Medi center','This NFT may provide access to a virtual meditation center, where players can engage in virtual meditation sessions that improve their small dog\'s mental health and potentially grant bonus tokens.','合成需要花费【树枝NFT】+【体力NFT】且花费20000SHAN代币',222,'2023-05-03 11:48:53','2023-05-03 11:48:53'),(10,'0xYIELD_2','A magic potion','A magic potion','This NFT may provide a virtual magic potion that can restore a small amount of the small dog\'s energy or health, potentially granting bonus experience points and tokens.','合成需要花费30000SHAN代币且必须完成【荒野之径探索者】',333,'2023-05-03 11:48:53','2023-05-03 11:48:53'),(11,'0xYIELD_3','C magic potion','C magic potion','This NFT may provide a virtual magic potion that can restore a moderate amount of the small dog\'s energy or health, potentially granting bonus experience points and tokens.','合成需要花费10000SHAN代币且必须完成【香炉山祈祷者】',1,'2023-05-03 11:48:53','2023-05-03 11:48:53'),(12,'0xYIELD_4','B magic potion','B magic potion','This NFT may provide a virtual magic potion that can restore a significant amount of the small dog\'s energy or health, potentially granting bonus experience points and tokens.','合成需要花费100000SHAN代币且必须完成【太古山挑战者】',1,'2023-05-03 11:48:53','2023-05-03 11:48:53'),(13,'0xFRAGMENT_1','Common potion','Fragment-based','This NFT may provide a virtual potion that can restore a small amount of the small dog\'s energy or health, potentially granting bonus experience points and tokens.','太古山战士随机掉落',1,'2023-05-03 11:48:53','2023-05-03 11:48:53'),(14,'0xFRAGMENT_2','Composite potion','Fragment-based','This NFT may provide a virtual potion that can restore a moderate amount of the small dog\'s energy or health, potentially granting bonus experience points and tokens.','竞速战士随机掉落',1,'2023-05-03 11:48:53','2023-05-03 11:48:53'),(15,'0xFRAGMENT_3','Exquisite potion','Fragment-based','This NFT may provide a virtual potion that can restore a significant amount of the small dog\'s energy or health, potentially granting bonus experience points and tokens.','竞速战士随机掉落',332,'2023-05-03 11:48:53','2023-05-03 11:48:53'),(16,'0xFRAGMENT_4','Common potion','Fragment-based','This NFT may provide a virtual potion that can restore a small amount of the small dog\'s energy or health, potentially granting bonus experience points and tokens.','香炉山祈祷者随机掉落',1,'2023-05-03 11:48:53','2023-05-03 11:48:53'),(17,'0xFRAGMENT_5','Composite potion','Fragment-based','This NFT may provide a virtual potion that can restore a moderate amount of the small dog\'s energy or health, potentially granting bonus experience points and tokens.','香炉山祈祷者随机掉落',1,'2023-05-03 11:48:53','2023-05-03 11:48:53'),(18,'0xFRAGMENT_6','Exquisite potion','Fragment-based','This NFT may provide a virtual potion that can restore a significant amount of the small dog\'s energy or health, potentially granting bonus experience points and tokens.','香炉山祈祷者随机掉落',122,'2023-05-03 11:48:53','2023-05-03 11:48:53'),(19,'0xFRAGMENT_7','Exquisite potion','Fragment-based','This NFT may provide a virtual potion that can restore a significant amount of the small dog\'s energy or health, potentially granting bonus experience points and tokens.','香炉山祈祷者随机掉落',111,'2023-05-03 11:48:53','2023-05-03 11:48:53');
/*!40000 ALTER TABLE `nft_detail_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nft_info`
--

DROP TABLE IF EXISTS `nft_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nft_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nft_hash` varchar(200) DEFAULT NULL,
  `nft_type` varchar(30) DEFAULT NULL,
  `nft_address` varchar(200) DEFAULT NULL,
  `nft_token_cost` int DEFAULT '0',
  `nft_fragment_require` int DEFAULT NULL,
  `nft_uri_path` varchar(200) DEFAULT NULL,
  `nft_uri_background` varchar(200) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nft_info`
--

LOCK TABLES `nft_info` WRITE;
/*!40000 ALTER TABLE `nft_info` DISABLE KEYS */;
INSERT INTO `nft_info` VALUES (1,'0xPROOF_1','PROOF_BASED','0xAddress',200,2,'1.png','nft_background_15.png','2023-05-03 08:04:16','2023-05-03 08:04:16'),(2,'0xPROOF_2','PROOF_BASED','0xAddress',100,4,'20.png','nft_background_16.png','2023-05-03 08:04:16','2023-05-03 08:04:16'),(3,'0xPROOF_3','PROOF_BASED','0xAddress',50,3,'3.png','nft_background_17.png','2023-05-03 08:04:16','2023-05-03 08:04:16'),(4,'0xPROOF_4','PROOF_BASED','0xAddress',20,3,'4.png','nft_background_18.png','2023-05-03 08:04:16','2023-05-03 08:04:16'),(5,'0xEQUITY_1','EQUITY_BASED','0xAddress',32,3,'5.png','nft_background_15.png','2023-05-03 08:04:16','2023-05-03 08:04:16'),(6,'0xEQUITY_2','EQUITY_BASED','0xAddress',21,11,'6.png','nft_background_16.png','2023-05-03 08:04:16','2023-05-03 08:04:16'),(7,'0xEQUITY_3','EQUITY_BASED','0xAddress',34,12,'7.png','nft_background_17.png','2023-05-03 08:04:16','2023-05-03 08:04:16'),(8,'0xEQUITY_4','EQUITY_BASED','0xAddress',45,13,'8.png','nft_background_18.png','2023-05-03 08:07:30','2023-05-03 08:07:30'),(9,'0xYIELD_1','YIELD_BASED','0xAddress',54,3,'9.png','nft_background_15.png','2023-05-03 08:07:30','2023-05-03 08:07:30'),(10,'0xYIELD_2','YIELD_BASED','0xAddress',23,8,'10.png','nft_background_16.png','2023-05-03 08:07:30','2023-05-03 08:07:30'),(11,'0xYIELD_3','YIELD_BASED','0xAddress',21,9,'11.png','nft_background_17.png','2023-05-03 08:07:30','2023-05-03 08:07:30'),(12,'0xYIELD_4','YIELD_BASED','0xAddress',34,10,'12.png','nft_background_18.png','2023-05-03 08:10:06','2023-05-03 08:10:06'),(13,'0xFRAGMENT_1','FRAGMENT_BASED','0xAddress',45,3,'14.png','nft_background_16.png','2023-05-03 08:12:44','2023-05-03 08:12:44'),(14,'0xFRAGMENT_2','FRAGMENT_BASED','0xAddress',54,12,'19.png','nft_background_17.png','2023-05-03 08:12:44','2023-05-03 08:12:44'),(15,'0xFRAGMENT_3','FRAGMENT_BASED','0xAddress',21,13,'15.png','nft_background_18.png','2023-05-03 08:12:44','2023-05-03 08:12:44'),(16,'0xFRAGMENT_4','FRAGMENT_BASED','0xAddress',34,3,'16.png','nft_background_15.png','2023-05-03 08:12:44','2023-05-03 08:12:44'),(17,'0xFRAGMENT_5','FRAGMENT_BASED','0xAddress',45,2,'17.png','nft_background_16.png','2023-05-03 08:12:44','2023-05-03 08:12:44'),(18,'0xFRAGMENT_6','FRAGMENT_BASED','0xAddress',54,4,'18.png','nft_background_17.png','2023-05-03 08:12:44','2023-05-03 08:12:44');
/*!40000 ALTER TABLE `nft_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nft_type_enum`
--

DROP TABLE IF EXISTS `nft_type_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nft_type_enum` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nft_type` varchar(200) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nft_type_enum`
--

LOCK TABLES `nft_type_enum` WRITE;
/*!40000 ALTER TABLE `nft_type_enum` DISABLE KEYS */;
INSERT INTO `nft_type_enum` VALUES (1,'PROOF_BASED_NFT','2023-04-26 05:52:45','2023-04-26 05:52:45'),(2,'EQUITY_BASED_NFT','2023-04-26 05:52:45','2023-04-26 05:52:45'),(3,'YIELD_BASED_NFT','2023-04-26 05:52:45','2023-04-26 05:52:45'),(4,'FRAGMENT_BASED_NFT','2023-04-26 05:52:45','2023-04-26 05:52:45');
/*!40000 ALTER TABLE `nft_type_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shan_base_config`
--

DROP TABLE IF EXISTS `shan_base_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shan_base_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_rpc` varchar(200) DEFAULT NULL,
  `real_rpc` varchar(200) DEFAULT NULL,
  `is_used` int DEFAULT '0',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shan_base_config`
--

LOCK TABLES `shan_base_config` WRITE;
/*!40000 ALTER TABLE `shan_base_config` DISABLE KEYS */;
INSERT INTO `shan_base_config` VALUES (1,'https://data-seed-prebsc-1-s1.binance.org:8545',NULL,1,'2023-04-25 06:36:53','2023-04-25 06:36:53'),(2,'https://data-seed-prebsc-2-s1.binance.org:8545',NULL,0,'2023-04-25 06:36:53','2023-04-25 06:36:53'),(3,'https://data-seed-prebsc-1-s2.binance.org:8545',NULL,0,'2023-04-25 06:36:53','2023-04-25 06:36:53'),(4,'https://data-seed-prebsc-2-s2.binance.org:8545',NULL,0,'2023-04-25 06:36:53','2023-04-25 06:36:53'),(5,'https://data-seed-prebsc-1-s3.binance.org:8545',NULL,0,'2023-04-25 06:36:53','2023-04-25 06:36:53'),(6,'https://data-seed-prebsc-2-s3.binance.org:8545',NULL,0,'2023-04-25 06:36:53','2023-04-25 06:36:53');
/*!40000 ALTER TABLE `shan_base_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_hash` varchar(200) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(200) DEFAULT NULL,
  `user_pwd` varchar(200) DEFAULT NULL,
  `token_count` double DEFAULT '0',
  `nft_number` int DEFAULT '0',
  `line_count` int DEFAULT '0',
  `mission_count` int DEFAULT '0',
  `user_level` varchar(10) DEFAULT NULL,
  `is_web3` int DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_info_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,'0xTHISISJUSTATESTACCOUNT0909','Jerry','syluhanaii@gmail.com','123456',26,34,10,30,'觉醒者',0,'2023-04-25 06:13:02','2023-04-25 06:13:02');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info_web3`
--

DROP TABLE IF EXISTS `user_info_web3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info_web3` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_hash` varchar(200) DEFAULT NULL,
  `wallet_address` varchar(200) DEFAULT NULL,
  `private_key` varchar(200) DEFAULT NULL,
  `is_web3_private` int DEFAULT '0',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info_web3`
--

LOCK TABLES `user_info_web3` WRITE;
/*!40000 ALTER TABLE `user_info_web3` DISABLE KEYS */;
INSERT INTO `user_info_web3` VALUES (1,'0xTHISISJUSTATESTACCOUNT0909','0xd5969b9B0f238E48B96d0F7Bc67Ade1A66c6Cc39','0xf03ebe92ce863a51caced3ac131665770b9671a5f66e1caa239e5bdabde9b9c3',0,'2023-04-25 06:40:02','2023-04-25 06:40:02');
/*!40000 ALTER TABLE `user_info_web3` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-13 23:41:59
