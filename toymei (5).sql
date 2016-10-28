-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2016 a las 11:12:57
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
  `termino` tinyint(1) NOT NULL,
  `coordenadas` varchar(2000) NOT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `imagen_ejercicio` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ejercicio`
--

INSERT INTO `ejercicio` (`id_ejercicio`, `id_paciente`, `id_medico`, `nombre_ejercicio`, `fecha_inicio`, `tiempo`, `tipo`, `repeticiones`, `termino`, `coordenadas`, `eliminado`, `imagen_ejercicio`) VALUES
('1e74e3b1-446e-b9e8-6483-356f6b5984f1', '42b82c48-c94b-0c68-fc11-f8b72dfa61d9', 1, 'sadad', '10/27/2016', 10, 'Ejercitar', 10, 0, '[{"x":102.58400740259725,"y":47.06396926017595,"z":29.73611279739039},{"x":-145.4539539118879,"y":14.962597236830984,"z":91.69983062845488}]', 0, ''),
('41ecf8d9-5560-33b6-13b1-ea48605a4320', '42b82c48-c94b-0c68-fc11-f8b72dfa61d9', 1, 'Ejercitar 30 grados', '10/27/2016', 20, 'Ejercitar', 10, 0, '[{"x":32.00870138320545,"y":15.147893568125825,"z":185.83716086846033},{"x":133.89631119365822,"y":22.81316734734077,"z":120.21591770352092}]', 1, ''),
('4521e8ce-6f88-5c7c-c3f7-d79309135379', 'd3b19153-5de7-ab3d-5c0b-bdd62f46a84e', 1, 'ssad', '10/27/2016', 80, 'Ejercitar', 11100, 0, '[{"x":-14.589509475242835,"y":26.31550400129221,"z":74.17754513835413},{"x":68.02047781544206,"y":31.097159371134474,"z":221.7985983783476}]', 1, ''),
('46410639-55d2-4df2-c198-d4c166304328', '42b82c48-c94b-0c68-fc11-f8b72dfa61d9', 1, 'Ejercitar 2', '10/27/2016', 120, 'Ejercitar', 120, 0, '', 1, ''),
('53146bb5-dca1-f0cf-4fa4-52b8f0f9b7bf', 'befd6515-6191-ae1d-d94d-9cfc9810e210', 1, 'Ejercitar 2', '10/27/2016', 700, 'Ejercitar', 10, 0, '[{"x":82.13953766436879,"y":21.740737902965932,"z":-417.0870837854932},{"x":-124.39721084945569,"y":44.126359327738356,"z":-93.46361763605111}]', 1, ''),
('703b8058-54b0-a6ef-2bfe-89119768a465', 'd3b19153-5de7-ab3d-5c0b-bdd62f46a84e', 1, 'Hola', '10/27/2016', 10, 'Ejercitar', 10, 0, '', 0, ''),
('705de883-d933-85e1-486f-9e871bef864f', 'befd6515-6191-ae1d-d94d-9cfc9810e210', 1, 'Estirar 2', '10/27/2016', 500, 'Estiramiento', 0, 0, '[{"x":82.13953766436879,"y":21.740737902965932,"z":-417.0870837854932},{"x":-124.39721084945569,"y":44.126359327738356,"z":-93.46361763605111}]', 1, ''),
('7caf7fc0-86cd-1d3b-d670-cc2a710a8677', 'd3b19153-5de7-ab3d-5c0b-bdd62f46a84e', 1, 'Hola', '10/27/2016', 100, 'Estiramiento', 0, 0, '', 0, ''),
('80058378-70c8-4a1b-58a1-2f912eb03cb6', '42b82c48-c94b-0c68-fc11-f8b72dfa61d9', 1, 'Estirar 2', '10/27/2016', 800, 'Estiramiento', 0, 0, '[{"x":82.13953766436879,"y":21.740737902965932,"z":-417.0870837854932},{"x":-124.39721084945569,"y":44.126359327738356,"z":-93.46361763605111}]', 1, ''),
('8d51e553-628a-5263-93a6-ebfe03c2ea49', 'd3b19153-5de7-ab3d-5c0b-bdd62f46a84e', 1, '1', '10/27/2016', 1, 'Estiramiento', 0, 0, '', 1, ''),
('9c6630a8-0337-7905-5f08-26bbe07f3b39', '42b82c48-c94b-0c68-fc11-f8b72dfa61d9', 1, 'Ejercitar 1', '10/27/2016', 100, 'Ejercitar', 30, 0, '', 1, ''),
('a266ec48-639d-fc77-2089-b653129d1f9f', 'd3b19153-5de7-ab3d-5c0b-bdd62f46a84e', 1, '1', '10/27/2016', 1, 'Estiramiento', 0, 0, '', 1, ''),
('dd3a0da6-7e31-a2cf-b1a9-b9684b900ae2', 'd3b19153-5de7-ab3d-5c0b-bdd62f46a84e', 1, 'Estirar 45 grados', '10/27/2016', 50, 'Estiramiento', 0, 0, '', 1, ''),
('e70c9fdb-d1aa-bf06-f242-58e92cc4ecae', 'befd6515-6191-ae1d-d94d-9cfc9810e210', 1, 'Ejercitar 1', '10/27/2016', 900, 'Ejercitar', 20, 0, '[{"x":82.13953766436879,"y":21.740737902965932,"z":-417.0870837854932},{"x":-124.39721084945569,"y":44.126359327738356,"z":-93.46361763605111}]', 1, ''),
('e74d838f-e114-52c9-c64a-8692f5498063', '42b82c48-c94b-0c68-fc11-f8b72dfa61d9', 1, 'Estira5555556', '10/27/2016', 60, 'Estiramiento', 0, 0, '', 1, ''),
('e7fb91b1-3fe0-da55-2018-96612c82d53b', 'd3b19153-5de7-ab3d-5c0b-bdd62f46a84e', 1, 'aa', '10/27/2016', 20, 'Estiramiento', 0, 0, '', 1, ''),
('f3a5073e-53ac-fde6-13d8-dcaa5281f623', 'd3b19153-5de7-ab3d-5c0b-bdd62f46a84e', 1, 'Ejercicio 90 grados', '10/27/2016', 40, 'Ejercitar', 20, 0, '[{"x":2.468916441003497,"y":146.05099583588745,"z":-57.11518015126771},{"x":-280.86811937449727,"y":119.51497678144571,"z":-94.82278793633319}]', 1, ''),
('f67d2eac-59b8-e9e7-c3f0-1179cde661a2', 'b1a5b577-b401-d05a-5431-cc6028694b58', 1, '454kk', '10/27/2016', 540, 'Ejercitar', 3213, 0, '[{"x":-14.589509475242835,"y":26.31550400129221,"z":74.17754513835413},{"x":68.02047781544206,"y":31.097159371134474,"z":221.7985983783476}]', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informes`
--

