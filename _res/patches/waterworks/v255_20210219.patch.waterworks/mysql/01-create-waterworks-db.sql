-- MySQL dump 10.13  Distrib 5.5.59, for Win64 (AMD64)
--
-- Host: localhost    Database: waterworks
-- ------------------------------------------------------
-- Server version	5.5.59

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
-- Current Database: `waterworks`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `waterworks` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `waterworks`;

--
-- Table structure for table `sys_email_template`
--

DROP TABLE IF EXISTS `sys_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_email_template` (
  `objid` varchar(50) NOT NULL,
  `message` mediumtext,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_email_template`
--

LOCK TABLES `sys_email_template` WRITE;
/*!40000 ALTER TABLE `sys_email_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule`
--

DROP TABLE IF EXISTS `sys_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `ruleset` varchar(50) NOT NULL,
  `rulegroup` varchar(50) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `description` longtext,
  `salience` int(11) DEFAULT NULL,
  `effectivefrom` date DEFAULT NULL,
  `effectiveto` date DEFAULT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `user_objid` varchar(50) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `noloop` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_rulegroup_ruleset` (`rulegroup`,`ruleset`) USING BTREE,
  KEY `ix_ruleset` (`ruleset`) USING BTREE,
  CONSTRAINT `fk_sys_rule_rulegroup_ruleset` FOREIGN KEY (`rulegroup`, `ruleset`) REFERENCES `sys_rulegroup` (`name`, `ruleset`),
  CONSTRAINT `fk_sys_rule_ruleset` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule`
--

LOCK TABLES `sys_rule` WRITE;
/*!40000 ALTER TABLE `sys_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_action`
--

DROP TABLE IF EXISTS `sys_rule_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_action` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `actiondef_objid` varchar(50) DEFAULT NULL,
  `actiondef_name` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_parentid` (`parentid`) USING BTREE,
  KEY `ix_actiondef_objid` (`actiondef_objid`) USING BTREE,
  CONSTRAINT `fk_sys_rule_action_actiondef_objid` FOREIGN KEY (`actiondef_objid`) REFERENCES `sys_rule_actiondef` (`objid`),
  CONSTRAINT `fk_sys_rule_action_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_action`
--

LOCK TABLES `sys_rule_action` WRITE;
/*!40000 ALTER TABLE `sys_rule_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_action_param`
--

DROP TABLE IF EXISTS `sys_rule_action_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_action_param` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `actiondefparam_objid` varchar(100) DEFAULT NULL,
  `stringvalue` varchar(255) DEFAULT NULL,
  `booleanvalue` int(11) DEFAULT NULL,
  `var_objid` varchar(50) DEFAULT NULL,
  `var_name` varchar(50) DEFAULT NULL,
  `expr` longtext,
  `exprtype` varchar(25) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `obj_key` varchar(50) DEFAULT NULL,
  `obj_value` varchar(255) DEFAULT NULL,
  `listvalue` longtext,
  `lov` varchar(50) DEFAULT NULL,
  `rangeoption` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_parentid` (`parentid`) USING BTREE,
  KEY `ix_var_objid` (`var_objid`) USING BTREE,
  KEY `ix_actiondefparam_objid` (`actiondefparam_objid`) USING BTREE,
  CONSTRAINT `fk_sys_rule_action_param_actiondefparam_objid` FOREIGN KEY (`actiondefparam_objid`) REFERENCES `sys_rule_actiondef_param` (`objid`),
  CONSTRAINT `fk_sys_rule_action_param_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_action` (`objid`),
  CONSTRAINT `fk_sys_rule_action_param_var_objid` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_action_param`
--

LOCK TABLES `sys_rule_action_param` WRITE;
/*!40000 ALTER TABLE `sys_rule_action_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_action_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_actiondef`
--

DROP TABLE IF EXISTS `sys_rule_actiondef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_actiondef` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `actionname` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `actionclass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_actiondef`
--

LOCK TABLES `sys_rule_actiondef` WRITE;
/*!40000 ALTER TABLE `sys_rule_actiondef` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_actiondef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_actiondef_param`
--

DROP TABLE IF EXISTS `sys_rule_actiondef_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_actiondef_param` (
  `objid` varchar(100) NOT NULL DEFAULT '',
  `parentid` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `vardatatype` varchar(50) DEFAULT NULL,
  `lovname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_parentid` (`parentid`) USING BTREE,
  CONSTRAINT `fk_sys_rule_actiondef_param_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_actiondef` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_actiondef_param`
--

LOCK TABLES `sys_rule_actiondef_param` WRITE;
/*!40000 ALTER TABLE `sys_rule_actiondef_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_actiondef_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_condition`
--

DROP TABLE IF EXISTS `sys_rule_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `fact_name` varchar(50) DEFAULT NULL,
  `fact_objid` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `ruletext` longtext,
  `displaytext` longtext,
  `dynamic_datatype` varchar(50) DEFAULT NULL,
  `dynamic_key` varchar(50) DEFAULT NULL,
  `dynamic_value` varchar(50) DEFAULT NULL,
  `notexist` int(11) NOT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_fact_objid` (`fact_objid`) USING BTREE,
  KEY `ix_parentid` (`parentid`) USING BTREE,
  CONSTRAINT `fk_sys_rule_condition_fact_objid` FOREIGN KEY (`fact_objid`) REFERENCES `sys_rule_fact` (`objid`),
  CONSTRAINT `fk_sys_rule_condition_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_condition`
--

LOCK TABLES `sys_rule_condition` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_condition_constraint`
--

DROP TABLE IF EXISTS `sys_rule_condition_constraint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition_constraint` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `field_objid` varchar(100) DEFAULT NULL,
  `fieldname` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `operator_caption` varchar(50) DEFAULT NULL,
  `operator_symbol` varchar(50) DEFAULT NULL,
  `usevar` int(11) DEFAULT NULL,
  `var_objid` varchar(50) DEFAULT NULL,
  `var_name` varchar(50) DEFAULT NULL,
  `decimalvalue` decimal(16,2) DEFAULT NULL,
  `intvalue` int(11) DEFAULT NULL,
  `stringvalue` varchar(255) DEFAULT NULL,
  `listvalue` longtext,
  `datevalue` date DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_parentid` (`parentid`) USING BTREE,
  KEY `ix_var_objid` (`var_objid`) USING BTREE,
  KEY `ix_field_objid` (`field_objid`) USING BTREE,
  CONSTRAINT `fk_sys_rule_condition_constraint_field_objid` FOREIGN KEY (`field_objid`) REFERENCES `sys_rule_fact_field` (`objid`),
  CONSTRAINT `fk_sys_rule_condition_constraint_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`),
  CONSTRAINT `fk_sys_rule_condition_constraint_var_objid` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_condition_constraint`
--

LOCK TABLES `sys_rule_condition_constraint` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition_constraint` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_condition_constraint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_condition_var`
--

DROP TABLE IF EXISTS `sys_rule_condition_var`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition_var` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `ruleid` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_parentid` (`parentid`) USING BTREE,
  CONSTRAINT `fk_sys_rule_condition_var_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_condition_var`
--

LOCK TABLES `sys_rule_condition_var` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition_var` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_condition_var` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_deployed`
--

DROP TABLE IF EXISTS `sys_rule_deployed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_deployed` (
  `objid` varchar(50) NOT NULL,
  `ruletext` longtext,
  PRIMARY KEY (`objid`) USING BTREE,
  CONSTRAINT `fk_sys_rule_deployed_objid` FOREIGN KEY (`objid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_deployed`
--

LOCK TABLES `sys_rule_deployed` WRITE;
/*!40000 ALTER TABLE `sys_rule_deployed` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_deployed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_fact`
--

DROP TABLE IF EXISTS `sys_rule_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_fact` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `factclass` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `defaultvarname` varchar(25) DEFAULT NULL,
  `dynamic` int(11) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `lookupdatatype` varchar(50) DEFAULT NULL,
  `dynamicfieldname` varchar(50) DEFAULT NULL,
  `builtinconstraints` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `factsuperclass` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_fact`
--

LOCK TABLES `sys_rule_fact` WRITE;
/*!40000 ALTER TABLE `sys_rule_fact` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_fact_field`
--

DROP TABLE IF EXISTS `sys_rule_fact_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_fact_field` (
  `objid` varchar(100) NOT NULL DEFAULT '',
  `parentid` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `lookupdatatype` varchar(50) DEFAULT NULL,
  `multivalued` int(11) DEFAULT NULL,
  `required` int(11) DEFAULT NULL,
  `vardatatype` varchar(50) DEFAULT NULL,
  `lovname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_parentid` (`parentid`) USING BTREE,
  CONSTRAINT `fk_sys_rule_fact_field_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_fact` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_fact_field`
--

LOCK TABLES `sys_rule_fact_field` WRITE;
/*!40000 ALTER TABLE `sys_rule_fact_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_fact_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rulegroup`
--

DROP TABLE IF EXISTS `sys_rulegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rulegroup` (
  `name` varchar(50) NOT NULL,
  `ruleset` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`,`ruleset`) USING BTREE,
  KEY `ix_ruleset` (`ruleset`) USING BTREE,
  CONSTRAINT `fk_sys_rulegroup_ruleset` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rulegroup`
--

LOCK TABLES `sys_rulegroup` WRITE;
/*!40000 ALTER TABLE `sys_rulegroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rulegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ruleset`
--

DROP TABLE IF EXISTS `sys_ruleset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset` (
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `packagename` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `permission` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ruleset`
--

LOCK TABLES `sys_ruleset` WRITE;
/*!40000 ALTER TABLE `sys_ruleset` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_ruleset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ruleset_actiondef`
--

DROP TABLE IF EXISTS `sys_ruleset_actiondef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset_actiondef` (
  `ruleset` varchar(50) NOT NULL,
  `actiondef` varchar(50) NOT NULL,
  PRIMARY KEY (`ruleset`,`actiondef`) USING BTREE,
  KEY `ix_actiondef` (`actiondef`) USING BTREE,
  CONSTRAINT `fk_sys_ruleset_actiondef_actiondef` FOREIGN KEY (`actiondef`) REFERENCES `sys_rule_actiondef` (`objid`),
  CONSTRAINT `fk_sys_ruleset_actiondef_ruleset` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ruleset_actiondef`
--

LOCK TABLES `sys_ruleset_actiondef` WRITE;
/*!40000 ALTER TABLE `sys_ruleset_actiondef` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_ruleset_actiondef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ruleset_fact`
--

DROP TABLE IF EXISTS `sys_ruleset_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset_fact` (
  `ruleset` varchar(50) NOT NULL,
  `rulefact` varchar(50) NOT NULL,
  PRIMARY KEY (`ruleset`,`rulefact`) USING BTREE,
  KEY `ix_rulefact` (`rulefact`) USING BTREE,
  CONSTRAINT `fk_sys_ruleset_fact_rulefact` FOREIGN KEY (`rulefact`) REFERENCES `sys_rule_fact` (`objid`),
  CONSTRAINT `fk_sys_ruleset_fact_ruleset` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ruleset_fact`
--

LOCK TABLES `sys_ruleset_fact` WRITE;
/*!40000 ALTER TABLE `sys_ruleset_fact` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_ruleset_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sequence`
--

DROP TABLE IF EXISTS `sys_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sequence` (
  `objid` varchar(100) NOT NULL,
  `nextSeries` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sequence`
--

LOCK TABLES `sys_sequence` WRITE;
/*!40000 ALTER TABLE `sys_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_usergroup`
--

DROP TABLE IF EXISTS `sys_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_usergroup` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `domain` varchar(25) DEFAULT NULL,
  `userclass` varchar(25) DEFAULT NULL,
  `orgclass` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_usergroup`
--

LOCK TABLES `sys_usergroup` WRITE;
/*!40000 ALTER TABLE `sys_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_var`
--

DROP TABLE IF EXISTS `sys_var`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_var` (
  `name` varchar(50) NOT NULL,
  `value` longtext,
  `description` varchar(255) DEFAULT NULL,
  `datatype` varchar(15) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_var`
--

LOCK TABLES `sys_var` WRITE;
/*!40000 ALTER TABLE `sys_var` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_var` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wf`
--

DROP TABLE IF EXISTS `sys_wf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf` (
  `name` varchar(50) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf`
--

LOCK TABLES `sys_wf` WRITE;
/*!40000 ALTER TABLE `sys_wf` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_wf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wf_node`
--

DROP TABLE IF EXISTS `sys_wf_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_node` (
  `name` varchar(50) NOT NULL,
  `processname` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(100) DEFAULT NULL,
  `nodetype` varchar(10) DEFAULT NULL,
  `idx` int(11) DEFAULT NULL,
  `salience` int(11) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `ui` text,
  `properties` text,
  `tracktime` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`,`processname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf_node`
--

LOCK TABLES `sys_wf_node` WRITE;
/*!40000 ALTER TABLE `sys_wf_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_wf_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wf_transition`
--

DROP TABLE IF EXISTS `sys_wf_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_transition` (
  `parentid` varchar(50) NOT NULL DEFAULT '',
  `processname` varchar(50) NOT NULL DEFAULT '',
  `action` varchar(50) NOT NULL,
  `to` varchar(50) NOT NULL,
  `idx` int(11) DEFAULT NULL,
  `eval` mediumtext,
  `properties` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `ui` text,
  PRIMARY KEY (`parentid`,`processname`,`to`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf_transition`
--

LOCK TABLES `sys_wf_transition` WRITE;
/*!40000 ALTER TABLE `sys_wf_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_wf_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_acctno_110000709_water_payment`
--

DROP TABLE IF EXISTS `temp_acctno_110000709_water_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_acctno_110000709_water_payment` (
  `objid` varchar(50) NOT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `refdate` date DEFAULT NULL,
  `discount` decimal(16,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `voided` int(11) DEFAULT NULL,
  `txnmode` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `billid` varchar(50) DEFAULT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `compromiseid` varchar(50) DEFAULT NULL,
  `pmttxntype` varchar(50) DEFAULT NULL,
  `txndate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_acctno_110000709_water_payment`
--

LOCK TABLES `temp_acctno_110000709_water_payment` WRITE;
/*!40000 ALTER TABLE `temp_acctno_110000709_water_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_acctno_110000709_water_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_acctno_240000703_b`
--

DROP TABLE IF EXISTS `temp_acctno_240000703_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_acctno_240000703_b` (
  `objid` varchar(50) NOT NULL,
  `batchid` varchar(50) DEFAULT NULL,
  `billid` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `errmsg` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_acctno_240000703_b`
--

LOCK TABLES `temp_acctno_240000703_b` WRITE;
/*!40000 ALTER TABLE `temp_acctno_240000703_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_acctno_240000703_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_waterworks_consumption_acctno_240000703_b`
--

DROP TABLE IF EXISTS `temp_waterworks_consumption_acctno_240000703_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_waterworks_consumption_acctno_240000703_b` (
  `objid` varchar(50) NOT NULL,
  `acctid` varchar(50) NOT NULL,
  `meterid` varchar(50) DEFAULT NULL,
  `year` int(255) NOT NULL,
  `month` int(255) NOT NULL,
  `billid` varchar(50) DEFAULT NULL,
  `txnmode` varchar(50) DEFAULT NULL,
  `reading` int(11) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `hold` int(11) NOT NULL DEFAULT '0',
  `reason` varchar(255) DEFAULT NULL,
  `reader_objid` varchar(50) DEFAULT NULL,
  `reader_name` varchar(255) DEFAULT NULL,
  `readingdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_waterworks_consumption_acctno_240000703_b`
--

LOCK TABLES `temp_waterworks_consumption_acctno_240000703_b` WRITE;
/*!40000 ALTER TABLE `temp_waterworks_consumption_acctno_240000703_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_waterworks_consumption_acctno_240000703_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_firstbill`
--

DROP TABLE IF EXISTS `tmp_firstbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_firstbill` (
  `acctid` varchar(50) NOT NULL,
  `billid` varchar(50) NOT NULL,
  PRIMARY KEY (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp_firstbill`
--

LOCK TABLES `tmp_firstbill` WRITE;
/*!40000 ALTER TABLE `tmp_firstbill` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_firstbill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_waterworks_account`
--

DROP TABLE IF EXISTS `vw_waterworks_account`;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_account`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_waterworks_account` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `acctno` tinyint NOT NULL,
  `acctinfoid` tinyint NOT NULL,
  `dtstarted` tinyint NOT NULL,
  `applicationid` tinyint NOT NULL,
  `remarks` tinyint NOT NULL,
  `ukey` tinyint NOT NULL,
  `seqno` tinyint NOT NULL,
  `billid` tinyint NOT NULL,
  `lng` tinyint NOT NULL,
  `lat` tinyint NOT NULL,
  `excludeinbatch` tinyint NOT NULL,
  `acctname` tinyint NOT NULL,
  `owner_objid` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `address_type` tinyint NOT NULL,
  `address_text` tinyint NOT NULL,
  `address_barangay_objid` tinyint NOT NULL,
  `address_barangay_name` tinyint NOT NULL,
  `address_city` tinyint NOT NULL,
  `address_province` tinyint NOT NULL,
  `address_municipality` tinyint NOT NULL,
  `address_unitno` tinyint NOT NULL,
  `address_street` tinyint NOT NULL,
  `address_subdivision` tinyint NOT NULL,
  `address_bldgno` tinyint NOT NULL,
  `address_bldgname` tinyint NOT NULL,
  `address_pin` tinyint NOT NULL,
  `stuboutid` tinyint NOT NULL,
  `subareaid` tinyint NOT NULL,
  `meterid` tinyint NOT NULL,
  `classificationid` tinyint NOT NULL,
  `units` tinyint NOT NULL,
  `attributes` tinyint NOT NULL,
  `meterstate` tinyint NOT NULL,
  `mobileno` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `phoneno` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_waterworks_account_info`
--

DROP TABLE IF EXISTS `vw_waterworks_account_info`;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_account_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_waterworks_account_info` (
  `objid` tinyint NOT NULL,
  `acctname` tinyint NOT NULL,
  `owner_objid` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `address_type` tinyint NOT NULL,
  `address_text` tinyint NOT NULL,
  `address_barangay_objid` tinyint NOT NULL,
  `address_barangay_name` tinyint NOT NULL,
  `address_city` tinyint NOT NULL,
  `address_province` tinyint NOT NULL,
  `address_municipality` tinyint NOT NULL,
  `address_unitno` tinyint NOT NULL,
  `address_street` tinyint NOT NULL,
  `address_subdivision` tinyint NOT NULL,
  `address_bldgno` tinyint NOT NULL,
  `address_bldgname` tinyint NOT NULL,
  `address_pin` tinyint NOT NULL,
  `stuboutid` tinyint NOT NULL,
  `subareaid` tinyint NOT NULL,
  `meterid` tinyint NOT NULL,
  `classification_objid` tinyint NOT NULL,
  `units` tinyint NOT NULL,
  `attributes` tinyint NOT NULL,
  `meterstate` tinyint NOT NULL,
  `mobileno` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `phoneno` tinyint NOT NULL,
  `meter_serialno` tinyint NOT NULL,
  `meter_capacity` tinyint NOT NULL,
  `meter_brand` tinyint NOT NULL,
  `meter_size` tinyint NOT NULL,
  `subarea_code` tinyint NOT NULL,
  `subarea_area_code` tinyint NOT NULL,
  `stubout_code` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_waterworks_application`
--

DROP TABLE IF EXISTS `vw_waterworks_application`;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_application`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_waterworks_application` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `dtcreated` tinyint NOT NULL,
  `appno` tinyint NOT NULL,
  `apptype` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `acctinfoid` tinyint NOT NULL,
  `taskid` tinyint NOT NULL,
  `acctno` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_waterworks_batch_billing`
--

DROP TABLE IF EXISTS `vw_waterworks_batch_billing`;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_batch_billing`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_waterworks_batch_billing` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `subareaid` tinyint NOT NULL,
  `dtposted` tinyint NOT NULL,
  `reader_objid` tinyint NOT NULL,
  `reader_name` tinyint NOT NULL,
  `taskid` tinyint NOT NULL,
  `readingdate` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `month` tinyint NOT NULL,
  `scheduleid` tinyint NOT NULL,
  `batchno` tinyint NOT NULL,
  `monthname` tinyint NOT NULL,
  `subarea_schedulegroupid` tinyint NOT NULL,
  `subarea_code` tinyint NOT NULL,
  `subarea_barangay_name` tinyint NOT NULL,
  `area_code` tinyint NOT NULL,
  `period_fromdate` tinyint NOT NULL,
  `period_todate` tinyint NOT NULL,
  `period_readingdate` tinyint NOT NULL,
  `period_readingenddate` tinyint NOT NULL,
  `period_billdate` tinyint NOT NULL,
  `period_billingenddate` tinyint NOT NULL,
  `period_discdate` tinyint NOT NULL,
  `period_duedate` tinyint NOT NULL,
  `period_billexpirydate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_waterworks_batch_billing_error`
--

DROP TABLE IF EXISTS `vw_waterworks_batch_billing_error`;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_batch_billing_error`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_waterworks_batch_billing_error` (
  `objid` tinyint NOT NULL,
  `batchid` tinyint NOT NULL,
  `billid` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `action` tinyint NOT NULL,
  `errmsg` tinyint NOT NULL,
  `seqno` tinyint NOT NULL,
  `acctno` tinyint NOT NULL,
  `acctname` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_waterworks_bill`
--

DROP TABLE IF EXISTS `vw_waterworks_bill`;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_bill`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_waterworks_bill` (
  `objid` tinyint NOT NULL,
  `billno` tinyint NOT NULL,
  `billdate` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `acctinfoid` tinyint NOT NULL,
  `batchid` tinyint NOT NULL,
  `txnmode` tinyint NOT NULL,
  `expirydate` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `balanceforward` tinyint NOT NULL,
  `billed` tinyint NOT NULL,
  `billrefno` tinyint NOT NULL,
  `printed` tinyint NOT NULL,
  `remarks` tinyint NOT NULL,
  `createdby_objid` tinyint NOT NULL,
  `createdby_name` tinyint NOT NULL,
  `dtcreated` tinyint NOT NULL,
  `validitydate` tinyint NOT NULL,
  `initial` tinyint NOT NULL,
  `step` tinyint NOT NULL,
  `consumptionid` tinyint NOT NULL,
  `totalcredits` tinyint NOT NULL,
  `totalprevunpaid` tinyint NOT NULL,
  `totalbillunpaid` tinyint NOT NULL,
  `billamount` tinyint NOT NULL,
  `totalsurcharge` tinyint NOT NULL,
  `totalpayment` tinyint NOT NULL,
  `totaldiscount` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `month` tinyint NOT NULL,
  `scheduleid` tinyint NOT NULL,
  `monthname` tinyint NOT NULL,
  `acctno` tinyint NOT NULL,
  `acctname` tinyint NOT NULL,
  `acctstate` tinyint NOT NULL,
  `seqno` tinyint NOT NULL,
  `subareaid` tinyint NOT NULL,
  `address_text` tinyint NOT NULL,
  `classificationid` tinyint NOT NULL,
  `stuboutid` tinyint NOT NULL,
  `meterid` tinyint NOT NULL,
  `meterstate` tinyint NOT NULL,
  `subarea_schedulegroupid` tinyint NOT NULL,
  `subarea_code` tinyint NOT NULL,
  `subarea_barangay_name` tinyint NOT NULL,
  `area_code` tinyint NOT NULL,
  `period_fromdate` tinyint NOT NULL,
  `period_todate` tinyint NOT NULL,
  `period_readingdate` tinyint NOT NULL,
  `period_readingenddate` tinyint NOT NULL,
  `period_billdate` tinyint NOT NULL,
  `period_billingenddate` tinyint NOT NULL,
  `period_discdate` tinyint NOT NULL,
  `period_duedate` tinyint NOT NULL,
  `period_billexpirydate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_waterworks_bill_consumption`
--

DROP TABLE IF EXISTS `vw_waterworks_bill_consumption`;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_bill_consumption`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_waterworks_bill_consumption` (
  `objid` tinyint NOT NULL,
  `billid` tinyint NOT NULL,
  `reading` tinyint NOT NULL,
  `volume` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `hold` tinyint NOT NULL,
  `reason` tinyint NOT NULL,
  `readingdate` tinyint NOT NULL,
  `reader_objid` tinyint NOT NULL,
  `reader_name` tinyint NOT NULL,
  `prev_reading` tinyint NOT NULL,
  `batchid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_waterworks_change_request`
--

DROP TABLE IF EXISTS `vw_waterworks_change_request`;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_change_request`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_waterworks_change_request` (
  `objid` tinyint NOT NULL,
  `controlno` tinyint NOT NULL,
  `apptype` tinyint NOT NULL,
  `dtcreated` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `acctinfoid` tinyint NOT NULL,
  `newacctinfoid` tinyint NOT NULL,
  `reason` tinyint NOT NULL,
  `taskid` tinyint NOT NULL,
  `account_acctno` tinyint NOT NULL,
  `task_state` tinyint NOT NULL,
  `task_startdate` tinyint NOT NULL,
  `task_enddate` tinyint NOT NULL,
  `task_assignee_objid` tinyint NOT NULL,
  `task_assignee_name` tinyint NOT NULL,
  `task_actor_objid` tinyint NOT NULL,
  `task_actor_name` tinyint NOT NULL,
  `task_title` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_waterworks_compromise`
--

DROP TABLE IF EXISTS `vw_waterworks_compromise`;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_compromise`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_waterworks_compromise` (
  `objid` tinyint NOT NULL,
  `controlno` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `dtcreated` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `acctinfoid` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `taskid` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `downpaymentrate` tinyint NOT NULL,
  `downpayment` tinyint NOT NULL,
  `term` tinyint NOT NULL,
  `startduedate` tinyint NOT NULL,
  `balance` tinyint NOT NULL,
  `acctno` tinyint NOT NULL,
  `task_state` tinyint NOT NULL,
  `task_startdate` tinyint NOT NULL,
  `task_enddate` tinyint NOT NULL,
  `task_assignee_objid` tinyint NOT NULL,
  `task_assignee_name` tinyint NOT NULL,
  `task_actor_objid` tinyint NOT NULL,
  `task_actor_name` tinyint NOT NULL,
  `task_title` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_waterworks_compromise_billitem`
--

DROP TABLE IF EXISTS `vw_waterworks_compromise_billitem`;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_compromise_billitem`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_waterworks_compromise_billitem` (
  `objid` tinyint NOT NULL,
  `parentid` tinyint NOT NULL,
  `billitemid` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `amtpaid` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `month` tinyint NOT NULL,
  `item_title` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_waterworks_consumption`
--

DROP TABLE IF EXISTS `vw_waterworks_consumption`;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_consumption`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_waterworks_consumption` (
  `objid` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `meterid` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `month` tinyint NOT NULL,
  `billid` tinyint NOT NULL,
  `txnmode` tinyint NOT NULL,
  `reading` tinyint NOT NULL,
  `volume` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `hold` tinyint NOT NULL,
  `reason` tinyint NOT NULL,
  `reader_objid` tinyint NOT NULL,
  `reader_name` tinyint NOT NULL,
  `readingdate` tinyint NOT NULL,
  `prev_reading` tinyint NOT NULL,
  `prev_month` tinyint NOT NULL,
  `prev_year` tinyint NOT NULL,
  `batchid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_waterworks_disconnection`
--

DROP TABLE IF EXISTS `vw_waterworks_disconnection`;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_disconnection`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_waterworks_disconnection` (
  `objid` tinyint NOT NULL,
  `controlno` tinyint NOT NULL,
  `dtcreated` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `acctinfoid` tinyint NOT NULL,
  `reason` tinyint NOT NULL,
  `taskid` tinyint NOT NULL,
  `amountdue` tinyint NOT NULL,
  `account_acctno` tinyint NOT NULL,
  `task_state` tinyint NOT NULL,
  `task_startdate` tinyint NOT NULL,
  `task_enddate` tinyint NOT NULL,
  `task_assignee_objid` tinyint NOT NULL,
  `task_assignee_name` tinyint NOT NULL,
  `task_actor_objid` tinyint NOT NULL,
  `task_actor_name` tinyint NOT NULL,
  `task_title` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `waterworks_account`
--

DROP TABLE IF EXISTS `waterworks_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_account` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `acctno` varchar(50) DEFAULT NULL,
  `acctinfoid` varchar(50) DEFAULT NULL,
  `dtstarted` date DEFAULT NULL,
  `applicationid` varchar(50) DEFAULT NULL,
  `remarks` text,
  `ukey` varchar(50) NOT NULL DEFAULT '',
  `seqno` int(11) DEFAULT NULL,
  `billid` varchar(50) DEFAULT NULL,
  `lng` float(255,0) DEFAULT NULL,
  `lat` float(255,0) DEFAULT NULL,
  `excludeinbatch` int(10) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_acctno` (`acctno`,`ukey`) USING BTREE,
  KEY `ix_acctno` (`acctno`) USING BTREE,
  KEY `ix_applicationid` (`applicationid`) USING BTREE,
  KEY `fk_waterworks_account_acctinfoid` (`acctinfoid`) USING BTREE,
  KEY `fk_waterworks_account_billid` (`billid`) USING BTREE,
  CONSTRAINT `fk_waterworks_account_acctinfoid` FOREIGN KEY (`acctinfoid`) REFERENCES `waterworks_account_info` (`objid`),
  CONSTRAINT `fk_waterworks_account_applicationid` FOREIGN KEY (`applicationid`) REFERENCES `waterworks_application` (`objid`),
  CONSTRAINT `fk_waterworks_account_billid` FOREIGN KEY (`billid`) REFERENCES `waterworks_bill` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_account`
--

LOCK TABLES `waterworks_account` WRITE;
/*!40000 ALTER TABLE `waterworks_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_account_attribute`
--

DROP TABLE IF EXISTS `waterworks_account_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_account_attribute` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `attribute_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_account_attribute`
--

LOCK TABLES `waterworks_account_attribute` WRITE;
/*!40000 ALTER TABLE `waterworks_account_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_account_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_account_info`
--

DROP TABLE IF EXISTS `waterworks_account_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_account_info` (
  `objid` varchar(50) NOT NULL,
  `acctname` varchar(255) DEFAULT NULL,
  `owner_objid` varchar(50) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `address_type` varchar(50) DEFAULT NULL,
  `address_barangay_objid` varchar(50) DEFAULT NULL,
  `address_barangay_name` varchar(50) DEFAULT NULL,
  `address_text` varchar(255) DEFAULT NULL,
  `address_city` varchar(50) DEFAULT NULL,
  `address_province` varchar(50) DEFAULT NULL,
  `address_municipality` varchar(50) DEFAULT NULL,
  `address_unitno` varchar(50) DEFAULT NULL,
  `address_street` varchar(50) DEFAULT NULL,
  `address_subdivision` varchar(50) DEFAULT NULL,
  `address_bldgno` varchar(50) DEFAULT NULL,
  `address_bldgname` varchar(50) DEFAULT NULL,
  `address_pin` varchar(50) DEFAULT NULL,
  `meterid` varchar(50) DEFAULT NULL,
  `classificationid` varchar(50) DEFAULT NULL,
  `units` int(11) DEFAULT NULL,
  `stuboutid` varchar(50) DEFAULT NULL,
  `subareaid` varchar(50) DEFAULT NULL,
  `attributes` varchar(500) DEFAULT NULL,
  `meterstate` varchar(50) DEFAULT NULL,
  `mobileno` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phoneno` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_waterworks_account_classification` (`classificationid`) USING BTREE,
  KEY `ix_acctname` (`acctname`) USING BTREE,
  KEY `ix_owner_objid` (`owner_objid`) USING BTREE,
  KEY `ix_meterid` (`meterid`) USING BTREE,
  KEY `fk_waterworks_account_stuboutid` (`stuboutid`) USING BTREE,
  KEY `fk_waterworks_account_subareaid` (`subareaid`) USING BTREE,
  KEY `fk_waterworks_account_meter` (`meterid`) USING BTREE,
  CONSTRAINT `waterworks_account_info_ibfk_2` FOREIGN KEY (`classificationid`) REFERENCES `waterworks_classification` (`objid`),
  CONSTRAINT `waterworks_account_info_ibfk_3` FOREIGN KEY (`meterid`) REFERENCES `waterworks_meter` (`objid`),
  CONSTRAINT `waterworks_account_info_ibfk_4` FOREIGN KEY (`stuboutid`) REFERENCES `waterworks_stubout` (`objid`),
  CONSTRAINT `waterworks_account_info_ibfk_5` FOREIGN KEY (`subareaid`) REFERENCES `waterworks_subarea` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_account_info`
--

LOCK TABLES `waterworks_account_info` WRITE;
/*!40000 ALTER TABLE `waterworks_account_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_account_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_application`
--

DROP TABLE IF EXISTS `waterworks_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_application` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `dtcreated` date DEFAULT NULL,
  `appno` varchar(50) DEFAULT NULL,
  `apptype` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `acctinfoid` varchar(50) DEFAULT NULL,
  `taskid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_waterworks_newconnection_taskid` (`taskid`) USING BTREE,
  KEY `fk_waterworks_newconnection_acctid` (`acctid`) USING BTREE,
  KEY `fk_waterworks_newconnection_acctinfoid` (`acctinfoid`) USING BTREE,
  CONSTRAINT `fk_waterworks_application_acctid` FOREIGN KEY (`acctid`) REFERENCES `waterworks_account` (`objid`),
  CONSTRAINT `fk_waterworks_application_acctinfoid` FOREIGN KEY (`acctinfoid`) REFERENCES `waterworks_account_info` (`objid`),
  CONSTRAINT `fk_waterworks_application_taskid` FOREIGN KEY (`taskid`) REFERENCES `waterworks_application_task` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_application`
--

LOCK TABLES `waterworks_application` WRITE;
/*!40000 ALTER TABLE `waterworks_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_application_fee`
--

DROP TABLE IF EXISTS `waterworks_application_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_application_fee` (
  `objid` varchar(50) NOT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `itemid` varchar(50) DEFAULT NULL,
  `particulars` varchar(255) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `amtpaid` decimal(16,2) DEFAULT NULL,
  `installmentid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_application_fee_application` (`appid`) USING BTREE,
  KEY `fk_waterworks_application_fee_itemid` (`itemid`),
  CONSTRAINT `fk_waterworks_application_fee_appid` FOREIGN KEY (`appid`) REFERENCES `waterworks_application` (`objid`),
  CONSTRAINT `fk_waterworks_application_fee_itemid` FOREIGN KEY (`itemid`) REFERENCES `waterworks_itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_application_fee`
--

LOCK TABLES `waterworks_application_fee` WRITE;
/*!40000 ALTER TABLE `waterworks_application_fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_application_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_application_task`
--

DROP TABLE IF EXISTS `waterworks_application_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_application_task` (
  `taskid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `prevtaskid` varchar(50) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  PRIMARY KEY (`taskid`) USING BTREE,
  KEY `ix_refid` (`refid`) USING BTREE,
  CONSTRAINT `fk_waterworks_newconnection_task_refid` FOREIGN KEY (`refid`) REFERENCES `waterworks_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_application_task`
--

LOCK TABLES `waterworks_application_task` WRITE;
/*!40000 ALTER TABLE `waterworks_application_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_application_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_area`
--

DROP TABLE IF EXISTS `waterworks_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_area` (
  `objid` varchar(50) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_area`
--

LOCK TABLES `waterworks_area` WRITE;
/*!40000 ALTER TABLE `waterworks_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_attribute`
--

DROP TABLE IF EXISTS `waterworks_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_attribute` (
  `name` varchar(50) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_attribute`
--

LOCK TABLES `waterworks_attribute` WRITE;
/*!40000 ALTER TABLE `waterworks_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_batch_billing`
--

DROP TABLE IF EXISTS `waterworks_batch_billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_batch_billing` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `subareaid` varchar(50) DEFAULT NULL,
  `dtposted` datetime DEFAULT NULL,
  `reader_objid` varchar(50) DEFAULT NULL,
  `reader_name` varchar(255) DEFAULT NULL,
  `taskid` varchar(50) DEFAULT NULL,
  `readingdate` date DEFAULT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `scheduleid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_subareaid_periodid` (`subareaid`,`year`,`month`) USING BTREE,
  KEY `ix_zoneid` (`subareaid`) USING BTREE,
  KEY `ix_dtposted` (`dtposted`) USING BTREE,
  KEY `ix_reader_objid` (`reader_objid`) USING BTREE,
  KEY `ix_taskid` (`taskid`) USING BTREE,
  KEY `ix_readingdate` (`readingdate`) USING BTREE,
  CONSTRAINT `fk_waterworks_batch_billing_subareaid` FOREIGN KEY (`subareaid`) REFERENCES `waterworks_subarea` (`objid`),
  CONSTRAINT `fk_waterworks_batch_billing_taskid` FOREIGN KEY (`taskid`) REFERENCES `waterworks_batch_billing_task` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_batch_billing`
--

LOCK TABLES `waterworks_batch_billing` WRITE;
/*!40000 ALTER TABLE `waterworks_batch_billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_batch_billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_batch_billing_error`
--

DROP TABLE IF EXISTS `waterworks_batch_billing_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_batch_billing_error` (
  `objid` varchar(50) NOT NULL,
  `batchid` varchar(50) DEFAULT NULL,
  `billid` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `errmsg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_waterworks_batch_blling_error_batchid` (`batchid`) USING BTREE,
  KEY `fk_waterworks_batch_billing_error_acctid` (`acctid`) USING BTREE,
  KEY `fk_waterworks_batch_billing_error_billid` (`billid`) USING BTREE,
  CONSTRAINT `fk_waterworks_batch_billing_error_acctid` FOREIGN KEY (`acctid`) REFERENCES `waterworks_account` (`objid`),
  CONSTRAINT `fk_waterworks_batch_billing_error_billid` FOREIGN KEY (`billid`) REFERENCES `waterworks_bill` (`objid`),
  CONSTRAINT `fk_waterworks_batch_blling_error_batchid` FOREIGN KEY (`batchid`) REFERENCES `waterworks_batch_billing` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_batch_billing_error`
--

LOCK TABLES `waterworks_batch_billing_error` WRITE;
/*!40000 ALTER TABLE `waterworks_batch_billing_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_batch_billing_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_batch_billing_task`
--

DROP TABLE IF EXISTS `waterworks_batch_billing_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_batch_billing_task` (
  `taskid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `prevtaskid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`taskid`) USING BTREE,
  KEY `ix_refid` (`refid`) USING BTREE,
  CONSTRAINT `fk_waterworks_batch_billing_task_refid` FOREIGN KEY (`refid`) REFERENCES `waterworks_batch_billing` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_batch_billing_task`
--

LOCK TABLES `waterworks_batch_billing_task` WRITE;
/*!40000 ALTER TABLE `waterworks_batch_billing_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_batch_billing_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_bill`
--

DROP TABLE IF EXISTS `waterworks_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_bill` (
  `objid` varchar(50) NOT NULL,
  `billno` varchar(50) DEFAULT NULL,
  `billdate` date DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `acctinfoid` varchar(50) DEFAULT NULL,
  `batchid` varchar(50) DEFAULT NULL,
  `txnmode` varchar(10) DEFAULT NULL,
  `expirydate` date DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `balanceforward` decimal(16,2) DEFAULT NULL,
  `billed` int(11) DEFAULT NULL,
  `billrefno` varchar(50) DEFAULT NULL,
  `printed` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `validitydate` date DEFAULT NULL,
  `initial` int(255) DEFAULT NULL,
  `step` int(10) DEFAULT NULL,
  `consumptionid` varchar(50) DEFAULT NULL,
  `totalcredits` decimal(16,2) DEFAULT '0.00',
  `totalprevunpaid` decimal(16,2) DEFAULT '0.00',
  `totalbillunpaid` decimal(16,2) DEFAULT '0.00',
  `billamount` decimal(16,2) DEFAULT '0.00',
  `totalsurcharge` decimal(16,2) DEFAULT '0.00',
  `totalpayment` decimal(16,2) DEFAULT '0.00',
  `totaldiscount` decimal(16,2) DEFAULT '0.00',
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `scheduleid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_waterworks_bill_acctid_year_month` (`acctid`,`year`,`month`) USING BTREE,
  KEY `ix_batchid` (`batchid`) USING BTREE,
  KEY `fk_waterworks_bill_acctid` (`acctid`) USING BTREE,
  KEY `fk_waterworks_bill_acctinfoid` (`acctinfoid`) USING BTREE,
  KEY `fk_waterworks_bill_consumptionid` (`consumptionid`) USING BTREE,
  CONSTRAINT `fk_waterworks_bill_acctid` FOREIGN KEY (`acctid`) REFERENCES `waterworks_account` (`objid`),
  CONSTRAINT `fk_waterworks_bill_acctinfoid` FOREIGN KEY (`acctinfoid`) REFERENCES `waterworks_account_info` (`objid`),
  CONSTRAINT `fk_waterworks_bill_batchid` FOREIGN KEY (`batchid`) REFERENCES `waterworks_batch_billing` (`objid`),
  CONSTRAINT `fk_waterworks_bill_consumptionid` FOREIGN KEY (`consumptionid`) REFERENCES `waterworks_consumption` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_bill`
--

LOCK TABLES `waterworks_bill` WRITE;
/*!40000 ALTER TABLE `waterworks_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_billing_period`
--

DROP TABLE IF EXISTS `waterworks_billing_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_billing_period` (
  `objid` varchar(50) NOT NULL,
  `scheduleid` varchar(50) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `fromdate` date DEFAULT NULL,
  `todate` date DEFAULT NULL,
  `readingdate` date DEFAULT NULL,
  `readingenddate` date DEFAULT NULL,
  `billdate` date DEFAULT NULL,
  `billingenddate` date DEFAULT NULL,
  `discdate` date DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `billexpirydate` date DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_scheduleid_year_month` (`scheduleid`,`year`,`month`) USING BTREE,
  KEY `ix_schedule_objid` (`scheduleid`) USING BTREE,
  KEY `ix_year` (`year`) USING BTREE,
  KEY `ix_month` (`month`) USING BTREE,
  KEY `ix_readingdate` (`readingdate`) USING BTREE,
  KEY `objid` (`objid`,`scheduleid`) USING BTREE,
  CONSTRAINT `fk_waterworks_billing_period_scheduleid` FOREIGN KEY (`scheduleid`) REFERENCES `waterworks_schedule_group` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_billing_period`
--

LOCK TABLES `waterworks_billing_period` WRITE;
/*!40000 ALTER TABLE `waterworks_billing_period` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_billing_period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_billitem`
--

DROP TABLE IF EXISTS `waterworks_billitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_billitem` (
  `objid` varchar(50) NOT NULL,
  `acctid` varchar(50) NOT NULL,
  `year` int(4) NOT NULL,
  `month` int(2) NOT NULL,
  `itemid` varchar(50) NOT NULL,
  `billid` varchar(50) DEFAULT NULL,
  `particulars` varchar(255) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `amtpaid` decimal(16,2) DEFAULT NULL,
  `discount` decimal(16,2) DEFAULT NULL,
  `system` int(255) DEFAULT NULL,
  `consumptionid` varchar(50) DEFAULT NULL,
  `billed` int(255) DEFAULT NULL,
  `txndate` date DEFAULT NULL,
  `recurringfeeid` varchar(50) DEFAULT NULL,
  `refbillid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_waterworks_billitem_mindex` (`billid`,`itemid`,`year`,`month`) USING BTREE,
  KEY `fk_waterworks_billitem_consumptionid` (`consumptionid`) USING BTREE,
  KEY `fk_waterworks_billitem_itemid` (`itemid`) USING BTREE,
  KEY `idx_waterworks_billitem_year` (`year`) USING BTREE,
  KEY `idx_waterworks_billitem_month` (`month`) USING BTREE,
  KEY `fk_waterworks_billitem_acctid` (`acctid`) USING BTREE,
  KEY `fk_waterworks_billitem_recurringfeeid` (`recurringfeeid`) USING BTREE,
  KEY `fk_waterworks_billitem_refbillid` (`refbillid`),
  CONSTRAINT `fk_waterworks_billitem_acctid` FOREIGN KEY (`acctid`) REFERENCES `waterworks_account` (`objid`),
  CONSTRAINT `fk_waterworks_billitem_billid` FOREIGN KEY (`billid`) REFERENCES `waterworks_bill` (`objid`),
  CONSTRAINT `fk_waterworks_billitem_consumptionid` FOREIGN KEY (`consumptionid`) REFERENCES `waterworks_consumption` (`objid`),
  CONSTRAINT `fk_waterworks_billitem_itemid` FOREIGN KEY (`itemid`) REFERENCES `waterworks_itemaccount` (`objid`),
  CONSTRAINT `fk_waterworks_billitem_recurringfeeid` FOREIGN KEY (`recurringfeeid`) REFERENCES `waterworks_recurringfee` (`objid`),
  CONSTRAINT `fk_waterworks_billitem_refbillid` FOREIGN KEY (`refbillid`) REFERENCES `waterworks_bill` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_billitem`
--

LOCK TABLES `waterworks_billitem` WRITE;
/*!40000 ALTER TABLE `waterworks_billitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_billitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_change_request`
--

DROP TABLE IF EXISTS `waterworks_change_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_change_request` (
  `objid` varchar(50) NOT NULL,
  `controlno` varchar(50) DEFAULT NULL,
  `apptype` varchar(50) DEFAULT NULL,
  `dtcreated` date DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `acctinfoid` varchar(50) DEFAULT NULL,
  `newacctinfoid` varchar(50) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `taskid` varchar(50) DEFAULT NULL,
  UNIQUE KEY `uix_waterworks_change_request_controlno` (`controlno`) USING BTREE,
  KEY `objid` (`objid`) USING BTREE,
  KEY `fk_waterworks_change_request_newacctinfoid` (`newacctinfoid`) USING BTREE,
  KEY `fk_waterworks_change_request_acctid` (`acctid`) USING BTREE,
  KEY `fk_waterworks_change_request_taskid` (`taskid`) USING BTREE,
  KEY `fk_waterworks_change_request_oldacctinfoid` (`acctinfoid`) USING BTREE,
  CONSTRAINT `fk_waterworks_change_request_acctid` FOREIGN KEY (`acctid`) REFERENCES `waterworks_account` (`objid`),
  CONSTRAINT `fk_waterworks_change_request_newacctinfoid` FOREIGN KEY (`newacctinfoid`) REFERENCES `waterworks_account_info` (`objid`),
  CONSTRAINT `fk_waterworks_change_request_oldacctinfoid` FOREIGN KEY (`acctinfoid`) REFERENCES `waterworks_account_info` (`objid`),
  CONSTRAINT `fk_waterworks_change_request_taskid` FOREIGN KEY (`taskid`) REFERENCES `waterworks_change_request_task` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_change_request`
--

LOCK TABLES `waterworks_change_request` WRITE;
/*!40000 ALTER TABLE `waterworks_change_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_change_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_change_request_task`
--

DROP TABLE IF EXISTS `waterworks_change_request_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_change_request_task` (
  `taskid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `prevtaskid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`taskid`) USING BTREE,
  KEY `ix_refid` (`refid`) USING BTREE,
  CONSTRAINT `waterworks_change_request_task_refid` FOREIGN KEY (`refid`) REFERENCES `waterworks_change_request` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_change_request_task`
--

LOCK TABLES `waterworks_change_request_task` WRITE;
/*!40000 ALTER TABLE `waterworks_change_request_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_change_request_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_classification`
--

DROP TABLE IF EXISTS `waterworks_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_classification` (
  `objid` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_classification`
--

LOCK TABLES `waterworks_classification` WRITE;
/*!40000 ALTER TABLE `waterworks_classification` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_compromise`
--

DROP TABLE IF EXISTS `waterworks_compromise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_compromise` (
  `objid` varchar(50) NOT NULL,
  `controlno` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `dtcreated` date DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `acctinfoid` varchar(50) DEFAULT NULL,
  `particulars` varchar(255) DEFAULT NULL,
  `taskid` varchar(50) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `downpaymentrate` decimal(16,2) DEFAULT NULL,
  `downpayment` decimal(16,2) DEFAULT NULL,
  `term` int(255) DEFAULT NULL,
  `startduedate` date DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_waterworks_change_request_controlno` (`controlno`),
  KEY `objid` (`objid`) USING BTREE,
  KEY `fk_waterworks_change_request_acctid` (`acctid`),
  KEY `fk_waterworks_change_request_taskid` (`taskid`),
  KEY `fk_waterworks_change_request_oldacctinfoid` (`acctinfoid`),
  CONSTRAINT `waterworks_compromise_acctid` FOREIGN KEY (`acctid`) REFERENCES `waterworks_account` (`objid`),
  CONSTRAINT `waterworks_compromise_acctinfoid` FOREIGN KEY (`acctinfoid`) REFERENCES `waterworks_account_info` (`objid`),
  CONSTRAINT `waterworks_compromise_taskid` FOREIGN KEY (`taskid`) REFERENCES `waterworks_compromise_task` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_compromise`
--

LOCK TABLES `waterworks_compromise` WRITE;
/*!40000 ALTER TABLE `waterworks_compromise` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_compromise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_compromise_billitem`
--

DROP TABLE IF EXISTS `waterworks_compromise_billitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_compromise_billitem` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `billitemid` varchar(50) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `amtpaid` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_waterworks_compromise_billitem_billitemid` (`billitemid`),
  KEY `fk_waterworks_compromise_billitem_parentid` (`parentid`),
  CONSTRAINT `fk_waterworks_compromise_billitem_billitemid` FOREIGN KEY (`billitemid`) REFERENCES `waterworks_billitem` (`objid`),
  CONSTRAINT `fk_waterworks_compromise_billitem_parentid` FOREIGN KEY (`parentid`) REFERENCES `waterworks_compromise` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_compromise_billitem`
--

LOCK TABLES `waterworks_compromise_billitem` WRITE;
/*!40000 ALTER TABLE `waterworks_compromise_billitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_compromise_billitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_compromise_fee`
--

DROP TABLE IF EXISTS `waterworks_compromise_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_compromise_fee` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `itemid` varchar(50) DEFAULT NULL,
  `particulars` varchar(255) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `amtpaid` decimal(16,2) DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `itemtype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_application_fee_application` (`parentid`),
  KEY `waterworks_compromise_fee_itemid` (`itemid`),
  CONSTRAINT `waterworks_compromise_fee_itemid` FOREIGN KEY (`itemid`) REFERENCES `waterworks_itemaccount` (`objid`),
  CONSTRAINT `waterworks_compromise_fee_parentid` FOREIGN KEY (`parentid`) REFERENCES `waterworks_compromise` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_compromise_fee`
--

LOCK TABLES `waterworks_compromise_fee` WRITE;
/*!40000 ALTER TABLE `waterworks_compromise_fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_compromise_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_compromise_task`
--

DROP TABLE IF EXISTS `waterworks_compromise_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_compromise_task` (
  `taskid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `prevtaskid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`taskid`),
  KEY `ix_refid` (`refid`),
  CONSTRAINT `waterworks_compromise_task_refid` FOREIGN KEY (`refid`) REFERENCES `waterworks_compromise` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_compromise_task`
--

LOCK TABLES `waterworks_compromise_task` WRITE;
/*!40000 ALTER TABLE `waterworks_compromise_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_compromise_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_consumption`
--

DROP TABLE IF EXISTS `waterworks_consumption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_consumption` (
  `objid` varchar(50) NOT NULL,
  `acctid` varchar(50) NOT NULL,
  `meterid` varchar(50) DEFAULT NULL,
  `year` int(255) NOT NULL,
  `month` int(255) NOT NULL,
  `billid` varchar(50) DEFAULT NULL,
  `txnmode` varchar(50) DEFAULT NULL,
  `reading` int(11) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `hold` int(11) NOT NULL DEFAULT '0',
  `reason` varchar(255) DEFAULT NULL,
  `reader_objid` varchar(50) DEFAULT NULL,
  `reader_name` varchar(255) DEFAULT NULL,
  `readingdate` date DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_acctid_year_month` (`acctid`,`year`,`month`,`meterid`),
  KEY `fk_waterworks_consumption_meterid` (`meterid`) USING BTREE,
  KEY `fk_waterworks_consumption_billid` (`billid`) USING BTREE,
  CONSTRAINT `fk_waterworks_consumption_acctid` FOREIGN KEY (`acctid`) REFERENCES `waterworks_account` (`objid`),
  CONSTRAINT `fk_waterworks_consumption_billid` FOREIGN KEY (`billid`) REFERENCES `waterworks_bill` (`objid`),
  CONSTRAINT `fk_waterworks_consumption_meterid` FOREIGN KEY (`meterid`) REFERENCES `waterworks_meter` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_consumption`
--

LOCK TABLES `waterworks_consumption` WRITE;
/*!40000 ALTER TABLE `waterworks_consumption` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_consumption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_credit`
--

DROP TABLE IF EXISTS `waterworks_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_credit` (
  `objid` varchar(50) NOT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `paymentrefid` varchar(50) DEFAULT NULL,
  `dr` decimal(16,2) DEFAULT NULL,
  `cr` decimal(16,2) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_acctid` (`acctid`) USING BTREE,
  KEY `fk_waterworks_credit_paymentrefid` (`paymentrefid`) USING BTREE,
  CONSTRAINT `fk_waterworks_credit_acctid` FOREIGN KEY (`acctid`) REFERENCES `waterworks_account` (`objid`),
  CONSTRAINT `fk_waterworks_credit_paymentrefid` FOREIGN KEY (`paymentrefid`) REFERENCES `waterworks_payment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_credit`
--

LOCK TABLES `waterworks_credit` WRITE;
/*!40000 ALTER TABLE `waterworks_credit` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_credit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_disconnection`
--

DROP TABLE IF EXISTS `waterworks_disconnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_disconnection` (
  `objid` varchar(50) NOT NULL,
  `controlno` varchar(50) DEFAULT NULL,
  `dtcreated` date DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `acctinfoid` varchar(50) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `taskid` varchar(50) DEFAULT NULL,
  `amountdue` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_waterworks_change_request_controlno` (`controlno`) USING BTREE,
  KEY `fk_waterworks_disconnection_acctid` (`acctid`) USING BTREE,
  KEY `fk_waterworks_disconnection_taskid` (`taskid`) USING BTREE,
  KEY `fk_waterworks_disconnection_acctinfoid` (`acctinfoid`) USING BTREE,
  CONSTRAINT `fk_waterworks_disconnection_acctid` FOREIGN KEY (`acctid`) REFERENCES `waterworks_account` (`objid`),
  CONSTRAINT `fk_waterworks_disconnection_acctinfoid` FOREIGN KEY (`acctinfoid`) REFERENCES `waterworks_account_info` (`objid`),
  CONSTRAINT `fk_waterworks_disconnection_taskid` FOREIGN KEY (`taskid`) REFERENCES `waterworks_disconnection_task` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_disconnection`
--

LOCK TABLES `waterworks_disconnection` WRITE;
/*!40000 ALTER TABLE `waterworks_disconnection` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_disconnection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_disconnection_notice`
--

DROP TABLE IF EXISTS `waterworks_disconnection_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_disconnection_notice` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `acctinfoid` varchar(50) DEFAULT NULL,
  `dtcreated` date DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `dtfiled` date DEFAULT NULL,
  `startyear` int(255) DEFAULT NULL,
  `startmonth` int(255) DEFAULT NULL,
  `endyear` int(255) DEFAULT NULL,
  `endmonth` int(255) DEFAULT NULL,
  `amtdue` decimal(16,2) DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_disconnection_notice`
--

LOCK TABLES `waterworks_disconnection_notice` WRITE;
/*!40000 ALTER TABLE `waterworks_disconnection_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_disconnection_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_disconnection_task`
--

DROP TABLE IF EXISTS `waterworks_disconnection_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_disconnection_task` (
  `taskid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `prevtaskid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`taskid`) USING BTREE,
  KEY `ix_refid` (`refid`) USING BTREE,
  CONSTRAINT `waterworks_disconnection_task_refid` FOREIGN KEY (`refid`) REFERENCES `waterworks_disconnection` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_disconnection_task`
--

LOCK TABLES `waterworks_disconnection_task` WRITE;
/*!40000 ALTER TABLE `waterworks_disconnection_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_disconnection_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_itemaccount`
--

DROP TABLE IF EXISTS `waterworks_itemaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_itemaccount` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sortorder` int(10) DEFAULT NULL,
  `itemtype` varchar(50) DEFAULT NULL,
  `system` int(255) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_itemaccount`
--

LOCK TABLES `waterworks_itemaccount` WRITE;
/*!40000 ALTER TABLE `waterworks_itemaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_itemaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_itemaccount_mapping`
--

DROP TABLE IF EXISTS `waterworks_itemaccount_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_itemaccount_mapping` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(255) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `fund_objid` varchar(50) DEFAULT NULL,
  `fund_title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_waterworks_itemaccount_mapping_parentid` (`parentid`) USING BTREE,
  CONSTRAINT `fk_waterworks_itemaccount_mapping_parentid` FOREIGN KEY (`parentid`) REFERENCES `waterworks_itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_itemaccount_mapping`
--

LOCK TABLES `waterworks_itemaccount_mapping` WRITE;
/*!40000 ALTER TABLE `waterworks_itemaccount_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_itemaccount_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_meter`
--

DROP TABLE IF EXISTS `waterworks_meter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_meter` (
  `objid` varchar(50) NOT NULL,
  `serialno` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `sizeid` varchar(50) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `stocktype` varchar(50) DEFAULT NULL,
  `state` varchar(32) NOT NULL,
  `currentacctid` varchar(50) DEFAULT NULL,
  `ukey` varchar(50) NOT NULL DEFAULT '',
  `reading` int(255) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_serialno` (`serialno`,`ukey`) USING BTREE,
  KEY `ix_brand` (`brand`) USING BTREE,
  KEY `ix_sizeid` (`sizeid`) USING BTREE,
  KEY `ix_state` (`state`) USING BTREE,
  KEY `ix_currentacctid` (`currentacctid`) USING BTREE,
  CONSTRAINT `fk_waterworks_meter_currentacctid` FOREIGN KEY (`currentacctid`) REFERENCES `waterworks_account` (`objid`),
  CONSTRAINT `fk_waterworks_meter_sizeid` FOREIGN KEY (`sizeid`) REFERENCES `waterworks_metersize` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_meter`
--

LOCK TABLES `waterworks_meter` WRITE;
/*!40000 ALTER TABLE `waterworks_meter` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_meter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_metersize`
--

DROP TABLE IF EXISTS `waterworks_metersize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_metersize` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_metersize`
--

LOCK TABLES `waterworks_metersize` WRITE;
/*!40000 ALTER TABLE `waterworks_metersize` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_metersize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_mobile_reading`
--

DROP TABLE IF EXISTS `waterworks_mobile_reading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_mobile_reading` (
  `objid` varchar(50) NOT NULL,
  `billid` varchar(50) DEFAULT NULL,
  `state` int(255) DEFAULT NULL,
  `readingdate` datetime DEFAULT NULL,
  `billprintdate` date DEFAULT NULL,
  `lng` float(255,0) DEFAULT NULL,
  `lat` float(255,0) DEFAULT NULL,
  `photo` mediumblob,
  `remarks` varchar(255) DEFAULT NULL,
  `reading` int(25) DEFAULT NULL,
  `volume` int(10) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `dtuploaded` date DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_waterworks_mobile_reading` (`billid`) USING BTREE,
  CONSTRAINT `fk_waterworks_mobile_reading` FOREIGN KEY (`billid`) REFERENCES `waterworks_bill` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_mobile_reading`
--

LOCK TABLES `waterworks_mobile_reading` WRITE;
/*!40000 ALTER TABLE `waterworks_mobile_reading` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_mobile_reading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_payment`
--

DROP TABLE IF EXISTS `waterworks_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_payment` (
  `objid` varchar(50) NOT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `refdate` date DEFAULT NULL,
  `discount` decimal(16,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `voided` int(11) DEFAULT NULL,
  `txnmode` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `billid` varchar(50) DEFAULT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `compromiseid` varchar(50) DEFAULT NULL,
  `pmttxntype` varchar(50) DEFAULT NULL,
  `txndate` datetime DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_refid` (`refid`) USING BTREE,
  KEY `ix_refno` (`refno`) USING BTREE,
  KEY `ix_refdate` (`refdate`) USING BTREE,
  KEY `fk_waterworks_payment_acctid` (`acctid`) USING BTREE,
  KEY `fk_waterworks_payment_billid` (`billid`) USING BTREE,
  KEY `fk_waterworks_payment_appid` (`appid`),
  KEY `fk_waterworks_payment_compromiseid` (`compromiseid`),
  CONSTRAINT `fk_waterworks_payment_acctid` FOREIGN KEY (`acctid`) REFERENCES `waterworks_account` (`objid`),
  CONSTRAINT `fk_waterworks_payment_appid` FOREIGN KEY (`appid`) REFERENCES `waterworks_application` (`objid`),
  CONSTRAINT `fk_waterworks_payment_billid` FOREIGN KEY (`billid`) REFERENCES `waterworks_bill` (`objid`),
  CONSTRAINT `fk_waterworks_payment_compromiseid` FOREIGN KEY (`compromiseid`) REFERENCES `waterworks_compromise` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_payment`
--

LOCK TABLES `waterworks_payment` WRITE;
/*!40000 ALTER TABLE `waterworks_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_payment_item`
--

DROP TABLE IF EXISTS `waterworks_payment_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_payment_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `billitemid` varchar(50) DEFAULT NULL,
  `compromisefeeid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_parentid` (`parentid`) USING BTREE,
  KEY `ix_refid` (`refid`) USING BTREE,
  KEY `ix_reftype` (`reftype`) USING BTREE,
  KEY `fk_waterworks_payment_item_billitemid` (`billitemid`),
  KEY `fk_waterworks_payment_item_compromisefeeid` (`compromisefeeid`),
  CONSTRAINT `fk_waterworks_payment_item_billitemid` FOREIGN KEY (`billitemid`) REFERENCES `waterworks_billitem` (`objid`),
  CONSTRAINT `fk_waterworks_payment_item_compromisefeeid` FOREIGN KEY (`compromisefeeid`) REFERENCES `waterworks_compromise_fee` (`objid`),
  CONSTRAINT `fk_waterworks_payment_item_parentid` FOREIGN KEY (`parentid`) REFERENCES `waterworks_payment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_payment_item`
--

LOCK TABLES `waterworks_payment_item` WRITE;
/*!40000 ALTER TABLE `waterworks_payment_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_payment_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_recurringfee`
--

DROP TABLE IF EXISTS `waterworks_recurringfee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_recurringfee` (
  `objid` varchar(50) NOT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `itemid` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `startyear` int(5) DEFAULT NULL,
  `startmonth` int(5) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `amtbilled` decimal(16,2) DEFAULT NULL,
  `system` int(255) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `installmentamount` decimal(16,2) DEFAULT NULL,
  `term` int(10) DEFAULT NULL,
  `particulars` varchar(255) DEFAULT NULL,
  `principal` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_waterworks_recurringfee_acctid` (`acctid`) USING BTREE,
  CONSTRAINT `fk_waterworks_recurringfee_acctid` FOREIGN KEY (`acctid`) REFERENCES `waterworks_account` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_recurringfee`
--

LOCK TABLES `waterworks_recurringfee` WRITE;
/*!40000 ALTER TABLE `waterworks_recurringfee` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_recurringfee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_schedule_group`
--

DROP TABLE IF EXISTS `waterworks_schedule_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_schedule_group` (
  `objid` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_schedule_group`
--

LOCK TABLES `waterworks_schedule_group` WRITE;
/*!40000 ALTER TABLE `waterworks_schedule_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_schedule_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_stubout`
--

DROP TABLE IF EXISTS `waterworks_stubout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_stubout` (
  `objid` varchar(50) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `subareaid` varchar(50) NOT NULL,
  `barangay_objid` varchar(50) DEFAULT NULL,
  `barangay_name` varchar(100) DEFAULT NULL,
  `lng` float(255,0) DEFAULT NULL,
  `lat` float(255,0) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_zoneid` (`subareaid`) USING BTREE,
  KEY `ix_barangay_objid` (`barangay_objid`) USING BTREE,
  CONSTRAINT `fk_waterworks_stubout_subareaid` FOREIGN KEY (`subareaid`) REFERENCES `waterworks_subarea` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_stubout`
--

LOCK TABLES `waterworks_stubout` WRITE;
/*!40000 ALTER TABLE `waterworks_stubout` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_stubout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterworks_subarea`
--

DROP TABLE IF EXISTS `waterworks_subarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterworks_subarea` (
  `objid` varchar(50) NOT NULL,
  `areaid` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `schedulegroupid` varchar(50) NOT NULL,
  `barangay_objid` varchar(50) DEFAULT NULL,
  `barangay_name` varchar(150) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_waterworks_subarea_areaid` (`areaid`) USING BTREE,
  KEY `fk_waterworks_subarea_nextperiodid_schedulegroupid` (`schedulegroupid`) USING BTREE,
  KEY `fk_waterworks_subarea_schedulegroupid` (`schedulegroupid`) USING BTREE,
  CONSTRAINT `fk_waterworks_subarea_areaid` FOREIGN KEY (`areaid`) REFERENCES `waterworks_area` (`objid`),
  CONSTRAINT `fk_waterworks_subarea_schedulegroupid` FOREIGN KEY (`schedulegroupid`) REFERENCES `waterworks_schedule_group` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterworks_subarea`
--

LOCK TABLES `waterworks_subarea` WRITE;
/*!40000 ALTER TABLE `waterworks_subarea` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterworks_subarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `waterworks`
--

USE `waterworks`;

--
-- Final view structure for view `vw_waterworks_account`
--

/*!50001 DROP TABLE IF EXISTS `vw_waterworks_account`*/;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_account`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_waterworks_account` AS select `wa`.`objid` AS `objid`,`wa`.`state` AS `state`,`wa`.`acctno` AS `acctno`,`wa`.`acctinfoid` AS `acctinfoid`,`wa`.`dtstarted` AS `dtstarted`,`wa`.`applicationid` AS `applicationid`,`wa`.`remarks` AS `remarks`,`wa`.`ukey` AS `ukey`,`wa`.`seqno` AS `seqno`,`wa`.`billid` AS `billid`,`wa`.`lng` AS `lng`,`wa`.`lat` AS `lat`,`wa`.`excludeinbatch` AS `excludeinbatch`,`ai`.`acctname` AS `acctname`,`ai`.`owner_objid` AS `owner_objid`,`ai`.`owner_name` AS `owner_name`,`ai`.`address_type` AS `address_type`,`ai`.`address_text` AS `address_text`,`ai`.`address_barangay_objid` AS `address_barangay_objid`,`ai`.`address_barangay_name` AS `address_barangay_name`,`ai`.`address_city` AS `address_city`,`ai`.`address_province` AS `address_province`,`ai`.`address_municipality` AS `address_municipality`,`ai`.`address_unitno` AS `address_unitno`,`ai`.`address_street` AS `address_street`,`ai`.`address_subdivision` AS `address_subdivision`,`ai`.`address_bldgno` AS `address_bldgno`,`ai`.`address_bldgname` AS `address_bldgname`,`ai`.`address_pin` AS `address_pin`,`ai`.`stuboutid` AS `stuboutid`,`ai`.`subareaid` AS `subareaid`,`ai`.`meterid` AS `meterid`,`ai`.`classificationid` AS `classificationid`,`ai`.`units` AS `units`,`ai`.`attributes` AS `attributes`,`ai`.`meterstate` AS `meterstate`,`ai`.`mobileno` AS `mobileno`,`ai`.`email` AS `email`,`ai`.`phoneno` AS `phoneno` from ((`waterworks_account` `wa` join `waterworks_account_info` `ai` on((`wa`.`acctinfoid` = `ai`.`objid`))) left join `waterworks_meter` `wm` on((`ai`.`meterid` = `wm`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_waterworks_account_info`
--

/*!50001 DROP TABLE IF EXISTS `vw_waterworks_account_info`*/;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_account_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_waterworks_account_info` AS select `ai`.`objid` AS `objid`,`ai`.`acctname` AS `acctname`,`ai`.`owner_objid` AS `owner_objid`,`ai`.`owner_name` AS `owner_name`,`ai`.`address_type` AS `address_type`,`ai`.`address_text` AS `address_text`,`ai`.`address_barangay_objid` AS `address_barangay_objid`,`ai`.`address_barangay_name` AS `address_barangay_name`,`ai`.`address_city` AS `address_city`,`ai`.`address_province` AS `address_province`,`ai`.`address_municipality` AS `address_municipality`,`ai`.`address_unitno` AS `address_unitno`,`ai`.`address_street` AS `address_street`,`ai`.`address_subdivision` AS `address_subdivision`,`ai`.`address_bldgno` AS `address_bldgno`,`ai`.`address_bldgname` AS `address_bldgname`,`ai`.`address_pin` AS `address_pin`,`ai`.`stuboutid` AS `stuboutid`,`ai`.`subareaid` AS `subareaid`,`ai`.`meterid` AS `meterid`,`ai`.`classificationid` AS `classification_objid`,`ai`.`units` AS `units`,`ai`.`attributes` AS `attributes`,`ai`.`meterstate` AS `meterstate`,`ai`.`mobileno` AS `mobileno`,`ai`.`email` AS `email`,`ai`.`phoneno` AS `phoneno`,`wm`.`serialno` AS `meter_serialno`,`wm`.`capacity` AS `meter_capacity`,`wm`.`brand` AS `meter_brand`,`wms`.`title` AS `meter_size`,`sa`.`code` AS `subarea_code`,`a`.`code` AS `subarea_area_code`,`so`.`code` AS `stubout_code` from (((((`waterworks_account_info` `ai` left join `waterworks_subarea` `sa` on((`ai`.`subareaid` = `sa`.`objid`))) left join `waterworks_area` `a` on((`sa`.`areaid` = `a`.`objid`))) left join `waterworks_stubout` `so` on((`ai`.`stuboutid` = `so`.`objid`))) left join `waterworks_meter` `wm` on((`ai`.`meterid` = `wm`.`objid`))) left join `waterworks_metersize` `wms` on((`wm`.`sizeid` = `wms`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_waterworks_application`
--

/*!50001 DROP TABLE IF EXISTS `vw_waterworks_application`*/;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_application`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_waterworks_application` AS select `app`.`objid` AS `objid`,`app`.`state` AS `state`,`app`.`dtcreated` AS `dtcreated`,`app`.`appno` AS `appno`,`app`.`apptype` AS `apptype`,`app`.`acctid` AS `acctid`,`app`.`acctinfoid` AS `acctinfoid`,`app`.`taskid` AS `taskid`,`wa`.`acctno` AS `acctno` from (`waterworks_application` `app` left join `waterworks_account` `wa` on((`app`.`acctid` = `wa`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_waterworks_batch_billing`
--

/*!50001 DROP TABLE IF EXISTS `vw_waterworks_batch_billing`*/;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_batch_billing`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_waterworks_batch_billing` AS select `wb`.`objid` AS `objid`,`wb`.`state` AS `state`,`wb`.`subareaid` AS `subareaid`,`wb`.`dtposted` AS `dtposted`,`wb`.`reader_objid` AS `reader_objid`,`wb`.`reader_name` AS `reader_name`,`wb`.`taskid` AS `taskid`,`wb`.`readingdate` AS `readingdate`,`wb`.`year` AS `year`,`wb`.`month` AS `month`,`wb`.`scheduleid` AS `scheduleid`,`wb`.`objid` AS `batchno`,(case `wb`.`month` when 1 then 'JAN' when 2 then 'FEB' when 3 then 'MAR' when 4 then 'APR' when 5 then 'MAY' when 6 then 'JUN' when 7 then 'JUL' when 8 then 'AUG' when 9 then 'SEP' when 10 then 'OCT' when 11 then 'NOV' when 12 then 'DEC' end) AS `monthname`,`sarea`.`schedulegroupid` AS `subarea_schedulegroupid`,`sarea`.`code` AS `subarea_code`,`sarea`.`barangay_name` AS `subarea_barangay_name`,`area`.`code` AS `area_code`,`p`.`fromdate` AS `period_fromdate`,`p`.`todate` AS `period_todate`,`p`.`readingdate` AS `period_readingdate`,`p`.`readingenddate` AS `period_readingenddate`,`p`.`billdate` AS `period_billdate`,`p`.`billingenddate` AS `period_billingenddate`,`p`.`discdate` AS `period_discdate`,`p`.`duedate` AS `period_duedate`,`p`.`billexpirydate` AS `period_billexpirydate` from (((`waterworks_batch_billing` `wb` join `waterworks_subarea` `sarea` on((`wb`.`subareaid` = `sarea`.`objid`))) join `waterworks_area` `area` on((`sarea`.`areaid` = `area`.`objid`))) left join `waterworks_billing_period` `p` on(((`wb`.`year` = `p`.`year`) and (`wb`.`month` = `p`.`month`) and (`wb`.`scheduleid` = `p`.`scheduleid`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_waterworks_batch_billing_error`
--

/*!50001 DROP TABLE IF EXISTS `vw_waterworks_batch_billing_error`*/;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_batch_billing_error`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_waterworks_batch_billing_error` AS select `err`.`objid` AS `objid`,`err`.`batchid` AS `batchid`,`err`.`billid` AS `billid`,`err`.`acctid` AS `acctid`,`err`.`action` AS `action`,`err`.`errmsg` AS `errmsg`,`wa`.`seqno` AS `seqno`,`wa`.`acctno` AS `acctno`,`wai`.`acctname` AS `acctname` from ((`waterworks_batch_billing_error` `err` join `waterworks_account` `wa` on((`wa`.`objid` = `err`.`acctid`))) join `waterworks_account_info` `wai` on((`wai`.`objid` = `wa`.`acctinfoid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_waterworks_bill`
--

/*!50001 DROP TABLE IF EXISTS `vw_waterworks_bill`*/;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_bill`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_waterworks_bill` AS select `wb`.`objid` AS `objid`,`wb`.`billno` AS `billno`,`wb`.`billdate` AS `billdate`,`wb`.`acctid` AS `acctid`,`wb`.`acctinfoid` AS `acctinfoid`,`wb`.`batchid` AS `batchid`,`wb`.`txnmode` AS `txnmode`,`wb`.`expirydate` AS `expirydate`,`wb`.`state` AS `state`,`wb`.`balanceforward` AS `balanceforward`,`wb`.`billed` AS `billed`,`wb`.`billrefno` AS `billrefno`,`wb`.`printed` AS `printed`,`wb`.`remarks` AS `remarks`,`wb`.`createdby_objid` AS `createdby_objid`,`wb`.`createdby_name` AS `createdby_name`,`wb`.`dtcreated` AS `dtcreated`,`wb`.`validitydate` AS `validitydate`,`wb`.`initial` AS `initial`,`wb`.`step` AS `step`,`wb`.`consumptionid` AS `consumptionid`,`wb`.`totalcredits` AS `totalcredits`,`wb`.`totalprevunpaid` AS `totalprevunpaid`,`wb`.`totalbillunpaid` AS `totalbillunpaid`,`wb`.`billamount` AS `billamount`,`wb`.`totalsurcharge` AS `totalsurcharge`,`wb`.`totalpayment` AS `totalpayment`,`wb`.`totaldiscount` AS `totaldiscount`,`wb`.`year` AS `year`,`wb`.`month` AS `month`,`wb`.`scheduleid` AS `scheduleid`,(case `wb`.`month` when 1 then 'JAN' when 2 then 'FEB' when 3 then 'MAR' when 4 then 'APR' when 5 then 'MAY' when 6 then 'JUN' when 7 then 'JUL' when 8 then 'AUG' when 9 then 'SEP' when 10 then 'OCT' when 11 then 'NOV' when 12 then 'DEC' end) AS `monthname`,`a`.`acctno` AS `acctno`,`ai`.`acctname` AS `acctname`,`a`.`state` AS `acctstate`,`a`.`seqno` AS `seqno`,`ai`.`subareaid` AS `subareaid`,`ai`.`address_text` AS `address_text`,`ai`.`classificationid` AS `classificationid`,`ai`.`stuboutid` AS `stuboutid`,`ai`.`meterid` AS `meterid`,`ai`.`meterstate` AS `meterstate`,`sarea`.`schedulegroupid` AS `subarea_schedulegroupid`,`sarea`.`code` AS `subarea_code`,`sarea`.`barangay_name` AS `subarea_barangay_name`,`area`.`code` AS `area_code`,`p`.`fromdate` AS `period_fromdate`,`p`.`todate` AS `period_todate`,`p`.`readingdate` AS `period_readingdate`,`p`.`readingenddate` AS `period_readingenddate`,`p`.`billdate` AS `period_billdate`,`p`.`billingenddate` AS `period_billingenddate`,`p`.`discdate` AS `period_discdate`,`p`.`duedate` AS `period_duedate`,`p`.`billexpirydate` AS `period_billexpirydate` from (((((`waterworks_bill` `wb` join `waterworks_account` `a` on((`a`.`objid` = `wb`.`acctid`))) join `waterworks_account_info` `ai` on((`wb`.`acctinfoid` = `ai`.`objid`))) join `waterworks_subarea` `sarea` on((`ai`.`subareaid` = `sarea`.`objid`))) join `waterworks_area` `area` on((`sarea`.`areaid` = `area`.`objid`))) left join `waterworks_billing_period` `p` on(((`wb`.`year` = `p`.`year`) and (`wb`.`month` = `p`.`month`) and (`wb`.`scheduleid` = `p`.`scheduleid`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_waterworks_bill_consumption`
--

/*!50001 DROP TABLE IF EXISTS `vw_waterworks_bill_consumption`*/;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_bill_consumption`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_waterworks_bill_consumption` AS select `wc`.`objid` AS `objid`,`wc`.`billid` AS `billid`,`wc`.`reading` AS `reading`,`wc`.`volume` AS `volume`,`wc`.`amount` AS `amount`,`wc`.`hold` AS `hold`,`wc`.`reason` AS `reason`,`wc`.`readingdate` AS `readingdate`,`wc`.`reader_objid` AS `reader_objid`,`wc`.`reader_name` AS `reader_name`,`prev`.`reading` AS `prev_reading`,`wb`.`batchid` AS `batchid` from ((`waterworks_consumption` `wc` left join `waterworks_bill` `wb` on((`wc`.`billid` = `wb`.`objid`))) left join `waterworks_consumption` `prev` on(((`prev`.`acctid` = `wc`.`acctid`) and (`prev`.`meterid` = `wc`.`meterid`) and (((`prev`.`year` * 12) + `prev`.`month`) = (((`wc`.`year` * 12) + `wc`.`month`) - 1))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_waterworks_change_request`
--

/*!50001 DROP TABLE IF EXISTS `vw_waterworks_change_request`*/;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_change_request`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_waterworks_change_request` AS select `wcr`.`objid` AS `objid`,`wcr`.`controlno` AS `controlno`,`wcr`.`apptype` AS `apptype`,`wcr`.`dtcreated` AS `dtcreated`,`wcr`.`acctid` AS `acctid`,`wcr`.`acctinfoid` AS `acctinfoid`,`wcr`.`newacctinfoid` AS `newacctinfoid`,`wcr`.`reason` AS `reason`,`wcr`.`taskid` AS `taskid`,`wa`.`acctno` AS `account_acctno`,`t`.`state` AS `task_state`,`t`.`startdate` AS `task_startdate`,`t`.`enddate` AS `task_enddate`,`t`.`assignee_objid` AS `task_assignee_objid`,`t`.`assignee_name` AS `task_assignee_name`,`t`.`actor_objid` AS `task_actor_objid`,`t`.`actor_name` AS `task_actor_name`,(select `sys_wf_node`.`title` from `sys_wf_node` where ((`sys_wf_node`.`processname` = 'waterworks_change_request') and (`sys_wf_node`.`name` = `t`.`state`))) AS `task_title` from ((`waterworks_change_request` `wcr` join `waterworks_change_request_task` `t` on((`wcr`.`taskid` = `t`.`taskid`))) join `waterworks_account` `wa` on((`wcr`.`acctid` = `wa`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_waterworks_compromise`
--

/*!50001 DROP TABLE IF EXISTS `vw_waterworks_compromise`*/;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_compromise`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_waterworks_compromise` AS select `wcr`.`objid` AS `objid`,`wcr`.`controlno` AS `controlno`,`wcr`.`state` AS `state`,`wcr`.`dtcreated` AS `dtcreated`,`wcr`.`acctid` AS `acctid`,`wcr`.`acctinfoid` AS `acctinfoid`,`wcr`.`particulars` AS `particulars`,`wcr`.`taskid` AS `taskid`,`wcr`.`amount` AS `amount`,`wcr`.`downpaymentrate` AS `downpaymentrate`,`wcr`.`downpayment` AS `downpayment`,`wcr`.`term` AS `term`,`wcr`.`startduedate` AS `startduedate`,(`wcr`.`amount` - `wcr`.`downpayment`) AS `balance`,`wa`.`acctno` AS `acctno`,`t`.`state` AS `task_state`,`t`.`startdate` AS `task_startdate`,`t`.`enddate` AS `task_enddate`,`t`.`assignee_objid` AS `task_assignee_objid`,`t`.`assignee_name` AS `task_assignee_name`,`t`.`actor_objid` AS `task_actor_objid`,`t`.`actor_name` AS `task_actor_name`,(select `sys_wf_node`.`title` from `sys_wf_node` where ((`sys_wf_node`.`processname` = 'waterworks_compromise') and (`sys_wf_node`.`name` = `t`.`state`))) AS `task_title` from ((`waterworks_compromise` `wcr` join `waterworks_compromise_task` `t` on((`wcr`.`taskid` = `t`.`taskid`))) join `waterworks_account` `wa` on((`wcr`.`acctid` = `wa`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_waterworks_compromise_billitem`
--

/*!50001 DROP TABLE IF EXISTS `vw_waterworks_compromise_billitem`*/;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_compromise_billitem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_waterworks_compromise_billitem` AS select `wcb`.`objid` AS `objid`,`wcb`.`parentid` AS `parentid`,`wcb`.`billitemid` AS `billitemid`,`wcb`.`amount` AS `amount`,`wcb`.`amtpaid` AS `amtpaid`,`bi`.`year` AS `year`,`bi`.`month` AS `month`,`ia`.`title` AS `item_title` from ((`waterworks_compromise_billitem` `wcb` join `waterworks_billitem` `bi` on((`wcb`.`billitemid` = `bi`.`objid`))) join `waterworks_itemaccount` `ia` on((`bi`.`itemid` = `ia`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_waterworks_consumption`
--

/*!50001 DROP TABLE IF EXISTS `vw_waterworks_consumption`*/;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_consumption`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_waterworks_consumption` AS select `wc`.`objid` AS `objid`,`wc`.`acctid` AS `acctid`,`wc`.`meterid` AS `meterid`,`wc`.`year` AS `year`,`wc`.`month` AS `month`,`wc`.`billid` AS `billid`,`wc`.`txnmode` AS `txnmode`,`wc`.`reading` AS `reading`,`wc`.`volume` AS `volume`,`wc`.`amount` AS `amount`,`wc`.`state` AS `state`,`wc`.`hold` AS `hold`,`wc`.`reason` AS `reason`,`wc`.`reader_objid` AS `reader_objid`,`wc`.`reader_name` AS `reader_name`,`wc`.`readingdate` AS `readingdate`,`prev`.`reading` AS `prev_reading`,`prev`.`month` AS `prev_month`,`prev`.`year` AS `prev_year`,`wb`.`batchid` AS `batchid` from ((`waterworks_consumption` `wc` left join `waterworks_bill` `wb` on((`wb`.`objid` = `wc`.`billid`))) left join `waterworks_consumption` `prev` on(((`prev`.`acctid` = `wc`.`acctid`) and (`prev`.`meterid` = `wc`.`meterid`) and (((`prev`.`year` * 12) + `prev`.`month`) = (((`wc`.`year` * 12) + `wc`.`month`) - 1))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_waterworks_disconnection`
--

/*!50001 DROP TABLE IF EXISTS `vw_waterworks_disconnection`*/;
/*!50001 DROP VIEW IF EXISTS `vw_waterworks_disconnection`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_waterworks_disconnection` AS select `wcr`.`objid` AS `objid`,`wcr`.`controlno` AS `controlno`,`wcr`.`dtcreated` AS `dtcreated`,`wcr`.`acctid` AS `acctid`,`wcr`.`acctinfoid` AS `acctinfoid`,`wcr`.`reason` AS `reason`,`wcr`.`taskid` AS `taskid`,`wcr`.`amountdue` AS `amountdue`,`wa`.`acctno` AS `account_acctno`,`t`.`state` AS `task_state`,`t`.`startdate` AS `task_startdate`,`t`.`enddate` AS `task_enddate`,`t`.`assignee_objid` AS `task_assignee_objid`,`t`.`assignee_name` AS `task_assignee_name`,`t`.`actor_objid` AS `task_actor_objid`,`t`.`actor_name` AS `task_actor_name`,(select `sys_wf_node`.`title` from `sys_wf_node` where ((`sys_wf_node`.`processname` = 'waterworks_disconnection') and (`sys_wf_node`.`name` = `t`.`state`))) AS `task_title` from ((`waterworks_disconnection` `wcr` join `waterworks_disconnection_task` `t` on((`wcr`.`taskid` = `t`.`taskid`))) join `waterworks_account` `wa` on((`wcr`.`acctid` = `wa`.`objid`))) */;
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

-- Dump completed on 2021-02-19 12:51:42
