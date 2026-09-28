CREATE DATABASE  IF NOT EXISTS `food_delivery_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `food_delivery_db`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: food_delivery_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
  `address_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `address_line` varchar(200) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,1,'12 Gandhi Street','Coimbatore','641001'),(2,2,'45 Nehru Nagar','Coimbatore','641004'),(3,3,'22 Anna Salai','Chennai','600001'),(4,4,'18 MG Road','Bangalore','560001'),(5,5,'90 KK Nagar','Madurai','625001'),(6,6,'5 Cherry Road','Salem','636001'),(7,7,'14 Brough Road','Erode','638001'),(8,8,'2 Cantonment','Trichy','620001'),(9,9,'33 RS Puram','Coimbatore','641002'),(10,10,'78 T Nagar','Chennai','600017');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_orders`
--

DROP TABLE IF EXISTS `customer_orders`;
/*!50001 DROP VIEW IF EXISTS `customer_orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_orders` AS SELECT 
 1 AS `customer_name`,
 1 AS `order_id`,
 1 AS `restaurant_name`,
 1 AS `order_date`,
 1 AS `total_amount`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customer_spending`
--

DROP TABLE IF EXISTS `customer_spending`;
/*!50001 DROP VIEW IF EXISTS `customer_spending`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_spending` AS SELECT 
 1 AS `customer_id`,
 1 AS `customer_name`,
 1 AS `total_orders`,
 1 AS `total_spent`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `idx_customer_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Naresh','naresh@gmail.com','9876543210','Coimbatore','2026-08-06 06:35:48'),(2,'Haritha','haritha@gmail.com','9876543211','Coimbatore','2026-08-06 06:35:48'),(3,'Yash','yash@gmail.com','9876543212','Chennai','2026-08-06 06:35:48'),(4,'Priya','priya@gmail.com','9876543213','Bangalore','2026-08-06 06:35:48'),(5,'Arun','arun@gmail.com','9876543214','Madurai','2026-08-06 06:35:48'),(6,'Kavin','kavin@gmail.com','9876543215','Salem','2026-08-06 06:35:48'),(7,'Divya','divya@gmail.com','9876543216','Erode','2026-08-06 06:35:48'),(8,'Ramesh','ramesh@gmail.com','9876543217','Trichy','2026-08-06 06:35:48'),(9,'Sneha','sneha@gmail.com','9876543218','Coimbatore','2026-08-06 06:35:48'),(10,'Vignesh','vignesh@gmail.com','9876543219','Chennai','2026-08-06 06:35:48');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_partners`
--

DROP TABLE IF EXISTS `delivery_partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_partners` (
  `partner_id` int NOT NULL AUTO_INCREMENT,
  `partner_name` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `vehicle_type` varchar(30) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  PRIMARY KEY (`partner_id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_partners`
--

LOCK TABLES `delivery_partners` WRITE;
/*!40000 ALTER TABLE `delivery_partners` DISABLE KEYS */;
INSERT INTO `delivery_partners` VALUES (1,'Rahul','9880000001','Bike',4.8),(2,'Arun Kumar','9880000002','Scooter',4.6),(3,'Vijay','9880000003','Bike',4.9),(4,'Karthik','9880000004','Bike',4.7),(5,'Ajay','9880000005','Scooter',4.5);
/*!40000 ALTER TABLE `delivery_partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `restaurant_id` int DEFAULT NULL,
  `food_name` varchar(100) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'Mini Meals','Meals',120.00),(2,1,'Poori','Breakfast',80.00),(3,2,'Chicken Biryani','Biryani',250.00),(4,2,'Mutton Biryani','Biryani',320.00),(5,3,'Veg Pizza','Pizza',299.00),(6,3,'Chicken Pizza','Pizza',399.00),(7,4,'Zinger Burger','Burger',199.00),(8,4,'Chicken Bucket','Chicken',699.00),(9,5,'Cheese Pizza','Pizza',350.00),(10,6,'Whopper','Burger',249.00),(11,7,'Veg Sandwich','Sandwich',180.00),(12,8,'McAloo Tikki','Burger',99.00),(13,9,'South Indian Meals','Meals',180.00),(14,10,'Mutton Chukka','Starter',280.00),(15,10,'Parotta','Dinner',25.00);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,3,2),(2,1,4,1),(3,2,1,1),(4,2,2,1),(5,3,5,1),(6,3,6,1),(7,4,8,1),(8,5,9,1),(9,6,10,1),(10,7,11,1),(11,8,12,1),(12,9,13,1),(13,10,14,1),(14,10,15,2),(15,11,6,1),(16,12,7,1),(17,13,3,1),(18,14,9,1),(19,15,1,1),(20,16,13,1),(21,17,10,1),(22,18,11,1),(23,19,12,1),(24,20,3,2),(25,20,4,1);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `order_summary`
--

DROP TABLE IF EXISTS `order_summary`;
/*!50001 DROP VIEW IF EXISTS `order_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_summary` AS SELECT 
 1 AS `order_id`,
 1 AS `customer_name`,
 1 AS `city`,
 1 AS `restaurant_name`,
 1 AS `partner_name`,
 1 AS `order_date`,
 1 AS `total_amount`,
 1 AS `status`,
 1 AS `delivery_status`,
 1 AS `payment_method`,
 1 AS `payment_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `restaurant_id` int DEFAULT NULL,
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `partner_id` int DEFAULT NULL,
  `delivery_status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `restaurant_id` (`restaurant_id`),
  KEY `fk_partner` (`partner_id`),
  KEY `idx_order_date` (`order_date`),
  KEY `idx_order_status` (`status`),
  CONSTRAINT `fk_partner` FOREIGN KEY (`partner_id`) REFERENCES `delivery_partners` (`partner_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,2,'2026-08-01 12:30:00',820.00,'Cancelled',1,'Cancelled'),(2,2,1,'2026-08-01 08:45:00',200.00,'Delivered',2,'Delivered'),(3,3,3,'2026-08-02 07:15:00',698.00,'Preparing',3,'Out for Delivery'),(4,4,4,'2026-08-02 09:30:00',699.00,'Delivered',4,'Delivered'),(5,5,5,'2026-08-03 01:00:00',350.00,'Cancelled',5,'Cancelled'),(6,6,6,'2026-08-03 06:45:00',249.00,'Delivered',1,'Delivered'),(7,7,7,'2026-08-04 08:20:00',180.00,'Delivered',2,'Delivered'),(8,8,8,'2026-08-04 07:30:00',99.00,'Delivered',3,'Delivered'),(9,9,9,'2026-08-05 01:15:00',180.00,'Preparing',4,'Out for Delivery'),(10,10,10,'2026-08-05 09:00:00',330.00,'Delivered',5,'Delivered'),(11,1,3,'2026-08-06 07:40:00',399.00,'Delivered',2,'Delivered'),(12,2,4,'2026-08-06 08:00:00',199.00,'Preparing',1,'Out for Delivery'),(13,3,2,'2026-08-07 12:10:00',250.00,'Delivered',5,'Delivered'),(14,4,5,'2026-08-07 01:45:00',350.00,'Delivered',4,'Delivered'),(15,5,1,'2026-08-08 08:30:00',120.00,'Delivered',3,'Delivered'),(16,6,9,'2026-08-08 01:10:00',180.00,'Preparing',2,'Out for Delivery'),(17,7,6,'2026-08-09 07:50:00',249.00,'Delivered',1,'Delivered'),(18,8,7,'2026-08-09 06:15:00',180.00,'Cancelled',5,'Cancelled'),(19,9,8,'2026-08-10 08:25:00',99.00,'Delivered',4,'Delivered'),(20,10,2,'2026-08-10 12:45:00',820.00,'Delivered',3,'Delivered');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_order_update` AFTER UPDATE ON `orders` FOR EACH ROW BEGIN
    IF NEW.status = 'Cancelled'
       AND OLD.status <> 'Cancelled' THEN

        UPDATE payments
        SET payment_status = 'Refunded'
        WHERE order_id = NEW.order_id;

    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `payment_method` varchar(30) DEFAULT NULL,
  `payment_status` varchar(30) DEFAULT NULL,
  `payment_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'UPI','Refunded','2026-08-01 00:00:00'),(2,2,'Cash','Paid','2026-08-01 00:00:00'),(3,3,'Card','Pending','2026-08-02 00:00:00'),(4,4,'UPI','Paid','2026-08-02 00:00:00'),(5,5,'Card','Refunded','2026-08-03 00:00:00'),(6,6,'Cash','Paid','2026-08-03 00:00:00'),(7,7,'UPI','Paid','2026-08-04 00:00:00'),(8,8,'Card','Paid','2026-08-04 00:00:00'),(9,9,'UPI','Pending','2026-08-05 00:00:00'),(10,10,'Cash','Paid','2026-08-05 00:00:00'),(11,11,'UPI','Paid','2026-08-06 00:00:00'),(12,12,'Card','Pending','2026-08-06 00:00:00'),(13,13,'UPI','Paid','2026-08-07 00:00:00'),(14,14,'Cash','Paid','2026-08-07 00:00:00'),(15,15,'UPI','Paid','2026-08-08 00:00:00'),(16,16,'Card','Pending','2026-08-08 00:00:00'),(17,17,'Cash','Paid','2026-08-09 00:00:00'),(18,18,'UPI','Refunded','2026-08-09 00:00:00'),(19,19,'Card','Paid','2026-08-10 00:00:00'),(20,20,'UPI','Paid','2026-08-10 00:00:00');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `restaurant_id` int NOT NULL AUTO_INCREMENT,
  `restaurant_name` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`restaurant_id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'A2B','Coimbatore',4.5,'9000000001'),(2,'SS Hyderabad Biryani','Coimbatore',4.7,'9000000002'),(3,'Dominos','Coimbatore',4.4,'9000000003'),(4,'KFC','Coimbatore',4.3,'9000000004'),(5,'Pizza Hut','Chennai',4.2,'9000000005'),(6,'Burger King','Chennai',4.1,'9000000006'),(7,'Subway','Bangalore',4.4,'9000000007'),(8,'McDonalds','Madurai',4.3,'9000000008'),(9,'Annapoorna','Coimbatore',4.8,'9000000009'),(10,'Junior Kuppanna','Salem',4.6,'9000000010');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `restaurant_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `review_text` varchar(300) DEFAULT NULL,
  `review_date` date DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `customer_id` (`customer_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`),
  CONSTRAINT `reviews_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,2,5,'Excellent biryani!','2026-08-02'),(2,2,1,4,'Good breakfast.','2026-08-02'),(3,3,3,5,'Loved the pizza.','2026-08-03'),(4,4,4,4,'Burger was tasty.','2026-08-03'),(5,5,5,3,'Delivery was delayed.','2026-08-04'),(6,6,6,4,'Nice burger.','2026-08-04'),(7,7,7,5,'Fresh sandwich.','2026-08-05'),(8,8,8,4,'Affordable food.','2026-08-05'),(9,9,9,5,'Excellent meals.','2026-08-06'),(10,10,10,5,'Amazing mutton dishes.','2026-08-06'),(11,1,2,5,'Excellent food!','2026-08-07');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_review_insert` BEFORE INSERT ON `reviews` FOR EACH ROW BEGIN
    IF NEW.review_date IS NULL THEN
        SET NEW.review_date = CURDATE();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'food_delivery_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `get_all_customers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_customers`()
BEGIN
    SELECT *
    FROM customers;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_customer_orders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_customer_orders`(IN cust_id INT)
BEGIN
    SELECT
        o.order_id,
        c.customer_name,
        r.restaurant_name,
        o.order_date,
        o.total_amount,
        o.status
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    JOIN restaurants r
        ON o.restaurant_id = r.restaurant_id
    WHERE o.customer_id = cust_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_restaurant_revenue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_restaurant_revenue`(IN rest_id INT)
BEGIN
    SELECT
        r.restaurant_name,
        COUNT(o.order_id) AS total_orders,
        SUM(o.total_amount) AS total_revenue
    FROM restaurants r
    JOIN orders o
        ON r.restaurant_id = o.restaurant_id
    WHERE r.restaurant_id = rest_id
      AND o.status = 'Delivered'
    GROUP BY r.restaurant_id, r.restaurant_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `customer_orders`
--

/*!50001 DROP VIEW IF EXISTS `customer_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_orders` AS select `c`.`customer_name` AS `customer_name`,`o`.`order_id` AS `order_id`,`r`.`restaurant_name` AS `restaurant_name`,`o`.`order_date` AS `order_date`,`o`.`total_amount` AS `total_amount`,`o`.`status` AS `status` from ((`customers` `c` join `orders` `o` on((`c`.`customer_id` = `o`.`customer_id`))) join `restaurants` `r` on((`o`.`restaurant_id` = `r`.`restaurant_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_spending`
--

/*!50001 DROP VIEW IF EXISTS `customer_spending`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_spending` AS select `c`.`customer_id` AS `customer_id`,`c`.`customer_name` AS `customer_name`,count(`o`.`order_id`) AS `total_orders`,sum(`o`.`total_amount`) AS `total_spent` from (`customers` `c` join `orders` `o` on((`c`.`customer_id` = `o`.`customer_id`))) where (`o`.`status` = 'Delivered') group by `c`.`customer_id`,`c`.`customer_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_summary`
--

/*!50001 DROP VIEW IF EXISTS `order_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_summary` AS select `o`.`order_id` AS `order_id`,`c`.`customer_name` AS `customer_name`,`c`.`city` AS `city`,`r`.`restaurant_name` AS `restaurant_name`,`d`.`partner_name` AS `partner_name`,`o`.`order_date` AS `order_date`,`o`.`total_amount` AS `total_amount`,`o`.`status` AS `status`,`o`.`delivery_status` AS `delivery_status`,`p`.`payment_method` AS `payment_method`,`p`.`payment_status` AS `payment_status` from ((((`orders` `o` join `customers` `c` on((`o`.`customer_id` = `c`.`customer_id`))) join `restaurants` `r` on((`o`.`restaurant_id` = `r`.`restaurant_id`))) join `delivery_partners` `d` on((`o`.`partner_id` = `d`.`partner_id`))) join `payments` `p` on((`o`.`order_id` = `p`.`order_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-07 12:42:47
