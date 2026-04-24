-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: pay_yhios_cn
-- ------------------------------------------------------
-- Server version	5.7.44-log

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
-- Table structure for table `fa_admin`
--

DROP TABLE IF EXISTS `fa_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) DEFAULT NULL COMMENT '登录IP',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_admin`
--

LOCK TABLES `fa_admin` WRITE;
/*!40000 ALTER TABLE `fa_admin` DISABLE KEYS */;
INSERT INTO `fa_admin` VALUES (1,'admin','易能签软件源','944215c4a4de395ac16fb0c3337777ac','7iZ9fa','http://pay.yhios.cn/uploads/20260424/43810b6c2a0e2fc30f7184f044391cdd.png','enqapp@icloud.com',0,1777002210,'123.160.191.5',1492186163,1777003574,'e432f29e-984b-45eb-ae0b-52462b1f6638','normal');
/*!40000 ALTER TABLE `fa_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_admin_log`
--

DROP TABLE IF EXISTS `fa_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_admin_log`
--

LOCK TABLES `fa_admin_log` WRITE;
/*!40000 ALTER TABLE `fa_admin_log` DISABLE KEYS */;
INSERT INTO `fa_admin_log` VALUES (6,1,'admin','/FRKToHDckx.php/index/login?url=%2FFRKToHDckx.php','登录','{\"url\":\"\\/FRKToHDckx.php\",\"__token__\":\"056f343fb510f92ab64f8d6866f46182\",\"username\":\"admin\",\"captcha\":\"HUCR\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777002210),(7,1,'admin','/FRKToHDckx.php/auth/rule/del/ids/69','权限管理 菜单规则 删除','{\"action\":\"del\",\"ids\":\"69\",\"params\":\"\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777002235),(8,1,'admin','/FRKToHDckx.php/index/index','','{\"action\":\"refreshmenu\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777002235),(9,1,'admin','/FRKToHDckx.php/auth/rule/add?dialog=1','权限管理 菜单规则 添加','{\"dialog\":\"1\",\"__token__\":\"3703126741723102853b5ff0660eecdc\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"command\",\"title\":\"\\u5728\\u7ebf\\u547d\\u4ee4\\u7ba1\\u7406\",\"icon\":\"fa fa-terminal\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777002354),(10,1,'admin','/FRKToHDckx.php/index/index','','{\"action\":\"refreshmenu\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777002354),(11,1,'admin','/FRKToHDckx.php/command/del/ids/1','在线命令管理','{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777002361),(12,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"90e16f3253aea0bde9b2ade159851ce7\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"http:\\/\\/test.enqapp.com\\/appstore\",\"sourceicon\":\"https:\\/\\/app.admin.com\\/uploads\\/20200920\\/110fa335493e1bb6d157a954952c0a69.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"http:\\/\\/test.enqapp.com\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttps:\\/\\/qnq.nuosike.cn\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777002433),(13,1,'admin','/FRKToHDckx.php/general/config/update','常规管理 系统配置','[]','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777002435),(14,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"822ebd39a430dbe8fab58d73660992c5\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"http:\\/\\/test.enqapp.com\\/appstore\",\"sourceicon\":\"https:\\/\\/app.admin.com\\/uploads\\/20200920\\/110fa335493e1bb6d157a954952c0a69.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"http:\\/\\/test.enqapp.com\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttps:\\/\\/qnq.nuosike.cn\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777002435),(15,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"d3278043c26a5d9eb688f719624be59d\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"http:\\/\\/test.enqapp.com\\/appstore\",\"sourceicon\":\"https:\\/\\/app.admin.com\\/uploads\\/20200920\\/110fa335493e1bb6d157a954952c0a69.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"http:\\/\\/test.enqapp.com\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttps:\\/\\/qnq.nuosike.cn\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777002437),(16,1,'admin','/FRKToHDckx.php/general/config/update','常规管理 系统配置','[]','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777002437),(17,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"2de1b32dc64e52137d31e603de41ce4d\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"http:\\/\\/test.enqapp.com\\/appstore\",\"sourceicon\":\"https:\\/\\/app.admin.com\\/uploads\\/20200920\\/110fa335493e1bb6d157a954952c0a69.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"http:\\/\\/test.enqapp.com\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttps:\\/\\/qnq.nuosike.cn\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777002975),(18,1,'admin','/FRKToHDckx.php/command/get_field_list','在线命令管理','{\"table\":\"fa_admin\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777002978),(19,1,'admin','/FRKToHDckx.php/command/get_field_list','在线命令管理','{\"table\":\"fa_enqapp_news\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777002989),(20,1,'admin','/FRKToHDckx.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_enqapp_news\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777002996),(21,1,'admin','/FRKToHDckx.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_enqapp_news\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"image,image_url\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"switch,notify\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"weigh\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003131),(22,1,'admin','/FRKToHDckx.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_enqapp_news\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"image,image_url\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"switch,notify\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"weigh\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003132),(23,1,'admin','/FRKToHDckx.php/index/index','','{\"action\":\"refreshmenu\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003133),(24,1,'admin','/FRKToHDckx.php/command/get_field_list','在线命令管理','{\"table\":\"fa_admin\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003144),(25,1,'admin','/FRKToHDckx.php/command/command/action/command','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"\",\"action\":\"command\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003163),(26,1,'admin','/FRKToHDckx.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003167),(27,1,'admin','/FRKToHDckx.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003172),(28,1,'admin','/FRKToHDckx.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003174),(29,1,'admin','/FRKToHDckx.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003176),(30,1,'admin','/FRKToHDckx.php/command/command/action/command','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"EnqappNews.php\",\"action\":\"command\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003178),(31,1,'admin','/FRKToHDckx.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"EnqappNews.php\",\"action\":\"execute\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003180),(32,1,'admin','/FRKToHDckx.php/index/index','','{\"action\":\"refreshmenu\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003180),(33,1,'admin','/FRKToHDckx.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"EnqappNews.php\",\"action\":\"execute\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003181),(34,1,'admin','/FRKToHDckx.php/index/index','','{\"action\":\"refreshmenu\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003181),(35,1,'admin','/FRKToHDckx.php/ajax/weigh','','{\"ids\":\"2,6,7,8,3,71,5,10,12,62,63,64,70\",\"changeid\":\"71\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\",\"pk\":\"id\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003498),(36,1,'admin','/FRKToHDckx.php/index/index','','{\"action\":\"refreshmenu\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003498),(37,1,'admin','/FRKToHDckx.php/auth/rule/edit/ids/71?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"__token__\":\"a2c4fc9312b34027145e6bb8127f9300\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"enqapp_news\",\"title\":\"\\u65b0\\u95fb\\u516c\\u544a\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"99\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"71\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003517),(38,1,'admin','/FRKToHDckx.php/index/index','','{\"action\":\"refreshmenu\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003518),(39,1,'admin','/FRKToHDckx.php/auth/rule/edit/ids/3?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"__token__\":\"6b789a755f84421ed0bd7cc53f45a2bc\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"category\",\"title\":\"\\u8f6f\\u4ef6\\u8d44\\u6e90\\u7ba1\\u7406\",\"icon\":\"fa fa-leaf\",\"weigh\":\"119\",\"condition\":\"\",\"remark\":\"Category tips\",\"status\":\"normal\"},\"ids\":\"3\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003533),(40,1,'admin','/FRKToHDckx.php/index/index','','{\"action\":\"refreshmenu\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003533),(41,1,'admin','/FRKToHDckx.php/auth/rule/edit/ids/71?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"__token__\":\"37fc9b45ba0e9e5f3ff7eade7696470c\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"enqapp_news\",\"title\":\"\\u65b0\\u95fb\\u516c\\u544a\\u7ba1\\u7406\",\"icon\":\"fa fa-newspaper-o\",\"weigh\":\"99\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"71\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003546),(42,1,'admin','/FRKToHDckx.php/index/index','','{\"action\":\"refreshmenu\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003546),(43,1,'admin','/FRKToHDckx.php/ajax/upload','','{\"name\":\"1024x1024@ESign.png\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003563),(44,1,'admin','/FRKToHDckx.php/general.profile/update','常规管理 个人资料 更新个人信息','{\"__token__\":\"f6c68ff1a3b2e309b89083e27cb9156f\",\"row\":{\"avatar\":\"http:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"email\":\"enqapp@icloud.com\",\"nickname\":\"\\u6613\\u80fd\\u7b7e\\u8f6f\\u4ef6\\u6e90\",\"password\":\"\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003574),(45,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"2f03d66135df436bfc25e55c240b54b6\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"http:\\/\\/test.enqapp.com\\/appstore\",\"sourceicon\":\"https:\\/\\/app.admin.com\\/uploads\\/20200920\\/110fa335493e1bb6d157a954952c0a69.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"http:\\/\\/test.enqapp.com\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003595),(46,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"33d162b7ebe14a7dcb2fafca342d4434\",\"row\":{\"dylib-control\":\"1\",\"dylib-notice\":\"\\u6211\\u7684UDID\\r\\n\\u3010V-Team-\\u8bbe\\u5907\\u6807\\u8bc6\\u3011\\r\\n\\r\\n\\u5f53\\u524d\\u8f6f\\u4ef6\\u7248\\u672c\\r\\n\\u3010V-Team-\\u5e94\\u7528\\u7248\\u672c\\u3011\\r\\n\\r\\n\\u5f53\\u524d\\u8f6f\\u4ef6\\u540d\\u79f0\\r\\n\\u3010V-Team-\\u5e94\\u7528\\u540d\\u79f0\\u3011\\r\\n\\r\\n\\u5f53\\u524d\\u8f6f\\u4ef6\\u5305ID\\r\\n\\u3010V-Team-\\u5e94\\u7528\\u6807\\u8bc6\\u3011\\r\\n\\r\\n\\u8bc1\\u4e66\\u5230\\u671f\\u65e5\\u671f\\r\\n\\u3010V-Team-\\u8bc1\\u4e66\\u5230\\u671f\\u65e5\\u671f\\u3011\\r\\n\\r\\n\\u8f6f\\u4ef6\\u5b89\\u88c5\\u65e5\\u671f\\r\\n\\u3010V-Team-\\u8f6f\\u4ef6\\u5b89\\u88c5\\u65e5\\u671f\\u3011\",\"dylib-look\":\"\",\"dylib-time\":\"5\",\"dylib-on\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003627),(47,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"b634bd787d817d795993876b30c2e78d\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"http:\\/\\/test.enqapp.com\\/appstore\",\"sourceicon\":\"https:\\/\\/app.admin.com\\/uploads\\/20200920\\/110fa335493e1bb6d157a954952c0a69.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"http:\\/\\/test.enqapp.com\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003648),(48,1,'admin','/FRKToHDckx.php/general/config/check','常规管理 系统配置','{\"row\":{\"name\":\"website\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003875),(49,1,'admin','/FRKToHDckx.php/general.config/add','常规管理 系统配置 添加','{\"__token__\":\"d3ce973be75423aeb3fd48db5d923dfe\",\"row\":{\"type\":\"string\",\"group\":\"basic\",\"name\":\"website\",\"title\":\"\\u8f6f\\u4ef6\\u6e90\\u5b98\\u7f51\",\"value\":\"\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"tip\":\"\\u5b98\\u7f51\\u94fe\\u63a5\",\"rule\":\"url\",\"extend\":\"\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777003903),(50,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"6e7deda9ef410d58a17967875a963023\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"http:\\/\\/test.enqapp.com\\/appstore\",\"sourceicon\":\"https:\\/\\/app.admin.com\\/uploads\\/20200920\\/110fa335493e1bb6d157a954952c0a69.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"http:\\/\\/test.enqapp.com\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777005822),(51,1,'admin','/FRKToHDckx.php/ajax/upload','','{\"name\":\"Esign_extension.png\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777005898),(52,1,'admin','/FRKToHDckx.php/enqapp_news/add?dialog=1','新闻公告管理 添加','{\"dialog\":\"1\",\"row\":{\"title\":\"\\u6211\\u662f\\u516c\\u544a\\u6807\\u9898\",\"identifier\":\"my.enqapp.one\",\"caption\":\"\\u6211\\u662f\\u516c\\u544a\\u8be6\\u7ec6\\u5185\\u5bb9\",\"tint_color\":\"#848ef9\",\"image\":\"http:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/3a8d654b56445fb59538eebe83f3c500.png\",\"url\":\"https:\\/\\/enqapp.com\",\"publish_date\":\"2026-04-24\",\"notify\":\"1\",\"weigh\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777005905),(53,1,'admin','/FRKToHDckx.php/ajax/upload','','{\"name\":\"donate.png\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777006316),(54,1,'admin','/FRKToHDckx.php/enqapp_news/edit/ids/1?dialog=1','新闻公告管理 编辑','{\"dialog\":\"1\",\"row\":{\"title\":\"\\u6211\\u662f\\u516c\\u544a\\u6807\\u9898\",\"identifier\":\"my.enqapp.one\",\"caption\":\"\\u6211\\u662f\\u516c\\u544a\\u8be6\\u7ec6\\u5185\\u5bb9\",\"tint_color\":\"#848ef9\",\"image\":\"http:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/afed8a8491735dfcd8904dc78a31c44e.png\",\"url\":\"https:\\/\\/enqapp.com\",\"publish_date\":\"2026-04-24\",\"notify\":\"1\",\"weigh\":\"1\"},\"ids\":\"1\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777006323),(55,1,'admin','/FRKToHDckx.php/category/edit/ids/1?dialog=1','软件资源管理 编辑','{\"dialog\":\"1\",\"row\":{\"type\":\"default\",\"pid\":\"0\",\"name\":\"\\u5168\\u80fd\\u7b7e\",\"nickname\":\"1.0\",\"image\":\"https:\\/\\/app.nk8686.com\\/uploads\\/20210909\\/8f8b1006441c012ba7770217085dea5f.png\",\"keywords\":\"\\u5168\\u80fd\\u7b7e\\u5b98\\u65b9\\u7248\\u6d4b\\u8bd5\\u6362\\u884c\\u6548\\u679c\\u6d4b\\u8bd5\\u6362\\u884c\\u6548\\u679c\\uff01\",\"weigh\":\"2\",\"bt1a\":\"https:\\/\\/ipawj.nuosike.cn\\/qnq\\/\\u5168\\u80fd\\u7b7e.ipa\",\"flag\":\"0\",\"bt1b\":\"\",\"bt2a\":\"0\",\"bt2b\":\"0\",\"beizhu\":\"\",\"status\":\"normal\",\"modify\":\"1\"},\"ids\":\"1\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777006344),(56,1,'admin','/FRKToHDckx.php/category/edit/ids/1?dialog=1','软件资源管理 编辑','{\"dialog\":\"1\",\"row\":{\"type\":\"default\",\"pid\":\"0\",\"name\":\"\\u5168\\u80fd\\u7b7e\",\"nickname\":\"1.0\",\"image\":\"https:\\/\\/app.nk8686.com\\/uploads\\/20210909\\/8f8b1006441c012ba7770217085dea5f.png\",\"keywords\":\"\\u6613\\u80fd\\u7b7e\\u5b98\\u65b9\\u7248\\\\n\\u6d4b\\u8bd5\\u6362\\u884c\\u6548\\u679c\\u6d4b\\u8bd5\\u6362\\u884c\\u6548\\u679c\\uff01\",\"weigh\":\"2\",\"bt1a\":\"https:\\/\\/enqapp.com\\/enq.ipa\",\"flag\":\"0\",\"bt1b\":\"\",\"bt2a\":\"0\",\"bt2b\":\"0\",\"beizhu\":\"\",\"status\":\"normal\",\"modify\":\"1\"},\"ids\":\"1\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777006494),(57,1,'admin','/FRKToHDckx.php/category/edit/ids/1?dialog=1','软件资源管理 编辑','{\"dialog\":\"1\",\"row\":{\"type\":\"default\",\"pid\":\"0\",\"name\":\"\\u5168\\u80fd\\u7b7e\",\"nickname\":\"1.0\",\"image\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"keywords\":\"\\u6613\\u80fd\\u7b7e\\u5b98\\u65b9\\u7248\\\\n\\u6d4b\\u8bd5\\u6362\\u884c\\u6548\\u679c\\u6d4b\\u8bd5\\u6362\\u884c\\u6548\\u679c\\uff01\",\"weigh\":\"2\",\"bt1a\":\"https:\\/\\/enqapp.com\\/enq.ipa\",\"flag\":\"0\",\"bt1b\":\"\",\"bt2a\":\"0\",\"bt2b\":\"0\",\"beizhu\":\"\",\"status\":\"normal\",\"modify\":\"1\"},\"ids\":\"1\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777006512),(58,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"bc5a272a0d66f5a19c9f4b1b988f2eb1\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"http:\\/\\/test.enqapp.com\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"http:\\/\\/test.enqapp.com\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777006529),(59,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"93b9e9c7f7881286f52f8201219eeae2\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"http:\\/\\/test.enqapp.com\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"http:\\/\\/test.enqapp.com\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777006562),(60,1,'admin','/FRKToHDckx.php/category/edit/ids/1?dialog=1','软件资源管理 编辑','{\"dialog\":\"1\",\"row\":{\"type\":\"default\",\"pid\":\"0\",\"name\":\"\\u5168\\u80fd\\u7b7e\",\"nickname\":\"1.0\",\"image\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"keywords\":\"\\u6613\\u80fd\\u7b7e\\u5b98\\u65b9\\u7248\\\\n\\u6d4b\\u8bd5\\u6362\\u884c\\u6548\\u679c\\u6d4b\\u8bd5\\u6362\\u884c\\u6548\\u679c\\uff01\",\"weigh\":\"2\",\"bt1a\":\"https:\\/\\/enqapp.com\\/enq.ipa\",\"flag\":\"0\",\"bt1b\":\"\",\"bt2a\":\"0\",\"bt2b\":\"1\",\"beizhu\":\"\",\"status\":\"normal\",\"modify\":\"1\"},\"ids\":\"1\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777006610),(61,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"84c8b9a3d0c23fd039e455b5499e77ac\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"http:\\/\\/pay.enqapp.com\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"http:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777006661),(62,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"ef0d52e7f0d5e93a8054c0eb4b6f476b\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"http:\\/\\/pay.enqapp.com\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777006687),(63,1,'admin','/FRKToHDckx.php/kami/add?dialog=1','卡密管理','{\"dialog\":\"1\",\"row\":{\"kami\":\"1\",\"udid\":\"\",\"Kmyp\":\"4\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777006702),(64,1,'admin','/FRKToHDckx.php/kami/del/ids/1','卡密管理','{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777006720),(65,1,'admin','/FRKToHDckx.php/category/edit/ids/1?dialog=1','软件资源管理 编辑','{\"dialog\":\"1\",\"row\":{\"type\":\"default\",\"pid\":\"0\",\"name\":\"\\u5168\\u80fd\\u7b7e\",\"nickname\":\"1.0\",\"image\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"keywords\":\"\\u6613\\u80fd\\u7b7e\\u5b98\\u65b9\\u7248\\\\n\\u6d4b\\u8bd5\\u6362\\u884c\\u6548\\u679c\\u6d4b\\u8bd5\\u6362\\u884c\\u6548\\u679c\\uff01\",\"weigh\":\"2\",\"bt1a\":\"https:\\/\\/enqapp.com\\/enq.ipa\",\"flag\":\"0\",\"bt1b\":\"\",\"bt2a\":\"0\",\"bt2b\":\"0\",\"beizhu\":\"\",\"status\":\"normal\",\"modify\":\"1\"},\"ids\":\"1\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777006735),(66,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"588b1ec68d0aca645817d15c6a47910a\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"http:\\/\\/pay.enqapp.com\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777006780),(67,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"d6a3320aa7487b509fdbf5d607a5a327\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"http:\\/\\/pay.enqapp.com\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"1\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777006949),(68,1,'admin','/FRKToHDckx.php/general/config/check','常规管理 系统配置','{\"row\":{\"name\":\"weblist\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777007065),(69,1,'admin','/FRKToHDckx.php/general.config/add','常规管理 系统配置 添加','{\"__token__\":\"67ee545b911c96fc8ad05488e5f149d6\",\"row\":{\"type\":\"switch\",\"group\":\"basic\",\"name\":\"weblist\",\"title\":\"app\\u9884\\u89c8\",\"value\":\"0\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"tip\":\"\\u5f00\\u542f\\u540e\\u8bbf\\u95ee\\u6e90\\u5730\\u5740\\u5c06\\u663e\\u793aapp\\u9884\\u89c8\\u9875\",\"rule\":\"\",\"extend\":\"\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777007200),(70,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"80461b3834bde5cb16e2d5ba19c9477a\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"http:\\/\\/pay.enqapp.com\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"1\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"1\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777007294),(71,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"3e5905d1551c177be3911ee9e222e8c2\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"1\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"1\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777008048),(72,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"a574423713a2361f49010484ba9f3974\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"1\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"1\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777008530),(73,1,'admin','/FRKToHDckx.php/general/config/del','常规管理 系统配置 删除','{\"name\":\"dylib-control\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777008602),(74,1,'admin','/FRKToHDckx.php/general/config/del','常规管理 系统配置 删除','{\"name\":\"dylib-notice\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777008604),(75,1,'admin','/FRKToHDckx.php/general/config/del','常规管理 系统配置 删除','{\"name\":\"dylib-look\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777008607),(76,1,'admin','/FRKToHDckx.php/general/config/del','常规管理 系统配置 删除','{\"name\":\"dylib-time\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777008609),(77,1,'admin','/FRKToHDckx.php/general/config/del','常规管理 系统配置 删除','{\"name\":\"dylib-on\"}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777008612),(78,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"be0b437b50b092e4fd1e7c0871c34b83\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"1\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"1\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777008617),(79,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"23a3a6b0236e028b7786fd7db986da52\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"1\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"1\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777008629),(80,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"b2581c51836ae867ec97f701a2eb2785\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777009836),(81,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"1847850355a555643ac02944e7ab6ace\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777010244),(82,1,'admin','/FRKToHDckx.php/general/config/update','常规管理 系统配置','[]','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777010245),(83,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"c5385270e00dea7c60faf741721cd278\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777010644),(84,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"eddd5815dac9f59a38b64f0768eb709a\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777010645),(85,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"138493053cd68399ff9ea48495291349\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777010649),(86,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"9b198a5f80af94fe22e55e374984a672\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777010650),(87,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"b850a0576d3718f9200d92ba35baf122\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777010650),(88,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"bdcc891cb2eac7cfdeaded0bcef75741\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777010651),(89,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"dd2c7565f7271d45e32b2aa7980a2315\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777010651),(90,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"d7fbfcc3ddd63349cfbb0bef6e640b5c\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777010651),(91,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"4b89f90de5dacdbc92e9e75b0d54d65d\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777010651),(92,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"2132fb5b2147cf83a4eb650ccbfb6bcb\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777010651),(93,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"c8d3cd68004fca9a11c032e3d32a180c\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777010652),(94,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"7aec47c0ae20c0d1bda2c4328189db72\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777010652),(95,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"0fb210e97d6d72827070b7eed9166932\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777010652),(96,1,'admin','/FRKToHDckx.php/general.config/edit','常规管理 系统配置 编辑','{\"__token__\":\"6572e6d8011c45249b0770728bda5660\",\"row\":{\"name\":\"\\u7b7e\\u540d\\u5de5\\u5177\\u8f6f\\u4ef6\\u6e90\",\"version\":\"1.0.8\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{}\",\"fixedpage\":\"category\",\"sourceURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"sourceicon\":\"https:\\/\\/pay.yhios.cn\\/uploads\\/20260424\\/43810b6c2a0e2fc30f7184f044391cdd.png\",\"payURL\":\"https:\\/\\/www.baidu.com\",\"unlockURL\":\"https:\\/\\/pay.yhios.cn\\/appstore\",\"identifier\":\"\\u586b\\u4f60\\u60f3\\u586b\\u7684\",\"message\":\"\\u8f6f\\u4ef6\\u6765\\u6e90\\uff1a\\u586b\\u5199\\u8f6f\\u4ef6\\u6e90\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u53d1\\u5361\\u5730\\u5740\\uff1a\\u586b\\u5199\\u7528\\u6237\\u8d2d\\u4e70\\u5361\\u5bc6\\u7684\\u53d1\\u5361\\u5730\\u5740\\r\\n\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\uff1a\\u5982\\u7528\\u672c\\u6e90\\u751f\\u6210\\u5361\\u5bc6\\uff0c\\u5219\\u89e3\\u9501\\u63a5\\u53e3\\u5730\\u5740\\u5c31\\u586b\\u5199\\u6e90\\u5730\\u5740\\r\\n\\u4f8b\\u5982\\uff1ahttp:\\/\\/test.enqapp.com\\/appstore\\r\\n\\u6e90\\u8bc6\\u522b\\u6807\\u7b26\\uff1a\\u968f\\u610f\\u586b\\u5199\\uff0c\\u4e5f\\u53ef\\u586b\\u5199\\u6e90\\u5730\\u5740\",\"opencry\":\"0\",\"openblack\":\"0\",\"openblack2\":\"0\",\"website\":\"https:\\/\\/enqapp.com\",\"weblist\":\"0\"}}','123.160.191.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15',1777010652);
/*!40000 ALTER TABLE `fa_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_attachment`
--

DROP TABLE IF EXISTS `fa_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `urls` text COMMENT '网址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_attachment`
--

LOCK TABLES `fa_attachment` WRITE;
/*!40000 ALTER TABLE `fa_attachment` DISABLE KEYS */;
INSERT INTO `fa_attachment` VALUES (1,1,0,'/uploads/20260424/43810b6c2a0e2fc30f7184f044391cdd.png','1024','1024','png',0,48238,'image/png','{\"name\":\"1024x1024@ESign.png\"}',1777003563,1777003563,1777003563,'local','fbf6a63da54fd49846b2fe2db88fcb5214d5be4c',NULL),(2,1,0,'/uploads/20260424/3a8d654b56445fb59538eebe83f3c500.png','256','256','png',0,16691,'image/png','{\"name\":\"Esign_extension.png\"}',1777005898,1777005898,1777005898,'local','e363e971bf0045617548c8b77fc53d7d2f2b8153',NULL),(3,1,0,'/uploads/20260424/afed8a8491735dfcd8904dc78a31c44e.png','1280','720','png',0,111944,'image/png','{\"name\":\"donate.png\"}',1777006316,1777006316,1777006316,'local','b49b8a6343cd1fb7c71e797fa582c1091a7f3c1e',NULL);
/*!40000 ALTER TABLE `fa_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_auth_group`
--

DROP TABLE IF EXISTS `fa_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_auth_group`
--

LOCK TABLES `fa_auth_group` WRITE;
/*!40000 ALTER TABLE `fa_auth_group` DISABLE KEYS */;
INSERT INTO `fa_auth_group` VALUES (1,0,'Admin group','*',1490883540,149088354,'normal'),(2,1,'Second group','13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5',1490883540,1505465692,'normal'),(3,2,'Third group','1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5',1490883540,1502205322,'normal'),(4,1,'Second group 2','1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65',1490883540,1502205350,'normal'),(5,2,'Third group 2','1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34',1490883540,1502205344,'normal');
/*!40000 ALTER TABLE `fa_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_auth_group_access`
--

DROP TABLE IF EXISTS `fa_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权限分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_auth_group_access`
--

LOCK TABLES `fa_auth_group_access` WRITE;
/*!40000 ALTER TABLE `fa_auth_group_access` DISABLE KEYS */;
INSERT INTO `fa_auth_group_access` VALUES (1,1);
/*!40000 ALTER TABLE `fa_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_auth_rule`
--

DROP TABLE IF EXISTS `fa_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `weigh` (`weigh`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_auth_rule`
--

LOCK TABLES `fa_auth_rule` WRITE;
/*!40000 ALTER TABLE `fa_auth_rule` DISABLE KEYS */;
INSERT INTO `fa_auth_rule` VALUES (2,'file',0,'general','General','fa fa-cogs','','',1,1497429920,1497430169,137,'normal'),(3,'file',0,'category','软件资源管理','fa fa-leaf','','Category tips',1,1497429920,1777003533,119,'normal'),(5,'file',0,'auth','Auth','fa fa-group','','',1,1497429920,1497430092,88,'normal'),(6,'file',2,'general/config','Config','fa fa-cog','','Config tips',1,1497429920,1497430683,60,'normal'),(7,'file',2,'general/attachment','资源管理','fa fa-file-image-o','','Attachment tips',1,1497429920,1584453833,53,'normal'),(8,'file',2,'general/profile','Profile','fa fa-user','','',1,1497429920,1497429920,34,'normal'),(10,'file',5,'auth/adminlog','Admin log','fa fa-list-alt','','Admin log tips',1,1497429920,1497430307,113,'normal'),(12,'file',5,'auth/rule','Rule','fa fa-bars','','Rule tips',1,1497429920,1497430581,104,'normal'),(18,'file',6,'general/config/index','View','fa fa-circle-o','','',0,1497429920,1497429920,52,'normal'),(19,'file',6,'general/config/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,51,'normal'),(20,'file',6,'general/config/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,50,'normal'),(21,'file',6,'general/config/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,49,'normal'),(22,'file',6,'general/config/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,48,'normal'),(23,'file',7,'general/attachment/index','View','fa fa-circle-o','','Attachment tips',0,1497429920,1497429920,59,'normal'),(24,'file',7,'general/attachment/select','Select attachment','fa fa-circle-o','','',0,1497429920,1497429920,58,'normal'),(25,'file',7,'general/attachment/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,57,'normal'),(26,'file',7,'general/attachment/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,56,'normal'),(27,'file',7,'general/attachment/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,55,'normal'),(28,'file',7,'general/attachment/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,54,'normal'),(29,'file',8,'general/profile/index','View','fa fa-circle-o','','',0,1497429920,1497429920,33,'normal'),(30,'file',8,'general/profile/update','Update profile','fa fa-circle-o','','',0,1497429920,1497429920,32,'normal'),(31,'file',8,'general/profile/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,31,'normal'),(32,'file',8,'general/profile/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,30,'normal'),(33,'file',8,'general/profile/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,29,'normal'),(34,'file',8,'general/profile/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,28,'normal'),(35,'file',3,'category/index','View','fa fa-circle-o','','Category tips',0,1497429920,1497429920,142,'normal'),(36,'file',3,'category/add','Add','fa fa-circle-o','','',0,1497429920,1584731367,141,'normal'),(37,'file',3,'category/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,140,'normal'),(38,'file',3,'category/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,139,'normal'),(39,'file',3,'category/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,138,'normal'),(44,'file',10,'auth/adminlog/index','View','fa fa-circle-o','','Admin log tips',0,1497429920,1497429920,112,'normal'),(45,'file',10,'auth/adminlog/detail','Detail','fa fa-circle-o','','',0,1497429920,1497429920,111,'normal'),(46,'file',10,'auth/adminlog/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,110,'normal'),(51,'file',12,'auth/rule/index','View','fa fa-circle-o','','Rule tips',0,1497429920,1497429920,103,'normal'),(52,'file',12,'auth/rule/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,102,'normal'),(53,'file',12,'auth/rule/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,101,'normal'),(54,'file',12,'auth/rule/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,100,'normal'),(62,'file',0,'kami','卡密管理','fa fa-cc-discover','','',1,1611327511,1611327511,0,'normal'),(63,'file',0,'black','UDID黑名单','fa fa-bomb','','',1,1648882931,1648882931,0,'normal'),(64,'file',0,'monitor','UDID异常监控','fa fa-tv','','',1,1651631797,1651631797,0,'normal'),(70,'file',0,'command','在线命令管理','fa fa-terminal','','',1,1777002354,1777002354,0,'normal'),(71,'file',0,'enqapp_news','新闻公告管理','fa fa-newspaper-o','','',1,1777003180,1777003546,99,'normal'),(72,'file',71,'enqapp_news/index','查看','fa fa-circle-o','','',0,1777003180,1777003181,0,'normal'),(73,'file',71,'enqapp_news/recyclebin','回收站','fa fa-circle-o','','',0,1777003180,1777003181,0,'normal'),(74,'file',71,'enqapp_news/add','添加','fa fa-circle-o','','',0,1777003180,1777003181,0,'normal'),(75,'file',71,'enqapp_news/edit','编辑','fa fa-circle-o','','',0,1777003180,1777003181,0,'normal'),(76,'file',71,'enqapp_news/del','删除','fa fa-circle-o','','',0,1777003180,1777003181,0,'normal'),(77,'file',71,'enqapp_news/destroy','真实删除','fa fa-circle-o','','',0,1777003180,1777003181,0,'normal'),(78,'file',71,'enqapp_news/restore','还原','fa fa-circle-o','','',0,1777003180,1777003181,0,'normal'),(79,'file',71,'enqapp_news/multi','批量更新','fa fa-circle-o','','',0,1777003180,1777003181,0,'normal');
/*!40000 ALTER TABLE `fa_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_black`
--

DROP TABLE IF EXISTS `fa_black`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_black` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `udid` varchar(128) DEFAULT NULL COMMENT '设备码',
  `addtime` int(11) NOT NULL COMMENT '生成时间',
  `usetime` int(11) NOT NULL COMMENT '使用时间',
  `endtime` int(11) NOT NULL COMMENT '到期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_black`
--

LOCK TABLES `fa_black` WRITE;
/*!40000 ALTER TABLE `fa_black` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_black` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_category`
--

DROP TABLE IF EXISTS `fa_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  `bt1a` varchar(255) DEFAULT NULL,
  `bt1b` varchar(255) DEFAULT '018084',
  `bt2a` varchar(255) DEFAULT NULL,
  `bt2b` varchar(255) DEFAULT NULL,
  `beizhu` varchar(256) DEFAULT NULL,
  `flag2` varchar(255) DEFAULT NULL,
  `cs` int(11) DEFAULT '0',
  `cstime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `weigh` (`weigh`,`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_category`
--

LOCK TABLES `fa_category` WRITE;
/*!40000 ALTER TABLE `fa_category` DISABLE KEYS */;
INSERT INTO `fa_category` VALUES (1,0,'default','易能签','1.0','0','https://pay.yhios.cn/uploads/20260424/43810b6c2a0e2fc30f7184f044391cdd.png','易能签官方版\\n测试换行效果测试换行效果！','','',1652257075,1652520168,2,'normal','https://enqapp.com/enq.ipa','','0','0','',NULL,0,NULL);
/*!40000 ALTER TABLE `fa_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_command`
--

DROP TABLE IF EXISTS `fa_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_command` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型',
  `params` varchar(1500) NOT NULL DEFAULT '' COMMENT '参数',
  `command` varchar(1500) NOT NULL DEFAULT '' COMMENT '命令',
  `content` text COMMENT '返回结果',
  `executetime` int(10) unsigned DEFAULT NULL COMMENT '执行时间',
  `createtime` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `status` enum('successed','failured') NOT NULL DEFAULT 'failured' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='在线命令表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_command`
--

LOCK TABLES `fa_command` WRITE;
/*!40000 ALTER TABLE `fa_command` DISABLE KEYS */;
INSERT INTO `fa_command` VALUES (2,'crud','[\"--force=1\",\"--table=fa_enqapp_news\",\"--imagefield=image\",\"--imagefield=image_url\",\"--switchsuffix=switch\",\"--switchsuffix=notify\",\"--sortfield=weigh\"]','php think crud --force=1 --table=fa_enqapp_news --imagefield=image --imagefield=image_url --switchsuffix=switch --switchsuffix=notify --sortfield=weigh','Build Successed',1777003132,1777003132,1777003132,'successed'),(3,'menu','[\"--controller=EnqappNews\"]','php think menu --controller=EnqappNews','Build Successed!',1777003180,1777003180,1777003180,'successed'),(4,'menu','[\"--controller=EnqappNews\"]','php think menu --controller=EnqappNews','Build Successed!',1777003181,1777003181,1777003181,'successed');
/*!40000 ALTER TABLE `fa_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_config`
--

DROP TABLE IF EXISTS `fa_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '变量值',
  `content` text CHARACTER SET utf8 NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='系统配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_config`
--

LOCK TABLES `fa_config` WRITE;
/*!40000 ALTER TABLE `fa_config` DISABLE KEYS */;
INSERT INTO `fa_config` VALUES (2,'name','basic','Site name','请填写站点名称','string','签名工具软件源','','required',''),(4,'version','basic','Version','如果静态资源有变动请重新配置该值','string','1.0.8','','required',''),(5,'timezone','basic','Timezone','','string','Asia/Shanghai','','required',''),(6,'forbiddenip','basic','Forbidden ip','一行一条记录','text','','','',''),(7,'languages','basic','Languages','','array','{}','','required',''),(8,'fixedpage','basic','Fixed page','请尽量输入左侧菜单栏存在的链接','string','category','','required',''),(9,'categorytype','dictionary','Category type','','array','{\"default\":\"default\",\"1\":\"应用\",\"2\":\"游戏\",\"3\":\"影音\",\"4\":\"工具\",\"5\":\"插件\"}','','',''),(10,'configgroup','dictionary','Config group','','array','{\"basic\":\"Basic\",\"uinfo\":\"Uinfo\"}','','',''),(11,'mail_type','email','Mail type','选择邮件发送方式','select','1','[\"Please select\",\"SMTP\",\"Mail\"]','',''),(12,'mail_smtp_host','email','Mail smtp host','错误的配置发送邮件会导致服务器超时','string','smtp.qq.com','','',''),(13,'mail_smtp_port','email','Mail smtp port','(不加密默认25,SSL默认465,TLS默认587)','string','465','','',''),(14,'mail_smtp_user','email','Mail smtp user','（填写完整用户名）','string','10000','','',''),(15,'mail_smtp_pass','email','Mail smtp password','（填写您的密码）','string','password','','',''),(16,'mail_verify_type','email','Mail vertify type','（SMTP验证方式[推荐SSL]）','select','2','[\"None\",\"TLS\",\"SSL\"]','',''),(17,'mail_from','email','Mail from','','string','10000@qq.com','','',''),(44,'sourceURL','basic','软件来源','软件来源地址','string','https://pay.yhios.cn/appstore','','url',''),(46,'sourceicon','basic','源图标','请输入源图标地址','string','https://pay.yhios.cn/uploads/20260424/43810b6c2a0e2fc30f7184f044391cdd.png','','url',''),(55,'payURL','basic','解锁发卡地址','此处填写发卡地址！','string','https://www.baidu.com','','url',''),(56,'unlockURL','basic','解锁接口地址','如用本后台卡密验证请直接填写软件源地址！','string','https://pay.yhios.cn/appstore','','url',''),(57,'identifier','basic','源识别标符','源识别标符','string','填你想填的','','',''),(58,'message','basic','软件源公告板','此处填写软件源公告！','text','软件来源：填写软件源地址\r\n解锁发卡地址：填写用户购买卡密的发卡地址\r\n解锁接口地址：如用本源生成卡密，则解锁接口地址就填写源地址\r\n例如：http://test.enqapp.com/appstore\r\n源识别标符：随意填写，也可填写源地址','','',''),(60,'encrypt','sc','加密','加密','string','U2FsdGVkX19pkTKctpmkYaO3dv7QAxsIQcaegYpTo24=','','',''),(61,'opencry','basic','软件源加密','开启加密','switch','0','','',''),(62,'openblack','basic','自动拉黑添加者','自动拉黑','switch','0','','',''),(63,'openblack2','basic','自动拉黑破解者','自动拉黑','switch','0','','',''),(76,'website','basic','软件源官网','官网链接','string','https://enqapp.com','','url',''),(77,'weblist','basic','app预览','开启后访问源地址将显示app预览页','switch','0','','','');
/*!40000 ALTER TABLE `fa_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_ems`
--

DROP TABLE IF EXISTS `fa_ems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='邮箱验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_ems`
--

LOCK TABLES `fa_ems` WRITE;
/*!40000 ALTER TABLE `fa_ems` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_ems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_enqapp_news`
--

DROP TABLE IF EXISTS `fa_enqapp_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_enqapp_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `identifier` varchar(100) NOT NULL DEFAULT '' COMMENT '唯一标识符',
  `caption` text COMMENT '描述内容',
  `tint_color` varchar(20) DEFAULT '#848ef9' COMMENT '主题颜色',
  `image` varchar(255) DEFAULT '' COMMENT '图片',
  `url` varchar(255) DEFAULT '' COMMENT '跳转链接',
  `publish_date` date DEFAULT NULL COMMENT '发布日期',
  `notify` tinyint(1) DEFAULT '0' COMMENT '是否通知:0=否,1=是',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(11) NOT NULL DEFAULT '0' COMMENT '权重',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='易能签新闻公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_enqapp_news`
--

LOCK TABLES `fa_enqapp_news` WRITE;
/*!40000 ALTER TABLE `fa_enqapp_news` DISABLE KEYS */;
INSERT INTO `fa_enqapp_news` VALUES (1,'我是公告标题','my.enqapp.one','我是公告详细内容','#848ef9','http://pay.yhios.cn/uploads/20260424/afed8a8491735dfcd8904dc78a31c44e.png','https://enqapp.com','2026-04-24',1,1777005905,1777006323,NULL,1);
/*!40000 ALTER TABLE `fa_enqapp_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_kami`
--

DROP TABLE IF EXISTS `fa_kami`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_kami` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `kami` varchar(128) NOT NULL COMMENT '卡密',
  `udid` varchar(128) DEFAULT NULL COMMENT '设备码',
  `jh` int(1) NOT NULL DEFAULT '0' COMMENT '是否激活',
  `addtime` int(11) NOT NULL COMMENT '生成时间',
  `usetime` int(11) NOT NULL COMMENT '使用时间',
  `endtime` int(11) NOT NULL COMMENT '到期时间',
  `kmyp` int(9) NOT NULL COMMENT '卡密类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_kami`
--

LOCK TABLES `fa_kami` WRITE;
/*!40000 ALTER TABLE `fa_kami` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_kami` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_kmstr`
--

DROP TABLE IF EXISTS `fa_kmstr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_kmstr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kmstr` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_kmstr`
--

LOCK TABLES `fa_kmstr` WRITE;
/*!40000 ALTER TABLE `fa_kmstr` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_kmstr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_monitor`
--

DROP TABLE IF EXISTS `fa_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_monitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `udid` varchar(255) NOT NULL,
  `identity` varchar(255) NOT NULL,
  `count` varchar(255) NOT NULL,
  `addtime` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_monitor`
--

LOCK TABLES `fa_monitor` WRITE;
/*!40000 ALTER TABLE `fa_monitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_monitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_sms`
--

DROP TABLE IF EXISTS `fa_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='短信验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_sms`
--

LOCK TABLES `fa_sms` WRITE;
/*!40000 ALTER TABLE `fa_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_test`
--

DROP TABLE IF EXISTS `fa_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '省市',
  `json` varchar(255) DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='测试表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_test`
--

LOCK TABLES `fa_test` WRITE;
/*!40000 ALTER TABLE `fa_test` DISABLE KEYS */;
INSERT INTO `fa_test` VALUES (1,0,12,'12,13','monday','hot,index','male','music,reading','我是一篇测试文章','<p>我是测试内容</p>','/assets/img/avatar.png','/assets/img/avatar.png,/assets/img/qrcode.png','/assets/img/avatar.png','关键字','描述','广西壮族自治区/百色市/平果县','{\"a\":\"1\",\"b\":\"2\"}',0.00,0,'2017-07-10','2017-07-10 18:24:45',2017,'18:24:45',1499682285,1499682526,1499682526,NULL,0,1,'normal','1');
/*!40000 ALTER TABLE `fa_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_user`
--

DROP TABLE IF EXISTS `fa_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) NOT NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) NOT NULL DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `email` (`email`) USING BTREE,
  KEY `mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_user`
--

LOCK TABLES `fa_user` WRITE;
/*!40000 ALTER TABLE `fa_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_user_group`
--

DROP TABLE IF EXISTS `fa_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '组名',
  `rules` text COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_user_group`
--

LOCK TABLES `fa_user_group` WRITE;
/*!40000 ALTER TABLE `fa_user_group` DISABLE KEYS */;
INSERT INTO `fa_user_group` VALUES (1,'默认组','1,2,3,4,5,6,7,8,9,10,11,12',1515386468,1516168298,'normal');
/*!40000 ALTER TABLE `fa_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_user_money_log`
--

DROP TABLE IF EXISTS `fa_user_money_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_user_money_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员余额变动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_user_money_log`
--

LOCK TABLES `fa_user_money_log` WRITE;
/*!40000 ALTER TABLE `fa_user_money_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_user_money_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_user_rule`
--

DROP TABLE IF EXISTS `fa_user_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_user_rule`
--

LOCK TABLES `fa_user_rule` WRITE;
/*!40000 ALTER TABLE `fa_user_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_user_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_user_score_log`
--

DROP TABLE IF EXISTS `fa_user_score_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_user_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员积分变动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_user_score_log`
--

LOCK TABLES `fa_user_score_log` WRITE;
/*!40000 ALTER TABLE `fa_user_score_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_user_score_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_user_token`
--

DROP TABLE IF EXISTS `fa_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_user_token` (
  `token` varchar(50) NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员Token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_user_token`
--

LOCK TABLES `fa_user_token` WRITE;
/*!40000 ALTER TABLE `fa_user_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pay_yhios_cn'
--

--
-- Dumping routines for database 'pay_yhios_cn'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-24 14:06:57
