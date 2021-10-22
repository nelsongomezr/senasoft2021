-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-10-2021 a las 21:10:06
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `colegio_pru`
--
CREATE DATABASE IF NOT EXISTS `colegio_pru` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `colegio_pru`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `id_Docente` int(11) NOT NULL,
  `Nombres` varchar(150) NOT NULL,
  `Apellidos` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`id_Docente`, `Nombres`, `Apellidos`) VALUES
(1024585225, 'JUAN ALEJANDRO', 'PEREZ TORRES'),
(1111222444, 'CARLOS EDUARDO', 'MORALES ORTIZ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `codigo_Est` int(10) NOT NULL,
  `nom_Estud` varchar(100) NOT NULL,
  `id_gru` int(11) DEFAULT NULL,
  `apell_Estud` varchar(100) NOT NULL,
  `direc_estud` varchar(100) NOT NULL,
  `tel_estudi` varchar(100) NOT NULL,
  `pass_Estudi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`codigo_Est`, `nom_Estud`, `id_gru`, `apell_Estud`, `direc_estud`, `tel_estudi`, `pass_Estudi`) VALUES
(1024583211, 'ALEJANDRO', 1200, 'PEREZ GOMEZ', 'CLL 45B 33 75 SUR', '3003133358', 'QWERTY'),
(1024583212, 'CAMILA', 1300, 'SALAMANCA', 'KR 5 ESTE 33 55', '3015868899', 'ASDFTG'),
(1024583213, 'ANGIE TATIANA', 3200, 'TRUJILLO ', 'DIAGONAL 15B SUR 15 44', '3154526789', 'ANTR31'),
(1024583214, 'CAMILO ANDRES', 2300, 'HUNGARITA MUÑOZ', 'CR 45 C 33 22 SUR', '3204567894', 'CAHU894'),
(1024583226, 'JHONATAN', 1200, 'ALBADAN CAMACHO', 'KR 6A ESTE 33 31 CA 2222', '32222222222', 'QWEQWEQWE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE `grupos` (
  `id_Grupo` int(11) NOT NULL,
  `desc_Grup` varchar(200) DEFAULT NULL,
  `id_Jornada_gru` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`id_Grupo`, `desc_Grup`, `id_Jornada_gru`) VALUES
(1200, 'Primero a de la jornada de la mañana', 1000),
(1300, 'primero b de la mañana', 1000),
(2200, 'segundo a de la tarde', 2000),
(2300, 'segundo b de la tarde', 2000),
(3200, 'grupo a jornada nocturna', 3000),
(3300, 'grupo b jornada nocturna', 3000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos_fk_materias`
--

CREATE TABLE `grupos_fk_materias` (
  `fk_grupos_fk_materias` int(11) DEFAULT NULL,
  `fk.materias_id_grupo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupos_fk_materias`
--

INSERT INTO `grupos_fk_materias` (`fk_grupos_fk_materias`, `fk.materias_id_grupo`) VALUES
(NULL, NULL),
(NULL, NULL),
(2, 1200),
(3, 1200),
(1, 1200),
(4, 1200),
(5, 1200),
(2, 1300),
(3, 1300),
(1, 1300),
(4, 1300),
(5, 1300);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornadas`
--

CREATE TABLE `jornadas` (
  `id_Jornada` int(11) NOT NULL,
  `desc_Jorn` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `jornadas`
--

INSERT INTO `jornadas` (`id_Jornada`, `desc_Jorn`) VALUES
(1000, 'MAÑANA'),
(2000, 'TARDE'),
(3000, 'NOCHE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `codi_Mater` int(11) NOT NULL,
  `nomb_Mat` varchar(100) NOT NULL,
  `intensidad` varchar(100) NOT NULL,
  `fk.docente_IdDocente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`codi_Mater`, `nomb_Mat`, `intensidad`, `fk.docente_IdDocente`) VALUES
(1, 'MATEMATICAS', '20', 1111222444),
(2, 'ESPAÑOL', '20', 1024585225),
(3, 'INGLES', '10', NULL),
(4, 'NATURALES', '10', NULL),
(5, 'SOCIALES', '20', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id_estudiante` int(11) NOT NULL,
  `id_Grupo` int(11) DEFAULT NULL,
  `id_Periodo` int(11) NOT NULL,
  `id_Materia` int(11) DEFAULT NULL,
  `nota_1` decimal(8,2) DEFAULT NULL,
  `nota_2` decimal(8,2) DEFAULT NULL,
  `nota_3` decimal(8,2) DEFAULT NULL,
  `nota_4` decimal(8,2) DEFAULT NULL,
  `nota_Final` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id_estudiante`, `id_Grupo`, `id_Periodo`, `id_Materia`, `nota_1`, `nota_2`, `nota_3`, `nota_4`, `nota_Final`) VALUES
(1024583226, 1200, 10, 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos`
--

CREATE TABLE `periodos` (
  `cod_Per` int(11) NOT NULL,
  `desc_Per` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `periodos`
--

INSERT INTO `periodos` (`cod_Per`, `desc_Per`) VALUES
(10, 'PRIMER PERIODO'),
(20, 'SEGUNDO PERIODO'),
(30, 'TERCER PERIODO'),
(40, 'CUARTO PERIODO');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`id_Docente`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`codigo_Est`),
  ADD KEY `id_grupo` (`id_gru`) USING BTREE,
  ADD KEY `id_gru` (`id_gru`),
  ADD KEY `id_gru_2` (`id_gru`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`id_Grupo`),
  ADD UNIQUE KEY `id_Grupo_2` (`id_Grupo`),
  ADD KEY `id_Jornada_gru` (`id_Jornada_gru`),
  ADD KEY `id_Grupo` (`id_Grupo`);

--
-- Indices de la tabla `grupos_fk_materias`
--
ALTER TABLE `grupos_fk_materias`
  ADD KEY `fk.materias_id_grupo` (`fk.materias_id_grupo`),
  ADD KEY `fk_grupos_fk_materias` (`fk_grupos_fk_materias`);

--
-- Indices de la tabla `jornadas`
--
ALTER TABLE `jornadas`
  ADD PRIMARY KEY (`id_Jornada`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`codi_Mater`),
  ADD KEY `fk.docente_IdDocente` (`fk.docente_IdDocente`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD KEY `id_estudiante` (`nota_4`),
  ADD KEY `id_Materia` (`id_Materia`),
  ADD KEY `id_Periodo` (`id_Periodo`),
  ADD KEY `id_estudiante_2` (`id_estudiante`),
  ADD KEY `id_Grupo` (`id_Grupo`);

--
-- Indices de la tabla `periodos`
--
ALTER TABLE `periodos`
  ADD PRIMARY KEY (`cod_Per`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`id_gru`) REFERENCES `grupos` (`id_Grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `grupos_ibfk_1` FOREIGN KEY (`id_Jornada_gru`) REFERENCES `jornadas` (`id_Jornada`);

--
-- Filtros para la tabla `grupos_fk_materias`
--
ALTER TABLE `grupos_fk_materias`
  ADD CONSTRAINT `grupos_fk_materias_ibfk_1` FOREIGN KEY (`fk_grupos_fk_materias`) REFERENCES `materias` (`codi_Mater`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `grupos_fk_materias_ibfk_2` FOREIGN KEY (`fk.materias_id_grupo`) REFERENCES `grupos` (`id_Grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`fk.docente_IdDocente`) REFERENCES `docentes` (`id_Docente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_2` FOREIGN KEY (`id_Periodo`) REFERENCES `periodos` (`cod_Per`),
  ADD CONSTRAINT `notas_ibfk_3` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`codigo_Est`),
  ADD CONSTRAINT `notas_ibfk_5` FOREIGN KEY (`id_Materia`) REFERENCES `grupos_fk_materias` (`fk_grupos_fk_materias`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `notas_ibfk_6` FOREIGN KEY (`id_Grupo`) REFERENCES `grupos_fk_materias` (`fk.materias_id_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Base de datos: `comercializa`
--
CREATE DATABASE IF NOT EXISTS `comercializa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `comercializa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cod_cli` smallint(20) UNSIGNED NOT NULL,
  `id_cli` varchar(20) NOT NULL,
  `nombres` varchar(200) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `f_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cod_cli`, `id_cli`, `nombres`, `apellidos`, `f_nacimiento`) VALUES
(1, '1007086479', 'DANNIA YULECSSI', 'AMADO VELASQUEZ', '1999-11-18'),
(2, '1024574600', 'DAVID SANTIAGO', 'ARIAS GARZON', '1996-09-23'),
(3, '1000145379', 'JESICA', 'AROCA CAMACHO', '2000-05-04'),
(4, '20371179', 'ROCIO ZENIT', 'BAUTISTA ROJAS', '1999-11-28'),
(5, '1024595860', 'DANIEL STIVEN', 'DIAZ MEDELLIN', '1999-06-23'),
(7, '1023880580', 'JOSE LEONARDO', 'ESPITIA MENDEZ', '1998-08-11'),
(8, '1193224824', 'KEVIN ANDRES', 'GARZON OSPINA', '1998-03-06'),
(9, '358', 'ANGIE MARCELA', 'GUACANEME TORRES', '1997-09-29'),
(10, '1125918037', 'JESSE', 'LOPEZ TRIGOS', '1997-04-24'),
(11, '360', 'BRAYAN STIVEN', 'LOZANO ZARATE', '1996-11-17'),
(12, '361', 'WILMER ANDRES', 'MAHECHA HOYOS', '1996-06-12'),
(13, '1007679984', 'ERIKA MARCELA', 'MIRANDA BOTACHE', '1996-01-06'),
(14, '363', 'jose ebrando', 'MONTOYA GOMEZ', '1995-08-01'),
(15, '1000033743', 'ADRIANA YAZMIN', 'MORALES RAMIREZ', '1995-02-24'),
(16, '1013653906', 'JENNY PAOLA', 'PEREIRA GONZALEZ', '1994-09-19'),
(17, '366', 'CRISTIAN CAMILO', 'POVEDA CARDENAS', '1994-04-14'),
(18, '367', 'KEVIN FELIPE', 'PULIDO ALVARRACIN', '1993-11-07'),
(19, '1000732946', 'DANIEL FELIPE', 'QUITIAN PERLAZA', '1993-06-02'),
(20, '1019134291', 'JUAN CARLOS', 'RAMIREZ DIAZ', '1992-12-26'),
(21, '1000119985', 'JONATHAN GABRIEL', 'RINCON GUASGUITA', '1992-07-21'),
(22, '371', 'JULIAN ESTEBAN', 'RODRIGUEZ BARRERA', '1992-02-14'),
(23, '372', 'BRAYAN ORLANDO', 'ROMERO QUINTERO', '1991-09-09'),
(24, '1073721622', 'JAIRO NICOLAS', 'RUIZ RAMOS', '1991-04-04'),
(25, '374', 'ALEJANDRA', 'TORRES GARCIA', '1990-10-28'),
(26, '1024587694', 'ANDRES FELIPE', 'VARON GUZMAN', '1990-05-23'),
(27, '1022447232 ', 'DALLANA MICHEL', 'VILLARREAL LOZANO', '1989-12-16'),
(48, '', '', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_cliente`
--

CREATE TABLE `pedidos_cliente` (
  `COD_PED` varchar(100) NOT NULL,
  `COD_CLI` smallint(20) UNSIGNED NOT NULL,
  `VALOR_P` float(20,3) NOT NULL,
  `FECHA_ENVIO` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedidos_cliente`
--

INSERT INTO `pedidos_cliente` (`COD_PED`, `COD_CLI`, `VALOR_P`, `FECHA_ENVIO`) VALUES
('9000', 9, 12500000.000, '2019-11-19'),
('9001', 7, 116200000.000, '2019-11-19'),
('9002', 3, 999000000.000, '2019-11-19'),
('9003', 4, 1024500608.000, '2019-11-19'),
('9004', 5, 125000.000, '2019-11-19'),
('9006', 7, 1225000.000, '2019-11-19'),
('9007', 8, 945000.000, '2019-11-19'),
('9008', 9, 225000.000, '2019-11-19'),
('9009', 22, 333987.000, '2019-11-19'),
('9010', 21, 245000.000, '2019-11-19'),
('9011', 25, 2350000.000, '2019-11-19'),
('9012', 21, 745000000.000, '2019-11-19'),
('9013', 9, 125000.000, '2019-11-19'),
('9014', 8, 225400.000, '2019-11-19'),
('9015', 7, 336000.000, '2019-11-19'),
('9017', 5, 350000.000, '2019-11-19'),
('9018', 4, 350000.000, '2019-11-19'),
('9019', 20, 700000.000, '2019-11-19'),
('9021', 22, 350000.000, '2019-11-19'),
('9022', 23, 350000.000, '2019-11-19'),
('9023', 24, 350000.000, '2019-11-19'),
('9024', 25, 350000.000, '2019-11-19'),
('9025', 26, 350000.000, '2019-11-19'),
('9026', 27, 350000.000, '2019-11-25'),
('9027', 2, 956000.000, '2019-11-19'),
('9028', 5, 956000.000, '2019-11-19'),
('9029', 7, 956000.000, '2019-11-19'),
('9030', 3, 956000.000, '2019-11-19'),
('9031', 7, 956000.000, '2019-11-19'),
('9032', 5, 956000.000, '2019-11-19'),
('9033', 8, 956000.000, '2019-11-19'),
('9035', 3, 956000.000, '2019-11-19'),
('9037', 7, 319909.000, '2019-11-19'),
('9038', 3, 455000.000, '2019-11-19'),
('9039', 7, 1255000.000, '2019-11-19'),
('9041', 9, 9245000.000, '2019-11-19'),
('9042', 3, 540000.000, '2019-11-19'),
('9045', 3, 775000.000, '2019-11-19');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cod_cli`),
  ADD UNIQUE KEY `cod_cli` (`id_cli`);

--
-- Indices de la tabla `pedidos_cliente`
--
ALTER TABLE `pedidos_cliente`
  ADD PRIMARY KEY (`COD_PED`),
  ADD KEY `COD_CLI` (`COD_CLI`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cod_cli` smallint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos_cliente`
--
ALTER TABLE `pedidos_cliente`
  ADD CONSTRAINT `pedidos_cliente_ibfk_1` FOREIGN KEY (`COD_CLI`) REFERENCES `clientes` (`cod_cli`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `datos`
--
CREATE DATABASE IF NOT EXISTS `datos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `datos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carro`
--

CREATE TABLE `carro` (
  `placa` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `marca` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carro`
--

INSERT INTO `carro` (`placa`, `id_persona`, `marca`) VALUES
(1002, 1, 'MERCEDES'),
(7415, 1002556340, 'MAZDA'),
(7416, 1002556340, 'CHEVROLET');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `Id_Cat` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Nom_Cat` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `Des_Cat` varchar(150) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`Id_Cat`, `Nom_Cat`, `Des_Cat`) VALUES
('1', 'Lacteos', 'lacteos linea nacional.'),
('2', 'Aseo', 'productos de aseo de la canasta familiar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Id_Cli` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Nom_Cli` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Tel_Cli` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Dir_Cli` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Rut_Cli` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Ema_Cli` varchar(35) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `Id_Fac` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Id_Pro` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `CanP_Fac` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  `ValUPro` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  `MonXPro` varchar(7) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `Id_Ped` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Fec_Ped` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `Art_Ped` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Can_Ped` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Val_Ped` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Id_Prov` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Id_Pro` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `f_nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombre`, `f_nacimiento`) VALUES
(1, 'OSCAR DUARTE', '2020-10-15'),
(2, 'DANIEL DIAZ', '2020-08-15'),
(3, 'MARCOS PAES', '2020-07-10'),
(4, 'ANDRES VARON', '2020-05-05'),
(1002556340, 'ORLEY MONTOYA', '2020-10-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Id_Pro` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Nom_Pro` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Pre_Pro` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Stk_Pro` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Id_Cat` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Id_Pro`, `Nom_Pro`, `Pre_Pro`, `Stk_Pro`, `Id_Cat`) VALUES
('1', 'leche entrera', '2500', '30', '1'),
('2', 'Jabon liquido X 100 ml', '20000', '30', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `Id_Prov` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Nom_Prov` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `Tel_Prov` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Dir_Prov` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Rut_Prov` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `PaW_Prov` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`Id_Prov`, `Nom_Prov`, `Tel_Prov`, `Dir_Prov`, `Rut_Prov`, `PaW_Prov`) VALUES
('123', 'colanta', '7155667', 'cl 34 g 37 sur', '17823764636', 'prove@colanta.com'),
('456', 'ariel', '8496329', 'cr 45 t 90 sur', '167826357', 'ariel@proveedor.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `Id_Ven` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Fec_Ven` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Des_Ven` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `MoF_Ven` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Id_Cli` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Id_Fac` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Id_Cat`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id_Cli`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`Id_Fac`),
  ADD KEY `Id_Pro` (`Id_Pro`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`Id_Ped`),
  ADD KEY `Id_Prov` (`Id_Prov`),
  ADD KEY `Id_Pro` (`Id_Pro`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Id_Pro`),
  ADD KEY `Id_Cat` (`Id_Cat`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`Id_Prov`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`Id_Ven`),
  ADD KEY `Id_Cli` (`Id_Cli`),
  ADD KEY `Id_Fac` (`Id_Fac`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`Id_Pro`) REFERENCES `producto` (`Id_Pro`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`Id_Prov`) REFERENCES `proveedor` (`Id_Prov`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`Id_Pro`) REFERENCES `producto` (`Id_Pro`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`Id_Cat`) REFERENCES `categoria` (`Id_Cat`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`Id_Cli`) REFERENCES `cliente` (`Id_Cli`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`Id_Fac`) REFERENCES `factura` (`Id_Fac`);
--
-- Base de datos: `datospersonas`
--
CREATE DATABASE IF NOT EXISTS `datospersonas` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `datospersonas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos`
--

CREATE TABLE `datos` (
  `Ced_Per` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Nom_Per` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `Dir_Per` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `Tel_Per` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `FechIng_Per` varchar(15) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `datos`
--

INSERT INTO `datos` (`Ced_Per`, `Nom_Per`, `Dir_Per`, `Tel_Per`, `FechIng_Per`) VALUES
('10121401720', 'Maria a Montealegre Bermudez', 'Calle 45 d # 23 a 41 olivos 1 soacha ', '3054627009', '2021-08-21'),
('41572743', 'Emma Rincon', 'Cl 2 bis n 15 - 03', '8492349', '2021-08-13'),
('80145177', 'Manuel Ballen Rincon', 'cr 81 73 sur bosa', '3137876655', '2021-08-21');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `datos`
--
ALTER TABLE `datos`
  ADD PRIMARY KEY (`Ced_Per`);
--
-- Base de datos: `ips`
--
CREATE DATABASE IF NOT EXISTS `ips` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ips`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `idEspecialidad` int(11) NOT NULL,
  `Nombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad_has_medico`
--

CREATE TABLE `especialidad_has_medico` (
  `Especialidad_idEspecialidad` int(11) NOT NULL,
  `Medico_idMedico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `Servicios_idServicios` int(11) NOT NULL,
  `Conciencia` varchar(50) NOT NULL,
  `EstadoPiel` varchar(50) NOT NULL,
  `Drenajes` varchar(50) NOT NULL,
  `Venopuncion` varchar(50) NOT NULL,
  `Alimentacion` varchar(50) NOT NULL,
  `Depsicion` varchar(50) NOT NULL,
  `Orina` varchar(50) NOT NULL,
  `Oxigeno` varchar(50) NOT NULL,
  `PrecionArterial` varchar(50) NOT NULL,
  `FrecuenciaCardiaca` varchar(50) NOT NULL,
  `FrecuenciaRespiratoria` varchar(50) NOT NULL,
  `Temperatura` varchar(50) NOT NULL,
  `Glucometria` varchar(50) NOT NULL,
  `Oximetria` varchar(50) NOT NULL,
  `Cantinicial` varchar(50) NOT NULL,
  `CantAdmin` varchar(50) NOT NULL,
  `Via` varchar(50) NOT NULL,
  `TipoSolicion` varchar(50) NOT NULL,
  `TotalLiqAdmin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento`
--

CREATE TABLE `medicamento` (
  `idmedicamento` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Presentacion` varchar(100) NOT NULL,
  `Concentracion` varchar(100) NOT NULL,
  `Posologia` varchar(100) NOT NULL,
  `Dilucion` varchar(100) NOT NULL,
  `ViaAdmon` varchar(100) NOT NULL,
  `Fecha` datetime NOT NULL,
  `hMediaca_IdHMedica` int(11) NOT NULL
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
  `Password` varchar(100) NOT NULL,
  `Estado` int(11) NOT NULL,
  `Rol_idRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profesional`
--

INSERT INTO `profesional` (`idMedico`, `Nombre`, `Direccion`, `Email`, `Telefono`, `Password`, `Estado`, `Rol_idRol`) VALUES
(1024550858, 'jhonatan albadan', 'kr 5 # 12-25', 'jhonatan@gmail.com', 3144932225, 'sdafsadfsdf', 1, 5);

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
(1, 'admin'),
(2, 'paciente'),
(3, 'admin'),
(4, 'paciente'),
(5, 'profecional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `idServicios` int(11) NOT NULL,
  `Fecha_Serv` datetime NOT NULL,
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
(1, '2021-10-20 13:52:52', '12:00:00', '12:30:00', 'Calle 26 # 15 - 17', 1, 'Soacha', '', 79222897, 1024550858),
(2, '2021-10-21 13:54:49', '15:00:00', '15:30:00', 'calee 26 # 15 - 17', 1, 'Soacha', '', 79222897, 1024550858);

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
  `Password` varchar(60) NOT NULL,
  `Sexo` varchar(45) NOT NULL,
  `Ciudad` varchar(60) NOT NULL,
  `Estado_Civil` varchar(45) NOT NULL,
  `Rol_idRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `Nombre`, `Fecha_nac`, `Eps`, `Fecha_Afili`, `Direccion`, `Email`, `Telefono`, `Responsable`, `Tel_Respon`, `Password`, `Sexo`, `Ciudad`, `Estado_Civil`, `Rol_idRol`) VALUES
(79222897, 'nelson gomez', '1985-10-20', 'Compensar', '2019-10-20', 'Calle 26 # 11 - 17', 'nelson@gmail.com', 3144932286, 'Elvira Rivera', 3144753852, 'jfjfjfjf', 'M', 'Soacha', 'Soltero', 2);

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
-- Indices de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`idmedicamento`),
  ADD KEY `hMediaca_IdHMedica` (`hMediaca_IdHMedica`);

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
  MODIFY `idEspecialidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `h_clinica`
--
ALTER TABLE `h_clinica`
  MODIFY `Id_Hclinica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `idmedicamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `idServicios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Filtros para la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD CONSTRAINT `medicamento_ibfk_1` FOREIGN KEY (`hMediaca_IdHMedica`) REFERENCES `h_clinica` (`Id_Hclinica`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
--
-- Base de datos: `modelo_relacional`
--
CREATE DATABASE IF NOT EXISTS `modelo_relacional` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `modelo_relacional`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `Id_persona` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `appellido` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `Id_persona` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fecha_reserva` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `id_solicitud` varchar(20) NOT NULL,
  `Id_persona` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fecha_solictud` date NOT NULL,
  `hora_solicitud` time NOT NULL,
  `fecha_respuesta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`Id_persona`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD KEY `Id_persona` (`Id_persona`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`id_solicitud`),
  ADD KEY `Id_persona` (`Id_persona`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`Id_persona`) REFERENCES `persona` (`Id_persona`);

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `solicitudes_ibfk_1` FOREIGN KEY (`Id_persona`) REFERENCES `persona` (`Id_persona`);
--
-- Base de datos: `my gameroom`
--
CREATE DATABASE IF NOT EXISTS `my gameroom` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `my gameroom`;
--
-- Base de datos: `personas`
--
CREATE DATABASE IF NOT EXISTS `personas` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `personas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos`
--

CREATE TABLE `datos` (
  `Cedula` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `Direccion` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `datos`
--

INSERT INTO `datos` (`Cedula`, `Nombre`, `Direccion`, `Telefono`) VALUES
('3333', 'MARIO FERNANDEZ', 'call 12 bogota', '3434555'),
('33344455', 'ANDRES PEEREZ', 'Calle 45 8989', '88888'),
('5454', 'JUANA MARIA', 'CRA 12 45 67', '444777'),
('676767', 'SANDRA MARIÑO', 'Calle 45 8989', '3443434'),
('767676', 'JUANA MARIA', 'CRA 12 45 67', '565656'),
('9998877', 'MARIO ANTONIO YEPEZ', 'calle 56 no 67 8888', '33333');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `datos`
--
ALTER TABLE `datos`
  ADD PRIMARY KEY (`Cedula`);
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

--
-- Volcado de datos para la tabla `pma__navigationhiding`
--

INSERT INTO `pma__navigationhiding` (`username`, `item_name`, `item_type`, `db_name`, `table_name`) VALUES
('root', 'usuario', 'table', 'simulacro', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_nr`, `page_descr`) VALUES
('colegio_pru', 1, 'colegio_pru');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"ips\",\"table\":\"h_clinica\"},{\"db\":\"ips\",\"table\":\"servicios\"},{\"db\":\"ips\",\"table\":\"usuario\"},{\"db\":\"ips\",\"table\":\"profesional\"},{\"db\":\"ips\",\"table\":\"rol\"},{\"db\":\"ips\",\"table\":\"especialidad_has_medico\"},{\"db\":\"ips\",\"table\":\"especialidad\"},{\"db\":\"simulacro\",\"table\":\"especialidad\"},{\"db\":\"simulacro\",\"table\":\"usuario\"},{\"db\":\"simulacro\",\"table\":\"especialidad_has_cent_med\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

--
-- Volcado de datos para la tabla `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('colegio_pru', 'docentes', 1, 1184, 91),
('colegio_pru', 'estudiantes', 1, 517, 25),
('colegio_pru', 'grupos', 1, 902, 265),
('colegio_pru', 'grupos_fk_materias', 1, 541, 273),
('colegio_pru', 'jornadas', 1, 1195, 258),
('colegio_pru', 'materias', 1, 862, 81),
('colegio_pru', 'notas', 1, 280, 113),
('colegio_pru', 'periodos', 1, 38, 172);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2021-10-21 19:09:41', '{\"Console\\/Mode\":\"show\",\"lang\":\"es\",\"Console\\/Height\":0,\"ThemeDefault\":\"pmahomme\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `simulacro`
--
CREATE DATABASE IF NOT EXISTS `simulacro` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `simulacro`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cent_med`
--

CREATE TABLE `cent_med` (
  `idCent_Med` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Telefono` bigint(11) NOT NULL,
  `Hor_Aper` time NOT NULL,
  `Hor_Cierre` time NOT NULL,
  `Imagen` varchar(200) NOT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cent_med`
--

INSERT INTO `cent_med` (`idCent_Med`, `Nombre`, `Direccion`, `Telefono`, `Hor_Aper`, `Hor_Cierre`, `Imagen`, `Estado`) VALUES
(25652547, 'ips olaya', 'CLL 44 nO 15 - 16', 3144932258, '08:00:00', '18:00:00', 'C:/IMG', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cent_med_has_eps`
--

CREATE TABLE `cent_med_has_eps` (
  `Cent_Med_idCent_Med` int(11) NOT NULL,
  `Eps_idEps` int(11) NOT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cent_med_has_eps`
--

INSERT INTO `cent_med_has_eps` (`Cent_Med_idCent_Med`, `Eps_idEps`, `Estado`) VALUES
(25652547, 852145256, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `idCita` int(11) NOT NULL,
  `Fecha_Hora` datetime NOT NULL,
  `Estado` int(11) DEFAULT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Especialidad_idEspecialidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta`
--

CREATE TABLE `encuesta` (
  `idEncuesta` int(11) NOT NULL,
  `calif` int(11) NOT NULL,
  `Cita_idCita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eps`
--

CREATE TABLE `eps` (
  `idEps` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Direccion` varchar(70) NOT NULL,
  `Telefono` bigint(11) NOT NULL,
  `Perfil_idPerfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `eps`
--

INSERT INTO `eps` (`idEps`, `Nombre`, `Direccion`, `Telefono`, `Perfil_idPerfil`) VALUES
(852145256, 'COMPENSAR', 'CLL 25 # 35 - 50', 3144932258, 1),
(2147483647, 'COMPENSAR', 'CLL 25 # 35 - 50', 3144932258, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `idEspecialidad` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`idEspecialidad`, `Nombre`) VALUES
(1, 'CARDIOLOGIA'),
(2, 'EMDOCRINOLOGIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad_has_cent_med`
--

CREATE TABLE `especialidad_has_cent_med` (
  `Especialidad_idEspecialidad` int(11) NOT NULL,
  `Cent_Med_idCent_Med` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `especialidad_has_cent_med`
--

INSERT INTO `especialidad_has_cent_med` (`Especialidad_idEspecialidad`, `Cent_Med_idCent_Med`) VALUES
(1, 25652547);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE `nivel` (
  `idNivel` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_has_cent_med`
--

CREATE TABLE `nivel_has_cent_med` (
  `Nivel_idNivel` int(11) NOT NULL,
  `Cent_Med_idCent_Med` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `idPerfil` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`idPerfil`, `Nombre`, `Estado`) VALUES
(1, 'EPS', 1),
(2, 'USUARIO', 1),
(5, 'ADMINISTRADOR', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Telefono` bigint(20) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Contraseña` varchar(100) NOT NULL,
  `Perfil_idPerfil` int(11) NOT NULL,
  `Eps_idEps` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `Nombre`, `Direccion`, `Telefono`, `Email`, `Contraseña`, `Perfil_idPerfil`, `Eps_idEps`) VALUES
(79222897, 'NELSON GOMEZ', 'CLL 44 nO 15 - 16', 3144932258, 'GDFGDF@GMAIL.COM', 'SDFSDFSDF', 2, 852145256);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cent_med`
--
ALTER TABLE `cent_med`
  ADD PRIMARY KEY (`idCent_Med`);

--
-- Indices de la tabla `cent_med_has_eps`
--
ALTER TABLE `cent_med_has_eps`
  ADD PRIMARY KEY (`Cent_Med_idCent_Med`,`Eps_idEps`),
  ADD KEY `fk_Cent_Med_has_Eps_Eps1_idx` (`Eps_idEps`),
  ADD KEY `fk_Cent_Med_has_Eps_Cent_Med_idx` (`Cent_Med_idCent_Med`);

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`idCita`),
  ADD KEY `fk_Cita_Usuario1_idx` (`Usuario_idUsuario`),
  ADD KEY `fk_Cita_Especialidad1_idx` (`Especialidad_idEspecialidad`);

--
-- Indices de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD PRIMARY KEY (`idEncuesta`),
  ADD KEY `fk_Encuesta_Cita1_idx` (`Cita_idCita`);

--
-- Indices de la tabla `eps`
--
ALTER TABLE `eps`
  ADD PRIMARY KEY (`idEps`),
  ADD KEY `fk_Eps_Perfil1_idx` (`Perfil_idPerfil`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`idEspecialidad`);

--
-- Indices de la tabla `especialidad_has_cent_med`
--
ALTER TABLE `especialidad_has_cent_med`
  ADD PRIMARY KEY (`Especialidad_idEspecialidad`,`Cent_Med_idCent_Med`),
  ADD KEY `fk_Especialidad_has_Cent_Med_Cent_Med1_idx` (`Cent_Med_idCent_Med`),
  ADD KEY `fk_Especialidad_has_Cent_Med_Especialidad1_idx` (`Especialidad_idEspecialidad`);

--
-- Indices de la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`idNivel`);

--
-- Indices de la tabla `nivel_has_cent_med`
--
ALTER TABLE `nivel_has_cent_med`
  ADD PRIMARY KEY (`Nivel_idNivel`,`Cent_Med_idCent_Med`),
  ADD KEY `fk_Nivel_has_Cent_Med_Cent_Med1_idx` (`Cent_Med_idCent_Med`),
  ADD KEY `fk_Nivel_has_Cent_Med_Nivel1_idx` (`Nivel_idNivel`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`idPerfil`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_Usuario_Perfil1_idx` (`Perfil_idPerfil`),
  ADD KEY `fk_Usuario_Eps1_idx` (`Eps_idEps`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `idCita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `idEspecialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `idPerfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cent_med_has_eps`
--
ALTER TABLE `cent_med_has_eps`
  ADD CONSTRAINT `fk_Cent_Med_has_Eps_Cent_Med` FOREIGN KEY (`Cent_Med_idCent_Med`) REFERENCES `cent_med` (`idCent_Med`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Cent_Med_has_Eps_Eps1` FOREIGN KEY (`Eps_idEps`) REFERENCES `eps` (`idEps`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `fk_Cita_Especialidad1` FOREIGN KEY (`Especialidad_idEspecialidad`) REFERENCES `especialidad` (`idEspecialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Cita_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD CONSTRAINT `fk_Encuesta_Cita1` FOREIGN KEY (`Cita_idCita`) REFERENCES `cita` (`idCita`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `eps`
--
ALTER TABLE `eps`
  ADD CONSTRAINT `fk_Eps_Perfil1` FOREIGN KEY (`Perfil_idPerfil`) REFERENCES `perfil` (`idPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `especialidad_has_cent_med`
--
ALTER TABLE `especialidad_has_cent_med`
  ADD CONSTRAINT `fk_Especialidad_has_Cent_Med_Cent_Med1` FOREIGN KEY (`Cent_Med_idCent_Med`) REFERENCES `cent_med` (`idCent_Med`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Especialidad_has_Cent_Med_Especialidad1` FOREIGN KEY (`Especialidad_idEspecialidad`) REFERENCES `especialidad` (`idEspecialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `nivel_has_cent_med`
--
ALTER TABLE `nivel_has_cent_med`
  ADD CONSTRAINT `fk_Nivel_has_Cent_Med_Cent_Med1` FOREIGN KEY (`Cent_Med_idCent_Med`) REFERENCES `cent_med` (`idCent_Med`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Nivel_has_Cent_Med_Nivel1` FOREIGN KEY (`Nivel_idNivel`) REFERENCES `nivel` (`idNivel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Eps1` FOREIGN KEY (`Eps_idEps`) REFERENCES `eps` (`idEps`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuario_Perfil1` FOREIGN KEY (`Perfil_idPerfil`) REFERENCES `perfil` (`idPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Base de datos: `ventas`
--
CREATE DATABASE IF NOT EXISTS `ventas` DEFAULT CHARACTER SET utf8 COLLATE utf8_swedish_ci;
USE `ventas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `Id_Cat` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Nom_Cat` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `Des_Cat` varchar(150) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`Id_Cat`, `Nom_Cat`, `Des_Cat`) VALUES
('1', 'Lacteos', 'lacteos linea nacional.'),
('2', 'Aseo', 'productos de aseo de la canasta familiar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Id_Cli` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Nom_Cli` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Tel_Cli` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Dir_Cli` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Rut_Cli` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Ema_Cli` varchar(35) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `Id_Fac` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Id_Pro` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `CanP_Fac` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  `ValUPro` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  `MonXPro` varchar(7) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `Id_Ped` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Fec_Ped` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `Art_Ped` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Can_Ped` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Val_Ped` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Id_Prov` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Id_Pro` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Id_Pro` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Nom_Pro` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Pre_Pro` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Stk_Pro` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Id_Cat` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Id_Pro`, `Nom_Pro`, `Pre_Pro`, `Stk_Pro`, `Id_Cat`) VALUES
('1', 'leche entrera', '2500', '30', '1'),
('2', 'Jabon liquido X 100 ml', '20000', '30', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `Id_Prov` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Nom_Prov` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `Tel_Prov` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Dir_Prov` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Rut_Prov` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `PaW_Prov` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`Id_Prov`, `Nom_Prov`, `Tel_Prov`, `Dir_Prov`, `Rut_Prov`, `PaW_Prov`) VALUES
('123', 'colanta', '7155667', 'cl 34 g 37 sur', '17823764636', 'prove@colanta.com'),
('456', 'ariel', '8496329', 'cr 45 t 90 sur', '167826357', 'ariel@proveedor.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `Id_Ven` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Fec_Ven` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Des_Ven` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `MoF_Ven` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Id_Cli` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Id_Fac` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Id_Cat`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id_Cli`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`Id_Fac`),
  ADD KEY `Id_Pro` (`Id_Pro`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`Id_Ped`),
  ADD KEY `Id_Prov` (`Id_Prov`),
  ADD KEY `Id_Pro` (`Id_Pro`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Id_Pro`),
  ADD KEY `Id_Cat` (`Id_Cat`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`Id_Prov`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`Id_Ven`),
  ADD KEY `Id_Cli` (`Id_Cli`),
  ADD KEY `Id_Fac` (`Id_Fac`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`Id_Pro`) REFERENCES `producto` (`Id_Pro`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`Id_Prov`) REFERENCES `proveedor` (`Id_Prov`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`Id_Pro`) REFERENCES `producto` (`Id_Pro`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`Id_Cat`) REFERENCES `categoria` (`Id_Cat`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`Id_Cli`) REFERENCES `cliente` (`Id_Cli`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`Id_Fac`) REFERENCES `factura` (`Id_Fac`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
