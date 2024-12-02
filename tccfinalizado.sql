-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: tccdois
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `cidades`
--

DROP TABLE IF EXISTS `cidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `estado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estado_id` (`estado_id`),
  CONSTRAINT `cidades_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidades`
--

LOCK TABLES `cidades` WRITE;
/*!40000 ALTER TABLE `cidades` DISABLE KEYS */;
INSERT INTO `cidades` VALUES (1,'Acrelândia',1),(2,'Delmiro Gouveia',2),(3,'Santana',3),(4,'Itacoatiara',4),(5,'Feira de Santana',5),(6,'Sobral',6),(7,'Taguatinga',7),(8,'Cariacica',8),(9,'Aparecida de Goiânia',9),(10,'Imperatriz',10),(11,'Várzea Grande',11),(12,'Dourados',12),(13,'Contagem',13),(14,'Ananindeua',14),(15,'Campina Grande',15),(16,'Ponta Grossa',16),(17,'Olinda',17),(18,'Parnaíba',18),(19,'Duque de Caxias',19),(20,'Mossoró',20),(21,'Canoas',21),(22,'Jaru',22),(23,'Rorainópolis',23),(24,'São José',24),(25,'Guarulhos',25),(26,'Lagarto',26),(27,'Tocantinópolis',27),(28,'Cidade Teste',1);
/*!40000 ALTER TABLE `cidades` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_cidades_insert AFTER INSERT ON cidades
FOR EACH ROW
BEGIN
    INSERT INTO historico (data, hora, tipo, tabela, registro_id, descricao)
    VALUES (CURDATE(), CURTIME(), 'Adi��o', 'cidades', NEW.id, CONCAT('Cidade adicionada: ', NEW.nome));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `clinica_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `email` (`email`),
  KEY `clinica_id` (`clinica_id`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`clinica_id`) REFERENCES `clinicas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (27,'Tutor','tutor@gmail.com','3131631671','tal tal tal ','1','1','1436155265',7),(29,'Teste novo tutor','testeeee@gmail.com','34567845678','qeqweqeqeqe','1','17','1244131241',7),(30,'Tutor2','Tutor2@gmail.com','3132414124241','frhgrhrhrhrhrhr','14','19','4567890424',7);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_clientes_insert AFTER INSERT ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO historico (data, hora, tipo, tabela, registro_id, descricao)
    VALUES (CURDATE(), CURTIME(), 'Adi��o', 'clientes', NEW.idCliente, CONCAT('Cliente adicionado: ', NEW.nome));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clinicas`
--

DROP TABLE IF EXISTS `clinicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinicas`
--

