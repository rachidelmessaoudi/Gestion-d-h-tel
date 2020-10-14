-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel_database
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `chambre`
--

DROP TABLE IF EXISTS `chambre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chambre` (
  `n_chambre` varchar(40) NOT NULL,
  `type_chambre` varchar(30) NOT NULL,
  `prix` float NOT NULL,
  `description` varchar(30) NOT NULL,
  `reserver` int NOT NULL,
  PRIMARY KEY (`n_chambre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chambre`
--

LOCK TABLES `chambre` WRITE;
/*!40000 ALTER TABLE `chambre` DISABLE KEYS */;
INSERT INTO `chambre` VALUES ('1','Simple',100,'chambre n 1',1),('2','Simple',100,'chambre n 2',0),('3','Double',200,'chambre n 3',1),('4','Double',200,'chambre n 4',0);
/*!40000 ALTER TABLE `chambre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `CIN` varchar(20) NOT NULL,
  `Nom_Complet` varchar(40) NOT NULL,
  `Sexe` varchar(15) NOT NULL,
  `Téléphone` varchar(30) NOT NULL,
  `Adresse` varchar(30) NOT NULL,
  `Pays` varchar(30) NOT NULL,
  `date_dajouter` date DEFAULT NULL,
  PRIMARY KEY (`CIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('D895011','Grini Youssef','Masculin','650035204','Toulal Meknes','Maroc','2020-10-13'),('D895012','GRini Ahmed','Masculin','65004763','Fes','Maroc','2020-10-14');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `Id_reservation` int NOT NULL AUTO_INCREMENT,
  `CIN` varchar(30) NOT NULL,
  `type_chambre` varchar(30) NOT NULL,
  `n_chambre` varchar(30) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `prix_paye` float NOT NULL,
  `type_payement` varchar(30) NOT NULL,
  PRIMARY KEY (`Id_reservation`),
  KEY `n_chambre` (`n_chambre`),
  KEY `CIN` (`CIN`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`n_chambre`) REFERENCES `chambre` (`n_chambre`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`CIN`) REFERENCES `client` (`CIN`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'D895011','Double','3','2020-10-14','2020-10-16',600,'Espece'),(2,'D895011','Simple','2','2020-10-08','2020-10-10',300,'Carte banquaire'),(5,'D895012','Simple','2','2020-10-14','2020-10-20',700,'Espece');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(40) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('grini','12345');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-14 13:57:52
