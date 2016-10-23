-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-10-2016 a las 14:19:52
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ejercicio`
--

INSERT INTO `ejercicio` (`idEjercicio`, `nombreEjercicio`, `repeticiones`, `tiempo`, `idPaciente`, `termino`, `eliminado`, `fechaAsignacion`, `fechaRealizado`, `idMedico`, `fechaEliminacion`, `tipoEjercicio`) VALUES
(1, 'ejeercicio1', 22, 12, 0, 0, 0, '0000-00-00', '0000-00-00', 0, '0000-00-00', 0);

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
('08669534-56a7-0ece-c85b-fd2c08065c3b', '1', 2, 'Luis', 'Sanchez', '10/20/2016', '1990-01-11', 'luis@mail.com', 'contrasena_vacio', 1),
('0aa8b30b-e723-7b2e-aee0-853832facbdf', '12312', 2, 'daniel', 'loli', '10/22/2016', '1994-11-11', 'daparamo@hotmail.com', '$2a$10$2SzpX2z0bSneqo5JlbybouXxwYiBQ5G2l5V9GqgPdmqgXrmns6z5i', 1),
('22a67f90-3968-3dc8-4bbb-bd59c713f041', '12', 2, 'sad', 'sdad', '10/23/2016', '0004-04-04', 'asdq@mail.com', '$2a$10$Yol4XYApK72wLo0GyL7mwO7wz1FjvJDz1ikti72TYMOCP9.iqCaIK', 1),
('22dbfff3-7600-fa6a-b602-05c02a937ebf', '66', 2, 'sda', 'dsa', '10/23/2016', '2000-05-05', 'dsad@mail.com', '$2a$10$pxTc6SDyIMZr.4g4MBFL5ubNAd65nIZp/ai2CNU4/.5a/BNKIMoRm', 1),
('2983dd63-3df5-da2e-64cf-26f8aa4cff60', '9', 25, 'Didier', 'Sanchez', '10/20/2016', '1996-05-05', 'didier@mail.com', 'contrasena_vacio', 0),
('2eff0823-1df8-b2cd-ea54-d9484d67a809', '7', 25, 'Raul', 'Sanchez', '10/20/2016', '1996-05-04', 'raul@mail.com', 'contrasena_vacio', 0),
('361a9831-d9f0-6efe-6119-ad47f93895bb', '56', 2, 'dddsad', 'dsad', '10/23/2016', '0004-04-04', 'sdads@mail.com', '$2a$10$ZYs63eDhSvuN8hPheDsdRO/ioAY2INQzC16VBBrOr4gOrnRdRkOOy', 1),
('3d8f3432-b61c-d329-944f-55cf15c91816', '1212', 2, 'daniel', 'lol', '10/22/2016', '1995-12-11', 'lol@mail.com', 'contrasena_vacio', 1),
('40074bc8-40a2-8083-18a8-137d143d9b8c', '455454', 28, 'Luis', 'dsfasffa', '10/22/2016', '0213-03-21', 'luis.udec.sanchez@hotmail.com', '$2a$10$hSEID49FuCLJmSHZlnh4/.mIMBvgbIEajyTSMnVxYt5Ei4iIilut2', 0),
('40698d80-2f75-95c9-8d64-78a72fb3d977', '366', 2, 'lola', 'drones', '10/22/2016', '1998-12-12', 'ha@lol.com', 'contrasena_vacio', 1),
('4699478d-6002-e08b-9823-2ed0273b0a3b', '6666', 2, 'dsad', 'dsad', '10/23/2016', '0005-06-05', 'luis.udec.sanchez@hotmail.com', '$2a$10$guJ3f6DrYFCBcHTSf.fTseAxJhIvfdO4C.Chtpd7pHQIN1aT2OhB.', 1),
('46b5f924-f8eb-7b84-6f33-dbe538fde735', '89', 24, 'Fernando', 'Martinez', '10/20/2016', '0005-05-05', 'sad@mail.com', 'contrasena_vacio', 1),
('46f01e3f-4c96-f4c6-6625-453d8a50616c', '2', 2, 'Daniel', 'Paramo', '10/20/2016', '0666-05-05', 'daparamo@mail.com', 'contrasena_vacio', 1),
('529ed96e-97fe-fef5-b516-1998c1224fa6', '10', 24, 'Alejauu', 'Sarmiento', '10/20/2016', '1990-04-04', '11@mail.com', 'contrasena_vacio', 1),
('5595a082-9b67-1c6a-5c4d-bee74aa6abd9', '111', 2, 'Luis', 'Sanchez', '10/23/2016', '0004-11-11', 'luis@mail.com', '$2a$10$UcyIf50V7S.L2mCMRiwB2ugnJZ2fk/nVroa24h74v.KwaxBd8Pjje', 1),
('5801d504-eb0d-e651-fd3a-4931992c5214', '1077086466', 2, 'Luis', 'Sanchez', '10/22/2016', '2012-01-01', 'luis@mail.com', '$2a$10$c0fbD3GIOYtYH7.651FT1uFeLLg8veZ9rGW0JMejHYW8RmQIxYUIe', 1),
('5a4b774b-dd11-c41f-fc23-1efe0a821863', '55646', 2, 'ddd', 'dd', '10/23/2016', '2014-01-01', 'lol@mail.com', '$2a$10$.gI4XoTbdICafcp2KuIlL.Y6IoPcMaR.3s.5xK6T4UypyypsR1.J.', 1),
('5b924e94-54c9-79fc-699b-e4295cabd23f', '-8', 2, '33asdasds', 'dd', '10/23/2016', '0464-05-06', 'd@mail.com', '$2a$10$zJNoDw4IW2pHIYA/YMXCb.yO52s19e1OTMSD1Jj7ibsLvVmc9BlwG', 1),
('6695ec97-0f1a-da43-1ef1-6d9a3caf0b59', '1', 2, 'Luis', 'Sanchez', '10/20/2016', '1992-04-04', 'luis@mail.com', 'contrasena_vacio', 1),
('69fa1460-1e68-864b-3e97-53d40e501d70', '11', 24, 'maria', 'Sanchez', '10/20/2016', '2001-08-23', '11@mail.com', 'contrasena_vacio', 1),
('6d8e0807-1a33-1490-c1de-0cd94347327c', '123', 2, 'damm', 'deam', '10/22/2016', '1994-12-12', 'daparamo@hotmail.com', '$2a$10$KV7hZVzNeNYENkAhpENsOO2SmaIOps.j3HOi6R52HHysbyfpLoWRS', 1),
('7a1aaa86-e8d1-5dbc-e926-fb884789600b', '1077086466', 28, 'Luis', 'sad', '10/22/2016', '0213-03-21', 'sadadadas@mail.com', 'contrasena_nueva', 0),
('7b23be6b-35da-f40f-0742-6d81556da0f6', '14', 24, 'as', 'a', '10/20/2016', '0004-04-04', 'asff@mail.com', 'contrasena_vacio', 1),
('7c7f480e-ec44-310a-0f4c-68262889fd85', '2', 2, 'Carolina', 'Guzman', '10/20/2016', '1789-04-04', 'guzman@mail.com', 'contrasena_vacio', 1),
('851d95c4-4061-7583-ed96-c099ab37568a', '33', 28, 'Luis', 'sad', '10/22/2016', '0213-03-21', '33@mail.com', 'contrasena_nueva', 0),
('8534a0a0-e965-1396-aeaa-8e6fbdbfe941', '4444', 24, 'Fernando', 'Martinez', '10/20/2016', '1998-05-05', '444@mail.com', 'contrasena_vacio', 1),
('895ad258-9799-339c-febd-3168f0c5603d', '66654656', 2, 'sadas', 'dsa', '10/23/2016', '1940-06-04', 'sadad@mail.com', '$2a$10$ANaJSoBadWAYcY2jdoRCqukS1so5kLuKE6OEDmKMKOrx5Vi4srWGG', 1),
('933504f6-8e34-53b5-9ce5-1f6d7a0074a5', '-9', 2, 'ss', 'df', '10/23/2016', '0005-05-05', 'fsdf@mail.com', '$2a$10$lMk9C2WK0rHUh28Grq8VSOW6wg7bgqJHBe852erZu62TyG2DNFJNC', 1),
('9a31078a-4c48-e162-a966-b87dc198b608', '22', 2, 'daniel', 'lol', '10/22/2016', '1992-11-11', 'daparam07@gmail.com', '$2a$10$4Nur35bSMnSKBiOvD2FysOaxMqi/luwfN9bfTLnpVnB.RA7LqG/Pm', 1),
('9cbe2844-4978-29b2-3eee-e5ce46996f0c', '1', 2, 'Daniel', 'Sanchez', '10/22/2016', '2015-02-01', 'sadas@mail.com', '$2a$10$r8wJ0SV1bdk2COpwnbjt9.BXUCQK4kObFVUZI8Fkb2PKYI2qgBuNi', 1),
('a26879cf-1da0-9c43-7ef0-561d11625bcd', '56', 2, 'dd', 'dd', '10/23/2016', '0056-06-05', 'oo@mail.com', '$2a$10$6ZXRraZJrlCPsb6gwfWXFemO70FkuvePNqghkGFBcqSuTDi5a62Y6', 1),
('a2dd0fd8-1641-7a0c-98c0-42c7a8fe8cdc', '34353', 2, 'adsasd', 'asdsad', '10/22/2016', '1992-11-11', 'Dl@lol.com', '$2a$10$G3h0R4RljECev6XOEQodaOloyXEsxXynM1IB1n2ekWH4tjqG3qX1m', 1),
('a4b27c85-0c75-7a88-d9dd-2cab2f6a67d6', '11', 24, 'Wilson', 'Forero', '10/20/2016', '1999-05-05', 'wilson@mail.com', 'contrasena_vacio', 1),
('ac73b159-b9af-d3fc-315d-de4840840ddf', '22', 2, 'sss', 'sad', '10/23/2016', '1992-04-04', 'llsald@mail.com', '$2a$10$JB/ZFpCsvTVXQS2cUFYDHuV3opZBcxT9TO5VLowhMLU.mTTEbbPMO', 1),
('ad7061f6-8b6b-44ed-9231-4a040df0b17d', '544', 2, 'cc', 'cc', '10/23/2016', '1940-01-11', 'cccc@mail.com', '$2a$10$Td80rkmvCC.K1z.jqdgCbuQQt6cSJi4DHiS8m3S9jejo488E6qId6', 1),
('b1b78ed8-a1b4-daa4-f6f4-10fe0515f1b3', '55', 2, 'luis alfredo', 'sanchez cuitiva', '10/23/2016', '0001-11-11', 'luis@maiaa.com', '$2a$10$QARqVh0qnlgdamgGELURVOp5BLIae5PfDwT6HWLSWMYXiXGz1yuhK', 1),
('b7f0e7e9-8eb8-e2dd-1039-cce88026acb3', '-6', 2, 'luis', 'sanchez', '10/23/2016', '0004-04-04', 'llosaoosa@mail.com', '$2a$10$/BesDb06IsCk8qGVju7q1egvCt5WGyEppdgqyupNoXfDVU/VfvvPi', 1),
('bdaa1e0b-a40d-cc4d-f1ea-c8a0a8132c23', '123123', 2, 'da', 'das', '10/22/2016', '0111-11-11', 'das@das.com', 'contrasena_vacio', 1),
('bf2987d8-a367-85a1-9e22-635fd853c100', '8', 25, 'Ernesto', 'Villa', '10/20/2016', '1852-05-05', 'ernesto@mail.com', 'contrasena_vacio', 0),
('bfd746d8-b597-645f-4cc7-831fe6710ea0', '77', 24, '11111111', 'Paramo', '10/20/2016', '1975-05-05', '11@mail.com', 'contrasena_vacio', 0),
('c2bf0c15-249a-d97f-38a3-23e0b9d52164', '1056', 2, 'sd', 'sda', '10/23/2016', '0006-06-06', 'dsadfaas@mail.com', '$2a$10$82k54k4CfBr9pV5CgM5S6u1YeSSENJZXf0Riqo8JTx4HGl9mQW.qK', 1),
('c50d518f-c720-69dd-9f42-c3866c2dae91', '1', 28, 'Luis', 'sad', '10/22/2016', '0213-03-21', 'sdad@mail.com', 'contrasena_nueva', 0),
('c58f16d1-2a28-1377-f2bb-73b4321f2327', '2', 2, 'Daniel', 'Paramo', '10/20/2016', '1992-09-19', 'daniel@mail.com', 'contrasena_vacio', 1),
('d276c89d-5b5c-a0b9-bea0-d4f740932bc1', '5', 24, 'Camila', 'Suarez', '10/20/2016', '1980-08-05', 'camila@mail.com', 'contrasena_vacio', 1),
('d28cc9d3-a496-f3fa-5eb3-e60967eb2843', '3', 2, 'Edwin', 'silva', '10/20/2016', '2013-11-30', 'daniel@mail.com', 'contrasena_vacio', 1),
('e02f4145-2753-a99f-6723-11b4efb855ee', '555', 2, 'dd', 'dd', '10/23/2016', '0065-04-05', 'dd@mail.com', '$2a$10$6yI5APVWp32A11lOC80RGOirBrUdphU2ty21MbGmjKr0hE6lnwj4G', 1),
('e0824a06-b058-ea2d-1dd9-69ab31b096b2', '10770', 2, 'Luis', 'Sanchez', '10/23/2016', '1993-09-04', 'luis@mail.com', '$2a$10$OPL0MPH9RnOR.tNxsPe//uxWhgKzH/wQDlr7XRrPlD.D1LZcNc.I6', 1),
('e3932e35-9762-e4d2-e7e1-67a1ccf94580', '13', 2, 'd', 'd', '10/23/2016', '0001-11-11', 'sad@mail.com', '$2a$10$z8ENytmUQMulvxsLt.gb9OxjTjx6DQW7DBgrWcfTYWrTlFoWClL2S', 1),
('e3d45751-cc37-ba2f-cdbf-22482ea6c075', '6565', 2, 'dfg', 'dfg', '10/22/2016', '1994-11-11', 'daparamo@hotmail.com', '$2a$10$scdYuFabLB.PZXqt0qMGXOcFaArbiheaNNFcuwwaxAnh7qqUhWrpK', 1),
('e4e248fe-101c-a81d-2ee4-ac385cf66515', '1', 2, 'sad', 'dsa', '10/23/2016', '0005-06-05', 'asdda@mail.com', 'contrasena_nueva', 1),
('e673b705-418c-a482-4de4-fd3ac05941e8', '11', 24, 'Hola', 'Paola', '10/20/2016', '2000-02-01', '14144@mail.com', 'contrasena_vacio', 0);

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
(2, 'Luis', 'luis', '$2a$10$OwqfOWbjS7XtNGqhqFhC9uKliohS5EUWVewOlINx2FB1NmKgVXj72', 'luis.udec.sanchez@hotmail.com', '10/16/2016', NULL),
(19, 'aa', 'asdadsada', '$2a$10$sEBacc3xV.IxZzGhlXCFluQ.MHrhhnEIIZMLakkVkgV57.UwhiMxC', 'lolalsolaso@mail.com', '10/17/2016', NULL),
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
  MODIFY `idEjercicio` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `todos`
--
ALTER TABLE `todos`
  MODIFY `llave` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `idusuario` int(100) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
