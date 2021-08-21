/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.7.26 : Database - student_system
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`student_system` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `student_system`;

/*Table structure for table `tb-gonggao` */

DROP TABLE IF EXISTS `tb-gonggao`;

CREATE TABLE `tb-gonggao` (
  `id` int(20) DEFAULT NULL,
  `nr` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb-gonggao` */

/*Table structure for table `tb_clazz` */

DROP TABLE IF EXISTS `tb_clazz`;

CREATE TABLE `tb_clazz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clazz_name` varchar(100) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_Reference_1` (`subject_id`) USING BTREE,
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`subject_id`) REFERENCES `tb_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_clazz` */

insert  into `tb_clazz`(`id`,`clazz_name`,`subject_id`,`remark`) values 
(15,'编程2020101',20,''),
(16,'软件工程2020102',17,''),
(17,'网络通信2020103',17,''),
(18,'英语2020201',18,''),
(19,'日语2020202',18,''),
(20,'电子商务2020301',19,''),
(21,'物流2020302',19,''),
(22,'测试班级',20,'测试用的');

/*Table structure for table `tb_course` */

DROP TABLE IF EXISTS `tb_course`;

CREATE TABLE `tb_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_course` */

insert  into `tb_course`(`id`,`course_name`,`remark`) values 
(4,'HTML',''),
(5,'Java',''),
(6,'网络基础',''),
(7,'Javascript',''),
(8,'333','ddd');

/*Table structure for table `tb_job` */

DROP TABLE IF EXISTS `tb_job`;

