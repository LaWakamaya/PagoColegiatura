CREATE DATABASE  IF NOT EXISTS `pagocolegiatura` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pagocolegiatura`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: pagocolegiatura
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `Usuario` varchar(20) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Pass` varchar(20) NOT NULL,
  PRIMARY KEY (`Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES ('hugoadmin','Hugo Admin','hugoadmin'),('luisadmin','Luis Admin','luisadmin'),('pacoadmin','Paco Admin','pacoadmin');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `Matricula` int NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Pass` varchar(20) NOT NULL,
  PRIMARY KEY (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,'Hugo Prueba','0001'),(2,'Paco Prueba','0002'),(3,'Luis Prueba','0003');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion` (
  `IdTransferencia` int NOT NULL AUTO_INCREMENT,
  `Matricula` int NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Fecha` varchar(30) NOT NULL,
  `TipoPago` varchar(20) NOT NULL,
  `Monto` double NOT NULL,
  PRIMARY KEY (`IdTransferencia`),
  KEY `Matricula` (`Matricula`),
  CONSTRAINT `transaccion_ibfk_1` FOREIGN KEY (`Matricula`) REFERENCES `alumno` (`Matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
INSERT INTO `transaccion` VALUES (1,1,'Hugo Prueba','2023/04/18 08:02:46','En linea',899),(2,2,'Paco Prueba','2023/04/18 08:33:27','En linea',599),(3,2,'Paco Prueba','2023/04/18 08:33:40','En linea',899),(4,3,'Luis Prueba','2023/04/18 08:34:06','En linea',1199),(5,1,'Hugo Prueba','2023/04/18 09:03:41','Presencial',999),(6,3,'Luis Prueba','2023/04/18 09:09:32','Presencial*',1599),(7,2,'Paco Prueba','2023/04/18 11:32:25','En linea',2000),(8,2,'Paco Prueba','2023/04/18 11:33:42','Presencial*',899),(9,3,'Luis Prueba','2023/04/19 02:29:39','En linea',780),(10,2,'Paco Prueba','2023/04/19 02:30:39','En linea*',475),(11,1,'Hugo Prueba','2023/04/19 02:32:03','Presencial',575),(12,1,'Hugo Prueba','2023/04/19 02:32:03','Presencial',575);
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-19 16:58:36
