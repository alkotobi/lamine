# ************************************************************
# Sequel Ace SQL dump
# Version 20089
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 9.2.0)
# Database: merhab_cars
# Generation Time: 2025-03-31 20:52:03 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table broker
# ------------------------------------------------------------

DROP TABLE IF EXISTS `broker`;

CREATE TABLE `broker` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `broker` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `broker` WRITE;
/*!40000 ALTER TABLE `broker` DISABLE KEYS */;

INSERT INTO `broker` (`id`, `broker`)
VALUES
	(1,'LAMINE');

/*!40000 ALTER TABLE `broker` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table colors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `colors`;

CREATE TABLE `colors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `color` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;

INSERT INTO `colors` (`id`, `color`)
VALUES
	(1,'WHITE');

/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_achat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_achat`;

CREATE TABLE `order_achat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_supplier` int NOT NULL,
  `date` date NOT NULL,
  `vin_get_date` date NOT NULL,
  `supp_get_cars_date` date NOT NULL,
  `delivery_to_port_date` date NOT NULL,
  `amount` decimal(10,0) DEFAULT '0',
  `deposit` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table pi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pi`;

CREATE TABLE `pi` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_trannssaction` int DEFAULT NULL,
  `pi` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table suppliers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `suplier` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `credit` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table swifts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `swifts`;

CREATE TABLE `swifts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_transactiion` int DEFAULT NULL,
  `swift` blob,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table tbl_brands
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_brands`;

CREATE TABLE `tbl_brands` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `brand` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brand` (`brand`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_brands` WRITE;
/*!40000 ALTER TABLE `tbl_brands` DISABLE KEYS */;

INSERT INTO `tbl_brands` (`id`, `brand`)
VALUES
	(1,'TOYOTA'),
	(2,'VW');

/*!40000 ALTER TABLE `tbl_brands` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_car_model
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_car_model`;

CREATE TABLE `tbl_car_model` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `model` varchar(250) NOT NULL,
  `id_car_name` int DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`model`,`id_car_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_car_model` WRITE;
/*!40000 ALTER TABLE `tbl_car_model` DISABLE KEYS */;

INSERT INTO `tbl_car_model` (`id`, `model`, `id_car_name`, `notes`)
VALUES
	(1,'GR SPORT',1,NULL),
	(2,'STARLIGHT',2,NULL);

/*!40000 ALTER TABLE `tbl_car_model` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_car_name
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_car_name`;

CREATE TABLE `tbl_car_name` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `id_brand` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unique` (`name`,`id_brand`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_car_name` WRITE;
/*!40000 ALTER TABLE `tbl_car_name` DISABLE KEYS */;

INSERT INTO `tbl_car_name` (`id`, `name`, `id_brand`)
VALUES
	(1,'HELIX',1),
	(2,'T-ROC',2);

/*!40000 ALTER TABLE `tbl_car_name` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_cars_stock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_cars_stock`;

CREATE TABLE `tbl_cars_stock` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_car_model` int NOT NULL,
  `vin` varchar(50) DEFAULT NULL,
  `date_of_production` date DEFAULT NULL,
  `km` int DEFAULT '0',
  `date_of_delivery` date DEFAULT NULL,
  `date_ordered` date NOT NULL,
  `ship_to_id_city` int DEFAULT NULL,
  `ship_from_id_city` int DEFAULT NULL,
  `price_usd` decimal(10,0) NOT NULL,
  `id_color` int NOT NULL,
  `taken` tinyint(1) NOT NULL DEFAULT '0',
  `id_supplier` int DEFAULT NULL,
  `id_order_achat` int DEFAULT NULL,
  `id_order_vente` int DEFAULT NULL,
  `price_achat` decimal(10,0) NOT NULL,
  `loaded` tinyint(1) DEFAULT '0',
  `freight` decimal(10,0) DEFAULT '0',
  `id_owner` int DEFAULT '0',
  `deposit_from_client` decimal(10,0) DEFAULT NULL,
  `deposit_to_supplier` decimal(10,0) DEFAULT NULL,
  `rate` decimal(10,0) DEFAULT NULL,
  `payed_to_supplier` tinyint(1) DEFAULT '0',
  `payed_from_client` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_cars_stock` WRITE;
/*!40000 ALTER TABLE `tbl_cars_stock` DISABLE KEYS */;

