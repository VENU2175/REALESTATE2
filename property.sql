-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: property
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ACTIVE` bit(1) DEFAULT b'1',
  `ENCRYTED_PASSWORD` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `USER_ROLE` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK2nexgjt86hiehn3dguc3aeari` (`USER_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'admin',_binary '','$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu','ROLE_EMPLOYEE'),(2,'seller',_binary '','$2a$10$hHZJOVZClpz2Y4NZ28jIx.Ll898Dubz5EAeUx8Slu57OqGVlRjmHK','ROLE_MANAGER'),(13,'Nisarga',_binary '','$2a$10$Is3xaRF3SVUhLP/XMWMs3OvaANvIK4hZIWMhKDJP4Ihe9xf4nHUV.','ROLE_MANAGER'),(14,'Priya P',_binary '','$2a$10$P6OsbwHQfl3juodHej3PHePMWlihINXXqwtsBNkpkfsJevrPclsl.','ROLE_MANAGER'),(15,'Chaitali',_binary '','$2a$10$aSo554dlxFrYZiWUEsePeO/njWZPTiinlSx6OWl1PPReEjYlRm4YO','ROLE_MANAGER'),(16,'Shubhangi ',_binary '','$2a$10$9KkEaMKWPVFbUJXoJaP4R.sU5bpFTbCcJLNv/.rc4xi25hN1P7kyG','ROLE_MANAGER'),(17,'Shwetha  Nagesh',_binary '','$2a$10$7XmxL0h6Msfr39JxZHGkyeqd6oprlm9JqXgXAYItKv/5FJza5zGPC','ROLE_MANAGER'),(18,'Diya P Shetty',_binary '','$2a$10$peKBZzNZg0XW7wGjisYWyOrrv5tvV.myYF3KlC7uL448Oiowrnv7W','ROLE_MANAGER');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `ID` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `AMOUNT` double NOT NULL,
  `PRICE` double NOT NULL,
  `QUANITY` int NOT NULL,
  `ORDER_ID` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `PRODUCT_ID` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ORDER_DETAIL_ORD_FK` (`ORDER_ID`),
  KEY `ORDER_DETAIL_PROD_FK` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES ('0b5ba63e-d76c-480e-a517-ec76aa97aa63',300000,300000,1,'de4c0b2a-d75e-4bb0-b7d5-b084b158d975','12435'),('490e2bd8-b7fd-46a2-9fae-d644fdf4d995',20000,20000,1,'e8db8f09-db6d-4470-9f6f-eb4d98cc4539','1238'),('fd6d945b-1af5-47cb-8109-881304138e01',1850000,1850000,1,'2a0a73fb-c0b0-499a-a435-13a29503145f','3456');
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ID` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `AMOUNT` double NOT NULL,
  `CUSTOMER_ADDRESS` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `CUSTOMER_EMAIL` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `CUSTOMER_NAME` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `CUSTOMER_PHONE` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ORDER_DATE` datetime NOT NULL,
  `ORDER_NUM` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ORDER_UK` (`ORDER_NUM`),
  UNIQUE KEY `UK8n31uf3gf4m7igyc5r8cc56q4` (`ORDER_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('2a0a73fb-c0b0-499a-a435-13a29503145f',1850000,'Banglore','shwetha@gmail.com','Shwetha','9164869596','2022-03-03 16:06:41',1),('de4c0b2a-d75e-4bb0-b7d5-b084b158d975',300000,'Belgaum','shubhangi@gmail.com','Shubhangi','9535851688','2022-03-03 16:09:49',2),('e8db8f09-db6d-4470-9f6f-eb4d98cc4539',20000,'Maharashtra','chaitali@gmail.com','Chaitali','9075205868','2022-03-03 16:11:15',3);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `code` varchar(20) NOT NULL,
  `create_date` datetime NOT NULL,
  `image` longtext NOT NULL,
  `image1` longtext NOT NULL,
  `image2` longtext NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('1234','2022-02-26 12:49:14','img/plot.png','img/plot2.jpg','img/plot1.jpg',' Property of sale : 1st main rood,2nd cross near Kenchamma Layout, Vinoba Nagar, Mysore, Karnataka',2500000),('1235','2022-02-26 13:24:05','img/home.jpeg','img/home1.jpeg','img/home2.jpeg','House for rent: sanjivini nilaya,1st main road,2nd cross , shimoga.. 2BHK',15000),('1236','2022-02-26 13:34:26','img/apart.jpeg','img/apart1.jpeg','img/apart3.jpeg','Apartment for lease: 3 BHK Flat is available for lease in Kasturi Nagar, maharashtra 6 year lease',1050000),('1237','2022-02-26 13:43:44','img/house.jpeg','img/house2.jpeg','img/house3.jpeg','House for sale:  2 BHK house, #102 In Ashoka Residency in Gm Palya',9700000),('1238','2022-02-26 13:51:42','img/apartment.jpeg','img/apartment2.jpeg','img/apartment1.jpeg','Apartment of rent: 1BHK voylla Plot No.45/1, 45/2, 45th Cross Rd, KSRTC Layout, 2nd Phase, J. P. Nagar, Bengaluru, Karnataka 560069',20000),('12435','2022-02-27 15:54:44','img/hm.jpg','img/hm1.jpg','img/hm2.jpg','House for lease: 1 BHK in Yousufguda , near to Ameerpet(1.5km) centrally located to reach all places it is near to krishnakanth park Vengalrao nagar,manipal',300000),('3456','2022-02-27 21:35:38','img/site3.jpg','img/site2.jpg','img/site1.jpg','Site for sale: 54,R B.I Colony,First main, 10th Cross St, Anandnagar, Ganganagar, Bengaluru, Karnataka 560024',1850000);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-03 17:20:08
