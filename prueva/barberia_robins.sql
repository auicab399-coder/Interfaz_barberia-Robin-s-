-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         9.1.0 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.12.0.7122
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para barberia_robins
CREATE DATABASE IF NOT EXISTS `barberia_robins` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `barberia_robins`;

-- Volcando estructura para tabla barberia_robins.categorias_gastos
CREATE TABLE IF NOT EXISTS `categorias_gastos` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(50) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nombre_categoria` (`nombre_categoria`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla barberia_robins.categorias_gastos: 6 rows
/*!40000 ALTER TABLE `categorias_gastos` DISABLE KEYS */;
INSERT INTO `categorias_gastos` (`id_categoria`, `nombre_categoria`, `descripcion`) VALUES
	(1, 'insumos', 'materiales de uso interno y compras operativas de la barberia'),
	(2, 'productos para reventa', 'mercancia que se compra para surtir el inventario de venta'),
	(3, 'servicios', 'energia electrica, agua potable, internet y telefonia'),
	(4, 'mantenimiento', 'afilado, reparacion y cuidado de herramientas y equipo'),
	(5, 'publicidad', 'promociones y anuncios en redes sociales'),
	(6, 'otros', 'articulos de limpieza y gastos no clasificados');
/*!40000 ALTER TABLE `categorias_gastos` ENABLE KEYS */;

-- Volcando estructura para tabla barberia_robins.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla barberia_robins.clientes: 6 rows
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`id_cliente`, `nombre`, `telefono`) VALUES
	(1, 'jose alejandro canul pech', '9851023412'),
	(2, 'carlos manuel may pool', '9851145623'),
	(3, 'angel gabriel noh tuz', '9851237845'),
	(4, 'juan bautista cupul chan', '9851358901'),
	(5, 'pedro jesus alvarez poot', '9851469012'),
	(6, 'miguel angel diaz uc', '9851570123'),
	(7, 'Cliente', ''),
	(8, 'Carlos', ''),
	(9, 'Lorenzo', '');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla barberia_robins.configuracion_negocio
CREATE TABLE IF NOT EXISTS `configuracion_negocio` (
  `id_config` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `giro` varchar(150) NOT NULL,
  `direccion` text NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `citas` varchar(100) NOT NULL,
  PRIMARY KEY (`id_config`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla barberia_robins.configuracion_negocio: 1 rows
/*!40000 ALTER TABLE `configuracion_negocio` DISABLE KEYS */;
INSERT INTO `configuracion_negocio` (`id_config`, `nombre`, `giro`, `direccion`, `telefono`, `citas`) VALUES
	(1, 'Barbería Robin\'s', 'Servicios de barbería y estética masculina', 'Calle 36 x 47 y 49, Col. San Juan, C. P. 97780, Valladolid, Yucatán', '+52 985 109 6658', 'Setmore y WhatsApp Business');
/*!40000 ALTER TABLE `configuracion_negocio` ENABLE KEYS */;

-- Volcando estructura para tabla barberia_robins.detalle_venta_producto
CREATE TABLE IF NOT EXISTS `detalle_venta_producto` (
  `id_detalle_prod` int NOT NULL AUTO_INCREMENT,
  `folio_venta` int NOT NULL,
  `id_producto` varchar(10) NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle_prod`),
  KEY `folio_venta` (`folio_venta`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_venta_producto_chk_1` CHECK ((`cantidad` > 0)),
  CONSTRAINT `detalle_venta_producto_chk_2` CHECK ((`precio_unitario` >= 0.00)),
  CONSTRAINT `detalle_venta_producto_chk_3` CHECK ((`subtotal` >= 0.00))
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla barberia_robins.detalle_venta_producto: 2 rows
/*!40000 ALTER TABLE `detalle_venta_producto` DISABLE KEYS */;
INSERT INTO `detalle_venta_producto` (`id_detalle_prod`, `folio_venta`, `id_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES
	(1, 2, 'p01', 1, 140.00, 140.00),
	(2, 4, 'p07', 1, 130.00, 130.00),
	(3, 7, 'P08', 1, 160.00, 160.00),
	(4, 8, 'P01', 1, 140.00, 140.00);
/*!40000 ALTER TABLE `detalle_venta_producto` ENABLE KEYS */;

-- Volcando estructura para tabla barberia_robins.detalle_venta_servicio
CREATE TABLE IF NOT EXISTS `detalle_venta_servicio` (
  `id_detalle_serv` int NOT NULL AUTO_INCREMENT,
  `folio_venta` int NOT NULL,
  `id_servicio` varchar(10) NOT NULL,
  `cantidad` int NOT NULL DEFAULT '1',
  `precio_cobrado` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle_serv`),
  KEY `folio_venta` (`folio_venta`),
  KEY `id_servicio` (`id_servicio`),
  CONSTRAINT `detalle_venta_servicio_chk_1` CHECK ((`cantidad` > 0)),
  CONSTRAINT `detalle_venta_servicio_chk_2` CHECK ((`precio_cobrado` >= 0.00))
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla barberia_robins.detalle_venta_servicio: 6 rows
/*!40000 ALTER TABLE `detalle_venta_servicio` DISABLE KEYS */;
INSERT INTO `detalle_venta_servicio` (`id_detalle_serv`, `folio_venta`, `id_servicio`, `cantidad`, `precio_cobrado`) VALUES
	(1, 1, 's01', 1, 200.00),
	(2, 2, 's03', 1, 290.00),
	(3, 3, 's04', 1, 180.00),
	(4, 4, 's05', 1, 300.00),
	(5, 5, 's06', 1, 350.00),
	(6, 6, 's07', 1, 250.00),
	(7, 6, 'S07', 1, 250.00),
	(8, 7, 'S01', 1, 200.00),
	(9, 8, 'S01', 1, 200.00);
/*!40000 ALTER TABLE `detalle_venta_servicio` ENABLE KEYS */;

-- Volcando estructura para tabla barberia_robins.gastos
CREATE TABLE IF NOT EXISTS `gastos` (
  `id_gasto` int NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_categoria` int NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `metodo_pago` enum('efectivo','transferencia','tarjeta','otro') DEFAULT 'efectivo',
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_gasto`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `gastos_chk_1` CHECK ((`monto` >= 0.00))
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla barberia_robins.gastos: 5 rows
/*!40000 ALTER TABLE `gastos` DISABLE KEYS */;
INSERT INTO `gastos` (`id_gasto`, `fecha_hora`, `id_categoria`, `descripcion`, `monto`, `metodo_pago`, `id_usuario`) VALUES
	(1, '2026-10-21 13:00:00', 1, 'compra de refrescos y agua para cortesia', 120.00, 'efectivo', 1),
	(2, '2026-10-20 18:00:00', 6, 'compra de limpiador multiusos y papel', 180.00, 'efectivo', 1),
	(3, '2026-10-15 11:00:00', 3, 'pago mensual de internet y telefonia', 380.00, 'transferencia', 1),
	(4, '2026-10-10 16:30:00', 4, 'afilado y mantenimiento de tijeras y navajas', 350.00, 'efectivo', 1),
	(5, '2026-10-05 14:00:00', 5, 'publicidad y promocion local en redes sociales', 250.00, 'tarjeta', 1);
/*!40000 ALTER TABLE `gastos` ENABLE KEYS */;

-- Volcando estructura para tabla barberia_robins.materiales_insumos
CREATE TABLE IF NOT EXISTS `materiales_insumos` (
  `id_material` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `unidad` varchar(30) NOT NULL,
  `servicios_aplicables` text,
  `costo_unitario` decimal(10,2) NOT NULL,
  `existencia` int NOT NULL,
  `minimo` int NOT NULL,
  PRIMARY KEY (`id_material`),
  CONSTRAINT `materiales_insumos_chk_1` CHECK ((`costo_unitario` >= 0.00)),
  CONSTRAINT `materiales_insumos_chk_2` CHECK ((`existencia` >= 0)),
  CONSTRAINT `materiales_insumos_chk_3` CHECK ((`minimo` >= 0))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla barberia_robins.materiales_insumos: 9 rows
/*!40000 ALTER TABLE `materiales_insumos` DISABLE KEYS */;
INSERT INTO `materiales_insumos` (`id_material`, `nombre`, `unidad`, `servicios_aplicables`, `costo_unitario`, `existencia`, `minimo`) VALUES
	('m01', 'bebida de cortesia (refresco o agua)', 'pieza', 'todos los servicios', 10.00, 24, 10),
	('m02', 'hojillas para navaja', 'pieza', 'barba, afeitado, cortes', 3.00, 60, 20),
	('m03', 'toallas de algodon', 'pieza', 'barba, facial, vip', 35.00, 20, 10),
	('m04', 'tiras de papel para cuello', 'rollo', 'cortes', 40.00, 4, 2),
	('m05', 'espuma de afeitar 350 ml', 'bote', 'barba, afeitado', 55.00, 5, 2),
	('m06', 'aceite pre-afeitado 120 ml', 'frasco', 'barba, afeitado', 70.00, 4, 2),
	('m07', 'crema limpiadora facial 250 g', 'frasco', 'facial, vip, mascarilla negra', 90.00, 3, 1),
	('m09', 'aceite para masaje 250 ml', 'frasco', 'vip', 85.00, 3, 1),
	('m10', 'hilo para cejas', 'rollo', 'limpieza de cejas', 20.00, 4, 2);
/*!40000 ALTER TABLE `materiales_insumos` ENABLE KEYS */;

-- Volcando estructura para tabla barberia_robins.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id_producto` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `unidad_medida` varchar(30) NOT NULL DEFAULT 'pieza',
  `costo_compra` decimal(10,2) NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `stock_actual` int NOT NULL,
  `stock_minimo` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  CONSTRAINT `productos_chk_1` CHECK ((`costo_compra` >= 0.00)),
  CONSTRAINT `productos_chk_2` CHECK ((`precio_venta` >= 0.00)),
  CONSTRAINT `productos_chk_3` CHECK ((`stock_actual` >= 0)),
  CONSTRAINT `productos_chk_4` CHECK ((`stock_minimo` >= 0))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla barberia_robins.productos: 9 rows
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`id_producto`, `nombre`, `categoria`, `unidad_medida`, `costo_compra`, `precio_venta`, `stock_actual`, `stock_minimo`) VALUES
	('p01', 'pomada de fijacion fuerte 100 g', 'estilizado', 'frasco', 85.00, 140.00, 11, 4),
	('p02', 'cera mate para cabello 100 g', 'estilizado', 'tarro', 75.00, 130.00, 10, 4),
	('p03', 'gel fijador 250 ml', 'estilizado', 'bote', 45.00, 80.00, 8, 3),
	('p04', 'polvo texturizante 20 g', 'estilizado', 'bote', 60.00, 110.00, 7, 3),
	('p05', 'crema para peinar 150 ml', 'cuidado capilar', 'tubo', 65.00, 115.00, 6, 3),
	('p06', 'shampoo para cabello 250 ml', 'cuidado capilar', 'botella', 55.00, 100.00, 9, 4),
	('p07', 'aceite para barba 30 ml', 'cuidado de barba', 'gotero', 70.00, 130.00, 14, 5),
	('p08', 'balsamo para barba 60 g', 'cuidado de barba', 'tarro', 90.00, 160.00, 5, 3),
	('p09', 'shampoo para barba 120 ml', 'cuidado de barba', 'botella', 60.00, 110.00, 7, 3);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Volcando estructura para tabla barberia_robins.servicios
CREATE TABLE IF NOT EXISTS `servicios` (
  `id_servicio` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `descripcion` text,
  `duracion_min` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `estado` varchar(20) DEFAULT 'activo',
  PRIMARY KEY (`id_servicio`),
  CONSTRAINT `servicios_chk_1` CHECK ((`duracion_min` >= 0)),
  CONSTRAINT `servicios_chk_2` CHECK ((`precio` >= 0.00))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla barberia_robins.servicios: 9 rows
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` (`id_servicio`, `nombre`, `categoria`, `descripcion`, `duracion_min`, `precio`, `estado`) VALUES
	('s01', 'servicio de corte', 'corte', 'corte de cabello. incluye bebida de cortesia y limpieza de cejas opcional', 60, 200.00, 'activo'),
	('s02', 'servicio corte de nino', 'corte', 'corte de cabello infantil. incluye bebida de cortesia', 45, 150.00, 'activo'),
	('s03', 'servicio corte y arreglo de barba', 'combo', 'corte y arreglo de barba. incluye toalla caliente, vaporizador, facial y bebida', 80, 290.00, 'activo'),
	('s04', 'arreglo de barba / afeitado completo', 'barba', 'arreglo o afeitado completo. incluye toalla caliente, vaporizador y bebida', 60, 180.00, 'activo'),
	('s05', 'servicio vip', 'premium', 'corte al gusto, facial, toalla caliente, vaporizador, masaje y mascarilla negra', 75, 300.00, 'activo'),
	('s06', 'servicio vip + barba', 'premium', 'facial, vaporizador, toalla caliente, masaje, mascarilla negra y arreglo de barba', 90, 350.00, 'activo'),
	('s07', 'servicio de corte y facial', 'combo', 'corte con facial. incluye toalla caliente, vaporizador y bebida de cortesia', 60, 250.00, 'activo'),
	('s08', 'mascarilla negra l', 'complemento', 'mascarilla negra como servicio adicional', 5, 30.00, 'activo'),
	('s09', 'cargo por cancelacion tardia', 'penalizacion', 'cargo aplicado por cancelacion con menos de 1 hora de anticipacion', 0, 80.00, 'activo');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;

-- Volcando estructura para tabla barberia_robins.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `rol` varchar(30) NOT NULL DEFAULT 'administrador',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `nombre_usuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla barberia_robins.usuarios: 1 rows
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `password_hash`, `rol`, `activo`, `nombre_usuario`) VALUES
	(1, 'Luis Alberto Hab Chan', 'admin123', 'administrador', 1, 'admin');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

-- Volcando estructura para tabla barberia_robins.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `folio_venta` int NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cliente` int DEFAULT NULL,
  `metodo_pago` enum('efectivo','transferencia','tarjeta') NOT NULL,
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `descuento_monto` decimal(10,2) DEFAULT '0.00',
  `total_venta` decimal(10,2) NOT NULL,
  `estado` enum('completada','cancelada') NOT NULL DEFAULT 'completada',
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`folio_venta`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `ventas_chk_1` CHECK ((`subtotal` >= 0.00)),
  CONSTRAINT `ventas_chk_2` CHECK ((`descuento_monto` >= 0.00)),
  CONSTRAINT `ventas_chk_3` CHECK ((`total_venta` >= 0.00))
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla barberia_robins.ventas: 5 rows
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` (`folio_venta`, `fecha_hora`, `id_cliente`, `metodo_pago`, `subtotal`, `descuento_monto`, `total_venta`, `estado`, `id_usuario`) VALUES
	(1, '2026-10-21 10:00:00', 1, 'efectivo', 200.00, 0.00, 200.00, 'completada', 1),
	(2, '2026-10-21 11:15:00', 2, 'efectivo', 430.00, 0.00, 430.00, 'completada', 1),
	(3, '2026-10-21 12:30:00', 3, 'transferencia', 180.00, 0.00, 180.00, 'completada', 1),
	(4, '2026-10-21 14:00:00', 4, 'tarjeta', 430.00, 0.00, 430.00, 'completada', 1),
	(5, '2026-10-21 16:00:00', 5, 'efectivo', 350.00, 0.00, 350.00, 'completada', 1),
	(6, '2026-11-05 19:57:22', 7, 'efectivo', 250.00, 0.00, 250.00, 'completada', 1),
	(7, '2026-11-05 19:58:15', 8, 'efectivo', 360.00, 0.00, 360.00, 'completada', 1),
	(8, '2026-11-05 20:00:56', 9, 'efectivo', 340.00, 0.00, 340.00, 'completada', 1);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
