-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.19 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             10.3.0.5901
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for progra4
DROP database `progra4`;

SET GLOBAL time_zone = '-6:00';
CREATE DATABASE IF NOT EXISTS `progra4` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `progra4`;

-- Dumping structure for table progra4.adicionales
CREATE TABLE IF NOT EXISTS `adicionales` (
  `ingredientes` int DEFAULT NULL,
  `pizza` int DEFAULT NULL,
  `orden` int DEFAULT NULL,
  KEY `FK__ingredientes` (`ingredientes`),
  KEY `FK__relacion_pizza_orden` (`orden`),
  KEY `FK__relacion_pizza_orden_2` (`pizza`),
  CONSTRAINT `FK__ingredientes` FOREIGN KEY (`ingredientes`) REFERENCES `ingredientes` (`ID`),
  CONSTRAINT `FK__relacion_pizza_orden` FOREIGN KEY (`orden`) REFERENCES `relacion_pizza_orden` (`orden`),
  CONSTRAINT `FK__relacion_pizza_orden_2` FOREIGN KEY (`pizza`) REFERENCES `relacion_pizza_orden` (`pizza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table progra4.adicionales: ~0 rows (approximately)
/*!40000 ALTER TABLE `adicionales` DISABLE KEYS */;
/*!40000 ALTER TABLE `adicionales` ENABLE KEYS */;

-- Dumping structure for table progra4.ingredientes
CREATE TABLE IF NOT EXISTS `ingredientes` (
  `ID` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `precio` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table progra4.ingredientes: ~0 rows (approximately)
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;

-- Dumping structure for table progra4.orden
CREATE TABLE IF NOT EXISTS `orden` (
  `id` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_orden_usuario` (`usuario`),
  CONSTRAINT `FK_orden_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table progra4.orden: ~0 rows (approximately)
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;

-- Dumping structure for table progra4.pizza
CREATE TABLE IF NOT EXISTS `pizza` (
  `ID` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `precio` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table progra4.pizza: ~0 rows (approximately)
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;

-- Dumping structure for table progra4.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `nombre` varchar(50) DEFAULT NULL,
  `precio` int DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table progra4.producto: ~0 rows (approximately)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Dumping structure for table progra4.relacion_pizza_ingredientes
CREATE TABLE IF NOT EXISTS `relacion_pizza_ingredientes` (
  `pizza` int NOT NULL,
  `ingrediente` int NOT NULL,
  PRIMARY KEY (`pizza`,`ingrediente`),
  KEY `FK_relacion_pizza_ingredientes_ingredientes` (`ingrediente`),
  CONSTRAINT `FK_relacion_pizza_ingredientes_ingredientes` FOREIGN KEY (`ingrediente`) REFERENCES `ingredientes` (`ID`),
  CONSTRAINT `FK_relacion_pizza_ingredientes_pizza` FOREIGN KEY (`pizza`) REFERENCES `pizza` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table progra4.relacion_pizza_ingredientes: ~0 rows (approximately)
/*!40000 ALTER TABLE `relacion_pizza_ingredientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_pizza_ingredientes` ENABLE KEYS */;

-- Dumping structure for table progra4.relacion_pizza_orden
CREATE TABLE IF NOT EXISTS `relacion_pizza_orden` (
  `orden` int NOT NULL,
  `pizza` int NOT NULL,
  `cantidad` int NOT NULL,
  `tamano` varchar(15) NOT NULL,
  PRIMARY KEY (`orden`,`pizza`),
  KEY `FK_relacion_pizza_orden_pizza` (`pizza`),
  CONSTRAINT `FK_relacion_pizza_orden_orden` FOREIGN KEY (`orden`) REFERENCES `orden` (`id`),
  CONSTRAINT `FK_relacion_pizza_orden_pizza` FOREIGN KEY (`pizza`) REFERENCES `pizza` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table progra4.relacion_pizza_orden: ~0 rows (approximately)
/*!40000 ALTER TABLE `relacion_pizza_orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_pizza_orden` ENABLE KEYS */;

-- Dumping structure for table progra4.relacion_producto_orden
CREATE TABLE IF NOT EXISTS `relacion_producto_orden` (
  `orden` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `producto` int NOT NULL,
  PRIMARY KEY (`producto`,`orden`),
  KEY `FK_relacion_producto_orden_orden` (`orden`),
  CONSTRAINT `FK_relacion_producto_orden_orden` FOREIGN KEY (`orden`) REFERENCES `orden` (`id`),
  CONSTRAINT `FK_relacion_producto_orden_producto` FOREIGN KEY (`producto`) REFERENCES `producto` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table progra4.relacion_producto_orden: ~0 rows (approximately)
/*!40000 ALTER TABLE `relacion_producto_orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_producto_orden` ENABLE KEYS */;

-- Dumping structure for table progra4.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` varchar(50) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido1` varchar(50) DEFAULT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table progra4.usuario: ~0 rows (approximately)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

INSERT INTO `progra4`.`usuario` (`id`, `tipo`, `password`, `nombre`, `apellido1`, `apellido2`, `direccion`, `telefono`) VALUES ('123', 'Cliente', 'admin', 'David', 'Cordero', 'Jimenez', 'La Fortuna', '88888888');

INSERT INTO `progra4`.`ingredientes` (`ID`, `nombre`, `precio`) VALUES ('1', 'salsa', '200');
INSERT INTO `progra4`.`ingredientes` (`ID`, `nombre`, `precio`) VALUES ('2', 'jamon', '500');
INSERT INTO `progra4`.`ingredientes` (`ID`, `nombre`, `precio`) VALUES ('3', 'hongos', '600');

INSERT INTO `progra4`.`pizza` (`ID`, `nombre`, `precio`) VALUES ('1', 'Hongonada', '800');
INSERT INTO `progra4`.`pizza` (`ID`, `nombre`, `precio`) VALUES ('2', 'Pasta', '300');

INSERT INTO `progra4`.`relacion_pizza_ingredientes` (`pizza`, `ingrediente`) VALUES ('1', '1');
INSERT INTO `progra4`.`relacion_pizza_ingredientes` (`pizza`, `ingrediente`) VALUES ('1', '3');
