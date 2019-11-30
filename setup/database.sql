-- MySQL dump 10.13  Distrib 5.7.21, for macos10.13 (x86_64)
--
-- Host: localhost    Database: affablebean
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='contains product categories, e.g., dairy, meats, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'horror & mystery'),(2,'fiction'),(3,'non-fiction'),(4,'biographies');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `city_region` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_number` varchar(19) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='maintains customer details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'b','h@hd.cn','898909898','gh','1','8983908490328'),(2,'ef','hkjhjh@jh.euur','864364786786','ruqwruqtuy','1','63487364676876766'),(3,'hhfkrwfhk','uiyiu@iuyfe.chuh','53487987937','fgsugfisugf','1','3437489794343458898'),(4,'fsdhfkjh','hh@hkjhs.chih','87329873987','eiuyiery','1','86434697637484');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(6,2) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `confirmation_number` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_order_customer` (`customer_id`),
  CONSTRAINT `fk_customer_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='maintains customer order details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES `customer_order` WRITE;
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
INSERT INTO `customer_order` VALUES (1,8.85,'2019-11-26 23:59:01',110354990,1),(2,4.70,'2019-11-29 20:25:23',915969574,2),(3,6.99,'2019-11-29 20:30:15',314043203,3),(4,4.70,'2019-11-29 21:02:01',553537399,4);
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_product`
--

DROP TABLE IF EXISTS `ordered_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordered_product` (
  `customer_order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`customer_order_id`,`product_id`),
  KEY `fk_ordered_product_customer_order` (`customer_order_id`),
  KEY `fk_ordered_product_product` (`product_id`),
  CONSTRAINT `fk_ordered_product_customer_order` FOREIGN KEY (`customer_order_id`) REFERENCES `customer_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordered_product_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='matches products with customer orders and records their quantity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_product`
--

LOCK TABLES `ordered_product` WRITE;
/*!40000 ALTER TABLE `ordered_product` DISABLE KEYS */;
INSERT INTO `ordered_product` VALUES (1,1,1),(1,2,1),(1,4,1),(2,1,1),(3,1,1),(3,5,1),(4,1,1);
/*!40000 ALTER TABLE `ordered_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `description` tinytext COLLATE utf8_unicode_ci,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category` (`category_id`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='contains product details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'it',1.70,'by Stephen King, published in 1986','2019-11-27 01:16:56',1),(2,'a head full of ghosts',2.39,'by Paul G Tremblay, published in 2015','2019-11-27 01:16:56',1),(3,'the adventure of sherlock holmes',1.09,'by Sir Arthur Conan Doyle, published in 1892','2019-11-27 01:16:56',1),(4,'unsolved',1.76,'by David Ellis and James Patterson, published in 2019','2019-11-27 01:16:56',1),(5,'the handmaid\'s tale',2.29,'by Margaret Atwood, published in 1985','2019-11-27 23:48:16',2),(6,'nineteen eighty four',3.49,'by George Orwell, published in 1949','2019-11-27 23:48:16',2),(7,'the giver of stars',2.59,'by Jojo Moyes, published in 2019','2019-11-27 23:48:16',2),(8,'before we were yours',3.55,'by Lisa Wingate, published in 2017','2019-11-27 23:48:16',2),(9,'talking to strangers',1.89,'What we should know about the People we don\'t know, by Malcolm Gladwell, published in 2019','2019-11-27 23:48:16',3),(10,'a room of one\'s own',1.19,'by Virginia Woolf, published in 1929','2019-11-27 23:48:16',3),(11,'a brief history of time',1.15,'by Stephen Hawking, published in 1988','2019-11-27 23:48:16',3),(12,'catch and kill',2.39,'by Ronan Farrow, published in 2019','2019-11-27 23:48:16',3),(13,'becoming',1.59,'by Michelle Obama, published in 2018','2019-11-27 23:48:16',4),(14,'me',2.49,'by Elton John, published in 2019','2019-11-27 23:48:16',4),(15,'the diary of a young girl',1.29,'by Anne Frank, published in 1947','2019-11-27 23:48:16',4),(16,'steve jobs',1.49,'by Walter Isaacson, published in 2011','2019-11-27 23:48:16',4);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-30  0:51:32
