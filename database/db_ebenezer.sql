-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-01-2017 a las 01:50:09
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 7.0.4
CHARSET utf8
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_ebenezer`
--
CREATE DATABASE IF NOT EXISTS `db_ebenezer` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_ebenezer`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `sp_GetMenuByRole`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetMenuByRole` (IN `_RoleId` INT)  BEGIN

  SELECT ar.MenuId,m.ModuleMenuIdFather,m.ModuleMenuName,m.ModuleMenuLink,m.ModuleMenuLevel,m.ModuleMenuPosition
	FROM assigned_roles ar
	INNER JOIN role r ON r.RoleId=ar.RoleId
	INNER JOIN module_menu m ON m.ModuleMenuId=ar.MenuId
	WHERE r.RoleId=`_RoleId` AND r.RoleStatus=TRUE AND ar.Access=TRUE AND m.ModuleMenuStatus=TRUE AND m.ModuleMenuLevel=1
	ORDER BY m.ModuleMenuPosition ASC;
END$$

DROP PROCEDURE IF EXISTS `sp_GetSubMenu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetSubMenu` (IN `_RoleId` INT, IN `_MenuId` INT)  BEGIN

  SELECT ar.MenuId,m.ModuleMenuIdFather,m.ModuleMenuName,m.ModuleMenuLink,m.ModuleMenuLevel,m.ModuleMenuPosition
	FROM assigned_roles ar
	INNER JOIN role r ON r.RoleId=ar.RoleId
	INNER JOIN module_menu m ON m.ModuleMenuId=ar.MenuId
	WHERE r.RoleId=`_RoleId` AND r.RoleStatus=TRUE AND ar.Access=TRUE AND m.ModuleMenuStatus=TRUE AND m.ModuleMenuIdFather=`_MenuId`
	ORDER BY m.ModuleMenuPosition ASC;
END$$

DROP PROCEDURE IF EXISTS `sp_LoginUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_LoginUser` (IN `_UserLoginName` VARCHAR(10), IN `_UserLoginPassword` VARCHAR(20))  BEGIN

  SELECT u.UserId,u.UserLoginName,u.UserName,u.UserImage,r.RoleId,r.RoleName FROM `user` u
	INNER JOIN role r ON r.RoleId=u.UserRoleId
	WHERE u.UserLoginName=`_UserLoginName` AND u.UserLoginPassword=`_UserLoginPassword`
	AND u.UserStatus=TRUE AND r.RoleStatus=TRUE;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounting_account`
--

