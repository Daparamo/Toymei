-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2016 a las 02:15:39
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `toymei`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio`
--

CREATE TABLE `ejercicio` (
  `id_ejercicio` varchar(100) NOT NULL,
  `id_paciente` varchar(100) NOT NULL,
  `id_medico` int(100) NOT NULL,
  `nombre_ejercicio` varchar(100) NOT NULL,
  `fecha_inicio` varchar(100) NOT NULL,
  `tiempo` int(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `repeticiones` int(100) NOT NULL,
  `fecha_iniciacion` varchar(100) NOT NULL,
  `fecha_finalizacion` varchar(100) NOT NULL,
  `termino` tinyint(1) NOT NULL,
  `ejercicio_correcto` tinyint(1) NOT NULL,
  `coordenadas` varchar(2000) NOT NULL,
  `eliminado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ejercicio`
--

INSERT INTO `ejercicio` (`id_ejercicio`, `id_paciente`, `id_medico`, `nombre_ejercicio`, `fecha_inicio`, `tiempo`, `tipo`, `repeticiones`, `fecha_iniciacion`, `fecha_finalizacion`, `termino`, `ejercicio_correcto`, `coordenadas`, `eliminado`) VALUES
('61383545-dc65-600d-1038-627d842cee00', '15bce545-67a0-85d3-4f2c-31b909462dc2', 1, 'Estiramiento 1', '10/25/2016', 500, 'estiramiento', 0, '', '', 0, 0, '[{"x":-155.85721853022636,"y":18.15199621355606,"z":396.9337191966323},{"x":-114.00867181794267,"y":51.69581505496707,"z":-372.72409664933207}]', 0),
('a7f00057-1d96-ba8c-784b-658c0b407170', '15bce545-67a0-85d3-4f2c-31b909462dc2', 1, 'Estiramiento 1', '10/25/2016', 120, 'estiramiento', 0, '', '', 0, 0, '[{"x":-155.85721853022636,"y":70.09176963608927,"z":-158.4227357587199},{"x":-114.00867181794267,"y":51.69581505496707,"z":-372.72409664933207}]', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` varchar(100) NOT NULL,
  `cedula` varchar(100) NOT NULL,
  `idusuario` int(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `nacimiento` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `eliminado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `cedula`, `idusuario`, `nombre`, `apellido`, `date`, `nacimiento`, `correo`, `password`, `eliminado`) VALUES
('15bce545-67a0-85d3-4f2c-31b909462dc2', '1', 1, 'Luis', 'Sanchez', '10/25/2016', '1993-09-04', 'luis.udec.sanchez@hotmail.com', '$2a$10$irPFXtyhpUGJkr9tMOEOMOwVtREeJTOTW6TuqgQfs/GiKD8C5Dnru', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `todos`
--

CREATE TABLE `todos` (
  `llave` int(11) UNSIGNED NOT NULL,
  `id` varchar(50) DEFAULT NULL,
  `idusuario` int(10) DEFAULT NULL,
  `estado` int(5) NOT NULL DEFAULT '1',
  `task` varchar(100) DEFAULT NULL,
  `finish` int(2) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `tiempo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `todos`
--

INSERT INTO `todos` (`llave`, `id`, `idusuario`, `estado`, `task`, `finish`, `date`, `tiempo`) VALUES
(3, 'bb6f027d-7347-f331-04c4-e720110fae08', 1, 1, 'a', 0, '10/16/2016', NULL),
(7, '5c971ff3-45e3-2254-cb52-d2ad0c455d9c', 1, 1, 'asdas', 0, '10/17/2016', NULL),
(8, '1b9de752-d8d4-62bb-ca01-2d9718758cd1', 1, 1, 'asdads', 0, '10/17/2016', NULL),
(9, '56f55ec7-3b6e-b757-a1bb-d2cafb4a6fc9', 1, 1, 't', 0, '10/18/2016', NULL),
(13, '1187b013-defc-e8b8-8c68-04b6f0d5bad1', 1, 1, 'hola', 0, '10/18/2016', NULL),
(14, 'd209d9bc-3090-79c7-cade-00e4f1c8942e', 1, 1, 'dsasd', 0, '10/18/2016', NULL),
(15, '8248d3b4-532f-d270-2302-d0c1828f6ce0', 1, 1, 'adsasd', 0, '10/18/2016', NULL),
(17, '3cca7802-2d95-750a-12d6-bc2787f03ce3', 1, 1, 'dsada', 0, '10/18/2016', NULL),
(18, '0bd99be3-10cc-2a8b-4e59-0bf2638a8495', 1, 1, 'prueba holaaaaaaaaaaa', 0, '10/19/2016', NULL),
(20, 'b9e6c8ae-01e8-78e6-d75a-45ee5b833787', 1, 1, 'Hola que hace prueba 123 prueba 123', 0, '10/19/2016', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `idusuario` int(100) UNSIGNED NOT NULL,
  `nombre` varchar(100) DEFAULT '',
  `usuario` varchar(100) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha` varchar(20) DEFAULT NULL,
  `fecha_tiempo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`idusuario`, `nombre`, `usuario`, `clave`, `email`, `fecha`, `fecha_tiempo`) VALUES
(1, 'Luis Alfredo Sanchez Cuitiva', 'luis', '$2a$10$6Tao.yjJR3Fur2CHvHmLNObe/.9EAoyImBkt18QT81adyYuXufEg6', 'luis.udec.sanchez@hotmail.com', '10/24/2016', NULL),
(3, 'fasf', 'luisa', '$2a$10$qAI4aAUjiLRyBhNmaV742.VoMLZQMgIu/7UaqOi3OalFkuHF4C3VO', 'luis@mail.com', '10/24/2016', NULL),
(4, 'dasda', 'sadads', '$2a$10$fH0zzd6tas4yZyTXSlm7mOES4dutgyu.dspIGWICM8f8Y9tBxtUle', 'sdadsaf@mail.com', '10/24/2016', NULL),
(5, 'Daniel', 'Daniel123', '$2a$10$t7UJwE6n0QqC2UpEZlG7HO.KkEK3uFJzvCphRYc8GITUiZ5gfx.CO', 'dapramo@mail.com', '10/24/2016', NULL),
(6, 'Pablo', 'pablo', '$2a$10$lwhpzbRmooGb/.HWreMOLuhw8XAO4qRzhoBuRO9t.2SGdwor7kgR.', 'pablo@mail.com', '10/24/2016', NULL),
(7, 'ttt', 'ttt', '$2a$10$hG3q7oaP1E/bOWedDpbf/./VaKAxsP6MgHAX7matBOkOpjO6Cadw2', 'tt@mail.com', '10/24/2016', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  ADD PRIMARY KEY (`id_ejercicio`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`llave`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `todos`
--
ALTER TABLE `todos`
  MODIFY `llave` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `idusuario` int(100) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
