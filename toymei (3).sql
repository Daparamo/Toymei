-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-10-2016 a las 03:43:10
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
('60c16b31-8fac-e165-9eec-0f6ac74581e3', '15bce545-67a0-85d3-4f2c-31b909462dc2', 1, 'Ejericcio 90 grados', '10/25/2016', 100, 'estiramiento', 0, '', '', 0, 0, '[{"x":-21.141573385620944,"y":86.15316791028813,"z":-144.11510261571146},{"x":70.59488144393714,"y":28.121677711246495,"z":149.38335726398827}]', 0),
('61383545-dc65-600d-1038-627d842cee00', '15bce545-67a0-85d3-4f2c-31b909462dc2', 1, 'Estiramiento 1', '10/25/2016', 500, 'estiramiento', 0, '', '', 0, 0, '[{"x":-155.85721853022636,"y":18.15199621355606,"z":396.9337191966323},{"x":-114.00867181794267,"y":51.69581505496707,"z":-372.72409664933207}]', 0),
('68791263-1548-d9ff-6b6c-ec61353b4262', 'faee1baa-a415-46a2-d2c0-21eee23f7a67', 1, 'ejercicio_frank', '10/25/2016', 200, 'ejercitar', 200, '', '', 0, 0, '[{"x":-271.16342865266336,"y":17.18030001841607,"z":-393.14794424575666},{"x":235.55970705230322,"y":163.37599408749014,"z":-161.27737295298698}]', 0),
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
('15bce545-67a0-85d3-4f2c-31b909462dc2', '1', 1, 'Luis', 'Sanchez', '10/25/2016', '1993-09-04', 'luis.udec.sanchez@hotmail.com', '$2a$10$irPFXtyhpUGJkr9tMOEOMOwVtREeJTOTW6TuqgQfs/GiKD8C5Dnru', 0),
('8a72ceb8-4926-0b33-d60a-b7604622a10f', '3', 1, 'Paciente', '3', '10/26/2016', '2000-04-04', 'paciente3@mail.com', '$2a$10$77D9KDK33ZeQ9c5ZlxNo6OcYSDY9528vvgHoUAqSyvQi1iP2NHfKa', 1),
('faee1baa-a415-46a2-d2c0-21eee23f7a67', '2', 1, 'Frank', 'Lombana', '10/25/2016', '2000-04-04', 'franklyn.sis@hotmail.com', '$2a$10$uOWLe1SQDsEDbwxwBIVRcOWInninLGlU6qBmf6Y8OncAUkjwQsOvC', 0);

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
  `fecha` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`idusuario`, `nombre`, `usuario`, `clave`, `email`, `fecha`) VALUES
(1, 'Luis Sanchez', 'luis', '$2a$10$MhodHx6wgVZkUacz/eRAMOAUk7Vmw/O9CRqkhjwpcmtKW5O1sKdSK', 'luis.udec.sanchez@hotmail.com', '10/26/2016');

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
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `idusuario` int(100) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
