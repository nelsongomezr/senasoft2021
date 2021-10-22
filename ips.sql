-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-10-2021 a las 17:41:41
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ips`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `idEspecialidad` int(11) NOT NULL,
  `Nombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`idEspecialidad`, `Nombre`) VALUES
(1, 'ORTOPEDIA'),
(2, 'MEDICINA GENERAL'),
(3, 'CARDIOLOGIA'),
(4, 'ENFERMERIA'),
(5, 'ADMINISTRATIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad_has_medico`
--

CREATE TABLE `especialidad_has_medico` (
  `Especialidad_idEspecialidad` int(11) NOT NULL,
  `Medico_idMedico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `especialidad_has_medico`
--

INSERT INTO `especialidad_has_medico` (`Especialidad_idEspecialidad`, `Medico_idMedico`) VALUES
(2, 1024550858),
(3, 1024550858),
(3, 1234567897);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `h_clinica`
--

CREATE TABLE `h_clinica` (
  `Id_Hclinica` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Imagen` varchar(100) NOT NULL,
  `Motivo` varchar(100) NOT NULL,
  `Observaciones` varchar(250) NOT NULL,
  `Enferm_Actual` varchar(100) NOT NULL,
  `Servicios_idServicios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesional`
--

CREATE TABLE `profesional` (
  `idMedico` int(11) NOT NULL,
  `Nombre` varchar(150) NOT NULL,
  `Direccion` varchar(150) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Telefono` bigint(20) NOT NULL,
  `Contraseña` varchar(100) NOT NULL,
  `Estado` int(11) NOT NULL,
  `Rol_idRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profesional`
--

INSERT INTO `profesional` (`idMedico`, `Nombre`, `Direccion`, `Email`, `Telefono`, `Contraseña`, `Estado`, `Rol_idRol`) VALUES
(0, 'Raddie Leacock', '0573 Fieldstone Way', 'rleacock0@geocities.com', 432, 'qNS9pUQvvo', 1, 3),
(80767604, 'fabian hernesto malhesto', 'cll 45 50 65', 'fabianher@gmail.com', 3115226898, '789456', 1, 3),
(456123789, 'casitoco', 'askdjdlkj ', 'alskdkkñ@jasljdl', 3213246164, '789456123', 1, 3),
(1024550858, 'JHONATAN ALBADAN', 'CRA 18 N 15-25', 'jhonatanalbadan@gmail.com', 3125892563, '12345', 1, 1),
(1024583223, 'camilo cantor perez', 'kr 5a 33 12 ap 122', 'camicape@gmail.com', 31123123123, 'adsi123', 1, 3),
(1234567897, 'ADRIAN CAMILO SANTOS', 'DASDASDASD', 'ERERWER@HOTMAIL.COM', 22222222, 'SDFWERSDF', 1, 3),
(2147483647, 'asjdoiasj', 'ajnd ispodk a ', '	asdlkjaikjdpa@hgammsk', 5641165121, 'opkajfokj asdjasdjklkass', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `Rol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`, `Rol`) VALUES
(1, 'ADMIN'),
(2, 'USUARIO'),
(3, 'PROFESIONAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `idServicios` int(11) NOT NULL,
  `Fecha_Serv` date NOT NULL,
  `Hora_Ini` time NOT NULL,
  `Hora_Fin` time NOT NULL,
  `Dir_Servc` varchar(150) NOT NULL,
  `Estado` int(11) NOT NULL,
  `Ciudad` varchar(60) NOT NULL,
  `Observaciones` varchar(250) NOT NULL,
  `Usuario_idUsuario` bigint(20) NOT NULL,
  `Medico_idMedico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`idServicios`, `Fecha_Serv`, `Hora_Ini`, `Hora_Fin`, `Dir_Servc`, `Estado`, `Ciudad`, `Observaciones`, `Usuario_idUsuario`, `Medico_idMedico`) VALUES
(4, '2021-10-05', '15:00:00', '00:00:00', 'ASDASD', 1, 'BOGOTA', '', 7922897, 1024583223),
(9, '2021-10-12', '12:00:00', '00:00:00', 'zzxcvzxvc', 1, 'BOGOTA', '', 1024583, 1024550858),
(10, '2021-10-26', '06:00:00', '18:00:00', 'kr 4 este 33 33 ', 1, 'BOGOTA', '', 1234567891, 1024550858),
(11, '2021-10-28', '04:00:00', '13:00:00', 'asdasdadasd', 1, 'caldas', '', 1234567891, 80767604),
(12, '2017-01-25', '10:56:00', '17:57:00', 'asdasdasd', 1, 'BOGOTA', '', 1234567891, 1024583223);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` bigint(20) NOT NULL,
  `Nombre` varchar(70) NOT NULL,
  `Fecha_nac` date NOT NULL,
  `Eps` varchar(70) NOT NULL,
  `Fecha_Afili` date NOT NULL,
  `Direccion` varchar(150) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Telefono` bigint(20) NOT NULL,
  `Responsable` varchar(150) NOT NULL,
  `Tel_Respon` bigint(20) NOT NULL,
  `Contraseña` varchar(60) NOT NULL,
  `Sexo` varchar(45) NOT NULL,
  `Ciudad` varchar(60) NOT NULL,
  `Estado_Civil` varchar(45) NOT NULL,
  `Rol_idRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `Nombre`, `Fecha_nac`, `Eps`, `Fecha_Afili`, `Direccion`, `Email`, `Telefono`, `Responsable`, `Tel_Respon`, `Contraseña`, `Sexo`, `Ciudad`, `Estado_Civil`, `Rol_idRol`) VALUES
(1024583, 'JHONATAN CENTENAR', '2021-10-04', 'Medimas', '2021-10-19', 'kr 5a 33 12', 'camicape@gmail', 3057154454, 'katherin BARRERA', 789456123, 'ASDASDASDASD', 'M', 'BOGOTA', 'Union_Libre', 2),
(7922897, 'alejandra duarte mora', '1985-02-12', 'Salud_Total', '2021-10-10', 'kr 5b 22 36 t 115 apt 203', 'camicape@gmail.com', 31123123123, 'adriana cantor camargo', 3124578558, '789456123', 'F', 'BOGOTA', 'Union_Libre', 2),
(1234567891, 'casi melo mendez', '2017-06-13', 'Sanitas', '2021-10-03', 'kr 78c 45 24', 'casimelo@hotmail.com', 7859232, 'elver gomez torba', 3047895431, 'qwerty', 'F', 'san mateo', 'Casado(a)', 2),
(8977894564, 'melo tocas', '2002-06-20', 'Colmedicas', '2021-10-04', 'kr 78c 45 24', 'asdasd@hotmail', 16549872, 'tocame estas', 5465465, 'qwijdmna', 'M', 'risaralda', 'Casado(a)', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`idEspecialidad`);

--
-- Indices de la tabla `especialidad_has_medico`
--
ALTER TABLE `especialidad_has_medico`
  ADD PRIMARY KEY (`Especialidad_idEspecialidad`,`Medico_idMedico`),
  ADD KEY `fk_Especialidad_has_Medico_Medico1_idx` (`Medico_idMedico`),
  ADD KEY `fk_Especialidad_has_Medico_Especialidad1_idx` (`Especialidad_idEspecialidad`);

--
-- Indices de la tabla `h_clinica`
--
ALTER TABLE `h_clinica`
  ADD PRIMARY KEY (`Id_Hclinica`),
  ADD KEY `fk_H_clinica_Servicios1_idx` (`Servicios_idServicios`);

--
-- Indices de la tabla `profesional`
--
ALTER TABLE `profesional`
  ADD PRIMARY KEY (`idMedico`),
  ADD KEY `fk_Medico_Rol1_idx` (`Rol_idRol`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`idServicios`),
  ADD KEY `fk_Servicios_Usuario1_idx` (`Usuario_idUsuario`),
  ADD KEY `fk_Servicios_Medico1_idx` (`Medico_idMedico`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_Usuario_Rol1_idx` (`Rol_idRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `idEspecialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `h_clinica`
--
ALTER TABLE `h_clinica`
  MODIFY `Id_Hclinica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `idServicios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `especialidad_has_medico`
--
ALTER TABLE `especialidad_has_medico`
  ADD CONSTRAINT `fk_Especialidad_has_Medico_Especialidad1` FOREIGN KEY (`Especialidad_idEspecialidad`) REFERENCES `especialidad` (`idEspecialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Especialidad_has_Medico_Medico1` FOREIGN KEY (`Medico_idMedico`) REFERENCES `profesional` (`idMedico`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `h_clinica`
--
ALTER TABLE `h_clinica`
  ADD CONSTRAINT `fk_H_clinica_Servicios1` FOREIGN KEY (`Servicios_idServicios`) REFERENCES `servicios` (`idServicios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `profesional`
--
ALTER TABLE `profesional`
  ADD CONSTRAINT `fk_Medico_Rol1` FOREIGN KEY (`Rol_idRol`) REFERENCES `rol` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `fk_Servicios_Medico1` FOREIGN KEY (`Medico_idMedico`) REFERENCES `profesional` (`idMedico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Servicios_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Rol1` FOREIGN KEY (`Rol_idRol`) REFERENCES `rol` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
