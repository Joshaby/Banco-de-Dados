-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: ControleAcademico
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
-- Table structure for table `Aluno`
--

DROP TABLE IF EXISTS `Aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Aluno` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `filiacao` varchar(50) DEFAULT NULL,
  `rua` varchar(50) NOT NULL,
  `numero` smallint(6) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `CEP` varchar(9) NOT NULL,
  `sexo` enum('M','F') NOT NULL,
  `codigoCurso` tinyint(4) NOT NULL,
  `codigoTurma` tinyint(4) NOT NULL,
  `semestre` varchar(6) NOT NULL,
  PRIMARY KEY (`matricula`),
  KEY `codigoCurso` (`codigoCurso`),
  KEY `codigoTurma` (`codigoTurma`),
  CONSTRAINT `Aluno_ibfk_1` FOREIGN KEY (`codigoCurso`) REFERENCES `Curso` (`codigo`),
  CONSTRAINT `Aluno_ibfk_2` FOREIGN KEY (`codigoTurma`) REFERENCES `Turma` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aluno`
--

LOCK TABLES `Aluno` WRITE;
/*!40000 ALTER TABLE `Aluno` DISABLE KEYS */;
INSERT INTO `Aluno` VALUES (12345,'Amora Quirino Faleiro','Zé Loio Valadim','Rua São Pedro de Itapuã',77,'Itapuã','41610-770','F',45,9,'5'),(1245689,'Wallace Mascarenhas Gabeira','Dennis Caniça Vinhas','Avenida das Guianas',1627,'Treze de Setembro','69308-970','M',59,123,'1'),(1423345,'Alina Soverosa Pestana','Penélope Farias Candal','Travessa KM 6',33,'Zona de Expansão (Robalo)','49004-258','F',45,9,'5'),(3124413,'Emílio Gomide Bingre','Zihao Candeias Filipe','Rua Umberto Lobato Rodrigues',44,'Planalto','69044-040','M',59,123,'1');
/*!40000 ALTER TABLE `Aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AlunoDisciplina`
--

DROP TABLE IF EXISTS `AlunoDisciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AlunoDisciplina` (
  `matriculaAluno` int(11) NOT NULL,
  `codigoDisciplina` tinyint(4) NOT NULL,
  `semestre` varchar(6) NOT NULL,
  `nota` decimal(5,2) NOT NULL,
  PRIMARY KEY (`matriculaAluno`,`codigoDisciplina`),
  KEY `codigoDisciplina` (`codigoDisciplina`),
  CONSTRAINT `AlunoDisciplina_ibfk_1` FOREIGN KEY (`matriculaAluno`) REFERENCES `Aluno` (`matricula`),
  CONSTRAINT `AlunoDisciplina_ibfk_2` FOREIGN KEY (`codigoDisciplina`) REFERENCES `Disciplina` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AlunoDisciplina`
--