DROP TABLE IF EXISTS `accounting_account`;
CREATE TABLE `accounting_account` (
  `AccountingAccountId` int(11) NOT NULL,
  `AccountingAccountCod` varchar(10) NOT NULL,
  `AccountingAccountDescription` text NOT NULL,
  `AccountingAccountStatus` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `assigned_roles`
--

DROP TABLE IF EXISTS `assigned_roles`;
CREATE TABLE `assigned_roles` (
  `MenuId` int(11) NOT NULL,
  `RoleId` int(11) NOT NULL,
  `Access` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `assigned_roles`
--

INSERT INTO `assigned_roles` (`MenuId`, `RoleId`, `Access`) VALUES
(1, 1, b'1'),
(2, 1, b'1'),
(3, 1, b'1'),
(4, 1, b'1'),
(5, 1, b'1'),
(6, 1, b'1'),
(7, 1, b'1'),
(8, 1, b'1'),
(9, 1, b'1'),
(10, 1, b'1'),
(11, 1, b'1'),
(12, 1, b'1'),
(13, 1, b'1'),
(14, 1, b'1'),
(15, 1, b'1'),
(16, 1, b'1'),
(17, 1, b'1'),
(18, 1, b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `CustomerId` int(11) NOT NULL,
  `CustomerName` text NOT NULL,
  `CustomerDocument` char(3) NOT NULL,
  `CustomerDocumentNumber` int(11) NOT NULL,
  `CustomerAddress` text,
  `CustomerTelephone` varchar(50) DEFAULT NULL,
  `CustomerEmail` varchar(50) DEFAULT NULL,
  `CustomerStatus` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `DocumentId` int(11) NOT NULL,
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
  `DocumentStatus` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document_igv`
--

DROP TABLE IF EXISTS `document_igv`;
CREATE TABLE `document_igv` (
  `DocumentIgvId` int(11) NOT NULL,
  `AccountingAccountId` int(11) NOT NULL,
  `DocumentIgvValue` decimal(19,2) NOT NULL,
  `DocumentIgvEquivalent` decimal(19,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document_taxable`
--

DROP TABLE IF EXISTS `document_taxable`;
CREATE TABLE `document_taxable` (
  `DocumentTaxableId` int(11) NOT NULL,
  `AccountingAccountId` int(11) NOT NULL,
  `DocumentTaxableValue` decimal(19,2) NOT NULL,
  `DocumentTaxableEquivalent` decimal(19,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document_totalamount`
--

DROP TABLE IF EXISTS `document_totalamount`;
CREATE TABLE `document_totalamount` (
  `DocumentTotalAmountId` int(11) NOT NULL,
  `AccountingAccountId` int(11) NOT NULL,
  `DocumentTotalAmountValue` decimal(19,2) NOT NULL,
  `DocumentTotalAmountEquivalent` decimal(19,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document_type`
--

DROP TABLE IF EXISTS `document_type`;
CREATE TABLE `document_type` (
  `DocumentTypeId` int(11) NOT NULL,
  `DocumentTypeCode` char(2) NOT NULL,
  `DocumentTypeName` varchar(50) NOT NULL,
  `DocumentTypeDescription` text,
  `DocumentTypeStatus` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exchange_rate`
--

DROP TABLE IF EXISTS `exchange_rate`;
CREATE TABLE `exchange_rate` (
  `ExchangeRateId` int(11) NOT NULL,
  `ExchangeRateDate` date NOT NULL,
  `ExchangeRateDollarSale` decimal(19,2) NOT NULL,
  `ExchangeRateDollarBuy` decimal(19,2) NOT NULL,
  `ExchangeRateStatus` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `module_menu`
--

DROP TABLE IF EXISTS `module_menu`;
CREATE TABLE `module_menu` (
  `ModuleMenuId` int(11) NOT NULL,
  `ModuleMenuIdFather` int(11) DEFAULT NULL,
  `ModuleMenuName` varchar(150) NOT NULL,
  `ModuleMenuLink` varchar(150) DEFAULT NULL,
  `ModuleMenuLevel` int(11) NOT NULL,
  `ModuleMenuIcon` varchar(50) DEFAULT NULL,
  `ModuleMenuButtonColor` varchar(7) DEFAULT NULL,
  `ModuleMenuInformation` varchar(150) DEFAULT NULL,
  `ModuleMenuPosition` int(11) DEFAULT NULL,
  `ModuleMenuStatus` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `module_menu`
--

INSERT INTO `module_menu` (`ModuleMenuId`, `ModuleMenuIdFather`, `ModuleMenuName`, `ModuleMenuLink`, `ModuleMenuLevel`, `ModuleMenuIcon`, `ModuleMenuButtonColor`, `ModuleMenuInformation`, `ModuleMenuPosition`, `ModuleMenuStatus`) VALUES
(1, NULL, 'Cliente', 'javascript:void(0);', 1, NULL, NULL, NULL, 3, b'1'),
(2, 1, 'Registro de cliente', 'register_customer', 2, NULL, NULL, NULL, 1, b'1'),
(3, NULL, 'Usuario', 'javascript:void(0);', 1, NULL, NULL, NULL, 4, b'1'),
(4, 3, 'Registro de usuario', 'register_user', 2, NULL, NULL, NULL, 1, b'1'),
(5, 3, 'Registro de rol', 'register_role', 2, NULL, NULL, NULL, 2, b'1'),
(6, 3, 'Registro de modulo', 'register_module', 2, NULL, NULL, NULL, 3, b'1'),
(7, 3, 'Asignacion de modulo', 'assigned_module', 2, NULL, NULL, NULL, 4, b'1'),
(8, NULL, 'Informe contable', 'javascript:void(0);', 1, NULL, NULL, NULL, 2, b'1'),
(9, 8, 'Registro de ventas', 'registro-ventas', 2, NULL, NULL, NULL, 1, b'1'),
(10, 8, 'Registro de compras', 'register_buy', 2, NULL, NULL, NULL, 2, b'1'),
(11, NULL, 'Mantenimiento', 'javascript:void(0);', 1, NULL, NULL, NULL, 5, b'1'),
(12, 11, 'Tipo de documento', 'document_type', 2, NULL, NULL, NULL, 1, b'1'),
(13, 11, 'Origenes', 'origins', 2, NULL, NULL, NULL, 2, b'1'),
(14, 11, 'Terceros', 'third_company', 2, NULL, NULL, NULL, 3, b'1'),
(15, 11, 'Medios de pagos', 'payment_method', 2, NULL, NULL, NULL, 4, b'1'),
(16, 11, 'Impuesto IGV', 'tax_igv', 2, NULL, NULL, NULL, 5, b'1'),
(17, 11, 'Tipo de cambio', 'exchange_rate', 2, NULL, NULL, NULL, 6, b'1'),
(18, NULL, 'Dashboard', 'base_url()', 1, NULL, NULL, NULL, 1, b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `origins`
--

DROP TABLE IF EXISTS `origins`;
CREATE TABLE `origins` (
  `OriginsId` int(11) NOT NULL,
  `OriginsCode` char(2) NOT NULL,
  `OriginsName` varchar(50) NOT NULL,
  `OriginsStatus` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE `payment_method` (
  `PaymentMethodId` int(11) NOT NULL,
  `PaymentMethodCode` varchar(10) NOT NULL,
  `PaymentMethodName` varchar(50) NOT NULL,
  `PaymentMethodStatus` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `RoleId` int(11) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  `RoleStatus` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`RoleId`, `RoleName`, `RoleStatus`) VALUES
(1, 'ADMINISTRADOR', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tax_igv`
--

DROP TABLE IF EXISTS `tax_igv`;
CREATE TABLE `tax_igv` (
  `TaxIgvId` int(11) NOT NULL,
  `TaxIgvDate` date NOT NULL,
  `TaxIgvValue` decimal(19,2) NOT NULL,
  `TaxIgvStatus` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `third_company`
--

DROP TABLE IF EXISTS `third_company`;
CREATE TABLE `third_company` (
  `ThirdCompanyId` int(11) NOT NULL,
  `ThirdCompanyName` text NOT NULL,
  `ThirdCompanyType` bit(1) NOT NULL,
  `ThirdCompanyDocument` char(3) NOT NULL,
  `ThirdCompanyDocumentNumber` int(11) NOT NULL,
  `ThirdCompanyAddress` text,
  `ThirdCompanyTelephone` varchar(50) DEFAULT NULL,
  `ThirdCompanyStatus` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `UserId` int(11) NOT NULL,
  `UserRoleId` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `UserLastName` varchar(100) NOT NULL,
  `UserLoginName` varchar(10) NOT NULL,
  `UserLoginPassword` varchar(20) NOT NULL,
  `UserBirthdate` date DEFAULT NULL,
  `UserTelephone` varchar(50) DEFAULT NULL,
  `UserEmail` varchar(100) DEFAULT NULL,
  `UserImage` blob,
  `UserStatus` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`UserId`, `UserRoleId`, `UserName`, `UserLastName`, `UserLoginName`, `UserLoginPassword`, `UserBirthdate`, `UserTelephone`, `UserEmail`, `UserImage`, `UserStatus`) VALUES
(1, 1, 'Jean Carlos', 'Sánchez Castromonte', 'admin', '123', '1993-05-12', '943103555', 'jeanscastro7@gmial.com', NULL, b'1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accounting_account`
--
ALTER TABLE `accounting_account`
  ADD PRIMARY KEY (`AccountingAccountId`);

--
-- Indices de la tabla `assigned_roles`
--
ALTER TABLE `assigned_roles`
  ADD PRIMARY KEY (`MenuId`,`RoleId`),
  ADD KEY `fk_AssignedRoles_Role1_idx` (`RoleId`);

--
-- Indices de la tabla `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerId`);

--
-- Indices de la tabla `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`DocumentId`),
  ADD KEY `fk_Document_DocumentType1_idx` (`DocumentTypeId`),
  ADD KEY `fk_Document_Origins1_idx` (`OriginsId`),
  ADD KEY `fk_Document_DocumentTaxable1_idx` (`DocumentTaxableId`),
  ADD KEY `fk_Document_DocumentIgv1_idx` (`DocumentIgvId`),
  ADD KEY `fk_Document_DocumentTotalAmount1_idx` (`DocumentTotalAmountId`),
  ADD KEY `fk_Document_ThirdCompany1_idx` (`ThirdCompanyId`),
  ADD KEY `fk_Document_ExchangeRate1_idx` (`ExchangeRateId`),
  ADD KEY `fk_Document_Customer1_idx` (`CustomerId`),
  ADD KEY `fk_Document_TaxIgv1_idx` (`TaxIgvId`),
  ADD KEY `fk_Document_PaymentMethod1_idx` (`PaymentMethodId`),
  ADD KEY `fk_Document_User1_idx` (`UserId`);

--
-- Indices de la tabla `document_igv`
--
ALTER TABLE `document_igv`
  ADD PRIMARY KEY (`DocumentIgvId`),
  ADD KEY `fk_DocumentIgv_AccountingAccount1_idx` (`AccountingAccountId`);

--
-- Indices de la tabla `document_taxable`
--
ALTER TABLE `document_taxable`
  ADD PRIMARY KEY (`DocumentTaxableId`),
  ADD KEY `fk_DocumentTaxable_AccountingAccount1_idx` (`AccountingAccountId`);

--
-- Indices de la tabla `document_totalamount`
--
ALTER TABLE `document_totalamount`
  ADD PRIMARY KEY (`DocumentTotalAmountId`),
  ADD KEY `fk_DocumentTotalAmount_AccountingAccount1_idx` (`AccountingAccountId`);

--
-- Indices de la tabla `document_type`
--
ALTER TABLE `document_type`
  ADD PRIMARY KEY (`DocumentTypeId`);

--
-- Indices de la tabla `exchange_rate`
--
ALTER TABLE `exchange_rate`
  ADD PRIMARY KEY (`ExchangeRateId`);

--
-- Indices de la tabla `module_menu`
--
ALTER TABLE `module_menu`
  ADD PRIMARY KEY (`ModuleMenuId`);

--
-- Indices de la tabla `origins`
--
ALTER TABLE `origins`
  ADD PRIMARY KEY (`OriginsId`);

--
-- Indices de la tabla `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`PaymentMethodId`);

--
-- Indices de la tabla `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`RoleId`);

--
-- Indices de la tabla `tax_igv`
--
ALTER TABLE `tax_igv`
  ADD PRIMARY KEY (`TaxIgvId`);

--
-- Indices de la tabla `third_company`
--
ALTER TABLE `third_company`
  ADD PRIMARY KEY (`ThirdCompanyId`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserId`),
  ADD KEY `fk_User_Role_idx` (`UserRoleId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accounting_account`
--
ALTER TABLE `accounting_account`
  MODIFY `AccountingAccountId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `document`
--
ALTER TABLE `document`
  MODIFY `DocumentId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `document_igv`
--
ALTER TABLE `document_igv`
  MODIFY `DocumentIgvId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `document_taxable`
--
ALTER TABLE `document_taxable`
  MODIFY `DocumentTaxableId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `document_totalamount`
--
ALTER TABLE `document_totalamount`
  MODIFY `DocumentTotalAmountId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `document_type`
--
ALTER TABLE `document_type`
  MODIFY `DocumentTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `exchange_rate`
--
ALTER TABLE `exchange_rate`
  MODIFY `ExchangeRateId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `module_menu`
--
ALTER TABLE `module_menu`
  MODIFY `ModuleMenuId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `origins`
--
ALTER TABLE `origins`
  MODIFY `OriginsId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `PaymentMethodId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `role`
--
ALTER TABLE `role`
  MODIFY `RoleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tax_igv`
--
ALTER TABLE `tax_igv`
  MODIFY `TaxIgvId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `third_company`
--
ALTER TABLE `third_company`
  MODIFY `ThirdCompanyId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `assigned_roles`
--
ALTER TABLE `assigned_roles`
  ADD CONSTRAINT `fk_AssignedRoles_ModuleMenu1` FOREIGN KEY (`MenuId`) REFERENCES `module_menu` (`ModuleMenuId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_AssignedRoles_Role1` FOREIGN KEY (`RoleId`) REFERENCES `role` (`RoleId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `fk_Document_Customer1` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Document_DocumentIgv1` FOREIGN KEY (`DocumentIgvId`) REFERENCES `document_igv` (`DocumentIgvId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Document_DocumentTaxable1` FOREIGN KEY (`DocumentTaxableId`) REFERENCES `document_taxable` (`DocumentTaxableId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Document_DocumentTotalAmount1` FOREIGN KEY (`DocumentTotalAmountId`) REFERENCES `document_totalamount` (`DocumentTotalAmountId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Document_DocumentType1` FOREIGN KEY (`DocumentTypeId`) REFERENCES `document_type` (`DocumentTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Document_ExchangeRate1` FOREIGN KEY (`ExchangeRateId`) REFERENCES `exchange_rate` (`ExchangeRateId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Document_Origins1` FOREIGN KEY (`OriginsId`) REFERENCES `origins` (`OriginsId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Document_PaymentMethod1` FOREIGN KEY (`PaymentMethodId`) REFERENCES `payment_method` (`PaymentMethodId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Document_TaxIgv1` FOREIGN KEY (`TaxIgvId`) REFERENCES `tax_igv` (`TaxIgvId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Document_ThirdCompany1` FOREIGN KEY (`ThirdCompanyId`) REFERENCES `third_company` (`ThirdCompanyId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Document_User1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `document_igv`
--
ALTER TABLE `document_igv`
  ADD CONSTRAINT `fk_DocumentIgv_AccountingAccount1` FOREIGN KEY (`AccountingAccountId`) REFERENCES `accounting_account` (`AccountingAccountId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `document_taxable`
--
ALTER TABLE `document_taxable`
  ADD CONSTRAINT `fk_DocumentTaxable_AccountingAccount1` FOREIGN KEY (`AccountingAccountId`) REFERENCES `accounting_account` (`AccountingAccountId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `document_totalamount`
--
ALTER TABLE `document_totalamount`
  ADD CONSTRAINT `fk_DocumentTotalAmount_AccountingAccount1` FOREIGN KEY (`AccountingAccountId`) REFERENCES `accounting_account` (`AccountingAccountId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_User_Role` FOREIGN KEY (`UserRoleId`) REFERENCES `role` (`RoleId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
