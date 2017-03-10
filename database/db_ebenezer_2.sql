/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_ebenezer

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-03-06 01:11:40
*/
DROP DATABASE IF EXISTS `db_ebenezer`;
CREATE DATABASE IF NOT EXISTS `db_ebenezer` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_ebenezer`;

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `digito` int(11) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `ruc` varchar(20) DEFAULT NULL,
  `usuariosol` varchar(50) DEFAULT NULL,
  `clavesol` varchar(50) DEFAULT NULL,
  `tipoempresa` varchar(50) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `fechai` varchar(20) DEFAULT NULL,
  `fechaf` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `regtrib` varchar(20) DEFAULT NULL,
  `reglab` varchar(20) DEFAULT NULL,
  `regtt` varchar(50) DEFAULT NULL,
  `check1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=277 ;

--
-- Volcar la base de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `digito`, `nombre`, `ruc`, `usuariosol`, `clavesol`, `tipoempresa`, `estado`, `fechai`, `fechaf`, `email`, `telefono`, `regtrib`, `reglab`, `regtt`) VALUES
(1, 6, 'CORONADO DÍAZ RICARDO', '10277135596', 'PCMNFLYX', 'ALEIDASAL', 'Natural', 'Activo', '08/03/2014', '10/03/2014', 'franksc472@hotmail.com', '51*100*1427', 'General', '--', '--'),
(2, 6, 'NEGOCIACIONES J.V.M E.I.R.L', '20445461246', 'ERNUKERY', 'iticentit', 'Jurídica', 'Activo', '--', '--', 'gabyet1@hotmail.com', '51*649*8743   975806521 ', 'General', 'Planilla', '--'),
(3, 6, 'VERGARA CRUZ VICTOR', '10328912266', 'XXMGYWEC', 'MaGeBXZQe', 'Natural', 'Activo', '--', '--', 'x@x.com', '947507621 043295547', 'RUS', '--', '--'),
(4, 6, 'MORALES PAREDES PASCUAL HELI', '10009663466', 'OSAUTAKE', 'lacksiarb', 'Natural', 'Activo', '--', '--', 'x@x.com', '943939542', 'Especial', '--', '--'),
(5, 6, 'ALBA GONZALES FAUSTO JULIAN', '10328000836', 'SHOUCCLU', 'tionverre', 'Natural', 'Activo', '--', '--', 'x@x.com', '961668730', 'General', '--', '--'),
(6, 6, 'AYLAS DE ROLDAN ROGELIA', '10327896496', 'ONOIRRID', 'plaimmush', 'Natural', 'Activo', '--', '--', 'x@x.com', '043341238', 'Especial', '--', '--'),
(7, 6, 'CECIAS MORENO JHOSELYN MELANY', '10468645586', 'UFFMANDE', 'heribusen', 'Natural', 'Activo', '--', '--', 'cecany.77@hotmail.com', '943331899', 'Especial', '--', '--'),
(8, 6, 'ZEGARRA VILLANUEVA MILTON', '10438446406', 'VAUHASPL', 'iulystypo', 'Natural', 'De baja', '--', '--BAJA OFICIO', 'x@x.com', '--', 'Especial', '--', '--'),
(9, 7, 'VELASQUEZ VIUDA DE CARRILLO MARTINA', '10328225897', 'TORNETOX', 'tromberni', 'Natural', 'Activo', '--', '--', 'x@x.com', '043326380', 'General', '--', '--'),
(10, 7, 'VEGA GARAY MARCO ANTONIO', '10328476857', 'LLITENIL', 'ildnescri', 'Natural', 'Activo', '--', '--', 'x@x.com', '943161294', 'RUS', 'Planilla', '--'),
(11, 7, 'ARROYO ALVA YRMA YOLANDA', '10327632057', 'NNIONFEN', 'eniatomon', 'Natural', 'Activo', '--', '--', 'x@x.com', '315958', 'Especial', 'Planilla', '--'),
(12, 7, 'RODRIGUEZ GUTIERREZ NERI HILARIO', '10328631607', 'FRZ12CDB', 'HoMnLpWTM', 'Natural', 'Activo', '--', '--', 'x@x.com', '943893143', 'General', '--', '--'),
(13, 7, 'SOTOMAYOR  ROJAS CAROL IVETT', '10460054147', 'NECKENTH', 'situatalt', 'Natural', 'Activo', '--', '--', 'x@x.com', '943169925', 'RUS', '--', '--'),
(14, 7, 'DELGADO ENRIQUEZ SEGUNDO', '10327798877', 'NIALACHN', 'abezeista', 'Natural', 'Activo', '--', '--', 'x@x.com', '978852005', 'Especial', '--', '--'),
(15, 7, 'INVERSIONES MACGRAFICK E.I.R.L', '20531678967', 'INFICERB', 'ndaricart', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '943792692 - 51*132*7269', 'General', '--', '--'),
(16, 7, 'VALDIVIEZO CARRANZA MANUELA', '10460314327', 'SANEMPTI', 'issantrov', 'Natural', 'De baja', '--', '--', 'x@x.com', '943367296', 'Especial', '--', '--'),
(17, 7, 'GRANDEZ ARMAS DENITH', '10329769947', 'ABLERYMA', 'linantert', 'Natural', 'Activo', '--', '--', 'x@x.com', '944944069', 'Especial', '--', '--'),
(18, 7, 'CASTILLO MORENO JAVIER ALEXANDER', '10329728167', 'WKISTRYA', 'orourrock', 'Natural', 'Activo', '--', '--', 'tuksainversiones@hotmail.com', '51*817*9706', 'General', '--', '--'),
(19, 7, 'MENDEZ  VASQUEZ ROSARIO ISABEL', '10329679077', 'AHX2GEUM', 'SVuiQVFfe', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*418*8261', 'General', '--', '--'),
(20, 7, 'ANJORJER E.I.R.L', '20531945167', 'VERESMOS', 'eamuthrep', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '51*609*3771', 'Especial', '--', '--'),
(21, 7, 'TELLO CASTAÑEDA TEOFILO', '10329386487', 'MMINCENT', 'ndamorgag', 'Natural', 'Activo', '--', '--', 'x@x.com', '943000218', 'Especial', '--', '--'),
(22, 7, 'MORENO ZAMUDIO ZULLY', '10329200057', 'EXPETION', 'umenlerle', 'Natural', 'Activo', '--', '--', 'x@x.com', 'RPM 972965931', 'Especial', '--', '--'),
(23, 7, 'CONSTRUCTORA EJASIL S.A.C', '20541698257', 'IGENNEAD', 'cammantie', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '943207240', 'General', '--', '--'),
(24, 7, 'BOCANEGRA VILQUINICHI ROSA', '10328212787', 'CLJZEMDB', 'Z7brZfa7H', 'Natural', 'Activo', '--', '--', 'x@x.com', '943166041', 'Especial', '--', '--'),
(25, 7, 'AGUILAR MOYA ANA MARIA', '10329133627', 'EPOSIDIS', 'arlinfili', 'Natural', 'Retirado', '--', '--', 'x@x.com', '043583692', 'General', '--', '--'),
(26, 7, 'CHAPILLIQUEN LEON ROGGER ENMANUEL', '10453750367', 'ARTERYSI', 'plahedyan', 'Natural', 'Suspensión', '--', '--', 'x@x.com', '51*815*5454', 'General', '--', '--'),
(27, 7, 'EMPRESA DE TRANSPORTES A&IX SRL', '20445624307', 'OGYNNUTE', 'ateingstr', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '955591015', 'General', 'Planilla', '--'),
(28, 7, 'ROBLES ABANTO CECILIA FRESIA', '10421153707', 'RSIONVER', 'ulstoldom', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(29, 7, 'LLERENA DE VILLANUEVA ANA MARIA', '10327849897', 'POCKEYEL', 'opproodoc', 'Natural', 'Activo', '--', '--', 'x@x.com', '943112003', 'Especial', '--', '--'),
(30, 8, 'MIRANDA  LOPEZ  WILMAN', '10328906428', 'CILLEVEM', 'headitzen', 'Natural', 'Activo', '--', '--', 'x@x.com', '957822332', 'Especial', '--', '--'),
(31, 8, 'LUIS MINAYA MORENA', '10328668268', 'THESSIDE', 'siongeorn', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(32, 8, 'ESTUDIO JURIDICO MINAYA,PALACIOS &ASOCIADOS S.A.C ', '20531906188', 'IONSUNIE', 'eitteadje', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(33, 8, 'RIOS VALVERDE WALTER ABRAHAN', '10418735118', 'REPTIPPY', 'tinduousc', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(34, 8, 'ZELAYA ZANES CARMEN PILAR', '10328560548', 'OTHEMUTE', 'gunfictan', 'Natural', 'Activo', '--', '--', 'x@x.com', '043798289', 'Especial', '--', '--'),
(35, 8, 'CORPORACION EVENEZER S.A.C', '20532096708', 'ECTUMBOH', 'eusparsit ', 'Jurídica', 'Retirado', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(36, 8, 'CONSTRUCTORA LOIM SAC', '20532047758', 'LUMBUMPA', 'cescenwor', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(37, 8, 'BERTHA CARRANZA GAMEZ', '10328423648', 'ASHUCITH', 'ruscerchi', 'Natural', 'Activo', '--', '--', 'x@x.com', '943491168', 'General', '--', '--'),
(38, 8, 'CHINCHAY LOPEZ SARA JUANA', '10328697888', 'FYDG1FMG', '5oHKVU3KQ', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(39, 8, 'MARIA INFANTE MENDOZA', '10328550488', 'BPV728MQ', 'Tk945FjUG', 'Natural', 'Activo', '--', '--', 'x@x.com', '943915428 - 945107370', 'General', '--', '--'),
(40, 8, 'CONSTRUCCIONES Y EDIFICACIONES ORION G&R SAC', '20569140138', 'TIVETHDA', 'oriongr38', 'Jurídica', 'Retirado', '--', '--', 'x@x.com', '--', 'General', 'Planilla', '--'),
(41, 8, 'LLANOS VALVERDE LILI', '10423065058', 'TISBODON', 'iankfuryt', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'RUS', '--', '--'),
(42, 8, 'INVERSIONES VICTOR DAVID SAC', '20569239428', 'UPHAYBER', 'tarlighth', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '985238678', 'General', '--', '--'),
(43, 9, 'ELLEN BACILIO MILEYDY HELLY', '10419605749', '2CQQERKP', 'o3FUVx7Vc', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*608*1440', 'RUS', '--', '--'),
(44, 8, 'ALVARADO CABALLERO JESUS', '10336733028', 'NESCUTIV', 'rglysibba', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*129*7608 - 990399347', 'RUS', 'Planilla', '--'),
(45, 9, 'ACERO CABREJOS JULIO ANGEL', '10404789789', 'ACIANOLE', 'eancenspi', 'Natural', 'De baja', '--', '--', 'x@x.com', '51*406*3033', 'Especial', '--', '--'),
(46, 9, 'L. SABRY E.I.R.L', '20531712499', 'MYNOMEGR', 'nsuttorpo', 'Jurídica', 'De baja', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(47, 9, 'INVERSIONES LUIS VASQUEZ SAC', '20531830939', 'STAIRWOO', 'ortheidib', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '51*816*8736', 'General', '--', '--'),
(48, 9, 'VILLANUEVA LA TORRE JHONNY', '10326117469', 'ACUSPECL', 'butchiale', 'Natural', 'Activo', '--', '--', 'JuliaAvalos1@hotmail.com', '948540544 - 943009031', 'General', '--', '--'),
(49, 9, 'PEREZ SALDAÑA NANCY CONMEMORACION', '10328066829', 'PORMUTHE', 'comannewo', 'Natural', 'De baja', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(50, 9, 'BOCANEGRA VASQUEZ NICOLAS ', '10327889309', 'RIANDENN', 'lattateco', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(51, 9, 'ALCALDE GARCIA VICTOR LEONARDO', '10328634339', 'PITONXTU', 'shanguent', 'Natural', 'Retirado', '--', '--', 'x@x.com', '51*829*4414', 'General', '--', '--'),
(52, 9, 'IPARRAGUIRRE MEDINA JAIME', '10194297209', 'NTEDEALS', 'coreedian', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(53, 9, 'CABREJOS MOORE ISABEL CRISTINA', '10328253149', 'DEAGOILL', 'opoispera', 'Natural', 'De baja', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(54, 9, 'ACOSTA AGUILAR MARCO ANTONIO', '10433626589', 'FR4AETNK', 'CpossVY9X', 'Natural', 'De baja', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(55, 9, 'MATERIALES DE CONSTRUCCION BILO S.A.C ', '20445677419', 'RIALMEOU', 'ronsonion', 'Jurídica', 'Activo', '--', '--', 'jenny.magali@hotmail.com', '51*630*6538 - 989010183', 'General', '--', '--'),
(56, 9, 'PAICO CARCAMO ANGELICA', '10328754229', 'FCKTLR5E', 'bSeg9HpwZ', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*110*9956', 'General', '--', '--'),
(57, 9, 'ROJAS RODRIGUEZ EUCEBIO ERNESTO', '10427321369', 'TIONOUSI', 'onthanory', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'Especial', 'Planilla', '--'),
(58, 9, 'MUJER UNICA EIRL', '20445484459', 'ABBLETAL', 'ousepleyl', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '--', 'General', 'Planilla', '--'),
(59, 9, 'CENTRO DE ESPECIALIZACION EN LITIGACION Y PRACTICA DEL DERECHO S.A.C', '20541617869', 'NCUSESCO', 'verrocimp', 'Jurídica', 'Retirado', '--', '--', 'keylla.nole@gmail.com', '043320430', 'General', 'Planilla', '--'),
(60, 9, 'SANCHEZ PRINCIPE EDITH', '10328402829', 'MBCCAHHY', 'LU3ZaUubW', 'Natural', 'De baja', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(61, 9, 'CHAUCA ALBA JOSELITO', '10329260009', 'ECERGUES', 'stonabati', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'RUS', '--', '--'),
(62, 9, 'MENDEZ VASQUEZ MARIA E.', '10329236019', '--', '--', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'RUS', '--', '--'),
(63, 9, 'CASTRO PEREZ SILVANA NATALY', '10426634169', 'ONTERCYT', 'wankiname', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(64, 9, 'LORETO MARIÑOS MARTHA', '10328032029', 'STEREAUL', 'nodonvorn', 'Natural', 'De baja', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(65, 9, 'RODRIGUEZ ALFARO MANUEL ENRIQUE', '10327929459', 'HECTICHI', 'antattore', 'Natural', 'Retirado', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(66, 9, 'FLORES ROMERO JULIA E.', '10329578629', '2USAMISP', 'GfBKLmkZb', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(67, 9, 'VALVERDE ZUÑIGA NOEMI ANSELMA', '10328649719', 'ZKNTPUXA', 'LeFHMoXfa', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(68, 9, 'VASQUEZ RIOS CELENE BENILDE', '10407870889', 'AWRXTWBN', '3TikSv2bM', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'RUS', '--', '--'),
(69, 9, 'CUBAS HUAMAN SEGUNDO JOSE', '10329663359', 'RHAINTRA', 'sprarihil', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(70, 9, 'MORENO MONTALVO ROBERT JAYNOR', '10327326649', 'NTICOUSN', 'ningralla', 'Natural', 'Retirado', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(71, 9, 'CASTILLO VARGAS NARCISO ANTHONNY', '10430968179', 'TROBOLEY', 'deternfli', 'Natural', 'Retirado', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(72, 9, 'PROYECTO DE INGENIERIA,INVERSIONES& SER VICIOS EMPRESARIALES & ALADVAL EIRL', '20541703609', 'DICIPEAK', 'isocandyn', 'Jurídica', 'De baja', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(73, 9, 'DE LA CRUZ FERRER AMELENY CACILDA', '10329176989', 'ONETHOUT', 'mustriver', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(74, 9, 'SAAVEDRA DE BOCANEGRA LUISA', '10327791899', 'MARYSTRI', 'hneyanniz', 'Natural', 'Activo', '--', '--', 'karlos926@hotmail.com', '943457367', 'RUS', '--', '--'),
(75, 9, 'MANTILLA MARIÑOS JESÚS WUIGBERTO', '10463507649', 'ILLIPSIA', 'vinityrap', 'Natural', 'De baja', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(76, 9, 'CHAPILLIQUEN LEON LUIS ALFREDO', '10453750359', 'POLACCEI', 'eadvestra', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(77, 9, 'ROJAS CALDERON RENEE SEGUNDO', '10329198389', 'RALEMILL', 'ropoistro', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'RUS', '--', '--'),
(78, 9, 'ZEGARRA MALAGA GIANNINA VANESSA', '10414191539', 'ONTISTPI', 'cticorone', 'Natural', 'Retirado', '--', '--', 'x@x.com', '--', '--', '--', '4ta Categoría'),
(79, 9, 'UCANCIAL PASCUAL PEDRO FRANCISCO', '10327663629', 'ZDLYTMPQ', 'W9J9AdLRz', 'Natural', 'Retirado', '--', '--', 'x@x.com', '--', 'RUS', '--', '--'),
(80, 9, 'INVERSIONES XIMENS S.A.C', '20531987919', 'CUBTLEGE', 'ontaincho', 'Jurídica', 'Activo', '--', '--', 'jean_@hotmail.com', '--', 'General', '--', '--'),
(81, 9, 'ALCHINZA CONTRATISTAS GENERALES S.A.C', '20531920849', 'UGHTCHAS', 'tioptater', 'Jurídica', 'De baja', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(82, 9, 'RODRIGUEZ MONTORO LUIS GUILLERMO', '10325413439', 'CHLORMYT', 'revendeng', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', '--', '--', '4ta Categoría'),
(83, 9, 'URCIA RODRIGUEZ MAXIMINA JESUS', '10329827009', 'READODEN', 'lfamooker', 'Natural', 'Suspensión', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(84, 9, 'TECNODRYWALL EIRL', '20569234469', 'PHILDLER', 'metonfamb', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '995382541', 'General', '--', ''),
(85, 9, 'FLORES CASTRO VDA DE COTOS OLGA EULALIA', '10328674209', 'IFEGATUR', 'ardwallys', 'Natural', 'Activo', '--', '--', 'x@x.com', '956180770', 'General', '--', '--'),
(86, 9, 'RUIZ IZAGUIRRE YONAR', '10329063769', 'RICANTAT', 'ldrymaref', 'Natural', 'Retirado', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(87, 0, 'BAZAN CASTRO KELLY YANETH', '10409846730', 'CLECTILE', 'iffroppas', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*413*1361', 'Especial', '--', '--'),
(88, 0, 'UCANCIAL PASCUAL ESMERALDA MILAGROS', '10459444420', 'MAGAPARR', 'alymaindr', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*141*232', 'RUS', '--', '--'),
(89, 0, 'ESPINOZA PONCE ISIDORO ALBINO', '10328896350', 'HUDENTOR', 'adjousiou', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*109*6200', 'General', 'Planilla', '--'),
(90, 0, 'ACUÑA MACHADO JESUS JOEN', '10410961500', 'EARFAWEC', 'm7NtqU7Yn', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'RUS', '--', '--'),
(91, 0, 'CABRERA REYES TEODORA', '10328126180', 'CALTGXJQ', 'UHfQXzZMV', 'Natural', 'Suspensión', '--', '--', 'x@x.com', '51*815*8320', 'General', '--', '--'),
(92, 0, 'GONZALES RAMOS WILFREDO', '10329678950', 'IDUBPICM', 'eTcGQUq3L', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*113*243', 'Especial', '--', '--'),
(93, 0, 'GUTIERREZ ANGASPILCO DIANET MARISOL', '10329703270', 'ONTATERT', 'idermodic', 'Natural', 'Activo', '--', '--', 'x@x.com', '949468686', 'RUS', '--', '4ta Categoría'),
(94, 0, 'HERNANDEZ VILLANUEVA MELANIA', '10328197630', 'MAEPCPDV', 'fE9AYY9RM', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*142*9213 -  043505728 - 949307063', 'Especial', '--', '--'),
(95, 0, 'FOTO GAMA COLOR LABORATORIO EIRL', '20445035140', 'FOTOGAMA', 'bernardo5', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '129*7608 - 990399347', 'General', 'Planilla', '--'),
(96, 0, 'ZAVALETA TRUJILLO DE VIDAL ESPERANZA A.', '10328249320', 'ONYBATIC', 'lasynothe', 'Natural', 'Activo', '--', '--', 'x@x.com', '943000218', 'Especial', '--', '--'),
(97, 0, 'FABRICA DE LICORES UVA ITALIA S.A.C', '20532004510', 'RCHAMINF', 'paldthemp', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '51*105*2289', 'General', '--', '--'),
(98, 0, 'CAMPOMANES VEGA VICTORIA LUZMILA', '10328463160', 'RPATENTR', 'atigothoe', 'Natural', 'Activo', '--', '--', 'x@x.com', '943108085', 'General', '--', '--'),
(99, 0, 'MUÑOZ SANCHEZ CARMEN', '10328254820', 'ORFLAITR', 'ablegenti', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(100, 0, 'PLUS COLOR LABORATORIOS E.I.R.L.', '20392332660', 'PENDOOFF', 'abyetleym', 'Jurídica', 'Retirado', '--', '--', 'x@x.com', '129*7608 - 990399347', 'General', '--', '--'),
(101, 1, 'ESPIRITU VEGA ANDRES', '10008650531', 'KRB6UTSB', 'MY1GCaqvd', 'Natural', 'De baja', '--', '--', 'x@x.com', '51*413*1361 - 985617140', 'Especial', '--', '--'),
(102, 1, 'ZEGARRA VILLANUEVA ROSALI LORENZO', '10194232981', 'FUNBXEPX', 'FWckoN4ZJ', 'Natural', 'De baja', '--', '--', 'x@x.com', '', 'Especial', '--', '--'),
(103, 1, 'DIAZ SOLIS HENRY GRABIEL', '10329722631', 'SALVADOR', 'jesucristo', 'Natural', 'Activo', '--', '--', 'x@x.com', '409*7649', 'General', 'Planilla', '--'),
(104, 1, 'VASQUEZ GOICOCHEA JOSE PEDRO', '10329511991', 'RACESBAR', 'eavationa', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*412*3636', 'Especial', '--', '--'),
(105, 1, 'HUAMANCONDOR INFANTE JEANNIE LOURDES', '10441377971', '---', '---', 'Natural', 'Activo', '--', '--', 'x@x.com', '944970707', 'RUS', '--', '--'),
(106, 1, 'GIL CARDOSO JUSTO', '10325379001', 'NSCELPHE', 'oldernere', 'Natural', 'Activo', '--', '--', 'x@x.com', '942252685 - 956144798', 'General', '--', '--'),
(107, 1, 'MINAYA QUIÑONES MAGDALENA MIRELLA', '10316738791', 'ZLFQPAB6', 'C9FyESFiP', 'Natural', 'Activo', '--', '--', 'x@x.com', '971822989 - 600330 - 51*814*3255', 'RUS', '--', '--'),
(108, 1, 'MEJIA RODRIGUEZ VICTOR MIGUEL', '10327891231', 'TONGTHYD', 'massentca', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*829*6388', 'General', '--', '--'),
(109, 1, 'CORPUS RAMIREZ YANINA DEL PILAR', '10806069821', 'ALAGEOCR', 'sandeneho', 'Natural', 'Activo', '--', '--', 'x@x.com', '998494673 - 968075417', 'RUS', '--', '--'),
(110, 1, 'INVERSIONES GENERALES JARA S.A.C ', '20532009821', 'UENATERS', 'lunnimmal', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '043358853 - 51*710*6272 - 992580833 CLAVE RNP 83869021 CODIGO 2014-5458933.  ', 'General', '--', '--'),
(111, 1, 'MORENO VELASQUEZ DE ANTONIA ELENA', '10194166031', '----', '---', 'Natural', 'Activo', '--', '--', 'x@x.com', '970983340', 'RUS', '--', '--'),
(112, 1, 'GARCIA GUTIERREZ ZULEMA', '10329815361', 'VERSTHOW', 'chimyorti', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*423*9655', '--', '--', '4ta Categoría'),
(113, 1, 'AVALOS MANCHEGO EMILIANO ROSENDO', '10327702241', 'GINSULOW', 'rateratif', 'Natural', 'Activo', '--', '--', 'x@x.com', '959994243 - 51*609*1805', 'Especial', '--', '--'),
(114, 1, 'PEÑA NAIRA SERGIO', '10329595981', 'CISTRYSE', 'nowailoat', 'Natural', 'Activo', '--', '--', 'x@x.com', '043316638 - 976465673', 'RUS', '--', '--'),
(115, 1, 'GIL INCA JOSEFINA ELIA', '10327643211', 'PREMINAL', 'ishirlept', 'Natural', 'De baja', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(116, 1, 'ESPINOZA NAUCAPOMA LUIS ANGEL', '10456820901', 'LICETAPO', 'octicardy', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*113*8066 - 51*630*6538 -  51*135*3361', 'Especial', '--', '--'),
(117, 1, 'MORE CHIROQUE CRUZ MARIA', '10328562591', 'OUSTITZI', 'wanteodar', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'RUS', '--', '--'),
(118, 1, 'VELASQUEZ ARANA ARTURO NICOLAS', '10327408181', 'DANERIEL', 'nevocarit', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*142*9213', 'General', '--', '--'),
(119, 1, 'VELASQUEZ REYES JUSTINA CORINA', '10329107421', 'TOROOTHE', 'ashatesch', 'Natural', 'Activo', '--', '--', 'x@x.com', '981848925', 'Especial', '--', '--'),
(120, 1, 'REPRESENTACIONES DALEXA EIRL', '20541662571', 'RANISHUN', 'chraterto', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '51*127*4042 - 51*624*7387 - 51*621*152', 'Especial', '--', '--'),
(121, 1, 'SALINAS ZAVALETA EMERITA PAULINA', '10329348861', 'SAUCHEAT', 'trisniumi', 'Natural', 'Activo', '--', '--', 'x@x.com', '942329713', 'Especial', '--', '--'),
(122, 1, 'BENITES SANTILLAN ALICIA', '10329302771', 'DLMACZZL', 'YbJSU9LHK', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(123, 1, 'VALVERDE ZUÑIGA MARIA ELENA', '10329135051', 'BHHCMV5M', '1UeQoisb3', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(124, 1, 'ZAVALETA CHAVEZ FERNANDO JESUS', '10329173441', 'NQDDEAVP', 'LF3rDzvxp', 'Natural', 'Activo', '--', '--', 'x@x.com', '963994079', 'General', '--', '--'),
(125, 1, 'ARTEAGA VASQUEZ DERLY MARITA', '10413907271', 'ABLESSAG', 'oatensint', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*144*5053', 'General', '--', '--'),
(126, 1, 'CHACHAPOYAS SALINAS MELISA KARINA', '10443837341', 'ETIPEDEN', 'ysiongeow', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(127, 1, 'VALDERRAMA PEREZ PASCUAL ANTONIO', '10329112441', 'IFURABLE', 'erliverst', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(128, 1, 'PAICO GARCIA DE CHAVEZ AURA LUZ', '10329056011', 'UTTSMADB', 'idemonfla', 'Natural', 'Activo', '--', '--', 'x@x.com', '976954666', 'General', '--', '--'),
(129, 1, 'DELGADO DE ALEJOS CLARA LUZ', '10328504851', 'STRAMIAN', 'ophyleven', 'Natural', 'Activo', '--', '--', 'x@x.com', '943866408', 'RUS', '--', '--'),
(130, 1, 'TORRES SALINAS JEINER JHON', '10431927531', 'MENWEROG', 'mentheran', 'Natural', 'De baja', '--', '--', 'x@x.com', '--942329713', 'General', '--', '--'),
(131, 1, 'ELECTROMECANICOS ALCALDE S.A.C', '20541792601', 'LAZEREGR', 'orachamat', 'Jurídica', 'Retirado', '--', '--', 'x@x.com', '51*829*4414', 'General', '--', '--'),
(132, 1, 'CHAPILLIQUEN LEON LIZ ROCIO', '10410618261', 'ECRITEAS', 'istericre', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*835*5349', 'General', '--', '--'),
(133, 1, 'LEON DE CHAPILLIQUEN ROSALIA', '10328233351', 'RANEDGEN', 'liblutica', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*835*5349', 'General', '--', '--'),
(134, 1, 'CHAPILLIQUEN LEON JENNY ISABEL', '10403496371', 'CHOMNATT', 'nesivenor', 'Natural', 'Retirado', '--', '--', 'x@x.com', '51*406*3245', 'General', '--', '--'),
(135, 1, 'MINAYA QUIÑONES MARLENE', '10329781611', 'AGCPKQYC', 'BFU4pcTsM', 'Natural', 'Activo', '--', '--', 'x@x.com', '979400336', '--', '--', '--'),
(136, 1, 'BLAZ DAGA ROCIO LULIANA', '10321392101', 'GUARGOOD', 'acyliciab', 'Natural', 'Retirado', '--', '--', 'x@x.com', '943263891 - 51*126*8091', 'RUS', '--', '--'),
(137, 1, 'CARRANZA GAMES DE VELASQUEZ MARIA CLEOFE', '10328016201', 'OGRATECK', 'erencarip', 'Natural', 'Activo', '--', '--', 'x@x.com', '943491168', 'Especial', '--', '--'),
(138, 1, 'BRICEÑO MEZA JANETH CECILIA', '10332608261', 'LOCIALOS', 'graterram', 'Natural', 'Activo', '--', '--', 'x@x.com', '043621745 - 956209553', 'RUS', 'Planilla', '4ta Categoría'),
(139, 1, 'RODRIGUEZ IDROGO CONSTRUCT. Y CONSULT. SRL', '20477742841', 'RODRIGUE', 'paty2012', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '981919013', 'General', 'Planilla', '--'),
(140, 1, 'GUTIERREZ ORBEGOSO JOSE ANDRES', '10328729151', 'CEPTYPEN', 'eniustort', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*414*1885 - 51*631*3012 - 41*159*9335', 'Especial', '--', '--'),
(141, 2, 'YSIQUE CHANCAFE MANUELA CARMEN', '10327336172', 'EFUNCETT', 'egmettert', 'Natural', 'Activo', '--', '--', 'x@x.com', '952255475', 'RUS', '--', '--'),
(142, 2, 'OBELYX.A1.HNOS PEÑA SAC', '20531634242', 'NTENIMPO', 'morstiful', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '51*623*5642', 'General', '--', '--'),
(143, 2, 'INVERSIONES VILASA EIRL.', '20403098532', 'EFPNLXAE', 'p1ecaTfwc', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '976843838', 'General', 'Planilla', '--'),
(144, 2, 'TORRES ROJAS SARA MILAGROS', '10329686952', 'EEGFVPPG', 'Y6GiLUeoc', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*426*6940', 'General', 'Planilla', '--'),
(145, 2, 'DELGADO ENRIQUEZ FRANCISCO MARCOS', '10328213902', 'DDLECTRA', 'ramaiscre', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(146, 2, 'FRANK NOBIS SALAS ROQUE', '10329394552', 'PLZ4YIIE', 'DINAMICOS', 'Natural', 'Suspensión', '--', '--', 'x@x.com', '600330 - 51*815*3197 - 971822973', '--', '--', '4ta Categoría'),
(147, 2, 'NEGOCIACIONES ENE Y JACQ E.I.R.L', '20531814062', 'UGHTERAI', 'ageirmenn', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '995052851 PARA SUSPENDER', 'Especial', '--', '--'),
(148, 2, 'TRANSPORTES MAVISA EXPRESS E.I.R.L.', '20541629522', 'IMPRELLO', 'bleciondr', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '51*407*342', 'General', '--', '--'),
(149, 2, 'PEREZ GAMEZ ANA NARCISA', '10328551662', 'ATEXTONB', 'slankywar', 'Natural', 'Activo', '--', '--', 'x@x.com', '943964676', 'Especial', '--', '--'),
(150, 2, 'BAZAN CASTRO HELLEYN SARITA', '10437102312', 'NCERYMAN', 'plingenim', 'Natural', 'Activo', '--', '--', 'x@x.com', '413*1361', 'General', '--', '--'),
(151, 2, 'CHASHNAMOTE PANAIFO LINA', '10010835092', 'ZDUPCPPA', 'BHeKYBwVk', 'Natural', 'Activo', '--', '--', 'x@x.com', '944974479', 'Especial', '--', '--'),
(152, 2, 'REYNA CALLE BETTY ANGELICA ', '10181622992', 'OBBIRPEN', 'busideeto', 'Natural', 'De baja', '--', '--', 'x@x.com', 'PARA SUSPENDER ', 'Especial', '--', '--'),
(153, 2, 'VILCA DE ROJAS SANTOS JUSTA', '10328068872', 'DARISOLP', 'saimirdis', 'Natural', 'Activo', '--', '--', 'x@x.com', '943628142', 'Especial', '--', '--'),
(154, 3, 'CONTRERAS DE MENDIETA MARIA', '10329347023', 'ULTYPOLD', 'uelerclis', 'Natural', 'Activo', '27/03/2014', '28/03/2014', 'x@x.com', 'GUIA DE ARRENDAMIENTO:DOC.DE IDENTIDAD DEL INQUILINO 6 NRO DOCUMENTO:20100017491', 'RUS', '--', ''),
(155, 3, 'MAX COLOR LABORATORIO EIRL.', '20445785653', 'EURFACKE', 'gophertho', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '943874835', 'General', 'Planilla', '--'),
(156, 3, 'CORONEL CIEZA ARBILDO ORESTES', '10335896543', 'NMANUXGV', 'o1onMxfUV', 'Natural', 'Activo', '--', '--', 'x@x.com', '043 318563 943 560404', 'Especial', '--', '--'),
(157, 3, 'DIAZ KUZAN JORGE RAMON', '17320245133', 'HERRITIO', 'rsenutuse', 'Natural', 'Activo', '--', '--', 'Justinasolis.73@hotmail.com', '--', 'Especial', 'Planilla', '--'),
(158, 3, 'DISTRIBUIDORA ESPECERIA VASQUEZ SAC.', '20445440753', 'TRUEARDE', 'michdrolu', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '978906011', 'General', 'Planilla', '--'),
(159, 3, 'INCISO CHAVEZ MARINO MERC.', '10093258903', 'ML84BRUA', 'jMRcNa6Ld', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*612*2321', 'Especial', '--', '--'),
(160, 3, 'NOLASCO GONZALES ELENA MELANIA', '10329689013', 'BPAFELJE', 'aqGGMF17A', 'Natural', 'Activo', '--', '--', 'x@x.com', '943413478', 'Especial', '--', '--'),
(161, 3, 'QUINTE CASTILLO RAFAEL', '10329209313', 'KXMBJNGW', 'LKHP3LK6C', 'Natural', 'Activo', '--', '--', 'x@x.com', '943485212 51*127*7881', 'Especial', '--', '--'),
(162, 3, 'QUISPE ESCUDERO JOSE LUIS', '10327335273', 'VANTOCKI', 'dainativa', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(163, 3, 'ALARCON TABOADA JUAN MANUEL', '10328271163', 'EGAVENDE', 'redoxylva', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(164, 3, 'COMERCIALIZADORA Y SERVICIOS WENDY SRL', '20531866453', 'ORENCISS', 'bletchipe', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '51*643*2424  946432424', 'General', '--', '--'),
(165, 3, 'LIDIMER S.A.C', '20541621203', 'TANDWING', 'aniciprop', 'Jurídica', 'De baja', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(166, 3, 'ALVA VASQUEZ CARLA INDIANA', '10467556113', 'CGROSELA', 'copremiga', 'Natural', 'Activo', '--', '--', 'x@x.com', '955060281', 'General', '--', '--'),
(167, 3, 'MATTOS HARO DANDY RONY', '10802069893', 'RGETIVER', 'bryouncey', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*650*846', 'Especial', '--', '--'),
(168, 3, 'JULISA CABANILLAS CORREA', '10409479133', 'RUINEXTA', 'witarsody', 'Natural', 'Retirado', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(169, 4, 'MUJER SABIA E.I.R.L', '20541691244', 'ARTAVETR', 'parmajeli', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '943108085', 'General', '--', '--'),
(170, 4, 'LONGOBARDI DE NORABUENA CARMEN RAINELDA', '10328820124', 'RANSURYP', 'tragoonee', 'Natural', 'Activo', '--', '--', 'x@x.com', '043463394 ', 'General', 'Planilla', '--'),
(171, 4, 'REPRESENTACIONES MARTINEZ LOPEZ E.I.R.L', '20445709124', 'AHCPUUMG', '9cpaKJ8Me', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '51*130*9863', 'General', 'Planilla', '--'),
(172, 4, 'INFANTE MEJIA LOURDES', '10328075704', 'IEXCEKYE', 'h4TnEKQq6', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(173, 4, 'NOLASCO GONZALES MARIA BETESSY', '10329414804', 'ANTRATCH', 'rnellocad', 'Natural', 'Activo', '--', '--', 'x@x.com', '943413478', 'Especial', '--', '--'),
(174, 4, 'ZEGARRA VILLANUEVA TERESA JUSTINA', '10403229984', 'ISSYCEPO', 'amomnanyo', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(175, 4, 'FABIAN CARLOS HEBER SAUL', '10329650184', '------', '--', 'Natural', 'Retirado', '--', '--', 'x@x.com', '--', 'RUS', '--', '--'),
(176, 4, 'GEORGINA DORISLINDA MARTEL CALIXTO ', '10230199154', 'CARMINCE', 'pdpoidera', 'Natural', 'Activo', '--', '--', 'x@x.com', '043295547', 'RUS', '--', '--'),
(177, 4, 'CASTILLO VASQUEZ JOSE SEBASTIAN', '10178619514', 'INEITIVI', 'peasectra', 'Natural', 'Activo', '--', '--', 'x@x.com', '943614161', '--', '--', '4ta Categoría'),
(178, 4, 'ZUÑIGA ALARCON SANDRA GUISELLE', '10406487534', 'YLINGOIS', '10406487534', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(179, 4, 'ANTONIO AZAÑA DIONICIO ', '10329607394', 'RECRICUL', 'loterryma', 'Natural', 'Activo', '--', '--', 'x@x.com', '945888416', 'General', '--', '--'),
(180, 4, 'INVERSIONES Y SERVICIOS MARIA DAYANA S.R.L', '20541602594', 'ASSUMMOR', 'erfuletus', 'Jurídica', 'Retirado', '--', '--', 'x@x.com', '947174473', 'RUS', '--', ''),
(181, 4, 'ESPINAQUE LOPEZ JUAN FRANKLIN', '10454397334', 'LAINBLEY', 'poxinsive', 'Natural', 'Retirado', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(182, 4, 'EL EMPRENDEDOR SANTEÑO S.A.C', '20569144044', 'ITELETZE', 'halissevi', 'Jurídica', 'Activo', '--', '--', 'hilderyoni@hotmail.com', '990487578  043295246', 'Especial', 'Planilla', '--'),
(183, 4, 'VILLACORTA HERRERA HILDER YONI', '10328955704', 'ANAMARIA', 'hilderyoni', 'Natural', 'Retirado', '01/06/2013', '30/04/2014', 'x@x.com', '--', 'General', '--', '--'),
(184, 4, 'ELLEN ESCOBAL GABRIEL', '10329359854', 'GRIALIKE', 'olichorbo', 'Natural', 'Activo', '--', '--', 'x@x.com', '506095 --981451414', 'RUS', '--', '--'),
(185, 5, 'DIOMEDES SANTOS PATRICIO', '10329377275', 'OTTERFAL', 'hcaphypti', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*828*983', 'Especial', '--', '--'),
(186, 5, 'C.E.P LA EDAD DE ORO S.R.L', '20445355055', 'LG3BETBY', 'dnMEcQ5ZL', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '043351054 51*406*1439', 'Especial', 'Planilla', '--'),
(187, 5, 'CALLAN FLORES DE PEÑA EMELDA', '10328113185', 'ATTZCTBQ', 'WrjsEeVK3', 'Natural', 'Activo', '--', '--', 'daisyritha@hotmail.com', '943933321', 'General', 'Planilla', '--'),
(188, 5, 'TERRY ROSALES ESTELA', '10328208895', 'FFICITRE', 'aryetunte', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*602*972', 'Especial', '--', '--'),
(189, 5, 'CUEVA COSIO SERGIO', '10329623225', 'JEYBK2DS', 'dYoPVakNW', 'Natural', 'Activo', '--', '--', 'x@x.com', '41*157*7386 SIN PLANILLA 11/214', 'Especial', 'Planilla', '--'),
(190, 5, 'HUAMANCONDOR FLORES VICTOR', '10328504435', 'ECRBNCVZ', 'Kn7fnWdHD', 'Natural', 'Activo', '--', '--', 'x@x.com', '944970707', 'Especial', '--', '--'),
(191, 5, 'LAVADO RODRIGUEZ ANASTACIO EDUARDO', '10329786035', 'TRIALFIE', 'ownelillo', 'Natural', 'Activo', '--', '--', 'x@x.com', '043401412', 'RUS', '--', '--'),
(192, 5, 'GOMEZ AYALA SIXTO', '10328590935', 'F2JCWDHG', 'V28y9Rb5b', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*815*8320', 'RUS', '--', '--'),
(193, 5, 'CESPEDES ULLOA CYNTHIA EVELYN', '10329924055', 'D2ENQXHR', '1CLBEYRKA', 'Natural', 'Retirado', '--', '--', 'x@x.com', '--', 'RUS', '--', '--'),
(194, 5, 'PILARES GERONIMO GEORGE', '10445626495', 'RCASKIEU', 'digutockd', 'Natural', 'De baja', '--', '--', 'x@x.com', '--', 'RUS', 'Planilla', '--'),
(195, 5, 'QUINTANA OYARCE JAIME ANTONIO', '10270478455', 'EGIVDHFA', '2obNNQRQn', 'Natural', 'Activo', '--', '--', 'x@x.com', '999139663', 'RUS', '--', '--'),
(196, 5, 'SISTEMAS PREFABRICADOS PIRAMIDE E.I.R.L ', '20531889585', 'IMOBARIP', 'ntalemeni', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(197, 5, 'ELLEN ESCOBAL ROSA MARTHA', '10329358335', 'ATCARMON', 'toleyestr', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*650*4123', 'RUS', '--', '--'),
(198, 5, 'GONZALES FIGUEROA SABINA MARGOT', '10327937095', 'RROUSSIO', 'teeboamat', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(199, 5, 'MORENO MORALES SONIA CHARO', '10332618445', 'NETHILLU', 'honiummen', 'Natural', 'De baja', '--', '--', 'x@x.com', '--', '--', '--', '--'),
(200, 5, 'ARTEAGA RUIZ MARIA FIDELINA', '10180074215', 'LETATENT', 'ainemexiv', 'Natural', 'Activo', '--', '--', 'x@x.com', '948041230', 'Especial', '--', '--'),
(201, 5, 'SALINAS PEREZ CARMEN', '10329201185', 'ROARETIA', 'ansfifurs', 'Natural', 'Activo', '--', '--', 'x@x.com', '943485675', 'General', '--', '--'),
(202, 5, 'PEREDA ARROYO ELVIRA CATALINA', '10328677445', 'HKQDXN46', 'b4ePN4jNG', 'Natural', 'Activo', '--', '--', 'x@x.com', '043323551- 943034055 -943485164', 'General', '--', '--'),
(203, 5, 'MIRANDA CUEVA JEFERSON JAIMITO', '10702531085', 'GARIANGL', 'gointisch', 'Natural', 'De baja', '--', '--', 'x@x.com', '--', 'RUS', '--', '--'),
(204, 5, 'RAMOS ROSALES ALBERTO GREGORIO', '10328280375', 'EVALLEMP', 'pladolkap', 'Natural', 'De baja', '--', '--', 'x@x.com', '--', '--', '--', '--'),
(205, 5, 'IPANAQUE SILVA DANILO', '10464850355', 'ODUSCOLD', 'eheamerna', 'Natural', 'Retirado', '--', '--', 'x@x.com', '989815880 ', 'General', '--', '4ta Categoría'),
(206, 5, 'GIRALDO MENACHO VIRGINIA MARILU', '10434336835', 'GRODINKI', 'ndoremban', 'Natural', 'De baja', '--', '--', 'x@x.com', '--', '--', '--', '--'),
(207, 5, 'TRANSP.Y DISTRIBUIDORA SAN FRANCISCO EIRL', '20569127115', 'BIDWIDEN', 'lortawlti', 'Jurídica', 'Activo', '--', '--', 'jenny.magali@hotmail.com', '51*135*3480', 'General', '--', '--'),
(208, 5, 'SAMAME CERCADO JAQUELINE MAGALY', '10431674985', 'GRATENAM', 'nsaroggle', 'Natural', 'Suspensión', '--', '--', 'x@x.com', '--', 'Especial', '--', '--'),
(209, 5, 'BENITES AVILA ROSA PATRICIA', '10327345635', 'KINGENTY', 'quitareat', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*839*3675', 'General', '--', '--'),
(210, 4, 'INGENIERIA, SERVICIOS Y COMERCIALIZACION VILLA AVALOS S.A.C', '20532027994', 'ORAPOLYP', 'endulleye', 'Jurídica', 'Activo', '--', '--', 'x@x.com', '943009031', 'General', '--', '--'),
(211, 4, ' ROSADO AURORA ROSA MARGARITA', '10327703124', 'AILACKYR', 'eritrosic', 'Natural', 'Retirado', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(212, 4, 'AVALOS JARA DEYVI', '10453288574', 'ZWELIVER', 'nsmicatel', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*145*2971 948041230', 'Especial', '--', '--'),
(213, 5, 'RIVERA DE CARRUITERO NIMIA', '10327755205', 'ATBEHYRN', 'rgiblenni', 'Natural', 'De baja', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(214, 9, 'MANRIQUE LOZANO JULIO ROBERTO', '10329049049', 'REWPUGUN', 'recriblut', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(215, 9, 'JARA CASTILLO JUAN CARLOS ', '10416227859', 'OMBELLAT', 'nculphard', 'Natural', 'Activo', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(216, 6, 'CANTINET BARRON ROGGER ASUNCION', '10328206876', 'RCHOUNCA', 'clerpharm', 'Natural', 'Activo', '--', '--', 'x@x.com', '51*420*57', 'General', '--', '--'),
(217, 6, 'RAFAEL VASQUEZ JUANA CECILIA', '10411639636', 'ALOGATTL', 'urionosta', 'Natural', 'Retirado', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(218, 6, 'SOTOMAYOR LOZANO PEDRO', '10328194916', 'SGRATINC', 'rchewitor', 'Natural', 'Activo', '--', '--', 'fransc472@hotmail.com', '414*5445', 'RUS', '--', '--'),
(219, 2, 'CAIPO RUBIO DE GUTIERREZ EDITH YESENIA', '10416800672', 'HORTHERG', 'rionentee', 'Natural', 'De baja', '--', '--', 'franksc472@hotmail.com', '41*159*9335 - 51*631*3012 - 51*414*1885', 'Especial', '--', '--'),
(220, 0, 'INVERSIONES & SERV MULTIPLES NEVADO S.A.C          ', '20531982950', 'NYMANDIC', 'lmonallyc', 'Jurídica', 'De baja', '--', '--', 'x@x.com', '943485212', 'General', '--', '--'),
(221, 0, 'LLERENA GONZALEZ YESPER FRANCISCO ', '10462854540', 'MONGHTIO', 'strassyna', 'Natural', 'Retirado', '--', '--', 'x@x.com', '950579036', 'General', '--', '--'),
(222, 0, 'ALEJOS ALVAREZ LUZ ADELAIDA', '10328553550', 'RIENIFFE', 'indsplear', 'Natural', 'Activo', '--', '--', 'x@x.com', '943910560 VENTA COMPRA DIARIO FOLIO100 HOJ 11-01-2014', 'General', '--', '--'),
(223, 0, 'NOLASCO GONZALES EDITA ARMINDA ', '10328230980', 'AMIETFUG', 'norsiouth', 'Natural', 'De baja', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(224, 1, 'VASQUEZ ROLDAN ELMER ROBERTO', '10802084621', 'STIGNIET', 'deguineve', 'Natural', 'De baja', '--', '--', 'x@x.com', '51*401*1488 - 944985841', 'General', '--', '--'),
(225, 1, 'CASTILLO DE RIOS CELIA MACARIA', '10328628681', 'ATOUCTIR', 'obbleldoo', 'Natural', 'De baja', '--', '--', 'x@x.com', '--', 'General', '--', '--'),
(226, 1, 'CASTILLO ZARATE ALICIA ELIZABETH', '10329259701', 'JACARRIF', 'hwopnoxic', 'Natural', 'Activo', '--', '--', 'x@x.com', 'PARA SUSPENDER EL RUC', 'Especial', '--', '--'),
(227, 1, 'CONSTRUCTORA E.K.G.P S.A.C', '20569175781', 'GEROJEFU', 'lumillant', 'Jurídica', 'De baja', '--', '--', 'x@x.com', '942252685 - 956144798', 'General', '--', ''),
(228, 3, 'LOPEZ VALVERDE ZENON FELIX ', '10332635013', 'PETTLERT', 'buminsolv', 'Natural', 'Activo', '01/04/2014', '--', 'x@x.com', '135*4711 943844042 LEGALIZO LIBROS CONTABLES VENTAS Y COMPRAS ', 'Especial', '--', '--'),
(229, 3, 'MENDOZA ROMERO CARLOS MARTIN', '10327647763', 'BBFPQPYM', 'UMnGroL5W', 'Natural', 'Activo', '', '--', 'x@x.com', '', 'Especial', '--', '--'),
(230, 3, 'ESTUDIO INFORMATICO CONTABLE,TRIBUTARIO FINANCIERO Y LABORAL EBENEZER &FRANK SALAS E.I.R.L,', '20541654713', 'HENDCASY', 'chedderad', 'Jurídica', 'De baja', '', '--', 'x@x.com', '', 'General', '--', '--'),
(231, 3, 'MONTERO SANCHEZ JAQUELINE', '10413107933', 'ANCIALLI', 'arealoyla', 'Natural', 'De baja', '', '--', 'x@x.com', '', 'General', '--', '--'),
(232, 3, 'ZEGARRA RAMIREZ DE CORTIJO CARMEN ROSA', '10329586893', 'GALLITES', 'entlemoni', 'Natural', 'De baja', '', '--', 'x@x.com', '', 'General', '--', '--'),
(233, 2, 'ECHEVARRIA ALVARADO CESAR AUGUSTO', '10327699372', 'BALACINA', 'enereadan', 'Natural', 'Suspensión', '', '--', 'x@x.com', '943914371', 'General', '--', '--'),
(234, 2, 'LAZARO MENDEZ DIANNE LOUISSE', '10473038612', 'ERIEDICT', 'tentleedm', 'Natural', 'De baja', '09/01/2010', '--', 'x@x.com', '51*128*8109', '--', '--', '4ta Categoría'),
(235, 6, 'ALFREDO IDROGO LEIVA', '10168053466', 'IMPTILMA', 'entisteon', 'Natural', 'Activo', '', '--', 'alfredleiva24@hotmail.com', '981919013', '--', '--', '4ta Categoría'),
(236, 0, 'CENTRO DE ALTOS ESTUDIOS PROFESIONALES CAEDPRO S.A.CC', '20569236160', 'ACKEBOWE', 'semundeti', 'Jurídica', 'Retirado', '01/03/2014', '', 'franksc472@hotmail.com', '51*100*9795', 'General', '--', '--'),
(237, 7, 'SANTOS PATRICIO MARIA YOLANDA', '10329359927', 'EXOTOMPO', 'etermyrah', 'Natural', 'De baja', '', '--', 'x@x.com', '51*109*6200', 'General', '--', '--'),
(238, 5, 'CARBAJAL FLORES JORGE SAUL', '10329815345', 'RIABLESS', 'gentickap', 'Natural', 'Activo', '01/04/2014', '--', 'franksc472@hotmail.com', 'RPM 949908988 943925042', 'General', '--', '--'),
(239, 2, 'MOZOMBITE FABABA ZULEMA', '10327670722', 'FOUSCABO', 'rphediera', 'Natural', 'De baja', '01/03/2014', '31/05/2014', 'x@x.com', '043584108', 'General', '--', '--'),
(240, 4, 'CONSTRUCTORA E INMOBILIARIA FRAJEMEL S.A.C', '20569194734', 'TALIBLET', 'pprendiel', 'Jurídica', 'Activo', '01/04/2014', '--', 'x@x.com', '943933321', 'General', '--', '--'),
(241, 3, 'PILARES HUAMANI PEDRO AMILCAR', '10217723273', '---', '---', 'Natural', 'Retirado', '------', '--', 'x@x.com', '------', 'RUS', '--', '--'),
(242, 1, 'CALVO MONTAÑEZ HILDA GUZMILE', '10427023791', 'EPIRPHYT', 'arywanoun', 'Natural', 'Activo', '', '--', 'x@x.com', '51*410*9767', 'General', 'Planilla', '--'),
(243, 9, 'DIAZ SOLIS JORGE FRITZ', '10329532319', 'NITHEMUG', 'misconeur', 'Natural', 'Activo', '', '--', 'x@x.com', '', 'Especial', '--', '--'),
(244, 1, 'CONSTRUCTORA E INVERSIONES LUMAR E.I.R.L', '20533794191', 'SOMMENTR', 'essepoleg', 'Jurídica', 'Activo', '01/07/2014', '--', 'x@x.com', '', 'General', '--', '--'),
(245, 1, 'ALBA GONZALES AGAPITO', '10327645281', 'UNEWCALL', 'knorebbli', 'Natural', 'Activo', '01/07/2014', '--', 'x@x.com', '', 'General', '--', '--'),
(246, 9, 'ECHEVARRIA MARIÑOS ROSA ISABEL', '10179393749', '0000', '0000', 'Natural', 'Retirado', '', '--', 'x@x.com', '', 'RUS', '--', '--'),
(247, 6, 'CASTILLO QUISPE MELVI ROCIO (LONGOBARDI)', '10328852646', 'RENTATEN', 'copperfen', 'Natural', 'Activo', '01/08/2014', '', 'x@x.com', '943568310', 'Especial', '--', '--'),
(248, 3, ' CENTRO DE ACTUALIZACION PROFESIONAL & CONSULTORIA S.A.C.', '20569291853', 'BLAGEROP', 'adentouti', 'Jurídica', 'Activo', '01/07/2014', '--', 'x@x.com', '51*823*5131  51*100*9795', 'General', '--', '--'),
(249, 1, 'BALTAZAR QUIÑONES MARIA AGUSTINA ', '10328727841', 'EATEVESS', 'ronealess', 'Natural', 'Activo', '', '--', 'x@x.com', 'cta detraccion  781-159298  952958676 - 943105289', 'General', '--', '--'),
(250, 1, 'VELASCO LEON EDWARD ALFREDO', '10166836781', 'EDUARDO1', '08080808', 'Natural', 'Activo', '', '--', 'x@x.com', '973845914', 'Especial', '--', '--'),
(251, 6, 'DIAZ NAVEDA LIZ MAYRELLI (LEO)', '10422394066', 'DRODBARO', 'osivisten', 'Natural', 'Activo', '', '--', 'x@x.com', '43792585', 'Especial', '--', '--'),
(252, 2, 'JULCA SILVA SHEYLA CATERINE (JULIO CHATI)', '10475331392', 'VIDEPOTH', 'ustinefdo', 'Natural', 'Activo', '01/10/2014', '--', 'x@x.com', '51*121*4145', 'General', '--', '--'),
(253, 5, 'PALACIOS HERRERA YASMIN AMBAR (JULIO CHATI)', '10428721565', 'IEPTIONT', 'pantiquen', 'Natural', 'Activo', '01/08/2014', '--', 'x@x.com', '51*121*4145', 'General', '--', '--'),
(254, 5, 'GOMEZ CABRERA OSCAR ELIAS', '10329803665', 'ALOBTAMB', 'vigmersel', 'Natural', 'Activo', '', '--', 'x@x.com', '51*815*8320 943113250', 'Especial', '--', '--'),
(255, 0, 'NEGOCIACIONES Y FERR. TONY E.I.R.L', '20569306630', 'CULSYMEN', 'prophinga', 'Jurídica', 'Activo', '01/09/2014', '--', 'franksc472@hotmail.com', '043-600330', 'General', '--', '--'),
(256, 7, 'ZAMUDIO MIRANDA NELSON CELSO', '10444117937', 'ORATROUS', 'ixonalver', 'Natural', 'Retirado', '01/08/2014', '--', 'x@x.com', '44 - 988974247 ', 'RUS', '--', '--'),
(257, 3, 'LUJAN CHATI JULIO DENIS', '10401970903', 'OONCTAGE', 'ostattena', 'Natural', 'Activo', '11/09/2014', '--', 'fransksc472@hotmail.com', '51*121*4145', 'General', '--', '--'),
(258, 8, 'SERVIGON CRUZ RUBEN ALEXANDER', ' 1033264868', 'OSILKHAN', 'hingentic', '--', 'De baja', '', '--', 'x@x.com', '940178160', 'Especial', '--', '--'),
(259, 9, 'SERVIGON CRUZ RUBEN ALEXANDER', '10332648689', 'OSILKHAN', 'hingentic', 'Natural', 'Activo', '01/09/2014', '--', 'x@x.com', '940178160', 'Especial', '--', '--'),
(260, 4, 'VASQUEZ AVALOS DE ARTEAGA VIRGINIA ', '10329797584', 'PASENEAL', 'apsinaugh', 'Natural', 'Activo', '01/09/2014', '--', 'x@x.com', '51*144*5053', 'General', '--', '--'),
(261, 1, 'LEON.CL.JADE FERRETERIA NAVAL E.I.R.L DE ROLLER CHAPILLIQUEN', '20569309221', 'OCAKEYEP', 'vangaterp', 'Jurídica', 'Activo', '01/09/2014', '--', '', '51*815*5454', 'General', '--', '--'),
(262, 1, 'SERVICIOS Y REPRESENTACIONES MAYELIN E.I.R.L.', '20531703821', 'ILWORNOU', 'urmagoryp', 'Jurídica', 'Activo', '01/10/2014', '--', 'x@x.com', '', 'General', '--', '--'),
(263, 6, 'PELAEZ YARLEQUE JOANA ELIZABETH (SIXTO GOMEZ)', '10457513246', 'IDEMINAU', 'shakouncu', 'Natural', 'Activo', '01/11/2014', '--', 'x@x.com', '51*815*8320', 'RUS', '--', '--'),
(264, 5, 'CALLE CARRASCO MERCEDES (OMNILIFE)', '10328243585', 'XXX', 'xxx', 'Natural', 'Activo', '01/10/2014', '--', 'x@x.com', '943346127 - 043326562', 'Especial', '--', '--'),
(265, 5, 'VERA MARTELL VICTORIA NICOLAZA', '10329518685', '32951868', '32951868', 'Natural', 'Activo', '01/10/2014', '--', 'x@x.com', '944949073 - 043346966  51286972vmv', 'Especial', '--', '--'),
(266, 2, 'VASQUEZ DELGADO DOUGLAS FELIPE', '10715451102', 'TERISTOM', 'outwundag', 'Natural', 'Activo', '01/11/2014', '--', 'x@x.com', '51*406*3245 991235381', 'Especial', '--', '--'),
(267, 2, 'SERVICIOS TECNICOS E INDUSTRIALES CG S.A.C', '20569330182', 'PECTOUST', 'roddadayo', 'Jurídica', 'Activo', '01/11/2014', '--', 'x@x.com', '51*420*57   CODIGO VERIFIC 6FOZP', 'General', '--', '--'),
(268, 9, 'VEGA ARROYO ALEXANDER EDUARDO', '10427317159', 'KUPERYOV', 'terilieve', 'Natural', 'Activo', '01/11/2014', '--', 'ing_alexander_vega@hotmail.com', '947384503  CODIGO VER 5VUEW Clave del RNP: 644441 ', 'General', '--', '--'),
(269, 9, 'MENACHO CANO IRMA G', '10327640769', 'XXX', 'xxx', 'Natural', 'Activo', '', '--', 'x@x.com', '', 'General', '--', '--'),
(270, 6, 'PINEDO IGNACIO JUAN CARLOS', '10433541796', 'LINTIONA', 'ntersalle', 'Natural', 'Activo', '01/11/2014', '--', 'jcpi-99@hotmail.com', '043582407  963981504', 'General', '--', '--'),
(271, 1, 'VILLANUEVA MUÑOZ YULIANA MARILI ', '10411036371', 'CINAGNIT', 'oldebenit', 'Natural', 'Retirado', '', '--', 'x@x.com', '', 'RUS', '--', '--'),
(272, 1, 'PINEDO IGNACIO MILTON', '10402253351', 'BLUMETAN', 'icaullown', 'Natural', 'Activo', '', '--', 'x@x.com', '995382541', 'Especial', '--', '--'),
(273, 4, 'MENDOZA SERNA DE RAMOS MARIA ESTHER', '10038881804', 'EGRANADR', 'omitelate', 'Natural', 'Activo', '01/12/2014', '--', 'x@x.com', '', 'Especial', '--', '--'),
(274, 5, ' REPRESENTACIONES VIVAR CRUZ E.I.R.L.SRA ELVI RECOMENDADADO PATRICIA MARTINEZ', '20569336385', 'INCENOWM', 'exonearal', 'Jurídica', 'Activo', '01/11/2014', '--', 'x@x.com', 'numeral 956029445', 'General', '--', '--'),
(275, 3, 'SOCIEDAD MINERA DE REPONSABILIDAD LIMITADA ANDREE V', '20569345023', 'RCELINGE', 'nkestrawa', 'Jurídica', 'Activo', '01/12/2014', '--', 'x@x.com', '952854034', 'General', '--', '--'),
(276, 7, 'DELGADO PEREZ EDDY ', '10800378007', 'HERNANDK', 'criontica', 'Natural', 'Activo', '', '--', 'x@x.com', '', 'General', '--', '--');

-- --------------------------------------------------------
-- -----------------------------
-- Table structure for accounting_account
-- ---------------------------------
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
-- Records of schedule_sunat
-- ----------------------------
INSERT INTO `schedule_sunat` VALUES ('2017-01-01', '0', '2017-03-04', '2017-03-04', '12:54:00', '\0', '', '1');

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
  `UserRegisterUserId` int(11) NOT NULL,
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `Unique_UserLoginName` (`UserLoginName`),
  KEY `fk_User_Role_idx` (`UserRoleId`),
  CONSTRAINT `fk_User_Role` FOREIGN KEY (`UserRoleId`) REFERENCES `role` (`RoleId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', 'Jean Carlos', 'Sánchez Castromonte', 'admin', '123', '1993-05-12', '943103555', 'jeanscastro7@gmial.com', null, '', '0');
INSERT INTO `user` VALUES ('2', '1', 'ejemplo', 'ejemplo', 'ejemplo', 'ejemplo', null, null, 'ejemplo', null, '\0', '0');
INSERT INTO `user` VALUES ('3', '1', 'a', 'a', 'a', 'aaaa', '2017-03-01', 'a', 'a', null, '', '1');

-- ----------------------------
-- Procedure structure for sp_DeleteScheduleSunat
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_DeleteScheduleSunat`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteScheduleSunat`(IN `_period` DATE,IN `_digit` INT)
BEGIN
  DELETE FROM schedule_sunat
  WHERE SchedulePeriod=_period AND ScheduleDigit=_digit;
END
;;
DELIMITER ;

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
  DECLARE _life INT;

  SELECT TIMESTAMP(ss.ScheduleProgramDate,ss.ScheduleProgramTime) AS ScheduleDatetime,
  ss.SchedulePeriod,ss.ScheduleDigit,
  TIMESTAMPDIFF(SECOND, NOW(),TIMESTAMP(DATE_ADD(ss.ScheduleProgramDate, INTERVAL 1 DAY),'00:00:00')) AS LifeAlert
  INTO _schedule,_period,_digit,_life
  FROM schedule_sunat ss 
  WHERE ss.ScheduleCompleteStatus=0 AND ss.ScheduleStatus=1 ORDER BY ScheduleDatetime ASC LIMIT 1;

  SELECT TIMESTAMPDIFF(SECOND, NOW(), _schedule) AS AlertSeconds,_period,_digit,_life;
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
  ss.SchedulePeriod,
  ss.ScheduleDigit,
  DATE_FORMAT(ss.ScheduleDueDate,'%d/%m/%Y') as ScheduleDueDate,
  DATE_FORMAT(ss.ScheduleProgramDate,'%d/%m/%Y') as ScheduleProgramDate,
  TIME_FORMAT(ss.ScheduleProgramTime,'%h:%i %p') as ScheduleProgramTime,
  ss.ScheduleStatus,
  ss.ScheduleCompleteStatus,
  u.UserName  
  FROM schedule_sunat ss
  INNER JOIN user u ON u.UserId=ss.UserId
  WHERE ss.SchedulePeriod LIKE (CASE WHEN _Period=0 THEN '' ELSE _Period  END)
  ORDER BY ss.ScheduleDigit ASC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_GetScheduleSunatByPeriodDigit
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_GetScheduleSunatByPeriodDigit`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetScheduleSunatByPeriodDigit`(IN `_period` DATE,IN `_digit` INT)
BEGIN
  SELECT
  ss.SchedulePeriod,
  ss.ScheduleDigit,
  DATE_FORMAT(ss.ScheduleDueDate,'%d/%m/%Y') as ScheduleDueDate,
  DATE_FORMAT(ss.ScheduleProgramDate,'%d/%m/%Y') as ScheduleProgramDate,
  TIME_FORMAT(ss.ScheduleProgramTime,'%h:%i %p') as ScheduleProgramTime,
  ss.ScheduleStatus,
  u.UserName  
  FROM schedule_sunat ss
  INNER JOIN user u ON u.UserId=ss.UserId
  WHERE ss.SchedulePeriod=_period AND ss.ScheduleDigit=_digit;
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
  WHERE ss.SchedulePeriod LIKE CONCAT('%',_Period,'%')
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
-- Procedure structure for sp_InsertUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_InsertUser`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertUser`(IN `_roleid` INT,IN `_user` VARCHAR(10),IN `_password` VARCHAR(20),IN `_name` VARCHAR(100),IN `_lastname` VARCHAR(100),IN `_birthday` DATE,IN `_telephone` VARCHAR(50),IN `_email` VARCHAR(100),IN `_status` BIT,IN `_userid` INT)
BEGIN
  INSERT INTO `user`(UserRoleId,UserName,UserLastName,UserLoginName,UserLoginPassword,UserBirthdate,UserTelephone,UserEmail,UserStatus,UserRegisterUserId)
  VALUES (_roleid,_name,_lastname,_user,_password,_birthday,_telephone,_email,_status,_userid); 
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

  DECLARE _datetime DATETIME;
  DECLARE _diffDatetime INT;
  DECLARE _completestatus INT;

  SELECT TIMESTAMP(_programdate,_programtime) INTO _datetime;
  SELECT TIMESTAMPDIFF(SECOND, NOW(), _datetime) INTO _diffDatetime;

  IF _diffDatetime > 0 THEN
    SET _completestatus = 0;
  ELSE
    SET _completestatus = 1;
  END IF;

  INSERT INTO schedule_sunat(SchedulePeriod,ScheduleDigit,ScheduleDueDate,ScheduleProgramDate,ScheduleProgramTime,ScheduleStatus,ScheduleCompleteStatus,UserId)
  VALUES (`_period`,`_digit`,`_duedate`,`_programdate`,`_programtime`,`_status`,_completestatus,`_user`); 
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

  SELECT TIMESTAMPDIFF(SECOND, NOW(),TIMESTAMP(DATE_ADD(ss.ScheduleProgramDate, INTERVAL 1 DAY),'00:00:00')) AS LifeAlert
  FROM schedule_sunat ss
  WHERE ss.SchedulePeriod=_period AND ss.ScheduleDigit=_digit;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_UpdateScheduleSunat
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_UpdateScheduleSunat`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdateScheduleSunat`(IN `_period` DATE,IN `_digit` INT,IN `_duedate` DATE,IN `_programdate` DATE,IN `_programtime` TIME,IN `_status` BIT,IN `_user` INT)
BEGIN

  DECLARE _datetime DATETIME;
  DECLARE _diffDatetime INT;
  DECLARE _completestatus INT;

  SELECT TIMESTAMP(_programdate,_programtime) INTO _datetime;
  SELECT TIMESTAMPDIFF(SECOND, NOW(), _datetime) INTO _diffDatetime;

  IF _diffDatetime > 0 THEN
    SET _completestatus = 0;
  ELSE
    SET _completestatus = 1;
  END IF;

  UPDATE schedule_sunat
  SET ScheduleDueDate=_duedate,
  ScheduleProgramDate=_programdate,
  ScheduleProgramTime=_programtime,
  ScheduleStatus=_status,
  ScheduleCompleteStatus=_completestatus,
  UserId=_user
  WHERE SchedulePeriod=_period AND ScheduleDigit=_digit;
END
;;
DELIMITER ;
