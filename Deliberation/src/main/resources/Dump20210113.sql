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
INSERT INTO `etape` VALUES (1,'1ere année',1,0),(2,'2eme année',1,0),(3,'3eme année',1,1),(4,'1ere année',2,0),(5,'2eme année',2,0),(6,'3eme année',2,1),(7,'1ere année',3,0),(8,'2eme année',3,1);
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
INSERT INTO `etudiant` VALUES (295,'meknes','midelt','sm',2018,'2000-05-24 00:00:00','midelt','Midelt','VA123154','my rachid','خالد','Khalid','HOMME','my rachid','نعيمي','Naimi','M12001648','Trés bien','MA','midelt','2021-01-12 20:25:01'),(318,'meknes','meknes','math',2017,'1998-04-01 00:00:00','Meknes','Midelt','220','Bachelor','oussama','Oussama','HOMME','la rource bleu','boussif','Boussif','M12345678','Trés bien','BR','midelt','2021-01-13 16:13:49');
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
INSERT INTO `filiere` VALUES (1,'Genie Informatique',3),(2,'Genie Biomedical',3),(3,'Chimie appliquée',2);
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
INSERT INTO `inscription_administrative` VALUES (296,'2018/2019','2021-01-12 00:00:00','2021-01-12 00:00:00',295,1,'Administrateur',NULL,NULL,NULL,NULL,NULL,NULL,_binary 'QRR4P-F4FDP-H986R-RF6P3-7QK3R',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\n\0\0�\0\0\0��H\0\0\�tEXtmxfile\0%3Cmxfile%20host%3D%22app.diagrams.net%22%20modified%3D%222021-01-09T15%3A04%3A30.296Z%22%20agent%3D%225.0%20(Windows%20NT%2010.0%3B%20Win64%3B%20x64)%20AppleWebKit%2F537.36%20(KHTML%2C%20like%20Gecko)%20Chrome%2F87.0.4280.141%20Safari%2F537.36%20Edg%2F87.0.664.75%22%20etag%3D%22lfUR3zF5NTbUW1H13H1s%22%20version%3D%2214.1.1%22%20type%3D%22device%22%3E%3Cdiagram%20id%3D%22OwgjLNJBIycCDtZY6UnE%22%20name%3D%22Page-1%22%3E3VnbctowEP0apk%2FNIHzBPAIJbafNNDOZtsmjsBdbjWxRWQ7Qr6%2BEZWNbJhAGQugLo11dLJ09e9YyHWscLz9xPI9uWQC00%2BsGy4513en1PNeTv8qxyh22080dISdB7kIbxz35C9pZDMtIAGltoGCMCjKvO32WJOCLmg9zzhb1YTNG60%2Bd4xAMx72Pqen9RQIR6WMVp1D%2Bz0DCqHgy6uqeGBeDtSONcMAWFZd107HGnDGRt%2BLlGKjCrsAlnzfZ0ltujEMi9pnw9Yb%2F%2Fp6u%2FvQn3S8WBJzZD%2BwjsvJlnjHN9In1bsWqgGAREQH3c%2BwreyGj3LFGkYiptJBs4nSeAz8jS5DPGs0IpWNGGV9PtwAFDvSlPxWcPUGlZ%2BD2LezKHr0H4AKWW0%2BHSswk14DFIPhKDtETSpg1z3pFHBabqNmFL6pErHRizZSwXHsDpmxoPF%2BDrQHtD0EoSbGAjBsoS3rMVTOL6dAXCqIqyAobIln5DU%2BB3rGUCMIS2TdlQrC4MmBISag6BFNhwtryJYrAzdgEGLyZ3xYb1%2FdgOjtObBCqx8ZyzdhYLaFxTxWZnhGZccTIUslUplKXBZ2x1Rl6MjbNMMnVpfRIY7QjLc6CdM9pIO04BtLIboG6fyqoTX25VkrNlWRHEJNEgf6BxEqGLxvrksJnw9pp0XIXxwosKtaHrlok8WkWQOkMa0O01YxIIIujNhOWQD0MkARDVXKlyeaQtKhSKVcBTiNVLNbzqBK1EfafQs6yJCjipR8ASyIepNm9crT1qCzdvl5WjVVhJBLPyiRlPpa7lMZm2toq5uUHVqd8mRQSFJZxH3ZrjMA8BLErQUySVUlU6CAHigV5ru%2BtjUV6uTtG5K5Lwlp2nbC23SBifiY9q%2Fom0VjI6e5YKD%2B0sdCa1OUZD%2Be5a%2FD8tqrY3Z9hiNzD1eQI2mC7DR1ueRt5W23ot2jDock9pcx%2Fyl0TorahM6l4fUe9l1K%2FyGdUzeYyt9vz%2Bdh5eVn5Zg0abBrsl28yXnhVGTZXA9LtGzZYa9duFLKRr3jUZPZ2JPMEsMg4pO8qn%2B3eufN58O7yufuKfC7rM6pW50qxPn199vaszxeoF3ZzoeYV98T1ubjuHYWcunM7%2FcpXvVNRaSdF0BbxOAFHkLWjFOzLEeOm6A2unLdlifl95I6vhX8QEH7pt0HbO3eFQOZXjv%2FiOnjg1e6Qa%2BQRyw3aV0zesN54Dco6B2qJcR88Wr2R5uYDeT588y%2BDdfMP%3C%2Fdiagram%3E%3C%2Fmxfile%3E$AR\0\0 \0IDATx^\�x\�\�\�\�lz���HHB�AP0(T�\r�QAP�\"@�\�D��� E�)�@\�!\�Cꦗ\�|\�3�/!m�ٝ\�\�3\�3���{3ɼ{\�{�@�\�\�8{W�\��H�\0 \Z!`��dTR�P�\�\0I�D\�\"@���	\���H(H?N\����B��\"@��A �` a\'�` ��a\"@&@BA`�R5GBA��!��\0 \�&@BA\��\�;\n��$CD��\"@B�@\�MB�@M\�$D�L����@�j���T#C~\"@�M����\�#�w$CI��\0 E�����������I�\0�\0	��J\�	�F��\"D�H�\0	i\�G0\�H(��\"@�\0		7		4\r�\" 0\n��9\nR��E�\0�6\nҎ�`ޑP%\"D�\nn\nh\Z& D@`$*Us$�\Z�\" m$���#� J2D�\00($$\�$$\�4L\"@���H(T�\�H(H52\� D@\�H(H;>�yGBA0�d�\"`PH(H�I(H�i�D��	�P�T͑P�jd\�/\"@���	�P�v|󎄂`(\� D���P0�p�P0�@\�0�\0  � 0P��#� \�Ȑ_D�i � \��\�	�P�!\"@��A �` \�&�` ��a\"@&@BA`�R5GBA��!��\0 \�&@BA\��\�;\n��$CD��\"@B�@\�MBA\�@�)�_R��\�\n\�,*Spgq�%\�J\�,�P�\\�\�\�\nE%J%��@eee�3FFF�\�2L��`j,\�N3cX�ʸ\�\�\�Vf��6\�&\�ika\nK3caEֈ\0 � �` �	�]R�@Va�\nJ�ST��\�r\��!��&2l�\�`ci+K3\�dosS����\�\�f�\�055��1;e0�A&3��D�R\�DD%*8A�@y�e\�\n��W���ť\�(.)GQqw����J%\�\�\�\�NKS8Z�\�\�\�\�\�f�0%�~ĩ � �` �	��]XZ�4y	\�ٙ_�����+\�loG;+8\�[��\��6\�ij\"����B���\�\�\�/Fn^r\�E\�\�+���1\\m-\�fk7;�\�Y�\�\�\�@\�v\Z& B � $M	\�\"��`pXf )�Iy%H\�-Fi�nN6h\�bWG�8Z\�\�\�B\��\�5ya	2s\n��S����H\�.���^�𶷀������\"\�\n\rғ\�\r](�:�����\�.BBV`x�\�\�\�\�.vp��ԓH\�=�y1R3\�H\�\�EJFP	�:[�\�\�\n�\\��\�:�\0 5	�P0�{\���N�\�(@\\f!�\n\�\��N�qw\��`\��i�������\\�8[\�\�\�\Z�64Ma\�7��� �` ����9�����\�H����3Zy;\�\�\�*5��\��������IY���7;K�\� \�ݖ2\r�\�HW�$@BA/\����](\�\�.µT9bR\���q���+Zy9Ht�\�\�\�l\�%d .1�vh\�a��NV\�wD�\0�<\n��0\�P`߂��rq99\�&&j\� ?7��\�\\�0w\rPQ�\�\��tܼ�EE:y٣��eg�Lv�� ��A\�E}\n\�\�\n\\�����r\�\�\���ha\'&�Q�\��r\\�KE|r6��t@������\Z\�!zO���އ��\�P` E\�\�p\"���;:z�\�\�\�@\"(�a\��\":&W\�\�8�\�\�ϑx�Nx\�\" 8\n�#��A]\ng\�d\�\�\�ltl\�n�\�\�\n�t�K��y\�F�\�JE\�VNx����Q\�D�h�\0	�`��Q]\n7R\�8u;>\�\��6V�A�\�\�UPT�ȫ	HL\�E�6\���i �ň�!\�!@B�9�t���	�ܢ2�\�D�x�K+nQ$:�M�-\�t�\�]XȀ�.p���0�4�\0	�F�\��\�tI(\\J\�\�߱�ѫ�:��\�u�\������\�\�-\�\�\��\�\�O&�F����E���\�P(�P\�Ѝ+�ǻ�ÞVO\�ٻ3/�G\��R\nv������$ǉ\0	��.Rr���Z:ڶvC�-\r$*�?\��W\�\�֝t<\�\�\r��l��G�F��H(\�cTk���+X<t=O�\nD��׷[�vb�:�A\�ܨ\�Q߂K\�1$\"\�\�]G�[8))C��\�v�C?	�-�����\��\�\�t\"�;H(\�N��\�3\n��ٸ�Q���;�\�ҬY\�\�\�\'PP\\�}ǯ\"\�\�\Z\��h\�G�<$� �` w�Ԅ\�$\\M+@\�i�$�\�0\�\"MG����\re(\�4T\�&@BA�\�\�h\�$b\�\�8q;#�\�D(5:��s![�i\�\�\�\�\�\�	�\�>��D�F��H(\�kdk�K*B!#��\�%p\"�\�\�\�@\�\�0kH\�\�\�\�\�k=}\�jK�m\�B�L�����#�oR\n;\�\�C� o�rptdJ	ܸ���7�0�����#�\r�\0	���\�\�\��(02�=\�\Zu\ZfC����\�\n�\rh\�Х�9 \" � xmw+�PH��\��\�\Z3Sm���(���\nl��ݼ\�fg!Q/\�-\"`\�H(H�\�\n\�\�)��vE��B��\�X�o�\"%)\�;Ӿ�eF\�m ��M\�\"�%�PH\�+\�ޫ\�\�]DԵ�	l��İn�e��\'�\�0	�P0���)^O�}\'t\r�2\�4Lu	\\�����\�\�\�]ݦt= \Z&@BAÀ�b^,����\�\�#�x}xXZ�J�!1\�%\��.�<f�\�\�Hbޑ;D��	�P0���%\�2\np!5ß\�d �i�M%~�2�y\�\�\�զ�&� \Z @BAP�hR,�p<&�vi\�����c0c«�y\�r�gA\�;a\�ЪM�1>\�ӆ\�K\�\�\�\Z�/�&��\���\�ىyKV�\�B�����b,_8!=��c�G�\��%X�\�:|�\�&��\�Q\�Q�+G�@\�昡�D�L����@�jN,��cT\"B:����C�B\�\�����}Q-\�\���\�XФPh\�T�Ppp�\�Vމi�����WB�\�eA\�\0h:\nMg�S-\�\n_���u���\�\����BM�����/;�\�Z�����\�q?�ܰ���\�?\�\�=�?�1�#�\r;�\��]�\��ݨ���Ϟ</���#N�[�\��qį�0g\�\��`���mp\��!�<v�\�\"\�\��o\�\��6�L����޸}�8�Ĳ+�U3\n\�l\\����w\�+c\'ԙi\�\�7���\\��\Z�~O\�2	oN�\rf�eA\r}�\�8�\�\�\�o\�T\�wb\��)�k\�\�`\�\"7\'�\'�\�\�\�\�q�\\\�>����M���\�\'�����w��ѩ\�-r�\�;\n�\��%V��w^z\�Ʋ�H\�%T������_vr��\�Ln�\�O\�ЮSW\�!\����~�bu&\"\'+���\�\��uLP0�jQ\�NqmR�\�=d������>�a�\�1�݅�3�g\\��\�!��\�P<���\��KN�\�l܉���5K�\�\�ý�~T}e\�\�\�\�s�\Z\� �PPeȸ1�\�Ʀ-Tf\"M5n�-/��\\81ѭ�c���)�x�\n%���\�zJ7��\�O\r�\�6ӆr�%>?x\�_\�[+\�\��\�/_�?|\�7c~��}ƾ��o� \��\�\�0{x�o\�5\�0�j>4ك��z���T\�\0�Ax\�\�\�h\�=4Y��=U?\���\�?Uی	_K�D��P`\�\�Q�U�[\�\�\���k̪}\��K5����\\��c\�g\Zú�z�u�N\�\��A��kI\�$:A�2\n:�\�;)�PhJF��\�?{\�R�Z��+\�\�.5D\�\��5��j`\�6�T\0O��\�y�\�S%�:\�_�!�� �M(�z\���\�\�\��@�bc�_4Y�P�\�\�\�~\��	�a\��\�sXF�0쿍a͋��w5e��{N��&�P\�U	\�K(4�F��o\�o\��:B�>1P\�g��u��\��Gͷ�\n��)�P`�\r�\�u2\nu�\�W�j$���\\\"�\�\�\�c�\�M\�VK(4���\�\�\�Uk\�\�(ԬQ`�\�8�\�\�\���u=\�Tk�vlZ\�̩�կ\Z\����:-��\n\�|g�j\�CH��D?��\�t4T�\�PF��P`,X&{����QPe]\�\���`\0�h�:I���N�M}�\�\nB��P\�[\n\�\n�[7�_�_߼?O�6?\�zP�K\�:j{���� �PP{k�O�Apvq����!��\�o||��&\\�r|;�3���Z\�zP}S��;�\�QP���Zm ��\r\�\�C,�@+3J �Zr��Z�Ƹ@+36�]C�O������ңXB��z%\�Z\�f�cCY�����2\��M���\�\�t��XB�Ѣ\�#u�Ѧ״{�6iS_D@=$\�㥳W�)R��j:Ɔv\�Y~\�f	l��İn�WO\�zF։\0 �` ���B�!�N���+:��0\�4\�\��|+)I\�ٳ�M\�:\"@�H���a�ٕ\�B!]^�_.$clh\�LM\�DA}K�@Yy�GD\�\�n^p����g\�\n <\nr/�-擱�Q`d�\'z�5\�4̆=w6�\�Т�K\�s\"@D\"@BA$�\�\�V\nB��y\��{\�\�\�Vn\�F@�I����\�z3	�{���g\� �H(\�� ���_�]\�0\�\�Nps�5�4̚ҳ�\��e�\�\���oANĈ\0�\n҉�F=��P`��I�\�\�\�lN,\�X\�CB�����RN$�k\�@w;	zH.\"@��$��rp5�\0�Ot����F\�0�\\\\Z���W\��\�\�Z:\Z&\Z5\�1�Qб�5\�]�	6�\��l\�\�(\�\��`ci\�ԡQ;!PP\\�}ǯ\"\�\�\Z\���t\�kr�\nrHQ(𙅋Iyҧ\\�\r$\Z�7\�̜B8u]�\�)�`x\�\�8\n:�ƺ/U�����*ǡ\�\�x�W \��87vHt�������\�\�`P;7{PM����\�$\�H(\�\� e��B��[��\�\�Ѷ�zt�\�\��\�<�n\�I\�\�\�\�\�\�@\�3\�K\\i�E����\�[\�B����B�C72P�\�\�{[z�\�\�홗_��#\�`)�\�\�D��C!���� �` ��.>�s�w\�}�\�\�\�mi�]�E�o�\�Lt<h�.>�\�>�K�@\r$\�\�%��B�[T�㱙(Q�vi�ۖ����)\�\�Kwa!�����\�d�z\�\�?\"\�$\ZCI�\�5��#g���ng�\�\�\�;�\�M�\�J�W����>m��`Q�1\"��@s�Ph=j��B�G|�N\�\�\�FǶ\�\�M�4I\�\�c�\']���+�Rѳ�mMo�H ,\��\0	��JӠ�F��\\�\��nU\��\�\�\�[kZZ\�w\\~a)�c�q5.�[���#,L��\��G����P\�h��\���3,.Wpb\�\�\\�y9���<ZP\r��\�\��r\\�KE|r6��t\�D�%	Mc\'�D@t$D�v\�\'������rq99\�&&j\� ?7�Ыx�\�TJ܌O\�\�\�\�PTT���=:{;�\�H�.\� \'@BA\�\�=}\n�l\�e\�Z�1�r��8\�\�\���h?��\�?w������\�,zء��Z:Y5\��#D@�	�P\�\�\�㺾�E�B��i���^�ty1\�x;���3�<�\�[p=7\�\�ħd\�nRn\'e�\�\�An6r���1-��\�\�\Z]K�\0	}�h\�1��:�\�\�\n\�f .��Y��uw@KO\'��;��V}Dn~1\�rq/%	i��q����5\\m`mnb �4L\"@\Z\"@B�!Bz�!\n\�бL\�\�\�B\�g!!�0<]\�\�\�\��-\�\�h��\�E\�ȋ�EJ\�\�EJFP	�:[�\�\�\n�\\�)s�\'�\�4\" 4\nB��=C\n5ÒST��\�\"$\� 9��\�J�9٠��-\\m�-�\�-$\Z͆ݒ��m휑S����H\�.���^�𶷀��i\�ĆA\�D�����\�$\�4��H�� ���e\�\�/Ai�\��Vp�����7]aoc���&\�P^�@^A	w�i�ܼ\"\�ȋ��WsSc�\�Z�\�\�nvp���\��]�a�	�P��D\�PP?0l���\�2d�\"��9\�\�`����2�\�d��2���9�,͸\�\�[1\�\�\�\�&035���1L�\�)��\�2��T\�-����RY	��\n%*\n��+PV�@iyJ\�*�V@,.)GQqw����J%\�̸̀��)�L\�lcgk3Z\0I�pS\"@\� @B�@n\r\n\���L���r�VpgQ��;�+()WrgY��6��\n&�PVL�\r2#�X&���W\'�N3cX�ʸ\�\�\�Vf��6\�&\�i\�D���Y\ra��5C#����Դ�g�!#3���\�\�\�BN^��� \�\�CAa\nQ\\\\��\�������\n��\�\��ɘ�q����\�\���V������\r\�l\�aooG{G898\�\�\��.npsu���\'�\�5\�\�;\n\rғ\�I(H\'�\�\�¥�d�r\�D@�	\�\��{;qw\�p7\�6\�p/�`nao/oxzz�\�\�\�\�\�h\�\�\�\�\�prr���\�\�\�`cc+++XXX�\�ܜL�\rL<������EEE(((�\\.Gnn.���������������T��$#)9	�%�h\�\�ߖ����C+\�6�o폀6����\�\�\�4zl$\Z�J�/$� ��}�q\"���\�<���<[:��\'D��\�g\�\�嫗p\��e܈��k1א/�#88�;����֭[s\'\0bLPܹs�;cccq�\�Mܸq�;m\�\�\�>�=�ۣc�N\�ԡZ��\�e��OBA\�\�\�鐄�8\�k�ʲ	=t\��\�7aڻ�p\�\�E\�*H#4\�E\�M���Q\�}�^��<_�\�!!\���]��K�.���k�ei4���ǥK�p�\�EDEF!2*\nv�vx�kB:�@���h\�\�Z\Z\�j\�\n\Z�+%\�$�\r�MHMO���\�\�S\�\�\�AYi���h���B�}�8N�=�\�gOr���\�\�}��E\�޽\�+�}ILLN�>��\'N\�ĉ`%G�\�>��\�\��\�\�\�Z�X��$�.�������\�	\�?���\��Ñ?N`�+\�PVA�А�ȸ����\�ѓ�q\�\�I\Z4C�\���Ѷm[�gw\�\�-9rġCѧW_<\��I<�\�`��p\�>$�\"�\r��BÌ4}�M�l�J���@µT��he4\r�\�M�e�8��\�ŕk�:|8�Űa\� �\�\�uU*�ػw/\�\�#��\�;\�駆\�\�!�:�i �����n6 � n\�\n\�c@W�l�\�\00\��\n\�\�\�rY��\�.ހ7H\�;�9w\Z�\��{�G`Ĉ�\�HN\�\�4L4\��q7�\�كaO�\��a/ⱞ��fL\�V$D��ͮI(h��\�}��\�\\���.^�Ї,�Э�#xyī\�:I�$�R�]?\�\�\�\�~\�^A��8�3���a�\�5w\�؁�\�m\�^\����x\�ѐ\�tc-\n\�\���BBA�!\"��V	\�\�\�`ۮo���\�0t\�PL�8�+H�C�X!\�\�[�o\�>�}�u�{\�\r8:8j�\�fZ\'�\�L��Ҝ���\"\�O=H\�+�\�\�\�\�⫭��u׷�8q\"�M�___C��Ƙ����\�\�c�\�\��\�x{�$8\�;H\�G\�\n���N�P�is,�ŌͱAm���6|���äɓ�\�s�\�\��\0[���\�Wb\�ƍ��\�TLy{��\�\�;	ɅD3�P\�צZ%�\�TrԮ)\�J�k6~��O>�?\\\0����6\Z$�����?^�#�c\�\�w��[�r�P�J$4\�	\rV\�<M=�	�.o��{��l\�2�b��e\�իW�\�P#\�8s\�\�͛kk�7c>|[���%	\�\�_ԞH(�?\�b$�D���\�-\�6�i\���\�.����\�u�6\r6S��\r\�E`\�\�m�t\�rN L�:ՠƮ�\r\��y��\�\�y=r��C\"� *~\�uNBA{�\�\�I\���׋?B�@\n\�\n�����\�B�������\�\"�@ ..S�N���5�.�T�}aH(4!x�؄�B\�v\�\�m,Z>�\�-{\�[��/\�pF\�ه\�(\���yX�\�rne\�U\�Wp���3!]�s[\�.�l!��i��\�\�U�\�\�\�\�e&�5\rs?��7\�N�s\�F@5C�l�\�F�<��\�\�?\�\�\�\�6T�]�i5֮\���+VLd̘;\�\'\�\���\�0��:\�.��\�cFa\��1h\�%K�s\��X�d5�抶\n\�&.R$\�\�?�\�\�YuJ�	�ɳ\'r[\��\"���\n�\�\�\�\�\�{�\���g���Y��\�W8a��Y�r	\'��Շ=?�Q�݂�?\�D\�\�kѸ���٨�i\�E۬��ɏ��q�tR�\Z$�\n\�-��m۶\��\�\�`OdZ���ƍ�\�Wh�Б���O\n�C�\�_���P\��ȣe�l݄�޾ܿ����K(���*���\�&��j��\�u�\\_�D�ۑ���\�\�\��?o\�O?��Ν;l�\�I�@tt4^~\�e�ziƏzCkn�P\�\Zjq;\"����BS�BmS\r	��\�CU��i\�(��;&V\�L�8�\�\����\�\r\�WK���1<t8��	\�\'i�W\nZ�,~\'$\Z��\�(\�&jN!�:�%�cU\�\n�\�e\���\��@Zzj�S�Slz�\�\"���?`?S�B\�b��W�\�\����œ�1�u��-\�4x\�`\�nUGME}�\0\0 \0IDAT$4MX\"�I(�\�L=��\n\�\�CV\�Ц��\�ٹ\�xat(\�\�\�is���u��Y\�5{D`��8v�-��k��_�@Ӏ�0k\�\\�\�\�M$4EVbvI(H+ �\���\�k\�\\�y\r/�	\��\�\�ѽ;�բk�\�\�\�\�H�\�\��\�@���B�}\�	����a\nҊ-\�,�x\�7Ϗ�\�3�qU�t6��˺�\��\�ν\ZABAch�e����\�ABAZ�\�%oV��%�B|��׺\�6��Ao��,��1w\�\Z酄�F�J\�(	iń��]�\�1~\�h\�\�ނ�����M~j�@^^\�b릝\�\�Q�\�H(�T�I(H3.\�P��\�\������2e�:\�\�Z �a\�\�\�{Wm|�$G*M�$��4��\�\�0{�\�\�\�6�	]g`���j\�Zt\�\�MБ�P�t��P�Vlh\�AZ�\�o>X�.��\�ٳg낻\�V�Z�\�/\�E�\�;	AqJ\�	iņ���{�P(оg\0ТE��K��D\�������ŵs�066\�\n����!\nҊ	i\�C\�\��u\�~�}\'��\�\�]m��O�\�\��\��\�\�\�M�A��#�\�S��\�s��ԀA�!!� Ji\"� ��\�ԃ�\�!uo��\\�Vm}���\�k\�\�\�\�b̜9gϞ\�\�ݻX\�{��=\Z;w\�ĨQ�\Z\�[m\�bo�\�w̘1\�ݻw�l3\'O�Ě5k`ii�����{���\\��>�aaaՂ&++���\���܆\\5�\�Gs���\�Oq�V\�\�Y\�\\S\�\�I(�RچH(H;>\����ko����,O>�uP�;77\�>�\��E��\�h8v\�\�f��k�P`�\�ӧcݺuՂ��ӷo_�|�\��=r\�H���Wg>j\�fhǎ	m\��\�\��h\�b\���g��%� Ji\"� \���wD�>�=�\����-[j�0\�֭\�\�\�x�b\�\�:{p~�\�7�?\�4�V\�_�y�f\�\�O�:U�\r\��LX,Y�\�\�O5����\�õ�8q\"��e\�d�\����u��6QPS<��\��`�1�>C\�\�3h\� \�\�\�\�\�?\�|e������\�\��\�D\����\�{�\�\�^�៿�s���`(�m����\�CSҊ�Խ	\�\��<\�\�\�Zw��>��\�\�C��\�\��?Up\�\��nݚ\n�΀�^�p�{��T����9{\��\��B�\�\�g�b\�m�=gΜj�ĵcm6\r�ڏ\��Ss���?�\�	\�\�L���\���{��~����ص�Qsꁍ!<<r�LIa꡴�vv���/ؽBBA0�\�6DBAZ�bFi\�C\�ް����R7U�\0�=ʉ�#F�M;��\��駟��M5��\�>$$䁹}\�\��+\�\��˗/Ǽy�8q�\�b\�\�jj{�[YY=���95���{�\��\�\�F}B�eB�\�I]5\������\n\�-	�PJ\�	iŇ���\�!uo��Q\�\�L,���\�\���7rBaȐ!|\�\�\�\�3??�:�L(��HՃM-�i\r&�~��	������\n���\�\\U(�\\��3\�gT3�	՚�\�j$�}oQFA\�\���?\n\�\n&M=H+R�F\n5\n\�ͦ\0\�ϟ\�M=pU�0\�M\�(\��\�\�\�Q�N� �?�i��Bgjf6� �FA\�\�������C��H\�&�y}6ϧ\�y�P_�_{��y�\�\�V��_�:�P�F�}\�g¡�u��ŚY�kj��Q_턶nrz\�A[���\nzT\Z���\�:\n�\�5ҪB��o=�^��{kbٲe\�z�o\"�o4Ԭ/P}롡�A^�)��k*���ɓ\'�]\�|\���N>kR\�\��w\�u\�zC�7*���M\�z\�	i����{�\�+3�ş��P}�Auڣ�k/�1.Z�Q\�z\�\'	i����{C{=!լ�ȯ\��^�T\�j�\�\�\Z5�0^h\�\n\���9�a����\�LBAZ�\�oh�H]���>\�\�\��\��\�I(H+�4� �xHɛ\����~�\�\�ܺx�f/����X)�K�H���\0V-]����	\��� (N\�\Z#� \�ؐgD��\��́��~�����>f�\�	xz\�`n\�C:��*�\r6`�ރظj�\�`H(�T�I(H3.\�`&Ϛ�}���!ña՗uB�z\�\n\�O\Z�\�\�[���\'xD�#�������غi\':w�\n	��J\� 	iŅ����IHL��o����||��s�l���X�	J���\���.0o��,��1w\�\Z0	�`��Q\nҊ	3J+bx�r\�g\���zt\�\��\�ګ�Ϗ�\�3�aܸqj�������m۰n\�z��S�{H$ԡ�\�גP�V�H(H+\���,^���f`\�\�w\�\���\�kxaL(�?�\�ݻ�ݞ\Z\��\�\�H�\�\��\�@���\Z	����a\nҊM=H+\��f\����h6\��\�\�_\�\�\�\�\����\�\r+p\��1��4\�N����HLLĀ�0k\�\\�Q_H(h�t��P�N,\�\�$0y\�D\�;�g����u,�Cg\�o�\�8x\� \\\\\\\�iJ\�\�0�\�\�L4ßy\�_{C\�#!��q\�\�耄�4\�@^�`1O��KVc\�\�a�Bزuه��pxyy	j��I�@rr2��ǐ�C1a�$�8HBA+�\���1P����MyӜ�Eu|\������\�m�\�\��6L�C?	DGG\�\�^ƨ�\�a�(\�gx�$��~zhT$�h*f�V<4\�\��W���k�1�\��5M��Eu}���w\�[2�\n��\�W�9]/q�����\��+�\�sZ����Vq�\�	�\�\�\�3	i\�CHo�\�����E��uO�\n\��\�B����pF����ۜ��(�A\�\�\�sSW\�:?�u/I(h�8�P�{q��%\�((�\�΢2wW(PR�\�β\n\�J\�PTB�TBY	TVV\����\�1x<��� 3�e2��\�XƝf&ư0�q���1�\��;m\�M�\�\�\��f\�\���5���\��\�Fxv\�p�ճ\�b�;�\�@Aa,}E��[MvG�5H ..S�N���5�.�6\�6\Z\�n\�$D���NI(�ϼ�\\��\�2d�\"��9\�\�\�)*C^QLd2\�X��\�\�V�f\�i\�\�\�073���	\�L�ajjcv\�`,3�Lfĉ�`�A�d\"���P��\\��rJ\�+PZV�\�\�r������;�KQPT�\n��Vfpd��)�L\�lcgk3X���P?\�Mo���W\�x	�,�j\�\n�M\�q-w\�ކ\�\�,ǲ\�\�0u\�\�\�5��$C ,,�\�\�\��3\�a�Hq\�\"� �\�B���P��oai\�\�%Hgg~2�KPZ����\�\�`o[K\�\�Xp����\��\n�\nJ�37��yEȑ!+�\�\�p�����\�\�,\�ngks\�\�dj][�M��p/��]�B,_��z�j�j�EgΜ\����5ޛ1�-��\�{\�]�P=\�q���Yf )�Iy%H\�-Fi�nN6h\�bWG�8Z\�\�\�B;�\�@/�\�d\�\"#�\0�3�]\0sS�,\�moo\'+.AG�h�`��޲B\�5?\��\'�ć.���\nR�\�\�J�G\�\�\�\�j�`����P\�`\�d\�Ѕ���Y��\�\"$dF���=<]\�\�bG;K)�K#�\�ȋ��)GJF.R2�J�\�\�\n~NVh\�b\�\�F\�\�8\�\����\�\�\n�-\�P\�6|���äɓ�\�sh�&�\���g�\'}��Jlڸ�ޚ�)oO��W��q�0m���\�\�\�\�+��\n�\�\�\�ظ\�\�Dv���|\��Y\�$GDO2D���b3\n�Y�ĬB��;���|\��iC?\�tEbZ.\�d#!->\�\��w�F��\rMS\�ssL�={�!j�bs\�\�ܼ\\|�uت�\'NĴi\�\�\�\�\��Զ	�~�zl޼�[]�\��7e�xhL(LYul����>n\�\��\�\�<\\laan��\�r�f\�\�Z\\�<1=���\\�Ɔ\�4�\���\����9�����\�H����3Zy;\�\�\�*5�\"D@\�]VV�)Y����\�IYp��D��\r�\�m)\�P:),6\�\�\�\���]\�b�\�a\�С�0qz�\�\��ԶN�>�-��`߾}�\�\��\�ptplDK�.шP��\�\�h\�\�O�	6o\�\�T\�\�\�&gc���ʷ\�f\�)�\�Y߅½\�\"\\K�#&Ug�����{O�#޼�\�͸�\�%f!\�\�\�=\�\�\�ɪyFu�����U�T`\�\�;���`ee��Ø1c��\��@QQv\�؁�\�m�y\��ⵗFC&�(�1#\\(L]�wG@y��A���߆6g��h\0�Na��\�\���y\�\�P`߂��rq99\�&&j\� ?7��\�\\{\�[UT(q3>7o�CQQ�N^�\�\�\�`P\��`�\�Ϟ6W(����Ϲ\��m\�/`�\\�1#_�aÄݛB�אS{�\�\�\�wcϞ=�t(��\"\�{Y��»N\ni\��Tנ\�oNr�f2��%����>�4/�7�OB��\\��rp�^.���\��\�-\Z�4@\�}9�ƥ\">9][:�[KGX\��z\r�Z�\�\�0s͋�\n�ǁ\��k/�u\��\�><�\r2	�+�J0q���ptl\�	O?5\�	�����ņ�Ba�\'[ʌ��&�\�m�\�h6\�>]����]�}\�ۖ�o��>�\0Rd|\':���s�l�վ\�\Z�EW\�K ��\�1ɸ\Z�Ɖ�\�~�z��_�8l\�pli�E�܆�\��\�у8z�0N�9�A�cȐ�8p ڶm+7E�\�֭[8r\�8�C��O��x�\�x\��pm\�&�_Bv,�P`�	���7{��\�_\���}]~\')k\n\�*\��\�\�u�p�N\�\�\�FǶ\�\�ͭ�H��؊�n$\�ʭT�l\�G[;�\�\0���^}SZ+,\n0,�L�L\�ߧ�\�\�ٓ8}�$7կ_?�\�ח+��/�\Z���+H<y\�$N�86\��Ѿ\��h_<޻�Ng\�b.�P���؂\�\�}?\�\�O\�\�\�?\��\�\�k��6\�\Z�T�7�.���B\�F��ng�\�\�\�;�\�Ɗ2R��Jy5���\�\�\��jO�Đ�\�w\�\�?쓄ORw\�n\���:��\����b\��rt	AH�t\�\�]�t����+6�c||<.]���/\"*2\n�QQ���\�#]Cҹz��D+\�\�M5�3\�H(\�L��種	�ܢ2�\�D�x�K�F\�6��n.V�|�\�]XȀ�.pС�\r�`��q����\���|��\\��1\�p-\�\Z�\�rsgPpкukg�#\�1\�Ν;\���7n\�ƍ\�ikg���\�\�\�uB�]\�¥�&JҶ�B��$c\�)]\n�s�w\�}�\�\�\�m=��<��@�����\�\�-\�\�G�\���?P��ݯ��֍u\�\�ce\�ގAܝ8\�M�\r�E½\�KL���9���\�\�\�OO�����k8;;\�\�\�	���\�{]\�\�\�\�\�\�011����^-T(���@ii)JJJ�W�\0�\�\�\�\�\�Evv6���p?\�>\�\�Ґ�����d$%\'���-}|\�\�\��>~h\�\����\�&�v���Zc�\n*��Qcqj�a]\neJ���b%�xw\�\�\�͎�X���wd,e��`W�I�U*X\�\��_�\�9\�HMKAzF\Z22ӹ匳s�������<\�����\�.,,DqqJJKPVVƉ&\�N�lV&\Z�x033���,-�`mm\�m\�lgk{{{8\�;\�\���[�\�\�\�\rn�\��p���c\�k��OH\Z*ؐ\��Hi��R\n)�\�\�-m[��G�V\'ͻH}�\�_��[w\��t{7x:Hc\�lՂ\�ϖ�İ��\��ZH�\0	�۶K\�)=tBp�@.I�.��P`����\�^�h\����Ҽ\��\�vb�:�A\�\�D/t��E�\�\�Yw	.\nZ\�Yz7�T��pRR��i\�m\�L�~`[^8u]�\�\�8�{�\\�v�۝O\�WX�/���4\".\�JZ7��Bd|6ndbh���4�0�Fp\�e\�w�*�]�\�\�O{�\�\\�\�Gs\�`\���-�`Q�ؒA�&�1��c�m��qIM(�L\�մ�>ёO�\�-�/\�\"MG�����V2�+XņU��2F\�\��U`SW��5�H\� \�\�x�$b\�\�8q;#�\�D(\�\�\�#��l��=�/�_\'�7~q&V�����ޏ�iУ\n�İ!T�\� 4��\�A����\�\ZR\n��\�u.�	nζB��Y�@zV>\'^\�\�W\�ƭ�9e\�;8td?��j7z�<Z\'T*X���K����<%kM*Ba\��{\�\�\�V��Y�d��ݸ���7�0�Gï\�^�q�\�z\�Ϛ�\�v~����uC*Xԁ���:G���΅�iKA(����#<ѓv�kZ��\�\�s�`SY���/�;u\�;\��ߘ�y�\�\�\�H�e?��`�\�/h\�\��hDD@$j����|#\�\"��[�\\6{\�GZ\�WO:[(�\�K�˅d�\r\r�����P�a4�@Yy�GD\�\�n^p���\�ܹ���5o:N:\�}�PT\�\��¤��\��a/�\n�jO\�\'��PhP*fl�\�[(�G��\�\��\�z4o \�Z\�\\�����\�\\��\�\'�Ɠ�a�ȱ\�c?yoN\�\�PPX�Ϩ`Q\�\�\Z�t�P�N,4ꉘB!5�{��clhw����\�.�\��\��\r�.�|�\�\��\�\�8�\�\�w��!\�|\Z\0#\\9{SwN� @BA�$��b\n��\�\�`\�\�	]���\n\�\�Co&#\�~6�s`t/�}�^�熍���OW/E���\�\��˱�\�\�ޭ�\�\"D�h�\0	\�p��U�����k�\�\��\�=`ia*9.\�4��\���10\02���Z���wl\��-�\�\����\�k�p\�<x�{\�\����\��I���O\�\r\�ѳ�W&�1J�\�&\n�7��K(\�e\�Bj>�?\�Im����\�ގ�\���.��\�\n\�A3,���n��w�\�00{\�\\<9`���>\\:/X�����@/���6}�����\�f�DM�\0\0@B�@n��\���:\�!���\�I_8�^	\�W\�\�\�\r\��\�k\���\�~�e\'\�-Y�\�mw\��\�>_�E�������Z�>7�Y�Uw4���rs�0{�L��\0\�z<V\�\�̩��2kAuM\�#��6��\'�<W�����ᗝ\��ןX�b#.��\�\�dN$�j_k����X��3�\�\"{D�\�	�P0�[@,��cT\"B:�����FI�\�GL\�\�-?pߔKJ��|\�l��\�É1�R\n�B>5�HL\�ET��⃾C\�+/�����#��\�����a\�2\�g\��\�Xܾ��;\�\�\�ш\��\'�Z�\�\�FƉ�� �` K(|y\�6^\��֍[��)\�)\nx��;�1\\F�\�\�_o\\��U\�\�\���}\��ǈܷo����V`Úex\�\�\�ܿ�o\�?��\�\�.|(}\�\�̘�*n^��s?\��~����Fį���p\�o���U?Y6�� f�f��Ϡ�2vBu�Du<\�ߓ\�3\n���2P\n\�&�j�hJl\�i�_X�_]��\�\��\�\�(.)\�Է�\�\�\��?Qp\'�\�416A�\��hӪ\���ZR�8]K\ZG��B\�8\��Ub	�\�\�\������Lc3\�\�OK0ЮSW\�A\�\�\�\�=�7�^���\�A{��\�\�\�s��z`?��\�C\��\�c�8z\�>~թ|~`|�����,�\�����~�=/6����\�LN�|�IX�\�\�\�|`\Z�\����o6�\�\�\�\�\�\�h,�\�BJJ|����n*,\�-PZV\n/\�jA\�\�DA� pj\�T�&}\'\�D@�	HA(�\�\�\08�Ϡ\��XB\��71���\Z~cj	jN�\�\�ߜ<�\r|�@5;ѱ\�#\�(0a�?FP�Θ>w\�C�5��-�ј��j]{����\�G}���-_�\�\�~<l|\�P�]��\�3\�c����3�\��\ZMs��7aS��w��ǉs3\�e�49�M��\���\'\0C\0\�\'�R\Z�XBAJ\�bF^(�z}\�C\�~�ù�Ph\�YS�4U(��Y�P`Y��s������\�\�X2oz�zv?�{��j߉�\�\�\�\�\�fx�p�ءn_\�)M\�\�,��\�\�\�سv2�,�п\�\0<^u\�\�\�N��\�Nv�@C� ��/��J,�\�K(�Y����邺j\�\�(0q������oqS5߄P\'��\0;T\�<`�_��P\�B]o~��2��\�⹵\�_|K>d��Q8�}�\Z0FFF���1�}\�z��\�\�}�s\�!0 XӮ�}\"@THE(0�\�\0XY%.R��% �P����\�X���15\n�&\�\�\�\�XC\�\�Y�jU֬Q\�\�\�ptr\�ݺ?\�d�P_��m`�\�U����e\�CŖ�5\n|�#��\��\��փ\�\�i��6����%(//\�\�\r\�O��̘\r���/\�`ll,\�/Y#D\�R\ṉ�\0,�\�)V\�K(���{\��\�^�Ph\��\��\�E|\�V���\Z%շ\n>X��\�k�v\�G\�}�BQaA��\�f��Q\�[\�\r�\'��V�\�����O;�\�I\�{\�A\��!��B/?;t\��S�\��\�\���_�B#�i��ҿՙ&|�[\n�KC��\0\�HM(0���Q%nS��! �P�����!XQ]��\�g��\�7�ޡ\�\�\�rن��\�\0\0 \0IDAT�-k�%��~��!��1���P`\0f_%��JDO;K(\�^zzC	<��{=�:s��Y��?h����Vsb\���w\�\�Ҫ�\�\�\"@\�# U��F1\0\�2��\r��ް\�\�\�\n\�\�=�\�ǆԶ{䀡��\�\�0t\�ص\�\�\�l߂\�{~\�DB�Z�)\Z\�>\'D�aR\n\��%\0��\�\�\�uS(�\�c\�\�t�\r\�N\"�\��a\�\�a��}8\�lX	y��\�g>v��k�\\É�V���, \Z\" u���\�vy	�\�,�k��ޛS(0�\�\�)��vE��zϚ��˷R����\�=hx\'�6^�.����}����\�`׷?�c;ڙT=\�t5P��ք\���GQ\��L�\�\�y\�_�\�\�\0\�xF\�vty��B���\\H\�\�\����P\\�\0G���\�#��b7/�\�Y<Deԛ/c\�ȱxfа\�\�\�+��O\Z\rw7l߼m؟:�\0\��	�ik�EUV↑�\�\��2\�_`\�J��:\�$ �P`��#<ѓ���>���\�[���@߀���=?\�\�߇�y\�7\�\�Q#1ꭑذ�K$�&a\�W\�Ϻvꦷ�h`D@lZ\nSW\�(6뉉SW\�\�6��\�=\�N\�;\0\�kǫb�ӵ�� ��\�\�C�7�[�\�\ZB�W`7\�\�\�\�$�\�Q�\���%\�\�+�E\"+;�	\��\�\r�\��\�/\�?aѲ��X\�ӫ���9\"@���k��\0�rB\�\��e��:�lK\�\�\��\�\�W�c\�XV�>�^K�Z*B!#��\�%`ē�\�\�L\��\�-����=�/㵞�p��\�w̄��;�\���ǿ�\�#\�>�\��\�?1qƛ�X�$\�N\Z\�=E\�\��\n��\���d\�\�պ���]�a\��\�5\���R\n,1ir���͉+\�\�\�n̂�RN$�k\�@w�����?1�����)��\�Sj�����\�\�\��\��\���I\"\�x\Z\n\\]*��\�|\�\��\�5G\'�hB\��l���U?b�RJB��\�½\\M+@\�ainj�Q1�a��#\�\�tp�A����p?�>Z�\�^\���t�\'&�5\r\�G�\�h\�t! �ИPP�K�˅f\�+��\�~�\�0�]?�	\�md|6ndbh���4�\�9��\�2\�;~��\�\�\�礑\�\�ݎńo\��З0e\�t��AF���ЈP��.�N�мz\0l�ףU�IZ�\Z=^)\n>�p1)C�����u�\�C\��̜B8u]�\�\�\�$4e��驘8\�\r�\�\�\�\�d�\�A�@s.ԭ?P��Z\�\\%~��90���T�c~#U�C\�\��T�@��a\�C�\�N\�\�_gb0���=\Z�Ib\����Xh\�*\0/X.�I�A��\�Ba\�cQ��.�ά�\0�	aM[_������\�`��F���KY(0�Sr���Z:ڶvC��U��\�\�\�\�í;\�x��<��<�6\�WYY\�\�,X[[c\�\'\�\�%�A����B�1u	u��歯�̲\�\�\�4\�:\0az�fJ\�B�\r��B�C72P�\�\�{[\�>X����\� ��_��#\�`)�\�\�D&\Z��LGaa>�\\�\rdF\��!\Z\0\�4��`B��K��9Y���h��\nEp�XX\n\�f�ѫ\� x\��s�w\�}�\�\�\�m\\�_���������3\��x<���8Hb�.��\�wc���o`k��\�I�� D(L_{��\�\��\����^��2d\����\�c{Ҳ\�\�\0;\��A_�\�%��b�[T�㱙(Q�vi�\�.�{35S���\�\�B�p����\�d�l\�r�>w�\�$@�~?�\�! �PhJ]B]\��\nͬW`��\0�$\�\�y�kB�\'\�\nO\�΂���w��Ļ�\�\�-�y5���\�\�\�Yk�MA�\�u�5�gnG\�L�)��!h�P��.Mݻ�V\�\�|�J,�\�v96\�઎YW�?��w�p\�n6:��@�`oZ�I74[<\�$\\�������hk\�xceۮo���\\\�m&%��\\�<�f	!\�\�\�,4�^��\\%�\08(�hh\�A]\nMI���9ܪ��\�\�9\��ִ�o�ZM\��\":&W\�Ҹ5��9\�\�\�X\�n4�?\�L�Y����h�P�.�.\�\�+0�U\�L,7��VW�?�\�r\'.\�˅��:�{��\�0h�\�N�/\�ոT\�\'g�kKN$X\�@PeD�Ii��!��B�\�BAȺ���\n�\�+0�l��g�%x\�C��?\�\�J :)���`lb��6n�s����\�]���B���\�y;��\nt�Ggo\��\r�H�I5̈� M\n\�4���}���J,\\lT\�zt�>\n\��\�\�.µT9bR\���q���+Zyif?=�-\�\�\�\�l\�%d .1�vh\�a��NVz9t\�LJ/\�J���\�BA�]\�v��](\�4�V՞,�p]Ͷ:}��>8\�\n%n�\�\�fz\�\�\�h\�\�V\�\���t֛o���Yv&>%w��p;)nv�r�A��-L���\"\�LJw\�\�\��U\�>�UV��nN�\�9P�W�`d�l\�\��\��\�S���f��w��&E(������\�,DbV!|\�\�\�\�	>\�p�U��_�Ĵ\\\�K\�FBZ.|��\�\�b�\0WX��\�\�}-������4g+;\'�i)H\�HCFf:233������\�\�\�A����\����%�%(++CEE\n�����\�666���	\�\�\�`anKK+n\�nk\�\�\�\�\�\����prp���\\]\�\�\�\�έ�\�\�H�ǆ���PhȠ�|>���i�d�Yn\Z�PP\�2\rw3�]���\"��t����������/�#/[)%#)y@%\�\�l?\'+�r�6�\�AC�D��TC�\��<O��\�\�1����	�����{	���\0ssx{y\�\�\���pwwG\�pvv���`ggXYY�\�\�\�\�\�(`\�?�h`⡴�%%%(**BAA\�r9rss������,\�ϸ���4���\"%%I\�I(-)EK_��􅯏Z���k�	�����\�\��*X(\���#�\�B�\���!�P�ߜ�2$e!)�ɹ\�(-W\�\�\�-\\l\�\�h\�mymgm������lk猜\�\�\�Gzv\�Me�r�������\�(�����I\�`\�\'l\�:\ZK\�~\�}\\�z	W�_ƍ�k�s\r�r9����3(8hݺ5w2 ��ŝ;w�3667o\�č7�\�\�\�\�\�#8�=:�\�N���K�]\�z��,\�%\0��Z��\�I(\��MS�\�K�\�\��2d䗠�\\g{+8\�Y��ފ�����\�NS�\�\r(�P ���;\�4Bn^r\�E\�\�+���1\\m-\�fk7;�\�Y\�tBs~\��ͤ6���Kq\��0��	wp>\���\�\�ߋQ�\�\�\�=$!\�CеkWt\�\�~~~:�.>>�.]\�ŋ�Ȩ(\�\�\�ᑮ!\�\�=Bz��/ۏP�C\n,���\��\Zn\n\�G�-�UX���R\��#��,�WT�6Vf��4���wZZ�r+F����\�\�f�\�055�	�?5��Xf�\�聇���TVB��D�B�\n�\�\�\n��+PZ^�Ҳ\n��K\�QT\\Ɲť((*C�R	{+3.3\�hi\nG+S8ۘ\�\�\�L\�@R?:\�iQ��\�\�oakc��N%\�KQQ!�>}�Ξ\�\�\'�\�~���o��\�ݻ7%\�0�\�\�\�\��\�\�8y\�$N�8V\��Ѿ\��h_<޻?����\�HBVH(��/\0����b#�+$ŉ\�2�K\�QPZ��Ee\n\�,�P��\\ɝe\n�\�vV(�PBY	���?\�7U�`,��\�؈�`���1,Le\�iib+��Ns\�e�\�L����T�i\�\�7�ʸ����\�ѓ�q\�\�I\Z4C�\���Ѷ-��i\�ǭ[�p\�\�8p�D�^}�D\�\'�\��\�\�\�M/\��P�_�\�ZU���U	鄔Uq/\\:K,窲\�>�\r[\�\�\�\�\�L�e�8��\�ŕk�:|8�Űa\� �\��\�M�#�J%�\�݋��D���c�Nx��axvH�Ng\ZH(<xG|�U��\�\�E�\�H(H\'2_l\\��?G\�3\�\��&�p\�\��fRl\�\�.��\�\�j��Ϲ\��m\�/ػ?#F��\�WFr‎�`�a����g\�{:\�{��\�\�4c\"�\"��0�]\0ʪ^�14\�vMBAX�M�Ʋ	=t\��\�7aڻ�p\�\�E\�*4�\��q3)�R�]?\�\�\�\�~\�^A��8�3���a�\�5w\�؁�\�m\�^\����x\�ѐ\�tc��\n���4@�\n��%��(\0���c\0L�%�g�Su\�\0k\0\�\0p�	xU\�7���M\�X2\0�#�U��P�J\�,����p�@Zz*\�\�<(� �\�4\�}\�L*\'7,K���\�0t\�PL�8�+H�C�X!\�\�[�o\�>�}�u�{\�\r8:8j�\�fZo�PP\�VUL4\�)	6�}\0\�Vqlθ$і���a\�	\�?���\��Ñ?N`�+\�PVA�Ш\�.o&������n\�\�]\�b\�ĉ�6m\Z|}}\�f@\r�G !!\�ׯ\�\�͛1��7���Ip�wh�Q\r�n�P�p�ʇ�\0�6�Q�P�]�X\�f4\0��`;�~�0�K\r�|ւ\�ssU����0a\�\��Y�OF�\�\�\�\�\��\��\0Q\0\�\���%��5\�uv\�g>[��\�=�p-\�/�CY�C\�$\�fRf��\�oO\��\�\�±\�u\��u&M��wߝ\�-gL��ز՟��6nĤ��b\�\�,�/���BAݩ�\�?M\�`��\0���L,dU�̈0a��QP�\n�W%\�R\�캆���YI:L1���	qCWXX���e�[��V\�w\'�\�*�?v\����AjBﱷoa\�7�B\�K�2Az\��!�\�\�5?\��\'�ć.���OFKM4I 11�G\�\�\�\�r\�\�R9�!\���8��s_�,Bm5L�ԖQ8����3:L,�^%x���u$����\��.D��O��\�<XV�[\�G���{\�F\\\�Z\�]ʛI%܋\�gk����˗/C�^��D��i*�3g\�`޼����\�{3\�÷��+[jJ(�bF�͟-�\�~\Z���S\�3�M�fFAuz�\�}�*\�0Y���6�\�\�b\��\�\�U%�X\�\�@\�v$ĤO}\�;)n&�s�6|�f9\'�Ne�\�ҡK\�\�\�0\�|�7sF�\'�\�P`ߚ\�\0�m�����0�\r��o=�\�fK%�f\n\�\�(�S5�N=0\�,���_��	��|`��\�{;��ҩ����\�\�O=H\�+�9�\�L\�\rX[ۊ��+�]��}�\",l=����3,j+\"���8L�:\rV\�\�X�\�S\�^�\�/\nT\��Y�CUa \��\�ҝ���j�\���^\�ey�}��F��\�\��VϿ�\��\�V=a�,c�i��n�v\0�X\n\�+\���&��62�6\��5\�	���I�-̤\�ͤ\��\�܅�0z\�(,\\�\�eU�\�N��.Y�;w|�KVsӔ\�>T\\�9-����g�p`\�Ƽ�p�J�\Z?��g\0ؿ���M\0��\0�C���\��c&�iV\0�j\�s\0vUk7hC(0_�Ve\��,{�	i�����\�!�7bl&\�\n\�-��m۶\��\�zHdOd���ƍ�\�Wh�БVflZ��\0�\�4\�mEBA��ꍦ\Z\"���Wo&��[n�-M[��\���\r?��:w\�ɮȶ������K/c\�K\�0~��^\�%�\�����l͆�\�NK\n\�q���=?c\�{K`a��i\��V\�[�lfN��֭\�4\�H\�\�4Hh�\0��\�?c\�\�¿M�F�߲uه��pxy�YY:��@rr2��ǐ�C1a�$���B�0�)V\�\�j/\��d\n\�F\���׋?B�6�\�L����\�8x\� -�d@�[�i���\�ZY싄B�o�Ъ\�&�7ߜf,�Ph\�;woc\���X<o\�C\��\�}\�\�ه\�(\���yX�\�rne\�U\�Wp���3!]����K>[�\�ځ\���ظj3���\�䷦a�\�\�	xn\��f(�\r�ݨ�ǀ�v\�g X�|?k?\�P\�vݦ\�X�b\�\�\�3�1c\�dL�4��q	hb3��\"�z\�\n;~�P7���\�h\Z\�\0fM��aC\�cHs	aؾ`KUf\�0&��BB�~��C�=�U��p�<{\"n\�\\���]U(Lg&~߻\��=˵g�?_�q�\�e+�pBaȈ�P}\��S5\�-��Nd\\��{I	����^�}�x�M~�u�Kػ��5����I]�y\r/�	\��\�\�ѽ;	�\��\�\�k\"##ѿ��#\�\�kl�$�C\�v\�d\�\�\�\�E\�\�\nc��B\�\��\��\�W�E�)z<��\�	xE\��\�\��\�!�l��\"�9�\�qE@tE>EA�ADD>�AAE`@�-$@BB6Ȟܛ\�&��Z:�KIn\�}o�\��cnթs~�/����j\�Fļq\�\�8\��r��\n��\�Y�\�\�65�&\��d�a٥|nn�D�;�VZC@�än�83g=\"��g16�˲�\��źͪ��PP\�\���\n�pTY\�\�F��ވB[�BSS-	�\�\�\�Z��i�(�\�;b�\��aR\���tİ�啥/�\�R�w\�y\�֦�\��N�\no7?<1\�)U\"�PP�\�+U�#Ă\�tJ�B�uih\�\Z���B\�)��`\�3��d\�+Қ1B ��J\��y9MNYXO=�\�	�Ay����kZ�[-\�j8Lj�m6�(���L��\�\�\n\n\�RH�ŁJJJ��\�kV�CR�\���BAq���\�\0�\\b�K�\n\�RК�1Ua��P,r\�\�%�\��\�\�\�B�e\�\��f?�D�P�o\�bF墢%{���y�&\�\�ߚ�\�\�i�q\�<��í�\�:\"�\�ob\�\�mX�D,�S�P((\�\�ښ�\�	j1�p^�nZg�B�u�\�U�.ً����\�0���c�\�YHKK\�vP�\�a�䅥\�\�Glt�\\�PP�eS�\�\�\�\�!\�\�\�y\�\n���Ǿ�����\�Ho\�ä�����\�̹�\�S\�`�\�~�=[X���	,Y�����\�\�\r�+\nʱ�����S3�X�Q���{�Pp����P\�V>�\�Ms�IY,��2\�ر�ܥ\Z$p\�\�9\�\�\�\�\�/�pssS\�C\n\�P6k\�\�\0���}��c/\n�\"\�t��z\�V>�\�\�\�I�I\'O�4����\�/\�\�믷k\�U��0�\�x�\�G1l\�0\�}�8��E\r�F�Ɲ��Q׏V\�<��b([4���\�Z��t\n��\�	�C\��ävIbA>Lj\�kХ{�|�Iu:����;\�C��o�q�0 ?\�w\�ލO?�=z�h�}�v\�\�\�`���\0\�<�-Z��0q�\��>�\�sX�bE\�\�Z\�@�U�d]\�q\�\�>�lK͛���\�G׮]u/b^z\�%�>��g�\�&M5�PPe��@�\"tW�j+X�BAA�4E*�Im��ϰz\�{H蚈	So\�s\�c\�ȑ��,�3g\�DHH,X\� \�\�\�ϟ���\",[��]B�)\�\�*����\�<g\n\�|�\r���\0\�\��L�{�BA1��6�1�J\0����)���	N=(\�IM��V�c�$�}?~��\'t\�\�Y�h\��\���\��\�\�\�Ǟ={���ň��_�cƌ��#���㏸\�k�\�G��\�\�RiDA1��z�j\�\�]�va\�СQ�ۋ:<��E�r𲨹�Ph\�?\�\�ĉ%S\�G1J�o߾�߭[������\��mN�:�\�\\����Xj\'b0`@�q	�B|̛7O\�=��$�̙3�����\�\��li\�l]\n\�P\�dh�|\0\�Ԫ�)\�O��\\̨T\'4)&UYU���2xyy��,\��Nlٲ�\�\�.FƏ/M\r�СCIDL�4I��x����)1}!\�\��\�a�\�k��\�!M\r1 ��[Q\�q*�<R D�x(���O\'4\'\���K�B\�ڿ���K�/�\�����9�`퓵\r\�D,�\rч\��׿�զ��$���\n��AH=�ޖ\�M��PP�͆��&6ٳ�e\ZP(���M(T�\�d�\�ä\�k�jY(�i�PoQ\�}�]\�\�=gΜ�\�Y�)�~h[?\�\Z��+\�\�!)?�\�uBl\�!\�ۺu\�Ek\Z\Z?�\���Z� �>4\�Mm\�#\�/[��� ��(��K�j-6\�\�]c\�...\�8��X�\n���ِ��\0\��\�\�lnmc\n��\\�S*v2��\�QZZb�1r�r\�J�1\�\�\�Ґ�C=�3fHt!��*K�31�o�x��Pضm\�E�\���H(\�\�r\�\�S\��͍(XO]\�6\�)y�B���\�S�!p\�h�,��K�jXOs�X\��G�\�\����X�\�\�aR�EH��\ZZ\Z&\�	\\=j�\�\�(�p��qlܸQZ_ �={�l\"ض�(��}y��50\��ň�&-��ВP�\�_�\�\�h툂<� �Q�\n�Hj\�m\�!0\�,\\��&]\�\�\�\0`�/,R\�\r\n�\�\�.	�O�^o=X�k\r\"##���E��ͭQ0�L\r\��[� O��\�S\�kă\�z}���fK#\n����B8��ZOmȾ�wSS�\Z\n9^Q��P�X�Q��K���P�\�\Z�����\�Q=\�\\YX`�\ZNP(�A�\�69�\�vvFli�}d�\�\�\�{\�BB\�\�־� �$��\�\�Ҥ\�-E�~\�A�o���z꠩i������:b�y\�A�m=Uޕ\�\0\0 \0IDATU lO�>�a\�\�\r�7d�\�7D=q���7)\�\�y:Cn�߫}�r�	;\�~\�bAl��BiW(�&\�>{\\\�\�>~Fk\�;3\Z-g���;3:�����\�X\�\��C\�n)��\�~[\n\�gh$<\��H\�n{�<\�\�\��ֲ���x�F)\�)�\"��N=(\�\�HVxz���ݶXyzd۸\�Րba\Z�*��i�G\�����=w\�\�R\�{\�4���D,ya)�����\�GAQ��\Z~A,\�`S{-S(�� ۓ�\�	<4{\Zn7F\�Ր��	�7H�lކ�K\�V��\�H58\�X\�\�Jl\�B�F`*W\�ԃʀ�\��\�c�a\��HM=��� \'��a\�J�����ݱf\�:$��\�\�\�-֧Ph�\�+$_�~baG[��Ph+9u\�q1�:\\�`���/�\�R�w\�y\�\�2\�V�:u*�\���Ĭ�ZQ\��*\n�3sD1� Ɠ�X\�\�(\�BM�6\n\�5�\�\'�\�\�Y�\��{\�1B���|��-]�/\�mV���jh7<	�8~M���Z�P�����9��._g�~���eR2v\�؁A�9{��\��\�݋\�Ç\�_n\�e={�ƉBA5���*Nip#����@�`-\�%\�ؼu^��g\�ЩS\'\�;L%����\�_�\�~\�Ɗj�\n��zlղ<�\�#�Z\�	�BkI�	\����\�a\���m۷Ig&���8c\�\�1���`ʄ�T�BAuĪt0��b\�lkz�Ph\r%�\�\�ԃ�X;{Oo�Y��\�~���6\"&F\�\�\�Ξ=��\�\�1���0m\�t��J�`̪t��?_��8\�R\n-�\�\�\\\�h_\�\�\�ۚ�\�\�G�}�~�O\�$\�$ ����\�q�m�`\�\�\�$\�)�}?-0\�\�\�Bys�P(h+\�\n\�ʇ3x�\�\�_\�\�O@����曝!$\�`E\��/��\�rY<\�$�I��h�B�`?\�j��2��\�Bͥ:�PP\�\�r\�m\�تy��O\�{\'ݍy�\���X�p!\�}�^Y�:��\�\�QQ(\��*.�\0\�&\nU�\�(	\�@yE9\��$LUX�b9\�?\r,z$����3���^�������C��\�\�[\0\�\�Ҕu�(�FI@�\�}�^~c1-^�3\�\�R,z\"�b\�\n<��3x�ѧ1�\�n�E���;�e_\�\�\r\�\�U)Z�g\�\Z�z�\'m\���q&//]��\�\n,^�W]u�qa\�$��Y~\�~�۬g\�9\�\�S(8<�;�1�J\0�Z[�PP�s�r1c�𱱍\�B\�7V��F�ĳ\�\�\�M6�Gu��\��Ͽ�o���>4\�\����B�w���\�\0 ��r\�\n�OBs=R(h+F�\�\�,êwV`�CaΜǹI�/6Oz�\�װj\�JL�:\�/�\�\�V�P\�V>��\�\�\0R\�F)�D��-(��AyU�t��-\�e�����N��k-��\�IW����:\�\����سm\r����\0n��pws����ty���\�\�U�|\�\�\�\���\�\�\�.]\���tS6(Z3�\�b�c\�*�]x\�<�\�#���3D\�Z\n2##˗/\�\�ի�\�\�2�A�Zr��\nM�E�<\0l��\�(lgZYcAAE5\nʫPd�A��E�j���\�\�\�\n_O��x�\�\�S�|\�\�\�\�^�\���p���<<\�\�\�&.W����\�\�Er���N��z\�J��\Z�k,���EUu-\�U50W\��d���rs\�Mը��C��\'B\�\�\�_��{!\�\�\��g\�X-���������\��q\�M7a\�\�0t\�PcAp@�?��#\�^�6��\�+L�\�^\�3\�>��8��\�wI�\�zVz�)ޥbổ�\�?{\�}\�\�1��\\QU�\�\�J䉫�\Z�e���� ,\�!���Ep�����\�\�\��\�ZJ\�+���̌\��JM((1�\�\�\r\�ވ�DD�7\"�\�\�\�n�\�D_\�\�,X�\�:|�\�\����Ŕ{\���I���Y�!`2��\�b\��@�|\�\�wa\�m\�\�\��GZ!�Bk(黎8)fk�5�_�|�\�n�E#Y�&d�T\�l�U5u��G\��G�?��H�YJ+*q���E\�8w�y�\���pEL�b��\�+�D���5��~�_l���l\�-�܂;\�\�ƍ#�6ؼy3>�\�Slذ\�nL\�\�\�n\�\�W\�oԆB��7�Κ\�Dw\�u\��aڔ���:�}\�u�\�W �Є�\�D�!:<Q\�Ӿtк�Ԍ��\�\�/Fv~	Pą�\">\�]:�Ik#XH@0�*�[7a\�כ�ۑCH?\�\�\'K��Օ�ɥ�:q�q\�&lڸ��\�G�\���M����no.\nݦ\�6\�N�{�{_/\�}�JsbF(b:!5�i\�+�YP��\�`t�E�\�`i\Z�\�ELWd\�\�Lv!2r�\�)\�	��\�\�i\n�\�V�\�\�\�\�\�m\�w;����wb�\�1;vn�\�t\�\�\��N�8�o��[�n\��\�\�p\�U\�0b\�H�\Z1\�#����S��\� \�b\�\�\�\�`�0s�c�\�ֻ[n�\�\Zb\�\�xn�\�#�Ԍn�a\���\�0X�!\�ad\�\\_�g\�tVNf \"\�=#�\�32�#\r\�וu1\����;�k�N��{�����\�k1\�\�a\�B\�=z\�*��8���� q\�;�\�?@|w��k�\�uC�\�z\�\�R<(\�r�谍�\�Ñc�1i\�]�;g>nI�U��4\��B�\�\"%�	��.1�N��9}�i�H\�,@��@�\nD\�P.n�w�\�\�\�Sس\�\�;��=��e�4p \Z�����_�~��w�΂m嘞��_������w\�>\��1�\�`x%�\�um�yݴ�P\�M�\�\��\�\�91��҂\�0nlr�;��P���q\�l	\�\�\�ѳ[z\�G�ݝs�J����\�\��p�d,��\������Q\n��\�9w���=�c)Gp$\�\�JKѫW/\�\�٫\'ѵkW\���w\�!G\�\�\�\�\�q\�\�)\�JMM\��c\�q\�\�1\�\nD\��ѫGo\\~Y�Iꇎ::Y\�Z�B�eFNQ��>\n���$�,�|�m��~��b4\�X��L�)F|L(��\�1PW1\�\�ٜs�8������\�\�9:����5\�1�v�����\'S�v*\r�3N\"#3g2p&3^\�^���Ett�����\��\�\�P#00P\�uMoooxyy�\�\�nn��\�B�ł\�\�ZTUU���RzQ�\�\�R���8����\�\�\�Av�Yd�\�BUe:w�C\\\�8\�u�G��nH蚀\�n=dWVZ\�BA��Qد�6\\s�bda\�\�KskZ/b��\�E�HHJ�D\�1��Һ\�N\�_YE��\�\�\\I,�\�ON�e�TXT��\�l\�\�\�\"�|\�vƅ\�(*)BII	J\�J �ͮ���\�lBeU%���%Q āؼLlZ&D������򆏏/����c�������I\�V�w�@Dx$�\"�\Z\�)ʖ�M�\�!\'��R;3�\�\�\�~\0k\�^�!��\�l��O\��Ӆ��{�v@dq,�c\��cY�\�D�\��!]\�\�{7!�w:5\0;L�`\'Ў-�7o݄\'�����\�c@\�+\�\�E�\�)Ů�\��AIq��\����\�T���3��S�k���W����#�C\�!@�\�z:j\�\�Y6}�E�-�\�\��w�$�GVl�Ǝ\����\�\"m�Ģmb3�ݿ���+0<����F\�H��(Z	J\�\�Z\n\"��?�\�\�zC\ZYH\�渍T~\�,\���\�pU\�x�\��w���\��l�|0\�%vD�N\�<\r\�pIa�$\�\n퀧���\n\"q�\��\�ޕĂX	l\�R][�\�\��a���� \�hO���URf\��{\�\�\�\n�\�O���(_\Z#{�P�\'m�\�Z� \\|{\�*|�\�?��!\"\�#\�\�uv�[�\�{\�N\�l�>ى��>���pc\�Ds\�l���P�\0���L5i\�� X�z)�}�Ez\"$X\�ׇĂ\�\�G�0\�\�։+\�5y�é����\���,�\���MI�Q(E\�\��\�*�{K��q\�~*�|&m��U��\�\\&\�\�\�đ\�[wE�\� i\� ��P\�O�\�\�i[��\��\�%\�K۱��!Ć&J��\�8�_���\'�\�\�SIӴ�A\�\�j|�\�0z��aP���T\Z�.��n	P(\�6u�9\�V� zy\�\�g�~\�4֬Zg[�\�\�#	�sˑ<\�rn��U\��4m�\�7$E�sdA�颇$ �P0ȍ\�� =�\�	`�\�w\�M,%�?�,\�-#�p�v\�ԟ�Aӆo\�\�n�\�\��1��Azl4\n\�x{���4��Y\�>\�\�_]\�fj�eUX�K�$\"\�\�l�\r�M ��L��Cx\0w\�\�w6齳�Pp�_�O	� L=2g:�<��ڢ���ܺ=g�\�3��D��=9�c��p�x&\�\�ΓUF\�(�1�MĤ�P��ͼ\�:b���m��3�\�]\�1\�J\�\��h�ì�:�\�~9��ZK\�z_\�H�m(\�\�Mw��\n\"�)ލ.q]1��\�[\�\"���\�?�\�\�\�\�\�\��r��4I���k7\�íb\�I\�	�\0��A\�\0��Bmm\r&M��>I}�\�cs[���`6�c\�ѧ{T�uY�X�\�AvV>\��\�\�\�<�\�\n�d��~*-�;�\nL�v��\�f̹��9%fl>��\�Ƀ\��;+����b\\R���ͳ�\�q\�\0��~sg�\�j\�@Qq!&M�cG�	3�\�jҧmGs\�1�{\�\�\�3+���\�gQr�c.�\�\�\"\�!\�HI��(\�\�P\�\n\"�ܼL~`n���ʃ񨫯\�\�oSq\������\�+:i\�\�\Z��qfݐW�;�I�.I�B� 7��BA <��!�,\�7\�~\�3\�\��i�\�؟S��#���\�ܿ\�\'��\�X��C��ЫK\��;�QH�7\�\��I@�(��|R[(�SO��\�,̚�\��n)�)��\��\�:��}M�>��Y\�\�\��#�.\���7\�\"�/�t��Ҍe�,�mwߋ.\�z4Y���\0��������0,{u!濸\�p�b\�\�L\��bx�p�&���\0	4K�B� 7�=��@y\�\�o\�\�s\�\�\�-ɷ\�}�ط+:E랴\n\�?�xv\�\��\�!�ਖ਼�9g\�%�@K�[���n��\�~��[�}O\�΁��N�$fH\nI�������\�����.A�\�e�ut�\��ަ��1X<o6�|\�D\�NZ���8.����.�\�Cpg�\�gwN�&�\�\�\�r�O־-��lf�FN���ڞ3\�\�eU�|�<xm7g�1��\��Pp�T6�=���d�ޟ�5��\r\�o\n77WݓnJ(X����\0\�=5K\��X\Z]��,*��$(\"\"���cs�\�\�/ /7�\"1�ɦ.�zB���t�\�R��>�	��jz�\�bd$�G\nz\�Z|��P.~�\�?\�S�����c\�5�\�\Z�S�-n�\�z\��eW\�(���\�\�\�a�\�/`\�\�\�(�hg=*a�FA\�E���\'�Rh��\�-[�s\����![�\0	�F�BA5�\�2\�� ��u\n�\�j�Q�β,\��x�?��\�n�a׏Ƽ\�˰�\�\�TCKBA��\�9\�\�Q\�ֿ�d\n�%\��\�S�QhI(df���\Z�����B�){\�rs���d�q8\ng\�\�%\�q�Pp���\n�\�4X�K\��\�\r\��Ǧ\�(X�(4gO,�\�{\�[z\� �wV\nΚ\�Fq9J(8\�>\n�_�lN(�\�\�t��փ�v��	\Z��\�\���c����\�Z(4g\�nc\�\�Yd\�H�B��\�DL�\nܙ\� 7�argF \�	�@�BA�Z4\�(����x7h\�\'�����\�#�	P(\�^p�Pxyz�An�v�\�\�#\��MI@e\n*֊yG\n��36\�\�\�\�AZ�A?4F`\���� �/\�\�Z�C\�&@�\�n��0\�H� m<��\�\�p�\��`�\�n�\�AvV>\����[�\�H��(Z\�J\�5-�J+������<�\�fI\�#P]S����\�\�1��V\�0-�\0	(F�BA1�\�6\�h� \�\�L=�rw�����a\�;��\��ŰĎv\��\0	\�F�B�6^���� \�\�sI=cѫK�nY\�qe;��\�ǳ0qpge\�\n	��*(T��=�Z\n�eUX�Kn\�a\�E�\�B ���9�	W\�!<@�G�\�\Z;!�Ppx{w�� \�N\�-\�\'%�\�\�ˇ��\�G�Wn��Dµ\�B\�#2\�\�\� �P(\�ђP\���)\�\�\�r$��>^\�\�4W\�`\�w�!)\�:�	��P(\� IJ��5� bڛ^�c��ix�}<��64L�\�\\��vF�p?�հ�t�H��\0��A\�-\nyd\�@V	\�^s:��$\��|Q�\�:���AI0^��\�	P(\�<��u_�BA�,�ۏ\�a\�U=ЭSXkCb=�8�Y��N�\�\�\"\�+�kt�6�I\r(r3hY(�d��\�H�w��\�$�.\�,�\�\�gp\�Tn\��\�`n\�\�,ye\�\"@�`�|k](�4T\�\�a��|�\�\�% (��ޞ%ef|�7\r>��\�^\��tw\�k(��O�B� ������_3��}\�9\\\�7}�s��ݢOd\�\�\�.�#�u\n֛���H�\n�\�z\n\"%Ŧj\�H=�\�:`H�.�\���m�ߪ9\�K��\�\��v�\'v@�/\�d\�z\�\�	��\0�Bk(9A�	�X\�\�d:EcPR7h\�\�(6P\�{8�9Ÿ�[,j0Gt�\�C�B�=�t\�V�BAF��T~9]�˻Ga@�XnҤ�{Ol���X~;��+��bHW�����\�P�\0��\�H�iP\�BAP���`oz���cRB$���A�����WVQ��)gq8-W\�aP|�=\�\�\��#�\n;�vt7\� d�\�\Z�$�)F|L(��ՑkԾ\�rΕ\�pZ\�\��\�`I$�P ����I�\�(��8\�LBA&V_\�*ơ�%pswG\�n\�w���\�MU[[�\�\�y8~2�\�Z�	B\�\�`��(\�\r�\0	h�\0��\���{\�(�ٜ)4\�HN)RrJ�\�)	q\�\�\��\�z��>[���|�e�GT zG�s�o[ͱ	���	P(\�8y��\�\�BAfQc�\��\�2\�+G^�\�b\�\�%6�\�a�+��F�Τg\�tVNf \"\�=#�\�32\0n\�,ɖ\�\Z뒀��Pp��^\"�\��+�j��_���\�,�@\\d0:G��Sd0��\�#�\�\�\�\�-ƙ\�Bd\��S�:�!1\�~^\��f0L ��P(�D\�I>7�P�N�i8}�\�&d�\0 :<\�\��\�fN!�ο]tQ�bS�\��bd\�\0�@\\�/\�C}ѥ�G�\�\�0H@i\nJը=��\�i)2U#�Є��J�-6�����\�\�!\0\�!�ґׁ~\�\Z\�f\�n�VTB\�_T�s\�ːWX/W\�� 6\����\�Ή-�d\r P(\�&�Ph>\�b�\"��y\�*�F~Y%�j,�EH�/��|�\� o\��pw��5���WJ��F(.1��Ԅ��<\�\���\0ODz#2Л\�	��3LP�\0��\�D5j�B��Ĉ\r�\n*�QP^�\"S\r�\�5#%�j���\�\�\��>^���.oi\�H/Owxy�\�\�\�\rnpw�+\�\\]\�\�\��w\�\�\�QWWK]=j-u��XPScAu�U5�����\�\�\\Y��Z�\�\�U(7U���A��\�\�@��B|=\�\�0?On�d{�قH\�(rkP((�hs�e�5(���.S�E�̵T\�\�IWu�bm��j-Bԡ�\�@.B4��\0n��pws�\�	�\�\�\�\r\��\�\�\�\�_\�\�//w\�\n�\�\��\Z\�R�5 -�P\�bVT��BA�4I$@ @�`�$�)�h�I$@\n�PP�V\�Q(h53�H��M�BA\��Q\�;\n\�P\�	�\0	�\0��A\�M�`�D3L P�\0��\�@�j�BA���_$@$�m\n\�Ώb\�Q((���H�H�P(�n\n�$�a�\0	��\�(�Us\nZ\��\" m�P\�v~�BA1�4D$@�\"@�`�tS($\��H�&@��0P���P\�jf\�	�\0	h�\0����w\n���! 0\n���B� �f�$@$�0\n��j\���V3C�H�H@\�(��ż�PP%\r�\0	���P($\�\nI4\�$ �	P((T�\�(���E$@\�&@��\��(\���b(i�H�E�B� \�P0H�&	�\0	(L�BAa�Z5G��\�\�\�/ \�6\nm\�G1\�(CIC$@$`(\nI7��A\�0I�H@a\n\nժ9\n�f�~�\0	���	P(h;?�yG��J\Z\" C�P0H�)�h�I$@\n�PP�V\�Q(h53�H��M�BA\��Q\�;\n\�P\�	�\0	�\0��A\�M�`�D3L P�\0��\�@�j�BA���_$@$�m\n\�Ώb\�Q((���H�H�P(�n\n�$�a�\0	��\�(�Us\nZ\��\" m�P\�v~�BA1�4D$@�\"@�`�tS($\��H�&@��0P���P\�jf\�	�\0	h�\0����w\n���! 0\n���B� �f�$@$�0\n��j\���V3C�H�H@\�(��ż�PP%\r�\0	���P($\�\nI4\�$ �	P((�ݳ\0\0\0�IDATT�\�(���E$@\�&@��\��(\���b(i�H�E�B� \�P0H�&	�\0	(L�BAa�Z5G��\�\�\�/ \�6\nm\�G1\�(CIC$@$`(\nI7��A\�0I�H@a\n\nժ9\n�f�~�\0	���	P(h;?�yG��J\Z\" C�P0H��P0H��H�H@a�7\�k����\0\0\0\0IEND�B`�',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(319,'2020/2021','2021-01-13 16:13:49','2021-01-13 00:00:00',318,2,'ziad',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `inscription_en_ligne` VALUES (322,'meknes','meknes','idk',2018,'2021-01-04 00:00:00','meknes','meknes','D549596','emile','wail','Wail','HOMME','emile','homan','Homan','M5895959','Bien','MA','meknes','2021-01-13 16:49:42',0),(320,'anfa','casablanca','pc',2018,'1999-01-11 00:00:00','casablanca','casablanca','BK1576555','hassan 2','sedki','youssef','HOMME','tazi2','Yooussef','sedki','R13598568','Trés bien','MA','CASA,Anfa','2021-01-13 16:42:58',0),(321,'TADLA AZILAL','BENI MELLAL','BIOF PC',2017,'1999-06-12 00:00:00','casablanca','Beni mellal','VA155564','JNAN TAHR','خالد','ouztato','HOMME','HASSAN 2','نعيمي','ilias ','M13008415','Bien','MA','casablanca','2021-01-13 16:47:34',0),(317,'meknes','meknes','math',2017,'1998-04-01 00:00:00','Meknes','Midelt','220','Bachelor','oussama','Oussama','HOMME','la rource bleu','boussif','Boussif','M12345678','Trés bien','BR','midelt','2021-01-13 16:13:49',3),(293,'meknes','midelt','pc',2010,'2000-05-30 00:00:00','Midelt','Midelt','VA18764668','hassan 2','حمزة','Hamza','HOMME','hassan 2','ايت عبد الوهاب','Ait abdelouahab','M158996','Bien','MA','midelt','2021-01-12 20:28:33',0),(292,'meknes','midelt','sm',2018,'2000-05-24 00:00:00','midelt','Midelt','VA123154','my rachid','خالد','Khalid','HOMME','my rachid','نعيمي','Naimi','M12001648','Trés bien','MA','midelt','2021-01-12 20:25:01',3);
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
INSERT INTO `module` VALUES (1,'algebre 1',1,NULL),(2,'analyse 1',1,NULL),(3,'analyse 2 ',1,NULL),(4,'java 1',1,NULL),(5,'algorithmmique 1',1,NULL),(6,'algebre 2',2,NULL),(7,'analyse 3',2,NULL),(8,'analyse 4',2,NULL),(9,'java 2',2,NULL),(10,'informatique',2,NULL),(11,'analyse numérique 1',3,NULL),(12,'probabilité',3,NULL),(13,'genie logiciel 1',3,NULL),(14,'genie logiciel 2',3,NULL),(15,'base de données',3,NULL),(16,'analyse numérique 2',4,NULL),(17,'statistiques',4,NULL),(18,'c++',4,NULL),(19,'projet 1',4,NULL),(20,'algorithmique 2',4,NULL),(21,'architecture des ordinateurs',5,NULL),(22,'Systeme d\'exploiatation',5,NULL),(23,'projet 2',5,NULL),(24,'jee',5,NULL),(25,'reseau',5,NULL);
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