CREATE TABLE `informes` (
  `id_informe` varchar(100) NOT NULL,
  `id_medico` int(100) NOT NULL,
  `id_ejercicio` varchar(100) NOT NULL,
  `id_paciente` varchar(100) NOT NULL,
  `fecha_inicio` varchar(100) NOT NULL,
  `fecha_finalizacion` varchar(100) NOT NULL,
  `termino_correctamente` tinyint(1) NOT NULL,
  `termino` tinyint(1) NOT NULL,
  `observaciones` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `informes`
--

INSERT INTO `informes` (`id_informe`, `id_medico`, `id_ejercicio`, `id_paciente`, `fecha_inicio`, `fecha_finalizacion`, `termino_correctamente`, `termino`, `observaciones`) VALUES
('intento_1', 2, '1e74e3b1-446e-b9e8-6483-356f6b5984f1', '42b82c48-c94b-0c68-fc11-f8b72dfa61d9', 'Fri Oct 28 2016 01:32:37 GMT-0500 (Hora est. Pacífico, Sudamérica)', 'Fri Oct 28 2016 01:37:37 GMT-0500 (Hora est. Pacífico, Sudamérica)', 0, 0, ''),
('intento_2', 1, '1e74e3b1-446e-b9e8-6483-356f6b5984f1', '42b82c48-c94b-0c68-fc11-f8b72dfa61d9', 'Fri Oct 28 2016 02:32:37 GMT-0500 (Hora est. Pacífico, Sudamérica)', 'Fri Oct 28 2016 02:37:37 GMT-0500 (Hora est. Pacífico, Sudamérica)', 0, 0, ''),
('intento_3', 1, '1e74e3b1-446e-b9e8-6483-356f6b5984f1', '42b82c48-c94b-0c68-fc11-f8b72dfa61d9', 'Fri Oct 28 2016 03:32:37 GMT-0500 (Hora est. Pacífico, Sudamérica)', 'Fri Oct 28 2016 03:37:37 GMT-0500 (Hora est. Pacífico, Sudamérica)', 1, 1, ''),
('intento_5', 1, '4521e8ce-6f88-5c7c-c3f7-d79309135379', 'd3b19153-5de7-ab3d-5c0b-bdd62f46a84e', 'Fri Oct 28 2016 02:57:30 GMT-0500 (Hora est. Pacífico, Sudamérica)', 'Fri Oct 28 2016 03:57:30 GMT-0500 (Hora est. Pacífico, Sudamérica)', 0, 0, ''),
('intento_6', 1, '7caf7fc0-86cd-1d3b-d670-cc2a710a8677', 'd3b19153-5de7-ab3d-5c0b-bdd62f46a84e', 'Fri Oct 28 2016 03:57:30 GMT-0500 (Hora est. Pacífico, Sudamérica)', 'Fri Oct 28 2016 04:57:30 GMT-0500 (Hora est. Pacífico, Sudamérica)', 1, 1, ''),
('intento_7', 1, 'e70c9fdb-d1aa-bf06-f242-58e92cc4ecae', 'befd6515-6191-ae1d-d94d-9cfc9810e210', 'Fri Oct 28 2016 03:57:30 GMT-0500 (Hora est. Pacífico, Sudamérica)', 'Fri Oct 28 2016 04:57:30 GMT-0500 (Hora est. Pacífico, Sudamérica)', 1, 1, '');

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
('02e10379-94c9-e552-1e2a-b123b7567baf', '7', 1, 'Paciente', '7', '10/26/2016', '2000-04-04', 'paciente7@mail.co', '$2a$10$FX9Q3zE3OSptCMfwN3ZRfe3Vh7V3.9LwA00xCpHo6C.E36uh2Ab9G', 0),
('2b8265ad-0a4e-dd7d-5c8b-02a974145953', 'undefined', 1, 'undefined', 'undefined', '10/27/2016', 'undefined', 'undefined', 'contrasena_nueva', 1),
('42b82c48-c94b-0c68-fc11-f8b72dfa61d9', '1', 1, 'Luis', 'Sanchez', '10/26/2016', '2000-04-04', 'luis.udec.sanchez@hotmail.com', '$2a$10$lfySESCI4wff/ItCBPvD7.R2duXemJnQHhPYfPFVNYzRmboBTJSlq', 0),
('52427d27-8763-60f8-9fcf-5f9fbc49f7ac', '3', 1, 'Paciente', '3', '10/26/2016', '1995-05-05', 'paciente3@mail.com', '$2a$10$DABm3pinBX28CDXkTiGmcuE5/eMFcAyG6uFjCgTByFXCuYFqxJm0u', 0),
('6c96c393-5909-edac-4066-d137015923cd', '2', 1, 'Paciente', '2', '10/26/2016', '2000-04-04', 'paciente2@mail.com', '$2a$10$RhmYJ.oWj8NjwqtIobs4EeeYgA/1PYLwEHuGAc5YSX40.TtAKc8U.', 0),
('6ef5f053-1430-0ebe-4f32-b78aaf152b84', '6', 1, 'Paciente', '6', '10/26/2016', '1991-06-06', 'paciente6@mail.com', '$2a$10$bOHJqHzhttw8XqQTJBAZXOjUeqZfwShiINSh2DHRciYXcDJSXvPBO', 0),
('b1a5b577-b401-d05a-5431-cc6028694b58', '5', 1, 'Paciente', '5', '10/26/2016', '1996-04-04', 'paciente5@mail.com', '$2a$10$NNrHUJSybphUklkczeAzEuarRb4O7a9FRy9/lhe5sbOsdEwmYwyca', 0),
('befd6515-6191-ae1d-d94d-9cfc9810e210', '4', 1, 'Andres', 'Rodriguez', '10/26/2016', '1999-04-04', 'alberto@mail.com', '$2a$10$5aS8jQtsgNyD6fZdZ6kb6egfbhKNIlVY2NMDlR7RXVk2jCO6opQ12', 0),
('d3b19153-5de7-ab3d-5c0b-bdd62f46a84e', '8', 1, 'Paciente', '8', '10/26/2016', '1993-04-04', 'paciente8@mail.com', '$2a$10$ZUvEDpj6OKJspZFraTfpQuXE5GbPufwY7RBMXiDySL3nCd3zjJqV.', 0);

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
(1, 'Luis Medico', 'luis', '$2a$10$B/z6SBF1E8LKAKS0vs0Jyui3XR7v5zErPBYzcsyxnKtcemluauuMi', 'luis.udec.sanchez@gmail.com', '10/26/2016');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  ADD PRIMARY KEY (`id_ejercicio`);

--
-- Indices de la tabla `informes`
--
ALTER TABLE `informes`
  ADD PRIMARY KEY (`id_informe`);

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
