-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: db_punto_venta
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(60) NOT NULL,
  `Apellidos` varchar(60) NOT NULL,
  `NIT` varchar(12) NOT NULL,
  `Genero` bit(1) NOT NULL,
  `Telefono` varchar(25) NOT NULL,
  `Correo_electronico` varchar(45) NOT NULL,
  `Fecha_ingreso` datetime NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Luis Carlos','Sanches Torres','12k2l',_binary '','7788998','luisc@gmail.com','2004-10-11 00:00:00'),(2,'Juan Carlos','Tul Torres','23k23',_binary '','77823218','carlosc@gmail.com','2007-11-12 00:00:00'),(3,'Mario David','Sul Torres','23k23',_binary '','77823218','carlosc@gmail.com','2007-11-12 00:00:00'),(4,'Mario ','Rancho Torres','23k89',_binary '','45883218','mariosc@gmail.com','2009-11-22 00:00:00'),(5,'Karla Andrea ','Sandro Cas','83k12',_binary '\0','45008218','karla@gmail.com','2012-07-29 00:00:00');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras` (
  `idCompra` int NOT NULL AUTO_INCREMENT,
  `No_orden_compra` int NOT NULL,
  `idproveedor` int NOT NULL,
  `Fecha_orden` date NOT NULL,
  `Fecha_ingreso` datetime NOT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `idproveedor_proveedor_idproveedor_idx` (`idproveedor`),
  CONSTRAINT `idproveedor_proveedor_idproveedor` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`idProveedore`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,1,1,'2021-04-10','2021-04-15 21:33:55'),(2,2,1,'2021-04-10','2021-04-15 21:44:38'),(3,2,1,'2021-04-10','2021-04-15 21:44:44'),(4,2,1,'2021-04-10','2021-04-15 21:44:44'),(5,2,3,'2021-04-10','2021-04-15 21:44:58'),(6,2,3,'2021-04-10','2021-04-15 21:44:59');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_detalle`
--

DROP TABLE IF EXISTS `compras_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras_detalle` (
  `idCompra_detalle` int NOT NULL AUTO_INCREMENT,
  `idcompra` int NOT NULL,
  `idProducto` int NOT NULL,
  `Cantidad` int NOT NULL,
  `Precio_costo_unitario` decimal(8,2) NOT NULL,
  PRIMARY KEY (`idCompra_detalle`),
  KEY `idproducto_productos-idproducto_idx` (`idProducto`),
  KEY `idcompra_compra_idcompra_idx` (`idcompra`),
  CONSTRAINT `idcompra_compra_idcompra` FOREIGN KEY (`idcompra`) REFERENCES `compras` (`idCompra`) ON UPDATE CASCADE,
  CONSTRAINT `idproducto_productos?idproducto` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_detalle`
--