LOCK TABLES `clinicas` WRITE;
/*!40000 ALTER TABLE `clinicas` DISABLE KEYS */;
INSERT INTO `clinicas` VALUES (7,'VetEtec','tal tal tal'),(8,'Teste segunda clinica','gegegegegegeg');
/*!40000 ALTER TABLE `clinicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultas_marcadas`
--

DROP TABLE IF EXISTS `consultas_marcadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultas_marcadas` (
  `idConsulta` int(11) NOT NULL AUTO_INCREMENT,
  `nome_animal` varchar(100) NOT NULL,
  `data_consulta` date NOT NULL,
  `hora_consulta` time NOT NULL,
  `descricao` text DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `pet_id` int(11) DEFAULT NULL,
  `tutor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConsulta`),
  KEY `pet_id` (`pet_id`),
  CONSTRAINT `consultas_marcadas_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas_marcadas`
--

LOCK TABLES `consultas_marcadas` WRITE;
/*!40000 ALTER TABLE `consultas_marcadas` DISABLE KEYS */;
INSERT INTO `consultas_marcadas` VALUES (32,'Fido','2024-12-05','14:30:00','Consulta de rotina','Reservado',NULL,1),(34,'Fido','2024-11-30','10:00:00','Consulta de rotina','Agendada',1,2),(36,'Bingo','2024-11-13','18:14:00','teste','Realizada',23,16),(37,'Bingo','2024-11-18','12:32:00','teste','Realizada',23,16),(39,'Miau','2024-11-27','06:23:00','teste','Cancelada',19,13),(40,'Bingo','2024-12-28','15:09:00','dwdwqd','Reservado',23,16),(41,'Bobby','2024-11-27','10:23:00','yyyyyyyyyyyyyy','Cancelada',13,13);
/*!40000 ALTER TABLE `consultas_marcadas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_consultas_marcadas_insert AFTER INSERT ON consultas_marcadas
FOR EACH ROW
BEGIN
    INSERT INTO historico (data, hora, tipo, tabela, registro_id, descricao)
    VALUES (CURDATE(), CURTIME(), 'Adi��o', 'consultas_marcadas', NEW.idConsulta, CONCAT('Consulta marcada: ', NEW.nome_animal));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `disponibilidades`
--

DROP TABLE IF EXISTS `disponibilidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disponibilidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `veterinario_id` int(11) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `veterinario_id` (`veterinario_id`),
  CONSTRAINT `disponibilidades_ibfk_1` FOREIGN KEY (`veterinario_id`) REFERENCES `veterinarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilidades`
--

LOCK TABLES `disponibilidades` WRITE;
/*!40000 ALTER TABLE `disponibilidades` DISABLE KEYS */;
INSERT INTO `disponibilidades` VALUES (4,1,'2024-11-25 10:00:00','Disponível');
/*!40000 ALTER TABLE `disponibilidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Acre'),(2,'Alagoas'),(3,'Amapá'),(4,'Amazonas'),(5,'Bahia'),(6,'Ceará'),(7,'Distrito Federal'),(8,'Espírito Santo'),(9,'Goiás'),(10,'Maranhão'),(11,'Mato Grosso'),(12,'Mato Grosso do Sul'),(13,'Minas Gerais'),(14,'Pará'),(15,'Paraíba'),(16,'Paraná'),(17,'Pernambuco'),(18,'Piauí'),(19,'Rio de Janeiro'),(20,'Rio Grande do Norte'),(21,'Rio Grande do Sul'),(22,'Rondônia'),(23,'Roraima'),(24,'Santa Catarina'),(25,'São Paulo'),(26,'Sergipe'),(27,'Tocantins');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_estados_insert AFTER INSERT ON estados
FOR EACH ROW
BEGIN
    INSERT INTO historico (data, hora, tipo, tabela, registro_id, descricao)
    VALUES (CURDATE(), CURTIME(), 'Adi��o', 'estados', NEW.id, CONCAT('Estado adicionado: ', NEW.nome));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_estados_update AFTER UPDATE ON estados
FOR EACH ROW
BEGIN
    INSERT INTO historico (data, hora, tipo, tabela, registro_id, descricao)
    VALUES (CURDATE(), CURTIME(), 'Altera��o', 'estados', OLD.id, CONCAT('Estado alterado de ', OLD.nome, ' para ', NEW.nome));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_estados_delete AFTER DELETE ON estados
FOR EACH ROW
BEGIN
    INSERT INTO historico (data, hora, tipo, tabela, registro_id, descricao)
    VALUES (CURDATE(), CURTIME(), 'Dele��o', 'estados', OLD.id, CONCAT('Estado deletado: ', OLD.nome));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `exames_realizados`
--

DROP TABLE IF EXISTS `exames_realizados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exames_realizados` (
  `idExame` int(11) NOT NULL AUTO_INCREMENT,
  `tipoExame` varchar(100) DEFAULT NULL,
  `dataExame` date DEFAULT NULL,
  `resultado` text DEFAULT NULL,
  `idPaciente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idExame`),
  KEY `fk_idPaciente` (`idPaciente`),
  CONSTRAINT `fk_idPaciente` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idPaciente`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exames_realizados`
--

LOCK TABLES `exames_realizados` WRITE;
/*!40000 ALTER TABLE `exames_realizados` DISABLE KEYS */;
INSERT INTO `exames_realizados` VALUES (3,'Raio-X','2024-10-03','Fratura confirmada',10),(4,'Exame de fezes','2024-10-04','Parasitose detectada',11),(5,'Exame de urina','2024-10-05','Sem anormalidades',12),(8,'Análise de sangue','2024-10-08','melhorando',10),(9,'Teste de alergia','2024-10-09','Sem reações',11),(11,'teste','2024-11-21','teste',23),(12,'teste','2024-11-27','testeeeeeeeeee',23),(13,'Exame de Sangue','2024-01-20','Normal',13),(14,'Ultrassom','2024-02-25','Sem Anomalias',14),(15,'Raio-X','2024-03-15','Fratura na Patinha',15);
/*!40000 ALTER TABLE `exames_realizados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `tipo` enum('Adição','Alteração','Deleção') NOT NULL,
  `tabela` varchar(255) NOT NULL,
  `registro_id` int(11) NOT NULL,
  `descricao` text DEFAULT NULL,
  `clinica_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=352 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico`
--

LOCK TABLES `historico` WRITE;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
INSERT INTO `historico` VALUES (1,'2024-09-23','11:29:58','Adição','cidades',28,'Cidade adicionada: Cidade Teste',0),(2,'2024-09-23','12:06:35','Adição','consultas_marcadas',1,'Consulta marcada: Victor',0),(3,'2024-09-25','08:45:40','Adição','pacientes',1,'Paciente adicionado: Bobby',0),(4,'2024-09-25','08:45:40','Adição','pacientes',2,'Paciente adicionado: Mimi',0),(5,'2024-09-25','08:45:40','Adição','pacientes',3,'Paciente adicionado: Max',0),(6,'2024-09-25','08:45:40','Adição','pacientes',4,'Paciente adicionado: Luna',0),(7,'2024-09-25','08:45:40','Adição','pacientes',5,'Paciente adicionado: Rex',0),(8,'2024-09-25','08:45:40','Adição','pacientes',6,'Paciente adicionado: Nina',0),(9,'2024-09-25','08:45:40','Adição','pacientes',7,'Paciente adicionado: Thor',0),(10,'2024-09-25','08:45:53','Adição','medicamentos_prescritos',1,'Medicamento prescrito: Bobby',0),(11,'2024-09-25','08:45:53','Adição','medicamentos_prescritos',2,'Medicamento prescrito: Mimi',0),(12,'2024-09-25','08:45:53','Adição','medicamentos_prescritos',3,'Medicamento prescrito: Max',0),(13,'2024-09-25','08:45:53','Adição','medicamentos_prescritos',4,'Medicamento prescrito: Luna',0),(14,'2024-09-25','08:45:53','Adição','medicamentos_prescritos',5,'Medicamento prescrito: Rex',0),(15,'2024-09-25','08:45:53','Adição','medicamentos_prescritos',6,'Medicamento prescrito: Nina',0),(16,'2024-09-25','08:45:53','Adição','medicamentos_prescritos',7,'Medicamento prescrito: Thor',0),(17,'2024-09-25','08:45:57','Adição','tutores',2,'Tutor adicionado: Carlos Silva',0),(18,'2024-09-25','08:45:57','Adição','tutores',3,'Tutor adicionado: Ana Souza',0),(19,'2024-09-25','08:45:57','Adição','tutores',4,'Tutor adicionado: João Ferreira',0),(20,'2024-09-25','08:45:57','Adição','tutores',5,'Tutor adicionado: Mariana Oliveira',0),(21,'2024-09-25','08:45:57','Adição','tutores',6,'Tutor adicionado: Pedro Santos',0),(22,'2024-09-25','08:45:57','Adição','tutores',7,'Tutor adicionado: Camila Mendes',0),(23,'2024-09-25','08:45:57','Adição','tutores',8,'Tutor adicionado: Lucas Andrade',0),(24,'2024-09-25','09:09:27','Adição','horarios',1,'Horário adicionado: 2024-09-25 09:30:00',0),(25,'2024-09-25','09:11:38','Adição','horarios',2,'Horário adicionado: 2024-09-25 08:00:00',0),(26,'2024-09-25','09:11:38','Adição','horarios',3,'Horário adicionado: 2024-09-25 09:00:00',0),(27,'2024-09-25','09:11:38','Adição','horarios',4,'Horário adicionado: 2024-09-25 10:00:00',0),(28,'2024-09-25','09:11:38','Adição','horarios',5,'Horário adicionado: 2024-09-25 11:00:00',0),(29,'2024-09-25','09:11:38','Adição','horarios',6,'Horário adicionado: 2024-09-25 12:00:00',0),(30,'2024-09-25','09:11:38','Adição','horarios',7,'Horário adicionado: 2024-09-25 13:00:00',0),(31,'2024-09-25','09:11:38','Adição','horarios',8,'Horário adicionado: 2024-09-25 14:00:00',0),(32,'2024-09-25','09:11:38','Adição','horarios',9,'Horário adicionado: 2024-09-25 15:00:00',0),(33,'2024-09-25','09:11:38','Adição','horarios',10,'Horário adicionado: 2024-09-25 16:00:00',0),(34,'2024-09-25','09:11:38','Adição','horarios',11,'Horário adicionado: 2024-09-25 17:00:00',0),(35,'2024-09-25','09:11:38','Adição','horarios',12,'Horário adicionado: 2024-09-26 08:00:00',0),(36,'2024-09-25','09:11:38','Adição','horarios',13,'Horário adicionado: 2024-09-26 09:00:00',0),(37,'2024-09-25','09:11:38','Adição','horarios',14,'Horário adicionado: 2024-09-26 10:00:00',0),(38,'2024-09-25','09:11:38','Adição','horarios',15,'Horário adicionado: 2024-09-26 11:00:00',0),(39,'2024-09-25','09:11:38','Adição','horarios',16,'Horário adicionado: 2024-09-26 12:00:00',0),(40,'2024-09-25','09:17:35','Deleção','clientes',11,'Cliente deletado: wqeqweqeqeqeqdad',0),(41,'2024-09-25','09:18:04','Alteração','clientes',2,'Cliente alterado: dahdadad',0),(42,'2024-09-25','10:29:04','Adição','clientes',13,'Cliente adicionado: Ana Oliveira',0),(43,'2024-09-25','10:29:04','Adição','clientes',14,'Cliente adicionado: Carlos Silva',0),(44,'2024-09-25','10:29:04','Adição','clientes',15,'Cliente adicionado: Mariana Santos',0),(45,'2024-09-25','10:29:04','Adição','clientes',16,'Cliente adicionado: Roberto Lima',0),(46,'2024-09-25','10:29:04','Adição','clientes',17,'Cliente adicionado: Juliana Costa',0),(47,'2024-09-25','10:29:04','Adição','clientes',18,'Cliente adicionado: Paulo Henrique',0),(48,'2024-09-25','10:29:04','Adição','clientes',19,'Cliente adicionado: Clara Almeida',0),(49,'2024-09-25','10:29:04','Adição','clientes',20,'Cliente adicionado: Rafael Mendes',0),(50,'2024-09-25','10:29:04','Adição','clientes',21,'Cliente adicionado: Luciana Ferreira',0),(51,'2024-09-25','10:29:04','Adição','clientes',22,'Cliente adicionado: Fernanda Martins',0),(52,'2024-09-25','10:34:09','Deleção','clientes',1,'Cliente deletado: Eric',0),(53,'2024-09-25','10:34:09','Deleção','clientes',2,'Cliente deletado: dahdadad',0),(54,'2024-09-25','10:34:09','Deleção','clientes',4,'Cliente deletado: dahdadaddad',0),(55,'2024-09-25','10:34:09','Deleção','clientes',5,'Cliente deletado: gggasgafafa',0),(56,'2024-09-25','10:34:09','Deleção','clientes',6,'Cliente deletado: fgfgfgfgfg',0),(57,'2024-09-25','10:34:09','Deleção','clientes',7,'Cliente deletado: dfsfsfdf',0),(58,'2024-09-25','10:34:09','Deleção','clientes',8,'Cliente deletado: ggggggg',0),(59,'2024-09-25','10:34:09','Deleção','clientes',9,'Cliente deletado: jidgasdsadya',0),(60,'2024-09-25','10:34:09','Deleção','clientes',10,'Cliente deletado: wqeqweqeqeqeq',0),(61,'2024-09-25','10:34:09','Deleção','clientes',12,'Cliente deletado: qdadadadad',0),(62,'2024-09-25','10:34:09','Deleção','clientes',13,'Cliente deletado: Ana Oliveira',0),(63,'2024-09-25','10:34:09','Deleção','clientes',14,'Cliente deletado: Carlos Silva',0),(64,'2024-09-25','10:34:09','Deleção','clientes',15,'Cliente deletado: Mariana Santos',0),(65,'2024-09-25','10:34:09','Deleção','clientes',16,'Cliente deletado: Roberto Lima',0),(66,'2024-09-25','10:34:09','Deleção','clientes',17,'Cliente deletado: Juliana Costa',0),(67,'2024-09-25','10:34:09','Deleção','clientes',18,'Cliente deletado: Paulo Henrique',0),(68,'2024-09-25','10:34:09','Deleção','clientes',19,'Cliente deletado: Clara Almeida',0),(69,'2024-09-25','10:34:09','Deleção','clientes',20,'Cliente deletado: Rafael Mendes',0),(70,'2024-09-25','10:34:09','Deleção','clientes',21,'Cliente deletado: Luciana Ferreira',0),(71,'2024-09-25','10:34:09','Deleção','clientes',22,'Cliente deletado: Fernanda Martins',0),(72,'2024-09-25','10:52:03','Adição','clientes',23,'Cliente adicionado: Tutor',0),(73,'2024-09-25','10:52:03','Adição','tutores',9,'Tutor adicionado: Tutor',0),(74,'2024-09-25','10:59:50','Adição','clientes',24,'Cliente adicionado: Victor',0),(75,'2024-09-25','10:59:50','Adição','tutores',10,'Tutor adicionado: Victor',0),(76,'2024-09-26','09:49:01','Adição','horarios',17,'Horário adicionado: 2024-09-09 09:51:00',0),(77,'2024-09-26','10:56:26','Adição','pets',1,'Pet adicionado: dadasd',0),(78,'2024-09-26','10:56:27','Adição','pets',2,'Pet adicionado: dadasd',0),(79,'2024-09-26','10:56:28','Adição','pets',3,'Pet adicionado: dadasd',0),(80,'2024-09-26','10:56:28','Adição','pets',4,'Pet adicionado: dadasd',0),(81,'2024-09-26','10:56:28','Adição','pets',5,'Pet adicionado: dadasd',0),(82,'2024-09-26','10:57:15','Adição','pets',6,'Pet adicionado: test',0),(83,'2024-09-26','10:59:48','Adição','pets',7,'Pet adicionado: test',0),(84,'2024-09-26','11:03:44','Adição','pets',8,'Pet adicionado: test',0),(85,'2024-09-26','11:09:30','Adição','clientes',25,'Cliente adicionado: testeeee',0),(86,'2024-09-26','11:09:30','Adição','tutores',11,'Tutor adicionado: testeeee',0),(87,'2024-09-26','11:13:46','Adição','clientes',26,'Cliente adicionado: testeeeeeee',0),(88,'2024-09-26','11:13:46','Adição','tutores',12,'Tutor adicionado: testeeeeeee',0),(89,'2024-09-26','11:34:56','Adição','pets',9,'Pet adicionado: dada',0),(90,'2024-09-30','08:42:56','Deleção','tutores',1,'Tutor deletado: Eric',0),(91,'2024-09-30','08:42:56','Deleção','tutores',2,'Tutor deletado: Carlos Silva',0),(92,'2024-09-30','08:42:56','Deleção','tutores',3,'Tutor deletado: Ana Souza',0),(93,'2024-09-30','08:42:56','Deleção','tutores',4,'Tutor deletado: João Ferreira',0),(94,'2024-09-30','08:42:56','Deleção','tutores',5,'Tutor deletado: Mariana Oliveira',0),(95,'2024-09-30','08:42:56','Deleção','tutores',6,'Tutor deletado: Pedro Santos',0),(96,'2024-09-30','08:42:56','Deleção','tutores',7,'Tutor deletado: Camila Mendes',0),(97,'2024-09-30','08:42:56','Deleção','tutores',8,'Tutor deletado: Lucas Andrade',0),(98,'2024-09-30','08:42:56','Deleção','tutores',9,'Tutor deletado: Tutor',0),(99,'2024-09-30','08:42:56','Deleção','tutores',10,'Tutor deletado: Victor',0),(100,'2024-09-30','08:42:56','Deleção','tutores',11,'Tutor deletado: testeeee',0),(101,'2024-09-30','08:42:56','Deleção','tutores',12,'Tutor deletado: testeeeeeee',0),(102,'2024-09-30','08:43:35','Deleção','clientes',23,'Cliente deletado: Tutor',0),(103,'2024-09-30','08:43:35','Deleção','clientes',24,'Cliente deletado: Victor',0),(104,'2024-09-30','08:43:35','Deleção','clientes',25,'Cliente deletado: testeeee',0),(105,'2024-09-30','08:43:35','Deleção','clientes',26,'Cliente deletado: testeeeeeee',0),(106,'2024-09-30','08:47:43','Adição','clientes',27,'Cliente adicionado: Tutor',0),(107,'2024-09-30','08:47:43','Adição','tutores',13,'Tutor adicionado: Tutor',0),(108,'2024-09-30','09:20:33','Adição','horarios',18,'Horário adicionado: 2024-09-30 09:30:00',0),(109,'2024-09-30','09:21:46','Adição','horarios',19,'Horário adicionado: 2024-09-30 10:24:00',0),(110,'2024-09-30','09:22:15','Adição','horarios',20,'Horário adicionado: 2024-09-22 09:24:00',0),(111,'2024-09-30','09:27:26','Deleção','horarios',19,'Horário deletado: 2024-09-30 10:24:00',0),(112,'2024-09-30','09:27:26','Deleção','horarios',20,'Horário deletado: 2024-09-22 09:24:00',0),(113,'2024-09-30','09:31:24','Adição','horarios',21,'Horário adicionado: 2024-10-01 14:00:00',0),(114,'2024-09-30','09:37:13','Alteração','horarios',21,'Horário alterado: 2024-10-01 14:00:00 para 2024-10-01 14:00:00',0),(115,'2024-09-30','09:51:37','Alteração','horarios',21,'Horário alterado: 2024-10-01 14:00:00 para 2024-10-01 14:00:00',0),(116,'2024-09-30','10:42:30','Deleção','horarios',21,'Horário deletado: 2024-10-01 14:00:00',0),(117,'2024-10-01','11:16:55','Adição','pacientes',8,'Paciente adicionado: Rex',0),(118,'2024-10-01','11:16:55','Adição','pacientes',9,'Paciente adicionado: Mimi',0),(119,'2024-10-01','11:16:55','Adição','pacientes',10,'Paciente adicionado: Bobby',0),(120,'2024-10-01','11:16:55','Adição','pacientes',11,'Paciente adicionado: Luna',0),(121,'2024-10-01','11:16:55','Adição','pacientes',12,'Paciente adicionado: Zeca',0),(122,'2024-10-01','11:28:21','Deleção','pacientes',1,'Paciente deletado: Bobby',0),(123,'2024-10-01','11:28:21','Deleção','pacientes',2,'Paciente deletado: Mimi',0),(124,'2024-10-01','11:28:21','Deleção','pacientes',3,'Paciente deletado: Max',0),(125,'2024-10-01','11:28:21','Deleção','pacientes',4,'Paciente deletado: Luna',0),(126,'2024-10-01','11:28:21','Deleção','pacientes',5,'Paciente deletado: Rex',0),(127,'2024-10-01','11:28:21','Deleção','pacientes',6,'Paciente deletado: Nina',0),(128,'2024-10-01','11:28:21','Deleção','pacientes',7,'Paciente deletado: Thor',0),(129,'2024-10-01','12:04:05','Alteração','tutores',13,'Tutor alterado de Tutor para Tutor',0),(130,'2024-10-02','09:48:51','Adição','consultas_marcadas',2,'Consulta marcada: Rex',0),(131,'2024-10-02','09:48:51','Adição','consultas_marcadas',3,'Consulta marcada: Mimi',0),(132,'2024-10-02','09:49:12','Adição','consultas_marcadas',7,'Consulta marcada: Rex',0),(133,'2024-10-02','09:49:12','Adição','consultas_marcadas',8,'Consulta marcada: Mimi',0),(136,'2024-10-02','09:52:53','Adição','horarios',19,'Horário adicionado: 2024-10-05 09:00:00',0),(137,'2024-10-02','09:52:53','Adição','horarios',20,'Horário adicionado: 2024-10-06 10:00:00',0),(138,'2024-10-02','09:52:54','Adição','horarios',21,'Horário adicionado: 2024-10-07 11:00:00',0),(139,'2024-10-02','09:52:54','Adição','horarios',22,'Horário adicionado: 2024-10-08 14:00:00',0),(140,'2024-10-02','09:52:54','Adição','horarios',23,'Horário adicionado: 2024-10-09 16:00:00',0),(141,'2024-10-02','09:53:13','Adição','consultas_marcadas',17,'Consulta marcada: Rex',0),(142,'2024-10-02','09:53:13','Adição','consultas_marcadas',18,'Consulta marcada: Mimi',0),(143,'2024-10-02','09:54:45','Adição','pets',13,'Pet adicionado: Bobby',0),(144,'2024-10-02','09:54:45','Adição','pets',14,'Pet adicionado: Luna',0),(145,'2024-10-02','09:54:45','Adição','pets',15,'Pet adicionado: Zeca',0),(146,'2024-10-02','09:54:58','Alteração','horarios',19,'Horário alterado: 2024-10-05 09:00:00 para 2024-10-05 09:00:00',0),(147,'2024-10-02','09:54:58','Alteração','horarios',20,'Horário alterado: 2024-10-06 10:00:00 para 2024-10-06 10:00:00',0),(148,'2024-10-02','09:54:58','Alteração','horarios',21,'Horário alterado: 2024-10-07 11:00:00 para 2024-10-07 11:00:00',0),(149,'2024-10-02','09:54:58','Alteração','horarios',22,'Horário alterado: 2024-10-08 14:00:00 para 2024-10-08 14:00:00',0),(150,'2024-10-02','09:54:58','Alteração','horarios',23,'Horário alterado: 2024-10-09 16:00:00 para 2024-10-09 16:00:00',0),(151,'2024-10-02','09:55:07','Adição','consultas_marcadas',22,'Consulta marcada: Rex',0),(152,'2024-10-02','09:55:07','Adição','consultas_marcadas',23,'Consulta marcada: Mimi',0),(153,'2024-10-02','09:56:24','Adição','consultas_marcadas',27,'Consulta marcada: Bobby',0),(154,'2024-10-02','09:56:24','Adição','consultas_marcadas',28,'Consulta marcada: Luna',0),(155,'2024-10-02','09:56:24','Adição','consultas_marcadas',29,'Consulta marcada: Zeca',0),(156,'2024-10-02','10:20:00','Adição','horarios',24,'Horário adicionado: 2024-10-02 10:30:00',0),(157,'2024-10-02','10:59:30','Adição','clientes',28,'Cliente adicionado: Eric',0),(158,'2024-10-02','10:59:30','Adição','tutores',14,'Tutor adicionado: Eric',0),(159,'2024-10-16','09:54:32','Adição','pets',16,'Pet adicionado: Victor',0),(160,'2024-10-17','10:40:45','Adição','pets',17,'Pet adicionado: teste',0),(161,'2024-11-19','09:12:34','Adição','horarios',25,'Horário adicionado: 2024-11-19 09:12:00',0),(162,'2024-11-25','11:28:28','Adição','clientes',29,'Cliente adicionado: Teste novo tutor',0),(163,'2024-11-25','11:28:28','Adição','tutores',15,'Tutor adicionado: Teste novo tutor',0),(164,'2024-11-26','09:10:43','Adição','horarios',26,'Horário adicionado: 2024-11-26 09:10:00',0),(165,'2024-11-26','09:11:39','Adição','horarios',27,'Horário adicionado: 2024-11-26 09:11:00',0),(166,'2024-11-26','09:12:19','Adição','horarios',28,'Horário adicionado: 2024-11-26 09:20:00',0),(167,'2024-11-26','09:17:35','Adição','horarios',29,'Horário adicionado: 2024-12-01 09:00:00',0),(168,'2024-11-26','09:22:45','Adição','horarios',30,'Horário adicionado: 2024-11-27 10:24:00',0),(169,'2024-11-26','09:23:42','Adição','horarios',31,'Horário adicionado: 2024-11-26 09:25:00',0),(170,'2024-11-26','09:25:33','Adição','horarios',32,'Horário adicionado: 2024-11-06 10:26:00',0),(171,'2024-11-26','09:31:51','Adição','horarios',33,'Horário adicionado: 2024-11-06 10:26:00',0),(172,'2024-11-26','09:34:33','Adição','horarios',34,'Horário adicionado: 0000-00-00 10:27:00',0),(173,'2024-11-26','09:35:00','Adição','horarios',35,'Horário adicionado: 0000-00-00 10:26:00',0),(174,'2024-11-26','09:35:34','Adição','horarios',36,'Horário adicionado: 0000-00-00 10:26:00',0),(175,'2024-11-26','09:35:59','Adição','horarios',37,'Horário adicionado: 2024-11-06 10:26:00',0),(176,'2024-11-26','09:36:33','Adição','horarios',38,'Horário adicionado: 2024-11-06 10:26:00',0),(177,'2024-11-26','09:36:44','Adição','horarios',39,'Horário adicionado: 0000-00-00 10:27:00',0),(178,'2024-11-26','09:36:52','Adição','horarios',40,'Horário adicionado: 2024-11-06 10:26:00',0),(179,'2024-11-26','09:37:48','Adição','horarios',41,'Horário adicionado: 0000-00-00 10:27:00',0),(180,'2024-11-26','09:38:04','Adição','horarios',42,'Horário adicionado: 2024-11-06 10:26:00',0),(181,'2024-11-26','09:38:45','Adição','horarios',43,'Horário adicionado: 2024-11-06 10:26:00',0),(182,'2024-11-26','09:44:34','Adição','horarios',44,'Horário adicionado: 2024-11-30 09:48:00',0),(183,'2024-11-26','09:46:34','Deleção','horarios',1,'Horário deletado: 2024-09-25 09:30:00',0),(184,'2024-11-26','09:46:34','Deleção','horarios',2,'Horário deletado: 2024-09-25 08:00:00',0),(185,'2024-11-26','09:46:34','Deleção','horarios',3,'Horário deletado: 2024-09-25 09:00:00',0),(186,'2024-11-26','09:46:34','Deleção','horarios',4,'Horário deletado: 2024-09-25 10:00:00',0),(187,'2024-11-26','09:46:34','Deleção','horarios',5,'Horário deletado: 2024-09-25 11:00:00',0),(188,'2024-11-26','09:46:34','Deleção','horarios',6,'Horário deletado: 2024-09-25 12:00:00',0),(189,'2024-11-26','09:46:34','Deleção','horarios',7,'Horário deletado: 2024-09-25 13:00:00',0),(190,'2024-11-26','09:46:34','Deleção','horarios',8,'Horário deletado: 2024-09-25 14:00:00',0),(191,'2024-11-26','09:46:34','Deleção','horarios',9,'Horário deletado: 2024-09-25 15:00:00',0),(192,'2024-11-26','09:46:34','Deleção','horarios',10,'Horário deletado: 2024-09-25 16:00:00',0),(193,'2024-11-26','09:46:34','Deleção','horarios',11,'Horário deletado: 2024-09-25 17:00:00',0),(194,'2024-11-26','09:46:34','Deleção','horarios',12,'Horário deletado: 2024-09-26 08:00:00',0),(195,'2024-11-26','09:46:34','Deleção','horarios',13,'Horário deletado: 2024-09-26 09:00:00',0),(196,'2024-11-26','09:46:34','Deleção','horarios',14,'Horário deletado: 2024-09-26 10:00:00',0),(197,'2024-11-26','09:46:34','Deleção','horarios',15,'Horário deletado: 2024-09-26 11:00:00',0),(198,'2024-11-26','09:46:34','Deleção','horarios',16,'Horário deletado: 2024-09-26 12:00:00',0),(199,'2024-11-26','09:46:34','Deleção','horarios',17,'Horário deletado: 2024-09-09 09:51:00',0),(200,'2024-11-26','09:46:34','Deleção','horarios',18,'Horário deletado: 2024-09-30 09:30:00',0),(201,'2024-11-26','09:46:34','Deleção','horarios',19,'Horário deletado: 2024-10-05 09:00:00',0),(202,'2024-11-26','09:46:34','Deleção','horarios',20,'Horário deletado: 2024-10-06 10:00:00',0),(203,'2024-11-26','09:46:34','Deleção','horarios',21,'Horário deletado: 2024-10-07 11:00:00',0),(204,'2024-11-26','09:46:34','Deleção','horarios',22,'Horário deletado: 2024-10-08 14:00:00',0),(205,'2024-11-26','09:46:34','Deleção','horarios',23,'Horário deletado: 2024-10-09 16:00:00',0),(206,'2024-11-26','09:46:34','Deleção','horarios',24,'Horário deletado: 2024-10-02 10:30:00',0),(207,'2024-11-26','09:46:34','Deleção','horarios',25,'Horário deletado: 2024-11-19 09:12:00',0),(208,'2024-11-26','09:46:34','Deleção','horarios',26,'Horário deletado: 2024-11-26 09:10:00',0),(209,'2024-11-26','09:46:34','Deleção','horarios',27,'Horário deletado: 2024-11-26 09:11:00',0),(210,'2024-11-26','09:46:34','Deleção','horarios',28,'Horário deletado: 2024-11-26 09:20:00',0),(211,'2024-11-26','09:46:34','Deleção','horarios',29,'Horário deletado: 2024-12-01 09:00:00',0),(212,'2024-11-26','09:46:34','Deleção','horarios',30,'Horário deletado: 2024-11-27 10:24:00',0),(213,'2024-11-26','09:46:34','Deleção','horarios',31,'Horário deletado: 2024-11-26 09:25:00',0),(214,'2024-11-26','09:46:34','Deleção','horarios',32,'Horário deletado: 2024-11-06 10:26:00',0),(215,'2024-11-26','09:46:34','Deleção','horarios',33,'Horário deletado: 2024-11-06 10:26:00',0),(216,'2024-11-26','09:46:34','Deleção','horarios',34,'Horário deletado: 0000-00-00 10:27:00',0),(217,'2024-11-26','09:46:34','Deleção','horarios',35,'Horário deletado: 0000-00-00 10:26:00',0),(218,'2024-11-26','09:46:34','Deleção','horarios',36,'Horário deletado: 0000-00-00 10:26:00',0),(219,'2024-11-26','09:46:34','Deleção','horarios',37,'Horário deletado: 2024-11-06 10:26:00',0),(220,'2024-11-26','09:46:34','Deleção','horarios',38,'Horário deletado: 2024-11-06 10:26:00',0),(221,'2024-11-26','09:46:34','Deleção','horarios',39,'Horário deletado: 0000-00-00 10:27:00',0),(222,'2024-11-26','09:46:34','Deleção','horarios',40,'Horário deletado: 2024-11-06 10:26:00',0),(223,'2024-11-26','09:46:34','Deleção','horarios',41,'Horário deletado: 0000-00-00 10:27:00',0),(224,'2024-11-26','09:46:34','Deleção','horarios',42,'Horário deletado: 2024-11-06 10:26:00',0),(225,'2024-11-26','09:46:34','Deleção','horarios',43,'Horário deletado: 2024-11-06 10:26:00',0),(226,'2024-11-26','09:46:34','Deleção','horarios',44,'Horário deletado: 2024-11-30 09:48:00',0),(227,'2024-11-26','09:51:44','Adição','horarios',45,'Horário adicionado: 2024-11-26 09:51:00',0),(228,'2024-11-26','09:53:19','Adição','horarios',46,'Horário adicionado: 2024-11-07 14:55:00',0),(229,'2024-11-26','09:55:04','Adição','horarios',47,'Horário adicionado: 2024-11-30 09:59:00',0),(230,'2024-11-26','09:56:43','Adição','horarios',48,'Horário adicionado: 2024-11-06 10:26:00',0),(231,'2024-11-26','10:24:47','Adição','horarios',49,'Horário adicionado: 2024-11-13 14:27:00',0),(232,'2024-11-26','10:28:22','Adição','horarios',50,'Horário adicionado: 2024-11-29 15:32:00',0),(233,'2024-11-26','10:29:11','Adição','horarios',51,'Horário adicionado: 2024-11-09 10:33:00',0),(234,'2024-11-26','10:30:16','Deleção','horarios',45,'Horário deletado: 2024-11-26 09:51:00',0),(235,'2024-11-26','10:30:16','Deleção','horarios',46,'Horário deletado: 2024-11-07 14:55:00',0),(236,'2024-11-26','10:30:16','Deleção','horarios',47,'Horário deletado: 2024-11-30 09:59:00',0),(237,'2024-11-26','10:30:16','Deleção','horarios',48,'Horário deletado: 2024-11-06 10:26:00',0),(238,'2024-11-26','10:30:16','Deleção','horarios',49,'Horário deletado: 2024-11-13 14:27:00',0),(239,'2024-11-26','10:30:16','Deleção','horarios',50,'Horário deletado: 2024-11-29 15:32:00',0),(240,'2024-11-26','10:30:16','Deleção','horarios',51,'Horário deletado: 2024-11-09 10:33:00',0),(241,'2024-11-26','10:30:46','Adição','horarios',52,'Horário adicionado: 2024-11-18 12:32:00',0),(242,'2024-11-26','10:45:24','Adição','consultas_marcadas',30,'Consulta marcada: Teste Animal',0),(243,'2024-11-26','17:50:42','Deleção','consultas_marcadas',1,'Consulta deletada: Victor',0),(244,'2024-11-26','17:50:42','Deleção','consultas_marcadas',2,'Consulta deletada: Rex',0),(245,'2024-11-26','17:50:42','Deleção','consultas_marcadas',3,'Consulta deletada: Mimi',0),(246,'2024-11-26','17:50:42','Deleção','consultas_marcadas',7,'Consulta deletada: Rex',0),(247,'2024-11-26','17:50:42','Deleção','consultas_marcadas',8,'Consulta deletada: Mimi',0),(248,'2024-11-26','17:50:42','Deleção','consultas_marcadas',17,'Consulta deletada: Rex',0),(249,'2024-11-26','17:50:42','Deleção','consultas_marcadas',18,'Consulta deletada: Mimi',0),(250,'2024-11-26','17:50:42','Deleção','consultas_marcadas',22,'Consulta deletada: Rex',0),(251,'2024-11-26','17:50:42','Deleção','consultas_marcadas',23,'Consulta deletada: Mimi',0),(252,'2024-11-26','17:50:42','Deleção','consultas_marcadas',27,'Consulta deletada: Bobby',0),(253,'2024-11-26','17:50:42','Deleção','consultas_marcadas',28,'Consulta deletada: Luna',0),(254,'2024-11-26','17:50:42','Deleção','consultas_marcadas',29,'Consulta deletada: Zeca',0),(255,'2024-11-26','17:50:42','Deleção','consultas_marcadas',30,'Consulta deletada: Teste Animal',0),(256,'2024-11-26','17:56:41','Adição','clientes',30,'Cliente adicionado: Tutor2',0),(257,'2024-11-26','17:56:41','Adição','tutores',16,'Tutor adicionado: Tutor2',0),(258,'2024-11-26','18:00:51','Adição','consultas_marcadas',31,'Consulta marcada: AnimalTeste',0),(259,'2024-11-26','18:03:51','Alteração','consultas_marcadas',31,'Consulta alterada: AnimalTeste',0),(260,'2024-11-26','18:10:21','Adição','horarios',53,'Horário adicionado: 2024-11-13 18:14:00',0),(261,'2024-11-26','18:28:58','Adição','tutores',17,'Tutor adicionado: 16',0),(262,'2024-11-26','18:50:25','Adição','consultas_marcadas',32,'Consulta marcada: Fido',0),(263,'2024-11-26','18:50:57','Adição','consultas_marcadas',33,'Consulta marcada: Fido',0),(264,'2024-11-26','19:09:18','Adição','consultas_marcadas',34,'Consulta marcada: Fido',0),(265,'2024-11-26','19:10:03','Adição','consultas_marcadas',35,'Consulta marcada: Bobby',0),(266,'2024-11-26','19:30:36','Adição','pets',18,'Pet adicionado: Fido',0),(267,'2024-11-26','19:30:36','Adição','pets',19,'Pet adicionado: Miau',0),(268,'2024-11-26','19:30:36','Adição','pets',20,'Pet adicionado: Thor',0),(269,'2024-11-26','19:30:36','Adição','pets',21,'Pet adicionado: Rex',0),(270,'2024-11-26','19:30:36','Adição','pets',22,'Pet adicionado: Luna',0),(271,'2024-11-26','19:30:36','Adição','pets',23,'Pet adicionado: Bingo',0),(272,'2024-11-26','19:30:36','Adição','pets',24,'Pet adicionado: Max',0),(273,'2024-11-26','20:53:53','Adição','consultas_marcadas',36,'Consulta marcada: Bingo',0),(274,'2024-11-26','20:55:26','Adição','consultas_marcadas',37,'Consulta marcada: Bingo',0),(275,'2024-11-26','21:00:16','Adição','horarios',54,'Horário adicionado: 2024-11-29 21:00:00',0),(276,'2024-11-26','21:00:33','Adição','consultas_marcadas',38,'Consulta marcada: Bingo',0),(277,'2024-11-26','21:00:33','Alteração','horarios',54,'Horário alterado: 2024-11-29 21:00:00 para 2024-11-29 21:00:00',0),(278,'2024-11-26','21:23:45','Alteração','consultas_marcadas',37,'Consulta alterada: Bingo',0),(279,'2024-11-26','21:35:33','Deleção','consultas_marcadas',33,'Consulta deletada: Fido',0),(280,'2024-11-26','21:35:42','Deleção','consultas_marcadas',31,'Consulta deletada: AnimalTeste',0),(281,'2024-11-26','21:36:11','Deleção','consultas_marcadas',38,'Consulta deletada: Bingo',0),(282,'2024-11-26','21:36:20','Deleção','consultas_marcadas',35,'Consulta deletada: Bobby',0),(283,'2024-11-26','21:36:30','Deleção','clientes',28,'Cliente deletado: Eric',0),(284,'2024-11-26','22:11:00','Adição','pacientes',13,'Paciente adicionado: teste',0),(285,'2024-11-26','22:13:49','Adição','pacientes',14,'Paciente adicionado: teste',0),(286,'2024-11-26','22:14:13','Adição','pacientes',15,'Paciente adicionado: teste',0),(287,'2024-11-26','22:16:24','Adição','pacientes',16,'Paciente adicionado: teste',0),(288,'2024-11-26','22:22:26','Adição','pacientes',17,'Paciente adicionado: testei ',0),(289,'2024-11-26','22:25:37','Adição','pacientes',18,'Paciente adicionado: testei ',0),(290,'2024-11-26','22:26:34','Adição','pacientes',19,'Paciente adicionado: testei ',0),(291,'2024-11-26','22:28:44','Adição','pacientes',20,'Paciente adicionado: testei ',0),(292,'2024-11-26','22:30:50','Adição','pacientes',21,'Paciente adicionado: testei ',0),(293,'2024-11-26','22:37:54','Adição','pacientes',22,'Paciente adicionado: testei ',0),(294,'2024-11-26','22:39:16','Adição','pacientes',23,'Paciente adicionado: testei ',0),(295,'2024-11-26','22:41:47','Adição','pacientes',24,'Paciente adicionado: testei ',0),(296,'2024-11-26','22:51:53','Adição','pacientes',25,'Paciente adicionado: Test Animal',0),(297,'2024-11-26','22:53:00','Adição','pacientes',26,'Paciente adicionado: testei fe',0),(298,'2024-11-26','22:55:13','Adição','pacientes',27,'Paciente adicionado: testei fe3',0),(299,'2024-11-26','22:56:36','Adição','pacientes',28,'Paciente adicionado: testei fe3',0),(300,'2024-11-27','00:02:33','Alteração','medicamentos_prescritos',7,'Medicamento alterado: Thor',0),(301,'2024-11-27','00:09:57','Alteração','medicamentos_prescritos',7,'Medicamento alterado: Thor',0),(302,'2024-11-27','00:30:45','Adição','medicamentos_prescritos',8,'Medicamento prescrito: ',0),(303,'2024-11-27','00:31:53','Adição','medicamentos_prescritos',9,'Medicamento prescrito: ',0),(304,'2024-11-27','00:32:53','Adição','medicamentos_prescritos',10,'Medicamento prescrito: ',0),(305,'2024-11-27','00:37:49','Adição','medicamentos_prescritos',11,'Medicamento prescrito: ',0),(306,'2024-11-27','00:38:11','Adição','medicamentos_prescritos',12,'Medicamento prescrito: ',0),(307,'2024-11-27','01:24:56','Adição','medicamentos_prescritos',22,'Medicamento prescrito para o animal: Bingo',0),(308,'2024-11-27','01:24:56','Adição','medicamentos_prescritos',22,'Medicamento prescrito para o animal: Bingo',0),(309,'2024-11-27','01:25:18','Adição','medicamentos_prescritos',23,'Medicamento prescrito para o animal: Bingo',0),(310,'2024-11-27','01:25:18','Adição','medicamentos_prescritos',23,'Medicamento prescrito para o animal: Bingo',0),(311,'2024-11-27','01:26:44','Adição','medicamentos_prescritos',24,'Medicamento prescrito para o animal: Bingo',0),(312,'2024-11-27','01:26:44','Adição','medicamentos_prescritos',24,'Medicamento prescrito para o animal: Bingo',0),(313,'2024-11-27','01:39:07','Adição','medicamentos_prescritos',25,'Medicamento prescrito para o animal: Bingo',0),(314,'2024-11-27','01:39:07','Adição','medicamentos_prescritos',25,'Medicamento prescrito para o animal: Bingo',0),(315,'2024-11-27','02:02:46','Alteração','consultas_marcadas',36,'Consulta alterada: Bingo',0),(316,'2024-11-27','02:20:59','Adição','pacientes',29,'Paciente adicionado: Eric Rodrigues Gomes de Jesus',0),(317,'2024-11-27','02:22:03','Adição','medicamentos_prescritos',26,'Medicamento prescrito para o animal: Bingo',0),(318,'2024-11-27','02:22:03','Adição','medicamentos_prescritos',26,'Medicamento prescrito para o animal: Bingo',0),(319,'2024-11-27','02:46:26','Adição','pacientes',30,'Paciente adicionado: testei fe3',0),(320,'2024-11-27','02:47:16','Adição','pacientes',31,'Paciente adicionado: teste',0),(321,'2024-11-27','02:48:24','Adição','pacientes',32,'Paciente adicionado: TEEEEEEESTE',0),(322,'2024-11-27','02:59:38','Deleção','pacientes',8,'Paciente deletado: Rex',0),(323,'2024-11-27','03:00:06','Deleção','pacientes',22,'Paciente deletado: testei ',0),(324,'2024-11-27','03:01:03','Deleção','pacientes',18,'Paciente deletado: testei ',0),(325,'2024-11-27','03:02:19','Deleção','pacientes',17,'Paciente deletado: testei ',0),(326,'2024-11-27','03:04:01','Deleção','pacientes',9,'Paciente deletado: Mimi',0),(327,'2024-11-27','03:20:58','Adição','horarios',55,'Horário adicionado: 2024-11-27 06:23:00',0),(328,'2024-11-27','03:21:21','Adição','consultas_marcadas',39,'Consulta marcada: Miau',0),(329,'2024-11-27','03:21:21','Alteração','horarios',55,'Horário alterado: 2024-11-27 06:23:00 para 2024-11-27 06:23:00',0),(330,'2024-11-27','04:18:40','Adição','horarios',56,'Horário adicionado: 2024-11-27 10:23:00',0),(331,'2024-11-27','05:28:24','Adição','pets',25,'Pet adicionado: teste',0),(332,'2024-11-27','05:28:51','Adição','pets',26,'Pet adicionado: tese',0),(333,'2024-11-27','05:31:47','Adição','pets',27,'Pet adicionado: TESTEEE',0),(334,'2024-11-27','05:33:18','Adição','pets',28,'Pet adicionado: TESTE',0),(335,'2024-11-27','05:33:55','Adição','pets',29,'Pet adicionado: TESTEEEEE',0),(336,'2024-11-27','05:36:28','Adição','pets',30,'Pet adicionado: TESTEEEEEEEEEE',0),(337,'2024-12-01','15:05:33','Adição','horarios',57,'Horário adicionado: 2024-12-28 15:09:00',0),(338,'2024-12-01','15:05:48','Adição','consultas_marcadas',40,'Consulta marcada: Bingo',0),(339,'2024-12-01','15:05:48','Alteração','horarios',57,'Horário alterado: 2024-12-28 15:09:00 para 2024-12-28 15:09:00',0),(340,'2024-12-01','15:10:59','Adição','consultas_marcadas',41,'Consulta marcada: Bobby',0),(341,'2024-12-01','15:10:59','Alteração','horarios',56,'Horário alterado: 2024-11-27 10:23:00 para 2024-11-27 10:23:00',0),(346,'2024-12-01','16:09:07','Adição','medicamentos_prescritos',30,'Medicamento prescrito para o animal: Bobby',0),(347,'2024-12-01','16:09:07','Adição','medicamentos_prescritos',30,'Medicamento prescrito para o animal: Bobby',0),(348,'2024-12-01','16:09:07','Adição','medicamentos_prescritos',31,'Medicamento prescrito para o animal: Luna',0),(349,'2024-12-01','16:09:07','Adição','medicamentos_prescritos',31,'Medicamento prescrito para o animal: Luna',0),(350,'2024-12-01','16:09:07','Adição','medicamentos_prescritos',32,'Medicamento prescrito para o animal: Zeca',0),(351,'2024-12-01','16:09:07','Adição','medicamentos_prescritos',32,'Medicamento prescrito para o animal: Zeca',0);
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_vacinas`
--

DROP TABLE IF EXISTS `historico_vacinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_vacinas` (
  `idHistorico` int(11) NOT NULL AUTO_INCREMENT,
  `idAnimal` int(11) DEFAULT NULL,
  `dataVacina` date DEFAULT NULL,
  `tipoVacina` varchar(100) DEFAULT NULL,
  `observacao` text DEFAULT NULL,
  `dataAplicacao` date DEFAULT NULL,
  `idVacina` int(11) DEFAULT NULL,
  `idVeterinario` int(11) DEFAULT NULL,
  `clinica_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idHistorico`),
  KEY `fk_veterinario` (`idVeterinario`),
  KEY `fk_clinica` (`clinica_id`),
  CONSTRAINT `fk_clinica` FOREIGN KEY (`clinica_id`) REFERENCES `clinicas` (`id`),
  CONSTRAINT `fk_veterinario` FOREIGN KEY (`idVeterinario`) REFERENCES `veterinarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_vacinas`
--

LOCK TABLES `historico_vacinas` WRITE;
/*!40000 ALTER TABLE `historico_vacinas` DISABLE KEYS */;
INSERT INTO `historico_vacinas` VALUES (1,1,'2023-08-01','Antirrábica','Sem complicações','2023-08-01',1,1,7),(2,2,'2023-07-15','V8','Animal apresentou febre','2023-07-15',2,1,7),(3,3,'2023-06-20','Antirrábica','Vacina administrada com sucesso','2023-06-20',1,1,7),(4,4,'2023-05-10','V10','Reação alérgica leve','2023-05-10',3,1,7),(5,5,'2023-04-25','Antirrábica','Animal em boas condições','2023-04-25',1,1,7),(6,6,'2023-03-18','V8','Sem complicações','2023-03-18',2,1,7),(7,7,'2023-02-12','Antirrábica','Animal tranquilo','2023-02-12',1,1,7),(8,8,'2024-09-15','Vacina Antirrábica','Aplicada anualmente.','2024-09-15',1,1,7),(9,9,'2024-09-20','Vacina Polivalente','Primeira aplicação.','2024-09-20',2,1,7),(10,10,'2024-09-25','Vacina Contra Giardíase','Vacina aplicada com sucesso.','2024-09-25',3,1,7),(11,11,'2024-09-30','Vacina Anti-Leptospira','Vacina de reforço.','2024-09-30',4,1,7),(12,12,'2024-10-01','Vacina Contra a Tosse dos Canis','Primeira aplicação.','2024-10-01',5,1,7),(13,8,'2024-09-15','Vacina Antirrábica','Aplicada anualmente.','2024-09-15',1,1,7),(14,9,'2024-09-20','Vacina Polivalente','Primeira aplicação.','2024-09-20',2,1,7),(15,10,'2024-09-25','Vacina Contra Giardíase','Vacina aplicada com sucesso.','2024-09-25',3,1,7),(16,11,'2024-09-30','Vacina Anti-Leptospira','Vacina de reforço.','2024-09-30',4,1,7),(17,12,'2024-10-01','Vacina Contra a Tosse dos Canis','Primeira aplicação.','2024-10-01',5,1,7),(18,8,'2024-09-15','Vacina Antirrábica','Aplicada anualmente.','2024-09-15',1,1,7),(19,9,'2024-09-20','Vacina Polivalente','Primeira aplicação.','2024-09-20',2,1,7),(20,10,'2024-09-25','Vacina Contra Giardíase','Vacina aplicada com sucesso.','2024-09-25',3,1,7),(21,11,'2024-09-30','Vacina Anti-Leptospira','Vacina de reforço.','2024-09-30',4,1,7),(22,12,'2024-10-01','Vacina Contra a Tosse dos Canis','Primeira aplicação.','2024-10-01',5,1,7),(23,8,'2024-09-15','Vacina Antirrábica','Aplicada anualmente.','2024-09-15',1,1,7),(24,9,'2024-09-20','Vacina Polivalente','Primeira aplicação.','2024-09-20',2,1,7),(25,10,'2024-09-25','Vacina Contra Giardíase','Vacina aplicada com sucesso.','2024-09-25',3,1,7),(26,11,'2024-09-30','Vacina Anti-Leptospira','Vacina de reforço.','2024-09-30',4,1,7),(27,12,'2024-10-01','Vacina Contra a Tosse dos Canis','Primeira aplicação.','2024-10-01',5,1,7),(28,8,'2023-08-01','Vacina Antirrábica','Aplicação em dia','2023-08-01',NULL,1,7),(29,9,'2023-07-15','Vacina V8','Primeira dose','2023-07-15',NULL,1,7),(30,10,'2023-06-10','Vacina V10','Atualização de vacinas','2023-06-10',NULL,1,7),(31,11,'2023-05-05','Vacina Leptospirose','Sem reações adversas','2023-05-05',NULL,1,7),(32,12,'2023-04-20','Vacina Antirrábica','Reação leve, monitorar','2023-04-20',NULL,1,7),(33,13,'2024-01-10','Vacina Antirrábica','Primeira dose','2024-01-10',NULL,1,7),(34,14,'2024-02-10','Vacina V10','Reforço','2024-02-10',NULL,1,7),(35,15,'2024-03-10','Vacina Leptospirose','Segunda dose','2024-03-10',NULL,1,7);
/*!40000 ALTER TABLE `historico_vacinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `horario` time NOT NULL,
  `disponibilidade` enum('Disponivel','Reservado') NOT NULL,
  `clinica_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` VALUES (52,'2024-11-18','12:32:00','Disponivel',7),(53,'2024-11-13','18:14:00','Disponivel',7),(54,'2024-11-29','21:00:00','Reservado',7),(55,'2024-11-27','06:23:00','Reservado',7),(56,'2024-11-27','10:23:00','Reservado',7),(57,'2024-12-28','15:09:00','Reservado',7);
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_horarios_insert AFTER INSERT ON horarios
FOR EACH ROW
BEGIN
    INSERT INTO historico (data, hora, tipo, tabela, registro_id, descricao)
    VALUES (CURDATE(), CURTIME(), 'Adi��o', 'horarios', NEW.id, CONCAT('Hor�rio adicionado: ', NEW.data, ' ', NEW.horario));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_horarios_update AFTER UPDATE ON horarios FOR EACH ROW
BEGIN
    INSERT INTO historico (data, hora, tipo, tabela, registro_id, descricao)
    VALUES (CURDATE(), CURTIME(), 'Altera��o', 'horarios', OLD.id, CONCAT('Hor�rio alterado: ', OLD.data, ' ', OLD.horario, ' para ', NEW.data, ' ', NEW.horario));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_horarios_delete AFTER DELETE ON horarios
FOR EACH ROW
BEGIN
    INSERT INTO historico (data, hora, tipo, tabela, registro_id, descricao)
    VALUES (CURDATE(), CURTIME(), 'Dele��o', 'horarios', OLD.id, CONCAT('Hor�rio deletado: ', OLD.data, ' ', OLD.horario));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `medicamentos_prescritos`
--

DROP TABLE IF EXISTS `medicamentos_prescritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamentos_prescritos` (
  `idPrescricao` int(11) NOT NULL AUTO_INCREMENT,
  `medicamento` varchar(255) NOT NULL,
  `dataPrescricao` date NOT NULL,
  `dosagem` varchar(255) NOT NULL,
  `status` enum('Prescrito','Em uso','Concluído','Cancelado') NOT NULL DEFAULT 'Prescrito',
  `pet_id` int(11) DEFAULT NULL,
  `tutor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPrescricao`),
  KEY `fk_pet_id` (`pet_id`),
  CONSTRAINT `fk_pet` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`),
  CONSTRAINT `fk_pet_id` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos_prescritos`
--

LOCK TABLES `medicamentos_prescritos` WRITE;
/*!40000 ALTER TABLE `medicamentos_prescritos` DISABLE KEYS */;
INSERT INTO `medicamentos_prescritos` VALUES (1,'Cefalexina','2023-08-11','500mg, 2x ao dia por 7 dias','Prescrito',NULL,NULL),(2,'Amoxicilina','2023-07-21','250mg, 2x ao dia por 10 dias','Prescrito',NULL,NULL),(3,'Meloxicam','2023-06-06','0.1mg/kg, 1x ao dia por 5 dias','Prescrito',NULL,NULL),(4,'Prednisolona','2023-05-13','5mg, 1x ao dia por 7 dias','Prescrito',NULL,NULL),(5,'Metronidazol','2023-04-23','20mg/kg, 2x ao dia por 7 dias','Prescrito',NULL,NULL),(6,'Ciprofloxacina','2023-03-31','250mg, 2x ao dia por 5 dias','Prescrito',NULL,NULL),(7,'Ranitidina','2023-02-19','2mg/kg, 2x ao dia por 5 dias','Em uso',NULL,NULL),(8,'predimizona','2024-11-21','dededed','Prescrito',20,NULL),(9,'predimizonadede','2024-11-08','dedededdedede','Concluído',23,NULL),(10,'predimizonadede','2024-11-14','dedededdedede','Concluído',19,NULL),(11,'predimizonadede','2024-11-22','dedededdedede','Concluído',23,16),(12,'predimizonadede','2024-11-30','dedededdedede','Em uso',23,16),(22,'predimizonadede','2024-11-08','dedededdedede','Concluído',23,16),(23,'teste','2024-11-15','teste','Concluído',23,16),(24,'tesefiinaçl','2024-11-07','testefinal','Cancelado',23,16),(25,'predimizonadede','2024-11-23','teste','Prescrito',23,16),(26,'teste','2024-11-07','teste','Prescrito',23,16),(30,'Antibiótico','2024-01-15','10mg','Prescrito',13,13),(31,'Anti-inflamatório','2024-02-20','5mg','Em uso',14,13),(32,'Vermífugo','2024-03-10','15mg','Concluído',15,13);
/*!40000 ALTER TABLE `medicamentos_prescritos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_medicamentos_prescritos_insert AFTER INSERT ON medicamentos_prescritos
FOR EACH ROW
BEGIN
    DECLARE nome_animal VARCHAR(255);
    SELECT nome INTO nome_animal FROM pets WHERE id = NEW.pet_id;
    INSERT INTO historico (data, hora, tipo, tabela, registro_id, descricao)
    VALUES (CURDATE(), CURTIME(), 'Adi��o', 'medicamentos_prescritos', NEW.idPrescricao, CONCAT('Medicamento prescrito para o animal: ', nome_animal));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_medicamentos_prescritos_insert_v2 AFTER INSERT ON medicamentos_prescritos
FOR EACH ROW
BEGIN
    DECLARE nome_animal VARCHAR(255);
    SELECT nome INTO nome_animal FROM pets WHERE id = NEW.pet_id;
    INSERT INTO historico (data, hora, tipo, tabela, registro_id, descricao)
    VALUES (CURDATE(), CURTIME(), 'Adi��o', 'medicamentos_prescritos', NEW.idPrescricao, CONCAT('Medicamento prescrito para o animal: ', nome_animal));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pacientes` (
  `idPaciente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `especie` varchar(50) NOT NULL,
  `idade` int(11) NOT NULL,
  `sexo` enum('Macho','Fêmea') NOT NULL,
  `proprietario` varchar(100) NOT NULL,
  `tutor_id` int(11) DEFAULT NULL,
  `idTutor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPaciente`),
  KEY `fk_tutor` (`tutor_id`),
  CONSTRAINT `fk_tutor` FOREIGN KEY (`tutor_id`) REFERENCES `tutores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES (10,'Bobby','Cão',2,'Macho','Tutor',13,13),(11,'Luna','Cão',4,'Fêmea','Tutor',13,13),(12,'Zeca','Gato',6,'Macho','Tutor',13,13),(13,'teste','teste',3,'Macho','',16,NULL),(14,'teste','teste',3,'Macho','',13,NULL),(15,'teste','teste',3,'Macho','',13,NULL),(16,'teste','teste',3,'Macho','',13,NULL),(19,'testei ','teste',4,'Macho','',13,NULL),(20,'testei ','teste',4,'Macho','',13,NULL),(21,'testei ','teste',4,'Macho','',13,NULL),(23,'testei ','teste',4,'Fêmea','',13,NULL),(24,'testei ','teste',4,'Fêmea','',13,NULL),(25,'Test Animal','Cão',3,'Macho','',13,NULL),(26,'testei fe','testefe',4,'Fêmea','',13,NULL),(27,'testei fe3','testefe3',4,'Macho','',13,NULL),(28,'testei fe3','testefe3',4,'Macho','',13,NULL),(29,'Eric Rodrigues Gomes de Jesus','eqeqe',4,'Macho','',13,NULL),(30,'testei fe3','testefe3',4,'Macho','',13,NULL),(31,'teste','testeee',4,'Macho','',13,NULL),(32,'TEEEEEEESTE','TESSSSTEEE',6,'Macho','',13,NULL);
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_pacientes_insert AFTER INSERT ON pacientes
FOR EACH ROW
BEGIN
    INSERT INTO historico (data, hora, tipo, tabela, registro_id, descricao)
    VALUES (CURDATE(), CURTIME(), 'Adi��o', 'pacientes', NEW.idPaciente, CONCAT('Paciente adicionado: ', NEW.nome));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_pacientes_update AFTER UPDATE ON pacientes
FOR EACH ROW
BEGIN
    INSERT INTO historico (data, hora, tipo, tabela, registro_id, descricao)
    VALUES (CURDATE(), CURTIME(), 'Altera��o', 'pacientes', OLD.idPaciente, CONCAT('Paciente alterado de ', OLD.nome, ' para ', NEW.nome));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_pacientes_delete AFTER DELETE ON pacientes
FOR EACH ROW
BEGIN
    INSERT INTO historico (data, hora, tipo, tabela, registro_id, descricao)
    VALUES (CURDATE(), CURTIME(), 'Dele��o', 'pacientes', OLD.idPaciente, CONCAT('Paciente deletado: ', OLD.nome));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `especie` varchar(50) DEFAULT NULL,
  `tutor_id` int(11) DEFAULT NULL,
  `raca` varchar(100) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tutor_id` (`tutor_id`),
  CONSTRAINT `pets_ibfk_1` FOREIGN KEY (`tutor_id`) REFERENCES `tutores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES (1,'dadasd','adadsda',NULL,'beta',5),(4,'Bolota','Coelho',NULL,'teste',5),(5,'dadasd','adadsda',NULL,NULL,NULL),(7,'test','teste',NULL,NULL,NULL),(8,'test','teste',NULL,NULL,NULL),(9,'dada','dadad',NULL,NULL,NULL),(13,'Bobby','Cachorro',13,'Poodle',5),(14,'Luna','Cachorro',13,'Beagle',4),(15,'Zeca','Gato',13,'Persa',3),(16,'Victor','gay',NULL,'beta',5),(17,'teste','teste',NULL,'teste',7),(18,'Fido','Cachorro',13,'Labrador',3),(19,'Miau','Gato',13,'Persa',2),(20,'Thor','Cachorro',14,'Pitbull',4),(21,'Rex','Cachorro',15,'Dachshund',1),(22,'Luna','Gato',15,'Siames',2),(23,'Bingo','Cachorro',16,'Beagle',5),(24,'Max','Cachorro',17,'Boxer',3),(25,'teste',NULL,13,'teste',NULL),(26,'tese',NULL,13,'teste',4),(27,'TESTEEE',NULL,13,'TESTEEEEE',6),(28,'TESTE',NULL,13,'TESTE',5),(30,'TESTEEEEEEEEEE','bobizinho',13,'EEEEEE',9);
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_pet_insert AFTER INSERT ON pets
FOR EACH ROW
BEGIN
    INSERT INTO historico (data, hora, tipo, tabela, registro_id, descricao)
    VALUES (CURDATE(), CURTIME(), 'Adi��o', 'pets', NEW.id, CONCAT('Pet adicionado: ', NEW.nome));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tratamentos`
--

DROP TABLE IF EXISTS `tratamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tratamentos` (
  `idTratamento` int(11) NOT NULL AUTO_INCREMENT,
  `idPaciente` int(11) NOT NULL,
  `descricao` text NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date DEFAULT NULL,
  `status` enum('Em andamento','Concluído','Cancelado') NOT NULL,
  `pet_id` int(11) NOT NULL,
  PRIMARY KEY (`idTratamento`),
  KEY `idPaciente` (`idPaciente`),
  CONSTRAINT `tratamentos_ibfk_1` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idPaciente`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamentos`
--

LOCK TABLES `tratamentos` WRITE;
/*!40000 ALTER TABLE `tratamentos` DISABLE KEYS */;
INSERT INTO `tratamentos` VALUES (10,10,'Tratamento dental','2024-09-05','2024-09-10','Concluído',0),(11,11,'Tratamento de pulgas','2024-09-12',NULL,'Cancelado',0),(12,12,'Consulta veterinária geral','2024-09-20',NULL,'Em andamento',0),(13,23,'raiva','2024-11-26','2024-11-26','Em andamento',0),(14,13,'Tratamento de Alergia','2024-01-15','2024-02-15','Em andamento',13),(15,14,'Reabilitação Pós-Operatória','2024-02-20',NULL,'Em andamento',14),(16,15,'Tratamento Dental','2024-03-01','2024-04-01','Concluído',15);
/*!40000 ALTER TABLE `tratamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutores`
--

DROP TABLE IF EXISTS `tutores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `clinica_id` int(11) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `cep` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `clinica_id` (`clinica_id`),
  CONSTRAINT `tutores_ibfk_1` FOREIGN KEY (`clinica_id`) REFERENCES `clinicas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutores`
--

LOCK TABLES `tutores` WRITE;
/*!40000 ALTER TABLE `tutores` DISABLE KEYS */;
INSERT INTO `tutores` VALUES (13,'Tutor','tutor@gmail.com',7,'(11) 98765-4321','Rua dos Tutores, 123','São Paulo','SP','01234-567'),(14,'Eric','ebr876022@gmail.com',7,NULL,NULL,NULL,NULL,NULL),(15,'Teste novo tutor','testeeee@gmail.com',7,NULL,NULL,NULL,NULL,NULL),(16,'Tutor2','Tutor2@gmail.com',7,NULL,NULL,NULL,NULL,NULL),(17,'16','',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tutores` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_tutores_insert AFTER INSERT ON tutores
FOR EACH ROW
BEGIN
    INSERT INTO historico (data, hora, tipo, tabela, registro_id, descricao)
    VALUES (CURDATE(), CURTIME(), 'Adi��o', 'tutores', NEW.id, CONCAT('Tutor adicionado: ', NEW.nome));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_tutores_update AFTER UPDATE ON tutores
FOR EACH ROW
BEGIN
    INSERT INTO historico (data, hora, tipo, tabela, registro_id, descricao)
    VALUES (CURDATE(), CURTIME(), 'Altera��o', 'tutores', OLD.id, CONCAT('Tutor alterado de ', OLD.nome, ' para ', NEW.nome));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_tutores_delete AFTER DELETE ON tutores
FOR EACH ROW
BEGIN
    INSERT INTO historico (data, hora, tipo, tabela, registro_id, descricao)
    VALUES (CURDATE(), CURTIME(), 'Dele��o', 'tutores', OLD.id, CONCAT('Tutor deletado: ', OLD.nome));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo` enum('tutor','veterinario') NOT NULL,
  `clinica_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `clinica_id` (`clinica_id`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`clinica_id`) REFERENCES `clinicas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (11,'Veterinario','veterinario@gmail.com','aaffc4b160630b68bcf9cee3ba63839e','veterinario',7),(12,'Tutor','tutor@gmail.com','aaffc4b160630b68bcf9cee3ba63839e','tutor',7),(13,'Eric','ebr876022@gmail.com','aaffc4b160630b68bcf9cee3ba63839e','tutor',7),(15,'ggmax','ggmax44@gmail.com','$2y$10$eW5uxJXlGg/WiRmlPc.O3u/RBBZGB7r9c1hTkG43xFkV2h5udCn7i','tutor',7),(17,'gay','novousuario@exemplo.com','e10adc3949ba59abbe56e057f20f883e','tutor',7),(18,'Teste novo tutor','testeeee@gmail.com','aaffc4b160630b68bcf9cee3ba63839e','tutor',7),(19,'Tutor2','Tutor2@gmail.com','aaffc4b160630b68bcf9cee3ba63839e','tutor',7),(20,'Veterinario2','Veterinario2@gmail.com','aaffc4b160630b68bcf9cee3ba63839e','veterinario',8);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_usuario_insert AFTER INSERT ON usuarios
FOR EACH ROW
BEGIN
    INSERT INTO usuarios_perfil (id) VALUES (NEW.id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_usuario_delete AFTER DELETE ON usuarios
FOR EACH ROW
BEGIN
    DELETE FROM usuarios_perfil WHERE id = OLD.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuarios_perfil`
--

DROP TABLE IF EXISTS `usuarios_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_perfil` (
  `id` int(11) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `usuarios_perfil_ibfk_1` FOREIGN KEY (`id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_perfil`
--

LOCK TABLES `usuarios_perfil` WRITE;
/*!40000 ALTER TABLE `usuarios_perfil` DISABLE KEYS */;
INSERT INTO `usuarios_perfil` VALUES (15,NULL),(17,'uploads/download (4).jfif'),(18,NULL),(19,NULL),(20,NULL);
/*!40000 ALTER TABLE `usuarios_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacinas`
--

DROP TABLE IF EXISTS `vacinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacinas` (
  `idVacina` int(11) NOT NULL AUTO_INCREMENT,
  `nomeVacina` varchar(255) NOT NULL,
  PRIMARY KEY (`idVacina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacinas`
--

LOCK TABLES `vacinas` WRITE;
/*!40000 ALTER TABLE `vacinas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinarios`
--

DROP TABLE IF EXISTS `veterinarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veterinarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `clinica_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinarios`
--

LOCK TABLES `veterinarios` WRITE;
/*!40000 ALTER TABLE `veterinarios` DISABLE KEYS */;
INSERT INTO `veterinarios` VALUES (1,'Veterinario',7);
/*!40000 ALTER TABLE `veterinarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-02  6:18:51
