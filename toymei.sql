-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-10-2016 a las 05:37:58
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `toymei`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio`
--

CREATE TABLE IF NOT EXISTS `ejercicio` (
`idEjercicio` int(100) NOT NULL,
  `nombreEjercicio` varchar(1000) NOT NULL,
  `repeticiones` int(100) DEFAULT NULL,
  `tiempo` int(100) DEFAULT NULL,
  `idPaciente` int(100) NOT NULL,
  `termino` tinyint(1) NOT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `fechaAsignacion` date NOT NULL,
  `fechaRealizado` date DEFAULT NULL,
  `idMedico` int(100) NOT NULL,
  `fechaEliminacion` date DEFAULT NULL,
  `tipoEjercicio` int(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ejercicio`
--

INSERT INTO `ejercicio` (`idEjercicio`, `nombreEjercicio`, `repeticiones`, `tiempo`, `idPaciente`, `termino`, `eliminado`, `fechaAsignacion`, `fechaRealizado`, `idMedico`, `fechaEliminacion`, `tipoEjercicio`) VALUES
(1, 'ejeercicio1', 22, 12, 0, 0, 0, '0000-00-00', '0000-00-00', 0, '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE IF NOT EXISTS `pacientes` (
  `id` varchar(100) NOT NULL,
  `cedula` int(100) NOT NULL,
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
('08669534-56a7-0ece-c85b-fd2c08065c3b', 1, 2, 'Luis', 'Sanchez', '10/20/2016', '1990-01-11', 'luis@mail.com', 'contrasena_vacio', 1),
('0aa8b30b-e723-7b2e-aee0-853832facbdf', 12312, 2, 'daniel', 'loli', '10/22/2016', '1994-11-11', 'daparamo@hotmail.com', '$2a$10$2SzpX2z0bSneqo5JlbybouXxwYiBQ5G2l5V9GqgPdmqgXrmns6z5i', 1),
('2983dd63-3df5-da2e-64cf-26f8aa4cff60', 9, 25, 'Didier', 'Sanchez', '10/20/2016', '1996-05-05', 'didier@mail.com', 'contrasena_vacio', 0),
('2eff0823-1df8-b2cd-ea54-d9484d67a809', 7, 25, 'Raul', 'Sanchez', '10/20/2016', '1996-05-04', 'raul@mail.com', 'contrasena_vacio', 0),
('3d8f3432-b61c-d329-944f-55cf15c91816', 1212, 2, 'daniel', 'lol', '10/22/2016', '1995-12-11', 'lol@mail.com', 'contrasena_vacio', 0),
('40074bc8-40a2-8083-18a8-137d143d9b8c', 455454, 28, 'Luis', 'dsfasffa', '10/22/2016', '0213-03-21', 'luis.udec.sanchez@hotmail.com', '$2a$10$hSEID49FuCLJmSHZlnh4/.mIMBvgbIEajyTSMnVxYt5Ei4iIilut2', 0),
('40698d80-2f75-95c9-8d64-78a72fb3d977', 366, 2, 'lola', 'drones', '10/22/2016', '1998-12-12', 'ha@lol.com', 'contrasena_vacio', 0),
('46b5f924-f8eb-7b84-6f33-dbe538fde735', 89, 24, 'Fernando', 'Martinez', '10/20/2016', '0005-05-05', 'sad@mail.com', 'contrasena_vacio', 1),
('46f01e3f-4c96-f4c6-6625-453d8a50616c', 2, 2, 'Daniel', 'Paramo', '10/20/2016', '0666-05-05', 'daparamo@mail.com', 'contrasena_vacio', 1),
('529ed96e-97fe-fef5-b516-1998c1224fa6', 10, 24, 'Alejauu', 'Sarmiento', '10/20/2016', '1990-04-04', '11@mail.com', 'contrasena_vacio', 1),
('5801d504-eb0d-e651-fd3a-4931992c5214', 1077086466, 2, 'Luis', 'Sanchez', '10/22/2016', '2012-01-01', 'luis@mail.com', '$2a$10$c0fbD3GIOYtYH7.651FT1uFeLLg8veZ9rGW0JMejHYW8RmQIxYUIe', 0),
('6695ec97-0f1a-da43-1ef1-6d9a3caf0b59', 1, 2, 'Luis', 'Sanchez', '10/20/2016', '1992-04-04', 'luis@mail.com', 'contrasena_vacio', 1),
('69fa1460-1e68-864b-3e97-53d40e501d70', 11, 24, 'maria', 'Sanchez', '10/20/2016', '2001-08-23', '11@mail.com', 'contrasena_vacio', 1),
('6d8e0807-1a33-1490-c1de-0cd94347327c', 123, 2, 'damm', 'deam', '10/22/2016', '1994-12-12', 'daparamo@hotmail.com', '$2a$10$KV7hZVzNeNYENkAhpENsOO2SmaIOps.j3HOi6R52HHysbyfpLoWRS', 1),
('7a1aaa86-e8d1-5dbc-e926-fb884789600b', 1077086466, 28, 'Luis', 'sad', '10/22/2016', '0213-03-21', 'sadadadas@mail.com', 'contrasena_nueva', 0),
('7b23be6b-35da-f40f-0742-6d81556da0f6', 14, 24, 'as', 'a', '10/20/2016', '0004-04-04', 'asff@mail.com', 'contrasena_vacio', 1),
('7c7f480e-ec44-310a-0f4c-68262889fd85', 2, 2, 'Carolina', 'Guzman', '10/20/2016', '1789-04-04', 'guzman@mail.com', 'contrasena_vacio', 1),
('851d95c4-4061-7583-ed96-c099ab37568a', 33, 28, 'Luis', 'sad', '10/22/2016', '0213-03-21', '33@mail.com', 'contrasena_nueva', 0),
('8534a0a0-e965-1396-aeaa-8e6fbdbfe941', 4444, 24, 'Fernando', 'Martinez', '10/20/2016', '1998-05-05', '444@mail.com', 'contrasena_vacio', 1),
('9a31078a-4c48-e162-a966-b87dc198b608', 22, 2, 'daniel', 'lol', '10/22/2016', '1992-11-11', 'daparam07@gmail.com', '$2a$10$4Nur35bSMnSKBiOvD2FysOaxMqi/luwfN9bfTLnpVnB.RA7LqG/Pm', 1),
('9cbe2844-4978-29b2-3eee-e5ce46996f0c', 1, 2, 'Daniel', 'Sanchez', '10/22/2016', '2015-02-01', 'sadas@mail.com', '$2a$10$r8wJ0SV1bdk2COpwnbjt9.BXUCQK4kObFVUZI8Fkb2PKYI2qgBuNi', 0),
('a2dd0fd8-1641-7a0c-98c0-42c7a8fe8cdc', 34353, 2, 'adsasd', 'asdsad', '10/22/2016', '1992-11-11', 'Dl@lol.com', '$2a$10$G3h0R4RljECev6XOEQodaOloyXEsxXynM1IB1n2ekWH4tjqG3qX1m', 1),
('a4b27c85-0c75-7a88-d9dd-2cab2f6a67d6', 11, 24, 'Wilson', 'Forero', '10/20/2016', '1999-05-05', 'wilson@mail.com', 'contrasena_vacio', 1),
('bdaa1e0b-a40d-cc4d-f1ea-c8a0a8132c23', 123123, 2, 'da', 'das', '10/22/2016', '0111-11-11', 'das@das.com', 'contrasena_vacio', 1),
('bf2987d8-a367-85a1-9e22-635fd853c100', 8, 25, 'Ernesto', 'Villa', '10/20/2016', '1852-05-05', 'ernesto@mail.com', 'contrasena_vacio', 0),
('bfd746d8-b597-645f-4cc7-831fe6710ea0', 77, 24, '11111111', 'Paramo', '10/20/2016', '1975-05-05', '11@mail.com', 'contrasena_vacio', 0),
('c50d518f-c720-69dd-9f42-c3866c2dae91', 1, 28, 'Luis', 'sad', '10/22/2016', '0213-03-21', 'sdad@mail.com', 'contrasena_nueva', 0),
('c58f16d1-2a28-1377-f2bb-73b4321f2327', 2, 2, 'Daniel', 'Paramo', '10/20/2016', '1992-09-19', 'daniel@mail.com', 'contrasena_vacio', 1),
('d276c89d-5b5c-a0b9-bea0-d4f740932bc1', 5, 24, 'Camila', 'Suarez', '10/20/2016', '1980-08-05', 'camila@mail.com', 'contrasena_vacio', 1),
('d28cc9d3-a496-f3fa-5eb3-e60967eb2843', 3, 2, 'Edwin', 'silva', '10/20/2016', '2013-11-30', 'daniel@mail.com', 'contrasena_vacio', 1),
('e3d45751-cc37-ba2f-cdbf-22482ea6c075', 6565, 2, 'dfg', 'dfg', '10/22/2016', '1994-11-11', 'daparamo@hotmail.com', '$2a$10$scdYuFabLB.PZXqt0qMGXOcFaArbiheaNNFcuwwaxAnh7qqUhWrpK', 1),
('e673b705-418c-a482-4de4-fd3ac05941e8', 11, 24, 'Hola', 'Paola', '10/20/2016', '2000-02-01', '14144@mail.com', 'contrasena_vacio', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `todos`
--

CREATE TABLE IF NOT EXISTS `todos` (
`llave` int(11) unsigned NOT NULL,
  `id` varchar(50) DEFAULT NULL,
  `idusuario` int(10) DEFAULT NULL,
  `estado` int(5) NOT NULL DEFAULT '1',
  `task` varchar(100) DEFAULT NULL,
  `finish` int(2) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `tiempo` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

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

CREATE TABLE IF NOT EXISTS `users` (
`idusuario` int(100) unsigned NOT NULL,
  `nombre` varchar(100) DEFAULT '',
  `usuario` varchar(100) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha` varchar(20) DEFAULT NULL,
  `fecha_tiempo` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`idusuario`, `nombre`, `usuario`, `clave`, `email`, `fecha`, `fecha_tiempo`) VALUES
(2, 'Luis', 'luis', '$2a$10$AuOPFoq4KP7.pYNHJvGNSO/vHdtCSmqvaBdflRKbefRneIRPkUry2', 'luis@mail.com', '10/16/2016', NULL),
(19, 'aa', 'asdadsada', '$2a$10$sEBacc3xV.IxZzGhlXCFluQ.MHrhhnEIIZMLakkVkgV57.UwhiMxC', 'luis.udec.sanchez@hotmail.com', '10/17/2016', NULL),
(20, 'lol', 'lol', '$2a$10$tpopzKj5kgRadU2ccmibAONzXxTcycUWaWdfdPi1HcqYu2EQtarVm', 'luis.udec.sanchez@gmail.com', '10/18/2016', NULL),
(22, 'daniel', 'daniel', '$2a$10$79PGoIdfQdcHGBupT76XFuEPyBmskzGgPa0jVdMsm54UofMWxo.56', 'daparamo@mail.com', '10/18/2016', NULL),
(23, 'da', 'da', '$2a$10$eFNCsSw.yJIdGgDcjvV1d.Oj15PRD0xvhKd0jY7UN0dDTqMIi7ypC', 'da@mail.com', '10/19/2016', NULL),
(24, 'Medico 1', 'medico1', '$2a$10$BLbigrcNPTkRS3H3vJ4e5ODZbD7l3dPNusSpDN4XQImM0UpHhMzKi', 'medico1@mail.com', '10/20/2016', NULL),
(25, 'Medico2', 'medico2', '$2a$10$M2WMSuf.JKJ3b7foDn5zMOPnbcKbzhyDXudKoQjbx7RPYNvgQz.de', 'medico2@mail.com', '10/20/2016', NULL),
(26, 'Felipe', 'felipe', '$2a$10$dITXilio4meJ/RfXXSqGIOg936X6A5K7SV8uYbnQTk3N4Nhc5YxjC', 'lopez@mail.com', '10/20/2016', NULL),
(27, 'undefined', 'undefined', '$2a$10$MpptLsOf/WUmjxXyYNLh2uBOgniccx/q.ii8WWID3JakRc8xsuj5a', 'sdad', '10/20/2016', NULL),
(28, 'loooooool', 'loladrones', '$2a$10$tC7iRA4uyBwxwdbT83/Eo.Z6GYP5txWrpeBqeKATPCYXR/9S4LMaO', 'sdadsadqwe21@mail.com', '10/22/2016', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
 ADD PRIMARY KEY (`idEjercicio`);

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
-- AUTO_INCREMENT de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
MODIFY `idEjercicio` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `todos`
--
ALTER TABLE `todos`
MODIFY `llave` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
MODIFY `idusuario` int(100) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
