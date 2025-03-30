# ************************************************************
# Sequel Ace SQL dump
# Version 20089
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 216.219.81.100 (MySQL 5.5.5-10.6.21-MariaDB)
# Database: merhab_cars
# Generation Time: 2025-03-30 03:17:56 +0000
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `broker` varchar(255) DEFAULT NULL,
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table order_achat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_achat`;

CREATE TABLE `order_achat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_supplier` int(11) NOT NULL,
  `date` date NOT NULL,
  `vin_get_date` date NOT NULL,
  `supp_get_cars_date` date NOT NULL,
  `delivery_to_port_date` date NOT NULL,
  `amount` decimal(10,0) DEFAULT 0,
  `deposit` decimal(10,0) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table pi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pi`;

CREATE TABLE `pi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_trannssaction` int(11) DEFAULT NULL,
  `pi` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table suppliers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `suplier` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `credit` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table swifts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `swifts`;

CREATE TABLE `swifts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_transactiion` int(11) DEFAULT NULL,
  `swift` blob DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table tbl_brands
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_brands`;

CREATE TABLE `tbl_brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brand` (`brand`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



# Dump of table tbl_car_model
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_car_model`;

CREATE TABLE `tbl_car_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model` varchar(250) NOT NULL,
  `id_car_name` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`model`,`id_car_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



# Dump of table tbl_car_name
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_car_name`;

CREATE TABLE `tbl_car_name` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `id_brand` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unique` (`name`,`id_brand`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



# Dump of table tbl_cars_stock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_cars_stock`;

CREATE TABLE `tbl_cars_stock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_car_model` int(11) NOT NULL,
  `vin` varchar(50) DEFAULT NULL,
  `date_of_production` date DEFAULT NULL,
  `km` int(11) NOT NULL DEFAULT 0,
  `date_of_delivery` date DEFAULT NULL,
  `date_ordered` date NOT NULL,
  `ship_to_id_city` int(11) NOT NULL,
  `ship_from_id_city` int(11) DEFAULT NULL,
  `price_usd` decimal(10,0) NOT NULL,
  `id_color` int(11) DEFAULT NULL,
  `taken` tinyint(1) NOT NULL DEFAULT 0,
  `id_supplier` int(11) DEFAULT NULL,
  `id_order_achat` int(11) DEFAULT NULL,
  `id_order_vente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



# Dump of table tbl_cities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_cities`;

CREATE TABLE `tbl_cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `id_country` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`postal_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



# Dump of table tbl_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_clients`;

CREATE TABLE `tbl_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `cedit` decimal(10,0) DEFAULT NULL,
  `door_no` varchar(10) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `neiberhood` varchar(255) DEFAULT NULL,
  `id_city` int(11) DEFAULT NULL,
  `id_country` int(11) DEFAULT 1,
  `postal_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`door_no`,`street`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



# Dump of table tbl_countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_countries`;

CREATE TABLE `tbl_countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



# Dump of table tbl_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_groups`;

CREATE TABLE `tbl_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_picture` blob DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



# Dump of table tbl_order_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_order_details`;

CREATE TABLE `tbl_order_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_car_model` int(11) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `vin` varchar(50) DEFAULT NULL,
  `date_of_production` date DEFAULT NULL,
  `km` int(11) NOT NULL DEFAULT 0,
  `date_of_delivery` date DEFAULT NULL,
  `date_ordered` date NOT NULL,
  `ship_to_id_city` int(11) NOT NULL,
  `ship_from_id_city` int(11) DEFAULT NULL,
  `price_usd` decimal(10,0) NOT NULL,
  `frieght_usd` decimal(10,0) DEFAULT 0,
  `rate` decimal(10,0) DEFAULT NULL,
  `id_color` int(11) DEFAULT NULL,
  `deposit_USD` decimal(10,0) NOT NULL DEFAULT 0,
  `payed_all` tinyint(1) NOT NULL DEFAULT 0,
  `loaded` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



# Dump of table tbl_orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_orders`;

CREATE TABLE `tbl_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `ref` varchar(20) NOT NULL,
  `virsement` decimal(10,0) DEFAULT 0,
  `id_broker` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_group` int(11) NOT NULL,
  `can_confirm_will_send` tinyint(1) NOT NULL DEFAULT 0,
  `can_confirm_send` tinyint(1) NOT NULL DEFAULT 0,
  `can_confirm_receive` tinyint(1) NOT NULL DEFAULT 0,
  `can_change_groups` tinyint(1) NOT NULL DEFAULT 0,
  `can_change_users` tinyint(1) NOT NULL DEFAULT 0,
  `can_order_det_set_vin` tinyint(1) NOT NULL DEFAULT 0,
  `can_order_det_set_deposit` tinyint(1) NOT NULL DEFAULT 0,
  `can_order_det_set_payed_all` tinyint(1) NOT NULL DEFAULT 0,
  `can_order_det_set_loaded` tinyint(1) NOT NULL DEFAULT 0,
  `can_order_det_edit` tinyint(1) NOT NULL DEFAULT 0,
  `can_order_det_new` tinyint(1) NOT NULL DEFAULT 0,
  `can_order_c` tinyint(1) DEFAULT 0,
  `can_order_new` tinyint(1) DEFAULT 0,
  `can_order_edit` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `tbl_permissions` WRITE;
/*!40000 ALTER TABLE `tbl_permissions` DISABLE KEYS */;

INSERT INTO `tbl_permissions` (`id`, `id_group`, `can_confirm_will_send`, `can_confirm_send`, `can_confirm_receive`, `can_change_groups`, `can_change_users`, `can_order_det_set_vin`, `can_order_det_set_deposit`, `can_order_det_set_payed_all`, `can_order_det_set_loaded`, `can_order_det_edit`, `can_order_det_new`, `can_order_c`, `can_order_new`, `can_order_edit`)
VALUES
	(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);

/*!40000 ALTER TABLE `tbl_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_transactions`;

CREATE TABLE `tbl_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user_will_send` int(11) DEFAULT 0,
  `id_user_send` int(11) DEFAULT 0,
  `id_user_receive` int(11) DEFAULT 0,
  `amount` decimal(10,0) NOT NULL,
  `date_will_send` date DEFAULT NULL,
  `date_send` date DEFAULT NULL,
  `date_receive` date DEFAULT NULL,
  `will_send_notes` text DEFAULT NULL,
  `send_notes` text DEFAULT NULL,
  `receive_notes` text DEFAULT NULL,
  `amount_received` decimal(10,0) DEFAULT 0,
  `rate` decimal(10,0) DEFAULT 0,
  `id_client` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table tbl_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_users`;

CREATE TABLE `tbl_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` tinyint(1) DEFAULT 0,
  `id_group` int(11) NOT NULL,
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
