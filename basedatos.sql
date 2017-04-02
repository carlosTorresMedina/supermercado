-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-04-2017 a las 21:31:37
-- Versión del servidor: 5.6.26
-- Versión de PHP: 5.5.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `motilon`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE IF NOT EXISTS `marca` (
  `marca` varchar(50) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`marca`, `descripcion`) VALUES
('girasol', NULL),
('oliva', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(11) NOT NULL,
  `documento` varchar(15) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `tipo` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_producto`
--

CREATE TABLE IF NOT EXISTS `pedido_producto` (
  `id_pedido` int(11) NOT NULL,
  `codigo_producto` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `documento` varchar(15) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `saldo_limite` double NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `password` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`documento`, `nombre`, `apellido`, `email`, `saldo_limite`, `direccion`, `password`, `telefono`) VALUES
('1', 'carlos', 'torres', 'carlo_0108@hotmail.com', 700000, 'calle 25', '9865e86af29a304a48a01b18d5380c016f0a23d4', '22'),
('103780013', 'carlos', 'torres', 'carlostorres0@outlook.com', 800000, 'calle 12 barrio galan', '9865e86af29a304a48a01b18d5380c016f0a23d4', '5824922'),
('1093780001', 'martin', 'perez', 'carlostorres0101@outlook.com', 900000, 'calle 12 barrio galan', '9865e86af29a304a48a01b18d5380c016f0a23d4', '5893432'),
('109378001', 'juan ', 'perez', 'juan@gmail.com', 0, 'calle 12 barrio galan', '9865e86af29a304a48a01b18d5380c016f0a23d4', '3124894394'),
('10937800102', 'maria', 'perez', 'carlos1212@hotmail.com', 900000, 'calle 12 barrio galan', '9865e86af29a304a48a01b18d5380c016f0a23d4', '3124894394'),
('109378001021', 'maria', 'perez', 'carlos12142@hotmail.com', 900000, 'calle 12 barrio galan', '9865e86af29a304a48a01b18d5380c016f0a23d4', '3124894394'),
('1093780010212', 'maria', 'perez', 'carlos1214f2@hotmail.com', 900000, 'calle 12 barrio galan', '9865e86af29a304a48a01b18d5380c016f0a23d4', '3124894394'),
('109378001021212', 'maria', 'perez', 'carlos121124f2@hotmail.com', 900000, 'calle 12 barrio galan', '9865e86af29a304a48a01b18d5380c016f0a23d4', '3124894394'),
('1093780012', 'marco', 'torres', 'carlo_01088@hotmail.com', 0, 'calle 12 barrio galan', '9865e86af29a304a48a01b18d5380c016f0a23d4', '5824922'),
('10937800123', 'juan', 'perez', 'carlosmetinda@gmail.com', 50000, 'calle 12 barrio galan', '9865e86af29a304a48a01b18d5380c016f0a23d4', '5824922'),
('12', 'a', 'fas|', 'carlosmdina@gmail.co', 0, 'qqwf', 'a0b32745df5481b0b14bf3361a8a17b8b387a67d', '23432'),
('123', 'cadf', 'fadsf', 'carlosmedina1e3@gmail.com', 59000, 'calle 23', '9865e86af29a304a48a01b18d5380c016f0a23d4', '123'),
('2', 'juan', 'perez', 'carlo_0108@outlook.com', 0, 'calle 23', '9865e86af29a304a48a01b18d5380c016f0a23d4', '12455'),
('3', 'brayan', 'perez', 'mario@hotmail.com', 0, 'calle 18', '9865e86af29a304a48a01b18d5380c016f0a23d4', '0'),
('4', 'juan ', 'mario', 'carlosmedina@gmail.com', 90000, 'calle 18', '9865e86af29a304a48a01b18d5380c016f0a23d4', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `tipo_producto` varchar(50) DEFAULT NULL,
  `descripcion` varchar(50) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `precio_venta` double NOT NULL,
  `precio_compra` double NOT NULL,
  `imagen` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigo`, `nombre`, `cantidad`, `tipo_producto`, `descripcion`, `marca`, `precio_venta`, `precio_compra`, `imagen`) VALUES
(1, 'aceite 12.l', 10, 'aceites', 'no tiene descripcion', 'girasol', 2000, 1500, 'public/img/productos/sinimagen.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE IF NOT EXISTS `proveedor` (
  `empresa_proveedor` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `direccion` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`empresa_proveedor`, `email`, `direccion`) VALUES
