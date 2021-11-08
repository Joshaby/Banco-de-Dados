-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: instituto
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

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
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `nome` varchar(30) NOT NULL,
  `sigla` varchar(5) NOT NULL,
  `codigo` int(11) NOT NULL,
  `coordenador` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `coordenador` (`coordenador`),
  CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`coordenador`) REFERENCES `professor` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES ('Tec. Telemática','DTT',121,121031),('Tec. Construção de Edifícios','DCE',122,122047),('Eng. Computação','DEC',125,125331);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependente`
--

DROP TABLE IF EXISTS `dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependente` (
  `matricprof` int(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `RG` int(11) NOT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `datanasc` date DEFAULT NULL,
  PRIMARY KEY (`matricprof`,`RG`),
  CONSTRAINT `dependente_ibfk_1` FOREIGN KEY (`matricprof`) REFERENCES `professor` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependente`
--

LOCK TABLES `dependente` WRITE;
/*!40000 ALTER TABLE `dependente` DISABLE KEYS */;
INSERT INTO `dependente` VALUES (121003,'José Henrique',1234,'M','2001-02-22'),(121003,'Henrique',1235,'M','2011-02-22'),(121003,'Maria',1236,'F','2003-10-02'),(121031,'Érica',1237,'F','2007-11-22'),(121031,'João',1238,'M','2008-11-30'),(121031,'Júlia',1436,'F','2004-01-03');
/*!40000 ALTER TABLE `dependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email` (
  `matricprof` int(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  PRIMARY KEY (`matricprof`,`email`),
  CONSTRAINT `email_ibfk_1` FOREIGN KEY (`matricprof`) REFERENCES `professor` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES (122047,'ana.clara@yahoo.com'),(125335,'joaocarlos@gmail.com');
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `nome` varchar(20) NOT NULL,
  `snome` varchar(40) NOT NULL,
  `matricula` int(11) NOT NULL,
  `datanasc` date DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `salario` decimal(7,2) DEFAULT NULL,
  `matric_coord_area` int(11) DEFAULT NULL,
  `depto` int(11) DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  KEY `depto` (`depto`),
  CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`depto`) REFERENCES `departamento` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES ('Pedro','Pereira da Silva',121003,'1982-03-25','M',4000.00,NULL,121),('José Maria','Campos',121031,'1978-04-10','M',7000.00,121003,121),('Bento','Diniz Costa',122045,'1980-11-27','M',4000.00,NULL,122),('Ana Clara','Araújo Santos',122047,'1994-12-30','F',7200.00,122045,122),('Maria Luiza','Machado',125331,'1974-08-16','F',6800.00,125332,125),('Joana Maria','Pereira',125332,'1990-06-12','F',4500.00,NULL,125),('João Carlos','Matos Cavalcanti',125335,'1976-07-22','M',3700.00,125332,125);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto`
--

DROP TABLE IF EXISTS `projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projeto` (
  `nome` varchar(40) NOT NULL,
  `codigo` int(11) NOT NULL,
  `depto` int(11) DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `depto` (`depto`),
  CONSTRAINT `projeto_ibfk_1` FOREIGN KEY (`depto`) REFERENCES `departamento` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto`
--

LOCK TABLES `projeto` WRITE;
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
INSERT INTO `projeto` VALUES ('Aplicações do NoSQL',1,121,10),('Projeto 2',2,122,20),('Projeto 3',3,122,15),('Projeto 4',4,125,40),('Projeto 5',7,125,60),('Projeto 6',11,121,60),('Projeto 7',12,121,50);
/*!40000 ALTER TABLE `projeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefone` (
  `matricprof` int(11) NOT NULL,
  `telefone` int(11) NOT NULL,
  PRIMARY KEY (`matricprof`,`telefone`),
  CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`matricprof`) REFERENCES `professor` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabalha_em`
--

DROP TABLE IF EXISTS `trabalha_em`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabalha_em` (
  `matricprof` int(11) NOT NULL,
  `codproj` int(11) NOT NULL,
  `horas` time DEFAULT NULL,
  PRIMARY KEY (`matricprof`,`codproj`),
  KEY `codproj` (`codproj`),
  CONSTRAINT `trabalha_em_ibfk_1` FOREIGN KEY (`matricprof`) REFERENCES `professor` (`matricula`),
  CONSTRAINT `trabalha_em_ibfk_2` FOREIGN KEY (`codproj`) REFERENCES `projeto` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabalha_em`
--

LOCK TABLES `trabalha_em` WRITE;
/*!40000 ALTER TABLE `trabalha_em` DISABLE KEYS */;
/*!40000 ALTER TABLE `trabalha_em` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-10 13:09:30
