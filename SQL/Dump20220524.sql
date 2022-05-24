DROP DATABASE IF EXISTS mgcg;
CREATE DATABASE  IF NOT EXISTS mgcg;
USE mgcg;

-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: mgcg
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postalCode` varchar(5) NOT NULL,
  `city` varchar(60) NOT NULL,
  `province` varchar(2) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `preferred` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cid_preferred` (`uid`,`preferred`) USING BTREE,
  CONSTRAINT `FK_addresses_users` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT 'NOCATEGORY',
  `description` varchar(400) NOT NULL DEFAULT 'NODESCRIPTION',
  `metaKeywords` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Lamierati','Una lamiera è una lastra ottenuta dalla laminazione di bramme a loro volta ottenute mediante una colata continua di metallo liquido.','lamierato alluminio ricambi pezzi auto carrozzeria prezzo estetico autoricambi'),(2,'Materiale elettrico','Il materiale elettrico raggruppa tutti i ricambi con componete elettrica','corrente elettricita ricambi pezzi auto carrozzeria prezzo estetico autoricambi'),(3,'Vetri','Un vetro raggurppa tutti i componeti constituita da silcio','vetro ricambi pezzi auto carrozzeria prezzo estetico autoricambi'),(4,'Materiale plastico','Il materiale plasico raggruppa tutti i ricambi con componete plastica','plastica ricambi pezzi auto carrozzeria prezzo estetico autoricambi');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_products`
--

