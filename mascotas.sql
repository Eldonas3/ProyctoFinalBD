-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: FurFamilyFinder
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `access_credential`
--

DROP TABLE IF EXISTS `access_credential`;
/*!50001 DROP VIEW IF EXISTS `access_credential`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `access_credential` AS SELECT
 1 AS `empleado_nombre_usuario`,
  1 AS `empleado_contrasena`,
  1 AS `empleado_correo`,
  1 AS `cliente_nombre_usuario`,
  1 AS `cliente_contrasena`,
  1 AS `cliente_correo` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `adopcion`
--

DROP TABLE IF EXISTS `adopcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adopcion` (
  `id_adopcion` int(11) NOT NULL AUTO_INCREMENT,
  `cliente` int(11) NOT NULL,
  `empleado` int(11) NOT NULL,
  `mascota` int(11) NOT NULL,
  `fecha_adopcion` datetime NOT NULL,
  `status_adopcion` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_adopcion`),
  KEY `cliente` (`cliente`),
  KEY `empleado` (`empleado`),
  KEY `mascota` (`mascota`),
  CONSTRAINT `adopcion_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `adopcion_ibfk_2` FOREIGN KEY (`empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `adopcion_ibfk_3` FOREIGN KEY (`mascota`) REFERENCES `mascota` (`id_mascota`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adopcion`
--

LOCK TABLES `adopcion` WRITE;
/*!40000 ALTER TABLE `adopcion` DISABLE KEYS */;
INSERT INTO `adopcion` VALUES (2,2,2,3,'2023-03-20 00:00:00',0,NULL,NULL,NULL),(3,3,3,5,'2023-03-20 00:00:00',1,NULL,NULL,NULL),(4,4,1,7,'2023-03-20 00:00:00',0,NULL,NULL,NULL),(5,5,2,1,'2023-03-20 00:00:00',1,NULL,NULL,NULL),(6,6,3,1,'2023-03-20 00:00:00',0,NULL,NULL,NULL),(8,3,2,2,'2023-12-06 00:00:00',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `adopcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `adoption_acepted`
--

DROP TABLE IF EXISTS `adoption_acepted`;
/*!50001 DROP VIEW IF EXISTS `adoption_acepted`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `adoption_acepted` AS SELECT
 1 AS `id_adopcion`,
  1 AS `nombre_empleado`,
  1 AS `nombre_cliente`,
  1 AS `nombre` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `adoptions_in_process`
--

DROP TABLE IF EXISTS `adoptions_in_process`;
/*!50001 DROP VIEW IF EXISTS `adoptions_in_process`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `adoptions_in_process` AS SELECT
 1 AS `id_adopcion`,
  1 AS `nombre_empleado` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add access_credential',7,'add_access_credential'),(26,'Can change access_credential',7,'change_access_credential'),(27,'Can delete access_credential',7,'delete_access_credential'),(28,'Can view access_credential',7,'view_access_credential'),(29,'Can add adopcion',8,'add_adopcion'),(30,'Can change adopcion',8,'change_adopcion'),(31,'Can delete adopcion',8,'delete_adopcion'),(32,'Can view adopcion',8,'view_adopcion'),(33,'Can add adoption_acepted',9,'add_adoption_acepted'),(34,'Can change adoption_acepted',9,'change_adoption_acepted'),(35,'Can delete adoption_acepted',9,'delete_adoption_acepted'),(36,'Can view adoption_acepted',9,'view_adoption_acepted'),(37,'Can add adoptions_in_process',10,'add_adoptions_in_process'),(38,'Can change adoptions_in_process',10,'change_adoptions_in_process'),(39,'Can delete adoptions_in_process',10,'delete_adoptions_in_process'),(40,'Can view adoptions_in_process',10,'view_adoptions_in_process'),(41,'Can add auth group',11,'add_authgroup'),(42,'Can change auth group',11,'change_authgroup'),(43,'Can delete auth group',11,'delete_authgroup'),(44,'Can view auth group',11,'view_authgroup'),(45,'Can add auth group permissions',12,'add_authgrouppermissions'),(46,'Can change auth group permissions',12,'change_authgrouppermissions'),(47,'Can delete auth group permissions',12,'delete_authgrouppermissions'),(48,'Can view auth group permissions',12,'view_authgrouppermissions'),(49,'Can add auth permission',13,'add_authpermission'),(50,'Can change auth permission',13,'change_authpermission'),(51,'Can delete auth permission',13,'delete_authpermission'),(52,'Can view auth permission',13,'view_authpermission'),(53,'Can add auth user',14,'add_authuser'),(54,'Can change auth user',14,'change_authuser'),(55,'Can delete auth user',14,'delete_authuser'),(56,'Can view auth user',14,'view_authuser'),(57,'Can add auth user groups',15,'add_authusergroups'),(58,'Can change auth user groups',15,'change_authusergroups'),(59,'Can delete auth user groups',15,'delete_authusergroups'),(60,'Can view auth user groups',15,'view_authusergroups'),(61,'Can add auth user user permissions',16,'add_authuseruserpermissions'),(62,'Can change auth user user permissions',16,'change_authuseruserpermissions'),(63,'Can delete auth user user permissions',16,'delete_authuseruserpermissions'),(64,'Can view auth user user permissions',16,'view_authuseruserpermissions'),(65,'Can add cliente',17,'add_cliente'),(66,'Can change cliente',17,'change_cliente'),(67,'Can delete cliente',17,'delete_cliente'),(68,'Can view cliente',17,'view_cliente'),(69,'Can add cliente_contact',18,'add_cliente_contact'),(70,'Can change cliente_contact',18,'change_cliente_contact'),(71,'Can delete cliente_contact',18,'delete_cliente_contact'),(72,'Can view cliente_contact',18,'view_cliente_contact'),(73,'Can add cuidado',19,'add_cuidado'),(74,'Can change cuidado',19,'change_cuidado'),(75,'Can delete cuidado',19,'delete_cuidado'),(76,'Can view cuidado',19,'view_cuidado'),(77,'Can add django admin log',20,'add_djangoadminlog'),(78,'Can change django admin log',20,'change_djangoadminlog'),(79,'Can delete django admin log',20,'delete_djangoadminlog'),(80,'Can view django admin log',20,'view_djangoadminlog'),(81,'Can add django content type',21,'add_djangocontenttype'),(82,'Can change django content type',21,'change_djangocontenttype'),(83,'Can delete django content type',21,'delete_djangocontenttype'),(84,'Can view django content type',21,'view_djangocontenttype'),(85,'Can add django migrations',22,'add_djangomigrations'),(86,'Can change django migrations',22,'change_djangomigrations'),(87,'Can delete django migrations',22,'delete_djangomigrations'),(88,'Can view django migrations',22,'view_djangomigrations'),(89,'Can add django session',23,'add_djangosession'),(90,'Can change django session',23,'change_djangosession'),(91,'Can delete django session',23,'delete_djangosession'),(92,'Can view django session',23,'view_djangosession'),(93,'Can add empleado',24,'add_empleado'),(94,'Can change empleado',24,'change_empleado'),(95,'Can delete empleado',24,'delete_empleado'),(96,'Can view empleado',24,'view_empleado'),(97,'Can add especie',25,'add_especie'),(98,'Can change especie',25,'change_especie'),(99,'Can delete especie',25,'delete_especie'),(100,'Can view especie',25,'view_especie'),(101,'Can add mascota',26,'add_mascota'),(102,'Can change mascota',26,'change_mascota'),(103,'Can delete mascota',26,'delete_mascota'),(104,'Can view mascota',26,'view_mascota'),(105,'Can add perfiles',27,'add_perfiles'),(106,'Can change perfiles',27,'change_perfiles'),(107,'Can delete perfiles',27,'delete_perfiles'),(108,'Can view perfiles',27,'view_perfiles'),(109,'Can add raza',28,'add_raza'),(110,'Can change raza',28,'change_raza'),(111,'Can delete raza',28,'delete_raza'),(112,'Can view raza',28,'view_raza'),(113,'Can add real_name',29,'add_real_name'),(114,'Can change real_name',29,'change_real_name'),(115,'Can delete real_name',29,'delete_real_name'),(116,'Can view real_name',29,'view_real_name');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$Oj3k8mwzO24FIioCSR1J5b$Aelw5m3HQX4fbD16Jd8PNkx89/sqx978x9VyEwye2jA=','2023-12-02 01:23:04.152543',1,'eldonas','','','eldonas1@protonmail.com',1,1,'2023-12-02 01:22:18.467984');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(100) NOT NULL,
  `apellido_materno` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `edad` int(11) NOT NULL,
  `sexo` char(1) NOT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `perfil` int(11) NOT NULL,
  `nombre_usuario` varchar(100) NOT NULL,
  `contrasena` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  KEY `perfil` (`perfil`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`perfil`) REFERENCES `perfiles` (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan','Perez','Prado','2138527141','Enrique Segoviano #12','correolegitimo@soylegitimo.com',25,'M',NULL,4,'Juancho','1234',1,NULL,NULL,NULL),(2,'Lucas','pradera','Anastacio','2138527141','Enrique Segoviano #12','correolegitimo@soylegitimo.com',36,'F',NULL,4,'Lucario','1234',1,NULL,NULL,NULL),(3,'Alberto','Aguilar','Martinez','2138527141','Enrique Segoviano #12','correolegitimo@soylegitimo.com',18,'M',NULL,4,'Beto','1234',1,NULL,NULL,NULL),(4,'Jose','Cien Fuegos','Hernandez','2138527141','Enrique Segoviano #12','correolegitimo@soylegitimo.com',64,'M',NULL,4,'pepe','1234',1,NULL,NULL,NULL),(5,'Mauricio','Arcos','Cruz','2138527141','Enrique Segoviano #12','correolegitimo@soylegitimo.com',32,'M',NULL,4,'Mau','1234',1,NULL,NULL,NULL),(6,'Guadalupe','Roque','Roman','2138527141','Enrique Segoviano #12','correolegitimo@soylegitimo.com',41,'F',NULL,4,'Lupita','1234',1,NULL,NULL,NULL),(7,'Panfilo','Casimiro','Roma','2138527141','Enrique Segoviano #12','correolegitimo@soylegitimo.com',31,'M',NULL,4,'Pepe2','1234',1,NULL,NULL,NULL),(8,'Jose Jose','Buenavista','Arcos','2138527141','Enrique Segoviano #12','correolegitimo@soylegitimo.com',90,'M',NULL,4,'pepealcuadrado','1234',1,NULL,NULL,NULL),(9,'Gabriel','Alatriste','Audirac','2138527141','Enrique Segoviano #12','correolegitimo@soylegitimo.com',25,'F',NULL,4,'Gabi','1234',1,NULL,NULL,NULL),(10,'Pedro','Agustin','Melgarejo','2311233456','Enrique segoviano','dante@sanguinius.com',35,'H',NULL,1,'bestMarine','IWANTDIEPLEASE',NULL,NULL,NULL,NULL),(11,'qwerty','perez','jorge','2311460994','qwerty','qwerty@qwerty.com',65,'H',NULL,1,'qwerty','qwerty',NULL,NULL,NULL,NULL),(12,'Luis','Dante','Dante','1234567890','imperium nigilus','dante@sanguinius.com',1500,'H',NULL,4,'DantePrimaris','pleaseletmedie',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `cliente_contact`
--

DROP TABLE IF EXISTS `cliente_contact`;
/*!50001 DROP VIEW IF EXISTS `cliente_contact`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `cliente_contact` AS SELECT
 1 AS `nombre_cliente`,
  1 AS `telefono`,
  1 AS `correo_electronico`,
  1 AS `status_adopcion` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cuidado`
--

DROP TABLE IF EXISTS `cuidado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuidado` (
  `id_cuidado` int(11) NOT NULL AUTO_INCREMENT,
  `dieta` text DEFAULT NULL,
  `raza` int(11) NOT NULL,
  `cuidados` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cuidado`),
  KEY `raza` (`raza`),
  CONSTRAINT `cuidado_ibfk_1` FOREIGN KEY (`raza`) REFERENCES `raza` (`id_raza`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuidado`
--

LOCK TABLES `cuidado` WRITE;
/*!40000 ALTER TABLE `cuidado` DISABLE KEYS */;
INSERT INTO `cuidado` VALUES (1,'Croquetas y tortilla',1,'Muchos besos y apapachos',NULL,NULL,NULL),(2,'Croquetas y tortilla',2,'Muchos besos y apapachos',NULL,NULL,NULL),(3,'Croquetas y tortilla',3,'Muchos besos y apapachos',NULL,NULL,NULL),(4,'Croquetas y tortilla',4,'Muchos besos y apapachos',NULL,NULL,NULL),(5,'Croquetas y ratones',5,'Muchos besos y apapachos',NULL,NULL,NULL),(6,'Croquetas y ratones',6,'Muchos besos y apapachos',NULL,NULL,NULL),(7,'Croquetas y ratones',7,'Muchos besos y apapachos',NULL,NULL,NULL),(8,'Otros lenguajes de programacion',8,'Un entorno virtual para cada proyecto',NULL,NULL,NULL),(9,'Ratones',9,'Muchos besos y apapachos',NULL,NULL,NULL),(10,'Fruta y semillas',10,'Muchos besos y apapachos',NULL,NULL,NULL),(11,'Fruta y semillas',11,'Muchos besos y apapachos',NULL,NULL,NULL),(12,'Alimento para peces',12,'Muchos besos y apapachos',NULL,NULL,NULL),(13,'Alimento para peces',13,'Muchos besos y apapachos',NULL,NULL,NULL),(14,'pan de nuez',3,'Muchos mimos y abrazos',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cuidado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'Inicio','access_credential'),(8,'Inicio','adopcion'),(10,'Inicio','adoptions_in_process'),(9,'Inicio','adoption_acepted'),(11,'Inicio','authgroup'),(12,'Inicio','authgrouppermissions'),(13,'Inicio','authpermission'),(14,'Inicio','authuser'),(15,'Inicio','authusergroups'),(16,'Inicio','authuseruserpermissions'),(17,'Inicio','cliente'),(18,'Inicio','cliente_contact'),(19,'Inicio','cuidado'),(20,'Inicio','djangoadminlog'),(21,'Inicio','djangocontenttype'),(22,'Inicio','djangomigrations'),(23,'Inicio','djangosession'),(24,'Inicio','empleado'),(25,'Inicio','especie'),(26,'Inicio','mascota'),(27,'Inicio','perfiles'),(28,'Inicio','raza'),(29,'Inicio','real_name'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-12-02 00:37:27.387117'),(2,'auth','0001_initial','2023-12-02 00:37:40.260643'),(3,'admin','0001_initial','2023-12-02 00:37:42.515781'),(4,'admin','0002_logentry_remove_auto_add','2023-12-02 00:37:42.592519'),(5,'admin','0003_logentry_add_action_flag_choices','2023-12-02 00:37:42.662972'),(6,'contenttypes','0002_remove_content_type_name','2023-12-02 00:37:44.868719'),(7,'auth','0002_alter_permission_name_max_length','2023-12-02 00:37:46.125902'),(8,'auth','0003_alter_user_email_max_length','2023-12-02 00:37:46.749901'),(9,'auth','0004_alter_user_username_opts','2023-12-02 00:37:46.884475'),(10,'auth','0005_alter_user_last_login_null','2023-12-02 00:37:47.533855'),(11,'auth','0006_require_contenttypes_0002','2023-12-02 00:37:47.571857'),(12,'auth','0007_alter_validators_add_error_messages','2023-12-02 00:37:47.659864'),(13,'auth','0008_alter_user_username_max_length','2023-12-02 00:37:47.876902'),(14,'auth','0009_alter_user_last_name_max_length','2023-12-02 00:37:49.014404'),(15,'auth','0010_alter_group_name_max_length','2023-12-02 00:37:49.187594'),(16,'auth','0011_update_proxy_permissions','2023-12-02 00:37:49.257992'),(17,'auth','0012_alter_user_first_name_max_length','2023-12-02 00:37:49.378029'),(18,'sessions','0001_initial','2023-12-02 00:37:49.866518'),(19,'Inicio','0001_initial','2023-12-07 05:13:35.517499');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('wpjvukv25boqs9312nrxmbhz5epqvolm','.eJxVjEsOwiAUAO_C2pDyB5fuewbyHg-kamhS2pXx7oakC93OTObNIhx7jUfPW1yIXZlgl1-GkJ65DUEPaPeVp7Xt24J8JPy0nc8r5dftbP8GFXodW3CTDeQgOFN8Dsphlhk0oPDaOEx-IqO9K0piIJvQi2S1CmilKqgN-3wB39E3uQ:1r9Eim:6XLwGqTJ6qfBGZa4lSnE65V-VgE1h0plIFt2iAOickE','2023-12-16 01:23:04.192066');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empleado` varchar(100) NOT NULL,
  `apellido_materno` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `RFC` varchar(10) DEFAULT NULL,
  `cuenta_bancaria` varchar(18) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `perfil` int(11) NOT NULL,
  `nombre_usuario` varchar(100) NOT NULL,
  `contrasena` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  KEY `perfil` (`perfil`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`perfil`) REFERENCES `perfiles` (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Jeronimo','Aguilar','Gutierrez','1234567890','Enrique Segoviano #12','correolegitimo@soylegitimo.com','ABC4567890','123456789012345678',35,'M',NULL,1,'JerAgu123','secreto',1,NULL,NULL,NULL),(2,'Juan Gabriel','Sanchez','Cordero','1234567890','Enrique Segoviano #12','correolegitimo@soylegitimo.com','DEF4567890','123456789012345678',35,'M',NULL,1,'Aguacatito','secreto2',1,NULL,NULL,NULL),(3,'Cuahutemoc','Blanco','Arcos','1234567890','Enrique Segoviano #12','correolegitimo@soylegitimo.com','POL4567890','123456789012345678',35,'F',NULL,1,'Americanista','secreto3',1,NULL,NULL,NULL),(4,'Alberto','Aguilar','Gutierrez','1234567890','Enrique Segoviano #12','correolegitimo@soylegitimo.com','LOK4567890','123456789012345678',35,'M',NULL,2,'ElYucateco','admin1234',1,NULL,NULL,NULL),(5,'Luisa','Flores','Torres','1234567890','Enrique Segoviano #12','correolegitimo@soylegitimo.com','ERT4567890','123456789012345678',35,'F',NULL,3,'AdminDB','adminDB1234',1,NULL,NULL,NULL),(6,'Robute','Guilliman','Victorious','9283746510','terra, imperium sanctum, segmentus pacificus','ultramar@ultramar.com','1q2w3e4r5t','1234567890',76,'H',NULL,3,'RobertoGuillermo','iloveyvraineandeldar',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especie`
--

DROP TABLE IF EXISTS `especie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especie` (
  `id_especie` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_especie` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_especie`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especie`
--

LOCK TABLES `especie` WRITE;
/*!40000 ALTER TABLE `especie` DISABLE KEYS */;
INSERT INTO `especie` VALUES (1,'Perro'),(2,'Gato'),(3,'Serpiente'),(4,'Pajaro'),(5,'Pez'),(6,'insectos');
/*!40000 ALTER TABLE `especie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascota`
--

DROP TABLE IF EXISTS `mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mascota` (
  `id_mascota` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `peso` float DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `raza` int(11) NOT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_mascota`),
  KEY `raza` (`raza`),
  CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`raza`) REFERENCES `raza` (`id_raza`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascota`
--

LOCK TABLES `mascota` WRITE;
/*!40000 ALTER TABLE `mascota` DISABLE KEYS */;
INSERT INTO `mascota` VALUES (1,'Max',12,3,'M','Perro pastor aleman Bonito',1,NULL,NULL,NULL,NULL),(2,'Milaneso',12,3,'H','Perro pastor aleman Bonito',1,NULL,NULL,NULL,NULL),(3,'Milaneso2',12,3,'M','Perro pastor Belga Bonito',2,NULL,NULL,NULL,NULL),(4,'Milaneso3',12,3,'H','Perro pastor Belga Bonito',2,NULL,NULL,NULL,NULL),(5,'Milaneso4',12,3,'M','Perro San Bernardo Bonito',3,NULL,NULL,NULL,NULL),(6,'Milaneso5',12,3,'H','Perro San Bernardo Bonito',3,NULL,NULL,NULL,NULL),(7,'Milaneso6',12,3,'M','Perro Pitbull Bonito',4,NULL,NULL,NULL,NULL),(8,'Milaneso7',12,3,'H','Perro Pitbull Bonito',4,NULL,NULL,NULL,NULL),(9,'Bicho1',12,3,'M','Gato Siames Bonito',5,NULL,NULL,NULL,NULL),(10,'Bicho2',12,3,'H','Gato Siames Bonito',5,NULL,NULL,NULL,NULL),(11,'Bicho3',12,3,'M','Gato Egipcio Bonito',6,NULL,NULL,NULL,NULL),(12,'Bicho4',12,3,'H','Gato Egipcio Bonito',6,NULL,NULL,NULL,NULL),(13,'Bicho5',12,3,'M','Gato Gris Bonito',7,NULL,NULL,NULL,NULL),(14,'Bicho6',12,3,'H','Gato Gris Bonito',7,NULL,NULL,NULL,NULL),(15,'Python',12,3,'M','Muy facil de aprender pero necesita que le des librerias constantemente',8,NULL,NULL,NULL,NULL),(16,'Python2',12,3,'H','Muy facil de aprender pero necesita que le des librerias constantemente',8,NULL,NULL,NULL,NULL),(17,'Piquin',12,3,'M','Se arrastra y es venenosa',9,NULL,NULL,NULL,NULL),(18,'picon',12,3,'H','Se arrastra y es venenosa',9,NULL,NULL,NULL,NULL),(19,'periquin',12,3,'M','De los que vuelan',10,NULL,NULL,NULL,NULL),(20,'periquin2',12,3,'H','De los que vuelan',10,NULL,NULL,NULL,NULL),(21,'periquin3',12,3,'M','De los que vuelan',11,NULL,NULL,NULL,NULL),(22,'periquin3',12,3,'H','De los que vuelan',11,NULL,NULL,NULL,NULL),(23,'Betito',12,3,'M','Aguas esos se mueren con agua fría',12,NULL,NULL,NULL,NULL),(24,'Betito2',12,3,'H','De los que vuelan',12,NULL,NULL,NULL,NULL),(25,'Mojarrin',12,3,'M','Solo pueden ser adoptadas por un veracruzano y puede que alguien de mazatlan',13,NULL,NULL,NULL,NULL),(26,'Mojarron',12,3,'H','Solo pueden ser adoptadas por un veracruzano',13,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mascota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfiles` (
  `id_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `perfil` varchar(30) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` VALUES (1,'Dependiente de refugio','Encargado de administrar las adopciones',1,NULL,NULL,NULL),(2,'Administrador Web','Admnistra el sitio web',1,NULL,NULL,NULL),(3,'Administrador de base de datos','Administra la base de datos de la apliacacion web',1,NULL,NULL,NULL),(4,'Cliente','Cliente interesado en adoptar',1,NULL,NULL,NULL),(6,'Lava Perros','Baña a los perros y gatos',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raza`
--

DROP TABLE IF EXISTS `raza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raza` (
  `id_raza` int(11) NOT NULL AUTO_INCREMENT,
  `especie` int(11) NOT NULL,
  `nombre_raza` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_raza`),
  KEY `especie` (`especie`),
  CONSTRAINT `raza_ibfk_1` FOREIGN KEY (`especie`) REFERENCES `especie` (`id_especie`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raza`
--

LOCK TABLES `raza` WRITE;
/*!40000 ALTER TABLE `raza` DISABLE KEYS */;
INSERT INTO `raza` VALUES (1,1,'Pastor Aleman',NULL,NULL,NULL),(2,1,'Pastor Belga',NULL,NULL,NULL),(3,1,'San Bernardo',NULL,NULL,NULL),(4,1,'Pitbull',NULL,NULL,NULL),(5,2,'Siames',NULL,NULL,NULL),(6,2,'Egipcio',NULL,NULL,NULL),(7,2,'Gris',NULL,NULL,NULL),(8,3,'Python',NULL,NULL,NULL),(9,3,'Coralillo',NULL,NULL,NULL),(10,4,'Cacatuha',NULL,NULL,NULL),(11,4,'Cotorro',NULL,NULL,NULL),(12,5,'Beta',NULL,NULL,NULL),(13,5,'Mojarra',NULL,NULL,NULL),(14,5,'pollito',NULL,NULL,NULL);
/*!40000 ALTER TABLE `raza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `real_name`
--

DROP TABLE IF EXISTS `real_name`;
/*!50001 DROP VIEW IF EXISTS `real_name`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `real_name` AS SELECT
 1 AS `id_adopcion`,
  1 AS `nombre_cliente`,
  1 AS `apellido_materno`,
  1 AS `apellido_paterno` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `access_credential`
--

/*!50001 DROP VIEW IF EXISTS `access_credential`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ElDonas`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `access_credential` AS select `e`.`nombre_usuario` AS `empleado_nombre_usuario`,`e`.`contrasena` AS `empleado_contrasena`,`e`.`correo_electronico` AS `empleado_correo`,`c`.`nombre_usuario` AS `cliente_nombre_usuario`,`c`.`contrasena` AS `cliente_contrasena`,`c`.`correo_electronico` AS `cliente_correo` from ((`empleado` `e` left join `perfiles` `p` on(`e`.`perfil` = `p`.`id_perfil`)) left join `cliente` `c` on(`p`.`id_perfil` = `c`.`perfil`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `adoption_acepted`
--

/*!50001 DROP VIEW IF EXISTS `adoption_acepted`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ElDonas`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `adoption_acepted` AS select `a`.`id_adopcion` AS `id_adopcion`,`e`.`nombre_empleado` AS `nombre_empleado`,`c`.`nombre_cliente` AS `nombre_cliente`,`m`.`nombre` AS `nombre` from (((`adopcion` `a` left join `empleado` `e` on(`a`.`empleado` = `e`.`id_empleado`)) left join `cliente` `c` on(`a`.`cliente` = `c`.`id_cliente`)) left join `mascota` `m` on(`a`.`mascota` = `m`.`id_mascota`)) where `a`.`status_adopcion` = 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `adoptions_in_process`
--

/*!50001 DROP VIEW IF EXISTS `adoptions_in_process`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ElDonas`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `adoptions_in_process` AS select `a`.`id_adopcion` AS `id_adopcion`,`e`.`nombre_empleado` AS `nombre_empleado` from (`adopcion` `a` left join `empleado` `e` on(`a`.`empleado` = `e`.`id_empleado`)) where `a`.`status_adopcion` = 0 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cliente_contact`
--

/*!50001 DROP VIEW IF EXISTS `cliente_contact`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ElDonas`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `cliente_contact` AS select `c`.`nombre_cliente` AS `nombre_cliente`,`c`.`telefono` AS `telefono`,`c`.`correo_electronico` AS `correo_electronico`,`a`.`status_adopcion` AS `status_adopcion` from (`adopcion` `a` left join `cliente` `c` on(`a`.`cliente` = `c`.`id_cliente`)) where `a`.`status_adopcion` = 0 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `real_name`
--

/*!50001 DROP VIEW IF EXISTS `real_name`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ElDonas`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `real_name` AS select `a`.`id_adopcion` AS `id_adopcion`,`c`.`nombre_cliente` AS `nombre_cliente`,`c`.`apellido_materno` AS `apellido_materno`,`c`.`apellido_paterno` AS `apellido_paterno` from (`adopcion` `a` left join `cliente` `c` on(`a`.`cliente` = `c`.`id_cliente`)) */;
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

-- Dump completed on 2023-12-07 21:27:02
