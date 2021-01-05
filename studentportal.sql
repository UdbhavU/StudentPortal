-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: StudentPortal
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB

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
-- Table structure for table `Announcement`
--

DROP TABLE IF EXISTS `Announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `tag` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Announcement_author_id_6cbc3e14_fk_auth_user_id` (`author_id`),
  CONSTRAINT `Announcement_author_id_6cbc3e14_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Announcement`
--

LOCK TABLES `Announcement` WRITE;
/*!40000 ALTER TABLE `Announcement` DISABLE KEYS */;
INSERT INTO `Announcement` VALUES (1,'world','2020-11-26 12:29:16.896383','2020-11-26 12:29:16.896808','2020-11-26 12:35:03.363065',3,'welcomw','hello'),(2,'deugery efv y vevcyudvc cf gewf wg ','2020-11-26 12:38:25.953373','2020-11-26 12:38:25.953625','2020-11-26 12:39:22.087371',3,'event,calamity,dev','hello'),(3,'deugery efv y vevcyudvc cf gewf wg ','2020-11-26 12:39:04.125454','2020-11-26 12:39:04.125711','2020-12-24 09:53:45.414902',3,'event,calamity,dev','Thkis is an annoncement'),(4,'Your exam timetable can be accessed through vtu portal','2021-01-04 14:49:31.180243','2021-01-04 14:49:31.180498','2021-01-04 14:49:31.182096',3,'Exam,Academics','Exam date finalized');
/*!40000 ALTER TABLE `Announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cls`
--

DROP TABLE IF EXISTS `Cls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cls` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cls`
--

LOCK TABLES `Cls` WRITE;
/*!40000 ALTER TABLE `Cls` DISABLE KEYS */;
INSERT INTO `Cls` VALUES (1,'Freshman');
/*!40000 ALTER TABLE `Cls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profiles`
--

DROP TABLE IF EXISTS `Profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profilePicture` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `course` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Profiles_user_id_691e4eb9_fk_auth_user_id` (`user_id`),
  CONSTRAINT `Profiles_user_id_691e4eb9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profiles`
--

LOCK TABLES `Profiles` WRITE;
/*!40000 ALTER TABLE `Profiles` DISABLE KEYS */;
INSERT INTO `Profiles` VALUES (7,'images/generic-profile-pic_NGZn1va.jpg','HybridKoll a hybrid koll','Information and science',1),(8,'images/generic-profile-pic_M7DOjMr.jpg','The creator of this portal','Information and science',3);
/*!40000 ALTER TABLE `Profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add profiles',1,'add_profiles'),(2,'Can change profiles',1,'change_profiles'),(3,'Can delete profiles',1,'delete_profiles'),(4,'Can view profiles',1,'view_profiles'),(5,'Can add posts',2,'add_posts'),(6,'Can change posts',2,'change_posts'),(7,'Can delete posts',2,'delete_posts'),(8,'Can view posts',2,'view_posts'),(9,'Can add comment',3,'add_comment'),(10,'Can change comment',3,'change_comment'),(11,'Can delete comment',3,'delete_comment'),(12,'Can view comment',3,'view_comment'),(13,'Can add log entry',4,'add_logentry'),(14,'Can change log entry',4,'change_logentry'),(15,'Can delete log entry',4,'delete_logentry'),(16,'Can view log entry',4,'view_logentry'),(17,'Can add permission',5,'add_permission'),(18,'Can change permission',5,'change_permission'),(19,'Can delete permission',5,'delete_permission'),(20,'Can view permission',5,'view_permission'),(21,'Can add group',6,'add_group'),(22,'Can change group',6,'change_group'),(23,'Can delete group',6,'delete_group'),(24,'Can view group',6,'view_group'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add content type',8,'add_contenttype'),(30,'Can change content type',8,'change_contenttype'),(31,'Can delete content type',8,'delete_contenttype'),(32,'Can view content type',8,'view_contenttype'),(33,'Can add session',9,'add_session'),(34,'Can change session',9,'change_session'),(35,'Can delete session',9,'delete_session'),(36,'Can view session',9,'view_session'),(37,'Can add announcement',10,'add_announcement'),(38,'Can change announcement',10,'change_announcement'),(39,'Can delete announcement',10,'delete_announcement'),(40,'Can view announcement',10,'view_announcement'),(41,'Can add resource',11,'add_resource'),(42,'Can change resource',11,'change_resource'),(43,'Can delete resource',11,'delete_resource'),(44,'Can view resource',11,'view_resource'),(45,'Can add subject',12,'add_subject'),(46,'Can change subject',12,'change_subject'),(47,'Can delete subject',12,'delete_subject'),(48,'Can view subject',12,'view_subject'),(49,'Can add announcement',13,'add_announcement'),(50,'Can change announcement',13,'change_announcement'),(51,'Can delete announcement',13,'delete_announcement'),(52,'Can view announcement',13,'view_announcement'),(53,'Can add time slot',14,'add_timeslot'),(54,'Can change time slot',14,'change_timeslot'),(55,'Can delete time slot',14,'delete_timeslot'),(56,'Can view time slot',14,'view_timeslot'),(57,'Can add day',15,'add_day'),(58,'Can change day',15,'change_day'),(59,'Can delete day',15,'delete_day'),(60,'Can view day',15,'view_day'),(61,'Can add cls',16,'add_cls'),(62,'Can change cls',16,'change_cls'),(63,'Can delete cls',16,'delete_cls'),(64,'Can view cls',16,'view_cls');
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
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$UNRUBAsY31yj$YnFXdF+jUl3P9Hq6vpAc9c0p/krEYQSC1IUXV0dINbk=','2021-01-04 15:31:15.514201',0,'hybridKoll','hybrid','Koll','hk@dev.com',0,1,'2020-11-22 05:40:33.635527'),(2,'pbkdf2_sha256$216000$ZQy5hbhdMgra$RyeEewE4amNiKUmzC79301ceaTS9yFlODKMB7EtcGQA=','2020-11-23 09:28:40.296048',0,'johndoe','John','Doe','dev@doe.com',0,1,'2020-11-23 09:28:22.016799'),(3,'pbkdf2_sha256$216000$RfNOgiblxuMU$6p2LKJj8Gr7N/BQe4aSUfEq9d1L7Lhq43HP+Ci7aM0A=','2021-01-05 06:09:35.734044',1,'udbhav','','','udbhav@admin.com',1,1,'2020-11-23 16:21:14.792527');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `object_id` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (4,'admin','logentry'),(13,'adminControl','announcement'),(10,'announcements','announcement'),(6,'auth','group'),(5,'auth','permission'),(7,'auth','user'),(8,'contenttypes','contenttype'),(3,'forum','comment'),(2,'forum','posts'),(1,'profiles','profiles'),(11,'resources','resource'),(12,'resources','subject'),(9,'sessions','session'),(16,'timetable','cls'),(15,'timetable','day'),(14,'timetable','timeslot');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-11-22 05:38:38.045175'),(2,'auth','0001_initial','2020-11-22 05:38:38.165546'),(3,'admin','0001_initial','2020-11-22 05:38:38.449104'),(4,'admin','0002_logentry_remove_auto_add','2020-11-22 05:38:38.546428'),(5,'admin','0003_logentry_add_action_flag_choices','2020-11-22 05:38:38.554486'),(6,'contenttypes','0002_remove_content_type_name','2020-11-22 05:38:38.581100'),(7,'auth','0002_alter_permission_name_max_length','2020-11-22 05:38:38.602545'),(8,'auth','0003_alter_user_email_max_length','2020-11-22 05:38:38.610707'),(9,'auth','0004_alter_user_username_opts','2020-11-22 05:38:38.617055'),(10,'auth','0005_alter_user_last_login_null','2020-11-22 05:38:38.635626'),(11,'auth','0006_require_contenttypes_0002','2020-11-22 05:38:38.637098'),(12,'auth','0007_alter_validators_add_error_messages','2020-11-22 05:38:38.643914'),(13,'auth','0008_alter_user_username_max_length','2020-11-22 05:38:38.652111'),(14,'auth','0009_alter_user_last_name_max_length','2020-11-22 05:38:38.661086'),(15,'auth','0010_alter_group_name_max_length','2020-11-22 05:38:38.669976'),(16,'auth','0011_update_proxy_permissions','2020-11-22 05:38:38.677036'),(17,'auth','0012_alter_user_first_name_max_length','2020-11-22 05:38:38.686420'),(18,'forum','0001_initial','2020-11-22 05:38:38.703430'),(19,'forum','0002_comment','2020-11-22 05:38:38.744961'),(20,'forum','0003_delete_comment','2020-11-22 05:38:38.767640'),(21,'forum','0004_comment','2020-11-22 05:38:38.785091'),(22,'profiles','0001_initial','2020-11-22 05:38:38.863991'),(23,'sessions','0001_initial','2020-11-22 05:38:38.894854'),(24,'announcements','0001_initial','2020-11-23 17:50:58.150763'),(25,'announcements','0002_auto_20201124_1241','2020-11-24 12:41:41.655397'),(26,'resources','0001_initial','2020-11-25 18:30:41.072528'),(27,'adminControl','0001_initial','2020-11-26 11:23:29.846058'),(28,'adminControl','0002_auto_20201124_1241','2020-11-26 11:23:29.904400'),(29,'profiles','0002_auto_20201127_1431','2020-11-27 14:32:03.350213'),(30,'resources','0002_auto_20201127_1431','2020-11-27 14:32:03.354071'),(31,'profiles','0003_auto_20201201_1625','2020-12-01 16:27:50.160069'),(36,'timetable','0001_initial','2020-12-02 18:14:03.738954'),(37,'timetable','0002_auto_20201201_1656','2020-12-02 18:14:03.809762'),(38,'timetable','0003_auto_20201202_1611','2020-12-02 18:14:03.875646'),(39,'timetable','0004_auto_20201202_1636','2020-12-02 18:14:03.880706'),(40,'forum','0005_posts_no_of_comments','2021-01-05 10:02:17.141336');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6c8k581l3zmeuapjgx9tj8euo81pimvf','.eJxVjE0OwiAYRO_C2pACBcGle89A5uNHqoYmpV0Z7y5NutBkVvPezJt5bGvxW0uLnyK7MMVOvx0hPFPdQXyg3mce5rouE_Fd4Qdt_DbH9Loe7t9BQSt9Da0tFJJVRpqgjIBM2uVRxkw59oCytlIQhk6CGyGBPKhIZwhnBPt8AQc9OQc:1kl9FJ:VGr3naL65yBIBhgcLxjT2xrM9dzdyRLRyMAhiQPKKT4','2020-12-18 11:27:29.158301'),('cab98uah7d3jhgt7o1xs8w9l3iwy5mug','.eJxVjDsOwjAQRO_iGlnJ7rKOKek5g7X-4QBypDipEHcnkVJAMc28N_NWTtaluLWl2Y1RXVSvTr-dl_BMdQfxIfU-6TDVZR693hV90KZvU0yv6-H-HRRpZVv7oSOks0Cg4NkQA9tM0EVCEEw2W2TwKJwlBzK8BZLJOHDPnpOozxfHqzd4:1kiGDR:kuOQgcV6zVS5Yuu7UJ8fjrkWInMCO6hzjPLymJuBF9o','2020-12-10 12:17:37.367167'),('cu5i1dwo22b1wxnt6ijohi852rcsiclt','.eJxVjE0OwiAYRO_C2pACBcGle89A5uNHqoYmpV0Z7y5NutBkVvPezJt5bGvxW0uLnyK7MMVOvx0hPFPdQXyg3mce5rouE_Fd4Qdt_DbH9Loe7t9BQSt9Da0tFJJVRpqgjIBM2uVRxkw59oCytlIQhk6CGyGBPKhIZwhnBPt8AQc9OQc:1khmdj:bwTHktgvBLA-pPKoS3po45Ka-0NnecQ0AZfk5nuEoGg','2020-12-09 04:42:47.472184'),('dt8ssa0r6t3ri5tr9qqqka4ktdls0dku','.eJxVjE0OwiAYRO_C2pACBcGle89A5uNHqoYmpV0Z7y5NutBkVvPezJt5bGvxW0uLnyK7MMVOvx0hPFPdQXyg3mce5rouE_Fd4Qdt_DbH9Loe7t9BQSt9Da0tFJJVRpqgjIBM2uVRxkw59oCytlIQhk6CGyGBPKhIZwhnBPt8AQc9OQc:1khsPj:z4Kxxev5ZEt6CmMPO6iWliuxAs1F09f2YwPpzKHJ2x0','2020-12-09 10:52:43.408275'),('gg5a4yeo27z6wu73qhsv1ps4h43xu3rz','.eJxVjE0OwiAYRO_C2pACBcGle89A5uNHqoYmpV0Z7y5NutBkVvPezJt5bGvxW0uLnyK7MMVOvx0hPFPdQXyg3mce5rouE_Fd4Qdt_DbH9Loe7t9BQSt9Da0tFJJVRpqgjIBM2uVRxkw59oCytlIQhk6CGyGBPKhIZwhnBPt8AQc9OQc:1kiiSh:oIlqppPuWB4HYDf5a55mVbJLGxR2hMuwF2d-RlUs9DU','2020-12-11 18:27:15.212676'),('iyv1cijuwwz2b37e22m4p7eo3fnk4ln7','.eJxVjE0OwiAYRO_C2pACBcGle89A5uNHqoYmpV0Z7y5NutBkVvPezJt5bGvxW0uLnyK7MMVOvx0hPFPdQXyg3mce5rouE_Fd4Qdt_DbH9Loe7t9BQSt9Da0tFJJVRpqgjIBM2uVRxkw59oCytlIQhk6CGyGBPKhIZwhnBPt8AQc9OQc:1khsU7:oXyYv4qOnm_s7Qwka42uRoxbjJUf3qjVqWrYyOMuAaI','2020-12-09 10:57:15.477479'),('qx3loagqccnpsnjk062bhnjnt1fqf709','.eJxVjDsOwjAQRO_iGlnJ7rKOKek5g7X-4QBypDipEHcnkVJAMc28N_NWTtaluLWl2Y1RXVSvTr-dl_BMdQfxIfU-6TDVZR693hV90KZvU0yv6-H-HRRpZVv7oSOks0Cg4NkQA9tM0EVCEEw2W2TwKJwlBzK8BZLJOHDPnpOozxfHqzd4:1klYgb:NPjqWtYcZpSMXhKGCUceYk6jIMc9wYkTA628paC1WsI','2020-12-19 14:37:21.695088'),('uqptahajjr4lwnuj2xm7cuwwz12otg1q','.eJxVjE0OwiAYRO_C2pACBcGle89A5uNHqoYmpV0Z7y5NutBkVvPezJt5bGvxW0uLnyK7MMVOvx0hPFPdQXyg3mce5rouE_Fd4Qdt_DbH9Loe7t9BQSt9Da0tFJJVRpqgjIBM2uVRxkw59oCytlIQhk6CGyGBPKhIZwhnBPt8AQc9OQc:1klEsM:jh2e_ItxERUkZAoo7y8J64DFkP9QHh3PCZfJxtL8OfE','2020-12-18 17:28:10.671476'),('vxs5e3ucmq2dxut176d8tppqt1redl2d','.eJxVjE0OwiAYRO_C2pACBcGle89A5uNHqoYmpV0Z7y5NutBkVvPezJt5bGvxW0uLnyK7MMVOvx0hPFPdQXyg3mce5rouE_Fd4Qdt_DbH9Loe7t9BQSt9Da0tFJJVRpqgjIBM2uVRxkw59oCytlIQhk6CGyGBPKhIZwhnBPt8AQc9OQc:1kwfXD:rshin-BtcvIbquJWI_UaKPGaQDHEqT-XXhiGeO18ERg','2021-01-19 06:09:35.736559');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_comment`
--

DROP TABLE IF EXISTS `forum_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `comment_author_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_comment_comment_author_id_a53c2f20_fk_auth_user_id` (`comment_author_id`),
  KEY `forum_comment_post_id_eb329692_fk_forum_posts_id` (`post_id`),
  CONSTRAINT `forum_comment_comment_author_id_a53c2f20_fk_auth_user_id` FOREIGN KEY (`comment_author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `forum_comment_post_id_eb329692_fk_forum_posts_id` FOREIGN KEY (`post_id`) REFERENCES `forum_posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_comment`
--

LOCK TABLES `forum_comment` WRITE;
/*!40000 ALTER TABLE `forum_comment` DISABLE KEYS */;
INSERT INTO `forum_comment` VALUES (1,'This is a comment\r\n','2020-11-23 09:27:42.490148','2020-11-23 09:27:42.490454','2020-11-23 09:27:42.490467',1,2),(2,'This is john doe\r\n','2020-11-23 09:29:11.725768','2020-11-23 09:29:11.726048','2020-11-23 09:29:11.726068',2,3),(3,'this is hybrid koll\r\n','2020-11-23 15:15:04.575836','2020-11-23 15:15:04.576079','2020-11-23 15:15:04.576091',1,4),(5,'hvkhhdbvsdb\r\n','2020-11-26 12:55:44.467594','2020-11-26 12:55:44.467854','2020-11-26 12:55:44.467866',3,6),(6,'sdihegcuireb\r\n','2020-11-30 17:04:23.133358','2020-11-30 17:04:23.133596','2020-11-30 17:04:23.133609',1,2),(7,'This is a comment\r\n','2021-01-05 13:42:30.257483','2021-01-05 13:42:30.257985','2021-01-05 13:42:30.257999',3,9),(9,'this is a comment\r\n','2021-01-05 14:01:36.824097','2021-01-05 14:01:36.825287','2021-01-05 14:01:36.825495',3,8),(10,'This is the 2nd comment','2021-01-05 14:02:21.406431','2021-01-05 14:02:21.406680','2021-01-05 14:02:21.406694',3,8),(11,'This is the 2nd comment','2021-01-05 14:05:40.422368','2021-01-05 14:05:40.422567','2021-01-05 14:05:40.422580',3,8);
/*!40000 ALTER TABLE `forum_comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_Comment_No` AFTER INSERT ON `forum_comment` FOR EACH ROW UPDATE forum_posts as f set f.no_of_comments = f.no_of_comments+1 WHERE f.id = NEW.post_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `forum_posts`
--

DROP TABLE IF EXISTS `forum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `no_of_comments` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_posts_author_id_8e86e0c3_fk_auth_user_id` (`author_id`),
  KEY `forum_posts_slug_ec3d1cbf` (`slug`),
  CONSTRAINT `forum_posts_author_id_8e86e0c3_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_posts`
--

LOCK TABLES `forum_posts` WRITE;
/*!40000 ALTER TABLE `forum_posts` DISABLE KEYS */;
INSERT INTO `forum_posts` VALUES (1,'This is 1st post','','\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae <em>dicta</em> sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"','2020-11-22 10:04:42.258314','2020-11-22 10:04:42.258689','2020-11-22 10:05:05.169117',1,1),(2,'This is the 2nd post','','architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur','2020-11-23 09:27:01.938177','2020-11-23 09:27:01.938685','2020-11-23 09:27:01.940742',1,1),(3,'this is 3rd post {edited}','','i nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptate','2020-11-23 09:27:26.067362','2020-11-23 09:27:26.067635','2020-11-23 15:15:36.778503',1,1),(4,'This is the 4th post','','ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?','2020-11-23 15:14:23.545133','2020-11-23 15:14:23.545694','2020-11-23 15:14:23.547013',2,1),(6,'tgrhfbv','','vdfgrfhgjr','2020-11-24 15:54:58.709215','2020-11-24 15:54:58.709562','2020-11-24 15:54:58.734088',3,1),(8,'This is a post created at 8','','Just another post\r\n','2021-01-04 15:30:06.474124','2021-01-04 15:30:06.474751','2021-01-04 15:30:06.478693',3,3),(9,'This is a post created at 8.30','','just another post\r\n','2021-01-04 16:13:43.499941','2021-01-04 16:13:43.500391','2021-01-04 16:13:43.502228',1,1);
/*!40000 ALTER TABLE `forum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources_resource`
--

DROP TABLE IF EXISTS `resources_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resourceTitle` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resources_resource_subject_id_b2cf8540_fk_resources_subject_id` (`subject_id`),
  CONSTRAINT `resources_resource_subject_id_b2cf8540_fk_resources_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `resources_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources_resource`
--

LOCK TABLES `resources_resource` WRITE;
/*!40000 ALTER TABLE `resources_resource` DISABLE KEYS */;
INSERT INTO `resources_resource` VALUES (1,'test','http://test.org','test test abc xyz',1),(2,'test 2','http://erer.com','fchcbfechdcff fcjbfchf cfhcjhcd',1),(3,'Django','https://codeloop.org/django-pagination-complete-example/','In this Django Pagination article i want to show you Pagination Complete Example, so when you are going to develop a blog in Django you will realize to separate the list of posts across several pages. Django has a built in pagination class to allows you to manage paginated data. Under the hood, all methods of pagination use the Paginator class. It does all the heavy lifting of actually splitting a QuerySet into Page objects.\r\n\r\n ',1),(4,'Management','xyz.com','gusy fygf  ydg ydf dyg bjyvb uyfvb',2);
/*!40000 ALTER TABLE `resources_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources_subject`
--

DROP TABLE IF EXISTS `resources_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subjectCode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources_subject`
--

LOCK TABLES `resources_subject` WRITE;
/*!40000 ALTER TABLE `resources_subject` DISABLE KEYS */;
INSERT INTO `resources_subject` VALUES (1,'DBMS','18CS53'),(2,'ME','18CS51'),(3,'CNS','18CS52'),(4,'ATC','18CS54'),(5,'PYTHON','18CS55'),(6,'UNIX','18CS56'),(7,'None','None');
/*!40000 ALTER TABLE `resources_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_cls`
--

DROP TABLE IF EXISTS `timetable_cls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_cls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cls` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_cls`
--

LOCK TABLES `timetable_cls` WRITE;
/*!40000 ALTER TABLE `timetable_cls` DISABLE KEYS */;
INSERT INTO `timetable_cls` VALUES (3,'Freshman'),(4,'Sophmore'),(5,'Senior');
/*!40000 ALTER TABLE `timetable_cls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_day`
--

DROP TABLE IF EXISTS `timetable_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cls_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timetable_day_cls_id_84566c8c` (`cls_id`),
  CONSTRAINT `timetable_day_cls_id_84566c8c_fk_timetable_cls_id` FOREIGN KEY (`cls_id`) REFERENCES `timetable_cls` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_day`
--

LOCK TABLES `timetable_day` WRITE;
/*!40000 ALTER TABLE `timetable_day` DISABLE KEYS */;
INSERT INTO `timetable_day` VALUES (1,'Monday',3),(2,'Tuesday',3),(3,'Wednesday',3),(4,'Thursday',3),(5,'Friday',3),(6,'Saturday',3),(7,'Sunday',3),(8,'Monday',4),(9,'Tuesday',4),(10,'Wednesday',4),(11,'Thursday',4),(12,'Friday',4),(13,'Saturday',4),(14,'Sunday',4),(15,'Monday',5),(16,'Tuesday',5),(17,'Wednesday',5),(18,'Thursday',5),(19,'Friday',5),(20,'Saturday',5),(21,'Sunday',5);
/*!40000 ALTER TABLE `timetable_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_timeslot`
--

DROP TABLE IF EXISTS `timetable_timeslot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_timeslot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `day_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timetable_timeslot_subject_id_efd18504_fk_resources_subject_id` (`subject_id`),
  KEY `timetable_timeslot_day_id_772747f3_fk_timetable_day_id` (`day_id`),
  CONSTRAINT `timetable_timeslot_day_id_772747f3_fk_timetable_day_id` FOREIGN KEY (`day_id`) REFERENCES `timetable_day` (`id`),
  CONSTRAINT `timetable_timeslot_subject_id_efd18504_fk_resources_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `resources_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_timeslot`
--

LOCK TABLES `timetable_timeslot` WRITE;
/*!40000 ALTER TABLE `timetable_timeslot` DISABLE KEYS */;
INSERT INTO `timetable_timeslot` VALUES (1,1,3,1),(2,2,2,1),(3,3,1,1),(4,4,1,1),(5,5,4,1),(6,6,5,1),(7,7,2,1),(8,8,3,1),(9,1,3,2),(10,2,2,2),(11,3,4,2),(12,4,5,2),(13,5,4,2),(14,6,3,2),(15,7,2,2),(16,8,3,2),(17,1,2,3),(18,2,3,3),(19,3,3,3),(20,4,2,3),(21,5,3,3),(22,6,2,3),(23,7,3,3),(24,8,2,3),(25,1,3,4),(26,2,3,4),(27,3,2,4),(28,4,5,4),(29,5,2,4),(30,6,4,4),(31,7,4,4),(32,8,4,4),(33,1,1,5),(34,2,2,5),(35,3,2,5),(36,4,1,5),(37,5,1,5),(38,6,4,5),(39,7,4,5),(40,8,2,5),(41,1,3,6),(42,2,4,6),(43,3,4,6),(44,4,5,6),(45,5,5,6),(46,6,5,6),(47,7,5,6),(48,8,3,6),(49,1,5,7),(50,2,5,7),(51,3,5,7),(52,4,3,7),(53,5,4,7),(54,6,3,7),(55,7,4,7),(56,8,5,7),(57,1,1,8),(58,2,3,8),(59,3,5,8),(60,4,6,8),(61,5,3,8),(62,6,7,8),(63,7,4,8),(64,8,7,8),(65,1,5,9),(66,2,3,9),(67,3,2,9),(68,4,4,9),(69,5,7,9),(70,6,7,9),(71,7,7,9),(72,8,7,9),(73,1,2,10),(74,2,3,10),(75,3,1,10),(76,4,1,10),(77,5,2,10),(78,6,7,10),(79,7,7,10),(80,8,7,10),(81,1,2,11),(82,2,1,11),(83,3,2,11),(84,4,5,11),(85,5,1,11),(86,6,2,11),(87,7,3,11),(88,8,2,11),(89,1,3,12),(90,2,4,12),(91,3,5,12),(92,4,5,12),(93,5,3,12),(94,6,6,12),(95,7,7,12),(96,8,7,12),(97,1,6,13),(98,2,1,13),(99,3,7,13),(100,4,4,13),(101,5,3,13),(102,6,7,13),(103,7,6,13),(104,8,6,13),(105,1,7,14),(106,2,6,14),(107,3,5,14),(108,4,3,14),(109,5,3,14),(110,6,2,14),(111,7,1,14),(112,8,6,14),(113,1,1,15),(114,2,4,15),(115,3,6,15),(116,4,6,15),(117,5,4,15),(118,6,4,15),(119,7,5,15),(120,8,3,15),(121,1,3,16),(122,2,6,16),(123,3,6,16),(124,4,3,16),(125,5,2,16),(126,6,4,16),(127,7,6,16),(128,8,4,16),(129,1,4,17),(130,2,4,17),(131,3,4,17),(132,4,3,17),(133,5,2,17),(134,6,2,17),(135,7,7,17),(136,8,7,17),(137,1,3,18),(138,2,4,18),(139,3,3,18),(140,4,4,18),(141,5,6,18),(142,6,6,18),(143,7,4,18),(144,8,4,18),(145,1,4,19),(146,2,4,19),(147,3,4,19),(148,4,4,19),(149,5,4,19),(150,6,4,19),(151,7,2,19),(152,8,2,19),(153,1,7,20),(154,2,6,20),(155,3,4,20),(156,4,5,20),(157,5,4,20),(158,6,4,20),(159,7,5,20),(160,8,6,20),(161,1,5,21),(162,2,6,21),(163,3,6,21),(164,4,6,21),(165,5,4,21),(166,6,4,21),(167,7,4,21),(168,8,6,21);
/*!40000 ALTER TABLE `timetable_timeslot` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-05 21:10:10
