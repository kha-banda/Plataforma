-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 30-09-2024 a las 19:51:48
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `plataforma`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL,
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

CREATE TABLE IF NOT EXISTS `direccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `colonia` varchar(50) NOT NULL,
  `cp` varchar(10) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `numero` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

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
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_producto`
--

CREATE TABLE IF NOT EXISTS `pedido_producto` (
  `pedido_id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `canitdad` int(11) NOT NULL,
  PRIMARY KEY (`pedido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `cantidad` int(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `cantidad`, `precio`, `imagen`, `categoria_id`) VALUES
(1, 'Aceite Vegetal comestible "La Patrona"', '', 2, '13.00', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamo`
--

CREATE TABLE IF NOT EXISTS `reclamo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `direccion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellidos`, `correo`, `telefono`, `contraseña`, `direccion_id`) VALUES
(1, 'pedro', 'martinez otiz', 'ortiz_@outlook.com', '2314567896', 'xvervsdfbvvb', 0),
(2, 'pedro', 'martinez otiz', 'ortz_@outlook.com', '2314567896', 'xvervsdfbvvb', 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
