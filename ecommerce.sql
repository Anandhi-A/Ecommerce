-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1re40cjegsfvw58xrkdp6bac6` (`product_id`),
  CONSTRAINT `FK1re40cjegsfvw58xrkdp6bac6` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (4,1,2),(5,1,3);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'128GB, Space Black','/images/iphone-14-pro.jpg','Apple iPhone 14 Pro',120000),(2,'256GB, Phantom Black','/images/galaxy-s23-ultra.png','Samsung Galaxy S23 Ultra',115000),(3,'Noise Cancelling Wireless Headphones','/images/sony-wh-1000xm5.png','Sony WH-1000XM5 Headphones',29990),(4,'15.6\" FHD+, Intel Core i7, 16GB RAM, 512GB SSD','/images/dell-xps-15.png','Dell XPS 15 Laptop',150000),(5,'55-inch, WebOS, ThinQ AI','/images/lg-55-4k-tv.png','LG 55\" 4K UHD Smart TV',65000),(6,'Full-Frame Mirrorless Camera with RF 24-105mm Lens','/images/canon-eos-r6.png','Canon EOS R6 Camera',215000),(7,'13.6\", M2 chip, 8GB RAM, 256GB SSD','/images/macbook-air-m2.png','Apple MacBook Air M2',119900),(8,'512GB, Flowy Emerald','/images/oneplus-12.png','OnePlus 12',64999),(9,'Bluetooth Truly Wireless in Ear Earbuds','/images/boat-airdopes-141.png','boAt Airdopes 141',1299),(10,'13.5\", Intel Core i7, 16GB RAM, 1TB SSD','/images/hp-spectre-x360.png','HP Spectre x360 Laptop',139999),(11,'11-inch, 8GB RAM, 256GB Storage, Wi-Fi','/images/samsung-galaxy-tab-s9.png','Samsung Galaxy Tab S9',72999),(12,'Men\'s Road Running Shoes','/images/nike-revolution-6.png','Nike Revolution 6 Shoes',3999),(13,'Disc Edition Console with DualSense Controller','/images/sony-playstation-5.png','Sony PlayStation 5',49990),(14,'Cord-Free, Powerful Suction, LCD Screen','/images/dyson-v11-vacuum.png','Dyson V11 Vacuum Cleaner',52990),(15,'Instant Camera with Auto Exposure and Flash','/images/instax-mini-12.png','Fujifilm Instax Mini 12',6899),(16,'Portable Waterproof Speaker','/images/jbl-flip-6.png','JBL Flip 6 Bluetooth Speaker',9999),(17,'NVMe M.2 Internal Solid State Drive','/images/samsung-ssd-980.png','Samsung 980 1TB SSD',8499),(18,'Wireless Ergonomic Mouse with MagSpeed Scroll','/images/logitech-mx-master-3s.png','Logitech MX Master 3S Mouse',9995);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total_price` double NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_qx5dh8nhlnh77h8im91vlqwdv` (`user_id`),
  CONSTRAINT `FKr1irjigmqcpfrvggavnr7vjyv` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (1,0,1),(2,0,4),(3,144990,2);
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart_items`
--

DROP TABLE IF EXISTS `shopping_cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart_items` (
  `shopping_cart_id` bigint NOT NULL,
  `items_id` bigint NOT NULL,
  UNIQUE KEY `UK_ln84ylb54v72dt5hxftrtas48` (`items_id`),
  KEY `FKn4ocuqbcv64d0pvyhv863l1y5` (`shopping_cart_id`),
  CONSTRAINT `FK8tejqnqj093vlb4lilnbk4uay` FOREIGN KEY (`items_id`) REFERENCES `cart_items` (`id`),
  CONSTRAINT `FKn4ocuqbcv64d0pvyhv863l1y5` FOREIGN KEY (`shopping_cart_id`) REFERENCES `shopping_cart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart_items`
--

LOCK TABLES `shopping_cart_items` WRITE;
/*!40000 ALTER TABLE `shopping_cart_items` DISABLE KEYS */;
INSERT INTO `shopping_cart_items` VALUES (3,4),(3,5);
/*!40000 ALTER TABLE `shopping_cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'anandhi@gmail.com','$2a$10$QfP7.8.ofahzP/4ngYtLpe0bnpgNa9uLv9bECIrx3RzPw6BR8UGGi','Anandhi'),(2,'dhanu@gmail.com','$2a$10$iZElEaAk3A4Wwzos3B51xOVZ2h5521M1Qs6KuUZAUap6JS8dc2t0e','dhanu'),(3,NULL,'$2a$10$lT21ZcwI6qCOlQ3SzrsMZO9v2SL4K49Alio71WvbEk69.qlctrqD6','testuser'),(4,'aadhi@gmail.com','$2a$10$.JPP/R9NoZBvUSxhg7nrtOouxLRhm0T6PNJUgDM1NeoH23oDnuJ7W','aadhi');
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

-- Dump completed on 2025-08-02  9:10:25
