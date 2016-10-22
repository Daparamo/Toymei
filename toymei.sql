-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-10-2016 a las 01:52:35
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
('08bbfe6e-69aa-290b-c1cc-18f2194df3f3', 3312313, 26, 'ff', 'ff', '10/22/2016', '0332-04-22', 'f@mail.com', 'contrasena_nueva', 1),
('0d66a907-8eb1-e48e-3045-da87dd49477c', 444, 26, 'tttt', 'ttt', '10/22/2016', '0044-04-04', 'luis.udec.sanchez@hotmail.com', '$2a$10$.4rGfWBlyNj369lHhYRCVuWoqjWH5/cYQg2ApHa8.LhFBo.1IpROC', 1),
('0f59f163-cec2-25c4-0b1a-eb909aeda0a4', 1099, 26, 'Daniel', 'Paramo', '10/22/2016', '0033-03-31', 'daparamo@hotmail.com', '$2a$10$qMZCKAV2pm6V5z04qvanIei/If/SMdrDSaskYmDfGnSnF5QsYk.sS', 1),
('117c8ed7-2f31-d45a-e7a7-6e2de511319d', 333323232, 26, 'ddqd', 'dsad', '10/22/2016', '0324-04-22', 'dda@mail.com', 'contrasena_nueva', 1),
('15029512-ff83-c54c-d4f3-28b11ca431aa', 555, 26, 'sadad', 'sdada', '10/22/2016', '0032-03-22', '33323@mail.com', 'contrasena_nueva', 1),
('1724ec28-6f8d-bd8e-65b4-1f7e181fdffc', 89, 26, 'sasa', 'sfaf', '10/22/2016', '0032-02-23', 'gg@mail.com', '$2a$10$6khcLLtr3KKiqUy3Woi/fOHt7Amzgditg3yAh7b5RUFRMzGewKbC6', 1),
('1d009288-2e6a-15dc-994d-f31974ea7b6d', 3323232, 26, 'Lola', 'Drones', '10/22/2016', '2011-01-01', 'luis.udec.sanchez@hotmail.com', '$2a$10$dGhfhYmrTQuQNLUoWOS8seF1FDcsDiTh0d5bJnXZ.CAE36/xgG4yC', 0),
('2983dd63-3df5-da2e-64cf-26f8aa4cff60', 9, 25, 'Didier', 'Sanchez', '10/20/2016', '1996-05-05', 'didier@mail.com', 'contrasena_vacio', 0),
('2b87c2d4-bb11-3ce7-88b9-663f4eafc553', 77, 26, 'daniel', 'paramo', '10/22/2016', '0003-03-31', 'hh@mail.com', '$2a$10$a9ByRZP10A7Pv2N2M0TXFuYJdhrinJe/bfwORkoIt/7TVL5/zBztu', 1),
('2eff0823-1df8-b2cd-ea54-d9484d67a809', 7, 25, 'Raul', 'Sanchez', '10/20/2016', '1996-05-04', 'raul@mail.com', 'contrasena_vacio', 0),
('44d4a1b0-ac8f-6bed-5d4f-cfa3e3b58ee5', 444, 26, 'ww', 'asd', '10/22/2016', '0033-03-31', 'sadasd@mail.com', 'contrasena_nueva', 1),
('46f01e3f-4c96-f4c6-6625-453d8a50616c', 2, 2, 'Daniel', 'Paramo', '10/20/2016', '0666-05-05', 'daparamo@mail.com', 'contrasena_vacio', 1),
('4b5f9fef-276e-3144-ce11-3edb1ccbf285', 2423, 26, 'ff', 'ff', '10/22/2016', '0034-02-24', 'fsdf@mail.com', 'contrasena_nueva', 1),
('50f0a490-2c24-fcbe-99c8-09780bdf166d', 67, 26, 'asa', 'ssdas', '10/22/2016', '0123-03-12', 'ssfaa@mail.com', 'contrasena_nueva', 1),
('51efd4be-742e-ba4b-ae30-2be04a2cf2fa', 1077, 26, 'a', 'a', '10/22/2016', '0002-02-22', 'luis.udec.sanchez@hotmail.com', 'contrasena_nueva', 1),
('529ed96e-97fe-fef5-b516-1998c1224fa6', 12, 24, 'Aleja', 'Sarmiento', '10/20/2016', '0004-04-04', 'aleja@mail.com', 'contrasena_vacio', 0),
('5ccce868-6637-3592-0cdb-76d7ddebbdab', 22, 26, 'Paciente', '22', '10/22/2016', '2017-01-02', '22@mail.com', 'contrasena_nueva', 1),
('5d58363b-8908-205b-eecd-b2fc11fa46aa', 89998, 26, 'Luis', 'Sanchez', '10/22/2016', '0021-12-21', 'luis.udec.sanchez@hotmail.com', '$2a$10$zTGAjTVwRETI34.nJpA0SOnAO7IjIdtA/1Kgvas7e0pEtmoVixEQy', 1),
('6695ec97-0f1a-da43-1ef1-6d9a3caf0b59', 1, 2, 'Luis', 'Sanchez', '10/20/2016', '1992-04-04', 'luis@mail.com', 'contrasena_vacio', 0),
('69fa1460-1e68-864b-3e97-53d40e501d70', 8, 24, 'maria', 'Sanchez', '10/20/2016', '2001-08-23', '89741@mail.com', 'contrasena_vacio', 0),
('7c7f480e-ec44-310a-0f4c-68262889fd85', 2, 2, 'Carolina', 'Guzman', '10/20/2016', '1789-04-04', 'guzman@mail.com', 'contrasena_vacio', 0),
('7e877c30-9f6f-fddc-6864-78cf9faa3848', 22, 26, 'Paciente', '22', '10/22/2016', '2017-01-02', '22@mail.com', 'contrasena_nueva', 1),
('8244a577-c6f8-7c15-45c3-6ded1d078140', 212, 26, 'dd', 'dd', '10/22/2016', '2121-02-21', 'dd@mail.com', 'contrasena_nueva', 1),
('854c2a38-98bc-1465-8b6b-2f969ccf0809', 3434, 26, 'sa', 'sdasd', '10/22/2016', '0123-03-21', 'sada@mail.com', 'contrasena_nueva', 1),
('8add426c-389c-0d4e-1b17-f18bd32d4dc9', 11212, 26, 'wq', 'qwwew', '10/22/2016', '1132-03-12', 'qwq@mail.com', 'contrasena_nueva', 1),
('8c915055-e932-f595-842d-5ce6f331fe9c', 1077, 26, 'a', 'a', '10/22/2016', '0002-02-22', 'luis.udec.sanchez@hotmail.com', 'contrasena_nueva', 1),
('942636d3-696c-e37d-0ab6-9cca9dbee6c6', 22, 26, 'e', 'e', '10/22/2016', '0044-04-04', 'eee@mail.com', 'contrasena_nueva', 1),
('9b118a06-1d3d-642f-ee3d-27c53631b9ff', 33, 26, 'ddd', 'dadsa', '10/22/2016', '0044-03-04', 'das@mail.com', 'contrasena_nueva', 1),
('9ed59b82-898e-19cc-0380-881951b478c9', 77, 26, 'Persona', 'Lel', '10/22/2016', '0033-03-31', 'persona77@mail.com', '$2a$10$Hv0CqVYmw1Cq2U0SSLPlyOKfF3oOWAoFNwWjugE3STX8zwNmto6sa', 1),
('a4b27c85-0c75-7a88-d9dd-2cab2f6a67d6', 6, 24, 'Wilson', 'Forero', '10/20/2016', '1999-05-05', '3303@mail.com', 'contrasena_vacio', 0),
('a684a7d1-6f9d-11a1-b7e3-1a639b21b570', 99, 26, 'LOLA', 'Drones', '10/22/2016', '2017-02-02', 'luis.udec.sanchez@hotmail.com', '$2a$10$wchJuVvDrW1eGvZOsvc41ukfccQrpYqisKThzQkerFSzGp/FYG.4.', 1),
('b3b9fb23-ac7b-03f1-c702-0ff1f64e2de6', 89, 26, 'Persona 89 ', 'sasd', '10/22/2016', '0344-04-03', 'sdasd@mail.com', 'contrasena_nueva', 1),
('b47a1b97-5689-ac75-3014-500a2d864999', 555, 26, 'DCF', 'DF', '10/22/2016', '0133-12-23', 'DAD@MAIL.COM', 'contrasena_nueva', 1),
('bf2987d8-a367-85a1-9e22-635fd853c100', 8, 25, 'Ernesto', 'Villa', '10/20/2016', '1852-05-05', 'ernesto@mail.com', 'contrasena_vacio', 0),
('c58f16d1-2a28-1377-f2bb-73b4321f2327', 2, 2, 'Daniel', 'Paramo', '10/20/2016', '1992-09-19', 'daniel@mail.com', 'contrasena_vacio', 1),
('c8db60ef-37f4-dd83-0fae-8db566160870', 44, 26, 'rr', 'rr', '10/22/2016', '2015-02-02', 'r@mail.com', 'contrasena_nueva', 1),
('d1173c24-e8fe-a1af-934b-f8b5844b9ea6', 89, 26, 'Persona 89 ', 'sasd', '10/22/2016', '0344-04-03', 'sdasd@mail.com', 'contrasena_nueva', 1),
('d276c89d-5b5c-a0b9-bea0-d4f740932bc1', 5, 24, 'Camila', 'Suarez', '10/20/2016', '1980-08-05', 'camila@mail.com', 'contrasena_vacio', 1),
('d28cc9d3-a496-f3fa-5eb3-e60967eb2843', 3, 2, 'Edwin', 'silva', '10/20/2016', '2013-11-30', 'daniel@mail.com', 'contrasena_vacio', 1),
('daeded7f-02cc-3cff-f057-202949bd660f', 777, 26, 'sadad', 'dsad', '10/22/2016', '0344-04-22', 'sadda@mail.com', 'contrasena_nueva', 1),
('deaf9620-7f03-8e97-b1d3-41e4d8e49c18', 1077, 26, 'Luis', 'Sanchez', '10/22/2016', '1993-09-04', 'luis.udec.sanchez@hotmail.com', '$2a$10$08huRMVKRz6O9YgYn28vm.kwWjcmphbaWXVA3xPFNzMCilvPuWdk.', 1),
('e097d782-63a5-2a30-5c0a-53e750942ead', 33, 26, 'Persona ', '33', '10/22/2016', '0044-04-04', 'tt@mail.com', 'contrasena_nueva', 1),
('f010cc17-3ded-a1fc-9351-9f5e56ebc6d2', 56, 26, 'ff', 'ffa', '10/22/2016', '0033-03-31', '33@mail.com', '$2a$10$JdP4ZQ1y4NaARv5AFV5Ble.kEXv4kqB0C7YIUhETAXx.pq/OaNX3G', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`idusuario`, `nombre`, `usuario`, `clave`, `email`, `fecha`, `fecha_tiempo`) VALUES
(2, 'Luis', 'luis', '$2a$10$2QAgSlGi2j1/jq.Q2d8nWu3ZKbiveAKaNVcdPm7gVDEt0/WT9/qwy', 'luis.udec.sanchez@hotmail.com', '10/16/2016', NULL),
(19, 'aa', 'asdadsada', '$2a$10$qrp1NL9diBmUF8Ik7TYpjOpPRi.Lxq/EX4JY.l1nbrVw49oJ.UfQC', 'asdasd@mail.com', '10/17/2016', NULL),
(20, 'lol', 'lol', '$2a$10$sIYO3U1YE//HLrxWAMh5p.UrukM0AOSOJzrAErFo4WgZ91xDqq3Pe', 'lol@lol.com', '10/18/2016', NULL),
(22, 'daniel', 'daniel', '$2a$10$0VJiv6bhKmdcBmKwaBrVjumfFCRRMVsyhtp9rybxfepwCnnD4AcEW', 'daparamo@mail.com', '10/18/2016', NULL),
(23, 'da', 'da', '$2a$10$eFNCsSw.yJIdGgDcjvV1d.Oj15PRD0xvhKd0jY7UN0dDTqMIi7ypC', 'da@mail.com', '10/19/2016', NULL),
(24, 'Medico 1', 'medico1', '$2a$10$BLbigrcNPTkRS3H3vJ4e5ODZbD7l3dPNusSpDN4XQImM0UpHhMzKi', 'medico1@mail.com', '10/20/2016', NULL),
(25, 'Medico2', 'medico2', '$2a$10$M2WMSuf.JKJ3b7foDn5zMOPnbcKbzhyDXudKoQjbx7RPYNvgQz.de', 'medico2@mail.com', '10/20/2016', NULL),
(26, 'lola', 'lola', '$2a$10$MHG1KWXeHsi04T0VecAVae7RsxsXqkQwXvDKW5D2uWVajEwCbxZUi', 'loladrones@mail.com', '10/22/2016', NULL);

--
-- Índices para tablas volcadas
--

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
MODIFY `llave` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
MODIFY `idusuario` int(100) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
