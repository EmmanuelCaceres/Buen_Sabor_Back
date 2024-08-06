-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 06-08-2024 a las 00:22:48
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `buen_sabor1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo_insumo`
--

DROP TABLE IF EXISTS `articulo_insumo`;
CREATE TABLE IF NOT EXISTS `articulo_insumo` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `denominacion` varchar(255) DEFAULT NULL,
  `precio_venta` double DEFAULT NULL,
  `categoria_id` bigint DEFAULT NULL,
  `unidad_medida_id` bigint DEFAULT NULL,
  `es_para_elaborar` bit(1) DEFAULT NULL,
  `precio_compra` double DEFAULT NULL,
  `stock_actual` int DEFAULT NULL,
  `stock_maximo` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bq24pwi1icjnu04cdhfq8qik2` (`categoria_id`),
  KEY `FK_t87v5vp2gygwbhs0s5t4x78aj` (`unidad_medida_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo_manufacturado`
--

DROP TABLE IF EXISTS `articulo_manufacturado`;
CREATE TABLE IF NOT EXISTS `articulo_manufacturado` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `denominacion` varchar(255) DEFAULT NULL,
  `precio_venta` double DEFAULT NULL,
  `categoria_id` bigint DEFAULT NULL,
  `unidad_medida_id` bigint DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `preparacion` varchar(255) DEFAULT NULL,
  `tiempo_estimado_minutos` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rxvuc695pmrvn93gu3564up7y` (`categoria_id`),
  KEY `FK_j2ltshqmxs8ksyttgpwm7tt27` (`unidad_medida_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo_manufacturado_detalle`
--

DROP TABLE IF EXISTS `articulo_manufacturado_detalle`;
CREATE TABLE IF NOT EXISTS `articulo_manufacturado_detalle` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `cantidad` int DEFAULT NULL,
  `articulo_insumo_id` bigint DEFAULT NULL,
  `articulo_manufacturado_detalle_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKee8sad16ogk7in2nlh0vc3y9b` (`articulo_insumo_id`),
  KEY `FKmq6wwsgxaoxlc7rmrgu0acj7a` (`articulo_manufacturado_detalle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo_manufacturado_detalle_seq`
--

DROP TABLE IF EXISTS `articulo_manufacturado_detalle_seq`;
CREATE TABLE IF NOT EXISTS `articulo_manufacturado_detalle_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `articulo_manufacturado_detalle_seq`
--

INSERT INTO `articulo_manufacturado_detalle_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo_seq`
--

DROP TABLE IF EXISTS `articulo_seq`;
CREATE TABLE IF NOT EXISTS `articulo_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `articulo_seq`
--

INSERT INTO `articulo_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `denominacion` varchar(255) DEFAULT NULL,
  `categoria_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjiixv3teefdkilvoysutbedif` (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_seq`
--

DROP TABLE IF EXISTS `categoria_seq`;
CREATE TABLE IF NOT EXISTS `categoria_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categoria_seq`
--

INSERT INTO `categoria_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `tipo_cliente` tinyint DEFAULT NULL,
  `imagen_cliente_id` bigint DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_cxt0yqevxn9ungm4i57sb9ojj` (`imagen_cliente_id`),
  UNIQUE KEY `UK_id7jmosqg8hkqiqw4vf50xipm` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_domicilio`
--

DROP TABLE IF EXISTS `cliente_domicilio`;
CREATE TABLE IF NOT EXISTS `cliente_domicilio` (
  `cliente_id` bigint NOT NULL,
  `domicilio_id` bigint NOT NULL,
  PRIMARY KEY (`cliente_id`,`domicilio_id`),
  KEY `FK7jkekc8ff2g28bthd4dd9d7r2` (`domicilio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_seq`
--

DROP TABLE IF EXISTS `cliente_seq`;
CREATE TABLE IF NOT EXISTS `cliente_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cliente_seq`
--

INSERT INTO `cliente_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `cantidad` int DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `articulo_id` bigint DEFAULT NULL,
  `pedido_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgqvba9e7dildyw45u0usdj1k2` (`pedido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido_seq`
--

DROP TABLE IF EXISTS `detalle_pedido_seq`;
CREATE TABLE IF NOT EXISTS `detalle_pedido_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `detalle_pedido_seq`
--

INSERT INTO `detalle_pedido_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

DROP TABLE IF EXISTS `domicilio`;
CREATE TABLE IF NOT EXISTS `domicilio` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `calle` varchar(255) DEFAULT NULL,
  `cp` int DEFAULT NULL,
  `nro_dpto` int DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `piso` int DEFAULT NULL,
  `id_localidad` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqrmmkejvimmve55527wv6ujtr` (`id_localidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio_seq`
--

DROP TABLE IF EXISTS `domicilio_seq`;
CREATE TABLE IF NOT EXISTS `domicilio_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `domicilio_seq`
--

INSERT INTO `domicilio_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `tipo_empleado` tinyint DEFAULT NULL,
  `imagen_empleado_id` bigint DEFAULT NULL,
  `sucursal_id` bigint DEFAULT NULL,
  `usuario_empleado_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_o2cppi3v44p7h2vibx0pe3lah` (`imagen_empleado_id`),
  UNIQUE KEY `UK_f2mjsug9ttwgbw9o4qwun93it` (`usuario_empleado_id`),
  KEY `FKkv68lx8xpbpv6jprh7taieaej` (`sucursal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_seq`
--

DROP TABLE IF EXISTS `empleado_seq`;
CREATE TABLE IF NOT EXISTS `empleado_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empleado_seq`
--

INSERT INTO `empleado_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `cuil` bigint DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `razon_social` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_seq`
--

DROP TABLE IF EXISTS `empresa_seq`;
CREATE TABLE IF NOT EXISTS `empresa_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empresa_seq`
--

INSERT INTO `empresa_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE IF NOT EXISTS `factura` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `fecha_facturacion` date DEFAULT NULL,
  `forma_pago` tinyint DEFAULT NULL,
  `mp_merchant_order_id` int DEFAULT NULL,
  `mp_payment_id` int DEFAULT NULL,
  `mp_payment_type` varchar(255) DEFAULT NULL,
  `mp_preference_id` varchar(255) DEFAULT NULL,
  `total_venta` double DEFAULT NULL,
  `pedido_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ngujt6d9ti8crahqfrfb4p9d8` (`pedido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_seq`
--

DROP TABLE IF EXISTS `factura_seq`;
CREATE TABLE IF NOT EXISTS `factura_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `factura_seq`
--

INSERT INTO `factura_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen_articulo`
--

DROP TABLE IF EXISTS `imagen_articulo`;
CREATE TABLE IF NOT EXISTS `imagen_articulo` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `imagen_articulo_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen_articulo_seq`
--

DROP TABLE IF EXISTS `imagen_articulo_seq`;
CREATE TABLE IF NOT EXISTS `imagen_articulo_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `imagen_articulo_seq`
--

INSERT INTO `imagen_articulo_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen_cliente`
--

DROP TABLE IF EXISTS `imagen_cliente`;
CREATE TABLE IF NOT EXISTS `imagen_cliente` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen_cliente_seq`
--

DROP TABLE IF EXISTS `imagen_cliente_seq`;
CREATE TABLE IF NOT EXISTS `imagen_cliente_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `imagen_cliente_seq`
--

INSERT INTO `imagen_cliente_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen_empleado`
--

DROP TABLE IF EXISTS `imagen_empleado`;
CREATE TABLE IF NOT EXISTS `imagen_empleado` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen_empleado_seq`
--

DROP TABLE IF EXISTS `imagen_empleado_seq`;
CREATE TABLE IF NOT EXISTS `imagen_empleado_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `imagen_empleado_seq`
--

INSERT INTO `imagen_empleado_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen_promocion`
--

DROP TABLE IF EXISTS `imagen_promocion`;
CREATE TABLE IF NOT EXISTS `imagen_promocion` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `promocion_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfigh8y0s5beb3p1f7jaab8brr` (`promocion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen_promocion_seq`
--

DROP TABLE IF EXISTS `imagen_promocion_seq`;
CREATE TABLE IF NOT EXISTS `imagen_promocion_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `imagen_promocion_seq`
--

INSERT INTO `imagen_promocion_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

DROP TABLE IF EXISTS `localidad`;
CREATE TABLE IF NOT EXISTS `localidad` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `id_provincia` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbsjp9dyq5f3hk4ngy6pw3v3b2` (`id_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`id`, `eliminado`, `nombre`, `id_provincia`) VALUES
(1, b'0', 'Adolfo Gonzales Chaves', 1),
(2, b'0', 'Concordia', 2),
(3, b'0', 'Federal', 2),
(4, b'0', 'Gualeguaychú', 2),
(5, b'0', 'Islas del Ibicuy', 2),
(6, b'0', 'Victoria', 2),
(7, b'0', 'Diamante', 2),
(8, b'0', 'Uruguay', 2),
(9, b'0', 'Paraná', 2),
(10, b'0', 'Saladillo', 1),
(11, b'0', 'Las Flores', 1),
(12, b'0', 'Rojas', 1),
(13, b'0', 'Escobar', 1),
(14, b'0', 'José C. Paz', 1),
(15, b'0', 'Bahía Blanca', 1),
(16, b'0', 'San Antonio de Areco', 1),
(17, b'0', 'Maipú', 1),
(18, b'0', 'General Alvarado', 1),
(19, b'0', 'General Pueyrredón', 1),
(20, b'0', 'Mar Chiquita', 1),
(21, b'0', 'Villa Gesell', 1),
(22, b'0', 'Pinamar', 1),
(23, b'0', 'General Lavalle', 1),
(24, b'0', 'La Costa', 1),
(25, b'0', 'Magdalena', 1),
(26, b'0', 'Sauce', 3),
(27, b'0', 'Vicente López', 1),
(28, b'0', 'La Viña', 4),
(29, b'0', 'Rauch', 1),
(30, b'0', 'Metán', 4),
(31, b'0', 'Molinos', 4),
(32, b'0', 'O\'Higgins', 5),
(33, b'0', 'Moreno', 1),
(34, b'0', 'La Matanza', 1),
(35, b'0', 'Tandil', 1),
(36, b'0', 'Coronel Suárez', 1),
(37, b'0', 'Chamical', 6),
(38, b'0', 'Futaleufú', 7),
(39, b'0', 'Río Chico', 8),
(40, b'0', 'San Antonio', 9),
(41, b'0', 'Alberdi', 10),
(42, b'0', 'Juan Felipe Ibarra', 10),
(43, b'0', 'General Taboada', 10),
(44, b'0', 'Salliqueló', 1),
(45, b'0', 'Berazategui', 1),
(46, b'0', 'General Güemes', 4),
(47, b'0', 'San Carlos', 4),
(48, b'0', 'General Paz', 1),
(49, b'0', 'General Guido', 1),
(50, b'0', 'General Juan Madariaga', 1),
(51, b'0', 'Lago Argentino', 8),
(52, b'0', 'Rivadavia', 10),
(53, b'0', 'Ojo de Agua', 10),
(54, b'0', 'Choya', 10),
(55, b'0', 'Gobernador Dupuy', 11),
(56, b'0', 'Cachi', 4),
(57, b'0', 'Chicoana', 4),
(58, b'0', 'Gaiman', 7),
(59, b'0', 'Rawson', 7),
(60, b'0', 'General Lamadrid', 6),
(61, b'0', 'Ayacucho', 11),
(62, b'0', '12 de Octubre', 5),
(63, b'0', 'Tulumba', 12),
(64, b'0', 'Cruz del Eje', 12),
(65, b'0', 'Punilla', 12),
(66, b'0', 'Comuna 6', 2),
(67, b'0', 'Santa Rosa', 13),
(68, b'0', 'General Güemes', 5),
(69, b'0', 'General Ortiz de Ocampo', 6),
(70, b'0', 'General Roca', 12),
(71, b'0', 'Pilagás', 14),
(72, b'0', 'Laishi', 14),
(73, b'0', 'Rivadavia', 13),
(74, b'0', 'Tornquist', 1),
(75, b'0', 'La Paz', 13),
(76, b'0', 'Coronel Pringles', 1),
(77, b'0', 'Conesa', 9),
(78, b'0', 'Villarino', 1),
(79, b'0', 'Pirané', 14),
(80, b'0', 'General Pinto', 1),
(81, b'0', 'San Cayetano', 1),
(82, b'0', 'Tres Arroyos', 1),
(83, b'0', 'Coronel Dorrego', 1),
(84, b'0', 'Necochea', 1),
(85, b'0', 'Independencia', 6),
(86, b'0', 'Chascomús', 1),
(87, b'0', 'Punta Indio', 1),
(88, b'0', 'El Carmen', 15),
(89, b'0', 'Santa María', 12),
(90, b'0', 'Valcheta', 9),
(91, b'0', 'Arauco', 6),
(92, b'0', 'Lezama', 1),
(93, b'0', 'Campana', 1),
(94, b'0', 'Magallanes', 8),
(95, b'0', 'Corpen Aike', 8),
(96, b'0', 'Minas', 12),
(97, b'0', 'San Alberto', 12),
(98, b'0', 'Río Segundo', 12),
(99, b'0', 'San Justo', 12),
(100, b'0', 'Unión', 12),
(101, b'0', 'Tercero Arriba', 12),
(102, b'0', 'Cerrillos', 4),
(103, b'0', 'Río Cuarto', 12),
(104, b'0', 'Tupungato', 13),
(105, b'0', '9 de Julio', 9),
(106, b'0', 'Ñorquinco', 9),
(107, b'0', 'San Rafael', 13),
(108, b'0', 'Anta', 4),
(109, b'0', 'Picún Leufú', 16),
(110, b'0', 'Zapala', 16),
(111, b'0', '25 de Mayo', 9),
(112, b'0', 'Telsen', 7),
(113, b'0', 'Pilcaniyeu', 9),
(114, b'0', 'Adolfo Alsina', 1),
(115, b'0', 'General Alvear', 13),
(116, b'0', 'La Caldera', 4),
(117, b'0', 'Sargento Cabral', 5),
(118, b'0', 'Pellegrini', 1),
(119, b'0', 'Aluminé', 16),
(120, b'0', 'Iruya', 4),
(121, b'0', 'Lácar', 16),
(122, b'0', 'Fray Mamerto Esquiú', 10),
(123, b'0', 'Valle Viejo', 10),
(124, b'0', 'San Cosme', 3),
(125, b'0', 'Sarmiento', 7),
(126, b'0', 'Comuna 1', 2),
(127, b'0', 'Comuna 4', 2),
(128, b'0', 'El Cuy', 9),
(129, b'0', 'Las Heras', 13),
(130, b'0', 'Tapenagá', 5),
(131, b'0', 'Lavalle', 13),
(132, b'0', 'Malargüe', 13),
(133, b'0', 'Presidente Roque Sáenz Peña', 12),
(134, b'0', 'Catán Lil', 16),
(135, b'0', 'Presidencia de la Plaza', 5),
(136, b'0', 'Comuna 5', 2),
(137, b'0', 'Esquina', 3),
(138, b'0', 'Ushuaia', 17),
(139, b'0', 'Antofagasta de la Sierra', 10),
(140, b'0', 'Ensenada', 1),
(141, b'0', 'Capital', 18),
(142, b'0', 'Belgrano', 19),
(143, b'0', 'Pergamino', 1),
(144, b'0', 'Puán', 1),
(145, b'0', 'General Villegas', 1),
(146, b'0', 'Comuna 12', 2),
(147, b'0', 'General Obligado', 19),
(148, b'0', 'Vera', 19),
(149, b'0', '9 de Julio', 19),
(150, b'0', 'Adolfo Alsina', 9),
(151, b'0', 'Quitilipi', 5),
(152, b'0', 'Güer Aike', 8),
(153, b'0', 'Capayán', 10),
(154, b'0', 'Burruyacú', 18),
(155, b'0', 'San Jerónimo', 19),
(156, b'0', 'Independencia', 5),
(157, b'0', 'Curuzú Cuatiá', 3),
(158, b'0', 'Luján de Cuyo', 13),
(159, b'0', 'Tinogasta', 10),
(160, b'0', 'Comuna 7', 2),
(161, b'0', 'Hucal', 20),
(162, b'0', 'Itatí', 3),
(163, b'0', 'Comuna 10', 2),
(164, b'0', 'Caleu Caleu', 20),
(165, b'0', 'Lihuel Calel', 20),
(166, b'0', 'Curacó', 20),
(167, b'0', 'Confluencia', 16),
(168, b'0', 'Picunches', 16),
(169, b'0', 'Añelo', 16),
(170, b'0', 'Loncopué', 16),
(171, b'0', 'Ñorquín', 16),
(172, b'0', 'Pehuenches', 16),
(173, b'0', 'Comuna 11', 2),
(174, b'0', 'Montecarlo', 21),
(175, b'0', 'Eldorado', 21),
(176, b'0', 'San Pedro', 21),
(177, b'0', 'Antártida Argentina', 17),
(178, b'0', 'Minas', 16),
(179, b'0', 'Chos Malal', 16),
(180, b'0', 'Cushamen', 7),
(181, b'0', 'Lago Buenos Aires', 8),
(182, b'0', 'Pichi Mahuida', 9),
(183, b'0', 'San Martín', 22),
(184, b'0', 'Yavi', 15),
(185, b'0', 'Santa Catalina', 15),
(186, b'0', 'San Pedro', 15),
(187, b'0', 'Valle Grande', 15),
(188, b'0', 'Patiño', 14),
(189, b'0', 'Bermejo', 14),
(190, b'0', 'Susques', 15),
(191, b'0', 'Matacos', 14),
(192, b'0', 'Los Andes', 4),
(193, b'0', 'Orán', 4),
(194, b'0', 'Tilcara', 15),
(195, b'0', 'Palpalá', 15),
(196, b'0', 'Loventué', 20),
(197, b'0', 'Río Senguer', 7),
(198, b'0', 'Bariloche', 9),
(199, b'0', 'Huiliches', 16),
(200, b'0', 'Limay Mahuida', 20),
(201, b'0', 'Puelén', 20),
(202, b'0', 'Chalileo', 20),
(203, b'0', 'Chical Co', 20),
(204, b'0', 'Quebrachos', 22),
(205, b'0', 'Monte Caseros', 3),
(206, b'0', 'Mayor Luis J. Fontana', 5),
(207, b'0', 'Fray Justo Santa María de Oro', 5),
(208, b'0', 'General Belgrano', 6),
(209, b'0', 'Las Colonias', 19),
(210, b'0', 'San Justo', 19),
(211, b'0', 'San Cristóbal', 19),
(212, b'0', 'San Javier', 19),
(213, b'0', 'Chapaleufú', 20),
(214, b'0', 'Realicó', 20),
(215, b'0', 'Maracó', 20),
(216, b'0', 'Trenel', 20),
(217, b'0', 'Copo', 22),
(218, b'0', 'Capital', 20),
(219, b'0', 'Santa Bárbara', 15),
(220, b'0', 'Almirante Brown', 5),
(221, b'0', 'Rosario de la Frontera', 4),
(222, b'0', 'Collón Curá', 16),
(223, b'0', 'Comuna 3', 2),
(224, b'0', 'San Fernando', 1),
(225, b'0', 'Tigre', 1),
(226, b'0', 'Santa María', 10),
(227, b'0', 'Santa Rosa', 10),
(228, b'0', 'La Paz', 10),
(229, b'0', 'Río Hondo', 22),
(230, b'0', 'Vinchina', 6),
(231, b'0', 'Capital', 6),
(232, b'0', 'Río Seco', 12),
(233, b'0', 'Avellaneda', 9),
(234, b'0', 'General Roca', 9),
(235, b'0', 'Belgrano', 11),
(236, b'0', 'Los Lagos', 16),
(237, b'0', 'Capital', 10),
(238, b'0', 'Ancasti', 10),
(239, b'0', 'Pomán', 10),
(240, b'0', 'Comuna 2', 2),
(241, b'0', '9 de Julio', 5),
(242, b'0', 'Pocho', 12),
(243, b'0', 'Ezeiza', 1),
(244, b'0', 'Andalgalá', 10),
(245, b'0', 'Ambato', 10),
(246, b'0', 'Comuna 8', 2),
(247, b'0', 'Guasayán', 22),
(248, b'0', 'Paclín', 10),
(249, b'0', 'El Alto', 10),
(250, b'0', 'Sobremonte', 12),
(251, b'0', 'Río Grande', 17),
(252, b'0', 'Comuna 13', 2),
(253, b'0', 'Banda', 22),
(254, b'0', 'Paso de Indios', 7),
(255, b'0', 'Capital', 12),
(256, b'0', 'Mártires', 7),
(257, b'0', 'Sarmiento', 22),
(258, b'0', 'Deseado', 8),
(259, b'0', 'Languiñeo', 7),
(260, b'0', 'Belgrano', 22),
(261, b'0', 'Aguirre', 22),
(262, b'0', 'Maipú', 5),
(263, b'0', 'San Carlos', 13),
(264, b'0', 'Tunuyán', 13),
(265, b'0', 'Robles', 22),
(266, b'0', 'Loreto', 22),
(267, b'0', 'Catriló', 20),
(268, b'0', 'Capital', 22),
(269, b'0', 'Comuna 14', 2),
(270, b'0', 'Colón', 23),
(271, b'0', 'Villaguay', 23),
(272, b'0', 'Castelli', 1),
(273, b'0', 'San Salvador', 23),
(274, b'0', 'Belén', 10),
(275, b'0', 'Almirante Brown', 1),
(276, b'0', 'Nogoyá', 23),
(277, b'0', 'Tala', 23),
(278, b'0', 'Gualeguay', 23),
(279, b'0', 'Federación', 23),
(280, b'0', 'La Paz', 23),
(281, b'0', 'Feliciano', 23),
(282, b'0', 'Presidente Perón', 1),
(283, b'0', 'Junín', 1),
(284, b'0', 'Brandsen', 1),
(285, b'0', 'Chivilcoy', 1),
(286, b'0', 'Alberti', 1),
(287, b'0', 'Bragado', 1),
(288, b'0', 'General Las Heras', 1),
(289, b'0', 'Carlos Casares', 1),
(290, b'0', 'Marcos Paz', 1),
(291, b'0', 'General Viamonte', 1),
(292, b'0', 'Carlos Tejedor', 1),
(293, b'0', '25 de Mayo', 1),
(294, b'0', '9 de Julio', 1),
(295, b'0', 'Pehuajó', 1),
(296, b'0', 'Tapalqué', 1),
(297, b'0', 'Trenque Lauquen', 1),
(298, b'0', 'General Belgrano', 1),
(299, b'0', 'Monte', 1),
(300, b'0', 'Roque Pérez', 1),
(301, b'0', 'Olavarría', 1),
(302, b'0', 'Merlo', 1),
(303, b'0', 'Cainguás', 21),
(304, b'0', 'Islas del Atlántico Sur', 17),
(305, b'0', 'Esteban Echeverría', 1),
(306, b'0', 'Arrecifes', 1),
(307, b'0', 'Capitán Sarmiento', 1),
(308, b'0', 'Dr. Manuel Belgrano', 15),
(309, b'0', 'Carmen de Areco', 1),
(310, b'0', 'Salto', 1),
(311, b'0', 'Exaltación de la Cruz', 1),
(312, b'0', 'San Miguel', 1),
(313, b'0', 'San Andrés de Giles', 1),
(314, b'0', 'Mercedes', 1),
(315, b'0', 'Pilar', 1),
(316, b'0', 'Luján', 1),
(317, b'0', 'Famaillá', 18),
(318, b'0', 'Hurlingham', 1),
(319, b'0', 'Morón', 1),
(320, b'0', 'Chacabuco', 1),
(321, b'0', 'Junín', 13),
(322, b'0', 'Malvinas Argentinas', 1),
(323, b'0', 'Tres Lomas', 1),
(324, b'0', 'Ayacucho', 1),
(325, b'0', 'Guaminí', 1),
(326, b'0', 'General San Martín', 1),
(327, b'0', 'Lincoln', 1),
(328, b'0', 'Laprida', 1),
(329, b'0', 'San Isidro', 1),
(330, b'0', 'Benito Juárez', 1),
(331, b'0', 'Colón', 1),
(332, b'0', 'Ituzaingó', 1),
(333, b'0', 'General Rodríguez', 1),
(334, b'0', 'Suipacha', 1),
(335, b'0', 'Tres de Febrero', 1),
(336, b'0', 'General Felipe Varela', 6),
(337, b'0', 'Florencio Varela', 1),
(338, b'0', 'Navarro', 1),
(339, b'0', 'Cañuelas', 1),
(340, b'0', 'Moreno', 22),
(341, b'0', 'Chacabuco', 5),
(342, b'0', 'San Vicente', 1),
(343, b'0', 'Lobos', 1),
(344, b'0', 'General Alvear', 1),
(345, b'0', 'Quilmes', 1),
(346, b'0', 'Pila', 1),
(347, b'0', 'General La Madrid', 1),
(348, b'0', 'Bolívar', 1),
(349, b'0', 'Castro Barros', 6),
(350, b'0', 'Balcarce', 1),
(351, b'0', 'Hipólito Yrigoyen', 1),
(352, b'0', 'Capital', 13),
(353, b'0', 'Dolores', 1),
(354, b'0', 'Azul', 1),
(355, b'0', 'Daireaux', 1),
(356, b'0', 'Godoy Cruz', 13),
(357, b'0', 'Cafayate', 4),
(358, b'0', 'Figueroa', 22),
(359, b'0', 'Saavedra', 1),
(360, b'0', 'Monte Hermoso', 1),
(361, b'0', 'Lobería', 1),
(362, b'0', 'Berisso', 1),
(363, b'0', 'Tordillo', 1),
(364, b'0', 'Zárate', 1),
(365, b'0', 'Ramallo', 1),
(366, b'0', 'San Nicolás', 1),
(367, b'0', 'Salavina', 22),
(368, b'0', 'Pellegrini', 22),
(369, b'0', 'Avellaneda', 22),
(370, b'0', '2 de Abril', 5),
(371, b'0', 'Guaymallén', 13),
(372, b'0', 'Juárez Celman', 12),
(373, b'0', 'Capital', 4),
(374, b'0', 'Silípica', 22),
(375, b'0', 'La Candelaria', 4),
(376, b'0', 'Rancul', 20),
(377, b'0', 'Maipú', 13),
(378, b'0', 'Guachipas', 4),
(379, b'0', 'Atreucó', 20),
(380, b'0', 'San Martín', 13),
(381, b'0', 'Guatraché', 20),
(382, b'0', 'Sanagasta', 6),
(383, b'0', 'Conhelo', 20),
(384, b'0', 'Libertador General San Martín', 21),
(385, b'0', 'Rosario Vera Peñaloza', 6),
(386, b'0', 'San Miguel', 3),
(387, b'0', 'General Juan Facundo Quiroga', 6),
(388, b'0', 'Ángel Vicente Peñaloza', 6),
(389, b'0', 'Empedrado', 3),
(390, b'0', 'Chilecito', 6),
(391, b'0', 'Toay', 20),
(392, b'0', 'Colón', 12),
(393, b'0', 'Ituzaingó', 3),
(394, b'0', 'Famatina', 6),
(395, b'0', 'General López', 19),
(396, b'0', 'Constitución', 19),
(397, b'0', 'Caseros', 19),
(398, b'0', 'Rosario', 19),
(399, b'0', 'San Lorenzo', 19),
(400, b'0', 'Iriondo', 19),
(401, b'0', 'Lanús', 1),
(402, b'0', 'General San Martín', 6),
(403, b'0', 'San Blas de Los Sauces', 6),
(404, b'0', 'San Antonio', 15),
(405, b'0', 'Rinconada', 15),
(406, b'0', 'Ramón Lista', 14),
(407, b'0', 'La Poma', 4),
(408, b'0', 'Biedma', 7),
(409, b'0', 'Capital', 3),
(410, b'0', 'San Luis del Palmar', 3),
(411, b'0', 'Formosa', 14),
(412, b'0', 'Pilcomayo', 14),
(413, b'0', 'Tehuelches', 7),
(414, b'0', 'Escalante', 7),
(415, b'0', 'Ischilín', 12),
(416, b'0', 'Totoral', 12),
(417, b'0', 'General San Martín', 12),
(418, b'0', 'San Javier', 12),
(419, b'0', 'Río Primero', 12),
(420, b'0', 'Marcos Juárez', 12),
(421, b'0', 'General Donovan', 5),
(422, b'0', 'Leandro N. Alem', 1),
(423, b'0', 'Libertador General San Martín', 5),
(424, b'0', 'Gastre', 7),
(425, b'0', 'General Arenales', 1),
(426, b'0', 'Bermejo', 5),
(427, b'0', 'Calamuchita', 12),
(428, b'0', 'Cruz Alta', 18),
(429, b'0', 'Lules', 18),
(430, b'0', 'Yerba Buena', 18),
(431, b'0', 'Tafí Viejo', 18),
(432, b'0', 'Libertador General San Martín', 11),
(433, b'0', 'Coronel Pringles', 11),
(434, b'0', 'Chacabuco', 11),
(435, b'0', 'Rivadavia', 1),
(436, b'0', 'Patagones', 1),
(437, b'0', 'Juan Martín de Pueyrredón', 11),
(438, b'0', 'General Pedernera', 11),
(439, b'0', 'Trancas', 18),
(440, b'0', 'Tafí del Valle', 18),
(441, b'0', 'Comuna 9', 2),
(442, b'0', 'Junín', 11),
(443, b'0', 'Mitre', 22),
(444, b'0', 'Atamisqui', 22),
(445, b'0', 'Berón de Astrada', 3),
(446, b'0', 'Tolhuin', 17),
(447, b'0', 'Capital', 21),
(448, b'0', 'Candelaria', 21),
(449, b'0', 'Jiménez', 22),
(450, b'0', 'Coronel de Marina Leonardo Rosales', 1),
(451, b'0', 'Baradero', 1),
(452, b'0', 'San Pedro', 1),
(453, b'0', 'Santa Victoria', 4),
(454, b'0', 'General José de San Martín', 4),
(455, b'0', 'Rivadavia', 4),
(456, b'0', 'Rosario de Lerma', 4),
(457, b'0', 'Ledesma', 15),
(458, b'0', 'Humahuaca', 15),
(459, b'0', 'Cochinoca', 15),
(460, b'0', 'Tumbaya', 15),
(461, b'0', 'Florentino Ameghino', 1),
(462, b'0', 'Florentino Ameghino', 7),
(463, b'0', 'La Cocha', 18),
(464, b'0', 'Graneros', 18),
(465, b'0', 'Juan Bautista Alberdi', 18),
(466, b'0', 'Río Chico', 18),
(467, b'0', 'Simoca', 18),
(468, b'0', 'Chicligasta', 18),
(469, b'0', 'Monteros', 18),
(470, b'0', 'Leales', 18),
(471, b'0', 'San Martín', 19),
(472, b'0', 'La Capital', 19),
(473, b'0', 'General Manuel Belgrano', 21),
(474, b'0', 'Guaraní', 21),
(475, b'0', 'Iguazú', 21),
(476, b'0', '25 de Mayo', 21),
(477, b'0', 'Oberá', 21),
(478, b'0', 'Castellanos', 19),
(479, b'0', 'Garay', 19),
(480, b'0', 'Quemú Quemú', 20),
(481, b'0', 'San Ignacio', 21),
(482, b'0', 'Utracán', 20),
(483, b'0', 'San Martín', 3),
(484, b'0', 'Paso de los Libres', 3),
(485, b'0', 'Goya', 3),
(486, b'0', 'Lavalle', 3),
(487, b'0', 'San Roque', 3),
(488, b'0', 'General Alvear', 3),
(489, b'0', 'Concepción', 3),
(490, b'0', 'Bella Vista', 3),
(491, b'0', 'Santo Tomé', 3),
(492, b'0', 'Saladas', 3),
(493, b'0', 'General Paz', 3),
(494, b'0', 'Leandro N. Alem', 21),
(495, b'0', 'San Javier', 21),
(496, b'0', 'Mburucuyá', 3),
(497, b'0', 'Concepción', 21),
(498, b'0', 'Apóstoles', 21),
(499, b'0', '1° de Mayo', 5),
(500, b'0', 'San Fernando', 5),
(501, b'0', 'San Lorenzo', 5),
(502, b'0', 'Lomas de Zamora', 1),
(503, b'0', 'Avellaneda', 1),
(504, b'0', '25 de Mayo', 5),
(505, b'0', 'General Belgrano', 5),
(506, b'0', 'Libertad', 5),
(507, b'0', 'Comandante Fernández', 5),
(508, b'0', 'Comuna 15', 2),
(509, b'0', 'Chimbas', 24),
(510, b'0', 'Capital', 24),
(511, b'0', 'Rivadavia', 24),
(512, b'0', '9 de Julio', 24),
(513, b'0', 'Albardón', 24),
(514, b'0', 'Angaco', 24),
(515, b'0', 'Santa Lucía', 24),
(516, b'0', 'Rawson', 24),
(517, b'0', '25 de Mayo', 24),
(518, b'0', 'San Martín', 24),
(519, b'0', 'Pocito', 24),
(520, b'0', 'Zonda', 24),
(521, b'0', 'Ullum', 24),
(522, b'0', 'Sarmiento', 24),
(523, b'0', 'Calingasta', 24),
(524, b'0', 'Iglesia', 24),
(525, b'0', 'Jáchal', 24),
(526, b'0', 'Valle Fértil', 24),
(527, b'0', 'Caucete', 24),
(528, b'0', 'La Plata', 1),
(529, b'0', 'Mercedes', 3),
(552, b'0', 'Adolfo Gonzales Chaves', 1),
(553, b'0', 'Concordia', 23),
(554, b'0', 'Federal', 23),
(555, b'0', 'Gualeguaychú', 23),
(556, b'0', 'Islas del Ibicuy', 23),
(557, b'0', 'Victoria', 23),
(558, b'0', 'Diamante', 23),
(559, b'0', 'Uruguay', 23),
(560, b'0', 'Paraná', 23),
(561, b'0', 'Saladillo', 1),
(562, b'0', 'Las Flores', 1),
(563, b'0', 'Rojas', 1),
(564, b'0', 'Escobar', 1),
(565, b'0', 'José C. Paz', 1),
(566, b'0', 'Bahía Blanca', 1),
(567, b'0', 'San Antonio de Areco', 1),
(568, b'0', 'Maipú', 1),
(569, b'0', 'General Alvarado', 1),
(570, b'0', 'General Pueyrredón', 1),
(571, b'0', 'Mar Chiquita', 1),
(572, b'0', 'Villa Gesell', 1),
(573, b'0', 'Pinamar', 1),
(574, b'0', 'General Lavalle', 1),
(575, b'0', 'La Costa', 1),
(576, b'0', 'Magdalena', 1),
(577, b'0', 'Sauce', 3),
(578, b'0', 'Vicente López', 1),
(579, b'0', 'La Viña', 4),
(580, b'0', 'Rauch', 1),
(581, b'0', 'Metán', 4),
(582, b'0', 'Molinos', 4),
(583, b'0', 'O\'Higgins', 5),
(584, b'0', 'Moreno', 1),
(585, b'0', 'La Matanza', 1),
(586, b'0', 'Tandil', 1),
(587, b'0', 'Coronel Suárez', 1),
(588, b'0', 'Chamical', 6),
(589, b'0', 'Futaleufú', 7),
(590, b'0', 'Río Chico', 8),
(591, b'0', 'San Antonio', 9),
(592, b'0', 'Alberdi', 22),
(593, b'0', 'Juan Felipe Ibarra', 22),
(594, b'0', 'General Taboada', 22),
(595, b'0', 'Salliqueló', 1),
(596, b'0', 'Berazategui', 1),
(597, b'0', 'General Güemes', 4),
(598, b'0', 'San Carlos', 4),
(599, b'0', 'General Paz', 1),
(600, b'0', 'General Guido', 1),
(601, b'0', 'General Juan Madariaga', 1),
(602, b'0', 'Lago Argentino', 8),
(603, b'0', 'Rivadavia', 22),
(604, b'0', 'Ojo de Agua', 22),
(605, b'0', 'Choya', 22),
(606, b'0', 'Gobernador Dupuy', 11),
(607, b'0', 'Cachi', 4),
(608, b'0', 'Chicoana', 4),
(609, b'0', 'Gaiman', 7),
(610, b'0', 'Rawson', 7),
(611, b'0', 'General Lamadrid', 6),
(612, b'0', 'Ayacucho', 11),
(613, b'0', '12 de Octubre', 5),
(614, b'0', 'Tulumba', 12),
(615, b'0', 'Cruz del Eje', 12),
(616, b'0', 'Punilla', 12),
(617, b'0', 'Comuna 6', 2),
(618, b'0', 'Santa Rosa', 13),
(619, b'0', 'General Güemes', 5),
(620, b'0', 'General Ortiz de Ocampo', 6),
(621, b'0', 'General Roca', 12),
(622, b'0', 'Pilagás', 14),
(623, b'0', 'Laishi', 14),
(624, b'0', 'Rivadavia', 13),
(625, b'0', 'Tornquist', 1),
(626, b'0', 'La Paz', 13),
(627, b'0', 'Coronel Pringles', 1),
(628, b'0', 'Conesa', 9),
(629, b'0', 'Villarino', 1),
(630, b'0', 'Pirané', 14),
(631, b'0', 'General Pinto', 1),
(632, b'0', 'San Cayetano', 1),
(633, b'0', 'Tres Arroyos', 1),
(634, b'0', 'Coronel Dorrego', 1),
(635, b'0', 'Necochea', 1),
(636, b'0', 'Independencia', 6),
(637, b'0', 'Chascomús', 1),
(638, b'0', 'Punta Indio', 1),
(639, b'0', 'El Carmen', 15),
(640, b'0', 'Santa María', 12),
(641, b'0', 'Valcheta', 9),
(642, b'0', 'Arauco', 6),
(643, b'0', 'Lezama', 1),
(644, b'0', 'Campana', 1),
(645, b'0', 'Magallanes', 8),
(646, b'0', 'Corpen Aike', 8),
(647, b'0', 'Minas', 12),
(648, b'0', 'San Alberto', 12),
(649, b'0', 'Río Segundo', 12),
(650, b'0', 'San Justo', 12),
(651, b'0', 'Unión', 12),
(652, b'0', 'Tercero Arriba', 12),
(653, b'0', 'Cerrillos', 4),
(654, b'0', 'Río Cuarto', 12),
(655, b'0', 'Tupungato', 13),
(656, b'0', '9 de Julio', 9),
(657, b'0', 'Ñorquinco', 9),
(658, b'0', 'San Rafael', 13),
(659, b'0', 'Anta', 4),
(660, b'0', 'Picún Leufú', 16),
(661, b'0', 'Zapala', 16),
(662, b'0', '25 de Mayo', 9),
(663, b'0', 'Telsen', 7),
(664, b'0', 'Pilcaniyeu', 9),
(665, b'0', 'Adolfo Alsina', 1),
(666, b'0', 'General Alvear', 13),
(667, b'0', 'La Caldera', 4),
(668, b'0', 'Sargento Cabral', 5),
(669, b'0', 'Pellegrini', 1),
(670, b'0', 'Aluminé', 16),
(671, b'0', 'Iruya', 4),
(672, b'0', 'Lácar', 16),
(673, b'0', 'Fray Mamerto Esquiú', 10),
(674, b'0', 'Valle Viejo', 10),
(675, b'0', 'San Cosme', 3),
(676, b'0', 'Sarmiento', 7),
(677, b'0', 'Comuna 1', 2),
(678, b'0', 'Comuna 4', 2),
(679, b'0', 'El Cuy', 9),
(680, b'0', 'Las Heras', 13),
(681, b'0', 'Tapenagá', 5),
(682, b'0', 'Lavalle', 13),
(683, b'0', 'Malargüe', 13),
(684, b'0', 'Presidente Roque Sáenz Peña', 12),
(685, b'0', 'Catán Lil', 16),
(686, b'0', 'Presidencia de la Plaza', 5),
(687, b'0', 'Comuna 5', 2),
(688, b'0', 'Esquina', 3),
(689, b'0', 'Ushuaia', 17),
(690, b'0', 'Antofagasta de la Sierra', 10),
(691, b'0', 'Ensenada', 1),
(692, b'0', 'Capital', 18),
(693, b'0', 'Belgrano', 19),
(694, b'0', 'Pergamino', 1),
(695, b'0', 'Puán', 1),
(696, b'0', 'General Villegas', 1),
(697, b'0', 'Comuna 12', 2),
(698, b'0', 'General Obligado', 19),
(699, b'0', 'Vera', 19),
(700, b'0', '9 de Julio', 19),
(701, b'0', 'Adolfo Alsina', 9),
(702, b'0', 'Quitilipi', 5),
(703, b'0', 'Güer Aike', 8),
(704, b'0', 'Capayán', 10),
(705, b'0', 'Burruyacú', 18),
(706, b'0', 'San Jerónimo', 19),
(707, b'0', 'Independencia', 5),
(708, b'0', 'Curuzú Cuatiá', 3),
(709, b'0', 'Luján de Cuyo', 13),
(710, b'0', 'Tinogasta', 10),
(711, b'0', 'Comuna 7', 2),
(712, b'0', 'Hucal', 20),
(713, b'0', 'Itatí', 3),
(714, b'0', 'Comuna 10', 2),
(715, b'0', 'Caleu Caleu', 20),
(716, b'0', 'Lihuel Calel', 20),
(717, b'0', 'Curacó', 20),
(718, b'0', 'Confluencia', 16),
(719, b'0', 'Picunches', 16),
(720, b'0', 'Añelo', 16),
(721, b'0', 'Loncopué', 16),
(722, b'0', 'Ñorquín', 16),
(723, b'0', 'Pehuenches', 16),
(724, b'0', 'Comuna 11', 2),
(725, b'0', 'Montecarlo', 21),
(726, b'0', 'Eldorado', 21),
(727, b'0', 'San Pedro', 21),
(728, b'0', 'Antártida Argentina', 17),
(729, b'0', 'Minas', 16),
(730, b'0', 'Chos Malal', 16),
(731, b'0', 'Cushamen', 7),
(732, b'0', 'Lago Buenos Aires', 8),
(733, b'0', 'Pichi Mahuida', 9),
(734, b'0', 'San Martín', 22),
(735, b'0', 'Yavi', 15),
(736, b'0', 'Santa Catalina', 15),
(737, b'0', 'San Pedro', 15),
(738, b'0', 'Valle Grande', 15),
(739, b'0', 'Patiño', 14),
(740, b'0', 'Bermejo', 14),
(741, b'0', 'Susques', 15),
(742, b'0', 'Matacos', 14),
(743, b'0', 'Los Andes', 4),
(744, b'0', 'Orán', 4),
(745, b'0', 'Tilcara', 15),
(746, b'0', 'Palpalá', 15),
(747, b'0', 'Loventué', 20),
(748, b'0', 'Río Senguer', 7),
(749, b'0', 'Bariloche', 9),
(750, b'0', 'Huiliches', 16),
(751, b'0', 'Limay Mahuida', 20),
(752, b'0', 'Puelén', 20),
(753, b'0', 'Chalileo', 20),
(754, b'0', 'Chical Co', 20),
(755, b'0', 'Quebrachos', 22),
(756, b'0', 'Monte Caseros', 3),
(757, b'0', 'Mayor Luis J. Fontana', 5),
(758, b'0', 'Fray Justo Santa María de Oro', 5),
(759, b'0', 'General Belgrano', 6),
(760, b'0', 'Las Colonias', 19),
(761, b'0', 'San Justo', 19),
(762, b'0', 'San Cristóbal', 19),
(763, b'0', 'San Javier', 19),
(764, b'0', 'Chapaleufú', 20),
(765, b'0', 'Realicó', 20),
(766, b'0', 'Maracó', 20),
(767, b'0', 'Trenel', 20),
(768, b'0', 'Copo', 22),
(769, b'0', 'Capital', 20),
(770, b'0', 'Santa Bárbara', 15),
(771, b'0', 'Almirante Brown', 5),
(772, b'0', 'Rosario de la Frontera', 4),
(773, b'0', 'Collón Curá', 16),
(774, b'0', 'Comuna 3', 2),
(775, b'0', 'San Fernando', 1),
(776, b'0', 'Tigre', 1),
(777, b'0', 'Santa María', 10),
(778, b'0', 'Santa Rosa', 10),
(779, b'0', 'La Paz', 10),
(780, b'0', 'Río Hondo', 22),
(781, b'0', 'Vinchina', 6),
(782, b'0', 'Capital', 6),
(783, b'0', 'Río Seco', 12),
(784, b'0', 'Avellaneda', 9),
(785, b'0', 'General Roca', 9),
(786, b'0', 'Belgrano', 11),
(787, b'0', 'Los Lagos', 16),
(788, b'0', 'Capital', 10),
(789, b'0', 'Ancasti', 10),
(790, b'0', 'Pomán', 10),
(791, b'0', 'Comuna 2', 2),
(792, b'0', '9 de Julio', 5),
(793, b'0', 'Pocho', 12),
(794, b'0', 'Ezeiza', 1),
(795, b'0', 'Andalgalá', 10),
(796, b'0', 'Ambato', 10),
(797, b'0', 'Comuna 8', 2),
(798, b'0', 'Guasayán', 22),
(799, b'0', 'Paclín', 10),
(800, b'0', 'El Alto', 10),
(801, b'0', 'Sobremonte', 12),
(802, b'0', 'Río Grande', 17),
(803, b'0', 'Comuna 13', 2),
(804, b'0', 'Banda', 22),
(805, b'0', 'Paso de Indios', 7),
(806, b'0', 'Capital', 12),
(807, b'0', 'Mártires', 7),
(808, b'0', 'Sarmiento', 22),
(809, b'0', 'Deseado', 8),
(810, b'0', 'Languiñeo', 7),
(811, b'0', 'Belgrano', 22),
(812, b'0', 'Aguirre', 22),
(813, b'0', 'Maipú', 5),
(814, b'0', 'San Carlos', 13),
(815, b'0', 'Tunuyán', 13),
(816, b'0', 'Robles', 22),
(817, b'0', 'Loreto', 22),
(818, b'0', 'Catriló', 20),
(819, b'0', 'Capital', 22),
(820, b'0', 'Comuna 14', 2),
(821, b'0', 'Colón', 23),
(822, b'0', 'Villaguay', 23),
(823, b'0', 'Castelli', 1),
(824, b'0', 'San Salvador', 23),
(825, b'0', 'Belén', 10),
(826, b'0', 'Almirante Brown', 1),
(827, b'0', 'Nogoyá', 23),
(828, b'0', 'Tala', 23),
(829, b'0', 'Gualeguay', 23),
(830, b'0', 'Federación', 23),
(831, b'0', 'La Paz', 23),
(832, b'0', 'Feliciano', 23),
(833, b'0', 'Presidente Perón', 1),
(834, b'0', 'Junín', 1),
(835, b'0', 'Brandsen', 1),
(836, b'0', 'Chivilcoy', 1),
(837, b'0', 'Alberti', 1),
(838, b'0', 'Bragado', 1),
(839, b'0', 'General Las Heras', 1),
(840, b'0', 'Carlos Casares', 1),
(841, b'0', 'Marcos Paz', 1),
(842, b'0', 'General Viamonte', 1),
(843, b'0', 'Carlos Tejedor', 1),
(844, b'0', '25 de Mayo', 1),
(845, b'0', '9 de Julio', 1),
(846, b'0', 'Pehuajó', 1),
(847, b'0', 'Tapalqué', 1),
(848, b'0', 'Trenque Lauquen', 1),
(849, b'0', 'General Belgrano', 1),
(850, b'0', 'Monte', 1),
(851, b'0', 'Roque Pérez', 1),
(852, b'0', 'Olavarría', 1),
(853, b'0', 'Merlo', 1),
(854, b'0', 'Cainguás', 21),
(855, b'0', 'Islas del Atlántico Sur', 17),
(856, b'0', 'Esteban Echeverría', 1),
(857, b'0', 'Arrecifes', 1),
(858, b'0', 'Capitán Sarmiento', 1),
(859, b'0', 'Dr. Manuel Belgrano', 15),
(860, b'0', 'Carmen de Areco', 1),
(861, b'0', 'Salto', 1),
(862, b'0', 'Exaltación de la Cruz', 1),
(863, b'0', 'San Miguel', 1),
(864, b'0', 'San Andrés de Giles', 1),
(865, b'0', 'Mercedes', 1),
(866, b'0', 'Pilar', 1),
(867, b'0', 'Luján', 1),
(868, b'0', 'Famaillá', 18),
(869, b'0', 'Hurlingham', 1),
(870, b'0', 'Morón', 1),
(871, b'0', 'Chacabuco', 1),
(872, b'0', 'Junín', 13),
(873, b'0', 'Malvinas Argentinas', 1),
(874, b'0', 'Tres Lomas', 1),
(875, b'0', 'Ayacucho', 1),
(876, b'0', 'Guaminí', 1),
(877, b'0', 'General San Martín', 1),
(878, b'0', 'Lincoln', 1),
(879, b'0', 'Laprida', 1),
(880, b'0', 'San Isidro', 1),
(881, b'0', 'Benito Juárez', 1),
(882, b'0', 'Colón', 1),
(883, b'0', 'Ituzaingó', 1),
(884, b'0', 'General Rodríguez', 1),
(885, b'0', 'Suipacha', 1),
(886, b'0', 'Tres de Febrero', 1),
(887, b'0', 'General Felipe Varela', 6),
(888, b'0', 'Florencio Varela', 1),
(889, b'0', 'Navarro', 1),
(890, b'0', 'Cañuelas', 1),
(891, b'0', 'Moreno', 22),
(892, b'0', 'Chacabuco', 5),
(893, b'0', 'San Vicente', 1),
(894, b'0', 'Lobos', 1),
(895, b'0', 'General Alvear', 1),
(896, b'0', 'Quilmes', 1),
(897, b'0', 'Pila', 1),
(898, b'0', 'General La Madrid', 1),
(899, b'0', 'Bolívar', 1),
(900, b'0', 'Castro Barros', 6),
(901, b'0', 'Balcarce', 1),
(902, b'0', 'Hipólito Yrigoyen', 1),
(903, b'0', 'Capital', 13),
(904, b'0', 'Dolores', 1),
(905, b'0', 'Azul', 1),
(906, b'0', 'Daireaux', 1),
(907, b'0', 'Godoy Cruz', 13),
(908, b'0', 'Cafayate', 4),
(909, b'0', 'Figueroa', 22),
(910, b'0', 'Saavedra', 1),
(911, b'0', 'Monte Hermoso', 1),
(912, b'0', 'Lobería', 1),
(913, b'0', 'Berisso', 1),
(914, b'0', 'Tordillo', 1),
(915, b'0', 'Zárate', 1),
(916, b'0', 'Ramallo', 1),
(917, b'0', 'San Nicolás', 1),
(918, b'0', 'Salavina', 22),
(919, b'0', 'Pellegrini', 22),
(920, b'0', 'Avellaneda', 22),
(921, b'0', '2 de Abril', 5),
(922, b'0', 'Guaymallén', 13),
(923, b'0', 'Juárez Celman', 12),
(924, b'0', 'Capital', 4),
(925, b'0', 'Silípica', 22),
(926, b'0', 'La Candelaria', 4),
(927, b'0', 'Rancul', 20),
(928, b'0', 'Maipú', 13),
(929, b'0', 'Guachipas', 4),
(930, b'0', 'Atreucó', 20),
(931, b'0', 'San Martín', 13),
(932, b'0', 'Guatraché', 20),
(933, b'0', 'Sanagasta', 6),
(934, b'0', 'Conhelo', 20),
(935, b'0', 'Libertador General San Martín', 21),
(936, b'0', 'Rosario Vera Peñaloza', 6),
(937, b'0', 'San Miguel', 3),
(938, b'0', 'General Juan Facundo Quiroga', 6),
(939, b'0', 'Ángel Vicente Peñaloza', 6),
(940, b'0', 'Empedrado', 3),
(941, b'0', 'Chilecito', 6),
(942, b'0', 'Toay', 20),
(943, b'0', 'Colón', 12),
(944, b'0', 'Ituzaingó', 3),
(945, b'0', 'Famatina', 6),
(946, b'0', 'General López', 19),
(947, b'0', 'Constitución', 19),
(948, b'0', 'Caseros', 19),
(949, b'0', 'Rosario', 19),
(950, b'0', 'San Lorenzo', 19),
(951, b'0', 'Iriondo', 19),
(952, b'0', 'Lanús', 1),
(953, b'0', 'General San Martín', 6),
(954, b'0', 'San Blas de Los Sauces', 6),
(955, b'0', 'San Antonio', 15),
(956, b'0', 'Rinconada', 15),
(957, b'0', 'Ramón Lista', 14),
(958, b'0', 'La Poma', 4),
(959, b'0', 'Biedma', 7),
(960, b'0', 'Capital', 3),
(961, b'0', 'San Luis del Palmar', 3),
(962, b'0', 'Formosa', 14),
(963, b'0', 'Pilcomayo', 14),
(964, b'0', 'Tehuelches', 7),
(965, b'0', 'Escalante', 7),
(966, b'0', 'Ischilín', 12),
(967, b'0', 'Totoral', 12),
(968, b'0', 'General San Martín', 12),
(969, b'0', 'San Javier', 12),
(970, b'0', 'Río Primero', 12),
(971, b'0', 'Marcos Juárez', 12),
(972, b'0', 'General Donovan', 5),
(973, b'0', 'Leandro N. Alem', 1),
(974, b'0', 'Libertador General San Martín', 5),
(975, b'0', 'Gastre', 7),
(976, b'0', 'General Arenales', 1),
(977, b'0', 'Bermejo', 5),
(978, b'0', 'Calamuchita', 12),
(979, b'0', 'Cruz Alta', 18),
(980, b'0', 'Lules', 18),
(981, b'0', 'Yerba Buena', 18),
(982, b'0', 'Tafí Viejo', 18),
(983, b'0', 'Libertador General San Martín', 11),
(984, b'0', 'Coronel Pringles', 11),
(985, b'0', 'Chacabuco', 11),
(986, b'0', 'Rivadavia', 1),
(987, b'0', 'Patagones', 1),
(988, b'0', 'Juan Martín de Pueyrredón', 11),
(989, b'0', 'General Pedernera', 11),
(990, b'0', 'Trancas', 18),
(991, b'0', 'Tafí del Valle', 18),
(992, b'0', 'Comuna 9', 2),
(993, b'0', 'Junín', 11),
(994, b'0', 'Mitre', 22),
(995, b'0', 'Atamisqui', 22),
(996, b'0', 'Berón de Astrada', 3),
(997, b'0', 'Tolhuin', 17),
(998, b'0', 'Capital', 21),
(999, b'0', 'Candelaria', 21),
(1000, b'0', 'Jiménez', 22),
(1001, b'0', 'Coronel de Marina Leonardo Rosales', 1),
(1002, b'0', 'Baradero', 1),
(1003, b'0', 'San Pedro', 1),
(1004, b'0', 'Santa Victoria', 4),
(1005, b'0', 'General José de San Martín', 4),
(1006, b'0', 'Rivadavia', 4),
(1007, b'0', 'Rosario de Lerma', 4),
(1008, b'0', 'Ledesma', 15),
(1009, b'0', 'Humahuaca', 15),
(1010, b'0', 'Cochinoca', 15),
(1011, b'0', 'Tumbaya', 15),
(1012, b'0', 'Florentino Ameghino', 1),
(1013, b'0', 'Florentino Ameghino', 7),
(1014, b'0', 'La Cocha', 18),
(1015, b'0', 'Graneros', 18),
(1016, b'0', 'Juan Bautista Alberdi', 18),
(1017, b'0', 'Río Chico', 18),
(1018, b'0', 'Simoca', 18),
(1019, b'0', 'Chicligasta', 18),
(1020, b'0', 'Monteros', 18),
(1021, b'0', 'Leales', 18),
(1022, b'0', 'San Martín', 19),
(1023, b'0', 'La Capital', 19),
(1024, b'0', 'General Manuel Belgrano', 21),
(1025, b'0', 'Guaraní', 21),
(1026, b'0', 'Iguazú', 21),
(1027, b'0', '25 de Mayo', 21),
(1028, b'0', 'Oberá', 21),
(1029, b'0', 'Castellanos', 19),
(1030, b'0', 'Garay', 19),
(1031, b'0', 'Quemú Quemú', 20),
(1032, b'0', 'San Ignacio', 21),
(1033, b'0', 'Utracán', 20),
(1034, b'0', 'San Martín', 3),
(1035, b'0', 'Paso de los Libres', 3),
(1036, b'0', 'Goya', 3),
(1037, b'0', 'Lavalle', 3),
(1038, b'0', 'San Roque', 3),
(1039, b'0', 'General Alvear', 3),
(1040, b'0', 'Concepción', 3),
(1041, b'0', 'Bella Vista', 3),
(1042, b'0', 'Santo Tomé', 3),
(1043, b'0', 'Saladas', 3),
(1044, b'0', 'General Paz', 3),
(1045, b'0', 'Leandro N. Alem', 21),
(1046, b'0', 'San Javier', 21),
(1047, b'0', 'Mburucuyá', 3),
(1048, b'0', 'Concepción', 21),
(1049, b'0', 'Apóstoles', 21),
(1050, b'0', '1° de Mayo', 5),
(1051, b'0', 'San Fernando', 5),
(1052, b'0', 'San Lorenzo', 5),
(1053, b'0', 'Lomas de Zamora', 1),
(1054, b'0', 'Avellaneda', 1),
(1055, b'0', '25 de Mayo', 5),
(1056, b'0', 'General Belgrano', 5),
(1057, b'0', 'Libertad', 5),
(1058, b'0', 'Comandante Fernández', 5),
(1059, b'0', 'Comuna 15', 2),
(1060, b'0', 'Chimbas', 24),
(1061, b'0', 'Capital', 24),
(1062, b'0', 'Rivadavia', 24),
(1063, b'0', '9 de Julio', 24),
(1064, b'0', 'Albardón', 24),
(1065, b'0', 'Angaco', 24),
(1066, b'0', 'Santa Lucía', 24),
(1067, b'0', 'Rawson', 24),
(1068, b'0', '25 de Mayo', 24),
(1069, b'0', 'San Martín', 24),
(1070, b'0', 'Pocito', 24),
(1071, b'0', 'Zonda', 24),
(1072, b'0', 'Ullum', 24),
(1073, b'0', 'Sarmiento', 24),
(1074, b'0', 'Calingasta', 24),
(1075, b'0', 'Iglesia', 24),
(1076, b'0', 'Jáchal', 24),
(1077, b'0', 'Valle Fértil', 24),
(1078, b'0', 'Caucete', 24),
(1079, b'0', 'La Plata', 1),
(1080, b'0', 'Mercedes', 3),
(1102, b'0', 'Adolfo Gonzales Chaves', 1),
(1103, b'0', 'Concordia', 23),
(1104, b'0', 'Federal', 23),
(1105, b'0', 'Gualeguaychú', 23),
(1106, b'0', 'Islas del Ibicuy', 23),
(1107, b'0', 'Victoria', 23),
(1108, b'0', 'Diamante', 23),
(1109, b'0', 'Uruguay', 23),
(1110, b'0', 'Paraná', 23),
(1111, b'0', 'Saladillo', 1),
(1112, b'0', 'Las Flores', 1),
(1113, b'0', 'Rojas', 1),
(1114, b'0', 'Escobar', 1),
(1115, b'0', 'José C. Paz', 1),
(1116, b'0', 'Bahía Blanca', 1),
(1117, b'0', 'San Antonio de Areco', 1),
(1118, b'0', 'Maipú', 1),
(1119, b'0', 'General Alvarado', 1),
(1120, b'0', 'General Pueyrredón', 1),
(1121, b'0', 'Mar Chiquita', 1),
(1122, b'0', 'Villa Gesell', 1),
(1123, b'0', 'Pinamar', 1),
(1124, b'0', 'General Lavalle', 1),
(1125, b'0', 'La Costa', 1),
(1126, b'0', 'Magdalena', 1),
(1127, b'0', 'Sauce', 3),
(1128, b'0', 'Vicente López', 1),
(1129, b'0', 'La Viña', 4),
(1130, b'0', 'Rauch', 1),
(1131, b'0', 'Metán', 4),
(1132, b'0', 'Molinos', 4),
(1133, b'0', 'O\'Higgins', 5),
(1134, b'0', 'Moreno', 1),
(1135, b'0', 'La Matanza', 1),
(1136, b'0', 'Tandil', 1),
(1137, b'0', 'Coronel Suárez', 1),
(1138, b'0', 'Chamical', 6),
(1139, b'0', 'Futaleufú', 7),
(1140, b'0', 'Río Chico', 8),
(1141, b'0', 'San Antonio', 9),
(1142, b'0', 'Alberdi', 22),
(1143, b'0', 'Juan Felipe Ibarra', 22),
(1144, b'0', 'General Taboada', 22),
(1145, b'0', 'Salliqueló', 1),
(1146, b'0', 'Berazategui', 1),
(1147, b'0', 'General Güemes', 4),
(1148, b'0', 'San Carlos', 4),
(1149, b'0', 'General Paz', 1),
(1150, b'0', 'General Guido', 1),
(1151, b'0', 'General Juan Madariaga', 1),
(1152, b'0', 'Lago Argentino', 8),
(1153, b'0', 'Rivadavia', 22),
(1154, b'0', 'Ojo de Agua', 22),
(1155, b'0', 'Choya', 22),
(1156, b'0', 'Gobernador Dupuy', 11),
(1157, b'0', 'Cachi', 4),
(1158, b'0', 'Chicoana', 4),
(1159, b'0', 'Gaiman', 7),
(1160, b'0', 'Rawson', 7),
(1161, b'0', 'General Lamadrid', 6),
(1162, b'0', 'Ayacucho', 11),
(1163, b'0', '12 de Octubre', 5),
(1164, b'0', 'Tulumba', 12),
(1165, b'0', 'Cruz del Eje', 12),
(1166, b'0', 'Punilla', 12),
(1167, b'0', 'Comuna 6', 2),
(1168, b'0', 'Santa Rosa', 13),
(1169, b'0', 'General Güemes', 5),
(1170, b'0', 'General Ortiz de Ocampo', 6),
(1171, b'0', 'General Roca', 12),
(1172, b'0', 'Pilagás', 14),
(1173, b'0', 'Laishi', 14),
(1174, b'0', 'Rivadavia', 13),
(1175, b'0', 'Tornquist', 1),
(1176, b'0', 'La Paz', 13),
(1177, b'0', 'Coronel Pringles', 1),
(1178, b'0', 'Conesa', 9),
(1179, b'0', 'Villarino', 1),
(1180, b'0', 'Pirané', 14),
(1181, b'0', 'General Pinto', 1),
(1182, b'0', 'San Cayetano', 1),
(1183, b'0', 'Tres Arroyos', 1),
(1184, b'0', 'Coronel Dorrego', 1),
(1185, b'0', 'Necochea', 1),
(1186, b'0', 'Independencia', 6),
(1187, b'0', 'Chascomús', 1),
(1188, b'0', 'Punta Indio', 1),
(1189, b'0', 'El Carmen', 15),
(1190, b'0', 'Santa María', 12),
(1191, b'0', 'Valcheta', 9),
(1192, b'0', 'Arauco', 6),
(1193, b'0', 'Lezama', 1),
(1194, b'0', 'Campana', 1),
(1195, b'0', 'Magallanes', 8),
(1196, b'0', 'Corpen Aike', 8),
(1197, b'0', 'Minas', 12),
(1198, b'0', 'San Alberto', 12),
(1199, b'0', 'Río Segundo', 12),
(1200, b'0', 'San Justo', 12),
(1201, b'0', 'Unión', 12),
(1202, b'0', 'Tercero Arriba', 12),
(1203, b'0', 'Cerrillos', 4),
(1204, b'0', 'Río Cuarto', 12),
(1205, b'0', 'Tupungato', 13),
(1206, b'0', '9 de Julio', 9),
(1207, b'0', 'Ñorquinco', 9),
(1208, b'0', 'San Rafael', 13),
(1209, b'0', 'Anta', 4),
(1210, b'0', 'Picún Leufú', 16),
(1211, b'0', 'Zapala', 16),
(1212, b'0', '25 de Mayo', 9),
(1213, b'0', 'Telsen', 7),
(1214, b'0', 'Pilcaniyeu', 9),
(1215, b'0', 'Adolfo Alsina', 1),
(1216, b'0', 'General Alvear', 13),
(1217, b'0', 'La Caldera', 4),
(1218, b'0', 'Sargento Cabral', 5),
(1219, b'0', 'Pellegrini', 1),
(1220, b'0', 'Aluminé', 16),
(1221, b'0', 'Iruya', 4),
(1222, b'0', 'Lácar', 16),
(1223, b'0', 'Fray Mamerto Esquiú', 10),
(1224, b'0', 'Valle Viejo', 10),
(1225, b'0', 'San Cosme', 3),
(1226, b'0', 'Sarmiento', 7),
(1227, b'0', 'Comuna 1', 2),
(1228, b'0', 'Comuna 4', 2),
(1229, b'0', 'El Cuy', 9),
(1230, b'0', 'Las Heras', 13),
(1231, b'0', 'Tapenagá', 5),
(1232, b'0', 'Lavalle', 13),
(1233, b'0', 'Malargüe', 13),
(1234, b'0', 'Presidente Roque Sáenz Peña', 12),
(1235, b'0', 'Catán Lil', 16),
(1236, b'0', 'Presidencia de la Plaza', 5),
(1237, b'0', 'Comuna 5', 2),
(1238, b'0', 'Esquina', 3),
(1239, b'0', 'Ushuaia', 17),
(1240, b'0', 'Antofagasta de la Sierra', 10),
(1241, b'0', 'Ensenada', 1),
(1242, b'0', 'Capital', 18),
(1243, b'0', 'Belgrano', 19),
(1244, b'0', 'Pergamino', 1),
(1245, b'0', 'Puán', 1),
(1246, b'0', 'General Villegas', 1),
(1247, b'0', 'Comuna 12', 2),
(1248, b'0', 'General Obligado', 19),
(1249, b'0', 'Vera', 19),
(1250, b'0', '9 de Julio', 19),
(1251, b'0', 'Adolfo Alsina', 9),
(1252, b'0', 'Quitilipi', 5),
(1253, b'0', 'Güer Aike', 8),
(1254, b'0', 'Capayán', 10),
(1255, b'0', 'Burruyacú', 18),
(1256, b'0', 'San Jerónimo', 19),
(1257, b'0', 'Independencia', 5),
(1258, b'0', 'Curuzú Cuatiá', 3),
(1259, b'0', 'Luján de Cuyo', 13),
(1260, b'0', 'Tinogasta', 10),
(1261, b'0', 'Comuna 7', 2),
(1262, b'0', 'Hucal', 20),
(1263, b'0', 'Itatí', 3),
(1264, b'0', 'Comuna 10', 2),
(1265, b'0', 'Caleu Caleu', 20),
(1266, b'0', 'Lihuel Calel', 20),
(1267, b'0', 'Curacó', 20),
(1268, b'0', 'Confluencia', 16),
(1269, b'0', 'Picunches', 16),
(1270, b'0', 'Añelo', 16),
(1271, b'0', 'Loncopué', 16),
(1272, b'0', 'Ñorquín', 16),
(1273, b'0', 'Pehuenches', 16),
(1274, b'0', 'Comuna 11', 2),
(1275, b'0', 'Montecarlo', 21),
(1276, b'0', 'Eldorado', 21),
(1277, b'0', 'San Pedro', 21),
(1278, b'0', 'Antártida Argentina', 17),
(1279, b'0', 'Minas', 16),
(1280, b'0', 'Chos Malal', 16),
(1281, b'0', 'Cushamen', 7),
(1282, b'0', 'Lago Buenos Aires', 8),
(1283, b'0', 'Pichi Mahuida', 9),
(1284, b'0', 'San Martín', 22),
(1285, b'0', 'Yavi', 15),
(1286, b'0', 'Santa Catalina', 15),
(1287, b'0', 'San Pedro', 15),
(1288, b'0', 'Valle Grande', 15),
(1289, b'0', 'Patiño', 14),
(1290, b'0', 'Bermejo', 14),
(1291, b'0', 'Susques', 15),
(1292, b'0', 'Matacos', 14),
(1293, b'0', 'Los Andes', 4),
(1294, b'0', 'Orán', 4),
(1295, b'0', 'Tilcara', 15),
(1296, b'0', 'Palpalá', 15),
(1297, b'0', 'Loventué', 20),
(1298, b'0', 'Río Senguer', 7),
(1299, b'0', 'Bariloche', 9),
(1300, b'0', 'Huiliches', 16),
(1301, b'0', 'Limay Mahuida', 20),
(1302, b'0', 'Puelén', 20),
(1303, b'0', 'Chalileo', 20),
(1304, b'0', 'Chical Co', 20),
(1305, b'0', 'Quebrachos', 22),
(1306, b'0', 'Monte Caseros', 3),
(1307, b'0', 'Mayor Luis J. Fontana', 5),
(1308, b'0', 'Fray Justo Santa María de Oro', 5),
(1309, b'0', 'General Belgrano', 6),
(1310, b'0', 'Las Colonias', 19),
(1311, b'0', 'San Justo', 19),
(1312, b'0', 'San Cristóbal', 19),
(1313, b'0', 'San Javier', 19),
(1314, b'0', 'Chapaleufú', 20),
(1315, b'0', 'Realicó', 20),
(1316, b'0', 'Maracó', 20),
(1317, b'0', 'Trenel', 20),
(1318, b'0', 'Copo', 22),
(1319, b'0', 'Capital', 20),
(1320, b'0', 'Santa Bárbara', 15),
(1321, b'0', 'Almirante Brown', 5),
(1322, b'0', 'Rosario de la Frontera', 4),
(1323, b'0', 'Collón Curá', 16),
(1324, b'0', 'Comuna 3', 2),
(1325, b'0', 'San Fernando', 1),
(1326, b'0', 'Tigre', 1),
(1327, b'0', 'Santa María', 10),
(1328, b'0', 'Santa Rosa', 10),
(1329, b'0', 'La Paz', 10),
(1330, b'0', 'Río Hondo', 22),
(1331, b'0', 'Vinchina', 6),
(1332, b'0', 'Capital', 6),
(1333, b'0', 'Río Seco', 12),
(1334, b'0', 'Avellaneda', 9),
(1335, b'0', 'General Roca', 9),
(1336, b'0', 'Belgrano', 11),
(1337, b'0', 'Los Lagos', 16),
(1338, b'0', 'Capital', 10),
(1339, b'0', 'Ancasti', 10),
(1340, b'0', 'Pomán', 10),
(1341, b'0', 'Comuna 2', 2),
(1342, b'0', '9 de Julio', 5),
(1343, b'0', 'Pocho', 12),
(1344, b'0', 'Ezeiza', 1),
(1345, b'0', 'Andalgalá', 10),
(1346, b'0', 'Ambato', 10),
(1347, b'0', 'Comuna 8', 2),
(1348, b'0', 'Guasayán', 22),
(1349, b'0', 'Paclín', 10),
(1350, b'0', 'El Alto', 10),
(1351, b'0', 'Sobremonte', 12),
(1352, b'0', 'Río Grande', 17),
(1353, b'0', 'Comuna 13', 2),
(1354, b'0', 'Banda', 22),
(1355, b'0', 'Paso de Indios', 7),
(1356, b'0', 'Capital', 12),
(1357, b'0', 'Mártires', 7),
(1358, b'0', 'Sarmiento', 22),
(1359, b'0', 'Deseado', 8),
(1360, b'0', 'Languiñeo', 7),
(1361, b'0', 'Belgrano', 22),
(1362, b'0', 'Aguirre', 22),
(1363, b'0', 'Maipú', 5),
(1364, b'0', 'San Carlos', 13),
(1365, b'0', 'Tunuyán', 13),
(1366, b'0', 'Robles', 22),
(1367, b'0', 'Loreto', 22),
(1368, b'0', 'Catriló', 20),
(1369, b'0', 'Capital', 22),
(1370, b'0', 'Comuna 14', 2),
(1371, b'0', 'Colón', 23),
(1372, b'0', 'Villaguay', 23),
(1373, b'0', 'Castelli', 1),
(1374, b'0', 'San Salvador', 23),
(1375, b'0', 'Belén', 10),
(1376, b'0', 'Almirante Brown', 1),
(1377, b'0', 'Nogoyá', 23),
(1378, b'0', 'Tala', 23),
(1379, b'0', 'Gualeguay', 23),
(1380, b'0', 'Federación', 23),
(1381, b'0', 'La Paz', 23),
(1382, b'0', 'Feliciano', 23),
(1383, b'0', 'Presidente Perón', 1),
(1384, b'0', 'Junín', 1),
(1385, b'0', 'Brandsen', 1),
(1386, b'0', 'Chivilcoy', 1),
(1387, b'0', 'Alberti', 1),
(1388, b'0', 'Bragado', 1),
(1389, b'0', 'General Las Heras', 1),
(1390, b'0', 'Carlos Casares', 1),
(1391, b'0', 'Marcos Paz', 1),
(1392, b'0', 'General Viamonte', 1),
(1393, b'0', 'Carlos Tejedor', 1),
(1394, b'0', '25 de Mayo', 1),
(1395, b'0', '9 de Julio', 1),
(1396, b'0', 'Pehuajó', 1),
(1397, b'0', 'Tapalqué', 1),
(1398, b'0', 'Trenque Lauquen', 1),
(1399, b'0', 'General Belgrano', 1),
(1400, b'0', 'Monte', 1),
(1401, b'0', 'Roque Pérez', 1),
(1402, b'0', 'Olavarría', 1),
(1403, b'0', 'Merlo', 1),
(1404, b'0', 'Cainguás', 21),
(1405, b'0', 'Islas del Atlántico Sur', 17),
(1406, b'0', 'Esteban Echeverría', 1),
(1407, b'0', 'Arrecifes', 1),
(1408, b'0', 'Capitán Sarmiento', 1),
(1409, b'0', 'Dr. Manuel Belgrano', 15),
(1410, b'0', 'Carmen de Areco', 1),
(1411, b'0', 'Salto', 1),
(1412, b'0', 'Exaltación de la Cruz', 1),
(1413, b'0', 'San Miguel', 1),
(1414, b'0', 'San Andrés de Giles', 1),
(1415, b'0', 'Mercedes', 1),
(1416, b'0', 'Pilar', 1),
(1417, b'0', 'Luján', 1),
(1418, b'0', 'Famaillá', 18),
(1419, b'0', 'Hurlingham', 1),
(1420, b'0', 'Morón', 1),
(1421, b'0', 'Chacabuco', 1),
(1422, b'0', 'Junín', 13),
(1423, b'0', 'Malvinas Argentinas', 1),
(1424, b'0', 'Tres Lomas', 1),
(1425, b'0', 'Ayacucho', 1),
(1426, b'0', 'Guaminí', 1),
(1427, b'0', 'General San Martín', 1),
(1428, b'0', 'Lincoln', 1),
(1429, b'0', 'Laprida', 1),
(1430, b'0', 'San Isidro', 1),
(1431, b'0', 'Benito Juárez', 1),
(1432, b'0', 'Colón', 1),
(1433, b'0', 'Ituzaingó', 1),
(1434, b'0', 'General Rodríguez', 1),
(1435, b'0', 'Suipacha', 1),
(1436, b'0', 'Tres de Febrero', 1),
(1437, b'0', 'General Felipe Varela', 6),
(1438, b'0', 'Florencio Varela', 1),
(1439, b'0', 'Navarro', 1),
(1440, b'0', 'Cañuelas', 1),
(1441, b'0', 'Moreno', 22),
(1442, b'0', 'Chacabuco', 5),
(1443, b'0', 'San Vicente', 1),
(1444, b'0', 'Lobos', 1),
(1445, b'0', 'General Alvear', 1),
(1446, b'0', 'Quilmes', 1),
(1447, b'0', 'Pila', 1),
(1448, b'0', 'General La Madrid', 1),
(1449, b'0', 'Bolívar', 1),
(1450, b'0', 'Castro Barros', 6),
(1451, b'0', 'Balcarce', 1),
(1452, b'0', 'Hipólito Yrigoyen', 1),
(1453, b'0', 'Capital', 13),
(1454, b'0', 'Dolores', 1),
(1455, b'0', 'Azul', 1),
(1456, b'0', 'Daireaux', 1),
(1457, b'0', 'Godoy Cruz', 13),
(1458, b'0', 'Cafayate', 4),
(1459, b'0', 'Figueroa', 22),
(1460, b'0', 'Saavedra', 1),
(1461, b'0', 'Monte Hermoso', 1),
(1462, b'0', 'Lobería', 1),
(1463, b'0', 'Berisso', 1),
(1464, b'0', 'Tordillo', 1),
(1465, b'0', 'Zárate', 1),
(1466, b'0', 'Ramallo', 1),
(1467, b'0', 'San Nicolás', 1),
(1468, b'0', 'Salavina', 22),
(1469, b'0', 'Pellegrini', 22),
(1470, b'0', 'Avellaneda', 22),
(1471, b'0', '2 de Abril', 5),
(1472, b'0', 'Guaymallén', 13),
(1473, b'0', 'Juárez Celman', 12),
(1474, b'0', 'Capital', 4),
(1475, b'0', 'Silípica', 22),
(1476, b'0', 'La Candelaria', 4),
(1477, b'0', 'Rancul', 20),
(1478, b'0', 'Maipú', 13),
(1479, b'0', 'Guachipas', 4),
(1480, b'0', 'Atreucó', 20),
(1481, b'0', 'San Martín', 13),
(1482, b'0', 'Guatraché', 20),
(1483, b'0', 'Sanagasta', 6),
(1484, b'0', 'Conhelo', 20),
(1485, b'0', 'Libertador General San Martín', 21),
(1486, b'0', 'Rosario Vera Peñaloza', 6),
(1487, b'0', 'San Miguel', 3),
(1488, b'0', 'General Juan Facundo Quiroga', 6),
(1489, b'0', 'Ángel Vicente Peñaloza', 6),
(1490, b'0', 'Empedrado', 3),
(1491, b'0', 'Chilecito', 6),
(1492, b'0', 'Toay', 20),
(1493, b'0', 'Colón', 12),
(1494, b'0', 'Ituzaingó', 3),
(1495, b'0', 'Famatina', 6),
(1496, b'0', 'General López', 19),
(1497, b'0', 'Constitución', 19),
(1498, b'0', 'Caseros', 19),
(1499, b'0', 'Rosario', 19),
(1500, b'0', 'San Lorenzo', 19),
(1501, b'0', 'Iriondo', 19),
(1502, b'0', 'Lanús', 1),
(1503, b'0', 'General San Martín', 6),
(1504, b'0', 'San Blas de Los Sauces', 6),
(1505, b'0', 'San Antonio', 15),
(1506, b'0', 'Rinconada', 15),
(1507, b'0', 'Ramón Lista', 14),
(1508, b'0', 'La Poma', 4),
(1509, b'0', 'Biedma', 7),
(1510, b'0', 'Capital', 3),
(1511, b'0', 'San Luis del Palmar', 3),
(1512, b'0', 'Formosa', 14),
(1513, b'0', 'Pilcomayo', 14),
(1514, b'0', 'Tehuelches', 7),
(1515, b'0', 'Escalante', 7),
(1516, b'0', 'Ischilín', 12),
(1517, b'0', 'Totoral', 12),
(1518, b'0', 'General San Martín', 12),
(1519, b'0', 'San Javier', 12),
(1520, b'0', 'Río Primero', 12),
(1521, b'0', 'Marcos Juárez', 12),
(1522, b'0', 'General Donovan', 5),
(1523, b'0', 'Leandro N. Alem', 1),
(1524, b'0', 'Libertador General San Martín', 5),
(1525, b'0', 'Gastre', 7),
(1526, b'0', 'General Arenales', 1),
(1527, b'0', 'Bermejo', 5),
(1528, b'0', 'Calamuchita', 12),
(1529, b'0', 'Cruz Alta', 18),
(1530, b'0', 'Lules', 18),
(1531, b'0', 'Yerba Buena', 18),
(1532, b'0', 'Tafí Viejo', 18),
(1533, b'0', 'Libertador General San Martín', 11),
(1534, b'0', 'Coronel Pringles', 11),
(1535, b'0', 'Chacabuco', 11),
(1536, b'0', 'Rivadavia', 1),
(1537, b'0', 'Patagones', 1),
(1538, b'0', 'Juan Martín de Pueyrredón', 11),
(1539, b'0', 'General Pedernera', 11),
(1540, b'0', 'Trancas', 18),
(1541, b'0', 'Tafí del Valle', 18),
(1542, b'0', 'Comuna 9', 2),
(1543, b'0', 'Junín', 11),
(1544, b'0', 'Mitre', 22),
(1545, b'0', 'Atamisqui', 22),
(1546, b'0', 'Berón de Astrada', 3),
(1547, b'0', 'Tolhuin', 17),
(1548, b'0', 'Capital', 21),
(1549, b'0', 'Candelaria', 21),
(1550, b'0', 'Jiménez', 22),
(1551, b'0', 'Coronel de Marina Leonardo Rosales', 1),
(1552, b'0', 'Baradero', 1),
(1553, b'0', 'San Pedro', 1),
(1554, b'0', 'Santa Victoria', 4),
(1555, b'0', 'General José de San Martín', 4),
(1556, b'0', 'Rivadavia', 4),
(1557, b'0', 'Rosario de Lerma', 4),
(1558, b'0', 'Ledesma', 15),
(1559, b'0', 'Humahuaca', 15),
(1560, b'0', 'Cochinoca', 15),
(1561, b'0', 'Tumbaya', 15),
(1562, b'0', 'Florentino Ameghino', 1),
(1563, b'0', 'Florentino Ameghino', 7),
(1564, b'0', 'La Cocha', 18),
(1565, b'0', 'Graneros', 18),
(1566, b'0', 'Juan Bautista Alberdi', 18),
(1567, b'0', 'Río Chico', 18),
(1568, b'0', 'Simoca', 18),
(1569, b'0', 'Chicligasta', 18),
(1570, b'0', 'Monteros', 18),
(1571, b'0', 'Leales', 18),
(1572, b'0', 'San Martín', 19),
(1573, b'0', 'La Capital', 19),
(1574, b'0', 'General Manuel Belgrano', 21),
(1575, b'0', 'Guaraní', 21),
(1576, b'0', 'Iguazú', 21),
(1577, b'0', '25 de Mayo', 21),
(1578, b'0', 'Oberá', 21),
(1579, b'0', 'Castellanos', 19),
(1580, b'0', 'Garay', 19),
(1581, b'0', 'Quemú Quemú', 20),
(1582, b'0', 'San Ignacio', 21),
(1583, b'0', 'Utracán', 20),
(1584, b'0', 'San Martín', 3),
(1585, b'0', 'Paso de los Libres', 3),
(1586, b'0', 'Goya', 3),
(1587, b'0', 'Lavalle', 3),
(1588, b'0', 'San Roque', 3),
(1589, b'0', 'General Alvear', 3),
(1590, b'0', 'Concepción', 3),
(1591, b'0', 'Bella Vista', 3),
(1592, b'0', 'Santo Tomé', 3),
(1593, b'0', 'Saladas', 3),
(1594, b'0', 'General Paz', 3),
(1595, b'0', 'Leandro N. Alem', 21),
(1596, b'0', 'San Javier', 21),
(1597, b'0', 'Mburucuyá', 3),
(1598, b'0', 'Concepción', 21),
(1599, b'0', 'Apóstoles', 21),
(1600, b'0', '1° de Mayo', 5),
(1601, b'0', 'San Fernando', 5),
(1602, b'0', 'San Lorenzo', 5),
(1603, b'0', 'Lomas de Zamora', 1),
(1604, b'0', 'Avellaneda', 1),
(1605, b'0', '25 de Mayo', 5),
(1606, b'0', 'General Belgrano', 5),
(1607, b'0', 'Libertad', 5),
(1608, b'0', 'Comandante Fernández', 5),
(1609, b'0', 'Comuna 15', 2),
(1610, b'0', 'Chimbas', 24),
(1611, b'0', 'Capital', 24),
(1612, b'0', 'Rivadavia', 24),
(1613, b'0', '9 de Julio', 24),
(1614, b'0', 'Albardón', 24),
(1615, b'0', 'Angaco', 24),
(1616, b'0', 'Santa Lucía', 24),
(1617, b'0', 'Rawson', 24),
(1618, b'0', '25 de Mayo', 24),
(1619, b'0', 'San Martín', 24),
(1620, b'0', 'Pocito', 24),
(1621, b'0', 'Zonda', 24),
(1622, b'0', 'Ullum', 24),
(1623, b'0', 'Sarmiento', 24),
(1624, b'0', 'Calingasta', 24),
(1625, b'0', 'Iglesia', 24),
(1626, b'0', 'Jáchal', 24),
(1627, b'0', 'Valle Fértil', 24),
(1628, b'0', 'Caucete', 24),
(1629, b'0', 'La Plata', 1),
(1630, b'0', 'Mercedes', 3),
(1652, b'0', 'Adolfo Gonzales Chaves', 1),
(1653, b'0', 'Concordia', 23),
(1654, b'0', 'Federal', 23),
(1655, b'0', 'Gualeguaychú', 23),
(1656, b'0', 'Islas del Ibicuy', 23),
(1657, b'0', 'Victoria', 23),
(1658, b'0', 'Diamante', 23),
(1659, b'0', 'Uruguay', 23),
(1660, b'0', 'Paraná', 23),
(1661, b'0', 'Saladillo', 1),
(1662, b'0', 'Las Flores', 1),
(1663, b'0', 'Rojas', 1),
(1664, b'0', 'Escobar', 1),
(1665, b'0', 'José C. Paz', 1),
(1666, b'0', 'Bahía Blanca', 1),
(1667, b'0', 'San Antonio de Areco', 1),
(1668, b'0', 'Maipú', 1),
(1669, b'0', 'General Alvarado', 1),
(1670, b'0', 'General Pueyrredón', 1),
(1671, b'0', 'Mar Chiquita', 1),
(1672, b'0', 'Villa Gesell', 1),
(1673, b'0', 'Pinamar', 1),
(1674, b'0', 'General Lavalle', 1),
(1675, b'0', 'La Costa', 1),
(1676, b'0', 'Magdalena', 1),
(1677, b'0', 'Sauce', 3),
(1678, b'0', 'Vicente López', 1),
(1679, b'0', 'La Viña', 4),
(1680, b'0', 'Rauch', 1),
(1681, b'0', 'Metán', 4),
(1682, b'0', 'Molinos', 4),
(1683, b'0', 'O\'Higgins', 5),
(1684, b'0', 'Moreno', 1),
(1685, b'0', 'La Matanza', 1),
(1686, b'0', 'Tandil', 1),
(1687, b'0', 'Coronel Suárez', 1),
(1688, b'0', 'Chamical', 6),
(1689, b'0', 'Futaleufú', 7),
(1690, b'0', 'Río Chico', 8),
(1691, b'0', 'San Antonio', 9),
(1692, b'0', 'Alberdi', 22),
(1693, b'0', 'Juan Felipe Ibarra', 22),
(1694, b'0', 'General Taboada', 22),
(1695, b'0', 'Salliqueló', 1),
(1696, b'0', 'Berazategui', 1),
(1697, b'0', 'General Güemes', 4),
(1698, b'0', 'San Carlos', 4),
(1699, b'0', 'General Paz', 1),
(1700, b'0', 'General Guido', 1),
(1701, b'0', 'General Juan Madariaga', 1),
(1702, b'0', 'Lago Argentino', 8),
(1703, b'0', 'Rivadavia', 22),
(1704, b'0', 'Ojo de Agua', 22),
(1705, b'0', 'Choya', 22),
(1706, b'0', 'Gobernador Dupuy', 11),
(1707, b'0', 'Cachi', 4),
(1708, b'0', 'Chicoana', 4),
(1709, b'0', 'Gaiman', 7),
(1710, b'0', 'Rawson', 7),
(1711, b'0', 'General Lamadrid', 6),
(1712, b'0', 'Ayacucho', 11),
(1713, b'0', '12 de Octubre', 5),
(1714, b'0', 'Tulumba', 12),
(1715, b'0', 'Cruz del Eje', 12),
(1716, b'0', 'Punilla', 12),
(1717, b'0', 'Comuna 6', 2),
(1718, b'0', 'Santa Rosa', 13),
(1719, b'0', 'General Güemes', 5),
(1720, b'0', 'General Ortiz de Ocampo', 6),
(1721, b'0', 'General Roca', 12),
(1722, b'0', 'Pilagás', 14),
(1723, b'0', 'Laishi', 14),
(1724, b'0', 'Rivadavia', 13),
(1725, b'0', 'Tornquist', 1),
(1726, b'0', 'La Paz', 13),
(1727, b'0', 'Coronel Pringles', 1),
(1728, b'0', 'Conesa', 9),
(1729, b'0', 'Villarino', 1),
(1730, b'0', 'Pirané', 14),
(1731, b'0', 'General Pinto', 1),
(1732, b'0', 'San Cayetano', 1),
(1733, b'0', 'Tres Arroyos', 1),
(1734, b'0', 'Coronel Dorrego', 1),
(1735, b'0', 'Necochea', 1),
(1736, b'0', 'Independencia', 6),
(1737, b'0', 'Chascomús', 1),
(1738, b'0', 'Punta Indio', 1),
(1739, b'0', 'El Carmen', 15),
(1740, b'0', 'Santa María', 12),
(1741, b'0', 'Valcheta', 9),
(1742, b'0', 'Arauco', 6),
(1743, b'0', 'Lezama', 1),
(1744, b'0', 'Campana', 1),
(1745, b'0', 'Magallanes', 8),
(1746, b'0', 'Corpen Aike', 8),
(1747, b'0', 'Minas', 12),
(1748, b'0', 'San Alberto', 12),
(1749, b'0', 'Río Segundo', 12),
(1750, b'0', 'San Justo', 12),
(1751, b'0', 'Unión', 12),
(1752, b'0', 'Tercero Arriba', 12),
(1753, b'0', 'Cerrillos', 4),
(1754, b'0', 'Río Cuarto', 12),
(1755, b'0', 'Tupungato', 13),
(1756, b'0', '9 de Julio', 9),
(1757, b'0', 'Ñorquinco', 9),
(1758, b'0', 'San Rafael', 13),
(1759, b'0', 'Anta', 4),
(1760, b'0', 'Picún Leufú', 16),
(1761, b'0', 'Zapala', 16),
(1762, b'0', '25 de Mayo', 9),
(1763, b'0', 'Telsen', 7),
(1764, b'0', 'Pilcaniyeu', 9),
(1765, b'0', 'Adolfo Alsina', 1),
(1766, b'0', 'General Alvear', 13),
(1767, b'0', 'La Caldera', 4),
(1768, b'0', 'Sargento Cabral', 5),
(1769, b'0', 'Pellegrini', 1),
(1770, b'0', 'Aluminé', 16),
(1771, b'0', 'Iruya', 4),
(1772, b'0', 'Lácar', 16),
(1773, b'0', 'Fray Mamerto Esquiú', 10),
(1774, b'0', 'Valle Viejo', 10),
(1775, b'0', 'San Cosme', 3),
(1776, b'0', 'Sarmiento', 7),
(1777, b'0', 'Comuna 1', 2),
(1778, b'0', 'Comuna 4', 2),
(1779, b'0', 'El Cuy', 9),
(1780, b'0', 'Las Heras', 13),
(1781, b'0', 'Tapenagá', 5),
(1782, b'0', 'Lavalle', 13),
(1783, b'0', 'Malargüe', 13),
(1784, b'0', 'Presidente Roque Sáenz Peña', 12),
(1785, b'0', 'Catán Lil', 16),
(1786, b'0', 'Presidencia de la Plaza', 5),
(1787, b'0', 'Comuna 5', 2),
(1788, b'0', 'Esquina', 3),
(1789, b'0', 'Ushuaia', 17);
INSERT INTO `localidad` (`id`, `eliminado`, `nombre`, `id_provincia`) VALUES
(1790, b'0', 'Antofagasta de la Sierra', 10),
(1791, b'0', 'Ensenada', 1),
(1792, b'0', 'Capital', 18),
(1793, b'0', 'Belgrano', 19),
(1794, b'0', 'Pergamino', 1),
(1795, b'0', 'Puán', 1),
(1796, b'0', 'General Villegas', 1),
(1797, b'0', 'Comuna 12', 2),
(1798, b'0', 'General Obligado', 19),
(1799, b'0', 'Vera', 19),
(1800, b'0', '9 de Julio', 19),
(1801, b'0', 'Adolfo Alsina', 9),
(1802, b'0', 'Quitilipi', 5),
(1803, b'0', 'Güer Aike', 8),
(1804, b'0', 'Capayán', 10),
(1805, b'0', 'Burruyacú', 18),
(1806, b'0', 'San Jerónimo', 19),
(1807, b'0', 'Independencia', 5),
(1808, b'0', 'Curuzú Cuatiá', 3),
(1809, b'0', 'Luján de Cuyo', 13),
(1810, b'0', 'Tinogasta', 10),
(1811, b'0', 'Comuna 7', 2),
(1812, b'0', 'Hucal', 20),
(1813, b'0', 'Itatí', 3),
(1814, b'0', 'Comuna 10', 2),
(1815, b'0', 'Caleu Caleu', 20),
(1816, b'0', 'Lihuel Calel', 20),
(1817, b'0', 'Curacó', 20),
(1818, b'0', 'Confluencia', 16),
(1819, b'0', 'Picunches', 16),
(1820, b'0', 'Añelo', 16),
(1821, b'0', 'Loncopué', 16),
(1822, b'0', 'Ñorquín', 16),
(1823, b'0', 'Pehuenches', 16),
(1824, b'0', 'Comuna 11', 2),
(1825, b'0', 'Montecarlo', 21),
(1826, b'0', 'Eldorado', 21),
(1827, b'0', 'San Pedro', 21),
(1828, b'0', 'Antártida Argentina', 17),
(1829, b'0', 'Minas', 16),
(1830, b'0', 'Chos Malal', 16),
(1831, b'0', 'Cushamen', 7),
(1832, b'0', 'Lago Buenos Aires', 8),
(1833, b'0', 'Pichi Mahuida', 9),
(1834, b'0', 'San Martín', 22),
(1835, b'0', 'Yavi', 15),
(1836, b'0', 'Santa Catalina', 15),
(1837, b'0', 'San Pedro', 15),
(1838, b'0', 'Valle Grande', 15),
(1839, b'0', 'Patiño', 14),
(1840, b'0', 'Bermejo', 14),
(1841, b'0', 'Susques', 15),
(1842, b'0', 'Matacos', 14),
(1843, b'0', 'Los Andes', 4),
(1844, b'0', 'Orán', 4),
(1845, b'0', 'Tilcara', 15),
(1846, b'0', 'Palpalá', 15),
(1847, b'0', 'Loventué', 20),
(1848, b'0', 'Río Senguer', 7),
(1849, b'0', 'Bariloche', 9),
(1850, b'0', 'Huiliches', 16),
(1851, b'0', 'Limay Mahuida', 20),
(1852, b'0', 'Puelén', 20),
(1853, b'0', 'Chalileo', 20),
(1854, b'0', 'Chical Co', 20),
(1855, b'0', 'Quebrachos', 22),
(1856, b'0', 'Monte Caseros', 3),
(1857, b'0', 'Mayor Luis J. Fontana', 5),
(1858, b'0', 'Fray Justo Santa María de Oro', 5),
(1859, b'0', 'General Belgrano', 6),
(1860, b'0', 'Las Colonias', 19),
(1861, b'0', 'San Justo', 19),
(1862, b'0', 'San Cristóbal', 19),
(1863, b'0', 'San Javier', 19),
(1864, b'0', 'Chapaleufú', 20),
(1865, b'0', 'Realicó', 20),
(1866, b'0', 'Maracó', 20),
(1867, b'0', 'Trenel', 20),
(1868, b'0', 'Copo', 22),
(1869, b'0', 'Capital', 20),
(1870, b'0', 'Santa Bárbara', 15),
(1871, b'0', 'Almirante Brown', 5),
(1872, b'0', 'Rosario de la Frontera', 4),
(1873, b'0', 'Collón Curá', 16),
(1874, b'0', 'Comuna 3', 2),
(1875, b'0', 'San Fernando', 1),
(1876, b'0', 'Tigre', 1),
(1877, b'0', 'Santa María', 10),
(1878, b'0', 'Santa Rosa', 10),
(1879, b'0', 'La Paz', 10),
(1880, b'0', 'Río Hondo', 22),
(1881, b'0', 'Vinchina', 6),
(1882, b'0', 'Capital', 6),
(1883, b'0', 'Río Seco', 12),
(1884, b'0', 'Avellaneda', 9),
(1885, b'0', 'General Roca', 9),
(1886, b'0', 'Belgrano', 11),
(1887, b'0', 'Los Lagos', 16),
(1888, b'0', 'Capital', 10),
(1889, b'0', 'Ancasti', 10),
(1890, b'0', 'Pomán', 10),
(1891, b'0', 'Comuna 2', 2),
(1892, b'0', '9 de Julio', 5),
(1893, b'0', 'Pocho', 12),
(1894, b'0', 'Ezeiza', 1),
(1895, b'0', 'Andalgalá', 10),
(1896, b'0', 'Ambato', 10),
(1897, b'0', 'Comuna 8', 2),
(1898, b'0', 'Guasayán', 22),
(1899, b'0', 'Paclín', 10),
(1900, b'0', 'El Alto', 10),
(1901, b'0', 'Sobremonte', 12),
(1902, b'0', 'Río Grande', 17),
(1903, b'0', 'Comuna 13', 2),
(1904, b'0', 'Banda', 22),
(1905, b'0', 'Paso de Indios', 7),
(1906, b'0', 'Capital', 12),
(1907, b'0', 'Mártires', 7),
(1908, b'0', 'Sarmiento', 22),
(1909, b'0', 'Deseado', 8),
(1910, b'0', 'Languiñeo', 7),
(1911, b'0', 'Belgrano', 22),
(1912, b'0', 'Aguirre', 22),
(1913, b'0', 'Maipú', 5),
(1914, b'0', 'San Carlos', 13),
(1915, b'0', 'Tunuyán', 13),
(1916, b'0', 'Robles', 22),
(1917, b'0', 'Loreto', 22),
(1918, b'0', 'Catriló', 20),
(1919, b'0', 'Capital', 22),
(1920, b'0', 'Comuna 14', 2),
(1921, b'0', 'Colón', 23),
(1922, b'0', 'Villaguay', 23),
(1923, b'0', 'Castelli', 1),
(1924, b'0', 'San Salvador', 23),
(1925, b'0', 'Belén', 10),
(1926, b'0', 'Almirante Brown', 1),
(1927, b'0', 'Nogoyá', 23),
(1928, b'0', 'Tala', 23),
(1929, b'0', 'Gualeguay', 23),
(1930, b'0', 'Federación', 23),
(1931, b'0', 'La Paz', 23),
(1932, b'0', 'Feliciano', 23),
(1933, b'0', 'Presidente Perón', 1),
(1934, b'0', 'Junín', 1),
(1935, b'0', 'Brandsen', 1),
(1936, b'0', 'Chivilcoy', 1),
(1937, b'0', 'Alberti', 1),
(1938, b'0', 'Bragado', 1),
(1939, b'0', 'General Las Heras', 1),
(1940, b'0', 'Carlos Casares', 1),
(1941, b'0', 'Marcos Paz', 1),
(1942, b'0', 'General Viamonte', 1),
(1943, b'0', 'Carlos Tejedor', 1),
(1944, b'0', '25 de Mayo', 1),
(1945, b'0', '9 de Julio', 1),
(1946, b'0', 'Pehuajó', 1),
(1947, b'0', 'Tapalqué', 1),
(1948, b'0', 'Trenque Lauquen', 1),
(1949, b'0', 'General Belgrano', 1),
(1950, b'0', 'Monte', 1),
(1951, b'0', 'Roque Pérez', 1),
(1952, b'0', 'Olavarría', 1),
(1953, b'0', 'Merlo', 1),
(1954, b'0', 'Cainguás', 21),
(1955, b'0', 'Islas del Atlántico Sur', 17),
(1956, b'0', 'Esteban Echeverría', 1),
(1957, b'0', 'Arrecifes', 1),
(1958, b'0', 'Capitán Sarmiento', 1),
(1959, b'0', 'Dr. Manuel Belgrano', 15),
(1960, b'0', 'Carmen de Areco', 1),
(1961, b'0', 'Salto', 1),
(1962, b'0', 'Exaltación de la Cruz', 1),
(1963, b'0', 'San Miguel', 1),
(1964, b'0', 'San Andrés de Giles', 1),
(1965, b'0', 'Mercedes', 1),
(1966, b'0', 'Pilar', 1),
(1967, b'0', 'Luján', 1),
(1968, b'0', 'Famaillá', 18),
(1969, b'0', 'Hurlingham', 1),
(1970, b'0', 'Morón', 1),
(1971, b'0', 'Chacabuco', 1),
(1972, b'0', 'Junín', 13),
(1973, b'0', 'Malvinas Argentinas', 1),
(1974, b'0', 'Tres Lomas', 1),
(1975, b'0', 'Ayacucho', 1),
(1976, b'0', 'Guaminí', 1),
(1977, b'0', 'General San Martín', 1),
(1978, b'0', 'Lincoln', 1),
(1979, b'0', 'Laprida', 1),
(1980, b'0', 'San Isidro', 1),
(1981, b'0', 'Benito Juárez', 1),
(1982, b'0', 'Colón', 1),
(1983, b'0', 'Ituzaingó', 1),
(1984, b'0', 'General Rodríguez', 1),
(1985, b'0', 'Suipacha', 1),
(1986, b'0', 'Tres de Febrero', 1),
(1987, b'0', 'General Felipe Varela', 6),
(1988, b'0', 'Florencio Varela', 1),
(1989, b'0', 'Navarro', 1),
(1990, b'0', 'Cañuelas', 1),
(1991, b'0', 'Moreno', 22),
(1992, b'0', 'Chacabuco', 5),
(1993, b'0', 'San Vicente', 1),
(1994, b'0', 'Lobos', 1),
(1995, b'0', 'General Alvear', 1),
(1996, b'0', 'Quilmes', 1),
(1997, b'0', 'Pila', 1),
(1998, b'0', 'General La Madrid', 1),
(1999, b'0', 'Bolívar', 1),
(2000, b'0', 'Castro Barros', 6),
(2001, b'0', 'Balcarce', 1),
(2002, b'0', 'Hipólito Yrigoyen', 1),
(2003, b'0', 'Capital', 13),
(2004, b'0', 'Dolores', 1),
(2005, b'0', 'Azul', 1),
(2006, b'0', 'Daireaux', 1),
(2007, b'0', 'Godoy Cruz', 13),
(2008, b'0', 'Cafayate', 4),
(2009, b'0', 'Figueroa', 22),
(2010, b'0', 'Saavedra', 1),
(2011, b'0', 'Monte Hermoso', 1),
(2012, b'0', 'Lobería', 1),
(2013, b'0', 'Berisso', 1),
(2014, b'0', 'Tordillo', 1),
(2015, b'0', 'Zárate', 1),
(2016, b'0', 'Ramallo', 1),
(2017, b'0', 'San Nicolás', 1),
(2018, b'0', 'Salavina', 22),
(2019, b'0', 'Pellegrini', 22),
(2020, b'0', 'Avellaneda', 22),
(2021, b'0', '2 de Abril', 5),
(2022, b'0', 'Guaymallén', 13),
(2023, b'0', 'Juárez Celman', 12),
(2024, b'0', 'Capital', 4),
(2025, b'0', 'Silípica', 22),
(2026, b'0', 'La Candelaria', 4),
(2027, b'0', 'Rancul', 20),
(2028, b'0', 'Maipú', 13),
(2029, b'0', 'Guachipas', 4),
(2030, b'0', 'Atreucó', 20),
(2031, b'0', 'San Martín', 13),
(2032, b'0', 'Guatraché', 20),
(2033, b'0', 'Sanagasta', 6),
(2034, b'0', 'Conhelo', 20),
(2035, b'0', 'Libertador General San Martín', 21),
(2036, b'0', 'Rosario Vera Peñaloza', 6),
(2037, b'0', 'San Miguel', 3),
(2038, b'0', 'General Juan Facundo Quiroga', 6),
(2039, b'0', 'Ángel Vicente Peñaloza', 6),
(2040, b'0', 'Empedrado', 3),
(2041, b'0', 'Chilecito', 6),
(2042, b'0', 'Toay', 20),
(2043, b'0', 'Colón', 12),
(2044, b'0', 'Ituzaingó', 3),
(2045, b'0', 'Famatina', 6),
(2046, b'0', 'General López', 19),
(2047, b'0', 'Constitución', 19),
(2048, b'0', 'Caseros', 19),
(2049, b'0', 'Rosario', 19),
(2050, b'0', 'San Lorenzo', 19),
(2051, b'0', 'Iriondo', 19),
(2052, b'0', 'Lanús', 1),
(2053, b'0', 'General San Martín', 6),
(2054, b'0', 'San Blas de Los Sauces', 6),
(2055, b'0', 'San Antonio', 15),
(2056, b'0', 'Rinconada', 15),
(2057, b'0', 'Ramón Lista', 14),
(2058, b'0', 'La Poma', 4),
(2059, b'0', 'Biedma', 7),
(2060, b'0', 'Capital', 3),
(2061, b'0', 'San Luis del Palmar', 3),
(2062, b'0', 'Formosa', 14),
(2063, b'0', 'Comuna 9', 2),
(2064, b'0', 'Tehuelches', 7),
(2065, b'0', 'Escalante', 7),
(2066, b'0', 'Ischilín', 12),
(2067, b'0', 'Totoral', 12),
(2068, b'0', 'General San Martín', 12),
(2069, b'0', 'San Javier', 12),
(2070, b'0', 'Río Primero', 12),
(2071, b'0', 'Marcos Juárez', 12),
(2072, b'0', 'General Donovan', 5),
(2073, b'0', 'Leandro N. Alem', 1),
(2074, b'0', 'Libertador General San Martín', 5),
(2075, b'0', 'Gastre', 7),
(2076, b'0', 'General Arenales', 1),
(2077, b'0', 'Bermejo', 5),
(2078, b'0', 'Calamuchita', 12),
(2079, b'0', 'Cruz Alta', 18),
(2080, b'0', 'Lules', 18),
(2081, b'0', 'Yerba Buena', 18),
(2082, b'0', 'Tafí Viejo', 18),
(2083, b'0', 'Libertador General San Martín', 11),
(2084, b'0', 'Coronel Pringles', 11),
(2085, b'0', 'Chacabuco', 11),
(2086, b'0', 'Rivadavia', 1),
(2087, b'0', 'Patagones', 1),
(2088, b'0', 'Juan Martín de Pueyrredón', 11),
(2089, b'0', 'General Pedernera', 11),
(2090, b'0', 'Trancas', 18),
(2091, b'0', 'Tafí del Valle', 18),
(2092, b'0', 'Junín', 11),
(2093, b'0', 'Mitre', 22),
(2094, b'0', 'Atamisqui', 22),
(2095, b'0', 'Berón de Astrada', 3),
(2096, b'0', 'Tolhuin', 17),
(2097, b'0', 'Capital', 21),
(2098, b'0', 'Candelaria', 21),
(2099, b'0', 'Jiménez', 22),
(2100, b'0', 'Coronel de Marina Leonardo Rosales', 1),
(2101, b'0', 'Baradero', 1),
(2102, b'0', 'San Pedro', 1),
(2103, b'0', 'Santa Victoria', 4),
(2104, b'0', 'General José de San Martín', 4),
(2105, b'0', 'Comuna 15', 2),
(2106, b'0', 'Rosario de Lerma', 4),
(2107, b'0', 'Ledesma', 15),
(2108, b'0', 'Humahuaca', 15),
(2109, b'0', 'Cochinoca', 15),
(2110, b'0', 'Tumbaya', 15),
(2111, b'0', 'Florentino Ameghino', 1),
(2112, b'0', 'Florentino Ameghino', 7),
(2113, b'0', 'La Cocha', 18),
(2114, b'0', 'Graneros', 18),
(2115, b'0', 'Juan Bautista Alberdi', 18),
(2116, b'0', 'Río Chico', 18),
(2117, b'0', 'Simoca', 18),
(2118, b'0', 'Chicligasta', 18),
(2119, b'0', 'Monteros', 18),
(2120, b'0', 'Leales', 18),
(2121, b'0', 'San Martín', 19),
(2122, b'0', 'La Capital', 19),
(2123, b'0', 'General Manuel Belgrano', 21),
(2124, b'0', 'Guaraní', 21),
(2125, b'0', 'Iguazú', 21),
(2126, b'0', '25 de Mayo', 21),
(2127, b'0', 'Oberá', 21),
(2128, b'0', 'Castellanos', 19),
(2129, b'0', 'Garay', 19),
(2130, b'0', 'Quemú Quemú', 20),
(2131, b'0', 'San Ignacio', 21),
(2132, b'0', 'Utracán', 20),
(2133, b'0', 'San Martín', 3),
(2134, b'0', 'Paso de los Libres', 3),
(2135, b'0', 'Goya', 3),
(2136, b'0', 'Lavalle', 3),
(2137, b'0', 'San Roque', 3),
(2138, b'0', 'General Alvear', 3),
(2139, b'0', 'Concepción', 3),
(2140, b'0', 'Bella Vista', 3),
(2141, b'0', 'Santo Tomé', 3),
(2142, b'0', 'Saladas', 3),
(2143, b'0', 'General Paz', 3),
(2144, b'0', 'Leandro N. Alem', 21),
(2145, b'0', 'San Javier', 21),
(2146, b'0', 'Mburucuyá', 3),
(2147, b'0', 'Concepción', 21),
(2148, b'0', 'Apóstoles', 21),
(2149, b'0', '1° de Mayo', 5),
(2150, b'0', 'San Fernando', 5),
(2151, b'0', 'San Lorenzo', 5),
(2152, b'0', 'Lomas de Zamora', 1),
(2153, b'0', 'Avellaneda', 1),
(2154, b'0', '25 de Mayo', 5),
(2155, b'0', 'General Belgrano', 5),
(2156, b'0', 'Libertad', 5),
(2157, b'0', 'Comandante Fernández', 5),
(2158, b'0', 'Chimbas', 24),
(2159, b'0', 'Capital', 24),
(2160, b'0', 'Rivadavia', 24),
(2161, b'0', '9 de Julio', 24),
(2162, b'0', 'Albardón', 24),
(2163, b'0', 'Angaco', 24),
(2164, b'0', 'Santa Lucía', 24),
(2165, b'0', 'Rawson', 24),
(2166, b'0', '25 de Mayo', 24),
(2167, b'0', 'San Martín', 24),
(2168, b'0', 'Pocito', 24),
(2169, b'0', 'Zonda', 24),
(2170, b'0', 'Ullum', 24),
(2171, b'0', 'Sarmiento', 24),
(2172, b'0', 'Calingasta', 24),
(2173, b'0', 'Iglesia', 24),
(2174, b'0', 'Jáchal', 24),
(2175, b'0', 'Valle Fértil', 24),
(2176, b'0', 'Caucete', 24),
(2177, b'0', 'La Plata', 1),
(2178, b'0', 'Mercedes', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad_seq`
--

DROP TABLE IF EXISTS `localidad_seq`;
CREATE TABLE IF NOT EXISTS `localidad_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `localidad_seq`
--

INSERT INTO `localidad_seq` (`next_val`) VALUES
(2251);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

DROP TABLE IF EXISTS `pais`;
CREATE TABLE IF NOT EXISTS `pais` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id`, `eliminado`, `nombre`) VALUES
(1, b'0', 'Argentina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais_seq`
--

DROP TABLE IF EXISTS `pais_seq`;
CREATE TABLE IF NOT EXISTS `pais_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pais_seq`
--

INSERT INTO `pais_seq` (`next_val`) VALUES
(51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `estado` tinyint DEFAULT NULL,
  `fecha_pedido` date DEFAULT NULL,
  `forma_pago` tinyint DEFAULT NULL,
  `hora_estimada_finalizacion` time(6) DEFAULT NULL,
  `tipo_envio` tinyint DEFAULT NULL,
  `total` double DEFAULT NULL,
  `total_costo` double DEFAULT NULL,
  `cliente_id` bigint DEFAULT NULL,
  `domicilio_id` bigint DEFAULT NULL,
  `empleado_id` bigint DEFAULT NULL,
  `sucursal_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK30s8j2ktpay6of18lbyqn3632` (`cliente_id`),
  KEY `FKauqt5ljerhslue4scdu1qexb` (`domicilio_id`),
  KEY `FK1nibrtel55qwnf6rwabwsqkyi` (`empleado_id`),
  KEY `FK3ks2hug06ddfndlg1rqw1xmr9` (`sucursal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_seq`
--

DROP TABLE IF EXISTS `pedido_seq`;
CREATE TABLE IF NOT EXISTS `pedido_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pedido_seq`
--

INSERT INTO `pedido_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocion`
--

DROP TABLE IF EXISTS `promocion`;
CREATE TABLE IF NOT EXISTS `promocion` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `denominacion` varchar(255) DEFAULT NULL,
  `descripcion_descuento` varchar(255) DEFAULT NULL,
  `fecha_desde` date DEFAULT NULL,
  `fecha_hasta` date DEFAULT NULL,
  `hora_desde` time(6) DEFAULT NULL,
  `hora_hasta` time(6) DEFAULT NULL,
  `precio_promocional` double DEFAULT NULL,
  `tipo_promocion` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocion_articulo`
--

DROP TABLE IF EXISTS `promocion_articulo`;
CREATE TABLE IF NOT EXISTS `promocion_articulo` (
  `promocion_id` bigint NOT NULL,
  `articulo_id` bigint NOT NULL,
  PRIMARY KEY (`promocion_id`,`articulo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocion_detalle`
--

DROP TABLE IF EXISTS `promocion_detalle`;
CREATE TABLE IF NOT EXISTS `promocion_detalle` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `cantidad` int NOT NULL,
  `articulo_id` bigint DEFAULT NULL,
  `promocion_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmxkc9fkv4btuhc89yu338obqd` (`promocion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocion_detalle_seq`
--

DROP TABLE IF EXISTS `promocion_detalle_seq`;
CREATE TABLE IF NOT EXISTS `promocion_detalle_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `promocion_detalle_seq`
--

INSERT INTO `promocion_detalle_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocion_seq`
--

DROP TABLE IF EXISTS `promocion_seq`;
CREATE TABLE IF NOT EXISTS `promocion_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `promocion_seq`
--

INSERT INTO `promocion_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

DROP TABLE IF EXISTS `provincia`;
CREATE TABLE IF NOT EXISTS `provincia` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `id_pais` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp37jnxd9htn7o8v195jm4uvre` (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`id`, `eliminado`, `nombre`, `id_pais`) VALUES
(1, b'0', 'Buenos Aires', 1),
(2, b'0', 'Ciudad Autónoma de Buenos Aires', 1),
(3, b'0', 'Corrientes', 1),
(4, b'0', 'Salta', 1),
(5, b'0', 'Chaco', 1),
(6, b'0', 'La Rioja', 1),
(7, b'0', 'Chubut', 1),
(8, b'0', 'Santa Cruz', 1),
(9, b'0', 'Río Negro', 1),
(10, b'0', 'Catamarca', 1),
(11, b'0', 'San Luis', 1),
(12, b'0', 'Córdoba', 1),
(13, b'0', 'Mendoza', 1),
(14, b'0', 'Formosa', 1),
(15, b'0', 'Jujuy', 1),
(16, b'0', 'Neuquén', 1),
(17, b'0', 'Tierra del Fuego, Antártida e Islas del Atlántico Sur', 1),
(18, b'0', 'Tucumán', 1),
(19, b'0', 'Santa Fe', 1),
(20, b'0', 'La Pampa', 1),
(21, b'0', 'Misiones', 1),
(22, b'0', 'Santiago del Estero', 1),
(23, b'0', 'Entre Ríos', 1),
(24, b'0', 'San Juan', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia_seq`
--

DROP TABLE IF EXISTS `provincia_seq`;
CREATE TABLE IF NOT EXISTS `provincia_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `provincia_seq`
--

INSERT INTO `provincia_seq` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revision_info`
--

DROP TABLE IF EXISTS `revision_info`;
CREATE TABLE IF NOT EXISTS `revision_info` (
  `id` int NOT NULL,
  `revision_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seq_revision_id`
--

DROP TABLE IF EXISTS `seq_revision_id`;
CREATE TABLE IF NOT EXISTS `seq_revision_id` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `seq_revision_id`
--

INSERT INTO `seq_revision_id` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
CREATE TABLE IF NOT EXISTS `sucursal` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `casa_matriz` bit(1) DEFAULT NULL,
  `horario_apertura` time(6) DEFAULT NULL,
  `horario_cierre` time(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `domicilio_id` bigint DEFAULT NULL,
  `id_empresa` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_34hifwa9nn1cgdbjgkosx0wy2` (`domicilio_id`),
  KEY `FKnl8kicjg784yrow6qbleby1uq` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal_categoria`
--

DROP TABLE IF EXISTS `sucursal_categoria`;
CREATE TABLE IF NOT EXISTS `sucursal_categoria` (
  `sucursal_id` bigint NOT NULL,
  `categoria_id` bigint NOT NULL,
  PRIMARY KEY (`sucursal_id`,`categoria_id`),
  KEY `FKtcbmv4283gg4r2ds9v510up26` (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal_promocion`
--

DROP TABLE IF EXISTS `sucursal_promocion`;
CREATE TABLE IF NOT EXISTS `sucursal_promocion` (
  `promocion_id` bigint NOT NULL,
  `sucursal_id` bigint NOT NULL,
  PRIMARY KEY (`promocion_id`,`sucursal_id`),
  KEY `FKfv8unyrvkg4sow787vu0lb447` (`sucursal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal_seq`
--

DROP TABLE IF EXISTS `sucursal_seq`;
CREATE TABLE IF NOT EXISTS `sucursal_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `sucursal_seq`
--

INSERT INTO `sucursal_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

DROP TABLE IF EXISTS `unidad_medida`;
CREATE TABLE IF NOT EXISTS `unidad_medida` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `denominacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `unidad_medida`
--

INSERT INTO `unidad_medida` (`id`, `eliminado`, `denominacion`) VALUES
(1, b'0', 'Kilogramos'),
(2, b'0', 'Gramos'),
(3, b'0', 'Litros'),
(4, b'0', 'Mililitros'),
(5, b'0', 'Unidades'),
(6, b'0', 'Pizca'),
(7, b'0', 'Porciones'),
(8, b'0', 'Cucharadas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida_seq`
--

DROP TABLE IF EXISTS `unidad_medida_seq`;
CREATE TABLE IF NOT EXISTS `unidad_medida_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `unidad_medida_seq`
--

INSERT INTO `unidad_medida_seq` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_cliente`
--

DROP TABLE IF EXISTS `usuario_cliente`;
CREATE TABLE IF NOT EXISTS `usuario_cliente` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `auth0id` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_cliente_seq`
--

DROP TABLE IF EXISTS `usuario_cliente_seq`;
CREATE TABLE IF NOT EXISTS `usuario_cliente_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario_cliente_seq`
--

INSERT INTO `usuario_cliente_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_empleado`
--

DROP TABLE IF EXISTS `usuario_empleado`;
CREATE TABLE IF NOT EXISTS `usuario_empleado` (
  `id` bigint NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `auth0id` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_empleado_seq`
--

DROP TABLE IF EXISTS `usuario_empleado_seq`;
CREATE TABLE IF NOT EXISTS `usuario_empleado_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario_empleado_seq`
--

INSERT INTO `usuario_empleado_seq` (`next_val`) VALUES
(1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo_insumo`
--
ALTER TABLE `articulo_insumo`
  ADD CONSTRAINT `FK_bq24pwi1icjnu04cdhfq8qik2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  ADD CONSTRAINT `FK_t87v5vp2gygwbhs0s5t4x78aj` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medida` (`id`);

--
-- Filtros para la tabla `articulo_manufacturado`
--
ALTER TABLE `articulo_manufacturado`
  ADD CONSTRAINT `FK_j2ltshqmxs8ksyttgpwm7tt27` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medida` (`id`),
  ADD CONSTRAINT `FK_rxvuc695pmrvn93gu3564up7y` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`);

--
-- Filtros para la tabla `articulo_manufacturado_detalle`
--
ALTER TABLE `articulo_manufacturado_detalle`
  ADD CONSTRAINT `FKee8sad16ogk7in2nlh0vc3y9b` FOREIGN KEY (`articulo_insumo_id`) REFERENCES `articulo_insumo` (`id`),
  ADD CONSTRAINT `FKmq6wwsgxaoxlc7rmrgu0acj7a` FOREIGN KEY (`articulo_manufacturado_detalle_id`) REFERENCES `articulo_manufacturado` (`id`);

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `FKjiixv3teefdkilvoysutbedif` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK9wu56im8hnincjveq4kw4ectv` FOREIGN KEY (`usuario_id`) REFERENCES `usuario_cliente` (`id`),
  ADD CONSTRAINT `FKstms9vorwmch8l3au2hbvhyal` FOREIGN KEY (`imagen_cliente_id`) REFERENCES `imagen_cliente` (`id`);

--
-- Filtros para la tabla `cliente_domicilio`
--
ALTER TABLE `cliente_domicilio`
  ADD CONSTRAINT `FK7jkekc8ff2g28bthd4dd9d7r2` FOREIGN KEY (`domicilio_id`) REFERENCES `domicilio` (`id`),
  ADD CONSTRAINT `FKr5fndm18tmwywoov7o2d0ofdl` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `FKgqvba9e7dildyw45u0usdj1k2` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`);

--
-- Filtros para la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD CONSTRAINT `FKqrmmkejvimmve55527wv6ujtr` FOREIGN KEY (`id_localidad`) REFERENCES `localidad` (`id`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `FKj85uwmll1sb6cw5rqnlgyhqif` FOREIGN KEY (`imagen_empleado_id`) REFERENCES `imagen_empleado` (`id`),
  ADD CONSTRAINT `FKkv68lx8xpbpv6jprh7taieaej` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal` (`id`),
  ADD CONSTRAINT `FKlmr07q48dtck3j1f08iti0nbh` FOREIGN KEY (`usuario_empleado_id`) REFERENCES `usuario_empleado` (`id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `FKn6q9mbkc0n4g1uux57clh2bq0` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`);

--
-- Filtros para la tabla `imagen_promocion`
--
ALTER TABLE `imagen_promocion`
  ADD CONSTRAINT `FKfigh8y0s5beb3p1f7jaab8brr` FOREIGN KEY (`promocion_id`) REFERENCES `promocion` (`id`);

--
-- Filtros para la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD CONSTRAINT `FKbsjp9dyq5f3hk4ngy6pw3v3b2` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK1nibrtel55qwnf6rwabwsqkyi` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`),
  ADD CONSTRAINT `FK30s8j2ktpay6of18lbyqn3632` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `FK3ks2hug06ddfndlg1rqw1xmr9` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal` (`id`),
  ADD CONSTRAINT `FKauqt5ljerhslue4scdu1qexb` FOREIGN KEY (`domicilio_id`) REFERENCES `domicilio` (`id`);

--
-- Filtros para la tabla `promocion_articulo`
--
ALTER TABLE `promocion_articulo`
  ADD CONSTRAINT `FKmwaxvlywtxtbr2eow3vibc94d` FOREIGN KEY (`promocion_id`) REFERENCES `promocion` (`id`);

--
-- Filtros para la tabla `promocion_detalle`
--
ALTER TABLE `promocion_detalle`
  ADD CONSTRAINT `FKmxkc9fkv4btuhc89yu338obqd` FOREIGN KEY (`promocion_id`) REFERENCES `promocion` (`id`);

--
-- Filtros para la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `FKp37jnxd9htn7o8v195jm4uvre` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id`);

--
-- Filtros para la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD CONSTRAINT `FKnl8kicjg784yrow6qbleby1uq` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `FKpxac8l3j9mwcwolj5dyctwpxo` FOREIGN KEY (`domicilio_id`) REFERENCES `domicilio` (`id`);

--
-- Filtros para la tabla `sucursal_categoria`
--
ALTER TABLE `sucursal_categoria`
  ADD CONSTRAINT `FKgr9g4037djhuxuahxtttbcpe6` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal` (`id`),
  ADD CONSTRAINT `FKtcbmv4283gg4r2ds9v510up26` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`);

--
-- Filtros para la tabla `sucursal_promocion`
--
ALTER TABLE `sucursal_promocion`
  ADD CONSTRAINT `FKfv8unyrvkg4sow787vu0lb447` FOREIGN KEY (`sucursal_id`) REFERENCES `promocion` (`id`),
  ADD CONSTRAINT `FKsffdgi1kd25vte47yhjm3rodh` FOREIGN KEY (`promocion_id`) REFERENCES `sucursal` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
