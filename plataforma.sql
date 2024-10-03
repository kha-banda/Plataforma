-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 03-10-2024 a las 17:22:40
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
-- Base de datos: `plataforma`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

DROP TABLE IF EXISTS `administrador`;
CREATE TABLE IF NOT EXISTS `administrador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(1, 'Aceites'),
(2, 'Agua purificada'),
(3, 'productos envasados'),
(4, 'Enlatados'),
(5, 'Blanqueadores'),
(6, 'Cafe soluble'),
(7, 'chocolate de mesa'),
(8, 'crema dental'),
(9, 'detergente en polvo'),
(10, 'galletas de animalitos'),
(11, 'galletas marias'),
(12, 'gelatinas'),
(13, 'harina de trigo'),
(14, 'hojuela de maiz'),
(15, 'Insectisida '),
(16, 'jabon de lavanderia'),
(17, 'jabon de tocador'),
(18, 'jugo tetrabrik'),
(19, 'Lacteos'),
(20, 'papel higienico'),
(21, 'Pasta para sopa'),
(22, 'Sal'),
(23, 'Servilletas'),
(24, 'Soya'),
(25, ''),
(26, 'Toallas Sanitarias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

DROP TABLE IF EXISTS `direccion`;
CREATE TABLE IF NOT EXISTS `direccion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `colonia` varchar(50) NOT NULL,
  `cp` varchar(10) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `numero` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id`, `estado`, `ciudad`, `colonia`, `cp`, `calle`, `numero`) VALUES
(1, 'OAXACA', 'vigastepec', 'pedregal', '2536', 'la lameda', 'S/N'),
(2, 'OAXACA', 'Los Cues', 'Purisima', '8974', 'loma larga', '14'),
(3, 'OAXACA', 'Cuicatlan', 'Benito Juarez', '3548', 'Las arboledas', '10'),
(24, 'OAXACA', 'vigastepec', 'pedregal', '2536', 'la lameda', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
CREATE TABLE IF NOT EXISTS `movimiento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_movimiento` enum('entrada','salida') NOT NULL,
  `fecha` date NOT NULL,
  `cantidad` int NOT NULL,
  `origen` varchar(100) DEFAULT NULL,
  `destino` varchar(100) DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_movimiento_producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `fecha` date NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_producto`
--

DROP TABLE IF EXISTS `pedido_producto`;
CREATE TABLE IF NOT EXISTS `pedido_producto` (
  `pedido_id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int NOT NULL,
  `canitdad` int NOT NULL,
  PRIMARY KEY (`pedido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `cantidad` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `categoria_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `cantidad`, `precio`, `imagen`, `categoria_id`) VALUES
(1, 'Aceite Vegetal comestible \"La Patrona\"', '', 2, '13.00', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamo`
--

DROP TABLE IF EXISTS `reclamo`;
CREATE TABLE IF NOT EXISTS `reclamo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_pedido`
--

DROP TABLE IF EXISTS `registro_pedido`;
CREATE TABLE IF NOT EXISTS `registro_pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_tienda` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `fecha_pedido` date NOT NULL,
  `cantidad_solicitada` int NOT NULL,
  `status_pedido` enum('pendiente','procesado','entregado') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedido_tienda` (`id_tienda`),
  KEY `fk_pedido_producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

DROP TABLE IF EXISTS `tienda`;
CREATE TABLE IF NOT EXISTS `tienda` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `direccion_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellidos`, `correo`, `telefono`, `contraseña`, `direccion_id`) VALUES
(1, 'pedro', 'martinez otiz', 'ortiz_@outlook.com', '2314567896', 'xvervsdfbvvb', 0),
(2, 'pedro', 'martinez otiz', 'ortz_@outlook.com', '2314567896', 'xvervsdfbvvb', 2);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD CONSTRAINT `fk_movimiento_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`),
  ADD CONSTRAINT `movimiento_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `registro_pedido`
--
ALTER TABLE `registro_pedido`
  ADD CONSTRAINT `fk_pedido_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`),
  ADD CONSTRAINT `fk_pedido_tienda` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id`),
  ADD CONSTRAINT `registro_pedido_ibfk_1` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id`),
  ADD CONSTRAINT `registro_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
