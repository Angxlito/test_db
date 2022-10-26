-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2022 a las 06:30:32
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Curp` varchar(18) NOT NULL,
  `INE` varchar(18) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Num_telefonico` int(10) NOT NULL,
  `Num_habitacion` varchar(3) NOT NULL,
  `Num_empleado` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `Num_empleado` int(3) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Sexo` varchar(6) NOT NULL,
  `edad` int(2) NOT NULL,
  `Num_telefonico` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `Num_habitacion` varchar(3) NOT NULL,
  `Num_piso` int(2) NOT NULL,
  `Costo_dia` int(4) NOT NULL,
  `Nombre` varchar(15) NOT NULL,
  `Tipo_habitacion` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Curp`),
  ADD KEY `Atencion_empleado` (`Num_empleado`),
  ADD KEY `Habitacion_asignada` (`Num_habitacion`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`Num_empleado`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`Num_habitacion`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `Habitacion_asignada` FOREIGN KEY (`Num_habitacion`) REFERENCES `habitacion` (`Num_habitacion`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `Atencion_empleado` FOREIGN KEY (`Num_empleado`) REFERENCES `cliente` (`Num_empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
