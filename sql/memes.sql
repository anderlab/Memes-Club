-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-04-2018 a las 12:48:22
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `memes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Humor'),
(2, 'WTF');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `autor` varchar(45) NOT NULL,
  `publicacion` varchar(45) NOT NULL,
  `texto` varchar(140) NOT NULL,
  `fecha` date NOT NULL,
  `respuesta_de` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `esta_categorias`
--

CREATE TABLE `esta_categorias` (
  `publicacion` varchar(45) NOT NULL,
  `categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `esta_categorias`
--

INSERT INTO `esta_categorias` (`publicacion`, `categoria`) VALUES
('a1.jpg', 1),
('a1.jpg', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiquetas`
--

CREATE TABLE `etiquetas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `etiquetas`
--

INSERT INTO `etiquetas` (`id`, `nombre`) VALUES
(1, 'patxi'),
(2, 'facebook'),
(3, 'Hola Mundo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mejores_publicaciones`
--

CREATE TABLE `mejores_publicaciones` (
  `publicacion` varchar(45) NOT NULL,
  `fecha_llegada` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

CREATE TABLE `publicaciones` (
  `id` varchar(45) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `fecha_subida` date NOT NULL,
  `autor` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `publicaciones`
--

INSERT INTO `publicaciones` (`id`, `titulo`, `fecha_subida`, `autor`) VALUES
('a1.jpg', 'proba', '2018-04-25', 'artola');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiene_e`
--

CREATE TABLE `tiene_e` (
  `publicacion` varchar(45) NOT NULL,
  `etiqueta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiene_e`
--

INSERT INTO `tiene_e` (`publicacion`, `etiqueta`) VALUES
('a1.jpg', 2),
('a1.jpg', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `nombre` varchar(45) NOT NULL,
  `contrasena` varchar(45) DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `rol` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`nombre`, `contrasena`, `imagen`, `rol`, `email`) VALUES
('artola', 'zubiri', NULL, 'usuario', 'artola@zubiri.com'),
('usuario2', 'salu5', NULL, 'usuarioMindundi', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votar_c`
--

CREATE TABLE `votar_c` (
  `comentario` int(11) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `voto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votar_p`
--

CREATE TABLE `votar_p` (
  `usuario` varchar(45) NOT NULL,
  `publicacion` varchar(45) NOT NULL,
  `voto` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `votar_p`
--

INSERT INTO `votar_p` (`usuario`, `publicacion`, `voto`, `fecha`) VALUES
('artola', 'a1.jpg', 1, '2018-04-25 12:00:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_autor_comentario` (`autor`),
  ADD KEY `fk_respuesta_comentario` (`respuesta_de`),
  ADD KEY `fk_publicacion_comentario` (`publicacion`);

--
-- Indices de la tabla `esta_categorias`
--
ALTER TABLE `esta_categorias`
  ADD PRIMARY KEY (`publicacion`,`categoria`),
  ADD KEY `fk_categorias_publicacion_c` (`categoria`);

--
-- Indices de la tabla `etiquetas`
--
ALTER TABLE `etiquetas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mejores_publicaciones`
--
ALTER TABLE `mejores_publicaciones`
  ADD PRIMARY KEY (`publicacion`);

--
-- Indices de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_autor_publicacion` (`autor`);

--
-- Indices de la tabla `tiene_e`
--
ALTER TABLE `tiene_e`
  ADD PRIMARY KEY (`publicacion`,`etiqueta`),
  ADD KEY `fk_etiqueta_publicacion_e` (`etiqueta`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`nombre`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `votar_c`
--
ALTER TABLE `votar_c`
  ADD PRIMARY KEY (`comentario`,`usuario`),
  ADD KEY `fk_votos_comentario_u` (`usuario`);

--
-- Indices de la tabla `votar_p`
--
ALTER TABLE `votar_p`
  ADD PRIMARY KEY (`usuario`,`publicacion`),
  ADD KEY `fk_votos_publicacion_p` (`publicacion`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_autor_comentario` FOREIGN KEY (`autor`) REFERENCES `usuarios` (`nombre`),
  ADD CONSTRAINT `fk_publicacion_comentario` FOREIGN KEY (`publicacion`) REFERENCES `publicaciones` (`id`),
  ADD CONSTRAINT `fk_respuesta_comentario` FOREIGN KEY (`respuesta_de`) REFERENCES `comentarios` (`id`);

--
-- Filtros para la tabla `esta_categorias`
--
ALTER TABLE `esta_categorias`
  ADD CONSTRAINT `fk_categorias_publicacion_c` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `fk_categorias_publicacion_p` FOREIGN KEY (`publicacion`) REFERENCES `publicaciones` (`id`);

--
-- Filtros para la tabla `mejores_publicaciones`
--
ALTER TABLE `mejores_publicaciones`
  ADD CONSTRAINT `fk_mejores_publicaciones` FOREIGN KEY (`publicacion`) REFERENCES `publicaciones` (`id`);

--
-- Filtros para la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD CONSTRAINT `fk_autor_publicacion` FOREIGN KEY (`autor`) REFERENCES `usuarios` (`nombre`);

--
-- Filtros para la tabla `tiene_e`
--
ALTER TABLE `tiene_e`
  ADD CONSTRAINT `fk_etiqueta_publicacion_e` FOREIGN KEY (`etiqueta`) REFERENCES `etiquetas` (`id`),
  ADD CONSTRAINT `fk_etiqueta_publicacion_p` FOREIGN KEY (`publicacion`) REFERENCES `publicaciones` (`id`);

--
-- Filtros para la tabla `votar_c`
--
ALTER TABLE `votar_c`
  ADD CONSTRAINT `fk_votos_comentario_c` FOREIGN KEY (`comentario`) REFERENCES `comentarios` (`id`),
  ADD CONSTRAINT `fk_votos_comentario_u` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`nombre`);

--
-- Filtros para la tabla `votar_p`
--
ALTER TABLE `votar_p`
  ADD CONSTRAINT `fk_votos_publicacion_p` FOREIGN KEY (`publicacion`) REFERENCES `publicaciones` (`id`),
  ADD CONSTRAINT `fk_votos_publicacion_u` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