('bimbo', 'calle 12 barrio nidia', 'bimboska@gmail.com'),
('coguasimales', 'av 0 calle 3', 'coguasimales@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_producto`
--

CREATE TABLE IF NOT EXISTS `proveedor_producto` (
  `empresa_proveedor` varchar(50) NOT NULL,
  `codigo_producto` int(11) NOT NULL,
  `cantidad` double DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor_producto`
--

INSERT INTO `proveedor_producto` (`empresa_proveedor`, `codigo_producto`, `cantidad`, `fecha`) VALUES
('coguasimales', 1, 10, '2016-10-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE IF NOT EXISTS `tipo_producto` (
  `tipo_producto` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`tipo_producto`, `descripcion`) VALUES
('aceites', 'tipos de aceites'),
('lacteos', 'productos lacteos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `tipo` varchar(30) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`tipo`, `descripcion`) VALUES
('administrador', 'usuario con mayor relevancia en el sistema.'),
('cliente', 'usuario que accede a los servicios que ofrece el supermercado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario_persona`
--

CREATE TABLE IF NOT EXISTS `tipo_usuario_persona` (
  `tipo` varchar(30) NOT NULL,
  `documento` varchar(15) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_usuario_persona`
--

INSERT INTO `tipo_usuario_persona` (`tipo`, `documento`, `fecha`) VALUES
('administrador', '1', '2015-10-31'),
('administrador', '109378001', '2015-11-06'),
('administrador', '1093780010212', '2015-11-06'),
('administrador', '1093780012', '2015-11-06'),
('administrador', '10937800123', '2015-11-09'),
('administrador', '12', '2015-10-31'),
('administrador', '2', '2015-10-31'),
('administrador', '3', '2015-10-31'),
('administrador', '4', '2015-10-31'),
('cliente', '1', '2015-10-31'),
('cliente', '103780013', '2015-11-06'),
('cliente', '1093780001', '2015-11-06'),
('cliente', '10937800102', '2015-11-06'),
('cliente', '109378001021', '2015-11-06'),
('cliente', '1093780010212', '2015-11-06'),
('cliente', '109378001021212', '2015-11-06'),
('cliente', '10937800123', '2015-11-09'),
('cliente', '123', '2015-10-31'),
('cliente', '2', '2015-10-31'),
('cliente', '3', '2015-10-31'),
('cliente', '4', '2015-10-31');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`marca`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documento` (`documento`);

--
-- Indices de la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD PRIMARY KEY (`id_pedido`,`codigo_producto`),
  ADD KEY `FK_Pedido_producto_codigo_producto` (`codigo_producto`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`documento`),
  ADD UNIQUE KEY `UQ_Cliente_email` (`email`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `UQ_nombre` (`nombre`),
  ADD KEY `marca` (`marca`),
  ADD KEY `FK_Producto_Tipo_producto` (`tipo_producto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`empresa_proveedor`),
  ADD UNIQUE KEY `UQ_Proveedor_email` (`email`);

--
-- Indices de la tabla `proveedor_producto`
--
ALTER TABLE `proveedor_producto`
  ADD PRIMARY KEY (`empresa_proveedor`,`codigo_producto`),
  ADD KEY `codigo_producto` (`codigo_producto`),
  ADD KEY `empresa_proveedor` (`empresa_proveedor`);

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`tipo_producto`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`tipo`);

--
-- Indices de la tabla `tipo_usuario_persona`
--
ALTER TABLE `tipo_usuario_persona`
  ADD PRIMARY KEY (`tipo`,`documento`),
  ADD KEY `documento` (`documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_Pedido_Cliente` FOREIGN KEY (`documento`) REFERENCES `persona` (`documento`);

--
-- Filtros para la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD CONSTRAINT `FK_Pedido_producto_codigo_producto` FOREIGN KEY (`codigo_producto`) REFERENCES `producto` (`codigo`),
  ADD CONSTRAINT `pedido_producto_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FK_Producto_Marca` FOREIGN KEY (`marca`) REFERENCES `marca` (`marca`),
  ADD CONSTRAINT `FK_Producto_Tipo_producto` FOREIGN KEY (`tipo_producto`) REFERENCES `tipo_producto` (`tipo_producto`);

--
-- Filtros para la tabla `proveedor_producto`
--
ALTER TABLE `proveedor_producto`
  ADD CONSTRAINT `FK_proveedor_producto_Producto` FOREIGN KEY (`codigo_producto`) REFERENCES `producto` (`codigo`),
  ADD CONSTRAINT `FK_proveedor_producto_Proveedor` FOREIGN KEY (`empresa_proveedor`) REFERENCES `proveedor` (`empresa_proveedor`);

--
-- Filtros para la tabla `tipo_usuario_persona`
--
ALTER TABLE `tipo_usuario_persona`
  ADD CONSTRAINT `tipo_usuario_persona_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `tipo_usuario` (`tipo`),
  ADD CONSTRAINT `tipo_usuario_persona_ibfk_2` FOREIGN KEY (`documento`) REFERENCES `persona` (`documento`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