DROP TABLE IF EXISTS `categories_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_products` (
  `pid` bigint NOT NULL,
  `cid` bigint NOT NULL,
  PRIMARY KEY (`pid`,`cid`),
  KEY `FKcategory` (`cid`),
  CONSTRAINT `FKcategory` FOREIGN KEY (`cid`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKproduct` FOREIGN KEY (`pid`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_products`
--

LOCK TABLES `categories_products` WRITE;
/*!40000 ALTER TABLE `categories_products` DISABLE KEYS */;
INSERT INTO `categories_products` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(8,2);
/*!40000 ALTER TABLE `categories_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2021_04_05_12_01_05_create_products_table','2022-05-13 13:21:04'),(2,'2021_05_12_13_12_05_create_users_table','2022-05-13 13:21:47'),(3,'2021_05_14_09_55_14_create_customers_table','2022-05-13 13:22:06'),(4,'2021_05_15_21_09_50_create_orders_table','2022-05-13 13:22:25'),(5,'2021_05_19_20_39_40_edit_users_table','2022-05-13 13:22:39'),(6,'2021_05_21_10_37_add_createdat_to_orders_table','2022-05-13 13:22:58'),(7,'2021_05_21_14_21_20_create_addresses_table','2022-05-13 13:23:14'),(8,'2021_05_21_17_11_add_status_to_orders_table','2022-05-13 13:23:31'),(9,'2021_05_21_17_11_add_status_to_orders_table','2022-05-13 13:23:33'),(10,'2021_05_22_14_10_01_remove_customers_table','2022-05-13 13:23:56'),(11,'2021_05_25_15_10_01_create_category_table','2022-05-13 13:24:14'),(12,'2021_05_30_13_53_23_create_reviewes_table','2022-05-13 13:24:31'),(13,'2021_06_15_00_07_add_tax_to_products_table','2022-05-13 13:24:45');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `oid` bigint NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `shortDescription` varchar(45) DEFAULT NULL,
  `tax` tinyint unsigned NOT NULL DEFAULT '10',
  `price` double NOT NULL,
  `weight` double NOT NULL DEFAULT '255',
  `discount` double NOT NULL DEFAULT '0',
  `quantity` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_order` (`oid`),
  CONSTRAINT `fk_order` FOREIGN KEY (`oid`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint NOT NULL,
  `destination` varchar(255) NOT NULL,
  `totalProducts` int NOT NULL,
  `totalPaid` double NOT NULL,
  `trackNumber` varchar(45) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `gift` tinyint DEFAULT '0',
  `giftMessage` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_user` (`uid`),
  CONSTRAINT `fk_user` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `shortDescription` varchar(45) DEFAULT NULL,
  `metaDescription` varchar(45) DEFAULT NULL,
  `metaKeyword` varchar(45) DEFAULT NULL,
  `tax` tinyint unsigned NOT NULL DEFAULT '10',
  `price` double NOT NULL,
  `available` tinyint NOT NULL DEFAULT '0',
  `discount` double NOT NULL DEFAULT '0',
  `onSale` int NOT NULL DEFAULT '0',
  `quantity` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Parafango Fiat','Parafango Posteriore DX Fiat Panda 4x4','Parafango Fiat','parafango_fiat','fiat',10,50,1,10,1,10),(2,'Faro Bmw','Faro Anteriore DX Bmw m4','Faro Bmw','faro_bmw','bmw',10,700,1,5,1,10),(3,'Specchio Volkswagen','Specchio DX Volkswagen Polo','Specchio Volkswagen','specchio_volkswagen','volkswagen',10,250,1,0,0,6),(4,'Parabrezza Bmw','Parabrezza Bmw X3 termico','Parabrezza Bmw','parabrezza_bmw','bmw',10,160,1,10,1,7),(5,'Parabrezza Bmw','Parabrezza Bmw X6  rinforzato','Parabrezza Bmw','parabrezza_bmw','bmw',10,180,1,0,0,3),(6,'Cofano AlfaRomeo','Cofano AlfaRomeo Giulia','Cofano AlfaRomeo','cofano_alfaromeo','alfaromeo',10,300,1,0,0,2),(7,'Parafanghino AlfaRomeo','Parafanghino Posterio DX AlfaRomeo Stelvio','Parafanghino AlfaRomeo','parafanghino_alfaromeo','alfaromeo',10,70,1,0,0,6),(8,'Calandra Lancia ','Calandra Lancia Delta','Calandra Lancia ','calandra_lancia','lancia',10,75,1,0,0,8),(9,'Fanalino Lancia ','Fanalino Lancia ypsilon','Fanalino Lancia ','fanalino_lancia','lancia',10,70,1,0,0,4),(10,'Lucciola Citroen','Lucciola Citroen DX c3','Lucciola Citroen','lucciola_citroen','citroen',10,20,1,5,1,10),(11,'Parafango Jeep','Parafango Jeep Renegade','Parafango Jeep','parafango_jeep','jeep',10,20,1,8,1,4),(12,'Sottoporta Honda','Sottoporta Honda Civic','Sottoporta Honda','sottoporta_honda','honda',10,40,1,7,1,8),(13,'Fanalino Nissan','Fanalino Nissan Qashqai','Fanalino Nissan','fanalino_nissan','nissan',10,50,1,7,1,3),(14,'Terzo stop Opel','Terzo stop Opel Mokka','Terzo stop Opel','terzo_stop_opel','opel',10,70,1,57,1,8),(15,'Alzacristallo Volvo','Alzacristallo Volvo V70','Alzacristallo Volvo','alzacristallo_volvo','volvo',10,50,1,7,1,5),(16,'Specchio Audi','Specchio Audi Etron','Specchio Audi','specchio_audi','audi',10,40,1,7,1,2),(17,'Fendinebbia Peugeot','Fendinebbia Peugeot 5008','Fendinebbia Peugeot','fendinebbia_peugeot','peugeot',10,39,1,13,1,6),(18,'Retronebbia Skoda','Retronebbia Skoda Fabia','Retronebbia Skoda','retronebbia_skoda','skoda',10,50,1,7,1,4),(19,'Lunotto Land Rover','Lunotto Land Rover Evoque','Lunotto Land Rover','lunotto_land_rover','land_rover',10,130,1,17,1,8),(20,'Vetro fisso Seat','Vetro fisso Seat Ibiza','Vetro fisso Seat','vetro_fisso_seat','seat',10,150,1,17,1,7),(21,'Guarnizione cofano Mazda','Guarnizione cofano Mazda CX5','Guarnizione cofano Mazda','guarnizione_cofano_mazda','mazda',10,50,1,7,1,9),(22,'Paraurti Mitsubisci','Paraurti Mitsubisci  Pajero','Paraurti Mitsubisci','paraurti_mitsubisci','mitsubisci',10,50,1,7,1,8),(23,'Griglia cofano Renault','Griglia cofano Renault Clio','Griglia cofano Renault','griglia_cofano_renault','renault',10,50,1,0,0,6),(24,'Parasassi Volkswagen','Parasassi Volkswagen T-Rock','Parasassi Volkswagen','parasassi_volkswagen','volkswagen',10,80,1,0,0,5),(25,'Spoiler Subaru','Spoiler Subaru Forester','Spoiler Subaru','spoiler_subaru','subaru',10,70,1,0,0,7),(26,'Scivolo paraurti Jaguar','Scivolo paraurti JaguarX3','Scivolo paraurti Jaguar','scivolo_paraurti_jaguar','jagar',10,40,1,10,1,5),(27,'Cofano Mercedes','Cofano Mercedes Classe B','Cofano Mercedes','cofano_mercedes','mercedes',10,120,1,15,1,6),(28,'Parafango Iveco','Parafango Iveco Daily','Parafango Iveco','parafango_iveco','iveco',10,40,1,0,0,4),(29,'Calandra Suzuki','Calandra Suzuki Vitara','Calandra Suzuki','calandra_suzuki','suzuki',10,60,1,30,1,4),(30,'Porta Chrysler','Porta Chrysler Pacifica','Porta Chrysler','porta_chrysler','chrysler',10,250,1,0,0,5),(31,'Portellone Nissan','Portellone Nissan Navara','Portellone Nissan','portellone_nissan','nissan',10,200,1,12,1,6),(32,'Parafanghino AlfaRomeo ','Parafanghino AlfaRomeo Giulia Quadrifoglio','Parafanghino AlfaRomeo ','parafanghino_alfaRomeo ','alfaromeo',10,50,1,15,1,7),(33,'Faro Opel','Faro Opel Astra h','Faro Opel','faro_opel','opel',10,250,1,0,0,8),(34,'Fanalino Fiat','Fanalino Fiat Punto','Fanalino Fiat','fanalino_fiat','fiat',10,75,1,0,0,7),(35,'Lucciola Fiat','Lucciola Fiat Tipo','Lucciola Fiat','lucciola_fiat','fiat',10,65,1,16,1,6),(36,'Specchio Kia','Specchio Kia Sportage','Specchio Kia','specchio_kia','kia',10,48,1,18,1,4),(37,'Coppa specchio Ford','Coppa specchio Ford Focus','Coppa specchio Ford','coppa_specchio_ford','ford',10,15,1,20,1,3),(38,'Terzo stop Ford','Terzo stop Ford Fiesta','Terzo stop Ford','terzo_stop_ford','ford',10,35,1,0,0,6),(39,'Fendinebbia Ford','Fendinebbia Ford Puma','Fendinebbia Ford','fendinebbia_ford','ford',10,85,1,50,1,7),(40,'Fanalino di posizione Ford','Fanalino di posizione Ford Mustang','Fanalino di posizione Ford','fanalino_di_posizione_ford','ford',10,78,1,60,1,8);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewes`
--

DROP TABLE IF EXISTS `reviewes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pid` bigint NOT NULL,
  `uid` bigint NOT NULL,
  `score` tinyint NOT NULL DEFAULT '5',
  `title` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `reply` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pid` (`pid`,`uid`),
  KEY `FK_review_user` (`uid`),
  CONSTRAINT `FK_review_product` FOREIGN KEY (`pid`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_review_user` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewes`
--

LOCK TABLES `reviewes` WRITE;
/*!40000 ALTER TABLE `reviewes` DISABLE KEYS */;
INSERT INTO `reviewes` VALUES (1,1,2,5,'Love these!','I ordered these flowers along with the more popular Duovlo peonies. I have attached a picture showing both. The roses are smaller in size but I personally like them a lot better . I used a $1 glass bottle for the vase. I think it looks better in a smaller vase than a big one and you have to use both bouquets for a full look. I took out three flowers for a separate vase, so mine is not as full as it would be otherwise.','Thanks for the review, we appreciate'),(2,1,3,3,'Flowers','Just flower, nothing more',NULL),(3,3,2,2,'Thats good','Just flower, nothing more',NULL),(4,4,2,5,'Roses Beautiful','Beautiful roses. I love them and would buy again.',NULL),(5,4,3,1,'No!!!','Im upset!!!',NULL);
/*!40000 ALTER TABLE `reviewes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `gender` varchar(20) NOT NULL DEFAULT 'Undefined',
  `subscription` tinyint NOT NULL DEFAULT '0',
  `birthday` date NOT NULL DEFAULT '1900-01-01',
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'','','Undefined',0,'1900-01-01','admin@befloral.com','admin','administrator',1),(2,'','','Undefined',0,'1900-01-01','employee@befloral.com','employee','employee',1),(3,'','','Undefined',0,'1900-01-01','customer@befloral.com','customer','customer',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-24 14:32:54
