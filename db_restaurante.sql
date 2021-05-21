-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2021 a las 00:28:12
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_direcciones`
--

CREATE TABLE `tbl_direcciones` (
  `ID_DIRECCION` int(11) NOT NULL,
  `DIRECCION` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_direcciones`
--

INSERT INTO `tbl_direcciones` (`ID_DIRECCION`, `DIRECCION`) VALUES
(0, 'Barrio Lourdes'),
(1, 'Barrio Lourdes'),
(2, 'Barrio Los Lirios'),
(3, 'Barrio Cabañas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_envios`
--

CREATE TABLE `tbl_envios` (
  `ID_ENVIO` int(11) NOT NULL,
  `DESCRIPCION_ENVIO` varchar(300) NOT NULL,
  `FECHA` date NOT NULL,
  `DIRECCION_ID` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_envios`
--

INSERT INTO `tbl_envios` (`ID_ENVIO`, `DESCRIPCION_ENVIO`, `FECHA`, `DIRECCION_ID`) VALUES
(1, 'Almoada de Plumas', '2021-05-26', 1),
(2, 'Cinta Adhesiva', '2021-05-24', 2),
(3, 'Zapatillas', '2021-05-24', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_facturas`
--

CREATE TABLE `tbl_facturas` (
  `ID_FACTURA` int(11) NOT NULL,
  `DESCRIPCION_FACTURA` varchar(200) NOT NULL,
  `FECHA_FACTURA` date NOT NULL,
  `DIRECCION_ID` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_facturas`
--

INSERT INTO `tbl_facturas` (`ID_FACTURA`, `DESCRIPCION_FACTURA`, `FECHA_FACTURA`, `DIRECCION_ID`) VALUES
(1, 'Compra de: Almuada de plumas', '2021-05-26', 1),
(2, 'Compra de: Cinta Adhesiva', '2021-05-25', 2),
(3, 'Compra de: zapatillas', '2021-05-25', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inventario`
--

CREATE TABLE `tbl_inventario` (
  `ID_PRODUCTO` int(5) NOT NULL,
  `PRODUCTO` varchar(100) NOT NULL,
  `PRECIO` double NOT NULL,
  `DIRECCION_ID` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_inventario`
--

INSERT INTO `tbl_inventario` (`ID_PRODUCTO`, `PRODUCTO`, `PRECIO`, `DIRECCION_ID`) VALUES
(1, 'Almoada de plumas', 150, 1),
(2, 'Cinta Adhesiva', 90, 2),
(3, 'Zapatillas', 260, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pedidos`
--

CREATE TABLE `tbl_pedidos` (
  `ID_PEDIDO` int(11) NOT NULL,
  `DESCRIPCION_PEDIDO` varchar(200) NOT NULL,
  `FECHA_PEDIDO` date NOT NULL,
  `DIRECCION_ID` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_pedidos`
--

INSERT INTO `tbl_pedidos` (`ID_PEDIDO`, `DESCRIPCION_PEDIDO`, `FECHA_PEDIDO`, `DIRECCION_ID`) VALUES
(1, 'Se pide una almoada de plumas de ciento cincuenta', '2021-05-26', 1),
(2, 'Cinta Adhesiva de noveta lempiras', '2021-05-25', 2),
(3, 'Zapatillas de dociento cincuenta lempiras', '2021-05-24', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_direcciones`
--
ALTER TABLE `tbl_direcciones`
  ADD PRIMARY KEY (`ID_DIRECCION`);

--
-- Indices de la tabla `tbl_envios`
--
ALTER TABLE `tbl_envios`
  ADD PRIMARY KEY (`ID_ENVIO`),
  ADD KEY `DIRECCION_ID` (`DIRECCION_ID`);

--
-- Indices de la tabla `tbl_facturas`
--
ALTER TABLE `tbl_facturas`
  ADD PRIMARY KEY (`ID_FACTURA`),
  ADD KEY `DIRECCION_ID` (`DIRECCION_ID`);

--
-- Indices de la tabla `tbl_inventario`
--
ALTER TABLE `tbl_inventario`
  ADD PRIMARY KEY (`ID_PRODUCTO`),
  ADD KEY `DIRECCION_ID` (`DIRECCION_ID`);

--
-- Indices de la tabla `tbl_pedidos`
--
ALTER TABLE `tbl_pedidos`
  ADD PRIMARY KEY (`ID_PEDIDO`),
  ADD KEY `DIRECCION_ID` (`DIRECCION_ID`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_envios`
--
ALTER TABLE `tbl_envios`
  ADD CONSTRAINT `tbl_envios_ibfk_1` FOREIGN KEY (`DIRECCION_ID`) REFERENCES `tbl_direcciones` (`ID_DIRECCION`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_facturas`
--
ALTER TABLE `tbl_facturas`
  ADD CONSTRAINT `tbl_facturas_ibfk_1` FOREIGN KEY (`DIRECCION_ID`) REFERENCES `tbl_direcciones` (`ID_DIRECCION`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_inventario`
--
ALTER TABLE `tbl_inventario`
  ADD CONSTRAINT `tbl_inventario_ibfk_1` FOREIGN KEY (`DIRECCION_ID`) REFERENCES `tbl_direcciones` (`ID_DIRECCION`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_pedidos`
--
ALTER TABLE `tbl_pedidos`
  ADD CONSTRAINT `tbl_pedidos_ibfk_1` FOREIGN KEY (`DIRECCION_ID`) REFERENCES `tbl_direcciones` (`ID_DIRECCION`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
