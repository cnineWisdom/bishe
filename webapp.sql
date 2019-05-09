# Host: localhost  (Version: 5.5.53)
# Date: 2019-05-05 08:14:39
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

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
  PRIMARY KEY (`caseID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "case"
#

/*!40000 ALTER TABLE `case` DISABLE KEYS */;
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
  PRIMARY KEY (`collectID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

alter table `collect` add `flag` tinyint(4) default 1 comment '是否收藏'
#
# Data for table "collect"
#

/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `collect` ENABLE KEYS */;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "critic"
#

/*!40000 ALTER TABLE `critic` DISABLE KEYS */;
/*!40000 ALTER TABLE `critic` ENABLE KEYS */;

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "errorquestion"
#

/*!40000 ALTER TABLE `errorquestion` DISABLE KEYS */;
INSERT INTO `errorquestion` VALUES (5,'18819747161','[\"92\",\"82\",\"83\",\"84\",\"85\",\"86\",\"87\",\"88\",\"89\",\"90\",\"91\"]','2019-05-04 11:28:10','13','11'),(6,'18819747161','[\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"24\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\",\"59\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"67\",\"68\",\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"80\",\"81\"]','2019-05-04 11:28:34','1','80'),(7,'13537172996','[\"2\",\"3\",\"4\",\"5\",\"6\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"24\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\",\"59\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"67\",\"68\",\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"80\",\"81\"]','2019-05-04 12:01:21','1','79'),(8,'13537172996','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"12\",\"13\",\"14\",\"15\",\"17\",\"24\",\"18\",\"21\",\"22\",\"23\",\"25\",\"26\",\"28\",\"29\",\"30\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\",\"59\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"67\",\"68\",\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"80\",\"81\"]','2019-05-04 12:05:41','1','73'),(9,'18819747163','[\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"24\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\",\"59\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"67\",\"68\",\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"80\",\"81\"]','2019-05-05 00:17:28','1','78'),(10,'18819747163','[\"92\",\"82\",\"83\",\"84\",\"85\",\"86\",\"87\",\"88\",\"89\",\"90\",\"91\"]','2019-05-05 00:17:53','13','11');
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "major"
#

/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (1,'临床医学','clinical medicine'),(2,'实例2','shili2');
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
  PRIMARY KEY (`inform_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "med_information"
#

/*!40000 ALTER TABLE `med_information` DISABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

#
# Data for table "question"
#

/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'手术区皮肤消毒范围要包括手术切口周围','10cm的区域','15cm的区域','20cm的区域','25cm的区域','30cm的区域','','B','解析测试1','1','1','radio'),(2,'代谢性碱中毒时不应补给氯化钾的情况是','尿量钾含量减少','尿量低于30ml/h','尿量超过60ml/hD','尿呈酸性','尿呈碱性',NULL,'B','解析测试2','1','1','radio'),(3,'禁食成年病人每天正确的水与电解质补充量为','水2000～2500ml，钠10g，氯化钾5g','水2000～2500ml，钠5g，氯化钾4g','水3000～3500ml，钠5g，氯化钾3g','水1500～2000ml，钠3g，氯化钾2g','水1500～2000ml，钠4g，氯化钾2g',NULL,'B','解析测试3','1','1','radio'),(4,'低渗性缺水时，在血清钠尚未明显降低之前，尿钠含量','正常','略高','时高时低','逐渐升高','减少',NULL,'E','解析测试4','1','1','radio'),(5,'低钾性碱中毒常出现于','尿毒症','胃肠减压','术后少尿','挤压创伤','输血过量',NULL,'B','解析测试5','1','1','radio'),(6,'低钾血症错误的临床表现是','肌无力为最早的临床表现','均有典型的心电图改变','常与镁缺乏同时存在','严重时可发生多尿','发生碱中毒时尿呈酸性',NULL,'B','解析测试6','1','1','radio'),(7,'男性，45岁，腹胀呕吐已半年，多于午后发作，吐出隔夜食物，吐量较大，吐后舒服，由于长期呕吐除脱水外还会造成','低氯、高钾性碱中毒','低氯、低钾性碱中毒','低氯、高钾性酸中毒','低氯、低钾性酸中毒','低钾性酸中毒',NULL,'B','解析测试7','1','1','radio'),(8,'女性，20岁，因十二指肠溃疡所致幽门梗阻引起反复呕吐15天入院，测得血钾值为3mmol/L，动脉血pH 7.5，首选补液种类应为','乳酸、氯化钾溶液','氯化钾溶液','等渗盐水','葡萄糖盐水','葡萄糖盐水、氯化钾溶液',NULL,'E','解析测试8','1','1','radio'),(9,'治疗等渗性脱水理想的液体是','5%碳酸氢钠','等渗盐水','平衡盐溶液','5%葡萄糖','小分子右旋糖酐',NULL,'C','解析测试9','1','1','radio'),(10,'临床上最常见的输血反应是','非溶血性发热反应','变态反应','过敏反应','溶血反应','细菌污染反应',NULL,'A','解析测试10','1','1','radio'),(11,'男性，70岁。胃癌根治术后当天输血 2000ml，病人出现头部胀痛，呼吸困难，咳大量血性泡沫痰。应立即','半卧位、吸氧、利尿','抗感染治疗','大剂量应用地塞米松','输入血浆或5％白蛋白','输入碳酸氢钠使尿液碱化',NULL,'A','试题点评：老年人在大量输血后出现呼吸困难，咳大量血性泡沫痰，考虑左心衰竭，治疗应半卧位、吸氧、利尿降低心脏负荷。','1','1','radio'),(12,'成人失血500～800ml，首先考虑输入','全血','血浆','浓缩红细胞','白蛋白','晶体液',NULL,'E','解析测试12','1','1','radio'),(13,'男，32岁，因患再生障碍性贫血需要输血，当输入红细胞悬液约200ml时，突然畏寒，发热，呕吐一次，尿呈酱油样，血压75/45mmHg(10.0/6.0kPa)。该患者最有可能是下列哪一种输血不良反应（并发症）','非溶血性发热性输血反应','溶血性输血反应','过敏反应','细菌污染反应','循环超负荷',NULL,'B','解析测试13','1','1','radio'),(14,'迅速出血后出现休克症状。表明至少已丢失全身总血量的','10%','15%','20%','25%','30%',NULL,'C','解析测试14','1','1','radio'),(15,'关于急性失血患者的输血，正确说法是','用等量的全血补充所估计的失血量','在晶体液、胶体液扩容的基础上，适当输注全血','在晶体液、胶体液扩容的基础上，合理输血（主要是输红细胞）','先输注血浆补充血容量，再输注红细胞纠正贫血','红细胞、新鲜冰冻血浆及血小板三者合理搭配输注',NULL,'C','解析测试15','1','1','radio'),(16,'男，52岁，因患十二指肠球部溃疡合并幽门不全梗阻入院施行胃大部切除术。术中出血约 600ml。心率92次／分，呼吸21次／分，血压98/60mmHg(13.1/8.0kPa)；血红蛋白105g/L。在输血问题上，正确做法是','输注晶体液补充血容量，原则上不输血','输全血600ml补充丢失的失血量','输血浆和红细胞各300ml代替丢失的全血','输红细胞悬液600ml，不必输注全血','输血浆600ml补充血容量，不必输注红细胞',NULL,'A','试题点评：患者出血量不足20%，心率、血压、呼吸平稳，血红蛋白仅轻度下降，因此主张不输血。','1','1','radio'),(17,'血型不合输血后，病人出现严重溶血反应，实验室检查的重要依据是','含铁血黄素尿','血尿','血红蛋白尿','网织红细胞增高','尿胆原（＋）',NULL,'C','解析测试17','1','1','radio'),(18,'一产妇分娩时产道出血400ml，血压100/ 65mmHg，Hb 110g/L。因平时身体虚弱，其家属要求输血以补充营养和加快恢复体力。此时正确的处理是','输注全血','输注红细胞悬液2单位','输注新鲜冰冻血浆400ml','加强饮食营养，但不输注任何血液制品','输注入血白蛋白',NULL,'D','试题点评：患者出血400ml，血压平稳，血红蛋白基本正常，因此不主张输血。','1','1','radio'),(19,'女，85岁，因大量呕血、黑便送来急诊。既往有冠心病，肾动脉硬化。立即给予输血、补液及相应的止血措施。对此患者指导液体入量及输入速度最有意义的参考指标是','中心静脉压','肘静脉压','血压','心率','尿量',NULL,'A','试题点评：中心静脉压代表了右心房或胸腔段腔静脉内压力的变化，在反映全身血容量及心功能状况方面比动脉压要早，患者高龄，大量输血补液后易出现循环超负荷，因此A是最适合的选项。','1','1','radio'),(20,'治疗外科低血容量性休克的基本措施是补充血容量，一般宜首选','平衡盐溶液','10%葡萄糖溶液','右旋糖酐','5%碳酸氢钠','全血',NULL,'A','解析测试20','1','1','radio'),(21,'下列关于治疗休克的叙述中，错误的是','失血性休克的治疗是扩容','感染性休克时可应用大剂量氢化考的松','失血性休克时，止血是不可忽视的主要手段','感染性休克时，应首先使用升压药','感染性休克应恢复有效循环血量',NULL,'D','解析测试21','1','1','radio'),(22,'血压下降在休克中的意义为','是诊断休克的唯一依据','是休克最常见的临床表现','是估计休克程度的主要指标','是组织细胞缺氧的主要指标','是休克最早的指标',NULL,'C','解析测试22','1','1','radio'),(23,'女性，45岁，遭车祸时左季肋部撞伤脾破裂。血压80/60mmHg(10.6/8kPa)，神志尚清楚，脉搏120次／分，表情淡漠，口渴，面色苍白。估计出血量达','400～500ml','600～700ml','800～1600ml','1700～2400ml','>2400ml',NULL,'C','试题点评：据患者临床表现诊断为休克中度，失血量应为20％～40%，因此选择C。','1','1','radio'),(24,'中心静脉压高而动脉压在正常范围，反映','右心功能不全或血容量相对过多','胸腔内压增加','右心功能不全或容量相对不足','静脉回心血量增加','容量血管过度收缩',NULL,'E',NULL,'1','1','radio'),(25,'一成人烧伤面积60%，7小时后入院，经注射吗啡，头孢类抗生素和生理盐水1000ml，仍有休克，应考虑为','神经性休克','感染性休克','心源性休克','低血容量性休克','中毒性休克',NULL,'D','试题点评：大面积烧伤后体液丢失过多，可致低血容量休克，注射吗啡后可减少神经性休克，发病时间短，已经应用抗生素，暂不考虑感染性休克，虽经补生理盐水1000ml，但补充量远远不足。','1','1','radio'),(26,'女，22岁，腹痛伴频繁呕吐3天，以肠梗阻收入院，血Na+ 133mmol/L，血K+ 3mmol/L，HCO-3 8mmol/L， BP 80/60mmHg，治疗应首先采取','纠正酸中毒','纠正低血钾','纠正低血钠','急诊手术，解除肠梗阻','纠正低血容量',NULL,'E','试题点评：患者频繁呕吐，血压低，脉压差小，考虑血容量不足，应首先纠正低血容量。','1','1','radio'),(27,'为感染性休克病人迅速纠正血容量不足时，下列各组液体中，首选的是','以平衡盐溶液为主，配合适量血浆和全血','以胶体溶液为主','等张生理盐水加代血浆','葡萄糖溶液加代血浆','全血配合葡萄糖',NULL,'A',NULL,'1','1','radio'),(28,'下列关于休克病人预防急性肾衰的措施中不正确的是','及时纠正低血容量性休克，避免肾缺血','矫治休克时不宜使用易引起肾血管收缩的药物','对有溶血倾向的病人应保持肾小管通畅、碱化尿液，避免肾小管损害','休克合并DIC时，要及时应用肝素治疗','病人只要出现尿量减少时，要及时使用利尿剂',NULL,'E',NULL,'1','1','radio'),(29,'休克病人中心静脉压为5cmH2O，血压80/65mmHg，处理原则为','适当补液','使用强心药物','用扩血管药','补液试验','充分补液',NULL,'D',NULL,'1','1','radio'),(30,'男性，40岁，腹痛、发热48小时，血压80/60mmHg，神志清楚，面色苍白，四肢湿冷，全腹肌紧张，肠鸣音消失，诊断为','低血容量性休克','感染性休克','神经源性休克','心源性休克','过敏性休克',NULL,'B','试题点评：患者血压低，面色苍白，四肢湿冷，考虑为休克，另根据全腹肌紧张腹膜炎体征，考虑为感染性休克。','1','1','radio'),(31,'ARDS共同性病理变化有 急性呼吸窘迫综合征','气道阻塞','肺部感染','肺不张','急性心力衰竭','肺血管内皮和肺泡损害，肺间质水肿',NULL,'E',NULL,'1','1','radio'),(32,'急性肾功能衰竭少尿或无尿期常见的致死原因是','高磷血症与低钙血症','低钠血症','低氯血症','高镁血症','高钾血症',NULL,'E',NULL,'1','1','radio'),(33,'女，45岁，因交通事故，双股骨干粉碎骨折第2天。其24小时尿量200ml，下列化验结果不符合急性肾功能衰竭的是','血钾5mmol/L','尿素氮14.2mmol/L','血镁1.4mmol/L','血磷0.89mmol/L，血钙2.96mmol/L','血浆肌酐106mmol/L',NULL,'D','试题点评：急性急性肾功能衰竭时会出现代谢产物积聚，血尿素氮、肌酐升高，还可出现高钾、高镁、高磷、低钙血症，因此D不符合急性肾功能衰竭。','1','1','radio'),(34,'关于应激性溃疡不正确的是','多发生于胃，也可累及食管','不会穿透胃壁全层','最明显的症状是呕血、柏油样便','可发生大出血','可发生于十二指肠',NULL,'B',NULL,'1','1','radio'),(35,'男性，42岁，患急性重症胰腺炎并发休克36小时，经抗休克治疗后行胰腺和其周围坏死组织清除、腹腔引流术。术后心率106次／分，血压96/60mmHg(12.8/8kPa)，中心静脉压10cmH2O(9.8kPa)。呼吸频率22次／分，动脉血氧分压66mmHg (11.5kPa)，尿量10ml/h，尿比重1.002。此病人目前最紧急的并发症是','心功能不全','肺功能衰竭','肾功能衰竭','血容量不足','体内抗利尿激素分泌过多',NULL,'C','试题点评：患者少尿且尿比重偏低，而血压正常，因此考虑为肾功能衰竭。','1','1','radio'),(36,'男，60岁，急性肾功能衰竭病人，血钾5.6mmol/L，下列治疗措施有原则性错误的是','10%氯化钾20ml静脉滴注','口服钠型树脂15g，每日3次','山梨醇5g，每2小时口服一次','5%碳酸氢钠溶液100ml，缓慢静脉滴注','25%葡萄糖溶液加胰岛素（3～5U）200ml，缓慢静脉滴注',NULL,'A','试题点评：患者目前已经出现高钾血症，因此禁忌补钾。','1','1','radio'),(37,'45岁女性，严重骨盆骨折，24小时尿量 200ml，血钾5.9mmol/L，二氧化碳结合力13mmol/L，血尿素氮27mmol/L，下列治疗措施不正确的是','10%葡萄糖酸钙溶液20ml，缓慢静脉注射','11.2％乳酸钠溶液60ml，缓慢静脉注射','口服钠型树脂10g，每日3次','血液透析','输同型库存血200ml',NULL,'E','试题点评：患者目前为急性肾功能衰竭，高钾血症，因此禁忌输含钾液，而库存血成分含钾量高，所以错误的治疗措施为E。','1','1','radio'),(38,'急性肾功能衰竭病人少尿期或无尿期出现水中毒的常见原因是','钠中毒','酸中毒','未严格限制入水量','体内内生水过多','抗利尿激素增加',NULL,'D',NULL,'1','1','radio'),(39,'男性，40岁，因创伤致心跳呼吸停止，经复苏后恢复，继而出现体温升高、抽搐、惊厥，病人可能并发','肺水肿','心力衰竭','肾衰竭','脑水肿','脑死亡',NULL,'D','试题点评：体温升高及抽搐乃至惊厥都是脑缺氧性损伤的体征，此时脑血管自动调节功能丧失，循环恢复后，脑血管被动扩张，微循环淤血，微血管壁通透性增高，水渗出致脑间质水肿。','1','1','radio'),(40,'单人心肺复苏时，胸外心挤压与人工呼吸的正确操作是','心脏按压5次，口对口人工呼吸1次','心脏按压6次，口对口人工呼吸1次','心脏按压12次，口对口人工呼吸2次','心脏按压15次，口对口人工呼吸2次','心脏按压24次，口对口人工呼吸3次',NULL,'D',NULL,'1','1','radio'),(41,'手术后，胃肠减压管拔除的指征是','术后3天','腹痛消失','已经肛门排气','已经肛门排气','腹胀消失',NULL,'C',NULL,'1','1','radio'),(42,'对心力衰竭病人进行择期手术，至少待心衰控制以后','＜1周','1～2周','3～4周','5～6周','>6周',NULL,'C',NULL,'1','1','radio'),(43,'下列各种引流管，不正确的处理是','要注意观察各种引流管是否通畅','仔细记录引流液的色泽和容量','留置胆管内的“T”形管可在术后1周拔除','胃肠功能恢复后可将胃肠减压管除去','腹腔烟卷引流一般在术后24～72小时拔除',NULL,'C',NULL,'1','1','radio'),(44,'预防术后肺不张最主要的措施是','应用大量抗生素','蒸汽吸入','多翻身多做深呼吸，鼓励咳嗽','应用祛痰药物','氧气吸入',NULL,'C',NULL,'1','1','radio'),(45,'男，18岁，因急性阑尾炎穿孔行阑尾切除术，术后3天切口红肿，有脓性分泌物，将缝线拆除后引出20ml脓液，10天后再次缝合而愈合，该病人切口愈合类型应记为','Ⅱ／乙','Ⅱ／丙','Ⅲ／甲','Ⅲ／乙','Ⅲ／丙',NULL,'C',NULL,'1','1','radio'),(46,'术后3～6天发热的最常见原因是','代谢异常','低血压','肺不张','输血反应','感染',NULL,'C',NULL,'1','1','radio'),(47,'下列各项关于全胃肠外营养的指征中，不包括','短肠综合征','大面积烧伤','急性坏死性胰腺炎','溃疡性结肠炎急性期','肢体外伤性失血',NULL,'E',NULL,'1','1','radio'),(48,'长期肠外营养支持者，应选择的穿刺血管是','颈内静脉','大隐静脉','颈外静脉','足背静脉','头静脉',NULL,'A',NULL,'1','1','radio'),(49,'肠内营养并发症与输入速度及溶液浓度有关的是','误吸','腹胀、腹泻','肠炎','肠道细菌移位','',NULL,'B',NULL,'1','1','radio'),(50,'肠内营养并发症与输入速度及溶液浓度有关的是','甲状腺癌根治手术','腹外疝修补术','门静脉高压症，分流术','结肠癌根治术','主动脉瘤切除血管移植术',NULL,'B',NULL,'1','1','radio'),(51,'男，70岁，上唇一个毛囊尖处出现红肿、疼痛的结节，中央部有灰黄色小脓栓形成，错误的处置是','休息','外敷鱼石脂膏','挤出脓栓，以利引流','应用抗生素','湿热敷',NULL,'C','试题点评：患者为疖，位于上唇部位疖挤压会造成颅内化脓性感染。','1','1','radio'),(52,'气性坏疽最关键的治疗措施是','大剂量青霉素','高压氧疗法','高压氧疗法','紧急手术处理','补充足够的营养',NULL,'E',NULL,'1','1','radio'),(53,'男，16岁，发热4天伴纳差2天急诊。检查：血压114/70mmHg，左脚趾甲沟部红肿破溃。血白细胞计数为20×109/L，中性粒细胞为89%。初步诊断是','左脚趾甲沟炎','左脚趾坏疽','左侧小腿丹毒','左小腿蜂窝织炎','感染性休克',NULL,'A','试题点评：据典型的临床表现诊断。','1','1','radio'),(54,'男，16岁，发热4天伴纳差2天急诊。检查：血压114/70mmHg，左脚趾甲沟部红肿破溃。血白细胞计数为20×109/L，中性粒细胞为89%。左脚趾经切开引流处理后应给予','大剂量青霉素','激素','退热剂','庆大霉素','维生素',NULL,'A','试题点评：患者存在全身感染症状，应用抗生素，引起甲沟炎的致病菌多为金葡菌，因此选用青霉素。','1','1','radio'),(55,'男，16岁，发热4天伴纳差2天急诊。检查：血压114/70mmHg，左脚趾甲沟部红肿破溃。血白细胞计数为20×109/L，中性粒细胞为89%。经处理3天后病人体温升高，且血压和血小板计数下降，此时病人可能合并有','败血症','DICC．感染性休克','多器官衰竭','菌血症 \r\n   cDAAA',NULL,NULL,'A','试题点评：患者全身感染后血压下降首先应考虑败血症。','1','1','radio'),(56,'经血培养证实金黄色葡萄球菌阳性。根据经验首选抗生素是','丁胺卡那霉素','环丙沙星','红霉素','万古霉素','甲硝唑',NULL,'D','试题点评：金黄色葡萄球菌的有效药物为万古霉素。','1','1','radio'),(57,'注射破伤风抗毒素（TAT)的目的是','对易感人群进行预防接种','对可疑或确诊的破伤风患者进行紧急预防或治疗','杀灭伤口中繁殖的破伤风梭（杆）菌','主要用于儿童的预防接种','中和与神经细胞结合的毒素',NULL,'B',NULL,'1','1','radio'),(58,'关于破伤风，正确的描述是','颈部肌肉强烈收缩最早出现','光线不能诱发全身肌肉抽搐','光线不能诱发全身肌肉抽搐','可出现尿潴留','不会发生骨折',NULL,'D',NULL,'1','1','radio'),(59,'外科感染的局部治疗方法中错误的是','散瘀消肿','患部适当活动，促进循环','伴有严重中毒症状时切开减压','必要时切除发炎脏器','加强营养支持',NULL,'B',NULL,'1','1','radio'),(60,'有关痈处理方法错误的是','中央部坏死组织多，全身症状重者，应手术治疗','中央部坏死组织多，全身症状重者，应手术治疗','切开至皮肤全层','尽量剪除坏死组织','唇痈不宜切开',NULL,'C',NULL,'1','1','radio'),(61,'脓液有甜腥臭味的是','大肠杆菌','拟杆菌','绿脓杆菌','溶血性链球菌','金黄色葡萄球菌',NULL,'C',NULL,'1','1','radio'),(62,'脓液量多，淡红色，稀薄的是','大肠杆菌','拟杆菌','绿脓杆菌','溶血性链球菌','金黄色葡萄球菌',NULL,'D',NULL,'1','1','radio'),(63,'脓液恶臭，普通细菌培养阴性的是','大肠杆菌','拟杆菌','绿脓杆菌','溶血性链球菌','金黄色葡萄球菌',NULL,'B',NULL,'1','1','radio'),(64,'男,18岁,右手背部深Ⅱ度烧伤10天,近一天出现乏力、头痛及张口困难,不恰当的诊治措施是','手背部烧伤部位清创','TAT2万U静脉注射','TAT2万U静脉注射','白蛋白20g静脉注射','10％水合氯醛30ml保留灌肠',NULL,'C','试题点评：病人诊断为破伤风，A、B、D、E均为其处理措施。','1','1','radio'),(65,'10％水合氯醛30ml保留灌肠','降低颅内压','下领骨结扎固定','补充血容量','保持呼吸道通畅','开颅手术',NULL,'D','试题点评：急救首先要保持呼吸道通畅。','1','1','radio'),(66,'男性，20岁，右大腿刀刺伤18小时，刀口处红肿，有渗出液，目前最适当的治疗措施是','试题点评：开放性创伤后应争取早期清创缝合。','抗生素治疗','理疗','清理伤口后换药','局部固定',NULL,'A','试题点评：开放性创伤后应争取早期清创缝合。','1','1','radio'),(67,'按新九分法计算烧伤面积躯干和会阴占全身面积的','25%','27%','30%','32%','35%',NULL,'B',NULL,'1','1','radio'),(68,'一大面积烧伤病人，近日来常寒战、高热，呈间歇热，四肢厥冷，紫绀，尿量明显减少，很快发生血压下降，休克。其原因最大可能是','革兰阳性细菌败血症','革兰阴性细菌败血症','真菌性败血症','厌氧菌性败血症','二重感染',NULL,'B','一大面积烧伤病人，近日来常寒战、高热，呈间歇热，四肢厥冷，紫绀，尿量明显减少，很快发生血压下降，休克。其原因最大可能是','1','1','radio'),(69,'女，35岁，体重50kg，汽油火焰烧伤，Ⅱ度烧伤面积73%，第一个24小时补液总量为','5500ml','6500ml','7500ml','7500ml','9500ml',NULL,'C','试题点评：第一个24小时补液量=50×73× 1.5+2000=7475ml','1','1','radio'),(70,'男，25岁，体重50kg，Ⅱ度以上烧伤面积 40%，其第1个24小时的前8小时内补液量为','1000ml','1500ml','2000ml','2500ml','3000ml',NULL,'D',NULL,'1','1','radio'),(71,'电击伤主要损害','心脏','肺','肝','肾','皮肤',NULL,'A',NULL,'1','1','radio'),(72,'男，18岁，右足和右小腿被开水烫伤，有水疱伴剧痛。创面基底部肿胀发红，该病人烧伤面积和深度\r\n的诊断为','5%浅Ⅱ度','5％深Ⅱ度','10％浅Ⅱ度','10％深Ⅱ度','15％浅Ⅱ度',NULL,'C','试题点评：本题考点为烧伤面积及深度的判断。','1','1','radio'),(73,'深Ⅱ度烧伤创面处理不正确的是','1:2000氯已定清洗创面，去除异物','去除水泡皮','油质纱布包扎创面','面部创面不包扎','创面使用抗生素预防全身感染',NULL,'A',NULL,'1','1','radio'),(74,'男性，体重50kg，躯干部、双臀及双大腿Ⅱ度烧伤，双小腿及双足Ⅲ度烧伤，第一个24小时应补充的胶体量约为','1500ml','1800ml','2700ml','2700ml','3600ml',NULL,'B','试题点评：第一个24小时补液量=50×73× 1.5+2000=7475ml，其中5475ml按晶体液和胶体液2:1计算，2000ml基础水分用5%葡萄糖，因此胶体量为1825ml。','1','1','radio'),(75,'对放射线高度敏感的肿瘤,下列哪项是错误的','淋巴造血系统肿瘤','淋巴造血系统肿瘤','来源于上皮组织的肿瘤','来源于上皮组织的肿瘤','肾母细胞瘤',NULL,'C',NULL,'1','1','radio'),(76,'良性肿瘤与恶性肿瘤的主要鉴别是','有无包膜','生长速度','分化程度','疼痛程度','有无溃疡',NULL,'C','','1','1','radio'),(77,'关于肿瘤的恶性程度，正确的是','Ⅰ级分化细胞恶性程度高','Ⅲ级分化细胞接近正常分化程度','高分化较低分化者核分裂多','低分化者较高分化者DNA、RNA含量增多','Ⅰ级分化较Ⅲ级分化细胞排列紊乱',NULL,'D',NULL,'1','1','radio'),(78,'关于肿瘤的转移错误的是','胃癌可转移至盆腔','乳癌可转移至锁骨上淋巴结','交界性肿瘤不出现转移','肝癌可出现脑转移','肺癌可出现骨转移',NULL,'C',NULL,'1','1','radio'),(79,'确诊肿瘤最可靠的方法是','CT检查','DSA检查','DSA检查','肿瘤标记物检查','病理学检查',NULL,'E',NULL,'1','1','radio'),(80,'来源于间叶组织的肿瘤是','癌','肉瘤','肉瘤','类癌','临界肿瘤',NULL,'B',NULL,'1','1','radio'),(81,'癌与肉瘤的主要区别是','发生的部位不同','肿瘤的颜色不同','肿瘤的质地不同','发生的年龄不同','组织来源不同',NULL,'E',NULL,'1','1','radio'),(82,'水冲脉可见于','水冲脉可见于','水冲脉可见于','甲状腺功能亢进症','三尖瓣关闭不全','心包积液',NULL,'ABC',NULL,'3','13','checkbox'),(83,'正常人触觉语颤的生理差异为','前胸上部较下部弱','前胸上部较下部强','后胸下部较上部强','左上胸较右上胸强','后胸上部较下部强',NULL,'BC',NULL,'3','13','checkbox'),(84,'下列叙述何者错误？','一般叩得的肝下界约比触得的肝下界低2～3㎝','一般肝上界比肺下界高一个肋间','肝浊音界缩小可见于急性肝坏死及胃肠胀气','肝浊音界消失是急性胃肠穿孔的重要征象','右锁骨中线上肝上、下界之间的距离8～10㎝',NULL,'AE',NULL,'3','13','checkbox'),(85,'异常支气管呼吸音见于','肺组织实变','肺内大空腔','压迫性肺不张','阻塞性肺不张','肺内含气量增多',NULL,'ABC',NULL,'3','13','checkbox'),(86,'以下哪些项目是属于主动脉瓣关闭不全的体征','心脏呈靴形增大','心尖区可闻舒张期隆隆样杂音','周围血管可闻Duroziez双重杂音','奇脉','第一心音增强',NULL,'AC',NULL,'3','13','checkbox'),(87,'奇脉可出现于','冠心病','胸腔积液','心包积液','主动脉瓣狭窄','以上都不是',NULL,'C',NULL,'3','13','checkbox'),(88,'胸骨角（Louis角）标志着','支气管分支','第5胸椎水平','右心室上缘','上、下纵膈交界','主动脉弓',NULL,'ABD',NULL,'3','13','checkbox'),(89,'下述哪些检查提示溶血性黄疸','血清总胆红素增多','血清结合胆红素/总胆红素>35%','尿内胆红素检查呈阳性反应','尿胆原明显增加','粪胆原增加',NULL,'ADE',NULL,'3','13','checkbox'),(90,'下列哪些物质不属脂蛋白类','胆固醇','甘油三酯','低密度脂蛋白','高密度脂蛋白','乳糜微粒',NULL,'AB',NULL,'3','13','checkbox'),(91,'甲状腺功能亢进症的敏感指标有','TT3','FT3','TT4','FT4','TSH',NULL,'BDE',NULL,'3','13','checkbox'),(92,'单选测试','A','B','C','D','E',NULL,'A',NULL,'1','13','radio');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "read"
#

/*!40000 ALTER TABLE `read` DISABLE KEYS */;
/*!40000 ALTER TABLE `read` ENABLE KEYS */;

#
# Structure for table "rule"
#

DROP TABLE IF EXISTS `rule`;
CREATE TABLE `rule` (
  `ruleID` int(11) NOT NULL AUTO_INCREMENT,
  `ruleName` varchar(255) DEFAULT NULL,
  `score` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ruleID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "rule"
#

/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "subject"
#

/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'外科学','1'),(2,'内科学','1'),(3,'测试2','2'),(4,'诊断学','1');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;

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
  PRIMARY KEY (`testID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Data for table "test"
#

/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'外科选择题1','1','00:29:00','2019-05-03',NULL),(2,'测试2','1','00:00:00','2019-05-03',NULL),(3,'测试3','1','00:00:00','2019-05-03',NULL),(4,'测试4','1','00:00:00','2019-05-03',NULL),(5,'测试5','1','00:00:00','2019-05-03',NULL),(6,'测试21','2','00:00:00','2019-05-03',NULL),(7,'测试22','2','00:00:00','2019-05-03',NULL),(8,'测试23','2','00:00:00','2019-05-03',NULL),(9,'测试24','2','00:00:00','2019-05-03',NULL),(10,'测试25','2','00:00:00','2019-05-03',NULL),(13,'诊断学选择题','4','00:29:00','2019-05-03',NULL);
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
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "total"
#

/*!40000 ALTER TABLE `total` DISABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#
# Data for table "usermsg"
#

/*!40000 ALTER TABLE `usermsg` DISABLE KEYS */;
INSERT INTO `usermsg` VALUES (4,'18819747163','yy87971892',NULL,'2019-05-03 00:02:33'),(5,'18819747164','yy87971892',NULL,'2019-05-03 00:54:46'),(6,'18819747161','yy87971892',NULL,'2019-05-04 08:39:11'),(7,NULL,NULL,NULL,'2019-05-04 10:38:50'),(8,'18819747166','yy87971892',NULL,'2019-05-04 11:34:47'),(9,'18819747162','yy87971892',NULL,'2019-05-04 11:49:50'),(10,'18819747144','yy87971892',NULL,'2019-05-04 11:59:32'),(11,'13537172996','111111',NULL,'2019-05-04 11:59:56'),(12,'18819747133','yy87971892',NULL,'2019-05-04 12:00:04'),(13,'18819747177','123456',NULL,'2019-05-04 12:01:41');
/*!40000 ALTER TABLE `usermsg` ENABLE KEYS */;
