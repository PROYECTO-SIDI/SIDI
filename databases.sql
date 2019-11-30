-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: sidi
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int(10) NOT NULL AUTO_INCREMENT,
  `fecharegistro` int(11) NOT NULL,
  `idusuario` int(20) NOT NULL,
  `USUARIO_DIRECCIONidUsuario` int(10) NOT NULL,
  `USUARIO_DIRECCIONDIRECCIONiddirección` int(15) NOT NULL,
  PRIMARY KEY (`idcliente`),
  KEY `USUARIO_DIRECCIONidUsuario` (`USUARIO_DIRECCIONidUsuario`),
  KEY `USUARIO_DIRECCIONDIRECCIONiddirección` (`USUARIO_DIRECCIONDIRECCIONiddirección`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`USUARIO_DIRECCIONidUsuario`) REFERENCES `usuario` (`idusuario`),
  CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`USUARIO_DIRECCIONDIRECCIONiddirección`) REFERENCES `dircción` (`idDirección`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dircción`
--

DROP TABLE IF EXISTS `dircción`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dircción` (
  `idDirección` int(15) NOT NULL AUTO_INCREMENT,
  `dirección` varchar(15) NOT NULL,
  PRIMARY KEY (`idDirección`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dircción`
--

LOCK TABLES `dircción` WRITE;
/*!40000 ALTER TABLE `dircción` DISABLE KEYS */;
/*!40000 ALTER TABLE `dircción` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `idEstado` int(10) NOT NULL AUTO_INCREMENT,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_pedido`
--

DROP TABLE IF EXISTS `estado_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_pedido` (
  `ESTADOidEstado` int(10) NOT NULL,
  `PEDIDOidpedido` int(10) NOT NULL,
  KEY `PEDIDOidpedido` (`PEDIDOidpedido`),
  KEY `ESTADOidEstado` (`ESTADOidEstado`),
  CONSTRAINT `estado_pedido_ibfk_1` FOREIGN KEY (`PEDIDOidpedido`) REFERENCES `pedido` (`idpedido`),
  CONSTRAINT `estado_pedido_ibfk_2` FOREIGN KEY (`ESTADOidEstado`) REFERENCES `estado` (`idEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_pedido`
--

LOCK TABLES `estado_pedido` WRITE;
/*!40000 ALTER TABLE `estado_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fecha`
--

DROP TABLE IF EXISTS `fecha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fecha` (
  `idfechapedido` int(11) NOT NULL AUTO_INCREMENT,
  `fechapedido` int(11) NOT NULL,
  PRIMARY KEY (`idfechapedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fecha`
--

LOCK TABLES `fecha` WRITE;
/*!40000 ALTER TABLE `fecha` DISABLE KEYS */;
/*!40000 ALTER TABLE `fecha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fecha_pedido`
--

DROP TABLE IF EXISTS `fecha_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fecha_pedido` (
  `PEDIDOidpedido` int(10) NOT NULL,
  `FECHAPEDIDOidfechapedido` int(11) NOT NULL,
  KEY `PEDIDOidpedido` (`PEDIDOidpedido`),
  KEY `FECHAPEDIDOidfechapedido` (`FECHAPEDIDOidfechapedido`),
  CONSTRAINT `fecha_pedido_ibfk_1` FOREIGN KEY (`PEDIDOidpedido`) REFERENCES `pedido` (`idpedido`),
  CONSTRAINT `fecha_pedido_ibfk_2` FOREIGN KEY (`FECHAPEDIDOidfechapedido`) REFERENCES `fecha` (`idfechapedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fecha_pedido`
--

LOCK TABLES `fecha_pedido` WRITE;
/*!40000 ALTER TABLE `fecha_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `fecha_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fecha_registro`
--

DROP TABLE IF EXISTS `fecha_registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fecha_registro` (
  `idfecharegistro` int(11) NOT NULL AUTO_INCREMENT,
  `fecharegistro` int(11) NOT NULL,
  `idcliente` int(10) NOT NULL,
  PRIMARY KEY (`idfecharegistro`),
  KEY `idcliente` (`idcliente`),
  CONSTRAINT `fecha_registro_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fecha_registro`
--

LOCK TABLES `fecha_registro` WRITE;
/*!40000 ALTER TABLE `fecha_registro` DISABLE KEYS */;
/*!40000 ALTER TABLE `fecha_registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idpedido` int(10) NOT NULL AUTO_INCREMENT,
  `fechapedido` int(11) NOT NULL,
  `descripcionPedido` varchar(50) NOT NULL,
  `USUARIOidUsuario` int(10) NOT NULL,
  PRIMARY KEY (`idpedido`),
  KEY `USUARIOidUsuario` (`USUARIOidUsuario`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`USUARIOidUsuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_cliente`
--

DROP TABLE IF EXISTS `pedido_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_cliente` (
  `PEDIDOidpedido` int(10) NOT NULL,
  `CLIENTEidcliente` int(10) NOT NULL,
  KEY `PEDIDOidpedido` (`PEDIDOidpedido`),
  KEY `CLIENTEidcliente` (`CLIENTEidcliente`),
  CONSTRAINT `pedido_cliente_ibfk_1` FOREIGN KEY (`PEDIDOidpedido`) REFERENCES `pedido` (`idpedido`),
  CONSTRAINT `pedido_cliente_ibfk_2` FOREIGN KEY (`CLIENTEidcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_cliente`
--

LOCK TABLES `pedido_cliente` WRITE;
/*!40000 ALTER TABLE `pedido_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precio`
--

DROP TABLE IF EXISTS `precio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `precio` (
  `idprecioproducto` int(10) NOT NULL AUTO_INCREMENT,
  `precioProducto` int(10) NOT NULL,
  PRIMARY KEY (`idprecioproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precio`
--

LOCK TABLES `precio` WRITE;
/*!40000 ALTER TABLE `precio` DISABLE KEYS */;
/*!40000 ALTER TABLE `precio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precio_producto`
--

DROP TABLE IF EXISTS `precio_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `precio_producto` (
  `PRODUCTOidProducto` int(10) NOT NULL,
  `PRECIOPRODUCTOidPrecioProducto` int(10) NOT NULL,
  KEY `PRODUCTOidProducto` (`PRODUCTOidProducto`),
  KEY `PRECIOPRODUCTOidPrecioProducto` (`PRECIOPRODUCTOidPrecioProducto`),
  CONSTRAINT `precio_producto_ibfk_1` FOREIGN KEY (`PRODUCTOidProducto`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `precio_producto_ibfk_2` FOREIGN KEY (`PRECIOPRODUCTOidPrecioProducto`) REFERENCES `precio` (`idprecioproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precio_producto`
--

LOCK TABLES `precio_producto` WRITE;
/*!40000 ALTER TABLE `precio_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `precio_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idProducto` int(10) NOT NULL AUTO_INCREMENT,
  `insumosproducto` varchar(50) NOT NULL,
  `observacionesproducto` varchar(50) NOT NULL,
  `caracteristicasproducto` varchar(50) NOT NULL,
  `PEDIDOidPedido` int(10) NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `PEDIDOidPedido` (`PEDIDOidPedido`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`PEDIDOidPedido`) REFERENCES `pedido` (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `idstock` int(10) NOT NULL AUTO_INCREMENT,
  `cantidadstock` int(10) NOT NULL,
  `PRODUCTOidProducto` int(10) NOT NULL,
  PRIMARY KEY (`idstock`),
  KEY `PRODUCTOidProducto` (`PRODUCTOidProducto`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`PRODUCTOidProducto`) REFERENCES `producto` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono` (
  `idtelefono` int(15) NOT NULL AUTO_INCREMENT,
  `telcelular` int(15) NOT NULL,
  PRIMARY KEY (`idtelefono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_usuario`
--

DROP TABLE IF EXISTS `telefono_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono_usuario` (
  `USUARIOidUsuario` int(10) NOT NULL,
  `TELEFONOidTelefono` int(15) NOT NULL,
  KEY `USUARIOidUsuario` (`USUARIOidUsuario`),
  KEY `TELEFONOidTelefono` (`TELEFONOidTelefono`),
  CONSTRAINT `telefono_usuario_ibfk_1` FOREIGN KEY (`USUARIOidUsuario`) REFERENCES `usuario` (`idusuario`),
  CONSTRAINT `telefono_usuario_ibfk_2` FOREIGN KEY (`TELEFONOidTelefono`) REFERENCES `telefono` (`idtelefono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_usuario`
--

LOCK TABLES `telefono_usuario` WRITE;
/*!40000 ALTER TABLE `telefono_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefono_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int(10) NOT NULL AUTO_INCREMENT,
  `nomUsuario` varchar(30) NOT NULL,
  `apellUsuario` varchar(30) NOT NULL,
  `telUsuario` int(10) NOT NULL,
  `emailUsuario` int(20) NOT NULL,
  `contUsuario` int(20) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `emailUsuario` (`emailUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_dirección`
--

DROP TABLE IF EXISTS `usuario_dirección`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_dirección` (
  `USUARIOidUsuario` int(10) NOT NULL,
  `DIRECCIÓNidDirección` int(15) NOT NULL,
  KEY `USUARIOidUsuario` (`USUARIOidUsuario`),
  KEY `DIRECCIÓNidDirección` (`DIRECCIÓNidDirección`),
  CONSTRAINT `usuario_dirección_ibfk_1` FOREIGN KEY (`USUARIOidUsuario`) REFERENCES `usuario` (`idusuario`),
  CONSTRAINT `usuario_dirección_ibfk_2` FOREIGN KEY (`DIRECCIÓNidDirección`) REFERENCES `dircción` (`idDirección`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_dirección`
--

LOCK TABLES `usuario_dirección` WRITE;
/*!40000 ALTER TABLE `usuario_dirección` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_dirección` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valor`
--

DROP TABLE IF EXISTS `valor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valor` (
  `idValorPedido` int(10) NOT NULL AUTO_INCREMENT,
  `valorPedio` int(10) NOT NULL,
  PRIMARY KEY (`idValorPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valor`
--

LOCK TABLES `valor` WRITE;
/*!40000 ALTER TABLE `valor` DISABLE KEYS */;
/*!40000 ALTER TABLE `valor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valor_pedido`
--

DROP TABLE IF EXISTS `valor_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valor_pedido` (
  `PEDIDOidPedido` int(10) NOT NULL,
  `VALORPEDIDOidValorPedido` int(10) NOT NULL,
  KEY `PEDIDOidPedido` (`PEDIDOidPedido`),
  KEY `VALORPEDIDOidValorPedido` (`VALORPEDIDOidValorPedido`),
  CONSTRAINT `valor_pedido_ibfk_1` FOREIGN KEY (`PEDIDOidPedido`) REFERENCES `pedido` (`idpedido`),
  CONSTRAINT `valor_pedido_ibfk_2` FOREIGN KEY (`VALORPEDIDOidValorPedido`) REFERENCES `valor` (`idValorPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valor_pedido`
--

LOCK TABLES `valor_pedido` WRITE;
/*!40000 ALTER TABLE `valor_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `valor_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sidi'
--

--
-- Dumping routines for database 'sidi'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-29 20:19:01
