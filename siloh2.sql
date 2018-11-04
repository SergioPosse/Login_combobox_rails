/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : siloh

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-11-04 07:30:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ar_internal_metadata
-- ----------------------------
DROP TABLE IF EXISTS `ar_internal_metadata`;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ar_internal_metadata
-- ----------------------------
INSERT INTO `ar_internal_metadata` VALUES ('environment', 'development', '2018-11-04 09:55:46', '2018-11-04 09:56:15');

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `cli_id` int(11) NOT NULL AUTO_INCREMENT,
  `cli_nombre` varchar(20) NOT NULL,
  `cli_tel` varchar(30) NOT NULL,
  `zon_id` int(11) NOT NULL,
  PRIMARY KEY (`cli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES ('1', 'Julian Ramos', '3489890820', '1');
INSERT INTO `clientes` VALUES ('2', 'Esteban Lopez', '2348765729', '2');
INSERT INTO `clientes` VALUES ('3', 'Noelia Suarez', '23449820', '3');
INSERT INTO `clientes` VALUES ('4', 'Rogelio Andrada', '234879020', '4');

-- ----------------------------
-- Table structure for database_structures
-- ----------------------------
DROP TABLE IF EXISTS `database_structures`;
CREATE TABLE `database_structures` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of database_structures
-- ----------------------------

-- ----------------------------
-- Table structure for empleados
-- ----------------------------
DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_nombre` varchar(200) NOT NULL,
  `emp_telefono` varchar(200) NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of empleados
-- ----------------------------
INSERT INTO `empleados` VALUES ('1', 'El roto', '23498900');
INSERT INTO `empleados` VALUES ('2', 'El cabeza', '23889000');

-- ----------------------------
-- Table structure for insumos
-- ----------------------------
DROP TABLE IF EXISTS `insumos`;
CREATE TABLE `insumos` (
  `ins_id` int(11) NOT NULL AUTO_INCREMENT,
  `ins_nombre` varchar(200) NOT NULL,
  `ins_descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`ins_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of insumos
-- ----------------------------
INSERT INTO `insumos` VALUES ('1', 'Fuego', 'Fuego para quema todo');
INSERT INTO `insumos` VALUES ('2', 'Veneno', 'Veneno cosmico');
INSERT INTO `insumos` VALUES ('3', 'Hidrocloruro de sodio', 'Para tirar por to lado');

-- ----------------------------
-- Table structure for pagos
-- ----------------------------
DROP TABLE IF EXISTS `pagos`;
CREATE TABLE `pagos` (
  `pagos_id` int(11) NOT NULL AUTO_INCREMENT,
  `tar_id` int(11) NOT NULL,
  `pagos_importe` double NOT NULL,
  `pagos_fecha` date DEFAULT NULL,
  `cli_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  PRIMARY KEY (`pagos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pagos
-- ----------------------------
INSERT INTO `pagos` VALUES ('1', '1', '3999', '2018-11-13', '1', '1');

-- ----------------------------
-- Table structure for schema_migrations
-- ----------------------------
DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schema_migrations
-- ----------------------------
INSERT INTO `schema_migrations` VALUES ('20181103062019');
INSERT INTO `schema_migrations` VALUES ('20181103062420');
INSERT INTO `schema_migrations` VALUES ('20181103072404');

-- ----------------------------
-- Table structure for tareas
-- ----------------------------
DROP TABLE IF EXISTS `tareas`;
CREATE TABLE `tareas` (
  `tar_id` int(11) NOT NULL AUTO_INCREMENT,
  `tar_descripcion` varchar(200) NOT NULL,
  `cli_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `tar_importe` double DEFAULT NULL,
  PRIMARY KEY (`tar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tareas
-- ----------------------------
INSERT INTO `tareas` VALUES ('1', 'Exterminio de pulgas', '1', '1', '2333');
INSERT INTO `tareas` VALUES ('2', 'Exterminio de ratas', '2', '1', '3300');
INSERT INTO `tareas` VALUES ('3', 'Fumigacion', '1', '2', null);

-- ----------------------------
-- Table structure for tarea_insumos
-- ----------------------------
DROP TABLE IF EXISTS `tarea_insumos`;
CREATE TABLE `tarea_insumos` (
  `tar_id` int(11) NOT NULL,
  `ins_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tarea_insumos
-- ----------------------------
INSERT INTO `tarea_insumos` VALUES ('1', '1', '4');
INSERT INTO `tarea_insumos` VALUES ('2', '1', '3');
INSERT INTO `tarea_insumos` VALUES ('3', '2', '4');
INSERT INTO `tarea_insumos` VALUES ('4', '1', '3');
INSERT INTO `tarea_insumos` VALUES ('4', '3', '2');
INSERT INTO `tarea_insumos` VALUES ('4', '2', '3');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `usu_id` int(11) NOT NULL AUTO_INCREMENT,
  `usu_nombre` varchar(200) NOT NULL,
  `usu_email` varchar(200) NOT NULL,
  `usu_password` varchar(200) NOT NULL,
  `ran_id` int(11) NOT NULL,
  PRIMARY KEY (`usu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('1', 'Administrador', 'admin@gmail.com', 'admin', '1');
INSERT INTO `usuarios` VALUES ('2', 'Empleado', 'empleado@gmail.com', 'empleado', '2');

-- ----------------------------
-- Table structure for zonas
-- ----------------------------
DROP TABLE IF EXISTS `zonas`;
CREATE TABLE `zonas` (
  `zon_id` int(11) NOT NULL AUTO_INCREMENT,
  `zon_nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`zon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of zonas
-- ----------------------------
INSERT INTO `zonas` VALUES ('1', 'Hipodromo');
INSERT INTO `zonas` VALUES ('2', 'Fenix');
INSERT INTO `zonas` VALUES ('3', 'Banda Norte');
INSERT INTO `zonas` VALUES ('4', 'Centro');
INSERT INTO `zonas` VALUES ('5', 'Alberdi');
INSERT INTO `zonas` VALUES ('6', 'Pizarro');