INSERT INTO `tbl_cars_stock` (`id`, `id_car_model`, `vin`, `date_of_production`, `km`, `date_of_delivery`, `date_ordered`, `ship_to_id_city`, `ship_from_id_city`, `price_usd`, `id_color`, `taken`, `id_supplier`, `id_order_achat`, `id_order_vente`, `price_achat`, `loaded`, `freight`, `id_owner`, `deposit_from_client`, `deposit_to_supplier`, `rate`, `payed_to_supplier`, `payed_from_client`)
VALUES
	(1,1,'0',NULL,100,NULL,'2025-01-01',1,NULL,1000,1,1,NULL,NULL,1,900,0,1500,1,NULL,NULL,250,0,0);

/*!40000 ALTER TABLE `tbl_cars_stock` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_cities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_cities`;

CREATE TABLE `tbl_cities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `id_country` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`postal_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_cities` WRITE;
/*!40000 ALTER TABLE `tbl_cities` DISABLE KEYS */;

INSERT INTO `tbl_cities` (`id`, `name`, `postal_code`, `id_country`)
VALUES
	(1,'NANSH',NULL,2),
	(2,'ORAN','31000',1),
	(3,'ALGIERS',NULL,1);

/*!40000 ALTER TABLE `tbl_cities` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_clients`;

CREATE TABLE `tbl_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `cedit` decimal(10,0) DEFAULT NULL,
  `door_no` varchar(10) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `neiberhood` varchar(255) DEFAULT NULL,
  `id_city` int DEFAULT NULL,
  `id_country` int DEFAULT '1',
  `postal_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`door_no`,`street`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_clients` WRITE;
/*!40000 ALTER TABLE `tbl_clients` DISABLE KEYS */;

INSERT INTO `tbl_clients` (`id`, `name`, `cedit`, `door_no`, `street`, `neiberhood`, `id_city`, `id_country`, `postal_code`)
VALUES
	(1,'ALI',NULL,NULL,NULL,NULL,NULL,1,NULL);

/*!40000 ALTER TABLE `tbl_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_companies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_companies`;

CREATE TABLE `tbl_companies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_city` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table tbl_countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_countries`;

CREATE TABLE `tbl_countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_countries` WRITE;
/*!40000 ALTER TABLE `tbl_countries` DISABLE KEYS */;

INSERT INTO `tbl_countries` (`id`, `name`)
VALUES
	(1,'ALGERIA'),
	(2,'CHINA');

/*!40000 ALTER TABLE `tbl_countries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_groups`;

CREATE TABLE `tbl_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `tbl_groups` WRITE;
/*!40000 ALTER TABLE `tbl_groups` DISABLE KEYS */;

INSERT INTO `tbl_groups` (`id`, `name`, `notes`)
VALUES
	(1,'admin',NULL);

/*!40000 ALTER TABLE `tbl_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_ids
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_ids`;

CREATE TABLE `tbl_ids` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_picture` blob,
  `id_client` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table tbl_order_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_order_details`;

CREATE TABLE `tbl_order_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int NOT NULL,
  `id_client` int NOT NULL,
  `id_car_model` int NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `vin` varchar(50) DEFAULT NULL,
  `date_of_production` date DEFAULT NULL,
  `km` int NOT NULL DEFAULT '0',
  `date_of_delivery` date DEFAULT NULL,
  `date_ordered` date NOT NULL,
  `ship_to_id_city` int NOT NULL,
  `ship_from_id_city` int DEFAULT NULL,
  `price_usd` decimal(10,0) NOT NULL,
  `frieght_usd` decimal(10,0) DEFAULT '0',
  `rate` decimal(10,0) DEFAULT NULL,
  `id_color` int DEFAULT NULL,
  `deposit_USD` decimal(10,0) NOT NULL DEFAULT '0',
  `payed_all` tinyint(1) NOT NULL DEFAULT '0',
  `loaded` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table tbl_orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_orders`;

CREATE TABLE `tbl_orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `ref` varchar(20) NOT NULL,
  `virsement` decimal(10,0) DEFAULT '0',
  `id_broker` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_orders` WRITE;
/*!40000 ALTER TABLE `tbl_orders` DISABLE KEYS */;

