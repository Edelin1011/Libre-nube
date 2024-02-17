--Crear la base de datos de Verenice
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-02-2024 a las 03:11:08
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libreriavere`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cat_editorial`
--

CREATE TABLE `tbl_cat_editorial` (
  `id_editorial` int(11) NOT NULL,
  `nombre_editorial` varchar(100) NOT NULL,
  `pais_editorial` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cat_genero`
--

CREATE TABLE `tbl_cat_genero` (
  `id_genero` int(11) NOT NULL,
  `nombre_genero` varchar(50) NOT NULL,
  `descripcion_genero` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cat_idioma`
--

CREATE TABLE `tbl_cat_idioma` (
  `id_idioma` int(11) NOT NULL,
  `nombre_idioma` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_hist_ventas`
--

CREATE TABLE `tbl_hist_ventas` (
  `id_venta` int(11) NOT NULL,
  `id_libro` int(11) DEFAULT NULL,
  `cantidad_vendida` int(11) DEFAULT NULL,
  `monto_total` decimal(10,2) DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ope_libro`
--

CREATE TABLE `tbl_ope_libro` (
  `id_libro` int(11) NOT NULL,
  `titulo_libro` varchar(150) NOT NULL,
  `id_genero` int(11) DEFAULT NULL,
  `id_editorial` int(11) DEFAULT NULL,
  `id_idioma` int(11) DEFAULT NULL,
  `anio_publicacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_cat_editorial`
--
ALTER TABLE `tbl_cat_editorial`
  ADD PRIMARY KEY (`id_editorial`);

--
-- Indices de la tabla `tbl_cat_genero`
--
ALTER TABLE `tbl_cat_genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `tbl_cat_idioma`
--
ALTER TABLE `tbl_cat_idioma`
  ADD PRIMARY KEY (`id_idioma`);

--
-- Indices de la tabla `tbl_hist_ventas`
--
ALTER TABLE `tbl_hist_ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_libro` (`id_libro`);

--
-- Indices de la tabla `tbl_ope_libro`
--
ALTER TABLE `tbl_ope_libro`
  ADD PRIMARY KEY (`id_libro`),
  ADD KEY `id_genero` (`id_genero`),
  ADD KEY `id_editorial` (`id_editorial`),
  ADD KEY `id_idioma` (`id_idioma`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_hist_ventas`
--
ALTER TABLE `tbl_hist_ventas`
  ADD CONSTRAINT `tbl_hist_ventas_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `tbl_ope_libro` (`id_libro`);

--
-- Filtros para la tabla `tbl_ope_libro`
--
ALTER TABLE `tbl_ope_libro`
  ADD CONSTRAINT `tbl_ope_libro_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `tbl_cat_genero` (`id_genero`),
  ADD CONSTRAINT `tbl_ope_libro_ibfk_2` FOREIGN KEY (`id_editorial`) REFERENCES `tbl_cat_editorial` (`id_editorial`),
  ADD CONSTRAINT `tbl_ope_libro_ibfk_3` FOREIGN KEY (`id_idioma`) REFERENCES `tbl_cat_idioma` (`id_idioma`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