CREATE TABLE `tb_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comp_name` varchar(100) DEFAULT NULL,
  `job_date` varchar(200) DEFAULT NULL,
  `salay` int(11) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `stu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_Reference_7` (`stu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_job` */

insert  into `tb_job`(`id`,`comp_name`,`job_date`,`salay`,`remark`,`stu_id`) values 
(11,'1111','2111',3111,'444111',9),
(12,'112','333',44,'555',10),
(13,'莫某企业科技公司','2020-07-01',15000,'薪水',11);

/*Table structure for table `tb_notice` */

DROP TABLE IF EXISTS `tb_notice`;

CREATE TABLE `tb_notice` (
  `id` int(10) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `author` varchar(25) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  `auth` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_notice` */

/*Table structure for table `tb_request` */

DROP TABLE IF EXISTS `tb_request`;

CREATE TABLE `tb_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `reason` text,
  `type` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `attach` varchar(100) DEFAULT NULL,
  `result1` varchar(255) DEFAULT NULL,
  `result2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_request` */

insert  into `tb_request`(`id`,`title`,`reason`,`type`,`create_date`,`stu_id`,`status`,`attach`,`result1`,`result2`) values 
(9,'12312','3123','休学','2020-06-28 22:36:12',9,3,'','休息休息','xxxxxxxx'),
(11,'某某要休学了。。。','想出去走走','辍学','2020-07-01 21:30:26',9,3,'c6dd7d9f-2b1f-4f46-89ee-5a5744270007.jpg','老师通过了，。，。。','管理员修审批了'),
(12,'申请休学1个月','个人私事儿','休学','2020-07-05 23:11:15',16,1,'7cdedcc1-9920-47a2-8b02-1a177d1bb8fc.jpg',NULL,NULL);

/*Table structure for table `tb_score` */

DROP TABLE IF EXISTS `tb_score`;

CREATE TABLE `tb_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `score` decimal(10,1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_Reference_10` (`stu_id`) USING BTREE,
  KEY `FK_Reference_8` (`section_id`) USING BTREE,
  KEY `FK_Reference_9` (`course_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_score` */

insert  into `tb_score`(`id`,`section_id`,`course_id`,`stu_id`,`score`) values 
(52,11,4,17,88.0),
(56,11,4,16,50.0),
(57,12,5,16,NULL),
(61,15,7,20,410.0);

/*Table structure for table `tb_section` */

DROP TABLE IF EXISTS `tb_section`;

CREATE TABLE `tb_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `clazz_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_Reference_2` (`clazz_id`) USING BTREE,
  KEY `FK_Reference_3` (`teacher_id`) USING BTREE,
  KEY `FK_Reference_4` (`course_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_section` */

insert  into `tb_section`(`id`,`year`,`type`,`clazz_id`,`teacher_id`,`course_id`,`remark`) values 
(11,2020,'春季',15,4,4,''),
(12,2020,'春季',15,5,5,''),
(13,2021,'春季',22,6,6,'测试用的'),
(14,2021,'春季',17,6,6,'测试用的'),
(15,2021,'秋季',17,6,7,'');

/*Table structure for table `tb_student` */

DROP TABLE IF EXISTS `tb_student`;

CREATE TABLE `tb_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_no` varchar(50) DEFAULT NULL,
  `stu_name` varchar(50) DEFAULT NULL,
  `stu_pwd` varchar(50) DEFAULT NULL,
  `card_no` char(18) DEFAULT NULL,
  `gender` char(10) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `pname` varchar(100) DEFAULT NULL,
  `telephone` varchar(100) DEFAULT NULL,
  `addr` varchar(200) DEFAULT NULL,
  `join_date` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `clazz_id` int(11) DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_Reference_5` (`clazz_id`) USING BTREE,
  KEY `FK_Reference_6` (`subject_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_student` */

insert  into `tb_student`(`id`,`stu_no`,`stu_name`,`stu_pwd`,`card_no`,`gender`,`birthday`,`phone`,`pname`,`telephone`,`addr`,`join_date`,`status`,`clazz_id`,`subject_id`) values 
(16,'0001','李思','93a9ded8a9ab7cb69dba0c0575665204','123123123123123123','男',NULL,'18533333333','','','','2020-07-02 00:00:00',NULL,15,17),
(17,'0002','张三','93a9ded8a9ab7cb69dba0c0575665204','123123123123123123','男',NULL,'18533333333','','','','2020-07-02 00:00:00',NULL,15,17),
(19,'0003','吴涵','93a9ded8a9ab7cb69dba0c0575665204','123123123123123123','男',NULL,'18533333333','','','','2020-07-02 00:00:00',NULL,16,17),
(20,'0004','邵帅','93a9ded8a9ab7cb69dba0c0575665204','123123123123123123','男',NULL,'18533333333','','','','2020-07-03 00:00:00',NULL,17,17),
(21,'0005','张翰','93a9ded8a9ab7cb69dba0c0575665204','123123123123123123','男',NULL,'18533333333','','','','2020-07-02 00:00:00',NULL,15,17),
(22,'0006','李帅','93a9ded8a9ab7cb69dba0c0575665204','123123123123123123','男',NULL,'18533333333','','','','2020-07-02 00:00:00',NULL,15,17),
(23,'0007','胡八一','93a9ded8a9ab7cb69dba0c0575665204','123123123123123123','男',NULL,'18533333333','','','','2020-07-04 00:00:00',NULL,15,17),
(24,'0020','aa','93a9ded8a9ab7cb69dba0c0575665204','123123123123123123','男',NULL,'18533333333','','','','2020-07-06 00:00:00','正常',15,17),
(25,'0001','小张','93a9ded8a9ab7cb69dba0c0575665204','123123123123123123','男',NULL,'18533333333','小张老妈','1110','不知道','2021-03-18 08:00:00','正常',22,20);

/*Table structure for table `tb_subject` */

DROP TABLE IF EXISTS `tb_subject`;

CREATE TABLE `tb_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(100) DEFAULT NULL,
  `college` varchar(200) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_subject` */

insert  into `tb_subject`(`id`,`subject_name`,`college`,`remark`) values 
(17,'计算机应用','电子信息工程系','ddd'),
(18,'英语','外语系',''),
(19,'电子商务','工商管理系',''),
(20,'测试专业','测试院系','测试用的');

/*Table structure for table `tb_teacher` */

DROP TABLE IF EXISTS `tb_teacher`;

CREATE TABLE `tb_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(100) DEFAULT NULL,
  `teacher_pwd` varchar(50) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_teacher` */

insert  into `tb_teacher`(`id`,`teacher_name`,`teacher_pwd`,`remark`,`name`) values 
(4,'zhangping','93a9ded8a9ab7cb69dba0c0575665204','','张平'),
(5,'shaoming','93a9ded8a9ab7cb69dba0c0575665204','','邵明'),
(6,'hanmeimei','93a9ded8a9ab7cb69dba0c0575665204','','韩梅梅'),
(8,'aaa','93a9ded8a9ab7cb69dba0c0575665204','aa','aaa');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `user_pwd` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_user` */

insert  into `tb_user`(`id`,`user_name`,`user_pwd`,`name`,`remark`) values 
(1,'admin','93a9ded8a9ab7cb69dba0c0575665204','管理员','备注信息'),
(7,'hua','93a9ded8a9ab7cb69dba0c0575665204','hua','hua'),
(8,'aa','93a9ded8a9ab7cb69dba0c0575665204','aaa','');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
