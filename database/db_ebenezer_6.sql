/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_ebenezer

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-02-24 19:35:45
*/
-- DROP DATABASE IF EXISTS `db_ebenezer`;
-- CREATE DATABASE IF NOT EXISTS `db_ebenezer` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
-- USE `db_ebenezer`;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accounting_account
-- ----------------------------
DROP TABLE IF EXISTS `accounting_account`;
CREATE TABLE `accounting_account` (
  `AccountingAccountId` int(11) NOT NULL AUTO_INCREMENT,
  `AccountingAccountCod` varchar(10) NOT NULL,
  `AccountingAccountDescription` text NOT NULL,
  `AccountingAccountStatus` bit(1) NOT NULL,
  PRIMARY KEY (`AccountingAccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accounting_account
-- ----------------------------

-- ----------------------------
-- Table structure for assigned_roles
-- ----------------------------
DROP TABLE IF EXISTS `assigned_roles`;
CREATE TABLE `assigned_roles` (
  `MenuId` int(11) NOT NULL,
  `RoleId` int(11) NOT NULL,
  `Access` bit(1) NOT NULL,
  PRIMARY KEY (`MenuId`,`RoleId`),
  KEY `fk_AssignedRoles_Role1_idx` (`RoleId`),
  CONSTRAINT `fk_AssignedRoles_ModuleMenu1` FOREIGN KEY (`MenuId`) REFERENCES `module_menu` (`ModuleMenuId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_AssignedRoles_Role1` FOREIGN KEY (`RoleId`) REFERENCES `role` (`RoleId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assigned_roles
-- ----------------------------
INSERT INTO `assigned_roles` VALUES ('1', '1', '');
INSERT INTO `assigned_roles` VALUES ('2', '1', '');
INSERT INTO `assigned_roles` VALUES ('3', '1', '');
INSERT INTO `assigned_roles` VALUES ('4', '1', '');
INSERT INTO `assigned_roles` VALUES ('5', '1', '');
INSERT INTO `assigned_roles` VALUES ('6', '1', '');
INSERT INTO `assigned_roles` VALUES ('7', '1', '');
INSERT INTO `assigned_roles` VALUES ('8', '1', '');
INSERT INTO `assigned_roles` VALUES ('9', '1', '');
INSERT INTO `assigned_roles` VALUES ('10', '1', '');
INSERT INTO `assigned_roles` VALUES ('11', '1', '');
INSERT INTO `assigned_roles` VALUES ('12', '1', '');
INSERT INTO `assigned_roles` VALUES ('13', '1', '');
INSERT INTO `assigned_roles` VALUES ('14', '1', '');
INSERT INTO `assigned_roles` VALUES ('15', '1', '');
INSERT INTO `assigned_roles` VALUES ('16', '1', '');
INSERT INTO `assigned_roles` VALUES ('17', '1', '');
INSERT INTO `assigned_roles` VALUES ('18', '1', '');
INSERT INTO `assigned_roles` VALUES ('19', '1', '');
INSERT INTO `assigned_roles` VALUES ('20', '1', '');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `CustomerId` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerName` text NOT NULL,
  `CustomerDocument` char(3) NOT NULL,
  `CustomerDocumentNumber` int(11) NOT NULL,
  `CustomerAddress` text,
  `CustomerTelephone` varchar(50) DEFAULT NULL,
  `CustomerEmail` varchar(50) DEFAULT NULL,
  `CustomerStatus` bit(1) NOT NULL,
  PRIMARY KEY (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------

-- ----------------------------
-- Table structure for document
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `DocumentId` int(11) NOT NULL AUTO_INCREMENT,
  `DocumentTypeId` int(11) NOT NULL,
  `OriginsId` int(11) NOT NULL,
  `DocumentTaxableId` int(11) NOT NULL,
  `DocumentIgvId` int(11) NOT NULL,
  `DocumentTotalAmountId` int(11) NOT NULL,
  `ThirdCompanyId` int(11) NOT NULL,
  `ExchangeRateId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `TaxIgvId` int(11) NOT NULL,
  `PaymentMethodId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `DocumentDate` date NOT NULL,
  `DocumentSerie` varchar(50) NOT NULL,
  `DocumentNumber` varchar(50) NOT NULL,
  `DocumentGlosa` text,
  `DocumentStatus` bit(1) NOT NULL,
  PRIMARY KEY (`DocumentId`),
  KEY `fk_Document_DocumentType1_idx` (`DocumentTypeId`),
  KEY `fk_Document_Origins1_idx` (`OriginsId`),
  KEY `fk_Document_DocumentTaxable1_idx` (`DocumentTaxableId`),
  KEY `fk_Document_DocumentIgv1_idx` (`DocumentIgvId`),
  KEY `fk_Document_DocumentTotalAmount1_idx` (`DocumentTotalAmountId`),
  KEY `fk_Document_ThirdCompany1_idx` (`ThirdCompanyId`),
  KEY `fk_Document_ExchangeRate1_idx` (`ExchangeRateId`),
  KEY `fk_Document_Customer1_idx` (`CustomerId`),
  KEY `fk_Document_TaxIgv1_idx` (`TaxIgvId`),
  KEY `fk_Document_PaymentMethod1_idx` (`PaymentMethodId`),
  KEY `fk_Document_User1_idx` (`UserId`),
  CONSTRAINT `fk_Document_Customer1` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Document_DocumentIgv1` FOREIGN KEY (`DocumentIgvId`) REFERENCES `document_igv` (`DocumentIgvId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Document_DocumentTaxable1` FOREIGN KEY (`DocumentTaxableId`) REFERENCES `document_taxable` (`DocumentTaxableId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Document_DocumentTotalAmount1` FOREIGN KEY (`DocumentTotalAmountId`) REFERENCES `document_totalamount` (`DocumentTotalAmountId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Document_DocumentType1` FOREIGN KEY (`DocumentTypeId`) REFERENCES `document_type` (`DocumentTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Document_ExchangeRate1` FOREIGN KEY (`ExchangeRateId`) REFERENCES `exchange_rate` (`ExchangeRateId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Document_Origins1` FOREIGN KEY (`OriginsId`) REFERENCES `origins` (`OriginsId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Document_PaymentMethod1` FOREIGN KEY (`PaymentMethodId`) REFERENCES `payment_method` (`PaymentMethodId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Document_TaxIgv1` FOREIGN KEY (`TaxIgvId`) REFERENCES `tax_igv` (`TaxIgvId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Document_ThirdCompany1` FOREIGN KEY (`ThirdCompanyId`) REFERENCES `third_company` (`ThirdCompanyId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Document_User1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of document
-- ----------------------------

-- ----------------------------
-- Table structure for document_igv
-- ----------------------------
DROP TABLE IF EXISTS `document_igv`;
CREATE TABLE `document_igv` (
  `DocumentIgvId` int(11) NOT NULL AUTO_INCREMENT,
  `AccountingAccountId` int(11) NOT NULL,
  `DocumentIgvValue` decimal(19,2) NOT NULL,
  `DocumentIgvEquivalent` decimal(19,2) NOT NULL,
  PRIMARY KEY (`DocumentIgvId`),
  KEY `fk_DocumentIgv_AccountingAccount1_idx` (`AccountingAccountId`),
  CONSTRAINT `fk_DocumentIgv_AccountingAccount1` FOREIGN KEY (`AccountingAccountId`) REFERENCES `accounting_account` (`AccountingAccountId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of document_igv
-- ----------------------------

-- ----------------------------
-- Table structure for document_taxable
-- ----------------------------
DROP TABLE IF EXISTS `document_taxable`;
CREATE TABLE `document_taxable` (
  `DocumentTaxableId` int(11) NOT NULL AUTO_INCREMENT,
  `AccountingAccountId` int(11) NOT NULL,
  `DocumentTaxableValue` decimal(19,2) NOT NULL,
  `DocumentTaxableEquivalent` decimal(19,2) NOT NULL,
  PRIMARY KEY (`DocumentTaxableId`),
  KEY `fk_DocumentTaxable_AccountingAccount1_idx` (`AccountingAccountId`),
  CONSTRAINT `fk_DocumentTaxable_AccountingAccount1` FOREIGN KEY (`AccountingAccountId`) REFERENCES `accounting_account` (`AccountingAccountId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of document_taxable
-- ----------------------------

-- ----------------------------
-- Table structure for document_totalamount
-- ----------------------------
DROP TABLE IF EXISTS `document_totalamount`;
CREATE TABLE `document_totalamount` (
  `DocumentTotalAmountId` int(11) NOT NULL AUTO_INCREMENT,
  `AccountingAccountId` int(11) NOT NULL,
  `DocumentTotalAmountValue` decimal(19,2) NOT NULL,
  `DocumentTotalAmountEquivalent` decimal(19,2) NOT NULL,
  PRIMARY KEY (`DocumentTotalAmountId`),
  KEY `fk_DocumentTotalAmount_AccountingAccount1_idx` (`AccountingAccountId`),
  CONSTRAINT `fk_DocumentTotalAmount_AccountingAccount1` FOREIGN KEY (`AccountingAccountId`) REFERENCES `accounting_account` (`AccountingAccountId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of document_totalamount
-- ----------------------------

-- ----------------------------
-- Table structure for document_type
-- ----------------------------
DROP TABLE IF EXISTS `document_type`;
CREATE TABLE `document_type` (
  `DocumentTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `DocumentTypeCode` char(2) NOT NULL,
  `DocumentTypeName` varchar(50) NOT NULL,
  `DocumentTypeDescription` text,
  `DocumentTypeStatus` bit(1) NOT NULL,
  PRIMARY KEY (`DocumentTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of document_type
-- ----------------------------

-- ----------------------------
-- Table structure for exchange_rate
-- ----------------------------
DROP TABLE IF EXISTS `exchange_rate`;
CREATE TABLE `exchange_rate` (
  `ExchangeRateId` int(11) NOT NULL AUTO_INCREMENT,
  `ExchangeRateDate` date NOT NULL,
  `ExchangeRateDollarSale` decimal(19,2) NOT NULL,
  `ExchangeRateDollarBuy` decimal(19,2) NOT NULL,
  `ExchangeRateStatus` bit(1) NOT NULL,
  PRIMARY KEY (`ExchangeRateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exchange_rate
-- ----------------------------

-- ----------------------------
-- Table structure for module_menu
-- ----------------------------
DROP TABLE IF EXISTS `module_menu`;
CREATE TABLE `module_menu` (
  `ModuleMenuId` int(11) NOT NULL AUTO_INCREMENT,
  `ModuleMenuIdFather` int(11) DEFAULT NULL,
  `ModuleMenuName` varchar(150) NOT NULL,
  `ModuleMenuLink` varchar(150) DEFAULT NULL,
  `ModuleMenuLevel` int(11) NOT NULL,
  `ModuleMenuIcon` varchar(50) DEFAULT NULL,
  `ModuleMenuButtonColor` varchar(7) DEFAULT NULL,
  `ModuleMenuInformation` varchar(150) DEFAULT NULL,
  `ModuleMenuPosition` int(11) DEFAULT NULL,
  `ModuleMenuStatus` bit(1) NOT NULL,
  PRIMARY KEY (`ModuleMenuId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of module_menu
-- ----------------------------
INSERT INTO `module_menu` VALUES ('1', null, 'Cliente', 'javascript:void(0);', '1', 'icon-grid', null, null, '3', '');
INSERT INTO `module_menu` VALUES ('2', '1', 'Registro de cliente', 'register-customer', '2', null, null, null, '1', '');
INSERT INTO `module_menu` VALUES ('3', null, 'Usuario', 'javascript:void(0);', '1', 'icon-users', null, null, '4', '');
INSERT INTO `module_menu` VALUES ('4', '3', 'Registro de usuario', 'register-user', '2', null, null, null, '1', '');
INSERT INTO `module_menu` VALUES ('5', '3', 'Registro de rol', 'register-role', '2', null, null, null, '2', '');
INSERT INTO `module_menu` VALUES ('6', '3', 'Registro de modulo', 'register-module', '2', null, null, null, '3', '');
INSERT INTO `module_menu` VALUES ('7', '3', 'Asignacion de modulo', 'register-assignedmodule', '2', null, null, null, '4', '');
INSERT INTO `module_menu` VALUES ('8', null, 'Informe contable', 'javascript:void(0);', '1', 'icon-book-open', null, null, '2', '');
INSERT INTO `module_menu` VALUES ('9', '8', 'Registro de ventas', 'register-sale', '2', null, null, null, '1', '');
INSERT INTO `module_menu` VALUES ('10', '8', 'Registro de compras', 'register-buy', '2', null, null, null, '2', '');
INSERT INTO `module_menu` VALUES ('11', null, 'Mantenimiento', 'javascript:void(0);', '1', ' icon-wrench', null, null, '5', '');
INSERT INTO `module_menu` VALUES ('12', '11', 'Tipo de documento', 'register-documenttype', '2', null, null, null, '1', '');
INSERT INTO `module_menu` VALUES ('13', '11', 'Origenes', 'register-origin', '2', null, null, null, '2', '');
INSERT INTO `module_menu` VALUES ('14', '11', 'Terceros', 'register-thirdcompany', '2', null, null, null, '3', '');
INSERT INTO `module_menu` VALUES ('15', '11', 'Medios de pagos', 'register-paymentmethod', '2', null, null, null, '4', '');
INSERT INTO `module_menu` VALUES ('16', '11', 'Impuesto IGV', 'register-taxigv', '2', null, null, null, '5', '');
INSERT INTO `module_menu` VALUES ('17', '11', 'Tipo de cambio', 'register-exchangerate', '2', null, null, null, '6', '');
INSERT INTO `module_menu` VALUES ('18', null, 'Dashboard', 'base_url()', '1', 'icon-home', null, null, '1', '');
INSERT INTO `module_menu` VALUES ('19', null, 'Agenda', 'javascript:void(0);', '1', 'icon-calendar', null, null, '6', '');
INSERT INTO `module_menu` VALUES ('20', '19', 'Cronograma Sunat', 'sunat-schedule', '2', null, null, null, '1', '');

-- ----------------------------
-- Table structure for origins
-- ----------------------------
DROP TABLE IF EXISTS `origins`;
CREATE TABLE `origins` (
  `OriginsId` int(11) NOT NULL AUTO_INCREMENT,
  `OriginsCode` char(2) NOT NULL,
  `OriginsName` varchar(50) NOT NULL,
  `OriginsStatus` varchar(45) NOT NULL,
  PRIMARY KEY (`OriginsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of origins
-- ----------------------------

-- ----------------------------
-- Table structure for payment_method
-- ----------------------------
DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE `payment_method` (
  `PaymentMethodId` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentMethodCode` varchar(10) NOT NULL,
  `PaymentMethodName` varchar(50) NOT NULL,
  `PaymentMethodStatus` bit(1) NOT NULL,
  PRIMARY KEY (`PaymentMethodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment_method
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `RoleId` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(50) NOT NULL,
  `RoleStatus` bit(1) NOT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'ADMINISTRADOR', '');

-- ----------------------------
-- Table structure for schedule_sunat
-- ----------------------------
DROP TABLE IF EXISTS `schedule_sunat`;
CREATE TABLE `schedule_sunat` (
  `SchedulePeriod` date NOT NULL,
  `ScheduleDigit` int(11) NOT NULL,
  `ScheduleDueDate` date NOT NULL,
  `ScheduleProgramDate` date NOT NULL,
  `ScheduleProgramTime` time NOT NULL,
  `ScheduleCompleteStatus` bit(1) NOT NULL,
  `ScheduleStatus` bit(1) NOT NULL,
  `UserId` int(11) NOT NULL,
  PRIMARY KEY (`SchedulePeriod`,`ScheduleDigit`),
  UNIQUE KEY `un_ScheduleDueDate` (`ScheduleDueDate`),
  KEY `fk_UserId` (`UserId`),
  CONSTRAINT `fk_UserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------
-- Table structure for tax_igv
-- ----------------------------
DROP TABLE IF EXISTS `tax_igv`;
CREATE TABLE `tax_igv` (
  `TaxIgvId` int(11) NOT NULL AUTO_INCREMENT,
  `TaxIgvDate` date NOT NULL,
  `TaxIgvValue` decimal(19,2) NOT NULL,
  `TaxIgvStatus` bit(1) NOT NULL,
  PRIMARY KEY (`TaxIgvId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tax_igv
-- ----------------------------

-- ----------------------------
-- Table structure for third_company
-- ----------------------------
DROP TABLE IF EXISTS `third_company`;
CREATE TABLE `third_company` (
  `ThirdCompanyId` int(11) NOT NULL AUTO_INCREMENT,
  `ThirdCompanyName` text NOT NULL,
  `ThirdCompanyType` bit(1) NOT NULL,
  `ThirdCompanyDocument` char(3) NOT NULL,
  `ThirdCompanyDocumentNumber` int(11) NOT NULL,
  `ThirdCompanyAddress` text,
  `ThirdCompanyTelephone` varchar(50) DEFAULT NULL,
  `ThirdCompanyStatus` bit(1) NOT NULL,
  PRIMARY KEY (`ThirdCompanyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of third_company
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `UserRoleId` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `UserLastName` varchar(100) NOT NULL,
  `UserLoginName` varchar(10) NOT NULL,
  `UserLoginPassword` varchar(20) NOT NULL,
  `UserBirthdate` date DEFAULT NULL,
  `UserTelephone` varchar(50) DEFAULT NULL,
  `UserEmail` varchar(100) DEFAULT NULL,
  `UserImage` blob,
  `UserStatus` bit(1) NOT NULL,
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `Unique_UserLoginName` (`UserLoginName`),
  KEY `fk_User_Role_idx` (`UserRoleId`),
  CONSTRAINT `fk_User_Role` FOREIGN KEY (`UserRoleId`) REFERENCES `role` (`RoleId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', 'Jean Carlos', 'Sánchez Castromonte', 'admin', '123', '1993-05-12', '943103555', 'jeanscastro7@gmial.com', null, '');
INSERT INTO `user` VALUES ('2', '1', 'ejemplo', 'ejemplo', 'ejemplo', 'ejemplo', null, null, 'ejemplo', null, '\0');

-- ----------------------------
-- Procedure structure for sp_GetAllRoles
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_GetAllRoles`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetAllRoles`()
BEGIN
			SELECT
			RoleId,
			RoleName
			FROM  role
			WHERE RoleStatus=TRUE
			ORDER BY RoleId ASC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_GetAllUsers
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_GetAllUsers`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetAllUsers`()
BEGIN
			SELECT
      u.UserId,
			u.UserImage,
			u.UserLoginName,
			u.UserName,
			u.UserLastName,
			DATE_FORMAT(u.UserBirthdate,'%d/%m/%Y') as UserBirthdate,
			u.UserTelephone,
			u.UserEmail,
			u.UserStatus,
			r.RoleName
			FROM `user` u
			INNER JOIN role r ON r.RoleId=u.UserRoleId
			ORDER BY u.UserLoginName ASC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_GetMenuByRole
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_GetMenuByRole`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetMenuByRole`(IN `_RoleId` INT)
BEGIN

  SELECT ar.MenuId,m.ModuleMenuIdFather,m.ModuleMenuName,m.ModuleMenuLink,m.ModuleMenuLevel,m.ModuleMenuPosition,
	m.ModuleMenuIcon
	FROM assigned_roles ar
	INNER JOIN role r ON r.RoleId=ar.RoleId
	INNER JOIN module_menu m ON m.ModuleMenuId=ar.MenuId
	WHERE r.RoleId=`_RoleId` AND r.RoleStatus=TRUE AND ar.Access=TRUE AND m.ModuleMenuStatus=TRUE AND m.ModuleMenuLevel=1
	ORDER BY m.ModuleMenuPosition ASC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_GetScheduleAlert
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_GetScheduleAlert`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetScheduleAlert`()
BEGIN 
  DECLARE _schedule DATETIME;
	DECLARE _period DATE;
	DECLARE _digit INT;

  SELECT TIMESTAMP(ss.ScheduleProgramDate,ss.ScheduleProgramTime) AS ScheduleDatetime,
	ss.SchedulePeriod,ss.ScheduleDigit
	INTO _schedule,_period,_digit
	FROM schedule_sunat ss 
	WHERE ss.ScheduleCompleteStatus=0 AND ss.ScheduleStatus=1 ORDER BY ScheduleDatetime ASC LIMIT 1;

	SELECT TIMESTAMPDIFF(SECOND, NOW(), _schedule) AS AlertSeconds,_period,_digit;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_GetScheduleSunatByPeriod
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_GetScheduleSunatByPeriod`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetScheduleSunatByPeriod`(IN `_Period`  DATE)
BEGIN

  SELECT
  DATE_FORMAT(ss.SchedulePeriod,'%d/%m/%Y') as SchedulePeriod,
  ss.ScheduleDigit,
  DATE_FORMAT(ss.ScheduleDueDate,'%d/%m/%Y') as ScheduleDueDate,
  DATE_FORMAT(ss.ScheduleProgramDate,'%d/%m/%Y') as ScheduleProgramDate,
  TIME_FORMAT(ss.ScheduleProgramTime,'%h:%i %p') as ScheduleProgramTime,
  ss.ScheduleStatus,
  u.UserName  
	FROM schedule_sunat ss
  INNER JOIN user u ON u.UserId=ss.UserId
	WHERE ss.SchedulePeriod LIKE (CASE WHEN _Period=0 THEN '%' ELSE _Period  END) AND ss.ScheduleStatus=true
	ORDER BY ss.ScheduleDigit ASC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_GetScheduleSunatByYear
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_GetScheduleSunatByYear`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetScheduleSunatByYear`(IN `_Period`  CHAR(4))
BEGIN
	SET lc_time_names = 'es_VE';
	SELECT
	UPPER(DATE_FORMAT(ss.SchedulePeriod,'%M - %Y')) as Period,
	(SELECT DATE_FORMAT(s1.ScheduleDueDate,'%d - %M') as ScheduleDueDate from schedule_sunat s1 WHERE s1.ScheduleDigit=0 AND s1.SchedulePeriod=ss.SchedulePeriod) as d0,
	(SELECT DATE_FORMAT(s1.ScheduleDueDate,'%d - %M')  as ScheduleDueDate from schedule_sunat s1 WHERE s1.ScheduleDigit=1 AND s1.SchedulePeriod=ss.SchedulePeriod) as d1,
	(SELECT DATE_FORMAT(s1.ScheduleDueDate,'%d - %M')  as ScheduleDueDate from schedule_sunat s1 WHERE s1.ScheduleDigit=2 AND s1.SchedulePeriod=ss.SchedulePeriod) as d2,
	(SELECT DATE_FORMAT(s1.ScheduleDueDate,'%d - %M')  as ScheduleDueDate from schedule_sunat s1 WHERE s1.ScheduleDigit=3 AND s1.SchedulePeriod=ss.SchedulePeriod) as d3,
	(SELECT DATE_FORMAT(s1.ScheduleDueDate,'%d - %M')  as ScheduleDueDate from schedule_sunat s1 WHERE s1.ScheduleDigit=4 AND s1.SchedulePeriod=ss.SchedulePeriod) as d4,
	(SELECT DATE_FORMAT(s1.ScheduleDueDate,'%d - %M')  as ScheduleDueDate from schedule_sunat s1 WHERE s1.ScheduleDigit=5 AND s1.SchedulePeriod=ss.SchedulePeriod) as d5,
	(SELECT DATE_FORMAT(s1.ScheduleDueDate,'%d - %M')  as ScheduleDueDate from schedule_sunat s1 WHERE s1.ScheduleDigit=6 AND s1.SchedulePeriod=ss.SchedulePeriod) as d6,
	(SELECT DATE_FORMAT(s1.ScheduleDueDate,'%d - %M')  as ScheduleDueDate from schedule_sunat s1 WHERE s1.ScheduleDigit=7 AND s1.SchedulePeriod=ss.SchedulePeriod) as d7,
	(SELECT DATE_FORMAT(s1.ScheduleDueDate,'%d - %M')  as ScheduleDueDate from schedule_sunat s1 WHERE s1.ScheduleDigit=8 AND s1.SchedulePeriod=ss.SchedulePeriod) as d8,
	(SELECT DATE_FORMAT(s1.ScheduleDueDate,'%d - %M')  as ScheduleDueDate from schedule_sunat s1 WHERE s1.ScheduleDigit=9 AND s1.SchedulePeriod=ss.SchedulePeriod) as d9
	FROM schedule_sunat ss
	WHERE ss.SchedulePeriod LIKE CONCAT('%',_Period,'%') AND ss.ScheduleStatus=true
	GROUP BY ss.SchedulePeriod;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_GetSubMenu
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_GetSubMenu`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetSubMenu`(IN `_RoleId` INT, IN `_MenuId` INT)
BEGIN

  SELECT ar.MenuId,m.ModuleMenuIdFather,m.ModuleMenuName,m.ModuleMenuLink,m.ModuleMenuLevel,m.ModuleMenuPosition
	FROM assigned_roles ar
	INNER JOIN role r ON r.RoleId=ar.RoleId
	INNER JOIN module_menu m ON m.ModuleMenuId=ar.MenuId
	WHERE r.RoleId=`_RoleId` AND r.RoleStatus=TRUE AND ar.Access=TRUE AND m.ModuleMenuStatus=TRUE AND m.ModuleMenuIdFather=`_MenuId`
	ORDER BY m.ModuleMenuPosition ASC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_LoginUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_LoginUser`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_LoginUser`(IN `_UserLoginName` VARCHAR(10), IN `_UserLoginPassword` VARCHAR(20))
BEGIN

  SELECT u.UserId,u.UserLoginName,u.UserName,u.UserImage,r.RoleId,r.RoleName FROM `user` u
	INNER JOIN role r ON r.RoleId=u.UserRoleId
	WHERE u.UserLoginName=`_UserLoginName` AND u.UserLoginPassword=`_UserLoginPassword`
	AND u.UserStatus=TRUE AND r.RoleStatus=TRUE;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_SetScheduleSunat
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_SetScheduleSunat`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_SetScheduleSunat`(IN `_period` DATE,IN `_digit` INT,IN `_duedate` DATE,IN `_programdate` DATE,IN `_programtime` TIME,IN `_status` BIT,IN `_user` INT)
BEGIN
  INSERT INTO schedule_sunat(SchedulePeriod,ScheduleDigit,ScheduleDueDate,ScheduleProgramDate,ScheduleProgramTime,ScheduleStatus,ScheduleCompleteStatus,UserId)
  VALUES (`_period`,`_digit`,`_duedate`,`_programdate`,`_programtime`,`_status`,0,`_user`); 
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_UpdateCompleteScheduleSunat
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_UpdateCompleteScheduleSunat`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdateCompleteScheduleSunat`(IN `_period` DATE,IN `_digit` INT)
BEGIN
  UPDATE schedule_sunat
	SET ScheduleCompleteStatus=1
	WHERE SchedulePeriod=_period AND ScheduleDigit=_digit;
END
;;
DELIMITER ;
