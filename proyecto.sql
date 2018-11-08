CREATE DATABASE  IF NOT EXISTS `proyecto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `proyecto`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `analisis`
--

DROP TABLE IF EXISTS `analisis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `analisis` (
  `idAnalisis` int(11) NOT NULL AUTO_INCREMENT,
  `nota` int(10) unsigned NOT NULL,
  `comentario` text,
  `fechaAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idUsuario` int(11) NOT NULL,
  `idJuego` int(11) NOT NULL,
  `idJuegoUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idAnalisis`),
  KEY `FK_idUsuarioAnalisis_idx` (`idUsuario`),
  KEY `FK_idJuegoAnalisis_idx` (`idJuego`),
  KEY `FK_idUsuarioJuegoAnalisis_idx` (`idJuegoUsuario`),
  CONSTRAINT `FK_idJuegoAnalisis` FOREIGN KEY (`idJuego`) REFERENCES `juego` (`idjuego`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_idUsuarioAnalisis` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_idUsuarioJuegoAnalisis` FOREIGN KEY (`idJuegoUsuario`) REFERENCES `juego_usuario` (`idjuegousuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis`
--

LOCK TABLES `analisis` WRITE;
/*!40000 ALTER TABLE `analisis` DISABLE KEYS */;
/*!40000 ALTER TABLE `analisis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`idCategoria`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego`
--

DROP TABLE IF EXISTS `juego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `juego` (
  `idJuego` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `fechaAlta` datetime DEFAULT CURRENT_TIMESTAMP,
  `fechaLanzamiento` date DEFAULT NULL,
  `descripcion` text,
  `urlFoto` text,
  PRIMARY KEY (`idJuego`),
  UNIQUE KEY `titulo_UNIQUE` (`titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juego`
--

LOCK TABLES `juego` WRITE;
/*!40000 ALTER TABLE `juego` DISABLE KEYS */;
/*!40000 ALTER TABLE `juego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego_categoria`
--

DROP TABLE IF EXISTS `juego_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `juego_categoria` (
  `idJuegoCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `idJuego` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  PRIMARY KEY (`idJuegoCategoria`),
  KEY `FK_idJuego_idx` (`idJuego`),
  KEY `FK_idCategoria_idx` (`idCategoria`),
  CONSTRAINT `FK_idCategoriaJuego` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_idJuegoCategoria` FOREIGN KEY (`idJuego`) REFERENCES `juego` (`idjuego`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juego_categoria`
--

LOCK TABLES `juego_categoria` WRITE;
/*!40000 ALTER TABLE `juego_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `juego_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego_plataforma`
--

DROP TABLE IF EXISTS `juego_plataforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `juego_plataforma` (
  `idJuegoPlataforma` int(11) NOT NULL AUTO_INCREMENT,
  `idJuego` int(11) NOT NULL,
  `idPlataforma` int(11) NOT NULL,
  PRIMARY KEY (`idJuegoPlataforma`),
  KEY `FK_idJuego_idx` (`idJuego`),
  KEY `FK_idPlataforma_idx` (`idPlataforma`),
  CONSTRAINT `FK_idJuegoPlataforma` FOREIGN KEY (`idJuego`) REFERENCES `juego` (`idjuego`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_idPlataformaJuego` FOREIGN KEY (`idPlataforma`) REFERENCES `plataforma` (`idplataforma`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juego_plataforma`
--

LOCK TABLES `juego_plataforma` WRITE;
/*!40000 ALTER TABLE `juego_plataforma` DISABLE KEYS */;
/*!40000 ALTER TABLE `juego_plataforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego_usuario`
--

DROP TABLE IF EXISTS `juego_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `juego_usuario` (
  `idJuegoUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `estado` enum('enEspera','jugando','terminado') NOT NULL DEFAULT 'enEspera',
  `fechaAlta` datetime DEFAULT CURRENT_TIMESTAMP,
  `tiempoFin` int(11) unsigned DEFAULT '0',
  `idUsuario` int(11) NOT NULL,
  `idJuego` int(11) NOT NULL,
  PRIMARY KEY (`idJuegoUsuario`),
  KEY `FK_idUsuarioJuego_idx` (`idUsuario`),
  KEY `FK_idJuegoUsuario_idx` (`idJuego`),
  CONSTRAINT `FK_idJuegoUsuario` FOREIGN KEY (`idJuego`) REFERENCES `juego` (`idjuego`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_idUsuarioJuego` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juego_usuario`
--

LOCK TABLES `juego_usuario` WRITE;
/*!40000 ALTER TABLE `juego_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `juego_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plataforma`
--

DROP TABLE IF EXISTS `plataforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `plataforma` (
  `idPlataforma` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fechaLanzamiento` date DEFAULT NULL,
  `descripcion` text,
  `urlFoto` text,
  PRIMARY KEY (`idPlataforma`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataforma`
--

LOCK TABLES `plataforma` WRITE;
/*!40000 ALTER TABLE `plataforma` DISABLE KEYS */;
/*!40000 ALTER TABLE `plataforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `apodo` varchar(45) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `correo` varchar(45) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `tipoUsuario` enum('admin','usuario') NOT NULL DEFAULT 'usuario',
  `fechaAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `esBloqueado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `apodo_UNIQUE` (`apodo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'pepe',NULL,'a','a','usuario','2018-11-08 10:58:46',0),(3,'2',NULL,'a','a','usuario','2018-11-08 10:59:25',0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-08 11:42:38
