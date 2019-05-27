# Host: localhost  (Version: 5.5.53)
# Date: 2019-05-27 21:50:35
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "adminright"
#

DROP TABLE IF EXISTS `adminright`;
CREATE TABLE `adminright` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `rule` varchar(255) DEFAULT NULL,
  `word` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "adminright"
#

/*!40000 ALTER TABLE `adminright` DISABLE KEYS */;
INSERT INTO `adminright` VALUES (1,'超级管理员','所有界面','拥有所有界面的操作权限','1'),(2,'编辑人员','试题管理','可以维护试题','1'),(3,'宣传人员','病例管理，医学资料管理','可以维护病例，医学资料','1');
/*!40000 ALTER TABLE `adminright` ENABLE KEYS */;

#
# Structure for table "answer"
#

DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) DEFAULT NULL,
  `userID` varchar(255) DEFAULT NULL,
  `questionID` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "answer"
#

/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;

#
# Structure for table "attention"
#

DROP TABLE IF EXISTS `attention`;
CREATE TABLE `attention` (
  `attentionID` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(255) DEFAULT NULL,
  `userID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attentionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "attention"
#

/*!40000 ALTER TABLE `attention` DISABLE KEYS */;
/*!40000 ALTER TABLE `attention` ENABLE KEYS */;

#
# Structure for table "case"
#

DROP TABLE IF EXISTS `case`;
CREATE TABLE `case` (
  `caseID` int(11) NOT NULL AUTO_INCREMENT,
  `caseName` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  `case_info` varchar(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT '0' COMMENT '病例类型',
  PRIMARY KEY (`caseID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "case"
#

/*!40000 ALTER TABLE `case` DISABLE KEYS */;
INSERT INTO `case` VALUES (1,'[皮肤科] 病例5：经阴茎海绵体输液抢救大面积烧伤患者1例','1557219037','./source/discussion1.png',1);
/*!40000 ALTER TABLE `case` ENABLE KEYS */;

#
# Structure for table "collect"
#

DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collectID` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(255) DEFAULT NULL,
  `userID` varchar(255) DEFAULT NULL,
  `inform_ID` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`collectID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Data for table "collect"
#

/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
INSERT INTO `collect` VALUES (11,'1557590581','4','16','0'),(12,'1557590594','4','15','1'),(13,'1557590629','4','14','1'),(14,'1557624834','4','3','1');
/*!40000 ALTER TABLE `collect` ENABLE KEYS */;

#
# Structure for table "collecttest"
#

DROP TABLE IF EXISTS `collecttest`;
CREATE TABLE `collecttest` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `usetime` varchar(255) DEFAULT NULL,
  `userID` varchar(255) DEFAULT NULL,
  `testID` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  `score` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

#
# Data for table "collecttest"
#

/*!40000 ALTER TABLE `collecttest` DISABLE KEYS */;
INSERT INTO `collecttest` VALUES (36,'00:28:49','18819747163','1','2019-05-12 10:19:39',''),(37,'00:28:55','18819747163','13','2019-05-12 10:23:31','3'),(38,'00:19:56','18819747144','6','2019-05-26 17:30:56','');
/*!40000 ALTER TABLE `collecttest` ENABLE KEYS */;

#
# Structure for table "critic"
#

DROP TABLE IF EXISTS `critic`;
CREATE TABLE `critic` (
  `criticID` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(255) DEFAULT NULL,
  `critic_info` varchar(255) DEFAULT NULL,
  `userID` varchar(255) DEFAULT NULL,
  `caseID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`criticID`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

#
# Data for table "critic"
#

/*!40000 ALTER TABLE `critic` DISABLE KEYS */;
INSERT INTO `critic` VALUES (1,'1557314539','1','4','1'),(2,'1557318210','评论测试','4',NULL),(3,'1557318237','123','4',NULL),(4,'1557318247','123','4',NULL),(5,'1557318318','1','4',NULL),(6,'1557318488','11','4','1'),(7,'1557318523','1111','4','3'),(8,'1557318546','测试','4','3'),(9,'1557318658','测试3','4',NULL),(10,'1557318675','123','4',NULL),(11,'1557319020','123','4',NULL),(12,'1557319044','123','4','1'),(13,'1557319075','123312','4','1'),(14,'1557319108','123321','4','3'),(15,'1557321348','111','11','3'),(16,'1557328956','haha ','4','3'),(17,'1557371363','测试评论','4','2'),(18,'1557389340','1','20','1'),(19,'1557391738','测试','16','1'),(20,'1557596568','测试','4','2'),(21,'1557596588','测试3','4','2');
/*!40000 ALTER TABLE `critic` ENABLE KEYS */;

#
# Structure for table "data"
#

DROP TABLE IF EXISTS `data`;
CREATE TABLE `data` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `amountnum` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "data"
#

/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `data` VALUES (1,'9','2019-05-26');
/*!40000 ALTER TABLE `data` ENABLE KEYS */;

#
# Structure for table "download"
#

DROP TABLE IF EXISTS `download`;
CREATE TABLE `download` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `downloadID` varchar(255) DEFAULT NULL,
  `userID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "download"
#

/*!40000 ALTER TABLE `download` DISABLE KEYS */;
/*!40000 ALTER TABLE `download` ENABLE KEYS */;

#
# Structure for table "errorquestion"
#

DROP TABLE IF EXISTS `errorquestion`;
CREATE TABLE `errorquestion` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(255) DEFAULT NULL,
  `questionID` text,
  `createtime` varchar(255) DEFAULT NULL,
  `testID` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

#
# Data for table "errorquestion"
#

/*!40000 ALTER TABLE `errorquestion` DISABLE KEYS */;
INSERT INTO `errorquestion` VALUES (15,'18819747163','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\",\"59\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"67\",\"68\",\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"80\",\"81\"]','2019-05-08 01:52:42','1','81'),(16,'13687459879','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"9\",\"10\",\"11\",\"12\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"36\",\"37\",\"38\",\"39\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"56\",\"58\",\"60\",\"62\",\"63\",\"64\",\"65\",\"66\",\"67\",\"68\",\"69\",\"70\",\"71\",\"72\",\"73\",\"75\",\"76\",\"77\",\"78\",\"79\",\"80\",\"81\"]','2019-05-08 11:36:33','1','70'),(17,'13537172996','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"12\",\"13\",\"14\",\"15\",\"17\",\"18\",\"21\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\",\"59\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"67\",\"68\",\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"80\",\"81\"]','2019-05-08 12:04:33','1','76'),(18,'13687111111','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\",\"59\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"67\",\"68\",\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"80\",\"81\"]','2019-05-09 16:18:56','1','81'),(19,'13537140605','[\"2\",\"3\",\"4\",\"5\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"25\",\"26\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\",\"59\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"67\",\"68\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"80\"]','2019-05-09 16:22:39','1','74'),(20,'13192719236','[\"1\",\"2\",\"5\",\"6\",\"8\",\"9\",\"10\",\"12\",\"13\",\"14\",\"15\",\"16\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\",\"59\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"67\",\"68\",\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"80\",\"81\"]','2019-05-09 16:37:15','1','76'),(21,'18819747163','[\"92\",\"82\",\"84\",\"85\",\"86\",\"87\",\"88\",\"89\",\"90\",\"91\"]','2019-05-11 23:09:31','13','10');
/*!40000 ALTER TABLE `errorquestion` ENABLE KEYS */;

#
# Structure for table "login"
#

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(255) DEFAULT NULL,
  `logintime` varchar(255) DEFAULT NULL,
  `outtime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "login"
#

/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;

#
# Structure for table "major"
#

DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `majorID` int(11) NOT NULL AUTO_INCREMENT,
  `majorName` varchar(255) DEFAULT NULL,
  `englishname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`majorID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "major"
#

/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (3,'测试试题','测试试题');
/*!40000 ALTER TABLE `major` ENABLE KEYS */;

#
# Structure for table "med_information"
#

DROP TABLE IF EXISTS `med_information`;
CREATE TABLE `med_information` (
  `inform_ID` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `inform_Name` varchar(255) DEFAULT NULL,
  `inform_info` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  `titleUrl` varchar(255) DEFAULT '' COMMENT '封面url',
  PRIMARY KEY (`inform_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

#
# Data for table "med_information"
#

/*!40000 ALTER TABLE `med_information` DISABLE KEYS */;
INSERT INTO `med_information` VALUES (7,'1','dfgdfdsfgdfsgdfgdfg','../img/image/1.jpg',NULL,''),(8,'1','dfgdf','../img/image/1.jpg',NULL,''),(9,'1','ghjuhmfs','../img/image/1.jpg',NULL,''),(10,'2','fgfgjgh','../img/video/ckin.mp4',NULL,'../img/image/ckin.jpg'),(11,'2','dfghfg','../img/video/ckin.mp4',NULL,'../img/image/ckin.jpg'),(12,'2','dfbgdfs','../img/video/ckin.mp4',NULL,'../img/image/ckin.jpg'),(13,'3','sdfsad','../img/ppt/1.ppt',NULL,'../img/image/2.jpg'),(14,'3','dsafhfg','../img/ppt/1.ppt',NULL,'../img/image/2.jpg'),(15,'3','dghfnhgj','../img/ppt/1.ppt',NULL,'../img/image/2.jpg'),(16,'3','hjkuilr','../img/ppt/1.ppt',NULL,'../img/image/2.jpg'),(17,'2','1','2','3','4'),(18,'1','123','123','123','123'),(19,'2','测试','1','1','1');
/*!40000 ALTER TABLE `med_information` ENABLE KEYS */;

#
# Structure for table "question"
#

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `questionID` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `choiceA` varchar(255) DEFAULT NULL,
  `choiceB` varchar(255) DEFAULT NULL,
  `choiceC` varchar(255) DEFAULT NULL,
  `choiceD` varchar(255) DEFAULT NULL,
  `choiceE` varchar(255) DEFAULT NULL,
  `choiceF` varchar(255) DEFAULT NULL,
  `right_answer` varchar(255) DEFAULT NULL,
  `jiexi` varchar(255) DEFAULT NULL,
  `score` varchar(255) DEFAULT NULL,
  `testID` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`questionID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "question"
#

/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (5,'题干','A','B','C','D','','','A','解析','分数','6','radio');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;

#
# Structure for table "read"
#

DROP TABLE IF EXISTS `read`;
CREATE TABLE `read` (
  `readID` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(255) DEFAULT NULL,
  `userID` varchar(255) DEFAULT NULL,
  `inform_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`readID`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

#
# Data for table "read"
#

/*!40000 ALTER TABLE `read` DISABLE KEYS */;
INSERT INTO `read` VALUES (1,'1557314496','4','3'),(2,'1557314520','4','1'),(3,'1557318196','4','3'),(4,'1557318481','4','1'),(5,'1557318517','4','3'),(6,'1557318882','4','1'),(7,'1557319096','4','3'),(8,'1557319446','4','1'),(9,'1557320134','11','2'),(10,'1557320144','11','1'),(11,'1557320605','11','1'),(12,'1557321337','11','3'),(13,'1557321366','11','1'),(14,'1557328947','4','3'),(15,'1557371343','4','1'),(16,'1557371353','4','2'),(17,'1557372419','4','3'),(18,'1557372743','4','3'),(19,'1557373205','4','3'),(20,'1557373628','4','3'),(21,'1557374082','18','3'),(22,'1557384655','18','1'),(23,'1557389116','19','1'),(24,'1557389306','20','1'),(25,'1557390156','19','1'),(26,'1557390255','11','1'),(27,'1557390384','4','3'),(28,'1557390703','4','3'),(29,'1557391723','16','1'),(30,'1557391947','4','1'),(31,'1557392201','11','1'),(32,'1557392225','16','3'),(33,'1557392281','4','1'),(34,'1557392294','4','3'),(35,'1557395471','20','1'),(36,'1557569929','4','1'),(37,'1557589646','4','3'),(38,'1557589737','4','1'),(39,'1557595777','4','3'),(40,'1557596085','4','3'),(41,'1557596252','4','1'),(42,'1557596557','4','2'),(43,'1557596752','4','1'),(44,'1558851527','10','1');
/*!40000 ALTER TABLE `read` ENABLE KEYS */;

#
# Structure for table "root"
#

DROP TABLE IF EXISTS `root`;
CREATE TABLE `root` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `adminuser` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '1',
  `phonenum` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "root"
#

/*!40000 ALTER TABLE `root` DISABLE KEYS */;
INSERT INTO `root` VALUES (1,'admin','root','[\"1\",\"2\",\"3\"]','2019-5-24','1','18819747163','594115018@qq.com'),(5,'18819747163','666666','[\"1\",\"2\",\"3\"]','2019-05-26 18:27:52','1','18819747163','594115018@qq.com'),(6,'123456','123321','[\"3\"]','2019-05-26 18:48:00','1','18819747163','594115018@qq.com');
/*!40000 ALTER TABLE `root` ENABLE KEYS */;

#
# Structure for table "rule"
#

DROP TABLE IF EXISTS `rule`;
CREATE TABLE `rule` (
  `ruleID` int(11) NOT NULL AUTO_INCREMENT,
  `ruleName` varchar(255) DEFAULT NULL,
  `score` varchar(255) DEFAULT NULL,
  `ruletype` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ruleID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Data for table "rule"
#

/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
INSERT INTO `rule` VALUES (1,'注册会员签到6','18','任务奖励',''),(2,'签到','1','任务奖励',NULL),(3,'收藏','1','学习奖励',NULL),(4,'在线答题','1','学习奖励','test'),(5,'下载','1','学习奖励','test'),(6,'打印','1','学习奖励','test');
/*!40000 ALTER TABLE `rule` ENABLE KEYS */;

#
# Structure for table "score"
#

DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `score` varchar(255) DEFAULT NULL,
  `testID` varchar(255) DEFAULT NULL,
  `userID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "score"
#

/*!40000 ALTER TABLE `score` DISABLE KEYS */;
/*!40000 ALTER TABLE `score` ENABLE KEYS */;

#
# Structure for table "subject"
#

DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `subjectID` int(11) NOT NULL AUTO_INCREMENT,
  `subjectName` varchar(255) DEFAULT NULL,
  `majorID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subjectID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

#
# Data for table "subject"
#

/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (8,'测试科目','3');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;

#
# Structure for table "terminology"
#

DROP TABLE IF EXISTS `terminology`;
CREATE TABLE `terminology` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `info` text,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

#
# Data for table "terminology"
#

/*!40000 ALTER TABLE `terminology` DISABLE KEYS */;
INSERT INTO `terminology` VALUES (40,'123','123','123'),(41,'3333','123','1');
/*!40000 ALTER TABLE `terminology` ENABLE KEYS */;

#
# Structure for table "test"
#

DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `testID` int(11) NOT NULL AUTO_INCREMENT,
  `testName` varchar(255) DEFAULT NULL,
  `subjectID` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT '00:00:00',
  `createtime` varchar(255) DEFAULT NULL,
  `testNumber` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`testID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "test"
#

/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (6,'试卷','8','00:20:00','2019-05-26',NULL,'未知');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;

#
# Structure for table "total"
#

DROP TABLE IF EXISTS `total`;
CREATE TABLE `total` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `total_score` varchar(255) DEFAULT NULL,
  `ruleID` varchar(255) DEFAULT NULL,
  `userID` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `msgshow` varchar(255) DEFAULT 'Y',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

#
# Data for table "total"
#

/*!40000 ALTER TABLE `total` DISABLE KEYS */;
INSERT INTO `total` VALUES (18,NULL,'4','18819747163','2019-05-08 03:01:50','外科选择题1','Y'),(19,NULL,'6','18819747163','2019-05-08 03:04:48','外科选择题1','N'),(20,NULL,'6','18819747163','2019-05-08 03:05:00','测试2','N'),(21,NULL,'5','18819747163','2019-05-08 03:05:28','外科选择题1','N'),(22,NULL,'2','18819747163','2019-05-08 03:07:54','','Y'),(23,NULL,'6','18819747163','2019-05-08 10:48:41','测试分页','Y'),(24,NULL,'4','13687459879','2019-05-08 11:36:33','外科选择题1','Y'),(25,NULL,'2','13687459879','2019-05-08 11:37:50','','Y'),(26,NULL,'6','13687459879','2019-05-08 11:41:36','外科选择题1','Y'),(27,NULL,'5','13687459879','2019-05-08 11:48:22','外科选择题1','Y'),(28,NULL,'5','13687459879','2019-05-08 11:49:15','测试2','Y'),(29,NULL,'4','13537172996','2019-05-08 12:01:28','外科选择题1','Y'),(33,NULL,'6','13537172996','2019-05-08 20:51:35','外科选择题1','Y'),(34,NULL,'6','18819747163','2019-05-08 21:05:36','测试21','Y'),(37,NULL,'5','18819747163','2019-05-09 11:40:07','ghjghj','Y'),(38,NULL,'1','18819747169','2019-05-09 11:53:05','','Y'),(39,NULL,'5','18819747169','2019-05-09 11:54:45','ghjghj','Y'),(40,NULL,'1','13687111111','2019-05-09 16:03:31','','Y'),(41,NULL,'5','13537140605','2019-05-09 16:07:30','外科选择题1','Y'),(42,NULL,'6','13537140605','2019-05-09 16:07:41','外科选择题1','Y'),(43,NULL,'5','13687111111','2019-05-09 16:08:29','外科选择题1','Y'),(44,NULL,'5','13537140605','2019-05-09 16:08:50','[皮肤科] 病例5：经阴茎海绵体输液抢救大面积烧伤患者1例','Y'),(45,NULL,'4','13687111111','2019-05-09 16:18:57','外科选择题1','Y'),(46,NULL,'4','13537140605','2019-05-09 16:22:39','外科选择题1','Y'),(47,NULL,'5','13687111111','2019-05-09 16:22:39','[皮肤科] 病例5：经阴茎海绵体输液抢救大面积烧伤患者1例','Y'),(48,NULL,'5','13537172996','2019-05-09 16:24:18','[皮肤科] 病例5：经阴茎海绵体输液抢救大面积烧伤患者1例','Y'),(49,NULL,'4','13192719236','2019-05-09 16:37:07','外科选择题1','Y'),(50,NULL,'5','18819747163','2019-05-09 16:52:35','[皮肤科] 病例5：经阴茎海绵体输液抢救大面积烧伤患者1例','Y'),(51,NULL,'5','13192719236','2019-05-09 16:57:21','ghjghj','Y'),(52,NULL,'2','13537172996','2019-05-09 17:00:46','','Y'),(53,NULL,'2','18819747163','2019-05-10 20:25:53','','Y'),(54,NULL,'2','18819747163','2019-05-11 18:16:43','','Y'),(55,NULL,'4','18819747163','2019-05-11 23:09:26','诊断学选择题','Y'),(56,NULL,'5','18819747163','2019-05-12 01:42:40','sadfgfd','Y'),(57,NULL,'5','18819747144','2019-05-26 14:18:49','[皮肤科] 病例5：经阴茎海绵体输液抢救大面积烧伤患者1例','Y'),(58,NULL,'4','18819747144','2019-05-26 17:30:58','试卷','Y'),(59,NULL,'6','18819747144','2019-05-26 17:59:13','试卷','Y');
/*!40000 ALTER TABLE `total` ENABLE KEYS */;

#
# Structure for table "usermsg"
#

DROP TABLE IF EXISTS `usermsg`;
CREATE TABLE `usermsg` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

#
# Data for table "usermsg"
#

/*!40000 ALTER TABLE `usermsg` DISABLE KEYS */;
INSERT INTO `usermsg` VALUES (4,'18819747163','87971892',NULL,'2019-05-03 00:02:33'),(5,'18819747164','yy87971892',NULL,'2019-05-03 00:54:46'),(6,'18819747161','yy87971892',NULL,'2019-05-04 08:39:11'),(8,'18819747166','yy87971892',NULL,'2019-05-04 11:34:47'),(9,'18819747162','yy87971892',NULL,'2019-05-04 11:49:50'),(10,'18819747144','yy87971892',NULL,'2019-05-04 11:59:32'),(11,'13537172996','111111',NULL,'2019-05-04 11:59:56'),(12,'18819747133','yy87971892',NULL,'2019-05-04 12:00:04'),(13,'18819747177','123456',NULL,'2019-05-04 12:01:41'),(14,'13687459879','222222',NULL,'2019-05-08 11:33:39'),(15,'18344169090','123456',NULL,'2019-05-08 21:09:32'),(16,'13192719236','7101051',NULL,'2019-05-08 21:12:04'),(17,'18819747160','87971892',NULL,'2019-05-09 11:52:14'),(18,'18819747169','87971892',NULL,'2019-05-09 11:53:04'),(19,'13687111111','222222',NULL,'2019-05-09 16:03:30'),(20,'13537140605','aaaaaa',NULL,'2019-05-09 16:06:49'),(21,'18819747144','666666',NULL,NULL),(22,NULL,NULL,NULL,'2019-05-25 13:56:59'),(23,NULL,NULL,NULL,'2019-05-25 13:58:33'),(24,'18819747149','88888888',NULL,'2019-05-25 14:01:51');
/*!40000 ALTER TABLE `usermsg` ENABLE KEYS */;