INSERT INTO `tbl_orders` (`id`, `date`, `ref`, `virsement`, `id_broker`)
VALUES
	(1,'2025-03-30','LAM234',0,1);

/*!40000 ALTER TABLE `tbl_orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_permissions`;

CREATE TABLE `tbl_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_group` int NOT NULL,
  `can_confirm_will_send` tinyint(1) NOT NULL DEFAULT '0',
  `can_confirm_send` tinyint(1) NOT NULL DEFAULT '0',
  `can_confirm_receive` tinyint(1) NOT NULL DEFAULT '0',
  `can_change_groups` tinyint(1) NOT NULL DEFAULT '0',
  `can_change_users` tinyint(1) NOT NULL DEFAULT '0',
  `can_order_det_set_vin` tinyint(1) NOT NULL DEFAULT '0',
  `can_order_det_set_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `can_order_det_set_payed_all` tinyint(1) NOT NULL DEFAULT '0',
  `can_order_det_set_loaded` tinyint(1) NOT NULL DEFAULT '0',
  `can_order_det_edit` tinyint(1) NOT NULL DEFAULT '0',
  `can_order_det_new` tinyint(1) NOT NULL DEFAULT '0',
  `can_order_c` tinyint(1) DEFAULT '0',
  `can_order_new` tinyint(1) DEFAULT '0',
  `can_order_edit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `tbl_permissions` WRITE;
/*!40000 ALTER TABLE `tbl_permissions` DISABLE KEYS */;

INSERT INTO `tbl_permissions` (`id`, `id_group`, `can_confirm_will_send`, `can_confirm_send`, `can_confirm_receive`, `can_change_groups`, `can_change_users`, `can_order_det_set_vin`, `can_order_det_set_deposit`, `can_order_det_set_payed_all`, `can_order_det_set_loaded`, `can_order_det_edit`, `can_order_det_new`, `can_order_c`, `can_order_new`, `can_order_edit`)
VALUES
	(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);

/*!40000 ALTER TABLE `tbl_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_suppliers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_suppliers`;

CREATE TABLE `tbl_suppliers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_city` int NOT NULL,
  `wechat` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_company` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table tbl_transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_transactions`;

CREATE TABLE `tbl_transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_user_will_send` int DEFAULT '0',
  `id_user_send` int DEFAULT '0',
  `id_user_receive` int DEFAULT '0',
  `amount` decimal(10,0) NOT NULL,
  `date_will_send` date DEFAULT NULL,
  `date_send` date DEFAULT NULL,
  `date_receive` date DEFAULT NULL,
  `will_send_notes` text COLLATE utf8mb4_general_ci,
  `send_notes` text COLLATE utf8mb4_general_ci,
  `receive_notes` text COLLATE utf8mb4_general_ci,
  `amount_received` decimal(10,0) DEFAULT '0',
  `rate` decimal(10,0) DEFAULT '0',
  `id_client` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table tbl_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_users`;

CREATE TABLE `tbl_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `active` tinyint(1) DEFAULT '0',
  `id_group` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;

INSERT INTO `tbl_users` (`id`, `name`, `password`, `active`, `id_group`)
VALUES
	(1,'admin','123',1,1),
	(2,'sofia','123',1,1);

/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
