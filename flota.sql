-- MySQL dump 10.17  Distrib 10.3.22-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 172.17.0.2    Database: flota
-- ------------------------------------------------------
-- Server version	10.5.2-MariaDB-1:10.5.2+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `estado_reserva`
--

DROP TABLE IF EXISTS `estado_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_reserva` (
  `id_estado_reserva` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_tipo_estado_reserva` int(11) NOT NULL,
  `id_reserva` bigint(20) NOT NULL,
  `fecha` date NOT NULL,
  `actual` bit(1) NOT NULL,
  `observaciones` text DEFAULT NULL,
  `responsable` varchar(155) NOT NULL,
  PRIMARY KEY (`id_estado_reserva`),
  KEY `id_tipo_estado_reserva` (`id_tipo_estado_reserva`),
  KEY `id_reserva` (`id_reserva`),
  CONSTRAINT `estado_reserva_ibfk_1` FOREIGN KEY (`id_tipo_estado_reserva`) REFERENCES `tipo_estado_reserva` (`id_tipo_estado_reserva`),
  CONSTRAINT `estado_reserva_ibfk_2` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_reserva`
--

LOCK TABLES `estado_reserva` WRITE;
/*!40000 ALTER TABLE `estado_reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_vehiculo`
--

DROP TABLE IF EXISTS `estado_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_vehiculo` (
  `id_estado_vehiculo` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_tipo_estado_vehiculo` int(11) NOT NULL,
  `id_vehiculo` bigint(20) NOT NULL,
  `fecha` date NOT NULL,
  `estado_actual` bit(1) NOT NULL,
  PRIMARY KEY (`id_estado_vehiculo`),
  KEY `id_tipo_estado_vehiculo` (`id_tipo_estado_vehiculo`),
  KEY `id_vehiculo` (`id_vehiculo`),
  CONSTRAINT `estado_vehiculo_ibfk_1` FOREIGN KEY (`id_tipo_estado_vehiculo`) REFERENCES `tipo_estado_vehiculo` (`id_tipo_estado_vehiculo`) ON DELETE CASCADE,
  CONSTRAINT `estado_vehiculo_ibfk_2` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_vehiculo`
--

LOCK TABLES `estado_vehiculo` WRITE;
/*!40000 ALTER TABLE `estado_vehiculo` DISABLE KEYS */;
INSERT INTO `estado_vehiculo` VALUES (1,4,1,'2018-09-05',''),(2,4,2,'2018-09-05',''),(3,4,3,'2018-09-05',''),(4,4,4,'2018-09-05',''),(5,4,5,'2018-09-05',''),(6,3,6,'2018-09-05','\0');
/*!40000 ALTER TABLE `estado_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(155) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `activo` bit(1) NOT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Toyota','Marca Toyota',''),(2,'Nissan','Marca Nissan',''),(3,'Honda','Marca Honda',''),(4,'Chevrolet','Marca Chevrolet',''),(5,'Mazda','Marca Mazda',''),(6,'Ford','Marca Ford',''),(7,'Subaru','Marca Subaru',''),(8,'Audi','Marca audi',''),(9,'Ferrari','Marca ferrari',''),(10,'Audi','Marca Audi','');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo` (
  `id_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `id_marca` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `anio` int(11) DEFAULT NULL,
  `id_tipo_vehiculo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_modelo`),
  KEY `id_marca` (`id_marca`),
  KEY `id_tipo_vehiculo` (`id_tipo_vehiculo`),
  CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`),
  CONSTRAINT `modelo_ibfk_2` FOREIGN KEY (`id_tipo_vehiculo`) REFERENCES `tipo_vehiculo` (`id_tipo_vehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,1,'Corrolla',2016,1),(2,1,'Yaris',2017,5),(3,1,'Hilux',2016,2),(4,1,'Supra',2015,4),(5,1,'Rava',2017,3),(6,2,'Sentra',2017,1),(7,2,'Pathfinder',2018,3),(8,2,'Navara',2016,2),(9,2,'Versa',2015,5),(10,3,'Fit',2016,5),(11,3,'Civic',2017,1),(12,3,'CR-V',2018,3),(13,3,'Ridgeline',2017,2),(14,4,'Volt',2016,1),(15,4,'Aveo',2018,5),(16,4,'Captiva',2016,3),(17,4,'Camaro',2017,4),(18,4,'Cruze',2015,1),(19,5,'Mazda-6',2016,1),(20,5,'Mazda-3',2015,5),(21,5,'CX-5',2018,3),(22,5,'BT-50',2017,2),(23,5,'MX-5',2018,4),(24,6,'Focus',2018,1),(25,6,'Scape',2017,3),(26,6,'Ranger',2018,2),(27,6,'Fiesta',2016,5),(28,6,'Mustang',2018,4);
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo_parte`
--

DROP TABLE IF EXISTS `modelo_parte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo_parte` (
  `id_modelo_parte` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_modelo` int(11) NOT NULL,
  `id_parte` int(11) NOT NULL,
  `activo` bit(1) NOT NULL,
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id_modelo_parte`),
  KEY `id_modelo` (`id_modelo`),
  KEY `id_parte` (`id_parte`),
  CONSTRAINT `modelo_parte_ibfk_1` FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`id_modelo`) ON DELETE CASCADE,
  CONSTRAINT `modelo_parte_ibfk_2` FOREIGN KEY (`id_parte`) REFERENCES `parte` (`id_parte`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_parte`
--

LOCK TABLES `modelo_parte` WRITE;
/*!40000 ALTER TABLE `modelo_parte` DISABLE KEYS */;
INSERT INTO `modelo_parte` VALUES (1,1,1,'','No hay Observaciones');
/*!40000 ALTER TABLE `modelo_parte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parte`
--

DROP TABLE IF EXISTS `parte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parte` (
  `id_parte` int(11) NOT NULL AUTO_INCREMENT,
  `id_sub_tipo_parte` int(11) NOT NULL,
  `nombre` varchar(155) NOT NULL,
  `activo` bit(1) NOT NULL,
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id_parte`),
  KEY `id_sub_tipo_parte` (`id_sub_tipo_parte`),
  CONSTRAINT `parte_ibfk_1` FOREIGN KEY (`id_sub_tipo_parte`) REFERENCES `sub_tipo_parte` (`id_sub_tipo_parte`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parte`
--

LOCK TABLES `parte` WRITE;
/*!40000 ALTER TABLE `parte` DISABLE KEYS */;
INSERT INTO `parte` VALUES (1,1,'Bujias','','Son Las Bujias del Motor'),(2,1,'Arbol de Levas','','Es el Arbol de Levas del Motor'),(3,2,'Pistones','','Son Los Pistones del Motor'),(4,2,'Esparragos de Sujecion','','Son Los Esparragos de Sujesion del Motor'),(5,2,'Conductos de Lubricacion','','Son los Conductos de Lubricacion'),(6,2,'Conductos de Refrigeracion','','Son los Conductos de Refrigeracion'),(7,3,'Cigueñal','','Es el Cigueñal del Motor'),(8,3,'Bomba de Aceite','','ES la Bomba de Aceite del Motor');
/*!40000 ALTER TABLE `parte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recorrido`
--

DROP TABLE IF EXISTS `recorrido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recorrido` (
  `id_recorrido` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_reserva` bigint(20) NOT NULL,
  `coordenada_inicial` varchar(155) NOT NULL,
  `coordenada_final` varchar(155) NOT NULL,
  `fecha_desde` date NOT NULL,
  `fecha_hasta` date NOT NULL,
  `hora_desde` time NOT NULL,
  `hora_hasta` time NOT NULL,
  PRIMARY KEY (`id_recorrido`),
  KEY `id_reserva` (`id_reserva`),
  CONSTRAINT `recorrido_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `viaje` (`id_reserva`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recorrido`
--

LOCK TABLES `recorrido` WRITE;
/*!40000 ALTER TABLE `recorrido` DISABLE KEYS */;
/*!40000 ALTER TABLE `recorrido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `id_reserva` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_vehiculo` bigint(20) NOT NULL,
  `cliente` varchar(255) DEFAULT NULL,
  `unidad` varchar(255) DEFAULT NULL,
  `fecha_reserva` date NOT NULL,
  `fecha_solicitada` date NOT NULL,
  `id_tipo_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `id_vehiculo` (`id_vehiculo`),
  KEY `id_tipo_usuario` (`id_tipo_usuario`),
  CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`),
  CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_tipo_parte`
--

DROP TABLE IF EXISTS `sub_tipo_parte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_tipo_parte` (
  `id_sub_tipo_parte` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_parte` int(11) NOT NULL,
  `nombre` varchar(155) NOT NULL,
  `activo` bit(1) NOT NULL,
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id_sub_tipo_parte`),
  KEY `id_tipo_parte` (`id_tipo_parte`),
  CONSTRAINT `sub_tipo_parte_ibfk_1` FOREIGN KEY (`id_tipo_parte`) REFERENCES `tipo_parte` (`id_tipo_parte`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_tipo_parte`
--

LOCK TABLES `sub_tipo_parte` WRITE;
/*!40000 ALTER TABLE `sub_tipo_parte` DISABLE KEYS */;
INSERT INTO `sub_tipo_parte` VALUES (1,1,'Culata','','Es Una Parte del Motor'),(2,1,'Bloque','','Es Una Parte del Motor'),(3,1,'Carter','','Es Una Parte del Motor'),(4,2,'Puertas','','Es Una Parte De La Carroceria'),(5,2,'Parachoques','','Es Una Parte De La Carroceria'),(6,2,'Capo','','Es Una Parte De La Carroceria'),(7,2,'Retrovisores','','Es Una Parte De La Carroceria'),(8,2,'Luces','','Es Una Parte De La Carroceria'),(9,3,'Asientos','','Es Una Parte Del Interior'),(10,3,'Timon','','Es Una Parte Del Interior'),(11,3,'Radio-Reproductor','','Es Una Parte Del Interior'),(12,3,'Tablero de Control','','Es Una Parte Del Interior'),(13,3,'Palanca de Velocidades','','Es Una Parte Del Interior'),(14,3,'Tapiceria','','Es Una Parte Del Interior'),(15,4,'Caja de Velocidades','','Es Una Parte Del Tren Propulsor'),(16,4,'Barra de Transmision','','Es Una Parte Del Tren Propulsor'),(17,4,'Eje Directriz','','Es Una Parte Del Tren Propulsor'),(18,4,'Puente Motriz','','Es Una Parte Del Tren Propulsor'),(19,5,'Rin','','Es Una Parte Del Vehiculo'),(20,5,'LLanta','','Es Una Parte Del Vehiculo'),(21,5,'Frenos','','Es Una Parte Del Vehiculo'),(22,6,'Amortiguador','','Es Una Parte De La Suspencion'),(23,6,'Muelle','','Es Una Parte De La Suspencion'),(24,6,'Trapecio Superior','','Es Una Parte De La Suspencion'),(25,6,'Trapecio Inferior','','Es Una Parte De La Suspencion'),(26,7,'Soporte de La Direccion','',' Es Una Parte De La Direccion'),(27,7,'Bieletas de Mando','','Es Una Parte De La Direccion'),(28,7,'Brazo de Acoplamiento','','Es Una Parte De La Direccion'),(29,8,'Caja de Torsion','','Es Una Parte Del Chasis'),(30,8,'Barras de Torsion','','Es Una Parte Del Chasis'),(31,8,'Nivelador Manual de Altura','','Es Una Parte Del Chasis'),(32,9,'Sistema de Generacion y Amacenamiento','','Es Una Parte Del Sistema Electrico'),(33,9,'Sistema de Encendido','','Es Una Parte Del Sistema Electrico'),(34,9,'Sistema de Iluminacion','','Es Una Parte Del Sistema Electrico');
/*!40000 ALTER TABLE `sub_tipo_parte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_estado_reserva`
--

DROP TABLE IF EXISTS `tipo_estado_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_estado_reserva` (
  `id_tipo_estado_reserva` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(155) NOT NULL,
  `activo` bit(1) NOT NULL,
  `indica_aprobacion` bit(1) NOT NULL,
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id_tipo_estado_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_estado_reserva`
--

LOCK TABLES `tipo_estado_reserva` WRITE;
/*!40000 ALTER TABLE `tipo_estado_reserva` DISABLE KEYS */;
INSERT INTO `tipo_estado_reserva` VALUES (1,'En Proceso','','\0','Ninguna'),(2,'En Espera','','\0','Ninguna'),(3,'Aprobada','','','Ninguna'),(4,'Denegada','','\0','Ninguna');
/*!40000 ALTER TABLE `tipo_estado_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_estado_vehiculo`
--

DROP TABLE IF EXISTS `tipo_estado_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_estado_vehiculo` (
  `id_tipo_estado_vehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(155) NOT NULL,
  `activo` bit(1) NOT NULL,
  `observaciones` text NOT NULL,
  `no_disponible` bit(1) NOT NULL,
  PRIMARY KEY (`id_tipo_estado_vehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_estado_vehiculo`
--

LOCK TABLES `tipo_estado_vehiculo` WRITE;
/*!40000 ALTER TABLE `tipo_estado_vehiculo` DISABLE KEYS */;
INSERT INTO `tipo_estado_vehiculo` VALUES (1,'En Uso','','El Auto Esta En Uso ',''),(2,'Alquilado','','El Auto Esta Alquilado a Una Persona',''),(3,'En Reparacion','','El Auto Esta En Reparacion',''),(4,'Disponible','','El Auto Esta Disponible','\0');
/*!40000 ALTER TABLE `tipo_estado_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_parte`
--

DROP TABLE IF EXISTS `tipo_parte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_parte` (
  `id_tipo_parte` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(155) NOT NULL,
  `activo` bit(1) NOT NULL,
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id_tipo_parte`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_parte`
--

LOCK TABLES `tipo_parte` WRITE;
/*!40000 ALTER TABLE `tipo_parte` DISABLE KEYS */;
INSERT INTO `tipo_parte` VALUES (1,'Motor','','Ninguna'),(2,'Carroceria','','Ninguna'),(3,'Interiores','','Ninguna'),(4,'Tren Propulsor','','Ninguna'),(5,'Rines,Llantas,Frenos','','Ninguna'),(6,'Suspension','','Ninguna'),(7,'Dirección ','','Ninguna'),(8,'Chasis','','Ninguna'),(9,'Sistema Electrico','','Ninguna');
/*!40000 ALTER TABLE `tipo_parte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(155) NOT NULL,
  `app_id` varchar(155) NOT NULL,
  `activo` bit(1) NOT NULL,
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'Andrew','1','','Ninguna Observacion'),(2,'Misha','2','','Ninguna Observacion'),(3,'Kelly','3','','Ninguna Observacion'),(4,'Maxim','4','','Ninguna Observacion'),(5,'Nikita','5','','Ninguna Observacion'),(6,'Kla','6','','Ninguna Observacion'),(7,'Paloma','7','','Ninguna Observacion'),(8,'Olivia','8','','Ninguna Observacion'),(9,'Ford','9','','Ninguna Observacion');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_vehiculo`
--

DROP TABLE IF EXISTS `tipo_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_vehiculo` (
  `id_tipo_vehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `peso_min_lbs` float DEFAULT NULL,
  `peso_max_lbs` float DEFAULT NULL,
  `cantidad_ejes` int(11) DEFAULT NULL,
  `activo` bit(1) NOT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`id_tipo_vehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_vehiculo`
--

LOCK TABLES `tipo_vehiculo` WRITE;
/*!40000 ALTER TABLE `tipo_vehiculo` DISABLE KEYS */;
INSERT INTO `tipo_vehiculo` VALUES (1,'Sedan',1000.75,1300.75,2,'','Es Un Vehiculo Tipo Sedan'),(2,'PickUp',1250,1450,2,'\0','Es Un Vehiculo Tipo Pick Up'),(3,'Camioneta',1300.45,1500.5,2,'','Es Un Vehiculo Tipo Camioneta'),(4,'Deportivo',1000,1100,2,'','Es Un Deportivo'),(5,'HatchBack',900,1100,2,'','Es Un hatchback');
/*!40000 ALTER TABLE `tipo_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo` (
  `id_vehiculo` bigint(20) NOT NULL AUTO_INCREMENT,
  `numero_chasis` varchar(255) NOT NULL,
  `numero_vin` varchar(255) NOT NULL,
  `id_modelo` int(11) NOT NULL,
  `numero_placa` varchar(155) DEFAULT NULL,
  `asientos` int(11) DEFAULT NULL,
  `color` varchar(155) NOT NULL,
  PRIMARY KEY (`id_vehiculo`),
  KEY `id_modelo` (`id_modelo`),
  CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`id_modelo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES (1,'ABCDEFG0123456789','ABCDEFG0123456789',1,'P123789',4,'Rojo'),(2,'ABCDEFG0123456789','ABCDEFG0123456789',2,'P357456',4,'Negro'),(3,'ABCDEFG0123456789','ABCDEFG0123456789',3,'P963481',4,'Gris'),(4,'ABCDEFG0123456789','ABCDEFG0123456789',4,'P852145',2,'Negro'),(5,'ABCDEFG0123456789','ABCDEFG0123456789',5,'P96456',4,'Azul'),(6,'ABCDEFG0123456789','ABCDEFG0123456789',6,'P96345',4,'Verde');
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaje`
--

DROP TABLE IF EXISTS `viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viaje` (
  `id_reserva` bigint(20) NOT NULL,
  `fecha_desde` date NOT NULL,
  `fecha_hasta` int(11) NOT NULL,
  `kilometros` float NOT NULL,
  `motorista` varchar(155) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `hora_salida` time NOT NULL,
  `hora_llegada` time NOT NULL,
  PRIMARY KEY (`id_reserva`),
  CONSTRAINT `viaje_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje`
--

LOCK TABLES `viaje` WRITE;
/*!40000 ALTER TABLE `viaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `viaje` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-30  0:41:38
