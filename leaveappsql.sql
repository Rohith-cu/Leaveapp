/*
SQLyog Community v12.4.0 (64 bit)
MySQL - 5.6.12-log : Database - leaveapp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`leaveapp` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `leaveapp`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can add permission',2,'add_permission'),
(5,'Can change permission',2,'change_permission'),
(6,'Can delete permission',2,'delete_permission'),
(7,'Can add group',3,'add_group'),
(8,'Can change group',3,'change_group'),
(9,'Can delete group',3,'delete_group'),
(10,'Can add user',4,'add_user'),
(11,'Can change user',4,'change_user'),
(12,'Can delete user',4,'delete_user'),
(13,'Can add content type',5,'add_contenttype'),
(14,'Can change content type',5,'change_contenttype'),
(15,'Can delete content type',5,'delete_contenttype'),
(16,'Can add session',6,'add_session'),
(17,'Can change session',6,'change_session'),
(18,'Can delete session',6,'delete_session'),
(19,'Can add student',7,'add_student'),
(20,'Can change student',7,'change_student'),
(21,'Can delete student',7,'delete_student'),
(22,'Can add todolist',8,'add_todolist'),
(23,'Can change todolist',8,'change_todolist'),
(24,'Can delete todolist',8,'delete_todolist'),
(25,'Can add leaveapp',9,'add_leaveapp'),
(26,'Can change leaveapp',9,'change_leaveapp'),
(27,'Can delete leaveapp',9,'delete_leaveapp'),
(28,'Can add staff',10,'add_staff'),
(29,'Can change staff',10,'change_staff'),
(30,'Can delete staff',10,'delete_staff');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$100000$Gc3C7sLzk8BW$SNqzA9ysTyJei+6qLv3oOHDlfLenpd8q2c10lO5E/nA=','2025-12-15 05:51:39.777448',0,'rohith@gmail.com','rohith','','',0,1,'2025-12-14 13:33:58.936164'),
(2,'pbkdf2_sha256$100000$zaxB5P8k7RE7$f/kDX0xIzrsF3aSNa7KK5DwVxCDmkvOj0juPcffx3w0=','2025-12-15 05:53:22.363748',0,'staff1@gmail.com','staff1','','',0,1,'2025-12-14 13:45:47.363499'),
(3,'pbkdf2_sha256$100000$UU3RilGOKd2s$5gBBHpt8Ey1NHUphQO9Gt8L2YQEaYjcKIqT3jzzLipE=','2025-12-14 13:46:55.227042',1,'admin','','','',1,1,'2025-12-14 13:46:25.338821');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values 
(1,'2025-12-14 13:47:42.991629','1','staff1',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',10,3);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(9,'myapp','leaveapp'),
(10,'myapp','staff'),
(7,'myapp','student'),
(8,'myapp','todolist'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2025-12-14 13:29:23.735875'),
(2,'auth','0001_initial','2025-12-14 13:29:24.108121'),
(3,'admin','0001_initial','2025-12-14 13:29:24.193241'),
(4,'admin','0002_logentry_remove_auto_add','2025-12-14 13:29:24.196059'),
(5,'contenttypes','0002_remove_content_type_name','2025-12-14 13:29:24.245860'),
(6,'auth','0002_alter_permission_name_max_length','2025-12-14 13:29:24.277323'),
(7,'auth','0003_alter_user_email_max_length','2025-12-14 13:29:24.304365'),
(8,'auth','0004_alter_user_username_opts','2025-12-14 13:29:24.310374'),
(9,'auth','0005_alter_user_last_login_null','2025-12-14 13:29:24.337633'),
(10,'auth','0006_require_contenttypes_0002','2025-12-14 13:29:24.340306'),
(11,'auth','0007_alter_validators_add_error_messages','2025-12-14 13:29:24.347836'),
(12,'auth','0008_alter_user_username_max_length','2025-12-14 13:29:24.374490'),
(13,'auth','0009_alter_user_last_name_max_length','2025-12-14 13:29:24.401048'),
(14,'myapp','0001_initial','2025-12-14 13:29:24.453821'),
(15,'myapp','0002_todolist','2025-12-14 13:29:24.509680'),
(16,'myapp','0003_leaveapp','2025-12-14 13:29:24.560354'),
(17,'myapp','0004_staff','2025-12-14 13:29:24.608703'),
(18,'sessions','0001_initial','2025-12-14 13:29:24.652147');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('eemaqaefk8w7lcmdqd1mt1c163zke7sv','MDVkODBmNDU2MDA0YWZiY2Q1YjUxZjkyZDA0MTU1NWFjYmNiY2QzNTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNDQ2ZGNiMTQ5YTdjMWU5ODdjYWU2MWNjODJlNmIxY2YxZjVlMzA2In0=','2025-12-29 05:53:22.363748'),
('g2w3ft6tqymr32ehkva944fpodlrjfy9','NTRmMjc4NWIyNjEwZTIwYzk3OWNkYjU2ZTg0ZjI5ZTg4NzgwY2ZiZTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNzI3NzFiMGY2ZjVhYmFiYjJlYTAxN2NlZjRkYzRlYzUxZDQ0ZWE1In0=','2025-12-28 13:46:55.229997');

/*Table structure for table `myapp_leaveapp` */

DROP TABLE IF EXISTS `myapp_leaveapp`;

CREATE TABLE `myapp_leaveapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `approved` varchar(100) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_leaveapp_student_id_45a5ba0d_fk_myapp_student_id` (`student_id`),
  CONSTRAINT `myapp_leaveapp_student_id_45a5ba0d_fk_myapp_student_id` FOREIGN KEY (`student_id`) REFERENCES `myapp_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_leaveapp` */

insert  into `myapp_leaveapp`(`id`,`date`,`reason`,`approved`,`student_id`) values 
(1,'2025-12-24','fever','approved',1),
(2,'2025-12-16','cold','pending',1),
(3,'2025-12-19','cold','pending',1);

/*Table structure for table `myapp_staff` */

DROP TABLE IF EXISTS `myapp_staff`;

CREATE TABLE `myapp_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(254) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_staff_user_id_2445b28c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `myapp_staff_user_id_2445b28c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_staff` */

insert  into `myapp_staff`(`id`,`name`,`username`,`password`,`status`,`user_id`) values 
(1,'staff1','staff1@gmail.com','1234','approved',2);

/*Table structure for table `myapp_student` */

DROP TABLE IF EXISTS `myapp_student`;

CREATE TABLE `myapp_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `class_name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `username` varchar(254) DEFAULT NULL,
  `profile` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_student_user_id_7e5977a5_fk_auth_user_id` (`user_id`),
  CONSTRAINT `myapp_student_user_id_7e5977a5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_student` */

insert  into `myapp_student`(`id`,`name`,`class_name`,`password`,`username`,`profile`,`user_id`) values 
(1,'rohith','5','1234','rohith@gmail.com','media/user.jpg',1);

/*Table structure for table `myapp_todolist` */

DROP TABLE IF EXISTS `myapp_todolist`;

CREATE TABLE `myapp_todolist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task` varchar(100) DEFAULT NULL,
  `due` date DEFAULT NULL,
  `completed` varchar(100) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_todolist_student_id_fc83da49_fk_myapp_student_id` (`student_id`),
  CONSTRAINT `myapp_todolist_student_id_fc83da49_fk_myapp_student_id` FOREIGN KEY (`student_id`) REFERENCES `myapp_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_todolist` */

insert  into `myapp_todolist`(`id`,`task`,`due`,`completed`,`student_id`) values 
(2,'task1','2025-12-30','completed',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