LOCK TABLES `compras_detalle` WRITE;
/*!40000 ALTER TABLE `compras_detalle` DISABLE KEYS */;
INSERT INTO `compras_detalle` VALUES (1,1,1,20,10.50),(2,2,1,20,10.50),(3,2,1,20,10.50),(4,3,1,20,10.50),(5,4,1,20,44.50),(6,5,1,12,60.00);
/*!40000 ALTER TABLE `compras_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `idEmpleado` int NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(60) NOT NULL,
  `Apellidos` varchar(60) NOT NULL,
  `Direccion` varchar(80) NOT NULL,
  `Telefono` varchar(25) NOT NULL,
  `DPI` varchar(25) NOT NULL,
  `Genero` bit(1) NOT NULL,
  `Fecha_nacimiento` date NOT NULL,
  `id_Puesto` smallint NOT NULL,
  `Fecha_inicio_laborales` date NOT NULL,
  `Fecha_ingreso` datetime NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `idPuesto_empleados_idPuesto_idx` (`id_Puesto`),
  CONSTRAINT `idPuesto_empleados_idPuesto` FOREIGN KEY (`id_Puesto`) REFERENCES `puestos` (`Idpuesto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Luis Fernando','Paxel peres','Santo Tomas','12121233','k89k12123fg',_binary '','2002-12-10',2,'1999-09-12','2021-04-15 19:30:31'),(2,'jose Fernando','Sul peres','Santa Ana','12123233','k89p232123fg',_binary '','1778-09-10',3,'2004-09-12','2021-04-15 19:31:50'),(3,'jose Luis','Sul Cantona','Santa Maria de Jesus','12123233','k89tE2123fg',_binary '','1779-03-11',3,'2006-09-12','2021-04-15 19:33:13'),(4,'Ana Lucia','Castillo Gomez','Santa Maria de Jesus','12132233','k09tE2hg23fg',_binary '\0','1999-03-11',5,'2018-09-12','2021-04-15 19:34:11'),(5,'Karen Nicte','Castillo Perez','Ciudad Vieja','99832233','k09tE43g23fg',_binary '\0','2000-03-09',5,'2019-10-12','2021-04-15 19:35:21');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `idlogin` int NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(75) NOT NULL,
  `Apellidos` varchar(75) NOT NULL,
  `Correo` varchar(120) NOT NULL,
  `Password` varchar(60) NOT NULL,
  PRIMARY KEY (`idlogin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marcas` (
  `idMarca` smallint NOT NULL AUTO_INCREMENT,
  `Marca` varchar(50) NOT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Nestle'),(2,'Diana'),(3,'Tortrix'),(4,'Nike'),(5,'Coca Cola');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `Producto` varchar(50) NOT NULL,
  `idMarca` smallint NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Imagen` varchar(30) NOT NULL,
  `Precio_costo` decimal(8,2) NOT NULL,
  `Precio_venta` decimal(8,2) NOT NULL,
  `Existencia` int NOT NULL,
  `Fecha_ingreso` datetime NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `idmarca_marcas_idmarca_idx` (`idMarca`),
  CONSTRAINT `idmarca_marcas_idmarca` FOREIGN KEY (`idMarca`) REFERENCES `marcas` (`idMarca`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Leche',1,'bote Forticrece','jpg',45.00,48.50,167,'2021-04-15 21:18:47'),(2,'Leche',1,'bote Nan 1','jpg',51.75,55.00,240,'2021-04-15 21:19:40'),(3,'Leche',1,'bote Nan 1','jpg',51.75,55.00,240,'2021-04-15 21:19:54'),(4,'Leche',1,'bote Nan 2','jpg',56.75,60.00,120,'2021-04-15 21:20:26'),(5,'Coca Cola',5,'Light 2.5 litros','jpg',15.50,17.00,180,'2021-04-15 21:21:33');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `idProveedore` int NOT NULL AUTO_INCREMENT,
  `Proveedor` varchar(60) NOT NULL,
  `Nit` varchar(12) NOT NULL,
  `Direccion` varchar(80) NOT NULL,
  `Telefono` varchar(25) NOT NULL,
  PRIMARY KEY (`idProveedore`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Nestle, S.A.','Tr27m','Ciudad de Guatemala','45008218'),(2,'Diana, S.A.','Sr24-p','San Salvador','4534218'),(3,'Tortrix, S.A.','Sm24-z','Ciudad de Guatemala','45323233'),(4,'Coca Cola, S.A.','Sh31-z','Ciudad de Guatemala','41223233'),(5,'Nike, S.A.','nr98-z','Chimaltenango','00823233');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puestos` (
  `Idpuesto` smallint NOT NULL AUTO_INCREMENT,
  `Puesto` varchar(50) NOT NULL,
  PRIMARY KEY (`Idpuesto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` VALUES (1,'Secretario'),(2,'Nestle'),(3,'Incaparina'),(4,'Tres pinos'),(5,'Cajero'),(6,'Seguridad');
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `idVenta` int NOT NULL AUTO_INCREMENT,
  `No_factura` int NOT NULL,
  `Serie` char(1) NOT NULL,
  `Fecha_factura` date NOT NULL,
  `Idcliente` int NOT NULL,
  `idempleado` int NOT NULL,
  `Fecha_ingreso` datetime NOT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `idcliente_clientes_idcliente_idx` (`Idcliente`),
  KEY `idempleado_empleado_idempleado_idx` (`idempleado`),
  CONSTRAINT `idcliente_clientes_idcliente` FOREIGN KEY (`Idcliente`) REFERENCES `clientes` (`idCliente`) ON UPDATE CASCADE,
  CONSTRAINT `idempleado_empleado_idempleado` FOREIGN KEY (`idempleado`) REFERENCES `empleados` (`idEmpleado`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,'k','2021-04-08',1,2,'2021-04-15 21:06:16'),(2,1,'k','2021-04-08',1,2,'2021-04-15 21:06:19'),(3,2,'k','2021-02-05',1,2,'2021-04-15 21:07:19'),(4,3,'k','2020-02-05',2,3,'2021-04-15 21:07:44'),(5,4,'k','2019-05-05',3,1,'2021-04-15 21:08:08'),(6,5,'k','2021-02-27',3,1,'2021-04-15 21:09:27');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_detalle`
--

DROP TABLE IF EXISTS `ventas_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas_detalle` (
  `idVentas_detalle` bigint NOT NULL AUTO_INCREMENT,
  `idVenta` int NOT NULL,
  `idProducto` int NOT NULL,
  `Cantidad` varchar(45) NOT NULL,
  `Precio_unitario` decimal(8,2) NOT NULL,
  PRIMARY KEY (`idVentas_detalle`),
  KEY `idventas_ventas_idventas_idx` (`idVenta`),
  KEY `idproducto_productos_idproducto_idx` (`idProducto`),
  CONSTRAINT `idproducto_productos_idproducto` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON UPDATE CASCADE,
  CONSTRAINT `idventas_ventas_idventas` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`idVenta`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_detalle`
--

LOCK TABLES `ventas_detalle` WRITE;
/*!40000 ALTER TABLE `ventas_detalle` DISABLE KEYS */;
INSERT INTO `ventas_detalle` VALUES (1,1,1,'4',45.00),(2,1,1,'4',45.00),(3,1,1,'8',45.00),(4,1,1,'1',45.00),(5,1,5,'1',17.00);
/*!40000 ALTER TABLE `ventas_detalle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-23 18:35:06
