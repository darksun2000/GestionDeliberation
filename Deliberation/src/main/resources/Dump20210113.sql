CREATE DATABASE  IF NOT EXISTS `deliberationbachelor` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `deliberationbachelor`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: deliberationbachelor
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
-- Table structure for table `element`
--

DROP TABLE IF EXISTS `element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `element` (
  `id_element` int NOT NULL,
  `libelle_element` varchar(255) DEFAULT NULL,
  `module` int DEFAULT NULL,
  `professeur` int DEFAULT NULL,
  PRIMARY KEY (`id_element`),
  KEY `fk_module` (`module`),
  KEY `fk_professeur` (`professeur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element`
--

LOCK TABLES `element` WRITE;
/*!40000 ALTER TABLE `element` DISABLE KEYS */;
/*!40000 ALTER TABLE `element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etape`
--

DROP TABLE IF EXISTS `etape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etape` (
  `id_etape` int NOT NULL,
  `libelle_etape` varchar(255) DEFAULT NULL,
  `filiere` int DEFAULT NULL,
  `diplomante` int DEFAULT NULL,
  PRIMARY KEY (`id_etape`),
  KEY `fk_filiere` (`filiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etape`
--

LOCK TABLES `etape` WRITE;
/*!40000 ALTER TABLE `etape` DISABLE KEYS */;
INSERT INTO `etape` VALUES (1,'1ere annÃ©e',1,0),(2,'2eme annÃ©e',1,0),(3,'3eme annÃ©e',1,1),(4,'1ere annÃ©e',2,0),(5,'2eme annÃ©e',2,0),(6,'3eme annÃ©e',2,1),(7,'1ere annÃ©e',3,0),(8,'2eme annÃ©e',3,1);
/*!40000 ALTER TABLE `etape` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etudiant` (
  `id` int NOT NULL,
  `academy` varchar(255) DEFAULT NULL,
  `bac_place` varchar(255) DEFAULT NULL,
  `bac_type` varchar(255) DEFAULT NULL,
  `bac_year` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `cne` varchar(255) DEFAULT NULL,
  `establishment` varchar(255) DEFAULT NULL,
  `first_name_ar` varchar(255) DEFAULT NULL,
  `first_name_fr` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `high_school` varchar(255) DEFAULT NULL,
  `last_name_ar` varchar(255) DEFAULT NULL,
  `last_name_fr` varchar(255) DEFAULT NULL,
  `massar_edu` varchar(255) DEFAULT NULL,
  `mention` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiant`
--

LOCK TABLES `etudiant` WRITE;
/*!40000 ALTER TABLE `etudiant` DISABLE KEYS */;
INSERT INTO `etudiant` VALUES (295,'meknes','midelt','sm',2018,'2000-05-24 00:00:00','midelt','Midelt','VA123154','my rachid','Ø®Ø§Ù„Ø¯','Khalid','HOMME','my rachid','Ù†Ø¹ÙŠÙ…ÙŠ','Naimi','M12001648','TrÃ©s bien','MA','midelt','2021-01-12 20:25:01'),(318,'meknes','meknes','math',2017,'1998-04-01 00:00:00','Meknes','Midelt','220','Bachelor','oussama','Oussama','HOMME','la rource bleu','boussif','Boussif','M12345678','TrÃ©s bien','BR','midelt','2021-01-13 16:13:49');
/*!40000 ALTER TABLE `etudiant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filiere`
--

DROP TABLE IF EXISTS `filiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filiere` (
  `id_filiere` int NOT NULL,
  `nom_filiere` varchar(255) DEFAULT NULL,
  `etape` int DEFAULT NULL,
  PRIMARY KEY (`id_filiere`),
  KEY `fk_etape` (`etape`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filiere`
--

LOCK TABLES `filiere` WRITE;
/*!40000 ALTER TABLE `filiere` DISABLE KEYS */;
INSERT INTO `filiere` VALUES (1,'Genie Informatique',3),(2,'Genie Biomedical',3),(3,'Chimie appliquÃ©e',2);
/*!40000 ALTER TABLE `filiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filiere_inscriptions_administrative`
--

DROP TABLE IF EXISTS `filiere_inscriptions_administrative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filiere_inscriptions_administrative` (
  `filiere_id_filiere` int NOT NULL,
  `inscriptions_administrative_id_ia` int NOT NULL,
  KEY `FKqgknn6856am7ti77bx88o8f1l` (`inscriptions_administrative_id_ia`),
  KEY `FKcnmgddltrcy1j2msc8th7v8hg` (`filiere_id_filiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filiere_inscriptions_administrative`
--

LOCK TABLES `filiere_inscriptions_administrative` WRITE;
/*!40000 ALTER TABLE `filiere_inscriptions_administrative` DISABLE KEYS */;
/*!40000 ALTER TABLE `filiere_inscriptions_administrative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filiere_inscriptions_pedagogique`
--

DROP TABLE IF EXISTS `filiere_inscriptions_pedagogique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filiere_inscriptions_pedagogique` (
  `filiere_id_filiere` int NOT NULL,
  `inscriptions_pedagogique_id_ip` int NOT NULL,
  KEY `FKpxr95s4gupu4c8vb3tdymo1uc` (`inscriptions_pedagogique_id_ip`),
  KEY `FKcj0rgq9ulof4uxn337juoy972` (`filiere_id_filiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filiere_inscriptions_pedagogique`
--

LOCK TABLES `filiere_inscriptions_pedagogique` WRITE;
/*!40000 ALTER TABLE `filiere_inscriptions_pedagogique` DISABLE KEYS */;
/*!40000 ALTER TABLE `filiere_inscriptions_pedagogique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (323),(323),(323),(323),(323),(323),(323),(323),(323),(323),(323),(323);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscription_administrative`
--

DROP TABLE IF EXISTS `inscription_administrative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscription_administrative` (
  `id_ia` int NOT NULL,
  `annee_academique` varchar(255) DEFAULT NULL,
  `date_pre_inscription` datetime DEFAULT NULL,
  `date_valid_inscription` datetime DEFAULT NULL,
  `etudiant` int DEFAULT NULL,
  `filieres_id_filiere` int DEFAULT NULL,
  `operateur` varchar(255) DEFAULT NULL,
  `document1` longblob,
  `photo` longblob,
  `encoded` varchar(255) DEFAULT NULL,
  `encoded_photo` varchar(255) DEFAULT NULL,
  `encoded_document1` varchar(255) DEFAULT NULL,
  `an` longblob,
  `bac` longblob,
  `cin` longblob,
  `document2` longblob,
  `encoded_an` varchar(255) DEFAULT NULL,
  `encoded_bac` varchar(255) DEFAULT NULL,
  `encoded_cin` varchar(255) DEFAULT NULL,
  `encoded_document2` varchar(255) DEFAULT NULL,
  `encoded_rv` varchar(255) DEFAULT NULL,
  `rn` longblob,
  PRIMARY KEY (`id_ia`),
  KEY `fk_etudiant` (`etudiant`),
  KEY `FKe43sw4q8dmqx5nnw7hnigv5l8` (`filieres_id_filiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscription_administrative`
--

LOCK TABLES `inscription_administrative` WRITE;
/*!40000 ALTER TABLE `inscription_administrative` DISABLE KEYS */;
INSERT INTO `inscription_administrative` VALUES (296,'2018/2019','2021-01-12 00:00:00','2021-01-12 00:00:00',295,1,'Administrateur',NULL,NULL,NULL,NULL,NULL,NULL,_binary 'QRR4P-F4FDP-H986R-RF6P3-7QK3R',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\n\0\0‘\0\0\0ˆ›H\0\0\âtEXtmxfile\0%3Cmxfile%20host%3D%22app.diagrams.net%22%20modified%3D%222021-01-09T15%3A04%3A30.296Z%22%20agent%3D%225.0%20(Windows%20NT%2010.0%3B%20Win64%3B%20x64)%20AppleWebKit%2F537.36%20(KHTML%2C%20like%20Gecko)%20Chrome%2F87.0.4280.141%20Safari%2F537.36%20Edg%2F87.0.664.75%22%20etag%3D%22lfUR3zF5NTbUW1H13H1s%22%20version%3D%2214.1.1%22%20type%3D%22device%22%3E%3Cdiagram%20id%3D%22OwgjLNJBIycCDtZY6UnE%22%20name%3D%22Page-1%22%3E3VnbctowEP0apk%2FNIHzBPAIJbafNNDOZtsmjsBdbjWxRWQ7Qr6%2BEZWNbJhAGQugLo11dLJ09e9YyHWscLz9xPI9uWQC00%2BsGy4513en1PNeTv8qxyh22080dISdB7kIbxz35C9pZDMtIAGltoGCMCjKvO32WJOCLmg9zzhb1YTNG60%2Bd4xAMx72Pqen9RQIR6WMVp1D%2Bz0DCqHgy6uqeGBeDtSONcMAWFZd107HGnDGRt%2BLlGKjCrsAlnzfZ0ltujEMi9pnw9Yb%2F%2Fp6u%2FvQn3S8WBJzZD%2BwjsvJlnjHN9In1bsWqgGAREQH3c%2BwreyGj3LFGkYiptJBs4nSeAz8jS5DPGs0IpWNGGV9PtwAFDvSlPxWcPUGlZ%2BD2LezKHr0H4AKWW0%2BHSswk14DFIPhKDtETSpg1z3pFHBabqNmFL6pErHRizZSwXHsDpmxoPF%2BDrQHtD0EoSbGAjBsoS3rMVTOL6dAXCqIqyAobIln5DU%2BB3rGUCMIS2TdlQrC4MmBISag6BFNhwtryJYrAzdgEGLyZ3xYb1%2FdgOjtObBCqx8ZyzdhYLaFxTxWZnhGZccTIUslUplKXBZ2x1Rl6MjbNMMnVpfRIY7QjLc6CdM9pIO04BtLIboG6fyqoTX25VkrNlWRHEJNEgf6BxEqGLxvrksJnw9pp0XIXxwosKtaHrlok8WkWQOkMa0O01YxIIIujNhOWQD0MkARDVXKlyeaQtKhSKVcBTiNVLNbzqBK1EfafQs6yJCjipR8ASyIepNm9crT1qCzdvl5WjVVhJBLPyiRlPpa7lMZm2toq5uUHVqd8mRQSFJZxH3ZrjMA8BLErQUySVUlU6CAHigV5ru%2BtjUV6uTtG5K5Lwlp2nbC23SBifiY9q%2Fom0VjI6e5YKD%2B0sdCa1OUZD%2Be5a%2FD8tqrY3Z9hiNzD1eQI2mC7DR1ueRt5W23ot2jDock9pcx%2Fyl0TorahM6l4fUe9l1K%2FyGdUzeYyt9vz%2Bdh5eVn5Zg0abBrsl28yXnhVGTZXA9LtGzZYa9duFLKRr3jUZPZ2JPMEsMg4pO8qn%2B3eufN58O7yufuKfC7rM6pW50qxPn199vaszxeoF3ZzoeYV98T1ubjuHYWcunM7%2FcpXvVNRaSdF0BbxOAFHkLWjFOzLEeOm6A2unLdlifl95I6vhX8QEH7pt0HbO3eFQOZXjv%2FiOnjg1e6Qa%2BQRyw3aV0zesN54Dco6B2qJcR88Wr2R5uYDeT588y%2BDdfMP%3C%2Fdiagram%3E%3C%2Fmxfile%3E$AR\0\0 \0IDATx^\ìx\Õ\×\Æ\ßlz¯¤‡HHBˆAP0(Tª\r¤QAP‘\"@°\ÑD± ‰ Eš)‰@\è!\ÒCê¦—\İ|\Ï3ù/!m“Ù\Ù\İ3\Ï3‘{î¹¿3É¼{\î™{@‡\Ş\Ø8{W¥\Ş’Hˆ\0 \Z!`¤«dTR˜Pú\Æ\0IùD\Î\"@ˆ€ô	\ìûöH(H?N\Íö„B³’\"@ˆ€A ¡` a\'¡` ¦a\"@&@BA` R5GBAª‘!¿ˆ\0 \Ò&@BA\Úñ\Ì;\n‚¡$CD€ƒ\"@BÁ@\ÂMBÁ@M\Ã$D€L€„‚À@¥j„‚T#C~\"@¤M€„‚´\ã#˜w$CI†ˆ\0 E€„‚„›„‚š†Iˆ\0˜\0	J\Õ	©F†ü\"D€H›\0	i\ÇG0\ïH(†’\"@Š\0		7		4\r“\" 0\n•ª9\nRùEˆ\06\nÒ`Ş‘P%\"D€\nn\nh\Z& D@`$*Us$¤\Zò‹\" m$¤Á¼#¡ J2Dˆ\00($$\Ü$$\Ğ4L\"@ˆ€ÀH(Tª\æH(H52\ä D@\ÚH(H;>‚yGBA0”dˆ\"`PH(H¸I(H i˜D€	P¨TÍ‘Pjd\È/\"@ˆ€´	Pv|ó„‚`(\É DÀ P0p“P0@\Ó0‰\0  ¡ 0P©š#¡ \ÕÈ_D€i ¡ \íø\æ	ÁP’!\"@ˆ€A ¡` \á&¡` ¦a\"@&@BA` R5GBAª‘!¿ˆ\0 \Ò&@BA\Úñ\Ì;\n‚¡$CD€ƒ\"@BÁ@\ÂMBA\Ø@—)_R‚\Ò\n\î,*Spgq…%\åJ\î,«P \\¡\ä\Î\nE%J%”•@eeeµ3FFF\Æ2LŒ`j,\ãN3cX˜Ê¸\Ó\Ò\ÄVfÿ6\æ&\Üika\nK3caEÖˆ\0 µ ¡` ·	õ]R®@Va²\nJ‘STœ\âr\ä•!¯¨&2l¬\Ì`ci+K3\î´dosS˜›™À\Ü\Ôf¦\Æ055†‰1;e0–A&3üÁDƒR\ÉDD%*8A¡@y¹e\å\n”–W ´¬Å¥\å(.)GQqw—¢ ¨J%\ì­\Ì\à\ÈNKS8Z™\Â\Ù\Æ\Î\Öf°0%¡~Ä© µ ¡` ÷	…ú]XZ4y	\ÒÙ™_†Œü”–+\àloG;+8\Ø[ÁÁ\Öö6\Üij\"şƒ¸¼B¼‚\î\Ì\Í/Fn^r\äE\È\Ê+‚¹©1\\m-\àfk7;¸\ÛYÀ\Ú\Ü\Ä@\îv\Z& B ¡ $M	\Û\"¡ğ`pXf )»Iy%H\Î-Fi¹nN6h\ábWG¸8Z\Ã\Î\ÚB\Â­\ß5ya	2s\n‘‘S€û™ùH\Ï.€¹©^–ğ¶·€·“—‰ ƒ\"\Ğ\n\rÒ“\Ï\r](°:»™…ˆ\Ï.BBV`xº\Ú\Ã\Ó\Õ.vp´³Ô“H\×=Œy1R3\åH\É\ÈEJFP	ø:[Á\Ï\É\n­\\¬¹\Ú:ˆ\0 5	P0{\Â…›Nˆ\Í(@\\f!³\n\á\ëî€–Nğqw\à¦ı`\Ó‰i¹¸—’„´\\ø8[\Ã\ß\Å\Z®64Ma\è7Ÿ¨ ¡` ·ƒ¡–9¸™–›\éH—£·3Zy;\Ã\Ï\Ó*5„õ\Æ“½ˆŸ’…»IY¸”7;K¹\Ù \Èİ–2\r\ÇHW½$@BA/\Ãúğ ô](\Ü\Ë.ÂµT9bR\åğ÷q†¿¯+Zy9Ht…\æ\İ\äl\Ä%d .1vh\ïa‡–NV\ÂwD‰\0<\n’‘0\ê£P`ß‚£“rq99\Æ&&j\ã† ?7˜˜\Ğ\\»0w\rPQ¡\Ä\ÍøtÜ¼EE:yÙ£³·eg„Lvˆ€ ¡ A\ÂE}\n\Å\å\n\\¸—ƒ‹÷r\á\ç\å„şğha\'&²Q\Ôûr\\KE|r6º¶t@·–°¤õ\Z\è!zO€„‚Ş‡ø¿\êƒP` E\Æ\çp\"¡ƒ¿;:zÁ\Ö\Ú\Ü@\"(a\æ–\":&W\ã\Ò8±\Ğ\İÏ‘x’Nx\È\" 8\n‚#•¦A]\ng\ïd\á\Ü\İltl\ënÁ\Ş\Ü\nˆtˆK€­y\áF®\ÜJE\ÏVNx´µ³¸Q\ïD€h„\0	`•Q]\n7R\å8u;>\è\ŞÁ6V”A\Ú\İUPTŠÈ«	HL\ÍEŸ6\Îö i ©Åˆü!\Í!@B¡9ôt¨­®	…Ü¢2\ÍD‰x´K+nQ$:¤M€-\ætö\Ò]XÈ€ş.p •¥0ò4’\0	…F‚\Òõ\ËtI(\\J\Ì\Åß±÷Ñ«³:·õ\Ôuô\çô­œ‰\Ç\ã-\Ğ\Å\ÇÁ\à\ÆO&úF€„‚¾E´ñ\è‚P(«P\âĞ+Ç»ûÃVO\ÔÙ»3/¿G\ÆÁR\nv…½²ª³±$Ç‰\0	¹¤.Rr‹±ÿZ:Ú¶vC-\r$*ú?\ÌóW\ï\áÖt<\İ\Ş\r´l¶şGœF¨H(\ècTk“”…+X<t=Oõ\nDªœ×·[òvbş:ƒA\íÜ¨\ĞQß‚K\ã1$\"\Ì\Ò]G[8))Cú´\ã¶v¦C?	°-¯œº®\Şö\Ü\Út\" ;H(\èN¬š\å©3\n‘ñÙ¸‘Qˆ¡ı;À\ÆÒ¬Y\ã£\Æ\Ò\'PP\\†}Ç¯\"\Ø\Õ\Z\İıh\éGŒ<$ÿ ¡` w‚Ô„\Ë$\\M+@\èiñ$¹\Ù0\Ù\"MG¯ ƒ»\re(\î4T\İ&@BA·\ã\×h\ï¥$b\Ò\ä8q;#\ìD(5:‚ús![ i\Ï\á\Ë\è\×\Æ	\î´>†şD–F¢¯H(\èkdkŒK*B!#¿»\Î%p\"Á\Í\Ù\Ö@\è\Ó0kH\Ï\Ê\ç\Ä\Âk=}\ájK«m\ÒB¤L€„‚”£# oR\n;\Ï\ßC‡ o·rptdJ	Ü¸›«7“0º½«‹ñ#Ÿ\r‡\0	‰µ„\Â\É\Øû(02Á=\Û\Zu\ZfC»›\Ê\nô\rh\ÑĞ¥ô9 \" ¡ xmw+¶PH——\à—\É\Z3SmŸú“(²ò\nlˆÂ‹İ¼\àfg!Q/\É-\"`\ØH(Hü\Å\n\á\Ñ)ğôvE§¶Bœ†\ÙX—o¥\"%)\Ã;Ó¾eF\×m ¡ M\Ú\"ö%¦PH\Í+\ÆŞ«\é\Ú]DÔµ”	lˆÄ°nğ°§e¥\'ò\Í0	P0¸‹)^Oƒ}\'t\rò2\Ú4Lu	\\¼™Œ¼û\Ù\Ü\Î]İ¦t= \Z&@BAÃ€¥b^,¡ ¬¬\Ä\Ú#±x}xXZ˜Jù!1\Å%\åø.ü<f€\Ì\ÈHbŞ‘;DÀ°	P0ø‹%\â2\np!5ÃŸ\èd ¤i˜M%~ô2ºy\Ø\Â\ßÕ¦©&¨ \Z @BAP¥hR,¡p<&¦vi\çó–»·c0cÂ«¸y\írõgA\í;a\í–ĞªM 1>\äÓ†\ÕK\á\ã\Û\Z¡/¼&¸¿\Îÿƒ\ßÙ‰yKVÁ\ÂBı¹û’’b,_8!=û c—G°\îó%Xô\É:|ÿ\İ&ù\ÜQ\×Q+Gÿ@\×æ˜¡¶D€L€„‚À@¥jN,¡ğcT\"B:·†»C­B\á\ãùÿ‡—}Q-\Ø\Ãñ£¦\êŒXĞ¤Ph\î½T—Ppp”\æVŞ‰i¹ˆŠ¾ƒWB•\ÍeA\í‰\0h:\nMg§S-\Å\n_¸u…­õ\Ã\Ëô²ŒBM¡À ²‡/;¦\ÌZÀı—ıÿ\Úq?¯Ü°ûö\Î?\İ\Ü=«?›1÷#®\r;¾\İÀ]¿\ï÷İ¨™¥¨Ï</†ÿ„#N [\ÇˆqÄ¯»0g\Ê\Øü`¶¬¬mp\êø!œ<v¼\ì\"\Ş\Ç·o\á\Úğ6ùL¾Ş¸}Â”™8Ä²+üU3\n\ßl\\…Â‚œúûw\Í+c\'Ô™i\à\Ç7ô¹‘\\¿\ZŠ~O\æ2	oN\rf‹eA\r}\Ë8´\ï\Ø\ßo\İT\İwb\Â)ók\Õ\Æ`\Â\"7\'³\'\á\Æ\È\Õqò\\\ç>‚µM½±«\ë\'¿°¿ºˆwúµÑ©\ß-r–\è;\nú\áªñ‰%Vÿƒw^z\ÆÆ²‡H\×%T‡öı†ğ_vr¬œ\ìLnª\â£O\ÂĞ®SW\î!\Ç–š¿~ùbu&\"\'+¯„ö\ã\ÌüuLP0ÁjQ\çNqmR“\ï=d¿®¦³ª>•añ\Ó1ıİ…ø3üg\\ˆü\ç!ÿ˜\ÈP<ª™’\ÚüKNŒ\çlÜ‰Á†5K«\æ§\ØÃ½®~T}e\ã«\É\ë­\És˜\Z\á³ ¼PPeÈ¸1¡\ÂÆ¦-Tf\"M5n¬-/ö\\81Ñ­ûcõ²®)Àxÿ\n%¾üù\ÌzJ7¦\äO\r“\Ğ6Ó†rˆ%>?x\Ó_\ë[+\æ\Æş\Û/_À?|\Ù7c~ş}Æ¾ñòoö \æ¶\ì\Û0{x²o\É5\Û0§j>4Ùƒ±¶zƒº¦T\Å\0ŸAx\î\Å\Ñh\È=4Y¦€=U?\ãú­\Ì?UÛŒ	_KÀDƒªP`\í˜\ØQµUó¡[\Ó\Ï\Úü®kÌª}\×ôK5€ª¬¯\\ú—c\Ëg\ZÃº¾zu»N\â\İÁA†òkI\ã$:A€2\n:¦\æ;)–PhJFÿ\Ö?{\ŞR¬Z¾€+\Æ\ã.5D\ì¡\Ì–5…‚j`\Í6üT\0O•¥\ÑyÁ\ÛS%®:\×_ó!§ú ®M(ğ©z\Şû¶\î\í\ã÷@‘bc…_4Y—P¨\Í\Ï\Æ~\Ìõ	–a\Ùş\à§sXF…0ì¿aÍ‹Ššw5ešÿ{Nˆ€&P\ĞU	\ÚK(4·F¡¶o\Èo\Í»:B¡>1P\Ûgª™u„Ÿ\á¨ùGÍ·„\nµù)„P`õ\rª\Ùu2\nuñ¬\íW„j$ø‡ƒ\\\"¬\Ö\ë\Ûc \ÕM\àVK(4÷­‡\Ú\æ\ÜUk\Ô\É(Ô¬Q`µ\ì8ü\Å\Ñ\Õóğu=\ØTkøvlZ\áÌ©£Õ¯\Z\Öü¦¯:-Á¿\n\Ê|g‡j\ÆCH¡ÀD?­Á\×t4T£\ĞPF¡¦P`,X&{•©QPe]\×\Ô½õ`\0ˆhˆ:I€„‚N†M}§\Å\nB¬£P\ß[\n\ê\nş[7ÿ_½_ß¼?O»6?\êšzP­K\à§:j{›­ ¤PP{k¡OÿApvq­·˜±!¡À\ìªo||üù&\\»r|;ş3¾¿¢Â‚Z\ßzP}S¢¶;˜\ÖQPÿ÷šZm ¡ \r\Ê\èC,¡@+3J øZr¡¾ZÆ¸@+36†]C´O€„‚ö™‹Ò£XBöz%\ÜZ\ë´f‘cCYƒº£½´2\êˆ¨M€„‚\Ú\Èt³XBÑ¢\İ#uóÑ¦×´{¤6iS_D@=$\Ôã¥³W‹)RóŠ±÷j:Æ†v\×Y~\ä¸f	lˆÄ°nğ°WO\ÍzFÖ‰\0 ¡` ÷€˜B!N§·+:µõ0\â4\Ì\Æ¸|+)I\ŞÙ³±M\è:\"@´H€„‚a‹Ù•\ØB!]^‚_.$clh\ÌLM\ÄDA}Kˆ@Yy¶GD\á\Ån^p³³g\ä\n <\nr/ˆ-æ“±÷Q`d‚\'z¶5\ê4Ì†=w6•\èĞ¢¡K\és\"@D\"@BA$ğ\Ú\îV\nBy\çù{\è\ä\àVn\ÚF@ıIŒÀ»\é¸z3	£{´”˜g\ä ªH(\Èı ¡‘_Š]\ç0\â\ÉNps¶5ú4ÌšÒ³ò±\çğe¼\Ö\Ó®¶oANÄˆ\0\nÒ‰…F=‘ŠP`ƒŒI“\ã\Ä\ílN,\ØX\ÑCB£— ñ‚¢RN$ôk\ã„@w;	zH.\"@¼¤$ş÷rp5­\0¡Ot„¥¹©F\Ä0‡\\\\Zˆ£W\ĞÁ\İ\İZ:\Z&\Z5\Ğ1”QĞ±€5\Õ]©	6\Èøl\Ü\È(\Ä\Ğş`ci\ÖÔ¡Q;!PP\\†}Ç¯\"\Ø\Õ\Z\İıœt\Äkr“\nrHQ(ğ™…‹IyÒ§\\­\r$\Z†7\ÌÌœB8u]½\í)“`x\á§\ë8\n:ÀÆº/U¡Àü¿‘*Ç¡\ë\éxªW \Úø87vHt¸˜…¿\Î\Ä`P;7{PM‚„\Ü$\ÕH(\È\Í e¡ÀB’[Œı\×\ÒÑ¶µzt \×\åô\å¶<õn\İI\Ç\Ó\í\İ\à\é@\Ë3\ëK\\i†E€„‚\Ä[\êB…¡¬B‰C72P¬\ï\î{[z°\è\êí™—_Œ¿#\ã`)»\Â\ÌD¦«C!¿‰€Á ¡` ·€.>—sñw\ì}ô\ê\ì‡\Îmiı]»E£o¥\àLt<h.>º\æ>ùKˆ@\r$\ä–\Ğ%¡ÀB’[T†ã±™(QvišÛ–ú­šš)\Ç\ÙKwa!ú¸ÀÁŠ\Şd‘z\Ì\È?\"\Ğ$\ZCI®\Ñ5¡À#g…§ngÁ\Ç\Ã\İ;ø\ÒM¼\ÙJ‘W˜š‹>mœ©`Q‚1\"—ˆ@sPh=j««BG|öN\Î\İ\ÍFÇ¶\è\ìM‹4I\à\Şc‹\']¸‘„+·RÑ³•mMo¬H ,\äœ\0	Á‘JÓ ®Fµ¤\\\ÈønU\Çş\î\è\è[kZZ\Ûw\\~a)¢c’q5.[¡»Ÿ#,Lµ\íõGˆ€–P\Ğh±»\Ñ¡À3,.Wpb\á\â½\\øy9¡ƒ¿<ZP\rƒ¦\ï±\Ôûr\\KE|r6º¶t\àD‚%	Mc\'ûD@t$Dv\Ğ\'¡À«¬¢“rq99\Æ&&j\ã† ?7˜Ğ«x‚\İTJÜŒO\Ç\Í\Û\éPTT “—=:{;À\ÈH°.\È \'@BA\â\Ê=}\nªl\îe\áZª1©røû8\Ã\ß\×­¼h?¦\Ş?w“³—¸\Ä,zØ¡½‡Z:Y5\Õµ#D@‡	P\Ğ\á\à©ãº¾E¹B‰›iù¸™^€ty1\Úx;£•·3ü<\é[p=7\Ë\ÎÄ§d\ánRn\'eÁ\Í\ÎAn6r·…©1-–¤\Î\ï\Z]Kô\0	}‹h\ã1¡ :ü\Â\Ò\n\Äf .³‰Y…ğuw@KO\'ø¸;ÀV}Dn~1\Órq/%	i¹ğq¶†¿‹5\\m`mnb ¿4L\"@\Z\"@B¡!Bzò¹!\n\ÕĞ±L\Ã\İ\ÌB\Äg!!«0<]\í\á\é\êÀ-\æ\äh§ÿ\ËE\çÈ‹ÁEJ\É\ÈEJFP	ø:[Á\Ï\É\n­\\¬)s \'¿\ë4\" 4\nB•¨=C\n5Ã’ST†¤\ì\"$\å• 9·¥\åJ¸9Ù …‹-\\m¸-¯\í¬-$\ZÍ†İ’–€míœ‘S€û™ùH\Ï.€¹©^–ğ¶·€·“i\åÄ†A\ÒD€€„‚\Ü$\ê4›¦H“— ùe\È\È/Ai¹\ÎöVp´³‚ƒ½7]aocÁ¦&\â¯P^¡@^A	w²i„Ü¼\"\äÈ‹•WsSc¸\ÚZÀ\Í\Önvp·³ \éù]§a¡	Pš¨D\í‘PP?0l§¬\Â2d”\"§¨9\Å\å`™ˆ¼¢2˜\Èd°±2ƒ¥9¬,Í¸\Ó\ÒÂ”[1\Ò\Ü\Ì\æ¦&035†©©1LŒ\Ù)ƒ±\Ì2™ŒT\Ş-¬¬¬„RY	…²\n%*\n”—+PV®@iyJ\Ë*ÀV@,.)GQqw—¢ ¨J%\ì­Ì¸Ì€£¥)­L\álcgk3Z\0IıpS\"@\ê @BÁ@n\r\n\Âº¸Lü’r”VpgQ™‚;‹+()WrgY…¬6‚\n&”PVLğ\r2#ÀX&ƒ‰±W\'ÀN3cX˜Ê¸\Ó\Ò\ÄVfÿ6\æ&\Üi\ËD‰™øY\ra©’5C#“Ô´¤g¤!#3™™™\È\Î\ÍBN^òòò \Ï\ÏCAa\nQ\\\\„’\Ò”••¡¢¢\n…‚\İ\ì÷É˜‰q˜™™Á\Â\Ü––V°¶¶†µ\r\ìl\íaooG{G898\Ã\Å\Å®.npsu‡‡»\'œ\é5\ê†\î;\n\rÒ“\ÏI(H\'\ì\ßÂ¥ó°dÁr\îD@Ÿ	\ä\Éó{;qw\âp7\á6\ã‘p/÷`nao/oxzzÁ\Ó\Ó\î\î\îh\á\Ú\Î\Î\Îprr‚ƒƒ\ì\ì\ì`cc+++XXXÀ\ÜÜœLğ\rL<”––¢¤¤EEE(((€\\.Gnn.²³³‘••…û÷‘––†””T¤¤$#)9	¥%¥h\é\ãß–¾ğõñC+\ß6ğoí€6°·³\×\ç\Ğ4zl$\ZJ·/$¡ ø}±q\"şü¡\Ï<‡ÿ›<[:‘\'D ™\îg\Ş\Çå«—p\åúeÜˆ¹†k1×/—#88˜;ƒ‚ƒ€Ö­[s\'\0bLPÜ¹s‡;cccqó\ÆMÜ¸qƒ;m\í\ì\Ğ>°=‚Û£c»N\èÔ¡Z¸´\Ûe­÷OBA\ë\È\Åé„‚8\ÜköÊ²	=t\Åú\Ï7aÚ»“p\î\ØE\Ê*H#4\äE\ÜM¸ƒóQ\ç}ÿ^Œ‚<_\î!!\é‚®]»¢K—.ğóók‚ei4‰Ç¥K—pñ\âEDEF!2*\nv¶vx¤kB:÷@h\å\ÛZ\Z\Îj\Ğ\n\Z„+%\Ó$¤\r–MHMO…‡›\Ò\ÒS\á\î\æAYi„†¼h¢¢Bü}ú8N=‰\ÓgOr«ö\ë\×}ûõE\ïŞ½\Ø+º}ILLNŸ>“\'N\âÄ‰`%G½\í‹>ö\Å\ã½û\Ã\Ê\ÊZ·X‹÷$ô.¤µˆ„‚ø\æ³	\á?ş‰\ÏöÃ‘?N`ø+\ÏPVAüĞõÈ¸Ÿ¿\ÄÑ“‡q\ê\ÌI\Z4C†\ÆÀÑ¶m[ƒgw\ë\Ö-9rÄ¡CÑ§W_<\Ñ÷I<õ\Ä`¸¶p\Ó>$ô\"Œ\r‚„BÃŒ4}ŸMølñJø¶÷@ÂµT¼¿he4\r\ì«M€eş8ı\íÅ•k—:|8†Å°a\Ã “\Ñ\ŞuU*•Ø»w/\Â\Ã#\í;\áé§†\á\Ù!¡:i ¡ ö¯n6 ¡ n\Ü\n\Ğc@W°l‚\ë\00\ÑÀ\n\ã\î\ÄrY…ó\Ç.ÂšŞ€7H\Ô;ş9w\Z¿\íı{÷G`Äˆù\ÊHN\Ğ\Ñ4L4\ìşq7ö\ìÙƒaO‡\âùa/â±½›fL\ÄV$D„¯Í®I(h“ö\Ã}ı´\ç\\ˆşŸ.^ùĞ‡,«Ğ­ó#xyÄ«\â:I½$¥R]?\ï\Ä\î\ß~\à^Aÿú8Œ3†û™a°\×5w\ìØ­\ßm\ã^\İùü«x\í¥Ñ\Étc-\n\Â\Ü’·BBAò!\"‰€V	\ä\ä\æ`Û®o±ı‡\ï0t\èPL˜8+H¤C³X!\ä–\Í[°o\ß>Œ}õuŒ{\í\r8:8j¶\ÓfZ\'¡\ĞL€ºÒœ„‚´\"\ÅO=H\Ë+ò\Æ\ä\æ\åâ«­›°u×·˜8q\"¦M›___Cº¤Æ˜€õ\ë\×có\æ\Íÿ\Úx{ü$8\Ø;H\ÊG\Ş\n’‹ğN‘Pis,òÅŒÍ±Am‰€º6|µ›¾Ã¤É“ñ\î»s¸\åŒ\é—\0[¶úó\ÏWb\ÓÆ˜ô\ÖTLy{º¸\Õ\Ò;	É…D3‘P\Ğ×¦Z%¡\ĞTrÔ®)\ØJ k6~O>‰?\\\0Ÿ¦˜¡6\Z$˜˜ˆ?^Š#‡c\æ\äw¹•[¥rPJ$4\ì	\rV\Ó<M=¨	Œ.o„{ñøl\í2–bùòe\èÕ«W“\ìP#\í8s\æ\æÍ›kk¼7c>|[Š¿²%	\í\Å_ÔH(‡?\êb$öDüŒ…\ï-\á6©i\ìÁŠ\Ç.›‡™“\ç u«6\r6S÷ú\r\ÒE`\ç\îmøt\ÍrN L:Õ Æ®ƒ\r\Ãüyóñ\Ş\Ìy=rœ¨C\"¡ *~\íuNBA{¬\ë\êI\İ¿º×‹?Bò@\n\Ø\n –¾¢\ÒB„…­‡¿¿¿\Ü\"š@ ..S§Nƒ•¹5–.øT´}aH(4!xºØ„„B\ã¢v\ç\îm,Z>‹\ç-{\è[ÿº/\×pF\ëÙ‡\Ë(\Ìı¿yXñ\Årne\ÅU\ëWpŸıº3!]»s[\İ.ùl!¾ÿi·ó\Ü\ÆU›\á\è\è\Äe&¿5\rs?œ…7\ÇNÀs\ÃF@5CÁlğ\íF½<ùù\Õ\Ö?\ß\Ï\Ú\Ï6T·]·i5Ö®\ØøÀ+VLdÌ˜;\Ó\'\Í\âü¡\Ã0°µ:\æ.œ…\ÑcFa\áÂ…†1h\å’%K°s\Ç÷X±d5·æŠ¶\n\Ú&.R$\ê\Ï?„\Ù\ÃYuJ	‡É³\'r[\æò\"€°«\n…\é\ï\Ì\Ä\ï{÷\àü¿g¹öÿYıó\ÕW8aÁ®Y¶r	\'†ŒÕ‡=?•Q³İ‚?\àD\Æ\åkÑ¸—”ÀÙ¨™i\àEÛ¬‡·É¶®q‰tR·\Z$À\n\ç-™‹mÛ¶\áù\çŸ\×`OdZ¿ıöÆ‡\åWh½Ğ‘„‚¡O\nµC¯ï›·\êƒ_µ¡¦P\èñÈ£e¶lİ„–Ş¾Ü¿óÿ€¯K(ğÂƒ·§*öŒ¨\Î&ğöjŠö\ïuù\\_¦D„Û‘º˜À\Ö\ï¿\Å÷?o\ÃO?ÿ„Î;l\ÌI…@tt4^~\éeŒziÆzCkn‘P\Ğ\Zjq;\"¡ ¹ŒBS„BmS\r	…š\ÂCU€°i\Ê(ˆû;&V\ïL”8²\á\áğòò\Ë\r\êWK’““1<t8†Š	\ã\'i¥W\nZÁ,~\'$\Zƒ¦\Ô(\Ô&jN!°:‚%ó—cU\Ø\n®\æ€e\ØÁ¦\Øô@Zzj­SªSlz‚\Õ\"°ƒ¯?`?SB\ãb«W±\Õ\Ãÿü¤Å“ô1ÀuŒ‰-\Ò4x\Ğ`\ænUGME}„\0\0 \0IDAT$4MX\"öI(ˆ\ÆL=°©\n\Õ\âCV\ßĞ¦•õ\ë‘Ù¹\Ùxat(\ç\Ô\ìis«…ûuŠ…Y\Ò5{D`õ†8vü- ¤kÁÀ_¶@Ó€ş0k\Ê\\ò\ß\ßM$4EVbvI(H+ ´\à’´\â¡k\Ş\\¿y\r/Œ	\Åñ\ã\ÇÑ½;½Õ¢kñ\Ê\ß\È\ÈHô\ï\ß¿\îˆ@» öB™}\È	¡•–a\nÒŠ-\á,­x\èš7Ï†\é3¦qUğt6ö–Ëºµ\ëñ\ÛÎ½\ZABAch¥e˜„‚´\âABAZñ\Ğ%oV¬ı%ŠB|ıõ×º\ä6ùªAo½õ,Œ­1w\Æ\Zé…„‚F°J\Ï(	iÅ„¦¤]ñ†­\É1~\Òh\Ä\ÆŞ‚½½½®¸M~j˜@^^\Úbë¦\è\ÜQğ\ŞH(TšI(H3.\äP‡À\ä\Ùğô°Á˜2eŠ:\Í\èZ °a\Ã\ì\ß{Wm|´$G*Mƒ$¤òŠ4–À\Å\Ë0{Á\Ä\Å\Å6¶	]g`üı°j\éZt\í\ÔMĞ‘“P§t‘PVlh\êAZñ\Ğo>Xü.ºõ\è‚Ù³gë‚»\ä£V­Z…\ç/\á“EŸ\Ú;	AqJ\×	iÅ†Š¥©{£P(Ğ¾g\0Ğ¢E©»Kş‰D\àşıûğõõÅµs±066\Ì\n‚¡”¶!\nÒŠ	i\ÅC\ê\Şüu\ì~ü}\'şú\ë\Ô]m’§OŸ\Æ\ÇŒ\ï¿ÿ\Î\Î\ÎM²Aş#ğ\ÔSƒğ\Ês£ñÔ€A‚!!¡ Ji\"¡ ­ø\ĞÔƒ´\â!uo–­\\ŒVm}ñşû\ïk\İ\Õ\â\âbÌœ9gÏ\Å\îİ»X\í{°=\Z;w\îÄ¨Q£\Z\í[mÂ€\Ùbo‡\ïwÌ˜1\èİ»w£l3\'OÄš5k`iiù€Ÿµı{£Œª\\ƒ>úaaaÕ‚&++‹óù\àÁƒÜ†\\5©\ÛGs¯ÿô\ÓOq÷V\æ\ÏY\Ô\\S\Õ\íI(†RÚ†H(H;>\ä¨Àko½„–,Â“O>©uPü;77\Ï>û\ìòE‹\íh8v\ì\Øf…škŠP`ò\éÓ§cİºuÕ‚†·Ó·o_µ|¬\é³=r\äH¸»»Wg>j\ÚfhÇ	m\íğ\á\Ãøh\áb\ìúúgÁº%¡ Ji\"¡ \íøwD >=‚\Îüƒ–-[jÿ0\ìÖ­\â\â\â°xñb\î\Û:{p~ó\Í7œ?\ì›4ûV\Í_»yóf\î\ßO:U\r\à´LX,Y²\ì¡\ÊO5°Ÿûô\éÃµ™8q\"÷ e\Ëdğ\Õöƒ®uš¢6QPS<¨ö\Åü`»1ò>C\Â\Æ3h\Ğ \Ø\Ú\Ú\â\Ã?\ä|e¯¤²±ÿø\ã\Õ\ÏD\ëÁ©¥\Ã{÷\î\á±^áŸ¿¢s‡„‚`(¥mˆ„‚´\âCSÒŠ‡Ô½	\è\ê¹<\æ\æ\æZw•ø>ıô\Ó\ÜC’¥\Ş\Ùô?Up\ç\Î´nİš\n¬Î€ğ^¸p{¸²T¼‹‹÷9{\èó\×ñB\í„\Èg˜b\â€m—=gÎœj¡Äµcm6\r¡Ú\êƒSsúı?ó‘µ\å§	\Ø\ÏLø°¾\ØÁ„{Àò~ğş²¾ØµüQsê!<<r¹LIaê¡´´vvöˆ½/Ø½BBA0”\Ò6DBAZñ¡bFi\ÅC\êŞ°û¥²²R7U§\0=Ê‰‚#F€M;¼ù\æ›øé§ŸªÿM5 ú\í>$$ä¹}\Õ\î¨+\à\Ó÷Ë—/Ç¼yó8qÁ\Õb\Ç\Újj{˜[YY=•¨95 úÿ{ö\ì©¼\à\àF}BeBø\ÌI]5\Úœ‘‘®¥\n\Ö-	ÁPJ\Û	iÅ‡„‚´\â!uo¤Q\à\ØL,¼üò\Ë\Õş7rBaÈ!|\ë\ç\î\ì3??¿:ôL(°‚HÕƒM-°i\r&ø~ù©	şºº¾½«\n›š£\æƒ\\U(¬\\¹’3\ÍgT3õ	Õš„\Új$´}oQFA\Û\Äõ¨?\n\Ò\n&M=H+R÷F\n5\n\ìÍ¦\0\æÏŸ\ÏM=pUö0\ç³M\Í(\Ôü\æ\Î\âQó¯N‘ ó‰?øiöÿBgjf6¤ ¨FA\ê¿\Íö„‚„ƒC®H\á­&øy}6Ï§\Ûy¡P__{À¿yÀ\Ú\ÔV£À_ :õP³F}\ÛgÂ¡®uø‚ÅšY¡kj¾™Q_í„¶nrz\ëA[¤õ°\nzT\Z’Á\Â:\nü\Û5ÒªB¡±o=¬^½š{kbÙ²e\Üzªo\"ğo4Ô¬/P}ë¡¡¢A^°)šk*¨ŠˆÉ“\'ƒ]\Ö|\ëùÀN>kR\×\Ôûw\Õu\êzC›7*­£ M\Úz\Ö	i”¦¤©{£\ï+3ŠÅŸŸ¢P}³AuÚ£¹k/ˆ1.Z™Q\êz\Ò\'	i’Š¥©{C{=!Õ¬³È¯\ÙÀ^±T\Íj°\Ï\Ø\Z5„0^h\Î\n\íõ 9¶a™„‚´\ÂLBAZñ\Ğoh÷H]ˆ’¸>\Ò\î‘\âò\×ù\ŞI(H+„4õ ­xHÉ›\á¯…¥…~ü\î\×Üºxùf/˜¸¸X)¹K¾Hˆ€¿\0V-]‹®º	\ê­£ (N\é\Z#¡ \İØgD€ˆ\ØÍƒ½~üöøøø>fò\ì	xz\Ø`n\ÅC:ˆ€*\r6`ÿŞƒØ¸j‹\à`H(TšI(H3.\ä`&Ïš€}ÿÀ°!Ã±aÕ—uB¹z\ã\n\ÆO\Z\Ø\Ø[°··\'xD€#——‡€€¶Øºi\':wœ\n	Á‘J\Ó 	iÅ…¦¤±¼IHLÀ«o¼ˆüü||ºøsülƒ®¬Xû	J…øú\ë¯¼–.0o½õ,Œ­1w\Æ\Z0	`•Q\nÒŠ	3J+bx³r\İg\Øøõzt\ê\Ğ¿\ïÚ«–Ï†\é3¦aÜ¸qjµ£‹õÀ¶mÛ°n\ízü¶S½{H$Ô¡¥\Ã×’PVğH(H+\Úö†,^¹©f`\Ö\Ôw\Õ\îşú\ÍkxaL(?\îİ»«İ\Z\è\È\ÈHô\ï\ß¿\îˆ@» ö\Z	¡•–a\nÒŠM=H+\Úòf\ïş¼·h6\ìñ\ã\Ö_\á\ã\å\Ó\ä®÷ˆÀ\ê\r+p\ìø1øø4\İN“ †¢HLLÄ€ş0k\Ê\\ªQ_H(h¯tŒ“PN,\È\Ã$0y\ÖD\ì;gŸ°•u,ªCg\ë®oş\ç¯8x\è \\\\\\\ÔiJ\×\ê0\Ì\ÌL4ÃŸy\ã_{C\ã#!¡ q\Ä\Òè€„‚4\â@^¾`1O‡KVc\è\àa‚BØ²uÙ‡ğˆpxyy	j›ŒI@rr2†‡ÇC1aü$­8HBA+˜\Åï„„‚ø1Põ€¦¤MyÓœ‚Eu|\Úúı·øş\çmø\é\çŸÀ6L¢C?	DGG\ã\å—^Æ¨—\Æaü(\ÍgxŠ$ôó~zhT$¤h*f”V<4\á\ÍğWŸÁ•k—1õ\í˜5Mı‚Eu}Šøów\Ì[2¬\nşù\çŸW·9]/q¿ıö÷–\Ëò…+ú\ÌsZõ–„‚Vq‹\×	ñ\Ø\×\Ö3	i\ÅCHoş\Ø÷¹‚Eü¸uO³\n\Õõ\ëBô¿˜»pF……ªÛœ®—(¶A\Õ\Î\ßsSW\İ:?¢u/I(h¹8’P–{q™ù%\å((­\àÎ¢2wW(PR®\äÎ²\n\ÊJ\î¬PTB¡TBY	TVV\âüÁ­\è1x<ŒŒŒ 3Œe2˜Á\ÔXÆf&Æ°0•q§¥‰1¬\Ìş;m\ÌM¸\Ó\Ö\Â–f\Æ\ÂŠ¬5›À”\ÙÁ\ŞFxv\Èp„Õ³\Âb³;ª\Ç@Aa,}E¥…[MvG¶5H ..S§Nƒ•¹5–.ø6\Ö6\Z\ì­n\Ó$DÁ®ıNI(¨Ï¼¤\\¬\Â2d”\"§¨9\Å\å\È)*C^QLd2\ØX™Á\Æ\ÒV–f\Üi\É\Ş\æ¦073¹©	\ÌLajjcv\Ê`,3‚LfÄ‰ş`¢A©d\"¢œ P ¼\\²rJ\Ë+PZV\â\Òr—”£¨¸Œ;ŠKQPT†\n¥öVfpd§¥)­L\álcgk3X˜’ˆP?\âMo‘W\ßx	ÿ,®j\Ô\n‹M\ï­q-w\îŞ†\Ï\Ö,Ç²\å\Ë0u\ê\Ô\Æ5¢«$C ,,ó\æ\Í\Çû3\çaôHq\Ö\"¡ ™\ÛB³P¨Ÿoai\Ò\ä%Hgg~2òKPZ®€³½\í¬\à`o[K\Ø\ÛXp§©‰ø\âò\nò\nJ¸37¿¹yEÈ‘!+¯\æ¦\Æpµµ€›­\Ü\ì,\àngks\Í\Şdj][‹MÁ›p/Ÿ­]†Â’B,_¾½zõjŠj£EgÎœ\á‚µ…5Ş›1¾-ı´\Ø{\í]‘P=\Úq€„ÂƒœYf )»Iy%H\Î-Fi¹nN6h\ábWG¸8Z\Ã\Î\ÚB;Á\Ñ@/ò\Âd\æ\"#§\0÷3ó‘]\0sS¼,\ámoo\'+.AGóh»`±©Ş²B\Ç5?\ÇÀ\'ŸÄ‡. šš\nRƒ\í\ØJ¼G\Æ\Ì\É\ïj½`±¾¡‘P\Ğ`\à¥d\ÚĞ…«¸›Yˆø\ì\"$dF€§«=<]\à\ábG;K)…K#¾\äÈ‹‘š)GJF.R2ò€JÀ\×\Ù\n~NVh\åb\Í\ÕF\Ğ\Ñ8\ì\Çûü–\Ğ\Ü\n‹-\×P\ä«6|µ›¾Ã¤É“ñ\î»sh‘&‘\ãÁºg‹\'}şùJlÚ¸“ŞšŠ)oO—€Wº q¡0mõ±©\æ\æ¦\ã\Ë+”Á\n…\Â\Ê\ØØ¸\È\ÔDv£´´|\ëúY\Â$GDO2D¡À¦b3\n—YˆÄ¬Bøº; ¥§|\Ü¸iC?\ØtEbZ.\î¥d#!->\Î\Öğw±F€«\rMS\ÔssL™={ü!jÁbs\î\İÜ¼\\|µuØª\'NÄ´i\Ó\à\ë\ë\Û“Ô¶	°~ızlŞ¼™[]ñ\íñ“¸7e¤xhL(LYul˜™©ñ·>n\æ\íı\İ\í<\\laanŠ’\Òr¤f\æ\ãZ\\š<1=·´¬\\ñÆ†\Ù4·\í•©‹\à“¡–9¸™–›\éH—£·3Zy;\Ã\Ï\Ó*5„\"D@\Ú]VVñ)Y¸›”…\ÛIYp³³D›\r‚\Üm)\ÓP:),6\ç®\Ê\É\ÍÁ¶]\ßbû\ßa\èĞ¡˜0qz÷\î\İ“Ô¶NŸ>-›·`ß¾}û\ê\ë÷\ÚptplDKñ.ÑˆP˜º\ê\Øh\Ù\×O÷	6o\å\åT\ç\è\î&gcÿ©¥Ê·\Âf\Ø)ı\ïYß…Â½\ì\"\\K•#&Ugøûº¢¾{Oÿ#Ş¼²\ßÍ¸„\Ä%f!\Ğ\Ã\í=\ì\Ğ\ÒÉªyFu¸µ”›‹U©T`\×\Ï;±û·`ee…ñ¯Ã˜1c¸Ÿ\é†@QQv\ìØ­\ßmûy\äó¯âµ—FC&¿(º1#\\(L]ıwG@yù¥A¹¹ß†6gúó¡h\0²Na³¿\Ò\Ğõôy\Ó\è£P`ß‚£“rq99\Æ&&j\ã† ?7˜˜\Ğ\\{\Óî’‡[UT(q3>7o§CQQN^ö\è\ì\í`P\Ù¾`‘\ÍÏ6W(´’´óÏ¹\Óøm\ï/`»\\1#_‰aÃ„İ›B’×S{÷\î\Å\îwcÏ=öt(ö\"\ë©{YÁ…Â»N\ni\ïóT× \ÆoNrñf2¢®%şõù”>ƒ4/ƒ7«OB¡¸\\÷rpñ^.ü¼œ\ĞÁ\ß-\Z¥4@\ê}9®Æ¥\">9][: [KGX\êñz\rºZ°\Ø\Ì0sÍ‹Š\nñÇ\ìÿk/·u\èğ\á><”\r2	ñº+•J0qˆğptl\ß	O?5\Ï	…••µ¡Å† Baú\'[ÊŒ”·&\ìm®\îh6\î>]ª¬”µ]÷}\ï©Û–®o˜€>¶\0Rd|\':ø»£s l­Õ¾\Õ\Z†EW\ÔK ¿°\Ñ1É¸\Z—Æ‰…\î~z·À_°8l\Èpli…E©Ü†÷\Óñ\×Ñƒ8zò0N9‰AƒcÈÁ8p Ú¶m+7Eó\ãÖ­[8r\ä8ˆC‡¢O¯¾x¢\ï“x\ê‰Ápm\á&š_Bv,¨P`µ	­½7{¼\Ú_\ïöş}]~\')k\n\Õ*\Şÿ\Ù\Òu¡pöN\Î\İ\ÍFÇ¶\è\ìÍ­€H‡¸ØŠ‘n$\áÊ­Tôl\å„G[;‹\ë\0½³Š^}SZ+,\n0,ÁL°L\Ãß§\ã\ÔÙ“8}ö$7Õ¯_?ô\í×—+„¬/©\ZŠ‰‰+H<y\â$Nœ86\ÚûÑ¾\èóh_<Ş»¿Ng\êb.¨P˜²úØ‚\î\í}?\Ö\ÙO\í\Ü\Ô?\Ññ\Ê\Èk‰‹6\Ì\Z°Tª7ˆ.û¥«B\áFª§ngÁ\Ç\Ã\İ;ø\ÂÆŠ2R»ŠJy5‰©¹\è\Ó\ÆÁjOÄª\Ûw\Æ\ï?ì“„ORw\ân\Âœ:‡¨\èóø÷b\äùrt	AH÷t\í\Ú]ºtŸŸø+6•c||<.]º„‹/\"*2\n‘QQ°³µ\Ã#]CÒ¹z„ôD+\ß\ÖM5¯3\íH(\èL¨šç¨®	…Ü¢2\ÍD‰x´K«F\Æ6µn.V˜|ö\Ò]XÈ€ş.pĞ¡•\r©`±¹q®¯ıı\Ìû¸|õ®\\¿Œ1\×p-\æ\Zò\årsgPpĞºukî´±g“#\Õ1\àÎ;\Ü‹›7n\âÆ\Üikg‡ö\í\Ø\ÛuB§]\ĞÂ¥…&JÒ¶ B¦$c\Î)]\n—sñw\ì}ô\ê\ì‡\Îm=¥•<«•@ô­œ‰\Ç\ã-\Ğ\ÅGš\Èğ?P°øİ¯ğñÖu\é\Öce\ÅŞAÜ8\ÜM¸\r¶EÂ½\ÜKL€¹…9¼½¼\á\é\éOO¸»»£…k8;;\Ã\É\É	°³³\ã{]\Ó\Â\Â\æ\æ\æ011±ñÿ^-T(¨¨¨@ii)JJJ¸W™\0\Ë\å\È\Í\ÍEvv6²²²p?\ã>\Ò\ÒÒ’’Š””d$%\'¡´¤-}|\á\Û\Ò¾>~h\å\Ûş­ı\Ğ&övöº„Zc¾\n*¨˜Qcqj¶a]\neJº‘b%ğxw\Ø\Ó\ê‰Í»Xòò‹ñwd,eÀ `W˜Iğ•U*X\ë\îø_¿\Ù9\ÙHMKAzF\Z22Ó¹åŒ³s³“—ƒ¼¼<\ÈóóÀ¶\Í.,,DqqJJKPVVÆ‰&\ØN¬lV&\Z˜x033ƒ…¹,-­`mm\Ím\Ëlgk{{{8\Ú;\Â\ÉÁ™[¶\Ú\Õ\Å\rn®\îğp÷„“c\İkıˆOH\Z*Ø\èõHi¶¦R\n)¹\Å\Ø-m[»¡GúV\'Í»H}¯\Î_½‡[w\Òñt{7x:Hc\ÙlÕ‚\ÅÏ–¬Ä°Á¡\êŒZH‚\0	ªÛ¶K\Â)=tBp¡@.Ió.‘²P`‹‡®§\ã©^h\ã£û•óÒ¼\Äó\êvbş:ƒA\í\ÜD/t¤‚Eñ\î\êYw	.\nZ\ÂYz7„T…·pRR†ôi\Çm\íL‡~`[^8u]½\í¹µ\Ä8{õ\\¾v™ÛO\ßWXƒ/õ©¿4\".\ÚJZ7…Bd|6ndbhÿ°±4“0òFp\Åe\Øwü*‚]­\Ñ\İO{ó\Â\\Á\âGs\à`\ç€¾û-©`QğØ’Aı& 1¡Àc£m¦¥qIM(°L\ÂÕ´„>Ñ‘O’\Æ-¢/\Ø\"MG¯ ƒ»V2ÿ+XÅ†U›µ2F\ê„\èU`SW«›5ÀH\ß \ê\Âx¤$b\Ò\ä8q;#\ìD(\é\Â\Í#°l¦=‡/£_\'º7~q&V„˜”’„ŞöiĞ£\n¯Ä°!T°\Ø 4º€\ÔA€„‚\Ü\ZR\nù¥\Øu.	nÎ¶BŸ†Y“@zV>\'^\ë\éW\ÛÆ­¶9e\Î;8td?¾ÿj7z„<Z\'T*X¤ûK€„‚°<%kM*Ba\çù{\è\ä\àVú±YŠd®İ¸›«7“0ºGÃ¯\Ã^»q£\Şz\ïÏš\ïv~ƒı¿®uC*XÔÀ“‹:G€„‚Î…¬iKA(œŒ½#<Ñ“vœkZõ¯\Õ\Ñs·`SY¾õ/‹;u\Î;\Üºß˜Œy‹\ç\Â\ÈH†e?­ò`Á\â/h\é\í«°hDD@$j…©«|#\Ù\"­û[©\\6{\àGZ\ïWO:[(¤\ËKğË…dŒ\r\r™©‰P¥a4—@Yy¶GD\á\Ån^p³³¨\ÕÜ¹¨³˜5o:N:\Ï}®PT\à\éÂ¤·¦\âùa/€\n›jO\ê\' ¶PhP*fl½\æµ[(„G§À\Ó\Û\Úz4o \ÔZ\ï\\¾•Š”¤\ï\\û¾\ã\'Æ“ıaôÈ±\Õc?yoN\Ë\íPPXˆÏ¨`Q\ï\î\ZtPN,4ê‰˜B!5¯{¯¦clhw‘Œ\ë.\í‘\ÖÁ\rö.ó|ô\ï\Ãø\ì‹\å8ø\Û\Ñwøø!\Ì|\Z\0#\\9{SwN @BA‚$„‹b\n…ƒ\×\Ó`\ß\Â	]ƒ¼„\n\Ù\ĞCo&#\ï~6·s`t/}£^‹ç†¨ş÷OW/EøŸ¿\ã\ãùË±ó§\í\èŞ­·\Ú\"D€h†\0	\Íp•œU±„‚²²k\Ä\âõ\á=`ia*9.\ä4—”\ã»ğó˜10\02£ÿ–Z‰øówl\İõ-ö\ìŒ\àşÿú\Íkøp\Ù<xº{\â\ãŸÀÁ\Ş‰I÷ğôO\â›\r\ÛÑ³W&¥1Jò‚\è&\nº7µ½K(\Äe\àBj>†?\ÑImŸ©ğ\îŞÁ\Çóÿ.û­\Ú\n\ßA3,†½Œn¶ğwµ\á¬00{\ê\\<9`¶ÿğ>\\:/X±¯¾ş@/¿ıñ6}³ö©õ•\Éf¸DM‰\0\0@BÁ@n±„\Âñ˜˜:\Ø!¤\ÆI_8ÿ^	\íW\İ\Ï\Ê\r\Ûú\Âk\Üÿ³\Ï~ÿe\'\æ-Y‹\Æmw\Ìª\ë>_‚EŸ¬ƒƒ£ú»Z²>7¬YŠUw4©½Àrs²0{òL™¹\0\İz<V\Í\âÌ©£˜2kAuM\á#„ª6¢®\'¢<Wş®øá—\Øÿ×ŸX·b#.‡\ä\ÔdN$´j_k·ó–¼–‡X¶ğ3¡\İ\"{DÀ\à	P0[@,¡ğcT\"B:·†»ƒFI³\İGL\Å\Ú-?pß”KJŠ±|\ál„ô\ìÃ‰1„R\nµB>5ıHL\ËETô¼âƒ¾C\Å+/¼†»·#ô™\çğŠ¨a\í2\îg\àö\İXÜ¾‡¸;\ìŒ\Å\å«Ñˆ\Øı\'üZ¶\Ò\è½FÆ‰€¡ ¡` K(|y\â6^\Ô¶Ö[¦·)\á¨)\nxª;±1\\FÁ\Æ\Æ_o\\‰¾U\Ó\ç\Ûÿ¸}\×ôÇˆÜ·o¾ıû‹V`Ãšex\î\Å\ÑÜ¿³o\é‹?˜\é\ï.|(}\Ï\ÚÌ˜ğ*n^»Œs?Â…\È¸~øşùŒFÄ¯»˜p\çoõª™U?Y6€‰ f³f–„Ï ¼2vBu¶Du<\ìß“\ã«3\nªş©2P\n\Ì&²jòhJl\Ôi“_XŠ_]„ñ\İ\Ãø\á\ç(.)\ÆÔ·§\Ã\Õ\Õı?Qp\'\ì416A›\ÖşhÓª\ê¬ú™ZR‡8]K\ZG€„B\ã8\éüUb	…\Õ\Å\à—ƒ±±Lc3\ï\ÎOK0Ğ®SW\îA\è\æ\î\É=¨7¬^Šô´\îA{ıò\Å\ê\Ìs˜Ÿz`?¯ş\äC\Ìú\àcœ8z\Ş>~Õ©|~`|šø‹£¹,³\Û¡Àşª~²=/6ø©Œœ\ìLN|ôIXƒ\ã\á\íµ|`\Z¢\æ¸ù©™o6®\â†\Ä\Ø\Ô\Ì\Ôh,ˆ\ÜBJJ|´òü²n*,\Ì-PZV\n/\ïjA\à\ÏDA• pj\ÂT&}\'\ÛD@Ÿ	HA(°\Õ\Ï\08¨Ï \Å›XB\áóƒ71ıµ¾\Z~cj	jNğ\ß\èßœ<›\r|¶@5;Ñ±\Ë#\Ô(0a«?FP»Î˜>w\ÑCµ5ı¨-£Ñ˜Œ‚j]{˜ûø¶\æ„G}öøñ-_ı\Õ\Ù~<l|\ìPµ]›½\É3\çcş¬·«3ª\íù\ZMsô¸7aS’‚w§¿Ç‰s3\Íe¢49²Mô‰€„\Ûÿõ\'\0C\0\×\'¸R\Z‹XBAJ\ÕbF^(Œz}\ÒC\Å~üÃ¹¦Ph\è¡YSŒ4U(¨úY—P`Y¨s§ª§ø¾ş\ï½\ÅX2oz­zv?ª{²ÿjß‰«\ë\È\É\Ê\â¦fx¡pòØ¡n_\Õ)M\İ\×,£ğ\É\Æ\İØ³v2¬,­Ğ¿\Ï\0<^u\Ú\Ú\ĞN£š\âNv‰@C¤ ˜/øºJ,°\ìK(ˆY£À¦øé‚ºj\Ô\É(0q‘•™»·oqS5ß„P\'£À\0;T\ß<`ÿ_³¨P\èŒB]o~ğı2¡ğ\Ùâ¹µ\Ö_|K>d¯Q8¹}\Z0FFFøûô1ü}\êz†ô\Â\ã}ús\â!0 XÓ®}\"@THE(0—\Æ\0XY%.R”„% –Pû­¾¡\æXµ˜°15\n¬&\à\ç\ï¿\ã¦XC\Í\×Y´jUÖ¬Q\à\ß\Êptr\á²İº?\Öd¡P_Ÿm`¾\ÖU£À®ÿe\çCÅ–ª5\n|ñ#«…\Ğô\ÔÿÖƒ\ì\Şiùû6¯ı–û%(//\ç\Ä\r\ÇOƒ±Ì˜\r÷ş/\ã`ll,\ì/Y#D\àR\nÌ±·\0,¬\×)V\ÂK(ˆ¹{\ë€ÿ\Æ^ŸPh\è­–\Îÿ\â³E|\ËVı¦¯\Z%Õ·\n>X¼ò\ìk³v\ÅG\Ü}úBQaA“…\Ëf¨®Q\ß[\ì\rŠ\'‡„V¿\ÉÁ¿•ÁO;°\×I\ë{\ëA\ÓŒ!¿B/?;t\ìŒS‡\ÎÁ\Õ\Åõ¡_¶B#Ÿiø÷Ò¿Õ™&|¼[\n÷KC–ˆ\0\àHM(0Ÿ¦˜Q%nSœ„! –P •…‰Ÿ!XQ]™ñ\İg¢­\Ş7±Ş¡\ç\æ\årÙ†Áô\É\0\0 \0IDAT°-k¹%œ—~ø©! ¢1­¢P`\0f_%’µJDO;K(\Ğ^zzC	<¬š{=œ:sŸ®Y½?h°§µ›Vsb\áû¯w\Ã\ÒÒªÁ\ë\é\"@\Ô# U¡ÀF1\0\Û2½\r‘©Ş°\è\êš\Ä\n\Ì\Ú=’\îÇ†Ô¶{ä€¡½±\æ\Ó0t\éØµ\Î\æ\ßlß‚\İ{~\àDB‹Z¦)\Z\ê—>\'D aR\n\Ìû%\0  \á\á\ĞuS(¤\æc\ï\ÕtŒ\r\íN\"µ\Ø‰a\Ü\àaÿ¿}8\ÖlX	y¾‹\Şg>vÿºk¿\\Ã‰„V¾­‰, \Z\" u¡À†\Ívy	©\Ê,”kˆƒŞ›S(0¸\á\Ñ)ğôvE§¶zÏš¨Ë·R‘’”\á=hx\'ş6^ó.œ¼òÁ}ÿÀû‹\æ`×·?£c;Ú™T=\ât5P€Ö„\Âô•GQ\Êğ«L‰\Ö\Íy\â_õ\Ü\Ä\0\ÚxF\Ívty±…Bº¼¿\\H\Æ\Ø\Ğ˜™šP\\ˆ\0G ¬¼\Û#¢ğb7/¸\ÙY<DeÔ›/c\ÔÈ±xfĞ°\ê\Ï\Ø+’¯O\Z\rw7lß¼mØŸ:ˆ\0\Ğ­	…ikEUVâ†‘‚\×\ÏÀ2\ê_`\ïJ±º:\Ô$ ¶P`îŒ½#<Ñ“ş°«>½½ü\è¹[°©¬@ß€µñ§=?\à\Èß‡±y\í7\Ü\çQ#1ê­‘Ø°òK$§&a\ÃW\ë¹Ïºvê¦·Œh`D@lZ\nSW\ß(6ë‰‰SW\İ\È6«ı\ï=\ÕN\æ;\0\ìkÇ«bƒÓµş¥ ³\ç\ï¡C7‚[¹\é\ZBòW`7\î¦\ã\ê\Í$Œ\îQ÷\Ú¥¥%\è\Ø+§E\"+;“	\Îı\Ï\rû\ïû\Â/\á?aÑ²ùœX\èÓ«ŸÀ’9\"@…©kş\0¥rB\Ø\ìÿe¦®:™lK\Ø\Ì\Çÿ\Û\×W½c\ËXV½>©^K¾Z*B!#¿»\Î%`Ä“\à\æL\ë÷\ê-™•=‡/ãµ¾pµ­\ã§wÌ„›«;ş\Ø·Ç¿ƒ\Ñ#\Ç>€\íÀ\á?1qÆ›œXò$\ÍN\Z\ê=E\ã\Ö\n…ÿ\êŒ¢d\Ê\ÊÕº„ºş]a\î\à5\Úô¥R\n,1irœ¸Í‰+\Ú\Ğ\ĞnÌ‚¢RN$ôk\ã„@w»‡¿ÿ¯?1óı©ø¿)³ñ\ÎSj½­»À\Ä\Â\âù\Ëğ\âğ—´I\"\Ğx\Z\n\\]*·„\Í|\â¡\ÌÁ\Ô5G\'ÁhB\ë¸l€¸ªU?b½RJB…\àÂ½\\M+@\èainj Q1¼a—–#\â\ètp·A·–p?ó>Z¸\Ô^\ÇÀ¹tù\'&½5\r\ãG½\Ñh\Ût! õĞ˜PP­K¨Ë…f\Ö+°§\Ë~ö\Ì0—]?©	\æmd|6ndbhÿ°±4£\ê9‚\â2\ì;~Á®\Ö\è\îç¤‘\Ñ\ÆİÅ„o\à…Ğ—0e\ÂtôAF‰€¡ĞˆP¨­.¡N±Ğ¼z\0l×£U›IZü\Z=^)\n>³p1)Cú´ƒ‹£u£\ÇC\êÌœB8u]½\í\Õ\Ê$4e”©é©˜8\ã\rô\î\Ù\ï\Íd¼\ÒAˆ@s.Ô­?P÷úZ\ë\\%~°¬90ô¹­T…c~#UC\×\ÓñT¯@´ña\á¤CŸ\ÜN\Ì\Â_gb0¨‚=\Z®Ib\ìùùœXh\Ó*\0/X.„I²A–€\àBa\êšcQ¨£.¡Î¬Âš£\0£	aM[_™õªš†\Ø`•ÁF³KY(0·Sr‹±ÿZ:Ú¶vC´U°¾\Ü\Ã\ç¯\ŞÃ­;\éxº½<ş·<³6\ÆWYY\É\Õ,X[[c\Í\'\ëµ\Ñ%õAô’€ B¡1u	uŠ…æ­¯ÀÌ²\Å\Ş\Ù4\Ä:\0az­fJ\êB\r­¬B‰C72P¬\ï\î{[\í>Xš—š\Ö —_Œ¿#\ã`)»\Â\ÌD&\Z£™LGaa>¾\\û\rdF\âù!\Z\0\ê˜4“€`B«K€²9Yü—hòú\nEp•XX\n\à«f²Ñ«\æº x\à—sñw\ì}ô\ê\ì‡\Îm\\ÿ_¯‚¢§ƒ‰¾•‚3\Ññx< ºø8Hb”.‡\Ûwc±ù‹o`k«\éIœœ D(L_{ô¥\â\áõ\Ôõ¯º^Á¸2d\İµ÷ƒ\à»c{Ò²\Ì\Â\0;\ÔõA_¯\×%¡Àb[T†ã±™(Qviú\ã.õ{35S³—\î\ÂBôpƒ•´\Şdùl\Írœ>w’\î$@¥~?‘\Ò! ˆPhJ]B]\Øú\nÍ¬W`¦­\0ü$\Ü\ây¢kB\'\Å\nO\İÎ‚‡ºwğ¥šÄ»…\ê\ì™- y5‰©¹\è\Ó\ÆYk‹MA±\á«uø5ügnG\ÚLª)©!h¶Pø¯.Mİ»¡V\æ\Ù|¼J,¼\Âv96\ÄàªYW…?†³w²p\în6:¶õ@·`oZ¤I74[<\éÂ$\\¹•Š­œğhk\İxceÛ®o±ñ«õ\\\Ím&%‰\\<f	!\ê\ê\Î,4»^™\\%†\08(ùhh\ĞA]\nMI¹‘ñ9Üªü\İ\Ñ9\Ğ¶Ö´´o›ZM\ç–\":&W\ãÒ¸5ºû9\Â\Â\ÔX\Ûn4«?\ÚLªYø¨±h²Pª.¡.\Ş\Õ+0ó¡U\ÓL,7°øVW„?˜\âr\'.\ŞË…Ÿ—:ø{À£\Õ0hú\ŞN½/\ÇÕ¸T\Ä\'g£kKN$X\ê˜@PeD›Iiú!ûúB \ÉBAÈº„º³\n‚\Ô+0ól—ögô%x\êŒCŸ„?\î\ÊJ :)—“ó`lb‚ 6nòsƒ‰ˆ¯\â©]¸¶¢B‰›ñ\é¸y;ŠŠ\ntò²Ggo\é‚÷\rûH›I5Ìˆ® M\n\Õ4Š¾€}°²J,\\lT\çzt‘>\n\Õğ\Ü\Ë.ÂµT9bR\åğ÷q†¿¯+Zyif?=º-\ê\Ê\İ\äl\Ä%d .1vh\ïa‡–NVz9t\ÚLJ/\ÃJƒ€\ÚBA€]\Õv¿¾](\Õ4öVÕ,³p]Í¶:}¹¾>8\å\n%n¦\å\ãfz\Ò\å\Åh\ã\íŒV\Ş\ÎğótÖ›oÁš¸Yv&>%w“²p;)nv–r³A»-Lõ‘\"\ÚLJw\Ù\Ô\ê…U\Ç>’UVş±nN“\×9P›W¯`dôl\Ø\ì©\İø\áS«¶¦f…w°§&E(¨£°´±ˆ\Ë,DbV!|\İ\Ğ\Ò\Ó	>\îp U‘›_ŒÄ´\\\ÜK\ÉFBZ.|œ­\á\ïb\0WX››\è\Ä}-¤“´™”4g+;\'©i)H\ÏHCFf:233‘›…œ¼\ä\å\åAŸ‡‚\Â¢¸¸%¥%(++CEE\nŒŒŒÀ–\ê666†‰‰	\Ì\Ì\Ì`anKK+n\énk\Ø\Ù\Ú\Ã\Ş\Şöprp†‹‹\\]\Ü\à\æ\êÎ­§\á\äH™Ç†¢¥¶PhÈ |>Àøªiˆdñ¹Yn\Z¢PP\Æ2\rw3Ÿ]„„¬\"Àğtµ‡§«·˜“£ş/#/[)%#)y@%\à\ël?\'+´r±6ˆ\ÌAC¿D´™TC„\Ôÿ<O‡\Ø\Û1ˆ»‡»	·‘„{	¸—˜\0ssx{y\Ã\Ó\ÓpwwG\×pvv†““`ggXYYÁ\Â\Â\æ\æ\æœ(`\â€?˜h`â¡´´%%%(**BAA\är9rss‘¬¬,\ÜÏ¸´´4¤¤¤\"%%I\ÉI(-)EK_ø¶ô…¯Zù¶k´	„½½ú\Ö\Ã†*X(\Ùş³#ª\ÄB¦\Æö!ºP¨ßœ¢2$e!)¯É¹\Å(-W\Â\Í\É-\\l\á\êh\Ãmymgm¡³·…¼°lkçŒœ\Ü\Ï\ÌGzv\ÌMeğr°„·½¼¬\à(±•¥û›I\Ù`\Í\'l\ë:\ZK\à~\æ}\\¾z	W®_Æ˜k¸s\rùr9‚ƒƒ¹3(8hİº5w2 öÁÅ;w¸3667o\ÜÄ7¸\Ó\Ö\Î\í\Û#8°=:¶\ë„Nº …K±]\Özÿ†,\ì%\0¨Z§¯\ÅI(\Ô›MS¤\ÉK\Î\Îü2dä— ´\\g{+8\ÚYÁÁŞŠ›®°·±\àNSñ\×\r(¯P ¯ „;\Ù4Bn^r\äE\È\Ê+‚¹©1\\m-\àfk7;¸\ÛY\ätBs~\ÅøÍ¤6¯ı–Kq\Óñ0»	wp>\ê¢¢\Ï\ãß‹Q\ç\Ë\Ñ=$!\İCĞµkWt\é\Ò~~~:‹.>>—.]\ÂÅ‹…È¨(\Ø\Ù\Úá‘®!\é\Ü=Bz¢•/ÛP¿C\n,ºŸ©\åú\Zn\n\êG–-ğ”UX†¬‚R\ä•#§¸,‘WT™6Vf°±4‡•¥wZZ˜r+Fš›™À\Ü\Ôf¦\Æ055†	›?5–ÁXf™\Ìè‡ûöªTVB¡¬D…B‰\n…\å\å\n”•+PZ^Ò²\n°‹K\ÊQT\\ÆÅ¥((*C…R	{+3.3\àhi\nG+S8Û˜\Ã\Ù\ÚL\ç@R?:\ÚiQ½™\Ô\Úoakc«N%\ÜKQQ!ş>}§Î\Ä\é³\'¹\á~ıú¡o¿¾\èİ»7%\ì½0®\Å\Ä\Ä\àô\é\Ó8y\â$Nœ8V\ÜûÑ¾\èóh_<Ş»?¬¬¬…\éHBVH(üŒ/\0´ğŒ„b#¨+$Å‰\â2òK\ÊQPZÁEe\n\î,®P ¤\\Ée\n°\ÚvV(˜PBY	®øŠ?\Ø7U™`,“Á\ÄØˆ«`§™‰1,Le\Üiib+³ÿNs\î´e¢\ÄLü¬†°T¥i\Í\Ğ7“Ê¸Ÿ¿\ÄÑ“‡q\ê\ÌI\Z4C†\ÆÀÑ¶-û³i\ØÇ­[·p\ä\È8p‡DŸ^}ñD\ß\'ñ\Ôƒ\á\Ú\ÂM/\àPø_¿\àZU· ÁU	é„”Uq/\\:K,çª²\é>\r[\Ö\á\×\Ã\ÙLŠeş8ı\íÅ•k—:|8†Å°a\Ã “\éÿ\ë²M½#•J%ö\îİ‹ğğD„‡£cûNxú©axvH¨Ng\ZH(<xG|€U°½\Ú\ÔEª\íH(H\'2_l\\…ˆ?G\è3\Ï\áÿ&³p\è\ĞüfRl\ç\É.º\é‚\ËjûøÏ¹\Óøm\ï/Ø»?#FŒÀ\ÈWFrâ€¦`¢a÷»±g\Ï{:\Ï{õ\ì\İ4c\"¶\"¡ğ0ü]\0Êª^Ÿ14\ÂvMBAXMµÆ²	=t\Åú\Ï7aÚ»“p\î\ØE\Ê*4¦\íôq3)¥R]?\ï\Ä\î\ß~\à^Aÿú8Œ3†û™a°\×5w\ìØ­\ßm\ã^\İùü«x\í¥Ñ\Étcú\n¬…½4@Œ\nš«%úÀ(\0¬¼óc\0L±%‘g˜Su\Í\0k\0\ì\0pº	xU\í7¡¹ M\ØX2\0¼#¨U‘P¾J\×,›Àöñpó@Zz*\Ü\İ<(« \Ğ4\Ú}\ÙL*\'7,K²ı‡\ï0t\èPL˜8+H¤C³X!\ä–\Í[°o\ß>Œ}õuŒ{\í\r8:8j¶\ÓfZoªPP\íVUL4\Ç)	6}\0\âªVqlÎ¸$Ñ–„‚øa\à³	\á?ş‰\ÏöÃ‘?N`ø+\ÏPVAüĞ¨\í.o&•›—‹¯¶n\Â\Ö]\ßb\âÄ‰˜6m\Z|}}\Õf@\ršG !!\ë×¯\Ç\æÍ›1şµ7ğöøIp°whQ\rµn¬PˆpªÊ‡…\06Q¸P•]˜X\Õf4\0–•`;«~0€K\rû|Ö‚\ïssUö¢€ª0a\Ë\éñY¾OFš\Ù\ì\Ó\Ä\Ì\ÚÀ\0Q\0\Ş\Ó­™%¡ 5\Ôuv\Äg>[¼¾\í=p-\ï/šCYñC\Ó$\ØfRf¼‰\ÉoO\ãş\Ğ\ëÂ±\á«u\Øôu&MŒwß\Ã-gL‡¸Ø²ÕŸ¾›6nÄ¤·¦b\Ê\Û,±/­£±BAİ©¶\Â?M\á`€ù\0‚ªôL,dUıÌˆ0a šQP\n¹W%\ØR\Ëìº†„¤YI:L1¤³	qCWXX€º‚eü[€‰V\Èw\'–\Ë*œ?v\Öô„¸AjBï±·oa\âŒ7ñB\èK˜2Az\àù!±\â\Ù5?\ÇÀ\'ŸÄ‡.€OFKM4I 11¼G\Æ\Ì\É\ïr\Å\ÎR9´!\ê«ª8¨ùs_•,Bm5L¼Ô–Q8©’½‚3:L,ü^%x„°©u$´ü\Úó.Dÿ‹O³\Î<XV¡[\çGğò½{\ÙF\\\èZ\ê]Ê›I%Ü‹\Çgk—¡°¤Ë—/C¯^½´D…ºi*3g\Î`Ş¼ù°¶°\Æ{3\æÃ·¥ø+[jJ(°bFöÍŸ-‘\Ì~\Z€°óS\ì3öM½fFAuz‚\ç}°*\ë0Y¥À²6¡\Ğ\Ôb\Êú\â\êU%¶X\Õ\Ô@\Ìv$Ä¤O}\ë;)n&µs÷6|ºf9\'¦Ne›\æÒ¡K\Â\Â\Â0\Ş|¼7sF\'ª\ë¼P`ßš\Ã\0°mœù·ø‡0ÿ\r½©o=¨\ÚfK%«f\n\ê\Ë(ğS5©N=0\Û,³À„_£ 	¡À|`ş°\Ì{;„±Ò©ƒ„‚´\Â\ÅO=H\Ë+ò¦9ş\ÛL\ê\rX[ÛŠº™+š]°ô}•\",l=üıı›3,j+\"¸¸8L:\rV\æ\ÖXº\àS\Ñ^¥\æ…/\nT\ç÷YºCUa \ê¶\ÑÒª‡¸j\Â¡À^\Òey–}¨¯Fõ\Í\ÄûVÏ¿\Éÿ\ÌV=a,c¡i¡Àn—v\0öX\n\à+\ïµ»&¡ 626\à‹5\Ú	…À›I€-Ì¤\íÍ¤\Øô\ÖÜ…³0z\Ì(,\\¨\ÓeU¢\ÄNª.Y²;w|KVsÓ”\Ú>T\\ª9-À¿‘Àg˜p`\åÆ¼õp³J®\Z?õÀg\0Ø¿³©„M\0®\0üCŸŸŠ\àûc&øiV\0©j\ãs\0vUk7hC(0_ºVe\Øú,{¡	i…‰„‚´\â!´7bl&\Å\n\ç-™‹mÛ¶\áù\çŸzHdOd¿ıöÆ‡\åWh½Ğ‘VflZğ­\0ü\Ô4\ÚmEBA»¼ê¦\Z\"¤ûŸWo&µö[n-M[¿ÿ\ßÿ¼\r?ıü:w\î¬É®È¶ˆ¢££ñòK/c\ÔK\ã0~”ö^\É%¡\Ğô ÷¯lÍ†ğ¦›\ÑNK\n\Âqº‰=?c\á{K`aÁ¶i\ÜÁV\Â[¸lfNƒÖ­\Ú4\ØH\İ\ë4Hh\0·™\Ô?c\Ë\ßÂ¿M€Fúß²uÙ‡ğˆpxy±YY:ô™@rr2†‡ÇC1aü$­•„Bó0³)V\à\Èj/\Øôˆd\n\â‡F\İ¿º×‹?Bò 6š\ÜLŠ­®ş\ç¯8x\è -d@·[¤iğ Áş\ÌZYì‹„Bóo®Ğª\é&7ßœf,Ph\×;woc\ÑòùX<o\ÙC\ßú\×}\É\ëÙ‡\Ë(\Ìı¿yXñ\Årne\ÅU\ëWpŸıº3!]»£¤¤K>[ˆ\ïÚ\àÀöØ¸j3¸Œ\Âä·¦aî‡³ğ\æ\Ø	xn\Ø¨f(˜\r¾İ¨—Ç€½v\Çg Xÿ|?k?\ÛP\İvİ¦\ÕX»b\ã\ë\Å3‘1c\îdLŸ4‹ó‡q	hb3©½\"°z\Ã\n;~ŒP7¼¢ô\Îh\Z\Ğ\0fM™‹aC\ØcHs	aØ¾`KUf\á¬0&…µBB¡~üC˜=œU§˜p˜<{\"n\Ä\\«üƒ]U(Lg&~ß»\çÿ=Ëµgñ?_½q…\ìše+—pBaÈˆP}\ØóS5\Û-øøNd\\¾{I	œš™^ü}úxµM~´uKØ»‹¬5†€›I]¿y\r/Œ	\Åñ\ã\ÇÑ½;	Á\Æğ\×\Çk\"##Ñ¿üº#\í‚\Úklˆ$„C\Ëv\Ód\Ë\î±\Ì\ÂE\á\Ì\nc‰„B\í\ëû\æ­ú\àW­E¨)z<òÿ\í	xE\Öş\ß\ìû\Ù!‰l¢ˆ\"²9ò…\ÑqE@tE>EAÁADD>—AAE`@-$@BB6ÈÜ›\í&ÿ§Z:ÿKIn\Ò}o÷\í·§cnÕ©s~§/ı¦ªºj\ÈFÄ¼q\ç\Ø8\é÷r‘ğ—\n²ğ\íY‚\Í\Û65Œ&\Èöd¡aÙ¥|nn¤D™;ŒVZC@©Ã¤n83g=\"­‚g16ñ–Ë²¥\ËñÅºÍª PP\í\Ô¯\n±pTY\Ó\í³F¡ ŞˆB[„BSS-	…\Æ\Â\ÃZ€ˆi(´\ï;b¯\ÖòaR\ßÿˆtÄ°­å•¥/¢\ÒRw\Şy\ÇÖ¦¬\ï¤¦N\no7?<1\ë)U\"¤PP«\Ø+Uœ#Ä‚\ØtJ…B¡uih\Ë\Z…¦„B\ã)±`\á3‹±d\Å+Òš1B Š˜J\Ó¹y9MNYXO=ˆ\é	±Ayıø™kZ—[-\Õj8Ljüm6(¦±¦LŸˆ\Ô\Ô\n\n\ÒRHôÅJJJ˜\ØkV­CR¯\Ë÷„BAq¤’Á\Ù\0¦\\b·K‡\n\åRĞš©1Ua½øP,r\ì\Ö%¡\áõ\È\Â\âBüe\â\ïf?òDƒPÿo\ËbFå¢¢%{“šy†&\í\çßšò\Ğ\ìi¸q\Ü<üğÃ­©\Î:\"ğ\æ›ob\Ë\æmX¹D,—S¶P((\Ë\ÓÚšø\æ‹	j1²p^½nZg™B¡uœ\ìU‹.Ù‹´¶û±\å0©‡öcö\ÜYHKK\ÕvPô\Îa±ä…¥\è\ßGlt¬\\¡PPeS–\Ä\é™\â\Ü!\Ê\Õ\íªy\ë\n¤ÿÇ¾¹…³¶ò\áHo\äÃ¤üığú‹\âÌ¹¦\ËS\æ`À\à~˜=[X²À	,Y²û÷üŠ\ç‹\Ó\r”+\nÊ±¼”¥—ˆS3…X¨Q¿»¦{ Ppù¦û¥P\ĞV>´\àMs‡IY,ô¾2\èØ±£Ü¥\Z$p\î\Ü9\Ä\Å\Å\á\È/©pssS\ÌC\n\ÅP6k\è\ï\0ºø“}ºûc/\n\"\ßt¿œz\ĞV>´\â\Í\ï‡I¥I\'Oø4¸õõ¶\ã“/\×\áë¯·k\ÅU›ı0›\Íxô\ÑG1l\Ø0\Ü}·8Œ˜E\r£FÆˆQ×V\Ì<…‚b([4ô€ğ\ëZ¬¬t\n¥‰\Ò	¨C\à÷Ã¤vIbA>Lj\ÑkĞ¥{|òIu:’’‚;\î¸C†Áo¼q 0 ?\àw\ïŞO?ı=zôhµ}ôv\î\Ü\Ù`¯  \0\Ï<ó-Z„°0qğ\ïı>÷\ÜsX±bE\Ã\ïZ\ê@öU’d]\Äq\Ì\Ï>ûlKÍ›üüù\çŸG×®]u/b^z\é%œ>‘gŸ\ß&M5¢PPe«½@œ\"tW«j+X‰BAA˜4E*‡Imø¿Ï°z\é{Hèšˆ	So\Ãs\çc\äÈ‘ªõ,¾3g\ÎDHH,X\Ğ \Ä\ï\çÏŸ¢¢\",[¶¬]B¡)\ç\Û*„¯¶ú\Ó<g\n\ß|ó\r›·\0\ë\ßùL±{…BA1”­6ô1€J\0÷¶º…)€¨ 	N=(\ÓIM‰ŸVıc¹$š}?~úù\'t\î\ÜYµh\åö\àÁƒ\Şğ—µ\È\Ï\ÏÇ={¤¿üÅˆ‚õ_ôcÆŒ¨#üøã¸\æšk¤\ã®G\Ò\ÒRiDA1õ°zõj\é\ç]»va\èĞ¡QÛ‹:<ğÀE£rğ²¨¹”Ph\Î?\á\ëÄ‰%S\ÂG1J²oß¾†ß­[·ñññøğ\ÃúmN:…\Ç\\Š¡¸¸Xj\'b0`@“q	ûB|Ì›7O\ê«=£¶$ıÌ™3¸úª«ñ\Ó\×ûli\Öl]\n\ÅP\Údh€|\0\ÚÔª•)\ÚO…¦\\Ì¨T\'4)&UYU…òò2xyy©¥,\î¼óNlÙ²¥\á\á.FÆ/M\r¡Ğ¡CIDLš4Iú¯xŠ£…)1}!\Ş\é— \Âañ\Ùk¯‰\î!M\r1 ö‚[Q\ä©q*¢<R D‘x(‹£³O\'4\'\Äô†ğK´B\ÄÚ¿ıû÷Kÿ/ñ³\ì“õˆ‚ğ¯9¡`í“µ\r\ë¸D,²\rÑ‡\àø×¿şÕ¦™¶$»ªª\nAH=Ş–\æM¶¡PP¥Í†¾&6Ù³¹e\ZP(´šŠM(T„\ëd¦\åÃ¤\Äk”jY(ˆiñPoQ\Ş}÷]\é\á=gÎœ†\ßY¯)°~h[?\Å\Zù+\Ú\â!)?¼\åuBl\á!\ÛÛºu\ëEk\Z\Z?°\åø›Z£ >4\ÍMm\È#\Â/[„‚¼ ³±(±Køj-6\Ô\Ì]c\Û...\È8’£X—\nŠ¡´Ù€­\0\Äø\Ğ\ßlnmc\n©\\S*v2ó‰ı\ãQZZb—1r°r\åJŒ1\é\é\éÒûC=„3fHt!¬ÿ*Kù31„o½x±±PØ¶m\ÛE™\Ãü¼H(\È\Ór\Å\ÆS\â÷Í(XO]\È6\ä)y”BşŸ\ËS¶!p\Äh…,šŠKŒjXOsˆX\íñ¶Gœ\ì\ËÀÿ‚Xø\î\ÂaRªEH¡ \ZZ\Z&\Õ	\\=j \İ\Ö(¡püøqlÜ¸QZ_ Š={öl\"Ø¶Œ(ˆù}yƒ50\ë¿øÅˆ‚&-½¹Ğ’P¸\Ô_ò\ß\Âhíˆ‚<½ ¯Q°\n²Hj\îm\ë‘!0\Ô,\\£ &]\Ç\Ù\î\0`€/,R\Ë\r\nµ\È\Ò.	¨OÀ^o=X¯k\r\"##¥¿ŠE‘ˆÍ­Q0™L\r\ëš[£ Oˆµ\ÖS\ÖkÄƒ\×z}üºfK#\n§„ÿB8ˆÿZOmÈ¾ŠwSSò\Z\n9^Q¯±P¾X¯Q°K¶…P°\×\Z¾õ ş÷\ÑQ=\Ä\\YX`‰\ZNP(¨Aµ\í69õ\ĞvvFli¯}d¡\à\ë\ë{\ÑBB\ë\é…Ö¾õ ò$†ø\Ó\ÒÒ¤\×-E±~\ëAŠo¼†Àzê ©i‡–„‚ü¹:bŸy\ÚAøm=UŞ•\Ù\0\0 \0IDATU lOŸ>½a\á\æ†\r¤7d¿\ä7D=q•——7)\ä\Ñy:Cn©ß«}ÿrµ	;\Ö~\×bAlö¾BiW(”&\Ú>{\\\Ì\Ø>~Fk\í;3\Z-gŠ—;3:Š¼ıú½\ì‚X\ï\ìüC\Én)”¤\Ù~[\n\ígh$<\ëÁH\Ùn{¬<\ë¡\í\ìôÖ²ÿ±ğ¸x»F)\ç)”\"©ŒN=(\Ã\ÑHVxz¤‘²İ¶XyzdÛ¸\éµÕba\Z€*…‚iƒG\àÀ¡ı˜=w\Ò\ÒR\ç{\Ö4„„D,ya)ú÷ ¨Ÿ\ÜGAQœŠ\Z~A,\Ü`S{-S(´— Û“€\ã	<4{\Zn7F\ÚÕ…¬	ˆ7H¶lŞ†•K\ŞV…‚\âH58\æ‚X\à\âJl\ì†BÁF`*W\çÔƒÊ€\Ôü\ác¿a\Êô‰HM=   \'’a\ÙJ ¤¤‰‰İ±f\Õ:$õº\Ü\Ö\æ-Ö§Ph‘\Ã+$_˜~baG[½¡Ph+9u\Úq1£:\\`õ•¥/¢\ÒRw\Şy\Ç\á2\ÆV˜:u*¼\İüğÄ¬§ZQ\Ûö*\n¶3sD1ı Æ“„X\Ø\İ(\ÚBM½6\n\ê±5‚\å›\'\Ã\ÌY\à{\î1B¸Œ±|ğ–-]/\ÖmV…‚jh7<	€8~Mˆ…¶Z§P°•˜ºõ9õ ._g·~ôøüeR2v\ìØAƒ9{¸Œ\ïö\îİ‹\áÃ‡\ã_n\Âe={«Æ‰BA5´ª*Nip#€£¶ô@¡`-\Ö%\íØ¼u^óüg\ÇĞ©S\'\í;L%™™‰\ë‡_\Ç~\ãÆŠjõ\n…‚zlÕ²<À\Ì#§Z\Û	…BkI±	\è‡Àšõ\ïa\ã¿ÿ…mÛ·Ig&°ƒ€8c\Ì\è1ÿ§¿`Ê„ûTšBAuÄªt0À”b\álkz Ph\r%û\Õ\áÔƒıX;{Oo¯Y…­\ß~…›6\"&F\Ã\â\ÌÎ=‹ñ\É\ã1ö†›0m\Êt»„J¡`Ìªtò€?_˜†8\ßR\n-²\ï\ç\\\Ìh_\Ş\Î\ŞÛš\Ş\ÃGŸ}€~öO\é$\ç$ ¹ºı¶\Ûq÷m÷`\Ê\İ\ê$\È)ô}?-0\â\Â\ÈBys¡P(h+\Ñ\n\ÚÊ‡3x³\é\ß_\â\é…O@¬‚¿ùæ›!$\Æ`E\à‹/¾\ŞrY<\ï$ÿIüh¿B¡`?\Öjõô2€\ÄBÍ¥:¡PP\Û\ìr\ê¡m\ÜØªyûşO\Ì{\'İyó\æ—“X¸p!\Ö}ø^Yø:ô½\Â\îQQ(\Ø¹*.\0\à&\nUø\Ò(	\è†@yE9\æ¾ğ$LUX±b9\Ä?\r,z$––†3¯—^˜ûüıü…‚C°«\Ò\é[\0\Â\ÜÒ”u(¨ÂœFI@³\Ö}ú^~c1-^„3\Ä\ËR,z\"°b\Å\n<ıô3xòÑ§1ñ\Çn¬E¡ §;§e_\ß\à\r\à®\ÆU)Z†g\Ï\Zœz°\'m\ãö•q&//]„Š\Ê\n,^¼W]u•qa\è$òŸşY~\Ş~øÛ¬g\×9\Ş\áS(8<Š;ğ1€J\0÷Z[¦PPœs»r1c»ğ±±\ÄB\Ç7V¾ŠFÄ³\Ï\Î\åM6ò³Gu±\ÒóÏ¿€o¿ù>4\Ç\î›‹‘BÁw€ıû\Ø\0 Àƒr\×\nöOBs=R(h+Fñ\æ\Í,ÃªwV`úCaÎœÇ¹I“/6Ozõ\Õ×°j\åJLŸ:\ß/ö\Ó\ÓV¡P\ĞV>”ô\æ\ß\0R\ÌF)”D˜«-(«¬AyU­t™ª-\Òe®µ ²¦Nºªk-¨±\ÔIW­¥–º:\Ô\ÕõõõØ³m\r™¸º\0n®®pws‡›«tyº»Á\Û\ÃUº|\Ü\İ\à\ëùû\å\ï\å.]\ŞğñtS6(Z3\â’büc\Í*ˆ]x\à<ò\È#ˆ‹‹3D\ìZ\n2##Ë—/\Ç\êÕ«¥\İ\ïŸ2ÁAÁZr±Á\nM¦E§<\0l°À\ß(lgZYcAAE5\nÊ«PdªA‘¹E¦j”˜ª\á\î\ê\n_OøûxÁ\×\ÇSº|\Ä\Ã\Û\Ë^\îğòp‡§‡<<\Ü\à\î&.W¸¹ºÀ\Õ\ÕEr¢¡®Nˆˆz\ÔJ‚Â‚š\Zªk,¨ª©EUu-\ÌU50W\ÖÀd®–®rs\ÊMÕ¨­«C¯\'B\Ä\å\ã_„ù{!\Ì\Ï\Ş¶g\ÜX-ŠŠ‹ğÁú÷°ö\ã÷q\ÓM7a\Ú\Ó0t\èPcAp@´?şø#\Ş^ı6¾ú\ê+L¾\ë^\Ü3\á>„‡8À“\ÖwI¡\ĞzVz¬)Ş¥bá»•³\×?{\Ó}\×\ë1»ø\\QU‹\Ü\ÒJä‰«¬\Zùe•¨ª± ,\È!¾òEp€‚ü½¥\Ë\Ã\İñ\âšZJ\Ê+¥«¸ÌŒ\âŠJM((1Á\Ë\Ã\r\áŞˆğDD 7\"½\á\ç\ån–\ìD_\ê\ê,Xÿ\Ù:|ú\Å\ÇğõõÅ”{\ïÁ¤I“¤ŸY”!`2™ğ\á‡b\Íû@ü|\Ç\Íwa\Âm\á\ê\êøGZ!…Bk(é»8)fkò5·_±|µ\ØnE#Y…&d•T\âl±U5uˆõG\ÇñG‡?ú‰HôYJ+*q¾¨ùE\å8w¾y…\åğòpEL°bƒ¼\ê+D°€5Ÿ~ù_lş›·l\Â-·Ü‚;\î¼\ãÆ#¤6Ø¼y3>ı\äSlØ°\ãnL\Æ\Í\ãn\Å\ÕW\êoÔ†B¡7€Îš\ÅDw\è”u\ï½÷aÚ”†õ:¡}\îŠu§\ÏW ½Ğ„Œ\àD‡!:<Q\èÓ¾tĞº¨ÔŒœó¥\È\Î/Fv~	PÄ…ù\">\Ô]:øIk#XH@0™*ğ[7a\Ë×›ñÛ‘CH?\ã\Ç\'K¢ÁÕ•÷É¥î’ºº:q°q\ã&lÚ¸—÷\îƒG\ÃÿŒM†¯¯Ÿno.\nİ¦\Î6\ÇNı{ı{_/\Å}§JsbF(b:!5¿i\ç+YP¸\È`tE§\È`i\ZÁ\èELWd\æ\ãLv!2r‹\Ñ)\Ì	ü\î\Ïi\n£\ßVñ\çŸ\Ë\Ã\×\ßm\Ãw;¿Á®Ÿwbô\è1;vn¸\át\ï\Ş\İğ¤Nœ8o¿ı[·n\Ãö\í\Ûp\ÍU\Ã0b\ØHŒ\Z1\á#œ‚…‚S¤±\å \Äb\Æ\î\×\Å`ò´»0súc¸\ëÖ»[n¤\Ã\Zb\ä\àxn\ç•#¯ÔŒn±a\è†ø\è0X­!\Ôad\êº\\_¤g\àtVNf \"\Ğ=#ü\Ñ32€#\r\ê¢×•u1\Òğı;°k÷Nü¸{§ôºö\Úk1\ì\Úa\ÒB\È=z\è*¶8›’’± q\ç;ñ\Ã?@|w††k†\ÃuC‡\ëz\ä\àR<(\Úr§è°ü\ÖÃ‘c‡1i\Ú]˜;g>nI¾U‡‘4\íò™B\ä”\"%§	Â.1¡NŸ½9}¶iùH\Ë,@¨@ô\nD\çP.n³w´\Ş\ß\éŒSØ³\ï\ì;¸ÿ=°¥e¥4p \Zˆşıû£_¿~ˆwüÎ‚må˜_ıÀ¾½û°w\ß>\âŠş1°\ï`x%º\Äum«yİ´£P\ĞMª\Ú\ç¨õ\ë‘\â„91²ğÒ‚\×0nlrû;°µPò³Šq\èl	\Ü\Ü\İÑ³[z\ÆGÀİs¨J¥¥¶¶\Ç\Óópüd,µµ\è„¾±ÁQ\n°“\Ù9wşş¿=„c)Gp$\å\ÊJKÑ«W/\é\êÙ«\'ÑµkW\éò÷w\Ì!G\Ö\Ø\Ë\Ë\Ëq\ê\Ô)\éJMM\Åñc\Çq\ì\Ø1\é\nD\ï½Ñ«Go\\~YôIê‡::Y\ÖZ‡B¡eFNQ£ñ>\n»÷ş$,¬|ımŒº~Œ®b4\×X°ÿLœ)F|L(’¢\Õ1PW1\è\ÑÙœs¥8œ–ƒô³…\è\ß9:‡À‡û5\è1•võ¹¤´©\'Sv*\r§3N\"#3g2p&3^\Ş^ˆ‰Ett¢££‰\á†\Ğ\ĞP#00P\âuMoooxyyÁ\İ\İnnÿÿ\ÕB‹Å‚\Ú\ÚZTUU¡²²RzQ€\Ò\ÒR£°°8—¹¹¹\È\Î\ÎAvöYd\ÍBUe:wŠC\\\ç8\ÄuŠG—¸nHèš€\Än=dWVZ\íŒBA«™QØ¯¦6\\sbda\í\ÛKskZ/b¤½\éE’HHJˆD\ß1ğóÒº\ÛN\ç_YE¦œ\Å\á´\\I,Š\áON—eûTXTˆœ\Ül\ä\å\ç\"ÿ|\ÄvÆ…\Å(*)BII	J\ËJ Í®¨¨€\ÙlBeU%ª««%Q ÄØ¼LlZ&Dƒğöò†/üüü¤c™‚„ „‡I\ÛV‡wˆ@Dx$¢\"£\Z\Â)Ê–²M¡\Ğ!\'ùüR;3Š\Õ\Ì\Ï~\0k\ß^!ƒ®\Öl´»O\à—Ó…¸¼{ôŠ•v@dq,±c\äşcYø\íD®\ìŠ!]\Ã\ë{7!¬w:5\0;L¡`\'Ğî¦¹-œ7oİ„\'Ÿ›ƒµ«\×c@\ß+\í\êEı\Ë)Å®“\èŒAIqğ÷\å‚¦ \ÜT…½‡3™SŒkº…¡W§´–#úC\í!@¡\Ğz:j\Û\ÒY6}E¯-À\Ú\Õ£w¯$‡GVlªÆ\Ôó¨¬†ô\ë\"mŠÄ¢mb3§İ¿†·+0<±‚¹ó£¶F\ïH •(Z	J\ï\ÕZ\n\"¾?ÿ\Ë\ŞzC\ZYH\ìæ¸T~\Í,\Æ÷©\çpU\ßxô\í­wô†óÿ\à‰lü|0\×%vD¿N\Ú<\r\ÏpIaÀ$\Ğ\ní€§§¦­\n\"qš\Üû\ëŞ•Ä‚X	l\ÏR][‡\í\Çòa®®”€ \îhOüŠöURf\Æ÷{\Ó\à\ã\nŒ\îO¾²ª(_\Z#{ P°\'mö\ÕZ¡ \\|{\Í*|ş\å?¥·!\"\Ã#\í\âuv±[\ä¡{\×N\êl—>Ù‰úö>ƒ§òpc\ïDs\Ûlõ‰³P\0…‚òL5i\Ñ¡ X±z)¶}»Ez\"$X\İ×‡Ä‚\Å\íGó0\êª\èÖ‰+\ç5yµÃ©“™øú\çŒ¾,‚\ÛÁ‘MIÀQ(E\Ş\Îı\Ú*„{K–¿q\ì¬~*|&mœ”U‚±\×\\&\í\Ì\âœÄ‘\×[wEÿ\Ø i\ï ı P\ĞO®\Ú\åi[„‚\èğ\Å%\ÏKÛ±Š·!Ä†&J–½\é…8–_›†\'Á\ß\ÇSIÓ´¥A\å\æj|µ\ã0z…ûaP¼º£T\ZŸ.‘€n	P(\è6u¶9\ŞV¡ zy\î\Åg‘~\æ4Ö¬Zg[§\Í\Ô#	‡sË‘<\ârn¤U\í›4mú\î7$EúsdAûé¢‡$  P0È\Ğ¡ =½\à	`õ\Òw\ÛM,%·?œ,\Ä-#ûp¥v\ÓÔŸ±AÓ†o\á\Ún¡\è\Éı1ô—Azl4\n\Éx{…‚À4û™Y\Ò>\ë\Ë_]\ÕfjùeUXÿK†$\"\Â\Úl‡\rõM ¯ L®ŒCx\0w\Û\Ôw6é½³ Ppö_ˆO	¡ L=2g:¼<½ğÚ¢¿·‰Üº=g\Ô3½ºD´©=9c§ópøx&\æ\ë°Î“UF\âŒ(œ1«MÄ¤”P¦§Í¼\Â:bñü—m¢·3õ\Ê]\Ü1\âJ\Ç\íúh“Ã¬¬:\ï~9ÿúZK\ì¨z_\ì€H m(\Ú\ÆMw­”\n\"ø)Ş.q]1ÿ©\ç[\Å\"¯´Ÿ\ï?‹\É\É\á\é¡\ì\Û­r€•4I º¦k7\íÃ­b\è­I\é	\0…‚A\î\0¥…Bmm\r&M›€>I}ñ\Ôcs[¤¸ñ`6¢c\ÃÑ§{T‹uYÁX\ÈAvV>\Æ÷\å¹\Æ\Ê<£\Õ\n½dª~*-„;¦\nLv††\ÇfÌ¹¤‡9%fl>œ‡\ÉÉƒ\Ú›;+µ›öb\\R¢‚¸Í³³\æ˜q\é—\0…‚~sg“\çj\á@Qq!&M»cGş	3¦\ÍjÒ§mGs\Ô1ı{\Æ\Ø\ä3+‡À\ãgQr®c.³\Ï\Ù\"\Æ!\ËHI ı(\Ú\ÏP\Ô\n\"øÜ¼L~`nûó¸Êƒñ¨«¯\Ç\ÒoSq\ïøÁğñö\Ğ+:i\æ\Ê\Z¼¿qfİWû;ÀI€.I€BÁ 7‡šBA <“™!,\Ü7\é~\Ü3\á\Şªiù\åØŸS†ñ#ú„ô\ÃÜ¿\ç\'¼ù\ÆX²òC‡ğĞ«K\İ¿;„QH÷7\ì½\ÂÀI@‹(´˜|R[(—SO\Ö,Ìšş\î¼õn)Š)ùğ\ÄÀ\Ë:©•}M>™‚Y\Ó\î\Âñ#‡.\êøµ7\×\"ù/št¦²ÒŒe¯,Àmwß‹.\İz4Y§¸¨\0³š„‡‹°0,{u!æ¿¸\Ìp¢b\ß\ÑL\Ô—bxpû&–½‘\0	4K€BÁ 7ˆ=„‚@y\ä\Øo\Ò\Ûs\ç\Ì\Ç-É·\â“}™Ø·+:Eë´\n\Ï?ó¿xv\Ñ\ßú\â!¿à©™˜9g\Ş%…@K[…ƒ¯n©º\Ó~™[Œ}O\áÎú•N›$fH\nI»½„‚À¹ÿ\à¥‘…—.A¦\Ïe¸utø\é›Ş¦„‚1X<o6ş|\ëD\éNZñúó8.ı®‚§.Á\ÑCpgòµ\ÒgwN&ı\Î\Û\Ûr»OÖ¾-ışlfúFN¥¦´Ú3\Ü\ÆeUø|û<xm7g‡1€\Ó PpšT6ˆ=…‚ğd÷ŞŸ¤5¾¼\r\Óo\n77Wİ“nJ(Xÿ®¨ \0\Ï=5K\ßşX\Z]°ş,*¦³$(\"\"£ñğcsñ\æ\ë/ /7û\"1ñÉ¦.šzB¡µöt€\ÅR‡·>û	jzŠ\Æbd$ G\nz\ÌZ|¶·P.~¿\ë?\ØS…™†µÁc\í5¹\Ô\Zñ€S-nú\×z\ìûeW\Ã(‚øü\Ë\Ï\×aö\Ó/`\É\â¹\Ò(„hg=*a½FA\ëE—²\'Rh˜\í-[¿s\Æô´½![\0	¨F€BA5´\Ú2\ì¡ ¼şu\n¼\íj§Q°Î²,\ä·x°?şğ\ä‹n„a×Æ¼\ÅË°ğ\é™\ÒTCKBA‹–\ì9\Ë\ÛQ\ĞÖ¿ô†d\n¹%\Şú\á¤S¯QhI(dfœ’¦\Z¬‹õ‚­B¡){\Îrs‚³d’q8\ng\Ë\è%\âq”Ppö·š\n\×4X¯K\Øş\Õ\r\Óò‚Ç¦\Ö(X(4gO,\Ô{\á[z\Ï ıwV\nÎš\ÙFq9J(8\Û>\n_lN(ˆ\Ï\Ät„üÖƒ˜v§	\Z¿õ\à\ïˆ‘c“ÿ°˜\ÑZ(4g\Ïnc\î£\àYd\ÎH€BÁ³\ÚDL\nÜ™\Ñ 7˜argF \Ò	¨@€BA¨Z4\é(¡À³´x7h\Ï\'õ ½œ\Ğ#	P(\ä^p”Pxyz¤An²v„\É\Ó#\ÛMI@e\n*ÖŠyG\n…œ36\Î\Ã\ä\äAZÁA?4F`\í¦½—¨ ı/\Ê\ÔZºC\í&@¡\Ğn„ú0\àH¡ m<˜\è\Øpô\é¥`ô\Òn\ÈAvV>\Æ÷¶[Ÿ\ìˆH õ(Z\ÏJ\×5-òJ+ñùş³˜œ<\îºfI\ç•#P]S‹µ›ö\á\Ö1ˆôV\Î0-‘\0	(F€BA1”\Ú6\äh¡ \è\ìL=‡rwŒ¸²»¶a\Ñ;»ø\î—ğ¯¯Å°Äv\ë“‘\0	\ØF€BÁ6^º­­¡ \à­\ÛsI=cÑ«K„nY\Òqe;‡\ÃÇ³0qpge\Ò\n	€*(TÁª=£Z\nùeUXÿKn\Ùa\ÚE\ìB ¯ ¾9„	W\Æ!<@ÿG\Û\Z;! Ppx{w«¡ \âN\É-\Å\'%±\à\ïË‡„½\ïG÷Wnª’DÂµ\İB\Ñ#2\Ğ\Ñ\î° P(\äÑ’P\È÷Ÿ)\Â\á\Ür$¸>^\É\Ã4W\Õ`\Ów¿!)\Ò:‡	€P(\è IJ¸¨5¡ bÚ›^ˆcù¸ixü}<•“64L \Ü\\¯vF¯p?ŠÕ°§tHÀš\0…‚A\î-\nyd\á@V	\Æ^s:„ø$\Æó|Q¶\î:Šş±AI0^ú±\Î	P(\è<­u_«BAø,§Û\æa\ÔU=Ğ­SXkCb=8™Y€¯NÁ\è\Ë\"\Ğ+Škt’6ºI\r(r3hY(ˆd›±\åHºwÀ\à$¾.\ç,·\å\Ãgp\âTn\ì\è`n\Ï\ì,ye\Æ\"@¡`|k](ˆ4T\×\Öaû±|˜\ë€\ë% (€½Ş%ef|¿7\r>®À\è^\áğtw\Õk(ô›O€BÁ ·€„‚œŠ_3‹ñ}\ê9\\\Õ7}»sÿ½İ¢Od\ã\çƒ\é¸.±#úu\nÖ›ûô—H \nƒ\Üz\n\"%Å¦j\ìH=\Ê:`H¿.ˆ\êÀ¹m­ßª9\çK±û\×\Óğv†\'v@°/\ßd\Ñz\Î\è	´†\0…Bk(9A½	¹X\è¸\ëd:EcPR7h\Ò\à½(6P\Ú{8™9Å¸¦[,j0Gt‰\ÚC€B¡=ôt\ÔV¯BAF¼ûT~9]ˆË»Ga@¯XnÒ¤{Ol´ÿX~;‘ƒ+»„bHW¾±¢´\ĞPœ\0…‚\âHµiP\ïBAP­¬±`oz‘´«cRB$úöˆA€·€¶÷WVQ…ƒ)gq8-W\ÚaP|¼=\Ü\ì\íû#°\n;vt7\Î d†\æ\Z‹$œ)F|L(’¢Õ‘kÔ¾\ÇrÎ•\âpZ\Ò\Ï¢\ç`I$øP ¨öIÀ\á(û8\àLBA&V_\Ì*Æ¡³%pswG\Ïn\èw¾Š§\ØMU[[‡\ã\éy8~2–\ÚZô‰	B\ß\Ø`¸¸(\Ö\r‘\0	hœ\0…‚\Æ¤”{\Î(¬Ùœ)4\áHN)RrJ‘\Ğ)	q\á\è\Ãó\Úzÿœ>[ˆ´Œ|¤e GT zG¢s¨o[Í±	€	P(\è8y¶¸\î\ìBAfQc©\Ãñ\Ü2\Ï+G^©\İb\Ã\Ğ%6ñ\Ñaü+¸™FŒÎ¤g\àtVNf \"\Ğ=#ü\Ñ32\0n\Ü,É–\ï\Zë’€³ Pp¶Œ^\"£\ëğ+ªj‘š_´ó\È,¨@\\d0:G‡¢Sd0‚¹\ë#Š\Ë\Ì\È\Ì-Æ™\ìBd\ä£S˜:ø!1\Ü~^\îùf0L –P(´D\ÈI>7¢P°Ni8}¾\é…&d˜\0 :<\Ñ\áÁ\ÒfN!Î¿]tQ©bS¤\ìübd\ç—\0õ@\\˜/\âC}Ñ¥ƒGœ\ä»\Î0H@i\nJÕ¨=£…\Æi)2U#«Ğ„¬’Jœ-6£ª¦¡ş\è\Ø!\0\á!şÒ‘×~\Ş\Z\Íf\Ën•VTB\íœ_Ts\çËWX/W\Äû 6\È±¡¾\áÎ‰-ƒd\r P(\ä& Ph>\Ñbš\"·´y\â*«F~Y%ªj,òEH /‚ƒ|¥\éŠ o\éòpwü¾5µ””WJ—˜F(.1¡¨Ô„‚¼<\Ü\àˆ\0ODz#2Ğ›\Ó	ù®3LPš\0…‚\ÒD5jBÁöÄˆ\r\n*ªQP^…\"S\rŠ\Ì5#%¦j¸»º\Â\ß\×ş>^ğõñ”.oi\ÇH/Owxy¸\Ã\Ó\Ã\rnpw—+\Ü\\]\à\ê\ê«w\ë\ë\ëQWWK]=j-u¨µXPScAuU5µ¨ª®…\Ø\Ñ\\Y“¹Zº\Ê\ÍU(7U£¶®A¾\Ò\È@ˆB|=\æ\ï…0?On€d{ºÙ‚H\à(rkP((›hsµe•5(¯ª•.SµEºÌµT\Ö\ÔIWu­bm„¸j-BÔ¡®\â@.B4¸º\0n®®pws‘\Ö	ˆ\Ë\Ó\İ\r\Ş®\Ò\å\ã\î_\Ï\ß//w\é\n¢\Ä\Óñ£\Z\ÊR¥5 - P\ĞbVTğ‰BA¨4I$@ @¡`€$‹)’h†I$@\n PP¨V\ÍQ(h53ô‹H€´M€BA\ÛùQ\Ì;\n\ÅP\Ò	\0	Š\0…‚A\ÒM¡`D3L P˜\0…‚\Â@µjBA«™¡_$@$ m\n\ÚÎb\ŞQ((†’†H€HÀP(’n\nƒ$ša’\0	€\Â(ªUs\nZ\Íı\" m P\Ğv~óBA1”4D$@†\"@¡`tS($\Ñ“H€&@¡ 0P­š£P\Ğjf\è	\0	h›\0…‚¶ó£˜w\nŠ¡¤! 0\nƒ¤›BÁ ‰f˜$@$ 0\n…j\Õ…‚V3C¿H€H@\Û(´Å¼£PP%\r‘\0	€¡P($\İ\nI4\Ã$ …	P((T«\æ(´šúE$@\Ú&@¡ \íü(\æ…‚b(iˆH€E€BÁ \é¦P0H¢&	\0	(L€BAa Z5G¡ \Õ\Ì\Ğ/ \Ğ6\nm\çG1\ï(CIC$@$`(\nI7…‚A\Í0I€H@a\n\nÕª9\n­f†~‘\0	€¶	P(h;?ŠyG¡ J\Z\" C P0Hº)’h†I$@\n PP¨V\ÍQ(h53ô‹H€´M€BA\ÛùQ\Ì;\n\ÅP\Ò	\0	Š\0…‚A\ÒM¡`D3L P˜\0…‚\Â@µjBA«™¡_$@$ m\n\ÚÎb\ŞQ((†’†H€HÀP(’n\nƒ$ša’\0	€\Â(ªUs\nZ\Íı\" m P\Ğv~óBA1”4D$@†\"@¡`tS($\Ñ“H€&@¡ 0P­š£P\Ğjf\è	\0	h›\0…‚¶ó£˜w\nŠ¡¤! 0\nƒ¤›BÁ ‰f˜$@$ 0\n…j\Õ…‚V3C¿H€H@\Û(´Å¼£PP%\r‘\0	€¡P($\İ\nI4\Ã$ …	P((±İ³\0\0\0³IDATT«\æ(´šúE$@\Ú&@¡ \íü(\æ…‚b(iˆH€E€BÁ \é¦P0H¢&	\0	(L€BAa Z5G¡ \Õ\Ì\Ğ/ \Ğ6\nm\çG1\ï(CIC$@$`(\nI7…‚A\Í0I€H@a\n\nÕª9\n­f†~‘\0	€¶	P(h;?ŠyG¡ J\Z\" C P0Hº…P0H¨“H€H@aÿ7\Âk³’‰ş\0\0\0\0IEND®B`‚',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(319,'2020/2021','2021-01-13 16:13:49','2021-01-13 00:00:00',318,2,'ziad',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `inscription_administrative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscription_en_ligne`
--

DROP TABLE IF EXISTS `inscription_en_ligne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscription_en_ligne` (
  `id` int NOT NULL,
  `academy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bac_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bac_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bac_year` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `birth_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cne` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `establishment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name_fr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `high_school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name_fr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `massar_edu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mention` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  `accepted` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscription_en_ligne`
--

LOCK TABLES `inscription_en_ligne` WRITE;
/*!40000 ALTER TABLE `inscription_en_ligne` DISABLE KEYS */;
INSERT INTO `inscription_en_ligne` VALUES (322,'meknes','meknes','idk',2018,'2021-01-04 00:00:00','meknes','meknes','D549596','emile','wail','Wail','HOMME','emile','homan','Homan','M5895959','Bien','MA','meknes','2021-01-13 16:49:42',0),(320,'anfa','casablanca','pc',2018,'1999-01-11 00:00:00','casablanca','casablanca','BK1576555','hassan 2','sedki','youssef','HOMME','tazi2','Yooussef','sedki','R13598568','TrÃ©s bien','MA','CASA,Anfa','2021-01-13 16:42:58',0),(321,'TADLA AZILAL','BENI MELLAL','BIOF PC',2017,'1999-06-12 00:00:00','casablanca','Beni mellal','VA155564','JNAN TAHR','Ø®Ø§Ù„Ø¯','ouztato','HOMME','HASSAN 2','Ù†Ø¹ÙŠÙ…ÙŠ','ilias ','M13008415','Bien','MA','casablanca','2021-01-13 16:47:34',0),(317,'meknes','meknes','math',2017,'1998-04-01 00:00:00','Meknes','Midelt','220','Bachelor','oussama','Oussama','HOMME','la rource bleu','boussif','Boussif','M12345678','TrÃ©s bien','BR','midelt','2021-01-13 16:13:49',3),(293,'meknes','midelt','pc',2010,'2000-05-30 00:00:00','Midelt','Midelt','VA18764668','hassan 2','Ø­Ù…Ø²Ø©','Hamza','HOMME','hassan 2','Ø§ÙŠØª Ø¹Ø¨Ø¯ Ø§Ù„ÙˆÙ‡Ø§Ø¨','Ait abdelouahab','M158996','Bien','MA','midelt','2021-01-12 20:28:33',0),(292,'meknes','midelt','sm',2018,'2000-05-24 00:00:00','midelt','Midelt','VA123154','my rachid','Ø®Ø§Ù„Ø¯','Khalid','HOMME','my rachid','Ù†Ø¹ÙŠÙ…ÙŠ','Naimi','M12001648','TrÃ©s bien','MA','midelt','2021-01-12 20:25:01',3);
/*!40000 ALTER TABLE `inscription_en_ligne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscription_pedagogique`
--

DROP TABLE IF EXISTS `inscription_pedagogique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscription_pedagogique` (
  `id_ip` int NOT NULL,
  `annee_academique` varchar(255) DEFAULT NULL,
  `date_pre_inscription` datetime DEFAULT NULL,
  `date_valid_inscription` datetime DEFAULT NULL,
  `etudiant` int DEFAULT NULL,
  `semestre_id_semestre` int DEFAULT NULL,
  PRIMARY KEY (`id_ip`),
  KEY `fk_etudiant` (`etudiant`),
  KEY `FKb8eil1es29730lwy0n8su060r` (`semestre_id_semestre`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscription_pedagogique`
--

LOCK TABLES `inscription_pedagogique` WRITE;
/*!40000 ALTER TABLE `inscription_pedagogique` DISABLE KEYS */;
INSERT INTO `inscription_pedagogique` VALUES (297,'2018/2019','2021-01-12 20:25:01','2021-01-12 00:00:00',295,5),(305,'2018/2019','2021-01-12 00:00:00','2021-01-12 00:00:00',295,1),(311,'2018/2019','2021-01-12 00:00:00','2021-01-12 00:00:00',295,2);
/*!40000 ALTER TABLE `inscription_pedagogique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscription_pedagogique_module`
--

DROP TABLE IF EXISTS `inscription_pedagogique_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscription_pedagogique_module` (
  `id` int NOT NULL,
  `note_module` double DEFAULT NULL,
  `validation` double DEFAULT NULL,
  `inscription_pedagogique` int DEFAULT NULL,
  `module` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7ba0yfer76mco3jpc7am9acle` (`inscription_pedagogique`),
  KEY `FK5avuycx5v86n7caw6sfexo3ci` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscription_pedagogique_module`
--

LOCK TABLES `inscription_pedagogique_module` WRITE;
/*!40000 ALTER TABLE `inscription_pedagogique_module` DISABLE KEYS */;
INSERT INTO `inscription_pedagogique_module` VALUES (298,NULL,2,297,21),(299,NULL,2,297,22),(300,NULL,2,297,23),(301,NULL,0,297,24),(306,NULL,-1,305,1),(307,NULL,-1,305,2),(308,NULL,-1,305,3),(309,NULL,-1,305,4),(310,NULL,-1,305,5),(312,NULL,2,311,6),(313,NULL,2,311,7),(314,NULL,2,311,8),(315,NULL,2,311,9),(316,NULL,2,311,10);
/*!40000 ALTER TABLE `inscription_pedagogique_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module` (
  `id_module` int NOT NULL,
  `libelle_module` varchar(255) DEFAULT NULL,
  `semestre` int DEFAULT NULL,
  `semestre_id_semestre` int DEFAULT NULL,
  PRIMARY KEY (`id_module`),
  KEY `FKdi4d9x4tg8c46iqss2eprwyly` (`semestre_id_semestre`),
  KEY `fk_semestre` (`semestre`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (1,'algebre 1',1,NULL),(2,'analyse 1',1,NULL),(3,'analyse 2 ',1,NULL),(4,'java 1',1,NULL),(5,'algorithmmique 1',1,NULL),(6,'algebre 2',2,NULL),(7,'analyse 3',2,NULL),(8,'analyse 4',2,NULL),(9,'java 2',2,NULL),(10,'informatique',2,NULL),(11,'analyse numÃ©rique 1',3,NULL),(12,'probabilitÃ©',3,NULL),(13,'genie logiciel 1',3,NULL),(14,'genie logiciel 2',3,NULL),(15,'base de donnÃ©es',3,NULL),(16,'analyse numÃ©rique 2',4,NULL),(17,'statistiques',4,NULL),(18,'c++',4,NULL),(19,'projet 1',4,NULL),(20,'algorithmique 2',4,NULL),(21,'architecture des ordinateurs',5,NULL),(22,'Systeme d\'exploiatation',5,NULL),(23,'projet 2',5,NULL),(24,'jee',5,NULL),(25,'reseau',5,NULL);
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note_module`
--

DROP TABLE IF EXISTS `note_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `note_module` (
  `id_note_module` int NOT NULL,
  `note_module` double DEFAULT NULL,
  `inscription_pedagogique` int DEFAULT NULL,
  `module` int DEFAULT NULL,
  PRIMARY KEY (`id_note_module`),
  KEY `FKqwgnka5krujy92vj6ei84i5dn` (`inscription_pedagogique`),
  KEY `FKfq7ulbl37jdloyp1lofie813s` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note_module`
--

LOCK TABLES `note_module` WRITE;
/*!40000 ALTER TABLE `note_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `note_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professeur` (
  `id_professeur` int NOT NULL,
  `email_professeur` varchar(255) DEFAULT NULL,
  `mdp_professeur` varchar(255) DEFAULT NULL,
  `nom_professeur` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_professeur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professeur`
--

LOCK TABLES `professeur` WRITE;
/*!40000 ALTER TABLE `professeur` DISABLE KEYS */;
/*!40000 ALTER TABLE `professeur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsable`
--

DROP TABLE IF EXISTS `responsable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsable` (
  `id_responsable` int NOT NULL,
  `email_responsable` varchar(255) DEFAULT NULL,
  `mdp_responsable` varchar(255) DEFAULT NULL,
  `nom_responsable` varchar(255) DEFAULT NULL,
  `filiere` int DEFAULT NULL,
  PRIMARY KEY (`id_responsable`),
  KEY `FKf755a536use2tovxjsrdtj0c9` (`filiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsable`
--

LOCK TABLES `responsable` WRITE;
/*!40000 ALTER TABLE `responsable` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semestre`
--

DROP TABLE IF EXISTS `semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semestre` (
  `id_semestre` int NOT NULL,
  `libelle_semestre` varchar(255) DEFAULT NULL,
  `etape` int DEFAULT NULL,
  `filiere` int DEFAULT NULL,
  PRIMARY KEY (`id_semestre`),
  KEY `fk_etape` (`etape`),
  KEY `fk_filiere` (`filiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semestre`
--

LOCK TABLES `semestre` WRITE;
/*!40000 ALTER TABLE `semestre` DISABLE KEYS */;
INSERT INTO `semestre` VALUES (1,'1er semestre',1,1),(2,'2eme semestre',1,1),(3,'3eme semestre',2,1),(4,'4eme semestre',2,1),(5,'5eme semestre',3,1),(6,'1er semestre',4,2),(7,'2eme semestre',4,2),(8,'3eme semestre',5,2),(9,'4eme semestre',5,2),(10,'5eme semestre',6,2),(11,'1er semestre',7,3),(12,'2eme semestre',7,3),(13,'3eme semestre',8,3),(14,'4eme semestre',8,3),(15,NULL,3,1),(16,NULL,6,2);
/*!40000 ALTER TABLE `semestre` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-13 16:56:40
