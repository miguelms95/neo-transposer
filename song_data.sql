-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: transposer
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id_book` int unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(50) NOT NULL,
  `details` varchar(100) NOT NULL,
  `chord_printer` varchar(50) NOT NULL,
  `locale` char(2) NOT NULL,
  `song_count` smallint unsigned NOT NULL COMMENT 'Total # of songs that should be present. For management purposes only.',
  PRIMARY KEY (`id_book`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Kiswahili','Tanzania - Kenya 2003','Swahili','sw',227);
INSERT INTO `book` VALUES (2,'Español','Madrid 2023','Spanish','es',228);
INSERT INTO `book` VALUES (3,'English','London 2013','English','en',234);
INSERT INTO `book` VALUES (4,'Português','Brasilia 2017','Spanish','pt',231);
INSERT INTO `book` VALUES (5,'Italiano','Roma 2020','Italian','it',236);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song` (
  `id_song` int unsigned NOT NULL AUTO_INCREMENT,
  `id_book` int unsigned NOT NULL,
  `page` int unsigned DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `lowest_note` char(3) NOT NULL,
  `highest_note` char(3) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `first_chord_is_tone` tinyint(1) DEFAULT '0',
  `people_lowest_note` char(3) DEFAULT NULL,
  `people_highest_note` char(3) DEFAULT NULL,
  `artistic_adjustment` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_song`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=1205 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` (`id_song`, `id_book`, `page`, `title`, `lowest_note`, `highest_note`, `slug`, `first_chord_is_tone`, `people_lowest_note`, `people_highest_note`, `artistic_adjustment`) VALUES
(125,	1,	273,	'Mbele yake wote uficha uso: Wimbo wa 4 wa Mtumishi wa Yahweh',	'C2',	'G3',	'mbele-yake-wote-uficha-uso-wimbo-wa-4-wa-mtumishi-wa-yahweh',	1,	NULL,	NULL,	NULL),
(124,	1,	95,	'Yuaja Bwana amejivika adhama',	'E2',	'A#2',	'yuaja-bwana-amejivika-adhama',	1,	'E2',	'A#2',	NULL),
(123,	1,	46,	'Nani atatutenga',	'D2',	'D3',	'nani-atatutenga',	1,	NULL,	NULL,	NULL),
(120,	1,	2,	'Litania ya Penitensia',	'E2',	'D3',	'litania-ya-penitensia',	1,	NULL,	NULL,	NULL),
(122,	1,	32,	'Safari i ngumu',	'E2',	'E3',	'safari-i-ngumu',	1,	NULL,	NULL,	NULL),
(119,	1,	1,	'Litania fupi ya Penitensia',	'E2',	'D3',	'litania-fupi-ya-penitensia',	1,	NULL,	NULL,	NULL),
(26,	2,	223,	'No hay en Él parecer (Cuarto canto del Siervo de Yahveh)',	'C2',	'G3',	'no-hay-en-el-parecer-cuarto-canto-del-siervo-de-yahveh',	1,	'C2',	'D3',	NULL),
(27,	2,	36,	'Amén, Amén, Amén',	'C2',	'A3',	'amen-amen-amen',	1,	'C2',	'A3',	NULL),
(28,	2,	25,	'A ti, Señor, levanto mi alma',	'A1',	'E3',	'a-ti-señor-levanto-mi-alma',	1,	'A1',	'D3',	NULL),
(29,	2,	44,	'Bendice, alma mía, a Yahveh',	'E2',	'D3',	'bendice-alma-mia-a-yahveh',	1,	'E2',	'A2',	NULL),
(30,	1,	4,	'Utukufu kwa Mungu juu mbinguni',	'D2',	'E3',	'utukufu-kwa-mungu-juu-mbinguni',	1,	NULL,	NULL,	NULL),
(31,	1,	5,	'Yu Mtakatifu (Wakati wa Kwaresima)',	'B1',	'C3',	'yu-mtakatifu-wakati-wa-kwaresima',	1,	NULL,	NULL,	NULL),
(32,	1,	5,	'Mtakatifu (Mwakani)',	'G1',	'B2',	'mtakatifu-mwakani',	1,	NULL,	NULL,	NULL),
(33,	1,	6,	'Mtakatifu ndiye Bwana - Mtakatifu wa Vibanda (Wakati wa Majilio)',	'F2',	'G3',	'mtakatifu-ndiye-bwana-mtakatifu-wa-vibanda-wakati-wa-majilio',	1,	NULL,	NULL,	NULL),
(34,	1,	6,	'Mtakatifu, Mtakatifu - Hosanna ya Matawi (wa Wakati wa Pasaka)',	'D2',	'G3',	'mtakatifu-mtakatifu-hosanna-ya-matawi-wa-wakati-wa-pasaka',	1,	NULL,	NULL,	NULL),
(35,	1,	7,	'Mtakatifu (1983)',	'A1',	'G3',	'mtakatifu-1983',	1,	NULL,	NULL,	NULL),
(36,	1,	7,	'Mtakatifu, Mtakatifu (1988)',	'E2',	'D3',	'mtakatifu-mtakatifu-1988',	1,	NULL,	NULL,	NULL),
(37,	1,	24,	'Wimbo wa Katikati (1)',	'A1',	'B2',	'wimbo-wa-katikati-1',	1,	NULL,	NULL,	NULL),
(38,	1,	24,	'Wimbo wa Katikati (2)',	'B1',	'D3',	'wimbo-wa-katikati-2',	1,	NULL,	NULL,	NULL),
(39,	1,	26,	'Aleluya ya Pasaka',	'A1',	'D3',	'aleluya-ya-pasaka',	1,	NULL,	NULL,	NULL),
(40,	1,	26,	'Aleluya kwa Shangilio la Injili (1)',	'A1',	'B2',	'aleluya-kwa-shangilio-la-injili-1',	1,	NULL,	NULL,	NULL),
(41,	1,	26,	'Aleluya kwa Shangilio la Injili (2)',	'D2',	'B3',	'aleluya-kwa-shangilio-la-injili-2',	1,	NULL,	NULL,	NULL),
(42,	1,	31,	'Amefufuka',	'E2',	'D3',	'amefufuka',	1,	NULL,	NULL,	NULL),
(43,	1,	32,	'Kwako we, Mji wa Mungu',	'E2',	'E3',	'kwako-we-mji-wa-mungu',	1,	NULL,	NULL,	NULL),
(44,	1,	35,	'Yahweh u Mungu wangu',	'D2',	'D3',	'yahweh-u-mungu-wangu',	1,	NULL,	NULL,	NULL),
(45,	1,	37,	'Tazama ilivyo vema',	'E2',	'E3',	'tazama-ilivyo-vema',	1,	NULL,	NULL,	NULL),
(46,	1,	37,	'Jinsi ilivyo vema na kupendeza',	'E2',	'F3',	'jinsi-ilivyo-vema-na-kupendeza',	1,	NULL,	NULL,	NULL),
(47,	1,	38,	'Tazameni ilivyo vema, onjeni ulivyo mtamu',	'A1',	'C3',	'tazameni-ilivyo-vema-onjeni-ulivyo-mtamu',	1,	NULL,	NULL,	NULL),
(48,	1,	39,	'Asante Yahweh',	'D2',	'F#3',	'asante-yahweh',	1,	NULL,	NULL,	NULL),
(49,	1,	40,	'Wimbo wa vijana watatu katika tanuru',	'E2',	'C3',	'wimbo-wa-vijana-watatu-katika-tanuru',	1,	NULL,	NULL,	NULL),
(50,	1,	41,	'Wimbo wa vijana watatu katika tanuru (Sehemu ya pili)',	'D2',	'D3',	'wimbo-wa-vijana-watatu-katika-tanuru-sehemu-ya-pili',	1,	NULL,	NULL,	NULL),
(51,	1,	43,	'Aleluya, msifuni Mungu',	'A2',	'D3',	'aleluya-msifuni-mungu',	0,	NULL,	NULL,	NULL),
(52,	1,	44,	'Evenu Shalom Alehem',	'D2',	'D3',	'evenu-shalom-alehem-swahili',	1,	NULL,	NULL,	NULL),
(53,	1,	45,	'Aleluya, umekuja Ufalme',	'D2',	'B2',	'aleluya-umekuja-ufalme',	1,	NULL,	NULL,	NULL),
(54,	1,	47,	'Wimbo wa Bikira Maria',	'E2',	'E3',	'wimbo-wa-bikira-maria',	0,	NULL,	NULL,	NULL),
(55,	1,	48,	'Nitatwaa na kuinua kikombe cha wokovu',	'A1',	'B2',	'nitatwaa-na-kuinua-kikombe-cha-wokovu',	1,	NULL,	NULL,	NULL),
(56,	1,	49,	'Wakati Bwana alirejeza',	'B1',	'B2',	'wakati-bwana-alirejeza',	1,	NULL,	NULL,	NULL),
(57,	1,	50,	'Wimbo wa Zakaria',	'E2',	'D3',	'wimbo-wa-zakaria',	1,	NULL,	NULL,	NULL),
(58,	1,	51,	'Ee mauti, u wapi ushindi wako?',	'A1',	'G2',	'ee-mauti-u-wapi-ushindi-wako',	0,	NULL,	NULL,	NULL),
(59,	1,	52,	'Enyi mbingu, dondokeni toka juu',	'E2',	'D3',	'enyi-mbingu-dondokeni-toka-juu',	1,	NULL,	NULL,	NULL),
(60,	1,	53,	'Pentekoste',	'A1',	'C#3',	'pentekoste',	1,	NULL,	NULL,	NULL),
(61,	1,	54,	'Njoo, Mwana wa Mtu',	'E2',	'D#3',	'njoo-mwana-wa-mtu',	0,	NULL,	NULL,	NULL),
(62,	1,	55,	'Abrahamu',	'A1',	'D3',	'abrahamu',	1,	NULL,	NULL,	NULL),
(63,	1,	57,	'Mwaliko wa Pasaka',	'D2',	'E3',	'mwaliko-wa-pasaka',	1,	NULL,	NULL,	NULL),
(64,	1,	57,	'Msifuni Bwana watu wote wa dunia',	'E2',	'E3',	'msifuni-bwana-watu-wote-wa-dunia',	1,	NULL,	NULL,	NULL),
(65,	1,	59,	'Enyi malango inueni vichwa vyenu',	'D2',	'C#3',	'enyi-malango-inueni-vichwa-vyenu',	1,	NULL,	NULL,	NULL),
(66,	1,	62,	'Nihurumie, ee Mungu',	'E2',	'C3',	'nihurumie-ee-mungu',	1,	NULL,	NULL,	NULL),
(67,	1,	63,	'Nihurumie Bwana, nihurumie',	'D2',	'C3',	'nihurumie-bwana-nihurumie',	1,	NULL,	NULL,	NULL),
(68,	1,	64,	'Wimbo wa kujishusha kwake Yesu - Tenzi ya kenosis',	'D#2',	'D#3',	'wimbo-wa-kujishusha-kwake-yesu-tenzi-ya-kenosis',	1,	NULL,	NULL,	NULL),
(69,	1,	66,	'Maria, mdogo Maria',	'D2',	'F#3',	'maria-mdogo-maria',	1,	NULL,	NULL,	NULL),
(70,	1,	67,	'Nainua macho kwa milima',	'G2',	'G3',	'nainua-macho-kwa-milima',	1,	NULL,	NULL,	NULL),
(71,	1,	68,	'Ikiwa leo mwasikia sauti yake',	'E2',	'E3',	'ikiwa-leo-mwasikia-sauti-yake',	1,	NULL,	NULL,	NULL),
(72,	1,	74,	'Amen, amen, amen',	'A1',	'F#3',	'amen-amen-amen-swahili',	1,	NULL,	NULL,	NULL),
(73,	1,	76,	'Kwa upendo wa ndugu zangu',	'A1',	'B2',	'kwa-upendo-wa-ndugu-zangu',	1,	NULL,	NULL,	NULL),
(74,	1,	77,	'Nilingojea, nilingojea Bwana',	'C1',	'C2',	'nilingojea-nilingojea-bwana',	1,	NULL,	NULL,	NULL),
(75,	1,	78,	'Nataka kuimba',	'E2',	'C#3',	'nataka-kuimba',	1,	NULL,	NULL,	NULL),
(76,	1,	81,	'Imbeni kwa furaha',	'E2',	'D3',	'imbeni-kwa-furaha',	1,	NULL,	NULL,	NULL),
(77,	1,	82,	'Niamkapo, nishibishwe kwa sura yako, ee Bwana',	'D2',	'D3',	'niamkapo-nishibishwe-kwa-sura-yako-ee-bwana',	1,	NULL,	NULL,	NULL),
(78,	1,	84,	'Sitakufa',	'D2',	'D3',	'sitakufa',	1,	NULL,	NULL,	NULL),
(79,	1,	86,	'Waambieni waliovunjika moyo',	'A1',	'F3',	'waambieni-waliovunjika-moyo',	1,	NULL,	NULL,	NULL),
(80,	1,	87,	'Ee Mungu, u Mungu wangu',	'E2',	'E3',	'ee-mungu-u-mungu-wangu',	1,	NULL,	NULL,	NULL),
(81,	1,	90,	'Mbele ya malaika',	'B1',	'A2',	'mbele-ya-malaika',	1,	NULL,	NULL,	NULL),
(82,	1,	92,	'Mwimbie Yahweh, Yerusalemu',	'D2',	'B2',	'mwimbie-yahweh-yerusalemu',	1,	'D2',	'B2',	NULL),
(83,	1,	93,	'Nafsi yangu imbariki Bwana (Wimbo wa Tobiti)',	'G1',	'C3',	'nafsi-yangu-imbariki-bwana-wimbo-wa-tobiti',	1,	NULL,	NULL,	NULL),
(84,	1,	94,	'Maskani yako yapendeza kama nini',	'G2',	'G3',	'maskani-yako-yapendeza-kama-nini',	1,	NULL,	NULL,	NULL),
(85,	1,	95,	'Siku ya pumziko',	'B1',	'C3',	'siku-ya-pumziko',	1,	NULL,	NULL,	NULL),
(86,	1,	102,	'Bwana atangaza habari',	'D2',	'E3',	'bwana-atangaza-habari',	1,	NULL,	NULL,	NULL),
(87,	1,	104,	'Binti za Yerusalemu (Utenzi wa mazishi)',	'E2',	'E3',	'binti-za-yerusalemu-utenzi-wa-mazishi',	1,	NULL,	NULL,	NULL),
(88,	1,	110,	'Mbarikiwa Maria',	'C2',	'D3',	'mbarikiwa-maria',	1,	NULL,	NULL,	NULL),
(89,	1,	110,	'Salaam, malkia wa Mbingu',	'G#2',	'E3',	'salaam-malkia-wa-mbingu',	1,	NULL,	NULL,	NULL),
(90,	1,	112,	'Maria, nyumba ya baraka',	'B1',	'D3',	'maria-nyumba-ya-baraka',	1,	NULL,	NULL,	NULL),
(91,	1,	113,	'Nitamhimidi Bwana kila wakati',	'F2',	'F3',	'nitamhimidi-bwana-kila-wakati',	1,	NULL,	NULL,	NULL),
(92,	1,	117,	'Wewe u mzuri',	'B1',	'G#3',	'wewe-u-mzuri',	1,	NULL,	NULL,	NULL),
(93,	1,	123,	'Chipukizi latoka shinani mwa Yese',	'G2',	'E3',	'chipukizi-latoka-shinani-mwa-yese',	1,	NULL,	NULL,	NULL),
(94,	1,	128,	'Utukufu (Nakuja kukusanya)',	'B1',	'E3',	'utukufu-nakuja-kukusanya',	1,	NULL,	NULL,	NULL),
(95,	1,	129,	'Furahini wenye haki katika Bwana',	'D2',	'E3',	'furahini-wenye-haki-katika-bwana',	1,	NULL,	NULL,	NULL),
(96,	1,	134,	'Utanijulisha njia ya uzima',	'F2',	'G3',	'utanijulisha-njia-ya-uzima',	1,	NULL,	NULL,	NULL),
(97,	1,	135,	'Nendeni kutangazia ndugu zangu',	'A1',	'E3',	'nendeni-kutangazia-ndugu-zangu',	1,	NULL,	NULL,	NULL),
(98,	1,	137,	'Ee Bwana, sikiliza sala yangu',	'A2',	'D3',	'ee-bwana-sikiliza-sala-yangu',	0,	NULL,	NULL,	NULL),
(99,	1,	206,	'Naona mbingu wazi',	'B1',	'E3',	'naona-mbingu-wazi',	0,	NULL,	NULL,	NULL),
(100,	1,	212,	'Mbarikiwa awe Mungu',	'F#2',	'F#3',	'mbarikiwa-awe-mungu',	1,	NULL,	NULL,	NULL),
(101,	1,	217,	'Nataka kuenda Yerusalemu',	'D2',	'G3',	'nataka-kuenda-yerusalemu',	0,	NULL,	NULL,	NULL),
(102,	1,	219,	'Utenzi wa Msalaba Mtukufu',	'B1',	'F#3',	'utenzi-wa-msalaba-mtukufu',	1,	NULL,	NULL,	NULL),
(103,	1,	263,	'Kwa kuwa Mungu',	'C#2',	'E3',	'kwa-kuwa-mungu',	1,	NULL,	NULL,	NULL),
(104,	1,	264,	'Kama wahukumiwa kifo',	'G2',	'E3',	'kama-wahukumiwa-kifo',	1,	NULL,	NULL,	NULL),
(105,	1,	267,	'Anibusu kwa busu za kinywa chake',	'C#2',	'E3',	'anibusu-kwa-busu-za-kinywa-chake',	1,	NULL,	NULL,	NULL),
(106,	1,	269,	'Njoo toka Lebanoni',	'D2',	'B2',	'njoo-toka-lebanoni',	1,	NULL,	NULL,	NULL),
(107,	1,	272,	'Kondoo jike wa Mungu',	'G2',	'D3',	'kondoo-jike-wa-mungu',	1,	NULL,	NULL,	NULL),
(108,	1,	274,	'Wimbo wa Mwana Kondoo',	'A1',	'D3',	'wimbo-wa-mwana-kondoo',	1,	NULL,	NULL,	NULL),
(109,	1,	275,	'Nani huyu apandaye toka jangwa',	'A1',	'D3',	'nani-huyu-apandaye-toka-jangwa',	1,	NULL,	NULL,	NULL),
(110,	1,	279,	'Ee Yesu, mpendwa wangu',	'A1',	'A2',	'ee-yesu-mpendwa-wangu',	1,	NULL,	NULL,	NULL),
(111,	1,	280,	'Nitwae mbinguni',	'B1',	'D#3',	'nitwae-mbinguni',	1,	NULL,	NULL,	NULL),
(112,	1,	282,	'Ishara kuu',	'C2',	'E3',	'ishara-kuu',	1,	NULL,	NULL,	NULL),
(113,	1,	283,	'Nanyosha mikono',	'E2',	'E3',	'nanyosha-mikono',	1,	NULL,	NULL,	NULL),
(126,	1,	8,	'Sala kuu ya Ekaristi II (1)',	'G1',	'D3',	'sala-kuu-ya-ekaristi-ii-1',	0,	NULL,	NULL,	NULL),
(118,	1,	NULL,	'Get Lucky',	'E2',	'F#3',	'get-lucky',	1,	NULL,	NULL,	NULL),
(127,	1,	24,	'Shangilio kwa mshumaa wa Usiku wa Pasaka',	'D2',	'A2',	'shangilio-kwa-mshumaa-wa-usiku-wa-pasaka',	1,	NULL,	NULL,	NULL),
(128,	1,	27,	'Sala ya waumini (1)',	'E2',	'B2',	'sala-ya-waumini',	1,	NULL,	NULL,	NULL),
(129,	1,	42,	'Msifuni Bwana kutoka Mbinguni',	'C#2',	'A2',	'msifuni-bwana-kutoka-mbinguni',	1,	NULL,	NULL,	NULL),
(130,	1,	70,	'Dayenu',	'D2',	'E3',	'dayenu-swahili',	1,	NULL,	NULL,	NULL),
(131,	1,	71,	'Tenzi ya Pasaka',	'C2',	'C3',	'tenzi-ya-pasaka',	1,	NULL,	NULL,	NULL),
(132,	1,	71,	'Kwa kafara ya Pasaka',	'E1',	'A#2',	'kwa-kafara-ya-pasaka',	1,	NULL,	NULL,	NULL),
(133,	1,	80,	'Kama ayala aioneavyo shauku',	'B1',	'E3',	'kama-ayala-aioneavyo-shauku',	1,	NULL,	NULL,	NULL),
(134,	1,	103,	'Mbarikini Bwana',	'G1',	'D3',	'mbarikini-bwana',	0,	NULL,	NULL,	NULL),
(135,	1,	109,	'Ee Bwana Mungu wetu',	'B1',	'G3',	'ee-bwana-mungu-wetu',	1,	NULL,	NULL,	NULL),
(136,	1,	125,	'Ninakuita',	'G2',	'F#3',	'ninakuita',	1,	NULL,	NULL,	NULL),
(137,	1,	221,	'Kwenye milima mitakatifu (Mama, Mama, Mji wa Mungu)',	'A1',	'C3',	'kwenye-milima-mitakatifu-mama-mama-mji-wa-mungu',	1,	NULL,	NULL,	NULL),
(140,	1,	222,	'Akeda',	'A1',	'E3',	'akeda',	1,	NULL,	NULL,	NULL),
(141,	1,	284,	'Homilia ya Pasaka ya Melitoni wa Sardi',	'D2',	'G3',	'homilia-ya-pasaka-ya-melitoni-wa-sardi',	1,	NULL,	NULL,	NULL),
(142,	1,	NULL,	'Zakayo',	'E2',	'F3',	'zakayo',	1,	NULL,	NULL,	NULL),
(143,	1,	NULL,	'Resurrexit',	'A1',	'D3',	'resurrexit-swahili',	1,	NULL,	NULL,	NULL),
(144,	1,	12,	'Mbiu ya Pasaka',	'G1',	'D3',	'mbiu-ya-pasaka',	1,	NULL,	NULL,	NULL),
(145,	2,	21,	'A la víctima Pascual',	'E1',	'B2',	'a-la-victima-pascual',	1,	'G#1',	'B2',	NULL),
(146,	2,	22,	'A nadie demos ocasión de tropiezo',	'E2',	'E3',	'a-nadie-demos-ocasion-de-tropiezo',	1,	'E2',	'E3',	NULL),
(148,	2,	27,	'Abraham',	'A1',	'D3',	'abraham',	1,	'G#2',	'D3',	NULL),
(149,	2,	28,	'Aclamad al Señor',	'C2',	'G3',	'aclamad-al-señor',	1,	'C2',	'A2',	NULL),
(150,	2,	29,	'Al despertar',	'E2',	'E3',	'al-despertar',	1,	'F#2',	'D3',	NULL),
(151,	2,	30,	'Alabad al Señor en el cielo',	'C#2',	'A2',	'alabad-al-señor-en-el-cielo',	1,	'E2',	'A2',	NULL),
(152,	2,	32,	'Aleluya, alabad al Señor',	'A2',	'D3',	'aleluya-alabad-al-señor',	0,	'A2',	'D3',	NULL),
(153,	2,	33,	'Aleluya, bendecid al Señor [sin melisma]',	'G1',	'D3',	'aleluya-bendecid-al-señor-sin-melisma',	0,	'G1',	'D3',	NULL),
(154,	2,	34,	'Aleluya, ya llegó el Reino',	'G2',	'E3',	'aleluya-ya-llego-el-reino',	1,	'G2',	'E3',	NULL),
(155,	2,	35,	'Alzaos puertas',	'D2',	'C#3',	'alzaos-puertas',	0,	'D2',	'C3',	NULL),
(156,	2,	37,	'Amo al Señor',	'A1',	'D3',	'amo-al-señor',	1,	'D2',	'D3',	NULL),
(157,	2,	38,	'Aquedah',	'A1',	'E3',	'aquedah',	1,	'E2',	'C3',	NULL),
(158,	2,	40,	'Ave María II (1984)',	'E2',	'E3',	'ave-maria-ii-1984',	1,	'E2',	'E3',	NULL),
(159,	2,	42,	'Balaam [sin segunda voz que sube en el estribillo]',	'G1',	'B2',	'balaam',	1,	'D2',	'B2',	NULL),
(326,	2,	51,	'Canto de Moisés',	'F2',	'G3',	'canto-de-moises',	1,	'G2',	'F3',	NULL),
(160,	2,	43,	'Bendeciré al Señor en todo tiempo',	'F2',	'F3',	'bendecire-al-señor-en-todo-tiempo',	1,	'F2',	'F3',	NULL),
(161,	2,	45,	'Bendita eres tú, María',	'C2',	'D3',	'bendita-eres-tu-maria',	1,	'C2',	'D3',	NULL),
(163,	2,	46,	'Bendito eres, Señor',	'E2',	'D3',	'bendito-eres-señor',	1,	'E2',	'D3',	NULL),
(164,	2,	47,	'Benedictus',	'C#2',	'C3',	'benedictus',	1,	'D2',	'A2',	NULL),
(165,	2,	49,	'Cantad al Señor',	'D2',	'E3',	'cantad-al-señor',	1,	'D2',	'D3',	NULL),
(166,	2,	50,	'Cántico de los tres jóvenes',	'D2',	'C3',	'cantico-de-los-tres-jovenes',	1,	'D2',	'C3',	NULL),
(167,	2,	52,	'Caritas Christi urget nos',	'E2',	'G3',	'caritas-christi-urget-nos',	1,	'E2',	'E3',	NULL),
(168,	2,	53,	'Cómo es maravilloso',	'E2',	'E3',	'como-es-maravilloso',	1,	'E2',	'E3',	NULL),
(169,	2,	54,	'Como la cierva',	'B1',	'E3',	'como-la-cierva',	1,	'D#2',	'C#3',	NULL),
(170,	2,	56,	'Cuando el Señor',	'B1',	'B2',	'cuando-el-señor',	1,	'B1',	'B2',	NULL),
(171,	2,	58,	'Dayenú',	'D2',	'E3',	'dayenu',	1,	'D2',	'E3',	NULL),
(172,	2,	60,	'De profundis [sin melisma]',	'A1',	'A2',	'de-profundis',	1,	'A1',	'E2',	NULL),
(173,	2,	61,	'Decidle a los de corazón cansado',	'A1',	'F3',	'decidle-a-los-de-corazon-cansado',	1,	'C2',	'F3',	NULL),
(174,	2,	62,	'Delante de los ángeles',	'A1',	'A2',	'delante-de-los-angeles',	1,	'A1',	'A2',	NULL),
(175,	2,	63,	'Día de reposo',	'B1',	'C3',	'dia-de-reposo',	1,	'B1',	'B2',	NULL),
(176,	2,	64,	'Dice el Señor a mi Señor',	'D#2',	'D#3',	'dice-el-señor-a-mi-señor',	1,	'D#2',	'B2',	NULL),
(177,	2,	65,	'Dichoso el hombre',	'D2',	'D3',	'dichoso-el-hombre',	1,	'D2',	'C3',	NULL),
(178,	2,	67,	'El pueblo que caminaba en las tinieblas',	'G1',	'B2',	'el-pueblo-que-caminaba-en-las-tinieblas',	1,	'A1',	'B2',	NULL),
(179,	2,	68,	'El Señor anuncia una noticia',	'D2',	'E3',	'el-señor-anuncia-una-noticia',	1,	'D2',	'B2',	NULL),
(180,	2,	69,	'El Señor es mi pastor',	'G1',	'D3',	'el-señor-es-mi-pastor',	1,	'C2',	'B2',	NULL),
(181,	2,	70,	'Elí, Elí, lamá sabactaní',	'F#2',	'F#3',	'eli-eli-lama-sabactani',	1,	'A2',	'E3',	NULL),
(182,	2,	71,	'En medio de aquel gentío',	'E2',	'D3',	'en-medio-de-aquel-gentio',	1,	'E2',	'A2',	NULL),
(183,	2,	72,	'Eres hermoso',	'B1',	'G#3',	'eres-hermoso',	1,	'B1',	'C#3',	NULL),
(184,	2,	74,	'Carmen 63 (Están rotas mis ataduras)',	'E2',	'F#3',	'estan-rotas-mis-ataduras',	0,	'E2',	'F#3',	NULL),
(185,	2,	75,	'Este es el día en que actuó el Señor',	'E2',	'G3',	'este-es-el-dia-en-que-actuo-el-señor',	1,	'G2',	'G3',	NULL),
(186,	2,	76,	'Este es el mandamiento mío',	'A1',	'E3',	'este-es-el-mandamiento-mio',	1,	'B1',	'E3',	NULL),
(188,	2,	77,	'Evenu Shalom Alehem',	'A1',	'D3',	'evenu-shalom-alehem',	1,	'D2',	'D3',	NULL),
(189,	2,	78,	'Exultad, justos, en el Señor',	'D2',	'E3',	'exultad-justos-en-el-señor',	1,	'D2',	'B2',	NULL),
(190,	2,	80,	'Gracias a Yahveh',	'D2',	'F#3',	'gracias-a-yahveh',	1,	'D2',	'E3',	NULL),
(191,	2,	81,	'Gritad jubilosos',	'D2',	'D3',	'gritad-jubilosos',	1,	'F2',	'C3',	NULL),
(192,	2,	82,	'Hacia ti, morada santa',	'E2',	'F3',	'hacia-ti-morada-santa',	1,	'E2',	'E3',	NULL),
(193,	2,	84,	'He aquí que vengo presto',	'E2',	'F#3',	'he-aqui-que-vengo-presto',	0,	'E2',	'F#3',	NULL),
(194,	2,	85,	'He esperado en el Señor',	'C2',	'B2',	'he-esperado-en-el-señor',	1,	'C2',	'B2',	NULL),
(195,	2,	86,	'Hijas de Jerusalén',	'E2',	'E3',	'hijas-de-jerusalen',	1,	'G2',	'D3',	NULL),
(196,	2,	87,	'Himno a Cristo Luz',	'D2',	'E3',	'himno-a-cristo-luz',	1,	'E2',	'E3',	NULL),
(197,	2,	88,	'Himno a la Kenosis',	'D2',	'E3',	'himno-a-la-kenosis',	1,	'F#2',	'B2',	NULL),
(198,	2,	91,	'Himno de Pascua',	'A1',	'A2',	'himno-de-pascua',	1,	'A1',	'A2',	NULL),
(199,	2,	92,	'Id y anunciad a mis hermanos',	'A1',	'E3',	'id-y-anunciad-a-mis-hermanos',	1,	'E2',	'E3',	NULL),
(200,	2,	93,	'Improperios',	'B1',	'F#3',	'improperios',	1,	'E2',	'F#3',	NULL),
(201,	2,	94,	'Jerusalén reconstruida',	'D2',	'G3',	'jerusalen-reconstruida',	1,	'G2',	'E3',	NULL),
(202,	2,	95,	'La marcha es dura',	'B1',	'B2',	'la-marcha-es-dura',	1,	'B1',	'B2',	NULL),
(203,	2,	97,	'La siega de las naciones',	'C#2',	'D3',	'la-siega-de-las-naciones',	1,	'D2',	'D3',	NULL),
(204,	2,	98,	'Levanto mis ojos a los montes',	'G2',	'G3',	'levanto-mis-ojos-a-los-montes',	1,	'G2',	'G3',	NULL),
(205,	2,	99,	'Llegue hasta tu presencia mi clamor',	'D2',	'B2',	'llegue-hasta-tu-presencia-mi-clamor',	1,	'E2',	'B2',	NULL),
(206,	2,	100,	'Llévame al cielo',	'B1',	'G#3',	'llevame-al-cielo',	1,	'B1',	'E3',	NULL),
(207,	2,	101,	'Magníficat',	'E2',	'E3',	'magnificat',	0,	'E2',	'D3',	NULL),
(208,	2,	102,	'María, casa de bendición',	'E2',	'G3',	'maria-casa-de-bendicion',	1,	'F2',	'G3',	NULL),
(209,	2,	103,	'María de Jasna Góra',	'E2',	'A3',	'maria-de-jasna-gora',	0,	'F#2',	'F#3',	NULL),
(210,	2,	105,	'María, madre del camino ardiente',	'C2',	'D3',	'maria-madre-del-camino-ardiente',	1,	'C2',	'C3',	NULL),
(211,	2,	106,	'María, pequeña María',	'D2',	'F#3',	'maria-pequeña-maria',	1,	'D2',	'D3',	NULL),
(212,	2,	107,	'Me enseñarás el camino de la vida',	'F2',	'G3',	'me-enseñaras-el-camino-de-la-vida',	1,	'A2',	'G3',	NULL),
(213,	2,	109,	'Mirad qué estupendo',	'A1',	'C3',	'mirad-que-estupendo',	1,	'A1',	'A2',	NULL),
(214,	2,	110,	'Misericordia mía, misericordia',	'G2',	'F3',	'misericordia-mia-misericordia',	1,	'G2',	'F3',	NULL),
(215,	2,	115,	'Oh Dios, tú eres mi Dios',	'E2',	'E3',	'oh-dios-tu-eres-mi-dios',	1,	'E2',	'C3',	NULL),
(216,	2,	116,	'Oh Jesús, amor mío [estrofa por abajo]',	'B1',	'E3',	'oh-jesus-amor-mio',	1,	'A2',	'D3',	NULL),
(217,	2,	117,	'Oh muerte, ¿dónde está tu victoria?',	'A1',	'G2',	'oh-muerte-donde-esta-tu-victoria',	0,	'A1',	'G2',	NULL),
(218,	2,	118,	'¡Oh Señor, nuestro Dios!',	'B1',	'G3',	'oh-señor-nuestro-dios',	1,	'B1',	'C3',	NULL),
(219,	2,	119,	'Os tomaré de entre las naciones',	'F2',	'E3',	'os-tomare-de-entre-las-naciones',	1,	'F2',	'E3',	NULL),
(220,	2,	120,	'Paloma incorrupta',	'C#2',	'C#3',	'paloma-incorrupta',	0,	'C#2',	'C#3',	NULL),
(221,	2,	121,	'Pentecostés',	'A1',	'C#3',	'pentecostes',	1,	'A1',	'A#2',	NULL),
(222,	2,	122,	'Por el amor de mis amigos',	'A1',	'B2',	'por-el-amor-de-mis-amigos',	1,	'E2',	'B2',	NULL),
(223,	2,	123,	'Por qué esta noche es diferente',	'E1',	'G2',	'por-que-esta-noche-es-diferente',	1,	'E1',	'G2',	NULL),
(224,	2,	125,	'Porque mi yugo es suave',	'A1',	'C3',	'porque-mi-yugo-es-suave',	1,	'E2',	'C3',	NULL),
(225,	2,	126,	'Qué amables son tus moradas',	'G1',	'G2',	'que-amables-son-tus-moradas',	1,	'A1',	'G2',	-1),
(226,	2,	127,	'Qué estupendo, qué alegría',	'E2',	'F3',	'que-estupendo-que-alegria',	1,	'E2',	'F3',	NULL),
(227,	2,	128,	'Quién nos separará',	'D2',	'D3',	'quien-nos-separara',	1,	'D2',	'D3',	NULL),
(228,	2,	129,	'Quiero cantar',	'D2',	'C#3',	'quiero-cantar',	1,	'D2',	'C#3',	NULL),
(229,	2,	130,	'Resucitó',	'E2',	'D3',	'resucito',	1,	'E2',	'D3',	NULL),
(230,	2,	131,	'Resurrexit',	'A1',	'D3',	'resurrexit',	1,	'A1',	'D3',	NULL),
(231,	2,	132,	'Salve, Reina de los cielos',	'G2',	'E3',	'salve-reina-de-los-cielos',	1,	'G#2',	'D3',	NULL),
(232,	2,	133,	'Se encontraron dos ángeles',	'A1',	'F2',	'se-encontraron-dos-angeles',	1,	'A1',	'F2',	NULL),
(233,	2,	136,	'Señor, ayúdame a no dudar de ti',	'E2',	'E3',	'señor-ayudame-a-no-dudar-de-ti',	1,	'E2',	'E3',	NULL),
(234,	2,	137,	'Señor, no me corrijas en tu cólera',	'C#2',	'G3',	'señor-no-me-corrijas-en-tu-colera',	0,	'C#2',	'G3',	NULL),
(235,	2,	138,	'Shlom lej Mariam',	'A1',	'F#3',	'shlom-lej-mariam',	1,	'B1',	'A2',	NULL),
(236,	2,	139,	'Si el Señor no construye la casa',	'G#2',	'G#3',	'si-el-señor-no-construye-la-casa',	1,	'G#2',	'G#3',	NULL),
(237,	2,	141,	'Si hoy escucháis su voz',	'C#2',	'E3',	'si-hoy-escuchais-su-voz',	1,	'E2',	'E3',	NULL),
(238,	2,	143,	'Sión, madre de todos los pueblos',	'A1',	'C3',	'sion-madre-de-todos-los-pueblos',	1,	'B1',	'C3',	NULL),
(239,	2,	144,	'Sola a solo',	'E2',	'F3',	'sola-a-solo',	1,	'F2',	'F3',	NULL),
(240,	2,	145,	'Stabat mater dolorosa',	'E2',	'G3',	'stabat-mater-dolorosa',	1,	'E2',	'F3',	NULL),
(241,	2,	148,	'Te he manifestado mi pecado',	'E2',	'D3',	'te-he-manifestado-mi-pecado',	1,	'E2',	'C3',	NULL),
(242,	2,	149,	'Tú que eres fiel',	'A2',	'D#3',	'tu-que-eres-fiel',	0,	'A#2',	'D#3',	NULL),
(243,	2,	150,	'Un retoño brota del tronco de Jesé',	'G2',	'E3',	'un-retoño-brota-del-tronco-de-jese',	1,	'G2',	'C3',	NULL),
(244,	2,	151,	'Una gran señal',	'A1',	'G3',	'una-gran-señal',	1,	'A2',	'G3',	NULL),
(245,	2,	152,	'Urí, urí, urá',	'A2',	'F3',	'uri-uri-uri-ura',	1,	'A2',	'F3',	NULL),
(246,	2,	153,	'Vamos ya, pastores',	'E2',	'C3',	'vamos-ya-pastores',	1,	'E2',	'C3',	NULL),
(247,	2,	154,	'Ven, Espíritu Santo',	'A2',	'G3',	'ven-espiritu-santo',	1,	'A2',	'F3',	NULL),
(248,	2,	156,	'Veni creator',	'G2',	'E3',	'veni-creator',	1,	'G2',	'B2',	NULL),
(249,	2,	157,	'Viene el Señor',	'E2',	'C3',	'viene-el-señor',	1,	'F#2',	'C3',	NULL),
(250,	2,	158,	'Virgen de la maravilla',	'C#2',	'E3',	'virgen-de-la-maravilla',	1,	'C#2',	'A2',	NULL),
(251,	2,	159,	'Vivid alegres',	'E2',	'G3',	'vivid-alegres',	1,	'E2',	'G3',	NULL),
(253,	2,	160,	'Vosotros sois la luz del mundo',	'E2',	'A3',	'vosotros-sois-la-luz-del-mundo',	1,	'G#2',	'E3',	NULL),
(254,	2,	161,	'Ya viene mi Dios',	'E2',	'C3',	'ya-viene-mi-dios',	1,	'E2',	'C3',	NULL),
(255,	2,	162,	'Yahveh, tú eres mi Dios',	'D2',	'D3',	'yahveh-tu-eres-mi-dios',	1,	'D2',	'F2',	NULL),
(256,	2,	163,	'Yo te amo, Señor',	'F#2',	'G3',	'yo-te-amo-señor',	1,	'F#2',	'F#3',	NULL),
(257,	2,	164,	'Yo vengo a reunir',	'B1',	'E3',	'yo-vengo-a-reunir',	1,	'B1',	'A2',	NULL),
(258,	2,	165,	'Zaqueo',	'E2',	'F3',	'zaqueo',	1,	'E2',	'F3',	NULL),
(259,	2,	167,	'Aleluya interleccional (I)',	'D2',	'E3',	'aleluya-interleccional-i',	1,	'F#2',	'C3',	NULL),
(260,	2,	167,	'Aleluya interleccional (II)',	'G2',	'E3',	'aleluya-interleccional-ii',	1,	'G2',	'E3',	NULL),
(261,	2,	167,	'Aleluya interleccional (III)',	'D2',	'B2',	'aleluya-interleccional-iii',	1,	'D2',	'B2',	NULL),
(262,	2,	168,	'Aleluya pascual',	'E2',	'A3',	'aleluya-pascual',	1,	'E2',	'E3',	NULL),
(263,	2,	169,	'Antífona para el Evangelio (I)',	'D2',	'E3',	'antifona-versiculo-antes-del-evangelio-i',	1,	'G2',	'D3',	NULL),
(264,	2,	169,	'Antífona para el Evangelio (II)',	'D2',	'E3',	'antifona-versiculo-antes-del-evangelio-ii',	1,	'D2',	'C3',	NULL),
(265,	2,	170,	'Bendición del agua',	'E2',	'G3',	'bendicion-del-agua',	1,	'E2',	'F#3',	NULL),
(266,	2,	172,	'Celebración penitencial',	'A1',	'D3',	'bendicion-penitencial',	0,	'G2',	'D3',	NULL),
(267,	2,	173,	'Cordero de Dios',	'B1',	'A2',	'cordero-de-dios',	1,	'B1',	'A2',	NULL),
(268,	2,	174,	'Credo',	'C2',	'F3',	'credo',	1,	'C2',	'F3',	NULL),
(269,	2,	175,	'Gloria a Dios en lo alto del cielo',	'D2',	'E3',	'gloria-a-dios-en-lo-alto-del-cielo',	1,	'D2',	'E3',	NULL),
(270,	2,	176,	'Letanías de los santos',	'D2',	'B2',	'letanias-de-los-santos',	1,	'D2',	'A2',	NULL),
(271,	2,	178,	'Letanías penitenciales I',	'E2',	'D3',	'letanias-penitenciales-i',	1,	'F#2',	'D3',	NULL),
(272,	2,	179,	'Letanías penitenciales II',	'E2',	'D3',	'letanias-penitenciales-ii',	1,	'F#2',	'D3',	NULL),
(273,	2,	182,	'Plegaria Eucarística II - Modelo I (1ª parte)',	'G1',	'D3',	'plegaria-eucaristica-ii-modelo-i-1a-parte',	0,	'F2',	'D3',	NULL),
(274,	2,	183,	'Plegaria Eucarística II - Modelo I (2ª parte - Institución y aclamación)',	'A1',	'E3',	'plegaria-eucaristica-ii-modelo-i-2a-parte',	0,	'D2',	'A#2',	NULL),
(275,	2,	183,	'Plegaria Eucarística II - Modelo I (3ª parte)',	'D2',	'E3',	'plegaria-eucaristica-ii-modelo-i-3a-parte',	1,	'A2',	'E3',	NULL),
(276,	2,	184,	'Plegaria Eucarística II - Modelo I (doxología alternativa)',	'D2',	'G3',	'plegaria-eucaristica-ii-modelo-i-doxologia-alternativa',	1,	'G2',	'G3',	NULL),
(277,	2,	193,	'Prefacio para el Tiempo Pascual',	'A1',	'D3',	'prefacio-para-el-tiempo-pascual',	0,	'G2',	'D3',	NULL),
(278,	2,	194,	'Pregón Pascual',	'G1',	'D3',	'pregon-pascual',	1,	'E2',	'D3',	NULL),
(279,	2,	196,	'Salmodia para el Salmo Responsorial',	'B1',	'D3',	'salmodia-para-el-salmo-responsorial',	1,	'B1',	'F#2',	NULL),
(280,	2,	197,	'Salmodia para la oración de los fieles',	'E2',	'D3',	'salmodia-para-las-oraciones-universales',	1,	'E2',	'D3',	NULL),
(281,	2,	198,	'Santo Palomeras 65 (Adviento-Navidad)',	'F2',	'G3',	'santo-palomeras-65-adviento-navidad',	1,	'A#2',	'F#3',	NULL),
(282,	2,	199,	'Santo Hebreo (Cuaresma)',	'A1',	'A#2',	'santo-hebreo-cuaresma',	1,	'A1',	'A#2',	NULL),
(283,	2,	200,	'Santo Palestina 74',	'D2',	'G3',	'santo-palestina-74-tiempo-pascual',	1,	'D2',	'F3',	NULL),
(284,	2,	201,	'Santo Roma 77 (Tiempo Ordinario)',	'G1',	'B2',	'santo-roma-77-tiempo-ordinario',	1,	'G1',	'A2',	NULL),
(285,	2,	202,	'Santo 1982 (Tiempo Ordinario)',	'A1',	'G3',	'santo-1982-tiempo-ordinario',	1,	'A1',	'G3',	NULL),
(286,	2,	203,	'Santo 1988 (Tiempo Ordinario)',	'E2',	'D3',	'santo-1988-tiempo-ordinario',	1,	'E2',	'D3',	NULL),
(287,	2,	204,	'Te Deum',	'A1',	'F#3',	'te-deum',	1,	'A1',	'F#3',	NULL),
(288,	2,	206,	'Bendito sea Dios',	'F#2',	'F#3',	'bendito-sea-dios',	1,	'A2',	'F#3',	NULL),
(289,	2,	207,	'Como el impulso que siente la ira',	'G1',	'B2',	'como-el-impulso-que-siente-la-ira',	1,	'E2',	'B2',	NULL),
(290,	2,	208,	'Consolad a mi pueblo',	'B1',	'D3',	'consolad-a-mi-pueblo',	1,	'B1',	'B2',	NULL),
(291,	2,	211,	'El lagarero',	'E2',	'F#3',	'el-lagarero',	1,	'E2',	'D3',	NULL),
(292,	2,	212,	'El mismo Dios',	'C#2',	'E3',	'el-mismo-dios',	1,	'C#2',	'E3',	NULL),
(293,	2,	213,	'El sembrador',	'A1',	'D3',	'el-sembrador',	1,	'A1',	'D3',	NULL),
(294,	2,	214,	'El Señor me ha dado',	'B1',	'C#3',	'el-señor-me-ha-dado',	1,	'F#2',	'B2',	NULL),
(295,	2,	215,	'Eres digno de tomar el libro',	'A1',	'D3',	'eres-digno-de-tomar-el-libro',	1,	'D2',	'D3',	NULL),
(296,	2,	217,	'He aquí mi siervo',	'A1',	'A2',	'he-aqui-mi-siervo',	1,	'A1',	'F2',	NULL),
(297,	2,	219,	'Himno a la Cruz gloriosa',	'B1',	'F#3',	'himno-a-la-cruz-gloriosa',	1,	'B1',	'B2',	NULL),
(298,	2,	220,	'Jacob',	'F2',	'E3',	'jacob',	1,	'G2',	'E3',	NULL),
(299,	2,	222,	'Ninguno puede servir a dos señores',	'A1',	'G2',	'ninguno-puede-servir-a-dos-señores',	1,	'B1',	'G2',	NULL),
(300,	2,	225,	'Oh Señor, mi corazón ya no es ambicioso',	'B1',	'C3',	'oh-señor-mi-corazon-ya-no-es-ambicioso',	1,	'B1',	'B2',	NULL),
(301,	2,	227,	'Shemá Israel',	'A1',	'D3',	'shema-israel',	1,	'A1',	'D3',	NULL),
(302,	2,	229,	'Tú has cubierto de vergüenza la muerte',	'D2',	'G3',	'tu-has-cubierto-de-verguenza-la-muerte',	1,	'D2',	'D3',	NULL),
(303,	2,	237,	'Cuando dormía',	'G#1',	'E3',	'cuando-dormia',	1,	'E2',	'A2',	NULL),
(304,	2,	238,	'El Espíritu del Señor está sobre mí',	'E2',	'D3',	'el-espiritu-del-señor-esta-sobre-mi',	1,	'E2',	'D3',	NULL),
(305,	2,	239,	'El jacal de los pastores',	'C#2',	'E3',	'el-jacal-de-los-pastores',	1,	'C#2',	'E3',	NULL),
(306,	2,	240,	'En una noche oscura',	'B1',	'D3',	'en-una-noche-oscura',	1,	'B1',	'D3',	NULL),
(307,	2,	241,	'Extiendo mis manos',	'E2',	'E3',	'extiendo-mis-manos',	1,	'A2',	'E3',	NULL),
(308,	2,	243,	'Himno a la Caridad',	'G1',	'G2',	'himno-a-la-caridad',	1,	'G1',	'G2',	NULL),
(309,	2,	244,	'Huye, amado mío',	'E2',	'F3',	'huye-amado-mio',	1,	'E2',	'E3',	NULL),
(310,	2,	245,	'Jesús recorría todas las ciudades',	'C2',	'F3',	'jesus-recorria-todas-las-ciudades',	1,	'E2',	'E3',	NULL),
(311,	2,	249,	'Me robaste el corazón',	'E2',	'F3',	'me-robaste-el-corazon',	1,	'E2',	'F3',	NULL),
(312,	2,	251,	'Noli me tangere',	'E2',	'F3',	'noli-me-tangere',	1,	'G2',	'F3',	NULL),
(313,	2,	252,	'¿Quién es esta que sube del desierto?',	'A1',	'D3',	'quien-es-esta-que-sube-del-desierto',	1,	'A1',	'A2',	NULL),
(314,	2,	253,	'Quiero andar',	'D2',	'G3',	'quiero-andar',	1,	'D2',	'G3',	NULL),
(317,	2,	254,	'Sermón de la montaña',	'B1',	'D3',	'sermon-de-la-montaña',	0,	'D2',	'B2',	NULL),
(318,	2,	257,	'Ven del Líbano',	'D2',	'B2',	'ven-del-libano',	1,	'D2',	'B2',	NULL),
(319,	1,	NULL,	'Sura Yako',	'F2',	'A3',	'sura-yako',	1,	NULL,	NULL,	NULL),
(327,	2,	23,	'A ti levanto mis ojos (voz hombres+mujeres)',	'A1',	'F3',	'a-ti-levanto-mis-ojos-voz-hombres+mujeres',	0,	'A1',	'F3',	NULL),
(328,	2,	26,	'A ti, Señor, se debe la alabanza en Sion',	'G1',	'C3',	'a-ti-señor-se-debe-la-alabanza-en-sion',	0,	'E2',	'C3',	NULL),
(329,	2,	39,	'Ave María I',	'D2',	'E3',	'ave-maria-i',	0,	'D2',	'E3',	NULL),
(330,	2,	41,	'Babilonia criminal',	'D#2',	'F#3',	'babilonia-criminal',	0,	'D#2',	'C3',	NULL),
(331,	2,	55,	'Cristo es la Luz',	'G2',	'F3',	'cristo-es-la-luz',	0,	'G2',	'E3',	NULL),
(332,	2,	66,	'El necio piensa que Dios no existe',	'D2',	'E3',	'el-necio-piensa-que-dios-no-existe',	0,	'D2',	'D3',	NULL),
(333,	2,	73,	'Escóndeme en lo oculto de tu tienda',	'G1',	'G2',	'escondeme-en-lo-oculto-de-tu-tienda',	0,	'B1',	'G2',	NULL),
(334,	2,	79,	'Felicidad para el hombre',	'A1',	'F3',	'felicidad-para-el-hombre',	0,	'A1',	'D3',	NULL),
(335,	2,	83,	'Hasta cuándo',	'A1',	'G#2',	'hasta-cuando',	0,	'A1',	'E2',	NULL),
(336,	2,	89,	'Himno de Adviento',	'D2',	'D3',	'himno-de-adviento',	0,	'G2',	'D3',	NULL),
(337,	2,	90,	'Himno de la Ascensión',	'G2',	'E3',	'himno-de-la-ascension',	0,	'G2',	'B2',	NULL),
(338,	2,	96,	'La Salve',	'E2',	'F3',	'la-salve',	0,	'E2',	'F3',	NULL),
(339,	2,	104,	'María, madre de la Iglesia',	'B1',	'G3',	'maria-madre-de-la-iglesia',	0,	'E2',	'G3',	NULL),
(340,	2,	108,	'Me has seducido, Señor',	'B1',	'F3',	'me-has-seducido-señor',	0,	'B1',	'E3',	NULL),
(341,	2,	111,	'Mucho me han perseguido',	'A1',	'D3',	'mucho-me-han-perseguido',	0,	'A1',	'D3',	NULL),
(342,	2,	112,	'No está aquí, resucitó',	'G1',	'D#3',	'no-esta-aqui-resucito',	0,	'G2',	'D3',	NULL),
(343,	2,	142,	'Si me he refugiado en el Señor',	'E2',	'G3',	'si-me-he-refugiado-en-el-señor',	0,	'E2',	'C3',	NULL),
(344,	2,	147,	'Te estoy llamando, Señor',	'D2',	'E3',	'te-estoy-llamando-señor',	0,	'E2',	'A#2',	NULL),
(345,	2,	155,	'Ven, hijo del hombre',	'E2',	'D#3',	'ven-hijo-del-hombre',	0,	'G2',	'B2',	NULL),
(346,	2,	181,	'Padre Nuestro',	'D2',	'D3',	'padre-nuestro',	0,	'D2',	'D3',	NULL),
(406,	2,	233,	'Adónde te escondiste, amado',	'E2',	'F3',	'adonde-te-escondiste-amado',	0,	'G2',	'E3',	NULL),
(348,	2,	205,	'Así habla el Amén',	'D2',	'D3',	'asi-habla-el-amen',	0,	'A2',	'D3',	NULL),
(349,	2,	209,	'Débora',	'C2',	'D3',	'debora',	0,	'E2',	'D3',	NULL),
(350,	2,	210,	'El combate escatológico',	'B1',	'E3',	'el-combate-escatologico',	0,	'A2',	'E3',	NULL),
(351,	2,	216,	'Escuchad islas lejanas [sin subir una octava en el estribillo]',	'G1',	'C#3',	'escuchad-islas-lejanas-sin-subir-una-octava-en-el-estribillo',	0,	'B1',	'C#3',	NULL),
(352,	2,	218,	'He aquí que nuestro espejo es el Señor',	'A#1',	'D3',	'he-aqui-que-nuestro-espejo-es-el-señor',	1,	'D2',	'D3',	NULL),
(353,	2,	221,	'Las armas de la Luz',	'A1',	'D3',	'las-armas-de-la-luz',	0,	'A1',	'D3',	NULL),
(354,	2,	226,	'Señor, Tú me escrutas y conoces',	'A1',	'D3',	'señor-tu-me-escrutas-y-conoces',	0,	'D2',	'D3',	NULL),
(355,	2,	228,	'Siéntate solitario y silencioso',	'B1',	'F#3',	'sientate-solitario-y-silencioso',	0,	'D2',	'D3',	NULL),
(356,	2,	231,	'A la cena del Cordero',	'G2',	'F3',	'a-la-cena-del-cordero',	1,	'G2',	'D3',	NULL),
(357,	2,	232,	'Abbá Padre',	'C2',	'F3',	'abba-padre',	0,	'C2',	'F3',	NULL),
(358,	2,	235,	'Como destila la miel',	'E1',	'E3',	'como-destila-la-miel',	0,	'F1',	'E3',	NULL),
(359,	2,	236,	'Como lirio entre los cardos',	'G1',	'D3',	'como-lirio-entre-los-cardos',	1,	'B2',	'C#3',	NULL),
(360,	2,	242,	'Hermosa eres, amiga mía',	'A1',	'D3',	'hermosa-eres-amiga-mia',	0,	'A1',	'A2',	NULL),
(361,	2,	246,	'La Cordera de Dios',	'E2',	'D3',	'la-cordera-de-dios',	0,	'G2',	'D3',	NULL),
(362,	2,	247,	'La paloma voló',	'A1',	'F#3',	'la-paloma-volo',	1,	'A1',	'C3',	NULL),
(364,	2,	248,	'La voz de mi amado',	'F1',	'C3',	'la-voz-de-mi-amado',	0,	'C2',	'C3',	NULL),
(365,	2,	256,	'Tú eres mi esperanza, Señor',	'A1',	'F3',	'tu-eres-mi-esperanza-señor',	0,	'A2',	'F3',	NULL),
(366,	2,	114,	'Oh Dios, por tu nombre sálvame',	'E2',	'G3',	'oh-dios-por-tu-nombre-salvame',	0,	'E2',	'G3',	NULL),
(367,	2,	188,	'Plegaria Eucarística IV',	'G1',	'A2',	'plegaria-eucaristica-iv',	1,	NULL,	NULL,	NULL),
(368,	1,	75,	'Bwana asipoijenga nyumba',	'C#2',	'F#3',	'bwana-asipoijenga-nyumba',	1,	NULL,	NULL,	NULL),
(369,	1,	218,	'Shema Israeli',	'A1',	'D3',	'shema-israeli',	1,	NULL,	NULL,	NULL),
(370,	1,	81,	'Shangilieni Bwana',	'D2',	'G3',	'shangilieni-bwana',	1,	'E2',	'B2',	NULL),
(371,	1,	3,	'Baraka kwa Adhimisho la Penitensia',	'A1',	'D3',	'baraka-kwa-adhimisho-la-penitensia',	0,	NULL,	NULL,	NULL),
(372,	1,	10,	'Baraka ya maji ya chemchemi ya Ubatizo',	'E2',	'G3',	'baraka-ya-maji-ya-chemchemi-ya-ubatizo',	0,	NULL,	NULL,	NULL),
(373,	1,	14,	'Utangulizi wa Pasaka',	'A1',	'D3',	'utangulizi-wa-pasaka',	0,	NULL,	NULL,	NULL),
(374,	1,	22,	'Sala kuu ya Ekaristi II (2): Konsekrasyo na Shangilio',	'A1',	'E3',	'sala-kuu-ya-ekaristi-ii-2-konsekrasyo-na-shangilio',	1,	NULL,	NULL,	NULL),
(375,	1,	23,	'Sala ya Ekaristi II (2): Anamnesis',	'E2',	'E3',	'sala-ya-ekaristi-ii-2-anamnesis',	0,	NULL,	NULL,	NULL),
(376,	1,	25,	'Tenzi kwa Kristo Mwanga',	'D#2',	'E3',	'tenzi-kwa-kristo-mwanga',	1,	NULL,	NULL,	NULL),
(377,	1,	27,	'Shangilio kwa Injili wakati wa Kwaresima (1)',	'A1',	'B2',	'shangilio-kwa-injili-wakati-wa-kwaresima-1',	1,	NULL,	NULL,	NULL),
(378,	1,	27,	'Shangilio kwa Injili wakati wa Kwaresima (2)',	'A1',	'B2',	'shangilio-kwa-injili-wakati-wa-kwaresima-2',	1,	NULL,	NULL,	NULL),
(379,	1,	33,	'Toka chini nakulilia, ee Bwana',	'A1',	'D3',	'toka-chini-nakulilia-ee-bwana',	1,	NULL,	NULL,	NULL),
(385,	1,	56,	'Wimbo wa Musa',	'F2',	'G3',	'wimbo-wa-musa',	1,	NULL,	NULL,	NULL),
(384,	1,	35,	'Mpaka lini',	'A1',	'G#2',	'mpaka-lini',	1,	NULL,	NULL,	NULL),
(451,	1,	34,	'Furahini ndugu',	'B1',	'D3',	'furahini-ndugu',	1,	'B1',	'D3',	NULL),
(452,	1,	34,	'Nafsi yangu umbariki Yahweh',	'E2',	'D3',	'nafsi-yangu-umbariki-yahweh',	1,	'E2',	'A2',	NULL),
(387,	1,	65,	'Salamu Maria (1984)',	'E2',	'E3',	'salamu-maria-1984',	1,	NULL,	NULL,	NULL),
(388,	1,	73,	'Uri, uri, ura',	'E2',	'C3',	'uri-uri-ura',	1,	NULL,	NULL,	NULL),
(389,	1,	83,	'Wimbo wa watoto kwa Usiku wa Pasaka',	'E1',	'G2',	'wimbo-wa-watoto-kwa-usiku-wa-pasaka',	1,	NULL,	NULL,	NULL),
(391,	1,	88,	'Watu waliokwenda kwenye giza',	'G1',	'G3',	'watu-waliokwenda-kwenye-giza',	1,	NULL,	NULL,	NULL),
(392,	1,	89,	'Wimbo wa Balaamu',	'G1',	'E3',	'wimbo-wa-balaamu',	1,	NULL,	NULL,	NULL),
(393,	1,	96,	'Farijini watu wangu',	'B1',	'C3',	'farijini-watu-wangu',	1,	NULL,	NULL,	NULL),
(394,	1,	97,	'Palikuwa malaika wawili',	'A1',	'F2',	'palikuwa-malaika-wawili',	1,	NULL,	NULL,	NULL),
(395,	1,	106,	'Maria, Mama wa Kanisa',	'B1',	'G3',	'maria-mama-wa-kanisa',	0,	NULL,	NULL,	NULL),
(396,	1,	107,	'Stabat Mater',	'E2',	'G3',	'stabat-mater',	1,	NULL,	NULL,	NULL),
(397,	1,	108,	'Maombolezo ya Bwana',	'E2',	'F#3',	'maombolezo-ya-bwana',	1,	NULL,	NULL,	NULL),
(398,	1,	115,	'Neno la Bwana kwa Bwana wangu',	'E2',	'D#3',	'neno-la-bwana-kwa-bwana-wangu',	1,	NULL,	NULL,	NULL),
(399,	1,	124,	'Kwako, Bwana, nakuinulia nafsi yangu',	'A1',	'D3',	'kwako-bwana-nakuinulia-nafsi-yangu',	1,	NULL,	NULL,	NULL),
(400,	1,	131,	'Nakupenda, ee Bwana',	'G2',	'G3',	'nakupenda-ee-bwana',	1,	NULL,	NULL,	NULL),
(401,	1,	133,	'Shlom Lekh Mariam',	'A1',	'F#3',	'shlom-lekh-mariam',	1,	'B1',	'A2',	NULL),
(402,	1,	207,	'Bwana amenipa: wimbo wa 3 wa Mtumishi wa Yahweh',	'B1',	'B2',	'bwana-amenipa-wimbo-wa-3-wa-mtumishi-wa-yahweh',	1,	NULL,	NULL,	NULL),
(403,	1,	262,	'Tenzi ya Upendo',	'G1',	'G2',	'tenzi-ya-upendo',	1,	NULL,	NULL,	NULL),
(407,	2,	24,	'A ti, Señor, en mi clamor imploro',	'A1',	'D3',	'a-ti-señor-en-mi-clamor-imploro',	1,	'A1',	'C3',	NULL),
(408,	2,	140,	'Si habéis resucitado con Cristo',	'B1',	'E3',	'si-habeis-resucitado-con-cristo',	1,	'E2',	'D3',	NULL),
(409,	2,	57,	'Cuando Israel salió de Egipto',	'E2',	'F#3',	'cuando-israel-salio-de-egipto',	0,	'E2',	'F#3',	NULL),
(410,	2,	113,	'Oh cielos, lloved de lo alto',	'E2',	'D3',	'oh-cielos-lloved-de-lo-alto',	1,	'E2',	'D3',	NULL),
(411,	1,	99,	'Anapaa Bwana Mungu',	'B1',	'F2',	'anapaa-bwana-mungu',	1,	NULL,	NULL,	NULL),
(412,	1,	27,	'Sala ya Waumini (2)',	'E2',	'D3',	'sala-ya-waumini-2',	1,	NULL,	NULL,	NULL),
(414,	1,	60,	'Bwana ni mchungaji wangu',	'G#1',	'D3',	'bwana-ni-mchungaji-wangu',	1,	NULL,	NULL,	NULL),
(415,	2,	NULL,	'El Mesías, León para vencer',	'A2',	'F3',	'el-mesias-leon-para-vencer',	1,	'A2',	'D3',	NULL),
(416,	1,	265,	'Yesu alizunguka miji yote',	'A1',	'F3',	'yesu-alizunguka-miji-yote',	1,	'E2',	'E3',	NULL),
(417,	1,	220,	'Vaeni silaha zote za Mungu',	'D2',	'G3',	'vaeni-silaha-zote-za-mungu',	1,	'D2',	'G3',	NULL),
(418,	1,	285,	'Carmen \'63',	'E2',	'F#3',	'carmen-\'63',	0,	'A2',	'F#3',	NULL),
(419,	1,	213,	'Ee Bwana wanichunguza na kunijua',	'A1',	'D3',	'ee-bwana-wanichunguza-na-kunijua',	1,	'D2',	'D3',	NULL),
(420,	1,	36,	'Njoo, umtafute mtumishi wako',	'D2',	'B2',	'njoo-umtafute-mtumishi-wako',	1,	'E2',	'B2',	NULL),
(421,	1,	69,	'Njoni, tumwimbie Bwana',	'B1',	'D3',	'njoni-tumwimbie-bwana',	1,	'D2',	'D3',	NULL),
(422,	1,	28,	'Te Deum',	'D2',	'E3',	'te-deum-kiswahili',	1,	'D2',	'E3',	NULL),
(423,	1,	85,	'Ee Bwana, tuma roho wako',	'B1',	'B2',	'ee-bwana-tuma-roho-wako',	1,	'B1',	'B2',	NULL),
(424,	1,	98,	'Nampenda Bwana',	'D2',	'G3',	'nampenda-bwana',	1,	'G2',	'G3',	NULL),
(425,	1,	120,	'Tuendeni wachungaji',	'E2',	'C3',	'tuendeni-wachungaji',	1,	'E2',	'C3',	NULL),
(426,	1,	132,	'Maria, mama wa njia iwakayo',	'C2',	'D3',	'maria-mama-wa-njia-iwakayo',	1,	'C2',	'D3',	NULL),
(427,	1,	209,	'Wimbo wa mpanzi',	'B1',	'E3',	'wimbo-wa-mpanzi',	1,	'B1',	'E3',	NULL),
(428,	1,	216,	'Hakuna mtu awezaye kutumikia mabwana wawili',	'D2',	'C3',	'hakuna-mtu-awezaye-kutumikia-mabwana-wawili',	1,	'E2',	'C3',	NULL),
(429,	1,	271,	'Wewe ukaaye bustanini',	'F2',	'F3',	'wewe-ukaaye-bustanini',	1,	'F#2',	'E3',	NULL),
(430,	1,	NULL,	'Masiya simba kwa kushinda',	'A2',	'F3',	'masiya-simba-kwa-kushinda',	1,	'A2',	'D3',	NULL),
(431,	1,	286,	'Caritas Christi',	'E2',	'D#3',	'caritas-christi',	1,	NULL,	NULL,	NULL),
(432,	2,	192,	'Prefacio para adviento y navidad',	'D2',	'E3',	'prefacio-para-adviento-y-navidad',	1,	'G2',	'C3',	NULL),
(433,	2,	48,	'Cantad a Dios',	'D2',	'E3',	'cantad-a-dios',	1,	'D2',	'E3',	NULL),
(435,	1,	79,	'Mbona mataifa wafanya ghasia?',	'B1',	'E3',	'mbona-mataifa-wafanya-ghasia',	1,	'E2',	'E3',	NULL),
(436,	2,	124,	'Por qué las gentes conjuran',	'B1',	'E3',	'por-que-las-gentes-conjuran',	1,	'E2',	'E3',	NULL),
(437,	2,	250,	'No resistáis al mal',	'A1',	'D3',	'no-resistais-al-mal',	1,	'D2',	'F#2',	NULL),
(438,	2,	134,	'Lauda Sion (Secuencia del Corpus Christi)',	'B1',	'E3',	'secuencia-del-corpus-christi',	1,	'B1',	'F2',	NULL),
(439,	2,	224,	'No sufras por los malvados',	'A1',	'C3',	'no-sufras-por-los-malvados',	1,	'B1',	'A2',	NULL),
(440,	2,	234,	'Como condenados a muerte [estrofa por arriba]',	'E2',	'E3',	'como-condenados-a-muerte',	1,	'E2',	'E3',	NULL),
(441,	1,	91,	'Israeli, angali mtoto nilimpenda',	'D2',	'F3',	'israeli-angali-mtoto-nilimpenda',	1,	'D2',	'F3',	NULL),
(442,	1,	15,	'Tenzi ya Masifu ya asubuhi ya Majilio mpaka 16 Disemba',	'G2',	'E3',	'tenzi-ya-masifu-ya-asubuhi-ya-majilio-mpaka-16-disemba',	1,	'G2',	'E3',	NULL),
(443,	1,	15,	'Tenzi ya Masifu ya asubuhi ya Majilio baada 16 Disemba',	'G2',	'E3',	'tenzi-ya-masifu-ya-asubuhi-ya-majilio-baada-16-disemba',	1,	'G2',	'E3',	NULL),
(444,	1,	16,	'Tenzi ya Masifu ya asubuhi toka Pasaka hadi Kupaa',	'G2',	'D3',	'tenzi-ya-masifu-ya-asubuhi-toka-pasaka-hadi-kupaa',	1,	'G2',	'D3',	NULL),
(445,	1,	16,	'Tenzi ya Masifu ya jioni toka Pasaka hadi Kupaa',	'G2',	'E3',	'tenzi-ya-masifu-ya-jioni-toka-pasaka-hadi-kupaa',	1,	'G2',	'E3',	NULL),
(446,	1,	17,	'Tenzi ya Masifu ya jioni ya siku ya Kupaa na Tenzi ya Masifu ya asubuhi toka Kupaa hadi Pentekoste',	'G2',	'E3',	'tenzi-ya-masifu-ya-jioni-ya-siku-ya-kupaa-na-tenzi-ya-masifu-ya-asubuhi-toka-kupaa-hadi-pentekoste',	1,	'G2',	'E3',	NULL),
(447,	1,	18,	'Tenzi ya Masifu ya jioni toka Kupaa hadi Pentekoste',	'G2',	'E3',	'tenzi-ya-masifu-ya-jioni-toka-kupaa-hadi-pentekoste',	1,	'G2',	'E3',	NULL),
(448,	1,	19,	'Tenzi ya Masifu ya asubuhi ya Pentekoste',	'G2',	'E3',	'tenzi-ya-masifu-ya-asubuhi-ya-pentekoste',	1,	'G2',	'E3',	NULL),
(449,	1,	20,	'Sekwensia ya Pentekoste (Njoo, Roho Mtakatifu)',	'A2',	'G3',	'sekwensia-ya-pentekoste-njoo-roho-mtakatifu',	1,	'A2',	'F3',	NULL),
(450,	1,	292,	'Kwenye usiku wa vivuli',	'B1',	'D3',	'kwenye-usiku-wa-vivuli',	1,	NULL,	NULL,	NULL),
(453,	1,	210,	'Roho wa Bwana yu juu yangu',	'E2',	'D3',	'roho-wa-bwana-yu-juu-yangu',	1,	'E2',	'D3',	NULL),
(454,	1,	58,	'Israeli alipotoka huko Misri',	'E2',	'F#3',	'israeli-alipotoka-huko-misri',	0,	'E2',	'F#3',	NULL),
(455,	1,	101,	'Bwana ndiye niliyemkimbilia',	'E2',	'G3',	'bwana-ndiye-niliyemkimbilia',	1,	'E2',	'C3',	NULL),
(456,	1,	287,	'Noli me tangere',	'E2',	'F3',	'noli-me-tangere-kiswahili',	0,	'G2',	'F3',	NULL),
(457,	1,	72,	'Tenzi ya Majilio \"Sauti dhahiri yafuta giza\"',	'A1',	'A2',	'tenzi-ya-majilio-\"sauti-dhahiri-yafuta-giza\"',	1,	'A1',	'A2',	NULL),
(458,	1,	61,	'Kando ya mito ya Babilonia',	'B1',	'F#3',	'kando-ya-mito-ya-babilonia',	1,	'D#2',	'C3',	NULL),
(459,	2,	31,	'Alegría, ha nacido el salvador',	'D2',	'D#3',	'alegria-ha-nacido-el-salvador',	1,	'D2',	'D#3',	NULL),
(460,	2,	146,	'Sube Dios entre aclamaciones',	'E2',	'A#2',	'sube-dios-entre-aclamaciones',	1,	'E2',	'A#2',	NULL),
(461,	2,	255,	'Suba el esposo al leño de su tálamo',	'C2',	'F3',	'suba-el-esposo-al-leño-de-su-talamo',	1,	'C2',	'A2',	NULL),
(470,	1,	214,	'Eli, eli, lamma sabaktani?',	'F#2',	'F#3',	'eli-eli-lamma-sabaktani',	1,	'A2',	'E3',	NULL),
(471,	1,	111,	'Bikira wa maajabu',	'C#2',	'E3',	'bikira-wa-maajabu',	1,	'C#2',	'A2',	NULL),
(472,	1,	114,	'Mavuno ya mataifa',	'A#1',	'C#3',	'mavuno-ya-mataifa',	1,	'B1',	'B2',	NULL),
(473,	1,	208,	'Nani huyu atokaye Edomu',	'E2',	'F#3',	'nani-huyu-atokaye-edomu',	1,	'E2',	'A2',	NULL),
(474,	1,	270,	'Nilipolala',	'G#1',	'E3',	'nilipolala',	1,	'E2',	'A2',	NULL),
(475,	1,	119,	'Aondoke Mungu',	'D2',	'E3',	'aondoke-mungu',	1,	'D2',	'E3',	NULL),
(476,	3,	1,	'Penitential Litany (shorter version)',	'E2',	'D3',	'penitential-litany-shorter-version',	1,	'F#2',	'D3',	NULL),
(477,	3,	2,	'Penitential Litany',	'E2',	'D3',	'penitential-litany',	1,	'F#2',	'D3',	NULL),
(478,	3,	3,	'Prayer of thanksgiving for Penitential Celebration',	'A1',	'D3',	'prayer-of-thanksgiving-for-penitential-celebration',	0,	'G2',	'D3',	NULL),
(479,	3,	4,	'Glory to God in the highest',	'D2',	'E3',	'glory-to-god-in-the-highest',	1,	'D2',	'E3',	NULL),
(480,	3,	5,	'Holy, Holy (Lent)',	'B1',	'C3',	'holy-holy-lent',	1,	'B1',	'C3',	NULL),
(481,	3,	5,	'Holy, Holy (Ordinary time)',	'G1',	'B2',	'holy-holy-ordinary-time',	1,	'G1',	'A2',	NULL),
(482,	3,	6,	'Holy, Holy (Eastertide)',	'D2',	'G3',	'holy-holy-eastertide',	1,	'D2',	'F3',	NULL),
(483,	3,	6,	'Holy, Holy (Advent)',	'F2',	'G3',	'holy-holy-advent',	0,	'G#2',	'F#3',	NULL),
(484,	3,	7,	'Holy, Holy (1983)',	'A1',	'F3',	'holy-holy-1983',	1,	'A1',	'F3',	NULL),
(485,	3,	7,	'Holy, Holy (1988)',	'A2',	'D3',	'holy-holy-1988',	1,	'A2',	'D3',	NULL),
(486,	3,	8,	'Eucharistic Prayer II (Preface)',	'G1',	'D3',	'eucharistic-prayer-ii-preface',	0,	'G2',	'D3',	NULL),
(487,	3,	9,	'Eucharistic Prayer II (Consecration and Acclamation - a)',	'A1',	'C3',	'eucharistic-prayer-ii-consecration-and-acclamation-a',	1,	'D2',	'A#2',	NULL),
(488,	3,	10,	'Eucharistic Prayer II (only Doxology) [beware change of chords at Amen]',	'G1',	'A2',	'eucharistic-prayer-ii-only-doxology',	0,	'A1',	'A2',	NULL),
(489,	3,	11,	'Eucharistic Prayer II (Offering, Intercession, Doxology)',	'E2',	'E3',	'eucharistic-prayer-ii-offering-intercession-doxology',	1,	'A2',	'E3',	NULL),
(490,	3,	12,	'Exsultet - Paschal Praeconium',	'G1',	'D3',	'exsultet-paschal-praeconium',	1,	'E2',	'D3',	NULL),
(491,	3,	14,	'Blessing of baptismal water',	'A1',	'C3',	'blessing-of-baptismal-water',	1,	'A1',	'C3',	NULL),
(492,	3,	17,	'Preface (Eastertide)',	'A1',	'D3',	'preface-eastertide',	1,	'G2',	'D3',	NULL),
(493,	3,	18,	'Lamb of God (Agnus Dei)',	'B1',	'A2',	'lamb-of-god-agnus-dei',	1,	'B1',	'A2',	NULL),
(494,	3,	19,	'Hymn for Lauds of Advent until 16 December',	'G2',	'E3',	'hymn-for-lauds-of-advent-until-16-december',	1,	'G2',	'B2',	NULL),
(495,	3,	19,	'Hymn for Lauds of Advent from 17 December',	'G2',	'E3',	'hymn-for-lauds-of-advent-from-17-december',	1,	'G2',	'B2',	NULL),
(496,	3,	20,	'Hymn for Lauds from Easter to the Ascension',	'F#2',	'E3',	'hymn-for-lauds-from-easter-to-the-ascension',	1,	'F#2',	'E3',	NULL),
(497,	3,	20,	'Hymn for Vespers from Easter to the Ascension',	'G2',	'E3',	'hymn-for-vespers-from-easter-to-the-ascension',	1,	'G2',	'D3',	NULL),
(498,	3,	21,	'Hymn for Vespers on Ascension day and hymn for Lauds from Ascension till Pentecost',	'G2',	'E3',	'hymn-for-vespers-on-ascension-day-and-hymn-for-lauds-from-ascension-till-pentecost',	1,	'G2',	'B2',	NULL),
(499,	3,	22,	'Come, o Creator Spirit - Hymn for Vespers from Ascension to Pentecost',	'G2',	'E3',	'come-o-creator-spirit-hymn-for-vespers-from-ascension-to-pentecost',	1,	'G2',	'B2',	NULL),
(500,	3,	23,	'Hymn for Lauds of Pentecost',	'G2',	'E3',	'hymn-for-lauds-of-pentecost',	1,	'G2',	'B2',	NULL),
(501,	3,	24,	'Come Holy Spirit',	'A2',	'G3',	'come-holy-spirit',	1,	'A2',	'F3',	NULL),
(502,	3,	25,	'Easter Alleluia',	'B1',	'E3',	'easter-alleluia',	1,	'B1',	'B2',	NULL),
(503,	3,	25,	'Invocation of the Holy Spirit',	'B1',	'B2',	'invocation-of-the-holy-spirit',	1,	'B1',	'B2',	NULL),
(504,	3,	25,	'You give food to the poor',	'A1',	'D3',	'you-give-food-to-the-poor',	1,	'A1',	'D3',	NULL),
(505,	3,	26,	'Gospel acclamation (Lent - a)',	'D2',	'E3',	'gospel-acclamation-lent-a',	1,	'G2',	'C3',	NULL),
(506,	3,	26,	'Gospel acclamation (Lent - b)',	'D2',	'E3',	'gospel-acclamation-lent-b',	1,	'D2',	'C3',	NULL),
(507,	3,	27,	'On the eighth day (Hymn for Lauds of Sunday - a)',	'G2',	'E3',	'on-the-eighth-day-hymn-for-lauds-of-sunday-a',	1,	'G2',	'B2',	NULL),
(508,	3,	27,	'Flee, shadows and darkness (Hymn for Lauds)',	'E2',	'D3',	'flee-shadows-and-darkness-hymn-for-lauds',	1,	'E2',	'D3',	NULL),
(509,	3,	28,	'Created for the Glory (Hymn for Lauds of Friday)',	'G2',	'E3',	'created-for-the-glory-hymn-for-lauds-of-friday',	1,	'G2',	'B2',	NULL),
(510,	3,	28,	'O first and last day (Hymn for Lauds of Sunday  - b)',	'E2',	'D3',	'o-first-and-last-day-hymn-for-lauds-of-sunday-b',	1,	'E2',	'D3',	NULL),
(511,	3,	30,	'Te Deum',	'C2',	'E3',	'te-deum-english',	1,	'D2',	'E3',	NULL),
(512,	3,	31,	'He rose from death',	'E2',	'D3',	'he-rose-from-death',	1,	'E2',	'D3',	NULL),
(513,	3,	32,	'Towards you, Holy City',	'C2',	'F3',	'towards-you-holy-city',	1,	'C2',	'E3',	NULL),
(514,	3,	32,	'The march is hard',	'E2',	'E3',	'the-march-is-hard',	1,	'E2',	'E3',	NULL),
(515,	3,	33,	'From the depths to you I cry',	'A1',	'D3',	'from-the-depths-to-you-i-cry',	1,	'A1',	'A2',	NULL),
(516,	3,	34,	'Song of Joshua',	'C#2',	'D3',	'song-of-joshua',	0,	'C#2',	'A2',	NULL),
(517,	3,	34,	'Bless the Lord, my soul',	'E2',	'D3',	'bless-the-lord-my-soul',	1,	'E2',	'A2',	NULL),
(518,	3,	35,	'How much longer [chorus with low voice]',	'A1',	'G#2',	'how-much-longer',	1,	'A1',	'E2',	NULL),
(519,	3,	35,	'O Lord, you are my God',	'D2',	'D3',	'o-lord-you-are-my-god',	1,	'D2',	'F2',	NULL),
(520,	3,	36,	'Let us sing to the Lord',	'D2',	'E3',	'let-us-sing-to-the-lord',	1,	'B2',	'E3',	NULL),
(521,	3,	36,	'Lord, Lord Jesus',	'D2',	'B2',	'lord-lord-jesus',	1,	'E2',	'B2',	NULL),
(522,	3,	37,	'How good it is',	'E2',	'E3',	'how-good-it-is',	1,	'E2',	'E3',	NULL),
(523,	3,	37,	'Look how it is good, taste how it is sweet [chorus with low voice]',	'A1',	'E3',	'look-how-it-is-good-taste-how-it-is-sweet',	1,	'A1',	'E3',	NULL),
(524,	3,	38,	'Look how it is good',	'A1',	'C3',	'look-how-it-is-good',	1,	'A1',	'A2',	NULL),
(525,	3,	39,	'Give thanks to the Lord',	'D2',	'F#3',	'give-thanks-to-the-lord',	1,	'D2',	'E3',	NULL),
(526,	3,	40,	'Canticle of Daniel Part 1',	'D2',	'C3',	'canticle-of-daniel-part-1',	1,	'A2',	'C3',	NULL),
(527,	3,	41,	'Canticle of Daniel Part 2',	'D2',	'D3',	'canticle-of-daniel-part-2',	1,	'D2',	'C3',	NULL),
(528,	3,	42,	'Praise the Lord from the Heavens',	'C#2',	'A2',	'praise-the-lord-from-the-heavens',	1,	'F#2',	'A2',	NULL),
(529,	3,	43,	'Praise God, Alleluia',	'A2',	'D3',	'praise-god-alleluia',	0,	'A2',	'D3',	NULL),
(530,	3,	44,	'The Lord is my light and my salvation',	'D2',	'E3',	'the-lord-is-my-light-and-my-salvation',	1,	'D2',	'D3',	NULL),
(531,	3,	44,	'Evenu Shalom Alehem',	'A1',	'D3',	'evenu-shalom-alehem-english',	1,	'A1',	'D3',	NULL),
(532,	3,	45,	'Here comes the Kingdom',	'D2',	'B2',	'here-comes-the-kingdom',	1,	'D2',	'B2',	NULL),
(533,	3,	45,	'Abba, Father',	'C2',	'F3',	'abba-father',	1,	'C2',	'F3',	NULL),
(534,	3,	46,	'Who will divide us?',	'D2',	'D3',	'who-will-divide-us',	1,	'D2',	'D3',	NULL),
(535,	3,	47,	'Magnificat',	'E2',	'E3',	'magnificat-english',	0,	'E2',	'D3',	NULL),
(536,	3,	48,	'The cup of salvation',	'A1',	'B2',	'the-cup-of-salvation',	1,	'E2',	'B2',	NULL),
(537,	3,	49,	'When the Lord [all with low voice]',	'B1',	'B2',	'when-the-lord',	1,	'B1',	'B2',	NULL),
(538,	3,	50,	'Benedictus',	'D#2',	'D3',	'benedictus-english',	1,	'E2',	'B2',	NULL),
(539,	3,	51,	'Death is swallowed up in victory',	'G1',	'G2',	'death-is-swallowed-up-in-victory',	0,	'A1',	'G2',	NULL),
(540,	3,	52,	'O Heavens, rain from above',	'E2',	'D3',	'o-heavens-rain-from-above',	1,	'E2',	'D3',	NULL),
(541,	3,	53,	'Pentecost',	'A1',	'C#3',	'pentecost',	1,	'A1',	'A#2',	NULL),
(542,	3,	54,	'Behold, I\'m coming soon',	'B1',	'C#3',	'behold-i\'m-coming-soon',	1,	'E2',	'C#3',	NULL),
(543,	3,	54,	'Come, son of man',	'E2',	'D#3',	'come-son-of-man',	1,	'G2',	'B2',	NULL),
(544,	3,	55,	'Abraham',	'A1',	'D3',	'abraham-english',	1,	'G#2',	'D3',	NULL),
(545,	3,	56,	'Song of Moses',	'F2',	'G3',	'song-of-moses',	1,	'G2',	'G3',	NULL),
(546,	3,	57,	'Praise the Lord',	'E2',	'E3',	'praise-the-lord',	1,	'E2',	'D3',	NULL),
(547,	3,	57,	'Hail, Holy Queen',	'E2',	'F3',	'hail-holy-queen',	1,	'E2',	'F3',	NULL),
(548,	3,	58,	'When Israel came out of Egypt [without change of key]',	'E2',	'F#3',	'when-israel-came-out-of-egypt',	0,	'E2',	'F#3',	NULL),
(549,	3,	59,	'Gates, lift up your heads',	'D2',	'C#3',	'gates-lift-up-your-heads',	0,	'D2',	'C3',	NULL),
(550,	3,	60,	'The Lord is my shepherd',	'G1',	'D3',	'the-lord-is-my-shepherd',	1,	'C2',	'B2',	NULL),
(551,	3,	61,	'Beside the rivers of Babylon',	'B1',	'F#3',	'beside-the-rivers-of-babylon',	1,	'B1',	'C3',	NULL),
(552,	3,	62,	'Have mercy on me, God, in your kindness',	'E2',	'C3',	'have-mercy-on-me-god-in-your-kindness',	1,	'A2',	'C3',	NULL),
(553,	3,	63,	'Have mercy on me, have mercy on me',	'D2',	'C3',	'have-mercy-on-me-have-mercy-on-me',	1,	'D2',	'G2',	NULL),
(554,	3,	64,	'Christ Jesus is the Lord',	'D2',	'E3',	'christ-jesus-is-the-lord',	1,	'F#2',	'B2',	NULL),
(555,	3,	65,	'Hail Mary',	'D2',	'E3',	'hail-mary',	1,	'D2',	'E3',	NULL),
(556,	3,	65,	'Hail Mary (1984)',	'E2',	'E3',	'hail-mary-1984',	1,	'E2',	'E3',	NULL),
(557,	3,	66,	'Mary, little Mary',	'D2',	'F#3',	'mary-little-mary',	1,	'D2',	'D3',	NULL),
(558,	3,	67,	'I lift up my eyes to the mountains',	'G2',	'G3',	'i-lift-up-my-eyes-to-the-mountains',	1,	'G2',	'G3',	NULL),
(559,	3,	67,	'Song of the redeemed',	'G2',	'E3',	'song-of-the-redeemed',	1,	'G2',	'E3',	NULL),
(560,	3,	68,	'If today you listen to his voice',	'C#2',	'E3',	'if-today-you-listen-to-his-voice',	1,	'E2',	'E3',	NULL),
(561,	3,	69,	'Come, ring out your joy to the Lord',	'B1',	'D3',	'come-ring-out-your-joy-to-the-lord',	1,	'D2',	'D3',	NULL),
(562,	3,	70,	'Dayenù',	'D2',	'E3',	'dayenù-english',	1,	'E2',	'E3',	NULL),
(563,	3,	71,	'To the paschal victim',	'A1',	'F3',	'to-the-paschal-victim',	1,	'A1',	'F3',	NULL),
(564,	3,	71,	'Easter hymn',	'C2',	'C3',	'easter-hymn',	1,	'C2',	'C3',	NULL),
(565,	3,	72,	'The children of Bethlehem',	'D2',	'E3',	'the-children-of-bethlehem',	1,	'E2',	'E3',	NULL),
(566,	3,	73,	'Uri, uri, ura',	'E2',	'C3',	'uri-uri-ura-english',	1,	'E2',	'C3',	NULL),
(567,	3,	73,	'He\'s coming, my God',	'E2',	'C3',	'he\'s-coming-my-god',	1,	'E2',	'C3',	NULL),
(568,	3,	74,	'Amen, amen, amen',	'A1',	'F#3',	'amen-amen-amen-english',	1,	'A1',	'F#3',	NULL),
(569,	3,	75,	'If the Lord does not build the house',	'C#2',	'F#3',	'if-the-lord-does-not-build-the-house',	1,	'A2',	'F#3',	NULL),
(570,	3,	75,	'Taste and see',	'B1',	'D3',	'taste-and-see',	1,	'B1',	'G2',	NULL),
(571,	3,	76,	'For love of my brothers and friends',	'B1',	'D3',	'for-love-of-my-brothers-and-friends',	1,	'B1',	'D3',	NULL),
(572,	3,	77,	'I hoped, I hoped in the Lord',	'C2',	'B2',	'i-hoped-i-hoped-in-the-lord',	1,	'C2',	'B2',	NULL),
(573,	3,	78,	'I want to sing',	'D2',	'C#3',	'i-want-to-sing',	1,	'D2',	'C#3',	NULL),
(574,	3,	79,	'Why do the nations conspire?',	'A1',	'E3',	'why-do-the-nations-conspire',	1,	'B1',	'E3',	NULL),
(575,	3,	80,	'As a doe yearns for running streams',	'B1',	'E3',	'as-a-doe-yearns-for-running-streams',	1,	'D#2',	'C#3',	NULL),
(576,	3,	81,	'Acclaim the Lord',	'D2',	'A3',	'acclaim-the-lord',	1,	'E2',	'B2',	NULL),
(577,	3,	81,	'Shout with joy',	'D2',	'D3',	'shout-with-joy',	1,	'F2',	'C3',	NULL),
(578,	3,	82,	'When I awake',	'F2',	'F3',	'when-i-awake',	1,	'G2',	'D#3',	NULL),
(579,	3,	83,	'Children\'s Passover song',	'E2',	'G3',	'children\'s-passover-song',	1,	'E2',	'G3',	NULL),
(580,	3,	84,	'I shall not die, but I shall live',	'D2',	'D3',	'i-shall-not-die-but-i-shall-live',	1,	'D2',	'D3',	NULL),
(581,	3,	86,	'Tell the faint of heart',	'C2',	'F3',	'tell-the-faint-of-heart',	1,	'C2',	'F3',	NULL),
(582,	3,	87,	'O God, you are my God',	'E2',	'E3',	'o-god-you-are-my-god',	1,	'E2',	'C3',	NULL),
(583,	3,	87,	'God rises to acclamation',	'B1',	'F2',	'god-rises-to-acclamation',	1,	'B1',	'F2',	NULL),
(584,	3,	88,	'The people that walked in darkness',	'G1',	'B2',	'the-people-that-walked-in-darkness',	1,	'A1',	'B2',	NULL),
(585,	3,	89,	'Song of Balaam',	'G1',	'E3',	'song-of-balaam',	1,	'D2',	'E3',	NULL),
(586,	3,	90,	'Before the angels',	'A1',	'A2',	'before-the-angels',	1,	'A1',	'A2',	NULL),
(587,	3,	91,	'When Israel was a child',	'D2',	'E3',	'when-israel-was-a-child',	1,	'D2',	'E3',	NULL),
(588,	3,	91,	'It\'s the Passover of the Lord',	'D2',	'D3',	'it\'s-the-passover-of-the-lord',	1,	'D2',	'A2',	NULL),
(589,	3,	92,	'There is a time for everything',	'C2',	'C3',	'there-is-a-time-for-everything',	1,	'C2',	'C3',	NULL),
(590,	3,	93,	'Bless the Lord, my soul - Song of Tobit',	'G1',	'C3',	'bless-the-lord-my-soul-song-of-tobit',	1,	'C2',	'A2',	NULL),
(591,	3,	94,	'How lovely are your dwelling places',	'G1',	'G2',	'how-lovely-are-your-dwelling-places',	1,	'G1',	'G2',	NULL),
(592,	3,	95,	'The Lord is coming',	'D2',	'A#2',	'the-lord-is-coming',	1,	'E2',	'A#2',	NULL),
(593,	3,	95,	'Day of rest',	'D2',	'C3',	'day-of-rest',	1,	'D2',	'C3',	NULL),
(594,	3,	96,	'Console my people',	'B1',	'D3',	'console-my-people',	1,	'B1',	'B2',	NULL),
(595,	3,	97,	'Two angels met [without change of key]',	'A1',	'E3',	'two-angels-met',	1,	'A1',	'E3',	NULL),
(596,	3,	98,	'I love the Lord',	'A1',	'D3',	'i-love-the-lord',	1,	'D2',	'D3',	NULL),
(597,	3,	99,	'Come to me, all of you',	'B1',	'C3',	'come-to-me-all-of-you',	1,	'E2',	'C3',	NULL),
(598,	3,	100,	'To you, o Lord praise is due in Zion',	'G1',	'C3',	'to-you-o-lord-praise-is-due-in-zion',	1,	'E2',	'C3',	NULL),
(599,	3,	101,	'If in the Lord I have taken my refuge',	'E2',	'G3',	'if-in-the-lord-i-have-taken-my-refuge',	1,	'E2',	'C3',	NULL),
(600,	3,	102,	'The Lord announces good news',	'D2',	'E3',	'the-lord-announces-good-news',	1,	'D2',	'B2',	NULL),
(601,	3,	103,	'Give blessing to the Lord',	'G1',	'D3',	'give-blessing-to-the-lord',	0,	'G1',	'D3',	NULL),
(602,	3,	104,	'Daughters of Jerusalem',	'E2',	'E3',	'daughters-of-jerusalem',	1,	'G2',	'D3',	NULL),
(603,	3,	105,	'I have admitted to you my sin',	'G2',	'D3',	'i-have-admitted-to-you-my-sin',	1,	'G2',	'C3',	NULL),
(604,	3,	106,	'Mary, mother of the Church',	'B1',	'G3',	'mary-mother-of-the-church',	0,	'E2',	'G3',	NULL),
(605,	3,	107,	'Stabat Mater',	'E2',	'G3',	'stabat-mater-english',	1,	'E2',	'F3',	NULL),
(606,	3,	108,	'The reproaches - O my people',	'E2',	'G3',	'the-reproaches-o-my-people',	1,	'E2',	'F#3',	NULL),
(607,	3,	109,	'O Lord our God',	'B1',	'G3',	'o-lord-our-god',	1,	'B1',	'C3',	NULL),
(608,	3,	110,	'Blessed are you Mary',	'D2',	'D3',	'blessed-are-you-mary',	1,	'D2',	'D3',	NULL),
(609,	3,	110,	'Hail, Queen of Heaven',	'G2',	'E3',	'hail-queen-of-heaven',	1,	'G#2',	'D3',	NULL),
(610,	3,	111,	'Virgin of marvels',	'B1',	'D3',	'virgin-of-marvels',	1,	'B1',	'G2',	NULL),
(611,	3,	112,	'Mary, house of all blessing',	'B1',	'D3',	'mary-house-of-all-blessing',	1,	'C2',	'D3',	NULL),
(612,	3,	113,	'I will bless the Lord at all times',	'D2',	'F3',	'i-will-bless-the-lord-at-all-times',	1,	'D2',	'F3',	NULL),
(613,	3,	114,	'The harvest of the nations',	'F#1',	'C#3',	'the-harvest-of-the-nations',	1,	'F#1',	'G2',	NULL),
(614,	3,	115,	'Says the Lord to my Lord',	'D#2',	'D#3',	'says-the-lord-to-my-lord',	1,	'E2',	'B2',	NULL),
(615,	3,	116,	'Happy the man',	'D2',	'D3',	'happy-the-man',	1,	'E2',	'C3',	NULL),
(616,	3,	117,	'You are beautiful',	'E2',	'D#3',	'you-are-beautiful',	1,	'E2',	'C#3',	NULL),
(617,	3,	118,	'Happines for the man',	'A1',	'E3',	'happines-for-the-man',	1,	'A1',	'D3',	NULL),
(618,	3,	119,	'Let God arise',	'D2',	'E3',	'let-god-arise',	0,	'D2',	'B2',	NULL),
(619,	3,	120,	'Shepherds, let us go!',	'E2',	'C3',	'shepherds-let-us-go',	1,	'E2',	'C3',	NULL),
(620,	3,	121,	'Mary of Jasna Góra',	'E2',	'A3',	'mary-of-jasna-gora',	1,	'A2',	'F#3',	NULL),
(621,	3,	122,	'To you, O Lord, with my voice I cry for help',	'A1',	'C3',	'to-you-o-lord-with-my-voice-i-cry-for-help',	1,	'A1',	'C3',	NULL),
(622,	3,	123,	'A shoot springs from the stock of Jesse',	'D2',	'E3',	'a-shoot-springs-from-the-stock-of-jesse',	1,	'D2',	'D3',	NULL),
(623,	3,	124,	'To you, O Lord, I lift up my soul',	'A1',	'E3',	'to-you-o-lord-i-lift-up-my-soul',	1,	'A1',	'D3',	NULL),
(624,	3,	125,	'I am calling you',	'E2',	'F#3',	'i-am-calling-you',	1,	'F#2',	'C3',	NULL),
(625,	3,	126,	'To you I lift up my eyes',	'A1',	'E3',	'to-you-i-lift-up-my-eyes',	1,	'A1',	'A#2',	NULL),
(626,	3,	127,	'Lord, do not punish me in your anger',	'E2',	'F#3',	'lord-do-not-punish-me-in-your-anger',	0,	'E2',	'F#3',	NULL),
(627,	3,	128,	'Glory, glory, glory',	'B1',	'E3',	'glory-glory-glory',	1,	'B1',	'A2',	NULL),
(628,	3,	129,	'Exult, you just, in the Lord',	'D2',	'E3',	'exult-you-just-in-the-lord',	1,	'D2',	'B2',	NULL),
(629,	3,	130,	'Harshly have they persecuted me',	'D2',	'G3',	'harshly-have-they-persecuted-me',	1,	'E2',	'G3',	NULL),
(630,	3,	131,	'I love you Lord',	'F#2',	'G3',	'i-love-you-lord',	1,	'F#2',	'F#3',	NULL),
(631,	3,	132,	'Mary, mother of the burning way',	'B2',	'A3',	'mary-mother-of-the-burning-way',	1,	'B2',	'A3',	NULL),
(632,	3,	133,	'Shlom lekh Mariam',	'A1',	'F#3',	'shlom-lekh-mariam-english',	1,	'D2',	'A2',	NULL),
(633,	3,	134,	'Go and tell my brothers',	'A1',	'E3',	'go-and-tell-my-brothers',	1,	'G2',	'E3',	NULL),
(634,	3,	135,	'You will show me the path of life',	'F2',	'F3',	'you-will-show-me-the-path-of-life',	1,	'A2',	'F3',	NULL),
(635,	3,	136,	'O God, by your name save me',	'E2',	'G3',	'o-god-by-your-name-save-me',	0,	'E2',	'E3',	NULL),
(636,	3,	136,	'Song of numbers',	'B1',	'D3',	'song-of-numbers',	1,	'B1',	'D3',	NULL),
(637,	3,	136,	'Hide me in the depths of your tent',	'C2',	'C3',	'hide-me-in-the-depths-of-your-tent',	1,	'E2',	'C3',	NULL),
(638,	3,	137,	'The fool thinks there is no God',	'D2',	'E3',	'the-fool-thinks-there-is-no-god',	1,	'E2',	'D3',	NULL),
(639,	3,	138,	'Lord, listen to my prayer',	'G2',	'D#3',	'lord-listen-to-my-prayer',	0,	'G2',	'D#3',	NULL),
(640,	3,	141,	'You are the light of the world',	'E2',	'A3',	'you-are-the-light-of-the-world',	1,	'G#2',	'E3',	NULL),
(641,	3,	142,	'Sola a solo',	'C1',	'C3',	'sola-a-solo-english',	1,	'D2',	'C3',	NULL),
(642,	3,	201,	'Sit down alone and in silence',	'D2',	'F#3',	'sit-down-alone-and-in-silence',	1,	'D2',	'D3',	NULL),
(643,	3,	202,	'Thus speaks the Amen',	'D2',	'D3',	'thus-speaks-the-amen',	1,	'A2',	'D3',	NULL),
(644,	3,	203,	'The kings shall see you',	'G1',	'C#3',	'the-kings-shall-see-you',	0,	'B1',	'C#3',	NULL),
(645,	3,	204,	'Jacob',	'F2',	'E3',	'jacob-english',	1,	'G2',	'E3',	NULL),
(646,	3,	205,	'Deborah',	'C2',	'D3',	'deborah',	0,	'F2',	'D3',	NULL),
(647,	3,	206,	'I see the heavens open',	'B1',	'E3',	'i-see-the-heavens-open',	1,	'G#2',	'E3',	NULL),
(648,	3,	207,	'The Lord has given me (3rd song of the Suffering Servant)',	'B1',	'C#3',	'the-lord-has-given-me-3rd-song-of-the-suffering-servant',	1,	'C#2',	'C#3',	NULL),
(649,	3,	208,	'Who is this who comes from Edom?',	'E2',	'F#3',	'who-is-this-who-comes-from-edom',	1,	'E2',	'B2',	NULL),
(650,	3,	209,	'The sower',	'B1',	'E3',	'the-sower',	1,	'B1',	'E3',	NULL),
(651,	3,	210,	'Behold, our mirror is the Lord',	'A#1',	'D3',	'behold-our-mirror-is-the-lord',	1,	'D2',	'D3',	NULL),
(652,	3,	211,	'Like the impulse of rage',	'G1',	'B2',	'like-the-impulse-of-rage',	1,	'E2',	'B2',	NULL),
(653,	3,	212,	'Blessed be God',	'F#2',	'D3',	'blessed-be-god',	1,	'G2',	'D3',	NULL),
(654,	3,	213,	'Lord, you search me and you know me',	'A1',	'D3',	'lord-you-search-me-and-you-know-me',	1,	'D2',	'D3',	NULL),
(655,	3,	214,	'Elí, Elí, lamá sabachtháni?',	'B1',	'F#3',	'eli-eli-lama-sabachthani',	1,	'A2',	'E3',	NULL),
(656,	3,	216,	'No one can serve two masters',	'D2',	'C3',	'no-one-can-serve-two-masters',	1,	'E2',	'C3',	NULL),
(657,	3,	217,	'O Lord, my heart has no lofty ambitions',	'B1',	'C3',	'o-lord-my-heart-has-no-lofty-ambitions',	1,	'B1',	'B2',	NULL),
(658,	3,	217,	'I want to go, mother',	'D2',	'G3',	'i-want-to-go-mother',	0,	'E2',	'G3',	NULL),
(659,	3,	218,	'Shema Israel',	'A1',	'D3',	'shema-israel-english',	1,	'A1',	'D3',	NULL),
(660,	3,	219,	'Hymn to the glorious cross',	'B1',	'F#3',	'hymn-to-the-glorious-cross',	1,	'B1',	'B2',	NULL),
(661,	3,	220,	'Clothe yourselves in the armour of God',	'D2',	'G3',	'clothe-yourselves-in-the-armour-of-god',	1,	'D2',	'G3',	NULL),
(662,	3,	221,	'O Jesus, my love',	'E2',	'F3',	'o-jesus-my-love',	1,	'E2',	'B2',	NULL),
(663,	3,	222,	'Aqedah',	'B1',	'E3',	'aqedah',	1,	'E2',	'C3',	NULL),
(664,	3,	223,	'This is my servant (1st song of the Suffering Servant)',	'B1',	'E3',	'this-is-my-servant-1st-song-of-the-suffering-servant',	1,	'B1',	'D3',	NULL),
(665,	3,	261,	'Do not get angry',	'A1',	'C3',	'do-not-get-angry',	1,	'A1',	'A2',	NULL),
(666,	3,	262,	'Hymn to charity',	'C1',	'E3',	'hymn-to-charity',	1,	'C1',	'E3',	NULL),
(667,	3,	263,	'The same God',	'C#2',	'E3',	'the-same-god',	1,	'C#2',	'E3',	NULL),
(668,	3,	264,	'Like men sentenced to death',	'G1',	'E3',	'like-men-sentenced-to-death',	1,	'G1',	'E3',	NULL),
(669,	3,	265,	'Jesus went around all the towns',	'A1',	'F3',	'jesus-went-around-all-the-towns',	1,	'E2',	'E3',	NULL),
(670,	3,	266,	'Do not resist evil',	'A1',	'D3',	'do-not-resist-evil',	1,	'D2',	'F#2',	NULL),
(671,	3,	267,	'Let him kiss me',	'C#2',	'E3',	'let-him-kiss-me',	1,	'C#2',	'E3',	NULL),
(672,	3,	269,	'Come from Lebanon',	'D2',	'B2',	'come-from-lebanon',	1,	'D2',	'B2',	NULL),
(673,	3,	270,	'While I was asleep',	'B1',	'E3',	'while-i-was-asleep',	1,	'E2',	'A2',	NULL),
(674,	3,	271,	'Flee, my beloved',	'E2',	'F3',	'flee-my-beloved',	1,	'E2',	'E3',	NULL),
(675,	3,	272,	'She-lamb of God',	'G1',	'D3',	'she-lamb-of-god',	1,	'G2',	'D3',	NULL),
(676,	3,	273,	'In him there is no beauty',	'C2',	'G3',	'in-him-there-is-no-beauty',	1,	'C2',	'D3',	NULL),
(677,	3,	274,	'Worthy are you',	'A1',	'D3',	'worthy-are-you',	1,	'D2',	'D3',	NULL),
(678,	3,	275,	'Who is she?',	'A1',	'D3',	'who-is-she',	1,	'A1',	'A2',	NULL),
(679,	3,	276,	'The voice of my beloved',	'F1',	'C3',	'the-voice-of-my-beloved',	1,	'G1',	'C3',	NULL),
(680,	3,	277,	'The Baptism of the Lord',	'B1',	'F#3',	'the-baptism-of-the-lord',	1,	'B1',	'C3',	NULL),
(681,	3,	279,	'Zion, mother of nations',	'A1',	'C3',	'zion-mother-of-nations',	1,	'D2',	'C3',	NULL),
(682,	3,	280,	'Take me to heaven',	'B1',	'E3',	'take-me-to-heaven',	1,	'B1',	'E3',	NULL),
(683,	3,	281,	'You are my hope, O Lord',	'A#1',	'F3',	'you-are-my-hope-o-lord',	0,	'E2',	'F3',	NULL),
(684,	3,	282,	'A great sign appeared in heaven',	'C1',	'E3',	'a-great-sign-appeared-in-heaven',	1,	'A2',	'D3',	NULL),
(685,	3,	283,	'I stretch out my arms',	'D2',	'E3',	'i-stretch-out-my-arms',	1,	'A2',	'E3',	NULL),
(686,	3,	284,	'Paschal homily of Melito of Sardis',	'D2',	'G3',	'paschal-homily-of-melito-of-sardis',	1,	'D2',	'D3',	NULL),
(687,	3,	285,	'Carmen \'63',	'E2',	'F#3',	'carmen-\'63-english',	0,	'E2',	'F#3',	NULL),
(688,	3,	286,	'Caritas Christi',	'E2',	'G#3',	'caritas-christi-english',	1,	'E2',	'G3',	NULL),
(689,	3,	287,	'Noli me tangere',	'E2',	'F3',	'noli-me-tangere-english',	1,	'F2',	'F3',	NULL),
(690,	3,	288,	'O Lord, help me, O Lord!',	'E2',	'E3',	'o-lord-help-me-o-lord',	1,	'F#2',	'E3',	NULL),
(691,	3,	289,	'You have seduced me, Lord',	'B1',	'F3',	'you-have-seduced-me-lord',	1,	'B1',	'E3',	NULL),
(692,	3,	290,	'The dark night of the soul',	'B1',	'D3',	'the-dark-night-of-the-soul',	1,	'B1',	'D3',	NULL),
(693,	3,	291,	'The sermon of the mount',	'B1',	'D3',	'the-sermon-of-the-mount',	1,	'D2',	'B2',	NULL),
(694,	3,	293,	'Brothers',	'E2',	'E3',	'brothers',	1,	'E2',	'E3',	NULL),
(695,	3,	295,	'You stole my heart',	'E2',	'F3',	'you-stole-my-heart',	1,	'E2',	'F3',	NULL),
(696,	3,	296,	'Hail, O Mary, incorrupt dove',	'C#2',	'E3',	'hail-o-mary-incorrupt-dove',	1,	'C#2',	'C#3',	NULL),
(697,	4,	21,	'A cabana dos pastores',	'C#2',	'E3',	'a-cabana-dos-pastores',	1,	'C#2',	'E3',	NULL),
(698,	4,	22,	'A ceifa das nações',	'D2',	'F3',	'a-ceifa-das-naçoes',	1,	'D2',	'D3',	NULL),
(699,	4,	23,	'A marcha é dura',	'B1',	'B2',	'a-marcha-e-dura',	1,	'E2',	'B2',	NULL),
(700,	4,	24,	'A ninguém demos ocasião de tropeço',	'E2',	'F3',	'a-ninguem-demos-ocasiao-de-tropeço',	1,	'E2',	'E3',	NULL),
(701,	4,	25,	'A ti levanto os meus olhos',	'A1',	'D3',	'a-ti-levanto-os-meus-olhos',	1,	'A1',	'D3',	NULL),
(702,	4,	26,	'A ti, Senhor, com minha voz gritando imploro',	'A1',	'D3',	'a-ti-senhor-com-minha-voz-gritando-imploro',	1,	'A1',	'C3',	NULL),
(703,	4,	27,	'A ti, Senhor levanto minha alma',	'A1',	'E3',	'a-ti-senhor-levanto-minha-alma',	1,	'A1',	'D3',	NULL),
(704,	4,	28,	'A ti, Senhor, se deve o louvor em Sião',	'A1',	'C3',	'a-ti-senhor-se-deve-o-louvor-em-siao',	1,	'E2',	'C3',	NULL),
(705,	4,	29,	'À vitima pascal',	'E1',	'B2',	'a-vitima-pascal',	1,	'G#1',	'B2',	NULL),
(706,	4,	30,	'Abraão',	'A1',	'D3',	'abraao',	1,	'G#2',	'D3',	NULL),
(707,	4,	31,	'Aclamai o Senhor',	'C2',	'G3',	'aclamai-o-senhor',	1,	'C2',	'A2',	NULL),
(708,	4,	32,	'Akedá',	'A1',	'E3',	'akeda-portugues',	1,	'E2',	'C3',	NULL),
(709,	4,	33,	'Alçai ó portas',	'D2',	'C#3',	'alçai-o-portas',	1,	'D2',	'C#3',	NULL),
(710,	4,	34,	'Aleluia! Bendizei o Senhor',	'G1',	'D3',	'aleluia-bendizei-o-senhor',	1,	'G1',	'D3',	NULL),
(711,	4,	35,	'Aleluia! Já chegou o reino',	'G2',	'E3',	'aleluia-ja-chegou-o-reino',	1,	'G2',	'E3',	NULL),
(712,	4,	36,	'Aleluia! Louvai o Senhor',	'A2',	'D3',	'aleluia-louvai-o-senhor',	1,	'A2',	'D3',	NULL),
(713,	4,	37,	'Amém, amém, amém',	'C2',	'A3',	'amem-amem-amem',	1,	'C2',	'A3',	NULL),
(714,	4,	38,	'Amo o Senhor',	'A1',	'D3',	'amo-o-senhor',	1,	'D2',	'D3',	NULL),
(715,	4,	39,	'Ao despertar',	'E2',	'E3',	'ao-despertar',	1,	'F#2',	'D3',	NULL),
(716,	4,	40,	'Até quando?',	'A1',	'G#2',	'ate-quando',	1,	'A1',	'G#2',	NULL),
(717,	4,	41,	'Ave Maria I',	'D2',	'E3',	'ave-maria-i-portugues',	1,	'D2',	'E3',	NULL),
(718,	4,	42,	'Ave Maria II',	'E2',	'E3',	'ave-maria-ii',	1,	'E2',	'E3',	NULL),
(719,	4,	43,	'Babilônia criminal',	'D#2',	'F#3',	'babilonia-criminal-portugues',	1,	'D#2',	'C3',	NULL),
(720,	4,	44,	'Balaão',	'B1',	'E3',	'balaao',	1,	'D2',	'E3',	NULL),
(721,	4,	45,	'Bendirei o Senhor em todo tempo',	'F2',	'F3',	'bendirei-o-senhor-em-todo-tempo',	1,	'F2',	'F3',	NULL),
(722,	4,	46,	'Bendita és tu, Maria',	'C2',	'D3',	'bendita-es-tu-maria',	1,	'C2',	'D3',	NULL),
(723,	4,	47,	'Bendito sejas, Senhor',	'E2',	'D3',	'bendito-sejas-senhor',	1,	'E2',	'D3',	NULL),
(724,	4,	48,	'Bendize, minha alma, a Iahweh',	'E2',	'D3',	'bendize-minha-alma-a-iahweh',	1,	'E2',	'A2',	NULL),
(725,	4,	49,	'Benedictus',	'C#2',	'C3',	'benedictus-portugues',	1,	'D2',	'A2',	NULL),
(726,	4,	50,	'Canta a Iahweh, Jerusalém',	'C2',	'A2',	'canta-a-iahweh-jerusalem',	1,	'C2',	'A2',	NULL),
(727,	4,	51,	'Cântico de Ana',	'A1',	'A2',	'cantico-de-ana',	0,	'E2',	'G2',	NULL),
(728,	4,	52,	'Cântico dos três jovens',	'D2',	'C3',	'cantico-dos-tres-jovens',	1,	'D2',	'C3',	NULL),
(729,	4,	53,	'Canto de Moisés',	'F2',	'G3',	'canto-de-moises-portugues',	0,	'G2',	'F3',	NULL),
(730,	4,	54,	'Caritas Christi urget nos',	'B1',	'D3',	'caritas-christi-urget-nos-portugues',	1,	'B1',	'D3',	NULL),
(731,	4,	55,	'Chegue à tua presença meu clamor',	'D2',	'B2',	'chegue-a-tua-presença-meu-clamor',	1,	'E2',	'B2',	NULL),
(732,	4,	56,	'Como a corça',	'B1',	'E3',	'como-a-corça',	1,	'D#2',	'C#3',	NULL),
(733,	4,	57,	'Como é maravilhoso',	'E2',	'E3',	'como-e-maravilhoso',	1,	'E2',	'E3',	NULL),
(734,	4,	58,	'Como ovelha que vê',	'F#2',	'C3',	'como-ovelha-que-ve',	1,	'F#2',	'C3',	NULL),
(735,	4,	59,	'Como são amáveis tuas moradas',	'G1',	'G2',	'como-sao-amaveis-tuas-moradas',	1,	'G1',	'G2',	NULL),
(736,	4,	60,	'Confessei a ti o meu pecado',	'G2',	'D3',	'confessei-a-ti-o-meu-pecado',	1,	'G2',	'C3',	NULL),
(737,	4,	61,	'Dayenu',	'D2',	'E3',	'dayenu-portugues',	1,	'D2',	'E3',	NULL),
(738,	4,	63,	'De profundis',	'A1',	'D3',	'de-profundis-portugues',	1,	'A1',	'A2',	NULL),
(739,	4,	64,	'Dia de repouso',	'B1',	'C3',	'dia-de-repouso',	1,	'B1',	'B2',	NULL),
(740,	4,	65,	'Diante dos anjos',	'A1',	'A2',	'diante-dos-anjos',	1,	'A1',	'A2',	NULL),
(741,	4,	66,	'Diz o Senhor ao meu Senhor',	'E2',	'D#3',	'diz-o-senhor-ao-meu-senhor',	1,	'E2',	'B2',	NULL),
(742,	4,	67,	'Dizei aos de coração cansado',	'B1',	'F3',	'dizei-aos-de-coraçao-cansado',	1,	'C2',	'F3',	NULL),
(743,	4,	68,	'Eis-me aqui que venho em breve',	'E2',	'F#3',	'eis-me-aqui-que-venho-em-breve',	0,	'E2',	'F#3',	NULL),
(744,	4,	69,	'Eli, Eli, lamá sabatani',	'F#2',	'F#3',	'eli-eli-lama-sabatani',	1,	'A2',	'E3',	NULL),
(745,	4,	70,	'Em meio a multidão',	'E2',	'D3',	'em-meio-a-multidao',	1,	'E2',	'A2',	NULL),
(746,	4,	71,	'Em uma noite escura',	'B1',	'D3',	'em-uma-noite-escura',	1,	'B1',	'D3',	NULL),
(747,	4,	72,	'Encontraram-se dois anjos',	'A1',	'F2',	'encontraram-se-dois-anjos',	1,	'A1',	'F2',	NULL),
(748,	4,	73,	'Esconde-me no oculto de tua tenda',	'G1',	'G2',	'esconde-me-no-oculto-de-tua-tenda',	1,	'B1',	'G2',	NULL),
(749,	4,	74,	'Esperei, esperei no Senhor',	'C2',	'B2',	'esperei-esperei-no-senhor',	1,	'C2',	'B2',	NULL),
(750,	4,	75,	'Estão rotas minhas ataduras',	'E2',	'F#3',	'estao-rotas-minhas-ataduras',	0,	'E2',	'F#3',	NULL),
(751,	4,	76,	'Este é o dia que fez o Senhor',	'E2',	'C3',	'este-e-o-dia-que-fez-o-senhor',	1,	'E2',	'B2',	NULL),
(752,	4,	77,	'Este é o meu mandamento',	'B1',	'E3',	'este-e-o-meu-mandamento',	1,	'B1',	'E3',	NULL),
(753,	4,	78,	'Estou chamando-te',	'D2',	'E3',	'estou-chamando-te',	1,	'E2',	'A#2',	NULL),
(754,	4,	79,	'Eu te amo, Senhor',	'F#2',	'G3',	'eu-te-amo-senhor',	1,	'F#2',	'F#3',	NULL),
(755,	4,	80,	'Eu venho reunir',	'B1',	'E3',	'eu-venho-reunir',	1,	'B1',	'A2',	NULL),
(756,	4,	81,	'Evenu shalom alehem',	'D2',	'D3',	'evenu-shalom-alehem-portugues',	1,	'D2',	'D3',	NULL),
(757,	4,	82,	'Exultai, justos, no Senhor',	'D2',	'E3',	'exultai-justos-no-senhor',	1,	'D2',	'B2',	NULL),
(758,	4,	83,	'Felicidade para o homem',	'A1',	'F3',	'felicidade-para-o-homem',	1,	'A1',	'D3',	NULL),
(759,	4,	84,	'Feliz o homem',	'D2',	'D3',	'feliz-o-homem',	1,	'D2',	'C3',	NULL),
(760,	4,	85,	'Filhas de Jerusalém',	'E2',	'E3',	'filhas-de-jerusalem',	1,	'G2',	'D3',	NULL),
(761,	4,	86,	'Foge, ó meu amado',	'E2',	'F3',	'foge-o-meu-amado',	0,	'E2',	'E3',	NULL),
(762,	4,	87,	'Graças a Iahweh',	'E2',	'F#3',	'graças-a-iahweh',	1,	'E2',	'E3',	NULL),
(763,	4,	88,	'Gritai jubilosos',	'D2',	'D3',	'gritai-jubilosos',	1,	'F2',	'C3',	NULL),
(764,	4,	89,	'Hino a Cristo luz',	'D2',	'E3',	'hino-a-cristo-luz',	1,	'E2',	'E3',	NULL),
(765,	4,	90,	'Hino à kenosis',	'D#2',	'E3',	'hino-a-kenosis',	1,	'F#2',	'B2',	NULL),
(766,	4,	91,	'Hino da Ascensão',	'G2',	'E3',	'hino-da-ascensao',	1,	'G2',	'B2',	NULL),
(767,	4,	92,	'Hino da Páscoa',	'A1',	'A2',	'hino-da-pascoa',	1,	'A1',	'A2',	NULL),
(768,	4,	93,	'Hino do Advento',	'D2',	'D3',	'hino-do-advento',	1,	'G2',	'D3',	NULL),
(769,	4,	94,	'Iahweh, tu és meu Deus',	'D2',	'D3',	'iahweh-tu-es-meu-deus',	1,	'D2',	'F2',	NULL),
(770,	4,	95,	'Ide a anunciai a meus irmãos',	'A1',	'E3',	'ide-a-anunciai-a-meus-irmaos',	1,	'E2',	'E3',	NULL),
(771,	4,	96,	'Impropérios',	'E2',	'F#3',	'improperios-portugues',	1,	'E2',	'F#3',	NULL),
(772,	4,	97,	'Já vem o meu Deus',	'E2',	'C3',	'ja-vem-o-meu-deus',	1,	'E2',	'C3',	NULL),
(773,	4,	98,	'Jerusalém reconstruída',	'G1',	'C3',	'jerusalem-reconstruida',	1,	'C2',	'A2',	NULL),
(774,	4,	99,	'Leva-me ao céu',	'B1',	'G#3',	'leva-me-ao-ceu',	1,	'B1',	'E3',	NULL),
(775,	4,	100,	'Levanto os meus olhos para os montes',	'E2',	'E3',	'levanto-os-meus-olhos-para-os-montes',	1,	'E2',	'E3',	NULL),
(776,	4,	101,	'Louvai o Senhor',	'D2',	'E3',	'louvai-o-senhor',	1,	'D2',	'D3',	NULL),
(777,	4,	102,	'Louvai o Senhor nos céus',	'E2',	'A2',	'louvai-o-senhor-nos-ceus',	1,	'E2',	'A2',	NULL),
(778,	4,	103,	'Magnificat',	'E2',	'E3',	'magnificat-portugues',	1,	'E2',	'D3',	NULL),
(779,	4,	104,	'Maria, casa da bênção',	'E2',	'G3',	'maria-casa-da-bençao',	1,	'F2',	'G3',	NULL),
(780,	4,	105,	'Maria de Jasna Göra',	'E2',	'A3',	'maria-de-jasna-gora-portugues',	0,	'F#2',	'F#3',	NULL),
(781,	4,	106,	'Maria, mãe da Igreja',	'B1',	'G3',	'maria-mae-da-igreja',	1,	'E2',	'G3',	NULL),
(782,	4,	107,	'Maria, mãe do caminho ardente',	'C1',	'D3',	'maria-mae-do-caminho-ardente',	1,	'C1',	'D3',	NULL),
(783,	4,	108,	'Maria, pequena Maria',	'D2',	'F#3',	'maria-pequena-maria-portugues',	1,	'D2',	'D3',	NULL),
(784,	4,	109,	'Maria, pomba incorrupta',	'C#2',	'E3',	'maria-pomba-incorrupta',	0,	'C#2',	'C#3',	NULL),
(785,	4,	110,	'Misericórdia minha, misericórdia',	'C2',	'A#2',	'misericordia-minha-misericordia',	1,	'C2',	'A#2',	NULL),
(786,	4,	111,	'Mostrar-me-ás o caminho da vida',	'C1',	'C3',	'mostrar-me-as-o-caminho-da-vida',	1,	'E2',	'C3',	NULL),
(787,	4,	112,	'Muito me perseguiram',	'A1',	'D3',	'muito-me-perseguiram',	1,	'A1',	'D3',	NULL),
(788,	4,	113,	'Não está aqui, ressuscitou',	'G1',	'D#3',	'nao-esta-aqui-ressuscitou',	1,	'G2',	'D3',	NULL),
(789,	4,	114,	'Não há nele aparência',	'C2',	'G3',	'nao-ha-nele-aparencia',	1,	'C2',	'D3',	NULL),
(790,	4,	115,	'Ó céus, chovei do alto',	'E2',	'D3',	'o-ceus-chovei-do-alto',	1,	'E2',	'D3',	NULL),
(791,	4,	116,	'O combate escatológico',	'B1',	'E3',	'o-combate-escatologico',	0,	'E2',	'E3',	NULL),
(792,	4,	117,	'Ó Deus, pelo teu nome, salva-me',	'B1',	'D3',	'o-deus-pelo-teu-nome-salva-me',	1,	'B1',	'D3',	NULL),
(793,	4,	118,	'Ó Deus, tu és meu Deus',	'E2',	'E3',	'o-deus-tu-es-meu-deus',	1,	'E2',	'C3',	NULL),
(794,	4,	119,	'Ó Jesus, meu amor',	'B1',	'E3',	'o-jesus-meu-amor',	1,	'A2',	'D3',	NULL),
(795,	4,	120,	'O Messias, Leão para vencer',	'A2',	'F3',	'o-messias-leao-para-vencer',	1,	'A2',	'D3',	NULL),
(796,	4,	121,	'Ó morte, onde está a tua vitória?',	'A1',	'C3',	'o-morte-onde-esta-a-tua-vitoria',	0,	'D2',	'C3',	NULL),
(797,	4,	122,	'O néscio pensa que Deus não existe',	'D2',	'D3',	'o-nescio-pensa-que-deus-nao-existe',	1,	'D2',	'D3',	NULL),
(798,	4,	123,	'O povo que caminhava nas trevas',	'G1',	'B2',	'o-povo-que-caminhava-nas-trevas',	1,	'A1',	'B2',	NULL),
(799,	4,	124,	'O Senhor anuncia uma notícia',	'D2',	'E3',	'o-senhor-anuncia-uma-noticia',	1,	'D2',	'B2',	NULL),
(800,	4,	125,	'O Senhor é meu pastor',	'G1',	'D3',	'o-senhor-e-meu-pastor',	1,	'D2',	'B2',	NULL),
(801,	4,	126,	'O Senhor é minha luz e salvação',	'D2',	'E3',	'o-senhor-e-minha-luz-e-salvaçao',	1,	'D2',	'D3',	NULL),
(802,	4,	127,	'Ó Senhor, nosso Deus',	'B1',	'G3',	'o-senhor-nosso-deus',	1,	'B1',	'C3',	NULL),
(803,	4,	128,	'Olhai que estupendo',	'A1',	'C3',	'olhai-que-estupendo',	1,	'A1',	'A2',	NULL),
(804,	4,	129,	'Os meninos de Belém',	'A1',	'B2',	'os-meninos-de-belem',	1,	'A1',	'B2',	NULL),
(805,	4,	130,	'Para ti morada santa',	'E2',	'F3',	'para-ti-morada-santa',	1,	'E2',	'E3',	NULL),
(806,	4,	131,	'Pentecostes',	'A1',	'C#3',	'pentecostes-portugues',	1,	'A1',	'A#2',	NULL),
(807,	4,	132,	'Por amor de meus amigos',	'A1',	'D3',	'por-amor-de-meus-amigos',	1,	'E2',	'D3',	NULL),
(808,	4,	133,	'Por que confabulam as nações?',	'B1',	'E3',	'por-que-confabulam-as-naçoes',	1,	'E2',	'E3',	NULL),
(809,	4,	134,	'Por que esta noite é diferente',	'E2',	'G3',	'por-que-esta-noite-e-diferente',	1,	'E2',	'G3',	NULL),
(810,	4,	135,	'Porque o meu jugo é suave',	'A1',	'C3',	'porque-o-meu-jugo-e-suave',	1,	'E2',	'C3',	NULL),
(811,	4,	136,	'Quando Israel saiu do Egito',	'E2',	'F#3',	'quando-israel-saiu-do-egito',	0,	'E2',	'F#3',	NULL),
(812,	4,	137,	'Quando o Senhor',	'B1',	'B2',	'quando-o-senhor',	0,	'B1',	'B2',	NULL),
(813,	4,	138,	'Que estupendo, que alegria',	'A1',	'C3',	'que-estupendo-que-alegria-portugues',	1,	'A1',	'C3',	NULL),
(814,	4,	139,	'Quem é esta que sobe do deserto',	'A1',	'D3',	'quem-e-esta-que-sobe-do-deserto',	1,	'A1',	'A2',	NULL),
(815,	4,	140,	'Quem nos separará',	'D2',	'D3',	'quem-nos-separara',	1,	'D2',	'D3',	NULL),
(816,	4,	141,	'Quero andar',	'D2',	'G3',	'quero-andar',	1,	'D2',	'G3',	NULL),
(817,	4,	142,	'Quero cantar',	'D2',	'C#3',	'quero-cantar',	1,	'D2',	'C#3',	NULL),
(818,	4,	143,	'Ressuscitou',	'E2',	'D3',	'ressuscitou',	1,	'E2',	'D3',	NULL),
(819,	4,	144,	'Resurrexit',	'A1',	'D3',	'resurrexit-portugues',	1,	'A1',	'C3',	NULL),
(820,	4,	145,	'Salve rainha',	'D2',	'D#3',	'salve-rainha',	1,	'D2',	'D#3',	NULL),
(821,	4,	146,	'Salve rainha dos céus',	'G2',	'E3',	'salve-rainha-dos-ceus',	1,	'G#2',	'D3',	NULL),
(822,	4,	147,	'Se hoje escutardes a sua voz',	'A1',	'C3',	'se-hoje-escutardes-a-sua-voz',	1,	'C2',	'C3',	NULL),
(823,	4,	148,	'Se me refugiei no Senhor',	'E2',	'E3',	'se-me-refugiei-no-senhor',	1,	'E2',	'C3',	NULL),
(824,	4,	149,	'Se o Senhor não constrói a casa',	'C#2',	'F#3',	'se-o-senhor-nao-constroi-a-casa',	1,	'F#2',	'F#3',	NULL),
(825,	4,	150,	'Se vós ressuscitastes com Cristo',	'B1',	'D3',	'se-vos-ressuscitastes-com-cristo',	1,	'B1',	'D3',	NULL),
(826,	4,	151,	'Seduziste-me, Senhor',	'B1',	'F3',	'seduziste-me-senhor',	1,	'B1',	'E3',	NULL),
(827,	4,	152,	'Senhor, ajuda-me a não duvidar de ti',	'E2',	'E3',	'senhor-ajuda-me-a-nao-duvidar-de-ti',	1,	'E2',	'D3',	NULL),
(828,	4,	153,	'Senhor, não me corrijas na tua cólera',	'C#2',	'F#3',	'senhor-nao-me-corrijas-na-tua-colera',	1,	'C#2',	'F#3',	NULL),
(829,	4,	154,	'Shlom-lej Mariam',	'B1',	'G3',	'shlom-lej-mariam-portugues',	1,	'B1',	'A2',	NULL),
(830,	4,	155,	'Sião, mãe de todos os povos',	'A1',	'C3',	'siao-mae-de-todos-os-povos',	1,	'B1',	'C3',	NULL),
(831,	4,	156,	'Só a só',	'E2',	'F3',	'so-a-so',	1,	'F2',	'F3',	NULL),
(832,	4,	157,	'Sobe Deus entre aclamações',	'E2',	'A#2',	'sobe-deus-entre-aclamaçoes',	1,	'E2',	'A#2',	NULL),
(833,	4,	158,	'Stabat mater dolorosa',	'E2',	'G3',	'stabat-mater-dolorosa-portugues',	1,	'E2',	'F3',	NULL),
(834,	4,	159,	'Tu és formoso',	'B1',	'G#3',	'tu-es-formoso',	1,	'B1',	'C#3',	NULL),
(835,	4,	160,	'Tu que és fiel',	'G2',	'D#3',	'tu-que-es-fiel',	0,	'G2',	'D#3',	NULL),
(836,	4,	161,	'Um grande sinal',	'A1',	'G3',	'um-grande-sinal',	1,	'A2',	'G3',	NULL),
(837,	4,	162,	'Um rebento brota do tronco de Jessé',	'G2',	'E3',	'um-rebento-brota-do-tronco-de-jesse',	1,	'G2',	'C3',	NULL),
(838,	4,	163,	'Uri, uri, uri, urá',	'A2',	'F3',	'uri-uri-uri-ura-portugues',	1,	'A2',	'F3',	NULL),
(839,	4,	164,	'Vamos já, pastores',	'E2',	'C3',	'vamos-ja-pastores',	1,	'E2',	'C3',	NULL),
(840,	4,	165,	'Vem do Líbano',	'D2',	'B2',	'vem-do-libano',	1,	'D2',	'B2',	NULL),
(841,	4,	166,	'Vem, Espírito Santo',	'A2',	'G3',	'vem-espirito-santo',	1,	'A2',	'F3',	NULL),
(842,	4,	167,	'Vem, filho do homem',	'E2',	'D#3',	'vem-filho-do-homem',	1,	'G2',	'B2',	NULL),
(843,	4,	168,	'Vem o Senhor',	'F#2',	'C3',	'vem-o-senhor',	1,	'F#2',	'C3',	NULL),
(844,	4,	169,	'Veni Creator',	'G2',	'E3',	'veni-creator-portugues',	1,	'G2',	'B2',	NULL),
(845,	4,	170,	'Virgem da maravilha',	'C#2',	'E3',	'virgem-da-maravilha',	1,	'C#2',	'A2',	NULL),
(846,	4,	171,	'Vivei alegres',	'E2',	'G3',	'vivei-alegres',	1,	'E2',	'F3',	NULL),
(847,	4,	172,	'Vós sois a luz do mundo',	'E2',	'A3',	'vos-sois-a-luz-do-mundo',	1,	'G#2',	'E3',	NULL),
(848,	4,	173,	'Vos tomarei dentre as nações',	'F2',	'E3',	'vos-tomarei-dentre-as-naçoes',	1,	'F2',	'E3',	NULL),
(849,	4,	174,	'Zaqueu',	'E2',	'F3',	'zaqueu',	1,	'E2',	'F3',	NULL),
(850,	4,	175,	'Aleluia interleccional (I)',	'D2',	'E3',	'aleluia-interleccional-i',	1,	'F#2',	'C3',	NULL),
(851,	4,	175,	'Aleluia interleccional (II)',	'D2',	'B2',	'aleluia-interleccional-ii',	1,	'D2',	'B2',	NULL),
(852,	4,	175,	'Aleluia interleccional (III)',	'G2',	'E3',	'aleluia-interleccional-iii',	1,	'G2',	'E3',	NULL),
(853,	4,	176,	'Aleluia pascal',	'E2',	'A3',	'aleluia-pascal',	1,	'E2',	'E3',	NULL),
(854,	4,	177,	'Anáfora do sal',	'A1',	'D3',	'anafora-do-sal',	1,	'G2',	'D3',	NULL),
(855,	4,	178,	'Antífona - versículo antes do Evangelho (I)',	'D2',	'E3',	'antifona-versiculo-antes-do-evangelho-i',	1,	'G2',	'D3',	NULL),
(856,	4,	178,	'Antífona - versículo antes do Evangelho (II)',	'D2',	'E3',	'antifona-versiculo-antes-do-evangelho-ii',	1,	'G2',	'D3',	NULL),
(857,	4,	179,	'Bênção da água',	'E2',	'G3',	'bençao-da-agua',	1,	'E2',	'F#3',	NULL),
(858,	4,	181,	'Benção penitencial',	'A1',	'D3',	'bençao-penitencial',	0,	'G2',	'D3',	NULL),
(859,	4,	182,	'Cordeiro de Deus',	'C2',	'A2',	'cordeiro-de-deus',	1,	'C2',	'A2',	NULL),
(860,	4,	183,	'Credo',	'C2',	'F3',	'credo-portugues',	1,	'C2',	'F3',	NULL),
(861,	4,	184,	'Glória a Deus no alto do céu',	'D2',	'E3',	'gloria-a-deus-no-alto-do-ceu',	1,	'D2',	'E3',	NULL),
(862,	4,	185,	'Hino das laudes de Pentecostes',	'G2',	'E3',	'hino-das-laudes-de-pentecostes',	1,	'G2',	'B2',	NULL),
(863,	4,	188,	'Ladainha penitencial I',	'E2',	'D3',	'ladainha-penitencial-i',	1,	'F#2',	'D3',	NULL),
(864,	4,	189,	'Ladainha penitencial II',	'E2',	'D3',	'ladainha-penitencial-ii',	1,	'F#2',	'D3',	NULL),
(865,	4,	191,	'Oração Eucarística II (Prefácio)',	'A1',	'D3',	'oraçao-eucaristica-ii-prefacio',	0,	'F2',	'D3',	NULL),
(866,	4,	192,	'Oração Eucarística II (Relato da instituição + Aclamação)',	'A1',	'E3',	'oraçao-eucaristica-ii-relato-da-instituiçao-+-aclamaçao',	1,	'D2',	'A#2',	NULL),
(867,	4,	193,	'Oração Eucarística II (Memorial, etc. até o final)',	'D2',	'E3',	'oraçao-eucaristica-ii-memorial-etc-ate-o-final',	1,	'B2',	'E3',	NULL),
(868,	4,	193,	'Oração Eucarística II (Doxologia quando o “Memorial e a oferenda” faz-se recitada)',	'G1',	'E3',	'oraçao-eucaristica-ii-doxologia',	1,	NULL,	NULL,	NULL),
(924,	1,	290,	'Hotuba Mlimani',	'B1',	'D3',	'hotuba-mlimani',	0,	'D2',	'B2',	NULL),
(869,	4,	194,	'Oração Eucarística IV',	'G1',	'A2',	'oraçao-eucaristica-iv',	1,	NULL,	NULL,	NULL),
(870,	4,	198,	'Orações Universais',	'E2',	'D3',	'oraçoes-universais',	1,	'E2',	'D3',	NULL),
(871,	4,	199,	'Pai nosso',	'D2',	'D3',	'pai-nosso',	1,	'D2',	'D3',	NULL),
(872,	4,	200,	'Prefácio para Advento e Natal',	'D2',	'E3',	'prefacio-para-advento-e-natal',	0,	'G2',	'C3',	NULL),
(873,	4,	201,	'Prefácio para o tempo Pascal',	'A1',	'D3',	'prefacio-para-o-tempo-pascal',	0,	'G2',	'D3',	NULL),
(874,	4,	202,	'Pregão Pascal',	'G1',	'D3',	'pregao-pascal',	1,	'E2',	'D3',	NULL),
(875,	4,	205,	'Santo 1982',	'A1',	'G3',	'santo-1982',	1,	'A1',	'G3',	NULL),
(876,	4,	206,	'Santo 1988',	'E2',	'D3',	'santo-1988',	1,	'E2',	'D3',	NULL),
(877,	4,	207,	'Santo Hebraico',	'A1',	'A#2',	'santo-hebraico',	1,	'A1',	'A#2',	NULL),
(878,	4,	209,	'Santo Palestina 74',	'D2',	'G3',	'santo-palestina-74',	1,	'D2',	'F3',	NULL),
(879,	4,	209,	'Santo Palomeras 65',	'C2',	'D3',	'santo-palomeras-65',	1,	'D#2',	'C#3',	NULL),
(880,	4,	210,	'Santo Roma 77',	'G1',	'B2',	'santo-roma-77',	1,	'G1',	'A2',	NULL),
(881,	4,	211,	'Te Deum',	'G1',	'E3',	'te-deum-portugues',	1,	'G1',	'E3',	NULL),
(882,	4,	213,	'As armas da luz',	'A1',	'D3',	'as-armas-da-luz',	1,	'A1',	'D3',	NULL),
(883,	4,	214,	'Assim fala o amém',	'D#2',	'D3',	'assim-fala-o-amem',	1,	'A2',	'D3',	NULL),
(884,	4,	215,	'Bendito seja Deus',	'F#2',	'F#3',	'bendito-seja-deus',	1,	'A2',	'F#3',	NULL),
(885,	4,	216,	'Como o impulso que sente a ira',	'G1',	'B2',	'como-o-impulso-que-sente-a-ira',	1,	'E2',	'B2',	NULL),
(886,	4,	217,	'Consolai o meu povo',	'B1',	'D3',	'consolai-o-meu-povo',	1,	'B1',	'B2',	NULL),
(887,	4,	218,	'Débora',	'C2',	'D3',	'debora-portugues',	0,	'E2',	'D3',	NULL),
(888,	4,	219,	'Eis o meu servo',	'A1',	'A2',	'eis-o-meu-servo',	1,	'A1',	'F2',	NULL),
(889,	4,	220,	'Eis que o nosso espelho é o Senhor',	'A#1',	'D3',	'eis-que-o-nosso-espelho-e-o-senhor',	1,	'D2',	'D3',	NULL),
(890,	4,	221,	'Escutai ilhas de longe',	'G1',	'C#3',	'escutai-ilhas-de-longe',	0,	'B1',	'C#3',	NULL),
(891,	4,	222,	'Hino à Cruz gloriosa',	'B1',	'F#3',	'hino-a-cruz-gloriosa',	1,	'B1',	'B2',	NULL),
(892,	4,	223,	'Jacó',	'F2',	'E3',	'jaco',	1,	'G2',	'E3',	NULL),
(893,	4,	224,	'Não sofras pelos malvados',	'A1',	'C3',	'nao-sofras-pelos-malvados',	1,	'B1',	'A2',	NULL),
(894,	4,	225,	'Ninguém pode servir a dois senhores',	'A1',	'G2',	'ninguem-pode-servir-a-dois-senhores',	1,	'B1',	'G2',	NULL),
(895,	4,	226,	'O lagareiro',	'E2',	'F#3',	'o-lagareiro',	1,	'E2',	'D3',	NULL),
(896,	4,	227,	'O mesmo Deus',	'C#2',	'E3',	'o-mesmo-deus',	1,	'C#2',	'E3',	NULL),
(897,	4,	228,	'O semeador',	'A1',	'D3',	'o-semeador',	1,	'A1',	'D3',	NULL),
(898,	4,	229,	'O Senhor me deu',	'B1',	'C#3',	'o-senhor-me-deu',	1,	'F#2',	'B2',	NULL),
(899,	4,	230,	'Ó Senhor, meu coração não é pretensioso',	'B1',	'C3',	'o-senhor-meu-coraçao-nao-e-pretensioso',	1,	'B1',	'B2',	NULL),
(900,	4,	231,	'Quando dormia',	'G#1',	'E3',	'quando-dormia',	1,	'E2',	'A2',	NULL),
(901,	4,	232,	'Senhor, tu me escrutas e conheces',	'A1',	'D3',	'senhor-tu-me-escrutas-e-conheces',	1,	'D2',	'D3',	NULL),
(902,	4,	233,	'Senta-te solitário e silencioso',	'B1',	'F#3',	'senta-te-solitario-e-silencioso',	1,	'D2',	'D3',	NULL),
(903,	4,	234,	'Shemá Israel',	'A1',	'D3',	'shema-israel-portugues',	1,	'A1',	'D3',	NULL),
(904,	4,	235,	'Tu cobriste de vergonha a morte',	'D2',	'G3',	'tu-cobriste-de-vergonha-a-morte',	1,	'D2',	'D3',	NULL),
(905,	4,	236,	'Tu és digno de receber o livro',	'A1',	'D3',	'tu-es-digno-de-receber-o-livro',	1,	'D2',	'D3',	NULL),
(906,	4,	237,	'À ceia do cordeiro',	'G2',	'F3',	'a-ceia-do-cordeiro',	1,	'G2',	'D3',	NULL),
(907,	4,	238,	'A cordeira de Deus',	'E2',	'D3',	'a-cordeira-de-deus',	1,	'G2',	'D3',	NULL),
(908,	4,	239,	'A pomba voou',	'A1',	'F#3',	'a-pomba-voou',	1,	'A1',	'C3',	NULL),
(909,	4,	240,	'A voz do meu amado',	'F1',	'C3',	'a-voz-do-meu-amado',	1,	'C2',	'C3',	NULL),
(910,	4,	241,	'Abba, Pai',	'C2',	'F3',	'abba-pai',	1,	'C2',	'F3',	NULL),
(911,	4,	242,	'Como condenados a morte',	'E2',	'E3',	'como-condenados-a-morte',	1,	'E2',	'E3',	NULL),
(912,	4,	243,	'Como escorre o mel',	'E1',	'E3',	'como-escorre-o-mel',	1,	'F1',	'E3',	NULL),
(913,	4,	244,	'Como lírio entre os espinhos',	'G1',	'D3',	'como-lirio-entre-os-espinhos',	1,	'B2',	'C#3',	NULL),
(914,	4,	245,	'Estendo minhas mãos',	'E2',	'E3',	'estendo-minhas-maos',	1,	'A2',	'E3',	NULL),
(915,	4,	246,	'Formosa és, amiga minha',	'A1',	'D3',	'formosa-es-amiga-minha',	1,	'A1',	'A2',	NULL),
(916,	4,	247,	'Hino à caridade',	'G1',	'G2',	'hino-a-caridade',	1,	'G1',	'G2',	NULL),
(917,	4,	248,	'Jesus percorria todas as cidades',	'C2',	'F3',	'jesus-percorria-todas-as-cidades',	1,	'E2',	'E3',	NULL),
(918,	4,	249,	'Não resistais ao mal',	'A1',	'D3',	'nao-resistais-ao-mal',	1,	'D2',	'F#2',	NULL),
(919,	4,	250,	'Noli me tangere',	'E2',	'F3',	'noli-me-tangere-portugues',	0,	'G2',	'F3',	NULL),
(920,	4,	251,	'O Espírito do Senhor está sobre mim',	'E2',	'D3',	'o-espirito-do-senhor-esta-sobre-mim',	1,	'E2',	'D3',	NULL),
(921,	4,	252,	'Roubaste o meu coração',	'E2',	'F3',	'roubaste-o-meu-coraçao',	1,	'E2',	'F3',	NULL),
(922,	4,	253,	'Sermão da montanha',	'B1',	'D3',	'sermao-da-montanha',	1,	'D2',	'B2',	NULL),
(923,	4,	254,	'Tu és a minha esperança, Senhor',	'A1',	'F3',	'tu-es-a-minha-esperança-senhor',	1,	'A2',	'F3',	NULL),
(925,	1,	211,	'Kama msukumo wa hasira',	'G1',	'B2',	'kama-msukumo-wa-hasira',	1,	'E2',	'B2',	NULL),
(926,	1,	261,	'Usikasirike na wabaya',	'A1',	'C3',	'usikasirike-na-wabaya',	1,	'B1',	'A2',	NULL),
(927,	1,	105,	'Nalikujulisha dhambi yangu',	'E2',	'D3',	'nalikujulisha-dhambi-yangu',	1,	'E2',	'C3',	NULL),
(928,	1,	121,	'Maria wa Jasna Gora',	'E2',	'A3',	'maria-wa-jasna-gora',	0,	'F#2',	'F#3',	NULL),
(929,	1,	53,	'Tazama, naja upesi',	'B2',	'C#3',	'tazama-naja-upesi',	0,	'B2',	'C#3',	NULL),
(930,	1,	276,	'Sauti ya mpendwa wangu',	'F1',	'C3',	'sauti-ya-mpendwa-wangu',	1,	'C2',	'C3',	NULL),
(969,	5,	25,	'Abbà, Padre',	'E2',	'F3',	'abba-padre-italiano',	1,	'E2',	'F3',	NULL),
(932,	1,	138,	'Mpumbavu awaza, \"Hakuna Mungu\"',	'D2',	'E3',	'mpumbavu-awaza-\"hakuna-mungu\"',	1,	'D2',	'D3',	NULL),
(933,	1,	NULL,	'Mwanakondoo wa Mungu',	'B1',	'A2',	'mwanakondoo-wa-mungu',	1,	'B1',	'A2',	NULL),
(934,	1,	NULL,	'Baba Yetu',	'D2',	'D3',	'baba-yetu',	0,	'D2',	'D3',	NULL),
(935,	1,	NULL,	'Kanuni ya Imani',	'C2',	'F3',	'kanuni-ya-imani',	1,	'C2',	'F3',	NULL),
(936,	1,	NULL,	'Nitawatwaa kati ya mataifa',	'F2',	'E3',	'nitawatwaa-kati-ya-mataifa',	1,	'F2',	'E3',	NULL),
(937,	1,	NULL,	'Katikati ya umati mkubwa',	'E2',	'D3',	'katikati-ya-umati-mkubwa',	1,	'E2',	'A2',	NULL),
(938,	1,	NULL,	'Salamu Maria, njiwa asiyeoza',	'C#2',	'C#3',	'salamu-maria-njiwa-asiyeoza',	0,	'C#2',	'C#3',	NULL),
(939,	1,	NULL,	'Kama kondoo aonaye jinsi wapelekavyo kikondoo wake machinjoni',	'F#2',	'C3',	'kama-kondoo-aonaye-jinsi-wapelekavyo-kikondoo-wake-machinjoni',	1,	'F#2',	'C3',	NULL),
(940,	1,	NULL,	'Peke yako kwa peke yake',	'E2',	'F3',	'peke-yako-kwa-peke-yake',	1,	'F2',	'F3',	NULL),
(941,	1,	278,	'Kama asali inavyotona',	'E1',	'E3',	'kama-asali-inavyotona',	1,	'F1',	'E3',	NULL),
(942,	1,	NULL,	'Ikiwa mmefufuka na Kristo',	'B1',	'E3',	'ikiwa-mmefufuka-na-kristo',	1,	'E2',	'D3',	NULL),
(943,	1,	NULL,	'Umeniibia moyo',	'E2',	'F3',	'umeniibia-moyo',	1,	'E3',	'F3',	NULL),
(944,	1,	122,	'Kwako, Bwana, kwa sauti yangu',	'A1',	'D3',	'kwako-bwana-kwa-sauti-yangu',	1,	'A1',	'C3',	NULL),
(945,	1,	210,	'Tazama kioo chetu ndiye Bwana',	'A#1',	'D3',	'tazama-kioo-chetu-ndiye-bwana',	1,	'D2',	'D3',	NULL),
(946,	1,	266,	'Msishindane na uovu',	'A1',	'D3',	'msishindane-na-uovu',	1,	'D2',	'F#2',	NULL),
(947,	1,	268,	'Mpenzi wangu ni kwangu',	'G1',	'D3',	'mpenzi-wangu-ni-kwangu',	1,	'B2',	'C#3',	NULL),
(948,	1,	288,	'Ee Bwana, nisaidie kutosita juu yako',	'E2',	'E3',	'ee-bwana-nisaidie-kutosita-juu-yako',	1,	'E2',	'E3',	NULL),
(949,	1,	289,	'Ee Bwana, umenihadhaa',	'B1',	'F3',	'ee-bwana-umenihadhaa',	1,	'B1',	'E3',	NULL),
(951,	1,	203,	'Watakuona Wafalme: Wimbo wa 2 wa Mtumishi wa Yahweh',	'G1',	'C#3',	'watakuona-wafalme-wimbo-wa-2-wa-mtumishi-wa-yahweh',	0,	'B1',	'C#3',	NULL),
(952,	1,	204,	'Yakobo',	'E2',	'F3',	'yakobo',	1,	'G2',	'E3',	NULL),
(953,	1,	205,	'Debora',	'C2',	'D3',	'debora-kiswahili',	0,	'E2',	'D3',	NULL),
(954,	1,	277,	'Hua aliruka',	'A1',	'F#3',	'hua-aliruka',	1,	'A1',	'C3',	NULL),
(955,	1,	127,	'Bwana, usinikemee kwa hasira yako',	'C#2',	'G3',	'bwana-usinikemee-kwa-hasira-yako',	0,	'C#2',	'G3',	NULL),
(957,	3,	25,	'Berakah before meals',	'E2',	'E3',	'berakah-before-meals',	1,	'E2',	'E3',	NULL),
(958,	3,	29,	'The Apostles\' Creed',	'C2',	'F3',	'the-apostles\'-creed',	1,	'C2',	'F3',	NULL),
(959,	3,	139,	'He is not here, He has risen',	'C2',	'D3',	'he-is-not-here-he-has-risen',	1,	'G2',	'D3',	NULL),
(960,	3,	140,	'I will take you from the nations',	'F2',	'E3',	'i-will-take-you-from-the-nations',	1,	'F2',	'E3',	NULL),
(961,	3,	143,	'In the midst of a great crowd',	'E2',	'D3',	'in-the-midst-of-a-great-crowd',	1,	'E2',	'A2',	NULL),
(962,	3,	144,	'Zaccheus',	'A2',	'A#3',	'zaccheus',	1,	'A2',	'A3',	NULL),
(963,	3,	210,	'The Spirit of the Lord is upon me',	'E2',	'D3',	'the-spirit-of-the-lord-is-upon-me',	1,	'E2',	'D3',	NULL),
(964,	3,	294,	'This is my commandment',	'B1',	'E3',	'this-is-my-commandment',	1,	'B1',	'E3',	NULL),
(965,	3,	297,	'If you are risen with Christ',	'F#2',	'D3',	'if-you-are-risen-with-christ',	1,	'F#2',	'C3',	NULL),
(966,	4,	NULL,	'É paciente',	'B1',	'E3',	'e-paciente',	1,	'D2',	'E3',	NULL),
(967,	2,	NULL,	'Es paciente - Himno al Espíritu Santo',	'B1',	'E3',	'es-paciente-himno-al-espiritu-santo',	1,	'D2',	'E3',	NULL),
(968,	2,	NULL,	'Como oveja que ve cómo se llevan su corderito al matadero',	'F#2',	'C3',	'como-oveja-que-ve-como-se-llevan-su-corderito-al-matadero',	1,	'F#2',	'C3',	NULL),
(970,	5,	26,	'Abramo',	'A1',	'D3',	'abramo',	1,	'G#2',	'D3',	NULL),
(971,	5,	27,	'Acclamate al Signore',	'D2',	'G3',	'acclamate-al-signore',	1,	'D2',	'B2',	NULL),
(972,	5,	28,	'Agnella di Dio',	'F#1',	'C3',	'agnella-di-dio',	1,	'G1',	'D2',	NULL),
(973,	5,	29,	'Akedà',	'A1',	'E3',	'akeda-italiano',	1,	'E2',	'C3',	NULL),
(974,	5,	30,	'Alla vittima pasquale',	'D1',	'C3',	'alla-vittima-pasquale',	1,	'C2',	'C3',	NULL),
(975,	5,	31,	'Al risveglio mi sazierò del tuo volto, Signor',	'F2',	'F3',	'al-risveglio-mi-saziero-del-tuo-volto-signor',	1,	'G2',	'D#3',	NULL),
(976,	5,	32,	'Alzate, o porte',	'D2',	'C#3',	'alzate-o-porte',	1,	'D2',	'C3',	NULL),
(977,	5,	33,	'Alzo gli occhi verso i monti',	'G2',	'G3',	'alzo-gli-occhi-verso-i-monti',	1,	'G2',	'G3',	NULL),
(978,	5,	34,	'Amen - amen - amen',	'C2',	'A3',	'amen-amen-amen-italiano',	1,	'C2',	'A3',	NULL),
(979,	5,	35,	'Amo il Signore',	'C2',	'E3',	'amo-il-signore',	1,	'D2',	'E3',	NULL),
(980,	5,	36,	'Andate ed annunziate ai miei fratelli',	'C2',	'E3',	'andate-ed-annunziate-ai-miei-fratelli',	1,	'E2',	'E3',	NULL),
(981,	5,	37,	'Andiamo, già pastori',	'E2',	'C3',	'andiamo-gia-pastori',	1,	'E2',	'C3',	NULL),
(982,	5,	38,	'A te levo i miei occhi (voce uomini)',	'A1',	'A#2',	'a-te-levo-i-miei-occhi-voce-uomini',	1,	'A1',	'A#2',	NULL),
(983,	5,	39,	'A te, Signore, con la mia voce',	'A1',	'D3',	'a-te-signore-con-la-mia-voce',	1,	'A1',	'C3',	NULL),
(984,	5,	40,	'A te, Signore, si deve lode in Sion',	'G1',	'C3',	'a-te-signore-si-deve-lode-in-sion',	1,	'E2',	'C3',	NULL),
(985,	5,	41,	'A te, Signor, innalzo la mia anima',	'A1',	'E3',	'a-te-signor-innalzo-la-mia-anima',	1,	'A1',	'D3',	NULL),
(986,	5,	42,	'Ave Maria I',	'D2',	'E3',	'ave-maria-i-italiano',	1,	'D2',	'E3',	NULL),
(987,	5,	43,	'Ave Maria II',	'D2',	'E3',	'ave-maria-ii-italiano',	1,	'D2',	'E3',	NULL),
(988,	5,	44,	'Ave, o Maria, colomba incorrotta',	'C#2',	'C#3',	'ave-o-maria-colomba-incorrotta',	0,	'C#2',	'C#3',	NULL),
(989,	5,	45,	'Benedetta sei tu, Maria',	'C2',	'D3',	'benedetta-sei-tu-maria',	1,	'C2',	'D3',	NULL),
(990,	5,	46,	'Benedetto sia Iddio',	'F#2',	'F#3',	'benedetto-sia-iddio',	1,	'G2',	'D3',	NULL),
(991,	5,	47,	'Benedici anima mia, Jahvè',	'E2',	'D3',	'benedici-anima-mia-jahve',	1,	'E2',	'A2',	NULL),
(992,	5,	48,	'Benedictus',	'C#2',	'A#2',	'benedictus-italiano',	1,	'D2',	'A2',	NULL),
(993,	5,	49,	'Benedirò il Signore in ogni tempo',	'D2',	'F3',	'benediro-il-signore-in-ogni-tempo',	1,	'D2',	'F3',	NULL),
(994,	5,	51,	'Canto dei bambini nella Veglia di Pasqua',	'E2',	'G3',	'canto-dei-bambini-nella-veglia-di-pasqua',	1,	'E2',	'G3',	NULL),
(995,	5,	52,	'Canto dei liberati',	'G2',	'E3',	'canto-dei-liberati',	1,	'G2',	'E3',	NULL),
(996,	5,	53,	'Canto dei tre giovani nella fornace (I parte)',	'E2',	'C3',	'canto-dei-tre-giovani-nella-fornace',	1,	'A2',	'C3',	NULL),
(997,	5,	54,	'Canto dei tre giovani nella fornace (II parte)',	'D2',	'C3',	'canto-dei-tre-giovani-nella-fornace-ii-parte',	1,	'D2',	'C3',	NULL),
(998,	5,	55,	'Canto di Giosuè',	'C#2',	'A2',	'canto-di-giosue',	1,	'C#2',	'A2',	NULL),
(999,	5,	56,	'Caritas Christi',	'E2',	'G3',	'caritas-christi-italiano',	1,	'E2',	'E3',	NULL),
(1000,	5,	57,	'Carmen \'63',	'E2',	'F#3',	'carmen-\'63-italiano',	1,	'E2',	'F#3',	NULL),
(1001,	5,	58,	'Cavallo e cavaliere - cantico di Mosè',	'F2',	'G3',	'cavallo-e-cavaliere-cantico-di-mose',	0,	'G2',	'F3',	NULL),
(1002,	5,	59,	'C\'erano due angeli',	'A1',	'E3',	'c\'erano-due-angeli',	1,	'A1',	'E3',	NULL),
(1003,	5,	60,	'C\'è un tempo per ogni cosa',	'D2',	'C3',	'c\'e-un-tempo-per-ogni-cosa',	1,	'D2',	'B2',	NULL),
(1004,	5,	61,	'Che belle sono le tue tende - canto di Balaam [con salita nel ritornello]',	'G1',	'E3',	'che-belle-sono-le-tue-tende-canto-di-balaam-con-salita-nel-ritornello',	1,	'D2',	'E3',	NULL),
(1005,	5,	61,	'Che belle sono le tue tende - canto di Balaam [senza salita nel ritornello]',	'G1',	'B2',	'che-belle-sono-le-tue-tende-canto-di-balaam-senza-salita-nel-ritornello',	1,	'D2',	'B2',	NULL),
(1006,	5,	62,	'Chi ci separerà',	'D2',	'D3',	'chi-ci-separera',	1,	'D2',	'D3',	NULL),
(1007,	5,	63,	'Chi è colei',	'A1',	'D3',	'chi-e-colei',	1,	'A1',	'A2',	NULL),
(1008,	5,	64,	'Come condannati a morte',	'C2',	'E3',	'come-condannati-a-morte',	1,	'C2',	'E3',	NULL),
(1009,	5,	65,	'Come è bello, come dà gioia',	'A1',	'C3',	'come-e-bello-come-da-gioia',	1,	'A1',	'C3',	NULL),
(1010,	5,	66,	'Come la cerva anela',	'B1',	'E3',	'come-la-cerva-anela',	1,	'D#2',	'C#3',	NULL),
(1011,	5,	67,	'Come pecora che vede',	'F#2',	'D3',	'come-pecora-che-vede',	1,	'F#2',	'D3',	NULL),
(1012,	5,	68,	'Consolate il mio popolo',	'B1',	'D3',	'consolate-il-mio-popolo',	1,	'B1',	'B2',	NULL),
(1013,	5,	69,	'Così parla l\'amen',	'D2',	'D3',	'cosi-parla-l\'amen',	1,	'A2',	'D3',	NULL),
(1014,	5,	70,	'Cristo Gesù è il Signore! - Inno alla Kenosis',	'D2',	'D#3',	'cristo-gesu-e-il-signore-inno-alla-kenosis',	1,	'F#2',	'B2',	NULL),
(1015,	5,	71,	'Dagli abissi della morte',	'A2',	'E3',	'dagli-abissi-della-morte',	1,	'A2',	'E3',	NULL),
(1016,	5,	72,	'Dajenù',	'D2',	'E3',	'dajenu',	1,	'D2',	'E3',	NULL),
(1017,	5,	73,	'Dal profondo a te grido [con melisma]',	'A1',	'D3',	'dal-profondo-a-te-grido-con-melisma',	1,	'A1',	'A2',	NULL),
(1018,	5,	74,	'Davanti agli angeli',	'A1',	'A2',	'davanti-agli-angeli',	1,	'A1',	'A2',	NULL),
(1019,	5,	75,	'Degno sei',	'A1',	'D3',	'degno-sei',	1,	'C2',	'D3',	NULL),
(1020,	5,	76,	'Dice il Signore al mio signore',	'E2',	'E3',	'dice-il-signore-al-mio-signore',	1,	'E2',	'B2',	NULL),
(1021,	5,	77,	'Dite agli smarriti di cuore',	'C2',	'F3',	'dite-agli-smarriti-di-cuore',	1,	'C2',	'F3',	NULL),
(1022,	5,	78,	'È asceso il buon pastore',	'G2',	'E3',	'e-asceso-il-buon-pastore',	1,	'A2',	'C3',	NULL),
(1023,	5,	79,	'È paziente (Inno allo Spirito Santo)',	'B1',	'E3',	'e-paziente-inno-allo-spirito-santo',	1,	'A2',	'E3',	NULL),
(1024,	5,	80,	'Ecco qui il mio servo: I canto del servo di Jahvè',	'A1',	'A2',	'ecco-qui-il-mio-servo-i-canto-del-servo-di-jahve',	1,	'A1',	'F2',	NULL),
(1025,	5,	81,	'Ecco qui, io vengo presto',	'B1',	'C#3',	'ecco-qui-io-vengo-presto',	1,	'B1',	'C#3',	NULL),
(1026,	5,	82,	'Eli, eli, lammà sabactani [con melisma grave]',	'B1',	'F#3',	'eli-eli-lamma-sabactani-con-melisma-grave',	1,	'A2',	'E3',	NULL),
(1027,	5,	82,	'Eli, eli, lammà sabactani [senza melisma grave]',	'F#2',	'F#3',	'eli-eli-lamma-sabactani-senza-melisma-grave',	1,	'A2',	'E3',	NULL),
(1028,	5,	84,	'Esultate, giusti, nel Signore',	'D2',	'E3',	'esultate-giusti-nel-signore',	1,	'D2',	'B2',	NULL),
(1029,	5,	85,	'Evenu Shalom Alejem',	'D2',	'D3',	'evenu-shalom-alejem',	1,	'D2',	'D3',	NULL),
(1030,	5,	86,	'Felice l\'uomo',	'D2',	'D3',	'felice-l\'uomo',	1,	'E2',	'C3',	NULL),
(1031,	5,	87,	'Felicità per l\'uomo che teme il Signore',	'A1',	'E3',	'felicita-per-l\'uomo-che-teme-il-signore',	1,	'A1',	'D3',	NULL),
(1032,	5,	88,	'Figlie di Gerusalemme',	'E2',	'E3',	'figlie-di-gerusalemme',	1,	'G2',	'D3',	NULL),
(1033,	5,	89,	'Fino a quando',	'A1',	'G#2',	'fino-a-quando',	1,	'A1',	'E2',	NULL),
(1034,	5,	90,	'Fratelli, non diamo a nessuno motivo d\'inciampo',	'E2',	'E3',	'fratelli-non-diamo-a-nessuno-motivo-d\'inciampo',	1,	'E2',	'E3',	NULL),
(1035,	5,	91,	'Fuggi, mio diletto',	'E2',	'F3',	'fuggi-mio-diletto',	1,	'E2',	'E3',	NULL),
(1036,	5,	92,	'Gerusalemme ricostruita [senza voce acuta nell\'ultima strofa]',	'G1',	'A2',	'gerusalemme-ricostruita-senza-voce-acuta-nell\'ultima-strofa',	1,	'C2',	'A2',	NULL),
(1037,	5,	93,	'Gesù percorreva tutte le città',	'B1',	'F3',	'gesu-percorreva-tutte-le-citta',	1,	'E2',	'E3',	NULL),
(1038,	5,	94,	'Già viene il mio Dio',	'E2',	'C3',	'gia-viene-il-mio-dio',	1,	'E2',	'C3',	NULL),
(1039,	5,	95,	'Già viene il Regno',	'G2',	'E3',	'gia-viene-il-regno',	1,	'G2',	'E3',	NULL),
(1040,	5,	96,	'Giorno di riposo',	'B1',	'C3',	'giorno-di-riposo',	1,	'B1',	'B2',	NULL),
(1041,	5,	97,	'Giunga la mia preghiera fino a te',	'D2',	'B2',	'giunga-la-mia-preghiera-fino-a-te',	1,	'E2',	'B2',	NULL),
(1042,	5,	98,	'Giunti sui fiumi di Babilonia',	'D#2',	'F#3',	'giunti-sui-fiumi-di-babilonia',	1,	'D#2',	'C3',	NULL),
(1043,	5,	99,	'Grazie a Jahvè',	'D2',	'F#3',	'grazie-a-jahve',	1,	'D2',	'E3',	NULL),
(1044,	5,	100,	'Gridate con gioia',	'D2',	'D3',	'gridate-con-gioia',	1,	'F2',	'C3',	NULL),
(1045,	5,	101,	'Guardate come è bello',	'E2',	'E3',	'guardate-come-e-bello',	1,	'E2',	'E3',	NULL),
(1046,	5,	102,	'Guardate come è bello, gustate quanto è soave',	'A1',	'C3',	'guardate-come-e-bello-gustate-quanto-e-soave',	1,	'A1',	'A2',	NULL),
(1047,	5,	103,	'Gustate e vedete',	'G1',	'D3',	'gustate-e-vedete',	1,	'B1',	'G2',	NULL),
(1048,	5,	104,	'Ho sperato, ho sperato nel Signore',	'C2',	'B2',	'ho-sperato-ho-sperato-nel-signore',	1,	'C2',	'B2',	NULL),
(1049,	5,	105,	'Ho steso le mie mani',	'D2',	'E3',	'ho-steso-le-mie-mani',	1,	'A2',	'E3',	NULL),
(1050,	5,	106,	'Il Messia, leone per vincere',	'A2',	'F3',	'il-messia-leone-per-vincere',	1,	'A2',	'D3',	NULL),
(1051,	5,	107,	'Il pigiatore',	'E2',	'F#3',	'il-pigiatore',	1,	'E2',	'B2',	NULL),
(1052,	5,	108,	'Il popolo che camminava nelle tenebre',	'G1',	'B2',	'il-popolo-che-camminava-nelle-tenebre',	1,	'A1',	'B2',	NULL),
(1053,	5,	109,	'Il Signore annuncia una notizia',	'D2',	'E3',	'il-signore-annuncia-una-notizia',	1,	'D2',	'B2',	NULL),
(1054,	5,	110,	'Il Signore è il mio pastore',	'G1',	'D3',	'il-signore-e-il-mio-pastore',	1,	'C2',	'B2',	NULL),
(1055,	5,	111,	'Il Signore è mia luce e mia salvezza',	'D2',	'E3',	'il-signore-e-mia-luce-e-mia-salvezza',	1,	'D2',	'D3',	NULL),
(1056,	5,	112,	'Il Signore mi ha dato: III canto del servo',	'B1',	'C#3',	'il-signore-mi-ha-dato-iii-canto-del-servo',	1,	'C#2',	'C#3',	NULL),
(1057,	5,	113,	'In mezzo a una grande folla',	'E2',	'D3',	'in-mezzo-a-una-grande-folla',	1,	'E2',	'D3',	NULL),
(1058,	5,	114,	'In una notte oscura',	'B1',	'D3',	'in-una-notte-oscura',	1,	'B1',	'D3',	NULL),
(1059,	5,	115,	'Innalzerò la coppa di salvezza',	'A1',	'B2',	'innalzero-la-coppa-di-salvezza',	1,	'D2',	'B2',	NULL),
(1060,	5,	116,	'Inno a Cristo luce',	'B1',	'E3',	'inno-a-cristo-luce',	1,	'B1',	'E3',	NULL),
(1061,	5,	117,	'Inno alla carità',	'C2',	'G3',	'inno-alla-carita',	1,	'C2',	'G3',	NULL),
(1062,	5,	118,	'Inno di delle lodi di Avvento (fino al 16 dicembre)',	'G2',	'E3',	'inno-di-delle-lodi-di-avvento-fino-al-16-dicembre',	1,	'G2',	'B2',	NULL),
(1063,	5,	120,	'Inno delle lodi di Pentecoste',	'G2',	'E3',	'inno-delle-lodi-di-pentecoste',	1,	'G2',	'B2',	NULL),
(1064,	5,	122,	'Inno di Pasqua',	'A1',	'A2',	'inno-di-pasqua',	1,	'A1',	'A2',	NULL),
(1065,	5,	123,	'Io vengo a riunir',	'B1',	'E3',	'io-vengo-a-riunir',	1,	'B1',	'A2',	NULL),
(1066,	5,	124,	'Jahvè, tu sei il mio Dio',	'D2',	'D3',	'jahve-tu-sei-il-mio-dio',	1,	'D2',	'F2',	NULL),
(1067,	5,	125,	'La marcia è dura',	'E2',	'E3',	'la-marcia-e-dura',	1,	'E2',	'E3',	NULL),
(1068,	5,	126,	'La mietitura delle nazioni',	'F#1',	'C#3',	'la-mietitura-delle-nazioni',	1,	'F#1',	'A2',	NULL),
(1069,	5,	127,	'La voce del mio amato',	'F1',	'C3',	'la-voce-del-mio-amato',	1,	'C2',	'C3',	NULL),
(1070,	5,	128,	'Lamenti del Signore',	'E2',	'F#3',	'lamenti-del-signore',	1,	'E2',	'F#3',	NULL),
(1071,	5,	129,	'Le onde della morte mi avvolgevano',	'F#2',	'G3',	'le-onde-della-morte-mi-avvolgevano',	1,	'F#2',	'F#3',	NULL),
(1072,	5,	130,	'Le sue fondamenta',	'A1',	'C3',	'le-sue-fondamenta',	1,	'B1',	'C3',	NULL),
(1073,	5,	131,	'Lo Spirito del Signore è sopra di me',	'E2',	'D3',	'lo-spirito-del-signore-e-sopra-di-me',	1,	'E2',	'D3',	NULL),
(1074,	5,	132,	'Lo stolto pensa che non c\'è Dio',	'D2',	'E3',	'lo-stolto-pensa-che-non-c\'e-dio',	1,	'D2',	'D3',	NULL),
(1075,	5,	133,	'Lodate Iddio',	'A2',	'D3',	'lodate-iddio',	0,	'A2',	'D3',	NULL),
(1076,	5,	134,	'Lodate il Signore dai cieli',	'C#2',	'A2',	'lodate-il-signore-dai-cieli',	1,	'E2',	'A2',	NULL),
(1077,	5,	135,	'Lodate il Signore tutti i popoli della terra',	'D2',	'E3',	'lodate-il-signore-tutti-i-popoli-della-terra',	1,	'D2',	'D3',	NULL),
(1078,	5,	136,	'Magnificat',	'E2',	'E3',	'magnificat-italiano',	1,	'E2',	'D3',	NULL),
(1079,	5,	137,	'Maria, casa di Benedizione',	'B1',	'D3',	'maria-casa-di-benedizione',	1,	'C2',	'D3',	NULL),
(1080,	5,	138,	'Maria di Jasna Góra',	'E2',	'A3',	'maria-di-jasna-gora',	0,	'F#2',	'F#3',	NULL),
(1081,	5,	139,	'Maria, madre del cammino ardente',	'C2',	'D3',	'maria-madre-del-cammino-ardente',	1,	'C2',	'D3',	NULL),
(1082,	5,	140,	'Maria, madre della Chiesa',	'B1',	'G3',	'maria-madre-della-chiesa',	1,	'E2',	'G3',	NULL),
(1083,	5,	141,	'Maria, piccola Maria',	'D2',	'F#3',	'maria-piccola-maria',	1,	'D2',	'D3',	NULL),
(1084,	5,	142,	'Mi hai sedotto, Signore',	'B1',	'F3',	'mi-hai-sedotto-signore',	1,	'B1',	'E3',	NULL),
(1085,	5,	143,	'Mi indicherai il sentiero della vita',	'F2',	'G3',	'mi-indicherai-il-sentiero-della-vita',	1,	'A2',	'F3',	NULL),
(1086,	5,	144,	'Misericordia, Dio, misericordia',	'D2',	'C3',	'misericordia-dio-misericordia',	1,	'D2',	'G2',	NULL),
(1087,	5,	145,	'Molto mi hanno perseguitato',	'D2',	'G3',	'molto-mi-hanno-perseguitato',	1,	'E2',	'G3',	NULL),
(1088,	5,	146,	'Nel cielo apparve poi un segno grandioso: una donna vestita di sole',	'A1',	'D3',	'nel-cielo-apparve-poi-un-segno-grandioso-una-donna-vestita-di-sole',	1,	'F2',	'D3',	NULL),
(1089,	5,	147,	'Noli me tangere',	'E2',	'F3',	'noli-me-tangere-italiano',	1,	'G2',	'F3',	NULL),
(1090,	5,	148,	'Non c\'è in lui bellezza: IV canto del servo',	'C1',	'G3',	'non-c\'e-in-lui-bellezza-iv-canto-del-servo',	1,	'C1',	'D3',	NULL),
(1091,	5,	149,	'Non è qui, è risorto!',	'C1',	'D3',	'non-e-qui-e-risorto',	1,	'G2',	'D3',	NULL),
(1092,	5,	150,	'Non morirò',	'B1',	'G2',	'non-moriro',	1,	'B1',	'G2',	NULL),
(1093,	5,	152,	'O cieli, piovete dall\'alto',	'E2',	'D3',	'o-cieli-piovete-dall\'alto',	1,	'E2',	'D3',	NULL),
(1094,	5,	153,	'O Dio, tu sei il mio Dio',	'E2',	'E3',	'o-dio-tu-sei-il-mio-dio',	1,	'E2',	'C3',	NULL),
(1095,	5,	154,	'O Dio, per il tuo nome',	'E2',	'G3',	'o-dio-per-il-tuo-nome',	1,	'E2',	'E3',	NULL),
(1096,	5,	155,	'O Gesù, amore mio',	'E2',	'F3',	'o-gesu-amore-mio',	1,	'A2',	'D3',	NULL),
(1097,	5,	156,	'O morte, dov\'è la tua vittoria?',	'A1',	'G2',	'o-morte-dov\'e-la-tua-vittoria',	0,	'A1',	'G2',	NULL),
(1098,	5,	157,	'O Signore, nostro Dio',	'B1',	'G3',	'o-signore-nostro-dio',	1,	'B1',	'C3',	NULL),
(1099,	5,	158,	'Pentecoste',	'A1',	'C#3',	'pentecoste',	1,	'A1',	'A#2',	NULL),
(1100,	5,	159,	'Per amore dei miei fratelli',	'B1',	'B2',	'per-amore-dei-miei-fratelli',	1,	'B1',	'B2',	NULL),
(1101,	5,	160,	'Perché le genti congiurano?',	'B1',	'E3',	'perche-le-genti-congiurano',	1,	'B1',	'E3',	NULL),
(1102,	5,	161,	'Pietà di me, o Dio',	'E2',	'C3',	'pieta-di-me-o-dio',	1,	'A2',	'C3',	NULL),
(1103,	5,	162,	'Portami in cielo',	'B1',	'E3',	'portami-in-cielo',	1,	'E2',	'E3',	NULL),
(1104,	5,	163,	'Quando il Signore',	'A1',	'B2',	'quando-il-signore',	1,	'B1',	'B2',	NULL),
(1105,	5,	164,	'Quando Israele uscì dall\'Egitto',	'E2',	'F#3',	'quando-israele-usci-dall\'egitto',	0,	'E2',	'F#3',	NULL),
(1106,	5,	165,	'Quanto sono amabili le tue dimore',	'G1',	'G2',	'quanto-sono-amabili-le-tue-dimore',	1,	'G1',	'G2',	NULL),
(1107,	5,	166,	'Questo è il mio comandamento',	'B1',	'E3',	'questo-e-il-mio-comandamento',	1,	'C2',	'E3',	NULL),
(1108,	5,	167,	'Resurrexit 2013',	'B1',	'E3',	'resurrexit-2013',	1,	'E2',	'E3',	NULL),
(1109,	5,	168,	'Risuscitò',	'E2',	'D3',	'risuscito',	1,	'E2',	'D3',	NULL),
(1110,	5,	169,	'Rivestitevi dell\'armatura di Dio',	'D2',	'G3',	'rivestitevi-dell\'armatura-di-dio',	1,	'D2',	'G3',	NULL),
(1111,	5,	170,	'Sale Dio tra acclamazioni',	'B2',	'F3',	'sale-dio-tra-acclamazioni',	1,	'B2',	'F3',	NULL),
(1112,	5,	171,	'Salve Regina',	'E2',	'F3',	'salve-regina',	1,	'E2',	'A2',	NULL),
(1113,	5,	172,	'Salve Regina dei cieli',	'G2',	'F3',	'salve-regina-dei-cieli',	1,	'G#2',	'D3',	NULL),
(1114,	5,	173,	'Se il Signore non costruisce la casa',	'C#2',	'F#3',	'se-il-signore-non-costruisce-la-casa',	1,	'F#2',	'F#3',	NULL),
(1115,	5,	174,	'Se nel Signore mi sono rifugiato',	'C2',	'G3',	'se-nel-signore-mi-sono-rifugiato',	1,	'C2',	'C3',	NULL),
(1116,	5,	175,	'Se oggi ascoltate la sua voce',	'C#2',	'E3',	'se-oggi-ascoltate-la-sua-voce',	1,	'E2',	'E3',	NULL),
(1117,	5,	176,	'Se siete risorti con Cristo',	'B1',	'C3',	'se-siete-risorti-con-cristo',	1,	'B1',	'C3',	NULL),
(1118,	5,	177,	'Sequenza Corpus Domini',	'F#2',	'D3',	'sequenza-corpus-domini',	1,	'F#2',	'C3',	NULL),
(1119,	5,	178,	'Sequenza di Pentecoste (Vieni, Spirito Santo)',	'A2',	'G3',	'sequenza-di-pentecoste-vieni-spirito-santo',	1,	'A2',	'F#3',	NULL),
(1120,	5,	179,	'Shlom Lech Mariàm',	'B1',	'A3',	'shlom-lech-mariam',	1,	'B1',	'A3',	NULL),
(1121,	5,	180,	'Signore, aiutami, Signore',	'E2',	'E3',	'signore-aiutami-signore',	1,	'E2',	'E3',	NULL),
(1122,	5,	181,	'Signore, non punirmi nel tuo sdegno',	'B1',	'G3',	'signore-non-punirmi-nel-tuo-sdegno',	0,	'B1',	'G3',	NULL),
(1123,	5,	182,	'Sola a solo',	'E2',	'F3',	'sola-a-solo-italiano',	1,	'A2',	'F3',	NULL),
(1124,	5,	183,	'Sorga Dio',	'D2',	'F3',	'sorga-dio',	1,	'D2',	'E3',	NULL),
(1125,	5,	184,	'Stabat mater dolorosa',	'E2',	'A3',	'stabat-mater-dolorosa-italiano',	1,	'E2',	'D3',	NULL),
(1126,	5,	185,	'Ti ho manifestato il mio peccato',	'G2',	'D3',	'ti-ho-manifestato-il-mio-peccato',	1,	'G2',	'C3',	NULL),
(1127,	5,	186,	'Ti sto chiamando',	'F#2',	'E3',	'ti-sto-chiamando',	1,	'F#2',	'C3',	NULL),
(1128,	5,	187,	'Ti vedranno i re: II canto del servo',	'G1',	'C#3',	'ti-vedranno-i-re-ii-canto-del-servo',	0,	'B1',	'C#3',	NULL),
(1129,	5,	188,	'Tu che sei fedele',	'G2',	'D#3',	'tu-che-sei-fedele',	0,	'A#2',	'D#3',	NULL),
(1130,	5,	189,	'Tu hai ricoperto di vergogna la morte',	'D2',	'G3',	'tu-hai-ricoperto-di-vergogna-la-morte',	1,	'D2',	'D3',	NULL),
(1131,	5,	190,	'Tu sei bella, amica mia',	'A1',	'F3',	'tu-sei-bella-amica-mia',	1,	'A1',	'A2',	NULL),
(1132,	5,	191,	'Tu sei il più bello',	'B1',	'G#3',	'tu-sei-il-piu-bello',	1,	'B1',	'C#3',	NULL),
(1133,	5,	192,	'Un angelo venne dal cielo (Allegria Allegria)',	'A1',	'A#2',	'un-angelo-venne-dal-cielo-allegria-allegria',	1,	'A1',	'A#2',	NULL),
(1134,	5,	193,	'Un germoglio spunta dal tronco di Jesse',	'G2',	'E3',	'un-germoglio-spunta-dal-tronco-di-jesse',	1,	'G2',	'C3',	NULL),
(1135,	5,	194,	'Una gran señal apareció en el cielo',	'A1',	'D3',	'una-gran-señal-aparecio-en-el-cielo',	1,	'A2',	'D3',	NULL),
(1136,	5,	195,	'Urì, urì, urà',	'E2',	'C3',	'uri-uri-ura-italiano',	1,	'E2',	'C3',	NULL),
(1137,	5,	196,	'Vedo i cieli aperti',	'B1',	'E3',	'vedo-i-cieli-aperti',	0,	'E2',	'E3',	NULL),
(1138,	5,	197,	'Venite a me, voi tutti',	'A1',	'C3',	'venite-a-me-voi-tutti',	1,	'E2',	'C3',	NULL),
(1139,	5,	198,	'Vergine della meraviglia',	'C#2',	'E3',	'vergine-della-meraviglia',	1,	'C#2',	'A2',	NULL),
(1140,	5,	199,	'Verso te, o città santa',	'C2',	'E3',	'verso-te-o-citta-santa',	1,	'C2',	'E3',	NULL),
(1141,	5,	200,	'Vi prenderò dalle genti',	'F2',	'E3',	'vi-prendero-dalle-genti',	1,	'F2',	'E3',	NULL),
(1142,	5,	201,	'Viene il Signore, vestito di maestà',	'E2',	'A#2',	'viene-il-signore-vestito-di-maesta',	1,	'E2',	'A#2',	NULL),
(1143,	5,	202,	'Vieni dal Libano',	'D2',	'B2',	'vieni-dal-libano',	1,	'D2',	'B2',	NULL),
(1144,	5,	203,	'Vieni, figlio dell\'uomo',	'E2',	'D#3',	'vieni-figlio-dell\'uomo',	1,	'G2',	'B2',	NULL),
(1145,	5,	204,	'Vieni, Spirito creatore',	'G2',	'E3',	'vieni-spirito-creatore',	1,	'G2',	'B2',	NULL),
(1146,	5,	205,	'Voglio andare a Gerusalemme',	'D2',	'G3',	'voglio-andare-a-gerusalemme',	1,	'D2',	'G3',	NULL),
(1147,	5,	206,	'Voglio cantare',	'D2',	'C#3',	'voglio-cantare',	1,	'D2',	'C#3',	NULL),
(1148,	5,	207,	'Voi siete la luce del mondo',	'E2',	'A3',	'voi-siete-la-luce-del-mondo',	1,	'G#2',	'E3',	NULL),
(1149,	5,	208,	'Zaccheo',	'E2',	'F3',	'zaccheo',	1,	'E2',	'F3',	NULL),
(1150,	5,	219,	'Acclamazione al Vangelo (Modello I)',	'A1',	'B2',	'acclamazione-al-vangelo-modello-i',	1,	'D2',	'A2',	NULL),
(1151,	5,	219,	'Acclamazione al Vangelo (Modello II)',	'A1',	'B2',	'acclamazione-al-vangelo-modello-ii',	1,	'A1',	'G2',	NULL),
(1152,	5,	220,	'Agnello di Dio',	'B1',	'A2',	'agnello-di-dio',	1,	'B1',	'A2',	NULL),
(1153,	5,	221,	'Alleluja pasquale',	'A1',	'D3',	'alleluja-pasquale',	1,	'A1',	'A2',	NULL),
(1154,	5,	222,	'Alleluja per acclamazione al Vangelo (Modello I)',	'A1',	'B2',	'alleluja-per-acclamazione-al-vangelo-modello-i',	1,	'A1',	'G2',	NULL),
(1155,	5,	222,	'Alleluja per acclamazione al Vangelo (Modello II)',	'G2',	'E3',	'alleluja-per-acclamazione-al-vangelo-modello-ii',	1,	'G2',	'E3',	NULL),
(1156,	5,	222,	'Alleluja per acclamazione al Vangelo (Modello III)',	'D2',	'B2',	'alleluja-per-acclamazione-al-vangelo-modello-iii',	1,	'D2',	'B2',	NULL),
(1157,	5,	223,	'Benedizione dell\'acqua del fonte battesimale',	'E2',	'G3',	'benedizione-dell\'acqua-del-fonte-battesimale',	1,	'E2',	'E3',	NULL),
(1158,	5,	225,	'Benedizione per la celebrazione penitenziale',	'A1',	'D3',	'benedizione-per-la-celebrazione-penitenziale',	0,	'G2',	'D3',	NULL),
(1159,	5,	226,	'Gloria a Dio nell\'alto dei cieli',	'D2',	'E3',	'gloria-a-dio-nell\'alto-dei-cieli',	1,	'D2',	'E3',	NULL),
(1160,	5,	227,	'Litanie penitenziali brevi I',	'E2',	'D3',	'litanie-penitenziali-brevi-i',	1,	'F#2',	'D3',	NULL),
(1161,	5,	228,	'Litanie penitenziali II - Preghiera litanica penitenziale',	'E2',	'D3',	'litanie-penitenziali-ii-preghiera-litanica-penitenziale',	1,	'F#2',	'D3',	NULL),
(1162,	5,	229,	'Preconio pasquale',	'A1',	'D3',	'preconio-pasquale',	1,	'E2',	'D3',	NULL),
(1163,	5,	231,	'Prefazio dell\'Eucaristia della Veglia Pasquale',	'A1',	'D3',	'prefazio-dell\'eucaristia-della-veglia-pasquale',	0,	'G2',	'D3',	NULL),
(1164,	5,	232,	'Preghiera Eucaristica II - Modello 1 (Prefazio)',	'A1',	'D3',	'preghiera-eucaristica-ii-modello-1-prefazio',	0,	'G2',	'D3',	NULL),
(1165,	5,	233,	' Preghiera Eucaristica II - Modello 1 (Egli offrendosi...)',	'A1',	'E3',	'preghiera-eucaristica-ii-modello-1-egli-offrendosi',	1,	'D2',	'A#2',	NULL),
(1166,	5,	233,	' Preghiera Eucaristica II - Modello 1 (Per Cristo...)',	'A1',	'E3',	'preghiera-eucaristica-ii-modello-1-per-cristo',	1,	'A1',	'A2',	NULL),
(1167,	5,	236,	' Preghiera Eucaristica II - Modello 1 (Offerta, intercessioni, dossologia)',	'D2',	'E3',	'preghiera-eucaristica-ii-modello-1-offerta-intercessioni-dossologia',	1,	'A2',	'E3',	NULL),
(1168,	5,	237,	'Preghiera Eucaristica IV (Dossologia)',	'B1',	'D3',	'preghiera-eucaristica-iv-dossologia',	1,	'A2',	'D3',	NULL),
(1169,	5,	238,	'Preghiere universali cantate',	'E2',	'D3',	'preghiere-universali-cantate',	1,	'E2',	'D3',	NULL),
(1170,	5,	239,	'Salmodia per il salmo responsoriale',	'B1',	'D3',	'salmodia-per-il-salmo-responsoriale',	1,	'B1',	'F#2',	NULL),
(1171,	5,	240,	'Santo 1983',	'A1',	'F3',	'santo-1983',	1,	'A1',	'F3',	NULL),
(1172,	5,	241,	'Santo è il Signor - Santo delle baracche 1965',	'F2',	'F#3',	'santo-e-il-signor-santo-delle-baracche-1965',	1,	'G#2',	'F#3',	NULL),
(1173,	5,	242,	'Santo è santo',	'B1',	'C3',	'santo-e-santo',	1,	'B1',	'C3',	NULL),
(1174,	5,	243,	'Santo - Roma 1977 [seconda volta \"santo\" giù]',	'G1',	'B2',	'santo-roma-1977-seconda-volta-\"santo\"-giu',	1,	'G1',	'A2',	NULL),
(1175,	5,	243,	'Santo - Roma 1977 [seconda volta \"santo\" su]',	'G1',	'D3',	'santo-roma-1977-seconda-volta-\"santo\"-su',	1,	'G1',	'A2',	NULL),
(1176,	5,	244,	'Santo, santo, santo (Tempo Ordinario 1988)',	'E2',	'D3',	'santo-santo-santo-tempo-ordinario-1988',	1,	'E2',	'D3',	NULL),
(1177,	5,	245,	'Santo, santo, santo - Osanna delle palme',	'D2',	'G3',	'santo-santo-santo-osanna-delle-palme',	1,	'D2',	'F3',	NULL),
(1178,	5,	246,	'Te Deum',	'D2',	'E3',	'te-deum-italiano',	1,	'D2',	'E3',	NULL),
(1179,	5,	257,	'Che mi baci',	'C#2',	'E3',	'che-mi-baci',	1,	'C#2',	'E3',	NULL),
(1180,	5,	258,	'Come lo slancio dell\'ira',	'G1',	'B2',	'come-lo-slancio-dell\'ira',	1,	'E2',	'B2',	NULL),
(1181,	5,	259,	'Credo apostolico',	'C1',	'F3',	'credo-apostolico',	1,	'C1',	'F3',	NULL),
(1182,	5,	260,	'Debora',	'A1',	'D3',	'debora-italiano',	0,	'E2',	'D3',	NULL),
(1183,	5,	261,	'Ecco lo specchio nostro',	'A#1',	'D3',	'ecco-lo-specchio-nostro',	1,	'D2',	'D3',	NULL),
(1184,	5,	262,	'Giacobbe',	'F2',	'E3',	'giacobbe',	1,	'G2',	'E3',	NULL),
(1185,	5,	263,	'Il seminatore',	'A1',	'D3',	'il-seminatore',	1,	'A1',	'D3',	NULL),
(1186,	5,	264,	'Inno alla croce gloriosa',	'B1',	'F#3',	'inno-alla-croce-gloriosa',	1,	'B1',	'B2',	NULL),
(1187,	5,	265,	'Lo stesso Iddio',	'A1',	'E3',	'lo-stesso-iddio',	1,	'C#2',	'E3',	NULL),
(1188,	5,	266,	'Nessuno può servire due padroni',	'A1',	'G2',	'nessuno-puo-servire-due-padroni',	1,	'B1',	'G2',	NULL),
(1189,	5,	267,	'Non resistete al male',	'A1',	'D3',	'non-resistete-al-male',	1,	'D2',	'F#2',	NULL),
(1190,	5,	268,	'Non ti adirare',	'A1',	'C3',	'non-ti-adirare',	1,	'A1',	'A2',	NULL),
(1191,	5,	269,	'Padre nostro',	'D2',	'D3',	'padre-nostro',	1,	'D2',	'D3',	NULL),
(1192,	5,	270,	'Quando dormivo',	'G#1',	'E3',	'quando-dormivo',	1,	'E2',	'A2',	NULL),
(1193,	5,	271,	'Shemà Israel',	'A1',	'D3',	'shema-israel-italiano',	1,	'A1',	'C3',	NULL),
(1194,	5,	272,	'Siedi solitario e silenzioso',	'D2',	'F#3',	'siedi-solitario-e-silenzioso',	1,	'D2',	'D3',	NULL),
(1195,	5,	273,	'Signore, il mio cuore non ha più pretese',	'B1',	'C3',	'signore-il-mio-cuore-non-ha-piu-pretese',	1,	'E2',	'B2',	NULL),
(1196,	5,	274,	'Signore, tu mi scruti e mi conosci',	'A1',	'D3',	'signore-tu-mi-scruti-e-mi-conosci',	1,	'D2',	'D3',	NULL),
(1197,	5,	275,	'Tu sei la mia speranza, Signore',	'A1',	'F3',	'tu-sei-la-mia-speranza-signore',	0,	'E2',	'F3',	NULL),
(1198,	5,	287,	'Alla cena dell\'Agnello',	'G2',	'E3',	'alla-cena-dell\'agnello',	1,	'G2',	'D3',	NULL),
(1199,	5,	288,	'Amate i vostri nemici - sermone della montagna',	'B1',	'C#3',	'amate-i-vostri-nemici-sermone-della-montagna',	1,	'D2',	'B2',	NULL),
(1200,	5,	289,	'Come stilla il miele',	'F1',	'E3',	'come-stilla-il-miele',	1,	'F1',	'E3',	NULL),
(1201,	5,	290,	'La colomba volò',	'A1',	'F#3',	'la-colomba-volo',	1,	'A1',	'C3',	NULL),
(1202,	5,	291,	'La mia diletta è per me',	'G1',	'C#3',	'la-mia-diletta-e-per-me',	1,	'G1',	'C#3',	NULL),
(1203,	5,	292,	'Mi rubasti il cuore',	'E2',	'F3',	'mi-rubasti-il-cuore',	1,	'E2',	'F3',	NULL),
(1204,	5,	293,	'Salga lo sposo sul legno del suo talamo',	'C2',	'F3',	'salga-lo-sposo-sul-legno-del-suo-talamo',	1,	'C2',	'A2',	NULL),
(1205,	2,	1,	'A tu luz, Señor, vemos la luz',	'E2',	'E3',	'a-tu-luz-señor-vemos-la-luz',	1,	'A2',	'E3',	NULL);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_chord`
--

DROP TABLE IF EXISTS `song_chord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song_chord` (
  `id_song` int unsigned NOT NULL,
  `chord` char(6) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `position` int unsigned NOT NULL,
  UNIQUE KEY `id_song_chord` (`id_song`,`chord`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_chord`
--

LOCK TABLES `song_chord` WRITE;
/*!40000 ALTER TABLE `song_chord` DISABLE KEYS */;
INSERT INTO `song_chord` VALUES (126,'Am',1);
INSERT INTO `song_chord` VALUES (126,'E7',4);
INSERT INTO `song_chord` VALUES (126,'F',2);
INSERT INTO `song_chord` VALUES (126,'E',3);
INSERT INTO `song_chord` VALUES (125,'G7',2);
INSERT INTO `song_chord` VALUES (126,'G',0);
INSERT INTO `song_chord` VALUES (125,'G',4);
INSERT INTO `song_chord` VALUES (125,'F',3);
INSERT INTO `song_chord` VALUES (125,'Am',1);
INSERT INTO `song_chord` VALUES (125,'C',0);
INSERT INTO `song_chord` VALUES (124,'Gm',1);
INSERT INTO `song_chord` VALUES (123,'F',2);
INSERT INTO `song_chord` VALUES (123,'E',3);
INSERT INTO `song_chord` VALUES (124,'Dm',0);
INSERT INTO `song_chord` VALUES (123,'E7',4);
INSERT INTO `song_chord` VALUES (120,'Em',0);
INSERT INTO `song_chord` VALUES (119,'Em',0);
INSERT INTO `song_chord` VALUES (119,'B7',2);
INSERT INTO `song_chord` VALUES (119,'Am',1);
INSERT INTO `song_chord` VALUES (122,'E',1);
INSERT INTO `song_chord` VALUES (120,'C',3);
INSERT INTO `song_chord` VALUES (120,'B7',2);
INSERT INTO `song_chord` VALUES (122,'E7',2);
INSERT INTO `song_chord` VALUES (122,'Am',0);
INSERT INTO `song_chord` VALUES (120,'Am',1);
INSERT INTO `song_chord` VALUES (123,'G',1);
INSERT INTO `song_chord` VALUES (123,'Am',0);
INSERT INTO `song_chord` VALUES (122,'F',5);
INSERT INTO `song_chord` VALUES (122,'A7',3);
INSERT INTO `song_chord` VALUES (122,'Dm',4);
INSERT INTO `song_chord` VALUES (119,'C',3);
INSERT INTO `song_chord` VALUES (26,'F',3);
INSERT INTO `song_chord` VALUES (26,'G',2);
INSERT INTO `song_chord` VALUES (26,'Am',1);
INSERT INTO `song_chord` VALUES (26,'C',0);
INSERT INTO `song_chord` VALUES (27,'C',0);
INSERT INTO `song_chord` VALUES (27,'Am',1);
INSERT INTO `song_chord` VALUES (27,'G7',2);
INSERT INTO `song_chord` VALUES (27,'G',3);
INSERT INTO `song_chord` VALUES (27,'F',4);
INSERT INTO `song_chord` VALUES (27,'E',5);
INSERT INTO `song_chord` VALUES (28,'Am',0);
INSERT INTO `song_chord` VALUES (28,'E',1);
INSERT INTO `song_chord` VALUES (28,'Dm',2);
INSERT INTO `song_chord` VALUES (28,'F',3);
INSERT INTO `song_chord` VALUES (29,'Am',0);
INSERT INTO `song_chord` VALUES (29,'E',1);
INSERT INTO `song_chord` VALUES (29,'Dm',2);
INSERT INTO `song_chord` VALUES (30,'D',0);
INSERT INTO `song_chord` VALUES (30,'A',1);
INSERT INTO `song_chord` VALUES (30,'G',2);
INSERT INTO `song_chord` VALUES (30,'F#m',3);
INSERT INTO `song_chord` VALUES (30,'Em',4);
INSERT INTO `song_chord` VALUES (31,'Em',0);
INSERT INTO `song_chord` VALUES (31,'G',1);
INSERT INTO `song_chord` VALUES (31,'Am',2);
INSERT INTO `song_chord` VALUES (32,'Am',0);
INSERT INTO `song_chord` VALUES (32,'G',1);
INSERT INTO `song_chord` VALUES (32,'F',2);
INSERT INTO `song_chord` VALUES (32,'E',3);
INSERT INTO `song_chord` VALUES (33,'A',0);
INSERT INTO `song_chord` VALUES (33,'E',1);
INSERT INTO `song_chord` VALUES (33,'F',2);
INSERT INTO `song_chord` VALUES (33,'Am',3);
INSERT INTO `song_chord` VALUES (33,'E7',4);
INSERT INTO `song_chord` VALUES (34,'Dm',0);
INSERT INTO `song_chord` VALUES (34,'Gm',1);
INSERT INTO `song_chord` VALUES (34,'A',2);
INSERT INTO `song_chord` VALUES (34,'A7',3);
INSERT INTO `song_chord` VALUES (35,'Am',0);
INSERT INTO `song_chord` VALUES (35,'G',1);
INSERT INTO `song_chord` VALUES (35,'F',2);
INSERT INTO `song_chord` VALUES (35,'E',3);
INSERT INTO `song_chord` VALUES (35,'Dm',4);
INSERT INTO `song_chord` VALUES (36,'Am',0);
INSERT INTO `song_chord` VALUES (36,'G',1);
INSERT INTO `song_chord` VALUES (36,'F',2);
INSERT INTO `song_chord` VALUES (36,'E7',3);
INSERT INTO `song_chord` VALUES (37,'E',0);
INSERT INTO `song_chord` VALUES (37,'A',1);
INSERT INTO `song_chord` VALUES (38,'Em',0);
INSERT INTO `song_chord` VALUES (38,'B7',1);
INSERT INTO `song_chord` VALUES (38,'Am',2);
INSERT INTO `song_chord` VALUES (38,'C',3);
INSERT INTO `song_chord` VALUES (39,'D',0);
INSERT INTO `song_chord` VALUES (39,'A',1);
INSERT INTO `song_chord` VALUES (40,'D',0);
INSERT INTO `song_chord` VALUES (40,'G',1);
INSERT INTO `song_chord` VALUES (40,'A7',2);
INSERT INTO `song_chord` VALUES (40,'Bm',3);
INSERT INTO `song_chord` VALUES (40,'A',4);
INSERT INTO `song_chord` VALUES (41,'Em',0);
INSERT INTO `song_chord` VALUES (41,'D',1);
INSERT INTO `song_chord` VALUES (41,'Am',2);
INSERT INTO `song_chord` VALUES (42,'Am',0);
INSERT INTO `song_chord` VALUES (42,'G',1);
INSERT INTO `song_chord` VALUES (42,'F',2);
INSERT INTO `song_chord` VALUES (42,'E',3);
INSERT INTO `song_chord` VALUES (43,'Am',0);
INSERT INTO `song_chord` VALUES (43,'E',1);
INSERT INTO `song_chord` VALUES (43,'E7',2);
INSERT INTO `song_chord` VALUES (43,'G',3);
INSERT INTO `song_chord` VALUES (43,'F',4);
INSERT INTO `song_chord` VALUES (44,'Am',0);
INSERT INTO `song_chord` VALUES (44,'E7',1);
INSERT INTO `song_chord` VALUES (44,'F',2);
INSERT INTO `song_chord` VALUES (44,'G',3);
INSERT INTO `song_chord` VALUES (45,'Em',0);
INSERT INTO `song_chord` VALUES (45,'Am',1);
INSERT INTO `song_chord` VALUES (45,'B7',2);
INSERT INTO `song_chord` VALUES (45,'C',3);
INSERT INTO `song_chord` VALUES (45,'D',4);
INSERT INTO `song_chord` VALUES (45,'G',5);
INSERT INTO `song_chord` VALUES (45,'Bm',6);
INSERT INTO `song_chord` VALUES (46,'Am',0);
INSERT INTO `song_chord` VALUES (46,'Dm',1);
INSERT INTO `song_chord` VALUES (46,'E',2);
INSERT INTO `song_chord` VALUES (46,'F',3);
INSERT INTO `song_chord` VALUES (46,'G',4);
INSERT INTO `song_chord` VALUES (47,'Em',0);
INSERT INTO `song_chord` VALUES (47,'C',1);
INSERT INTO `song_chord` VALUES (47,'B7',2);
INSERT INTO `song_chord` VALUES (48,'Em',0);
INSERT INTO `song_chord` VALUES (48,'D',1);
INSERT INTO `song_chord` VALUES (48,'Am',2);
INSERT INTO `song_chord` VALUES (48,'B7',3);
INSERT INTO `song_chord` VALUES (48,'C',4);
INSERT INTO `song_chord` VALUES (48,'G',5);
INSERT INTO `song_chord` VALUES (48,'Bm',6);
INSERT INTO `song_chord` VALUES (49,'G',0);
INSERT INTO `song_chord` VALUES (49,'F#m',1);
INSERT INTO `song_chord` VALUES (49,'E',2);
INSERT INTO `song_chord` VALUES (49,'A',3);
INSERT INTO `song_chord` VALUES (49,'B',4);
INSERT INTO `song_chord` VALUES (49,'Em',5);
INSERT INTO `song_chord` VALUES (49,'D',6);
INSERT INTO `song_chord` VALUES (49,'C',7);
INSERT INTO `song_chord` VALUES (49,'B7',8);
INSERT INTO `song_chord` VALUES (50,'Am',0);
INSERT INTO `song_chord` VALUES (50,'E7',1);
INSERT INTO `song_chord` VALUES (51,'E',0);
INSERT INTO `song_chord` VALUES (51,'A',1);
INSERT INTO `song_chord` VALUES (51,'D',2);
INSERT INTO `song_chord` VALUES (52,'Dm',0);
INSERT INTO `song_chord` VALUES (52,'Gm',1);
INSERT INTO `song_chord` VALUES (52,'A',2);
INSERT INTO `song_chord` VALUES (52,'A7',3);
INSERT INTO `song_chord` VALUES (53,'G',0);
INSERT INTO `song_chord` VALUES (53,'B7',1);
INSERT INTO `song_chord` VALUES (53,'Em',2);
INSERT INTO `song_chord` VALUES (53,'D7',3);
INSERT INTO `song_chord` VALUES (54,'D',0);
INSERT INTO `song_chord` VALUES (54,'E',1);
INSERT INTO `song_chord` VALUES (54,'A',2);
INSERT INTO `song_chord` VALUES (54,'A7',3);
INSERT INTO `song_chord` VALUES (55,'D',0);
INSERT INTO `song_chord` VALUES (55,'F#m',1);
INSERT INTO `song_chord` VALUES (55,'D7',2);
INSERT INTO `song_chord` VALUES (55,'Em',3);
INSERT INTO `song_chord` VALUES (55,'G',4);
INSERT INTO `song_chord` VALUES (55,'A',5);
INSERT INTO `song_chord` VALUES (55,'Bm',6);
INSERT INTO `song_chord` VALUES (55,'E7',7);
INSERT INTO `song_chord` VALUES (56,'D',0);
INSERT INTO `song_chord` VALUES (56,'Em',1);
INSERT INTO `song_chord` VALUES (56,'D7',2);
INSERT INTO `song_chord` VALUES (56,'G',3);
INSERT INTO `song_chord` VALUES (56,'A',4);
INSERT INTO `song_chord` VALUES (57,'Em',0);
INSERT INTO `song_chord` VALUES (57,'Am',1);
INSERT INTO `song_chord` VALUES (57,'B7',2);
INSERT INTO `song_chord` VALUES (58,'Dm',0);
INSERT INTO `song_chord` VALUES (58,'Am',1);
INSERT INTO `song_chord` VALUES (58,'D7',2);
INSERT INTO `song_chord` VALUES (58,'G',3);
INSERT INTO `song_chord` VALUES (58,'Bm',4);
INSERT INTO `song_chord` VALUES (58,'C',5);
INSERT INTO `song_chord` VALUES (58,'F#',6);
INSERT INTO `song_chord` VALUES (58,'D',7);
INSERT INTO `song_chord` VALUES (59,'Am',0);
INSERT INTO `song_chord` VALUES (59,'F',1);
INSERT INTO `song_chord` VALUES (59,'G',2);
INSERT INTO `song_chord` VALUES (59,'E',3);
INSERT INTO `song_chord` VALUES (60,'Dm',0);
INSERT INTO `song_chord` VALUES (60,'F',1);
INSERT INTO `song_chord` VALUES (60,'A#',2);
INSERT INTO `song_chord` VALUES (60,'A7',3);
INSERT INTO `song_chord` VALUES (60,'C',4);
INSERT INTO `song_chord` VALUES (60,'A',5);
INSERT INTO `song_chord` VALUES (60,'G',6);
INSERT INTO `song_chord` VALUES (61,'Em',0);
INSERT INTO `song_chord` VALUES (61,'Am',1);
INSERT INTO `song_chord` VALUES (61,'B7',2);
INSERT INTO `song_chord` VALUES (61,'C',3);
INSERT INTO `song_chord` VALUES (62,'Am',0);
INSERT INTO `song_chord` VALUES (62,'Dm',1);
INSERT INTO `song_chord` VALUES (62,'E',2);
INSERT INTO `song_chord` VALUES (62,'G',3);
INSERT INTO `song_chord` VALUES (62,'F',4);
INSERT INTO `song_chord` VALUES (63,'G',0);
INSERT INTO `song_chord` VALUES (63,'D',1);
INSERT INTO `song_chord` VALUES (63,'C',2);
INSERT INTO `song_chord` VALUES (63,'D7',3);
INSERT INTO `song_chord` VALUES (63,'Bm',4);
INSERT INTO `song_chord` VALUES (63,'Em',5);
INSERT INTO `song_chord` VALUES (64,'G',0);
INSERT INTO `song_chord` VALUES (64,'Am',1);
INSERT INTO `song_chord` VALUES (64,'C',2);
INSERT INTO `song_chord` VALUES (64,'B7',3);
INSERT INTO `song_chord` VALUES (65,'E',0);
INSERT INTO `song_chord` VALUES (65,'G',1);
INSERT INTO `song_chord` VALUES (65,'A',2);
INSERT INTO `song_chord` VALUES (65,'B',3);
INSERT INTO `song_chord` VALUES (65,'Em',4);
INSERT INTO `song_chord` VALUES (65,'Am',5);
INSERT INTO `song_chord` VALUES (65,'Bm',6);
INSERT INTO `song_chord` VALUES (66,'Em',0);
INSERT INTO `song_chord` VALUES (66,'Am',1);
INSERT INTO `song_chord` VALUES (67,'Em',0);
INSERT INTO `song_chord` VALUES (67,'D',1);
INSERT INTO `song_chord` VALUES (67,'Am',2);
INSERT INTO `song_chord` VALUES (68,'Em',0);
INSERT INTO `song_chord` VALUES (68,'B7',1);
INSERT INTO `song_chord` VALUES (68,'G',2);
INSERT INTO `song_chord` VALUES (68,'Am',3);
INSERT INTO `song_chord` VALUES (68,'D',4);
INSERT INTO `song_chord` VALUES (68,'C',5);
INSERT INTO `song_chord` VALUES (69,'D',0);
INSERT INTO `song_chord` VALUES (69,'F#m',1);
INSERT INTO `song_chord` VALUES (69,'G',2);
INSERT INTO `song_chord` VALUES (69,'Em',3);
INSERT INTO `song_chord` VALUES (69,'Em6',4);
INSERT INTO `song_chord` VALUES (69,'A7',5);
INSERT INTO `song_chord` VALUES (69,'A',6);
INSERT INTO `song_chord` VALUES (70,'G',0);
INSERT INTO `song_chord` VALUES (70,'Bm',1);
INSERT INTO `song_chord` VALUES (70,'C',2);
INSERT INTO `song_chord` VALUES (70,'D',3);
INSERT INTO `song_chord` VALUES (71,'E',0);
INSERT INTO `song_chord` VALUES (71,'F#m',1);
INSERT INTO `song_chord` VALUES (71,'B7',2);
INSERT INTO `song_chord` VALUES (71,'C#m',3);
INSERT INTO `song_chord` VALUES (71,'G#',4);
INSERT INTO `song_chord` VALUES (72,'A',0);
INSERT INTO `song_chord` VALUES (72,'F#m',1);
INSERT INTO `song_chord` VALUES (72,'E',2);
INSERT INTO `song_chord` VALUES (72,'D',3);
INSERT INTO `song_chord` VALUES (72,'C#m',4);
INSERT INTO `song_chord` VALUES (73,'Em',0);
INSERT INTO `song_chord` VALUES (73,'Am',1);
INSERT INTO `song_chord` VALUES (73,'B7',2);
INSERT INTO `song_chord` VALUES (74,'Am',0);
INSERT INTO `song_chord` VALUES (74,'Em',1);
INSERT INTO `song_chord` VALUES (74,'F',2);
INSERT INTO `song_chord` VALUES (74,'E',3);
INSERT INTO `song_chord` VALUES (75,'D',0);
INSERT INTO `song_chord` VALUES (75,'F#m',1);
INSERT INTO `song_chord` VALUES (75,'G',2);
INSERT INTO `song_chord` VALUES (75,'A',3);
INSERT INTO `song_chord` VALUES (75,'Em',4);
INSERT INTO `song_chord` VALUES (76,'Am',0);
INSERT INTO `song_chord` VALUES (76,'G',1);
INSERT INTO `song_chord` VALUES (76,'F',2);
INSERT INTO `song_chord` VALUES (76,'E',3);
INSERT INTO `song_chord` VALUES (77,'Am',0);
INSERT INTO `song_chord` VALUES (77,'F',1);
INSERT INTO `song_chord` VALUES (77,'Dm',2);
INSERT INTO `song_chord` VALUES (77,'E',3);
INSERT INTO `song_chord` VALUES (78,'Em',0);
INSERT INTO `song_chord` VALUES (78,'C',1);
INSERT INTO `song_chord` VALUES (78,'B7',2);
INSERT INTO `song_chord` VALUES (78,'G',3);
INSERT INTO `song_chord` VALUES (79,'Am',0);
INSERT INTO `song_chord` VALUES (79,'Dm',1);
INSERT INTO `song_chord` VALUES (79,'F',2);
INSERT INTO `song_chord` VALUES (79,'E',3);
INSERT INTO `song_chord` VALUES (79,'C',4);
INSERT INTO `song_chord` VALUES (79,'Em',5);
INSERT INTO `song_chord` VALUES (80,'Am',0);
INSERT INTO `song_chord` VALUES (80,'Dm',1);
INSERT INTO `song_chord` VALUES (80,'F',2);
INSERT INTO `song_chord` VALUES (80,'E',3);
INSERT INTO `song_chord` VALUES (81,'C',0);
INSERT INTO `song_chord` VALUES (81,'E',1);
INSERT INTO `song_chord` VALUES (81,'Dm9',2);
INSERT INTO `song_chord` VALUES (81,'G',3);
INSERT INTO `song_chord` VALUES (81,'F',4);
INSERT INTO `song_chord` VALUES (82,'Em',0);
INSERT INTO `song_chord` VALUES (82,'A',1);
INSERT INTO `song_chord` VALUES (82,'Am',2);
INSERT INTO `song_chord` VALUES (82,'D',3);
INSERT INTO `song_chord` VALUES (82,'Bm',4);
INSERT INTO `song_chord` VALUES (83,'Am',0);
INSERT INTO `song_chord` VALUES (83,'G',1);
INSERT INTO `song_chord` VALUES (84,'C',0);
INSERT INTO `song_chord` VALUES (84,'Em',1);
INSERT INTO `song_chord` VALUES (84,'Am',2);
INSERT INTO `song_chord` VALUES (84,'F',3);
INSERT INTO `song_chord` VALUES (84,'G',4);
INSERT INTO `song_chord` VALUES (85,'Em',0);
INSERT INTO `song_chord` VALUES (85,'Am',1);
INSERT INTO `song_chord` VALUES (86,'G',0);
INSERT INTO `song_chord` VALUES (86,'Em',1);
INSERT INTO `song_chord` VALUES (86,'Am',2);
INSERT INTO `song_chord` VALUES (86,'Bm',3);
INSERT INTO `song_chord` VALUES (86,'A',4);
INSERT INTO `song_chord` VALUES (87,'Am',0);
INSERT INTO `song_chord` VALUES (87,'F',1);
INSERT INTO `song_chord` VALUES (87,'G',2);
INSERT INTO `song_chord` VALUES (87,'E',3);
INSERT INTO `song_chord` VALUES (88,'Am',0);
INSERT INTO `song_chord` VALUES (88,'G',1);
INSERT INTO `song_chord` VALUES (88,'F',2);
INSERT INTO `song_chord` VALUES (88,'E',3);
INSERT INTO `song_chord` VALUES (88,'Dm',4);
INSERT INTO `song_chord` VALUES (89,'Am',0);
INSERT INTO `song_chord` VALUES (89,'G',1);
INSERT INTO `song_chord` VALUES (89,'F',2);
INSERT INTO `song_chord` VALUES (89,'E',3);
INSERT INTO `song_chord` VALUES (89,'E7',4);
INSERT INTO `song_chord` VALUES (90,'Am',0);
INSERT INTO `song_chord` VALUES (90,'Dm',1);
INSERT INTO `song_chord` VALUES (90,'E',2);
INSERT INTO `song_chord` VALUES (90,'F',3);
INSERT INTO `song_chord` VALUES (90,'G',4);
INSERT INTO `song_chord` VALUES (91,'Dm',0);
INSERT INTO `song_chord` VALUES (91,'C',1);
INSERT INTO `song_chord` VALUES (91,'A',2);
INSERT INTO `song_chord` VALUES (91,'A#',3);
INSERT INTO `song_chord` VALUES (92,'E',0);
INSERT INTO `song_chord` VALUES (92,'C#m',1);
INSERT INTO `song_chord` VALUES (92,'G#',2);
INSERT INTO `song_chord` VALUES (92,'A',3);
INSERT INTO `song_chord` VALUES (92,'F#m',4);
INSERT INTO `song_chord` VALUES (92,'B',5);
INSERT INTO `song_chord` VALUES (93,'G',0);
INSERT INTO `song_chord` VALUES (93,'Em',1);
INSERT INTO `song_chord` VALUES (93,'C',2);
INSERT INTO `song_chord` VALUES (93,'D',3);
INSERT INTO `song_chord` VALUES (93,'B7',4);
INSERT INTO `song_chord` VALUES (93,'Am',5);
INSERT INTO `song_chord` VALUES (94,'E',0);
INSERT INTO `song_chord` VALUES (94,'A',1);
INSERT INTO `song_chord` VALUES (94,'F#',2);
INSERT INTO `song_chord` VALUES (94,'B7',3);
INSERT INTO `song_chord` VALUES (94,'C#m',4);
INSERT INTO `song_chord` VALUES (94,'G#',5);
INSERT INTO `song_chord` VALUES (95,'G',0);
INSERT INTO `song_chord` VALUES (95,'Em',1);
INSERT INTO `song_chord` VALUES (95,'C',2);
INSERT INTO `song_chord` VALUES (95,'Am',3);
INSERT INTO `song_chord` VALUES (95,'B7',4);
INSERT INTO `song_chord` VALUES (95,'D',5);
INSERT INTO `song_chord` VALUES (96,'Am',0);
INSERT INTO `song_chord` VALUES (96,'F',1);
INSERT INTO `song_chord` VALUES (96,'Dm',2);
INSERT INTO `song_chord` VALUES (96,'E',3);
INSERT INTO `song_chord` VALUES (97,'Am',0);
INSERT INTO `song_chord` VALUES (97,'G',1);
INSERT INTO `song_chord` VALUES (97,'E7',2);
INSERT INTO `song_chord` VALUES (97,'Dm',3);
INSERT INTO `song_chord` VALUES (97,'F',4);
INSERT INTO `song_chord` VALUES (97,'C',5);
INSERT INTO `song_chord` VALUES (98,'C',0);
INSERT INTO `song_chord` VALUES (98,'D',1);
INSERT INTO `song_chord` VALUES (98,'Cm',2);
INSERT INTO `song_chord` VALUES (98,'Gm',3);
INSERT INTO `song_chord` VALUES (98,'D7',4);
INSERT INTO `song_chord` VALUES (99,'E',0);
INSERT INTO `song_chord` VALUES (99,'F',1);
INSERT INTO `song_chord` VALUES (99,'G',2);
INSERT INTO `song_chord` VALUES (99,'C',3);
INSERT INTO `song_chord` VALUES (99,'Am',4);
INSERT INTO `song_chord` VALUES (100,'D',0);
INSERT INTO `song_chord` VALUES (100,'Em',1);
INSERT INTO `song_chord` VALUES (100,'A7',2);
INSERT INTO `song_chord` VALUES (100,'F#',3);
INSERT INTO `song_chord` VALUES (100,'Bm',4);
INSERT INTO `song_chord` VALUES (100,'A',5);
INSERT INTO `song_chord` VALUES (100,'G',6);
INSERT INTO `song_chord` VALUES (101,'E',0);
INSERT INTO `song_chord` VALUES (101,'Am',1);
INSERT INTO `song_chord` VALUES (101,'Dm',2);
INSERT INTO `song_chord` VALUES (101,'F',3);
INSERT INTO `song_chord` VALUES (102,'E',0);
INSERT INTO `song_chord` VALUES (102,'G#',1);
INSERT INTO `song_chord` VALUES (102,'C#m',2);
INSERT INTO `song_chord` VALUES (102,'F#m',3);
INSERT INTO `song_chord` VALUES (102,'B7',4);
INSERT INTO `song_chord` VALUES (103,'D',0);
INSERT INTO `song_chord` VALUES (103,'F#',1);
INSERT INTO `song_chord` VALUES (103,'Bm',2);
INSERT INTO `song_chord` VALUES (103,'A',3);
INSERT INTO `song_chord` VALUES (103,'G',4);
INSERT INTO `song_chord` VALUES (104,'Am',0);
INSERT INTO `song_chord` VALUES (104,'G',1);
INSERT INTO `song_chord` VALUES (104,'F',2);
INSERT INTO `song_chord` VALUES (104,'E',3);
INSERT INTO `song_chord` VALUES (105,'Dm',0);
INSERT INTO `song_chord` VALUES (105,'A#',1);
INSERT INTO `song_chord` VALUES (105,'A',2);
INSERT INTO `song_chord` VALUES (105,'A7',3);
INSERT INTO `song_chord` VALUES (106,'Em',0);
INSERT INTO `song_chord` VALUES (106,'D',1);
INSERT INTO `song_chord` VALUES (106,'G',2);
INSERT INTO `song_chord` VALUES (106,'A',3);
INSERT INTO `song_chord` VALUES (106,'Am',4);
INSERT INTO `song_chord` VALUES (106,'C',5);
INSERT INTO `song_chord` VALUES (107,'Em',0);
INSERT INTO `song_chord` VALUES (107,'Am',1);
INSERT INTO `song_chord` VALUES (107,'C',2);
INSERT INTO `song_chord` VALUES (107,'B7',3);
INSERT INTO `song_chord` VALUES (108,'Dm',0);
INSERT INTO `song_chord` VALUES (108,'Gm',1);
INSERT INTO `song_chord` VALUES (108,'A7',2);
INSERT INTO `song_chord` VALUES (108,'F',3);
INSERT INTO `song_chord` VALUES (108,'Am',4);
INSERT INTO `song_chord` VALUES (109,'Am',0);
INSERT INTO `song_chord` VALUES (109,'F',1);
INSERT INTO `song_chord` VALUES (109,'E',2);
INSERT INTO `song_chord` VALUES (109,'G',3);
INSERT INTO `song_chord` VALUES (110,'Am',0);
INSERT INTO `song_chord` VALUES (110,'F',1);
INSERT INTO `song_chord` VALUES (110,'E',2);
INSERT INTO `song_chord` VALUES (110,'G',3);
INSERT INTO `song_chord` VALUES (111,'E',0);
INSERT INTO `song_chord` VALUES (111,'C#m',1);
INSERT INTO `song_chord` VALUES (111,'G#',2);
INSERT INTO `song_chord` VALUES (111,'A',3);
INSERT INTO `song_chord` VALUES (111,'B7',4);
INSERT INTO `song_chord` VALUES (112,'Am',0);
INSERT INTO `song_chord` VALUES (112,'G',1);
INSERT INTO `song_chord` VALUES (112,'F',2);
INSERT INTO `song_chord` VALUES (112,'E',3);
INSERT INTO `song_chord` VALUES (113,'D',0);
INSERT INTO `song_chord` VALUES (113,'Bm',1);
INSERT INTO `song_chord` VALUES (113,'G',2);
INSERT INTO `song_chord` VALUES (113,'E',3);
INSERT INTO `song_chord` VALUES (113,'A',4);
INSERT INTO `song_chord` VALUES (113,'F#',5);
INSERT INTO `song_chord` VALUES (118,'D',1);
INSERT INTO `song_chord` VALUES (118,'F#m',2);
INSERT INTO `song_chord` VALUES (118,'E',3);
INSERT INTO `song_chord` VALUES (126,'C',5);
INSERT INTO `song_chord` VALUES (118,'Bm',0);
INSERT INTO `song_chord` VALUES (127,'D',0);
INSERT INTO `song_chord` VALUES (127,'G',1);
INSERT INTO `song_chord` VALUES (127,'A7',2);
INSERT INTO `song_chord` VALUES (128,'G',0);
INSERT INTO `song_chord` VALUES (128,'Bm',1);
INSERT INTO `song_chord` VALUES (128,'Am',2);
INSERT INTO `song_chord` VALUES (128,'Em',3);
INSERT INTO `song_chord` VALUES (128,'B7',4);
INSERT INTO `song_chord` VALUES (129,'A',0);
INSERT INTO `song_chord` VALUES (129,'Fm',1);
INSERT INTO `song_chord` VALUES (130,'Em',0);
INSERT INTO `song_chord` VALUES (130,'Am',1);
INSERT INTO `song_chord` VALUES (130,'D',2);
INSERT INTO `song_chord` VALUES (130,'C',3);
INSERT INTO `song_chord` VALUES (130,'B7',4);
INSERT INTO `song_chord` VALUES (131,'Cm',0);
INSERT INTO `song_chord` VALUES (131,'G7',1);
INSERT INTO `song_chord` VALUES (131,'Fm',2);
INSERT INTO `song_chord` VALUES (132,'Am',0);
INSERT INTO `song_chord` VALUES (132,'A7',1);
INSERT INTO `song_chord` VALUES (132,'Dm',2);
INSERT INTO `song_chord` VALUES (132,'F7M',3);
INSERT INTO `song_chord` VALUES (132,'E',4);
INSERT INTO `song_chord` VALUES (132,'F',5);
INSERT INTO `song_chord` VALUES (133,'E',0);
INSERT INTO `song_chord` VALUES (133,'F#m',1);
INSERT INTO `song_chord` VALUES (133,'B7',2);
INSERT INTO `song_chord` VALUES (133,'G#',3);
INSERT INTO `song_chord` VALUES (133,'C#m',4);
INSERT INTO `song_chord` VALUES (133,'A',5);
INSERT INTO `song_chord` VALUES (133,'B',6);
INSERT INTO `song_chord` VALUES (326,'C7',0);
INSERT INTO `song_chord` VALUES (134,'A',0);
INSERT INTO `song_chord` VALUES (134,'A#',1);
INSERT INTO `song_chord` VALUES (134,'Dm',2);
INSERT INTO `song_chord` VALUES (135,'Em',0);
INSERT INTO `song_chord` VALUES (135,'G',1);
INSERT INTO `song_chord` VALUES (135,'B7',2);
INSERT INTO `song_chord` VALUES (135,'Am',3);
INSERT INTO `song_chord` VALUES (135,'C',4);
INSERT INTO `song_chord` VALUES (136,'Em',0);
INSERT INTO `song_chord` VALUES (136,'B7',1);
INSERT INTO `song_chord` VALUES (136,'Am',2);
INSERT INTO `song_chord` VALUES (136,'D',3);
INSERT INTO `song_chord` VALUES (136,'G',4);
INSERT INTO `song_chord` VALUES (136,'C',5);
INSERT INTO `song_chord` VALUES (137,'Am',0);
INSERT INTO `song_chord` VALUES (137,'F',1);
INSERT INTO `song_chord` VALUES (137,'E',2);
INSERT INTO `song_chord` VALUES (137,'B7',3);
INSERT INTO `song_chord` VALUES (137,'Dm',4);
INSERT INTO `song_chord` VALUES (137,'G',5);
INSERT INTO `song_chord` VALUES (140,'Am',0);
INSERT INTO `song_chord` VALUES (140,'Dm9',1);
INSERT INTO `song_chord` VALUES (140,'E',2);
INSERT INTO `song_chord` VALUES (141,'Dm',0);
INSERT INTO `song_chord` VALUES (141,'A7',1);
INSERT INTO `song_chord` VALUES (141,'A#',2);
INSERT INTO `song_chord` VALUES (142,'Am',0);
INSERT INTO `song_chord` VALUES (142,'G',1);
INSERT INTO `song_chord` VALUES (142,'F',2);
INSERT INTO `song_chord` VALUES (142,'E',3);
INSERT INTO `song_chord` VALUES (142,'Dm',4);
INSERT INTO `song_chord` VALUES (143,'Am',0);
INSERT INTO `song_chord` VALUES (143,'E7',1);
INSERT INTO `song_chord` VALUES (143,'F',2);
INSERT INTO `song_chord` VALUES (143,'Dm',3);
INSERT INTO `song_chord` VALUES (143,'E',4);
INSERT INTO `song_chord` VALUES (144,'Am',0);
INSERT INTO `song_chord` VALUES (144,'G',1);
INSERT INTO `song_chord` VALUES (144,'C',2);
INSERT INTO `song_chord` VALUES (144,'F',3);
INSERT INTO `song_chord` VALUES (144,'E',4);
INSERT INTO `song_chord` VALUES (144,'E7',5);
INSERT INTO `song_chord` VALUES (145,'Am',0);
INSERT INTO `song_chord` VALUES (145,'A7',1);
INSERT INTO `song_chord` VALUES (145,'Dm9',2);
INSERT INTO `song_chord` VALUES (145,'F7M',3);
INSERT INTO `song_chord` VALUES (145,'E',4);
INSERT INTO `song_chord` VALUES (146,'Am',0);
INSERT INTO `song_chord` VALUES (146,'Dm',1);
INSERT INTO `song_chord` VALUES (146,'E',2);
INSERT INTO `song_chord` VALUES (146,'F',3);
INSERT INTO `song_chord` VALUES (146,'A7',4);
INSERT INTO `song_chord` VALUES (148,'Am',0);
INSERT INTO `song_chord` VALUES (148,'Dm',1);
INSERT INTO `song_chord` VALUES (148,'E',2);
INSERT INTO `song_chord` VALUES (148,'G',3);
INSERT INTO `song_chord` VALUES (148,'F',4);
INSERT INTO `song_chord` VALUES (149,'Dm',0);
INSERT INTO `song_chord` VALUES (149,'Gm',1);
INSERT INTO `song_chord` VALUES (149,'F',2);
INSERT INTO `song_chord` VALUES (149,'G',3);
INSERT INTO `song_chord` VALUES (149,'A',4);
INSERT INTO `song_chord` VALUES (149,'A7',5);
INSERT INTO `song_chord` VALUES (150,'Bm',0);
INSERT INTO `song_chord` VALUES (150,'G',1);
INSERT INTO `song_chord` VALUES (150,'Em',2);
INSERT INTO `song_chord` VALUES (150,'F#',3);
INSERT INTO `song_chord` VALUES (151,'A',0);
INSERT INTO `song_chord` VALUES (151,'F#m',1);
INSERT INTO `song_chord` VALUES (152,'E',0);
INSERT INTO `song_chord` VALUES (152,'A',1);
INSERT INTO `song_chord` VALUES (152,'D',2);
INSERT INTO `song_chord` VALUES (153,'A',0);
INSERT INTO `song_chord` VALUES (153,'A#',1);
INSERT INTO `song_chord` VALUES (153,'Dm',2);
INSERT INTO `song_chord` VALUES (153,'A7',3);
INSERT INTO `song_chord` VALUES (154,'C',0);
INSERT INTO `song_chord` VALUES (154,'E',1);
INSERT INTO `song_chord` VALUES (154,'Am',2);
INSERT INTO `song_chord` VALUES (155,'E',0);
INSERT INTO `song_chord` VALUES (155,'G',1);
INSERT INTO `song_chord` VALUES (155,'A',2);
INSERT INTO `song_chord` VALUES (155,'B7',3);
INSERT INTO `song_chord` VALUES (155,'Em',4);
INSERT INTO `song_chord` VALUES (155,'Am',5);
INSERT INTO `song_chord` VALUES (155,'Bm',6);
INSERT INTO `song_chord` VALUES (155,'B',7);
INSERT INTO `song_chord` VALUES (156,'D',0);
INSERT INTO `song_chord` VALUES (156,'F#m',1);
INSERT INTO `song_chord` VALUES (156,'G',2);
INSERT INTO `song_chord` VALUES (156,'Em6',3);
INSERT INTO `song_chord` VALUES (156,'A7',4);
INSERT INTO `song_chord` VALUES (157,'Am',0);
INSERT INTO `song_chord` VALUES (157,'Dm9',1);
INSERT INTO `song_chord` VALUES (157,'E',2);
INSERT INTO `song_chord` VALUES (157,'E7',3);
INSERT INTO `song_chord` VALUES (158,'C',0);
INSERT INTO `song_chord` VALUES (158,'E',1);
INSERT INTO `song_chord` VALUES (158,'F',2);
INSERT INTO `song_chord` VALUES (159,'Em',0);
INSERT INTO `song_chord` VALUES (159,'D',1);
INSERT INTO `song_chord` VALUES (159,'G',2);
INSERT INTO `song_chord` VALUES (159,'Bm',3);
INSERT INTO `song_chord` VALUES (160,'Dm',0);
INSERT INTO `song_chord` VALUES (160,'C',1);
INSERT INTO `song_chord` VALUES (160,'A',2);
INSERT INTO `song_chord` VALUES (160,'A#',3);
INSERT INTO `song_chord` VALUES (160,'A7',4);
INSERT INTO `song_chord` VALUES (161,'Am',0);
INSERT INTO `song_chord` VALUES (161,'G',1);
INSERT INTO `song_chord` VALUES (161,'F',2);
INSERT INTO `song_chord` VALUES (161,'E',3);
INSERT INTO `song_chord` VALUES (161,'Dm',4);
INSERT INTO `song_chord` VALUES (163,'G',0);
INSERT INTO `song_chord` VALUES (163,'F#m',1);
INSERT INTO `song_chord` VALUES (163,'E',2);
INSERT INTO `song_chord` VALUES (163,'A',3);
INSERT INTO `song_chord` VALUES (163,'B',4);
INSERT INTO `song_chord` VALUES (163,'Em',5);
INSERT INTO `song_chord` VALUES (163,'D',6);
INSERT INTO `song_chord` VALUES (163,'C',7);
INSERT INTO `song_chord` VALUES (163,'B7',8);
INSERT INTO `song_chord` VALUES (164,'Dm',0);
INSERT INTO `song_chord` VALUES (164,'Gm',1);
INSERT INTO `song_chord` VALUES (164,'A7',2);
INSERT INTO `song_chord` VALUES (165,'G',0);
INSERT INTO `song_chord` VALUES (165,'Am',1);
INSERT INTO `song_chord` VALUES (165,'C',2);
INSERT INTO `song_chord` VALUES (165,'B7',3);
INSERT INTO `song_chord` VALUES (166,'Am',0);
INSERT INTO `song_chord` VALUES (166,'E7',1);
INSERT INTO `song_chord` VALUES (167,'Am',0);
INSERT INTO `song_chord` VALUES (167,'C',1);
INSERT INTO `song_chord` VALUES (167,'E',2);
INSERT INTO `song_chord` VALUES (167,'F',3);
INSERT INTO `song_chord` VALUES (167,'Dm',4);
INSERT INTO `song_chord` VALUES (167,'Dm9',5);
INSERT INTO `song_chord` VALUES (167,'G',6);
INSERT INTO `song_chord` VALUES (167,'A7',7);
INSERT INTO `song_chord` VALUES (168,'Em',0);
INSERT INTO `song_chord` VALUES (168,'Am',1);
INSERT INTO `song_chord` VALUES (168,'B7',2);
INSERT INTO `song_chord` VALUES (168,'C',3);
INSERT INTO `song_chord` VALUES (168,'D7',4);
INSERT INTO `song_chord` VALUES (168,'G',5);
INSERT INTO `song_chord` VALUES (168,'Bm',6);
INSERT INTO `song_chord` VALUES (169,'E',0);
INSERT INTO `song_chord` VALUES (169,'F#m',1);
INSERT INTO `song_chord` VALUES (169,'B7',2);
INSERT INTO `song_chord` VALUES (169,'G#',3);
INSERT INTO `song_chord` VALUES (169,'C#m',4);
INSERT INTO `song_chord` VALUES (169,'C#7',5);
INSERT INTO `song_chord` VALUES (169,'A',6);
INSERT INTO `song_chord` VALUES (169,'B',7);
INSERT INTO `song_chord` VALUES (169,'A#',8);
INSERT INTO `song_chord` VALUES (170,'D',0);
INSERT INTO `song_chord` VALUES (170,'Em',1);
INSERT INTO `song_chord` VALUES (170,'D7',2);
INSERT INTO `song_chord` VALUES (170,'G',3);
INSERT INTO `song_chord` VALUES (170,'A',4);
INSERT INTO `song_chord` VALUES (171,'Em',0);
INSERT INTO `song_chord` VALUES (171,'Am',1);
INSERT INTO `song_chord` VALUES (171,'D',2);
INSERT INTO `song_chord` VALUES (171,'C',3);
INSERT INTO `song_chord` VALUES (171,'B7',4);
INSERT INTO `song_chord` VALUES (172,'Am',0);
INSERT INTO `song_chord` VALUES (172,'F7',1);
INSERT INTO `song_chord` VALUES (172,'E',2);
INSERT INTO `song_chord` VALUES (172,'F',3);
INSERT INTO `song_chord` VALUES (172,'E7',4);
INSERT INTO `song_chord` VALUES (172,'G',5);
INSERT INTO `song_chord` VALUES (173,'Am',0);
INSERT INTO `song_chord` VALUES (173,'Dm9',1);
INSERT INTO `song_chord` VALUES (173,'F',2);
INSERT INTO `song_chord` VALUES (173,'E',3);
INSERT INTO `song_chord` VALUES (173,'C',4);
INSERT INTO `song_chord` VALUES (173,'Em',5);
INSERT INTO `song_chord` VALUES (174,'C',0);
INSERT INTO `song_chord` VALUES (174,'E',1);
INSERT INTO `song_chord` VALUES (174,'Dm9',2);
INSERT INTO `song_chord` VALUES (174,'G',3);
INSERT INTO `song_chord` VALUES (174,'F',4);
INSERT INTO `song_chord` VALUES (175,'Em',0);
INSERT INTO `song_chord` VALUES (175,'Am',1);
INSERT INTO `song_chord` VALUES (176,'E',0);
INSERT INTO `song_chord` VALUES (176,'G#',1);
INSERT INTO `song_chord` VALUES (176,'A',2);
INSERT INTO `song_chord` VALUES (176,'B7',3);
INSERT INTO `song_chord` VALUES (176,'C#m',4);
INSERT INTO `song_chord` VALUES (176,'B',5);
INSERT INTO `song_chord` VALUES (177,'Am',0);
INSERT INTO `song_chord` VALUES (177,'F',1);
INSERT INTO `song_chord` VALUES (177,'G',2);
INSERT INTO `song_chord` VALUES (177,'E',3);
INSERT INTO `song_chord` VALUES (178,'C',0);
INSERT INTO `song_chord` VALUES (178,'Am',1);
INSERT INTO `song_chord` VALUES (178,'F',2);
INSERT INTO `song_chord` VALUES (178,'G',3);
INSERT INTO `song_chord` VALUES (178,'G#',4);
INSERT INTO `song_chord` VALUES (179,'G',0);
INSERT INTO `song_chord` VALUES (179,'Em',1);
INSERT INTO `song_chord` VALUES (179,'Am',2);
INSERT INTO `song_chord` VALUES (179,'Bm',3);
INSERT INTO `song_chord` VALUES (179,'A',4);
INSERT INTO `song_chord` VALUES (180,'Am',0);
INSERT INTO `song_chord` VALUES (180,'F',1);
INSERT INTO `song_chord` VALUES (180,'E',2);
INSERT INTO `song_chord` VALUES (180,'G',3);
INSERT INTO `song_chord` VALUES (181,'Em',0);
INSERT INTO `song_chord` VALUES (181,'E7',1);
INSERT INTO `song_chord` VALUES (181,'Am',2);
INSERT INTO `song_chord` VALUES (181,'B7',3);
INSERT INTO `song_chord` VALUES (182,'Am',0);
INSERT INTO `song_chord` VALUES (182,'G',1);
INSERT INTO `song_chord` VALUES (182,'E',2);
INSERT INTO `song_chord` VALUES (182,'F',3);
INSERT INTO `song_chord` VALUES (183,'E',0);
INSERT INTO `song_chord` VALUES (183,'C#m',1);
INSERT INTO `song_chord` VALUES (183,'G#',2);
INSERT INTO `song_chord` VALUES (183,'A',3);
INSERT INTO `song_chord` VALUES (183,'F#m',4);
INSERT INTO `song_chord` VALUES (183,'B',5);
INSERT INTO `song_chord` VALUES (184,'Am',0);
INSERT INTO `song_chord` VALUES (184,'E',1);
INSERT INTO `song_chord` VALUES (184,'F',2);
INSERT INTO `song_chord` VALUES (184,'Dm',3);
INSERT INTO `song_chord` VALUES (184,'Em',4);
INSERT INTO `song_chord` VALUES (184,'G',5);
INSERT INTO `song_chord` VALUES (184,'B',6);
INSERT INTO `song_chord` VALUES (184,'D',7);
INSERT INTO `song_chord` VALUES (184,'A',8);
INSERT INTO `song_chord` VALUES (184,'F#',9);
INSERT INTO `song_chord` VALUES (184,'Bm',10);
INSERT INTO `song_chord` VALUES (185,'Am',0);
INSERT INTO `song_chord` VALUES (185,'F',1);
INSERT INTO `song_chord` VALUES (185,'E',2);
INSERT INTO `song_chord` VALUES (185,'C',3);
INSERT INTO `song_chord` VALUES (186,'Am',0);
INSERT INTO `song_chord` VALUES (186,'C',1);
INSERT INTO `song_chord` VALUES (186,'E',2);
INSERT INTO `song_chord` VALUES (186,'F',3);
INSERT INTO `song_chord` VALUES (186,'A7',4);
INSERT INTO `song_chord` VALUES (186,'G',5);
INSERT INTO `song_chord` VALUES (186,'Dm',6);
INSERT INTO `song_chord` VALUES (188,'Dm',0);
INSERT INTO `song_chord` VALUES (188,'Gm',1);
INSERT INTO `song_chord` VALUES (188,'A7',2);
INSERT INTO `song_chord` VALUES (188,'A',3);
INSERT INTO `song_chord` VALUES (189,'G',0);
INSERT INTO `song_chord` VALUES (189,'Em',1);
INSERT INTO `song_chord` VALUES (189,'C',2);
INSERT INTO `song_chord` VALUES (189,'Am',3);
INSERT INTO `song_chord` VALUES (189,'B7',4);
INSERT INTO `song_chord` VALUES (189,'D',5);
INSERT INTO `song_chord` VALUES (190,'Em',0);
INSERT INTO `song_chord` VALUES (190,'D',1);
INSERT INTO `song_chord` VALUES (190,'Am',2);
INSERT INTO `song_chord` VALUES (190,'B7',3);
INSERT INTO `song_chord` VALUES (190,'C',4);
INSERT INTO `song_chord` VALUES (190,'D7',5);
INSERT INTO `song_chord` VALUES (190,'G',6);
INSERT INTO `song_chord` VALUES (190,'Bm',7);
INSERT INTO `song_chord` VALUES (191,'Am',0);
INSERT INTO `song_chord` VALUES (191,'G',1);
INSERT INTO `song_chord` VALUES (191,'F',2);
INSERT INTO `song_chord` VALUES (191,'E',3);
INSERT INTO `song_chord` VALUES (192,'Am',0);
INSERT INTO `song_chord` VALUES (192,'E',1);
INSERT INTO `song_chord` VALUES (192,'G',2);
INSERT INTO `song_chord` VALUES (192,'F',3);
INSERT INTO `song_chord` VALUES (193,'D',0);
INSERT INTO `song_chord` VALUES (193,'A',1);
INSERT INTO `song_chord` VALUES (193,'E7',2);
INSERT INTO `song_chord` VALUES (193,'A7',3);
INSERT INTO `song_chord` VALUES (193,'F#',4);
INSERT INTO `song_chord` VALUES (193,'Bm',5);
INSERT INTO `song_chord` VALUES (194,'Am',0);
INSERT INTO `song_chord` VALUES (194,'Em',1);
INSERT INTO `song_chord` VALUES (194,'F',2);
INSERT INTO `song_chord` VALUES (194,'E7',3);
INSERT INTO `song_chord` VALUES (195,'Am',0);
INSERT INTO `song_chord` VALUES (195,'F',1);
INSERT INTO `song_chord` VALUES (195,'G',2);
INSERT INTO `song_chord` VALUES (195,'E',3);
INSERT INTO `song_chord` VALUES (196,'Em',0);
INSERT INTO `song_chord` VALUES (196,'Am',1);
INSERT INTO `song_chord` VALUES (196,'B7',2);
INSERT INTO `song_chord` VALUES (196,'D7',3);
INSERT INTO `song_chord` VALUES (196,'G',4);
INSERT INTO `song_chord` VALUES (197,'Em',0);
INSERT INTO `song_chord` VALUES (197,'B7',1);
INSERT INTO `song_chord` VALUES (197,'G',2);
INSERT INTO `song_chord` VALUES (197,'Am',3);
INSERT INTO `song_chord` VALUES (197,'D',4);
INSERT INTO `song_chord` VALUES (197,'C',5);
INSERT INTO `song_chord` VALUES (198,'Am',0);
INSERT INTO `song_chord` VALUES (198,'E7',1);
INSERT INTO `song_chord` VALUES (198,'A7',2);
INSERT INTO `song_chord` VALUES (198,'Dm',3);
INSERT INTO `song_chord` VALUES (198,'E',4);
INSERT INTO `song_chord` VALUES (199,'Am',0);
INSERT INTO `song_chord` VALUES (199,'G',1);
INSERT INTO `song_chord` VALUES (199,'E',2);
INSERT INTO `song_chord` VALUES (199,'Dm',3);
INSERT INTO `song_chord` VALUES (199,'F',4);
INSERT INTO `song_chord` VALUES (199,'C',5);
INSERT INTO `song_chord` VALUES (200,'Em',0);
INSERT INTO `song_chord` VALUES (200,'Am',1);
INSERT INTO `song_chord` VALUES (200,'B7',2);
INSERT INTO `song_chord` VALUES (200,'Am6',3);
INSERT INTO `song_chord` VALUES (201,'Em',0);
INSERT INTO `song_chord` VALUES (201,'D',1);
INSERT INTO `song_chord` VALUES (202,'Em',0);
INSERT INTO `song_chord` VALUES (202,'B7',1);
INSERT INTO `song_chord` VALUES (202,'Am',2);
INSERT INTO `song_chord` VALUES (203,'Dm',0);
INSERT INTO `song_chord` VALUES (203,'Gm',1);
INSERT INTO `song_chord` VALUES (203,'A',2);
INSERT INTO `song_chord` VALUES (203,'A#',3);
INSERT INTO `song_chord` VALUES (203,'C',4);
INSERT INTO `song_chord` VALUES (204,'G',0);
INSERT INTO `song_chord` VALUES (204,'Bm',1);
INSERT INTO `song_chord` VALUES (204,'C',2);
INSERT INTO `song_chord` VALUES (204,'D7',3);
INSERT INTO `song_chord` VALUES (204,'D',4);
INSERT INTO `song_chord` VALUES (205,'Am',0);
INSERT INTO `song_chord` VALUES (205,'F',1);
INSERT INTO `song_chord` VALUES (205,'E',2);
INSERT INTO `song_chord` VALUES (205,'G',3);
INSERT INTO `song_chord` VALUES (206,'E',0);
INSERT INTO `song_chord` VALUES (206,'C#m',1);
INSERT INTO `song_chord` VALUES (206,'G#',2);
INSERT INTO `song_chord` VALUES (206,'A',3);
INSERT INTO `song_chord` VALUES (206,'B7',4);
INSERT INTO `song_chord` VALUES (207,'D',0);
INSERT INTO `song_chord` VALUES (207,'E',1);
INSERT INTO `song_chord` VALUES (207,'A',2);
INSERT INTO `song_chord` VALUES (207,'A7',3);
INSERT INTO `song_chord` VALUES (208,'Dm',0);
INSERT INTO `song_chord` VALUES (208,'Gm',1);
INSERT INTO `song_chord` VALUES (208,'A7',2);
INSERT INTO `song_chord` VALUES (208,'A#',3);
INSERT INTO `song_chord` VALUES (208,'C',4);
INSERT INTO `song_chord` VALUES (209,'B',0);
INSERT INTO `song_chord` VALUES (209,'Am',1);
INSERT INTO `song_chord` VALUES (209,'Em',2);
INSERT INTO `song_chord` VALUES (210,'G',0);
INSERT INTO `song_chord` VALUES (210,'Em',1);
INSERT INTO `song_chord` VALUES (210,'C',2);
INSERT INTO `song_chord` VALUES (210,'A',3);
INSERT INTO `song_chord` VALUES (210,'D',4);
INSERT INTO `song_chord` VALUES (211,'D',0);
INSERT INTO `song_chord` VALUES (211,'F#m',1);
INSERT INTO `song_chord` VALUES (211,'G',2);
INSERT INTO `song_chord` VALUES (211,'Em6',3);
INSERT INTO `song_chord` VALUES (211,'A7',4);
INSERT INTO `song_chord` VALUES (211,'F#',5);
INSERT INTO `song_chord` VALUES (212,'Am',0);
INSERT INTO `song_chord` VALUES (212,'F',1);
INSERT INTO `song_chord` VALUES (212,'Dm',2);
INSERT INTO `song_chord` VALUES (212,'E',3);
INSERT INTO `song_chord` VALUES (213,'Em',0);
INSERT INTO `song_chord` VALUES (213,'C',1);
INSERT INTO `song_chord` VALUES (213,'B7',2);
INSERT INTO `song_chord` VALUES (213,'Am',3);
INSERT INTO `song_chord` VALUES (214,'Dm',0);
INSERT INTO `song_chord` VALUES (214,'C',1);
INSERT INTO `song_chord` VALUES (214,'Gm',2);
INSERT INTO `song_chord` VALUES (215,'Am',0);
INSERT INTO `song_chord` VALUES (215,'Dm',1);
INSERT INTO `song_chord` VALUES (215,'F',2);
INSERT INTO `song_chord` VALUES (215,'E',3);
INSERT INTO `song_chord` VALUES (215,'E7',4);
INSERT INTO `song_chord` VALUES (216,'Am',0);
INSERT INTO `song_chord` VALUES (216,'F',1);
INSERT INTO `song_chord` VALUES (216,'E',2);
INSERT INTO `song_chord` VALUES (216,'G',3);
INSERT INTO `song_chord` VALUES (217,'Dm5',0);
INSERT INTO `song_chord` VALUES (217,'Am',1);
INSERT INTO `song_chord` VALUES (217,'Am6',2);
INSERT INTO `song_chord` VALUES (217,'D7',3);
INSERT INTO `song_chord` VALUES (217,'G',4);
INSERT INTO `song_chord` VALUES (217,'Bm',5);
INSERT INTO `song_chord` VALUES (217,'C',6);
INSERT INTO `song_chord` VALUES (217,'F#',7);
INSERT INTO `song_chord` VALUES (217,'D',8);
INSERT INTO `song_chord` VALUES (217,'A',9);
INSERT INTO `song_chord` VALUES (218,'Em',0);
INSERT INTO `song_chord` VALUES (218,'G',1);
INSERT INTO `song_chord` VALUES (218,'B7',2);
INSERT INTO `song_chord` VALUES (218,'Am',3);
INSERT INTO `song_chord` VALUES (218,'C',4);
INSERT INTO `song_chord` VALUES (219,'Dm',0);
INSERT INTO `song_chord` VALUES (219,'D7',1);
INSERT INTO `song_chord` VALUES (219,'Gm',2);
INSERT INTO `song_chord` VALUES (219,'A',3);
INSERT INTO `song_chord` VALUES (219,'A#',4);
INSERT INTO `song_chord` VALUES (220,'Em',0);
INSERT INTO `song_chord` VALUES (220,'F#',1);
INSERT INTO `song_chord` VALUES (220,'G',2);
INSERT INTO `song_chord` VALUES (220,'Bm',3);
INSERT INTO `song_chord` VALUES (221,'Dm',0);
INSERT INTO `song_chord` VALUES (221,'C',1);
INSERT INTO `song_chord` VALUES (221,'A',2);
INSERT INTO `song_chord` VALUES (221,'G',3);
INSERT INTO `song_chord` VALUES (221,'F',4);
INSERT INTO `song_chord` VALUES (221,'A7',5);
INSERT INTO `song_chord` VALUES (221,'A#',6);
INSERT INTO `song_chord` VALUES (222,'Em',0);
INSERT INTO `song_chord` VALUES (222,'Am',1);
INSERT INTO `song_chord` VALUES (222,'B7',2);
INSERT INTO `song_chord` VALUES (223,'Am',0);
INSERT INTO `song_chord` VALUES (223,'Dm',1);
INSERT INTO `song_chord` VALUES (223,'E',2);
INSERT INTO `song_chord` VALUES (224,'C',0);
INSERT INTO `song_chord` VALUES (224,'E',1);
INSERT INTO `song_chord` VALUES (224,'Am',2);
INSERT INTO `song_chord` VALUES (224,'F',3);
INSERT INTO `song_chord` VALUES (225,'C',0);
INSERT INTO `song_chord` VALUES (225,'Em',1);
INSERT INTO `song_chord` VALUES (225,'Am',2);
INSERT INTO `song_chord` VALUES (225,'F',3);
INSERT INTO `song_chord` VALUES (226,'Am',0);
INSERT INTO `song_chord` VALUES (226,'Dm',1);
INSERT INTO `song_chord` VALUES (226,'E',2);
INSERT INTO `song_chord` VALUES (226,'G',3);
INSERT INTO `song_chord` VALUES (226,'F',4);
INSERT INTO `song_chord` VALUES (227,'Am',0);
INSERT INTO `song_chord` VALUES (227,'G',1);
INSERT INTO `song_chord` VALUES (227,'F',2);
INSERT INTO `song_chord` VALUES (227,'E',3);
INSERT INTO `song_chord` VALUES (228,'D',0);
INSERT INTO `song_chord` VALUES (228,'F#m',1);
INSERT INTO `song_chord` VALUES (228,'G',2);
INSERT INTO `song_chord` VALUES (228,'A',3);
INSERT INTO `song_chord` VALUES (228,'A7',4);
INSERT INTO `song_chord` VALUES (229,'Am',0);
INSERT INTO `song_chord` VALUES (229,'G',1);
INSERT INTO `song_chord` VALUES (229,'F',2);
INSERT INTO `song_chord` VALUES (229,'E',3);
INSERT INTO `song_chord` VALUES (230,'Am',0);
INSERT INTO `song_chord` VALUES (230,'E7',1);
INSERT INTO `song_chord` VALUES (230,'F',2);
INSERT INTO `song_chord` VALUES (230,'E',3);
INSERT INTO `song_chord` VALUES (230,'Dm',4);
INSERT INTO `song_chord` VALUES (231,'Am',0);
INSERT INTO `song_chord` VALUES (231,'G',1);
INSERT INTO `song_chord` VALUES (231,'F',2);
INSERT INTO `song_chord` VALUES (231,'E',3);
INSERT INTO `song_chord` VALUES (231,'E7',4);
INSERT INTO `song_chord` VALUES (231,'Dm',5);
INSERT INTO `song_chord` VALUES (232,'Am',0);
INSERT INTO `song_chord` VALUES (232,'Dm',1);
INSERT INTO `song_chord` VALUES (232,'E',2);
INSERT INTO `song_chord` VALUES (233,'Bm',0);
INSERT INTO `song_chord` VALUES (233,'A',1);
INSERT INTO `song_chord` VALUES (233,'F#',2);
INSERT INTO `song_chord` VALUES (233,'G',3);
INSERT INTO `song_chord` VALUES (233,'A7',4);
INSERT INTO `song_chord` VALUES (233,'D',5);
INSERT INTO `song_chord` VALUES (233,'Em',6);
INSERT INTO `song_chord` VALUES (234,'F#',0);
INSERT INTO `song_chord` VALUES (234,'G',1);
INSERT INTO `song_chord` VALUES (234,'Bm',2);
INSERT INTO `song_chord` VALUES (234,'A',3);
INSERT INTO `song_chord` VALUES (235,'Em',0);
INSERT INTO `song_chord` VALUES (235,'B7',1);
INSERT INTO `song_chord` VALUES (235,'C',2);
INSERT INTO `song_chord` VALUES (235,'Am',3);
INSERT INTO `song_chord` VALUES (235,'G',4);
INSERT INTO `song_chord` VALUES (236,'E',0);
INSERT INTO `song_chord` VALUES (236,'C#m',1);
INSERT INTO `song_chord` VALUES (236,'A',2);
INSERT INTO `song_chord` VALUES (236,'B',3);
INSERT INTO `song_chord` VALUES (236,'G#',4);
INSERT INTO `song_chord` VALUES (237,'E',0);
INSERT INTO `song_chord` VALUES (237,'F#m',1);
INSERT INTO `song_chord` VALUES (237,'B7',2);
INSERT INTO `song_chord` VALUES (237,'C#m',3);
INSERT INTO `song_chord` VALUES (237,'G#',4);
INSERT INTO `song_chord` VALUES (238,'Am',0);
INSERT INTO `song_chord` VALUES (238,'F',1);
INSERT INTO `song_chord` VALUES (238,'E',2);
INSERT INTO `song_chord` VALUES (238,'B7',3);
INSERT INTO `song_chord` VALUES (238,'Dm',4);
INSERT INTO `song_chord` VALUES (238,'G',5);
INSERT INTO `song_chord` VALUES (239,'Dm5',0);
INSERT INTO `song_chord` VALUES (239,'Gm',1);
INSERT INTO `song_chord` VALUES (239,'A',2);
INSERT INTO `song_chord` VALUES (239,'Dm',3);
INSERT INTO `song_chord` VALUES (239,'C',4);
INSERT INTO `song_chord` VALUES (239,'F',5);
INSERT INTO `song_chord` VALUES (239,'A#',6);
INSERT INTO `song_chord` VALUES (240,'Dm5',0);
INSERT INTO `song_chord` VALUES (240,'C7',1);
INSERT INTO `song_chord` VALUES (240,'A#7',2);
INSERT INTO `song_chord` VALUES (240,'A',3);
INSERT INTO `song_chord` VALUES (240,'Dm',4);
INSERT INTO `song_chord` VALUES (240,'Gm',5);
INSERT INTO `song_chord` VALUES (241,'Am',0);
INSERT INTO `song_chord` VALUES (241,'Dm',1);
INSERT INTO `song_chord` VALUES (241,'G',2);
INSERT INTO `song_chord` VALUES (242,'C',0);
INSERT INTO `song_chord` VALUES (242,'D',1);
INSERT INTO `song_chord` VALUES (242,'Cm',2);
INSERT INTO `song_chord` VALUES (242,'Gm',3);
INSERT INTO `song_chord` VALUES (242,'D7',4);
INSERT INTO `song_chord` VALUES (243,'G',0);
INSERT INTO `song_chord` VALUES (243,'Em',1);
INSERT INTO `song_chord` VALUES (243,'C',2);
INSERT INTO `song_chord` VALUES (243,'D',3);
INSERT INTO `song_chord` VALUES (243,'B7',4);
INSERT INTO `song_chord` VALUES (243,'Am',5);
INSERT INTO `song_chord` VALUES (244,'Am',0);
INSERT INTO `song_chord` VALUES (244,'G',1);
INSERT INTO `song_chord` VALUES (244,'F',2);
INSERT INTO `song_chord` VALUES (244,'E',3);
INSERT INTO `song_chord` VALUES (245,'Am',0);
INSERT INTO `song_chord` VALUES (245,'E',1);
INSERT INTO `song_chord` VALUES (246,'Em',0);
INSERT INTO `song_chord` VALUES (246,'B7',1);
INSERT INTO `song_chord` VALUES (246,'Am',2);
INSERT INTO `song_chord` VALUES (247,'C',0);
INSERT INTO `song_chord` VALUES (247,'F',1);
INSERT INTO `song_chord` VALUES (247,'E',2);
INSERT INTO `song_chord` VALUES (248,'Am',0);
INSERT INTO `song_chord` VALUES (248,'G',1);
INSERT INTO `song_chord` VALUES (249,'Em',0);
INSERT INTO `song_chord` VALUES (249,'Am',1);
INSERT INTO `song_chord` VALUES (250,'Bm',0);
INSERT INTO `song_chord` VALUES (250,'Em',1);
INSERT INTO `song_chord` VALUES (250,'G',2);
INSERT INTO `song_chord` VALUES (250,'F#',3);
INSERT INTO `song_chord` VALUES (251,'Am',0);
INSERT INTO `song_chord` VALUES (251,'E',1);
INSERT INTO `song_chord` VALUES (251,'E7',2);
INSERT INTO `song_chord` VALUES (251,'Dm',3);
INSERT INTO `song_chord` VALUES (253,'C',3);
INSERT INTO `song_chord` VALUES (253,'Dm',2);
INSERT INTO `song_chord` VALUES (253,'E',1);
INSERT INTO `song_chord` VALUES (253,'Am',0);
INSERT INTO `song_chord` VALUES (253,'F',4);
INSERT INTO `song_chord` VALUES (254,'Em',0);
INSERT INTO `song_chord` VALUES (254,'B7',1);
INSERT INTO `song_chord` VALUES (255,'Am',0);
INSERT INTO `song_chord` VALUES (255,'E',1);
INSERT INTO `song_chord` VALUES (255,'F',2);
INSERT INTO `song_chord` VALUES (255,'G',3);
INSERT INTO `song_chord` VALUES (256,'D',0);
INSERT INTO `song_chord` VALUES (256,'F#',1);
INSERT INTO `song_chord` VALUES (256,'Bm',2);
INSERT INTO `song_chord` VALUES (256,'G',3);
INSERT INTO `song_chord` VALUES (256,'A7',4);
INSERT INTO `song_chord` VALUES (257,'E',0);
INSERT INTO `song_chord` VALUES (257,'A',1);
INSERT INTO `song_chord` VALUES (257,'F#',2);
INSERT INTO `song_chord` VALUES (257,'B7',3);
INSERT INTO `song_chord` VALUES (257,'C#m',4);
INSERT INTO `song_chord` VALUES (257,'G#',5);
INSERT INTO `song_chord` VALUES (258,'Am',0);
INSERT INTO `song_chord` VALUES (258,'G',1);
INSERT INTO `song_chord` VALUES (258,'F',2);
INSERT INTO `song_chord` VALUES (258,'E',3);
INSERT INTO `song_chord` VALUES (258,'Dm',4);
INSERT INTO `song_chord` VALUES (259,'G',0);
INSERT INTO `song_chord` VALUES (259,'C',1);
INSERT INTO `song_chord` VALUES (259,'D',2);
INSERT INTO `song_chord` VALUES (259,'Em',3);
INSERT INTO `song_chord` VALUES (260,'C',0);
INSERT INTO `song_chord` VALUES (260,'E',1);
INSERT INTO `song_chord` VALUES (260,'Am',2);
INSERT INTO `song_chord` VALUES (261,'Em',0);
INSERT INTO `song_chord` VALUES (261,'D',1);
INSERT INTO `song_chord` VALUES (261,'Am',2);
INSERT INTO `song_chord` VALUES (262,'E',1);
INSERT INTO `song_chord` VALUES (262,'A',0);
INSERT INTO `song_chord` VALUES (263,'G',0);
INSERT INTO `song_chord` VALUES (263,'C',1);
INSERT INTO `song_chord` VALUES (263,'D',2);
INSERT INTO `song_chord` VALUES (263,'Em',3);
INSERT INTO `song_chord` VALUES (264,'G',0);
INSERT INTO `song_chord` VALUES (264,'C',1);
INSERT INTO `song_chord` VALUES (264,'D',2);
INSERT INTO `song_chord` VALUES (264,'Em',3);
INSERT INTO `song_chord` VALUES (265,'Em',0);
INSERT INTO `song_chord` VALUES (265,'Am',1);
INSERT INTO `song_chord` VALUES (265,'B7',2);
INSERT INTO `song_chord` VALUES (265,'C',3);
INSERT INTO `song_chord` VALUES (265,'D',4);
INSERT INTO `song_chord` VALUES (266,'G',0);
INSERT INTO `song_chord` VALUES (266,'Am',1);
INSERT INTO `song_chord` VALUES (266,'F',2);
INSERT INTO `song_chord` VALUES (266,'E',3);
INSERT INTO `song_chord` VALUES (266,'Dm',4);
INSERT INTO `song_chord` VALUES (267,'Am',0);
INSERT INTO `song_chord` VALUES (267,'G',1);
INSERT INTO `song_chord` VALUES (267,'F',2);
INSERT INTO `song_chord` VALUES (267,'E',3);
INSERT INTO `song_chord` VALUES (268,'Dm',0);
INSERT INTO `song_chord` VALUES (268,'F',1);
INSERT INTO `song_chord` VALUES (268,'C',2);
INSERT INTO `song_chord` VALUES (268,'Am',3);
INSERT INTO `song_chord` VALUES (268,'A#',4);
INSERT INTO `song_chord` VALUES (269,'D',0);
INSERT INTO `song_chord` VALUES (269,'A',1);
INSERT INTO `song_chord` VALUES (269,'G',2);
INSERT INTO `song_chord` VALUES (269,'F#m',3);
INSERT INTO `song_chord` VALUES (269,'Em',4);
INSERT INTO `song_chord` VALUES (269,'A7',5);
INSERT INTO `song_chord` VALUES (270,'Em',0);
INSERT INTO `song_chord` VALUES (270,'G',1);
INSERT INTO `song_chord` VALUES (270,'C',2);
INSERT INTO `song_chord` VALUES (270,'D7',3);
INSERT INTO `song_chord` VALUES (271,'Em',0);
INSERT INTO `song_chord` VALUES (271,'Am',1);
INSERT INTO `song_chord` VALUES (271,'B7',2);
INSERT INTO `song_chord` VALUES (271,'C',3);
INSERT INTO `song_chord` VALUES (272,'Em',0);
INSERT INTO `song_chord` VALUES (272,'Am',1);
INSERT INTO `song_chord` VALUES (272,'B7',2);
INSERT INTO `song_chord` VALUES (272,'C',3);
INSERT INTO `song_chord` VALUES (273,'G',0);
INSERT INTO `song_chord` VALUES (273,'Am',1);
INSERT INTO `song_chord` VALUES (273,'F',2);
INSERT INTO `song_chord` VALUES (273,'E',3);
INSERT INTO `song_chord` VALUES (273,'C',4);
INSERT INTO `song_chord` VALUES (273,'E7',5);
INSERT INTO `song_chord` VALUES (274,'Dm',0);
INSERT INTO `song_chord` VALUES (274,'F',1);
INSERT INTO `song_chord` VALUES (274,'Gm',2);
INSERT INTO `song_chord` VALUES (274,'A7',3);
INSERT INTO `song_chord` VALUES (275,'G',0);
INSERT INTO `song_chord` VALUES (275,'Em',1);
INSERT INTO `song_chord` VALUES (275,'Am',2);
INSERT INTO `song_chord` VALUES (275,'Bm',3);
INSERT INTO `song_chord` VALUES (275,'A',4);
INSERT INTO `song_chord` VALUES (276,'G',0);
INSERT INTO `song_chord` VALUES (276,'D7',1);
INSERT INTO `song_chord` VALUES (276,'Em',2);
INSERT INTO `song_chord` VALUES (276,'B7',3);
INSERT INTO `song_chord` VALUES (276,'C',4);
INSERT INTO `song_chord` VALUES (276,'D',5);
INSERT INTO `song_chord` VALUES (277,'G',0);
INSERT INTO `song_chord` VALUES (277,'Am',1);
INSERT INTO `song_chord` VALUES (277,'F',2);
INSERT INTO `song_chord` VALUES (277,'E',3);
INSERT INTO `song_chord` VALUES (277,'Dm',4);
INSERT INTO `song_chord` VALUES (278,'Am',0);
INSERT INTO `song_chord` VALUES (278,'G',1);
INSERT INTO `song_chord` VALUES (278,'C',2);
INSERT INTO `song_chord` VALUES (278,'F',3);
INSERT INTO `song_chord` VALUES (278,'E7',4);
INSERT INTO `song_chord` VALUES (278,'E',5);
INSERT INTO `song_chord` VALUES (279,'Em',0);
INSERT INTO `song_chord` VALUES (279,'Am',1);
INSERT INTO `song_chord` VALUES (279,'B7',2);
INSERT INTO `song_chord` VALUES (279,'C',3);
INSERT INTO `song_chord` VALUES (280,'Em',0);
INSERT INTO `song_chord` VALUES (280,'G',1);
INSERT INTO `song_chord` VALUES (280,'D',2);
INSERT INTO `song_chord` VALUES (281,'A',0);
INSERT INTO `song_chord` VALUES (281,'E',1);
INSERT INTO `song_chord` VALUES (281,'F',2);
INSERT INTO `song_chord` VALUES (281,'Am',3);
INSERT INTO `song_chord` VALUES (282,'Dm',0);
INSERT INTO `song_chord` VALUES (282,'F',1);
INSERT INTO `song_chord` VALUES (282,'Gm',2);
INSERT INTO `song_chord` VALUES (283,'Dm',0);
INSERT INTO `song_chord` VALUES (283,'Gm',1);
INSERT INTO `song_chord` VALUES (283,'A',2);
INSERT INTO `song_chord` VALUES (284,'Am',0);
INSERT INTO `song_chord` VALUES (284,'G',1);
INSERT INTO `song_chord` VALUES (284,'F',2);
INSERT INTO `song_chord` VALUES (284,'E',3);
INSERT INTO `song_chord` VALUES (285,'Am',0);
INSERT INTO `song_chord` VALUES (285,'G',1);
INSERT INTO `song_chord` VALUES (285,'F',2);
INSERT INTO `song_chord` VALUES (285,'E',3);
INSERT INTO `song_chord` VALUES (285,'Dm',4);
INSERT INTO `song_chord` VALUES (286,'Am',0);
INSERT INTO `song_chord` VALUES (286,'G',1);
INSERT INTO `song_chord` VALUES (286,'F',2);
INSERT INTO `song_chord` VALUES (286,'E',3);
INSERT INTO `song_chord` VALUES (287,'D',0);
INSERT INTO `song_chord` VALUES (287,'A',1);
INSERT INTO `song_chord` VALUES (287,'Bm',2);
INSERT INTO `song_chord` VALUES (287,'F#',3);
INSERT INTO `song_chord` VALUES (288,'D',0);
INSERT INTO `song_chord` VALUES (288,'Em',1);
INSERT INTO `song_chord` VALUES (288,'A7',2);
INSERT INTO `song_chord` VALUES (288,'F#',3);
INSERT INTO `song_chord` VALUES (288,'Bm',4);
INSERT INTO `song_chord` VALUES (288,'A',5);
INSERT INTO `song_chord` VALUES (288,'G',6);
INSERT INTO `song_chord` VALUES (289,'C',0);
INSERT INTO `song_chord` VALUES (289,'Am',1);
INSERT INTO `song_chord` VALUES (289,'Dm',2);
INSERT INTO `song_chord` VALUES (289,'G7',3);
INSERT INTO `song_chord` VALUES (289,'A7',4);
INSERT INTO `song_chord` VALUES (289,'G',5);
INSERT INTO `song_chord` VALUES (289,'E',6);
INSERT INTO `song_chord` VALUES (289,'F',7);
INSERT INTO `song_chord` VALUES (290,'Em',0);
INSERT INTO `song_chord` VALUES (290,'Am',1);
INSERT INTO `song_chord` VALUES (290,'B7',2);
INSERT INTO `song_chord` VALUES (290,'G',3);
INSERT INTO `song_chord` VALUES (290,'A',4);
INSERT INTO `song_chord` VALUES (291,'Em',0);
INSERT INTO `song_chord` VALUES (291,'Am',1);
INSERT INTO `song_chord` VALUES (291,'B7',2);
INSERT INTO `song_chord` VALUES (291,'D',3);
INSERT INTO `song_chord` VALUES (292,'D',0);
INSERT INTO `song_chord` VALUES (292,'F#',1);
INSERT INTO `song_chord` VALUES (292,'Bm',2);
INSERT INTO `song_chord` VALUES (292,'A',3);
INSERT INTO `song_chord` VALUES (292,'G',4);
INSERT INTO `song_chord` VALUES (293,'Dm',0);
INSERT INTO `song_chord` VALUES (293,'C',1);
INSERT INTO `song_chord` VALUES (293,'F',2);
INSERT INTO `song_chord` VALUES (293,'G',3);
INSERT INTO `song_chord` VALUES (293,'A',4);
INSERT INTO `song_chord` VALUES (293,'Gm',5);
INSERT INTO `song_chord` VALUES (293,'A7',6);
INSERT INTO `song_chord` VALUES (294,'Bm',0);
INSERT INTO `song_chord` VALUES (294,'C',1);
INSERT INTO `song_chord` VALUES (294,'D',2);
INSERT INTO `song_chord` VALUES (294,'F#m',3);
INSERT INTO `song_chord` VALUES (294,'G',4);
INSERT INTO `song_chord` VALUES (294,'F#',5);
INSERT INTO `song_chord` VALUES (295,'Dm',0);
INSERT INTO `song_chord` VALUES (295,'Gm',1);
INSERT INTO `song_chord` VALUES (295,'A',2);
INSERT INTO `song_chord` VALUES (295,'A7',3);
INSERT INTO `song_chord` VALUES (295,'F',4);
INSERT INTO `song_chord` VALUES (295,'Am',5);
INSERT INTO `song_chord` VALUES (296,'Am',0);
INSERT INTO `song_chord` VALUES (296,'Dm',1);
INSERT INTO `song_chord` VALUES (296,'E',2);
INSERT INTO `song_chord` VALUES (296,'A7',3);
INSERT INTO `song_chord` VALUES (296,'C',4);
INSERT INTO `song_chord` VALUES (296,'F',5);
INSERT INTO `song_chord` VALUES (297,'E',0);
INSERT INTO `song_chord` VALUES (297,'G#',1);
INSERT INTO `song_chord` VALUES (297,'C#m',2);
INSERT INTO `song_chord` VALUES (297,'F#m',3);
INSERT INTO `song_chord` VALUES (297,'B7',4);
INSERT INTO `song_chord` VALUES (297,'A',5);
INSERT INTO `song_chord` VALUES (298,'Am',0);
INSERT INTO `song_chord` VALUES (298,'F',1);
INSERT INTO `song_chord` VALUES (298,'E',2);
INSERT INTO `song_chord` VALUES (298,'G',3);
INSERT INTO `song_chord` VALUES (298,'C',4);
INSERT INTO `song_chord` VALUES (298,'D',5);
INSERT INTO `song_chord` VALUES (298,'E7',6);
INSERT INTO `song_chord` VALUES (299,'Em',0);
INSERT INTO `song_chord` VALUES (299,'D',1);
INSERT INTO `song_chord` VALUES (299,'C',2);
INSERT INTO `song_chord` VALUES (299,'Am',3);
INSERT INTO `song_chord` VALUES (299,'D7',4);
INSERT INTO `song_chord` VALUES (299,'B7',5);
INSERT INTO `song_chord` VALUES (299,'Bm',6);
INSERT INTO `song_chord` VALUES (299,'C7',7);
INSERT INTO `song_chord` VALUES (300,'Em',0);
INSERT INTO `song_chord` VALUES (300,'Am',1);
INSERT INTO `song_chord` VALUES (300,'B7',2);
INSERT INTO `song_chord` VALUES (300,'C',3);
INSERT INTO `song_chord` VALUES (301,'Am',0);
INSERT INTO `song_chord` VALUES (301,'G',1);
INSERT INTO `song_chord` VALUES (301,'F',2);
INSERT INTO `song_chord` VALUES (301,'E',3);
INSERT INTO `song_chord` VALUES (301,'Dm',4);
INSERT INTO `song_chord` VALUES (302,'Dm',0);
INSERT INTO `song_chord` VALUES (302,'A7',1);
INSERT INTO `song_chord` VALUES (302,'A#7',2);
INSERT INTO `song_chord` VALUES (303,'C',0);
INSERT INTO `song_chord` VALUES (303,'E',1);
INSERT INTO `song_chord` VALUES (303,'Am',2);
INSERT INTO `song_chord` VALUES (303,'Dm',3);
INSERT INTO `song_chord` VALUES (303,'G',4);
INSERT INTO `song_chord` VALUES (303,'F',5);
INSERT INTO `song_chord` VALUES (304,'Am',0);
INSERT INTO `song_chord` VALUES (304,'E',1);
INSERT INTO `song_chord` VALUES (304,'G',2);
INSERT INTO `song_chord` VALUES (304,'F',3);
INSERT INTO `song_chord` VALUES (305,'Dm',0);
INSERT INTO `song_chord` VALUES (305,'A#',1);
INSERT INTO `song_chord` VALUES (305,'A',2);
INSERT INTO `song_chord` VALUES (306,'Am',0);
INSERT INTO `song_chord` VALUES (306,'Dm',1);
INSERT INTO `song_chord` VALUES (306,'E',2);
INSERT INTO `song_chord` VALUES (306,'F',3);
INSERT INTO `song_chord` VALUES (306,'Dm9',4);
INSERT INTO `song_chord` VALUES (307,'D',0);
INSERT INTO `song_chord` VALUES (307,'Bm',1);
INSERT INTO `song_chord` VALUES (307,'G',2);
INSERT INTO `song_chord` VALUES (307,'E',3);
INSERT INTO `song_chord` VALUES (307,'A',4);
INSERT INTO `song_chord` VALUES (307,'F#',5);
INSERT INTO `song_chord` VALUES (308,'C',0);
INSERT INTO `song_chord` VALUES (308,'Am',1);
INSERT INTO `song_chord` VALUES (308,'F',2);
INSERT INTO `song_chord` VALUES (308,'G',3);
INSERT INTO `song_chord` VALUES (309,'Am',0);
INSERT INTO `song_chord` VALUES (309,'Dm',1);
INSERT INTO `song_chord` VALUES (309,'E7',2);
INSERT INTO `song_chord` VALUES (309,'F',3);
INSERT INTO `song_chord` VALUES (309,'E',4);
INSERT INTO `song_chord` VALUES (309,'A',5);
INSERT INTO `song_chord` VALUES (309,'F#m',6);
INSERT INTO `song_chord` VALUES (310,'Am',0);
INSERT INTO `song_chord` VALUES (310,'F',1);
INSERT INTO `song_chord` VALUES (310,'Dm',2);
INSERT INTO `song_chord` VALUES (310,'E7',3);
INSERT INTO `song_chord` VALUES (310,'Em',4);
INSERT INTO `song_chord` VALUES (310,'E',5);
INSERT INTO `song_chord` VALUES (310,'G',6);
INSERT INTO `song_chord` VALUES (310,'C',7);
INSERT INTO `song_chord` VALUES (311,'Dm',0);
INSERT INTO `song_chord` VALUES (311,'Gm',1);
INSERT INTO `song_chord` VALUES (311,'A',2);
INSERT INTO `song_chord` VALUES (311,'C',3);
INSERT INTO `song_chord` VALUES (311,'F',4);
INSERT INTO `song_chord` VALUES (311,'A#',5);
INSERT INTO `song_chord` VALUES (312,'C',0);
INSERT INTO `song_chord` VALUES (312,'F',1);
INSERT INTO `song_chord` VALUES (312,'G',2);
INSERT INTO `song_chord` VALUES (312,'Fm',3);
INSERT INTO `song_chord` VALUES (312,'Cm',4);
INSERT INTO `song_chord` VALUES (312,'A#',5);
INSERT INTO `song_chord` VALUES (312,'G#',6);
INSERT INTO `song_chord` VALUES (313,'Am',0);
INSERT INTO `song_chord` VALUES (313,'Dm',1);
INSERT INTO `song_chord` VALUES (313,'F',2);
INSERT INTO `song_chord` VALUES (313,'E',3);
INSERT INTO `song_chord` VALUES (313,'G',4);
INSERT INTO `song_chord` VALUES (314,'E',0);
INSERT INTO `song_chord` VALUES (314,'Am',1);
INSERT INTO `song_chord` VALUES (314,'Dm',2);
INSERT INTO `song_chord` VALUES (314,'F',3);
INSERT INTO `song_chord` VALUES (317,'B7',8);
INSERT INTO `song_chord` VALUES (317,'E',7);
INSERT INTO `song_chord` VALUES (317,'F#',6);
INSERT INTO `song_chord` VALUES (317,'B',5);
INSERT INTO `song_chord` VALUES (317,'A',4);
INSERT INTO `song_chord` VALUES (317,'Bm',3);
INSERT INTO `song_chord` VALUES (317,'A7',2);
INSERT INTO `song_chord` VALUES (317,'G',1);
INSERT INTO `song_chord` VALUES (317,'D',0);
INSERT INTO `song_chord` VALUES (317,'C#7',9);
INSERT INTO `song_chord` VALUES (318,'Em',0);
INSERT INTO `song_chord` VALUES (318,'D',1);
INSERT INTO `song_chord` VALUES (318,'C',2);
INSERT INTO `song_chord` VALUES (318,'G',3);
INSERT INTO `song_chord` VALUES (318,'A',4);
INSERT INTO `song_chord` VALUES (318,'Am',5);
INSERT INTO `song_chord` VALUES (319,'Am',0);
INSERT INTO `song_chord` VALUES (319,'Dm',1);
INSERT INTO `song_chord` VALUES (319,'F',2);
INSERT INTO `song_chord` VALUES (319,'C',3);
INSERT INTO `song_chord` VALUES (319,'G',4);
INSERT INTO `song_chord` VALUES (326,'F',1);
INSERT INTO `song_chord` VALUES (326,'A7',2);
INSERT INTO `song_chord` VALUES (326,'D7',3);
INSERT INTO `song_chord` VALUES (326,'G7',4);
INSERT INTO `song_chord` VALUES (327,'Dm',0);
INSERT INTO `song_chord` VALUES (327,'A7',1);
INSERT INTO `song_chord` VALUES (327,'Gm',2);
INSERT INTO `song_chord` VALUES (327,'A#7',3);
INSERT INTO `song_chord` VALUES (328,'Dm',0);
INSERT INTO `song_chord` VALUES (328,'A7',1);
INSERT INTO `song_chord` VALUES (328,'Gm',2);
INSERT INTO `song_chord` VALUES (328,'A#7',3);
INSERT INTO `song_chord` VALUES (329,'C',0);
INSERT INTO `song_chord` VALUES (329,'E',1);
INSERT INTO `song_chord` VALUES (329,'Am',2);
INSERT INTO `song_chord` VALUES (329,'F',3);
INSERT INTO `song_chord` VALUES (329,'Dm',4);
INSERT INTO `song_chord` VALUES (330,'Em',0);
INSERT INTO `song_chord` VALUES (330,'Am',1);
INSERT INTO `song_chord` VALUES (330,'B7',2);
INSERT INTO `song_chord` VALUES (330,'D',3);
INSERT INTO `song_chord` VALUES (331,'C',0);
INSERT INTO `song_chord` VALUES (331,'Am',1);
INSERT INTO `song_chord` VALUES (331,'Dm',2);
INSERT INTO `song_chord` VALUES (331,'G',3);
INSERT INTO `song_chord` VALUES (332,'Dm',0);
INSERT INTO `song_chord` VALUES (332,'A7',1);
INSERT INTO `song_chord` VALUES (332,'Gm',2);
INSERT INTO `song_chord` VALUES (332,'A#',3);
INSERT INTO `song_chord` VALUES (332,'F',4);
INSERT INTO `song_chord` VALUES (332,'Am',5);
INSERT INTO `song_chord` VALUES (332,'C',6);
INSERT INTO `song_chord` VALUES (333,'Em',0);
INSERT INTO `song_chord` VALUES (333,'D',1);
INSERT INTO `song_chord` VALUES (333,'C',2);
INSERT INTO `song_chord` VALUES (333,'B7',3);
INSERT INTO `song_chord` VALUES (334,'Am',0);
INSERT INTO `song_chord` VALUES (334,'Em',1);
INSERT INTO `song_chord` VALUES (334,'Dm9',2);
INSERT INTO `song_chord` VALUES (334,'F',3);
INSERT INTO `song_chord` VALUES (334,'E',4);
INSERT INTO `song_chord` VALUES (334,'Dm',5);
INSERT INTO `song_chord` VALUES (335,'Am',0);
INSERT INTO `song_chord` VALUES (335,'E',1);
INSERT INTO `song_chord` VALUES (336,'Dm',0);
INSERT INTO `song_chord` VALUES (336,'A7',1);
INSERT INTO `song_chord` VALUES (336,'Gm',2);
INSERT INTO `song_chord` VALUES (337,'Am',0);
INSERT INTO `song_chord` VALUES (337,'G',1);
INSERT INTO `song_chord` VALUES (338,'Em',0);
INSERT INTO `song_chord` VALUES (338,'Am',1);
INSERT INTO `song_chord` VALUES (338,'F',2);
INSERT INTO `song_chord` VALUES (338,'E',3);
INSERT INTO `song_chord` VALUES (339,'E',0);
INSERT INTO `song_chord` VALUES (339,'Am',1);
INSERT INTO `song_chord` VALUES (339,'Dm',2);
INSERT INTO `song_chord` VALUES (339,'G7',3);
INSERT INTO `song_chord` VALUES (339,'E7',4);
INSERT INTO `song_chord` VALUES (339,'F7M',5);
INSERT INTO `song_chord` VALUES (339,'F',6);
INSERT INTO `song_chord` VALUES (340,'Am',0);
INSERT INTO `song_chord` VALUES (340,'E7',1);
INSERT INTO `song_chord` VALUES (340,'F',2);
INSERT INTO `song_chord` VALUES (340,'E',3);
INSERT INTO `song_chord` VALUES (340,'C',4);
INSERT INTO `song_chord` VALUES (340,'G',5);
INSERT INTO `song_chord` VALUES (341,'Am',0);
INSERT INTO `song_chord` VALUES (341,'E',1);
INSERT INTO `song_chord` VALUES (342,'C',0);
INSERT INTO `song_chord` VALUES (342,'E',1);
INSERT INTO `song_chord` VALUES (342,'F',2);
INSERT INTO `song_chord` VALUES (342,'Dm',3);
INSERT INTO `song_chord` VALUES (342,'G',4);
INSERT INTO `song_chord` VALUES (342,'D7',5);
INSERT INTO `song_chord` VALUES (342,'C7',6);
INSERT INTO `song_chord` VALUES (342,'Gm',7);
INSERT INTO `song_chord` VALUES (342,'Cm',8);
INSERT INTO `song_chord` VALUES (343,'G',0);
INSERT INTO `song_chord` VALUES (343,'B7',1);
INSERT INTO `song_chord` VALUES (343,'Em',2);
INSERT INTO `song_chord` VALUES (343,'C',3);
INSERT INTO `song_chord` VALUES (343,'Am',4);
INSERT INTO `song_chord` VALUES (344,'Dm',0);
INSERT INTO `song_chord` VALUES (344,'A7',1);
INSERT INTO `song_chord` VALUES (344,'Gm',2);
INSERT INTO `song_chord` VALUES (344,'C',3);
INSERT INTO `song_chord` VALUES (344,'F',4);
INSERT INTO `song_chord` VALUES (344,'A#',5);
INSERT INTO `song_chord` VALUES (345,'Em',0);
INSERT INTO `song_chord` VALUES (345,'Am',1);
INSERT INTO `song_chord` VALUES (345,'B7',2);
INSERT INTO `song_chord` VALUES (345,'C',3);
INSERT INTO `song_chord` VALUES (346,'Dm',0);
INSERT INTO `song_chord` VALUES (346,'F',1);
INSERT INTO `song_chord` VALUES (346,'Am',2);
INSERT INTO `song_chord` VALUES (346,'Gm',3);
INSERT INTO `song_chord` VALUES (346,'A',4);
INSERT INTO `song_chord` VALUES (346,'A#',5);
INSERT INTO `song_chord` VALUES (406,'G',3);
INSERT INTO `song_chord` VALUES (406,'E',0);
INSERT INTO `song_chord` VALUES (406,'Am',1);
INSERT INTO `song_chord` VALUES (406,'F',2);
INSERT INTO `song_chord` VALUES (348,'Em',0);
INSERT INTO `song_chord` VALUES (348,'C',1);
INSERT INTO `song_chord` VALUES (348,'D7',2);
INSERT INTO `song_chord` VALUES (348,'G',3);
INSERT INTO `song_chord` VALUES (348,'B7',4);
INSERT INTO `song_chord` VALUES (349,'D7',0);
INSERT INTO `song_chord` VALUES (349,'Em',1);
INSERT INTO `song_chord` VALUES (349,'F',2);
INSERT INTO `song_chord` VALUES (349,'E',3);
INSERT INTO `song_chord` VALUES (349,'Am',4);
INSERT INTO `song_chord` VALUES (350,'E',0);
INSERT INTO `song_chord` VALUES (350,'F',1);
INSERT INTO `song_chord` VALUES (350,'G',2);
INSERT INTO `song_chord` VALUES (350,'C',3);
INSERT INTO `song_chord` VALUES (350,'Am',4);
INSERT INTO `song_chord` VALUES (351,'A7',0);
INSERT INTO `song_chord` VALUES (351,'D',1);
INSERT INTO `song_chord` VALUES (351,'F#m',2);
INSERT INTO `song_chord` VALUES (351,'G',3);
INSERT INTO `song_chord` VALUES (351,'F#',4);
INSERT INTO `song_chord` VALUES (351,'Bm',5);
INSERT INTO `song_chord` VALUES (351,'Em',6);
INSERT INTO `song_chord` VALUES (352,'Dm',0);
INSERT INTO `song_chord` VALUES (352,'Am',1);
INSERT INTO `song_chord` VALUES (352,'Gm',2);
INSERT INTO `song_chord` VALUES (352,'A',3);
INSERT INTO `song_chord` VALUES (353,'Am',0);
INSERT INTO `song_chord` VALUES (353,'Dm9',1);
INSERT INTO `song_chord` VALUES (353,'E7',2);
INSERT INTO `song_chord` VALUES (353,'F',3);
INSERT INTO `song_chord` VALUES (353,'Dm',4);
INSERT INTO `song_chord` VALUES (354,'Dm',0);
INSERT INTO `song_chord` VALUES (354,'Gm',1);
INSERT INTO `song_chord` VALUES (354,'Gm6',2);
INSERT INTO `song_chord` VALUES (354,'C7',3);
INSERT INTO `song_chord` VALUES (354,'F',4);
INSERT INTO `song_chord` VALUES (354,'A',5);
INSERT INTO `song_chord` VALUES (354,'Am',6);
INSERT INTO `song_chord` VALUES (354,'A#',7);
INSERT INTO `song_chord` VALUES (355,'D',0);
INSERT INTO `song_chord` VALUES (355,'F#m',1);
INSERT INTO `song_chord` VALUES (355,'Bm',2);
INSERT INTO `song_chord` VALUES (355,'Em',3);
INSERT INTO `song_chord` VALUES (355,'A',4);
INSERT INTO `song_chord` VALUES (355,'F#',5);
INSERT INTO `song_chord` VALUES (355,'A7',6);
INSERT INTO `song_chord` VALUES (355,'G',7);
INSERT INTO `song_chord` VALUES (356,'Am',0);
INSERT INTO `song_chord` VALUES (356,'G',1);
INSERT INTO `song_chord` VALUES (356,'F',2);
INSERT INTO `song_chord` VALUES (356,'E',3);
INSERT INTO `song_chord` VALUES (357,'C',0);
INSERT INTO `song_chord` VALUES (357,'G',1);
INSERT INTO `song_chord` VALUES (357,'F',2);
INSERT INTO `song_chord` VALUES (357,'Am',3);
INSERT INTO `song_chord` VALUES (357,'Dm',4);
INSERT INTO `song_chord` VALUES (357,'E',5);
INSERT INTO `song_chord` VALUES (357,'E7',6);
INSERT INTO `song_chord` VALUES (357,'G7',7);
INSERT INTO `song_chord` VALUES (358,'Am',0);
INSERT INTO `song_chord` VALUES (358,'Dm',1);
INSERT INTO `song_chord` VALUES (358,'E',2);
INSERT INTO `song_chord` VALUES (358,'F',3);
INSERT INTO `song_chord` VALUES (359,'Bm',0);
INSERT INTO `song_chord` VALUES (359,'Em',1);
INSERT INTO `song_chord` VALUES (359,'F#',2);
INSERT INTO `song_chord` VALUES (359,'G',3);
INSERT INTO `song_chord` VALUES (360,'Dm',0);
INSERT INTO `song_chord` VALUES (360,'A7',1);
INSERT INTO `song_chord` VALUES (360,'Gm',2);
INSERT INTO `song_chord` VALUES (360,'A#',3);
INSERT INTO `song_chord` VALUES (360,'D7',4);
INSERT INTO `song_chord` VALUES (360,'A#7',5);
INSERT INTO `song_chord` VALUES (361,'Em',0);
INSERT INTO `song_chord` VALUES (361,'Am',1);
INSERT INTO `song_chord` VALUES (361,'C',2);
INSERT INTO `song_chord` VALUES (361,'B7',3);
INSERT INTO `song_chord` VALUES (362,'Em',0);
INSERT INTO `song_chord` VALUES (362,'B7',1);
INSERT INTO `song_chord` VALUES (362,'Am6',2);
INSERT INTO `song_chord` VALUES (362,'Am',3);
INSERT INTO `song_chord` VALUES (362,'C',4);
INSERT INTO `song_chord` VALUES (453,'F',3);
INSERT INTO `song_chord` VALUES (470,'Am',1);
INSERT INTO `song_chord` VALUES (470,'B7',2);
INSERT INTO `song_chord` VALUES (470,'C',3);
INSERT INTO `song_chord` VALUES (470,'Em',0);
INSERT INTO `song_chord` VALUES (364,'C',0);
INSERT INTO `song_chord` VALUES (364,'Am',1);
INSERT INTO `song_chord` VALUES (364,'F',2);
INSERT INTO `song_chord` VALUES (364,'E',3);
INSERT INTO `song_chord` VALUES (364,'Dm',4);
INSERT INTO `song_chord` VALUES (364,'G',5);
INSERT INTO `song_chord` VALUES (365,'C#dim',0);
INSERT INTO `song_chord` VALUES (365,'A#7',1);
INSERT INTO `song_chord` VALUES (365,'A7',2);
INSERT INTO `song_chord` VALUES (365,'Dm',3);
INSERT INTO `song_chord` VALUES (365,'Gm',4);
INSERT INTO `song_chord` VALUES (366,'Am',0);
INSERT INTO `song_chord` VALUES (366,'F7',1);
INSERT INTO `song_chord` VALUES (366,'Dm',2);
INSERT INTO `song_chord` VALUES (366,'E',3);
INSERT INTO `song_chord` VALUES (366,'A7',4);
INSERT INTO `song_chord` VALUES (366,'A#7',5);
INSERT INTO `song_chord` VALUES (366,'Gm',6);
INSERT INTO `song_chord` VALUES (366,'C',7);
INSERT INTO `song_chord` VALUES (367,'G',0);
INSERT INTO `song_chord` VALUES (367,'Am',1);
INSERT INTO `song_chord` VALUES (367,'F',2);
INSERT INTO `song_chord` VALUES (367,'E',3);
INSERT INTO `song_chord` VALUES (367,'C',4);
INSERT INTO `song_chord` VALUES (367,'D',5);
INSERT INTO `song_chord` VALUES (368,'D',0);
INSERT INTO `song_chord` VALUES (368,'Bm',1);
INSERT INTO `song_chord` VALUES (368,'G',2);
INSERT INTO `song_chord` VALUES (368,'A',3);
INSERT INTO `song_chord` VALUES (368,'F#',4);
INSERT INTO `song_chord` VALUES (369,'Am',0);
INSERT INTO `song_chord` VALUES (369,'G',1);
INSERT INTO `song_chord` VALUES (369,'F',2);
INSERT INTO `song_chord` VALUES (369,'E',3);
INSERT INTO `song_chord` VALUES (369,'Dm',4);
INSERT INTO `song_chord` VALUES (370,'Em',0);
INSERT INTO `song_chord` VALUES (370,'Am',1);
INSERT INTO `song_chord` VALUES (370,'G',2);
INSERT INTO `song_chord` VALUES (370,'A',3);
INSERT INTO `song_chord` VALUES (370,'B7',4);
INSERT INTO `song_chord` VALUES (371,'G',0);
INSERT INTO `song_chord` VALUES (371,'Am',1);
INSERT INTO `song_chord` VALUES (371,'F',2);
INSERT INTO `song_chord` VALUES (371,'E',3);
INSERT INTO `song_chord` VALUES (371,'E7',4);
INSERT INTO `song_chord` VALUES (371,'Dm',5);
INSERT INTO `song_chord` VALUES (372,'Em',0);
INSERT INTO `song_chord` VALUES (372,'Am',1);
INSERT INTO `song_chord` VALUES (372,'B7',2);
INSERT INTO `song_chord` VALUES (372,'C',3);
INSERT INTO `song_chord` VALUES (372,'D',4);
INSERT INTO `song_chord` VALUES (373,'G',0);
INSERT INTO `song_chord` VALUES (373,'Am',1);
INSERT INTO `song_chord` VALUES (373,'F',2);
INSERT INTO `song_chord` VALUES (373,'E',3);
INSERT INTO `song_chord` VALUES (373,'E7',4);
INSERT INTO `song_chord` VALUES (373,'Dm',5);
INSERT INTO `song_chord` VALUES (374,'Dm',0);
INSERT INTO `song_chord` VALUES (374,'F',1);
INSERT INTO `song_chord` VALUES (374,'Gm',2);
INSERT INTO `song_chord` VALUES (374,'A7',3);
INSERT INTO `song_chord` VALUES (375,'G',0);
INSERT INTO `song_chord` VALUES (375,'Em',1);
INSERT INTO `song_chord` VALUES (375,'Am',2);
INSERT INTO `song_chord` VALUES (375,'Bm',3);
INSERT INTO `song_chord` VALUES (375,'A',4);
INSERT INTO `song_chord` VALUES (376,'Em',0);
INSERT INTO `song_chord` VALUES (376,'Am',1);
INSERT INTO `song_chord` VALUES (376,'B7',2);
INSERT INTO `song_chord` VALUES (376,'D7',3);
INSERT INTO `song_chord` VALUES (376,'G',4);
INSERT INTO `song_chord` VALUES (377,'D',0);
INSERT INTO `song_chord` VALUES (377,'G',1);
INSERT INTO `song_chord` VALUES (377,'A',2);
INSERT INTO `song_chord` VALUES (377,'Bm',3);
INSERT INTO `song_chord` VALUES (378,'D',0);
INSERT INTO `song_chord` VALUES (378,'G',1);
INSERT INTO `song_chord` VALUES (378,'A',2);
INSERT INTO `song_chord` VALUES (378,'Bm',3);
INSERT INTO `song_chord` VALUES (379,'Am',0);
INSERT INTO `song_chord` VALUES (379,'F',1);
INSERT INTO `song_chord` VALUES (379,'E7',2);
INSERT INTO `song_chord` VALUES (379,'G',3);
INSERT INTO `song_chord` VALUES (379,'Dm',4);
INSERT INTO `song_chord` VALUES (384,'Am',0);
INSERT INTO `song_chord` VALUES (384,'E',1);
INSERT INTO `song_chord` VALUES (384,'E7',2);
INSERT INTO `song_chord` VALUES (385,'C7',0);
INSERT INTO `song_chord` VALUES (385,'F',1);
INSERT INTO `song_chord` VALUES (385,'A7',2);
INSERT INTO `song_chord` VALUES (385,'D7',3);
INSERT INTO `song_chord` VALUES (385,'G7',4);
INSERT INTO `song_chord` VALUES (451,'E7',2);
INSERT INTO `song_chord` VALUES (451,'B7',1);
INSERT INTO `song_chord` VALUES (414,'E7',3);
INSERT INTO `song_chord` VALUES (414,'F',1);
INSERT INTO `song_chord` VALUES (451,'Em',0);
INSERT INTO `song_chord` VALUES (414,'E',2);
INSERT INTO `song_chord` VALUES (414,'Am',0);
INSERT INTO `song_chord` VALUES (387,'C',0);
INSERT INTO `song_chord` VALUES (387,'E',1);
INSERT INTO `song_chord` VALUES (387,'F',2);
INSERT INTO `song_chord` VALUES (388,'Em',0);
INSERT INTO `song_chord` VALUES (388,'B7',1);
INSERT INTO `song_chord` VALUES (389,'Am',0);
INSERT INTO `song_chord` VALUES (389,'Dm',1);
INSERT INTO `song_chord` VALUES (389,'E',2);
INSERT INTO `song_chord` VALUES (391,'C',0);
INSERT INTO `song_chord` VALUES (391,'Am',1);
INSERT INTO `song_chord` VALUES (391,'F',2);
INSERT INTO `song_chord` VALUES (391,'G',3);
INSERT INTO `song_chord` VALUES (391,'G#',4);
INSERT INTO `song_chord` VALUES (392,'Em',0);
INSERT INTO `song_chord` VALUES (392,'D',1);
INSERT INTO `song_chord` VALUES (392,'G',2);
INSERT INTO `song_chord` VALUES (392,'Bm',3);
INSERT INTO `song_chord` VALUES (393,'Em',0);
INSERT INTO `song_chord` VALUES (393,'Am',1);
INSERT INTO `song_chord` VALUES (393,'B7',2);
INSERT INTO `song_chord` VALUES (393,'G',3);
INSERT INTO `song_chord` VALUES (393,'A',4);
INSERT INTO `song_chord` VALUES (394,'Am',0);
INSERT INTO `song_chord` VALUES (394,'Dm',1);
INSERT INTO `song_chord` VALUES (394,'E',2);
INSERT INTO `song_chord` VALUES (395,'E',0);
INSERT INTO `song_chord` VALUES (395,'Am',1);
INSERT INTO `song_chord` VALUES (395,'Dm',2);
INSERT INTO `song_chord` VALUES (395,'G7',3);
INSERT INTO `song_chord` VALUES (395,'G',4);
INSERT INTO `song_chord` VALUES (395,'E7',5);
INSERT INTO `song_chord` VALUES (395,'F7M',6);
INSERT INTO `song_chord` VALUES (396,'Dm',0);
INSERT INTO `song_chord` VALUES (396,'C7',1);
INSERT INTO `song_chord` VALUES (396,'A#7',2);
INSERT INTO `song_chord` VALUES (396,'A7',3);
INSERT INTO `song_chord` VALUES (397,'Em',0);
INSERT INTO `song_chord` VALUES (397,'Am',1);
INSERT INTO `song_chord` VALUES (397,'B7',2);
INSERT INTO `song_chord` VALUES (398,'E',0);
INSERT INTO `song_chord` VALUES (398,'G#',1);
INSERT INTO `song_chord` VALUES (398,'A',2);
INSERT INTO `song_chord` VALUES (398,'B7',3);
INSERT INTO `song_chord` VALUES (398,'C#m',4);
INSERT INTO `song_chord` VALUES (398,'B',5);
INSERT INTO `song_chord` VALUES (399,'Am',0);
INSERT INTO `song_chord` VALUES (399,'E',1);
INSERT INTO `song_chord` VALUES (399,'Dm',2);
INSERT INTO `song_chord` VALUES (399,'F',3);
INSERT INTO `song_chord` VALUES (400,'D',0);
INSERT INTO `song_chord` VALUES (400,'F#',1);
INSERT INTO `song_chord` VALUES (400,'Bm',2);
INSERT INTO `song_chord` VALUES (400,'G',3);
INSERT INTO `song_chord` VALUES (400,'A',4);
INSERT INTO `song_chord` VALUES (401,'Em',0);
INSERT INTO `song_chord` VALUES (401,'B7',1);
INSERT INTO `song_chord` VALUES (401,'C',2);
INSERT INTO `song_chord` VALUES (401,'Am',3);
INSERT INTO `song_chord` VALUES (401,'G',4);
INSERT INTO `song_chord` VALUES (402,'Bm',0);
INSERT INTO `song_chord` VALUES (402,'C',1);
INSERT INTO `song_chord` VALUES (402,'D',2);
INSERT INTO `song_chord` VALUES (402,'F#m',3);
INSERT INTO `song_chord` VALUES (402,'G',4);
INSERT INTO `song_chord` VALUES (402,'F#',5);
INSERT INTO `song_chord` VALUES (403,'C',0);
INSERT INTO `song_chord` VALUES (403,'F',1);
INSERT INTO `song_chord` VALUES (403,'G',2);
INSERT INTO `song_chord` VALUES (403,'Am',3);
INSERT INTO `song_chord` VALUES (407,'Am',0);
INSERT INTO `song_chord` VALUES (407,'Dm',1);
INSERT INTO `song_chord` VALUES (407,'E7',2);
INSERT INTO `song_chord` VALUES (407,'F',3);
INSERT INTO `song_chord` VALUES (407,'E',4);
INSERT INTO `song_chord` VALUES (407,'G',5);
INSERT INTO `song_chord` VALUES (408,'Em',0);
INSERT INTO `song_chord` VALUES (408,'B7',1);
INSERT INTO `song_chord` VALUES (408,'D',2);
INSERT INTO `song_chord` VALUES (408,'C',3);
INSERT INTO `song_chord` VALUES (408,'Am',4);
INSERT INTO `song_chord` VALUES (409,'E',0);
INSERT INTO `song_chord` VALUES (409,'F',1);
INSERT INTO `song_chord` VALUES (409,'Am',2);
INSERT INTO `song_chord` VALUES (409,'G',3);
INSERT INTO `song_chord` VALUES (409,'A',4);
INSERT INTO `song_chord` VALUES (409,'F#',5);
INSERT INTO `song_chord` VALUES (409,'Bm',6);
INSERT INTO `song_chord` VALUES (409,'D',7);
INSERT INTO `song_chord` VALUES (410,'Am',0);
INSERT INTO `song_chord` VALUES (410,'F',1);
INSERT INTO `song_chord` VALUES (410,'G',2);
INSERT INTO `song_chord` VALUES (410,'E',3);
INSERT INTO `song_chord` VALUES (411,'Am',0);
INSERT INTO `song_chord` VALUES (411,'Dm',1);
INSERT INTO `song_chord` VALUES (412,'Em',0);
INSERT INTO `song_chord` VALUES (412,'G',1);
INSERT INTO `song_chord` VALUES (412,'Bm',2);
INSERT INTO `song_chord` VALUES (412,'A',3);
INSERT INTO `song_chord` VALUES (414,'G',4);
INSERT INTO `song_chord` VALUES (415,'Am',0);
INSERT INTO `song_chord` VALUES (415,'E',1);
INSERT INTO `song_chord` VALUES (415,'C',2);
INSERT INTO `song_chord` VALUES (415,'F',3);
INSERT INTO `song_chord` VALUES (415,'Dm',4);
INSERT INTO `song_chord` VALUES (416,'Am',0);
INSERT INTO `song_chord` VALUES (416,'F',1);
INSERT INTO `song_chord` VALUES (416,'Dm',2);
INSERT INTO `song_chord` VALUES (416,'E7',3);
INSERT INTO `song_chord` VALUES (416,'Em',4);
INSERT INTO `song_chord` VALUES (416,'C',5);
INSERT INTO `song_chord` VALUES (416,'G',6);
INSERT INTO `song_chord` VALUES (416,'E',7);
INSERT INTO `song_chord` VALUES (417,'Dm',0);
INSERT INTO `song_chord` VALUES (417,'Gm',1);
INSERT INTO `song_chord` VALUES (417,'A',2);
INSERT INTO `song_chord` VALUES (417,'A#',3);
INSERT INTO `song_chord` VALUES (418,'Am',0);
INSERT INTO `song_chord` VALUES (418,'E',1);
INSERT INTO `song_chord` VALUES (418,'F',2);
INSERT INTO `song_chord` VALUES (418,'Dm',3);
INSERT INTO `song_chord` VALUES (418,'Em',4);
INSERT INTO `song_chord` VALUES (418,'G',5);
INSERT INTO `song_chord` VALUES (418,'B',6);
INSERT INTO `song_chord` VALUES (418,'D',7);
INSERT INTO `song_chord` VALUES (418,'A',8);
INSERT INTO `song_chord` VALUES (418,'F#',9);
INSERT INTO `song_chord` VALUES (418,'Bm',10);
INSERT INTO `song_chord` VALUES (419,'Dm',0);
INSERT INTO `song_chord` VALUES (419,'Gm',1);
INSERT INTO `song_chord` VALUES (419,'A',2);
INSERT INTO `song_chord` VALUES (419,'C7',3);
INSERT INTO `song_chord` VALUES (419,'F',4);
INSERT INTO `song_chord` VALUES (419,'Am',5);
INSERT INTO `song_chord` VALUES (419,'A#',6);
INSERT INTO `song_chord` VALUES (420,'Am',0);
INSERT INTO `song_chord` VALUES (420,'F',1);
INSERT INTO `song_chord` VALUES (420,'E',2);
INSERT INTO `song_chord` VALUES (420,'G',3);
INSERT INTO `song_chord` VALUES (421,'D',0);
INSERT INTO `song_chord` VALUES (421,'A',1);
INSERT INTO `song_chord` VALUES (421,'G',2);
INSERT INTO `song_chord` VALUES (421,'Em',3);
INSERT INTO `song_chord` VALUES (422,'C',0);
INSERT INTO `song_chord` VALUES (422,'G',1);
INSERT INTO `song_chord` VALUES (422,'Am',2);
INSERT INTO `song_chord` VALUES (422,'E',3);
INSERT INTO `song_chord` VALUES (422,'E7',4);
INSERT INTO `song_chord` VALUES (423,'Em',0);
INSERT INTO `song_chord` VALUES (423,'Am',1);
INSERT INTO `song_chord` VALUES (423,'D7',2);
INSERT INTO `song_chord` VALUES (423,'G',3);
INSERT INTO `song_chord` VALUES (423,'C',4);
INSERT INTO `song_chord` VALUES (423,'B7',5);
INSERT INTO `song_chord` VALUES (423,'D',6);
INSERT INTO `song_chord` VALUES (424,'G',0);
INSERT INTO `song_chord` VALUES (424,'Bm',1);
INSERT INTO `song_chord` VALUES (424,'C',2);
INSERT INTO `song_chord` VALUES (424,'Am',3);
INSERT INTO `song_chord` VALUES (424,'D7',4);
INSERT INTO `song_chord` VALUES (424,'D',5);
INSERT INTO `song_chord` VALUES (425,'Em',0);
INSERT INTO `song_chord` VALUES (425,'B7',1);
INSERT INTO `song_chord` VALUES (425,'Am',2);
INSERT INTO `song_chord` VALUES (426,'G',0);
INSERT INTO `song_chord` VALUES (426,'Em',1);
INSERT INTO `song_chord` VALUES (426,'C',2);
INSERT INTO `song_chord` VALUES (426,'A',3);
INSERT INTO `song_chord` VALUES (426,'D',4);
INSERT INTO `song_chord` VALUES (427,'Em',0);
INSERT INTO `song_chord` VALUES (427,'D',1);
INSERT INTO `song_chord` VALUES (427,'G',2);
INSERT INTO `song_chord` VALUES (427,'A',3);
INSERT INTO `song_chord` VALUES (427,'B7',4);
INSERT INTO `song_chord` VALUES (427,'Am',5);
INSERT INTO `song_chord` VALUES (428,'Am',0);
INSERT INTO `song_chord` VALUES (428,'G',1);
INSERT INTO `song_chord` VALUES (428,'F',2);
INSERT INTO `song_chord` VALUES (428,'Dm',3);
INSERT INTO `song_chord` VALUES (428,'G7',4);
INSERT INTO `song_chord` VALUES (428,'E',5);
INSERT INTO `song_chord` VALUES (428,'E7',6);
INSERT INTO `song_chord` VALUES (428,'F7',7);
INSERT INTO `song_chord` VALUES (429,'Am',0);
INSERT INTO `song_chord` VALUES (429,'Dm',1);
INSERT INTO `song_chord` VALUES (429,'F',2);
INSERT INTO `song_chord` VALUES (429,'E',3);
INSERT INTO `song_chord` VALUES (429,'A',4);
INSERT INTO `song_chord` VALUES (429,'F#m',5);
INSERT INTO `song_chord` VALUES (430,'Am',0);
INSERT INTO `song_chord` VALUES (430,'E',1);
INSERT INTO `song_chord` VALUES (430,'C',2);
INSERT INTO `song_chord` VALUES (430,'F',3);
INSERT INTO `song_chord` VALUES (430,'Dm',4);
INSERT INTO `song_chord` VALUES (431,'Am',0);
INSERT INTO `song_chord` VALUES (431,'C',1);
INSERT INTO `song_chord` VALUES (431,'E',2);
INSERT INTO `song_chord` VALUES (431,'F',3);
INSERT INTO `song_chord` VALUES (431,'Dm',4);
INSERT INTO `song_chord` VALUES (431,'G',5);
INSERT INTO `song_chord` VALUES (431,'A7',6);
INSERT INTO `song_chord` VALUES (431,'E7',7);
INSERT INTO `song_chord` VALUES (432,'G',0);
INSERT INTO `song_chord` VALUES (432,'Am',1);
INSERT INTO `song_chord` VALUES (432,'F',2);
INSERT INTO `song_chord` VALUES (432,'E',3);
INSERT INTO `song_chord` VALUES (432,'Em',4);
INSERT INTO `song_chord` VALUES (433,'E',0);
INSERT INTO `song_chord` VALUES (433,'Dm9',1);
INSERT INTO `song_chord` VALUES (435,'Em',0);
INSERT INTO `song_chord` VALUES (435,'Am',1);
INSERT INTO `song_chord` VALUES (435,'B7',2);
INSERT INTO `song_chord` VALUES (436,'Em',0);
INSERT INTO `song_chord` VALUES (436,'Am',1);
INSERT INTO `song_chord` VALUES (436,'B7',2);
INSERT INTO `song_chord` VALUES (437,'D',0);
INSERT INTO `song_chord` VALUES (437,'Bm',1);
INSERT INTO `song_chord` VALUES (437,'A',2);
INSERT INTO `song_chord` VALUES (437,'G',3);
INSERT INTO `song_chord` VALUES (438,'Am',0);
INSERT INTO `song_chord` VALUES (438,'Dm',1);
INSERT INTO `song_chord` VALUES (438,'E',2);
INSERT INTO `song_chord` VALUES (439,'Am',0);
INSERT INTO `song_chord` VALUES (439,'F',1);
INSERT INTO `song_chord` VALUES (439,'E',2);
INSERT INTO `song_chord` VALUES (439,'Dm',3);
INSERT INTO `song_chord` VALUES (440,'Am',0);
INSERT INTO `song_chord` VALUES (440,'G',1);
INSERT INTO `song_chord` VALUES (440,'F',2);
INSERT INTO `song_chord` VALUES (440,'E',3);
INSERT INTO `song_chord` VALUES (441,'Dm',0);
INSERT INTO `song_chord` VALUES (441,'Gm',1);
INSERT INTO `song_chord` VALUES (441,'A#',2);
INSERT INTO `song_chord` VALUES (441,'F',3);
INSERT INTO `song_chord` VALUES (441,'C',4);
INSERT INTO `song_chord` VALUES (442,'Am',0);
INSERT INTO `song_chord` VALUES (442,'G',1);
INSERT INTO `song_chord` VALUES (443,'Am',0);
INSERT INTO `song_chord` VALUES (443,'G',1);
INSERT INTO `song_chord` VALUES (444,'Bm',0);
INSERT INTO `song_chord` VALUES (444,'A',1);
INSERT INTO `song_chord` VALUES (444,'G',2);
INSERT INTO `song_chord` VALUES (444,'F#',3);
INSERT INTO `song_chord` VALUES (445,'Am',0);
INSERT INTO `song_chord` VALUES (445,'G',1);
INSERT INTO `song_chord` VALUES (445,'F',2);
INSERT INTO `song_chord` VALUES (445,'E',3);
INSERT INTO `song_chord` VALUES (446,'Am',0);
INSERT INTO `song_chord` VALUES (446,'G',1);
INSERT INTO `song_chord` VALUES (447,'Am',0);
INSERT INTO `song_chord` VALUES (447,'G',1);
INSERT INTO `song_chord` VALUES (448,'Am',0);
INSERT INTO `song_chord` VALUES (448,'G',1);
INSERT INTO `song_chord` VALUES (449,'C',0);
INSERT INTO `song_chord` VALUES (449,'F',1);
INSERT INTO `song_chord` VALUES (449,'E',2);
INSERT INTO `song_chord` VALUES (450,'Am',0);
INSERT INTO `song_chord` VALUES (450,'Dm',1);
INSERT INTO `song_chord` VALUES (450,'E',2);
INSERT INTO `song_chord` VALUES (450,'F',3);
INSERT INTO `song_chord` VALUES (451,'Am',3);
INSERT INTO `song_chord` VALUES (452,'Am',0);
INSERT INTO `song_chord` VALUES (452,'E',1);
INSERT INTO `song_chord` VALUES (452,'Dm',2);
INSERT INTO `song_chord` VALUES (474,'Dm',3);
INSERT INTO `song_chord` VALUES (474,'Am',2);
INSERT INTO `song_chord` VALUES (474,'C',0);
INSERT INTO `song_chord` VALUES (474,'E',1);
INSERT INTO `song_chord` VALUES (454,'Em',0);
INSERT INTO `song_chord` VALUES (454,'F',1);
INSERT INTO `song_chord` VALUES (454,'E',2);
INSERT INTO `song_chord` VALUES (454,'Am',3);
INSERT INTO `song_chord` VALUES (454,'G',4);
INSERT INTO `song_chord` VALUES (454,'F#',5);
INSERT INTO `song_chord` VALUES (454,'A',6);
INSERT INTO `song_chord` VALUES (454,'Bm',7);
INSERT INTO `song_chord` VALUES (454,'D',8);
INSERT INTO `song_chord` VALUES (472,'G',3);
INSERT INTO `song_chord` VALUES (473,'B7',2);
INSERT INTO `song_chord` VALUES (472,'A',4);
INSERT INTO `song_chord` VALUES (473,'Em',0);
INSERT INTO `song_chord` VALUES (473,'Am',1);
INSERT INTO `song_chord` VALUES (473,'D',3);
INSERT INTO `song_chord` VALUES (456,'C',0);
INSERT INTO `song_chord` VALUES (456,'F',1);
INSERT INTO `song_chord` VALUES (456,'G',2);
INSERT INTO `song_chord` VALUES (456,'Fm',3);
INSERT INTO `song_chord` VALUES (456,'Cm',4);
INSERT INTO `song_chord` VALUES (456,'A#',5);
INSERT INTO `song_chord` VALUES (456,'G#',6);
INSERT INTO `song_chord` VALUES (472,'F#',2);
INSERT INTO `song_chord` VALUES (472,'Bm',0);
INSERT INTO `song_chord` VALUES (472,'Em',1);
INSERT INTO `song_chord` VALUES (471,'Bm',0);
INSERT INTO `song_chord` VALUES (471,'F#',3);
INSERT INTO `song_chord` VALUES (471,'G',2);
INSERT INTO `song_chord` VALUES (471,'Em',1);
INSERT INTO `song_chord` VALUES (459,'Dm',0);
INSERT INTO `song_chord` VALUES (459,'Gm',1);
INSERT INTO `song_chord` VALUES (459,'A',2);
INSERT INTO `song_chord` VALUES (459,'F',3);
INSERT INTO `song_chord` VALUES (459,'A#',4);
INSERT INTO `song_chord` VALUES (459,'C#',5);
INSERT INTO `song_chord` VALUES (459,'C7',6);
INSERT INTO `song_chord` VALUES (460,'Dm',0);
INSERT INTO `song_chord` VALUES (460,'Gm',1);
INSERT INTO `song_chord` VALUES (225,'G',4);
INSERT INTO `song_chord` VALUES (461,'Am',0);
INSERT INTO `song_chord` VALUES (461,'Dm',1);
INSERT INTO `song_chord` VALUES (461,'E',2);
INSERT INTO `song_chord` VALUES (461,'F',3);
INSERT INTO `song_chord` VALUES (475,'Dm9',1);
INSERT INTO `song_chord` VALUES (475,'E',0);
INSERT INTO `song_chord` VALUES (474,'E7',4);
INSERT INTO `song_chord` VALUES (474,'F',5);
INSERT INTO `song_chord` VALUES (455,'Am',5);
INSERT INTO `song_chord` VALUES (453,'G',2);
INSERT INTO `song_chord` VALUES (453,'E',1);
INSERT INTO `song_chord` VALUES (453,'Am',0);
INSERT INTO `song_chord` VALUES (455,'C',4);
INSERT INTO `song_chord` VALUES (455,'Em',2);
INSERT INTO `song_chord` VALUES (455,'C7',3);
INSERT INTO `song_chord` VALUES (457,'Am',0);
INSERT INTO `song_chord` VALUES (455,'G',0);
INSERT INTO `song_chord` VALUES (457,'E',1);
INSERT INTO `song_chord` VALUES (457,'Dm',2);
INSERT INTO `song_chord` VALUES (455,'B7',1);
INSERT INTO `song_chord` VALUES (458,'D',3);
INSERT INTO `song_chord` VALUES (458,'B7',2);
INSERT INTO `song_chord` VALUES (458,'Em',0);
INSERT INTO `song_chord` VALUES (458,'Am',1);
INSERT INTO `song_chord` VALUES (476,'Em',0);
INSERT INTO `song_chord` VALUES (476,'Am',1);
INSERT INTO `song_chord` VALUES (476,'B7',2);
INSERT INTO `song_chord` VALUES (476,'C',3);
INSERT INTO `song_chord` VALUES (477,'Em',0);
INSERT INTO `song_chord` VALUES (477,'Am',1);
INSERT INTO `song_chord` VALUES (477,'B7',2);
INSERT INTO `song_chord` VALUES (477,'C',3);
INSERT INTO `song_chord` VALUES (478,'G',0);
INSERT INTO `song_chord` VALUES (478,'Am',1);
INSERT INTO `song_chord` VALUES (478,'F',2);
INSERT INTO `song_chord` VALUES (478,'E',3);
INSERT INTO `song_chord` VALUES (478,'E7',4);
INSERT INTO `song_chord` VALUES (478,'Dm',5);
INSERT INTO `song_chord` VALUES (479,'D',0);
INSERT INTO `song_chord` VALUES (479,'A',1);
INSERT INTO `song_chord` VALUES (479,'G',2);
INSERT INTO `song_chord` VALUES (479,'F#m',3);
INSERT INTO `song_chord` VALUES (479,'Em',4);
INSERT INTO `song_chord` VALUES (480,'Em',0);
INSERT INTO `song_chord` VALUES (480,'G',1);
INSERT INTO `song_chord` VALUES (480,'Am',2);
INSERT INTO `song_chord` VALUES (481,'Am',0);
INSERT INTO `song_chord` VALUES (481,'G',1);
INSERT INTO `song_chord` VALUES (481,'F',2);
INSERT INTO `song_chord` VALUES (481,'E',3);
INSERT INTO `song_chord` VALUES (482,'Dm',0);
INSERT INTO `song_chord` VALUES (482,'Gm',1);
INSERT INTO `song_chord` VALUES (482,'A',2);
INSERT INTO `song_chord` VALUES (482,'A7',3);
INSERT INTO `song_chord` VALUES (483,'A',0);
INSERT INTO `song_chord` VALUES (483,'E',1);
INSERT INTO `song_chord` VALUES (483,'F',2);
INSERT INTO `song_chord` VALUES (483,'Am',3);
INSERT INTO `song_chord` VALUES (483,'E7',4);
INSERT INTO `song_chord` VALUES (484,'Am',0);
INSERT INTO `song_chord` VALUES (484,'G',1);
INSERT INTO `song_chord` VALUES (484,'F',2);
INSERT INTO `song_chord` VALUES (484,'E',3);
INSERT INTO `song_chord` VALUES (484,'Dm',4);
INSERT INTO `song_chord` VALUES (485,'Am',0);
INSERT INTO `song_chord` VALUES (485,'G',1);
INSERT INTO `song_chord` VALUES (485,'F',2);
INSERT INTO `song_chord` VALUES (485,'E7',3);
INSERT INTO `song_chord` VALUES (486,'G',0);
INSERT INTO `song_chord` VALUES (486,'Am',1);
INSERT INTO `song_chord` VALUES (486,'F',2);
INSERT INTO `song_chord` VALUES (486,'E',3);
INSERT INTO `song_chord` VALUES (486,'C',4);
INSERT INTO `song_chord` VALUES (487,'Dm',0);
INSERT INTO `song_chord` VALUES (487,'F',1);
INSERT INTO `song_chord` VALUES (487,'Gm',2);
INSERT INTO `song_chord` VALUES (487,'A7',3);
INSERT INTO `song_chord` VALUES (488,'C',0);
INSERT INTO `song_chord` VALUES (488,'G',1);
INSERT INTO `song_chord` VALUES (488,'Am',2);
INSERT INTO `song_chord` VALUES (488,'E',3);
INSERT INTO `song_chord` VALUES (488,'F',4);
INSERT INTO `song_chord` VALUES (488,'A',5);
INSERT INTO `song_chord` VALUES (488,'F#m',6);
INSERT INTO `song_chord` VALUES (489,'G',0);
INSERT INTO `song_chord` VALUES (489,'Em',1);
INSERT INTO `song_chord` VALUES (489,'Am',2);
INSERT INTO `song_chord` VALUES (489,'Bm',3);
INSERT INTO `song_chord` VALUES (489,'A',4);
INSERT INTO `song_chord` VALUES (490,'Am',0);
INSERT INTO `song_chord` VALUES (490,'G',1);
INSERT INTO `song_chord` VALUES (490,'C',2);
INSERT INTO `song_chord` VALUES (490,'F',3);
INSERT INTO `song_chord` VALUES (490,'E',4);
INSERT INTO `song_chord` VALUES (490,'E7',5);
INSERT INTO `song_chord` VALUES (491,'Am',0);
INSERT INTO `song_chord` VALUES (491,'Dm',1);
INSERT INTO `song_chord` VALUES (491,'E',2);
INSERT INTO `song_chord` VALUES (491,'F',3);
INSERT INTO `song_chord` VALUES (491,'G',4);
INSERT INTO `song_chord` VALUES (492,'G',0);
INSERT INTO `song_chord` VALUES (492,'Am',1);
INSERT INTO `song_chord` VALUES (492,'F',2);
INSERT INTO `song_chord` VALUES (492,'E',3);
INSERT INTO `song_chord` VALUES (492,'E7',4);
INSERT INTO `song_chord` VALUES (492,'Dm',5);
INSERT INTO `song_chord` VALUES (493,'Am',0);
INSERT INTO `song_chord` VALUES (493,'G',1);
INSERT INTO `song_chord` VALUES (493,'F',2);
INSERT INTO `song_chord` VALUES (493,'E',3);
INSERT INTO `song_chord` VALUES (494,'Am',0);
INSERT INTO `song_chord` VALUES (494,'G',1);
INSERT INTO `song_chord` VALUES (495,'Am',0);
INSERT INTO `song_chord` VALUES (495,'G',1);
INSERT INTO `song_chord` VALUES (496,'Bm',0);
INSERT INTO `song_chord` VALUES (496,'A',1);
INSERT INTO `song_chord` VALUES (496,'G',2);
INSERT INTO `song_chord` VALUES (496,'F#',3);
INSERT INTO `song_chord` VALUES (497,'Am',0);
INSERT INTO `song_chord` VALUES (497,'G',1);
INSERT INTO `song_chord` VALUES (497,'F',2);
INSERT INTO `song_chord` VALUES (497,'E',3);
INSERT INTO `song_chord` VALUES (498,'Am',0);
INSERT INTO `song_chord` VALUES (498,'G',1);
INSERT INTO `song_chord` VALUES (499,'Am',0);
INSERT INTO `song_chord` VALUES (499,'G',1);
INSERT INTO `song_chord` VALUES (500,'Am',0);
INSERT INTO `song_chord` VALUES (500,'G',1);
INSERT INTO `song_chord` VALUES (501,'C',0);
INSERT INTO `song_chord` VALUES (501,'F',1);
INSERT INTO `song_chord` VALUES (501,'E',2);
INSERT INTO `song_chord` VALUES (502,'E',0);
INSERT INTO `song_chord` VALUES (502,'B7',1);
INSERT INTO `song_chord` VALUES (503,'Em',0);
INSERT INTO `song_chord` VALUES (503,'Am',1);
INSERT INTO `song_chord` VALUES (503,'D',2);
INSERT INTO `song_chord` VALUES (503,'G',3);
INSERT INTO `song_chord` VALUES (503,'C',4);
INSERT INTO `song_chord` VALUES (503,'B7',5);
INSERT INTO `song_chord` VALUES (504,'D',0);
INSERT INTO `song_chord` VALUES (504,'A',1);
INSERT INTO `song_chord` VALUES (504,'G',2);
INSERT INTO `song_chord` VALUES (505,'G',0);
INSERT INTO `song_chord` VALUES (505,'C',1);
INSERT INTO `song_chord` VALUES (505,'D',2);
INSERT INTO `song_chord` VALUES (505,'Em',3);
INSERT INTO `song_chord` VALUES (506,'G',0);
INSERT INTO `song_chord` VALUES (506,'C',1);
INSERT INTO `song_chord` VALUES (506,'D',2);
INSERT INTO `song_chord` VALUES (506,'Em',3);
INSERT INTO `song_chord` VALUES (507,'Am',0);
INSERT INTO `song_chord` VALUES (507,'G',1);
INSERT INTO `song_chord` VALUES (508,'Am',0);
INSERT INTO `song_chord` VALUES (508,'G',1);
INSERT INTO `song_chord` VALUES (508,'F',2);
INSERT INTO `song_chord` VALUES (508,'E',3);
INSERT INTO `song_chord` VALUES (509,'Am',0);
INSERT INTO `song_chord` VALUES (509,'G',1);
INSERT INTO `song_chord` VALUES (510,'Am',0);
INSERT INTO `song_chord` VALUES (510,'G',1);
INSERT INTO `song_chord` VALUES (510,'F',2);
INSERT INTO `song_chord` VALUES (510,'E',3);
INSERT INTO `song_chord` VALUES (511,'C',0);
INSERT INTO `song_chord` VALUES (511,'G',1);
INSERT INTO `song_chord` VALUES (511,'Am',2);
INSERT INTO `song_chord` VALUES (511,'E',3);
INSERT INTO `song_chord` VALUES (511,'E7',4);
INSERT INTO `song_chord` VALUES (512,'Am',0);
INSERT INTO `song_chord` VALUES (512,'G',1);
INSERT INTO `song_chord` VALUES (512,'F',2);
INSERT INTO `song_chord` VALUES (512,'E',3);
INSERT INTO `song_chord` VALUES (513,'Am',0);
INSERT INTO `song_chord` VALUES (513,'E',1);
INSERT INTO `song_chord` VALUES (513,'E7',2);
INSERT INTO `song_chord` VALUES (513,'G',3);
INSERT INTO `song_chord` VALUES (513,'F',4);
INSERT INTO `song_chord` VALUES (514,'Am',0);
INSERT INTO `song_chord` VALUES (514,'E',1);
INSERT INTO `song_chord` VALUES (514,'E7',2);
INSERT INTO `song_chord` VALUES (514,'Dm',3);
INSERT INTO `song_chord` VALUES (514,'A7',4);
INSERT INTO `song_chord` VALUES (514,'F',5);
INSERT INTO `song_chord` VALUES (515,'Am',0);
INSERT INTO `song_chord` VALUES (515,'F',1);
INSERT INTO `song_chord` VALUES (515,'E7',2);
INSERT INTO `song_chord` VALUES (515,'G',3);
INSERT INTO `song_chord` VALUES (515,'Dm',4);
INSERT INTO `song_chord` VALUES (516,'Em',0);
INSERT INTO `song_chord` VALUES (516,'D',1);
INSERT INTO `song_chord` VALUES (516,'C',2);
INSERT INTO `song_chord` VALUES (516,'E',3);
INSERT INTO `song_chord` VALUES (516,'G#',4);
INSERT INTO `song_chord` VALUES (516,'C#m',5);
INSERT INTO `song_chord` VALUES (516,'F#m',6);
INSERT INTO `song_chord` VALUES (516,'A',7);
INSERT INTO `song_chord` VALUES (516,'B7',8);
INSERT INTO `song_chord` VALUES (517,'Am',0);
INSERT INTO `song_chord` VALUES (517,'E',1);
INSERT INTO `song_chord` VALUES (517,'Dm',2);
INSERT INTO `song_chord` VALUES (518,'Am',0);
INSERT INTO `song_chord` VALUES (518,'E',1);
INSERT INTO `song_chord` VALUES (518,'E7',2);
INSERT INTO `song_chord` VALUES (519,'Am',0);
INSERT INTO `song_chord` VALUES (519,'E7',1);
INSERT INTO `song_chord` VALUES (519,'F',2);
INSERT INTO `song_chord` VALUES (520,'A',0);
INSERT INTO `song_chord` VALUES (520,'E',1);
INSERT INTO `song_chord` VALUES (520,'D',2);
INSERT INTO `song_chord` VALUES (520,'E7',3);
INSERT INTO `song_chord` VALUES (520,'B7',4);
INSERT INTO `song_chord` VALUES (521,'Am',0);
INSERT INTO `song_chord` VALUES (521,'F',1);
INSERT INTO `song_chord` VALUES (521,'G',2);
INSERT INTO `song_chord` VALUES (521,'E',3);
INSERT INTO `song_chord` VALUES (522,'Em',0);
INSERT INTO `song_chord` VALUES (522,'Am',1);
INSERT INTO `song_chord` VALUES (522,'B7',2);
INSERT INTO `song_chord` VALUES (522,'C',3);
INSERT INTO `song_chord` VALUES (522,'D',4);
INSERT INTO `song_chord` VALUES (522,'G',5);
INSERT INTO `song_chord` VALUES (522,'Bm',6);
INSERT INTO `song_chord` VALUES (523,'Am',0);
INSERT INTO `song_chord` VALUES (523,'Dm',1);
INSERT INTO `song_chord` VALUES (523,'E',2);
INSERT INTO `song_chord` VALUES (523,'G',3);
INSERT INTO `song_chord` VALUES (523,'F',4);
INSERT INTO `song_chord` VALUES (524,'Em',0);
INSERT INTO `song_chord` VALUES (524,'C',1);
INSERT INTO `song_chord` VALUES (524,'B7',2);
INSERT INTO `song_chord` VALUES (524,'Am',3);
INSERT INTO `song_chord` VALUES (525,'Em',0);
INSERT INTO `song_chord` VALUES (525,'D',1);
INSERT INTO `song_chord` VALUES (525,'Am',2);
INSERT INTO `song_chord` VALUES (525,'B7',3);
INSERT INTO `song_chord` VALUES (525,'C',4);
INSERT INTO `song_chord` VALUES (525,'G',5);
INSERT INTO `song_chord` VALUES (525,'Bm',6);
INSERT INTO `song_chord` VALUES (526,'G',0);
INSERT INTO `song_chord` VALUES (526,'F#m',1);
INSERT INTO `song_chord` VALUES (526,'E',2);
INSERT INTO `song_chord` VALUES (526,'A',3);
INSERT INTO `song_chord` VALUES (526,'B',4);
INSERT INTO `song_chord` VALUES (526,'Em',5);
INSERT INTO `song_chord` VALUES (526,'D',6);
INSERT INTO `song_chord` VALUES (526,'B7',7);
INSERT INTO `song_chord` VALUES (527,'Am',0);
INSERT INTO `song_chord` VALUES (527,'E7',1);
INSERT INTO `song_chord` VALUES (528,'A',0);
INSERT INTO `song_chord` VALUES (528,'F#m',1);
INSERT INTO `song_chord` VALUES (529,'E',0);
INSERT INTO `song_chord` VALUES (529,'A',1);
INSERT INTO `song_chord` VALUES (529,'D',2);
INSERT INTO `song_chord` VALUES (530,'Dm',0);
INSERT INTO `song_chord` VALUES (530,'G',1);
INSERT INTO `song_chord` VALUES (530,'A#',2);
INSERT INTO `song_chord` VALUES (530,'C',3);
INSERT INTO `song_chord` VALUES (530,'Gm',4);
INSERT INTO `song_chord` VALUES (530,'A7',5);
INSERT INTO `song_chord` VALUES (531,'Dm',0);
INSERT INTO `song_chord` VALUES (531,'Gm',1);
INSERT INTO `song_chord` VALUES (531,'A',2);
INSERT INTO `song_chord` VALUES (531,'A7',3);
INSERT INTO `song_chord` VALUES (532,'G',0);
INSERT INTO `song_chord` VALUES (532,'B7',1);
INSERT INTO `song_chord` VALUES (532,'Em',2);
INSERT INTO `song_chord` VALUES (532,'D7',3);
INSERT INTO `song_chord` VALUES (533,'C',0);
INSERT INTO `song_chord` VALUES (533,'G',1);
INSERT INTO `song_chord` VALUES (533,'Am',2);
INSERT INTO `song_chord` VALUES (533,'Dm',3);
INSERT INTO `song_chord` VALUES (533,'F',4);
INSERT INTO `song_chord` VALUES (533,'E',5);
INSERT INTO `song_chord` VALUES (533,'E7',6);
INSERT INTO `song_chord` VALUES (533,'G7',7);
INSERT INTO `song_chord` VALUES (534,'Am',0);
INSERT INTO `song_chord` VALUES (534,'G',1);
INSERT INTO `song_chord` VALUES (534,'F',2);
INSERT INTO `song_chord` VALUES (534,'E',3);
INSERT INTO `song_chord` VALUES (534,'E7',4);
INSERT INTO `song_chord` VALUES (535,'D',0);
INSERT INTO `song_chord` VALUES (535,'E',1);
INSERT INTO `song_chord` VALUES (535,'A',2);
INSERT INTO `song_chord` VALUES (535,'A7',3);
INSERT INTO `song_chord` VALUES (536,'D',0);
INSERT INTO `song_chord` VALUES (536,'F#m',1);
INSERT INTO `song_chord` VALUES (536,'D7',2);
INSERT INTO `song_chord` VALUES (536,'Em',3);
INSERT INTO `song_chord` VALUES (536,'G',4);
INSERT INTO `song_chord` VALUES (536,'A',5);
INSERT INTO `song_chord` VALUES (536,'Bm',6);
INSERT INTO `song_chord` VALUES (536,'E7',7);
INSERT INTO `song_chord` VALUES (537,'D',0);
INSERT INTO `song_chord` VALUES (537,'Em',1);
INSERT INTO `song_chord` VALUES (537,'D7',2);
INSERT INTO `song_chord` VALUES (537,'G',3);
INSERT INTO `song_chord` VALUES (537,'A',4);
INSERT INTO `song_chord` VALUES (538,'Em',0);
INSERT INTO `song_chord` VALUES (538,'Am',1);
INSERT INTO `song_chord` VALUES (538,'B7',2);
INSERT INTO `song_chord` VALUES (539,'Dm',0);
INSERT INTO `song_chord` VALUES (539,'Am',1);
INSERT INTO `song_chord` VALUES (539,'D7',2);
INSERT INTO `song_chord` VALUES (539,'G',3);
INSERT INTO `song_chord` VALUES (539,'Bm',4);
INSERT INTO `song_chord` VALUES (539,'C',5);
INSERT INTO `song_chord` VALUES (539,'F#',6);
INSERT INTO `song_chord` VALUES (539,'D',7);
INSERT INTO `song_chord` VALUES (539,'A',8);
INSERT INTO `song_chord` VALUES (540,'Am',0);
INSERT INTO `song_chord` VALUES (540,'F',1);
INSERT INTO `song_chord` VALUES (540,'G',2);
INSERT INTO `song_chord` VALUES (540,'E7',3);
INSERT INTO `song_chord` VALUES (540,'E',4);
INSERT INTO `song_chord` VALUES (541,'Dm',0);
INSERT INTO `song_chord` VALUES (541,'F',1);
INSERT INTO `song_chord` VALUES (541,'A#',2);
INSERT INTO `song_chord` VALUES (541,'A7',3);
INSERT INTO `song_chord` VALUES (541,'C',4);
INSERT INTO `song_chord` VALUES (542,'A',0);
INSERT INTO `song_chord` VALUES (542,'E',1);
INSERT INTO `song_chord` VALUES (542,'B7',2);
INSERT INTO `song_chord` VALUES (543,'Em',0);
INSERT INTO `song_chord` VALUES (543,'Am',1);
INSERT INTO `song_chord` VALUES (543,'B7',2);
INSERT INTO `song_chord` VALUES (543,'C',3);
INSERT INTO `song_chord` VALUES (544,'Am',0);
INSERT INTO `song_chord` VALUES (544,'Dm',1);
INSERT INTO `song_chord` VALUES (544,'E',2);
INSERT INTO `song_chord` VALUES (544,'G',3);
INSERT INTO `song_chord` VALUES (544,'F',4);
INSERT INTO `song_chord` VALUES (545,'C7',0);
INSERT INTO `song_chord` VALUES (545,'F',1);
INSERT INTO `song_chord` VALUES (545,'A7',2);
INSERT INTO `song_chord` VALUES (545,'D7',3);
INSERT INTO `song_chord` VALUES (545,'G7',4);
INSERT INTO `song_chord` VALUES (546,'G',0);
INSERT INTO `song_chord` VALUES (546,'Am',1);
INSERT INTO `song_chord` VALUES (546,'C',2);
INSERT INTO `song_chord` VALUES (546,'B7',3);
INSERT INTO `song_chord` VALUES (547,'Em',0);
INSERT INTO `song_chord` VALUES (547,'Am',1);
INSERT INTO `song_chord` VALUES (547,'F',2);
INSERT INTO `song_chord` VALUES (547,'E',3);
INSERT INTO `song_chord` VALUES (548,'Em',0);
INSERT INTO `song_chord` VALUES (548,'F',1);
INSERT INTO `song_chord` VALUES (548,'E',2);
INSERT INTO `song_chord` VALUES (548,'Am',3);
INSERT INTO `song_chord` VALUES (548,'G',4);
INSERT INTO `song_chord` VALUES (548,'F#',5);
INSERT INTO `song_chord` VALUES (548,'Bm',6);
INSERT INTO `song_chord` VALUES (548,'D',7);
INSERT INTO `song_chord` VALUES (549,'E',0);
INSERT INTO `song_chord` VALUES (549,'G',1);
INSERT INTO `song_chord` VALUES (549,'A',2);
INSERT INTO `song_chord` VALUES (549,'B',3);
INSERT INTO `song_chord` VALUES (549,'Em',4);
INSERT INTO `song_chord` VALUES (549,'Am',5);
INSERT INTO `song_chord` VALUES (549,'Bm',6);
INSERT INTO `song_chord` VALUES (550,'Am',0);
INSERT INTO `song_chord` VALUES (550,'F',1);
INSERT INTO `song_chord` VALUES (550,'E',2);
INSERT INTO `song_chord` VALUES (550,'E7',3);
INSERT INTO `song_chord` VALUES (550,'G',4);
INSERT INTO `song_chord` VALUES (551,'Em',0);
INSERT INTO `song_chord` VALUES (551,'Am',1);
INSERT INTO `song_chord` VALUES (551,'B7',2);
INSERT INTO `song_chord` VALUES (551,'D',3);
INSERT INTO `song_chord` VALUES (552,'Em',0);
INSERT INTO `song_chord` VALUES (552,'Am',1);
INSERT INTO `song_chord` VALUES (553,'Em',0);
INSERT INTO `song_chord` VALUES (553,'D',1);
INSERT INTO `song_chord` VALUES (553,'Am',2);
INSERT INTO `song_chord` VALUES (554,'Em',0);
INSERT INTO `song_chord` VALUES (554,'B7',1);
INSERT INTO `song_chord` VALUES (554,'G',2);
INSERT INTO `song_chord` VALUES (554,'Am',3);
INSERT INTO `song_chord` VALUES (554,'D',4);
INSERT INTO `song_chord` VALUES (555,'C',0);
INSERT INTO `song_chord` VALUES (555,'E',1);
INSERT INTO `song_chord` VALUES (555,'Am',2);
INSERT INTO `song_chord` VALUES (555,'F',3);
INSERT INTO `song_chord` VALUES (555,'Dm',4);
INSERT INTO `song_chord` VALUES (556,'C',0);
INSERT INTO `song_chord` VALUES (556,'E',1);
INSERT INTO `song_chord` VALUES (556,'F',2);
INSERT INTO `song_chord` VALUES (557,'D',0);
INSERT INTO `song_chord` VALUES (557,'F#m',1);
INSERT INTO `song_chord` VALUES (557,'G',2);
INSERT INTO `song_chord` VALUES (557,'Em',3);
INSERT INTO `song_chord` VALUES (557,'Em6',4);
INSERT INTO `song_chord` VALUES (557,'A',5);
INSERT INTO `song_chord` VALUES (557,'F#',6);
INSERT INTO `song_chord` VALUES (558,'G',0);
INSERT INTO `song_chord` VALUES (558,'Bm',1);
INSERT INTO `song_chord` VALUES (558,'C',2);
INSERT INTO `song_chord` VALUES (558,'D',3);
INSERT INTO `song_chord` VALUES (559,'C',0);
INSERT INTO `song_chord` VALUES (559,'G',1);
INSERT INTO `song_chord` VALUES (559,'F',2);
INSERT INTO `song_chord` VALUES (559,'E',3);
INSERT INTO `song_chord` VALUES (559,'Am',4);
INSERT INTO `song_chord` VALUES (560,'E',0);
INSERT INTO `song_chord` VALUES (560,'F#m',1);
INSERT INTO `song_chord` VALUES (560,'B7',2);
INSERT INTO `song_chord` VALUES (560,'C#m',3);
INSERT INTO `song_chord` VALUES (560,'G#',4);
INSERT INTO `song_chord` VALUES (561,'D',0);
INSERT INTO `song_chord` VALUES (561,'A',1);
INSERT INTO `song_chord` VALUES (561,'G',2);
INSERT INTO `song_chord` VALUES (561,'Em',3);
INSERT INTO `song_chord` VALUES (561,'A7',4);
INSERT INTO `song_chord` VALUES (562,'Em',0);
INSERT INTO `song_chord` VALUES (562,'Am',1);
INSERT INTO `song_chord` VALUES (562,'D',2);
INSERT INTO `song_chord` VALUES (562,'C',3);
INSERT INTO `song_chord` VALUES (562,'B7',4);
INSERT INTO `song_chord` VALUES (563,'Dm',0);
INSERT INTO `song_chord` VALUES (563,'D7',1);
INSERT INTO `song_chord` VALUES (563,'Gm',2);
INSERT INTO `song_chord` VALUES (563,'A#',3);
INSERT INTO `song_chord` VALUES (563,'A7',4);
INSERT INTO `song_chord` VALUES (564,'Cm',0);
INSERT INTO `song_chord` VALUES (564,'G7',1);
INSERT INTO `song_chord` VALUES (564,'Fm',2);
INSERT INTO `song_chord` VALUES (564,'C7',3);
INSERT INTO `song_chord` VALUES (565,'G',0);
INSERT INTO `song_chord` VALUES (565,'D',1);
INSERT INTO `song_chord` VALUES (565,'Em',2);
INSERT INTO `song_chord` VALUES (565,'Am',3);
INSERT INTO `song_chord` VALUES (565,'D7',4);
INSERT INTO `song_chord` VALUES (566,'Em',0);
INSERT INTO `song_chord` VALUES (566,'B7',1);
INSERT INTO `song_chord` VALUES (567,'Em',0);
INSERT INTO `song_chord` VALUES (567,'B7',1);
INSERT INTO `song_chord` VALUES (568,'A',0);
INSERT INTO `song_chord` VALUES (568,'F#m',1);
INSERT INTO `song_chord` VALUES (568,'E',2);
INSERT INTO `song_chord` VALUES (568,'E7',3);
INSERT INTO `song_chord` VALUES (568,'D',4);
INSERT INTO `song_chord` VALUES (568,'C#m',5);
INSERT INTO `song_chord` VALUES (569,'D',0);
INSERT INTO `song_chord` VALUES (569,'Bm',1);
INSERT INTO `song_chord` VALUES (569,'G',2);
INSERT INTO `song_chord` VALUES (569,'A',3);
INSERT INTO `song_chord` VALUES (569,'F#',4);
INSERT INTO `song_chord` VALUES (570,'Em',0);
INSERT INTO `song_chord` VALUES (570,'Am',1);
INSERT INTO `song_chord` VALUES (570,'C',2);
INSERT INTO `song_chord` VALUES (570,'B7',3);
INSERT INTO `song_chord` VALUES (571,'Em',0);
INSERT INTO `song_chord` VALUES (571,'Am',1);
INSERT INTO `song_chord` VALUES (571,'B7',2);
INSERT INTO `song_chord` VALUES (572,'Am',0);
INSERT INTO `song_chord` VALUES (572,'Em',1);
INSERT INTO `song_chord` VALUES (572,'F',2);
INSERT INTO `song_chord` VALUES (572,'E',3);
INSERT INTO `song_chord` VALUES (573,'D',0);
INSERT INTO `song_chord` VALUES (573,'F#m',1);
INSERT INTO `song_chord` VALUES (573,'G',2);
INSERT INTO `song_chord` VALUES (573,'A',3);
INSERT INTO `song_chord` VALUES (573,'Em',4);
INSERT INTO `song_chord` VALUES (574,'Em',0);
INSERT INTO `song_chord` VALUES (574,'Am',1);
INSERT INTO `song_chord` VALUES (574,'B7',2);
INSERT INTO `song_chord` VALUES (575,'E',0);
INSERT INTO `song_chord` VALUES (575,'F#m',1);
INSERT INTO `song_chord` VALUES (575,'B7',2);
INSERT INTO `song_chord` VALUES (575,'G#',3);
INSERT INTO `song_chord` VALUES (575,'C#m',4);
INSERT INTO `song_chord` VALUES (575,'C#7',5);
INSERT INTO `song_chord` VALUES (575,'B',6);
INSERT INTO `song_chord` VALUES (575,'A#',7);
INSERT INTO `song_chord` VALUES (575,'A',8);
INSERT INTO `song_chord` VALUES (576,'Em',0);
INSERT INTO `song_chord` VALUES (576,'Am',1);
INSERT INTO `song_chord` VALUES (576,'G',2);
INSERT INTO `song_chord` VALUES (576,'A',3);
INSERT INTO `song_chord` VALUES (576,'B7',4);
INSERT INTO `song_chord` VALUES (577,'Am',0);
INSERT INTO `song_chord` VALUES (577,'G',1);
INSERT INTO `song_chord` VALUES (577,'F',2);
INSERT INTO `song_chord` VALUES (577,'E',3);
INSERT INTO `song_chord` VALUES (578,'Cm',0);
INSERT INTO `song_chord` VALUES (578,'G#',1);
INSERT INTO `song_chord` VALUES (578,'Fm',2);
INSERT INTO `song_chord` VALUES (579,'Am',0);
INSERT INTO `song_chord` VALUES (579,'Dm',1);
INSERT INTO `song_chord` VALUES (579,'E',2);
INSERT INTO `song_chord` VALUES (580,'Em',0);
INSERT INTO `song_chord` VALUES (580,'C',1);
INSERT INTO `song_chord` VALUES (580,'B7',2);
INSERT INTO `song_chord` VALUES (580,'G',3);
INSERT INTO `song_chord` VALUES (581,'Am',0);
INSERT INTO `song_chord` VALUES (581,'Dm',1);
INSERT INTO `song_chord` VALUES (581,'Dm9',2);
INSERT INTO `song_chord` VALUES (581,'F',3);
INSERT INTO `song_chord` VALUES (581,'E',4);
INSERT INTO `song_chord` VALUES (581,'Em',5);
INSERT INTO `song_chord` VALUES (582,'Am',0);
INSERT INTO `song_chord` VALUES (582,'Dm',1);
INSERT INTO `song_chord` VALUES (582,'F',2);
INSERT INTO `song_chord` VALUES (582,'E',3);
INSERT INTO `song_chord` VALUES (583,'Am',0);
INSERT INTO `song_chord` VALUES (583,'Dm',1);
INSERT INTO `song_chord` VALUES (584,'C',0);
INSERT INTO `song_chord` VALUES (584,'Am',1);
INSERT INTO `song_chord` VALUES (584,'F',2);
INSERT INTO `song_chord` VALUES (584,'G',3);
INSERT INTO `song_chord` VALUES (584,'G#',4);
INSERT INTO `song_chord` VALUES (585,'Em',0);
INSERT INTO `song_chord` VALUES (585,'D',1);
INSERT INTO `song_chord` VALUES (585,'G',2);
INSERT INTO `song_chord` VALUES (585,'Bm',3);
INSERT INTO `song_chord` VALUES (586,'C',0);
INSERT INTO `song_chord` VALUES (586,'E',1);
INSERT INTO `song_chord` VALUES (586,'Dm9',2);
INSERT INTO `song_chord` VALUES (586,'G',3);
INSERT INTO `song_chord` VALUES (586,'Dm',4);
INSERT INTO `song_chord` VALUES (586,'F',5);
INSERT INTO `song_chord` VALUES (587,'Dm',0);
INSERT INTO `song_chord` VALUES (587,'Gm',1);
INSERT INTO `song_chord` VALUES (587,'A#',2);
INSERT INTO `song_chord` VALUES (587,'F',3);
INSERT INTO `song_chord` VALUES (587,'C',4);
INSERT INTO `song_chord` VALUES (588,'Am',0);
INSERT INTO `song_chord` VALUES (588,'G',1);
INSERT INTO `song_chord` VALUES (588,'E',2);
INSERT INTO `song_chord` VALUES (589,'Am',0);
INSERT INTO `song_chord` VALUES (589,'Em',1);
INSERT INTO `song_chord` VALUES (589,'F',2);
INSERT INTO `song_chord` VALUES (589,'C',3);
INSERT INTO `song_chord` VALUES (589,'E7',4);
INSERT INTO `song_chord` VALUES (589,'Dm',5);
INSERT INTO `song_chord` VALUES (590,'Am',0);
INSERT INTO `song_chord` VALUES (590,'G',1);
INSERT INTO `song_chord` VALUES (591,'C',0);
INSERT INTO `song_chord` VALUES (591,'Em',1);
INSERT INTO `song_chord` VALUES (591,'Am',2);
INSERT INTO `song_chord` VALUES (591,'F',3);
INSERT INTO `song_chord` VALUES (591,'G',4);
INSERT INTO `song_chord` VALUES (592,'Dm',0);
INSERT INTO `song_chord` VALUES (592,'Gm',1);
INSERT INTO `song_chord` VALUES (593,'Em',0);
INSERT INTO `song_chord` VALUES (593,'Am',1);
INSERT INTO `song_chord` VALUES (594,'Em',0);
INSERT INTO `song_chord` VALUES (594,'Am',1);
INSERT INTO `song_chord` VALUES (594,'B7',2);
INSERT INTO `song_chord` VALUES (594,'G',3);
INSERT INTO `song_chord` VALUES (594,'A',4);
INSERT INTO `song_chord` VALUES (595,'Am',0);
INSERT INTO `song_chord` VALUES (595,'Dm',1);
INSERT INTO `song_chord` VALUES (595,'E',2);
INSERT INTO `song_chord` VALUES (596,'D',0);
INSERT INTO `song_chord` VALUES (596,'F#m',1);
INSERT INTO `song_chord` VALUES (596,'G',2);
INSERT INTO `song_chord` VALUES (596,'Em',3);
INSERT INTO `song_chord` VALUES (596,'A7',4);
INSERT INTO `song_chord` VALUES (596,'A',5);
INSERT INTO `song_chord` VALUES (597,'C',0);
INSERT INTO `song_chord` VALUES (597,'E',1);
INSERT INTO `song_chord` VALUES (597,'Am',2);
INSERT INTO `song_chord` VALUES (597,'F',3);
INSERT INTO `song_chord` VALUES (598,'Dm',0);
INSERT INTO `song_chord` VALUES (598,'A7',1);
INSERT INTO `song_chord` VALUES (598,'Gm',2);
INSERT INTO `song_chord` VALUES (598,'A#',3);
INSERT INTO `song_chord` VALUES (599,'G',0);
INSERT INTO `song_chord` VALUES (599,'B7',1);
INSERT INTO `song_chord` VALUES (599,'Em',2);
INSERT INTO `song_chord` VALUES (599,'C7',3);
INSERT INTO `song_chord` VALUES (599,'C',4);
INSERT INTO `song_chord` VALUES (599,'Am',5);
INSERT INTO `song_chord` VALUES (600,'G',0);
INSERT INTO `song_chord` VALUES (600,'Em',1);
INSERT INTO `song_chord` VALUES (600,'Am',2);
INSERT INTO `song_chord` VALUES (600,'Bm',3);
INSERT INTO `song_chord` VALUES (601,'A',0);
INSERT INTO `song_chord` VALUES (601,'A#',1);
INSERT INTO `song_chord` VALUES (601,'Dm',2);
INSERT INTO `song_chord` VALUES (602,'Am',0);
INSERT INTO `song_chord` VALUES (602,'F',1);
INSERT INTO `song_chord` VALUES (602,'G',2);
INSERT INTO `song_chord` VALUES (602,'E',3);
INSERT INTO `song_chord` VALUES (603,'Am',0);
INSERT INTO `song_chord` VALUES (603,'Dm',1);
INSERT INTO `song_chord` VALUES (603,'G',2);
INSERT INTO `song_chord` VALUES (604,'E',0);
INSERT INTO `song_chord` VALUES (604,'Am',1);
INSERT INTO `song_chord` VALUES (604,'Dm',2);
INSERT INTO `song_chord` VALUES (604,'G7',3);
INSERT INTO `song_chord` VALUES (604,'E7',4);
INSERT INTO `song_chord` VALUES (604,'F7M',5);
INSERT INTO `song_chord` VALUES (605,'Dm',0);
INSERT INTO `song_chord` VALUES (605,'C7',1);
INSERT INTO `song_chord` VALUES (605,'A#7',2);
INSERT INTO `song_chord` VALUES (605,'A7',3);
INSERT INTO `song_chord` VALUES (606,'Em',0);
INSERT INTO `song_chord` VALUES (606,'Am',1);
INSERT INTO `song_chord` VALUES (606,'B7',2);
INSERT INTO `song_chord` VALUES (607,'Em',0);
INSERT INTO `song_chord` VALUES (607,'G',1);
INSERT INTO `song_chord` VALUES (607,'B7',2);
INSERT INTO `song_chord` VALUES (607,'Am',3);
INSERT INTO `song_chord` VALUES (607,'C',4);
INSERT INTO `song_chord` VALUES (608,'Am',0);
INSERT INTO `song_chord` VALUES (608,'G',1);
INSERT INTO `song_chord` VALUES (608,'F',2);
INSERT INTO `song_chord` VALUES (608,'E',3);
INSERT INTO `song_chord` VALUES (608,'Dm',4);
INSERT INTO `song_chord` VALUES (609,'Am',0);
INSERT INTO `song_chord` VALUES (609,'G',1);
INSERT INTO `song_chord` VALUES (609,'F',2);
INSERT INTO `song_chord` VALUES (609,'E',3);
INSERT INTO `song_chord` VALUES (609,'E7',4);
INSERT INTO `song_chord` VALUES (610,'Am',0);
INSERT INTO `song_chord` VALUES (610,'Dm',1);
INSERT INTO `song_chord` VALUES (610,'F',2);
INSERT INTO `song_chord` VALUES (610,'E',3);
INSERT INTO `song_chord` VALUES (611,'Am',0);
INSERT INTO `song_chord` VALUES (611,'Dm',1);
INSERT INTO `song_chord` VALUES (611,'E',2);
INSERT INTO `song_chord` VALUES (611,'F',3);
INSERT INTO `song_chord` VALUES (611,'G',4);
INSERT INTO `song_chord` VALUES (612,'Dm',0);
INSERT INTO `song_chord` VALUES (612,'C',1);
INSERT INTO `song_chord` VALUES (612,'A',2);
INSERT INTO `song_chord` VALUES (612,'A#',3);
INSERT INTO `song_chord` VALUES (613,'Bm',0);
INSERT INTO `song_chord` VALUES (613,'Em',1);
INSERT INTO `song_chord` VALUES (613,'F#',2);
INSERT INTO `song_chord` VALUES (613,'G',3);
INSERT INTO `song_chord` VALUES (613,'A',4);
INSERT INTO `song_chord` VALUES (614,'E',0);
INSERT INTO `song_chord` VALUES (614,'G#',1);
INSERT INTO `song_chord` VALUES (614,'A',2);
INSERT INTO `song_chord` VALUES (614,'B7',3);
INSERT INTO `song_chord` VALUES (614,'C#m',4);
INSERT INTO `song_chord` VALUES (614,'B',5);
INSERT INTO `song_chord` VALUES (615,'Am',0);
INSERT INTO `song_chord` VALUES (615,'F',1);
INSERT INTO `song_chord` VALUES (615,'G',2);
INSERT INTO `song_chord` VALUES (615,'E',3);
INSERT INTO `song_chord` VALUES (616,'E',0);
INSERT INTO `song_chord` VALUES (616,'C#m',1);
INSERT INTO `song_chord` VALUES (616,'G#',2);
INSERT INTO `song_chord` VALUES (616,'A',3);
INSERT INTO `song_chord` VALUES (616,'F#m',4);
INSERT INTO `song_chord` VALUES (616,'B',5);
INSERT INTO `song_chord` VALUES (617,'Am',0);
INSERT INTO `song_chord` VALUES (617,'Em',1);
INSERT INTO `song_chord` VALUES (617,'Dm9',2);
INSERT INTO `song_chord` VALUES (617,'F',3);
INSERT INTO `song_chord` VALUES (617,'E',4);
INSERT INTO `song_chord` VALUES (617,'Dm',5);
INSERT INTO `song_chord` VALUES (618,'E',0);
INSERT INTO `song_chord` VALUES (618,'Dm9',1);
INSERT INTO `song_chord` VALUES (619,'Em',0);
INSERT INTO `song_chord` VALUES (619,'B7',1);
INSERT INTO `song_chord` VALUES (619,'Am',2);
INSERT INTO `song_chord` VALUES (620,'B',0);
INSERT INTO `song_chord` VALUES (620,'Am',1);
INSERT INTO `song_chord` VALUES (620,'Em',2);
INSERT INTO `song_chord` VALUES (620,'B7',3);
INSERT INTO `song_chord` VALUES (621,'Am',0);
INSERT INTO `song_chord` VALUES (621,'Dm',1);
INSERT INTO `song_chord` VALUES (621,'E7',2);
INSERT INTO `song_chord` VALUES (621,'F7',3);
INSERT INTO `song_chord` VALUES (621,'E',4);
INSERT INTO `song_chord` VALUES (621,'F',5);
INSERT INTO `song_chord` VALUES (621,'G',6);
INSERT INTO `song_chord` VALUES (622,'G',0);
INSERT INTO `song_chord` VALUES (622,'Em',1);
INSERT INTO `song_chord` VALUES (622,'C',2);
INSERT INTO `song_chord` VALUES (622,'D',3);
INSERT INTO `song_chord` VALUES (622,'B7',4);
INSERT INTO `song_chord` VALUES (623,'Am',0);
INSERT INTO `song_chord` VALUES (623,'E',1);
INSERT INTO `song_chord` VALUES (623,'Dm',2);
INSERT INTO `song_chord` VALUES (623,'F',3);
INSERT INTO `song_chord` VALUES (624,'Em',0);
INSERT INTO `song_chord` VALUES (624,'B7',1);
INSERT INTO `song_chord` VALUES (624,'Am',2);
INSERT INTO `song_chord` VALUES (624,'D',3);
INSERT INTO `song_chord` VALUES (624,'G',4);
INSERT INTO `song_chord` VALUES (624,'C',5);
INSERT INTO `song_chord` VALUES (625,'Dm',0);
INSERT INTO `song_chord` VALUES (625,'A7',1);
INSERT INTO `song_chord` VALUES (625,'Gm',2);
INSERT INTO `song_chord` VALUES (625,'A#',3);
INSERT INTO `song_chord` VALUES (625,'A',4);
INSERT INTO `song_chord` VALUES (626,'F#',0);
INSERT INTO `song_chord` VALUES (626,'G',1);
INSERT INTO `song_chord` VALUES (626,'Bm',2);
INSERT INTO `song_chord` VALUES (626,'A',3);
INSERT INTO `song_chord` VALUES (627,'E',0);
INSERT INTO `song_chord` VALUES (627,'A',1);
INSERT INTO `song_chord` VALUES (627,'F#',2);
INSERT INTO `song_chord` VALUES (627,'B7',3);
INSERT INTO `song_chord` VALUES (627,'C#m',4);
INSERT INTO `song_chord` VALUES (627,'G#',5);
INSERT INTO `song_chord` VALUES (628,'G',0);
INSERT INTO `song_chord` VALUES (628,'Em',1);
INSERT INTO `song_chord` VALUES (628,'C',2);
INSERT INTO `song_chord` VALUES (628,'Am',3);
INSERT INTO `song_chord` VALUES (628,'B7',4);
INSERT INTO `song_chord` VALUES (628,'D',5);
INSERT INTO `song_chord` VALUES (629,'Dm',0);
INSERT INTO `song_chord` VALUES (629,'A7',1);
INSERT INTO `song_chord` VALUES (630,'D',0);
INSERT INTO `song_chord` VALUES (630,'F#',1);
INSERT INTO `song_chord` VALUES (630,'Bm',2);
INSERT INTO `song_chord` VALUES (630,'G',3);
INSERT INTO `song_chord` VALUES (631,'D',0);
INSERT INTO `song_chord` VALUES (631,'Bm',1);
INSERT INTO `song_chord` VALUES (631,'G',2);
INSERT INTO `song_chord` VALUES (631,'E',3);
INSERT INTO `song_chord` VALUES (631,'A',4);
INSERT INTO `song_chord` VALUES (632,'Em',0);
INSERT INTO `song_chord` VALUES (632,'B7',1);
INSERT INTO `song_chord` VALUES (632,'C',2);
INSERT INTO `song_chord` VALUES (632,'Am',3);
INSERT INTO `song_chord` VALUES (633,'Am',0);
INSERT INTO `song_chord` VALUES (633,'G',1);
INSERT INTO `song_chord` VALUES (633,'E',2);
INSERT INTO `song_chord` VALUES (633,'Dm',3);
INSERT INTO `song_chord` VALUES (633,'F',4);
INSERT INTO `song_chord` VALUES (633,'C',5);
INSERT INTO `song_chord` VALUES (634,'Am',0);
INSERT INTO `song_chord` VALUES (634,'F',1);
INSERT INTO `song_chord` VALUES (634,'Dm',2);
INSERT INTO `song_chord` VALUES (634,'E',3);
INSERT INTO `song_chord` VALUES (635,'Am',0);
INSERT INTO `song_chord` VALUES (635,'F7',1);
INSERT INTO `song_chord` VALUES (635,'Dm',2);
INSERT INTO `song_chord` VALUES (635,'E',3);
INSERT INTO `song_chord` VALUES (635,'A7',4);
INSERT INTO `song_chord` VALUES (635,'A#7',5);
INSERT INTO `song_chord` VALUES (635,'Gm',6);
INSERT INTO `song_chord` VALUES (635,'C',7);
INSERT INTO `song_chord` VALUES (636,'Em',0);
INSERT INTO `song_chord` VALUES (636,'Am',1);
INSERT INTO `song_chord` VALUES (636,'B7',2);
INSERT INTO `song_chord` VALUES (636,'G',3);
INSERT INTO `song_chord` VALUES (636,'D',4);
INSERT INTO `song_chord` VALUES (637,'Am',0);
INSERT INTO `song_chord` VALUES (637,'G',1);
INSERT INTO `song_chord` VALUES (637,'F',2);
INSERT INTO `song_chord` VALUES (637,'E7',3);
INSERT INTO `song_chord` VALUES (637,'Em',4);
INSERT INTO `song_chord` VALUES (638,'Dm',0);
INSERT INTO `song_chord` VALUES (638,'A7',1);
INSERT INTO `song_chord` VALUES (638,'Gm',2);
INSERT INTO `song_chord` VALUES (638,'A#',3);
INSERT INTO `song_chord` VALUES (638,'F',4);
INSERT INTO `song_chord` VALUES (638,'Am',5);
INSERT INTO `song_chord` VALUES (638,'C',6);
INSERT INTO `song_chord` VALUES (639,'C',0);
INSERT INTO `song_chord` VALUES (639,'D',1);
INSERT INTO `song_chord` VALUES (639,'Cm',2);
INSERT INTO `song_chord` VALUES (639,'Gm',3);
INSERT INTO `song_chord` VALUES (639,'D7',4);
INSERT INTO `song_chord` VALUES (640,'Am',0);
INSERT INTO `song_chord` VALUES (640,'E7',1);
INSERT INTO `song_chord` VALUES (640,'Dm',2);
INSERT INTO `song_chord` VALUES (640,'C',3);
INSERT INTO `song_chord` VALUES (640,'F',4);
INSERT INTO `song_chord` VALUES (641,'Am',0);
INSERT INTO `song_chord` VALUES (641,'Dm',1);
INSERT INTO `song_chord` VALUES (641,'E7',2);
INSERT INTO `song_chord` VALUES (641,'G',3);
INSERT INTO `song_chord` VALUES (641,'C',4);
INSERT INTO `song_chord` VALUES (641,'F',5);
INSERT INTO `song_chord` VALUES (641,'E',6);
INSERT INTO `song_chord` VALUES (642,'D',0);
INSERT INTO `song_chord` VALUES (642,'F#m',1);
INSERT INTO `song_chord` VALUES (642,'Bm',2);
INSERT INTO `song_chord` VALUES (642,'Em',3);
INSERT INTO `song_chord` VALUES (642,'A',4);
INSERT INTO `song_chord` VALUES (642,'F#',5);
INSERT INTO `song_chord` VALUES (642,'A7',6);
INSERT INTO `song_chord` VALUES (643,'Em',0);
INSERT INTO `song_chord` VALUES (643,'C',1);
INSERT INTO `song_chord` VALUES (643,'D7',2);
INSERT INTO `song_chord` VALUES (643,'G',3);
INSERT INTO `song_chord` VALUES (643,'B7',4);
INSERT INTO `song_chord` VALUES (644,'A7',0);
INSERT INTO `song_chord` VALUES (644,'D',1);
INSERT INTO `song_chord` VALUES (644,'F#m',2);
INSERT INTO `song_chord` VALUES (644,'G',3);
INSERT INTO `song_chord` VALUES (644,'F#',4);
INSERT INTO `song_chord` VALUES (644,'Bm',5);
INSERT INTO `song_chord` VALUES (644,'Em',6);
INSERT INTO `song_chord` VALUES (645,'Am',0);
INSERT INTO `song_chord` VALUES (645,'F',1);
INSERT INTO `song_chord` VALUES (645,'E7',2);
INSERT INTO `song_chord` VALUES (645,'G',3);
INSERT INTO `song_chord` VALUES (645,'C',4);
INSERT INTO `song_chord` VALUES (645,'D',5);
INSERT INTO `song_chord` VALUES (646,'D7',0);
INSERT INTO `song_chord` VALUES (646,'Em',1);
INSERT INTO `song_chord` VALUES (646,'F',2);
INSERT INTO `song_chord` VALUES (646,'E',3);
INSERT INTO `song_chord` VALUES (646,'Am',4);
INSERT INTO `song_chord` VALUES (647,'E',0);
INSERT INTO `song_chord` VALUES (647,'F',1);
INSERT INTO `song_chord` VALUES (647,'G',2);
INSERT INTO `song_chord` VALUES (647,'Am',3);
INSERT INTO `song_chord` VALUES (647,'C',4);
INSERT INTO `song_chord` VALUES (648,'Bm',0);
INSERT INTO `song_chord` VALUES (648,'C',1);
INSERT INTO `song_chord` VALUES (648,'D',2);
INSERT INTO `song_chord` VALUES (648,'F#m',3);
INSERT INTO `song_chord` VALUES (648,'G',4);
INSERT INTO `song_chord` VALUES (648,'F#',5);
INSERT INTO `song_chord` VALUES (649,'Em',0);
INSERT INTO `song_chord` VALUES (649,'Am',1);
INSERT INTO `song_chord` VALUES (649,'B7',2);
INSERT INTO `song_chord` VALUES (649,'D',3);
INSERT INTO `song_chord` VALUES (650,'Em',0);
INSERT INTO `song_chord` VALUES (650,'D',1);
INSERT INTO `song_chord` VALUES (650,'G',2);
INSERT INTO `song_chord` VALUES (650,'A',3);
INSERT INTO `song_chord` VALUES (650,'B7',4);
INSERT INTO `song_chord` VALUES (650,'Am',5);
INSERT INTO `song_chord` VALUES (651,'Dm',0);
INSERT INTO `song_chord` VALUES (651,'Am',1);
INSERT INTO `song_chord` VALUES (651,'Gm',2);
INSERT INTO `song_chord` VALUES (651,'A7',3);
INSERT INTO `song_chord` VALUES (652,'C',0);
INSERT INTO `song_chord` VALUES (652,'Am',1);
INSERT INTO `song_chord` VALUES (652,'Dm',2);
INSERT INTO `song_chord` VALUES (652,'G',3);
INSERT INTO `song_chord` VALUES (652,'A7',4);
INSERT INTO `song_chord` VALUES (652,'F',5);
INSERT INTO `song_chord` VALUES (652,'E',6);
INSERT INTO `song_chord` VALUES (653,'D',0);
INSERT INTO `song_chord` VALUES (653,'Em',1);
INSERT INTO `song_chord` VALUES (653,'A7',2);
INSERT INTO `song_chord` VALUES (653,'F#',3);
INSERT INTO `song_chord` VALUES (653,'Bm',4);
INSERT INTO `song_chord` VALUES (653,'A',5);
INSERT INTO `song_chord` VALUES (653,'G',6);
INSERT INTO `song_chord` VALUES (654,'Dm',0);
INSERT INTO `song_chord` VALUES (654,'Gm',1);
INSERT INTO `song_chord` VALUES (654,'A',2);
INSERT INTO `song_chord` VALUES (654,'C7',3);
INSERT INTO `song_chord` VALUES (654,'F',4);
INSERT INTO `song_chord` VALUES (654,'A#',5);
INSERT INTO `song_chord` VALUES (654,'Am',6);
INSERT INTO `song_chord` VALUES (655,'Em',0);
INSERT INTO `song_chord` VALUES (655,'Am',1);
INSERT INTO `song_chord` VALUES (655,'B7',2);
INSERT INTO `song_chord` VALUES (656,'Am',0);
INSERT INTO `song_chord` VALUES (656,'G',1);
INSERT INTO `song_chord` VALUES (656,'F',2);
INSERT INTO `song_chord` VALUES (656,'Dm',3);
INSERT INTO `song_chord` VALUES (656,'G7',4);
INSERT INTO `song_chord` VALUES (656,'E',5);
INSERT INTO `song_chord` VALUES (656,'E7',6);
INSERT INTO `song_chord` VALUES (656,'F7',7);
INSERT INTO `song_chord` VALUES (657,'Em',0);
INSERT INTO `song_chord` VALUES (657,'Am',1);
INSERT INTO `song_chord` VALUES (657,'B7',2);
INSERT INTO `song_chord` VALUES (658,'E',0);
INSERT INTO `song_chord` VALUES (658,'Am',1);
INSERT INTO `song_chord` VALUES (658,'Dm',2);
INSERT INTO `song_chord` VALUES (658,'F',3);
INSERT INTO `song_chord` VALUES (659,'Am',0);
INSERT INTO `song_chord` VALUES (659,'G',1);
INSERT INTO `song_chord` VALUES (659,'F',2);
INSERT INTO `song_chord` VALUES (659,'E',3);
INSERT INTO `song_chord` VALUES (659,'Dm',4);
INSERT INTO `song_chord` VALUES (660,'E',0);
INSERT INTO `song_chord` VALUES (660,'G#',1);
INSERT INTO `song_chord` VALUES (660,'C#m',2);
INSERT INTO `song_chord` VALUES (660,'F#m',3);
INSERT INTO `song_chord` VALUES (660,'B7',4);
INSERT INTO `song_chord` VALUES (660,'A',5);
INSERT INTO `song_chord` VALUES (661,'Dm',0);
INSERT INTO `song_chord` VALUES (661,'Gm',1);
INSERT INTO `song_chord` VALUES (661,'A',2);
INSERT INTO `song_chord` VALUES (661,'A#',3);
INSERT INTO `song_chord` VALUES (662,'Am',0);
INSERT INTO `song_chord` VALUES (662,'F',1);
INSERT INTO `song_chord` VALUES (662,'E',2);
INSERT INTO `song_chord` VALUES (662,'G',3);
INSERT INTO `song_chord` VALUES (663,'Am',0);
INSERT INTO `song_chord` VALUES (663,'Dm9',1);
INSERT INTO `song_chord` VALUES (663,'E',2);
INSERT INTO `song_chord` VALUES (664,'Em',0);
INSERT INTO `song_chord` VALUES (664,'Am',1);
INSERT INTO `song_chord` VALUES (664,'B7',2);
INSERT INTO `song_chord` VALUES (664,'G',3);
INSERT INTO `song_chord` VALUES (664,'E',4);
INSERT INTO `song_chord` VALUES (664,'C',5);
INSERT INTO `song_chord` VALUES (665,'Am',0);
INSERT INTO `song_chord` VALUES (665,'F',1);
INSERT INTO `song_chord` VALUES (665,'E7',2);
INSERT INTO `song_chord` VALUES (665,'Dm',3);
INSERT INTO `song_chord` VALUES (666,'C',0);
INSERT INTO `song_chord` VALUES (666,'F',1);
INSERT INTO `song_chord` VALUES (666,'G',2);
INSERT INTO `song_chord` VALUES (666,'Am',3);
INSERT INTO `song_chord` VALUES (667,'D',0);
INSERT INTO `song_chord` VALUES (667,'F#',1);
INSERT INTO `song_chord` VALUES (667,'Bm',2);
INSERT INTO `song_chord` VALUES (667,'A',3);
INSERT INTO `song_chord` VALUES (668,'Am',0);
INSERT INTO `song_chord` VALUES (668,'G',1);
INSERT INTO `song_chord` VALUES (668,'F',2);
INSERT INTO `song_chord` VALUES (668,'E',3);
INSERT INTO `song_chord` VALUES (669,'Am',0);
INSERT INTO `song_chord` VALUES (669,'F',1);
INSERT INTO `song_chord` VALUES (669,'Dm',2);
INSERT INTO `song_chord` VALUES (669,'E7',3);
INSERT INTO `song_chord` VALUES (669,'Em',4);
INSERT INTO `song_chord` VALUES (669,'C',5);
INSERT INTO `song_chord` VALUES (669,'G',6);
INSERT INTO `song_chord` VALUES (670,'D',0);
INSERT INTO `song_chord` VALUES (670,'Bm',1);
INSERT INTO `song_chord` VALUES (670,'A',2);
INSERT INTO `song_chord` VALUES (670,'G',3);
INSERT INTO `song_chord` VALUES (671,'Dm',0);
INSERT INTO `song_chord` VALUES (671,'A#',1);
INSERT INTO `song_chord` VALUES (671,'A',2);
INSERT INTO `song_chord` VALUES (671,'A7',3);
INSERT INTO `song_chord` VALUES (672,'Em',0);
INSERT INTO `song_chord` VALUES (672,'D',1);
INSERT INTO `song_chord` VALUES (672,'C',2);
INSERT INTO `song_chord` VALUES (672,'G',3);
INSERT INTO `song_chord` VALUES (672,'A',4);
INSERT INTO `song_chord` VALUES (672,'Am',5);
INSERT INTO `song_chord` VALUES (673,'C',0);
INSERT INTO `song_chord` VALUES (673,'E',1);
INSERT INTO `song_chord` VALUES (673,'Am',2);
INSERT INTO `song_chord` VALUES (673,'Dm',3);
INSERT INTO `song_chord` VALUES (673,'E7',4);
INSERT INTO `song_chord` VALUES (673,'G',5);
INSERT INTO `song_chord` VALUES (673,'F',6);
INSERT INTO `song_chord` VALUES (674,'Am',0);
INSERT INTO `song_chord` VALUES (674,'Dm',1);
INSERT INTO `song_chord` VALUES (674,'F',2);
INSERT INTO `song_chord` VALUES (674,'E',3);
INSERT INTO `song_chord` VALUES (674,'A',4);
INSERT INTO `song_chord` VALUES (674,'F#m',5);
INSERT INTO `song_chord` VALUES (675,'Em',0);
INSERT INTO `song_chord` VALUES (675,'Am',1);
INSERT INTO `song_chord` VALUES (675,'C',2);
INSERT INTO `song_chord` VALUES (675,'B7',3);
INSERT INTO `song_chord` VALUES (676,'C',0);
INSERT INTO `song_chord` VALUES (676,'Am',1);
INSERT INTO `song_chord` VALUES (676,'G7',2);
INSERT INTO `song_chord` VALUES (676,'F',3);
INSERT INTO `song_chord` VALUES (676,'G',4);
INSERT INTO `song_chord` VALUES (677,'Dm',0);
INSERT INTO `song_chord` VALUES (677,'Gm',1);
INSERT INTO `song_chord` VALUES (677,'A7',2);
INSERT INTO `song_chord` VALUES (677,'F',3);
INSERT INTO `song_chord` VALUES (677,'Am',4);
INSERT INTO `song_chord` VALUES (678,'Am',0);
INSERT INTO `song_chord` VALUES (678,'F',1);
INSERT INTO `song_chord` VALUES (678,'E',2);
INSERT INTO `song_chord` VALUES (678,'G',3);
INSERT INTO `song_chord` VALUES (679,'C',0);
INSERT INTO `song_chord` VALUES (679,'Am',1);
INSERT INTO `song_chord` VALUES (679,'F',2);
INSERT INTO `song_chord` VALUES (679,'E',3);
INSERT INTO `song_chord` VALUES (679,'Dm',4);
INSERT INTO `song_chord` VALUES (679,'G',5);
INSERT INTO `song_chord` VALUES (680,'Em',0);
INSERT INTO `song_chord` VALUES (680,'B7',1);
INSERT INTO `song_chord` VALUES (680,'Am',2);
INSERT INTO `song_chord` VALUES (680,'C',3);
INSERT INTO `song_chord` VALUES (681,'Am',0);
INSERT INTO `song_chord` VALUES (681,'F',1);
INSERT INTO `song_chord` VALUES (681,'E',2);
INSERT INTO `song_chord` VALUES (681,'B7',3);
INSERT INTO `song_chord` VALUES (681,'Dm',4);
INSERT INTO `song_chord` VALUES (681,'G',5);
INSERT INTO `song_chord` VALUES (682,'E',0);
INSERT INTO `song_chord` VALUES (682,'C#m',1);
INSERT INTO `song_chord` VALUES (682,'G#',2);
INSERT INTO `song_chord` VALUES (682,'A',3);
INSERT INTO `song_chord` VALUES (682,'B7',4);
INSERT INTO `song_chord` VALUES (683,'C#dim',0);
INSERT INTO `song_chord` VALUES (683,'A#7',1);
INSERT INTO `song_chord` VALUES (683,'A7',2);
INSERT INTO `song_chord` VALUES (683,'Dm',3);
INSERT INTO `song_chord` VALUES (683,'A',4);
INSERT INTO `song_chord` VALUES (683,'Gm',5);
INSERT INTO `song_chord` VALUES (684,'Am',0);
INSERT INTO `song_chord` VALUES (684,'G',1);
INSERT INTO `song_chord` VALUES (684,'F',2);
INSERT INTO `song_chord` VALUES (684,'E',3);
INSERT INTO `song_chord` VALUES (685,'D',0);
INSERT INTO `song_chord` VALUES (685,'Bm',1);
INSERT INTO `song_chord` VALUES (685,'G',2);
INSERT INTO `song_chord` VALUES (685,'E',3);
INSERT INTO `song_chord` VALUES (685,'A',4);
INSERT INTO `song_chord` VALUES (685,'F#',5);
INSERT INTO `song_chord` VALUES (686,'Dm',0);
INSERT INTO `song_chord` VALUES (686,'A7',1);
INSERT INTO `song_chord` VALUES (686,'A#',2);
INSERT INTO `song_chord` VALUES (687,'Am',0);
INSERT INTO `song_chord` VALUES (687,'E',1);
INSERT INTO `song_chord` VALUES (687,'F',2);
INSERT INTO `song_chord` VALUES (687,'Dm',3);
INSERT INTO `song_chord` VALUES (687,'Em',4);
INSERT INTO `song_chord` VALUES (687,'G',5);
INSERT INTO `song_chord` VALUES (687,'B',6);
INSERT INTO `song_chord` VALUES (687,'D',7);
INSERT INTO `song_chord` VALUES (687,'A',8);
INSERT INTO `song_chord` VALUES (687,'F#',9);
INSERT INTO `song_chord` VALUES (687,'Bm',10);
INSERT INTO `song_chord` VALUES (688,'Am',0);
INSERT INTO `song_chord` VALUES (688,'C',1);
INSERT INTO `song_chord` VALUES (688,'E',2);
INSERT INTO `song_chord` VALUES (688,'F',3);
INSERT INTO `song_chord` VALUES (688,'Dm',4);
INSERT INTO `song_chord` VALUES (688,'Dm9',5);
INSERT INTO `song_chord` VALUES (688,'G',6);
INSERT INTO `song_chord` VALUES (688,'A7',7);
INSERT INTO `song_chord` VALUES (689,'C',0);
INSERT INTO `song_chord` VALUES (689,'F',1);
INSERT INTO `song_chord` VALUES (689,'G',2);
INSERT INTO `song_chord` VALUES (689,'Fm',3);
INSERT INTO `song_chord` VALUES (689,'Cm',4);
INSERT INTO `song_chord` VALUES (689,'A#',5);
INSERT INTO `song_chord` VALUES (689,'G#',6);
INSERT INTO `song_chord` VALUES (690,'Bm',0);
INSERT INTO `song_chord` VALUES (690,'A',1);
INSERT INTO `song_chord` VALUES (690,'F#',2);
INSERT INTO `song_chord` VALUES (690,'G',3);
INSERT INTO `song_chord` VALUES (690,'A7',4);
INSERT INTO `song_chord` VALUES (690,'D',5);
INSERT INTO `song_chord` VALUES (691,'Am',0);
INSERT INTO `song_chord` VALUES (691,'E7',1);
INSERT INTO `song_chord` VALUES (691,'F',2);
INSERT INTO `song_chord` VALUES (691,'E',3);
INSERT INTO `song_chord` VALUES (691,'C',4);
INSERT INTO `song_chord` VALUES (691,'G',5);
INSERT INTO `song_chord` VALUES (692,'Am',0);
INSERT INTO `song_chord` VALUES (692,'Dm',1);
INSERT INTO `song_chord` VALUES (692,'E',2);
INSERT INTO `song_chord` VALUES (692,'F',3);
INSERT INTO `song_chord` VALUES (693,'D',0);
INSERT INTO `song_chord` VALUES (693,'G',1);
INSERT INTO `song_chord` VALUES (693,'A',2);
INSERT INTO `song_chord` VALUES (693,'Bm',3);
INSERT INTO `song_chord` VALUES (693,'F#',4);
INSERT INTO `song_chord` VALUES (693,'E',5);
INSERT INTO `song_chord` VALUES (693,'B',6);
INSERT INTO `song_chord` VALUES (693,'C#',7);
INSERT INTO `song_chord` VALUES (694,'Am',0);
INSERT INTO `song_chord` VALUES (694,'Dm',1);
INSERT INTO `song_chord` VALUES (694,'E',2);
INSERT INTO `song_chord` VALUES (694,'F',3);
INSERT INTO `song_chord` VALUES (694,'A7',4);
INSERT INTO `song_chord` VALUES (695,'Dm',0);
INSERT INTO `song_chord` VALUES (695,'Gm',1);
INSERT INTO `song_chord` VALUES (695,'A7',2);
INSERT INTO `song_chord` VALUES (695,'C',3);
INSERT INTO `song_chord` VALUES (695,'F',4);
INSERT INTO `song_chord` VALUES (695,'A#',5);
INSERT INTO `song_chord` VALUES (696,'Em',0);
INSERT INTO `song_chord` VALUES (696,'F#',1);
INSERT INTO `song_chord` VALUES (696,'G',2);
INSERT INTO `song_chord` VALUES (696,'Bm',3);
INSERT INTO `song_chord` VALUES (697,'Dm',0);
INSERT INTO `song_chord` VALUES (697,'A#',1);
INSERT INTO `song_chord` VALUES (697,'A',2);
INSERT INTO `song_chord` VALUES (698,'Dm',0);
INSERT INTO `song_chord` VALUES (698,'Gm',1);
INSERT INTO `song_chord` VALUES (698,'A',2);
INSERT INTO `song_chord` VALUES (698,'A#',3);
INSERT INTO `song_chord` VALUES (698,'C',4);
INSERT INTO `song_chord` VALUES (699,'Em',0);
INSERT INTO `song_chord` VALUES (699,'B7',1);
INSERT INTO `song_chord` VALUES (699,'Am',2);
INSERT INTO `song_chord` VALUES (699,'C',3);
INSERT INTO `song_chord` VALUES (700,'Am',0);
INSERT INTO `song_chord` VALUES (700,'Dm',1);
INSERT INTO `song_chord` VALUES (700,'E',2);
INSERT INTO `song_chord` VALUES (700,'F',3);
INSERT INTO `song_chord` VALUES (700,'A7',4);
INSERT INTO `song_chord` VALUES (701,'Dm',0);
INSERT INTO `song_chord` VALUES (701,'A7',1);
INSERT INTO `song_chord` VALUES (701,'Gm',2);
INSERT INTO `song_chord` VALUES (701,'A#',3);
INSERT INTO `song_chord` VALUES (701,'A#7',4);
INSERT INTO `song_chord` VALUES (702,'Am',0);
INSERT INTO `song_chord` VALUES (702,'Dm',1);
INSERT INTO `song_chord` VALUES (702,'E7',2);
INSERT INTO `song_chord` VALUES (702,'F',3);
INSERT INTO `song_chord` VALUES (702,'E',4);
INSERT INTO `song_chord` VALUES (702,'G',5);
INSERT INTO `song_chord` VALUES (703,'Am',0);
INSERT INTO `song_chord` VALUES (703,'E',1);
INSERT INTO `song_chord` VALUES (703,'Dm',2);
INSERT INTO `song_chord` VALUES (703,'F',3);
INSERT INTO `song_chord` VALUES (704,'Dm',0);
INSERT INTO `song_chord` VALUES (704,'A7',1);
INSERT INTO `song_chord` VALUES (704,'Gm',2);
INSERT INTO `song_chord` VALUES (704,'A#',3);
INSERT INTO `song_chord` VALUES (705,'Am',0);
INSERT INTO `song_chord` VALUES (705,'A7',1);
INSERT INTO `song_chord` VALUES (705,'Dm9',2);
INSERT INTO `song_chord` VALUES (705,'F7M',3);
INSERT INTO `song_chord` VALUES (705,'E',4);
INSERT INTO `song_chord` VALUES (705,'Dm',5);
INSERT INTO `song_chord` VALUES (706,'Am',0);
INSERT INTO `song_chord` VALUES (706,'Dm',1);
INSERT INTO `song_chord` VALUES (706,'E',2);
INSERT INTO `song_chord` VALUES (706,'G',3);
INSERT INTO `song_chord` VALUES (706,'F',4);
INSERT INTO `song_chord` VALUES (707,'Dm',0);
INSERT INTO `song_chord` VALUES (707,'Gm',1);
INSERT INTO `song_chord` VALUES (707,'A',2);
INSERT INTO `song_chord` VALUES (707,'F',3);
INSERT INTO `song_chord` VALUES (707,'G',4);
INSERT INTO `song_chord` VALUES (708,'Am',0);
INSERT INTO `song_chord` VALUES (708,'Dm9',1);
INSERT INTO `song_chord` VALUES (708,'E',2);
INSERT INTO `song_chord` VALUES (708,'Dm',3);
INSERT INTO `song_chord` VALUES (708,'E7',4);
INSERT INTO `song_chord` VALUES (709,'E',0);
INSERT INTO `song_chord` VALUES (709,'G',1);
INSERT INTO `song_chord` VALUES (709,'A',2);
INSERT INTO `song_chord` VALUES (709,'B7',3);
INSERT INTO `song_chord` VALUES (709,'Em',4);
INSERT INTO `song_chord` VALUES (709,'Am',5);
INSERT INTO `song_chord` VALUES (709,'Bm',6);
INSERT INTO `song_chord` VALUES (710,'A',0);
INSERT INTO `song_chord` VALUES (710,'A#',1);
INSERT INTO `song_chord` VALUES (710,'Dm',2);
INSERT INTO `song_chord` VALUES (710,'A7',3);
INSERT INTO `song_chord` VALUES (711,'C',0);
INSERT INTO `song_chord` VALUES (711,'E',1);
INSERT INTO `song_chord` VALUES (711,'Am',2);
INSERT INTO `song_chord` VALUES (711,'G7',3);
INSERT INTO `song_chord` VALUES (712,'E',0);
INSERT INTO `song_chord` VALUES (712,'A',1);
INSERT INTO `song_chord` VALUES (712,'D',2);
INSERT INTO `song_chord` VALUES (713,'C',0);
INSERT INTO `song_chord` VALUES (713,'Am',1);
INSERT INTO `song_chord` VALUES (713,'G7',2);
INSERT INTO `song_chord` VALUES (713,'F',3);
INSERT INTO `song_chord` VALUES (713,'E',4);
INSERT INTO `song_chord` VALUES (713,'G',5);
INSERT INTO `song_chord` VALUES (714,'D',0);
INSERT INTO `song_chord` VALUES (714,'F#m',1);
INSERT INTO `song_chord` VALUES (714,'G',2);
INSERT INTO `song_chord` VALUES (714,'Em6',3);
INSERT INTO `song_chord` VALUES (714,'A7',4);
INSERT INTO `song_chord` VALUES (714,'Em',5);
INSERT INTO `song_chord` VALUES (715,'Bm',0);
INSERT INTO `song_chord` VALUES (715,'G',1);
INSERT INTO `song_chord` VALUES (715,'Em',2);
INSERT INTO `song_chord` VALUES (715,'F#',3);
INSERT INTO `song_chord` VALUES (716,'Am',0);
INSERT INTO `song_chord` VALUES (716,'E',1);
INSERT INTO `song_chord` VALUES (717,'C',0);
INSERT INTO `song_chord` VALUES (717,'E',1);
INSERT INTO `song_chord` VALUES (717,'Am',2);
INSERT INTO `song_chord` VALUES (717,'F',3);
INSERT INTO `song_chord` VALUES (717,'Dm',4);
INSERT INTO `song_chord` VALUES (718,'C',0);
INSERT INTO `song_chord` VALUES (718,'E',1);
INSERT INTO `song_chord` VALUES (718,'F',2);
INSERT INTO `song_chord` VALUES (719,'Em',0);
INSERT INTO `song_chord` VALUES (719,'Am',1);
INSERT INTO `song_chord` VALUES (719,'B7',2);
INSERT INTO `song_chord` VALUES (719,'D',3);
INSERT INTO `song_chord` VALUES (720,'Em',0);
INSERT INTO `song_chord` VALUES (720,'D',1);
INSERT INTO `song_chord` VALUES (720,'G',2);
INSERT INTO `song_chord` VALUES (720,'Bm',3);
INSERT INTO `song_chord` VALUES (721,'Dm',0);
INSERT INTO `song_chord` VALUES (721,'C',1);
INSERT INTO `song_chord` VALUES (721,'A',2);
INSERT INTO `song_chord` VALUES (721,'A#',3);
INSERT INTO `song_chord` VALUES (721,'A7',4);
INSERT INTO `song_chord` VALUES (722,'Am',0);
INSERT INTO `song_chord` VALUES (722,'G',1);
INSERT INTO `song_chord` VALUES (722,'F',2);
INSERT INTO `song_chord` VALUES (722,'E',3);
INSERT INTO `song_chord` VALUES (723,'G',0);
INSERT INTO `song_chord` VALUES (723,'F#',1);
INSERT INTO `song_chord` VALUES (723,'E',2);
INSERT INTO `song_chord` VALUES (723,'A',3);
INSERT INTO `song_chord` VALUES (723,'B',4);
INSERT INTO `song_chord` VALUES (723,'Em',5);
INSERT INTO `song_chord` VALUES (723,'D',6);
INSERT INTO `song_chord` VALUES (723,'C',7);
INSERT INTO `song_chord` VALUES (723,'B7',8);
INSERT INTO `song_chord` VALUES (724,'Am',0);
INSERT INTO `song_chord` VALUES (724,'E',1);
INSERT INTO `song_chord` VALUES (724,'Dm',2);
INSERT INTO `song_chord` VALUES (725,'Dm',0);
INSERT INTO `song_chord` VALUES (725,'Gm',1);
INSERT INTO `song_chord` VALUES (725,'A7',2);
INSERT INTO `song_chord` VALUES (726,'Dm',0);
INSERT INTO `song_chord` VALUES (726,'G',1);
INSERT INTO `song_chord` VALUES (726,'Gm',2);
INSERT INTO `song_chord` VALUES (726,'C',3);
INSERT INTO `song_chord` VALUES (726,'A7',4);
INSERT INTO `song_chord` VALUES (727,'G',0);
INSERT INTO `song_chord` VALUES (727,'Am',1);
INSERT INTO `song_chord` VALUES (727,'Dm',2);
INSERT INTO `song_chord` VALUES (727,'E',3);
INSERT INTO `song_chord` VALUES (727,'F',4);
INSERT INTO `song_chord` VALUES (728,'Am',0);
INSERT INTO `song_chord` VALUES (728,'E7',1);
INSERT INTO `song_chord` VALUES (729,'C7',0);
INSERT INTO `song_chord` VALUES (729,'F',1);
INSERT INTO `song_chord` VALUES (729,'A7',2);
INSERT INTO `song_chord` VALUES (729,'D7',3);
INSERT INTO `song_chord` VALUES (729,'G7',4);
INSERT INTO `song_chord` VALUES (730,'Em',0);
INSERT INTO `song_chord` VALUES (730,'G',1);
INSERT INTO `song_chord` VALUES (730,'B',2);
INSERT INTO `song_chord` VALUES (730,'C',3);
INSERT INTO `song_chord` VALUES (730,'Am',4);
INSERT INTO `song_chord` VALUES (730,'Am9',5);
INSERT INTO `song_chord` VALUES (730,'D',6);
INSERT INTO `song_chord` VALUES (730,'E7',7);
INSERT INTO `song_chord` VALUES (731,'Am',0);
INSERT INTO `song_chord` VALUES (731,'F',1);
INSERT INTO `song_chord` VALUES (731,'E',2);
INSERT INTO `song_chord` VALUES (731,'G',3);
INSERT INTO `song_chord` VALUES (732,'E',0);
INSERT INTO `song_chord` VALUES (732,'F#m',1);
INSERT INTO `song_chord` VALUES (732,'B7',2);
INSERT INTO `song_chord` VALUES (732,'G#',3);
INSERT INTO `song_chord` VALUES (732,'C#m',4);
INSERT INTO `song_chord` VALUES (732,'C#7',5);
INSERT INTO `song_chord` VALUES (732,'A',6);
INSERT INTO `song_chord` VALUES (732,'B',7);
INSERT INTO `song_chord` VALUES (732,'A#',8);
INSERT INTO `song_chord` VALUES (733,'Em',0);
INSERT INTO `song_chord` VALUES (733,'Am',1);
INSERT INTO `song_chord` VALUES (733,'B7',2);
INSERT INTO `song_chord` VALUES (733,'C',3);
INSERT INTO `song_chord` VALUES (733,'D7',4);
INSERT INTO `song_chord` VALUES (733,'G',5);
INSERT INTO `song_chord` VALUES (733,'Bm',6);
INSERT INTO `song_chord` VALUES (734,'Em',0);
INSERT INTO `song_chord` VALUES (734,'Am',1);
INSERT INTO `song_chord` VALUES (734,'B7',2);
INSERT INTO `song_chord` VALUES (734,'C',3);
INSERT INTO `song_chord` VALUES (735,'C',0);
INSERT INTO `song_chord` VALUES (735,'Em',1);
INSERT INTO `song_chord` VALUES (735,'Am',2);
INSERT INTO `song_chord` VALUES (735,'F',3);
INSERT INTO `song_chord` VALUES (735,'G',4);
INSERT INTO `song_chord` VALUES (736,'Am',0);
INSERT INTO `song_chord` VALUES (736,'Dm',1);
INSERT INTO `song_chord` VALUES (736,'G',2);
INSERT INTO `song_chord` VALUES (737,'Em',0);
INSERT INTO `song_chord` VALUES (737,'Am',1);
INSERT INTO `song_chord` VALUES (737,'D',2);
INSERT INTO `song_chord` VALUES (737,'C',3);
INSERT INTO `song_chord` VALUES (737,'B7',4);
INSERT INTO `song_chord` VALUES (738,'Am',0);
INSERT INTO `song_chord` VALUES (738,'F7',1);
INSERT INTO `song_chord` VALUES (738,'E',2);
INSERT INTO `song_chord` VALUES (738,'F',3);
INSERT INTO `song_chord` VALUES (738,'E7',4);
INSERT INTO `song_chord` VALUES (738,'G',5);
INSERT INTO `song_chord` VALUES (738,'Dm',6);
INSERT INTO `song_chord` VALUES (739,'Em',0);
INSERT INTO `song_chord` VALUES (739,'Am',1);
INSERT INTO `song_chord` VALUES (739,'B7',2);
INSERT INTO `song_chord` VALUES (740,'C',0);
INSERT INTO `song_chord` VALUES (740,'E',1);
INSERT INTO `song_chord` VALUES (740,'Dm9',2);
INSERT INTO `song_chord` VALUES (740,'G',3);
INSERT INTO `song_chord` VALUES (740,'F',4);
INSERT INTO `song_chord` VALUES (741,'E',0);
INSERT INTO `song_chord` VALUES (741,'G#',1);
INSERT INTO `song_chord` VALUES (741,'A',2);
INSERT INTO `song_chord` VALUES (741,'B7',3);
INSERT INTO `song_chord` VALUES (741,'C#m',4);
INSERT INTO `song_chord` VALUES (741,'B',5);
INSERT INTO `song_chord` VALUES (742,'Am',0);
INSERT INTO `song_chord` VALUES (742,'Dm9',1);
INSERT INTO `song_chord` VALUES (742,'F',2);
INSERT INTO `song_chord` VALUES (742,'E',3);
INSERT INTO `song_chord` VALUES (742,'C',4);
INSERT INTO `song_chord` VALUES (742,'Em',5);
INSERT INTO `song_chord` VALUES (743,'D',0);
INSERT INTO `song_chord` VALUES (743,'A',1);
INSERT INTO `song_chord` VALUES (743,'E7',2);
INSERT INTO `song_chord` VALUES (743,'A7',3);
INSERT INTO `song_chord` VALUES (744,'Em',0);
INSERT INTO `song_chord` VALUES (744,'Am',1);
INSERT INTO `song_chord` VALUES (744,'B7',2);
INSERT INTO `song_chord` VALUES (745,'Am',0);
INSERT INTO `song_chord` VALUES (745,'G',1);
INSERT INTO `song_chord` VALUES (745,'E',2);
INSERT INTO `song_chord` VALUES (745,'F',3);
INSERT INTO `song_chord` VALUES (746,'Am',0);
INSERT INTO `song_chord` VALUES (746,'Dm',1);
INSERT INTO `song_chord` VALUES (746,'E',2);
INSERT INTO `song_chord` VALUES (746,'F',3);
INSERT INTO `song_chord` VALUES (746,'Dm9',4);
INSERT INTO `song_chord` VALUES (747,'Am',0);
INSERT INTO `song_chord` VALUES (747,'Dm',1);
INSERT INTO `song_chord` VALUES (747,'E',2);
INSERT INTO `song_chord` VALUES (748,'Em',0);
INSERT INTO `song_chord` VALUES (748,'D',1);
INSERT INTO `song_chord` VALUES (748,'C',2);
INSERT INTO `song_chord` VALUES (748,'B7',3);
INSERT INTO `song_chord` VALUES (749,'Am',0);
INSERT INTO `song_chord` VALUES (749,'Em',1);
INSERT INTO `song_chord` VALUES (749,'F',2);
INSERT INTO `song_chord` VALUES (749,'E7',3);
INSERT INTO `song_chord` VALUES (749,'E',4);
INSERT INTO `song_chord` VALUES (750,'Am',0);
INSERT INTO `song_chord` VALUES (750,'E',1);
INSERT INTO `song_chord` VALUES (750,'F',2);
INSERT INTO `song_chord` VALUES (750,'Dm',3);
INSERT INTO `song_chord` VALUES (750,'Em',4);
INSERT INTO `song_chord` VALUES (750,'G',5);
INSERT INTO `song_chord` VALUES (750,'B',6);
INSERT INTO `song_chord` VALUES (750,'D',7);
INSERT INTO `song_chord` VALUES (750,'A',8);
INSERT INTO `song_chord` VALUES (750,'F#',9);
INSERT INTO `song_chord` VALUES (750,'Bm',10);
INSERT INTO `song_chord` VALUES (751,'Am',0);
INSERT INTO `song_chord` VALUES (751,'F',1);
INSERT INTO `song_chord` VALUES (751,'E',2);
INSERT INTO `song_chord` VALUES (751,'C',3);
INSERT INTO `song_chord` VALUES (752,'Am',0);
INSERT INTO `song_chord` VALUES (752,'C',1);
INSERT INTO `song_chord` VALUES (752,'E',2);
INSERT INTO `song_chord` VALUES (752,'F',3);
INSERT INTO `song_chord` VALUES (752,'A7',4);
INSERT INTO `song_chord` VALUES (752,'Dm',5);
INSERT INTO `song_chord` VALUES (753,'Dm',0);
INSERT INTO `song_chord` VALUES (753,'A7',1);
INSERT INTO `song_chord` VALUES (753,'Gm',2);
INSERT INTO `song_chord` VALUES (753,'C',3);
INSERT INTO `song_chord` VALUES (753,'F',4);
INSERT INTO `song_chord` VALUES (753,'A#',5);
INSERT INTO `song_chord` VALUES (754,'D',0);
INSERT INTO `song_chord` VALUES (754,'F#',1);
INSERT INTO `song_chord` VALUES (754,'Bm',2);
INSERT INTO `song_chord` VALUES (754,'G',3);
INSERT INTO `song_chord` VALUES (754,'A7',4);
INSERT INTO `song_chord` VALUES (755,'E',0);
INSERT INTO `song_chord` VALUES (755,'A',1);
INSERT INTO `song_chord` VALUES (755,'F#',2);
INSERT INTO `song_chord` VALUES (755,'B7',3);
INSERT INTO `song_chord` VALUES (755,'C#m',4);
INSERT INTO `song_chord` VALUES (755,'G#',5);
INSERT INTO `song_chord` VALUES (755,'B',6);
INSERT INTO `song_chord` VALUES (756,'Dm',0);
INSERT INTO `song_chord` VALUES (756,'Gm',1);
INSERT INTO `song_chord` VALUES (756,'A7',2);
INSERT INTO `song_chord` VALUES (756,'A',3);
INSERT INTO `song_chord` VALUES (757,'G',0);
INSERT INTO `song_chord` VALUES (757,'Em',1);
INSERT INTO `song_chord` VALUES (757,'C',2);
INSERT INTO `song_chord` VALUES (757,'Am',3);
INSERT INTO `song_chord` VALUES (757,'B7',4);
INSERT INTO `song_chord` VALUES (757,'D',5);
INSERT INTO `song_chord` VALUES (758,'Am',0);
INSERT INTO `song_chord` VALUES (758,'Em',1);
INSERT INTO `song_chord` VALUES (758,'Dm9',2);
INSERT INTO `song_chord` VALUES (758,'F',3);
INSERT INTO `song_chord` VALUES (758,'E',4);
INSERT INTO `song_chord` VALUES (758,'Dm',5);
INSERT INTO `song_chord` VALUES (759,'Am',0);
INSERT INTO `song_chord` VALUES (759,'F',1);
INSERT INTO `song_chord` VALUES (759,'G',2);
INSERT INTO `song_chord` VALUES (759,'E',3);
INSERT INTO `song_chord` VALUES (760,'Am',0);
INSERT INTO `song_chord` VALUES (760,'F',1);
INSERT INTO `song_chord` VALUES (760,'G',2);
INSERT INTO `song_chord` VALUES (760,'E',3);
INSERT INTO `song_chord` VALUES (761,'Am',0);
INSERT INTO `song_chord` VALUES (761,'Dm',1);
INSERT INTO `song_chord` VALUES (761,'E7',2);
INSERT INTO `song_chord` VALUES (761,'F',3);
INSERT INTO `song_chord` VALUES (761,'E',4);
INSERT INTO `song_chord` VALUES (761,'A',5);
INSERT INTO `song_chord` VALUES (761,'F#m',6);
INSERT INTO `song_chord` VALUES (762,'Em',0);
INSERT INTO `song_chord` VALUES (762,'D',1);
INSERT INTO `song_chord` VALUES (762,'Am',2);
INSERT INTO `song_chord` VALUES (762,'B7',3);
INSERT INTO `song_chord` VALUES (762,'C',4);
INSERT INTO `song_chord` VALUES (762,'D7',5);
INSERT INTO `song_chord` VALUES (762,'Bm',6);
INSERT INTO `song_chord` VALUES (763,'Am',0);
INSERT INTO `song_chord` VALUES (763,'G',1);
INSERT INTO `song_chord` VALUES (763,'F',2);
INSERT INTO `song_chord` VALUES (763,'E',3);
INSERT INTO `song_chord` VALUES (764,'Em',0);
INSERT INTO `song_chord` VALUES (764,'Am',1);
INSERT INTO `song_chord` VALUES (764,'B7',2);
INSERT INTO `song_chord` VALUES (764,'D7',3);
INSERT INTO `song_chord` VALUES (764,'G',4);
INSERT INTO `song_chord` VALUES (765,'Em',0);
INSERT INTO `song_chord` VALUES (765,'B7',1);
INSERT INTO `song_chord` VALUES (765,'G',2);
INSERT INTO `song_chord` VALUES (765,'Am',3);
INSERT INTO `song_chord` VALUES (765,'D',4);
INSERT INTO `song_chord` VALUES (765,'C',5);
INSERT INTO `song_chord` VALUES (766,'Am',0);
INSERT INTO `song_chord` VALUES (766,'G',1);
INSERT INTO `song_chord` VALUES (767,'Am',0);
INSERT INTO `song_chord` VALUES (767,'E7',1);
INSERT INTO `song_chord` VALUES (767,'A7',2);
INSERT INTO `song_chord` VALUES (767,'Dm',3);
INSERT INTO `song_chord` VALUES (767,'E',4);
INSERT INTO `song_chord` VALUES (768,'Dm',0);
INSERT INTO `song_chord` VALUES (768,'A7',1);
INSERT INTO `song_chord` VALUES (768,'Gm',2);
INSERT INTO `song_chord` VALUES (769,'Am',0);
INSERT INTO `song_chord` VALUES (769,'E7',1);
INSERT INTO `song_chord` VALUES (769,'F',2);
INSERT INTO `song_chord` VALUES (770,'Am',0);
INSERT INTO `song_chord` VALUES (770,'G',1);
INSERT INTO `song_chord` VALUES (770,'E',2);
INSERT INTO `song_chord` VALUES (770,'Dm',3);
INSERT INTO `song_chord` VALUES (770,'F',4);
INSERT INTO `song_chord` VALUES (770,'C',5);
INSERT INTO `song_chord` VALUES (771,'Em',0);
INSERT INTO `song_chord` VALUES (771,'Am',1);
INSERT INTO `song_chord` VALUES (771,'B7',2);
INSERT INTO `song_chord` VALUES (771,'Am6',3);
INSERT INTO `song_chord` VALUES (772,'Em',0);
INSERT INTO `song_chord` VALUES (772,'B7',1);
INSERT INTO `song_chord` VALUES (773,'Am',0);
INSERT INTO `song_chord` VALUES (773,'G',1);
INSERT INTO `song_chord` VALUES (774,'E',0);
INSERT INTO `song_chord` VALUES (774,'C#m',1);
INSERT INTO `song_chord` VALUES (774,'G#',2);
INSERT INTO `song_chord` VALUES (774,'A',3);
INSERT INTO `song_chord` VALUES (774,'B7',4);
INSERT INTO `song_chord` VALUES (775,'E',0);
INSERT INTO `song_chord` VALUES (775,'G#m',1);
INSERT INTO `song_chord` VALUES (775,'A',2);
INSERT INTO `song_chord` VALUES (775,'B',3);
INSERT INTO `song_chord` VALUES (775,'B7',4);
INSERT INTO `song_chord` VALUES (776,'G',0);
INSERT INTO `song_chord` VALUES (776,'Am',1);
INSERT INTO `song_chord` VALUES (776,'C',2);
INSERT INTO `song_chord` VALUES (776,'B7',3);
INSERT INTO `song_chord` VALUES (777,'A',0);
INSERT INTO `song_chord` VALUES (777,'F#m',1);
INSERT INTO `song_chord` VALUES (778,'D',0);
INSERT INTO `song_chord` VALUES (778,'E',1);
INSERT INTO `song_chord` VALUES (778,'A',2);
INSERT INTO `song_chord` VALUES (778,'A7',3);
INSERT INTO `song_chord` VALUES (779,'Dm',0);
INSERT INTO `song_chord` VALUES (779,'Gm',1);
INSERT INTO `song_chord` VALUES (779,'A7',2);
INSERT INTO `song_chord` VALUES (779,'A#',3);
INSERT INTO `song_chord` VALUES (779,'C',4);
INSERT INTO `song_chord` VALUES (780,'B',0);
INSERT INTO `song_chord` VALUES (780,'Am',1);
INSERT INTO `song_chord` VALUES (780,'Em',2);
INSERT INTO `song_chord` VALUES (781,'E',0);
INSERT INTO `song_chord` VALUES (781,'Am',1);
INSERT INTO `song_chord` VALUES (781,'Dm',2);
INSERT INTO `song_chord` VALUES (781,'G7',3);
INSERT INTO `song_chord` VALUES (781,'E7',4);
INSERT INTO `song_chord` VALUES (781,'F7M',5);
INSERT INTO `song_chord` VALUES (781,'G',6);
INSERT INTO `song_chord` VALUES (782,'G',0);
INSERT INTO `song_chord` VALUES (782,'Em',1);
INSERT INTO `song_chord` VALUES (782,'C',2);
INSERT INTO `song_chord` VALUES (782,'A',3);
INSERT INTO `song_chord` VALUES (782,'D',4);
INSERT INTO `song_chord` VALUES (783,'D',0);
INSERT INTO `song_chord` VALUES (783,'F#m',1);
INSERT INTO `song_chord` VALUES (783,'G',2);
INSERT INTO `song_chord` VALUES (783,'Em6',3);
INSERT INTO `song_chord` VALUES (783,'A7',4);
INSERT INTO `song_chord` VALUES (783,'A',5);
INSERT INTO `song_chord` VALUES (784,'Em',0);
INSERT INTO `song_chord` VALUES (784,'F#',1);
INSERT INTO `song_chord` VALUES (784,'G',2);
INSERT INTO `song_chord` VALUES (784,'Bm',3);
INSERT INTO `song_chord` VALUES (785,'Dm',0);
INSERT INTO `song_chord` VALUES (785,'C',1);
INSERT INTO `song_chord` VALUES (785,'Gm',2);
INSERT INTO `song_chord` VALUES (786,'Em',0);
INSERT INTO `song_chord` VALUES (786,'C',1);
INSERT INTO `song_chord` VALUES (786,'Am',2);
INSERT INTO `song_chord` VALUES (786,'B7',3);
INSERT INTO `song_chord` VALUES (787,'Am',0);
INSERT INTO `song_chord` VALUES (787,'E',1);
INSERT INTO `song_chord` VALUES (788,'C',0);
INSERT INTO `song_chord` VALUES (788,'E',1);
INSERT INTO `song_chord` VALUES (788,'F',2);
INSERT INTO `song_chord` VALUES (788,'Dm',3);
INSERT INTO `song_chord` VALUES (788,'G',4);
INSERT INTO `song_chord` VALUES (788,'D7',5);
INSERT INTO `song_chord` VALUES (788,'C7',6);
INSERT INTO `song_chord` VALUES (788,'Gm',7);
INSERT INTO `song_chord` VALUES (788,'Cm',8);
INSERT INTO `song_chord` VALUES (789,'C',0);
INSERT INTO `song_chord` VALUES (789,'Am',1);
INSERT INTO `song_chord` VALUES (789,'G',2);
INSERT INTO `song_chord` VALUES (789,'F',3);
INSERT INTO `song_chord` VALUES (790,'Am',0);
INSERT INTO `song_chord` VALUES (790,'F',1);
INSERT INTO `song_chord` VALUES (790,'G',2);
INSERT INTO `song_chord` VALUES (790,'E',3);
INSERT INTO `song_chord` VALUES (790,'E7',4);
INSERT INTO `song_chord` VALUES (791,'E',0);
INSERT INTO `song_chord` VALUES (791,'F',1);
INSERT INTO `song_chord` VALUES (791,'G',2);
INSERT INTO `song_chord` VALUES (791,'C',3);
INSERT INTO `song_chord` VALUES (791,'Am',4);
INSERT INTO `song_chord` VALUES (792,'Em',0);
INSERT INTO `song_chord` VALUES (792,'C7',1);
INSERT INTO `song_chord` VALUES (792,'Am',2);
INSERT INTO `song_chord` VALUES (792,'B7',3);
INSERT INTO `song_chord` VALUES (792,'E7',4);
INSERT INTO `song_chord` VALUES (792,'F7',5);
INSERT INTO `song_chord` VALUES (792,'Dm',6);
INSERT INTO `song_chord` VALUES (792,'G',7);
INSERT INTO `song_chord` VALUES (793,'Am',0);
INSERT INTO `song_chord` VALUES (793,'Dm',1);
INSERT INTO `song_chord` VALUES (793,'F',2);
INSERT INTO `song_chord` VALUES (793,'E',3);
INSERT INTO `song_chord` VALUES (794,'Am',0);
INSERT INTO `song_chord` VALUES (794,'F',1);
INSERT INTO `song_chord` VALUES (794,'E',2);
INSERT INTO `song_chord` VALUES (794,'G',3);
INSERT INTO `song_chord` VALUES (795,'Am',0);
INSERT INTO `song_chord` VALUES (795,'E',1);
INSERT INTO `song_chord` VALUES (795,'C',2);
INSERT INTO `song_chord` VALUES (795,'F',3);
INSERT INTO `song_chord` VALUES (795,'Dm',4);
INSERT INTO `song_chord` VALUES (796,'Dm9',0);
INSERT INTO `song_chord` VALUES (796,'Am',1);
INSERT INTO `song_chord` VALUES (796,'Am6',2);
INSERT INTO `song_chord` VALUES (796,'D7',3);
INSERT INTO `song_chord` VALUES (796,'G',4);
INSERT INTO `song_chord` VALUES (796,'Bm',5);
INSERT INTO `song_chord` VALUES (796,'C',6);
INSERT INTO `song_chord` VALUES (796,'B7',7);
INSERT INTO `song_chord` VALUES (796,'B',8);
INSERT INTO `song_chord` VALUES (796,'Em',9);
INSERT INTO `song_chord` VALUES (796,'D',10);
INSERT INTO `song_chord` VALUES (797,'Dm',0);
INSERT INTO `song_chord` VALUES (797,'A7',1);
INSERT INTO `song_chord` VALUES (797,'Gm',2);
INSERT INTO `song_chord` VALUES (797,'A#',3);
INSERT INTO `song_chord` VALUES (797,'F',4);
INSERT INTO `song_chord` VALUES (797,'Am',5);
INSERT INTO `song_chord` VALUES (797,'C',6);
INSERT INTO `song_chord` VALUES (798,'C',0);
INSERT INTO `song_chord` VALUES (798,'Am',1);
INSERT INTO `song_chord` VALUES (798,'F',2);
INSERT INTO `song_chord` VALUES (798,'G',3);
INSERT INTO `song_chord` VALUES (798,'G#',4);
INSERT INTO `song_chord` VALUES (799,'G',0);
INSERT INTO `song_chord` VALUES (799,'Em',1);
INSERT INTO `song_chord` VALUES (799,'Am',2);
INSERT INTO `song_chord` VALUES (799,'Bm',3);
INSERT INTO `song_chord` VALUES (799,'A',4);
INSERT INTO `song_chord` VALUES (800,'Am',0);
INSERT INTO `song_chord` VALUES (800,'F',1);
INSERT INTO `song_chord` VALUES (800,'E',2);
INSERT INTO `song_chord` VALUES (800,'G',3);
INSERT INTO `song_chord` VALUES (801,'Dm',0);
INSERT INTO `song_chord` VALUES (801,'G',1);
INSERT INTO `song_chord` VALUES (801,'A#',2);
INSERT INTO `song_chord` VALUES (801,'C',3);
INSERT INTO `song_chord` VALUES (801,'Gm',4);
INSERT INTO `song_chord` VALUES (801,'A7',5);
INSERT INTO `song_chord` VALUES (802,'Em',0);
INSERT INTO `song_chord` VALUES (802,'G',1);
INSERT INTO `song_chord` VALUES (802,'B7',2);
INSERT INTO `song_chord` VALUES (802,'Am',3);
INSERT INTO `song_chord` VALUES (802,'C',4);
INSERT INTO `song_chord` VALUES (803,'Em',0);
INSERT INTO `song_chord` VALUES (803,'C',1);
INSERT INTO `song_chord` VALUES (803,'B7',2);
INSERT INTO `song_chord` VALUES (803,'Am',3);
INSERT INTO `song_chord` VALUES (804,'D',0);
INSERT INTO `song_chord` VALUES (804,'A7',1);
INSERT INTO `song_chord` VALUES (804,'F#',2);
INSERT INTO `song_chord` VALUES (804,'Bm',3);
INSERT INTO `song_chord` VALUES (804,'E',4);
INSERT INTO `song_chord` VALUES (804,'A',5);
INSERT INTO `song_chord` VALUES (804,'G',6);
INSERT INTO `song_chord` VALUES (805,'Am',0);
INSERT INTO `song_chord` VALUES (805,'E',1);
INSERT INTO `song_chord` VALUES (805,'G',2);
INSERT INTO `song_chord` VALUES (805,'F',3);
INSERT INTO `song_chord` VALUES (806,'Dm',0);
INSERT INTO `song_chord` VALUES (806,'C',1);
INSERT INTO `song_chord` VALUES (806,'A',2);
INSERT INTO `song_chord` VALUES (806,'G',3);
INSERT INTO `song_chord` VALUES (806,'F',4);
INSERT INTO `song_chord` VALUES (806,'A7',5);
INSERT INTO `song_chord` VALUES (806,'A#',6);
INSERT INTO `song_chord` VALUES (807,'Em',0);
INSERT INTO `song_chord` VALUES (807,'Am',1);
INSERT INTO `song_chord` VALUES (807,'B7',2);
INSERT INTO `song_chord` VALUES (808,'Em',0);
INSERT INTO `song_chord` VALUES (808,'Am',1);
INSERT INTO `song_chord` VALUES (808,'B7',2);
INSERT INTO `song_chord` VALUES (809,'Am',0);
INSERT INTO `song_chord` VALUES (809,'Dm',1);
INSERT INTO `song_chord` VALUES (809,'E',2);
INSERT INTO `song_chord` VALUES (810,'C',0);
INSERT INTO `song_chord` VALUES (810,'E',1);
INSERT INTO `song_chord` VALUES (810,'Am',2);
INSERT INTO `song_chord` VALUES (810,'F',3);
INSERT INTO `song_chord` VALUES (811,'E',0);
INSERT INTO `song_chord` VALUES (811,'F',1);
INSERT INTO `song_chord` VALUES (811,'Am',2);
INSERT INTO `song_chord` VALUES (811,'G',3);
INSERT INTO `song_chord` VALUES (811,'A',4);
INSERT INTO `song_chord` VALUES (811,'F#',5);
INSERT INTO `song_chord` VALUES (811,'Bm',6);
INSERT INTO `song_chord` VALUES (811,'D',7);
INSERT INTO `song_chord` VALUES (812,'D',0);
INSERT INTO `song_chord` VALUES (812,'Em',1);
INSERT INTO `song_chord` VALUES (812,'D7',2);
INSERT INTO `song_chord` VALUES (812,'G',3);
INSERT INTO `song_chord` VALUES (812,'A',4);
INSERT INTO `song_chord` VALUES (813,'Am',0);
INSERT INTO `song_chord` VALUES (813,'Dm',1);
INSERT INTO `song_chord` VALUES (813,'E',2);
INSERT INTO `song_chord` VALUES (813,'F',3);
INSERT INTO `song_chord` VALUES (813,'G',4);
INSERT INTO `song_chord` VALUES (813,'C',5);
INSERT INTO `song_chord` VALUES (814,'Am',0);
INSERT INTO `song_chord` VALUES (814,'Dm',1);
INSERT INTO `song_chord` VALUES (814,'F',2);
INSERT INTO `song_chord` VALUES (814,'E',3);
INSERT INTO `song_chord` VALUES (814,'G',4);
INSERT INTO `song_chord` VALUES (815,'Am',0);
INSERT INTO `song_chord` VALUES (815,'G',1);
INSERT INTO `song_chord` VALUES (815,'F',2);
INSERT INTO `song_chord` VALUES (815,'E',3);
INSERT INTO `song_chord` VALUES (816,'E',0);
INSERT INTO `song_chord` VALUES (816,'Am',1);
INSERT INTO `song_chord` VALUES (816,'Dm',2);
INSERT INTO `song_chord` VALUES (816,'F',3);
INSERT INTO `song_chord` VALUES (817,'D',0);
INSERT INTO `song_chord` VALUES (817,'F#m',1);
INSERT INTO `song_chord` VALUES (817,'G',2);
INSERT INTO `song_chord` VALUES (817,'A',3);
INSERT INTO `song_chord` VALUES (817,'A7',4);
INSERT INTO `song_chord` VALUES (818,'Am',0);
INSERT INTO `song_chord` VALUES (818,'G',1);
INSERT INTO `song_chord` VALUES (818,'F',2);
INSERT INTO `song_chord` VALUES (818,'E',3);
INSERT INTO `song_chord` VALUES (819,'Am',0);
INSERT INTO `song_chord` VALUES (819,'E7',1);
INSERT INTO `song_chord` VALUES (819,'F',2);
INSERT INTO `song_chord` VALUES (819,'E',3);
INSERT INTO `song_chord` VALUES (819,'Dm',4);
INSERT INTO `song_chord` VALUES (820,'Dm',0);
INSERT INTO `song_chord` VALUES (820,'Gm',1);
INSERT INTO `song_chord` VALUES (820,'D#',2);
INSERT INTO `song_chord` VALUES (821,'Am',0);
INSERT INTO `song_chord` VALUES (821,'G',1);
INSERT INTO `song_chord` VALUES (821,'F',2);
INSERT INTO `song_chord` VALUES (821,'E',3);
INSERT INTO `song_chord` VALUES (821,'E7',4);
INSERT INTO `song_chord` VALUES (821,'Dm',5);
INSERT INTO `song_chord` VALUES (822,'C',0);
INSERT INTO `song_chord` VALUES (822,'Dm',1);
INSERT INTO `song_chord` VALUES (822,'G7',2);
INSERT INTO `song_chord` VALUES (822,'Am',3);
INSERT INTO `song_chord` VALUES (822,'E',4);
INSERT INTO `song_chord` VALUES (823,'G',0);
INSERT INTO `song_chord` VALUES (823,'B7',1);
INSERT INTO `song_chord` VALUES (823,'Em',2);
INSERT INTO `song_chord` VALUES (823,'C',3);
INSERT INTO `song_chord` VALUES (823,'Am',4);
INSERT INTO `song_chord` VALUES (824,'D',0);
INSERT INTO `song_chord` VALUES (824,'Bm',1);
INSERT INTO `song_chord` VALUES (824,'G',2);
INSERT INTO `song_chord` VALUES (824,'A',3);
INSERT INTO `song_chord` VALUES (824,'F#',4);
INSERT INTO `song_chord` VALUES (825,'Em',0);
INSERT INTO `song_chord` VALUES (825,'B7',1);
INSERT INTO `song_chord` VALUES (825,'D',2);
INSERT INTO `song_chord` VALUES (825,'C',3);
INSERT INTO `song_chord` VALUES (825,'Am',4);
INSERT INTO `song_chord` VALUES (826,'Am',0);
INSERT INTO `song_chord` VALUES (826,'E7',1);
INSERT INTO `song_chord` VALUES (826,'F',2);
INSERT INTO `song_chord` VALUES (826,'E',3);
INSERT INTO `song_chord` VALUES (826,'C',4);
INSERT INTO `song_chord` VALUES (826,'G',5);
INSERT INTO `song_chord` VALUES (827,'Bm',0);
INSERT INTO `song_chord` VALUES (827,'A',1);
INSERT INTO `song_chord` VALUES (827,'F#',2);
INSERT INTO `song_chord` VALUES (827,'G',3);
INSERT INTO `song_chord` VALUES (827,'Em',4);
INSERT INTO `song_chord` VALUES (827,'A7',5);
INSERT INTO `song_chord` VALUES (827,'D',6);
INSERT INTO `song_chord` VALUES (828,'F#',0);
INSERT INTO `song_chord` VALUES (828,'G',1);
INSERT INTO `song_chord` VALUES (828,'Bm',2);
INSERT INTO `song_chord` VALUES (828,'A',3);
INSERT INTO `song_chord` VALUES (829,'Em',0);
INSERT INTO `song_chord` VALUES (829,'B7',1);
INSERT INTO `song_chord` VALUES (829,'C',2);
INSERT INTO `song_chord` VALUES (829,'Am',3);
INSERT INTO `song_chord` VALUES (829,'G',4);
INSERT INTO `song_chord` VALUES (830,'Am',0);
INSERT INTO `song_chord` VALUES (830,'F',1);
INSERT INTO `song_chord` VALUES (830,'E',2);
INSERT INTO `song_chord` VALUES (830,'B7',3);
INSERT INTO `song_chord` VALUES (830,'Dm',4);
INSERT INTO `song_chord` VALUES (830,'G',5);
INSERT INTO `song_chord` VALUES (831,'Dm5',0);
INSERT INTO `song_chord` VALUES (831,'Gm',1);
INSERT INTO `song_chord` VALUES (831,'A',2);
INSERT INTO `song_chord` VALUES (831,'Dm',3);
INSERT INTO `song_chord` VALUES (831,'C',4);
INSERT INTO `song_chord` VALUES (831,'F',5);
INSERT INTO `song_chord` VALUES (831,'A#',6);
INSERT INTO `song_chord` VALUES (832,'Dm',0);
INSERT INTO `song_chord` VALUES (832,'Gm',1);
INSERT INTO `song_chord` VALUES (833,'Dm5',0);
INSERT INTO `song_chord` VALUES (833,'C7',1);
INSERT INTO `song_chord` VALUES (833,'A#7',2);
INSERT INTO `song_chord` VALUES (833,'A',3);
INSERT INTO `song_chord` VALUES (833,'A7',4);
INSERT INTO `song_chord` VALUES (834,'E',0);
INSERT INTO `song_chord` VALUES (834,'C#m',1);
INSERT INTO `song_chord` VALUES (834,'G#',2);
INSERT INTO `song_chord` VALUES (834,'A',3);
INSERT INTO `song_chord` VALUES (834,'F#m',4);
INSERT INTO `song_chord` VALUES (834,'B',5);
INSERT INTO `song_chord` VALUES (835,'C',0);
INSERT INTO `song_chord` VALUES (835,'D',1);
INSERT INTO `song_chord` VALUES (835,'Cm',2);
INSERT INTO `song_chord` VALUES (835,'Gm',3);
INSERT INTO `song_chord` VALUES (835,'D7',4);
INSERT INTO `song_chord` VALUES (836,'Am',0);
INSERT INTO `song_chord` VALUES (836,'G',1);
INSERT INTO `song_chord` VALUES (836,'F',2);
INSERT INTO `song_chord` VALUES (836,'E',3);
INSERT INTO `song_chord` VALUES (837,'G',0);
INSERT INTO `song_chord` VALUES (837,'Em',1);
INSERT INTO `song_chord` VALUES (837,'C',2);
INSERT INTO `song_chord` VALUES (837,'D',3);
INSERT INTO `song_chord` VALUES (837,'B7',4);
INSERT INTO `song_chord` VALUES (837,'Am',5);
INSERT INTO `song_chord` VALUES (838,'Am',0);
INSERT INTO `song_chord` VALUES (838,'E',1);
INSERT INTO `song_chord` VALUES (839,'Em',0);
INSERT INTO `song_chord` VALUES (839,'Am',1);
INSERT INTO `song_chord` VALUES (839,'B7',2);
INSERT INTO `song_chord` VALUES (840,'Em',0);
INSERT INTO `song_chord` VALUES (840,'D',1);
INSERT INTO `song_chord` VALUES (840,'C',2);
INSERT INTO `song_chord` VALUES (840,'G',3);
INSERT INTO `song_chord` VALUES (840,'A',4);
INSERT INTO `song_chord` VALUES (840,'Am',5);
INSERT INTO `song_chord` VALUES (841,'C',0);
INSERT INTO `song_chord` VALUES (841,'F',1);
INSERT INTO `song_chord` VALUES (841,'E',2);
INSERT INTO `song_chord` VALUES (842,'Em',0);
INSERT INTO `song_chord` VALUES (842,'Am',1);
INSERT INTO `song_chord` VALUES (842,'B7',2);
INSERT INTO `song_chord` VALUES (843,'Em',0);
INSERT INTO `song_chord` VALUES (843,'Am',1);
INSERT INTO `song_chord` VALUES (844,'Am',0);
INSERT INTO `song_chord` VALUES (844,'G',1);
INSERT INTO `song_chord` VALUES (845,'Bm',0);
INSERT INTO `song_chord` VALUES (845,'Em',1);
INSERT INTO `song_chord` VALUES (845,'G',2);
INSERT INTO `song_chord` VALUES (845,'F#',3);
INSERT INTO `song_chord` VALUES (846,'Am',0);
INSERT INTO `song_chord` VALUES (846,'E',1);
INSERT INTO `song_chord` VALUES (846,'A7',2);
INSERT INTO `song_chord` VALUES (846,'Dm',3);
INSERT INTO `song_chord` VALUES (847,'Am',0);
INSERT INTO `song_chord` VALUES (847,'E',1);
INSERT INTO `song_chord` VALUES (847,'Dm',2);
INSERT INTO `song_chord` VALUES (847,'C',3);
INSERT INTO `song_chord` VALUES (847,'F',4);
INSERT INTO `song_chord` VALUES (848,'Dm',0);
INSERT INTO `song_chord` VALUES (848,'D7',1);
INSERT INTO `song_chord` VALUES (848,'Gm',2);
INSERT INTO `song_chord` VALUES (848,'A',3);
INSERT INTO `song_chord` VALUES (848,'A#',4);
INSERT INTO `song_chord` VALUES (849,'Am',0);
INSERT INTO `song_chord` VALUES (849,'G',1);
INSERT INTO `song_chord` VALUES (849,'F',2);
INSERT INTO `song_chord` VALUES (849,'E',3);
INSERT INTO `song_chord` VALUES (849,'Dm',4);
INSERT INTO `song_chord` VALUES (850,'G',0);
INSERT INTO `song_chord` VALUES (850,'C',1);
INSERT INTO `song_chord` VALUES (850,'D',2);
INSERT INTO `song_chord` VALUES (850,'Em',3);
INSERT INTO `song_chord` VALUES (851,'Em',0);
INSERT INTO `song_chord` VALUES (851,'D',1);
INSERT INTO `song_chord` VALUES (851,'Am',2);
INSERT INTO `song_chord` VALUES (852,'C',0);
INSERT INTO `song_chord` VALUES (852,'E',1);
INSERT INTO `song_chord` VALUES (852,'Am',2);
INSERT INTO `song_chord` VALUES (853,'A',0);
INSERT INTO `song_chord` VALUES (853,'E',1);
INSERT INTO `song_chord` VALUES (854,'G',0);
INSERT INTO `song_chord` VALUES (854,'Am',1);
INSERT INTO `song_chord` VALUES (854,'F',2);
INSERT INTO `song_chord` VALUES (854,'E',3);
INSERT INTO `song_chord` VALUES (854,'Dm',4);
INSERT INTO `song_chord` VALUES (855,'G',0);
INSERT INTO `song_chord` VALUES (855,'C',1);
INSERT INTO `song_chord` VALUES (855,'D',2);
INSERT INTO `song_chord` VALUES (855,'Em',3);
INSERT INTO `song_chord` VALUES (856,'G',0);
INSERT INTO `song_chord` VALUES (856,'C',1);
INSERT INTO `song_chord` VALUES (856,'D',2);
INSERT INTO `song_chord` VALUES (856,'Em',3);
INSERT INTO `song_chord` VALUES (857,'Em',0);
INSERT INTO `song_chord` VALUES (857,'Am',1);
INSERT INTO `song_chord` VALUES (857,'B7',2);
INSERT INTO `song_chord` VALUES (857,'C',3);
INSERT INTO `song_chord` VALUES (857,'D',4);
INSERT INTO `song_chord` VALUES (858,'G',0);
INSERT INTO `song_chord` VALUES (858,'Am',1);
INSERT INTO `song_chord` VALUES (858,'F',2);
INSERT INTO `song_chord` VALUES (858,'E',3);
INSERT INTO `song_chord` VALUES (858,'Dm',4);
INSERT INTO `song_chord` VALUES (859,'Am',0);
INSERT INTO `song_chord` VALUES (859,'G',1);
INSERT INTO `song_chord` VALUES (859,'F',2);
INSERT INTO `song_chord` VALUES (859,'E',3);
INSERT INTO `song_chord` VALUES (860,'Dm',0);
INSERT INTO `song_chord` VALUES (860,'F',1);
INSERT INTO `song_chord` VALUES (860,'Gm',2);
INSERT INTO `song_chord` VALUES (860,'Am',3);
INSERT INTO `song_chord` VALUES (860,'A#',4);
INSERT INTO `song_chord` VALUES (861,'D',0);
INSERT INTO `song_chord` VALUES (861,'A',1);
INSERT INTO `song_chord` VALUES (861,'G',2);
INSERT INTO `song_chord` VALUES (861,'F#m',3);
INSERT INTO `song_chord` VALUES (861,'Em',4);
INSERT INTO `song_chord` VALUES (862,'Am',0);
INSERT INTO `song_chord` VALUES (862,'G',1);
INSERT INTO `song_chord` VALUES (863,'Em',0);
INSERT INTO `song_chord` VALUES (863,'Am',1);
INSERT INTO `song_chord` VALUES (863,'C',2);
INSERT INTO `song_chord` VALUES (863,'B7',3);
INSERT INTO `song_chord` VALUES (864,'Em',0);
INSERT INTO `song_chord` VALUES (864,'Am',1);
INSERT INTO `song_chord` VALUES (864,'B7',2);
INSERT INTO `song_chord` VALUES (864,'C',3);
INSERT INTO `song_chord` VALUES (865,'G',0);
INSERT INTO `song_chord` VALUES (865,'Am',1);
INSERT INTO `song_chord` VALUES (865,'F',2);
INSERT INTO `song_chord` VALUES (865,'E',3);
INSERT INTO `song_chord` VALUES (865,'C',4);
INSERT INTO `song_chord` VALUES (866,'Dm',0);
INSERT INTO `song_chord` VALUES (866,'F',1);
INSERT INTO `song_chord` VALUES (866,'Gm',2);
INSERT INTO `song_chord` VALUES (866,'A',3);
INSERT INTO `song_chord` VALUES (866,'A7',4);
INSERT INTO `song_chord` VALUES (867,'G',0);
INSERT INTO `song_chord` VALUES (867,'Em',1);
INSERT INTO `song_chord` VALUES (867,'Am',2);
INSERT INTO `song_chord` VALUES (867,'Bm',3);
INSERT INTO `song_chord` VALUES (867,'A',4);
INSERT INTO `song_chord` VALUES (868,'C',0);
INSERT INTO `song_chord` VALUES (868,'G',1);
INSERT INTO `song_chord` VALUES (868,'Am',2);
INSERT INTO `song_chord` VALUES (868,'E',3);
INSERT INTO `song_chord` VALUES (868,'F',4);
INSERT INTO `song_chord` VALUES (869,'G',0);
INSERT INTO `song_chord` VALUES (869,'Am',1);
INSERT INTO `song_chord` VALUES (869,'F',2);
INSERT INTO `song_chord` VALUES (869,'E',3);
INSERT INTO `song_chord` VALUES (869,'C',4);
INSERT INTO `song_chord` VALUES (869,'D',5);
INSERT INTO `song_chord` VALUES (870,'Em',0);
INSERT INTO `song_chord` VALUES (870,'G',1);
INSERT INTO `song_chord` VALUES (870,'D',2);
INSERT INTO `song_chord` VALUES (870,'A',3);
INSERT INTO `song_chord` VALUES (871,'Dm',0);
INSERT INTO `song_chord` VALUES (871,'F',1);
INSERT INTO `song_chord` VALUES (871,'Am',2);
INSERT INTO `song_chord` VALUES (871,'Gm',3);
INSERT INTO `song_chord` VALUES (871,'A',4);
INSERT INTO `song_chord` VALUES (871,'A#',5);
INSERT INTO `song_chord` VALUES (872,'G',0);
INSERT INTO `song_chord` VALUES (872,'Am',1);
INSERT INTO `song_chord` VALUES (872,'F',2);
INSERT INTO `song_chord` VALUES (872,'E',3);
INSERT INTO `song_chord` VALUES (872,'Em',4);
INSERT INTO `song_chord` VALUES (873,'G',0);
INSERT INTO `song_chord` VALUES (873,'Am',1);
INSERT INTO `song_chord` VALUES (873,'F',2);
INSERT INTO `song_chord` VALUES (873,'E',3);
INSERT INTO `song_chord` VALUES (873,'Dm',4);
INSERT INTO `song_chord` VALUES (874,'Am',0);
INSERT INTO `song_chord` VALUES (874,'G',1);
INSERT INTO `song_chord` VALUES (874,'C',2);
INSERT INTO `song_chord` VALUES (874,'F',3);
INSERT INTO `song_chord` VALUES (874,'E7',4);
INSERT INTO `song_chord` VALUES (874,'E',5);
INSERT INTO `song_chord` VALUES (875,'Am',0);
INSERT INTO `song_chord` VALUES (875,'G',1);
INSERT INTO `song_chord` VALUES (875,'F',2);
INSERT INTO `song_chord` VALUES (875,'E',3);
INSERT INTO `song_chord` VALUES (875,'Dm',4);
INSERT INTO `song_chord` VALUES (876,'Am',0);
INSERT INTO `song_chord` VALUES (876,'G',1);
INSERT INTO `song_chord` VALUES (876,'F',2);
INSERT INTO `song_chord` VALUES (876,'E',3);
INSERT INTO `song_chord` VALUES (877,'Dm',0);
INSERT INTO `song_chord` VALUES (877,'F',1);
INSERT INTO `song_chord` VALUES (877,'Gm',2);
INSERT INTO `song_chord` VALUES (878,'Dm',0);
INSERT INTO `song_chord` VALUES (878,'Gm',1);
INSERT INTO `song_chord` VALUES (878,'A',2);
INSERT INTO `song_chord` VALUES (879,'E',0);
INSERT INTO `song_chord` VALUES (879,'B7',1);
INSERT INTO `song_chord` VALUES (879,'C',2);
INSERT INTO `song_chord` VALUES (879,'Em',3);
INSERT INTO `song_chord` VALUES (880,'Am',0);
INSERT INTO `song_chord` VALUES (880,'G',1);
INSERT INTO `song_chord` VALUES (880,'F',2);
INSERT INTO `song_chord` VALUES (880,'E',3);
INSERT INTO `song_chord` VALUES (881,'C',0);
INSERT INTO `song_chord` VALUES (881,'G',1);
INSERT INTO `song_chord` VALUES (881,'Am',2);
INSERT INTO `song_chord` VALUES (881,'E',3);
INSERT INTO `song_chord` VALUES (882,'Am',0);
INSERT INTO `song_chord` VALUES (882,'Dm9',1);
INSERT INTO `song_chord` VALUES (882,'E7',2);
INSERT INTO `song_chord` VALUES (882,'F',3);
INSERT INTO `song_chord` VALUES (882,'Dm',4);
INSERT INTO `song_chord` VALUES (883,'Em',0);
INSERT INTO `song_chord` VALUES (883,'C',1);
INSERT INTO `song_chord` VALUES (883,'D7',2);
INSERT INTO `song_chord` VALUES (883,'G',3);
INSERT INTO `song_chord` VALUES (883,'B7',4);
INSERT INTO `song_chord` VALUES (884,'D',0);
INSERT INTO `song_chord` VALUES (884,'Em',1);
INSERT INTO `song_chord` VALUES (884,'A7',2);
INSERT INTO `song_chord` VALUES (884,'F#',3);
INSERT INTO `song_chord` VALUES (884,'Bm',4);
INSERT INTO `song_chord` VALUES (884,'A',5);
INSERT INTO `song_chord` VALUES (884,'G',6);
INSERT INTO `song_chord` VALUES (885,'C',0);
INSERT INTO `song_chord` VALUES (885,'Am',1);
INSERT INTO `song_chord` VALUES (885,'Dm',2);
INSERT INTO `song_chord` VALUES (885,'G7',3);
INSERT INTO `song_chord` VALUES (885,'A7',4);
INSERT INTO `song_chord` VALUES (885,'G',5);
INSERT INTO `song_chord` VALUES (885,'E',6);
INSERT INTO `song_chord` VALUES (885,'F',7);
INSERT INTO `song_chord` VALUES (886,'Em',0);
INSERT INTO `song_chord` VALUES (886,'Am',1);
INSERT INTO `song_chord` VALUES (886,'B7',2);
INSERT INTO `song_chord` VALUES (886,'G',3);
INSERT INTO `song_chord` VALUES (886,'A',4);
INSERT INTO `song_chord` VALUES (887,'D7',0);
INSERT INTO `song_chord` VALUES (887,'Em',1);
INSERT INTO `song_chord` VALUES (887,'F',2);
INSERT INTO `song_chord` VALUES (887,'E',3);
INSERT INTO `song_chord` VALUES (887,'Am',4);
INSERT INTO `song_chord` VALUES (888,'Am',0);
INSERT INTO `song_chord` VALUES (888,'Dm',1);
INSERT INTO `song_chord` VALUES (888,'E',2);
INSERT INTO `song_chord` VALUES (888,'A7',3);
INSERT INTO `song_chord` VALUES (888,'E7',4);
INSERT INTO `song_chord` VALUES (888,'C',5);
INSERT INTO `song_chord` VALUES (888,'F',6);
INSERT INTO `song_chord` VALUES (889,'Dm',0);
INSERT INTO `song_chord` VALUES (889,'Am',1);
INSERT INTO `song_chord` VALUES (889,'Gm',2);
INSERT INTO `song_chord` VALUES (889,'A',3);
INSERT INTO `song_chord` VALUES (890,'A7',0);
INSERT INTO `song_chord` VALUES (890,'D',1);
INSERT INTO `song_chord` VALUES (890,'F#m',2);
INSERT INTO `song_chord` VALUES (890,'G',3);
INSERT INTO `song_chord` VALUES (890,'F#',4);
INSERT INTO `song_chord` VALUES (890,'Bm',5);
INSERT INTO `song_chord` VALUES (890,'Em',6);
INSERT INTO `song_chord` VALUES (891,'E',0);
INSERT INTO `song_chord` VALUES (891,'G#',1);
INSERT INTO `song_chord` VALUES (891,'C#m',2);
INSERT INTO `song_chord` VALUES (891,'F#m',3);
INSERT INTO `song_chord` VALUES (891,'B7',4);
INSERT INTO `song_chord` VALUES (891,'A',5);
INSERT INTO `song_chord` VALUES (892,'Am',0);
INSERT INTO `song_chord` VALUES (892,'F',1);
INSERT INTO `song_chord` VALUES (892,'E7',2);
INSERT INTO `song_chord` VALUES (892,'E',3);
INSERT INTO `song_chord` VALUES (892,'G',4);
INSERT INTO `song_chord` VALUES (892,'C',5);
INSERT INTO `song_chord` VALUES (892,'D',6);
INSERT INTO `song_chord` VALUES (893,'Am',0);
INSERT INTO `song_chord` VALUES (893,'F',1);
INSERT INTO `song_chord` VALUES (893,'E',2);
INSERT INTO `song_chord` VALUES (893,'Dm',3);
INSERT INTO `song_chord` VALUES (894,'Em',0);
INSERT INTO `song_chord` VALUES (894,'D',1);
INSERT INTO `song_chord` VALUES (894,'C',2);
INSERT INTO `song_chord` VALUES (894,'Am',3);
INSERT INTO `song_chord` VALUES (894,'D7',4);
INSERT INTO `song_chord` VALUES (894,'B7',5);
INSERT INTO `song_chord` VALUES (894,'G',6);
INSERT INTO `song_chord` VALUES (894,'Bm',7);
INSERT INTO `song_chord` VALUES (894,'C7',8);
INSERT INTO `song_chord` VALUES (895,'Em',0);
INSERT INTO `song_chord` VALUES (895,'Am',1);
INSERT INTO `song_chord` VALUES (895,'B7',2);
INSERT INTO `song_chord` VALUES (895,'D',3);
INSERT INTO `song_chord` VALUES (896,'D',0);
INSERT INTO `song_chord` VALUES (896,'F#',1);
INSERT INTO `song_chord` VALUES (896,'Bm',2);
INSERT INTO `song_chord` VALUES (896,'A',3);
INSERT INTO `song_chord` VALUES (896,'G',4);
INSERT INTO `song_chord` VALUES (897,'Dm',0);
INSERT INTO `song_chord` VALUES (897,'C',1);
INSERT INTO `song_chord` VALUES (897,'F',2);
INSERT INTO `song_chord` VALUES (897,'G',3);
INSERT INTO `song_chord` VALUES (897,'A',4);
INSERT INTO `song_chord` VALUES (897,'Gm',5);
INSERT INTO `song_chord` VALUES (897,'A7',6);
INSERT INTO `song_chord` VALUES (898,'Bm',0);
INSERT INTO `song_chord` VALUES (898,'C',1);
INSERT INTO `song_chord` VALUES (898,'D',2);
INSERT INTO `song_chord` VALUES (898,'F#m',3);
INSERT INTO `song_chord` VALUES (898,'G',4);
INSERT INTO `song_chord` VALUES (898,'F#',5);
INSERT INTO `song_chord` VALUES (899,'Em',0);
INSERT INTO `song_chord` VALUES (899,'Am',1);
INSERT INTO `song_chord` VALUES (899,'B7',2);
INSERT INTO `song_chord` VALUES (899,'C',3);
INSERT INTO `song_chord` VALUES (900,'C',0);
INSERT INTO `song_chord` VALUES (900,'E',1);
INSERT INTO `song_chord` VALUES (900,'Am',2);
INSERT INTO `song_chord` VALUES (900,'Dm',3);
INSERT INTO `song_chord` VALUES (900,'G',4);
INSERT INTO `song_chord` VALUES (900,'F',5);
INSERT INTO `song_chord` VALUES (900,'E7',6);
INSERT INTO `song_chord` VALUES (901,'Dm',0);
INSERT INTO `song_chord` VALUES (901,'Gm',1);
INSERT INTO `song_chord` VALUES (901,'Gm6',2);
INSERT INTO `song_chord` VALUES (901,'C7',3);
INSERT INTO `song_chord` VALUES (901,'F',4);
INSERT INTO `song_chord` VALUES (901,'A',5);
INSERT INTO `song_chord` VALUES (901,'A7',6);
INSERT INTO `song_chord` VALUES (901,'A#',7);
INSERT INTO `song_chord` VALUES (902,'D',0);
INSERT INTO `song_chord` VALUES (902,'F#m',1);
INSERT INTO `song_chord` VALUES (902,'Bm',2);
INSERT INTO `song_chord` VALUES (902,'Em',3);
INSERT INTO `song_chord` VALUES (902,'A',4);
INSERT INTO `song_chord` VALUES (902,'F#',5);
INSERT INTO `song_chord` VALUES (902,'A7',6);
INSERT INTO `song_chord` VALUES (902,'G',7);
INSERT INTO `song_chord` VALUES (903,'Am',0);
INSERT INTO `song_chord` VALUES (903,'G',1);
INSERT INTO `song_chord` VALUES (903,'F',2);
INSERT INTO `song_chord` VALUES (903,'E',3);
INSERT INTO `song_chord` VALUES (903,'Dm',4);
INSERT INTO `song_chord` VALUES (904,'Dm',0);
INSERT INTO `song_chord` VALUES (904,'A7',1);
INSERT INTO `song_chord` VALUES (904,'A#7',2);
INSERT INTO `song_chord` VALUES (905,'Dm',0);
INSERT INTO `song_chord` VALUES (905,'Gm',1);
INSERT INTO `song_chord` VALUES (905,'A',2);
INSERT INTO `song_chord` VALUES (905,'A7',3);
INSERT INTO `song_chord` VALUES (905,'F',4);
INSERT INTO `song_chord` VALUES (905,'Am',5);
INSERT INTO `song_chord` VALUES (906,'Am',0);
INSERT INTO `song_chord` VALUES (906,'G',1);
INSERT INTO `song_chord` VALUES (906,'F',2);
INSERT INTO `song_chord` VALUES (906,'E',3);
INSERT INTO `song_chord` VALUES (907,'Em',0);
INSERT INTO `song_chord` VALUES (907,'Am',1);
INSERT INTO `song_chord` VALUES (907,'C',2);
INSERT INTO `song_chord` VALUES (907,'B7',3);
INSERT INTO `song_chord` VALUES (908,'Em',0);
INSERT INTO `song_chord` VALUES (908,'B7',1);
INSERT INTO `song_chord` VALUES (908,'Am6',2);
INSERT INTO `song_chord` VALUES (908,'Am',3);
INSERT INTO `song_chord` VALUES (908,'C',4);
INSERT INTO `song_chord` VALUES (909,'C',0);
INSERT INTO `song_chord` VALUES (909,'Am',1);
INSERT INTO `song_chord` VALUES (909,'F',2);
INSERT INTO `song_chord` VALUES (909,'E',3);
INSERT INTO `song_chord` VALUES (909,'Dm',4);
INSERT INTO `song_chord` VALUES (909,'G',5);
INSERT INTO `song_chord` VALUES (910,'C',0);
INSERT INTO `song_chord` VALUES (910,'G',1);
INSERT INTO `song_chord` VALUES (910,'F',2);
INSERT INTO `song_chord` VALUES (910,'Am',3);
INSERT INTO `song_chord` VALUES (910,'Dm',4);
INSERT INTO `song_chord` VALUES (910,'E7',5);
INSERT INTO `song_chord` VALUES (910,'G7',6);
INSERT INTO `song_chord` VALUES (911,'Am',0);
INSERT INTO `song_chord` VALUES (911,'G',1);
INSERT INTO `song_chord` VALUES (911,'F',2);
INSERT INTO `song_chord` VALUES (911,'E',3);
INSERT INTO `song_chord` VALUES (912,'Am',0);
INSERT INTO `song_chord` VALUES (912,'Dm',1);
INSERT INTO `song_chord` VALUES (912,'E',2);
INSERT INTO `song_chord` VALUES (912,'F',3);
INSERT INTO `song_chord` VALUES (913,'Bm',0);
INSERT INTO `song_chord` VALUES (913,'Em',1);
INSERT INTO `song_chord` VALUES (913,'F#',2);
INSERT INTO `song_chord` VALUES (913,'G',3);
INSERT INTO `song_chord` VALUES (914,'D',0);
INSERT INTO `song_chord` VALUES (914,'Bm',1);
INSERT INTO `song_chord` VALUES (914,'G',2);
INSERT INTO `song_chord` VALUES (914,'E',3);
INSERT INTO `song_chord` VALUES (914,'A',4);
INSERT INTO `song_chord` VALUES (914,'F#',5);
INSERT INTO `song_chord` VALUES (915,'Dm',0);
INSERT INTO `song_chord` VALUES (915,'A7',1);
INSERT INTO `song_chord` VALUES (915,'Gm',2);
INSERT INTO `song_chord` VALUES (915,'A#',3);
INSERT INTO `song_chord` VALUES (915,'D7',4);
INSERT INTO `song_chord` VALUES (915,'A',5);
INSERT INTO `song_chord` VALUES (916,'C',0);
INSERT INTO `song_chord` VALUES (916,'Am',1);
INSERT INTO `song_chord` VALUES (916,'F',2);
INSERT INTO `song_chord` VALUES (916,'G',3);
INSERT INTO `song_chord` VALUES (917,'Am',0);
INSERT INTO `song_chord` VALUES (917,'F',1);
INSERT INTO `song_chord` VALUES (917,'Dm',2);
INSERT INTO `song_chord` VALUES (917,'E7',3);
INSERT INTO `song_chord` VALUES (917,'Em',4);
INSERT INTO `song_chord` VALUES (917,'E',5);
INSERT INTO `song_chord` VALUES (917,'G',6);
INSERT INTO `song_chord` VALUES (917,'C',7);
INSERT INTO `song_chord` VALUES (918,'D',0);
INSERT INTO `song_chord` VALUES (918,'Bm',1);
INSERT INTO `song_chord` VALUES (918,'A',2);
INSERT INTO `song_chord` VALUES (918,'G',3);
INSERT INTO `song_chord` VALUES (919,'C',0);
INSERT INTO `song_chord` VALUES (919,'F',1);
INSERT INTO `song_chord` VALUES (919,'G',2);
INSERT INTO `song_chord` VALUES (919,'Fm',3);
INSERT INTO `song_chord` VALUES (919,'Cm',4);
INSERT INTO `song_chord` VALUES (919,'A#',5);
INSERT INTO `song_chord` VALUES (919,'G#',6);
INSERT INTO `song_chord` VALUES (920,'Am',0);
INSERT INTO `song_chord` VALUES (920,'E',1);
INSERT INTO `song_chord` VALUES (920,'G',2);
INSERT INTO `song_chord` VALUES (920,'F',3);
INSERT INTO `song_chord` VALUES (921,'Dm',0);
INSERT INTO `song_chord` VALUES (921,'Gm',1);
INSERT INTO `song_chord` VALUES (921,'A',2);
INSERT INTO `song_chord` VALUES (921,'C',3);
INSERT INTO `song_chord` VALUES (921,'F',4);
INSERT INTO `song_chord` VALUES (921,'A#',5);
INSERT INTO `song_chord` VALUES (922,'D',0);
INSERT INTO `song_chord` VALUES (922,'A7',1);
INSERT INTO `song_chord` VALUES (922,'G',2);
INSERT INTO `song_chord` VALUES (922,'Bm',3);
INSERT INTO `song_chord` VALUES (922,'A',4);
INSERT INTO `song_chord` VALUES (922,'F#',5);
INSERT INTO `song_chord` VALUES (922,'E',6);
INSERT INTO `song_chord` VALUES (922,'B7',7);
INSERT INTO `song_chord` VALUES (922,'B',8);
INSERT INTO `song_chord` VALUES (922,'C#7',9);
INSERT INTO `song_chord` VALUES (923,'C#dim',0);
INSERT INTO `song_chord` VALUES (923,'A#7',1);
INSERT INTO `song_chord` VALUES (923,'A7',2);
INSERT INTO `song_chord` VALUES (923,'Dm',3);
INSERT INTO `song_chord` VALUES (923,'Gm',4);
INSERT INTO `song_chord` VALUES (58,'A',8);
INSERT INTO `song_chord` VALUES (924,'D',0);
INSERT INTO `song_chord` VALUES (924,'A',1);
INSERT INTO `song_chord` VALUES (924,'G',2);
INSERT INTO `song_chord` VALUES (924,'Bm',3);
INSERT INTO `song_chord` VALUES (924,'F#',4);
INSERT INTO `song_chord` VALUES (924,'E',5);
INSERT INTO `song_chord` VALUES (924,'B',6);
INSERT INTO `song_chord` VALUES (924,'C#',7);
INSERT INTO `song_chord` VALUES (925,'C',0);
INSERT INTO `song_chord` VALUES (925,'Am',1);
INSERT INTO `song_chord` VALUES (925,'Dm',2);
INSERT INTO `song_chord` VALUES (925,'G',3);
INSERT INTO `song_chord` VALUES (925,'A7',4);
INSERT INTO `song_chord` VALUES (925,'E',5);
INSERT INTO `song_chord` VALUES (925,'F',6);
INSERT INTO `song_chord` VALUES (926,'Am',0);
INSERT INTO `song_chord` VALUES (926,'F',1);
INSERT INTO `song_chord` VALUES (926,'E7',2);
INSERT INTO `song_chord` VALUES (926,'Dm',3);
INSERT INTO `song_chord` VALUES (927,'Am',0);
INSERT INTO `song_chord` VALUES (927,'Dm',1);
INSERT INTO `song_chord` VALUES (927,'G',2);
INSERT INTO `song_chord` VALUES (928,'B',0);
INSERT INTO `song_chord` VALUES (928,'Am',1);
INSERT INTO `song_chord` VALUES (928,'Em',2);
INSERT INTO `song_chord` VALUES (929,'A',0);
INSERT INTO `song_chord` VALUES (929,'E',1);
INSERT INTO `song_chord` VALUES (929,'B7',2);
INSERT INTO `song_chord` VALUES (929,'C#',3);
INSERT INTO `song_chord` VALUES (929,'F#m',4);
INSERT INTO `song_chord` VALUES (930,'C',0);
INSERT INTO `song_chord` VALUES (930,'Am',1);
INSERT INTO `song_chord` VALUES (930,'F',2);
INSERT INTO `song_chord` VALUES (930,'E',3);
INSERT INTO `song_chord` VALUES (930,'Dm',4);
INSERT INTO `song_chord` VALUES (930,'Dm9',5);
INSERT INTO `song_chord` VALUES (930,'G',6);
INSERT INTO `song_chord` VALUES (969,'C',0);
INSERT INTO `song_chord` VALUES (969,'F',2);
INSERT INTO `song_chord` VALUES (969,'G',1);
INSERT INTO `song_chord` VALUES (932,'Dm',0);
INSERT INTO `song_chord` VALUES (932,'A7',1);
INSERT INTO `song_chord` VALUES (932,'Gm',2);
INSERT INTO `song_chord` VALUES (932,'A#',3);
INSERT INTO `song_chord` VALUES (932,'F',4);
INSERT INTO `song_chord` VALUES (932,'Am',5);
INSERT INTO `song_chord` VALUES (932,'A',6);
INSERT INTO `song_chord` VALUES (932,'C',7);
INSERT INTO `song_chord` VALUES (933,'Am',0);
INSERT INTO `song_chord` VALUES (933,'G',1);
INSERT INTO `song_chord` VALUES (933,'F',2);
INSERT INTO `song_chord` VALUES (933,'E',3);
INSERT INTO `song_chord` VALUES (934,'Dm',0);
INSERT INTO `song_chord` VALUES (934,'F',1);
INSERT INTO `song_chord` VALUES (934,'Am',2);
INSERT INTO `song_chord` VALUES (934,'Gm',3);
INSERT INTO `song_chord` VALUES (934,'A#',4);
INSERT INTO `song_chord` VALUES (934,'A',5);
INSERT INTO `song_chord` VALUES (935,'Dm',0);
INSERT INTO `song_chord` VALUES (935,'F',1);
INSERT INTO `song_chord` VALUES (935,'C',2);
INSERT INTO `song_chord` VALUES (935,'Am',3);
INSERT INTO `song_chord` VALUES (935,'A#',4);
INSERT INTO `song_chord` VALUES (935,'A',5);
INSERT INTO `song_chord` VALUES (936,'Dm',0);
INSERT INTO `song_chord` VALUES (936,'D7',1);
INSERT INTO `song_chord` VALUES (936,'Gm',2);
INSERT INTO `song_chord` VALUES (936,'A',3);
INSERT INTO `song_chord` VALUES (936,'A#',4);
INSERT INTO `song_chord` VALUES (937,'Am',0);
INSERT INTO `song_chord` VALUES (937,'G',1);
INSERT INTO `song_chord` VALUES (937,'E',2);
INSERT INTO `song_chord` VALUES (937,'F',3);
INSERT INTO `song_chord` VALUES (938,'Em',0);
INSERT INTO `song_chord` VALUES (938,'F#',1);
INSERT INTO `song_chord` VALUES (938,'G',2);
INSERT INTO `song_chord` VALUES (938,'Bm',3);
INSERT INTO `song_chord` VALUES (939,'Em',0);
INSERT INTO `song_chord` VALUES (939,'Am',1);
INSERT INTO `song_chord` VALUES (939,'B7',2);
INSERT INTO `song_chord` VALUES (939,'C',3);
INSERT INTO `song_chord` VALUES (940,'Dm9',0);
INSERT INTO `song_chord` VALUES (940,'Gm',1);
INSERT INTO `song_chord` VALUES (940,'A',2);
INSERT INTO `song_chord` VALUES (940,'F',3);
INSERT INTO `song_chord` VALUES (940,'A#',4);
INSERT INTO `song_chord` VALUES (941,'Am',0);
INSERT INTO `song_chord` VALUES (941,'Dm',1);
INSERT INTO `song_chord` VALUES (941,'E',2);
INSERT INTO `song_chord` VALUES (941,'F',3);
INSERT INTO `song_chord` VALUES (942,'Em',0);
INSERT INTO `song_chord` VALUES (942,'B7',1);
INSERT INTO `song_chord` VALUES (942,'D',2);
INSERT INTO `song_chord` VALUES (942,'C',3);
INSERT INTO `song_chord` VALUES (942,'Am',4);
INSERT INTO `song_chord` VALUES (943,'Dm',0);
INSERT INTO `song_chord` VALUES (943,'Gm',1);
INSERT INTO `song_chord` VALUES (943,'A',2);
INSERT INTO `song_chord` VALUES (943,'C',3);
INSERT INTO `song_chord` VALUES (943,'F',4);
INSERT INTO `song_chord` VALUES (943,'A#',5);
INSERT INTO `song_chord` VALUES (944,'Am',0);
INSERT INTO `song_chord` VALUES (944,'Dm',1);
INSERT INTO `song_chord` VALUES (944,'E7',2);
INSERT INTO `song_chord` VALUES (944,'F',3);
INSERT INTO `song_chord` VALUES (944,'E',4);
INSERT INTO `song_chord` VALUES (944,'G',5);
INSERT INTO `song_chord` VALUES (945,'Dm',0);
INSERT INTO `song_chord` VALUES (945,'Am',1);
INSERT INTO `song_chord` VALUES (945,'Gm',2);
INSERT INTO `song_chord` VALUES (945,'A7',3);
INSERT INTO `song_chord` VALUES (946,'D',0);
INSERT INTO `song_chord` VALUES (946,'Bm',1);
INSERT INTO `song_chord` VALUES (946,'A',2);
INSERT INTO `song_chord` VALUES (946,'G',3);
INSERT INTO `song_chord` VALUES (947,'Bm',0);
INSERT INTO `song_chord` VALUES (947,'Em',1);
INSERT INTO `song_chord` VALUES (947,'F#',2);
INSERT INTO `song_chord` VALUES (947,'G',3);
INSERT INTO `song_chord` VALUES (948,'Bm',0);
INSERT INTO `song_chord` VALUES (948,'A',1);
INSERT INTO `song_chord` VALUES (948,'F#',2);
INSERT INTO `song_chord` VALUES (948,'G',3);
INSERT INTO `song_chord` VALUES (948,'A7',4);
INSERT INTO `song_chord` VALUES (948,'D',5);
INSERT INTO `song_chord` VALUES (948,'Em',6);
INSERT INTO `song_chord` VALUES (949,'Am',0);
INSERT INTO `song_chord` VALUES (949,'E',1);
INSERT INTO `song_chord` VALUES (949,'F',2);
INSERT INTO `song_chord` VALUES (949,'C',3);
INSERT INTO `song_chord` VALUES (949,'G',4);
INSERT INTO `song_chord` VALUES (949,'E7',5);
INSERT INTO `song_chord` VALUES (951,'Em',6);
INSERT INTO `song_chord` VALUES (951,'Bm',5);
INSERT INTO `song_chord` VALUES (951,'F#',4);
INSERT INTO `song_chord` VALUES (951,'G',3);
INSERT INTO `song_chord` VALUES (951,'F#m',2);
INSERT INTO `song_chord` VALUES (951,'D',1);
INSERT INTO `song_chord` VALUES (951,'A7',0);
INSERT INTO `song_chord` VALUES (952,'Am',0);
INSERT INTO `song_chord` VALUES (952,'F',1);
INSERT INTO `song_chord` VALUES (952,'E7',2);
INSERT INTO `song_chord` VALUES (952,'G',3);
INSERT INTO `song_chord` VALUES (952,'E',4);
INSERT INTO `song_chord` VALUES (952,'C',5);
INSERT INTO `song_chord` VALUES (952,'D',6);
INSERT INTO `song_chord` VALUES (953,'D7',0);
INSERT INTO `song_chord` VALUES (953,'Em',1);
INSERT INTO `song_chord` VALUES (953,'F',2);
INSERT INTO `song_chord` VALUES (953,'E',3);
INSERT INTO `song_chord` VALUES (953,'Am',4);
INSERT INTO `song_chord` VALUES (954,'Em',0);
INSERT INTO `song_chord` VALUES (954,'B7',1);
INSERT INTO `song_chord` VALUES (954,'Am',2);
INSERT INTO `song_chord` VALUES (954,'C',3);
INSERT INTO `song_chord` VALUES (955,'F#',0);
INSERT INTO `song_chord` VALUES (955,'G',1);
INSERT INTO `song_chord` VALUES (955,'Bm',2);
INSERT INTO `song_chord` VALUES (955,'A',3);
INSERT INTO `song_chord` VALUES (957,'Gm',1);
INSERT INTO `song_chord` VALUES (957,'Em',0);
INSERT INTO `song_chord` VALUES (957,'G',2);
INSERT INTO `song_chord` VALUES (957,'A',3);
INSERT INTO `song_chord` VALUES (957,'B',4);
INSERT INTO `song_chord` VALUES (958,'Dm',0);
INSERT INTO `song_chord` VALUES (958,'F',1);
INSERT INTO `song_chord` VALUES (958,'C',2);
INSERT INTO `song_chord` VALUES (958,'Am',3);
INSERT INTO `song_chord` VALUES (958,'A#',4);
INSERT INTO `song_chord` VALUES (958,'A',5);
INSERT INTO `song_chord` VALUES (959,'C',0);
INSERT INTO `song_chord` VALUES (959,'E',1);
INSERT INTO `song_chord` VALUES (959,'F',2);
INSERT INTO `song_chord` VALUES (959,'Dm',3);
INSERT INTO `song_chord` VALUES (959,'G',4);
INSERT INTO `song_chord` VALUES (959,'D7',5);
INSERT INTO `song_chord` VALUES (959,'G7',6);
INSERT INTO `song_chord` VALUES (959,'Cm',7);
INSERT INTO `song_chord` VALUES (960,'Dm',0);
INSERT INTO `song_chord` VALUES (960,'D7',1);
INSERT INTO `song_chord` VALUES (960,'Gm',2);
INSERT INTO `song_chord` VALUES (960,'A',3);
INSERT INTO `song_chord` VALUES (960,'A#',4);
INSERT INTO `song_chord` VALUES (961,'Am',0);
INSERT INTO `song_chord` VALUES (961,'G',1);
INSERT INTO `song_chord` VALUES (961,'E',2);
INSERT INTO `song_chord` VALUES (961,'F',3);
INSERT INTO `song_chord` VALUES (962,'Dm',0);
INSERT INTO `song_chord` VALUES (962,'C',1);
INSERT INTO `song_chord` VALUES (962,'A#',2);
INSERT INTO `song_chord` VALUES (962,'A',3);
INSERT INTO `song_chord` VALUES (962,'Gm',4);
INSERT INTO `song_chord` VALUES (963,'Am',0);
INSERT INTO `song_chord` VALUES (963,'E',1);
INSERT INTO `song_chord` VALUES (963,'G',2);
INSERT INTO `song_chord` VALUES (963,'F',3);
INSERT INTO `song_chord` VALUES (964,'Am',0);
INSERT INTO `song_chord` VALUES (964,'C',1);
INSERT INTO `song_chord` VALUES (964,'E',2);
INSERT INTO `song_chord` VALUES (964,'F',3);
INSERT INTO `song_chord` VALUES (964,'A7',4);
INSERT INTO `song_chord` VALUES (964,'Dm',5);
INSERT INTO `song_chord` VALUES (964,'G',6);
INSERT INTO `song_chord` VALUES (965,'Em',0);
INSERT INTO `song_chord` VALUES (965,'Am',1);
INSERT INTO `song_chord` VALUES (965,'B7',2);
INSERT INTO `song_chord` VALUES (965,'C',3);
INSERT INTO `song_chord` VALUES (966,'Am',0);
INSERT INTO `song_chord` VALUES (966,'E',1);
INSERT INTO `song_chord` VALUES (966,'Dm',2);
INSERT INTO `song_chord` VALUES (966,'F',3);
INSERT INTO `song_chord` VALUES (667,'G',4);
INSERT INTO `song_chord` VALUES (967,'Am',0);
INSERT INTO `song_chord` VALUES (967,'E',1);
INSERT INTO `song_chord` VALUES (967,'Dm',2);
INSERT INTO `song_chord` VALUES (967,'F',3);
INSERT INTO `song_chord` VALUES (968,'Em',0);
INSERT INTO `song_chord` VALUES (968,'Am',1);
INSERT INTO `song_chord` VALUES (968,'B7',2);
INSERT INTO `song_chord` VALUES (968,'C',3);
INSERT INTO `song_chord` VALUES (211,'A',6);
INSERT INTO `song_chord` VALUES (154,'G7',3);
INSERT INTO `song_chord` VALUES (969,'Am',3);
INSERT INTO `song_chord` VALUES (969,'Dm',4);
INSERT INTO `song_chord` VALUES (969,'E',5);
INSERT INTO `song_chord` VALUES (969,'E7',6);
INSERT INTO `song_chord` VALUES (969,'G7',7);
INSERT INTO `song_chord` VALUES (970,'Am',0);
INSERT INTO `song_chord` VALUES (970,'Dm',1);
INSERT INTO `song_chord` VALUES (970,'E',2);
INSERT INTO `song_chord` VALUES (970,'G',3);
INSERT INTO `song_chord` VALUES (970,'F',4);
INSERT INTO `song_chord` VALUES (971,'Em',0);
INSERT INTO `song_chord` VALUES (971,'Am',1);
INSERT INTO `song_chord` VALUES (971,'G',2);
INSERT INTO `song_chord` VALUES (971,'A',3);
INSERT INTO `song_chord` VALUES (971,'B7',4);
INSERT INTO `song_chord` VALUES (972,'Em',0);
INSERT INTO `song_chord` VALUES (972,'Am',1);
INSERT INTO `song_chord` VALUES (972,'C',2);
INSERT INTO `song_chord` VALUES (972,'B7',3);
INSERT INTO `song_chord` VALUES (973,'Am',0);
INSERT INTO `song_chord` VALUES (973,'Dm9',1);
INSERT INTO `song_chord` VALUES (973,'E',2);
INSERT INTO `song_chord` VALUES (973,'E7',3);
INSERT INTO `song_chord` VALUES (973,'Dm',4);
INSERT INTO `song_chord` VALUES (974,'Am',0);
INSERT INTO `song_chord` VALUES (974,'A7',1);
INSERT INTO `song_chord` VALUES (974,'Dm9',2);
INSERT INTO `song_chord` VALUES (974,'F7M',3);
INSERT INTO `song_chord` VALUES (974,'E',4);
INSERT INTO `song_chord` VALUES (974,'Dm',5);
INSERT INTO `song_chord` VALUES (974,'F',6);
INSERT INTO `song_chord` VALUES (974,'F7',7);
INSERT INTO `song_chord` VALUES (975,'Cm',0);
INSERT INTO `song_chord` VALUES (975,'G#',1);
INSERT INTO `song_chord` VALUES (975,'Fm',2);
INSERT INTO `song_chord` VALUES (975,'G',3);
INSERT INTO `song_chord` VALUES (976,'E',0);
INSERT INTO `song_chord` VALUES (976,'G',1);
INSERT INTO `song_chord` VALUES (976,'A',2);
INSERT INTO `song_chord` VALUES (976,'B',3);
INSERT INTO `song_chord` VALUES (976,'Em',4);
INSERT INTO `song_chord` VALUES (976,'Am',5);
INSERT INTO `song_chord` VALUES (976,'Bm',6);
INSERT INTO `song_chord` VALUES (977,'G',0);
INSERT INTO `song_chord` VALUES (977,'Bm',1);
INSERT INTO `song_chord` VALUES (977,'C',2);
INSERT INTO `song_chord` VALUES (977,'D',3);
INSERT INTO `song_chord` VALUES (978,'C',0);
INSERT INTO `song_chord` VALUES (978,'Am',1);
INSERT INTO `song_chord` VALUES (978,'G7',2);
INSERT INTO `song_chord` VALUES (978,'F',3);
INSERT INTO `song_chord` VALUES (978,'Em',4);
INSERT INTO `song_chord` VALUES (978,'G',5);
INSERT INTO `song_chord` VALUES (979,'G',0);
INSERT INTO `song_chord` VALUES (979,'Bm',1);
INSERT INTO `song_chord` VALUES (979,'C',2);
INSERT INTO `song_chord` VALUES (979,'Am',3);
INSERT INTO `song_chord` VALUES (979,'D7',4);
INSERT INTO `song_chord` VALUES (979,'D',5);
INSERT INTO `song_chord` VALUES (980,'Am',0);
INSERT INTO `song_chord` VALUES (980,'G',1);
INSERT INTO `song_chord` VALUES (980,'E',2);
INSERT INTO `song_chord` VALUES (980,'Dm',3);
INSERT INTO `song_chord` VALUES (980,'F',4);
INSERT INTO `song_chord` VALUES (980,'C',5);
INSERT INTO `song_chord` VALUES (981,'Em',0);
INSERT INTO `song_chord` VALUES (981,'B7',1);
INSERT INTO `song_chord` VALUES (981,'Am',2);
INSERT INTO `song_chord` VALUES (982,'Dm',0);
INSERT INTO `song_chord` VALUES (982,'A7',1);
INSERT INTO `song_chord` VALUES (982,'Gm',2);
INSERT INTO `song_chord` VALUES (982,'A#',3);
INSERT INTO `song_chord` VALUES (982,'A',4);
INSERT INTO `song_chord` VALUES (983,'Am',0);
INSERT INTO `song_chord` VALUES (983,'Dm',1);
INSERT INTO `song_chord` VALUES (983,'E7',2);
INSERT INTO `song_chord` VALUES (983,'F',3);
INSERT INTO `song_chord` VALUES (983,'E',4);
INSERT INTO `song_chord` VALUES (983,'G',5);
INSERT INTO `song_chord` VALUES (984,'Dm',0);
INSERT INTO `song_chord` VALUES (984,'A7',1);
INSERT INTO `song_chord` VALUES (984,'Gm',2);
INSERT INTO `song_chord` VALUES (984,'A#',3);
INSERT INTO `song_chord` VALUES (985,'Am',0);
INSERT INTO `song_chord` VALUES (985,'E',1);
INSERT INTO `song_chord` VALUES (985,'Dm',2);
INSERT INTO `song_chord` VALUES (985,'F',3);
INSERT INTO `song_chord` VALUES (986,'C',0);
INSERT INTO `song_chord` VALUES (986,'E',1);
INSERT INTO `song_chord` VALUES (986,'Am',2);
INSERT INTO `song_chord` VALUES (986,'F',3);
INSERT INTO `song_chord` VALUES (986,'Dm',4);
INSERT INTO `song_chord` VALUES (987,'C',0);
INSERT INTO `song_chord` VALUES (987,'E',1);
INSERT INTO `song_chord` VALUES (987,'F',2);
INSERT INTO `song_chord` VALUES (988,'Em',0);
INSERT INTO `song_chord` VALUES (988,'F#',1);
INSERT INTO `song_chord` VALUES (988,'G',2);
INSERT INTO `song_chord` VALUES (988,'Bm',3);
INSERT INTO `song_chord` VALUES (989,'Am',0);
INSERT INTO `song_chord` VALUES (989,'G',1);
INSERT INTO `song_chord` VALUES (989,'F',2);
INSERT INTO `song_chord` VALUES (989,'E',3);
INSERT INTO `song_chord` VALUES (989,'Dm',4);
INSERT INTO `song_chord` VALUES (990,'D',0);
INSERT INTO `song_chord` VALUES (990,'Em',1);
INSERT INTO `song_chord` VALUES (990,'A7',2);
INSERT INTO `song_chord` VALUES (990,'F#',3);
INSERT INTO `song_chord` VALUES (990,'Bm',4);
INSERT INTO `song_chord` VALUES (990,'A',5);
INSERT INTO `song_chord` VALUES (991,'Am',0);
INSERT INTO `song_chord` VALUES (991,'E',1);
INSERT INTO `song_chord` VALUES (991,'Dm',2);
INSERT INTO `song_chord` VALUES (992,'Dm',0);
INSERT INTO `song_chord` VALUES (992,'Gm',1);
INSERT INTO `song_chord` VALUES (992,'A',2);
INSERT INTO `song_chord` VALUES (993,'Dm',0);
INSERT INTO `song_chord` VALUES (993,'C',1);
INSERT INTO `song_chord` VALUES (993,'A',2);
INSERT INTO `song_chord` VALUES (993,'A#',3);
INSERT INTO `song_chord` VALUES (994,'Am',0);
INSERT INTO `song_chord` VALUES (994,'Dm',1);
INSERT INTO `song_chord` VALUES (994,'E',2);
INSERT INTO `song_chord` VALUES (995,'C',0);
INSERT INTO `song_chord` VALUES (995,'G',1);
INSERT INTO `song_chord` VALUES (995,'F',2);
INSERT INTO `song_chord` VALUES (995,'E',3);
INSERT INTO `song_chord` VALUES (995,'Am',4);
INSERT INTO `song_chord` VALUES (995,'E7',5);
INSERT INTO `song_chord` VALUES (996,'G',0);
INSERT INTO `song_chord` VALUES (996,'F#m',1);
INSERT INTO `song_chord` VALUES (996,'E',2);
INSERT INTO `song_chord` VALUES (996,'A',3);
INSERT INTO `song_chord` VALUES (996,'B',4);
INSERT INTO `song_chord` VALUES (996,'Em',5);
INSERT INTO `song_chord` VALUES (996,'D',6);
INSERT INTO `song_chord` VALUES (996,'C',7);
INSERT INTO `song_chord` VALUES (996,'B7',8);
INSERT INTO `song_chord` VALUES (997,'Em',0);
INSERT INTO `song_chord` VALUES (997,'E7',1);
INSERT INTO `song_chord` VALUES (998,'Em',0);
INSERT INTO `song_chord` VALUES (998,'D',1);
INSERT INTO `song_chord` VALUES (998,'C',2);
INSERT INTO `song_chord` VALUES (998,'B7',3);
INSERT INTO `song_chord` VALUES (998,'E',4);
INSERT INTO `song_chord` VALUES (998,'G#m',5);
INSERT INTO `song_chord` VALUES (998,'C#',6);
INSERT INTO `song_chord` VALUES (998,'F#m',7);
INSERT INTO `song_chord` VALUES (998,'A',8);
INSERT INTO `song_chord` VALUES (999,'Am',0);
INSERT INTO `song_chord` VALUES (999,'C',1);
INSERT INTO `song_chord` VALUES (999,'E',2);
INSERT INTO `song_chord` VALUES (999,'F',3);
INSERT INTO `song_chord` VALUES (999,'Dm',4);
INSERT INTO `song_chord` VALUES (999,'Dm9',5);
INSERT INTO `song_chord` VALUES (999,'G',6);
INSERT INTO `song_chord` VALUES (999,'A7',7);
INSERT INTO `song_chord` VALUES (1000,'Am',0);
INSERT INTO `song_chord` VALUES (1000,'E',1);
INSERT INTO `song_chord` VALUES (1000,'F',2);
INSERT INTO `song_chord` VALUES (1000,'Dm',3);
INSERT INTO `song_chord` VALUES (1000,'Em',4);
INSERT INTO `song_chord` VALUES (1000,'G',5);
INSERT INTO `song_chord` VALUES (1000,'B',6);
INSERT INTO `song_chord` VALUES (1000,'D',7);
INSERT INTO `song_chord` VALUES (1000,'A',8);
INSERT INTO `song_chord` VALUES (1000,'F#',9);
INSERT INTO `song_chord` VALUES (1000,'Bm',10);
INSERT INTO `song_chord` VALUES (1001,'C7',0);
INSERT INTO `song_chord` VALUES (1001,'F',1);
INSERT INTO `song_chord` VALUES (1001,'A7',2);
INSERT INTO `song_chord` VALUES (1001,'D7',3);
INSERT INTO `song_chord` VALUES (1001,'G7',4);
INSERT INTO `song_chord` VALUES (1002,'Am',0);
INSERT INTO `song_chord` VALUES (1002,'Dm',1);
INSERT INTO `song_chord` VALUES (1002,'E',2);
INSERT INTO `song_chord` VALUES (1003,'Am',0);
INSERT INTO `song_chord` VALUES (1003,'Em',1);
INSERT INTO `song_chord` VALUES (1003,'F',2);
INSERT INTO `song_chord` VALUES (1003,'C',3);
INSERT INTO `song_chord` VALUES (1003,'E7',4);
INSERT INTO `song_chord` VALUES (1004,'Em',0);
INSERT INTO `song_chord` VALUES (1004,'D',1);
INSERT INTO `song_chord` VALUES (1004,'G',2);
INSERT INTO `song_chord` VALUES (1004,'Bm',3);
INSERT INTO `song_chord` VALUES (1005,'Em',0);
INSERT INTO `song_chord` VALUES (1005,'D',1);
INSERT INTO `song_chord` VALUES (1005,'G',2);
INSERT INTO `song_chord` VALUES (1005,'Bm',3);
INSERT INTO `song_chord` VALUES (1006,'Am',0);
INSERT INTO `song_chord` VALUES (1006,'G',1);
INSERT INTO `song_chord` VALUES (1006,'F',2);
INSERT INTO `song_chord` VALUES (1006,'E',3);
INSERT INTO `song_chord` VALUES (1006,'E7',4);
INSERT INTO `song_chord` VALUES (1007,'Am',0);
INSERT INTO `song_chord` VALUES (1007,'Dm',1);
INSERT INTO `song_chord` VALUES (1007,'F',2);
INSERT INTO `song_chord` VALUES (1007,'E',3);
INSERT INTO `song_chord` VALUES (1007,'G',4);
INSERT INTO `song_chord` VALUES (1008,'Am',0);
INSERT INTO `song_chord` VALUES (1008,'G',1);
INSERT INTO `song_chord` VALUES (1008,'F',2);
INSERT INTO `song_chord` VALUES (1008,'E',3);
INSERT INTO `song_chord` VALUES (1009,'Am',0);
INSERT INTO `song_chord` VALUES (1009,'Dm',1);
INSERT INTO `song_chord` VALUES (1009,'E',2);
INSERT INTO `song_chord` VALUES (1009,'F',3);
INSERT INTO `song_chord` VALUES (1009,'G',4);
INSERT INTO `song_chord` VALUES (1010,'E',0);
INSERT INTO `song_chord` VALUES (1010,'F#m',1);
INSERT INTO `song_chord` VALUES (1010,'B7',2);
INSERT INTO `song_chord` VALUES (1010,'G#',3);
INSERT INTO `song_chord` VALUES (1010,'C#m',4);
INSERT INTO `song_chord` VALUES (1010,'C#',5);
INSERT INTO `song_chord` VALUES (1010,'A',6);
INSERT INTO `song_chord` VALUES (1010,'A#',7);
INSERT INTO `song_chord` VALUES (1011,'Em',0);
INSERT INTO `song_chord` VALUES (1011,'Am',1);
INSERT INTO `song_chord` VALUES (1011,'B7',2);
INSERT INTO `song_chord` VALUES (1011,'C',3);
INSERT INTO `song_chord` VALUES (1012,'Em',0);
INSERT INTO `song_chord` VALUES (1012,'Am',1);
INSERT INTO `song_chord` VALUES (1012,'B7',2);
INSERT INTO `song_chord` VALUES (1012,'G',3);
INSERT INTO `song_chord` VALUES (1012,'A',4);
INSERT INTO `song_chord` VALUES (1013,'Em',0);
INSERT INTO `song_chord` VALUES (1013,'C',1);
INSERT INTO `song_chord` VALUES (1013,'D7',2);
INSERT INTO `song_chord` VALUES (1013,'G',3);
INSERT INTO `song_chord` VALUES (1013,'B7',4);
INSERT INTO `song_chord` VALUES (1014,'Em',0);
INSERT INTO `song_chord` VALUES (1014,'B7',1);
INSERT INTO `song_chord` VALUES (1014,'G',2);
INSERT INTO `song_chord` VALUES (1014,'Am',3);
INSERT INTO `song_chord` VALUES (1014,'D',4);
INSERT INTO `song_chord` VALUES (1014,'C',5);
INSERT INTO `song_chord` VALUES (1015,'Bm',0);
INSERT INTO `song_chord` VALUES (1015,'A',1);
INSERT INTO `song_chord` VALUES (1015,'G',2);
INSERT INTO `song_chord` VALUES (1015,'F#',3);
INSERT INTO `song_chord` VALUES (1016,'Em',0);
INSERT INTO `song_chord` VALUES (1016,'Am',1);
INSERT INTO `song_chord` VALUES (1016,'D',2);
INSERT INTO `song_chord` VALUES (1016,'C',3);
INSERT INTO `song_chord` VALUES (1016,'B7',4);
INSERT INTO `song_chord` VALUES (1017,'Am',0);
INSERT INTO `song_chord` VALUES (1017,'F',1);
INSERT INTO `song_chord` VALUES (1017,'E7',2);
INSERT INTO `song_chord` VALUES (1017,'G',3);
INSERT INTO `song_chord` VALUES (1018,'C',0);
INSERT INTO `song_chord` VALUES (1018,'E',1);
INSERT INTO `song_chord` VALUES (1018,'Dm9',2);
INSERT INTO `song_chord` VALUES (1018,'G',3);
INSERT INTO `song_chord` VALUES (1018,'F',4);
INSERT INTO `song_chord` VALUES (1019,'Dm',0);
INSERT INTO `song_chord` VALUES (1019,'Gm',1);
INSERT INTO `song_chord` VALUES (1019,'A7',2);
INSERT INTO `song_chord` VALUES (1019,'F',3);
INSERT INTO `song_chord` VALUES (1019,'Am',4);
INSERT INTO `song_chord` VALUES (1020,'E',0);
INSERT INTO `song_chord` VALUES (1020,'G#',1);
INSERT INTO `song_chord` VALUES (1020,'A',2);
INSERT INTO `song_chord` VALUES (1020,'B7',3);
INSERT INTO `song_chord` VALUES (1020,'C#m',4);
INSERT INTO `song_chord` VALUES (1021,'Am',0);
INSERT INTO `song_chord` VALUES (1021,'Dm',1);
INSERT INTO `song_chord` VALUES (1021,'F',2);
INSERT INTO `song_chord` VALUES (1021,'E',3);
INSERT INTO `song_chord` VALUES (1021,'C',4);
INSERT INTO `song_chord` VALUES (1021,'Em',5);
INSERT INTO `song_chord` VALUES (1022,'Am',0);
INSERT INTO `song_chord` VALUES (1022,'G',1);
INSERT INTO `song_chord` VALUES (1023,'Am',0);
INSERT INTO `song_chord` VALUES (1023,'E',1);
INSERT INTO `song_chord` VALUES (1023,'Dm',2);
INSERT INTO `song_chord` VALUES (1023,'F',3);
INSERT INTO `song_chord` VALUES (1024,'Am',0);
INSERT INTO `song_chord` VALUES (1024,'Dm',1);
INSERT INTO `song_chord` VALUES (1024,'E',2);
INSERT INTO `song_chord` VALUES (1024,'E7',3);
INSERT INTO `song_chord` VALUES (1024,'A7',4);
INSERT INTO `song_chord` VALUES (1024,'C',5);
INSERT INTO `song_chord` VALUES (1024,'F',6);
INSERT INTO `song_chord` VALUES (1025,'A',0);
INSERT INTO `song_chord` VALUES (1025,'E',1);
INSERT INTO `song_chord` VALUES (1025,'B7',2);
INSERT INTO `song_chord` VALUES (1025,'E7',3);
INSERT INTO `song_chord` VALUES (1025,'C#',4);
INSERT INTO `song_chord` VALUES (1025,'F#m',5);
INSERT INTO `song_chord` VALUES (1026,'Em',0);
INSERT INTO `song_chord` VALUES (1026,'Am',1);
INSERT INTO `song_chord` VALUES (1026,'B7',2);
INSERT INTO `song_chord` VALUES (1027,'Em',0);
INSERT INTO `song_chord` VALUES (1027,'Am',1);
INSERT INTO `song_chord` VALUES (1027,'B7',2);
INSERT INTO `song_chord` VALUES (1028,'G',0);
INSERT INTO `song_chord` VALUES (1028,'Em',1);
INSERT INTO `song_chord` VALUES (1028,'C',2);
INSERT INTO `song_chord` VALUES (1028,'Am',3);
INSERT INTO `song_chord` VALUES (1028,'B7',4);
INSERT INTO `song_chord` VALUES (1028,'D',5);
INSERT INTO `song_chord` VALUES (1029,'Dm',0);
INSERT INTO `song_chord` VALUES (1029,'Gm',1);
INSERT INTO `song_chord` VALUES (1029,'A',2);
INSERT INTO `song_chord` VALUES (1029,'A7',3);
INSERT INTO `song_chord` VALUES (1030,'Am',0);
INSERT INTO `song_chord` VALUES (1030,'F',1);
INSERT INTO `song_chord` VALUES (1030,'G',2);
INSERT INTO `song_chord` VALUES (1030,'E',3);
INSERT INTO `song_chord` VALUES (1031,'Am',0);
INSERT INTO `song_chord` VALUES (1031,'Em',1);
INSERT INTO `song_chord` VALUES (1031,'Dm9',2);
INSERT INTO `song_chord` VALUES (1031,'F',3);
INSERT INTO `song_chord` VALUES (1032,'Am',0);
INSERT INTO `song_chord` VALUES (1032,'F',1);
INSERT INTO `song_chord` VALUES (1032,'G',2);
INSERT INTO `song_chord` VALUES (1032,'E',3);
INSERT INTO `song_chord` VALUES (1033,'Am',0);
INSERT INTO `song_chord` VALUES (1033,'E',1);
INSERT INTO `song_chord` VALUES (1033,'E7',2);
INSERT INTO `song_chord` VALUES (1034,'Am',0);
INSERT INTO `song_chord` VALUES (1034,'Dm',1);
INSERT INTO `song_chord` VALUES (1034,'E',2);
INSERT INTO `song_chord` VALUES (1034,'F',3);
INSERT INTO `song_chord` VALUES (1034,'A7',4);
INSERT INTO `song_chord` VALUES (1035,'Am',0);
INSERT INTO `song_chord` VALUES (1035,'Dm',1);
INSERT INTO `song_chord` VALUES (1035,'F',2);
INSERT INTO `song_chord` VALUES (1035,'E',3);
INSERT INTO `song_chord` VALUES (1035,'A',4);
INSERT INTO `song_chord` VALUES (1035,'F#m',5);
INSERT INTO `song_chord` VALUES (1036,'Am',0);
INSERT INTO `song_chord` VALUES (1036,'G',1);
INSERT INTO `song_chord` VALUES (1037,'Am',0);
INSERT INTO `song_chord` VALUES (1037,'F',1);
INSERT INTO `song_chord` VALUES (1037,'Dm',2);
INSERT INTO `song_chord` VALUES (1037,'E7',3);
INSERT INTO `song_chord` VALUES (1037,'Em',4);
INSERT INTO `song_chord` VALUES (1037,'E',5);
INSERT INTO `song_chord` VALUES (1037,'C',6);
INSERT INTO `song_chord` VALUES (1037,'G',7);
INSERT INTO `song_chord` VALUES (1038,'Em',0);
INSERT INTO `song_chord` VALUES (1038,'B7',1);
INSERT INTO `song_chord` VALUES (1039,'C',0);
INSERT INTO `song_chord` VALUES (1039,'E7',1);
INSERT INTO `song_chord` VALUES (1039,'Am',2);
INSERT INTO `song_chord` VALUES (1039,'G7',3);
INSERT INTO `song_chord` VALUES (1040,'Em',0);
INSERT INTO `song_chord` VALUES (1040,'Am',1);
INSERT INTO `song_chord` VALUES (1041,'Am',0);
INSERT INTO `song_chord` VALUES (1041,'F',1);
INSERT INTO `song_chord` VALUES (1041,'E',2);
INSERT INTO `song_chord` VALUES (1041,'G',3);
INSERT INTO `song_chord` VALUES (1042,'Em',0);
INSERT INTO `song_chord` VALUES (1042,'Am',1);
INSERT INTO `song_chord` VALUES (1042,'B7',2);
INSERT INTO `song_chord` VALUES (1042,'D',3);
INSERT INTO `song_chord` VALUES (1043,'Em',0);
INSERT INTO `song_chord` VALUES (1043,'D',1);
INSERT INTO `song_chord` VALUES (1043,'Am',2);
INSERT INTO `song_chord` VALUES (1043,'B7',3);
INSERT INTO `song_chord` VALUES (1043,'C',4);
INSERT INTO `song_chord` VALUES (1043,'G',5);
INSERT INTO `song_chord` VALUES (1043,'Bm',6);
INSERT INTO `song_chord` VALUES (1044,'Am',0);
INSERT INTO `song_chord` VALUES (1044,'G',1);
INSERT INTO `song_chord` VALUES (1044,'F',2);
INSERT INTO `song_chord` VALUES (1044,'E',3);
INSERT INTO `song_chord` VALUES (1045,'Em',0);
INSERT INTO `song_chord` VALUES (1045,'Am',1);
INSERT INTO `song_chord` VALUES (1045,'B7',2);
INSERT INTO `song_chord` VALUES (1045,'C',3);
INSERT INTO `song_chord` VALUES (1045,'D',4);
INSERT INTO `song_chord` VALUES (1045,'G',5);
INSERT INTO `song_chord` VALUES (1045,'Bm',6);
INSERT INTO `song_chord` VALUES (1046,'Em',0);
INSERT INTO `song_chord` VALUES (1046,'C',1);
INSERT INTO `song_chord` VALUES (1046,'B7',2);
INSERT INTO `song_chord` VALUES (1046,'Am',3);
INSERT INTO `song_chord` VALUES (1047,'Em',0);
INSERT INTO `song_chord` VALUES (1047,'Am',1);
INSERT INTO `song_chord` VALUES (1047,'B7',2);
INSERT INTO `song_chord` VALUES (1047,'C7',3);
INSERT INTO `song_chord` VALUES (1047,'C',4);
INSERT INTO `song_chord` VALUES (1048,'Am',0);
INSERT INTO `song_chord` VALUES (1048,'Em',1);
INSERT INTO `song_chord` VALUES (1048,'F',2);
INSERT INTO `song_chord` VALUES (1048,'E',3);
INSERT INTO `song_chord` VALUES (1049,'D',0);
INSERT INTO `song_chord` VALUES (1049,'Bm',1);
INSERT INTO `song_chord` VALUES (1049,'G',2);
INSERT INTO `song_chord` VALUES (1049,'E',3);
INSERT INTO `song_chord` VALUES (1049,'A',4);
INSERT INTO `song_chord` VALUES (1049,'F#',5);
INSERT INTO `song_chord` VALUES (1050,'Am',0);
INSERT INTO `song_chord` VALUES (1050,'E',1);
INSERT INTO `song_chord` VALUES (1050,'C',2);
INSERT INTO `song_chord` VALUES (1050,'F',3);
INSERT INTO `song_chord` VALUES (1050,'Dm',4);
INSERT INTO `song_chord` VALUES (1051,'Em',0);
INSERT INTO `song_chord` VALUES (1051,'Am',1);
INSERT INTO `song_chord` VALUES (1051,'B7',2);
INSERT INTO `song_chord` VALUES (1051,'D',3);
INSERT INTO `song_chord` VALUES (1052,'C',0);
INSERT INTO `song_chord` VALUES (1052,'Am',1);
INSERT INTO `song_chord` VALUES (1052,'F',2);
INSERT INTO `song_chord` VALUES (1052,'G',3);
INSERT INTO `song_chord` VALUES (1052,'G#',4);
INSERT INTO `song_chord` VALUES (1053,'G',0);
INSERT INTO `song_chord` VALUES (1053,'Em',1);
INSERT INTO `song_chord` VALUES (1053,'Am',2);
INSERT INTO `song_chord` VALUES (1053,'Bm',3);
INSERT INTO `song_chord` VALUES (1053,'A',4);
INSERT INTO `song_chord` VALUES (1054,'Am',0);
INSERT INTO `song_chord` VALUES (1054,'F',1);
INSERT INTO `song_chord` VALUES (1054,'E',2);
INSERT INTO `song_chord` VALUES (1054,'E7',3);
INSERT INTO `song_chord` VALUES (1054,'G',4);
INSERT INTO `song_chord` VALUES (1055,'Dm',0);
INSERT INTO `song_chord` VALUES (1055,'G',1);
INSERT INTO `song_chord` VALUES (1055,'A#',2);
INSERT INTO `song_chord` VALUES (1055,'C',3);
INSERT INTO `song_chord` VALUES (1055,'A7',4);
INSERT INTO `song_chord` VALUES (1056,'Bm',0);
INSERT INTO `song_chord` VALUES (1056,'C',1);
INSERT INTO `song_chord` VALUES (1056,'D',2);
INSERT INTO `song_chord` VALUES (1056,'F#m',3);
INSERT INTO `song_chord` VALUES (1056,'G',4);
INSERT INTO `song_chord` VALUES (1056,'F#',5);
INSERT INTO `song_chord` VALUES (1057,'Am',0);
INSERT INTO `song_chord` VALUES (1057,'G',1);
INSERT INTO `song_chord` VALUES (1057,'F',2);
INSERT INTO `song_chord` VALUES (1057,'E',3);
INSERT INTO `song_chord` VALUES (1058,'Am',0);
INSERT INTO `song_chord` VALUES (1058,'Dm',1);
INSERT INTO `song_chord` VALUES (1058,'E',2);
INSERT INTO `song_chord` VALUES (1058,'F',3);
INSERT INTO `song_chord` VALUES (1059,'D',0);
INSERT INTO `song_chord` VALUES (1059,'F#m',1);
INSERT INTO `song_chord` VALUES (1059,'D7',2);
INSERT INTO `song_chord` VALUES (1059,'Em',3);
INSERT INTO `song_chord` VALUES (1059,'G',4);
INSERT INTO `song_chord` VALUES (1059,'A',5);
INSERT INTO `song_chord` VALUES (1059,'Bm',6);
INSERT INTO `song_chord` VALUES (1059,'E7',7);
INSERT INTO `song_chord` VALUES (1060,'Em',0);
INSERT INTO `song_chord` VALUES (1060,'Am',1);
INSERT INTO `song_chord` VALUES (1060,'B7',2);
INSERT INTO `song_chord` VALUES (1060,'D7',3);
INSERT INTO `song_chord` VALUES (1060,'G',4);
INSERT INTO `song_chord` VALUES (1061,'C',0);
INSERT INTO `song_chord` VALUES (1061,'Am',1);
INSERT INTO `song_chord` VALUES (1061,'F',2);
INSERT INTO `song_chord` VALUES (1061,'G',3);
INSERT INTO `song_chord` VALUES (1062,'Am',0);
INSERT INTO `song_chord` VALUES (1062,'G',1);
INSERT INTO `song_chord` VALUES (1063,'Am',0);
INSERT INTO `song_chord` VALUES (1063,'G',1);
INSERT INTO `song_chord` VALUES (1064,'Am',0);
INSERT INTO `song_chord` VALUES (1064,'E7',1);
INSERT INTO `song_chord` VALUES (1064,'A7',2);
INSERT INTO `song_chord` VALUES (1064,'Dm',3);
INSERT INTO `song_chord` VALUES (1065,'E',0);
INSERT INTO `song_chord` VALUES (1065,'A',1);
INSERT INTO `song_chord` VALUES (1065,'F#',2);
INSERT INTO `song_chord` VALUES (1065,'B',3);
INSERT INTO `song_chord` VALUES (1065,'B7',4);
INSERT INTO `song_chord` VALUES (1065,'C#m',5);
INSERT INTO `song_chord` VALUES (1065,'G#',6);
INSERT INTO `song_chord` VALUES (1066,'Am',0);
INSERT INTO `song_chord` VALUES (1066,'E7',1);
INSERT INTO `song_chord` VALUES (1066,'F',2);
INSERT INTO `song_chord` VALUES (1066,'G',3);
INSERT INTO `song_chord` VALUES (1067,'Am',0);
INSERT INTO `song_chord` VALUES (1067,'E',1);
INSERT INTO `song_chord` VALUES (1067,'E7',2);
INSERT INTO `song_chord` VALUES (1067,'A7',3);
INSERT INTO `song_chord` VALUES (1067,'Dm',4);
INSERT INTO `song_chord` VALUES (1067,'F',5);
INSERT INTO `song_chord` VALUES (1068,'Bm',0);
INSERT INTO `song_chord` VALUES (1069,'C',0);
INSERT INTO `song_chord` VALUES (1069,'Am',1);
INSERT INTO `song_chord` VALUES (1069,'F',2);
INSERT INTO `song_chord` VALUES (1069,'E',3);
INSERT INTO `song_chord` VALUES (1069,'Dm',4);
INSERT INTO `song_chord` VALUES (1069,'Dm9',5);
INSERT INTO `song_chord` VALUES (1069,'G',6);
INSERT INTO `song_chord` VALUES (1070,'Em',0);
INSERT INTO `song_chord` VALUES (1070,'Am',1);
INSERT INTO `song_chord` VALUES (1070,'B7',2);
INSERT INTO `song_chord` VALUES (1071,'D',0);
INSERT INTO `song_chord` VALUES (1071,'Bm',1);
INSERT INTO `song_chord` VALUES (1071,'G',2);
INSERT INTO `song_chord` VALUES (1071,'A',3);
INSERT INTO `song_chord` VALUES (1071,'F#',4);
INSERT INTO `song_chord` VALUES (1072,'Am',0);
INSERT INTO `song_chord` VALUES (1072,'F',1);
INSERT INTO `song_chord` VALUES (1072,'E',2);
INSERT INTO `song_chord` VALUES (1072,'B7',3);
INSERT INTO `song_chord` VALUES (1072,'Dm',4);
INSERT INTO `song_chord` VALUES (1072,'G',5);
INSERT INTO `song_chord` VALUES (1073,'Am',0);
INSERT INTO `song_chord` VALUES (1073,'E',1);
INSERT INTO `song_chord` VALUES (1073,'G',2);
INSERT INTO `song_chord` VALUES (1073,'F',3);
INSERT INTO `song_chord` VALUES (1074,'Dm',0);
INSERT INTO `song_chord` VALUES (1074,'A7',1);
INSERT INTO `song_chord` VALUES (1074,'Gm',2);
INSERT INTO `song_chord` VALUES (1074,'A#',3);
INSERT INTO `song_chord` VALUES (1074,'Am',4);
INSERT INTO `song_chord` VALUES (1074,'C',5);
INSERT INTO `song_chord` VALUES (1075,'E',0);
INSERT INTO `song_chord` VALUES (1075,'A',1);
INSERT INTO `song_chord` VALUES (1075,'D',2);
INSERT INTO `song_chord` VALUES (1076,'A',0);
INSERT INTO `song_chord` VALUES (1076,'F#m',1);
INSERT INTO `song_chord` VALUES (1077,'G',0);
INSERT INTO `song_chord` VALUES (1077,'Am',1);
INSERT INTO `song_chord` VALUES (1077,'C',2);
INSERT INTO `song_chord` VALUES (1077,'B7',3);
INSERT INTO `song_chord` VALUES (1078,'D',0);
INSERT INTO `song_chord` VALUES (1078,'E',1);
INSERT INTO `song_chord` VALUES (1078,'A',2);
INSERT INTO `song_chord` VALUES (1078,'A7',3);
INSERT INTO `song_chord` VALUES (1079,'Am',0);
INSERT INTO `song_chord` VALUES (1079,'Dm',1);
INSERT INTO `song_chord` VALUES (1079,'E',2);
INSERT INTO `song_chord` VALUES (1079,'F',3);
INSERT INTO `song_chord` VALUES (1079,'G',4);
INSERT INTO `song_chord` VALUES (1080,'B',0);
INSERT INTO `song_chord` VALUES (1080,'Am',1);
INSERT INTO `song_chord` VALUES (1080,'Em',2);
INSERT INTO `song_chord` VALUES (1081,'G',0);
INSERT INTO `song_chord` VALUES (1081,'Em',1);
INSERT INTO `song_chord` VALUES (1081,'C',2);
INSERT INTO `song_chord` VALUES (1081,'A',3);
INSERT INTO `song_chord` VALUES (1081,'D',4);
INSERT INTO `song_chord` VALUES (1082,'E',0);
INSERT INTO `song_chord` VALUES (1082,'Am',1);
INSERT INTO `song_chord` VALUES (1082,'Dm',2);
INSERT INTO `song_chord` VALUES (1082,'G7',3);
INSERT INTO `song_chord` VALUES (1082,'G',4);
INSERT INTO `song_chord` VALUES (1082,'E7',5);
INSERT INTO `song_chord` VALUES (1082,'F7M',6);
INSERT INTO `song_chord` VALUES (1083,'D',0);
INSERT INTO `song_chord` VALUES (1083,'F#m',1);
INSERT INTO `song_chord` VALUES (1083,'G',2);
INSERT INTO `song_chord` VALUES (1083,'Em',3);
INSERT INTO `song_chord` VALUES (1083,'Em6',4);
INSERT INTO `song_chord` VALUES (1083,'A7',5);
INSERT INTO `song_chord` VALUES (1083,'F#',6);
INSERT INTO `song_chord` VALUES (1083,'A',7);
INSERT INTO `song_chord` VALUES (1084,'Am',0);
INSERT INTO `song_chord` VALUES (1084,'E7',1);
INSERT INTO `song_chord` VALUES (1084,'F',2);
INSERT INTO `song_chord` VALUES (1084,'E',3);
INSERT INTO `song_chord` VALUES (1084,'C',4);
INSERT INTO `song_chord` VALUES (1084,'G',5);
INSERT INTO `song_chord` VALUES (1085,'Am',0);
INSERT INTO `song_chord` VALUES (1085,'F',1);
INSERT INTO `song_chord` VALUES (1085,'Dm',2);
INSERT INTO `song_chord` VALUES (1085,'E',3);
INSERT INTO `song_chord` VALUES (1086,'Em',0);
INSERT INTO `song_chord` VALUES (1086,'D',1);
INSERT INTO `song_chord` VALUES (1086,'Am',2);
INSERT INTO `song_chord` VALUES (1087,'Dm',0);
INSERT INTO `song_chord` VALUES (1087,'A7',1);
INSERT INTO `song_chord` VALUES (1088,'Am',0);
INSERT INTO `song_chord` VALUES (1088,'G',1);
INSERT INTO `song_chord` VALUES (1088,'F',2);
INSERT INTO `song_chord` VALUES (1088,'E',3);
INSERT INTO `song_chord` VALUES (1089,'C',0);
INSERT INTO `song_chord` VALUES (1089,'F',1);
INSERT INTO `song_chord` VALUES (1089,'G',2);
INSERT INTO `song_chord` VALUES (1089,'Fm',3);
INSERT INTO `song_chord` VALUES (1089,'Cm',4);
INSERT INTO `song_chord` VALUES (1089,'A#',5);
INSERT INTO `song_chord` VALUES (1089,'G#',6);
INSERT INTO `song_chord` VALUES (1090,'C',0);
INSERT INTO `song_chord` VALUES (1090,'Am',1);
INSERT INTO `song_chord` VALUES (1090,'G7',2);
INSERT INTO `song_chord` VALUES (1090,'F',3);
INSERT INTO `song_chord` VALUES (1090,'G',4);
INSERT INTO `song_chord` VALUES (1091,'C',0);
INSERT INTO `song_chord` VALUES (1091,'E',1);
INSERT INTO `song_chord` VALUES (1091,'F',2);
INSERT INTO `song_chord` VALUES (1091,'Dm',3);
INSERT INTO `song_chord` VALUES (1091,'G',4);
INSERT INTO `song_chord` VALUES (1091,'D7',5);
INSERT INTO `song_chord` VALUES (1091,'D#',6);
INSERT INTO `song_chord` VALUES (1091,'Gm',7);
INSERT INTO `song_chord` VALUES (1091,'Cm',8);
INSERT INTO `song_chord` VALUES (1092,'Em',0);
INSERT INTO `song_chord` VALUES (1092,'C',1);
INSERT INTO `song_chord` VALUES (1092,'B7',2);
INSERT INTO `song_chord` VALUES (1092,'G',3);
INSERT INTO `song_chord` VALUES (1093,'Am',0);
INSERT INTO `song_chord` VALUES (1093,'F',1);
INSERT INTO `song_chord` VALUES (1093,'G',2);
INSERT INTO `song_chord` VALUES (1093,'E',3);
INSERT INTO `song_chord` VALUES (1093,'E7',4);
INSERT INTO `song_chord` VALUES (1094,'Am',0);
INSERT INTO `song_chord` VALUES (1094,'Dm',1);
INSERT INTO `song_chord` VALUES (1094,'F',2);
INSERT INTO `song_chord` VALUES (1094,'E',3);
INSERT INTO `song_chord` VALUES (1095,'Am',0);
INSERT INTO `song_chord` VALUES (1095,'F7',1);
INSERT INTO `song_chord` VALUES (1095,'Dm',2);
INSERT INTO `song_chord` VALUES (1095,'E',3);
INSERT INTO `song_chord` VALUES (1095,'A7',4);
INSERT INTO `song_chord` VALUES (1095,'A#7',5);
INSERT INTO `song_chord` VALUES (1095,'Gm',6);
INSERT INTO `song_chord` VALUES (1095,'C',7);
INSERT INTO `song_chord` VALUES (1096,'Am',0);
INSERT INTO `song_chord` VALUES (1096,'F',1);
INSERT INTO `song_chord` VALUES (1096,'E',2);
INSERT INTO `song_chord` VALUES (1096,'G',3);
INSERT INTO `song_chord` VALUES (1097,'Dm9',0);
INSERT INTO `song_chord` VALUES (1097,'Am',1);
INSERT INTO `song_chord` VALUES (1097,'Am6',2);
INSERT INTO `song_chord` VALUES (1097,'D7',3);
INSERT INTO `song_chord` VALUES (1097,'G',4);
INSERT INTO `song_chord` VALUES (1097,'Bm',5);
INSERT INTO `song_chord` VALUES (1097,'C',6);
INSERT INTO `song_chord` VALUES (1097,'F#',7);
INSERT INTO `song_chord` VALUES (1097,'A',8);
INSERT INTO `song_chord` VALUES (1098,'Em',0);
INSERT INTO `song_chord` VALUES (1098,'G',1);
INSERT INTO `song_chord` VALUES (1098,'B7',2);
INSERT INTO `song_chord` VALUES (1098,'Am',3);
INSERT INTO `song_chord` VALUES (1098,'C',4);
INSERT INTO `song_chord` VALUES (1099,'Dm',0);
INSERT INTO `song_chord` VALUES (1099,'F',1);
INSERT INTO `song_chord` VALUES (1099,'A#',2);
INSERT INTO `song_chord` VALUES (1099,'A7',3);
INSERT INTO `song_chord` VALUES (1099,'C',4);
INSERT INTO `song_chord` VALUES (1099,'A',5);
INSERT INTO `song_chord` VALUES (1099,'G',6);
INSERT INTO `song_chord` VALUES (1100,'Em',0);
INSERT INTO `song_chord` VALUES (1100,'Am',1);
INSERT INTO `song_chord` VALUES (1100,'B7',2);
INSERT INTO `song_chord` VALUES (1101,'Em',0);
INSERT INTO `song_chord` VALUES (1101,'Am',1);
INSERT INTO `song_chord` VALUES (1101,'B7',2);
INSERT INTO `song_chord` VALUES (1102,'Em',0);
INSERT INTO `song_chord` VALUES (1102,'Am',1);
INSERT INTO `song_chord` VALUES (1103,'E',0);
INSERT INTO `song_chord` VALUES (1103,'C#m',1);
INSERT INTO `song_chord` VALUES (1103,'G#',2);
INSERT INTO `song_chord` VALUES (1103,'A',3);
INSERT INTO `song_chord` VALUES (1103,'B7',4);
INSERT INTO `song_chord` VALUES (1104,'D',0);
INSERT INTO `song_chord` VALUES (1104,'Em',1);
INSERT INTO `song_chord` VALUES (1104,'D7',2);
INSERT INTO `song_chord` VALUES (1104,'G',3);
INSERT INTO `song_chord` VALUES (1104,'A',4);
INSERT INTO `song_chord` VALUES (1105,'Em',0);
INSERT INTO `song_chord` VALUES (1105,'F',1);
INSERT INTO `song_chord` VALUES (1105,'E',2);
INSERT INTO `song_chord` VALUES (1105,'Am',3);
INSERT INTO `song_chord` VALUES (1105,'G',4);
INSERT INTO `song_chord` VALUES (1105,'F#',5);
INSERT INTO `song_chord` VALUES (1105,'A',6);
INSERT INTO `song_chord` VALUES (1105,'Bm',7);
INSERT INTO `song_chord` VALUES (1105,'D',8);
INSERT INTO `song_chord` VALUES (1106,'C',0);
INSERT INTO `song_chord` VALUES (1106,'Em',1);
INSERT INTO `song_chord` VALUES (1106,'Am',2);
INSERT INTO `song_chord` VALUES (1106,'F',3);
INSERT INTO `song_chord` VALUES (1106,'G',4);
INSERT INTO `song_chord` VALUES (1107,'Am',0);
INSERT INTO `song_chord` VALUES (1107,'C',1);
INSERT INTO `song_chord` VALUES (1107,'E',2);
INSERT INTO `song_chord` VALUES (1107,'F',3);
INSERT INTO `song_chord` VALUES (1107,'A7',4);
INSERT INTO `song_chord` VALUES (1107,'Dm',5);
INSERT INTO `song_chord` VALUES (1107,'G',6);
INSERT INTO `song_chord` VALUES (1108,'Am',0);
INSERT INTO `song_chord` VALUES (1108,'E7',1);
INSERT INTO `song_chord` VALUES (1108,'F',2);
INSERT INTO `song_chord` VALUES (1108,'E',3);
INSERT INTO `song_chord` VALUES (1108,'Dm',4);
INSERT INTO `song_chord` VALUES (1109,'Am',0);
INSERT INTO `song_chord` VALUES (1109,'G',1);
INSERT INTO `song_chord` VALUES (1109,'F',2);
INSERT INTO `song_chord` VALUES (1109,'E',3);
INSERT INTO `song_chord` VALUES (1110,'Dm',0);
INSERT INTO `song_chord` VALUES (1110,'Gm',1);
INSERT INTO `song_chord` VALUES (1110,'A',2);
INSERT INTO `song_chord` VALUES (1110,'A#',3);
INSERT INTO `song_chord` VALUES (1111,'Am',0);
INSERT INTO `song_chord` VALUES (1111,'Dm',1);
INSERT INTO `song_chord` VALUES (1112,'Em',0);
INSERT INTO `song_chord` VALUES (1112,'Am',1);
INSERT INTO `song_chord` VALUES (1112,'F',2);
INSERT INTO `song_chord` VALUES (1112,'E',3);
INSERT INTO `song_chord` VALUES (1113,'Am',0);
INSERT INTO `song_chord` VALUES (1113,'G',1);
INSERT INTO `song_chord` VALUES (1113,'F',2);
INSERT INTO `song_chord` VALUES (1113,'E',3);
INSERT INTO `song_chord` VALUES (1113,'E7',4);
INSERT INTO `song_chord` VALUES (1114,'D',0);
INSERT INTO `song_chord` VALUES (1114,'Bm',1);
INSERT INTO `song_chord` VALUES (1114,'G',2);
INSERT INTO `song_chord` VALUES (1114,'A',3);
INSERT INTO `song_chord` VALUES (1114,'F#',4);
INSERT INTO `song_chord` VALUES (1115,'G',0);
INSERT INTO `song_chord` VALUES (1115,'B7',1);
INSERT INTO `song_chord` VALUES (1115,'Em',2);
INSERT INTO `song_chord` VALUES (1115,'C7',3);
INSERT INTO `song_chord` VALUES (1115,'Am',4);
INSERT INTO `song_chord` VALUES (1116,'E',0);
INSERT INTO `song_chord` VALUES (1116,'F#m',1);
INSERT INTO `song_chord` VALUES (1116,'B7',2);
INSERT INTO `song_chord` VALUES (1116,'C#m',3);
INSERT INTO `song_chord` VALUES (1116,'G#',4);
INSERT INTO `song_chord` VALUES (1117,'Em',0);
INSERT INTO `song_chord` VALUES (1117,'Am',1);
INSERT INTO `song_chord` VALUES (1117,'B7',2);
INSERT INTO `song_chord` VALUES (1117,'C',3);
INSERT INTO `song_chord` VALUES (1118,'Em',0);
INSERT INTO `song_chord` VALUES (1118,'Am',1);
INSERT INTO `song_chord` VALUES (1118,'B7',2);
INSERT INTO `song_chord` VALUES (1119,'C',0);
INSERT INTO `song_chord` VALUES (1119,'F',1);
INSERT INTO `song_chord` VALUES (1119,'E',2);
INSERT INTO `song_chord` VALUES (1120,'Em',0);
INSERT INTO `song_chord` VALUES (1120,'B7',1);
INSERT INTO `song_chord` VALUES (1120,'C',2);
INSERT INTO `song_chord` VALUES (1120,'Am',3);
INSERT INTO `song_chord` VALUES (1120,'G',4);
INSERT INTO `song_chord` VALUES (1121,'Bm',0);
INSERT INTO `song_chord` VALUES (1121,'A',1);
INSERT INTO `song_chord` VALUES (1121,'F#',2);
INSERT INTO `song_chord` VALUES (1121,'A7',3);
INSERT INTO `song_chord` VALUES (1121,'D',4);
INSERT INTO `song_chord` VALUES (1121,'G',5);
INSERT INTO `song_chord` VALUES (1122,'F#',0);
INSERT INTO `song_chord` VALUES (1122,'Em',1);
INSERT INTO `song_chord` VALUES (1122,'G',2);
INSERT INTO `song_chord` VALUES (1122,'Bm',3);
INSERT INTO `song_chord` VALUES (1122,'A',4);
INSERT INTO `song_chord` VALUES (1123,'Dm5',0);
INSERT INTO `song_chord` VALUES (1123,'Gm',1);
INSERT INTO `song_chord` VALUES (1123,'A7',2);
INSERT INTO `song_chord` VALUES (1123,'D',3);
INSERT INTO `song_chord` VALUES (1123,'C',4);
INSERT INTO `song_chord` VALUES (1123,'C7',5);
INSERT INTO `song_chord` VALUES (1123,'F',6);
INSERT INTO `song_chord` VALUES (1123,'A#',7);
INSERT INTO `song_chord` VALUES (1124,'E',0);
INSERT INTO `song_chord` VALUES (1124,'Dm9',1);
INSERT INTO `song_chord` VALUES (1125,'Dm',0);
INSERT INTO `song_chord` VALUES (1125,'C7',1);
INSERT INTO `song_chord` VALUES (1125,'A#7',2);
INSERT INTO `song_chord` VALUES (1125,'A7',3);
INSERT INTO `song_chord` VALUES (1126,'Am',0);
INSERT INTO `song_chord` VALUES (1126,'Dm',1);
INSERT INTO `song_chord` VALUES (1126,'G',2);
INSERT INTO `song_chord` VALUES (1127,'Em',0);
INSERT INTO `song_chord` VALUES (1127,'B7',1);
INSERT INTO `song_chord` VALUES (1127,'Am',2);
INSERT INTO `song_chord` VALUES (1127,'D',3);
INSERT INTO `song_chord` VALUES (1127,'G',4);
INSERT INTO `song_chord` VALUES (1127,'C',5);
INSERT INTO `song_chord` VALUES (1128,'A7',0);
INSERT INTO `song_chord` VALUES (1128,'D',1);
INSERT INTO `song_chord` VALUES (1128,'F#m',2);
INSERT INTO `song_chord` VALUES (1128,'G',3);
INSERT INTO `song_chord` VALUES (1128,'F#',4);
INSERT INTO `song_chord` VALUES (1128,'Bm',5);
INSERT INTO `song_chord` VALUES (1128,'Em',6);
INSERT INTO `song_chord` VALUES (1129,'C',0);
INSERT INTO `song_chord` VALUES (1129,'D',1);
INSERT INTO `song_chord` VALUES (1129,'Cm',2);
INSERT INTO `song_chord` VALUES (1129,'Gm',3);
INSERT INTO `song_chord` VALUES (1129,'D7',4);
INSERT INTO `song_chord` VALUES (1130,'Dm',0);
INSERT INTO `song_chord` VALUES (1130,'A7',1);
INSERT INTO `song_chord` VALUES (1130,'A#',2);
INSERT INTO `song_chord` VALUES (1131,'Dm',0);
INSERT INTO `song_chord` VALUES (1131,'A7',1);
INSERT INTO `song_chord` VALUES (1131,'Gm',2);
INSERT INTO `song_chord` VALUES (1131,'A',3);
INSERT INTO `song_chord` VALUES (1131,'A#',4);
INSERT INTO `song_chord` VALUES (1132,'E',0);
INSERT INTO `song_chord` VALUES (1132,'C#m',1);
INSERT INTO `song_chord` VALUES (1132,'G#',2);
INSERT INTO `song_chord` VALUES (1132,'A',3);
INSERT INTO `song_chord` VALUES (1132,'F#m',4);
INSERT INTO `song_chord` VALUES (1132,'B',5);
INSERT INTO `song_chord` VALUES (1133,'Am',0);
INSERT INTO `song_chord` VALUES (1133,'Dm',1);
INSERT INTO `song_chord` VALUES (1133,'E7',2);
INSERT INTO `song_chord` VALUES (1133,'C',3);
INSERT INTO `song_chord` VALUES (1133,'E',4);
INSERT INTO `song_chord` VALUES (1133,'F',5);
INSERT INTO `song_chord` VALUES (1133,'G#',6);
INSERT INTO `song_chord` VALUES (1133,'G',7);
INSERT INTO `song_chord` VALUES (1134,'G',0);
INSERT INTO `song_chord` VALUES (1134,'Em',1);
INSERT INTO `song_chord` VALUES (1134,'C',2);
INSERT INTO `song_chord` VALUES (1134,'D',3);
INSERT INTO `song_chord` VALUES (1134,'B7',4);
INSERT INTO `song_chord` VALUES (1134,'Am',5);
INSERT INTO `song_chord` VALUES (1135,'Am',0);
INSERT INTO `song_chord` VALUES (1135,'G',1);
INSERT INTO `song_chord` VALUES (1135,'F',2);
INSERT INTO `song_chord` VALUES (1135,'E',3);
INSERT INTO `song_chord` VALUES (1136,'Em',0);
INSERT INTO `song_chord` VALUES (1136,'B7',1);
INSERT INTO `song_chord` VALUES (1137,'E',0);
INSERT INTO `song_chord` VALUES (1137,'F',1);
INSERT INTO `song_chord` VALUES (1137,'G',2);
INSERT INTO `song_chord` VALUES (1137,'C',3);
INSERT INTO `song_chord` VALUES (1137,'Am',4);
INSERT INTO `song_chord` VALUES (1138,'C',0);
INSERT INTO `song_chord` VALUES (1138,'E',1);
INSERT INTO `song_chord` VALUES (1138,'Am',2);
INSERT INTO `song_chord` VALUES (1138,'F',3);
INSERT INTO `song_chord` VALUES (1139,'Bm',0);
INSERT INTO `song_chord` VALUES (1139,'Em',1);
INSERT INTO `song_chord` VALUES (1139,'G',2);
INSERT INTO `song_chord` VALUES (1139,'F#',3);
INSERT INTO `song_chord` VALUES (1140,'Am',0);
INSERT INTO `song_chord` VALUES (1140,'E',1);
INSERT INTO `song_chord` VALUES (1140,'E7',2);
INSERT INTO `song_chord` VALUES (1140,'G',3);
INSERT INTO `song_chord` VALUES (1140,'F',4);
INSERT INTO `song_chord` VALUES (1141,'Dm',0);
INSERT INTO `song_chord` VALUES (1141,'D7',1);
INSERT INTO `song_chord` VALUES (1141,'Gm',2);
INSERT INTO `song_chord` VALUES (1141,'A',3);
INSERT INTO `song_chord` VALUES (1141,'A#',4);
INSERT INTO `song_chord` VALUES (1142,'Dm',0);
INSERT INTO `song_chord` VALUES (1142,'Gm',1);
INSERT INTO `song_chord` VALUES (1143,'Em',0);
INSERT INTO `song_chord` VALUES (1143,'D',1);
INSERT INTO `song_chord` VALUES (1143,'G',2);
INSERT INTO `song_chord` VALUES (1143,'A',3);
INSERT INTO `song_chord` VALUES (1143,'Am',4);
INSERT INTO `song_chord` VALUES (1143,'C',5);
INSERT INTO `song_chord` VALUES (1144,'Em',0);
INSERT INTO `song_chord` VALUES (1144,'Am',1);
INSERT INTO `song_chord` VALUES (1144,'B7',2);
INSERT INTO `song_chord` VALUES (1144,'C',3);
INSERT INTO `song_chord` VALUES (1145,'Am',0);
INSERT INTO `song_chord` VALUES (1145,'G',1);
INSERT INTO `song_chord` VALUES (1146,'E',0);
INSERT INTO `song_chord` VALUES (1146,'Am',1);
INSERT INTO `song_chord` VALUES (1146,'Dm',2);
INSERT INTO `song_chord` VALUES (1146,'F',3);
INSERT INTO `song_chord` VALUES (1147,'D',0);
INSERT INTO `song_chord` VALUES (1147,'F#m',1);
INSERT INTO `song_chord` VALUES (1147,'G',2);
INSERT INTO `song_chord` VALUES (1147,'A',3);
INSERT INTO `song_chord` VALUES (1147,'Em',4);
INSERT INTO `song_chord` VALUES (1148,'Am',0);
INSERT INTO `song_chord` VALUES (1148,'E',1);
INSERT INTO `song_chord` VALUES (1148,'Dm',2);
INSERT INTO `song_chord` VALUES (1148,'C',3);
INSERT INTO `song_chord` VALUES (1148,'F',4);
INSERT INTO `song_chord` VALUES (1149,'Am',0);
INSERT INTO `song_chord` VALUES (1149,'F',1);
INSERT INTO `song_chord` VALUES (1149,'G',2);
INSERT INTO `song_chord` VALUES (1149,'E',3);
INSERT INTO `song_chord` VALUES (1150,'D',0);
INSERT INTO `song_chord` VALUES (1150,'G',1);
INSERT INTO `song_chord` VALUES (1150,'A',2);
INSERT INTO `song_chord` VALUES (1150,'Bm',3);
INSERT INTO `song_chord` VALUES (1151,'D',0);
INSERT INTO `song_chord` VALUES (1151,'G',1);
INSERT INTO `song_chord` VALUES (1151,'A7',2);
INSERT INTO `song_chord` VALUES (1151,'Bm',3);
INSERT INTO `song_chord` VALUES (1151,'A',4);
INSERT INTO `song_chord` VALUES (1152,'Am',0);
INSERT INTO `song_chord` VALUES (1152,'G',1);
INSERT INTO `song_chord` VALUES (1152,'F',2);
INSERT INTO `song_chord` VALUES (1152,'E',3);
INSERT INTO `song_chord` VALUES (1153,'D',0);
INSERT INTO `song_chord` VALUES (1153,'A',1);
INSERT INTO `song_chord` VALUES (1154,'D',0);
INSERT INTO `song_chord` VALUES (1154,'G',1);
INSERT INTO `song_chord` VALUES (1154,'A7',2);
INSERT INTO `song_chord` VALUES (1154,'Bm',3);
INSERT INTO `song_chord` VALUES (1154,'A',4);
INSERT INTO `song_chord` VALUES (1155,'C',0);
INSERT INTO `song_chord` VALUES (1155,'E',1);
INSERT INTO `song_chord` VALUES (1155,'Am',2);
INSERT INTO `song_chord` VALUES (1155,'G7',3);
INSERT INTO `song_chord` VALUES (1156,'Em',0);
INSERT INTO `song_chord` VALUES (1156,'D',1);
INSERT INTO `song_chord` VALUES (1156,'Am',2);
INSERT INTO `song_chord` VALUES (1157,'Em',0);
INSERT INTO `song_chord` VALUES (1157,'Am',1);
INSERT INTO `song_chord` VALUES (1157,'B7',2);
INSERT INTO `song_chord` VALUES (1157,'D',3);
INSERT INTO `song_chord` VALUES (1157,'C',4);
INSERT INTO `song_chord` VALUES (1158,'G',0);
INSERT INTO `song_chord` VALUES (1158,'Am',1);
INSERT INTO `song_chord` VALUES (1158,'F',2);
INSERT INTO `song_chord` VALUES (1158,'E',3);
INSERT INTO `song_chord` VALUES (1158,'E7',4);
INSERT INTO `song_chord` VALUES (1159,'D',0);
INSERT INTO `song_chord` VALUES (1159,'A',1);
INSERT INTO `song_chord` VALUES (1159,'G',2);
INSERT INTO `song_chord` VALUES (1159,'F#m',3);
INSERT INTO `song_chord` VALUES (1159,'Em',4);
INSERT INTO `song_chord` VALUES (1160,'Em',0);
INSERT INTO `song_chord` VALUES (1160,'Am',1);
INSERT INTO `song_chord` VALUES (1160,'B7',2);
INSERT INTO `song_chord` VALUES (1160,'C',3);
INSERT INTO `song_chord` VALUES (1161,'Em',0);
INSERT INTO `song_chord` VALUES (1161,'Am',1);
INSERT INTO `song_chord` VALUES (1161,'B7',2);
INSERT INTO `song_chord` VALUES (1161,'C',3);
INSERT INTO `song_chord` VALUES (1162,'Am',0);
INSERT INTO `song_chord` VALUES (1162,'G',1);
INSERT INTO `song_chord` VALUES (1162,'C',2);
INSERT INTO `song_chord` VALUES (1162,'F',3);
INSERT INTO `song_chord` VALUES (1162,'E',4);
INSERT INTO `song_chord` VALUES (1158,'Dm',5);
INSERT INTO `song_chord` VALUES (1163,'G',0);
INSERT INTO `song_chord` VALUES (1163,'Am',1);
INSERT INTO `song_chord` VALUES (1163,'F',2);
INSERT INTO `song_chord` VALUES (1163,'E',3);
INSERT INTO `song_chord` VALUES (1163,'E7',4);
INSERT INTO `song_chord` VALUES (1163,'Dm',5);
INSERT INTO `song_chord` VALUES (1164,'G',0);
INSERT INTO `song_chord` VALUES (1164,'Am',1);
INSERT INTO `song_chord` VALUES (1164,'F',2);
INSERT INTO `song_chord` VALUES (1164,'E',3);
INSERT INTO `song_chord` VALUES (1164,'E7',4);
INSERT INTO `song_chord` VALUES (1164,'C',5);
INSERT INTO `song_chord` VALUES (1165,'Dm',0);
INSERT INTO `song_chord` VALUES (1165,'F',1);
INSERT INTO `song_chord` VALUES (1165,'Gm',2);
INSERT INTO `song_chord` VALUES (1165,'A7',3);
INSERT INTO `song_chord` VALUES (1166,'C',0);
INSERT INTO `song_chord` VALUES (1166,'G',1);
INSERT INTO `song_chord` VALUES (1166,'Am',2);
INSERT INTO `song_chord` VALUES (1166,'E',3);
INSERT INTO `song_chord` VALUES (1166,'F',4);
INSERT INTO `song_chord` VALUES (1166,'A',5);
INSERT INTO `song_chord` VALUES (1166,'F#m',6);
INSERT INTO `song_chord` VALUES (1167,'G',0);
INSERT INTO `song_chord` VALUES (1167,'Em',1);
INSERT INTO `song_chord` VALUES (1167,'Am',2);
INSERT INTO `song_chord` VALUES (1167,'Bm',3);
INSERT INTO `song_chord` VALUES (1167,'A',4);
INSERT INTO `song_chord` VALUES (1168,'Am',0);
INSERT INTO `song_chord` VALUES (1168,'Dm',1);
INSERT INTO `song_chord` VALUES (1168,'E',2);
INSERT INTO `song_chord` VALUES (1168,'E7',3);
INSERT INTO `song_chord` VALUES (1168,'F',4);
INSERT INTO `song_chord` VALUES (1169,'Em',0);
INSERT INTO `song_chord` VALUES (1169,'G',1);
INSERT INTO `song_chord` VALUES (1169,'B7',2);
INSERT INTO `song_chord` VALUES (1169,'D',3);
INSERT INTO `song_chord` VALUES (1170,'Em',0);
INSERT INTO `song_chord` VALUES (1170,'Am',1);
INSERT INTO `song_chord` VALUES (1170,'B7',2);
INSERT INTO `song_chord` VALUES (1170,'C7',3);
INSERT INTO `song_chord` VALUES (1171,'Am',0);
INSERT INTO `song_chord` VALUES (1171,'G',1);
INSERT INTO `song_chord` VALUES (1171,'F',2);
INSERT INTO `song_chord` VALUES (1171,'E',3);
INSERT INTO `song_chord` VALUES (1171,'Dm',4);
INSERT INTO `song_chord` VALUES (1172,'A',0);
INSERT INTO `song_chord` VALUES (1172,'E',1);
INSERT INTO `song_chord` VALUES (1172,'F',2);
INSERT INTO `song_chord` VALUES (1172,'Am',3);
INSERT INTO `song_chord` VALUES (1172,'E7',4);
INSERT INTO `song_chord` VALUES (1173,'Em',0);
INSERT INTO `song_chord` VALUES (1173,'G',1);
INSERT INTO `song_chord` VALUES (1173,'Am',2);
INSERT INTO `song_chord` VALUES (1174,'Am',0);
INSERT INTO `song_chord` VALUES (1174,'G',1);
INSERT INTO `song_chord` VALUES (1174,'F',2);
INSERT INTO `song_chord` VALUES (1174,'E',3);
INSERT INTO `song_chord` VALUES (1175,'Am',0);
INSERT INTO `song_chord` VALUES (1175,'G',1);
INSERT INTO `song_chord` VALUES (1175,'F',2);
INSERT INTO `song_chord` VALUES (1175,'E',3);
INSERT INTO `song_chord` VALUES (1176,'Am',0);
INSERT INTO `song_chord` VALUES (1176,'G',1);
INSERT INTO `song_chord` VALUES (1176,'F',2);
INSERT INTO `song_chord` VALUES (1176,'E7',3);
INSERT INTO `song_chord` VALUES (1177,'Dm',0);
INSERT INTO `song_chord` VALUES (1177,'Gm',1);
INSERT INTO `song_chord` VALUES (1177,'A',2);
INSERT INTO `song_chord` VALUES (1177,'A7',3);
INSERT INTO `song_chord` VALUES (1178,'C',0);
INSERT INTO `song_chord` VALUES (1178,'G',1);
INSERT INTO `song_chord` VALUES (1178,'Am',2);
INSERT INTO `song_chord` VALUES (1178,'E',3);
INSERT INTO `song_chord` VALUES (1178,'E7',4);
INSERT INTO `song_chord` VALUES (1179,'Dm',0);
INSERT INTO `song_chord` VALUES (1179,'A#',1);
INSERT INTO `song_chord` VALUES (1179,'A7',2);
INSERT INTO `song_chord` VALUES (1179,'A',3);
INSERT INTO `song_chord` VALUES (1180,'C',0);
INSERT INTO `song_chord` VALUES (1180,'Am',1);
INSERT INTO `song_chord` VALUES (1180,'Dm',2);
INSERT INTO `song_chord` VALUES (1180,'G',3);
INSERT INTO `song_chord` VALUES (1180,'A7',4);
INSERT INTO `song_chord` VALUES (1180,'E',5);
INSERT INTO `song_chord` VALUES (1181,'Dm',0);
INSERT INTO `song_chord` VALUES (1181,'F',1);
INSERT INTO `song_chord` VALUES (1181,'C',2);
INSERT INTO `song_chord` VALUES (1181,'Am',3);
INSERT INTO `song_chord` VALUES (1181,'A#',4);
INSERT INTO `song_chord` VALUES (1181,'A',5);
INSERT INTO `song_chord` VALUES (1182,'D7',0);
INSERT INTO `song_chord` VALUES (1182,'Em',1);
INSERT INTO `song_chord` VALUES (1182,'F',2);
INSERT INTO `song_chord` VALUES (1182,'E',3);
INSERT INTO `song_chord` VALUES (1182,'Am',4);
INSERT INTO `song_chord` VALUES (1183,'Dm',0);
INSERT INTO `song_chord` VALUES (1183,'Am',1);
INSERT INTO `song_chord` VALUES (1183,'Gm',2);
INSERT INTO `song_chord` VALUES (1183,'A7',3);
INSERT INTO `song_chord` VALUES (1184,'Am',0);
INSERT INTO `song_chord` VALUES (1184,'F',1);
INSERT INTO `song_chord` VALUES (1184,'E7',2);
INSERT INTO `song_chord` VALUES (1184,'E',3);
INSERT INTO `song_chord` VALUES (1184,'G',4);
INSERT INTO `song_chord` VALUES (1184,'C',5);
INSERT INTO `song_chord` VALUES (1184,'D',6);
INSERT INTO `song_chord` VALUES (1185,'Dm',0);
INSERT INTO `song_chord` VALUES (1185,'C',1);
INSERT INTO `song_chord` VALUES (1185,'F',2);
INSERT INTO `song_chord` VALUES (1185,'G',3);
INSERT INTO `song_chord` VALUES (1185,'A',4);
INSERT INTO `song_chord` VALUES (1185,'Gm',5);
INSERT INTO `song_chord` VALUES (1185,'A7',6);
INSERT INTO `song_chord` VALUES (1186,'E',0);
INSERT INTO `song_chord` VALUES (1186,'G#',1);
INSERT INTO `song_chord` VALUES (1186,'C#m',2);
INSERT INTO `song_chord` VALUES (1186,'F#m',3);
INSERT INTO `song_chord` VALUES (1186,'B7',4);
INSERT INTO `song_chord` VALUES (1186,'A',5);
INSERT INTO `song_chord` VALUES (1187,'D',0);
INSERT INTO `song_chord` VALUES (1187,'F#',1);
INSERT INTO `song_chord` VALUES (1187,'Bm',2);
INSERT INTO `song_chord` VALUES (1187,'A',3);
INSERT INTO `song_chord` VALUES (1187,'G',4);
INSERT INTO `song_chord` VALUES (1188,'Em',0);
INSERT INTO `song_chord` VALUES (1188,'D',1);
INSERT INTO `song_chord` VALUES (1188,'C',2);
INSERT INTO `song_chord` VALUES (1188,'Am',3);
INSERT INTO `song_chord` VALUES (1188,'D7',4);
INSERT INTO `song_chord` VALUES (1188,'G',5);
INSERT INTO `song_chord` VALUES (1188,'Bm',6);
INSERT INTO `song_chord` VALUES (1188,'C7',7);
INSERT INTO `song_chord` VALUES (1189,'D',0);
INSERT INTO `song_chord` VALUES (1189,'Bm',1);
INSERT INTO `song_chord` VALUES (1189,'A',2);
INSERT INTO `song_chord` VALUES (1189,'G',3);
INSERT INTO `song_chord` VALUES (1189,'A7',4);
INSERT INTO `song_chord` VALUES (1190,'Am',0);
INSERT INTO `song_chord` VALUES (1190,'F',1);
INSERT INTO `song_chord` VALUES (1190,'E7',2);
INSERT INTO `song_chord` VALUES (1190,'Dm',3);
INSERT INTO `song_chord` VALUES (1190,'F7',4);
INSERT INTO `song_chord` VALUES (1191,'Dm',0);
INSERT INTO `song_chord` VALUES (1191,'F',1);
INSERT INTO `song_chord` VALUES (1191,'Am',2);
INSERT INTO `song_chord` VALUES (1191,'Gm',3);
INSERT INTO `song_chord` VALUES (1191,'A',4);
INSERT INTO `song_chord` VALUES (1191,'A#',5);
INSERT INTO `song_chord` VALUES (1192,'C',0);
INSERT INTO `song_chord` VALUES (1192,'E',1);
INSERT INTO `song_chord` VALUES (1192,'Am',2);
INSERT INTO `song_chord` VALUES (1192,'Dm',3);
INSERT INTO `song_chord` VALUES (1192,'E7',4);
INSERT INTO `song_chord` VALUES (1192,'G',5);
INSERT INTO `song_chord` VALUES (1192,'F',6);
INSERT INTO `song_chord` VALUES (1193,'Am',0);
INSERT INTO `song_chord` VALUES (1193,'G',1);
INSERT INTO `song_chord` VALUES (1193,'F',2);
INSERT INTO `song_chord` VALUES (1193,'E',3);
INSERT INTO `song_chord` VALUES (1194,'D',0);
INSERT INTO `song_chord` VALUES (1194,'F#m',1);
INSERT INTO `song_chord` VALUES (1194,'Bm',2);
INSERT INTO `song_chord` VALUES (1194,'Em',3);
INSERT INTO `song_chord` VALUES (1194,'A',4);
INSERT INTO `song_chord` VALUES (1194,'F#',5);
INSERT INTO `song_chord` VALUES (1194,'G',6);
INSERT INTO `song_chord` VALUES (1195,'Em',0);
INSERT INTO `song_chord` VALUES (1195,'Am',1);
INSERT INTO `song_chord` VALUES (1195,'B7',2);
INSERT INTO `song_chord` VALUES (1196,'Dm',0);
INSERT INTO `song_chord` VALUES (1196,'Gm',1);
INSERT INTO `song_chord` VALUES (1196,'A',2);
INSERT INTO `song_chord` VALUES (1196,'C7',3);
INSERT INTO `song_chord` VALUES (1196,'F',4);
INSERT INTO `song_chord` VALUES (1196,'Am',5);
INSERT INTO `song_chord` VALUES (1196,'A#',6);
INSERT INTO `song_chord` VALUES (1197,'C#dim',0);
INSERT INTO `song_chord` VALUES (1197,'A#7',1);
INSERT INTO `song_chord` VALUES (1197,'A7',2);
INSERT INTO `song_chord` VALUES (1197,'Dm',3);
INSERT INTO `song_chord` VALUES (1197,'Gm',4);
INSERT INTO `song_chord` VALUES (1198,'Am',0);
INSERT INTO `song_chord` VALUES (1198,'G',1);
INSERT INTO `song_chord` VALUES (1198,'F',2);
INSERT INTO `song_chord` VALUES (1198,'E',3);
INSERT INTO `song_chord` VALUES (1199,'D',0);
INSERT INTO `song_chord` VALUES (1199,'G',1);
INSERT INTO `song_chord` VALUES (1199,'A',2);
INSERT INTO `song_chord` VALUES (1199,'Bm',3);
INSERT INTO `song_chord` VALUES (1199,'F#',4);
INSERT INTO `song_chord` VALUES (1199,'E',5);
INSERT INTO `song_chord` VALUES (1199,'B',6);
INSERT INTO `song_chord` VALUES (1199,'C#',7);
INSERT INTO `song_chord` VALUES (1200,'Am',0);
INSERT INTO `song_chord` VALUES (1200,'Dm',1);
INSERT INTO `song_chord` VALUES (1200,'E',2);
INSERT INTO `song_chord` VALUES (1200,'F',3);
INSERT INTO `song_chord` VALUES (1201,'Em',0);
INSERT INTO `song_chord` VALUES (1201,'B7',1);
INSERT INTO `song_chord` VALUES (1201,'Am',2);
INSERT INTO `song_chord` VALUES (1201,'C',3);
INSERT INTO `song_chord` VALUES (1202,'Bm',0);
INSERT INTO `song_chord` VALUES (1202,'Em',1);
INSERT INTO `song_chord` VALUES (1202,'F#',2);
INSERT INTO `song_chord` VALUES (1202,'G',3);
INSERT INTO `song_chord` VALUES (1203,'Dm',0);
INSERT INTO `song_chord` VALUES (1203,'Gm',1);
INSERT INTO `song_chord` VALUES (1203,'A7',2);
INSERT INTO `song_chord` VALUES (1203,'C',3);
INSERT INTO `song_chord` VALUES (1203,'F',4);
INSERT INTO `song_chord` VALUES (1203,'A#',5);
INSERT INTO `song_chord` VALUES (1204,'Am',0);
INSERT INTO `song_chord` VALUES (1204,'Dm',1);
INSERT INTO `song_chord` VALUES (1204,'E',2);
INSERT INTO `song_chord` VALUES (1204,'F',3);
INSERT INTO `song_chord` VALUES (1204,'E7',4);
/*!40000 ALTER TABLE `song_chord` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-18 12:25:33