LOCK TABLES `AlunoDisciplina` WRITE;
/*!40000 ALTER TABLE `AlunoDisciplina` DISABLE KEYS */;
INSERT INTO `AlunoDisciplina` VALUES (12345,32,'5',55.00),(1245689,32,'1',80.00),(1423345,122,'5',100.00),(3124413,19,'5',70.00);
/*!40000 ALTER TABLE `AlunoDisciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AvaliadorTCC`
--

DROP TABLE IF EXISTS `AvaliadorTCC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AvaliadorTCC` (
  `matriculaProfessor` int(11) NOT NULL,
  `codigoTCC` int(11) NOT NULL,
  PRIMARY KEY (`matriculaProfessor`,`codigoTCC`),
  KEY `codigoTCC` (`codigoTCC`),
  CONSTRAINT `AvaliadorTCC_ibfk_1` FOREIGN KEY (`matriculaProfessor`) REFERENCES `Professor` (`matricula`),
  CONSTRAINT `AvaliadorTCC_ibfk_2` FOREIGN KEY (`codigoTCC`) REFERENCES `TCC` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AvaliadorTCC`
--

LOCK TABLES `AvaliadorTCC` WRITE;
/*!40000 ALTER TABLE `AvaliadorTCC` DISABLE KEYS */;
INSERT INTO `AvaliadorTCC` VALUES (456873465,3245),(567593474,657);
/*!40000 ALTER TABLE `AvaliadorTCC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Curso`
--

DROP TABLE IF EXISTS `Curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Curso` (
  `codigo` tinyint(4) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `duracao` tinyint(4) NOT NULL,
  `codigoDepartamento` tinyint(4) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigoDepartamento` (`codigoDepartamento`),
  CONSTRAINT `Curso_ibfk_1` FOREIGN KEY (`codigoDepartamento`) REFERENCES `Departamento` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Curso`
--

LOCK TABLES `Curso` WRITE;
/*!40000 ALTER TABLE `Curso` DISABLE KEYS */;
INSERT INTO `Curso` VALUES (45,'Probabilidade e Estatística',5,2),(59,'Ciência da computação',6,1);
/*!40000 ALTER TABLE `Curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Departamento`
--

DROP TABLE IF EXISTS `Departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Departamento` (
  `codigo` tinyint(4) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `matriculaProfessor` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `matriculaProfessor` (`matriculaProfessor`),
  CONSTRAINT `Departamento_ibfk_1` FOREIGN KEY (`matriculaProfessor`) REFERENCES `Professor` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departamento`
--

LOCK TABLES `Departamento` WRITE;
/*!40000 ALTER TABLE `Departamento` DISABLE KEYS */;
INSERT INTO `Departamento` VALUES (1,'Coord. Ciência da Computação',918273645),(2,'Coord. de Matemática',456873465);
/*!40000 ALTER TABLE `Departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Disciplina`
--

DROP TABLE IF EXISTS `Disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Disciplina` (
  `codigo` tinyint(4) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cargaHoraria` tinyint(4) NOT NULL,
  `ementa` tinyint(4) NOT NULL,
  `status` enum('OB','OP') NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disciplina`
--

LOCK TABLES `Disciplina` WRITE;
/*!40000 ALTER TABLE `Disciplina` DISABLE KEYS */;
INSERT INTO `Disciplina` VALUES (14,'Software básico',33,57,'OB'),(15,'Modelos analíticos e de simulação',33,19,'OP'),(19,'Probabilidade e estatística aplicadas',47,16,'OB'),(32,'Processos estocásticos especiais',123,55,'OB'),(89,'Lógicas e semântica de programas',67,10,'OB'),(122,'Análise multivariada',60,57,'OB');
/*!40000 ALTER TABLE `Disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DisciplinaCurso`
--

DROP TABLE IF EXISTS `DisciplinaCurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DisciplinaCurso` (
  `codigoDisciplina` tinyint(4) NOT NULL,
  `codigoCurso` tinyint(4) NOT NULL,
  PRIMARY KEY (`codigoDisciplina`,`codigoCurso`),
  KEY `codigoCurso` (`codigoCurso`),
  CONSTRAINT `DisciplinaCurso_ibfk_1` FOREIGN KEY (`codigoDisciplina`) REFERENCES `Disciplina` (`codigo`),
  CONSTRAINT `DisciplinaCurso_ibfk_2` FOREIGN KEY (`codigoCurso`) REFERENCES `Curso` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DisciplinaCurso`
--

LOCK TABLES `DisciplinaCurso` WRITE;
/*!40000 ALTER TABLE `DisciplinaCurso` DISABLE KEYS */;
/*!40000 ALTER TABLE `DisciplinaCurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DisciplinaPreRequisito`
--

DROP TABLE IF EXISTS `DisciplinaPreRequisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DisciplinaPreRequisito` (
  `codigoDisciplina` tinyint(4) NOT NULL,
  `codigoDisciplinaPreRequisito` tinyint(4) NOT NULL,
  PRIMARY KEY (`codigoDisciplina`,`codigoDisciplinaPreRequisito`),
  CONSTRAINT `DisciplinaPreRequisito_ibfk_1` FOREIGN KEY (`codigoDisciplina`) REFERENCES `Disciplina` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DisciplinaPreRequisito`
--

LOCK TABLES `DisciplinaPreRequisito` WRITE;
/*!40000 ALTER TABLE `DisciplinaPreRequisito` DISABLE KEYS */;
INSERT INTO `DisciplinaPreRequisito` VALUES (14,67),(15,55),(19,55),(32,65),(89,41),(122,12);
/*!40000 ALTER TABLE `DisciplinaPreRequisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmailAluno`
--

DROP TABLE IF EXISTS `EmailAluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmailAluno` (
  `matriculaAluno` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  UNIQUE KEY `matriculaAluno` (`matriculaAluno`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmailAluno`
--

LOCK TABLES `EmailAluno` WRITE;
/*!40000 ALTER TABLE `EmailAluno` DISABLE KEYS */;
INSERT INTO `EmailAluno` VALUES (1423345,'angelico9725@uorak.com'),(3124413,'shamas6367@uorak.com'),(1245689,'steffany8180@uorak.com'),(12345,'vikki8035@uorak.com');
/*!40000 ALTER TABLE `EmailAluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmailProfessor`
--

DROP TABLE IF EXISTS `EmailProfessor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmailProfessor` (
  `matriculaProfessor` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  UNIQUE KEY `matriculaProfessor` (`matriculaProfessor`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmailProfessor`
--

LOCK TABLES `EmailProfessor` WRITE;
/*!40000 ALTER TABLE `EmailProfessor` DISABLE KEYS */;
INSERT INTO `EmailProfessor` VALUES (567593474,'ermita7270@uorak.com'),(345127623,'malaika3569@uorak.com'),(456873465,'steen4492@uorak.com'),(918273645,'svein5248@uorak.com');
/*!40000 ALTER TABLE `EmailProfessor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Historico`
--

DROP TABLE IF EXISTS `Historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Historico` (
  `codigo` smallint(6) NOT NULL,
  `matriculaAluno` int(11) NOT NULL,
  `codigoCurso` tinyint(4) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `matriculaAluno` (`matriculaAluno`),
  KEY `codigoCurso` (`codigoCurso`),
  CONSTRAINT `Historico_ibfk_1` FOREIGN KEY (`matriculaAluno`) REFERENCES `Aluno` (`matricula`),
  CONSTRAINT `Historico_ibfk_2` FOREIGN KEY (`codigoCurso`) REFERENCES `Curso` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Historico`
--

LOCK TABLES `Historico` WRITE;
/*!40000 ALTER TABLE `Historico` DISABLE KEYS */;
INSERT INTO `Historico` VALUES (2345,1245689,59),(3456,3124413,45),(5634,12345,45),(12345,1423345,59);
/*!40000 ALTER TABLE `Historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HistoricoDisciplina`
--

DROP TABLE IF EXISTS `HistoricoDisciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HistoricoDisciplina` (
  `codigoHistorico` smallint(6) NOT NULL,
  `codigoDisciplina` tinyint(4) NOT NULL,
  `semestre` varchar(6) NOT NULL,
  PRIMARY KEY (`codigoHistorico`,`codigoDisciplina`),
  KEY `codigoDisciplina` (`codigoDisciplina`),
  CONSTRAINT `HistoricoDisciplina_ibfk_1` FOREIGN KEY (`codigoHistorico`) REFERENCES `Historico` (`codigo`),
  CONSTRAINT `HistoricoDisciplina_ibfk_2` FOREIGN KEY (`codigoDisciplina`) REFERENCES `Disciplina` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HistoricoDisciplina`
--

LOCK TABLES `HistoricoDisciplina` WRITE;
/*!40000 ALTER TABLE `HistoricoDisciplina` DISABLE KEYS */;
INSERT INTO `HistoricoDisciplina` VALUES (2345,122,'5'),(3456,15,'1'),(5634,15,'6'),(12345,32,'3');
/*!40000 ALTER TABLE `HistoricoDisciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Professor`
--

DROP TABLE IF EXISTS `Professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Professor` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `sexo` enum('M','F') NOT NULL,
  `salario` decimal(8,2) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `numero` smallint(6) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `CEP` varchar(9) NOT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Professor`
--

LOCK TABLES `Professor` WRITE;
/*!40000 ALTER TABLE `Professor` DISABLE KEYS */;
INSERT INTO `Professor` VALUES (345127623,'Lisandro Marins Antas','M',3000.00,'Rua Nonoai',14,'Freitas','93218-290'),(456873465,'Hazael Sampaio Lemes','M',2200.00,'Rodovia Antônio Heil',44,'Limoeiro','88318-482'),(567593474,'Kiara Meira Gonçalves','F',4000.00,'Rua Projetada',19,'Loteamento Joafra','69919-398'),(918273645,'Anael Lalanda Correia','F',3000.00,'Caminho',2,'Engenho Velho de Brotas','40240-535');
/*!40000 ALTER TABLE `Professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProfessorDisciplina`
--

DROP TABLE IF EXISTS `ProfessorDisciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProfessorDisciplina` (
  `matriculaProfessor` int(11) NOT NULL,
  `codigoDisciplina` tinyint(4) NOT NULL,
  PRIMARY KEY (`matriculaProfessor`,`codigoDisciplina`),
  KEY `codigoDisciplina` (`codigoDisciplina`),
  CONSTRAINT `ProfessorDisciplina_ibfk_1` FOREIGN KEY (`matriculaProfessor`) REFERENCES `Professor` (`matricula`),
  CONSTRAINT `ProfessorDisciplina_ibfk_2` FOREIGN KEY (`codigoDisciplina`) REFERENCES `Disciplina` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProfessorDisciplina`
--

LOCK TABLES `ProfessorDisciplina` WRITE;
/*!40000 ALTER TABLE `ProfessorDisciplina` DISABLE KEYS */;
INSERT INTO `ProfessorDisciplina` VALUES (345127623,15),(345127623,89),(456873465,19),(567593474,32),(567593474,122),(918273645,14);
/*!40000 ALTER TABLE `ProfessorDisciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TCC`
--

DROP TABLE IF EXISTS `TCC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TCC` (
  `codigo` int(11) NOT NULL,
  `nota` decimal(5,2) NOT NULL,
  `tema` varchar(50) NOT NULL,
  `matriculaAluno` int(11) NOT NULL,
  `matriculaProfessor` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `matriculaProfessor` (`matriculaProfessor`),
  KEY `matriculaAluno` (`matriculaAluno`),
  CONSTRAINT `TCC_ibfk_1` FOREIGN KEY (`matriculaProfessor`) REFERENCES `Professor` (`matricula`),
  CONSTRAINT `TCC_ibfk_2` FOREIGN KEY (`matriculaAluno`) REFERENCES `Aluno` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TCC`
--

LOCK TABLES `TCC` WRITE;
/*!40000 ALTER TABLE `TCC` DISABLE KEYS */;
INSERT INTO `TCC` VALUES (657,98.00,'Backup Corporativo',3124413,567593474),(3245,70.00,'Segurança da Informação',1423345,456873465),(5245,89.00,'Adesão aos Projetos em Nuvem',3124413,345127623);
/*!40000 ALTER TABLE `TCC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Turma`
--

DROP TABLE IF EXISTS `Turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Turma` (
  `codigo` tinyint(4) NOT NULL,
  `codigoCurso` tinyint(4) NOT NULL,
  `semestre` varchar(6) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigoCurso` (`codigoCurso`),
  CONSTRAINT `Turma_ibfk_1` FOREIGN KEY (`codigoCurso`) REFERENCES `Curso` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Turma`
--

LOCK TABLES `Turma` WRITE;
/*!40000 ALTER TABLE `Turma` DISABLE KEYS */;
INSERT INTO `Turma` VALUES (9,45,'5'),(123,59,'1');
/*!40000 ALTER TABLE `Turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TurmaDisciplina`
--

DROP TABLE IF EXISTS `TurmaDisciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TurmaDisciplina` (
  `codigoTurma` tinyint(4) NOT NULL,
  `codigoDisciplina` tinyint(4) NOT NULL,
  PRIMARY KEY (`codigoTurma`,`codigoDisciplina`),
  KEY `codigoDisciplina` (`codigoDisciplina`),
  CONSTRAINT `TurmaDisciplina_ibfk_1` FOREIGN KEY (`codigoTurma`) REFERENCES `Turma` (`codigo`),
  CONSTRAINT `TurmaDisciplina_ibfk_2` FOREIGN KEY (`codigoDisciplina`) REFERENCES `Disciplina` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TurmaDisciplina`
--

LOCK TABLES `TurmaDisciplina` WRITE;
/*!40000 ALTER TABLE `TurmaDisciplina` DISABLE KEYS */;
INSERT INTO `TurmaDisciplina` VALUES (9,122),(123,14),(123,32),(123,89);
/*!40000 ALTER TABLE `TurmaDisciplina` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-26 19:00:45
