-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.6.49-log - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour initialvfx
CREATE DATABASE IF NOT EXISTS `initialvfx` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `initialvfx`;

-- Listage de la structure de la table initialvfx. banque_account
CREATE TABLE IF NOT EXISTS `banque_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Entreprise` varchar(50) NOT NULL DEFAULT 'false',
  `Type` varchar(50) NOT NULL DEFAULT '0',
  `SteamID` varchar(50) NOT NULL DEFAULT '0',
  `CoSteamID` varchar(50) DEFAULT NULL,
  `Argent` int(11) NOT NULL DEFAULT '0',
  `IBAN` varchar(50) NOT NULL,
  `DataCompte` text NOT NULL,
  `LogTransaction` varchar(50000) NOT NULL DEFAULT '{}',
  `CarteCredit` varchar(50) NOT NULL DEFAULT '0',
  `CodeCarte` int(11) NOT NULL DEFAULT '0',
  `CBDonnee` text,
  `CBBloquee` varchar(50) NOT NULL DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.banque_account : ~14 rows (environ)
/*!40000 ALTER TABLE `banque_account` DISABLE KEYS */;
INSERT INTO `banque_account` (`id`, `Entreprise`, `Type`, `SteamID`, `CoSteamID`, `Argent`, `IBAN`, `DataCompte`, `LogTransaction`, `CarteCredit`, `CodeCarte`, `CBDonnee`, `CBBloquee`) VALUES
	(115, 'false', 'Compte personnel', 'steam:11000010d3b2ffa', NULL, 498010, 'US18-3000-4215-2554-99G3-4261-545', '{"maxDepenses":2000,"depenses":0,"maxDecouvert":2000}', '[{"Raison":"Transaction entre compte","Montant":100,"Type":1},{"Raison":"Transaction entre compte","Type":0,"Montant":100}]', '3177-3307-8526-9794', 1027, 'true', 'false'),
	(120, 'Concessionnaire', 'Compte entreprise', 'steam:1100001085fe617', NULL, 4185, 'US18-3000-8431-2684-128F1-5613-314', '{"maxDepenses":2000,"depenses":0,"maxDecouvert":2000}', '[{"Montant":7500,"Type":1,"Raison":"Achat entreprise"},{"Montant":10,"Type":1,"Raison":"Facture entreprise"},{"Montant":0,"Type":1,"Raison":"Achat entreprise"},{"Montant":50,"Type":0,"Raison":"Retrait ATM"},{"Montant":400,"Type":0,"Raison":"Transaction entre compte"}]', '3177-5613-2318-5216', 5613, 'true', 'false'),
	(136, 'false', 'Compte personnel', 'steam:1100001085fe617', NULL, 27950, 'US18-3000-8012-4971-90G6-1669-343', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '[{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500}]', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(137, 'false', 'Compte personnel', 'steam:11000010d3b2ffa', NULL, 0, 'US18-3000-2291-3738-62Z7-5766-930', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '[{"Raison":"Transaction entre compte","Montant":100,"Type":0},{"Raison":"Transaction entre compte","Type":1,"Montant":100}]', '3177-2993-6281-2061', 9224, NULL, 'false'),
	(138, 'false', 'Compte entreprise', 'steam:11000010d3b2ffa', NULL, 0, 'US18-3000-1409-5790-64W8-6336-372', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-8857-7842-7411', 3577, NULL, 'false'),
	(139, 'false', 'Compte personnel', 'steam:11000013b243b61', NULL, 364, 'US18-3000-7105-2847-55V9-1219-795', '{"maxDepenses":500,"depenses":0,"maxDecouvert":750}', '[{"Raison":"Transaction entre compte","Type":0,"Montant":1},{"Raison":"Transaction entre compte","Type":0,"Montant":10},{"Raison":"Retrait ATM","Type":0,"Montant":25}]', '3177-9429-8683-5241', 2982, 'true', 'false'),
	(140, 'false', 'Compte personnel', 'steam:110000115fba5e6', NULL, 0, 'US18-3000-7714-2325-21Z3-5905-172', '{"maxDepenses":1000,"depenses":0,"maxDecouvert":1500}', '{}', '3177-8225-7221-3122', 4034, 'true', 'false'),
	(141, 'false', 'Compte personnel', 'steam:11000011477b93a', NULL, 0, 'US18-3000-3098-3051-86F5-9624-756', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-1807-4844-4072', 7933, 'true', 'false'),
	(142, 'false', 'Compte personnel', 'steam:11000010a5ee631', NULL, 0, 'US18-3000-6547-3117-76D6-2904-180', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-7935-7646-4918', 2208, 'true', 'false'),
	(143, 'false', 'Compte personnel', 'steam:11000013e233b60', NULL, 0, 'US18-3000-4554-8768-31A8-2563-202', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-8403-6548-5062', 8927, 'true', 'false'),
	(144, 'false', 'Compte personnel', 'steam:11000010e7f3273', NULL, 0, 'US18-3000-2591-3742-49F1-7908-310', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-7311-4911-2121', 1061, 'true', 'false'),
	(145, 'false', 'Compte personnel', 'steam:11000011932eb4e', NULL, 0, 'US18-3000-5621-9887-55R2-1812-745', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-6476-5656-8598', 8219, 'true', 'false'),
	(146, 'false', 'Compte personnel', 'steam:11000013c2ff7b1', NULL, 0, 'US18-3000-3842-5542-61P3-8456-410', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-2566-5905-4396', 9882, 'true', 'false'),
	(147, 'false', 'Compte personnel', 'steam:11000013422de8e', NULL, 0, 'US18-3000-5594-4318-59O2-8873-129', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-1133-2315-7153', 3674, 'true', 'false'),
	(148, 'false', 'Compte personnel', 'steam:11000011ac90602', NULL, 0, 'US18-3000-1922-1156-41Z6-5971-531', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-8211-7512-2838', 8108, 'true', 'false'),
	(149, 'false', 'Compte personnel', 'steam:1100001085fe617', NULL, 0, 'US18-3000-8030-6637-23J8-9339-482', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-1679-6715-1720', 9057, NULL, 'false'),
	(150, 'false', 'Compte personnel', 'steam:1100001403b99ef', NULL, 0, 'US18-3000-5123-2764-95M9-8107-194', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-6953-7135-5173', 4248, 'true', 'false'),
	(151, 'false', 'Compte entreprise', 'steam:11000013e233b60', NULL, 0, 'US18-3000-6045-6280-20G8-2579-358', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-5105-2770-5106', 1604, NULL, 'false'),
	(152, 'false', 'Compte personnel', 'steam:110000140512b07', NULL, 0, 'US18-3000-1586-1725-10M2-3810-864', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-3874-5933-8174', 2820, 'true', 'false'),
	(153, 'false', 'Compte personnel', 'steam:110000115fba5e6', NULL, 0, 'US18-3000-1326-6697-91K1-6597-913', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-4688-9173-6859', 4189, 'true', 'false'),
	(154, 'false', 'Compte entreprise', 'steam:11000010a5ee631', NULL, 0, 'US18-3000-1089-6047-47R1-2107-611', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-2729-4645-2117', 5994, 'true', 'false'),
	(155, 'false', 'Compte personnel', 'steam:1100001154655c3', NULL, 0, 'US18-3000-9002-3212-90N2-8290-476', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-7317-3852-2819', 5238, 'true', 'false'),
	(156, 'false', 'Compte personnel', 'steam:11000010a0c3c2b', NULL, 0, 'US18-3000-5298-7439-50O4-7196-468', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-1143-1221-6458', 3217, 'true', 'false'),
	(157, 'false', 'Compte personnel', 'steam:1100001403b99ef', NULL, 0, 'US18-3000-1781-7597-34H4-4206-895', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-7297-1169-4368', 1277, NULL, 'false'),
	(158, 'false', 'Compte personnel', 'steam:11000010263d15a', NULL, 0, 'US18-3000-7564-1337-17P4-8443-635', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-4791-6621-3240', 3877, 'true', 'false'),
	(159, 'false', 'Compte entreprise', 'steam:110000115fba5e6', NULL, 0, 'US18-3000-5680-3127-33E9-7363-441', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-4859-6460-1168', 7025, 'true', 'false'),
	(160, 'false', 'Compte personnel', 'steam:11000013b243b61', NULL, 27950, 'US18-3000-5384-7052-17G6-1669-343', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '[{"Raison":"Transaction entre compte","Type":1,"Montant":1},{"Raison":"Transaction entre compte","Type":1,"Montant":10}]', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(161, 'false', 'Compte entreprise', 'steam:11000013b243b61', NULL, 27950, 'US18-3000-2555-2347-35G6-1669-343', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(162, 'false', 'Compte personnel', 'steam:11000013c18efa7', NULL, 200, 'US18-3000-4165-4951-88Z2-7409-454', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '[{"Raison":"Dépot ATM","Montant":200,"Type":1}]', '3177-5300-2102-2340', 7751, 'true', 'false'),
	(163, 'false', 'Compte personnel', 'steam:11000010c65a0d0', NULL, 1000, 'US18-3000-1853-9123-80Q3-8068-539', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '[{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500}]', '3177-4772-6746-1477', 7881, 'true', 'false'),
	(164, 'false', 'Compte personnel', 'steam:1100001004bf05f', NULL, 0, 'US18-3000-7983-5705-97I4-3287-214', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-8021-5349-5076', 6483, NULL, 'false'),
	(165, 'false', 'Compte personnel', 'steam:11000010fb967b8', NULL, 27950, 'US18-3000-4560-6077-47G6-1669-343', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(166, 'false', 'Compte personnel', 'steam:11000011482a2e3', NULL, 27950, 'US18-3000-9407-2607-87G6-1669-343', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(167, 'false', 'Compte personnel', 'steam:11000010e7565ee', NULL, 24200, 'US18-3000-3878-9150-56K8-1714-777', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '[{"Raison":"Dépot ATM","Montant":200,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500}]', '3177-4548-7968-4169', 1716, 'true', 'false'),
	(168, 'false', 'Compte personnel', 'steam:110000109806c60', NULL, 0, 'US18-3000-2529-6525-13U2-4602-385', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-7889-5822-3182', 5328, 'true', 'false'),
	(169, 'false', 'Compte personnel', 'steam:110000101c4bca9', NULL, 19000, 'US18-3000-1265-2679-93Z7-6560-208', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '[{"Raison":"Transaction entre compte","Montant":1500,"Type":1},{"Raison":"Retrait ATM","Type":0,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500}]', '3177-4318-5981-2062', 8546, 'true', 'false'),
	(170, 'false', 'Compte personnel', 'steam:110000118c55903', NULL, 0, 'US18-3000-9388-9923-64D6-9363-320', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-8377-7549-1118', 9094, 'true', 'false'),
	(171, 'false', 'Compte personnel', 'steam:110000134892018', NULL, 200, 'US18-3000-9141-9377-17O8-5441-702', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '[{"Raison":"Dépot ATM","Montant":200,"Type":1}]', '3177-7225-2538-1057', 5063, 'true', 'false'),
	(172, 'false', 'Compte personnel', 'steam:11000011a6036eb', NULL, 400, 'US18-3000-5042-4562-47H9-6300-201', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '[{"Raison":"Dépot ATM","Montant":200,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":200}]', '3177-7088-7996-1034', 5574, 'true', 'false'),
	(173, 'false', 'Compte personnel', 'steam:11000010576a9e6', NULL, 5510, 'US18-3000-6675-3659-89W2-2296-124', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '[{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":10,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500},{"Raison":"Dépot ATM","Montant":500,"Type":1},{"Raison":"Dépot ATM","Type":1,"Montant":500}]', '3177-7203-9678-3409', 7681, 'true', 'false'),
	(174, 'false', 'Compte entreprise', 'steam:11000010576a9e6', NULL, 27950, 'US18-3000-4156-4312-52G6-1669-343', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(175, 'false', 'Compte personnel', 'steam:11000013d09c2b6', NULL, 27950, 'US18-3000-8929-5944-55G6-1669-343', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(176, 'false', 'Compte personnel', 'steam:110000102481d53', NULL, 27950, 'US18-3000-1162-1230-61G6-1669-343', '{"maxDepenses":500,"depenses":0,"maxDecouvert":2000}', '{}', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(177, 'false', 'Compte personnel', 'steam:11000011387682e', NULL, 27950, 'US18-3000-3354-8869-87G6-1669-343', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(178, 'false', 'Compte personnel', 'steam:110000142a22c3f', NULL, 27950, 'US18-3000-7403-5122-60G6-1669-343', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(179, 'false', 'Compte personnel', 'steam:11000011a2aca3c', NULL, 27950, 'US18-3000-3431-5529-50G6-1669-343', '{"maxDepenses":2000,"depenses":0,"maxDecouvert":1500}', '{}', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(180, 'false', 'Compte personnel', 'steam:1100001364976d4', NULL, 27950, 'US18-3000-1313-1077-66G6-1669-343', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(181, 'false', 'Compte personnel', 'steam:11000013208d9df', NULL, 27950, 'US18-3000-1313-1077-66G6-1669-343', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(182, 'false', 'Compte personnel', 'steam:11000013208d9df', NULL, 27950, 'US18-3000-1077-6640-53G6-1669-343', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(183, 'false', 'Compte entreprise', 'steam:1100001154655c3', NULL, 27950, 'US18-3000-8848-4990-42G6-1669-343', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(184, 'false', 'Compte personnel', 'steam:1100001154655c3', NULL, 27950, 'US18-3000-9407-2607-87G6-1669-343', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(185, 'false', 'Compte personnel', 'steam:110000134f1dc53', NULL, 27950, 'US18-3000-1671-1162-12G6-1669-343', '{"maxDepenses":2000,"depenses":0,"maxDecouvert":2000}', '{}', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(186, 'false', 'Compte personnel', 'steam:11000013752330b', NULL, 27950, 'US18-3000-8518-8929-59G6-1669-343', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(187, 'false', 'Compte entreprise', 'steam:110000101c4bca9', NULL, 27950, 'US18-3000-9407-2607-87G6-1669-343', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(188, 'false', 'Compte personnel', 'steam:110000109cf66c6', NULL, 27950, 'US18-3000-2607-8717-13G6-1669-343', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(189, 'false', 'Compte personnel', 'steam:110000111e5f705', NULL, 27950, 'US18-3000-4178-8136-48G6-1669-343', '{"maxDepenses":500,"depenses":0,"maxDecouvert":1500}', '{}', '3177-4240-3297-9867', 3870, 'true', 'false'),
	(190, 'false', 'Compte personnel', 'steam:110000101c4bca9', NULL, 26450, 'US18-3000-4360-9582-74G6-1669-343', '{"maxDepenses":2000,"depenses":0,"maxDecouvert":1500}', '[{"Raison":"Transaction entre compte","Montant":1500,"Type":0}]', '3177-4240-3297-9867', 3870, NULL, 'false');
/*!40000 ALTER TABLE `banque_account` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. batiments
CREATE TABLE IF NOT EXISTS `batiments` (
  `HashID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) NOT NULL,
  `Interieur` varchar(100) NOT NULL,
  `Entree` varchar(300) NOT NULL,
  `Sortie` varchar(300) NOT NULL,
  `PrixAchat` varchar(250) NOT NULL DEFAULT '',
  `PrixLocation` varchar(250) NOT NULL DEFAULT '',
  `Proprietaire` varchar(1000) DEFAULT NULL,
  UNIQUE KEY `HashID` (`HashID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.batiments : ~0 rows (environ)
/*!40000 ALTER TABLE `batiments` DISABLE KEYS */;
/*!40000 ALTER TABLE `batiments` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. batiments2
CREATE TABLE IF NOT EXISTS `batiments2` (
  `ID` int(11) NOT NULL,
  `Nom` text NOT NULL,
  `CoordsExterieur` text NOT NULL,
  `CoordsInterieur` text,
  `CoordsGestion` text,
  `Equipement` text,
  `Pousse` text,
  `InterieurID` text NOT NULL,
  `Proprio` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.batiments2 : 2 rows
/*!40000 ALTER TABLE `batiments2` DISABLE KEYS */;
INSERT INTO `batiments2` (`ID`, `Nom`, `CoordsExterieur`, `CoordsInterieur`, `CoordsGestion`, `Equipement`, `Pousse`, `InterieurID`, `Proprio`) VALUES
	(1, 'ElkridgeHotel', '{"x":287.509,"y":-919.824,"z":28.266}', '{"x":-786.956,"y":315.622,"z":187.913}', '{"x":287.509,"y":-919.824,"z":28.266}', '', NULL, '', ''),
	(2, 'Hangar', '{"x":-18.665,"y":218.417,"z":106.744}', '{"x":1087.653,"y":-3099.387,"z":-38.999}', '{"x":1088.429,"y":-3101.289,"z":-39.000}', 'weed', '100', '', 'steam:1100001085fe617');
/*!40000 ALTER TABLE `batiments2` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. blacklist
CREATE TABLE IF NOT EXISTS `blacklist` (
  `Steam` text,
  `SteamLink` text,
  `SteamName` text,
  `DiscordUID` text,
  `DiscordTag` text,
  `GameLicense` text,
  `ID` int(11) DEFAULT NULL,
  `BanType` text,
  `Other` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.blacklist : 1 rows
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
INSERT INTO `blacklist` (`Steam`, `SteamLink`, `SteamName`, `DiscordUID`, `DiscordTag`, `GameLicense`, `ID`, `BanType`, `Other`) VALUES
	('steam:1100001354f881a', 'https://steamcommunity.com/profiles/76561198854670362', 'Senpaiii', '688003308346146817', '<@688003308346146817>', 'license:4a022a305d943ca6fee2842b7591e15cc6484be6', 203, 'Modérateur', 'Sans raison');
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. coffreproperties
CREATE TABLE IF NOT EXISTS `coffreproperties` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(8) NOT NULL,
  `Contenu` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Plaque` (`Nom`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.coffreproperties : 1 rows
/*!40000 ALTER TABLE `coffreproperties` DISABLE KEYS */;
INSERT INTO `coffreproperties` (`ID`, `Nom`, `Contenu`) VALUES
	(1, 'police', '{"Vetement926":{"Montant":1},"Vetement206":{"Montant":1},"WEAPON_KNIFE":{"Montant":99},"Vetement525":{"Montant":0}}');
/*!40000 ALTER TABLE `coffreproperties` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. coffres
CREATE TABLE IF NOT EXISTS `coffres` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Plaque` varchar(8) NOT NULL,
  `Contenu` text NOT NULL,
  `VehiculeJoueur` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `plaque` (`Plaque`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.coffres : 1 rows
/*!40000 ALTER TABLE `coffres` DISABLE KEYS */;
INSERT INTO `coffres` (`ID`, `Plaque`, `Contenu`, `VehiculeJoueur`) VALUES
	(87, '70MPC867', '{"argent":{"Montant":0},"oeuf":{"Montant":0},"Telephone64":{"Montant":0,"Data":{"Num":2386199}},"riz":{"Montant":0}}', 1);
/*!40000 ALTER TABLE `coffres` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. concessionnaire
CREATE TABLE IF NOT EXISTS `concessionnaire` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Voiture` text NOT NULL,
  `Hangar` int(11) NOT NULL DEFAULT '1',
  `Status` varchar(50) NOT NULL DEFAULT 'range',
  `TempPlaque` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.concessionnaire : 25 rows
/*!40000 ALTER TABLE `concessionnaire` DISABLE KEYS */;
INSERT INTO `concessionnaire` (`ID`, `Voiture`, `Hangar`, `Status`, `TempPlaque`) VALUES
	(14, 'sultan', 2, 'range', '65KNK603'),
	(50, 'Premier', 2, 'range', NULL),
	(16, 'intruder', 2, 'range', '18LOA584'),
	(18, 'intruder', 2, 'range', '30QMU495'),
	(21, 'schafter2', 2, 'range', '48HEQ639'),
	(23, 'schafter2', 2, 'range', '40GIC254'),
	(24, 'adder', 2, 'sorti', '81WLX603'),
	(26, 'sultanrs', 2, 'sorti', '63FVW830'),
	(27, 'schafter3', 2, 'range', '84YXZ364'),
	(28, 'rumpo', 2, 'range', '91JFD347'),
	(29, 'xls', 2, 'sorti', '28CCR102'),
	(30, 'zentorno', 2, 'sorti', NULL),
	(32, 'Tailgater', 2, 'range', NULL),
	(35, 'Emperor2', 2, 'range', NULL),
	(42, 'Intruder', 2, 'range', '25ADX634'),
	(37, 'Primo', 2, 'range', NULL),
	(38, 'Primo', 2, 'range', NULL),
	(41, 'Regina', 2, 'range', NULL),
	(43, 'Intruder', 2, 'range', NULL),
	(44, 'Ingot', 2, 'range', '47UHS739'),
	(45, 'Ingot', 2, 'range', '42EXJ651'),
	(46, 'panto', 2, 'range', '34JWQ289'),
	(47, 'panto', 2, 'range', '78CDG680'),
	(48, 'Emperor2', 2, 'range', '17URA309'),
	(49, 'Surge', 2, 'range', '16RNP569');
/*!40000 ALTER TABLE `concessionnaire` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. connexion
CREATE TABLE IF NOT EXISTS `connexion` (
  `Reference` int(11) NOT NULL AUTO_INCREMENT,
  `Date` text,
  `Heure` text,
  `SteamID` text,
  `IP` text,
  `Discord` text,
  `License` text,
  UNIQUE KEY `Reference` (`Reference`)
) ENGINE=MyISAM AUTO_INCREMENT=2184 DEFAULT CHARSET=latin1;

-- Listage de la structure de la table initialvfx. dpkeybinds
CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.dpkeybinds : ~22 rows (environ)
/*!40000 ALTER TABLE `dpkeybinds` DISABLE KEYS */;
INSERT INTO `dpkeybinds` (`id`, `keybind1`, `emote1`, `keybind2`, `emote2`, `keybind3`, `emote3`, `keybind4`, `emote4`, `keybind5`, `emote5`, `keybind6`, `emote6`) VALUES
	('steam:11000013422de8e', 'num4', '', 'num5', 'gangsign', 'num6', 'kneel3', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013e64d745', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000140512b07', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000011297a670', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001085fe617', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013e233b60', 'num4', 'gangsign', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000011ac90602', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000011477b93a', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001403b99ef', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010263d15a', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001180cdafb', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000140a988b6', 'num4', '', 'num5', 'gangsign', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000117cc7baf', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010e7f3273', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001154655c3', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000011932eb4e', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013b243b61', 'num4', '', 'num5', 'finger', 'num6', 'yoga', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010a5ee631', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010a0c3c2b', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013c2ff7b1', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010d3b2ffa', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000114b6ed5e', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000140179ffa', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000115fba5e6', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013f873aef', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000117244b87', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001005b0bb5', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001333d35a2', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000134a6fd10', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013daff4bd', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000134f1dc53', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001004bf05f', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013f0b9365', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000102481d53', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001104cb61c', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000011387682e', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000101c4bca9', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013c18efa7', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000117864216', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013eb361b6', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000133702f39', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001106c4bc0', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000011958d3a3', 'num4', 'gangsign', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010f3b1985', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013f193f3d', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000011482a2e3', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013d09c2b6', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013e40aeaa', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010617d095', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000142a7a864', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013e07cf4d', 'num4', 'gangsign', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010b9a3705', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001408143d1', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000137fc4b95', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010c65a0d0', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000131f10f1a', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000111e5f705', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010fb967b8', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001417e12b9', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000142a787c4', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000011987101f', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010dcf3043', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013ce05668', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001429fc205', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010f0655eb', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000011782361b', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010e7565ee', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013ceda412', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000112cd9140', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000011b551c22', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013cb07679', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000104318f66', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000114b6b292', 'num4', 'sitchair', 'num5', '', 'num6', 'lean', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000115f11416', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001185e405d', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001324c1813', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000118d2b656', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001197e20f8', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000140ad0faa', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001354c3211', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013c98a98c', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000117348511', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013d04a1be', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013f9b032b', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000011350cab8', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000011aeca15a', 'num4', 'gangsign', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000134d0d786', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000111db2eb1', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013d270ab6', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000110369254', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001354f881a', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013c3ccfb7', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000112309bdd', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000141c42f93', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001377aa44b', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000112dbbe61', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000014126894d', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000014288e186', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010a6e0214', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001161b4df2', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000011a6036eb', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001401a0878', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000118c55903', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000112952914', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010ba935c4', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000131e700e0', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013e6405a8', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', '');
/*!40000 ALTER TABLE `dpkeybinds` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. garage
CREATE TABLE IF NOT EXISTS `garage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SteamID` text NOT NULL,
  `Vehicule` text NOT NULL,
  `Plaque` text NOT NULL,
  `Data` text NOT NULL,
  `Temps` bigint(20) NOT NULL DEFAULT '0',
  `Parking` varchar(255) NOT NULL DEFAULT '',
  `Coords` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.garage : 5 rows
/*!40000 ALTER TABLE `garage` DISABLE KEYS */;
INSERT INTO `garage` (`ID`, `SteamID`, `Vehicule`, `Plaque`, `Data`, `Temps`, `Parking`, `Coords`) VALUES
	(1, 'steam:1100001085fe617', 'gt500', '61WSL441', '{"Couleur1":18,"Couleur2":50,"Nacree":0}', 0, '1', '{"z":30.675657272338868,"h":230.9501953125,"x":-330.6620788574219,"y":-904.396240234375}'),
	(19, 'steam:1100001085fe617', 'massacro', '31DKW432', '{"Couleur1":58,"Couleur2":25,"Nacree":5}', 0, '', ''),
	(30, 'steam:1100001085fe617', 'schafter2', '70MPC867', '{"Couleur1":58,"Couleur2":25,"Nacree":5}', 0, '', ''),
	(86, 'steam:11000011ac90602', 'schafter2', '63RKZ818', '{"Couleur1":0,"Couleur2":0,"Nacree":0}', 0, '', ''),
	(85, 'steam:11000011ac90602', 'Intruder', '25ADX634', '{"Couleur1":0,"Couleur2":0,"Nacree":0}', 0, '', NULL);
/*!40000 ALTER TABLE `garage` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. idcard
CREATE TABLE IF NOT EXISTS `idcard` (
  `HashID` text,
  `Prenom` text,
  `Nom` text,
  `DateNaissance` text,
  `Nationalite` text,
  `Sexe` text,
  `Taille` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.idcard : 63 rows
/*!40000 ALTER TABLE `idcard` DISABLE KEYS */;
INSERT INTO `idcard` (`HashID`, `Prenom`, `Nom`, `DateNaissance`, `Nationalite`, `Sexe`, `Taille`) VALUES
	('IDCard#207171630', 'eefeef', 'ezfezfez', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'm', '189'),
	('IDCard#501110839', 'eefeef', 'ezfezfez', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'm', '189'),
	('IDCard#989645385', 'eefeef', 'ezfezfez', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'm', '189'),
	('IDCard#249304199', 'eefeef', 'ezfezfez', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'm', '189'),
	('IDCard#482626342', 'PUTE', 'initial', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'f', '190'),
	('IDCard#302587890', 'sdsq', 'dsqdsq', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'f', '4561'),
	('IDCard#236395263', 'sdsq', 'dsqdsq', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'f', '4561'),
	('IDCard#425195312', 'sdsq', 'dsqdsq', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'f', '4561'),
	('IDCard#615148925', 'sdsq', 'dsqdsq', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'f', '4561'),
	('IDCard#648052978', 'sdsq', 'dsqdsq', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'f', '4561'),
	('IDCard#761486816', 'sdsq', 'dsqdsq', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'f', '4561'),
	('IDCard#446701049', 'sdsq', 'dsqdsq', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'f', '4561'),
	('IDCard#639126586', 'sdsq', 'dsqdsq', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'f', '4561'),
	('IDCard#521600341', 'sdsq', 'dsqdsq', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'f', '4561'),
	('IDCard#536431884', 'sdsq', 'dsqdsq', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'f', '4561'),
	('IDCard#722045898', 'sdsq', 'dsqdsq', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'f', '4561'),
	('IDCard#348291015', 'sdsq', 'dsqdsq', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'f', '4561'),
	('IDCard#150592041', 'sdsq', 'dsqdsq', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'f', '4561'),
	('IDCard#856106567', 'sdsq', 'dsqdsq', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'f', '4561'),
	('IDCard#367544555', 'sdsq', 'dsqdsq', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'f', '4561'),
	('IDCard#104202270', 'eefeef', 'ezfezfez', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'm', '189'),
	('IDCard#108020019', 'eefeef', 'ezfezfez', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'm', '189'),
	('IDCard#440081787', 'eefeef', 'ezfezfez', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'm', '189'),
	('IDCard#578482055', 'eefeef', 'ezfezfez', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'm', '189'),
	('IDCard#614050292', 'eefeef', 'ezfezfez', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'm', '189'),
	('IDCard#641571044', 'eefeef', 'ezfezfez', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'm', '189'),
	('IDCard#646432495', 'eefeef', 'ezfezfez', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'm', '189'),
	('IDCard#249606323', 'eefeef', 'ezfezfez', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'm', '189'),
	('IDCard#696722412', 'eefeef', 'ezfezfez', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'm', '189'),
	('IDCard#505697631', 'eefeef', 'ezfezfez', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'm', '189'),
	('IDCard#371746826', 'qdsq', 'sqdsq', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'f', '1561'),
	('IDCard#230023193', 'dqsd', 'sqdqsdqs', '20/20/2000', 'NULLNATIONALITE', 'f', '200'),
	('IDCard#597872924', 'maxim', 'suita', '13/10/2019', 'NULLNATIONALITE', 'm', '187'),
	('IDCard#112826538', 'maxim', 'suita', '13/10/2019', 'NULLNATIONALITE', 'm', '187'),
	('IDCard#859265136', 'fvdsdsf', 'mlmm', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'f', '150'),
	('IDCard#394213867', 'fvdsdsf', 'mlmm', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'f', '150'),
	('IDCard#440081787', 'dqsd', 'sqdqsdqs', '20/20/2000', 'NULLNATIONALITE', 'f', '200'),
	('IDCard#578179931', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#274655151', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#858715820', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#664065551', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#691833496', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#278060913', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#857919311', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#210989379', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#198931884', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#768792724', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#382650756', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#946936035', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#357464599', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#402673339', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#226232910', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#759756469', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#851135253', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#737179565', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#640197753', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#772473144', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#327444458', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#230023193', 'aziz', 'chebni', '06/03/2000', 'NULLNATIONALITE', 'm', '183'),
	('IDCard#171411132', 'fvdsdsf', 'mlmm', 'JJ/MM/AAAA', 'NULLNATIONALITE', 'f', '150'),
	('IDCard#382485961', 'Nicolas', 'Rivero', '17/09/1997', 'NULLNATIONALITE', 'm', '189'),
	('IDCard#843994140', 'Nicolas', 'Rivero', '17/09/1997', 'NULLNATIONALITE', 'm', '189'),
	('IDCard#963140869', 'Nicolas', 'Rivero', '17/09/1997', 'NULLNATIONALITE', 'm', '189');
/*!40000 ALTER TABLE `idcard` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. illegal
CREATE TABLE IF NOT EXISTS `illegal` (
  `Quartie` varchar(500) NOT NULL,
  `XP` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.illegal : ~0 rows (environ)
/*!40000 ALTER TABLE `illegal` DISABLE KEYS */;
INSERT INTO `illegal` (`Quartie`, `XP`) VALUES
	('El Burro Heights', 1925),
	('Davis', 39180);
/*!40000 ALTER TABLE `illegal` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. instanceobject
CREATE TABLE IF NOT EXISTS `instanceobject` (
  `ID` int(11) NOT NULL,
  `ObjectID` text NOT NULL,
  `Coords` text NOT NULL,
  `Temps` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.instanceobject : 4 rows
/*!40000 ALTER TABLE `instanceobject` DISABLE KEYS */;
INSERT INTO `instanceobject` (`ID`, `ObjectID`, `Coords`, `Temps`) VALUES
	(1, 'bkr_prop_weed_01_small_01c', '{"x":68.550,"y":114.539,"z":80.103}', 1),
	(1, 'bkr_prop_weed_01_small_01c', '{"x":68.550,"y":114.539,"z":81.103}', 2),
	(1, 'bkr_prop_weed_01_small_01c', '{"x":68.550,"y":114.539,"z":82.103}', 0),
	(2, 'bkr_prop_weed_01_small_01c', '{"x":68.550,"y":114.539,"z":83.103}', 3);
/*!40000 ALTER TABLE `instanceobject` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. itemslist
CREATE TABLE IF NOT EXISTS `itemslist` (
  `HashID` text NOT NULL,
  `Nom` text NOT NULL,
  `Poids` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.itemslist : 89 rows
/*!40000 ALTER TABLE `itemslist` DISABLE KEYS */;
INSERT INTO `itemslist` (`HashID`, `Nom`, `Poids`) VALUES
	('oeuf', 'Oeufs', '0.300'),
	('lait', 'Lait', '1.000'),
	('pommesdeterres', 'Pommes de terres', '1.000'),
	('cereales', 'Cereales', '0.200'),
	('riz', 'Riz', '0.500'),
	('paquetdefarine', 'Paquet de farine', '1.000'),
	('salade', 'Salade', '0.300'),
	('merguez', 'Merguez', '0.100'),
	('ventreche', 'Ventrèche', '0.100'),
	('steak', 'Steak haché', '0.180'),
	('saucisson', 'Saucisson', '0.200'),
	('champagne', 'Champagne', '1.500'),
	('cognac', 'Cognac', '0.700'),
	('whiskey', 'Whiskey', '0.900'),
	('vodka', 'Vodka', '1.000'),
	('biere', 'Bière', '0.200'),
	('rhum', 'Rhum', '0.700'),
	('brownie', 'Brownie', '0.075'),
	('cookie', 'Cookie', '0.075'),
	('donuts', 'Donuts', '0.075'),
	('bouteillesprunk', 'Bouteille de sprunk', '1.000'),
	('banane', 'Banane', '0.120'),
	('poire', 'Poire', '0.120'),
	('ananas', 'Ananas', '2.000'),
	('orange', 'Orange', '0.200'),
	('pomme', 'Pomme', '0.150'),
	('sprunk', 'Sprunk', '0.100'),
	('bouteillecola', 'Bouteille de cola', '1.000'),
	('cola', 'Cola', '0.100'),
	('chips', 'Chips', '0.100'),
	('cupcake', 'Cupcake', '0.150'),
	('hamburger', 'Hamburger', '0.200'),
	('pain', 'Pain', '0.150'),
	('poisson', 'Poisson', '1.000'),
	('canneapeche', 'Canne a peche', '0.500'),
	('chocolat', 'Chocolat', '0.200'),
	('cigarette', 'Cigarette', '0.700'),
	('sandwich', 'Sandwich', '0.250'),
	('eau', 'Eau', '0.500'),
	('boitedecereales', 'Boite de cereales', '0.350'),
	('paquetderiz', 'Paquet de riz', '0.400'),
	('paquetdepommesdeterres', 'Paquet de pommes de terres', '1.500'),
	('paquetdepates', 'Paquet de pâtes', '0.500'),
	('fromage', 'Fromage', '0.100'),
	('sauceketchup', 'Sauce ketchup', '0.150'),
	('saucemayonnaise', 'Sauce mayonnaise', '0.150'),
	('saucemoutarde', 'Sauce moutarde', '0.150'),
	('poulet', 'Poulet', '0.250'),
	('saucetomateenconserve', 'Sauce tomate en conserve', '0.200'),
	('thonenconserve', 'Thon en conserve', '0.100'),
	('citron', 'Citron', '0.120'),
	('maisenconserve', 'Maïs en conserve', '0.100'),
	('noixdecajou', 'Noix de cajou', '0.100'),
	('chipsp', 'Chips Paprika', '0.100'),
	('glace', 'Glace', '0.250'),
	('pizza', 'Pizza', '0.250'),
	('ravioli', 'Ravioli', '0.500'),
	('paquetdegacons', 'Paquet de glaçons', '0.250'),
	('paquetdefrites', 'Paquet de frites', '0.500'),
	('paquetdecordonsbleu', 'Paquet de cordons bleu', '0.500'),
	('popcorn', 'Popcorn', '0.250'),
	('parapluie', 'Parapluie', '0.300'),
	('rose', 'Rose', '0.050'),
	('guitare', 'Guitare', '1.200'),
	('chargeur', 'Chargeur', '0.800'),
	('wealampe', 'Lampe', '0.250'),
	('poignee', 'Poignée', '0.500'),
	('silencieux', 'Silencieux', '0.700'),
	('hab_kevlarleger', 'Kevlar 29', '3.000'),
	('hab_kevlar49', 'Kevlar 49', '5.000'),
	('hab_kevlar129', 'Kevlar 129', '7.000'),
	('radio', 'Radio', '0.500'),
	('CleVoiture', 'Clé de voiture', '0.200'),
	('facture', 'Facture', '0.001'),
	('cannabis', 'Cannabis', '0.010'),
	('cocaine', 'Cocaïne', '0.010'),
	('meth', 'Méthamphétamine', '0.010'),
	('heroine', 'Héroïne', '0.010'),
	('feuilledecocaine', 'Feuille de coca', '0.050'),
	('kerosene', 'Bidon de kérosène (ml)', '0.001'),
	('acidesulfuriquedilue', 'Acide sulfurique dilué (ml)', '0.001'),
	('patedecocaine', 'Pâte de cocaïne (100 g)', '0.100'),
	('pierre', 'Pierres', '0.800'),
	('for', 'Fragment d\'or', '0.500'),
	('pdiamant', 'Pépite de diamant', '0.050'),
	('ffer', 'Fragment de fer', '0.250'),
	('tetedeweed', 'Tête de weed', '0.300'),
	('weed', 'Weed (g)', '0.010'),
	('menottes', 'Paire de menottes', '0.300');
/*!40000 ALTER TABLE `itemslist` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. livraisonvoiture
CREATE TABLE IF NOT EXISTS `livraisonvoiture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Voiture` text NOT NULL,
  `Minutes` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.livraisonvoiture : 0 rows
/*!40000 ALTER TABLE `livraisonvoiture` DISABLE KEYS */;
/*!40000 ALTER TABLE `livraisonvoiture` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. metier
CREATE TABLE IF NOT EXISTS `metier` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` text,
  `Data` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.metier : 1 rows
/*!40000 ALTER TABLE `metier` DISABLE KEYS */;
INSERT INTO `metier` (`ID`, `Nom`, `Data`) VALUES
	(1, 'concessionnaire', '["Gestionnaire des ventes","Transporteur de véhicule","Vendeur Automobile ","Stagiaire","Vendeur","Vendeur en magasin","Commercial"]');
/*!40000 ALTER TABLE `metier` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. owned_properties
CREATE TABLE IF NOT EXISTS `owned_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.owned_properties : 0 rows
/*!40000 ALTER TABLE `owned_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_properties` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. ped
CREATE TABLE IF NOT EXISTS `ped` (
  `ID` int(11) DEFAULT NULL,
  `Nom` text,
  `Utilise` text,
  `Sexe` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.ped : 84 rows
/*!40000 ALTER TABLE `ped` DISABLE KEYS */;
INSERT INTO `ped` (`ID`, `Nom`, `Utilise`, `Sexe`) VALUES
	(1, 'u_m_m_aldinapoli', 'false', 'm'),
	(63, 'a_f_o_soucent_02', 'false', 'f'),
	(2, 'g_m_y_armgoon_02', 'false', 'm'),
	(3, 'g_m_y_ballaeast_01', 'false', 'm'),
	(4, 'g_m_y_ballaorig_01', 'false', 'm'),
	(5, 'g_f_y_ballas_01', 'false', 'f'),
	(6, 'csb_ballasog', 'false', 'm'),
	(7, 'g_m_y_ballasout_01', 'false', 'm'),
	(8, 's_m_y_barman_01', 'false', 'm'),
	(9, 'ig_benny', 'false', 'm'),
	(10, 's_m_o_busker_01', 'false', 'm'),
	(11, 'ig_car3guy2', 'false', 'm'),
	(12, 'g_m_m_chiboss_01', 'false', 'm'),
	(13, 'g_m_m_chigoon_01', 'false', 'm'),
	(14, 'g_m_m_chigoon_02', 'false', 'm'),
	(15, 'a_m_y_cyclist_01', 'false', 'm'),
	(16, 'ig_hao', 'false', 'm'),
	(17, 'a_m_m_eastsa_01', 'false', 'm'),
	(18, 's_m_y_dealer_01', 'false', 'm'),
	(19, 'a_m_y_downtown_01', 'false', 'm'),
	(20, 'g_m_y_famca_01', 'false', 'm'),
	(21, 'g_m_y_famfor_01', 'true', 'm'),
	(22, 'g_m_y_famdnf_01', 'false', 'm'),
	(23, 'g_f_y_families_01', 'false', 'f'),
	(24, 'ig_ramp_gang', 'false', 'm'),
	(25, 'a_m_m_fatlatin_01', 'false', 'm'),
	(26, 'a_m_m_farmer_01', 'false', 'm'),
	(27, 'a_m_m_genfat_01', 'false', 'm'),
	(28, 'ig_g', 'false', 'm'),
	(29, 's_m_m_hairdress_01', 'false', 'm'),
	(30, 'a_m_m_hillbilly_02', 'false', 'm'),
	(31, 'cs_jimmydisanto', 'true', 'm'),
	(32, 'cs_lamardavis', 'false', 'm'),
	(33, 'cs_lazlow', 'false', 'm'),
	(34, 'a_m_y_methhead_01', 'false', 'm'),
	(35, 'g_m_y_mexgoon_01', 'true', 'm'),
	(36, 'g_m_y_mexgoon_02', 'true', 'm'),
	(37, 'g_m_y_mexgoon_03', 'true', 'm'),
	(38, 'a_m_m_mexlabor_01', 'false', 'm'),
	(39, 'a_m_y_mexthug_01', 'false', 'm'),
	(40, 'a_m_m_og_boss_01', 'false', 'm'),
	(41, 'ig_ortega', 'false', 'm'),
	(42, 'ig_ramp_mex', 'false', 'm'),
	(43, 'g_m_y_salvagoon_01', 'true', 'm'),
	(44, 'a_m_m_soucent_01', 'false', 'm'),
	(45, 'a_m_y_soucent_02', 'false', 'm'),
	(46, 'a_f_y_soucent_03', 'false', 'f'),
	(47, 'a_m_m_soucent_03', 'false', 'm'),
	(48, 'u_f_y_spyactress', 'false', 'f'),
	(49, 'cs_stretch', 'false', 'm'),
	(50, 'g_m_y_strpunk_01', 'false', 'm'),
	(51, 'g_m_y_strpunk_02', 'false', 'm'),
	(52, 'g_f_y_vagos_01', 'false', 'f'),
	(53, 'a_m_y_vindouche_01', 'false', 'm'),
	(54, 'cs_wade', 'false', 'm'),
	(55, 'g_m_importexport_01', 'false', 'm'),
	(56, 'mp_f_cardesign_01', 'false', 'f'),
	(57, 's_f_m_sweatshop_01', 'false', 'f'),
	(58, 'u_m_m_rivalpap', 'false', 'm'),
	(59, 'u_m_y_mani', 'false', 'm'),
	(60, 'a_f_o_ktown_01', 'false', 'f'),
	(61, 'a_f_y_indian_01', 'false', 'f'),
	(62, 'a_f_y_vinewood_03', 'false', 'f'),
	(64, 'a_f_y_juggalo_01', 'false', 'f'),
	(65, 'a_m_m_malibu_01', 'false', 'm'),
	(66, 'a_m_o_acult_01', 'true', 'm'),
	(67, 'a_m_o_acult_02', 'false', 'm'),
	(68, 'a_m_o_beach_01', 'false', 'm'),
	(69, 'a_m_o_salton_01', 'false', 'm'),
	(70, 'a_m_o_genstreet_01', 'false', 'm'),
	(71, 'a_m_y_beachvesp_01', 'false', 'm'),
	(72, 'a_m_y_ktown_01', 'false', 'm'),
	(73, 'a_m_y_salton_01', 'false', 'm'),
	(74, 'a_m_y_stbla_02', 'false', 'm'),
	(75, 'a_m_y_vinewood_03', 'false', 'm'),
	(76, 'g_m_y_lost_01', 'false', 'm'),
	(77, 'g_m_y_lost_02', 'false', 'm'),
	(78, 'g_m_y_lost_03', 'false', 'm'),
	(79, 'g_m_y_mexgang_01', 'true', 'm'),
	(80, 'g_m_y_salvaboss_01', 'true', 'm'),
	(81, 's_m_m_cntrybar_01', 'false', 'm'),
	(82, 's_m_m_trucker_01', 'false', 'm'),
	(83, 's_m_y_xmech_02', 'false', 'm'),
	(84, 'player_one', 'false', 'm');
/*!40000 ALTER TABLE `ped` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. phone
CREATE TABLE IF NOT EXISTS `phone` (
  `SteamID` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.phone : ~3 rows (environ)
/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
INSERT INTO `phone` (`SteamID`, `Phone`) VALUES
	('steam:1100001085fe617', '1371063'),
	('steam:11000013b243b61', '3040710'),
	('steam:11000011ac90602', '9431732'),
	('steam:1100001085fe617', '1742950'),
	('steam:1100001005b0bb5', '5827392'),
	('steam:1100001005b0bb5', '2667449'),
	('steam:1100001085fe617', '1785522'),
	('steam:1100001005b0bb5', '9769012'),
	('steam:1100001085fe617', '9991760'),
	('steam:1100001085fe617', '1098327'),
	('steam:1100001085fe617', '2386199'),
	('steam:11000013b243b61', '4367858'),
	('steam:1100001085fe617', '9850036'),
	('steam:1100001085fe617', '2755340'),
	('steam:11000013422de8e', '3298339'),
	('steam:110000109cfe178', '5292633'),
	('steam:11000010891bf3c', '6481353'),
	('steam:110000109cf66c6', '1747894'),
	('steam:1100001401a0878', '5828765'),
	('steam:110000103bcec3d', '4674926'),
	('steam:11000011a6036eb', '3313720'),
	('steam:11000010ba935c4', '9162017'),
	('steam:1100001059b2eb2', '1902252'),
	('steam:11000013752330b', '6299255'),
	('steam:11000013752330b', '4617248'),
	('steam:11000010e8a86f8', '7455841'),
	('steam:11000013b243b61', '8851654'),
	('steam:110000140a988b6', '1678405'),
	('steam:11000011ac90602', '5916656'),
	('steam:110000102481d53', '5604919'),
	('steam:11000010f3b1985', '1039825'),
	('steam:11000014126894d', '6868896'),
	('steam:11000010ea934e8', '1830841'),
	('steam:11000011387682e', '1865722'),
	('steam:11000010e7565ee', '8880767'),
	('steam:11000010b9a3705', '7735443'),
	('steam:11000010a0c3c2b', '4351654'),
	('steam:11000013d04a1be', '8713226'),
	('steam:11000011958d3a3', '2420532'),
	('steam:11000013208d9df', '4190155'),
	('steam:110000112952914', '1252410'),
	('steam:11000011932eb4e', '9236999'),
	('steam:11000011a2aca3c', '5957855'),
	('steam:11000013c98a98c', '3488128'),
	('steam:110000131e700e0', '7912872'),
	('steam:1100001085fe617', '4417297'),
	('steam:11000010576a9e6', '5428314'),
	('steam:11000010576a9e6', '6811218'),
	('steam:1100001154655c3', '9718750'),
	('steam:11000013e120cdb', '9034851'),
	('steam:110000115fba5e6', '5494781'),
	('steam:1100001324c1813', '9269409'),
	('steam:11000010d3b2ffa', '7047973'),
	('steam:110000114b6ed5e', '6889221'),
	('steam:110000111e5f705', '8097991'),
	('steam:11000011654d1e1', '1242523'),
	('steam:110000118884a71', '9627563'),
	('steam:11000013422de8e', '7054840');
/*!40000 ALTER TABLE `phone` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. phonecalls
CREATE TABLE IF NOT EXISTS `phonecalls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL,
  `num` varchar(50) NOT NULL,
  `incoming` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accepts` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.phonecalls : ~0 rows (environ)
/*!40000 ALTER TABLE `phonecalls` DISABLE KEYS */;
/*!40000 ALTER TABLE `phonecalls` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. phonecontacts
CREATE TABLE IF NOT EXISTS `phonecontacts` (
  `identifier` varchar(50) NOT NULL DEFAULT '0',
  `number` varchar(50) NOT NULL DEFAULT '0',
  `display` varchar(64) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.phonecontacts : ~16 rows (environ)
/*!40000 ALTER TABLE `phonecontacts` DISABLE KEYS */;
INSERT INTO `phonecontacts` (`identifier`, `number`, `display`) VALUES
	('1371063', '5', 'Nouveau contact'),
	('1371063', '6555', 'Nouveau contact'),
	('1371063', '1371063', 'mm'),
	('1371063', '9431732', 'Encule'),
	('9431732', '1371063', 'Massime'),
	('9431732', '9769012', 'Kiba'),
	('2386199', '112', 'Nouveau contact'),
	('4367858', '4367858', 'Moi même '),
	('1039825', '1678405', 'Pacho'),
	('1678405', '1039825', '.Neto'),
	('6481353', '6481353', 'Pres'),
	('2420532', '1678405', 'Pacho'),
	('2420532', '1678405', 'Pacho'),
	('1039825', '8713226', 'Luna '),
	('8713226', '1678405', 'JEFE'),
	('1039825', '2420532', 'Juan'),
	('8713226', '1039825', 'Neto'),
	('8713226', '2420532', 'Juan'),
	('8851654', '8851654', 'Moi'),
	('5292633', '64813553', 'Josh'),
	('5292633', '1747894', 'JR Pésident '),
	('5292633', '1747894', 'JR'),
	('8880767', '1747894', 'James Richard Watkins'),
	('8880767', '5292633', 'Declan Johnns'),
	('8880767', '6481353', 'Josh Craig'),
	('1747894', '8880767', 'Joshua Winston'),
	('9236999', '9034851', 'nELSON'),
	('9236999', '9034851', 'NELSON'),
	('1242523', '96277563', 'Nouveau contact'),
	('5494781', 'AA', 'Nouveau contactAT'),
	('1242523', '9627563', 'Suelto'),
	('5494781', '12389', 'IHYF'),
	('1242523', '9627563', 'Suelto'),
	('9627563', '1242523', 'Treize'),
	('9627563', '1242523', '13');
/*!40000 ALTER TABLE `phonecontacts` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. phonemessage
CREATE TABLE IF NOT EXISTS `phonemessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(50) DEFAULT NULL,
  `receiver` varchar(50) DEFAULT NULL,
  `message` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isRead` int(11) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.phonemessage : ~130 rows (environ)
/*!40000 ALTER TABLE `phonemessage` DISABLE KEYS */;
INSERT INTO `phonemessage` (`id`, `transmitter`, `receiver`, `message`, `time`, `isRead`, `owner`) VALUES
	(31, '9431732', '9431732', 'c', '2020-08-05 05:28:05', 1, 0),
	(32, '9431732', '9431732', 'c', '2020-08-05 05:28:06', 1, 1),
	(33, '9431732', '9431732', 'c', '2020-08-05 05:29:37', 1, 0),
	(34, '9431732', '9431732', 'c', '2020-08-05 05:29:37', 1, 1),
	(35, '9431732', '9431732', 'sss', '2020-08-05 05:29:44', 1, 0),
	(36, '9431732', '9431732', 'sss', '2020-08-05 05:29:45', 1, 1),
	(37, '9431732', '9431732', 'c', '2020-08-05 05:33:44', 1, 0),
	(38, '9431732', '9431732', 'c', '2020-08-05 05:33:44', 1, 1),
	(39, '5545', '1371063', 'ss', '2020-08-05 05:35:43', 1, 1),
	(40, '1371063', '9431732', 'c', '2020-08-05 05:42:48', 1, 0),
	(41, '9431732', '1371063', 'c', '2020-08-05 05:42:48', 1, 1),
	(42, '1371063', '9431732', 's', '2020-08-05 05:44:04', 1, 0),
	(43, '9431732', '1371063', 's', '2020-08-05 05:44:04', 1, 1),
	(44, '1371063', '9431732', 's', '2020-08-05 05:44:31', 1, 0),
	(45, '9431732', '1371063', 's', '2020-08-05 05:44:32', 1, 1),
	(46, '9431732', '1371063', 'oué ti et en mod lacoste tn ou quoi la sang', '2020-08-05 05:45:30', 1, 0),
	(47, '1371063', '9431732', 'oué ti et en mod lacoste tn ou quoi la sang', '2020-08-05 05:45:30', 1, 1),
	(48, '1371063', '9431732', 'cc', '2020-08-05 05:49:51', 1, 0),
	(49, '9431732', '1371063', 'cc', '2020-08-05 05:49:51', 1, 1),
	(50, '55589665', '3040710', 'Je suis le plus beau', '2020-08-05 05:51:30', 1, 1),
	(51, '3040710', '9431732', 'Salut je suis la', '2020-08-05 05:55:32', 1, 0),
	(52, '9431732', '3040710', 'Salut je suis la', '2020-08-05 05:55:33', 1, 1),
	(53, '1371063', '9431732', 'c', '2020-08-05 05:55:46', 1, 0),
	(54, '9431732', '1371063', 'c', '2020-08-05 05:55:47', 1, 1),
	(55, '9431732', '3040710', 'T BELLE', '2020-08-05 05:56:31', 1, 0),
	(56, '3040710', '9431732', 'T BELLE', '2020-08-05 05:56:31', 1, 1),
	(57, '1371063', '9431732', 's', '2020-08-05 06:01:01', 1, 0),
	(58, '9431732', '1371063', 's', '2020-08-05 06:01:01', 1, 1),
	(59, '1371063', '9431732', 'c', '2020-08-05 06:03:24', 1, 0),
	(60, '9431732', '1371063', 'c', '2020-08-05 06:03:25', 1, 1),
	(61, '1371063', '1371063', 'c', '2020-08-05 06:08:08', 1, 0),
	(62, '1371063', '1371063', 'c', '2020-08-05 06:08:08', 1, 1),
	(63, '1371063', '1371063', 's', '2020-08-05 06:08:27', 1, 0),
	(64, '1371063', '1371063', 's', '2020-08-05 06:08:27', 1, 1),
	(65, '1371063', '1371063', 'c', '2020-08-05 06:08:51', 1, 0),
	(66, '1371063', '1371063', 'c', '2020-08-05 06:08:51', 1, 1),
	(67, '1371063', '9431732', 'ccc', '2020-08-05 06:08:56', 1, 0),
	(68, '9431732', '1371063', 'ccc', '2020-08-05 06:08:56', 1, 1),
	(69, '1371063', '1371063', 'ccc', '2020-08-05 06:09:03', 1, 0),
	(70, '1371063', '1371063', 'ccc', '2020-08-05 06:09:03', 1, 1),
	(71, '9431732', '1371063', 'ton père', '2020-08-05 06:09:13', 1, 0),
	(72, '1371063', '9431732', 'ton père', '2020-08-05 06:09:14', 1, 1),
	(73, '1371063', '9431732', 'c', '2020-08-05 06:10:48', 1, 0),
	(74, '9431732', '1371063', 'c', '2020-08-05 06:10:48', 1, 1),
	(75, '9431732', '1371063', 'zebi', '2020-08-05 06:11:05', 1, 0),
	(76, '1371063', '9431732', 'zebi', '2020-08-05 06:11:05', 1, 1),
	(77, '1371063', '9431732', 'c', '2020-08-05 06:11:19', 1, 0),
	(78, '9431732', '1371063', 'c', '2020-08-05 06:11:19', 1, 1),
	(79, '1371063', '9431732', 'c', '2020-08-05 06:11:21', 1, 0),
	(80, '9431732', '1371063', 'c', '2020-08-05 06:11:21', 1, 1),
	(81, '1371063', '9431732', 'c', '2020-08-05 06:11:22', 1, 0),
	(82, '9431732', '1371063', 'c', '2020-08-05 06:11:22', 1, 1),
	(83, '1371063', '9431732', 'c', '2020-08-05 06:11:23', 1, 0),
	(84, '9431732', '1371063', 'c', '2020-08-05 06:11:23', 1, 1),
	(85, '1371063', '9431732', 'cc', '2020-08-05 06:11:24', 1, 0),
	(86, '9431732', '1371063', 'cc', '2020-08-05 06:11:24', 1, 1),
	(87, '1371063', '9431732', 'c', '2020-08-05 06:11:25', 1, 0),
	(88, '9431732', '1371063', 'c', '2020-08-05 06:11:25', 1, 1),
	(89, '1371063', '9431732', 'c', '2020-08-05 06:11:26', 1, 0),
	(90, '9431732', '1371063', 'c', '2020-08-05 06:11:26', 1, 1),
	(91, '1371063', '9431732', 'c', '2020-08-05 06:11:27', 1, 0),
	(92, '9431732', '1371063', 'c', '2020-08-05 06:11:27', 1, 1),
	(93, '1371063', '9431732', 'c', '2020-08-05 06:12:00', 1, 0),
	(94, '9431732', '1371063', 'c', '2020-08-05 06:12:01', 1, 1),
	(95, '1371063', '9431732', 'c', '2020-08-05 06:12:03', 1, 0),
	(96, '9431732', '1371063', 'c', '2020-08-05 06:12:04', 1, 1),
	(97, '9431732', '1371063', 'zebi', '2020-08-05 06:12:17', 1, 0),
	(98, '1371063', '9431732', 'zebi', '2020-08-05 06:12:17', 1, 1),
	(99, '1371063', '1371063', 'c', '2020-08-05 06:13:48', 1, 0),
	(100, '1371063', '1371063', 'c', '2020-08-05 06:13:48', 1, 1),
	(101, '1371063', '1371063', 'x', '2020-08-05 06:13:54', 1, 0),
	(102, '1371063', '1371063', 'x', '2020-08-05 06:13:54', 1, 1),
	(103, '1371063', '9431732', 'c', '2020-08-05 06:22:31', 1, 0),
	(104, '9431732', '1371063', 'c', '2020-08-05 06:22:31', 1, 1),
	(105, '1371063', '1371063', 'c', '2020-08-05 06:22:35', 1, 0),
	(106, '1371063', '1371063', 'c', '2020-08-05 06:22:35', 1, 1),
	(107, '1371063', '9431732', 'c', '2020-08-05 06:22:41', 1, 0),
	(108, '9431732', '1371063', 'c', '2020-08-05 06:22:41', 1, 1),
	(109, '1371063', '1371063', 'c', '2020-08-05 06:33:44', 1, 0),
	(110, '1371063', '1371063', 'c', '2020-08-05 06:33:45', 1, 1),
	(111, '1371063', '1371063', 'c', '2020-08-05 06:34:43', 1, 0),
	(112, '1371063', '1371063', 'c', '2020-08-05 06:34:43', 1, 1),
	(113, '1371063', '1371063', 'd', '2020-08-05 06:35:05', 1, 0),
	(114, '1371063', '1371063', 'd', '2020-08-05 06:35:05', 1, 1),
	(115, '1371063', '1371063', 'dd', '2020-08-05 06:35:11', 1, 0),
	(116, '1371063', '1371063', 'dd', '2020-08-05 06:35:12', 1, 1),
	(117, '1371063', '1371063', 's', '2020-08-05 06:35:34', 1, 0),
	(118, '1371063', '1371063', 's', '2020-08-05 06:35:35', 1, 1),
	(119, '1371063', '9431732', 'cc', '2020-08-05 06:35:38', 1, 0),
	(120, '9431732', '1371063', 'cc', '2020-08-05 06:35:38', 1, 1),
	(121, '9431732', '1371063', 'TTT', '2020-08-05 06:36:18', 1, 0),
	(122, '1371063', '9431732', 'TTT', '2020-08-05 06:36:19', 1, 1),
	(123, '9431732', '1371063', 'sale pute', '2020-08-05 06:38:18', 1, 0),
	(124, '1371063', '9431732', 'sale pute', '2020-08-05 06:38:19', 1, 1),
	(125, '9431732', '1371063', 're', '2020-08-05 06:38:43', 1, 0),
	(126, '1371063', '9431732', 're', '2020-08-05 06:38:43', 1, 1),
	(127, '1742950', '9431732', 'c', '2020-08-05 06:39:46', 1, 0),
	(128, '9431732', '1742950', 'c', '2020-08-05 06:39:47', 1, 1),
	(129, '1742950', '9431732', '91 c la champion league*', '2020-08-05 06:40:53', 1, 0),
	(130, '9431732', '1742950', '91 c la champion league*', '2020-08-05 06:40:53', 1, 1),
	(131, '1371063', '9431732', 'tg', '2020-08-05 07:10:37', 1, 0),
	(132, '9431732', '1371063', 'tg', '2020-08-05 07:10:37', 1, 1),
	(133, '1371063', '9431732', 'big fat butt', '2020-08-05 07:10:40', 1, 0),
	(134, '9431732', '1371063', 'big fat butt', '2020-08-05 07:10:41', 1, 1),
	(135, '9431732', '1371063', '*bruit de prout*', '2020-08-05 07:10:51', 1, 0),
	(136, '1371063', '9431732', '*bruit de prout*', '2020-08-05 07:10:51', 1, 1),
	(137, '9431732', '1371063', 'veo vego vego', '2020-08-05 07:11:01', 1, 0),
	(138, '1371063', '9431732', 'veo vego vego', '2020-08-05 07:11:01', 1, 1),
	(139, '1371063', '9431732', 't la?', '2020-08-05 08:18:45', 1, 0),
	(140, '9431732', '1371063', 't la?', '2020-08-05 08:18:45', 1, 1),
	(141, '9431732', '1371063', 'MA BITE', '2020-08-05 08:23:46', 1, 0),
	(142, '1371063', '9431732', 'MA BITE', '2020-08-05 08:23:46', 1, 1),
	(143, '1371063', '9431732', 'nn', '2020-08-05 08:23:51', 1, 0),
	(144, '9431732', '1371063', 'nn', '2020-08-05 08:23:51', 1, 1),
	(145, '1371063', '9431732', 'GPS: 617.68438720703, 24.066398620605', '2020-08-05 08:24:40', 1, 0),
	(146, '9431732', '1371063', 'GPS: 617.68438720703, 24.066398620605', '2020-08-05 08:24:40', 1, 1),
	(147, '1371063', '9431732', 'c', '2020-08-05 08:56:28', 1, 0),
	(148, '9431732', '1371063', 'c', '2020-08-05 08:56:28', 1, 1),
	(149, 'police', '1785522', 'c', '2020-08-05 10:13:41', 1, 1),
	(150, '55', '2386199', 'dqsd', '2020-08-05 12:32:06', 1, 1),
	(151, '55', '2386199', 'sdqdsq', '2020-08-05 12:32:08', 1, 1),
	(152, '4367858', '4367858', 'Je suis là tu va bien ?', '2020-08-05 13:01:51', 1, 0),
	(153, '4367858', '4367858', 'Je suis là tu va bien ?', '2020-08-05 13:01:51', 1, 1),
	(154, '4367858', '4367858', 'Salut mec je suis dans la merde il y a un grand criminel qui me suis je sens que je vais mourir j\'en peux plus je sais que je vais mourir il y a un grand méchant qui bois du capri sun qui me pourrsuis je sens que c\'est fini pour moi a dieu moi même ..', '2020-08-05 13:03:06', 1, 0),
	(155, '4367858', '4367858', 'Salut mec je suis dans la merde il y a un grand criminel qui me suis je sens que je vais mourir j\'en peux plus je sais que je vais mourir il y a un grand méchant qui bois du capri sun qui me pourrsuis je sens que c\'est fini pour moi a dieu moi même ..', '2020-08-05 13:03:07', 1, 1),
	(156, '4367858', '4367858', 'GPS: -16.328756332397, -1351.2307128906', '2020-08-05 13:03:52', 1, 0),
	(157, '4367858', '4367858', 'GPS: -16.328756332397, -1351.2307128906', '2020-08-05 13:03:52', 1, 1),
	(158, '4367858', '4367858', 'GPS: -16.328756332397, -1351.2307128906', '2020-08-05 13:03:53', 1, 0),
	(159, '4367858', '4367858', 'GPS: -16.328756332397, -1351.2307128906', '2020-08-05 13:03:53', 1, 1),
	(160, '4367858', '4367858', 'GPS: -16.328756332397, -1351.2307128906', '2020-08-05 13:03:53', 1, 0),
	(161, '4367858', '4367858', 'GPS: -16.328756332397, -1351.2307128906', '2020-08-05 13:03:53', 1, 1),
	(162, '4367858', '4367858', 'GPS: -16.328756332397, -1351.2307128906', '2020-08-05 13:03:55', 1, 0),
	(163, '4367858', '4367858', 'GPS: -16.328756332397, -1351.2307128906', '2020-08-05 13:03:55', 1, 1),
	(164, '4367858', '4367858', 'GPS: -16.328756332397, -1351.2307128906', '2020-08-05 13:03:56', 1, 0),
	(165, '4367858', '4367858', 'GPS: -16.328756332397, -1351.2307128906', '2020-08-05 13:03:56', 1, 1),
	(166, '4367858', '4367858', 'GPS: -16.328756332397, -1351.2307128906', '2020-08-05 13:03:57', 1, 0),
	(167, '4367858', '4367858', 'GPS: -16.328756332397, -1351.2307128906', '2020-08-05 13:03:57', 1, 1),
	(168, '4367858', '4367858', 'GPS: -718.05969238281, -201.13548278809', '2020-08-05 16:28:08', 1, 0),
	(169, '4367858', '4367858', 'GPS: -718.05969238281, -201.13548278809', '2020-08-05 16:28:08', 1, 1),
	(170, '4367858', '4367858', 'GPS: -717.21563720703, -201.95022583008', '2020-08-05 16:28:09', 1, 0),
	(171, '4367858', '4367858', 'GPS: -717.21563720703, -201.95022583008', '2020-08-05 16:28:09', 1, 1),
	(172, '55', '2386199', 'ccc', '2020-08-05 18:29:43', 1, 1),
	(173, '1039825', '1678405', 'Neto', '2020-08-06 01:16:54', 1, 0),
	(174, '1678405', '1039825', 'Neto', '2020-08-06 01:16:55', 1, 1),
	(175, '1678405', '1039825', 'Pacho', '2020-08-06 01:17:01', 1, 0),
	(176, '1039825', '1678405', 'Pacho', '2020-08-06 01:17:01', 1, 1),
	(177, '2420532', '1678405', 'Hola, jefe c\'est juan', '2020-08-06 01:20:57', 1, 0),
	(178, '1678405', '2420532', 'Hola, jefe c\'est juan', '2020-08-06 01:20:57', 1, 1),
	(179, '1039825', '8713226', 'Neto', '2020-08-06 01:22:51', 1, 0),
	(180, '8713226', '1039825', 'Neto', '2020-08-06 01:22:51', 1, 1),
	(181, '1039825', '2420532', 'Neto', '2020-08-06 01:22:56', 0, 0),
	(182, '2420532', '1039825', 'Neto', '2020-08-06 01:22:56', 1, 1),
	(183, '1', '5428314', 'ok', '2020-08-06 03:29:36', 1, 1),
	(184, '8851654', '8851654', 'Hecate t\'es la reine des putes tu te fais victime par tout le monde surtout les madrazo et tu chial t\'as mère la gentil désolé mek', '2020-08-06 04:59:42', 1, 0),
	(185, '8851654', '8851654', 'Hecate t\'es la reine des putes tu te fais victime par tout le monde surtout les madrazo et tu chial t\'as mère la gentil désolé mek', '2020-08-06 04:59:42', 1, 1),
	(186, '8880767', '1747894', 'Joshua Winston', '2020-08-06 12:38:02', 1, 0),
	(187, '1747894', '8880767', 'Joshua Winston', '2020-08-06 12:38:02', 1, 1),
	(188, '8880767', '6481353', 'Joshua Winston', '2020-08-06 12:39:13', 0, 0),
	(189, '6481353', '8880767', 'Joshua Winston', '2020-08-06 12:39:13', 1, 1),
	(190, '8880767', '5292633', 'Joshua Winston', '2020-08-06 12:39:19', 0, 0),
	(191, '5292633', '8880767', 'Joshua Winston', '2020-08-06 12:39:19', 1, 1),
	(192, '8851654', '8851654', 'GPS: 266.12426757813, -1276.8970947266', '2020-08-06 14:19:30', 1, 0),
	(193, '8851654', '8851654', 'GPS: 266.12426757813, -1276.8970947266', '2020-08-06 14:19:31', 1, 1),
	(194, '1678405', '2420532', 'claro', '2020-08-06 17:14:17', 0, 0),
	(195, '2420532', '1678405', 'claro', '2020-08-06 17:14:17', 1, 1),
	(196, '8713226', '1678405', 'lùna', '2020-08-06 17:14:18', 1, 0),
	(197, '1678405', '8713226', 'lùna', '2020-08-06 17:14:18', 1, 1),
	(198, '1678405', '8713226', 'Pacho', '2020-08-06 17:14:24', 1, 0),
	(199, '8713226', '1678405', 'Pacho', '2020-08-06 17:14:24', 1, 1),
	(200, 'police', '5494781', 'Wsh', '2020-08-06 18:11:28', 1, 1),
	(201, '1242523', '9627563', 'hola', '2020-08-06 18:12:13', 1, 0),
	(202, '9627563', '1242523', 'hola', '2020-08-06 18:12:13', 1, 1),
	(203, '5666', '4417297', '4', '2020-08-06 21:50:02', 1, 1),
	(204, '5666', '4417297', 'gfd', '2020-08-06 21:50:04', 1, 1),
	(205, '5666', '4417297', 'gdfgd', '2020-08-06 21:50:06', 1, 1),
	(206, '5666', '4417297', 'dfgdfg', '2020-08-06 21:50:08', 1, 1),
	(207, '5666', '4417297', 'kghjkghjkg', '2020-08-06 21:50:11', 1, 1),
	(208, '5666', '4417297', 'gkkgjkghjkgv', '2020-08-06 21:50:13', 1, 1),
	(209, '5666', '4417297', 'jfjfgh', '2020-08-06 21:50:18', 1, 1),
	(210, '5666', '4417297', 'gjfjfhj', '2020-08-06 21:50:20', 1, 1);
/*!40000 ALTER TABLE `phonemessage` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. playerinfo
CREATE TABLE IF NOT EXISTS `playerinfo` (
  `SteamID` varchar(50) DEFAULT NULL,
  `Prenom` varchar(50) DEFAULT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `GradeAdmin` varchar(50) NOT NULL DEFAULT 'user',
  `Metier` varchar(50) NOT NULL DEFAULT 'aucun',
  `NiveauMetier` int(11) NOT NULL DEFAULT '1',
  `LicenseChimiste` varchar(50) DEFAULT NULL,
  `LicenseDarmes` varchar(50) NOT NULL DEFAULT 'false',
  `Argent` int(11) NOT NULL DEFAULT '0',
  `ArgentSale` int(11) NOT NULL DEFAULT '0',
  `ArgentBanque` int(11) NOT NULL DEFAULT '0',
  `VieJoueur` int(11) NOT NULL DEFAULT '175',
  `Status` varchar(50) NOT NULL DEFAULT '{}',
  `Position` varchar(25000) NOT NULL DEFAULT '{}',
  `StatConduite` int(11) NOT NULL DEFAULT '20',
  `StatEndurance` int(11) NOT NULL DEFAULT '20',
  `Age` int(11) DEFAULT NULL,
  `Taille` int(11) DEFAULT NULL,
  `DateNaissance` varchar(50) DEFAULT NULL,
  `Sexe` varchar(50) DEFAULT NULL,
  `Skin` longtext,
  `Inventaire` varchar(25000) NOT NULL DEFAULT '{}',
  `Armes` varchar(500) NOT NULL DEFAULT '{}',
  `Code` varchar(10) DEFAULT 'false',
  `PermisVoiture` varchar(10) DEFAULT 'false',
  `PermisMoto` varchar(10) DEFAULT 'false',
  `PermisCamion` varchar(10) DEFAULT 'false',
  `ChimisteLicense` varchar(10) DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.playerinfo : 76 rows
/*!40000 ALTER TABLE `playerinfo` DISABLE KEYS */;
INSERT INTO `playerinfo` (`SteamID`, `Prenom`, `Nom`, `GradeAdmin`, `Metier`, `NiveauMetier`, `LicenseChimiste`, `LicenseDarmes`, `Argent`, `ArgentSale`, `ArgentBanque`, `VieJoueur`, `Status`, `Position`, `StatConduite`, `StatEndurance`, `Age`, `Taille`, `DateNaissance`, `Sexe`, `Skin`, `Inventaire`, `Armes`, `Code`, `PermisVoiture`, `PermisMoto`, `PermisCamion`, `ChimisteLicense`) VALUES
	('steam:11000013daff4bd', 'Jacks', 'Viniz', 'user', 'aucun', 1, NULL, 'false', 627, 0, 0, 200, '{"faim":44.4,"soif":42}', '{"z":54.557830810546878,"x":124.24109649658203,"y":-219.70248413085938}', 20, 20, NULL, 180, '12 Février  1990', 'Homme', '{"NoseHeight":0.0,"LipstickOpacity":1.0,"BeardColor2":0,"EyebrowsColor2":0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Tshirt1":15,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":0,"EyesColor":-1,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":0,"Mere":4,"VariationTorsoColor":0,"Pere":4,"Arms2":0,"Shoes1":34,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":-1,"PedUsed":"a_m_o_acult_01","JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"Pants1":21,"VariationGlovesColor":0,"HairColor":0,"VariationMisc1":0,"VariationPants":0,"Glasse2":0,"Hat2":0,"Freckles":-1,"VariationGloves":0,"CheekbonesHeight":0.0,"CheekbonesWidth":0.0,"EyesSize":0.0,"VariationMisc3":0,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"Sexe":1,"Tshirt2":0,"NoseWidth":0.0,"ShapeMix":0.8,"VariationHair":0,"MakeupOpacity":1.0,"UsePed":true,"Hair":0,"VariationMisc2":0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Lipstick":-1,"TipNoseBreak":0.0,"FrecklesOpacity":1.0,"AgeingOpacity":1.0,"ChinShape":0.0,"MakeupColor":0,"EyebrowsColor":0,"VariationTorso2":0,"SkinAspectOpacity":1.0}', '{}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:1100001154655c3', 'Oscar', 'Lugo', 'user', 'paysagiste', 1, NULL, 'false', 577, 0, 0, 200, '{"faim":96.3,"soif":98}', '{"y":-834.6903076171875,"z":38.165950775146487,"x":-1.7616022825241089}', 20, 20, NULL, 184, '3 Janvier 1992', 'Homme', '{"NoseHeight":0.0,"LipstickOpacity":1.0,"EyebrowsColor":55,"EyebrowsColor2":3,"Glasse1":-1,"VariationTorso":0,"Pants2":1,"Sexe":1,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":0,"EyesColor":5,"BeardColor":0,"TipNoseHeight":0.14,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":0,"Pants1":42,"VariationTorsoColor":0,"Pere":19,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":37,"ForeheadWidth":0.0,"Eyebrows":20,"VariationMisc2":0,"JawWidth":1.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":1.0,"LipsWidth":1.0,"SkinMix":0.8,"MidNoseWidth":-0.52,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":-0.34,"ChinHeight":0.64,"MidNoseHeight":-0.56,"Hat2":0,"Freckles":10,"Shoes1":34,"HairColor":2,"Lipstick":-1,"ChinShape":0.34,"Hair":0,"Tshirt1":15,"Mere":10,"VariationGloves":0,"CheekbonesHeight":-1.0,"VariationMisc3":0,"EyesSize":1.0,"CheeksWidth":-0.44,"EyebrowsOpacity":1.0,"Beard":2,"ChinWidth":-0.8,"UsePed":false,"Glasse2":0,"NoseWidth":-1.0,"VariationHair":0,"ShapeMix":1.0,"MakeupOpacity":0.75,"CheekbonesWidth":1.0,"VariationTorso2":0,"BeardColor2":0,"JawHeight":-0.5,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"HairColor2":2,"TipNoseBreak":-0.66,"FrecklesOpacity":1.0,"VariationGlovesColor":0,"Shoes2":0,"MakeupColor":0,"VariationPants":0,"Tshirt2":0,"SkinAspectOpacity":1.0}', '{"Vetement198":{"Data":{"Shoes1":7,"Shoes2":2,"Sexe":1,"Type":"Chaussure"},"Montant":1},"Vetement4":{"Data":{"Pants2":1,"Sexe":1,"Pants1":42,"Type":"Pantalon"},"Montant":1},"Vetement706":{"Data":{"Shoes1":1,"Shoes2":2,"Sexe":1,"Type":"Chaussure"},"Montant":1},"pain":{"Montant":14},"Vetement587":{"Data":{"Shoes1":6,"Shoes2":0,"Sexe":1,"Type":"Chaussure"},"Montant":1},"eau":{"Montant":12},"Vetement852":{"Data":{"Torso1":5,"Sexe":1,"Torso2":2,"ID":58,"Type":"Haut"},"Montant":1},"Telephone560":{"Data":{"Num":9718750},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000134f1dc53', 'Junior', 'Smith ', 'user', 'mineur', 1, NULL, 'false', 129, 0, 0, 200, '{"faim":15.4,"soif":0}', '{"z":5.43148136138916,"y":-2840.62548828125,"x":729.353759765625}', 20, 20, NULL, 185, '30 Mai 1999', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"VariationGlovesColor":0,"EyebrowsColor2":0,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"Sexe":1,"VariationTorso2Color":0,"Torso1":237,"LipstickColor":0,"EyesColor":0,"BeardColor":1,"TipNoseHeight":0.0,"Complexion":1,"VariationShoesColor":0,"Ageing":0,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Mere":3,"VariationTorsoColor":0,"Pere":8,"Arms2":0,"Shoes1":1,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":0,"Freckles":1,"JawWidth":0.0,"Arms1":5,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"Tshirt2":0,"HairColor":0,"EyebrowsColor":1,"ChinShape":0.0,"Hair":14,"Hat2":0,"MakeupOpacity":1.0,"VariationGloves":0,"CheekbonesHeight":0.0,"FrecklesOpacity":1.0,"EyesSize":0.0,"Lipstick":-1,"EyebrowsOpacity":1.0,"Beard":11,"ChinWidth":0.0,"Pants1":1,"Glasse1":-1,"NoseWidth":0.0,"TipNoseBreak":0.0,"ShapeMix":0.85,"VariationMisc2":0,"LipstickOpacity":1.0,"VariationHair":0,"BeardColor2":0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"VariationMisc1":0,"UsePed":false,"Torso2":4,"Tshirt1":15,"Glasse2":0,"MakeupColor":0,"VariationPants":0,"AgeingOpacity":1.0,"SkinAspectOpacity":1.0}', '{"Vetement69":{"Data":{"Type":"Chaussure","Shoes2":0,"Sexe":1,"Shoes1":1},"Montant":1},"Vetement640":{"Data":{"Type":"Chaussure","Shoes2":1,"Sexe":1,"Shoes1":22},"Montant":1},"Vetement627":{"Data":{"Torso1":237,"Sexe":1,"Torso2":4,"ID":78,"Type":"Haut"},"Montant":1},"eau":{"Montant":4},"for":{"Montant":27},"ffer":{"Montant":47},"pain":{"Montant":5},"Vetement790":{"Data":{"Type":"Chaussure","Shoes2":1,"Sexe":1,"Shoes1":22},"Montant":1},"pierre":{"Montant":5},"Vetement802":{"Data":{"Type":"Pantalon","Sexe":1,"Pants1":1,"Pants2":0},"Montant":1},"pdiamant":{"Montant":10},"CarteCredit857":{"Data":"3177-4240-3297-9867","Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000013e120cdb', 'Nelson', 'Shaft', 'user', 'paysagiste', 1, NULL, 'false', 323, 0, 0, 200, '{"faim":83.0,"soif":75}', '{"x":-251.0691375732422,"y":-1568.956787109375,"z":32.21357727050781}', 20, 20, NULL, 182, '11 Février  1999', 'Homme', '{"NoseHeight":0.0,"LipstickOpacity":1.0,"BeardColor2":0,"MakeupOpacity":1.0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Tshirt1":15,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":0,"EyesColor":-1,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":1,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":1,"Torso2":0,"Mere":4,"VariationTorsoColor":2,"Pere":4,"Arms2":0,"Shoes1":34,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":-1,"Freckles":-1,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"PedUsed":"g_m_y_famfor_01","VariationTorso2":0,"Tshirt2":0,"Hat2":0,"ChinShape":0.0,"Hair":0,"Glasse2":0,"AgeingOpacity":1.0,"VariationGloves":0,"CheekbonesHeight":0.0,"FrecklesOpacity":1.0,"EyesSize":0.0,"EyebrowsColor":0,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"VariationGlovesColor":0,"VariationMisc2":0,"NoseWidth":0.0,"CheekbonesWidth":0.0,"VariationHair":0,"Sexe":1,"HairColor":0,"EyebrowsColor2":0,"VariationMisc3":0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"ForeheadHeight":0.0,"UsePed":true,"TipNoseBreak":0.0,"VariationMisc1":0,"Pants1":21,"MakeupColor":0,"ShapeMix":0.8,"VariationPants":0,"SkinAspectOpacity":1.0}', '{"eau":{"Montant":1},"Telephone661":{"Data":{"Num":9034851},"Montant":1},"Vetement980":{"Data":{"Torso2":2,"ID":157,"Sexe":1,"Torso1":126,"Type":"Haut"},"Montant":1},"pain":{"Montant":1},"Vetement940":{"Data":{"Torso2":6,"ID":162,"Sexe":1,"Torso1":153,"Type":"Haut"},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:1100001417e12b9', 'Emilio', 'Di Maria', 'user', 'mineur', 1, NULL, 'false', 419, 0, 0, 200, '{"soif":18,"faim":52.6}', '{"x":1065.5166015625,"y":-1975.356201171875,"z":31.014625549316408}', 20, 20, NULL, 182, '2 Mars 2002', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":-0.4,"EyebrowsColor":60,"EyebrowsColor2":0,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"Tshirt1":15,"FrecklesOpacity":1.0,"Torso1":15,"LipstickColor":0,"EyesColor":-1,"BeardColor":3,"TipNoseHeight":0.4,"Complexion":-1,"VariationShoesColor":0,"Ageing":2,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":3,"VariationHead":0,"VariationTorso2":0,"Mere":8,"VariationTorsoColor":0,"Pere":4,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":0,"Freckles":-1,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":0.4,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":4,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":1,"CheeksWidth":0.0,"VariationMisc1":0,"Tshirt2":0,"HairColor2":0,"ChinShape":-0.4,"Glasse2":0,"TipNoseBreak":0.6,"Pants1":42,"VariationGloves":0,"CheekbonesHeight":0.4,"Sexe":1,"EyesSize":-0.4,"BeardColor2":0,"EyebrowsOpacity":1.0,"Beard":16,"ChinWidth":0.4,"Glasse1":-1,"VariationTorso2Color":0,"NoseWidth":0.0,"VariationGlovesColor":0,"VariationHair":0,"VariationMisc2":0,"LipstickOpacity":1.0,"Lipstick":-1,"MakeupOpacity":1.0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Hair":12,"UsePed":false,"ShapeMix":1.0,"Shoes1":6,"Torso2":0,"MakeupColor":0,"HairColor":3,"VariationPants":0,"SkinAspectOpacity":1.0}', '{"Vetement720":{"Data":{"Shoes1":6,"Shoes2":4,"Type":"Chaussure","Sexe":1},"Montant":1},"Vetement901":{"Data":{"Pants2":2,"Sexe":1,"Pants1":5,"Type":"Pantalon"},"Montant":1},"Vetement521":{"Data":{"Torso1":5,"Sexe":1,"Torso2":2,"ID":58,"Type":"Haut"},"Montant":1},"pain":{"Montant":38},"eau":{"Montant":31},"Vetement546":{"Data":{"Pants2":0,"Sexe":1,"Pants1":42,"Type":"Pantalon"},"Montant":1},"Vetement373":{"Data":{"Type":"Chapeau","Sexe":1,"Hat2":1,"Hat1":3},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000115fba5e6', 'Evenson', 'Parker', 'user', 'aucun', 1, NULL, 'false', 27, 0, 0, 200, '{"faim":49.8,"soif":39}', '{"x":-2157.495849609375,"z":184.60147094726563,"y":249.85891723632813}', 20, 20, NULL, 188, '9 Avril 1990', 'Homme', '{"NoseHeight":0.0,"LipstickOpacity":1.0,"VariationGlovesColor":0,"MakeupOpacity":1.0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Sexe":1,"FrecklesOpacity":1.0,"Torso1":15,"LipstickColor":0,"EyesColor":2,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Mere":2,"VariationTorsoColor":0,"Pere":4,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":12,"VariationMisc2":0,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.25,"MidNoseWidth":0.0,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":15,"BeardColor2":0,"Tshirt2":0,"VariationTorso2Color":0,"ChinShape":0.0,"Hair":14,"VariationPants":0,"Pants1":4,"VariationGloves":0,"CheekbonesHeight":0.0,"HairColor":0,"EyesSize":0.0,"Freckles":-1,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"CheekbonesWidth":0.0,"EyebrowsColor":0,"NoseWidth":0.0,"EyebrowsColor2":0,"VariationHair":0,"VariationMisc3":0,"ForeheadHeight":0.0,"Tshirt1":15,"Shoes1":1,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Glasse2":0,"TipNoseBreak":0.0,"Shoes2":0,"Torso2":0,"Hat2":0,"MakeupColor":0,"ShapeMix":1.0,"UsePed":false,"SkinAspectOpacity":1.0}', '{"Vetement34":{"Data":{"Shoes1":1,"Sexe":1,"Shoes2":0,"Type":"Chaussure"},"Montant":1},"pain":{"Montant":3},"Vetement376":{"Data":{"Type":"Haut","Sexe":1,"Torso2":0,"ID":1,"Torso1":1},"Montant":1},"Telephone742":{"Data":{"Num":5494781},"Montant":1},"Vetement588":{"Data":{"Type":"Pantalon","Sexe":1,"Pants1":4,"Pants2":0},"Montant":1},"eau":{"Montant":2}}', '{}', 'true', 'false', 'false', 'false', 'false'),
	('steam:1100001104cb61c', 'Dangelo', 'Keller', 'user', 'aucun', 1, NULL, 'false', 671, 0, 0, 200, '{"faim":41.6,"soif":38}', '{"x":99.55926513671875,"y":-1395.9671630859376,"z":29.274486541748048}', 20, 20, NULL, 185, '5 Mai 1996', 'Homme', '{"NoseHeight":0.08,"CheekbonesWidth":-1.0,"BeardColor2":0,"EyebrowsColor2":0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"CheeksWidth":0.54,"FrecklesOpacity":1.0,"Torso1":15,"LipstickColor":0,"EyesColor":5,"BeardColor":0,"TipNoseHeight":0.04,"Complexion":0,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":0.41,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":0,"Pants1":21,"VariationTorsoColor":0,"Pere":2,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.1,"Eyebrows":21,"VariationMisc2":0,"JawWidth":0.98,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.42,"LipsWidth":-0.14,"SkinMix":1.0,"MidNoseWidth":-0.02,"Blemishes":0,"Shoes2":0,"ChinPosition":0.02,"ChinHeight":-0.18,"MidNoseHeight":0.02,"Hat2":0,"Glasse2":0,"LipstickOpacity":1.0,"Tshirt2":0,"MakeupOpacity":0.0,"VariationPants":0,"Hair":30,"EyebrowsColor":0,"Sexe":1,"VariationGloves":0,"CheekbonesHeight":0.98,"Freckles":-1,"EyesSize":1.0,"HairColor2":7,"EyebrowsOpacity":1.0,"Beard":1,"ChinWidth":0.04,"Tshirt1":15,"VariationGlovesColor":0,"NoseWidth":-0.04,"VariationMisc1":0,"VariationHair":0,"VariationMisc3":0,"HairColor":0,"Lipstick":-1,"VariationTorso2Color":0,"JawHeight":-1.0,"ComplexionOpacity":0.55,"BeardOpacity":1.0,"ChinShape":0.36,"TipNoseBreak":0.0,"ShapeMix":0.48,"Shoes1":34,"Mere":19,"MakeupColor":0,"VariationTorso2":0,"UsePed":false,"SkinAspectOpacity":1.0}', '{}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:1100001324c1813', 'Lina', 'Flores', 'user', 'aucun', 1, NULL, 'false', 340, 0, 0, 175, '{"soif":60,"faim":64.5}', '{"z":55.94301986694336,"x":1359.8262939453126,"y":-1552.113525390625}', 20, 20, NULL, 165, '28 Mai 1998', 'Femme', '{"NoseHeight":0.0,"CheekbonesWidth":-0.4,"VariationGlovesColor":0,"EyebrowsColor2":1,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"Tshirt1":2,"FrecklesOpacity":1.0,"Torso1":15,"LipstickColor":6,"EyesColor":3,"BeardColor":0,"TipNoseHeight":-0.4,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":5,"VariationHead":0,"VariationTorso2":0,"Pants1":15,"VariationTorsoColor":0,"Pere":23,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":5,"ForeheadWidth":-0.4,"Eyebrows":1,"VariationMisc2":0,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":1,"LipsWidth":0.0,"SkinMix":0.74,"MidNoseWidth":-0.4,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.4,"HairColor2":0,"LipstickOpacity":0.68,"Torso2":0,"HairColor":0,"Shoes1":35,"ChinShape":0.0,"Hair":15,"ForeheadHeight":0.4,"EyebrowsColor":0,"VariationGloves":0,"CheekbonesHeight":0.4,"Glasse2":0,"EyesSize":0.0,"BeardColor2":0,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"MakeupOpacity":1.0,"Hat2":0,"NoseWidth":0.0,"VariationMisc1":0,"ShapeMix":0.27,"Glasse1":-1,"Sexe":2,"VariationTorso2Color":0,"Mere":21,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"VariationHair":0,"UsePed":false,"TipNoseBreak":0.0,"Tshirt2":0,"VariationPants":0,"MakeupColor":1,"CheeksWidth":0.0,"Freckles":0,"SkinAspectOpacity":1.0}', '{"Vetement521":{"Montant":1,"Data":{"Shoes1":3,"Shoes2":0,"Sexe":2,"Type":"Chaussure"}},"eau":{"Montant":10},"Vetement744":{"Montant":1,"Data":{"Torso2":1,"Type":"Haut","Sexe":2,"Torso1":74,"ID":70}},"Telephone821":{"Data":{"Num":9269409},"Montant":1},"Vetement861":{"Montant":1,"Data":{"Hat1":5,"Sexe":2,"Hat2":0,"Type":"Chapeau"}},"Vetement375":{"Montant":1,"Data":{"Torso2":0,"Type":"Haut","Sexe":2,"Torso1":74,"ID":70}},"pain":{"Montant":12},"Vetement72":{"Montant":1,"Data":{"Torso2":0,"Type":"Haut","Sexe":2,"Torso1":138,"ID":136}},"Vetement373":{"Montant":1,"Data":{"Pants2":3,"Sexe":2,"Pants1":3,"Type":"Pantalon"}}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000118884a71', 'Ernesto', 'Maria', 'user', 'aucun', 1, NULL, 'false', 50, 0, 0, 200, '{"faim":51.9,"soif":67}', '{"x":209.76211547851563,"z":30.499164581298829,"y":-851.8937377929688}', 20, 20, NULL, 178, '6 Juin 2000', 'Homme', '{"NoseHeight":-0.04,"CheekbonesWidth":0.0,"EyebrowsColor":0,"MakeupOpacity":1.0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Sexe":1,"FrecklesOpacity":1.0,"Torso1":15,"LipstickColor":0,"EyesColor":5,"BeardColor":1,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":120,"VariationHead":0,"Torso2":0,"Pants1":42,"VariationTorsoColor":0,"Pere":6,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.06,"Eyebrows":19,"VariationMisc2":0,"JawWidth":0.06,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":-0.02,"SkinMix":0.0,"MidNoseWidth":1.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":-0.04,"Hat2":0,"LipstickOpacity":1.0,"ForeheadHeight":1.0,"Tshirt2":0,"BeardColor2":0,"ChinShape":0.0,"Glasse2":0,"VariationTorso2Color":0,"Shoes1":34,"VariationGloves":0,"CheekbonesHeight":0.0,"HairColor2":0,"EyesSize":-1.0,"VariationMisc1":0,"EyebrowsOpacity":1.0,"Beard":1,"ChinWidth":0.0,"EyebrowsColor2":0,"TipNoseBreak":-0.02,"NoseWidth":0.02,"Hair":9,"VariationHair":0,"HairColor":0,"VariationGlovesColor":0,"VariationMisc3":0,"CheeksWidth":1.0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"VariationPants":0,"UsePed":false,"ShapeMix":1.0,"Tshirt1":15,"VariationTorso2":0,"MakeupColor":0,"Freckles":-1,"Mere":8,"SkinAspectOpacity":1.0}', '{"Vetement793":{"Data":{"Pants2":0,"Sexe":1,"Pants1":42,"Type":"Pantalon"},"Montant":1},"Vetement883":{"Data":{"Type":"T-Shirt","Sexe":1,"Tshirt2":0,"ID":78,"Tshirt1":15},"Montant":1},"Vetement627":{"Data":{"Shoes1":8,"Shoes2":6,"Sexe":1,"Type":"Chaussure"},"Montant":1},"pain":{"Montant":8},"Vetement626":{"Data":{"Torso1":237,"Sexe":1,"Torso2":4,"ID":78,"Type":"Haut"},"Montant":1},"Telephone41":{"Data":{"Num":9627563},"Montant":1},"eau":{"Montant":10},"Vetement640":{"Data":{"Hat2":0,"Sexe":1,"Type":"Chapeau","Hat1":120},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000011654d1e1', 'Oscar', 'Calaveras', 'user', 'aucun', 1, NULL, 'false', 129, 0, 0, 200, '{"faim":58.2,"soif":51}', '{"x":265.8283386230469,"y":-1838.1195068359376,"z":26.348155975341798}', 20, 20, NULL, 180, '27 Août  1995', 'Homme', '{"NoseHeight":0.76,"LipstickOpacity":1.0,"BeardColor2":0,"MakeupOpacity":1.0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Sexe":1,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":0,"EyesColor":0,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Mere":20,"VariationTorsoColor":0,"Pere":19,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":-0.54,"Eyebrows":28,"Freckles":-1,"JawWidth":0.24,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.96,"LipsWidth":-0.18,"SkinMix":1.0,"MidNoseWidth":-0.4,"Blemishes":-1,"Shoes2":6,"ChinPosition":0.36,"ChinHeight":-0.04,"MidNoseHeight":-0.48,"Hat2":0,"CheekbonesWidth":-0.5,"VariationPants":0,"HairColor":0,"EyebrowsColor":0,"ChinShape":0.44,"Glasse2":0,"HairColor2":0,"Lipstick":-1,"VariationGloves":0,"CheekbonesHeight":0.46,"TipNoseBreak":0.34,"EyesSize":1.0,"VariationMisc1":0,"EyebrowsOpacity":1.0,"Beard":12,"ChinWidth":-0.2,"Torso2":0,"Hair":16,"NoseWidth":-0.98,"VariationMisc2":0,"VariationHair":0,"ShapeMix":0.11,"VariationGlovesColor":0,"EyebrowsColor2":0,"VariationMisc3":0,"JawHeight":0.22,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"CheeksWidth":0.22,"UsePed":false,"FrecklesOpacity":1.0,"Shoes1":8,"Tshirt2":0,"MakeupColor":0,"Tshirt1":15,"Pants1":21,"SkinAspectOpacity":1.0}', '{"Vetement8":{"Data":{"Shoes1":8,"Shoes2":6,"Type":"Chaussure","Sexe":1},"Montant":1},"Telephone790":{"Data":{"Num":1242523},"Montant":1},"Vetement97":{"Data":{"Torso1":81,"Sexe":1,"Torso2":1,"ID":145,"Type":"Haut"},"Montant":1},"eau":{"Montant":22},"Vetement216":{"Data":{"Pants2":0,"Sexe":1,"Pants1":62,"Type":"Pantalon"},"Montant":1},"pain":{"Montant":15}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000013e07cf4d', 'Carlos', 'De Santo', 'user', 'aucun', 1, NULL, 'false', 1465, 0, 0, 190, '{"soif":31,"faim":36.7}', '{"z":61.76872634887695,"y":-1506.499755859375,"x":1430.7408447265626}', 20, 20, NULL, 182, '30 Août  1995', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"BeardColor2":0,"EyebrowsColor2":0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Sexe":1,"FrecklesOpacity":1.0,"Torso1":15,"LipstickColor":0,"EyesColor":29,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":104,"VariationHead":0,"VariationTorso2":0,"Pants1":21,"VariationTorsoColor":0,"Pere":21,"Arms2":0,"Shoes1":34,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":1,"Freckles":-1,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"Torso2":0,"Tshirt2":0,"AgeingOpacity":1.0,"ChinShape":0.0,"Glasse2":0,"Hat2":10,"VariationMisc2":0,"VariationGloves":0,"CheekbonesHeight":0.0,"VariationPants":0,"EyesSize":0.0,"VariationTorso2Color":0,"EyebrowsOpacity":1.0,"Beard":1,"ChinWidth":0.0,"TipNoseBreak":0.0,"VariationHair":0,"NoseWidth":0.0,"VariationMisc3":0,"ShapeMix":0.74,"Hair":24,"LipstickOpacity":1.0,"MakeupOpacity":1.0,"Lipstick":-1,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Mere":20,"UsePed":false,"Shoes2":0,"HairColor":0,"VariationGlovesColor":0,"MakeupColor":0,"Tshirt1":15,"EyebrowsColor":0,"SkinAspectOpacity":1.0}', '{"Vetement219":{"Data":{"Pants2":10,"Sexe":1,"Pants1":88,"Type":"Pantalon"},"Montant":1},"Vetement675":{"Montant":1,"Data":{"Shoes1":7,"Shoes2":0,"Sexe":1,"Type":"Chaussure"}},"Vetement756":{"Data":{"Type":"Chapeau","Sexe":1,"Hat2":10,"Hat1":104},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000137fc4b95', 'Santiago', 'Mendoz', 'user', 'aucun', 1, NULL, 'false', 633, 0, 0, 190, '{"soif":26,"faim":58.2}', '{"z":62.617889404296878,"x":1436.3375244140626,"y":-1497.0224609375}', 20, 20, NULL, 190, '12 Mai 1994', 'Homme', '{"NoseHeight":0.0,"LipstickOpacity":1.0,"EyebrowsColor":1,"EyebrowsColor2":0,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"Sexe":1,"VariationTorso2Color":0,"Torso1":216,"LipstickColor":0,"EyesColor":13,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":0,"Pants1":21,"VariationTorsoColor":0,"Pere":12,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":0,"Freckles":-1,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.29,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"ChinShape":0.0,"Tshirt2":0,"ForeheadHeight":0.0,"VariationPants":0,"Glasse2":0,"BeardColor2":0,"VariationMisc2":0,"VariationGloves":0,"CheekbonesHeight":0.0,"Shoes1":34,"EyesSize":0.0,"CheekbonesWidth":0.0,"EyebrowsOpacity":1.0,"Beard":26,"ChinWidth":0.0,"Glasse1":-1,"Tshirt1":15,"NoseWidth":0.0,"VariationGlovesColor":0,"ShapeMix":0.15,"MakeupOpacity":1.0,"VariationHair":0,"FrecklesOpacity":1.0,"VariationMisc1":0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"VariationTorso2":0,"UsePed":false,"Mere":19,"TipNoseBreak":0.0,"Hat2":0,"MakeupColor":7,"HairColor":27,"Hair":29,"SkinAspectOpacity":1.0}', '{"eau":{"Montant":9},"Vetement802":{"Montant":1,"Data":{"Shoes1":7,"Shoes2":0,"Sexe":1,"Type":"Chaussure"}},"Vetement737":{"Montant":1,"Data":{"Torso2":0,"Type":"Haut","Sexe":1,"Torso1":216,"ID":75}},"pain":{"Montant":10},"Vetement857":{"Montant":1,"Data":{"Pants1":5,"Sexe":1,"Pants2":2,"Type":"Pantalon"}}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:1100001351d5c5b', 'Henrique', 'Gonzalez', 'user', 'aucun', 1, NULL, 'false', 1350, 0, 0, 200, '{"faim":36.0,"soif":30}', '{"x":137.1163330078125,"y":-206.152099609375,"z":54.43639373779297}', 20, 20, NULL, 182, '6 Août  1994', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"VariationGlovesColor":0,"MakeupOpacity":1.0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Tshirt1":15,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":0,"EyesColor":-1,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":0,"Mere":8,"VariationTorsoColor":0,"Pere":8,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":21,"VariationMisc2":0,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.19,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"Hair":12,"HairColor":0,"Tshirt2":0,"VariationPants":0,"Glasse2":0,"VariationTorso2":0,"EyebrowsColor2":0,"VariationGloves":0,"CheekbonesHeight":0.0,"VariationMisc3":0,"EyesSize":0.0,"EyebrowsColor":0,"EyebrowsOpacity":1.0,"Beard":2,"ChinWidth":0.0,"VariationHair":0,"Sexe":1,"NoseWidth":0.0,"FrecklesOpacity":1.0,"ShapeMix":0.79,"ChinShape":0.0,"LipstickOpacity":1.0,"Freckles":-1,"VariationMisc1":0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Pants1":21,"UsePed":false,"ForeheadHeight":0.0,"Shoes1":34,"TipNoseBreak":0.0,"MakeupColor":0,"BeardColor2":0,"HairColor2":15,"SkinAspectOpacity":1.0}', '{}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000111bb04d5', 'Jaro', 'Mwana', 'user', 'aucun', 1, NULL, 'false', 1141, 0, 0, 200, '{"faim":34.6,"soif":28}', '{"x":-171.8119659423828,"z":34.35903549194336,"y":-1593.5025634765626}', 20, 20, NULL, 180, '25 Juillet 1993', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"BeardColor2":0,"MakeupOpacity":1.0,"VariationMisc3":0,"VariationTorso":0,"Pants2":10,"Sexe":1,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":0,"EyesColor":-1,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":0,"Mere":14,"VariationTorsoColor":0,"Pere":3,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":12,"Freckles":-1,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"VariationMisc2":0,"HairColor":0,"VariationMisc1":0,"VariationPants":0,"Hair":8,"VariationTorso2":0,"Pants1":64,"VariationGloves":0,"CheekbonesHeight":0.0,"TipNoseBreak":0.0,"EyesSize":0.0,"ShapeMix":0.66,"EyebrowsOpacity":1.0,"Beard":14,"ChinWidth":0.0,"HairColor2":0,"Glasse1":-1,"NoseWidth":0.0,"EyebrowsColor2":0,"VariationHair":0,"Lipstick":-1,"LipstickOpacity":1.0,"Shoes1":34,"Tshirt1":15,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"FrecklesOpacity":1.0,"UsePed":false,"EyebrowsColor":0,"VariationGlovesColor":0,"ChinShape":0.0,"MakeupColor":0,"Tshirt2":0,"Glasse2":0,"SkinAspectOpacity":1.0}', '{"Vetement949":{"Montant":1,"Data":{"Pants2":10,"Sexe":1,"Pants1":64,"Type":"Pantalon"}},"Vetement964":{"Montant":1,"Data":{"Torso2":0,"ID":158,"Sexe":1,"Torso1":128,"Type":"Haut"}},"Vetement233":{"Data":{"Shoes1":26,"Shoes2":12,"Sexe":1,"Type":"Chaussure"},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000011ab37cd1', 'Maria', 'Mendoza', 'user', 'aucun', 1, NULL, 'false', 1406, 0, 0, 175, '{"soif":3,"faim":17.1}', '{"y":-2029.1943359375,"z":25.594812393188478,"x":359.94403076171877}', 20, 20, NULL, 169, '2 Septembre 1996', 'Femme', '{"NoseHeight":0.4,"CheekbonesWidth":0.0,"BeardColor2":0,"EyebrowsColor2":3,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"CheeksWidth":-0.4,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":6,"EyesColor":3,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":0,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Mere":8,"VariationTorsoColor":0,"Pere":21,"Arms2":0,"Shoes1":32,"VariationShoes":0,"Makeup":1,"ForeheadWidth":0.8,"Eyebrows":1,"Freckles":-1,"JawWidth":0.0,"Arms1":15,"MakeupColor2":1,"LipstickColor2":5,"ForeheadHeight":0.2,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":-0.4,"Blemishes":-1,"Shoes2":1,"ChinPosition":0.4,"ChinHeight":-0.4,"MidNoseHeight":0.4,"HairColor2":6,"Lipstick":1,"Torso2":0,"HairColor":0,"LipstickOpacity":1.0,"VariationPants":0,"Hair":4,"VariationMisc2":0,"AgeingOpacity":1.0,"VariationGloves":0,"CheekbonesHeight":0.0,"Glasse2":0,"EyesSize":0.0,"Sexe":2,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"VariationGlovesColor":0,"EyebrowsColor":1,"NoseWidth":-0.4,"Tshirt2":0,"VariationHair":0,"TipNoseBreak":0.0,"ShapeMix":1.0,"MakeupOpacity":1.0,"Glasse1":-1,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Tshirt1":2,"UsePed":false,"FrecklesOpacity":1.0,"Pants1":15,"VariationMisc1":0,"MakeupColor":1,"ChinShape":0.0,"Hat2":0,"SkinAspectOpacity":1.0}', '{"Vetement821":{"Data":{"Shoes1":32,"Shoes2":1,"Type":"Chaussure","Sexe":2},"Montant":1},"Vetement628":{"Data":{"Type":"Lunettes","Glasse2":1,"Glasse1":11,"Sexe":2},"Montant":1},"Vetement756":{"Data":{"Type":"Chapeau","Sexe":2,"Hat2":4,"Hat1":76},"Montant":1},"Vetement219":{"Data":{"Pants2":2,"Sexe":2,"Pants1":27,"Type":"Pantalon"},"Montant":1},"Vetement297":{"Data":{"Torso1":76,"Sexe":2,"Torso2":0,"ID":72,"Type":"Haut"},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000011958d3a3', 'Julio', 'Variaz', 'user', 'aucun', 1, NULL, 'false', 372, 0, 0, 200, '{"faim":40.2,"soif":36}', '{"x":377.11578369140627,"z":103.23625183105469,"y":316.30303955078127}', 20, 20, NULL, 185, '12 Janvier 1996', 'Homme', '{"NoseHeight":0.4,"LipstickOpacity":1.0,"EyebrowsColor":60,"EyebrowsColor2":60,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Sexe":1,"FrecklesOpacity":1.0,"Torso1":128,"LipstickColor":0,"EyesColor":5,"BeardColor":4,"TipNoseHeight":-0.4,"Complexion":-1,"VariationShoesColor":0,"Ageing":1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":3,"Hat1":-1,"VariationHead":0,"Torso2":5,"Pants1":21,"VariationTorsoColor":0,"Pere":19,"Arms2":0,"Shoes1":6,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":9,"VariationMisc2":0,"JawWidth":0.8,"Arms1":8,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.63,"MidNoseWidth":-0.4,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.4,"ChinHeight":-0.4,"MidNoseHeight":0.4,"Hat2":0,"ForeheadHeight":0.0,"AgeingOpacity":1.0,"Tshirt2":0,"HairColor":29,"VariationPants":0,"Hair":24,"Glasse2":0,"Shoes2":0,"VariationGloves":0,"CheekbonesHeight":0.4,"MakeupOpacity":1.0,"EyesSize":0.8,"CheekbonesWidth":-0.4,"EyebrowsOpacity":1.0,"Beard":0,"ChinWidth":0.4,"Tshirt1":15,"ShapeMix":0.61,"NoseWidth":-0.4,"UsePed":false,"VariationHair":0,"VariationTorso2Color":0,"Freckles":-1,"VariationMisc3":0,"VariationGlovesColor":0,"JawHeight":0.2,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Mere":6,"TipNoseBreak":0.0,"BeardColor2":60,"HairColor2":63,"CheeksWidth":-0.4,"MakeupColor":0,"ChinShape":-0.4,"VariationTorso2":0,"SkinAspectOpacity":1.0}', '{"eau":{"Montant":12},"Vetement661":{"Montant":1,"Data":{"Torso2":5,"Type":"Haut","Sexe":1,"Torso1":128,"ID":158}},"Vetement563":{"Montant":1,"Data":{"Pants2":2,"Sexe":1,"Pants1":62,"Type":"Pantalon"}},"Vetement648":{"Montant":1,"Data":{"Shoes1":6,"Shoes2":0,"Sexe":1,"Type":"Chaussure"}},"Telephone232":{"Data":{"Num":2420532},"Montant":1},"pain":{"Montant":24},"Vetement26":{"Montant":1,"Data":{"Pants2":0,"Sexe":1,"Pants1":42,"Type":"Pantalon"}}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000011aeca15a', 'Lazario', 'Gino', 'user', 'aucun', 1, NULL, 'false', 434, 0, 0, 191, '{"faim":74.8,"soif":65}', '{"z":61.901939392089847,"y":-1506.127197265625,"x":1431.3658447265626}', 20, 20, NULL, 186, '18 Avril 1977', 'Homme', '{"NoseHeight":0.2,"CheekbonesWidth":0.0,"EyebrowsColor":0,"MakeupOpacity":1.0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Sexe":1,"FrecklesOpacity":1.0,"Torso1":39,"LipstickColor":0,"EyesColor":5,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":8,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":1,"Pants1":21,"VariationTorsoColor":0,"Pere":9,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.8,"Eyebrows":27,"Freckles":-1,"JawWidth":0.8,"Arms1":0,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.2,"LipsWidth":0.0,"SkinMix":1.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"LipstickOpacity":1.0,"CheeksWidth":-1.0,"HairColor":0,"EyebrowsColor2":0,"VariationPants":0,"Hair":35,"Tshirt2":0,"VariationTorso2":0,"VariationGloves":0,"CheekbonesHeight":0.0,"BeardColor2":0,"EyesSize":-0.4,"ChinShape":0.0,"EyebrowsOpacity":1.0,"Beard":27,"ChinWidth":0.0,"VariationGlovesColor":0,"Glasse2":0,"NoseWidth":0.8,"Shoes1":5,"ShapeMix":1.0,"VariationHair":0,"VariationMisc1":0,"HairColor2":0,"TipNoseBreak":0.0,"JawHeight":0.2,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"VariationMisc2":0,"UsePed":false,"VariationMisc3":0,"Lipstick":-1,"VariationTorso2Color":0,"MakeupColor":0,"Tshirt1":15,"Mere":10,"SkinAspectOpacity":1.0}', '{"Vetement172":{"Data":{"Torso1":39,"Sexe":1,"Torso2":1,"ID":196,"Type":"Haut"},"Montant":1},"Vetement787":{"Data":{"Pants2":0,"Sexe":1,"Pants1":5,"Type":"Pantalon"},"Montant":1},"pain":{"Montant":10},"Vetement386":{"Data":{"Shoes1":5,"Shoes2":0,"Type":"Chaussure","Sexe":1},"Montant":1},"eau":{"Montant":10}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000112952914', 'Lil', 'Cox', 'user', 'aucun', 1, NULL, 'false', 81, 0, 0, 0, '{"faim":37.4,"soif":32}', '{"y":-206.80081176757813,"z":53.74191665649414,"x":137.76632690429688}', 20, 20, NULL, 185, '7 Janvier 2002', 'Homme', '{"NoseHeight":0.0,"LipstickOpacity":1.0,"EyebrowsColor":60,"MakeupOpacity":1.0,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"Tshirt1":15,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":0,"EyesColor":-1,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Mere":14,"VariationTorsoColor":0,"Pere":21,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":-1,"VariationMisc2":0,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"Glasse1":24,"HairColor":42,"FrecklesOpacity":1.0,"ChinShape":0.0,"Glasse2":1,"Torso2":0,"Freckles":-1,"VariationGloves":0,"CheekbonesHeight":0.0,"BeardColor2":0,"EyesSize":0.0,"VariationMisc1":0,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"Sexe":1,"HairColor2":0,"NoseWidth":0.0,"Shoes1":34,"ShapeMix":1.0,"CheekbonesWidth":0.0,"VariationGlovesColor":0,"EyebrowsColor2":0,"Lipstick":-1,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Tshirt2":0,"UsePed":false,"VariationHair":0,"VariationPants":0,"Hair":34,"MakeupColor":0,"TipNoseBreak":0.0,"Pants1":21,"SkinAspectOpacity":1.0}', '{"Vetement86":{"Data":{"Glasse2":1,"Type":"Lunettes","Glasse1":24,"Sexe":1},"Montant":1},"Vetement717":{"Data":{"Shoes2":12,"Type":"Chaussure","Shoes1":6,"Sexe":1},"Montant":1},"eau":{"Montant":3},"pain":{"Montant":2},"Vetement489":{"Data":{"Pants1":42,"Type":"Pantalon","Pants2":6,"Sexe":1},"Montant":1},"Telephone356":{"Data":{"Num":1252410},"Montant":1},"Vetement768":{"Data":{"ID":165,"Torso2":0,"Sexe":1,"Torso1":182,"Type":"Haut"},"Montant":1},"Vetement316":{"Data":{"Type":"Chapeau","Hat1":45,"Hat2":4,"Sexe":1},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000011a2aca3c', 'Cassie', 'Cox', 'user', 'aucun', 1, NULL, 'false', 2, 0, 0, 152, '{"soif":39,"faim":57.3}', '{"x":245.09780883789063,"y":-1238.651123046875,"z":29.248794555664064}', 20, 20, NULL, 164, '23 Janvier 1997', 'Femme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"VariationGlovesColor":0,"MakeupOpacity":0.82,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"Tshirt1":2,"FrecklesOpacity":1.0,"Torso1":15,"LipstickColor":6,"EyesColor":3,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":0,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":0,"Mere":21,"VariationTorsoColor":0,"Pere":8,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":14,"ForeheadWidth":0.0,"Eyebrows":0,"Freckles":-1,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":6,"Lipstick":0,"LipsWidth":0.0,"SkinMix":0.7,"MidNoseWidth":0.0,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":36,"HairColor":60,"Tshirt2":0,"VariationTorso2Color":0,"ChinShape":0.0,"Hair":4,"VariationTorso2":0,"BeardColor2":0,"VariationGloves":0,"CheekbonesHeight":0.0,"Shoes1":27,"EyesSize":0.0,"LipstickOpacity":0.73,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"EyebrowsColor2":3,"VariationPants":0,"NoseWidth":0.0,"Pants1":112,"VariationHair":0,"VariationMisc2":0,"EyebrowsColor":3,"Sexe":2,"Glasse1":-1,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"ForeheadHeight":0.0,"TipNoseBreak":0.0,"Hat2":0,"Shoes2":0,"UsePed":false,"MakeupColor":0,"ShapeMix":0.05,"Glasse2":0,"SkinAspectOpacity":1.0}', '{"Vetement731":{"Data":{"Shoes1":27,"Sexe":2,"Shoes2":0,"Type":"Chaussure"},"Montant":1},"Vetement511":{"Data":{"Pants2":0,"Sexe":2,"Pants1":112,"Type":"Pantalon"},"Montant":1},"pain":{"Montant":3},"CarteCredit857":{"Data":"3177-4240-3297-9867","Montant":1},"eau":{"Montant":1},"Vetement435":{"Data":{"Torso1":8,"Sexe":2,"Torso2":0,"ID":7,"Type":"Haut"},"Montant":1},"Telephone981":{"Data":{"Num":5957855},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000013208d9df', 'Marcus', 'Junior ', 'user', 'aucun', 1, NULL, 'false', 37, 0, 0, 199, '{"faim":48.2,"soif":76}', '{"x":-158.6606903076172,"z":34.92064666748047,"y":-1594.9864501953126}', 20, 20, NULL, 180, '14 Decembre 1990', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"BeardColor2":0,"EyebrowsColor2":0,"VariationMisc3":0,"VariationTorso":0,"Pants2":6,"Sexe":1,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":0,"EyesColor":-1,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":63,"VariationHead":0,"Torso2":0,"Mere":15,"VariationTorsoColor":0,"Pere":23,"Arms2":0,"Shoes1":9,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":31,"VariationMisc2":0,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":0.0,"SkinMix":0.47,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":4,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":11,"Glasse2":0,"Tshirt2":0,"MakeupOpacity":1.0,"VariationPants":0,"Hair":14,"Glasse1":-1,"Tshirt1":15,"VariationGloves":0,"CheekbonesHeight":0.0,"TipNoseBreak":0.0,"EyesSize":0.0,"Hat2":0,"EyebrowsOpacity":1.0,"Beard":15,"ChinWidth":0.0,"FrecklesOpacity":1.0,"LipstickOpacity":1.0,"NoseWidth":0.0,"Freckles":-1,"VariationHair":0,"ChinShape":0.0,"EyebrowsColor":0,"VariationGlovesColor":0,"Lipstick":-1,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"AgeingOpacity":1.0,"UsePed":false,"VariationMisc1":0,"Pants1":42,"HairColor":11,"MakeupColor":0,"VariationTorso2":0,"ShapeMix":0.58,"SkinAspectOpacity":1.0}', '{"Vetement953":{"Data":{"Pants2":6,"Sexe":1,"Pants1":42,"Type":"Pantalon"},"Montant":1},"Vetement785":{"Data":{"Type":"Chapeau","Sexe":1,"Hat2":0,"Hat1":63},"Montant":1},"CarteCredit448":{"Data":"3177-4240-3297-9867","Montant":1},"pain":{"Montant":10},"Vetement392":{"Data":{"Torso1":237,"Sexe":1,"Torso2":4,"ID":78,"Type":"Haut"},"Montant":1},"Vetement20":{"Data":{"Shoes1":9,"Shoes2":4,"Type":"Chaussure","Sexe":1},"Montant":1},"eau":{"Montant":9},"Telephone182":{"Data":{"Num":4190155},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000011932eb4e', 'Ayren', 'Lawrence', 'user', 'aucun', 1, NULL, 'false', 181, 0, 0, 190, '{"soif":47,"faim":34.4}', '{"x":-145.83218383789063,"z":34.83137130737305,"y":-1595.9830322265626}', 20, 20, NULL, 180, '1 Janvier 1970', 'Homme', '{"NoseHeight":0.2,"CheekbonesWidth":0.0,"VariationGlovesColor":0,"EyebrowsColor2":0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Sexe":1,"VariationTorso2Color":0,"Torso1":126,"LipstickColor":0,"EyesColor":-1,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":0,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":4,"Hat1":-1,"VariationHead":0,"Torso2":2,"Pants1":1,"VariationTorsoColor":0,"Pere":2,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":3,"VariationMisc2":0,"JawWidth":0.0,"Arms1":8,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":-0.8,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":1,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"Glasse2":0,"Tshirt2":0,"VariationMisc1":0,"VariationPants":0,"Hair":0,"HairColor2":0,"EyebrowsColor":1,"VariationGloves":0,"CheekbonesHeight":0.0,"VariationTorso2":0,"EyesSize":-0.4,"Freckles":-1,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"LipstickOpacity":1.0,"BeardColor2":0,"NoseWidth":0.8,"MakeupOpacity":1.0,"VariationHair":0,"VariationMisc3":0,"Lipstick":-1,"Tshirt1":15,"ChinShape":0.0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"FrecklesOpacity":1.0,"UsePed":false,"ShapeMix":0.14,"Shoes1":42,"HairColor":0,"MakeupColor":0,"Mere":15,"TipNoseBreak":0.0,"SkinAspectOpacity":1.0}', '{"Vetement69":{"Data":{"Torso1":5,"Sexe":1,"Torso2":0,"ID":58,"Type":"Haut"},"Montant":1},"Vetement940":{"Data":{"Torso1":153,"Sexe":1,"Torso2":6,"ID":162,"Type":"Haut"},"Montant":0},"eau":{"Montant":1},"Vetement567":{"Data":{"Shoes1":42,"Shoes2":1,"Type":"Chaussure","Sexe":1},"Montant":1},"Vetement75":{"Data":{"Torso1":5,"Sexe":1,"Torso2":2,"ID":58,"Type":"Haut"},"Montant":1},"Vetement980":{"Data":{"Torso1":126,"Sexe":1,"Torso2":2,"ID":157,"Type":"Haut"},"Montant":0},"Telephone868":{"Data":{"Num":9236999},"Montant":1},"Vetement973":{"Data":{"Torso1":5,"Sexe":1,"Torso2":0,"ID":58,"Type":"Haut"},"Montant":1},"pain":{"Montant":1},"Vetement795":{"Data":{"Pants2":0,"Sexe":1,"Pants1":1,"Type":"Pantalon"},"Montant":1},"Vetement441":{"Data":{"Hat2":2,"Sexe":1,"Type":"Chapeau","Hat1":7},"Montant":1},"Vetement563":{"Data":{"Pants2":6,"Sexe":1,"Pants1":5,"Type":"Pantalon"},"Montant":1},"Vetement992":{"Data":{"Shoes1":9,"Shoes2":2,"Type":"Chaussure","Sexe":1},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:1100001364976d4', 'Maybe', 'Joseph', 'user', 'aucun', 1, NULL, 'false', 853, 0, 0, 200, '{"soif":42,"faim":34.4}', '{"y":-1965.3790283203126,"z":23.226295471191408,"x":404.7005920410156}', 20, 20, NULL, 192, '25 Août  2000', 'Homme', '{"NoseHeight":0.4,"CheekbonesWidth":-0.4,"BeardColor2":0,"MakeupOpacity":1.0,"Glasse1":-1,"VariationTorso":0,"Pants2":5,"CheeksWidth":-0.4,"FrecklesOpacity":0.58,"Torso1":5,"LipstickColor":0,"EyesColor":1,"BeardColor":1,"TipNoseHeight":0.4,"Complexion":5,"VariationShoesColor":0,"Ageing":4,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":0.7,"SkinAspect":5,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Mere":14,"VariationTorsoColor":0,"Pere":3,"Arms2":0,"Shoes1":7,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.8,"Eyebrows":31,"VariationMisc2":0,"JawWidth":0.8,"Arms1":5,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.2,"LipsWidth":-0.8,"SkinMix":0.0,"MidNoseWidth":-0.8,"Blemishes":11,"Shoes2":8,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":-0.2,"HairColor2":0,"EyebrowsColor2":1,"Pants1":1,"Tshirt2":0,"VariationTorso2Color":0,"ChinShape":0.0,"Hair":14,"HairColor":0,"VariationMisc3":0,"VariationGloves":0,"CheekbonesHeight":0.4,"UsePed":false,"EyesSize":-0.4,"Hat2":0,"EyebrowsOpacity":1.0,"Beard":3,"ChinWidth":0.0,"Sexe":1,"Torso2":1,"NoseWidth":-0.4,"Freckles":4,"VariationHair":0,"LipstickOpacity":1.0,"Lipstick":-1,"VariationGlovesColor":0,"Tshirt1":15,"JawHeight":0.2,"ComplexionOpacity":0.65,"BeardOpacity":0.95,"VariationMisc1":0,"TipNoseBreak":0.6,"EyebrowsColor":0,"VariationPants":0,"Glasse2":0,"MakeupColor":0,"ShapeMix":0.87,"AgeingOpacity":0.62,"SkinAspectOpacity":0.62}', '{"Vetement276":{"Data":{"Pants2":5,"Sexe":1,"Pants1":1,"Type":"Pantalon"},"Montant":1},"Vetement54":{"Data":{"Torso1":5,"Sexe":1,"Torso2":1,"ID":58,"Type":"Haut"},"Montant":1},"pain":{"Montant":10},"eau":{"Montant":10},"Vetement262":{"Data":{"Shoes1":7,"Shoes2":8,"Sexe":1,"Type":"Chaussure"},"Montant":1},"CarteCredit857":{"Data":"3177-4240-3297-9867","Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000013c98a98c', 'Gustavo', 'Carrillo', 'user', 'aucun', 1, NULL, 'false', 182, 0, 0, 0, '{"soif":33,"faim":98.6}', '{"x":-807.99072265625,"z":4.276158809661865,"y":-1286.890380859375}', 20, 20, NULL, 140, '29 Juillet 1990', 'Homme', '{"NoseHeight":0.0,"LipstickOpacity":1.0,"BeardColor2":3,"EyebrowsColor2":0,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"Sexe":1,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":0,"EyesColor":-1,"BeardColor":3,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":0,"Pants1":21,"VariationTorsoColor":0,"Pere":4,"Arms2":0,"Shoes1":4,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":2,"VariationMisc2":0,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"ChinShape":0.0,"HairColor":0,"VariationTorso2":0,"VariationPants":0,"Glasse2":0,"Freckles":-1,"AgeingOpacity":1.0,"VariationGloves":0,"CheekbonesHeight":0.0,"Hat2":0,"EyesSize":0.0,"UsePed":false,"EyebrowsOpacity":1.0,"Beard":3,"ChinWidth":0.0,"Tshirt2":0,"ForeheadHeight":0.0,"NoseWidth":0.0,"CheekbonesWidth":0.0,"ShapeMix":0.8,"Hair":12,"EyebrowsColor":0,"Glasse1":-1,"MakeupOpacity":1.0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Tshirt1":15,"TipNoseBreak":0.0,"FrecklesOpacity":1.0,"Shoes2":0,"VariationGlovesColor":0,"MakeupColor":0,"VariationHair":0,"Mere":4,"SkinAspectOpacity":1.0}', '{"Vetement351":{"Data":{"Shoes1":4,"Shoes2":0,"Sexe":1,"Type":"Chaussure"},"Montant":1},"Telephone35":{"Data":{"Num":3488128},"Montant":1},"pain":{"Montant":43},"eau":{"Montant":50},"Vetement468":{"Data":{"Torso1":1,"Sexe":1,"Torso2":3,"ID":1,"Type":"Haut"},"Montant":1},"Vetement350":{"Data":{"Pants2":0,"Sexe":1,"Pants1":12,"Type":"Pantalon"},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000131e700e0', 'Juan', 'Telouk', 'user', 'aucun', 1, NULL, 'false', 1, 0, 0, 0, '{"faim":47.0,"soif":35}', '{"x":359.6722106933594,"y":-2003.6829833984376,"z":22.576011657714845}', 20, 20, NULL, 175, '9 Février  2003', 'Homme', '{"NoseHeight":0.4,"CheekbonesWidth":0.6,"BeardColor2":0,"MakeupOpacity":1.0,"Glasse1":-1,"VariationTorso":0,"Pants2":1,"Tshirt1":15,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":0,"EyesColor":5,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":104,"VariationHead":0,"Torso2":0,"Pants1":6,"VariationTorsoColor":0,"Pere":8,"Arms2":0,"Shoes1":34,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":9,"Freckles":-1,"JawWidth":-0.4,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":0.0,"SkinMix":1.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.2,"ChinHeight":0.8,"MidNoseHeight":0.0,"HairColor2":0,"VariationMisc2":0,"Sexe":1,"Tshirt2":0,"ChinShape":0.0,"VariationPants":0,"Glasse2":0,"VariationTorso2":0,"Lipstick":-1,"VariationGloves":0,"CheekbonesHeight":0.2,"EyebrowsColor":0,"EyesSize":0.0,"LipstickOpacity":1.0,"EyebrowsOpacity":1.0,"Beard":0,"ChinWidth":0.0,"CheeksWidth":0.8,"Hair":7,"NoseWidth":-0.4,"VariationMisc1":0,"VariationHair":0,"VariationGlovesColor":0,"EyebrowsColor2":0,"HairColor":0,"VariationMisc3":0,"JawHeight":0.4,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"FrecklesOpacity":1.0,"UsePed":false,"AgeingOpacity":1.0,"TipNoseBreak":0.0,"ShapeMix":0.6,"MakeupColor":0,"Hat2":1,"Mere":20,"SkinAspectOpacity":1.0}', '{"Telephone486":{"Data":{"Num":7912872},"Montant":1},"Vetement22":{"Data":{"Hat2":1,"Sexe":1,"Type":"Chapeau","Hat1":104},"Montant":1},"pain":{"Montant":12},"eau":{"Montant":8},"Vetement35":{"Data":{"Pants2":1,"Sexe":1,"Pants1":6,"Type":"Pantalon"},"Montant":1},"Vetement106":{"Data":{"Shoes1":8,"Shoes2":6,"Type":"Chaussure","Sexe":1},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000011387682e', 'Marco', 'Cedeno', 'user', 'mineur', 1, NULL, 'false', 200, 0, 0, 196, '{"soif":16,"faim":33.7}', '{"y":-2008.80419921875,"x":1109.121337890625,"z":30.991329193115236}', 20, 20, NULL, 179, '23 Août  1989', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"BeardColor2":0,"MakeupOpacity":1.0,"Glasse1":-1,"VariationTorso":0,"Pants2":2,"Tshirt1":15,"VariationTorso2Color":0,"Torso1":82,"LipstickColor":0,"EyesColor":0,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":3,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Pants1":55,"VariationTorsoColor":0,"Pere":4,"Arms2":0,"Shoes1":6,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":12,"Freckles":-1,"JawWidth":0.0,"Arms1":0,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"Tshirt2":0,"HairColor":0,"LipstickOpacity":1.0,"ChinShape":0.0,"Hair":31,"Lipstick":-1,"Sexe":1,"VariationGloves":0,"CheekbonesHeight":0.0,"ShapeMix":0.0,"EyesSize":0.0,"VariationMisc3":0,"EyebrowsOpacity":1.0,"Beard":8,"ChinWidth":0.0,"FrecklesOpacity":1.0,"VariationMisc2":0,"NoseWidth":0.0,"VariationPants":0,"VariationHair":0,"VariationGlovesColor":0,"EyebrowsColor2":0,"Glasse2":0,"EyebrowsColor":1,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"VariationMisc1":0,"TipNoseBreak":0.0,"UsePed":false,"AgeingOpacity":1.0,"Hat2":0,"MakeupColor":0,"Torso2":9,"Mere":19,"SkinAspectOpacity":1.0}', '{"Vetement563":{"Data":{"Type":"Chaussure","Shoes2":0,"Sexe":1,"Shoes1":6},"Montant":1},"Vetement901":{"Data":{"Torso1":82,"Sexe":1,"Torso2":9,"ID":205,"Type":"Haut"},"Montant":1},"CarteCredit179":{"Data":"3177-4240-3297-9867","Montant":1},"Vetement640":{"Data":{"Torso1":216,"Sexe":1,"Torso2":10,"ID":75,"Type":"Haut"},"Montant":1},"ffer":{"Montant":9},"for":{"Montant":1},"pain":{"Montant":9},"pierre":{"Montant":90},"eau":{"Montant":6},"Telephone809":{"Data":{"Num":1865722},"Montant":1},"Vetement92":{"Data":{"Type":"Pantalon","Sexe":1,"Pants1":55,"Pants2":2},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000013eb361b6', 'Ricco', 'Jamires', 'user', 'aucun', 1, NULL, 'false', 850, 0, 0, 200, '{"faim":19.2,"soif":6}', '{"y":-2019.2900390625,"z":26.16861343383789,"x":337.51287841796877}', 20, 20, NULL, 181, '1 Août  1996', 'Homme', '{"NoseHeight":0.0,"LipstickOpacity":1.0,"VariationGlovesColor":0,"MakeupOpacity":1.0,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"Sexe":1,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":0,"EyesColor":8,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Mere":21,"VariationTorsoColor":0,"Pere":19,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":57,"ForeheadWidth":0.0,"Eyebrows":33,"Freckles":-1,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":0.0,"SkinMix":0.79,"MidNoseWidth":0.0,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"UsePed":false,"HairColor":0,"HairColor2":14,"VariationPants":0,"Glasse2":0,"Pants1":21,"Torso2":0,"VariationGloves":0,"CheekbonesHeight":0.0,"EyebrowsColor":0,"EyesSize":0.0,"FrecklesOpacity":1.0,"EyebrowsOpacity":1.0,"Beard":3,"ChinWidth":0.0,"CheekbonesWidth":0.0,"VariationMisc2":0,"NoseWidth":0.0,"BeardColor2":0,"VariationHair":0,"EyebrowsColor2":0,"Glasse1":-1,"Lipstick":-1,"Tshirt1":15,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"ChinShape":0.0,"TipNoseBreak":0.0,"Shoes2":11,"Hair":6,"ShapeMix":0.34,"MakeupColor":0,"Tshirt2":0,"Shoes1":7,"SkinAspectOpacity":1.0}', '{"Vetement41":{"Data":{"Pants2":0,"Sexe":1,"Pants1":42,"Type":"Pantalon"},"Montant":1},"Vetement297":{"Data":{"Shoes1":7,"Sexe":1,"Type":"Chaussure","Shoes2":11},"Montant":1},"Vetement92":{"Data":{"Torso1":82,"Sexe":1,"Torso2":2,"ID":205,"Type":"Haut"},"Montant":1},"Vetement851":{"Data":{"Hat2":20,"Sexe":1,"Type":"Chapeau","Hat1":104},"Montant":1},"Vetement123":{"Data":{"Type":"Lunettes","Sexe":1,"Glasse2":5,"Glasse1":17},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:1100001188b2196', 'Stavo Guez', 'Maria', 'user', 'aucun', 1, NULL, 'false', 886, 0, 0, 200, '{"faim":41.6,"soif":38}', '{"x":320.40264892578127,"y":-1985.06787109375,"z":22.82254981994629}', 20, 20, NULL, 183, '15 Juin 1996', 'Homme', '{"NoseHeight":0.4,"CheekbonesWidth":0.0,"BeardColor2":0,"MakeupOpacity":1.0,"Glasse1":7,"VariationTorso":0,"Pants2":0,"Tshirt1":15,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":0,"EyesColor":2,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":0,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":2,"VariationHead":0,"Torso2":0,"Mere":5,"VariationTorsoColor":0,"Pere":12,"Arms2":0,"Shoes1":34,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":12,"VariationMisc2":0,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.2,"ChinHeight":0.8,"MidNoseHeight":0.0,"HairColor2":0,"VariationGlovesColor":0,"EyebrowsColor":0,"Tshirt2":0,"VariationTorso2":0,"VariationPants":0,"Glasse2":0,"LipstickOpacity":1.0,"TipNoseBreak":0.0,"VariationGloves":0,"CheekbonesHeight":0.0,"Hat2":0,"EyesSize":-0.4,"ForeheadHeight":0.0,"EyebrowsOpacity":1.0,"Beard":3,"ChinWidth":0.0,"CheeksWidth":-0.4,"Freckles":-1,"NoseWidth":-0.4,"AgeingOpacity":1.0,"VariationHair":0,"EyebrowsColor2":0,"VariationMisc3":0,"Sexe":1,"FrecklesOpacity":1.0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"VariationMisc1":0,"UsePed":false,"HairColor":0,"ChinShape":0.0,"ShapeMix":1.0,"MakeupColor":0,"Hair":24,"Pants1":21,"SkinAspectOpacity":1.0}', '{"Vetement375":{"Data":{"Torso1":238,"Sexe":1,"Torso2":1,"ID":79,"Type":"Haut"},"Montant":1},"Vetement841":{"Data":{"Type":"Lunettes","Glasse2":0,"Sexe":1,"Glasse1":7},"Montant":1},"Vetement487":{"Data":{"Pants2":0,"Sexe":1,"Pants1":42,"Type":"Pantalon"},"Montant":1},"Vetement549":{"Data":{"Shoes1":8,"Shoes2":6,"Type":"Chaussure","Sexe":1},"Montant":1},"Vetement316":{"Data":{"Hat2":0,"Sexe":1,"Type":"Chapeau","Hat1":2},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000010a0c3c2b', 'Nina', 'Diaz', 'user', 'aucun', 1, NULL, 'false', 187, 0, 0, 135, '{"soif":27,"faim":33.9}', '{"x":156.89202880859376,"z":29.22433090209961,"y":-1288.1553955078126}', 20, 20, NULL, 186, '24 Octobre 1996', 'Femme', '{"NoseHeight":0.0,"LipstickOpacity":1.0,"VariationGlovesColor":0,"MakeupOpacity":1.0,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"CheeksWidth":0.0,"FrecklesOpacity":1.0,"Torso1":15,"LipstickColor":0,"EyesColor":8,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":0,"Pants1":102,"VariationTorsoColor":0,"Pere":19,"Arms2":0,"Shoes1":35,"VariationShoes":0,"Makeup":0,"ForeheadWidth":0.0,"Eyebrows":5,"Freckles":-1,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":0.4,"SkinMix":0.7,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"Sexe":2,"Lipstick":-1,"Tshirt2":0,"EyebrowsColor":1,"ChinShape":0.0,"Glasse2":0,"Mere":21,"EyebrowsColor2":0,"VariationGloves":0,"CheekbonesHeight":0.0,"VariationTorso2Color":0,"EyesSize":0.0,"HairColor":38,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"Hair":15,"VariationPants":0,"NoseWidth":0.0,"Tshirt1":2,"ShapeMix":0.05,"VariationHair":0,"CheekbonesWidth":0.0,"VariationMisc2":0,"AgeingOpacity":1.0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Glasse1":-1,"UsePed":false,"VariationMisc1":0,"HairColor2":0,"BeardColor2":0,"MakeupColor":1,"VariationTorso2":0,"TipNoseBreak":0.0,"SkinAspectOpacity":1.0}', '{"Vetement426":{"Data":{"Type":"Pantalon","Sexe":2,"Pants1":102,"Pants2":0},"Montant":1},"Telephone389":{"Data":{"Num":4351654},"Montant":1},"Vetement661":{"Data":{"Torso1":7,"Sexe":2,"Torso2":0,"ID":6,"Type":"Haut"},"Montant":1},"Vetement441":{"Data":{"Type":"Lunettes","Glasse2":7,"Glasse1":11,"Sexe":2},"Montant":1},"Vetement742":{"Data":{"Type":"Chaussure","Shoes2":3,"Sexe":2,"Shoes1":19},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000114b6ed5e', 'Jose', 'Perez', 'user', 'mineur', 1, NULL, 'false', 6654, 0, 0, 200, '{"soif":30,"faim":38.5}', '{"x":1109.67578125,"z":31.057029724121095,"y":-2008.420654296875}', 20, 20, NULL, 190, '28 Decembre 1997', 'Homme', '{"NoseHeight":-0.1,"LipstickOpacity":1.0,"VariationGlovesColor":0,"EyebrowsColor2":0,"Glasse1":2,"VariationTorso":0,"Pants2":1,"CheeksWidth":0.24,"VariationTorso2Color":0,"Torso1":17,"LipstickColor":0,"EyesColor":-1,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":105,"VariationHead":0,"Torso2":1,"Pants1":1,"VariationTorsoColor":0,"Pere":4,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":-1,"VariationMisc2":0,"JawWidth":0.0,"Arms1":5,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":-1.0,"SkinMix":0.42,"MidNoseWidth":0.18,"Blemishes":-1,"Shoes2":5,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.26,"HairColor2":0,"MakeupOpacity":1.0,"ShapeMix":0.68,"Tshirt2":0,"Sexe":1,"VariationPants":0,"Hair":0,"Shoes1":57,"Tshirt1":15,"VariationGloves":0,"CheekbonesHeight":0.82,"Hat2":20,"EyesSize":-0.24,"ForeheadHeight":0.0,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"Mere":2,"ChinShape":0.0,"NoseWidth":0.16,"CheekbonesWidth":0.76,"VariationHair":0,"EyebrowsColor":0,"VariationMisc3":0,"HairColor":0,"FrecklesOpacity":1.0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"VariationMisc1":0,"TipNoseBreak":0.0,"Freckles":-1,"Glasse2":0,"UsePed":false,"MakeupColor":0,"BeardColor2":0,"VariationTorso2":0,"SkinAspectOpacity":1.0}', '{"Vetement26":{"Data":{"Type":"Lunettes","Glasse2":0,"Sexe":1,"Glasse1":2},"Montant":1},"Telephone128":{"Data":{"Num":6889221},"Montant":1},"Vetement964":{"Data":{"Torso1":5,"Sexe":1,"Torso2":2,"ID":58,"Type":"Haut"},"Montant":1},"Vetement761":{"Data":{"Torso1":17,"Sexe":1,"Torso2":1,"ID":59,"Type":"Haut"},"Montant":1},"Vetement356":{"Data":{"Type":"Pantalon","Sexe":1,"Pants1":1,"Pants2":1},"Montant":1},"Vetement510":{"Data":{"Torso1":205,"Sexe":1,"Torso2":0,"ID":72,"Type":"Haut"},"Montant":1},"Vetement675":{"Data":{"Type":"Chaussure","Shoes2":5,"Sexe":1,"Shoes1":57},"Montant":1},"ffer":{"Montant":17},"Vetement380":{"Data":{"Type":"Chapeau","Sexe":1,"Hat2":20,"Hat1":105},"Montant":1},"pain":{"Montant":13},"pierre":{"Montant":1808},"eau":{"Montant":11},"pdiamant":{"Montant":1},"for":{"Montant":6}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000010b9a3705', 'Elio', 'VARGAS', 'user', 'aucun', 1, NULL, 'false', 489, 0, 0, 180, '{"faim":35.8,"soif":39}', '{"x":347.183349609375,"y":-2028.058349609375,"z":25.594642639160158}', 20, 20, NULL, 171, '28 Septembre 1989', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":-0.4,"BeardColor2":0,"MakeupOpacity":1.0,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"Tshirt1":15,"FrecklesOpacity":1.0,"Torso1":5,"LipstickColor":0,"EyesColor":5,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":0,"Pants1":21,"VariationTorsoColor":0,"Pere":4,"Arms2":0,"Shoes1":34,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":30,"Freckles":-1,"JawWidth":0.8,"Arms1":5,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":0.4,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"VariationMisc2":0,"Sexe":1,"Tshirt2":0,"Hair":1,"VariationPants":0,"Glasse2":0,"ChinShape":0.0,"HairColor":0,"VariationGloves":0,"CheekbonesHeight":0.4,"Hat2":0,"EyesSize":0.8,"LipstickOpacity":1.0,"EyebrowsOpacity":1.0,"Beard":3,"ChinWidth":0.0,"VariationHair":0,"CheeksWidth":0.8,"NoseWidth":0.0,"EyebrowsColor2":0,"ShapeMix":0.8,"EyebrowsColor":1,"Glasse1":-1,"AgeingOpacity":1.0,"Lipstick":-1,"JawHeight":0.2,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"VariationTorso2Color":0,"UsePed":false,"VariationMisc1":0,"Mere":8,"VariationTorso2":0,"MakeupColor":0,"VariationGlovesColor":0,"TipNoseBreak":0.0,"SkinAspectOpacity":1.0}', '{"eau":{"Montant":7},"Vetement516":{"Data":{"Shoes1":32,"Shoes2":7,"Sexe":1,"Type":"Chaussure"},"Montant":1},"Vetement857":{"Data":{"Pants2":5,"Sexe":1,"Pants1":42,"Type":"Pantalon"},"Montant":1},"Vetement233":{"Data":{"Glasse2":0,"Sexe":1,"Glasse1":5,"Type":"Lunettes"},"Montant":1},"Telephone33":{"Data":{"Num":7735443},"Montant":1},"Vetement661":{"Data":{"Torso2":0,"ID":58,"Sexe":1,"Torso1":5,"Type":"Haut"},"Montant":1},"pain":{"Montant":6},"Vetement373":{"Data":{"Type":"Chapeau","Sexe":1,"Hat2":5,"Hat1":28},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000142a22c3f', 'Bobby', 'Swager ', 'user', 'mineur', 1, NULL, 'false', 1558, 0, 0, 190, '{"soif":33,"faim":77.4}', '{"x":878.5556640625,"z":5.5028157234191898,"y":-3216.265625}', 20, 20, NULL, 190, '25 Mai 1995', 'Homme', '{"NoseHeight":0.0,"LipstickOpacity":1.0,"VariationGlovesColor":0,"MakeupOpacity":1.0,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"CheeksWidth":-0.4,"VariationTorso2Color":0,"Torso1":43,"LipstickColor":0,"EyesColor":1,"BeardColor":0,"TipNoseHeight":0.4,"Complexion":-1,"VariationShoesColor":0,"Ageing":1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Mere":7,"VariationTorsoColor":0,"Pere":12,"Arms2":0,"Shoes1":10,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":-0.4,"Eyebrows":-1,"VariationMisc2":0,"JawWidth":0.8,"Arms1":8,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.4,"LipsWidth":0.4,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.2,"ChinHeight":0.8,"MidNoseHeight":0.0,"Hat2":0,"VariationHair":0,"Torso2":0,"Tshirt2":0,"Shoes2":0,"VariationPants":0,"Hair":9,"Glasse1":-1,"Glasse2":0,"VariationGloves":0,"CheekbonesHeight":0.2,"EyebrowsColor2":0,"EyesSize":-0.4,"HairColor":11,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.2,"HairColor2":0,"FrecklesOpacity":1.0,"NoseWidth":0.0,"ChinShape":0.8,"ShapeMix":1.0,"Freckles":-1,"CheekbonesWidth":0.6,"EyebrowsColor":0,"Lipstick":-1,"JawHeight":0.2,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Tshirt1":15,"TipNoseBreak":0.6,"Pants1":10,"Sexe":1,"AgeingOpacity":1.0,"MakeupColor":0,"BeardColor2":0,"UsePed":false,"SkinAspectOpacity":1.0}', '{"Vetement30":{"Data":{"Torso1":43,"Sexe":1,"Torso2":0,"ID":144,"Type":"Haut"},"Montant":1},"Vetement695":{"Data":{"Shoes1":10,"Shoes2":0,"Type":"Chaussure","Sexe":1},"Montant":1},"CarteCredit857":{"Data":"3177-4240-3297-9867","Montant":1},"ffer":{"Montant":0},"eau":{"Montant":13},"pain":{"Montant":17},"pierre":{"Montant":0},"pdiamant":{"Montant":0},"Vetement374":{"Data":{"Pants2":0,"Sexe":1,"Pants1":10,"Type":"Pantalon"},"Montant":1},"for":{"Montant":7}}', '{}', 'true', 'true', 'false', 'false', 'false'),
	('steam:11000013cd73339', 'Jesus', 'Scarto', 'user', 'aucun', 1, NULL, 'false', 797, 0, 0, 180, '{"soif":0,"faim":11.5}', '{"z":22.394874572753908,"x":343.92950439453127,"y":-2015.4556884765626}', 20, 20, NULL, 189, '2 Mai 1997', 'Homme', '{"NoseHeight":0.0,"LipstickOpacity":1.0,"BeardColor2":0,"MakeupOpacity":1.0,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"Tshirt1":15,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":0,"EyesColor":-1,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":2,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":0,"Mere":4,"VariationTorsoColor":0,"Pere":4,"Arms2":0,"Shoes1":34,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":-1,"VariationMisc2":0,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"HairColor":0,"Glasse1":-1,"Tshirt2":0,"Pants1":21,"VariationPants":1,"Glasse2":0,"Freckles":-1,"AgeingOpacity":1.0,"VariationGloves":0,"CheekbonesHeight":0.0,"ShapeMix":0.8,"EyesSize":0.0,"Hair":0,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"ChinShape":0.0,"FrecklesOpacity":1.0,"NoseWidth":0.0,"PedUsed":"g_m_y_mexgoon_02","VariationHair":0,"CheekbonesWidth":0.0,"VariationGlovesColor":0,"EyebrowsColor":0,"EyebrowsColor2":0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"TipNoseBreak":0.0,"UsePed":true,"Lipstick":-1,"Sexe":1,"Shoes2":0,"MakeupColor":0,"HairColor2":0,"VariationTorso2":0,"SkinAspectOpacity":1.0}', '{}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000010ba935c4', NULL, NULL, 'user', 'aucun', 1, NULL, 'false', 0, 0, 0, 175, '{"soif":49,"faim":49.3}', '{"z":52.240631103515628,"x":-1514.2882080078126,"y":107.07049560546875}', 20, 20, NULL, NULL, NULL, NULL, NULL, '{}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000140179ffa', 'Emilio', 'Carlos', 'user', 'aucun', 1, NULL, 'false', 869, 0, 0, 200, '{"faim":42.1,"soif":53}', '{"x":1433.76953125,"y":-1494.118408203125,"z":63.22446060180664}', 20, 20, NULL, 178, '13 Avril 1995', 'Homme', '{"NoseHeight":0.0,"LipstickOpacity":1.0,"EyebrowsColor":0,"EyebrowsColor2":0,"Glasse1":-1,"VariationTorso":0,"Pants2":4,"Sexe":1,"FrecklesOpacity":1.0,"Torso1":126,"LipstickColor":0,"EyesColor":-1,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":9,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":5,"Mere":10,"VariationTorsoColor":0,"Pere":4,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":-0.4,"Eyebrows":0,"VariationMisc2":0,"JawWidth":0.0,"Arms1":8,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"VariationMisc1":0,"Tshirt2":0,"VariationGlovesColor":0,"VariationPants":0,"Glasse2":0,"ShapeMix":0.8,"VariationTorso2":0,"VariationGloves":0,"CheekbonesHeight":0.0,"HairColor2":0,"EyesSize":0.0,"MakeupOpacity":0.86,"EyebrowsOpacity":1.0,"Beard":3,"ChinWidth":0.0,"TipNoseBreak":0.0,"VariationTorso2Color":0,"NoseWidth":0.0,"Freckles":-1,"VariationHair":0,"BeardColor2":0,"VariationMisc3":0,"ForeheadHeight":0.4,"Tshirt1":15,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"HairColor":56,"UsePed":false,"Shoes1":1,"Hair":1,"CheekbonesWidth":0.0,"MakeupColor":0,"ChinShape":0.0,"Pants1":5,"SkinAspectOpacity":1.0}', '{"Vetement574":{"Montant":1,"Data":{"Pants1":5,"Sexe":1,"Pants2":4,"Type":"Pantalon"}},"Vetement447":{"Montant":1,"Data":{"Pants1":1,"Sexe":1,"Pants2":1,"Type":"Pantalon"}},"Vetement34":{"Montant":1,"Data":{"Hat1":94,"Sexe":1,"Hat2":2,"Type":"Chapeau"}},"Vetement863":{"Montant":1,"Data":{"Shoes1":1,"Shoes2":0,"Sexe":1,"Type":"Chaussure"}},"Vetement601":{"Montant":1,"Data":{"Glasse2":0,"Sexe":1,"Glasse1":2,"Type":"Lunettes"}},"Vetement626":{"Montant":1,"Data":{"Hat1":104,"Sexe":1,"Hat2":20,"Type":"Chapeau"}},"Vetement744":{"Montant":1,"Data":{"Torso2":1,"ID":196,"Sexe":1,"Torso1":39,"Type":"Haut"}},"Vetement299":{"Montant":1,"Data":{"Torso2":5,"ID":157,"Sexe":1,"Torso1":126,"Type":"Haut"}},"Vetement949":{"Montant":1,"Data":{"Shoes1":7,"Shoes2":0,"Sexe":1,"Type":"Chaussure"}},"eau":{"Montant":3},"pain":{"Montant":2},"Vetement381":{"Montant":1,"Data":{"Pants1":7,"Sexe":1,"Pants2":4,"Type":"Pantalon"}}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000010ea934e8', 'Amalia', 'Flores', 'user', 'aucun', 1, NULL, 'false', 180, 0, 0, 115, '{"soif":13,"faim":6.6}', '{"x":1450.18310546875,"z":113.52633666992188,"y":1147.33642578125}', 20, 20, NULL, 170, '27 Février  1998', 'Femme', '{"NoseHeight":0.4,"CheekbonesWidth":0.0,"EyebrowsColor":0,"EyebrowsColor2":0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Tshirt1":34,"FrecklesOpacity":1.0,"Torso1":85,"LipstickColor":21,"EyesColor":2,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Pants1":76,"VariationTorsoColor":0,"Pere":10,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":1,"Freckles":-1,"JawWidth":0.0,"Arms1":14,"MakeupColor2":0,"LipstickColor2":7,"Lipstick":0,"LipsWidth":0.0,"SkinMix":0.88,"MidNoseWidth":-0.4,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.4,"HairColor2":2,"VariationMisc3":0,"Tshirt2":0,"LipstickOpacity":0.24,"ChinShape":0.0,"Hair":15,"VariationTorso2Color":0,"Hat2":0,"VariationGloves":0,"CheekbonesHeight":0.0,"Mere":21,"EyesSize":0.0,"ForeheadHeight":0.0,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"Torso2":0,"VariationPants":0,"NoseWidth":-0.4,"VariationMisc2":0,"ShapeMix":0.19,"MakeupOpacity":1.0,"VariationHair":0,"Sexe":2,"Glasse2":0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"VariationMisc1":0,"TipNoseBreak":0.0,"Shoes1":3,"HairColor":2,"BeardColor2":0,"MakeupColor":0,"VariationGlovesColor":0,"UsePed":false,"SkinAspectOpacity":1.0}', '{"Vetement754":{"Data":{"Pants2":0,"Sexe":2,"Pants1":76,"Type":"Pantalon"},"Montant":1},"Telephone128":{"Data":{"Num":1830841},"Montant":1},"Vetement512":{"Data":{"Torso1":85,"Sexe":2,"Torso2":0,"ID":80,"Type":"Haut"},"Montant":1},"pain":{"Montant":2},"eau":{"Montant":2},"Vetement993":{"Data":{"Shoes1":3,"Sexe":2,"Type":"Chaussure","Shoes2":0},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000010f3b1985', 'Oscar', 'Ramirez', 'user', 'aucun', 1, NULL, 'false', 83, 0, 0, 184, '{"faim":41.9,"soif":39}', '{"x":1442.568603515625,"z":70.48262023925781,"y":-1489.1234130859376}', 20, 20, NULL, 195, '12 Decembre 1995', 'Homme', '{"NoseHeight":-0.02,"CheekbonesWidth":-0.36,"BeardColor2":0,"EyebrowsColor2":0,"VariationMisc3":0,"VariationTorso":0,"Pants2":3,"Sexe":1,"VariationTorso2Color":0,"Torso1":3,"LipstickColor":0,"EyesColor":26,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":2,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Mere":2,"VariationTorsoColor":0,"Pere":17,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.8,"Eyebrows":31,"Freckles":-1,"JawWidth":-0.74,"Arms1":1,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.2,"LipsWidth":0.0,"SkinMix":0.7,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":2,"ChinPosition":0.0,"ChinHeight":0.66,"MidNoseHeight":0.0,"HairColor2":0,"FrecklesOpacity":1.0,"Pants1":5,"Tshirt2":0,"VariationMisc1":0,"VariationPants":0,"Hair":7,"VariationGlovesColor":0,"Torso2":0,"VariationGloves":0,"CheekbonesHeight":0.08,"CheeksWidth":-0.1,"EyesSize":0.0,"LipstickOpacity":1.0,"EyebrowsOpacity":1.0,"Beard":2,"ChinWidth":-0.2,"VariationMisc2":0,"Lipstick":-1,"NoseWidth":-0.74,"HairColor":0,"VariationHair":0,"MakeupOpacity":1.0,"Glasse1":5,"Tshirt1":0,"EyebrowsColor":0,"JawHeight":1.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Hat2":0,"TipNoseBreak":0.0,"Glasse2":5,"ChinShape":-0.38,"UsePed":false,"MakeupColor":0,"Shoes1":9,"ShapeMix":0.15,"SkinAspectOpacity":1.0}', '{"eau":{"Montant":22},"Vetement41":{"Data":{"Torso1":3,"Sexe":1,"Torso2":0,"ID":2,"Type":"Haut"},"Montant":1},"Telephone171":{"Data":{"Num":1039825},"Montant":1},"pain":{"Montant":13},"Vetement720":{"Data":{"Shoes1":9,"Shoes2":2,"Sexe":1,"Type":"Chaussure"},"Montant":1},"Telephone338":{"Data":{"Num":1678405},"Montant":0},"Vetement661":{"Data":{"Pants2":3,"Sexe":1,"Pants1":5,"Type":"Pantalon"},"Montant":1},"Vetement18":{"Data":{"Type":"Lunettes","Glasse2":5,"Sexe":1,"Glasse1":5},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000013e6405a8', 'Juan', 'Jimenez', 'user', 'aucun', 1, NULL, 'false', 435, 0, 0, 190, '{"soif":19,"faim":28.3}', '{"y":-151.1517333984375,"x":446.4630126953125,"z":61.8823356628418}', 20, 20, NULL, 185, '1 Juillet 1995', 'Homme', '{"NoseHeight":0.0,"LipstickOpacity":1.0,"BeardColor2":0,"MakeupOpacity":1.0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Sexe":1,"VariationTorso2Color":0,"Torso1":216,"LipstickColor":0,"EyesColor":1,"BeardColor":1,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":105,"VariationHead":0,"VariationTorso2":0,"Pants1":21,"VariationTorsoColor":0,"Pere":2,"Arms2":0,"Shoes1":34,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":-0.4,"Eyebrows":12,"Freckles":-1,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.53,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"ForeheadHeight":0.4,"Tshirt2":0,"EyebrowsColor2":0,"VariationPants":0,"Hair":31,"CheekbonesWidth":0.0,"Tshirt1":15,"VariationGloves":0,"CheekbonesHeight":0.0,"ChinShape":0.0,"EyesSize":0.0,"ShapeMix":1.0,"EyebrowsOpacity":1.0,"Beard":3,"ChinWidth":0.0,"VariationMisc1":0,"VariationMisc3":0,"NoseWidth":0.0,"FrecklesOpacity":1.0,"VariationHair":0,"Glasse2":0,"VariationGlovesColor":0,"AgeingOpacity":1.0,"HairColor":1,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"UsePed":false,"TipNoseBreak":0.0,"Mere":11,"Hat2":20,"VariationMisc2":0,"MakeupColor":0,"Torso2":5,"EyebrowsColor":1,"SkinAspectOpacity":1.0}', '{"Vetement290":{"Data":{"Type":"Chapeau","Sexe":1,"Hat2":20,"Hat1":105},"Montant":1},"Vetement194":{"Data":{"Torso1":216,"Sexe":1,"Torso2":5,"ID":75,"Type":"Haut"},"Montant":1},"Vetement396":{"Data":{"Torso1":132,"Sexe":1,"Torso2":0,"ID":212,"Type":"Haut"},"Montant":1},"Vetement727":{"Data":{"Pants2":0,"Sexe":1,"Pants1":31,"Type":"Pantalon"},"Montant":1},"Vetement216":{"Data":{"Type":"Chaussure","Sexe":1,"Shoes2":0,"Shoes1":25},"Montant":1},"Vetement404":{"Data":{"Type":"Lunettes","Glasse2":0,"Sexe":1,"Glasse1":5},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000014126894d', 'Quica', 'Burciaga', 'user', 'aucun', 1, NULL, 'false', 107, 0, 0, 154, '{"faim":5.9,"soif":12}', '{"z":114.33392333984375,"y":1071.9532470703126,"x":1404.045654296875}', 20, 20, NULL, 184, '25 Octobre 1996', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"VariationGlovesColor":0,"EyebrowsColor2":0,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"Sexe":1,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":0,"EyesColor":14,"BeardColor":60,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":0,"Pants1":21,"VariationTorsoColor":0,"Pere":2,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":22,"ForeheadWidth":0.0,"Eyebrows":2,"VariationMisc2":0,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.53,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":2,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"ForeheadHeight":0.0,"Tshirt2":0,"EyebrowsColor":60,"ChinShape":0.0,"Hair":31,"Shoes1":42,"Glasse2":5,"VariationGloves":0,"CheekbonesHeight":0.0,"MakeupOpacity":1.0,"EyesSize":0.0,"VariationMisc1":0,"EyebrowsOpacity":1.0,"Beard":3,"ChinWidth":0.0,"Freckles":-1,"Hat2":0,"NoseWidth":0.0,"BeardColor2":0,"ShapeMix":0.75,"LipstickOpacity":1.0,"VariationTorso2":0,"Glasse1":17,"Tshirt1":15,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"FrecklesOpacity":1.0,"UsePed":false,"Mere":4,"VariationPants":0,"VariationHair":0,"MakeupColor":0,"HairColor":0,"TipNoseBreak":0.0,"SkinAspectOpacity":1.0}', '{"Vetement915":{"Data":{"Shoes1":25,"Shoes2":0,"Sexe":1,"Type":"Chaussure"},"Montant":1},"Vetement379":{"Data":{"Pants2":0,"Sexe":1,"Pants1":31,"Type":"Pantalon"},"Montant":1},"Vetement341":{"Data":{"Type":"Lunettes","Glasse2":5,"Sexe":1,"Glasse1":17},"Montant":1},"Vetement244":{"Data":{"Torso1":94,"Sexe":1,"Torso2":0,"ID":208,"Type":"Haut"},"Montant":1},"Vetement889":{"Data":{"Type":"T-Shirt","Sexe":1,"Tshirt2":5,"ID":340,"Tshirt1":33},"Montant":1},"Vetement890":{"Data":{"Pants2":3,"Sexe":1,"Pants1":49,"Type":"Pantalon"},"Montant":1},"Telephone361":{"Data":{"Num":6868896},"Montant":1},"pain":{"Montant":2},"Vetement11":{"Data":{"Hat2":20,"Sexe":1,"Type":"Chapeau","Hat1":106},"Montant":1},"eau":{"Montant":2},"Vetement328":{"Data":{"Torso1":99,"Sexe":1,"Torso2":3,"ID":340,"Type":"Haut"},"Montant":1},"Vetement644":{"Data":{"Shoes1":42,"Shoes2":2,"Sexe":1,"Type":"Chaussure"},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000102481d53', 'Julian', 'Flores', 'user', 'paysagiste', 1, NULL, 'false', 439, 0, 0, 145, '{"faim":30.2,"soif":11}', '{"x":1401.9857177734376,"y":1133.329345703125,"z":114.3336410522461}', 20, 20, NULL, 186, '2 Août  1996', 'Homme', '{"NoseHeight":-0.9,"CheekbonesWidth":-0.78,"VariationGlovesColor":0,"MakeupOpacity":1.0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Tshirt1":15,"FrecklesOpacity":1.0,"Torso1":15,"LipstickColor":0,"EyesColor":6,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Pants1":21,"VariationTorsoColor":0,"Pere":8,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.04,"Eyebrows":21,"Freckles":-1,"JawWidth":0.46,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.12,"SkinMix":1.0,"MidNoseWidth":0.06,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.06,"ChinHeight":0.0,"MidNoseHeight":0.24,"HairColor2":63,"VariationTorso2Color":0,"Hat2":0,"HairColor":0,"LipstickOpacity":1.0,"VariationPants":0,"Glasse2":0,"EyebrowsColor2":0,"VariationMisc3":0,"VariationGloves":0,"CheekbonesHeight":1.0,"Sexe":1,"EyesSize":-0.04,"CheeksWidth":-0.2,"EyebrowsOpacity":1.0,"Beard":3,"ChinWidth":0.0,"Torso2":0,"Hair":7,"NoseWidth":-0.4,"Mere":21,"VariationHair":0,"EyebrowsColor":0,"VariationMisc2":0,"Shoes1":3,"BeardColor2":0,"JawHeight":0.5,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"ForeheadHeight":-0.4,"TipNoseBreak":0.0,"Shoes2":1,"UsePed":false,"ShapeMix":0.78,"MakeupColor":0,"Tshirt2":0,"ChinShape":0.0,"SkinAspectOpacity":1.0}', '{"Vetement821":{"Data":{"Shoes1":3,"Sexe":1,"Shoes2":1,"Type":"Chaussure"},"Montant":1},"Telephone297":{"Data":{"Num":5604919},"Montant":1},"Vetement380":{"Data":{"Torso2":1,"ID":208,"Sexe":1,"Torso1":94,"Type":"Haut"},"Montant":1},"Vetement588":{"Data":{"Pants2":3,"Sexe":1,"Pants1":24,"Type":"Pantalon"},"Montant":1},"CarteCredit486":{"Data":"3177-4240-3297-9867","Montant":1},"pain":{"Montant":5},"eau":{"Montant":4}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000103bcec3d', 'Gustavo', 'Pérez', 'user', 'aucun', 1, NULL, 'false', 176, 0, 0, 200, '{"soif":37,"faim":40.9}', '{"x":568.4798583984375,"z":29.152292251586915,"y":-1768.6829833984376}', 20, 20, NULL, 180, '20 Janvier 1994', 'Homme', '{"NoseHeight":-0.46,"LipstickOpacity":1.0,"BeardColor2":0,"MakeupOpacity":1.0,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"Sexe":1,"FrecklesOpacity":1.0,"Torso1":15,"LipstickColor":0,"EyesColor":5,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":5,"Hat1":-1,"VariationHead":0,"Torso2":0,"Pants1":21,"VariationTorsoColor":0,"Pere":17,"Arms2":0,"Shoes1":34,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":22,"VariationMisc2":0,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"Tshirt1":15,"HairColor":0,"VariationTorso2":0,"ChinShape":0.0,"Hair":7,"VariationPants":0,"ForeheadHeight":0.0,"VariationGloves":0,"CheekbonesHeight":0.0,"CheekbonesWidth":0.0,"EyesSize":0.0,"EyebrowsColor2":0,"EyebrowsOpacity":1.0,"Beard":9,"ChinWidth":0.0,"Glasse1":4,"Glasse2":3,"NoseWidth":-0.94,"Tshirt2":0,"ShapeMix":0.2,"UsePed":false,"Freckles":-1,"VariationMisc1":0,"VariationGlovesColor":0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"VariationTorso2Color":0,"TipNoseBreak":-0.1,"Mere":19,"EyebrowsColor":0,"Hat2":0,"MakeupColor":0,"AgeingOpacity":1.0,"VariationHair":0,"SkinAspectOpacity":1.0}', '{"pain":{"Montant":10},"eau":{"Montant":12},"Vetement398":{"Data":{"ID":192,"Torso2":7,"Sexe":1,"Torso1":14,"Type":"Haut"},"Montant":1},"Vetement916":{"Data":{"Shoes2":0,"Type":"Chaussure","Shoes1":9,"Sexe":1},"Montant":1},"Telephone526":{"Data":{"Num":4674926},"Montant":1},"Vetement473":{"Data":{"Glasse2":3,"Type":"Lunettes","Glasse1":4,"Sexe":1},"Montant":1},"Vetement963":{"Data":{"Pants1":1,"Type":"Pantalon","Pants2":0,"Sexe":1},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000013422de8e', 'Joaquin', 'Carlos', 'user', 'aucun', 1, NULL, 'false', 356, 0, 0, 190, '{"soif":0,"faim":-0.4}', '{"z":29.497024536132814,"x":26.5296573638916,"y":-1348.377685546875}', 20, 20, NULL, 180, '24 Novembre 1999', 'Homme', '{"NoseHeight":-0.06,"CheekbonesWidth":0.04,"EyebrowsColor":0,"EyebrowsColor2":0,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"CheeksWidth":-1.0,"FrecklesOpacity":0.0,"Torso1":135,"LipstickColor":59,"EyesColor":6,"BeardColor":0,"TipNoseHeight":0.18,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":3,"Mere":10,"VariationTorsoColor":0,"Pere":8,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":54,"ForeheadWidth":-1.0,"Eyebrows":30,"VariationMisc2":0,"JawWidth":1.0,"Arms1":0,"MakeupColor2":61,"LipstickColor2":0,"Lipstick":1,"LipsWidth":0.74,"SkinMix":1.0,"MidNoseWidth":-0.04,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.02,"ChinHeight":0.04,"MidNoseHeight":0.58,"HairColor2":38,"VariationTorso2":0,"Hat2":0,"Tshirt2":0,"Glasse1":5,"VariationPants":0,"Glasse2":4,"Tshirt1":15,"ChinShape":0.08,"VariationGloves":0,"CheekbonesHeight":-0.5,"VariationMisc1":0,"EyesSize":1.0,"Sexe":1,"EyebrowsOpacity":1.0,"Beard":9,"ChinWidth":0.02,"Shoes1":34,"VariationHair":0,"NoseWidth":-0.52,"ForeheadHeight":-0.54,"ShapeMix":1.0,"BeardColor2":0,"Freckles":-1,"LipstickOpacity":0.0,"Pants1":21,"JawHeight":0.14,"ComplexionOpacity":0.0,"BeardOpacity":1.0,"VariationGlovesColor":0,"TipNoseBreak":-0.46,"MakeupOpacity":1.0,"VariationTorso2Color":0,"UsePed":false,"MakeupColor":38,"HairColor":0,"Hair":10,"SkinAspectOpacity":0.0}', '{"Vetement459":{"Data":{"Shoes1":32,"Shoes2":2,"Type":"Chaussure","Sexe":1},"Montant":1},"Vetement795":{"Data":{"Torso1":131,"Sexe":1,"Torso2":0,"ID":211,"Type":"Haut"},"Montant":1},"Vetement489":{"Data":{"Pants2":2,"Sexe":1,"Pants1":5,"Type":"Pantalon"},"Montant":1},"Telephone901":{"Data":{"Num":7054840},"Montant":1},"Vetement661":{"Data":{"Type":"Lunettes","Glasse2":4,"Glasse1":5,"Sexe":1},"Montant":1},"Vetement273":{"Data":{"Torso1":135,"Sexe":1,"Torso2":3,"ID":213,"Type":"Haut"},"Montant":1},"Vetement428":{"Data":{"Type":"Chapeau","Sexe":1,"Hat2":3,"Hat1":7},"Montant":2}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000013752330b', 'Carlos', 'Dosontos', 'user', 'aucun', 1, NULL, 'false', -401, 0, 0, 199, '{"soif":0,"faim":14.3}', '{"z":29.055164337158204,"y":-1775.4462890625,"x":472.1332702636719}', 20, 20, NULL, 187, '7 Septembre 1998', 'Homme', '{"NoseHeight":0.0,"LipstickOpacity":1.0,"BeardColor2":0,"MakeupOpacity":1.0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Sexe":1,"VariationTorso2Color":0,"Torso1":14,"LipstickColor":0,"EyesColor":5,"BeardColor":3,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":7,"Pants1":42,"VariationTorsoColor":0,"Pere":4,"Arms2":0,"Shoes1":34,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":17,"Freckles":-1,"JawWidth":-0.4,"Arms1":1,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.7,"MidNoseWidth":0.0,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"CheekbonesWidth":0.0,"Tshirt2":0,"UsePed":false,"ChinShape":-0.4,"Glasse2":0,"EyebrowsColor2":0,"EyebrowsColor":3,"VariationGloves":0,"CheekbonesHeight":0.0,"VariationMisc3":0,"EyesSize":-0.4,"Shoes2":0,"EyebrowsOpacity":1.0,"Beard":7,"ChinWidth":0.4,"Hair":9,"AgeingOpacity":1.0,"NoseWidth":0.0,"Tshirt1":15,"ShapeMix":0.96,"VariationMisc2":0,"ForeheadHeight":0.0,"FrecklesOpacity":1.0,"VariationTorso2":0,"JawHeight":0.4,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"VariationHair":0,"TipNoseBreak":0.0,"VariationPants":0,"Hat2":0,"HairColor":3,"MakeupColor":0,"VariationGlovesColor":0,"Mere":10,"SkinAspectOpacity":1.0}', '{"Vetement790":{"Data":{"Pants2":0,"Sexe":1,"Pants1":42,"Type":"Pantalon"},"Montant":1},"Vetement995":{"Data":{"Torso2":0,"ID":58,"Sexe":1,"Torso1":5,"Type":"Haut"},"Montant":1},"Vetement487":{"Data":{"Tshirt2":0,"Tshirt1":15,"Sexe":1,"Type":"T-Shirt","ID":204},"Montant":1},"Telephone757":{"Data":{"Num":4617248},"Montant":1},"Telephone496":{"Data":{"Num":6299255},"Montant":0},"eau":{"Montant":23},"Vetement724":{"Data":{"Shoes1":6,"Shoes2":0,"Sexe":1,"Type":"Chaussure"},"Montant":1},"Vetement725":{"Data":{"Pants2":0,"Sexe":1,"Pants1":42,"Type":"Pantalon"},"Montant":1},"Vetement202":{"Data":{"Shoes1":8,"Shoes2":2,"Sexe":1,"Type":"Chaussure"},"Montant":1},"Vetement488":{"Data":{"Glasse2":2,"Sexe":1,"Glasse1":17,"Type":"Lunettes"},"Montant":1},"Vetement384":{"Data":{"Torso2":7,"ID":192,"Sexe":1,"Torso1":14,"Type":"Haut"},"Montant":1},"pain":{"Montant":12},"Vetement427":{"Data":{"Torso2":7,"ID":192,"Sexe":1,"Torso1":14,"Type":"Haut"},"Montant":1}}', '{}', 'true', 'true', 'false', 'false', 'false'),
	('steam:110000133702f39', 'César', 'Del Gustin', 'user', 'aucun', 1, NULL, 'false', 502, 0, 0, 164, '{"faim":72.0,"soif":60}', '{"z":37.415130615234378,"y":-156.73365783691407,"x":-715.0281372070313}', 20, 20, NULL, 187, '22 Mars 2000', 'Homme', '{"NoseHeight":0.4,"LipstickOpacity":1.0,"VariationGlovesColor":0,"MakeupOpacity":1.0,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"Tshirt1":15,"VariationTorso2Color":0,"Torso1":81,"LipstickColor":0,"EyesColor":2,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":5,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":4,"VariationHead":0,"VariationTorso2":0,"Pants1":21,"VariationTorsoColor":0,"Pere":19,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":30,"VariationMisc2":0,"JawWidth":0.0,"Arms1":8,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"Glasse1":-1,"BeardColor2":0,"HairColor":0,"Torso2":0,"ChinShape":-0.4,"Hair":0,"Freckles":-1,"FrecklesOpacity":1.0,"VariationGloves":0,"CheekbonesHeight":0.0,"HairColor2":0,"EyesSize":0.0,"ShapeMix":1.0,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.4,"Lipstick":-1,"CheekbonesWidth":0.0,"NoseWidth":-0.4,"EyebrowsColor":0,"VariationHair":0,"EyebrowsColor2":0,"VariationPants":0,"VariationMisc1":0,"Sexe":1,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Tshirt2":0,"TipNoseBreak":0.0,"Glasse2":0,"CheeksWidth":0.0,"UsePed":false,"MakeupColor":0,"Mere":11,"Shoes1":34,"SkinAspectOpacity":1.0}', '{"Vetement6":{"Data":{"Type":"Chapeau","Sexe":1,"Hat2":0,"Hat1":4},"Montant":1},"Vetement627":{"Data":{"Glasse2":0,"Sexe":1,"Glasse1":9,"Type":"Lunettes"},"Montant":1},"Vetement133":{"Data":{"Torso2":22,"ID":76,"Sexe":1,"Torso1":219,"Type":"Haut"},"Montant":1},"Vetement742":{"Data":{"Pants2":0,"Sexe":1,"Pants1":7,"Type":"Pantalon"},"Montant":1},"Vetement510":{"Data":{"Type":"Chapeau","Sexe":1,"Hat2":9,"Hat1":76},"Montant":1},"Vetement247":{"Data":{"Shoes1":7,"Shoes2":0,"Sexe":1,"Type":"Chaussure"},"Montant":1},"Telephone496":{"Data":{"Num":6299255},"Montant":1},"eau":{"Montant":14},"Vetement543":{"Data":{"Glasse2":0,"Sexe":1,"Glasse1":2,"Type":"Lunettes"},"Montant":1},"Vetement171":{"Data":{"Shoes1":7,"Shoes2":0,"Sexe":1,"Type":"Chaussure"},"Montant":1},"Vetement919":{"Data":{"Torso2":0,"ID":145,"Sexe":1,"Torso1":81,"Type":"Haut"},"Montant":1},"Vetement111":{"Data":{"Pants2":1,"Sexe":1,"Pants1":43,"Type":"Pantalon"},"Montant":1},"Vetement652":{"Data":{"Pants2":0,"Sexe":1,"Pants1":1,"Type":"Pantalon"},"Montant":1},"pain":{"Montant":12},"Vetement835":{"Montant":1,"Data":{"Torso2":22,"Type":"Haut","Sexe":1,"Torso1":221,"ID":174}}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000010e8a86f8', 'Balmore', 'Del Castillas', 'user', 'aucun', 1, NULL, 'false', 0, 0, 0, 200, '{"faim":29.0,"soif":20}', '{"z":28.414886474609376,"y":-1755.2216796875,"x":499.89044189453127}', 20, 20, NULL, 187, '17 Juillet 1990', 'Homme', '{"NoseHeight":-0.04,"CheekbonesWidth":0.0,"BeardColor2":1,"EyebrowsColor2":1,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"Sexe":1,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":0,"EyesColor":30,"BeardColor":1,"TipNoseHeight":0.0,"Complexion":3,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":5,"Hat1":-1,"VariationHead":0,"Torso2":0,"Mere":19,"VariationTorsoColor":0,"Pere":2,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":-0.14,"Eyebrows":12,"Freckles":6,"JawWidth":0.8,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":-0.04,"Blemishes":10,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"VariationMisc2":0,"HairColor":0,"VariationMisc1":0,"VariationPants":0,"Hair":0,"ChinShape":0.0,"Tshirt2":0,"VariationGloves":0,"CheekbonesHeight":0.0,"FrecklesOpacity":1.0,"EyesSize":-1.0,"ForeheadHeight":1.0,"EyebrowsOpacity":1.0,"Beard":26,"ChinWidth":0.0,"TipNoseBreak":0.0,"Glasse1":-1,"NoseWidth":-0.5,"VariationGlovesColor":0,"ShapeMix":1.0,"Tshirt1":15,"LipstickOpacity":1.0,"EyebrowsColor":1,"MakeupOpacity":1.0,"JawHeight":0.2,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Glasse2":0,"UsePed":false,"Pants1":21,"Hat2":0,"Shoes1":6,"MakeupColor":0,"VariationTorso2":0,"VariationHair":0,"SkinAspectOpacity":1.0}', '{"Vetement136":{"Data":{"Shoes1":6,"Shoes2":0,"Sexe":1,"Type":"Chaussure"},"Montant":1},"Vetement671":{"Data":{"Torso1":179,"Sexe":1,"Torso2":1,"ID":70,"Type":"Haut"},"Montant":1},"Vetement648":{"Data":{"Torso1":80,"Sexe":1,"Torso2":0,"ID":204,"Type":"Haut"},"Montant":1},"Telephone543":{"Data":{"Num":7455841},"Montant":1},"pain":{"Montant":3},"Vetement88":{"Data":{"Type":"Lunettes","Glasse2":0,"Sexe":1,"Glasse1":15},"Montant":1},"eau":{"Montant":3},"Vetement884":{"Data":{"Pants2":0,"Sexe":1,"Pants1":62,"Type":"Pantalon"},"Montant":1},"Vetement206":{"Data":{"Type":"Chapeau","Sexe":1,"Hat2":20,"Hat1":105},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:1100001401a0878', 'Guerro ', 'Arias', 'user', 'aucun', 1, NULL, 'false', 149, 0, 0, 200, '{"soif":41,"faim":43.7}', '{"y":-2026.9649658203126,"z":22.18967628479004,"x":364.8994140625}', 20, 20, NULL, 179, '23 Octobre 1999', 'Homme', '{"NoseHeight":0.0,"LipstickOpacity":1.0,"EyebrowsColor":0,"MakeupOpacity":1.0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Sexe":1,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":0,"EyesColor":-1,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":0,"Pants1":21,"VariationTorsoColor":0,"Pere":4,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":-1,"VariationMisc2":0,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"Shoes1":34,"CheekbonesWidth":0.0,"HairColor":0,"Tshirt1":15,"VariationPants":0,"Glasse2":0,"Tshirt2":0,"FrecklesOpacity":1.0,"VariationGloves":0,"CheekbonesHeight":0.0,"Freckles":-1,"EyesSize":0.0,"Shoes2":0,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"BeardColor2":0,"VariationGlovesColor":0,"NoseWidth":0.0,"EyebrowsColor2":0,"VariationHair":0,"VariationMisc3":0,"Lipstick":-1,"Hair":0,"Hat2":0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"PedUsed":"g_m_y_mexgoon_03","TipNoseBreak":0.0,"Mere":4,"UsePed":true,"ShapeMix":0.8,"MakeupColor":0,"ChinShape":0.0,"VariationTorso2":0,"SkinAspectOpacity":1.0}', '{"Telephone61":{"Data":{"Num":5828765},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000013f193f3d', 'Absalon', 'Herrera', 'user', 'aucun', 1, NULL, 'false', 379, 0, 0, 200, '{"soif":91,"faim":76.2}', '{"x":516.9505004882813,"y":-1716.565673828125,"z":29.260467529296876}', 20, 20, NULL, 186, '17 Juillet 1994', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"BeardColor2":0,"EyebrowsColor2":0,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"Tshirt1":15,"VariationTorso2Color":0,"Torso1":80,"LipstickColor":0,"EyesColor":5,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":4,"VariationHead":0,"VariationTorso2":0,"Mere":8,"VariationTorsoColor":0,"Pere":12,"Arms2":0,"Shoes1":12,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":0,"Freckles":-1,"JawWidth":0.0,"Arms1":0,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"HairColor":3,"Tshirt2":0,"VariationMisc2":0,"VariationPants":0,"Hair":10,"Glasse2":0,"Hat2":0,"VariationGloves":0,"CheekbonesHeight":0.0,"FrecklesOpacity":1.0,"EyesSize":0.0,"VariationHair":0,"EyebrowsOpacity":1.0,"Beard":9,"ChinWidth":0.0,"AgeingOpacity":1.0,"EyebrowsColor":0,"NoseWidth":0.0,"VariationGlovesColor":0,"ShapeMix":1.0,"ChinShape":0.0,"LipstickOpacity":1.0,"Shoes2":0,"MakeupOpacity":1.0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Glasse1":-1,"TipNoseBreak":0.0,"ForeheadHeight":0.0,"UsePed":false,"Sexe":1,"MakeupColor":0,"Pants1":21,"Torso2":0,"SkinAspectOpacity":1.0}', '{"Vetement504":{"Montant":1,"Data":{"Glasse2":0,"Sexe":1,"Glasse1":17,"Type":"Lunettes"}},"Vetement28":{"Montant":1,"Data":{"Torso2":14,"ID":157,"Sexe":1,"Torso1":126,"Type":"Haut"}},"Vetement98":{"Montant":1,"Data":{"Glasse2":0,"Sexe":1,"Glasse1":17,"Type":"Lunettes"}},"Vetement328":{"Montant":1,"Data":{"Shoes1":9,"Shoes2":0,"Sexe":1,"Type":"Chaussure"}},"Vetement584":{"Montant":1,"Data":{"Glasse2":5,"Sexe":1,"Glasse1":17,"Type":"Lunettes"}},"Vetement809":{"Montant":1,"Data":{"Shoes1":12,"Shoes2":0,"Sexe":1,"Type":"Chaussure"}},"Vetement671":{"Montant":1,"Data":{"Pants1":1,"Sexe":1,"Pants2":1,"Type":"Pantalon"}},"Vetement955":{"Montant":1,"Data":{"Torso2":0,"ID":204,"Sexe":1,"Torso1":80,"Type":"Haut"}},"Vetement471":{"Montant":1,"Data":{"Pants1":42,"Sexe":1,"Pants2":1,"Type":"Pantalon"}},"eau":{"Montant":23},"pain":{"Montant":26},"Vetement654":{"Montant":1,"Data":{"Hat1":4,"Sexe":1,"Hat2":0,"Type":"Chapeau"}}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000013cb07679', 'Andres', 'Da Silva', 'user', 'aucun', 1, NULL, 'false', 885, 0, 0, 200, '{"faim":41.6,"soif":38}', '{"x":560.05517578125,"y":-1773.930908203125,"z":33.480812072753909}', 20, 20, NULL, 192, '6 Mars 1995', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"EyebrowsColor":1,"MakeupOpacity":1.0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Tshirt1":15,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":0,"EyesColor":-1,"BeardColor":1,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Mere":19,"VariationTorsoColor":0,"Pere":12,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":30,"Freckles":-1,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.03,"MidNoseWidth":0.0,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"UsePed":false,"Tshirt2":0,"EyebrowsColor2":0,"ChinShape":0.0,"Glasse2":0,"HairColor":0,"Hair":9,"VariationGloves":0,"CheekbonesHeight":0.0,"VariationPants":0,"EyesSize":0.0,"Torso2":0,"EyebrowsOpacity":1.0,"Beard":22,"ChinWidth":0.0,"LipstickOpacity":1.0,"Shoes2":0,"NoseWidth":0.0,"VariationMisc3":0,"ShapeMix":0.8,"VariationMisc2":0,"VariationGlovesColor":0,"ForeheadHeight":0.0,"FrecklesOpacity":1.0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"VariationHair":0,"TipNoseBreak":0.0,"BeardColor2":0,"Shoes1":9,"Hat2":0,"MakeupColor":0,"Pants1":21,"Sexe":1,"SkinAspectOpacity":1.0}', '{"Vetement604":{"Montant":1,"Data":{"Shoes1":9,"Shoes2":0,"Sexe":1,"Type":"Chaussure"}},"Vetement646":{"Data":{"Torso2":0,"ID":145,"Sexe":1,"Torso1":81,"Type":"Haut"},"Montant":1},"Vetement167":{"Data":{"Pants1":42,"Sexe":1,"Pants2":0,"Type":"Pantalon"},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000112cd9140', 'Armando', 'Azeta', 'user', 'aucun', 1, NULL, 'false', 475, 0, 0, 200, '{"soif":0,"faim":5.9}', '{"z":61.695404052734378,"x":1430.66796875,"y":-1507.021484375}', 20, 20, NULL, 176, '22 Septembre 1995', 'Homme', '{"NoseHeight":-0.12,"LipstickOpacity":1.0,"EyebrowsColor":0,"MakeupOpacity":0.41,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Sexe":1,"FrecklesOpacity":1.0,"Torso1":15,"LipstickColor":0,"EyesColor":2,"BeardColor":0,"TipNoseHeight":0.06,"Complexion":0,"VariationShoesColor":0,"Ageing":11,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":7,"VariationHead":0,"VariationTorso2":0,"Mere":10,"VariationTorsoColor":0,"Pere":2,"Arms2":0,"AgeingOpacity":0.82,"VariationShoes":0,"Makeup":27,"ForeheadWidth":0.0,"Eyebrows":0,"Freckles":-1,"JawWidth":0.48,"Arms1":15,"MakeupColor2":5,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":0.84,"SkinMix":0.45,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":6,"VariationTorso2Color":0,"HairColor":0,"UsePed":false,"ChinShape":0.0,"Glasse2":0,"EyebrowsColor2":0,"VariationMisc1":0,"VariationGloves":0,"CheekbonesHeight":0.08,"VariationMisc2":0,"EyesSize":-0.26,"BeardColor2":0,"EyebrowsOpacity":1.0,"Beard":3,"ChinWidth":0.0,"Tshirt1":15,"VariationPants":0,"NoseWidth":-1.0,"Torso2":0,"ShapeMix":0.69,"VariationGlovesColor":0,"VariationMisc3":0,"Pants1":21,"Lipstick":-1,"JawHeight":-0.24,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Hat2":3,"TipNoseBreak":-0.22,"CheekbonesWidth":0.72,"Hair":7,"Tshirt2":0,"MakeupColor":6,"VariationHair":0,"Shoes1":34,"SkinAspectOpacity":1.0}', '{"Vetement18":{"Data":{"Pants2":3,"Sexe":1,"Pants1":5,"Type":"Pantalon"},"Montant":1},"Vetement41":{"Data":{"Torso1":82,"Sexe":1,"Torso2":8,"ID":205,"Type":"Haut"},"Montant":1},"Vetement720":{"Data":{"Pants2":1,"Sexe":1,"Pants1":43,"Type":"Pantalon"},"Montant":1},"Vetement27":{"Data":{"Shoes1":5,"Sexe":1,"Shoes2":2,"Type":"Chaussure"},"Montant":1},"Vetement897":{"Data":{"Hat2":3,"Sexe":1,"Type":"Chapeau","Hat1":7},"Montant":1},"Vetement661":{"Data":{"Torso1":167,"Sexe":1,"Torso2":2,"ID":319,"Type":"Haut"},"Montant":1},"Vetement299":{"Data":{"Torso1":126,"Sexe":1,"Torso2":5,"ID":157,"Type":"Haut"},"Montant":0},"Vetement861":{"Data":{"Type":"Chaussure","Sexe":1,"Shoes2":4,"Shoes1":7},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000013d04a1be', 'Lùna', 'Salvarez', 'user', 'mineur', 1, NULL, 'false', 264, 0, 0, 113, '{"soif":88,"faim":91.6}', '{"y":-1507.8076171875,"z":61.83623123168945,"x":1432.114990234375}', 20, 20, NULL, 162, '20 Février  1996', 'Femme', '{"NoseHeight":0.0,"CheekbonesWidth":0.6,"VariationGlovesColor":0,"EyebrowsColor2":0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"CheeksWidth":0.8,"VariationTorso2Color":0,"Torso1":74,"LipstickColor":6,"EyesColor":2,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":93,"VariationHead":0,"Torso2":0,"Pants1":15,"VariationTorsoColor":0,"Pere":8,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":0,"ForeheadWidth":0.0,"Eyebrows":0,"VariationMisc2":0,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":6,"Lipstick":0,"LipsWidth":0.0,"SkinMix":1.0,"MidNoseWidth":0.0,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":4,"Sexe":2,"Freckles":6,"Tshirt2":0,"VariationPants":0,"ChinShape":0.8,"Hair":15,"Hat2":2,"VariationTorso2":0,"VariationGloves":0,"CheekbonesHeight":0.2,"FrecklesOpacity":1.0,"EyesSize":0.0,"Glasse2":0,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.2,"MakeupOpacity":0.73,"LipstickOpacity":0.51,"NoseWidth":0.0,"Mere":21,"VariationHair":0,"BeardColor2":0,"VariationMisc3":0,"ForeheadHeight":0.0,"Tshirt1":34,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Shoes2":0,"TipNoseBreak":0.0,"UsePed":false,"HairColor":57,"EyebrowsColor":0,"MakeupColor":0,"ShapeMix":0.45,"Shoes1":35,"SkinAspectOpacity":1.0}', '{"ffer":{"Montant":11},"Vetement179":{"Data":{"Pants1":66,"Sexe":2,"Pants2":5,"Type":"Pantalon"},"Montant":1},"eau":{"Montant":4},"pdiamant":{"Montant":5},"pierre":{"Montant":0},"Vetement640":{"Data":{"Shoes1":10,"Shoes2":1,"Sexe":2,"Type":"Chaussure"},"Montant":1},"Vetement985":{"Montant":1,"Data":{"Type":"Chapeau","Sexe":2,"Hat2":2,"Hat1":93}},"Vetement881":{"Data":{"Torso2":0,"ID":70,"Sexe":2,"Torso1":74,"Type":"Haut"},"Montant":1},"Telephone338":{"Data":{"Num":1678405},"Montant":0},"for":{"Montant":8},"pain":{"Montant":5},"Telephone861":{"Data":{"Num":8713226},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000134892018', 'Lazar', 'Leonov', 'user', 'mineur', 1, NULL, 'false', 2094, 0, 0, 180, '{"faim":78.1,"soif":76}', '{"z":56.547340393066409,"y":87.52849578857422,"x":-1525.8958740234376}', 20, 20, NULL, 183, '16 Juin 1992', 'Homme', '{"NoseHeight":0.4,"CheekbonesWidth":0.6,"VariationGlovesColor":0,"EyebrowsColor2":0,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"Tshirt1":15,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":0,"EyesColor":5,"BeardColor":0,"TipNoseHeight":0.4,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Mere":20,"VariationTorsoColor":0,"Pere":1,"Arms2":0,"Shoes1":34,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":1,"VariationMisc2":0,"JawWidth":0.8,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":-0.8,"SkinMix":0.86,"MidNoseWidth":-0.4,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.2,"ChinHeight":0.8,"MidNoseHeight":0.4,"HairColor2":0,"Glasse1":3,"HairColor":0,"Tshirt2":0,"UsePed":false,"VariationPants":0,"Glasse2":0,"Freckles":-1,"Sexe":1,"VariationGloves":0,"CheekbonesHeight":0.2,"LipstickOpacity":1.0,"EyesSize":-0.4,"BeardColor2":0,"EyebrowsOpacity":1.0,"Beard":0,"ChinWidth":0.2,"ShapeMix":0.0,"MakeupOpacity":1.0,"NoseWidth":-0.4,"ForeheadHeight":0.0,"VariationHair":0,"CheeksWidth":-0.4,"FrecklesOpacity":1.0,"Hat2":0,"VariationMisc1":0,"JawHeight":0.2,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"ChinShape":0.8,"TipNoseBreak":0.6,"Hair":1,"EyebrowsColor":0,"Torso2":0,"MakeupColor":0,"Pants1":21,"AgeingOpacity":1.0,"SkinAspectOpacity":1.0}', '{"Vetement249":{"Data":{"Type":"Lunettes","Glasse2":0,"Sexe":1,"Glasse1":3},"Montant":1},"CarteCredit802":{"Data":"3177-7225-2538-1057","Montant":1},"Vetement339":{"Data":{"Torso1":123,"Sexe":1,"Torso2":2,"ID":210,"Type":"Haut"},"Montant":1},"for":{"Montant":0},"ffer":{"Montant":-12},"eau":{"Montant":21},"pain":{"Montant":17},"pierre":{"Montant":-10},"Vetement417":{"Data":{"Type":"Chaussure","Shoes2":6,"Sexe":1,"Shoes1":12},"Montant":1},"Vetement450":{"Data":{"Type":"Pantalon","Sexe":1,"Pants1":4,"Pants2":0},"Montant":1},"pdiamant":{"Montant":0}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000010ba935c4', 'Oksana', 'Bukovski', 'user', 'aucun', 1, NULL, 'false', 422, 0, 0, 175, '{"soif":49,"faim":49.3}', '{"z":52.240631103515628,"x":-1514.2882080078126,"y":107.07049560546875}', 20, 20, NULL, 169, '1 Mars 1996', 'Femme', '{"NoseHeight":0.16,"CheekbonesWidth":0.26,"VariationGlovesColor":0,"EyebrowsColor2":2,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Sexe":2,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":61,"EyesColor":0,"BeardColor":0,"TipNoseHeight":-0.26,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":58,"VariationHead":0,"Torso2":0,"Mere":21,"VariationTorsoColor":0,"Pere":10,"Arms2":0,"Shoes1":4,"VariationShoes":0,"Makeup":37,"ForeheadWidth":0.36,"Eyebrows":1,"Freckles":0,"JawWidth":0.24,"Arms1":15,"MakeupColor2":1,"LipstickColor2":0,"ForeheadHeight":0.04,"LipsWidth":-0.28,"SkinMix":0.48,"MidNoseWidth":0.24,"Blemishes":-1,"Shoes2":1,"ChinPosition":-0.14,"ChinHeight":-0.06,"MidNoseHeight":-0.04,"HairColor2":2,"LipstickOpacity":0.81,"VariationHair":0,"Tshirt2":0,"CheeksWidth":0.44,"ChinShape":-0.66,"Glasse2":0,"Lipstick":2,"Hair":15,"VariationGloves":0,"CheekbonesHeight":-0.5,"AgeingOpacity":1.0,"EyesSize":0.56,"VariationMisc1":0,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.3,"EyebrowsColor":2,"VariationTorso2":0,"NoseWidth":-0.24,"Tshirt1":2,"ShapeMix":0.42,"VariationMisc2":0,"MakeupOpacity":1.0,"VariationMisc3":0,"FrecklesOpacity":1.0,"JawHeight":-0.7,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"BeardColor2":0,"UsePed":false,"HairColor":2,"TipNoseBreak":0.08,"Hat2":2,"MakeupColor":1,"VariationPants":0,"Pants1":15,"SkinAspectOpacity":1.0}', '{"Telephone129":{"Montant":1,"Data":{"Num":9162017}},"eau":{"Montant":9},"Vetement754":{"Montant":1,"Data":{"Pants1":54,"Sexe":2,"Pants2":2,"Type":"Pantalon"}},"Vetement125":{"Montant":1,"Data":{"Shoes1":4,"Shoes2":1,"Sexe":2,"Type":"Chaussure"}},"Vetement131":{"Montant":1,"Data":{"Torso2":0,"Type":"Haut","Sexe":2,"Torso1":63,"ID":59}},"pain":{"Montant":8},"Vetement928":{"Montant":1,"Data":{"Shoes1":4,"Shoes2":1,"Sexe":2,"Type":"Chaussure"}},"Vetement693":{"Montant":1,"Data":{"Hat1":58,"Sexe":2,"Hat2":2,"Type":"Chapeau"}}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:1100001408143d1', 'Alejandro', 'Mendez', 'user', 'aucun', 1, NULL, 'false', 592, 0, 0, 195, '{"faim":73.2,"soif":63}', '{"z":62.15993881225586,"x":1433.2110595703126,"y":-1505.7283935546876}', 20, 20, NULL, 185, '29 Avril 1996', 'Homme', '{"NoseHeight":0.4,"LipstickOpacity":1.0,"EyebrowsColor":0,"MakeupOpacity":1.0,"Glasse1":7,"VariationTorso":0,"Pants2":0,"Sexe":1,"FrecklesOpacity":1.0,"Torso1":15,"LipstickColor":0,"EyesColor":2,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":0.0,"SkinAspect":-1,"Hat1":56,"VariationHead":0,"VariationTorso2":0,"Mere":4,"VariationTorsoColor":0,"Pere":22,"Arms2":0,"Shoes1":8,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.4,"Eyebrows":-1,"VariationMisc2":0,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":-0.12,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"Lipstick":-1,"HairColor":0,"BeardColor2":0,"VariationPants":0,"Hair":3,"Torso2":0,"CheekbonesWidth":0.0,"VariationGloves":0,"CheekbonesHeight":0.0,"ChinShape":0.0,"EyesSize":0.8,"Freckles":-1,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"VariationHair":0,"AgeingOpacity":1.0,"NoseWidth":-0.4,"EyebrowsColor2":0,"ShapeMix":0.0,"VariationGlovesColor":0,"VariationMisc3":0,"UsePed":false,"VariationTorso2Color":0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Shoes2":0,"TipNoseBreak":0.0,"Tshirt1":15,"Hat2":8,"Tshirt2":0,"MakeupColor":0,"Glasse2":0,"Pants1":21,"SkinAspectOpacity":1.0}', '{"Vetement215":{"Montant":1,"Data":{"Torso2":0,"Type":"Haut","Sexe":1,"Torso1":14,"ID":192}},"Vetement550":{"Montant":1,"Data":{"Glasse2":0,"Sexe":1,"Glasse1":7,"Type":"Lunettes"}},"Vetement130":{"Montant":1,"Data":{"Shoes1":8,"Shoes2":0,"Sexe":1,"Type":"Chaussure"}},"Vetement630":{"Montant":1,"Data":{"Hat1":4,"Sexe":1,"Hat2":1,"Type":"Chapeau"}},"Vetement152":{"Montant":1,"Data":{"Pants1":42,"Sexe":1,"Pants2":3,"Type":"Pantalon"}},"Vetement187":{"Montant":1,"Data":{"Hat1":56,"Sexe":1,"Hat2":8,"Type":"Chapeau"}},"eau":{"Montant":4},"pain":{"Montant":6},"Vetement257":{"Data":{"Type":"Chapeau","Sexe":1,"Hat2":0,"Hat1":39},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000011a6036eb', 'Konstantin', 'Politchev', 'user', 'mineur', 1, NULL, 'false', 454, 0, 0, 177, '{"faim":79.3,"soif":74}', '{"y":106.1324234008789,"x":-1505.5250244140626,"z":55.65816879272461}', 20, 20, NULL, 185, '16 Avril 1997', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"VariationGlovesColor":0,"MakeupOpacity":1.0,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"Tshirt1":15,"FrecklesOpacity":1.0,"Torso1":15,"LipstickColor":0,"EyesColor":5,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":2,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Pants1":21,"VariationTorsoColor":0,"Pere":20,"Arms2":0,"Shoes1":9,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":0,"VariationMisc2":0,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":-0.8,"SkinMix":0.76,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":2,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"VariationPants":0,"VariationMisc1":0,"Tshirt2":0,"HairColor":8,"ChinShape":0.0,"Hair":0,"TipNoseBreak":0.0,"Sexe":1,"VariationGloves":0,"CheekbonesHeight":0.0,"HairColor2":0,"EyesSize":0.0,"Glasse1":-1,"EyebrowsOpacity":1.0,"Beard":10,"ChinWidth":0.0,"CheeksWidth":0.0,"Torso2":0,"NoseWidth":0.0,"ShapeMix":1.0,"VariationHair":0,"EyebrowsColor2":0,"AgeingOpacity":1.0,"Freckles":-1,"EyebrowsColor":0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"ForeheadHeight":0.0,"UsePed":false,"VariationTorso2Color":0,"BeardColor2":0,"LipstickOpacity":1.0,"MakeupColor":0,"Mere":1,"Glasse2":0,"SkinAspectOpacity":1.0}', '{"Vetement676":{"Montant":1,"Data":{"Pants2":0,"Sexe":1,"Pants1":45,"Type":"Pantalon"}},"Telephone542":{"Montant":1,"Data":{"Num":3313720}},"Vetement637":{"Montant":1,"Data":{"Torso2":0,"Type":"Haut","Sexe":1,"Torso1":50,"ID":360}},"eau":{"Montant":10},"for":{"Montant":0},"pierre":{"Montant":5},"CarteCredit857":{"Montant":1,"Data":"3177-7088-7996-1034"},"ffer":{"Montant":0},"Vetement239":{"Montant":1,"Data":{"Shoes1":9,"Shoes2":2,"Sexe":1,"Type":"Chaussure"}},"pain":{"Montant":10}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000010891bf3c', 'Josh', 'Craig', 'user', 'mineur', 1, NULL, 'false', 456, 0, 0, 182, '{"soif":0,"faim":-0.6}', '{"z":38.34163284301758,"y":2776.322509765625,"x":2970.4345703125}', 20, 20, NULL, 140, '14 Octobre 1982', 'Homme', '{"NoseHeight":0.0,"LipstickOpacity":1.0,"BeardColor2":0,"EyebrowsColor2":0,"VariationMisc3":0,"VariationTorso":0,"Pants2":7,"CheeksWidth":0.0,"FrecklesOpacity":1.0,"Torso1":15,"LipstickColor":11,"EyesColor":5,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Pants1":9,"VariationTorsoColor":0,"Pere":2,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":12,"Freckles":-1,"JawWidth":0.0,"Arms1":11,"MakeupColor2":0,"LipstickColor2":3,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.29,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":6,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"Glasse2":0,"Torso2":0,"Tshirt2":2,"VariationMisc2":0,"ChinShape":0.0,"Hair":6,"Glasse1":-1,"ForeheadHeight":0.0,"VariationGloves":0,"CheekbonesHeight":0.0,"CheekbonesWidth":0.0,"EyesSize":0.0,"TipNoseBreak":0.0,"EyebrowsOpacity":1.0,"Beard":11,"ChinWidth":0.0,"Tshirt1":6,"Shoes1":12,"NoseWidth":0.0,"EyebrowsColor":0,"ShapeMix":0.82,"MakeupOpacity":1.0,"VariationHair":0,"VariationTorso2Color":0,"VariationMisc1":0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Mere":21,"UsePed":false,"VariationPants":0,"VariationGlovesColor":0,"Hat2":0,"MakeupColor":0,"HairColor":0,"Sexe":1,"SkinAspectOpacity":1.0}', '{"Vetement49":{"Data":{"Pants2":7,"Sexe":1,"Pants1":9,"Type":"Pantalon"},"Montant":1},"Telephone8":{"Data":{"Num":6481353},"Montant":1},"Vetement256":{"Data":{"Shoes1":12,"Shoes2":6,"Type":"Chaussure","Sexe":1},"Montant":1},"Vetement951":{"Data":{"Torso1":179,"Sexe":1,"Torso2":0,"ID":70,"Type":"Haut"},"Montant":1},"pain":{"Montant":19},"Vetement605":{"Data":{"Type":"T-Shirt","Sexe":1,"Tshirt2":2,"ID":260,"Tshirt1":6},"Montant":1},"Vetement489":{"Data":{"Torso1":6,"Sexe":1,"Torso2":0,"ID":82,"Type":"Haut"},"Montant":1},"pierre":{"Montant":435},"eau":{"Montant":14},"Vetement620":{"Data":{"Torso1":175,"Sexe":1,"Torso2":0,"ID":67,"Type":"Haut"},"Montant":1},"Vetement845":{"Data":{"Type":"T-Shirt","Sexe":1,"Tshirt2":0,"ID":64,"Tshirt1":15},"Montant":1}}', '{}', 'true', 'false', 'true', 'false', 'false'),
	('steam:11000010e7565ee', 'Joshua', 'Winston', 'user', 'mineur', 1, NULL, 'false', 394, 0, 0, 199, '{"soif":66,"faim":87.3}', '{"z":31.014650344848634,"x":1048.6815185546876,"y":-1965.8697509765626}', 20, 20, NULL, 170, '1 Juin 1970', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"BeardColor2":0,"EyebrowsColor2":24,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Sexe":1,"FrecklesOpacity":1.0,"Torso1":171,"LipstickColor":0,"EyesColor":-1,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Mere":22,"VariationTorsoColor":0,"Pere":15,"Arms2":0,"Shoes1":27,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":-1,"VariationMisc2":0,"JawWidth":0.0,"Arms1":8,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"EyebrowsColor":0,"Tshirt2":0,"HairColor2":28,"ChinShape":0.0,"Glasse2":0,"Pants1":1,"ShapeMix":0.48,"VariationGloves":0,"CheekbonesHeight":0.0,"Hair":15,"EyesSize":0.0,"VariationPants":0,"EyebrowsOpacity":1.0,"Beard":10,"ChinWidth":0.0,"VariationTorso2Color":0,"VariationMisc1":0,"NoseWidth":0.0,"Freckles":-1,"VariationHair":0,"VariationMisc3":0,"LipstickOpacity":1.0,"VariationGlovesColor":0,"MakeupOpacity":1.0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"ForeheadHeight":0.0,"UsePed":false,"Tshirt1":15,"TipNoseBreak":0.0,"Torso2":0,"MakeupColor":0,"AgeingOpacity":1.0,"HairColor":0,"SkinAspectOpacity":1.0}', '{"Vetement387":{"Data":{"Type":"Chaussure","Shoes2":0,"Shoes1":27,"Sexe":1},"Montant":1},"CarteCredit128":{"Data":"3177-4548-7968-4169","Montant":1},"Vetement144":{"Data":{"Type":"Lunettes","Glasse2":7,"Glasse1":5,"Sexe":1},"Montant":1},"eau":{"Montant":6},"for":{"Montant":-15},"Vetement187":{"Data":{"Torso1":171,"Sexe":1,"Torso2":0,"ID":164,"Type":"Haut"},"Montant":1},"Vetement718":{"Data":{"Type":"T-Shirt","Sexe":1,"Tshirt2":1,"ID":260,"Tshirt1":6},"Montant":0},"Vetement970":{"Data":{"Torso1":237,"Sexe":1,"Torso2":4,"ID":78,"Type":"Haut"},"Montant":1},"Vetement625":{"Data":{"Torso1":179,"Sexe":1,"Torso2":0,"ID":70,"Type":"Haut"},"Montant":1},"ffer":{"Montant":-28},"Telephone815":{"Data":{"Num":8880767},"Montant":1},"pain":{"Montant":10},"pierre":{"Montant":-10},"pdiamant":{"Montant":-6},"Vetement51":{"Data":{"Type":"Chapeau","Sexe":1,"Hat2":0,"Hat1":86},"Montant":1},"Vetement497":{"Data":{"Type":"Pantalon","Sexe":1,"Pants1":1,"Pants2":0},"Montant":1}}', '{}', 'true', 'false', 'true', 'false', 'false'),
	('steam:110000101c4bca9', 'Ron', 'Miller', 'user', 'mineur', 1, NULL, 'false', 674, 0, 0, 200, '{"faim":91.0,"soif":88}', '{"x":115.35480499267578,"y":-524.3663330078125,"z":42.891048431396487}', 20, 20, NULL, 188, '15 Février  1995', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"VariationGlovesColor":0,"MakeupOpacity":1.0,"Glasse1":-1,"VariationTorso":0,"Pants2":1,"Tshirt1":15,"FrecklesOpacity":1.0,"Torso1":5,"LipstickColor":0,"EyesColor":3,"BeardColor":3,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":83,"VariationHead":0,"Torso2":0,"Mere":4,"VariationTorsoColor":0,"Pere":22,"Arms2":0,"Shoes1":42,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":-0.04,"Eyebrows":17,"Freckles":-1,"JawWidth":0.0,"Arms1":5,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.16,"LipsWidth":0.0,"SkinMix":0.23,"MidNoseWidth":0.0,"Blemishes":4,"Shoes2":1,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"VariationMisc1":0,"Tshirt2":0,"BeardColor2":3,"ChinShape":0.0,"Glasse2":0,"HairColor":3,"Pants1":43,"VariationGloves":0,"CheekbonesHeight":0.0,"VariationTorso2":0,"EyesSize":0.0,"VariationPants":0,"EyebrowsOpacity":1.0,"Beard":18,"ChinWidth":0.0,"Sexe":1,"EyebrowsColor2":3,"NoseWidth":0.0,"UsePed":false,"ShapeMix":0.87,"VariationMisc2":0,"LipstickOpacity":1.0,"VariationMisc3":0,"Lipstick":-1,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"VariationTorso2Color":0,"TipNoseBreak":0.0,"VariationHair":0,"Hair":13,"HairColor2":3,"MakeupColor":0,"EyebrowsColor":3,"AgeingOpacity":1.0,"SkinAspectOpacity":1.0}', '{"Vetement496":{"Data":{"Type":"Pantalon","Sexe":1,"Pants1":43,"Pants2":1},"Montant":1},"Vetement193":{"Data":{"Torso1":5,"Sexe":1,"Torso2":0,"ID":58,"Type":"Haut"},"Montant":1},"Vetement58":{"Data":{"Type":"Chaussure","Shoes2":1,"Sexe":1,"Shoes1":42},"Montant":1},"Vetement260":{"Data":{"Type":"Chapeau","Sexe":1,"Hat2":0,"Hat1":83},"Montant":1},"CarteCredit637":{"Data":"3177-4318-5981-2062","Montant":1},"for":{"Montant":0},"pain":{"Montant":2},"pierre":{"Montant":40},"eau":{"Montant":1},"ffer":{"Montant":0},"pdiamant":{"Montant":0}}', '{}', 'true', 'false', 'true', 'false', 'true'),
	('steam:110000109cf66c6', 'James Richard', 'Watkins', 'user', 'mineur', 1, NULL, 'false', 193, 0, 0, 174, '{"soif":48,"faim":63.6}', '{"x":231.7967071533203,"z":30.82554054260254,"y":-752.3316040039063}', 20, 20, NULL, 183, '15 Novembre 1977', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"BeardColor2":0,"EyebrowsColor2":1,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"Tshirt1":15,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":0,"EyesColor":0,"BeardColor":1,"TipNoseHeight":0.0,"Complexion":3,"VariationShoesColor":0,"Ageing":10,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":5,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Mere":8,"VariationTorsoColor":0,"Pere":1,"Arms2":0,"Shoes1":79,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":18,"VariationMisc2":0,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.11,"MidNoseWidth":0.0,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"EyebrowsColor":1,"HairColor":0,"Glasse1":-1,"VariationPants":0,"Glasse2":0,"AgeingOpacity":1.0,"VariationHair":0,"VariationGloves":0,"CheekbonesHeight":0.0,"LipstickOpacity":1.0,"EyesSize":0.0,"Tshirt2":0,"EyebrowsOpacity":1.0,"Beard":18,"ChinWidth":0.0,"VariationGlovesColor":0,"Pants1":21,"NoseWidth":0.0,"MakeupOpacity":1.0,"ShapeMix":0.47,"Freckles":-1,"TipNoseBreak":0.0,"Hair":9,"ForeheadHeight":0.0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"FrecklesOpacity":1.0,"UsePed":false,"ChinShape":0.0,"Shoes2":0,"Torso2":0,"MakeupColor":0,"HairColor2":0,"Sexe":1,"SkinAspectOpacity":1.0}', '{"Vetement607":{"Data":{"Torso1":64,"Sexe":1,"Torso2":0,"ID":281,"Type":"Haut"},"Montant":1},"Telephone944":{"Data":{"Num":1747894},"Montant":1},"Vetement245":{"Data":{"Torso1":162,"Sexe":1,"Torso2":0,"ID":66,"Type":"Haut"},"Montant":1},"CarteCredit857":{"Data":"3177-4240-3297-9867","Montant":1},"Vetement718":{"Data":{"Type":"T-Shirt","Sexe":1,"Tshirt2":1,"ID":260,"Tshirt1":6},"Montant":0},"Vetement83":{"Data":{"Pants2":1,"Sexe":1,"Pants1":76,"Type":"Pantalon"},"Montant":1},"Vetement293":{"Data":{"Type":"T-Shirt","Sexe":1,"Tshirt2":0,"ID":302,"Tshirt1":27},"Montant":1},"ffer":{"Montant":0},"pdiamant":{"Montant":0},"pain":{"Montant":5},"for":{"Montant":0},"eau":{"Montant":5},"pierre":{"Montant":-10},"Vetement870":{"Data":{"Shoes1":79,"Shoes2":0,"Type":"Chaussure","Sexe":1},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000118c55903', 'Ivanna', 'Svetlana', 'user', 'mineur', 1, NULL, 'false', 509, 0, 0, 165, '{"faim":80.9,"soif":87}', '{"z":55.668087005615237,"y":120.4461669921875,"x":-1504.56005859375}', 20, 20, NULL, 160, '18 Août  1987', 'Femme', '{"NoseHeight":0.0,"LipstickOpacity":0.57,"EyebrowsColor":3,"MakeupOpacity":1.0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Sexe":2,"FrecklesOpacity":1.0,"Torso1":15,"LipstickColor":5,"EyesColor":2,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":58,"VariationHead":0,"VariationTorso2":0,"Pants1":15,"VariationTorsoColor":0,"Pere":21,"Arms2":0,"Shoes1":35,"VariationShoes":0,"Makeup":5,"ForeheadWidth":0.0,"Eyebrows":1,"VariationMisc2":0,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":0.0,"SkinMix":0.18,"MidNoseWidth":0.0,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":2,"Mere":8,"Tshirt2":0,"VariationTorso2Color":0,"VariationPants":0,"Glasse2":0,"TipNoseBreak":0.0,"Lipstick":1,"VariationGloves":0,"CheekbonesHeight":0.0,"ChinShape":0.0,"EyesSize":0.0,"CheekbonesWidth":0.0,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"HairColor2":8,"Freckles":-1,"NoseWidth":0.0,"VariationGlovesColor":0,"ShapeMix":1.0,"EyebrowsColor2":3,"VariationMisc3":0,"Shoes2":0,"Tshirt1":2,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"HairColor":3,"UsePed":false,"AgeingOpacity":1.0,"BeardColor2":0,"Hair":4,"MakeupColor":0,"VariationHair":0,"Torso2":0,"SkinAspectOpacity":1.0}', '{"eau":{"Montant":5},"Vetement296":{"Data":{"Pants1":27,"Sexe":2,"Pants2":0,"Type":"Pantalon"},"Montant":1},"CarteCredit386":{"Data":"3177-8377-7549-1118","Montant":1},"Vetement878":{"Data":{"Torso2":2,"ID":25,"Sexe":2,"Torso1":27,"Type":"Haut"},"Montant":1},"Vetement895":{"Data":{"Type":"Chapeau","Sexe":2,"Hat2":2,"Hat1":58},"Montant":1},"Vetement993":{"Data":{"Glasse2":0,"Sexe":2,"Glasse1":21,"Type":"Lunettes"},"Montant":1},"pain":{"Montant":5},"Vetement898":{"Data":{"Shoes1":27,"Shoes2":0,"Sexe":2,"Type":"Chaussure"},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000101c4bca9', NULL, NULL, 'user', 'mineur', 1, NULL, 'false', 674, 0, 0, 200, '{"faim":91.0,"soif":88}', '{"x":115.35480499267578,"y":-524.3663330078125,"z":42.891048431396487}', 20, 20, NULL, NULL, NULL, NULL, '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"VariationGlovesColor":0,"MakeupOpacity":1.0,"Glasse1":-1,"VariationTorso":0,"Pants2":1,"Tshirt1":15,"FrecklesOpacity":1.0,"Torso1":5,"LipstickColor":0,"EyesColor":3,"BeardColor":3,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":83,"VariationHead":0,"Torso2":0,"Mere":4,"VariationTorsoColor":0,"Pere":22,"Arms2":0,"Shoes1":42,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":-0.04,"Eyebrows":17,"Freckles":-1,"JawWidth":0.0,"Arms1":5,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.16,"LipsWidth":0.0,"SkinMix":0.23,"MidNoseWidth":0.0,"Blemishes":4,"Shoes2":1,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"VariationMisc1":0,"Tshirt2":0,"BeardColor2":3,"ChinShape":0.0,"Glasse2":0,"HairColor":3,"Pants1":43,"VariationGloves":0,"CheekbonesHeight":0.0,"VariationTorso2":0,"EyesSize":0.0,"VariationPants":0,"EyebrowsOpacity":1.0,"Beard":18,"ChinWidth":0.0,"Sexe":1,"EyebrowsColor2":3,"NoseWidth":0.0,"UsePed":false,"ShapeMix":0.87,"VariationMisc2":0,"LipstickOpacity":1.0,"VariationMisc3":0,"Lipstick":-1,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"VariationTorso2Color":0,"TipNoseBreak":0.0,"VariationHair":0,"Hair":13,"HairColor2":3,"MakeupColor":0,"EyebrowsColor":3,"AgeingOpacity":1.0,"SkinAspectOpacity":1.0}', '{"Vetement496":{"Data":{"Type":"Pantalon","Sexe":1,"Pants1":43,"Pants2":1},"Montant":1},"Vetement193":{"Data":{"Torso1":5,"Sexe":1,"Torso2":0,"ID":58,"Type":"Haut"},"Montant":1},"Vetement58":{"Data":{"Type":"Chaussure","Shoes2":1,"Sexe":1,"Shoes1":42},"Montant":1},"Vetement260":{"Data":{"Type":"Chapeau","Sexe":1,"Hat2":0,"Hat1":83},"Montant":1},"CarteCredit637":{"Data":"3177-4318-5981-2062","Montant":1},"for":{"Montant":0},"pain":{"Montant":2},"pierre":{"Montant":40},"eau":{"Montant":1},"ffer":{"Montant":0},"pdiamant":{"Montant":0}}', '{}', 'true', 'false', 'true', 'false', 'true'),
	('steam:110000116c62795', 'Bogdan', 'Sokolov', 'user', 'aucun', 1, NULL, 'false', 845, 0, 0, 200, '{"soif":15,"faim":25.5}', '{"y":137.5426483154297,"z":55.65290069580078,"x":-1487.5416259765626}', 20, 20, NULL, 177, '9 Février  1984', 'Homme', '{"NoseHeight":0.2,"LipstickOpacity":1.0,"VariationGlovesColor":0,"MakeupOpacity":1.0,"VariationMisc3":0,"VariationTorso":0,"Pants2":1,"Sexe":1,"VariationTorso2Color":0,"Torso1":13,"LipstickColor":0,"EyesColor":2,"BeardColor":13,"TipNoseHeight":0.0,"Complexion":10,"VariationShoesColor":0,"Ageing":2,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":3,"Pants1":52,"VariationTorsoColor":0,"Pere":22,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":21,"VariationMisc2":0,"JawWidth":0.8,"Arms1":11,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":0.0,"SkinMix":1.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":11,"ChinPosition":0.4,"ChinHeight":-0.4,"MidNoseHeight":0.0,"HairColor2":13,"Hat2":0,"FrecklesOpacity":1.0,"HairColor":13,"Freckles":-1,"ChinShape":-0.4,"Hair":1,"Shoes1":40,"Mere":6,"VariationGloves":0,"CheekbonesHeight":0.4,"VariationTorso2":0,"EyesSize":-0.4,"TipNoseBreak":0.0,"EyebrowsOpacity":1.0,"Beard":18,"ChinWidth":0.4,"Glasse2":0,"CheekbonesWidth":-0.4,"NoseWidth":0.8,"VariationPants":0,"VariationHair":0,"EyebrowsColor":13,"EyebrowsColor2":13,"Glasse1":-1,"Lipstick":-1,"JawHeight":0.2,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"VariationMisc1":0,"UsePed":false,"Tshirt1":15,"CheeksWidth":0.8,"BeardColor2":13,"MakeupColor":0,"Tshirt2":0,"ShapeMix":0.0,"SkinAspectOpacity":1.0}', '{"Vetement782":{"Data":{"Torso1":13,"Sexe":1,"Torso2":3,"ID":580,"Type":"Haut"},"Montant":1},"Vetement370":{"Data":{"Shoes1":40,"Shoes2":11,"Type":"Chaussure","Sexe":1},"Montant":1},"Vetement125":{"Data":{"Pants2":1,"Sexe":1,"Pants1":52,"Type":"Pantalon"},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:1100001059b2eb2', 'Boris', 'Petrovic', 'user', 'aucun', 1, NULL, 'false', 474, 0, 0, 179, '{"soif":24,"faim":39.3}', '{"x":-1512.572021484375,"y":105.5495834350586,"z":56.10061264038086}', 20, 20, NULL, 185, '16 Juillet 1987', 'Homme', '{"NoseHeight":0.0,"LipstickOpacity":1.0,"EyebrowsColor":0,"EyebrowsColor2":0,"Glasse1":4,"VariationTorso":0,"Pants2":0,"Tshirt1":33,"FrecklesOpacity":1.0,"Torso1":142,"LipstickColor":0,"EyesColor":5,"BeardColor":2,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":12,"VariationHead":0,"Torso2":0,"Mere":1,"VariationTorsoColor":0,"Pere":19,"Arms2":0,"Shoes1":34,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":30,"VariationMisc2":0,"JawWidth":0.0,"Arms1":12,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.22,"MidNoseWidth":-0.4,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.4,"HairColor2":0,"VariationMisc1":0,"HairColor":0,"Freckles":-1,"ChinShape":0.0,"Hair":0,"BeardColor2":0,"UsePed":false,"VariationGloves":0,"CheekbonesHeight":0.0,"Tshirt2":0,"EyesSize":0.0,"CheekbonesWidth":0.0,"EyebrowsOpacity":1.0,"Beard":10,"ChinWidth":0.0,"Sexe":1,"Glasse2":2,"NoseWidth":0.0,"VariationTorso2Color":0,"ShapeMix":1.0,"MakeupOpacity":1.0,"VariationGlovesColor":0,"VariationMisc3":0,"ForeheadHeight":0.0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"AgeingOpacity":1.0,"TipNoseBreak":0.0,"Pants1":21,"VariationTorso2":0,"Hat2":0,"MakeupColor":0,"VariationPants":0,"VariationHair":0,"SkinAspectOpacity":1.0}', '{"Vetement688":{"Data":{"Type":"Pantalon","Sexe":1,"Pants1":24,"Pants2":0},"Montant":1},"Vetement517":{"Data":{"Type":"Lunettes","Glasse2":2,"Sexe":1,"Glasse1":4},"Montant":1},"Vetement680":{"Data":{"Type":"Chapeau","Sexe":1,"Hat2":0,"Hat1":12},"Montant":1},"pain":{"Montant":6},"Vetement798":{"Data":{"Torso1":142,"Sexe":1,"Torso2":0,"ID":333,"Type":"Haut"},"Montant":1},"eau":{"Montant":9},"Telephone648":{"Data":{"Num":1902252},"Montant":1},"Vetement343":{"Data":{"Type":"Chaussure","Shoes2":1,"Sexe":1,"Shoes1":42},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000010576a9e6', 'Dimitrov', 'Petrovic', 'user', 'mineur', 1, NULL, 'false', 420, 0, 0, 200, '{"faim":92.3,"soif":89}', '{"y":127.6223373413086,"z":56.26091766357422,"x":-1502.6182861328126}', 20, 20, NULL, 190, '17 Mars 1990', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"EyebrowsColor":0,"EyebrowsColor2":0,"Glasse1":-1,"VariationTorso":0,"Pants2":1,"Tshirt1":15,"FrecklesOpacity":0.69,"Torso1":13,"LipstickColor":0,"EyesColor":12,"BeardColor":0,"TipNoseHeight":0.16,"Complexion":-1,"VariationShoesColor":0,"Ageing":6,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":0.86,"SkinAspect":6,"Hat1":-1,"VariationHead":0,"Torso2":2,"Mere":21,"VariationTorsoColor":0,"Pere":21,"Arms2":0,"Shoes1":10,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":12,"Freckles":0,"JawWidth":-0.4,"Arms1":11,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.94,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":23,"VariationMisc1":0,"ChinPosition":0.46,"ChinHeight":-0.06,"MidNoseHeight":0.0,"Hat2":0,"Pants1":4,"ForeheadHeight":0.0,"Tshirt2":0,"AgeingOpacity":0.78,"VariationPants":0,"Glasse2":0,"VariationTorso2":0,"MakeupOpacity":1.0,"VariationGloves":0,"CheekbonesHeight":0.0,"Sexe":1,"EyesSize":-0.46,"VariationGlovesColor":0,"EyebrowsOpacity":1.0,"Beard":7,"ChinWidth":0.5,"Shoes2":0,"VariationMisc2":0,"NoseWidth":0.86,"LipstickOpacity":1.0,"VariationHair":0,"ShapeMix":0.49,"BeardColor2":0,"VariationMisc3":0,"CheeksWidth":0.0,"JawHeight":0.4,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"VariationTorso2Color":0,"UsePed":false,"HairColor2":0,"TipNoseBreak":0.8,"ChinShape":0.06,"MakeupColor":0,"HairColor":0,"Hair":11,"SkinAspectOpacity":0.51}', '{"Vetement650":{"Data":{"Torso1":13,"Sexe":1,"Torso2":2,"ID":580,"Type":"Haut"},"Montant":1},"eau":{"Montant":5},"Telephone375":{"Data":{"Num":5428314},"Montant":1},"Vetement192":{"Data":{"Pants2":1,"Sexe":1,"Pants1":4,"Type":"Pantalon"},"Montant":1},"Vetement872":{"Data":{"Shoes1":10,"Shoes2":0,"Sexe":1,"Type":"Chaussure"},"Montant":1},"ffer":{"Montant":-24},"Telephone844":{"Data":{"Num":6811218},"Montant":1},"pain":{"Montant":4},"for":{"Montant":-5},"pdiamant":{"Montant":-2},"pierre":{"Montant":-10},"CarteCredit627":{"Data":"3177-7203-9678-3409","Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:1100001005b0bb5', 'Stanislas', 'Flower', 'owner', 'aucun', 1, NULL, 'false', 828, 0, 0, 200, '{"soif":0,"faim":-0.4}', '{"z":332.53192138671877,"x":-455.8804931640625,"y":1107.673828125}', 20, 20, NULL, 166, '28 Avril 1982', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"BeardColor2":0,"EyebrowsColor2":0,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"Sexe":1,"VariationTorso2Color":0,"Torso1":135,"LipstickColor":0,"EyesColor":-1,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":20,"VariationHead":0,"VariationTorso2":0,"Pants1":21,"VariationTorsoColor":0,"Pere":4,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":-1,"Freckles":-1,"JawWidth":0.0,"Arms1":0,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":4,"Shoes1":16,"HairColor":0,"Tshirt2":0,"ChinShape":0.0,"Hair":0,"VariationMisc2":0,"HairColor2":0,"VariationGloves":0,"CheekbonesHeight":0.0,"VariationGlovesColor":0,"EyesSize":0.0,"EyebrowsColor":0,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"ForeheadHeight":0.0,"LipstickOpacity":1.0,"NoseWidth":0.0,"MakeupOpacity":1.0,"VariationHair":0,"Glasse1":5,"VariationPants":0,"Tshirt1":15,"FrecklesOpacity":1.0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Glasse2":1,"TipNoseBreak":0.0,"VariationMisc1":0,"Mere":4,"ShapeMix":0.8,"MakeupColor":0,"Torso2":2,"UsePed":false,"SkinAspectOpacity":1.0}', '{"Vetement464":{"Montant":1,"Data":{"Torso2":2,"Type":"Haut","Sexe":1,"Torso1":135,"ID":213}},"Vetement469":{"Montant":1,"Data":{"Pants2":0,"Sexe":1,"Pants1":78,"Type":"Pantalon"}},"Vetement354":{"Data":{"Hat1":20,"Sexe":1,"Hat2":4,"Type":"Chapeau"},"Montant":1},"Vetement148":{"Montant":1,"Data":{"Glasse2":1,"Sexe":1,"Glasse1":5,"Type":"Lunettes"}},"Vetement194":{"Montant":1,"Data":{"Shoes1":16,"Shoes2":0,"Sexe":1,"Type":"Chaussure"}}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000101c4bca9', 'Ron', 'Miller', 'user', 'mineur', 1, NULL, 'false', 674, 0, 0, 200, '{"faim":91.0,"soif":88}', '{"x":115.35480499267578,"y":-524.3663330078125,"z":42.891048431396487}', 20, 20, NULL, 188, '15 Février  1995', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"VariationGlovesColor":0,"MakeupOpacity":1.0,"Glasse1":-1,"VariationTorso":0,"Pants2":1,"Tshirt1":15,"FrecklesOpacity":1.0,"Torso1":5,"LipstickColor":0,"EyesColor":3,"BeardColor":3,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":83,"VariationHead":0,"Torso2":0,"Mere":4,"VariationTorsoColor":0,"Pere":22,"Arms2":0,"Shoes1":42,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":-0.04,"Eyebrows":17,"Freckles":-1,"JawWidth":0.0,"Arms1":5,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.16,"LipsWidth":0.0,"SkinMix":0.23,"MidNoseWidth":0.0,"Blemishes":4,"Shoes2":1,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"VariationMisc1":0,"Tshirt2":0,"BeardColor2":3,"ChinShape":0.0,"Glasse2":0,"HairColor":3,"Pants1":43,"VariationGloves":0,"CheekbonesHeight":0.0,"VariationTorso2":0,"EyesSize":0.0,"VariationPants":0,"EyebrowsOpacity":1.0,"Beard":18,"ChinWidth":0.0,"Sexe":1,"EyebrowsColor2":3,"NoseWidth":0.0,"UsePed":false,"ShapeMix":0.87,"VariationMisc2":0,"LipstickOpacity":1.0,"VariationMisc3":0,"Lipstick":-1,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"VariationTorso2Color":0,"TipNoseBreak":0.0,"VariationHair":0,"Hair":13,"HairColor2":3,"MakeupColor":0,"EyebrowsColor":3,"AgeingOpacity":1.0,"SkinAspectOpacity":1.0}', '{"Vetement496":{"Data":{"Type":"Pantalon","Sexe":1,"Pants1":43,"Pants2":1},"Montant":1},"Vetement193":{"Data":{"Torso1":5,"Sexe":1,"Torso2":0,"ID":58,"Type":"Haut"},"Montant":1},"Vetement58":{"Data":{"Type":"Chaussure","Shoes2":1,"Sexe":1,"Shoes1":42},"Montant":1},"Vetement260":{"Data":{"Type":"Chapeau","Sexe":1,"Hat2":0,"Hat1":83},"Montant":1},"CarteCredit637":{"Data":"3177-4318-5981-2062","Montant":1},"for":{"Montant":0},"pain":{"Montant":2},"pierre":{"Montant":40},"eau":{"Montant":1},"ffer":{"Montant":0},"pdiamant":{"Montant":0}}', '{}', 'true', 'false', 'true', 'false', 'true'),
	('steam:110000111e5f705', 'Wilson', 'Brown', 'user', 'mineur', 1, NULL, 'false', 215, 0, 0, 195, '{"soif":68,"faim":42.0}', '{"y":299.8036193847656,"x":392.75140380859377,"z":103.0267333984375}', 20, 20, NULL, 180, '21 Mars 1987', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"EyebrowsColor":3,"EyebrowsColor2":3,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Tshirt1":15,"VariationTorso2Color":0,"Torso1":179,"LipstickColor":0,"EyesColor":-1,"BeardColor":3,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":2,"VariationHead":0,"VariationTorso2":0,"Mere":11,"VariationTorsoColor":0,"Pere":8,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":2,"Freckles":-1,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"Shoes1":25,"Tshirt2":0,"FrecklesOpacity":1.0,"ChinShape":0.0,"Glasse2":0,"UsePed":false,"MakeupOpacity":1.0,"VariationGloves":0,"CheekbonesHeight":0.0,"VariationPants":0,"EyesSize":-0.4,"Pants1":21,"EyebrowsOpacity":1.0,"Beard":10,"ChinWidth":0.0,"Shoes2":0,"HairColor":0,"NoseWidth":0.0,"Hair":0,"ShapeMix":1.0,"VariationMisc2":0,"VariationHair":0,"VariationGlovesColor":0,"Sexe":1,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"VariationMisc3":0,"TipNoseBreak":0.0,"ForeheadHeight":0.0,"Torso2":1,"BeardColor2":3,"MakeupColor":0,"Hat2":0,"LipstickOpacity":1.0,"SkinAspectOpacity":1.0}', '{"Vetement269":{"Data":{"Pants2":0,"Sexe":1,"Pants1":4,"Type":"Pantalon"},"Montant":1},"CarteCredit857":{"Data":"3177-4240-3297-9867","Montant":1},"Vetement918":{"Data":{"Hat2":0,"Sexe":1,"Type":"Chapeau","Hat1":2},"Montant":1},"Vetement158":{"Data":{"Shoes1":25,"Shoes2":0,"Sexe":1,"Type":"Chaussure"},"Montant":1},"pain":{"Montant":5},"Vetement718":{"Data":{"Type":"T-Shirt","Sexe":1,"Tshirt2":1,"ID":260,"Tshirt1":6},"Montant":1},"eau":{"Montant":9},"pdiamant":{"Montant":0},"ffer":{"Montant":0},"for":{"Montant":-3},"Vetement466":{"Data":{"Type":"Chapeau","Sexe":1,"Hat2":0,"Hat1":5},"Montant":1},"pierre":{"Montant":-6},"Vetement210":{"Data":{"Type":"Lunettes","Glasse2":5,"Sexe":1,"Glasse1":5},"Montant":1},"Telephone881":{"Data":{"Num":8097991},"Montant":1},"Vetement123":{"Data":{"Torso1":179,"Sexe":1,"Torso2":1,"ID":70,"Type":"Haut"},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000109cfe178', 'Declan', 'Johnns ', 'user', 'mineur', 1, NULL, 'false', 4731, 0, 0, 198, '{"soif":84,"faim":48.5}', '{"z":39.65376281738281,"x":12.167137145996094,"y":3742.994384765625}', 20, 20, NULL, 175, '23 Août  1985', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"EyebrowsColor":0,"EyebrowsColor2":0,"Glasse1":18,"VariationTorso":0,"Pants2":0,"Tshirt1":15,"FrecklesOpacity":1.0,"Torso1":175,"LipstickColor":0,"EyesColor":-1,"BeardColor":12,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":0,"Pants1":21,"VariationTorsoColor":0,"Pere":4,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":-1,"Freckles":-1,"JawWidth":0.0,"Arms1":5,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"MakeupOpacity":1.0,"Tshirt2":0,"Hat2":0,"ChinShape":0.0,"Hair":9,"Sexe":1,"VariationMisc3":0,"VariationGloves":0,"CheekbonesHeight":0.0,"VariationPants":0,"EyesSize":0.0,"Glasse2":2,"EyebrowsOpacity":1.0,"Beard":1,"ChinWidth":0.0,"BeardColor2":0,"HairColor":10,"NoseWidth":0.0,"ForeheadHeight":0.0,"VariationHair":0,"VariationMisc2":0,"LipstickOpacity":1.0,"VariationTorso2":0,"VariationTorso2Color":0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Shoes2":0,"UsePed":false,"TipNoseBreak":0.0,"Shoes1":34,"ShapeMix":0.8,"MakeupColor":0,"Mere":19,"VariationGlovesColor":0,"SkinAspectOpacity":1.0}', '{"Vetement221":{"Montant":1,"Data":{"Torso2":0,"Type":"Haut","Sexe":1,"Torso1":175,"ID":67}},"Vetement245":{"Montant":0,"Data":{"Torso2":0,"Type":"Haut","Sexe":1,"Torso1":162,"ID":66}},"Vetement605":{"Montant":0,"Data":{"Tshirt1":6,"ID":260,"Sexe":1,"Tshirt2":2,"Type":"T-Shirt"}},"pierre":{"Montant":-10},"Vetement543":{"Montant":1,"Data":{"Pants1":63,"Sexe":1,"Pants2":0,"Type":"Pantalon"}},"Telephone506":{"Montant":1,"Data":{"Num":5292633}},"Vetement718":{"Montant":0,"Data":{"Tshirt1":6,"ID":260,"Sexe":1,"Tshirt2":1,"Type":"T-Shirt"}},"ffer":{"Montant":0},"Vetement620":{"Montant":0,"Data":{"Torso2":0,"Type":"Haut","Sexe":1,"Torso1":175,"ID":67}},"Vetement421":{"Montant":1,"Data":{"Hat1":85,"Sexe":1,"Hat2":0,"Type":"Chapeau"}},"Vetement39":{"Montant":1,"Data":{"Tshirt1":15,"ID":66,"Sexe":1,"Tshirt2":0,"Type":"T-Shirt"}},"pdiamant":{"Montant":0},"for":{"Montant":0},"Vetement945":{"Montant":-1,"Data":{"Torso2":0,"Type":"Haut","Sexe":1,"Torso1":162,"ID":66}},"eau":{"Montant":18},"Vetement962":{"Montant":1,"Data":{"Shoes1":24,"Shoes2":0,"Sexe":1,"Type":"Chaussure"}},"pain":{"Montant":12},"Vetement101":{"Montant":1,"Data":{"Glasse2":2,"Sexe":1,"Glasse1":18,"Type":"Lunettes"}}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000109806c60', 'Matthew', 'Simmons', 'user', 'mineur', 1, NULL, 'false', 478, 0, 0, 110, '{"soif":41,"faim":73.7}', '{"z":40.440589904785159,"x":33.46120834350586,"y":3673.630615234375}', 20, 20, NULL, 188, '16 Juin 1965', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"BeardColor2":28,"EyebrowsColor2":0,"Glasse1":5,"VariationTorso":0,"Pants2":0,"Sexe":1,"FrecklesOpacity":1.0,"Torso1":15,"LipstickColor":0,"EyesColor":-1,"BeardColor":28,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":10,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":85,"VariationHead":0,"VariationTorso2":0,"Mere":12,"VariationTorsoColor":0,"Pere":13,"Arms2":0,"Shoes1":34,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":0,"VariationMisc2":0,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"Freckles":-1,"Tshirt2":0,"AgeingOpacity":1.0,"ChinShape":0.0,"Hair":5,"VariationGlovesColor":0,"Torso2":0,"VariationGloves":0,"CheekbonesHeight":0.0,"Lipstick":-1,"EyesSize":0.0,"Shoes2":0,"EyebrowsOpacity":1.0,"Beard":18,"ChinWidth":0.0,"HairColor":28,"LipstickOpacity":1.0,"NoseWidth":0.0,"MakeupOpacity":1.0,"VariationHair":0,"VariationMisc3":0,"Tshirt1":15,"ShapeMix":0.52,"VariationTorso2Color":0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Pants1":21,"TipNoseBreak":0.0,"Glasse2":7,"UsePed":false,"VariationPants":0,"MakeupColor":0,"HairColor2":0,"EyebrowsColor":29,"SkinAspectOpacity":1.0}', '{"Vetement439":{"Data":{"Type":"T-Shirt","Sexe":1,"Tshirt2":0,"ID":90,"Tshirt1":18},"Montant":1},"Vetement521":{"Data":{"Torso1":6,"Sexe":1,"Torso2":0,"ID":82,"Type":"Haut"},"Montant":1},"Vetement772":{"Data":{"Type":"Lunettes","Glasse2":7,"Sexe":1,"Glasse1":5},"Montant":1},"Vetement945":{"Data":{"Torso1":162,"Sexe":1,"Torso2":0,"ID":66,"Type":"Haut"},"Montant":2},"pain":{"Montant":18},"CarteCredit920":{"Data":"3177-7889-5822-3182","Montant":1},"Vetement489":{"Data":{"Type":"Chaussure","Shoes2":0,"Sexe":1,"Shoes1":27},"Montant":1},"Vetement759":{"Data":{"Torso1":166,"Sexe":1,"Torso2":0,"ID":318,"Type":"Haut"},"Montant":1},"eau":{"Montant":16},"Vetement21":{"Data":{"Type":"Chapeau","Sexe":1,"Hat2":0,"Hat1":85},"Montant":1},"Vetement813":{"Data":{"Type":"Pantalon","Sexe":1,"Pants1":1,"Pants2":0},"Montant":1}}', '{}', 'true', 'false', 'true', 'false', 'false'),
	('steam:11000013d09c2b6', 'Segador', 'Valdes', 'user', 'paysagiste', 1, NULL, 'false', 18, 0, 0, 200, '{"soif":54,"faim":42.8}', '{"y":1130.9593505859376,"x":1412.03857421875,"z":114.3341293334961}', 20, 20, NULL, 194, '14 Juin 1978', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"BeardColor2":0,"EyebrowsColor2":0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Sexe":1,"VariationTorso2Color":0,"Torso1":15,"LipstickColor":0,"EyesColor":-1,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Pants1":21,"VariationTorsoColor":0,"Pere":4,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":-1,"Freckles":-1,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"FrecklesOpacity":1.0,"VariationHair":0,"HairColor":0,"VariationPants":0,"ChinShape":0.0,"Glasse2":0,"LipstickOpacity":1.0,"MakeupOpacity":1.0,"VariationGloves":0,"CheekbonesHeight":0.0,"ForeheadHeight":0.0,"EyesSize":0.0,"Torso2":0,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"VariationMisc2":0,"Tshirt2":0,"NoseWidth":0.0,"EyebrowsColor":0,"ShapeMix":0.8,"VariationMisc3":0,"Mere":4,"Tshirt1":15,"PedUsed":"g_m_y_mexgang_01","JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Shoes1":34,"TipNoseBreak":0.0,"Shoes2":0,"VariationGlovesColor":0,"Hat2":0,"MakeupColor":0,"Hair":0,"UsePed":true,"SkinAspectOpacity":1.0}', '{"eau":{"Montant":10},"CarteCredit802":{"Data":"3177-4240-3297-9867","Montant":1},"pain":{"Montant":10}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000142a38970', 'Rico', 'Santino', 'user', 'paysagiste', 1, NULL, 'false', 868, 0, 0, 200, '{"soif":63,"faim":56.6}', '{"y":1130.30615234375,"x":1420.0316162109376,"z":113.79373931884766}', 20, 20, NULL, 195, '1 Janvier 1920', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"BeardColor2":0,"MakeupOpacity":1.0,"VariationMisc3":0,"VariationTorso":0,"Pants2":0,"Sexe":1,"FrecklesOpacity":1.0,"Torso1":15,"LipstickColor":0,"EyesColor":-1,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":2,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":1,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":0,"Mere":19,"VariationTorsoColor":2,"Pere":8,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":-1,"PedUsed":"g_m_y_mexgang_01","JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"VariationMisc1":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"VariationTorso2":0,"EyebrowsColor2":0,"HairColor":0,"Glasse1":-1,"VariationPants":0,"Hair":0,"VariationMisc2":0,"Pants1":21,"VariationGloves":0,"CheekbonesHeight":0.0,"LipstickOpacity":1.0,"EyesSize":0.0,"Shoes1":34,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"VariationGlovesColor":0,"Tshirt2":0,"NoseWidth":0.0,"Freckles":-1,"ShapeMix":0.51,"EyebrowsColor":0,"ForeheadHeight":0.0,"Tshirt1":15,"VariationTorso2Color":0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Shoes2":0,"TipNoseBreak":0.0,"UsePed":true,"ChinShape":0.0,"HairColor2":0,"MakeupColor":0,"Glasse2":0,"VariationHair":1,"SkinAspectOpacity":1.0}', '{"eau":{"Montant":12},"pain":{"Montant":13},"Vetement380":{"Montant":0,"Data":{"Torso2":1,"ID":208,"Sexe":1,"Torso1":94,"Type":"Haut"}},"cocaine":{"Montant":1.0}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:110000140a988b6', 'Amado', 'Hortelano', 'user', 'aucun', 1, NULL, 'false', 0, 0, 0, 169, '{"faim":-0.6,"soif":0}', '{"x":1432.1263427734376,"y":-1506.5758056640626,"z":61.91936111450195}', 20, 20, NULL, 185, '18 Octobre 1982', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"EyebrowsColor":0,"EyebrowsColor2":0,"VariationMisc3":0,"VariationTorso":2,"Pants2":0,"Sexe":1,"FrecklesOpacity":1.0,"Torso1":15,"LipstickColor":0,"EyesColor":-1,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":0,"Pants1":21,"VariationTorsoColor":1,"Pere":4,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":-1,"PedUsed":"g_m_y_salvaboss_01","JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"MakeupOpacity":1.0,"Hat2":0,"Tshirt2":0,"VariationGlovesColor":0,"VariationPants":0,"Hair":0,"Glasse2":0,"HairColor":0,"VariationGloves":0,"CheekbonesHeight":0.0,"UsePed":true,"EyesSize":0.0,"VariationMisc2":0,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"Glasse1":-1,"VariationMisc1":0,"NoseWidth":0.0,"ForeheadHeight":0.0,"ShapeMix":0.8,"Tshirt1":15,"LipstickOpacity":1.0,"BeardColor2":0,"VariationTorso2Color":0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"ChinShape":0.0,"TipNoseBreak":0.0,"VariationHair":0,"Shoes1":34,"VariationTorso2":0,"MakeupColor":0,"Mere":4,"Freckles":-1,"SkinAspectOpacity":1.0}', '{"Telephone861":{"Data":{"Num":8713226},"Montant":0},"Telephone338":{"Data":{"Num":1678405},"Montant":1},"eau":{"Montant":10},"pain":{"Montant":9}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:1100001161b4df2', 'Staff', 'Roxx', 'owner', 'aucun', 1, NULL, 'false', 915, 0, 0, 200, '{"soif":36,"faim":40.2}', '{"x":-140.6210174560547,"y":86.80945587158203,"z":76.20646667480469}', 20, 20, NULL, 141, '1 Janvier 1920', 'Homme', '{"VariationTorso2Color":0,"VariationPants":0,"AgeingOpacity":1.0,"VariationGlovesColor":0,"CheeksWidth":0.36,"Hat2":0,"Torso2":0,"SkinAspectOpacity":1.0,"VariationShoes":0,"BeardColor":0,"Makeup":-1,"TipNoseBreak":0.0,"FrecklesOpacity":1.0,"VariationBeard":0,"NoseWidth":0.0,"ForeheadWidth":0.0,"Torso1":15,"SkinAspect":-1,"LipstickOpacity":1.0,"ShapeMix":0.8,"ChinShape":0.0,"Hat1":-1,"LipsWidth":-0.38,"VariationTorso2":0,"HairColor2":0,"BeardColor2":0,"Blemishes":-1,"Glasse2":0,"EyebrowsColor2":0,"EyebrowsColor":0,"NoseHeight":0.0,"BeardOpacity":1.0,"Complexion":-1,"MidNoseHeight":0.0,"Eyebrows":-1,"JawHeight":0.0,"VariationShoesColor":0,"TipNoseHeight":0.0,"Lipstick":-1,"BlemishesOpacity":1.0,"ForeheadHeight":0.0,"VariationMisc2":0,"VariationTorsoColor":0,"LipstickColor2":0,"ComplexionOpacity":1.0,"JawWidth":0.0,"Mere":4,"Arms1":15,"Pere":4,"Tshirt2":0,"MakeupColor2":0,"Glasse1":-1,"Sexe":1,"MakeupOpacity":1.0,"EyebrowsOpacity":1.0,"EyesSize":1.0,"MidNoseWidth":0.0,"VariationMisc3":0,"VariationPantsColor":0,"Shoes2":0,"LipstickColor":0,"ChinWidth":0.0,"VariationHair":0,"CheekbonesWidth":0.0,"Hair":0,"VariationHead":0,"UsePed":false,"SkinMix":0.0,"Pants1":21,"VariationMisc1":0,"VariationGloves":0,"Freckles":-1,"ChinPosition":0.0,"MakeupColor":0,"Beard":-1,"Arms2":0,"Ageing":-1,"Pants2":0,"Tshirt1":15,"ChinHeight":0.0,"EyesColor":-1,"Shoes1":34,"VariationTorso":0,"CheekbonesHeight":0.0,"HairColor":0}', '{}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000011482a2e3', 'Grey', 'Smith', 'owner', 'aucun', 1, NULL, 'false', 639, 0, 0, 200, '{"soif":29,"faim":35.3}', '{"x":323.126220703125,"y":-839.999755859375,"z":29.291593551635743}', 20, 20, NULL, 180, '22 Mars 1996', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"VariationGlovesColor":0,"EyebrowsColor2":0,"VariationMisc3":0,"VariationTorso":0,"Pants2":13,"Sexe":1,"VariationTorso2Color":0,"Torso1":216,"LipstickColor":0,"EyesColor":2,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Mere":9,"VariationTorsoColor":0,"Pere":4,"Arms2":0,"Shoes1":8,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":-1,"VariationMisc2":0,"JawWidth":0.0,"Arms1":15,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"HairColor2":0,"FrecklesOpacity":1.0,"HairColor":0,"VariationMisc1":0,"VariationPants":0,"Hair":12,"Freckles":-1,"MakeupOpacity":1.0,"VariationGloves":0,"CheekbonesHeight":0.0,"ShapeMix":0.8,"EyesSize":-0.4,"EyebrowsColor":0,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"LipstickOpacity":1.0,"BeardColor2":0,"NoseWidth":0.0,"Glasse1":-1,"VariationHair":0,"ForeheadHeight":0.0,"Tshirt1":15,"Torso2":2,"TipNoseBreak":0.0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Hat2":0,"UsePed":false,"AgeingOpacity":1.0,"Tshirt2":0,"ChinShape":0.0,"MakeupColor":0,"Glasse2":0,"Pants1":97,"SkinAspectOpacity":1.0}', '{"Vetement171":{"Data":{"Torso1":221,"Sexe":1,"Torso2":20,"ID":174,"Type":"Haut"},"Montant":1},"Vetement257":{"Data":{"Type":"T-Shirt","Sexe":1,"Tshirt2":0,"ID":1,"Tshirt1":15},"Montant":1},"Vetement403":{"Data":{"Pants2":13,"Sexe":1,"Pants1":97,"Type":"Pantalon"},"Montant":1},"chargeur":{"Montant":20.0},"Vetement97":{"Data":{"Shoes1":8,"Sexe":1,"Shoes2":0,"Type":"Chaussure"},"Montant":1},"Vetement881":{"Data":{"Torso1":216,"Sexe":1,"Torso2":2,"ID":75,"Type":"Haut"},"Montant":1}}', '[{"Data":{"HashID":931623,"Munition":0},"ID":"WEAPON_REVOLVER"}]', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000010d3b2ffa', 'Brandon', 'Yusgur', 'owner', 'aucun', 1, NULL, 'false', 649, 0, 0, 174, '{"soif":20,"faim":29.0}', '{"z":29.497020721435548,"y":-1342.1368408203126,"x":25.355436325073243}', 20, 20, NULL, 187, '3 Mars 1998', 'Homme', '{"VariationTorso2Color":0,"VariationPants":1,"AgeingOpacity":1.0,"VariationGlovesColor":0,"Hat2":0,"Torso2":0,"SkinAspectOpacity":1.0,"VariationShoes":2,"BeardColor":0,"Makeup":-1,"Tshirt1":15,"FrecklesOpacity":1.0,"VariationBeard":3,"NoseWidth":0.0,"ForeheadWidth":0.0,"CheekbonesWidth":0.0,"SkinAspect":-1,"EyesColor":-1,"ShapeMix":0.8,"ChinShape":0.0,"Hat1":-1,"LipsWidth":0.0,"VariationTorso2":0,"HairColor2":0,"BeardColor2":0,"Blemishes":-1,"HairColor":0,"EyebrowsColor2":0,"EyebrowsColor":0,"NoseHeight":0.0,"BeardOpacity":1.0,"Complexion":-1,"MidNoseHeight":0.0,"Eyebrows":-1,"JawHeight":0.0,"VariationShoesColor":0,"TipNoseHeight":0.0,"Lipstick":-1,"BlemishesOpacity":1.0,"ForeheadHeight":0.0,"VariationMisc2":0,"Ageing":-1,"LipstickColor2":0,"Arms1":15,"LipstickOpacity":1.0,"JawWidth":0.0,"Sexe":1,"PedUsed":"u_m_y_hippie_01","Shoes1":34,"TipNoseBreak":0.0,"VariationTorsoColor":0,"ChinWidth":0.0,"MakeupColor":0,"VariationHair":1,"EyebrowsOpacity":1.0,"EyesSize":0.0,"MidNoseWidth":0.0,"VariationMisc3":1,"VariationPantsColor":0,"Pants2":0,"ChinHeight":0.0,"Pere":4,"Arms2":0,"Glasse1":-1,"Hair":0,"VariationHead":0,"UsePed":true,"Shoes2":0,"Pants1":21,"MakeupOpacity":1.0,"VariationGloves":1,"Freckles":-1,"ChinPosition":0.0,"Mere":4,"Beard":-1,"ComplexionOpacity":1.0,"Glasse2":0,"Torso1":15,"LipstickColor":0,"Tshirt2":0,"MakeupColor2":0,"CheekbonesHeight":0.0,"VariationTorso":0,"SkinMix":0.0,"VariationMisc1":0}', '{"Telephone466":{"Data":{"Num":7047973},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000013b243b61', 'DaWaxx', 'Jean', 'owner', 'aucun', 1, NULL, 'false', 33, 0, 0, 190, '{"faim":-0.4,"soif":0}', '{"x":623.4073486328125,"y":-1027.8515625,"z":9.68956470489502}', 20, 20, NULL, 198, '1 Février  1997', 'Homme', '{"NoseHeight":0.0,"LipstickOpacity":1.0,"VariationGlovesColor":0,"MakeupOpacity":1.0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Sexe":1,"FrecklesOpacity":1.0,"Torso1":5,"LipstickColor":0,"EyesColor":-1,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"Torso2":2,"Pants1":6,"VariationTorsoColor":0,"Pere":6,"Arms2":0,"Shoes1":34,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.8,"Eyebrows":2,"VariationMisc2":0,"JawWidth":0.0,"Arms1":5,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.2,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"VariationTorso2":0,"Tshirt2":0,"HairColor2":0,"ChinShape":0.0,"Glasse2":0,"VariationPants":0,"EyebrowsColor2":0,"VariationGloves":0,"CheekbonesHeight":0.0,"VariationTorso2Color":0,"EyesSize":0.0,"Mere":15,"EyebrowsOpacity":1.0,"Beard":3,"ChinWidth":0.0,"CheekbonesWidth":0.0,"HairColor":0,"NoseWidth":0.0,"BeardColor2":0,"VariationHair":0,"UsePed":false,"Freckles":-1,"VariationMisc3":0,"Lipstick":-1,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"Tshirt1":15,"TipNoseBreak":0.0,"VariationMisc1":0,"EyebrowsColor":0,"Hair":31,"MakeupColor":0,"AgeingOpacity":1.0,"ShapeMix":1.0,"SkinAspectOpacity":1.0}', '{"Telephone762":{"Data":{"Num":8851654},"Montant":1},"Vetement111":{"Data":{"Pants2":0,"Sexe":1,"Pants1":6,"Type":"Pantalon"},"Montant":1},"chargeur":{"Montant":10.0},"Vetement739":{"Data":{"Torso1":5,"Sexe":1,"Torso2":2,"ID":58,"Type":"Haut"},"Montant":1},"cereales":{"Montant":1.0}}', '[{"ID":"WEAPON_PISTOL","Data":{"HashID":3753506,"Munition":0}},{"Data":{"HashID":2320309,"Munition":0},"ID":"WEAPON_CROWBAR"},{"Data":{"HashID":3733079,"Munition":0},"ID":"WEAPON_GOLFCLUB"},{"Data":{"HashID":5463220,"Munition":0},"ID":"WEAPON_BAT"}]', 'false', 'false', 'false', 'false', 'false'),
	('steam:11000011ac90602', 'Jim', 'Brown', 'owner', 'mineur', 1, NULL, 'false', 2314, 0, 0, 0, '{"soif":84,"faim":87.4}', '{"z":29.872793197631837,"y":-1059.1248779296876,"x":-90.04840087890625}', 20, 20, NULL, 140, '28 Novembre 2003', 'Homme', '{"NoseHeight":0.0,"LipstickOpacity":1.0,"EyebrowsColor":0,"EyebrowsColor2":0,"Glasse1":-1,"VariationTorso":0,"Pants2":2,"Tshirt1":15,"VariationTorso2Color":0,"Torso1":86,"LipstickColor":0,"EyesColor":-1,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Mere":21,"VariationTorsoColor":0,"Pere":4,"Arms2":0,"Shoes1":1,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":-1,"Freckles":-1,"JawWidth":0.0,"Arms1":8,"MakeupColor2":0,"LipstickColor2":0,"ForeheadHeight":0.0,"LipsWidth":0.0,"SkinMix":0.15,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"Tshirt2":0,"HairColor":0,"VariationMisc1":0,"VariationPants":0,"Hair":11,"VariationGlovesColor":0,"VariationHair":0,"VariationGloves":0,"CheekbonesHeight":0.0,"Torso2":0,"EyesSize":0.0,"UsePed":false,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"Pants1":0,"HairColor2":0,"NoseWidth":0.0,"Sexe":1,"ShapeMix":0.8,"VariationMisc2":0,"CheekbonesWidth":0.0,"Lipstick":-1,"BeardColor2":0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"MakeupOpacity":1.0,"TipNoseBreak":0.0,"VariationMisc3":0,"FrecklesOpacity":1.0,"ChinShape":0.0,"MakeupColor":0,"Glasse2":0,"AgeingOpacity":1.0,"SkinAspectOpacity":1.0}', '{"ffer":{"Montant":-5},"Vetement486":{"Montant":1,"Data":{"Torso2":0,"Type":"Haut","Sexe":1,"Torso1":86,"ID":147}},"Telephone568":{"Montant":1,"Data":{"Num":5916656}},"pdiamant":{"Montant":0},"eau":{"Montant":7},"for":{"Montant":-6},"Vetement416":{"Montant":1,"Data":{"Shoes1":1,"Shoes2":0,"Sexe":1,"Type":"Chaussure"}},"Vetement417":{"Montant":1,"Data":{"Pants2":2,"Sexe":1,"Pants1":0,"Type":"Pantalon"}},"chargeur":{"Montant":20.0},"pierre":{"Montant":-5},"pain":{"Montant":4},"Vetement448":{"Montant":1,"Data":{"Torso2":1,"Type":"Haut","Sexe":1,"Torso1":182,"ID":165}}}', '[{"Data":{"HashID":6801907,"Munition":41},"ID":"WEAPON_PISTOL"}]', 'false', 'false', 'false', 'false', 'false'),
	('steam:1100001085fe617', 'John', 'Clifford', 'owner', 'aucun', 1, NULL, 'false', 28, 0, 0, 175, '{"faim":22.7,"soif":11}', '{"x":117.03730010986328,"y":-778.3011474609375,"z":31.398788452148439}', 20, 20, NULL, 183, '14 Août  2000', 'Homme', '{"NoseHeight":0.0,"CheekbonesWidth":0.0,"EyebrowsColor":0,"EyebrowsColor2":0,"Glasse1":-1,"VariationTorso":0,"Pants2":0,"Tshirt1":0,"VariationTorso2Color":0,"Torso1":3,"LipstickColor":0,"EyesColor":-1,"BeardColor":0,"TipNoseHeight":0.0,"Complexion":-1,"VariationShoesColor":0,"Ageing":-1,"VariationBeard":0,"VariationPantsColor":0,"BlemishesOpacity":1.0,"SkinAspect":-1,"Hat1":-1,"VariationHead":0,"VariationTorso2":0,"Pants1":21,"VariationTorsoColor":0,"Pere":14,"Arms2":0,"AgeingOpacity":1.0,"VariationShoes":0,"Makeup":-1,"ForeheadWidth":0.0,"Eyebrows":-1,"VariationMisc2":0,"JawWidth":0.0,"Arms1":1,"MakeupColor2":0,"LipstickColor2":0,"Lipstick":-1,"LipsWidth":0.0,"SkinMix":0.0,"MidNoseWidth":0.0,"Blemishes":-1,"Shoes2":0,"ChinPosition":0.0,"ChinHeight":0.0,"MidNoseHeight":0.0,"Hat2":0,"Freckles":-1,"HairColor":0,"Torso2":0,"ChinShape":0.0,"Hair":0,"TipNoseBreak":0.0,"HairColor2":0,"VariationGloves":0,"CheekbonesHeight":0.0,"VariationPants":0,"EyesSize":0.0,"Mere":15,"EyebrowsOpacity":1.0,"Beard":-1,"ChinWidth":0.0,"VariationHair":0,"LipstickOpacity":1.0,"NoseWidth":0.0,"BeardColor2":0,"ShapeMix":1.0,"MakeupOpacity":1.0,"VariationMisc3":0,"ForeheadHeight":0.0,"FrecklesOpacity":1.0,"JawHeight":0.0,"ComplexionOpacity":1.0,"BeardOpacity":1.0,"VariationGlovesColor":0,"UsePed":false,"VariationMisc1":0,"Glasse2":0,"Tshirt2":0,"MakeupColor":0,"Sexe":1,"Shoes1":34,"SkinAspectOpacity":1.0}', '{"Telephone4":{"Data":{"Num":4417297},"Montant":1},"Vetement382":{"Data":{"Torso2":0,"Type":"Haut","Sexe":1,"Torso1":3,"ID":2},"Montant":1}}', '{}', 'false', 'false', 'false', 'false', 'false');
/*!40000 ALTER TABLE `playerinfo` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. postop
CREATE TABLE IF NOT EXISTS `postop` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Item` text NOT NULL,
  `Nombre` int(11) NOT NULL DEFAULT '0',
  `Entreprise` text NOT NULL,
  `IsAccepted` text,
  `Temps` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.postop : 1 rows
/*!40000 ALTER TABLE `postop` DISABLE KEYS */;
INSERT INTO `postop` (`ID`, `Item`, `Nombre`, `Entreprise`, `IsAccepted`, `Temps`) VALUES
	(1, 'moteur', 5, 'caca', NULL, 1);
/*!40000 ALTER TABLE `postop` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. properties
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.properties : 42 rows
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{"y":564.89,"z":182.959,"x":119.384}', '{"x":117.347,"y":559.506,"z":183.304}', '{"y":557.032,"z":183.301,"x":118.037}', '{"y":567.798,"z":182.131,"x":119.249}', '[]', NULL, 1, 1, 0, '{"x":118.748,"y":566.573,"z":175.697}', 1500000),
	(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{"x":372.796,"y":428.327,"z":144.685}', '{"x":373.548,"y":422.982,"z":144.907},', '{"y":420.075,"z":145.904,"x":372.161}', '{"x":372.454,"y":432.886,"z":143.443}', '[]', NULL, 1, 1, 0, '{"x":377.349,"y":429.422,"z":137.3}', 1500000),
	(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{"y":-379.165,"z":37.961,"x":-936.363}', '{"y":-365.476,"z":113.274,"x":-913.097}', '{"y":-367.637,"z":113.274,"x":-918.022}', '{"y":-382.023,"z":37.961,"x":-943.626}', '[]', NULL, 1, 1, 0, '{"x":-927.554,"y":-377.744,"z":112.674}', 1700000),
	(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{"y":440.8,"z":146.702,"x":346.964}', '{"y":437.456,"z":148.394,"x":341.683}', '{"y":435.626,"z":148.394,"x":339.595}', '{"x":350.535,"y":443.329,"z":145.764}', '[]', NULL, 1, 1, 0, '{"x":337.726,"y":436.985,"z":140.77}', 1500000),
	(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{"y":502.696,"z":136.421,"x":-176.003}', '{"y":497.817,"z":136.653,"x":-174.349}', '{"y":495.069,"z":136.666,"x":-173.331}', '{"y":506.412,"z":135.0664,"x":-177.927}', '[]', NULL, 1, 1, 0, '{"x":-174.725,"y":493.095,"z":129.043}', 1500000),
	(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{"y":596.58,"z":142.641,"x":-686.554}', '{"y":591.988,"z":144.392,"x":-681.728}', '{"y":590.608,"z":144.392,"x":-680.124}', '{"y":599.019,"z":142.059,"x":-689.492}', '[]', NULL, 1, 1, 0, '{"x":-680.46,"y":588.6,"z":136.769}', 1500000),
	(7, 'LowEndApartment', 'Appartement de base', '{"y":-1078.735,"z":28.4031,"x":292.528}', '{"y":-1007.152,"z":-102.002,"x":265.845}', '{"y":-1002.802,"z":-100.008,"x":265.307}', '{"y":-1078.669,"z":28.401,"x":296.738}', '[]', NULL, 1, 1, 0, '{"x":265.916,"y":-999.38,"z":-100.008}', 562500),
	(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{"y":454.955,"z":96.462,"x":-1294.433}', '{"x":-1289.917,"y":449.541,"z":96.902}', '{"y":446.322,"z":96.899,"x":-1289.642}', '{"y":455.453,"z":96.517,"x":-1298.851}', '[]', NULL, 1, 1, 0, '{"x":-1287.306,"y":455.901,"z":89.294}', 1500000),
	(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{"x":-853.346,"y":696.678,"z":147.782}', '{"y":690.875,"z":151.86,"x":-859.961}', '{"y":688.361,"z":151.857,"x":-859.395}', '{"y":701.628,"z":147.773,"x":-855.007}', '[]', NULL, 1, 1, 0, '{"x":-858.543,"y":697.514,"z":144.253}', 1500000),
	(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{"y":620.494,"z":141.588,"x":-752.82}', '{"y":618.62,"z":143.153,"x":-759.317}', '{"y":617.629,"z":143.153,"x":-760.789}', '{"y":621.281,"z":141.254,"x":-750.919}', '[]', NULL, 1, 1, 0, '{"x":-762.504,"y":618.992,"z":135.53}', 1500000),
	(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{"y":37.025,"z":42.58,"x":-618.299}', '{"y":58.898,"z":97.2,"x":-603.301}', '{"y":58.941,"z":97.2,"x":-608.741}', '{"y":30.603,"z":42.524,"x":-620.017}', '[]', NULL, 1, 1, 0, '{"x":-622.173,"y":54.585,"z":96.599}', 1700000),
	(12, 'MiltonDrive', 'Milton Drive', '{"x":-775.17,"y":312.01,"z":84.658}', NULL, NULL, '{"x":-775.346,"y":306.776,"z":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
	(13, 'Modern1Apartment', 'Appartement Moderne 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_01_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.661,"y":327.672,"z":210.396}', 1300000),
	(14, 'Modern2Apartment', 'Appartement Moderne 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_01_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.735,"y":326.757,"z":186.313}', 1300000),
	(15, 'Modern3Apartment', 'Appartement Moderne 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_01_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.386,"y":330.782,"z":195.08}', 1300000),
	(16, 'Mody1Apartment', 'Appartement Mode 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_02_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.615,"y":327.878,"z":210.396}', 1300000),
	(17, 'Mody2Apartment', 'Appartement Mode 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_02_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.297,"y":327.092,"z":186.313}', 1300000),
	(18, 'Mody3Apartment', 'Appartement Mode 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_02_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.303,"y":330.932,"z":195.085}', 1300000),
	(19, 'Vibrant1Apartment', 'Appartement Vibrant 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_03_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.885,"y":327.641,"z":210.396}', 1300000),
	(20, 'Vibrant2Apartment', 'Appartement Vibrant 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_03_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.607,"y":327.344,"z":186.313}', 1300000),
	(21, 'Vibrant3Apartment', 'Appartement Vibrant 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_03_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.525,"y":330.851,"z":195.085}', 1300000),
	(22, 'Sharp1Apartment', 'Appartement Persan 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_04_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.527,"y":327.89,"z":210.396}', 1300000),
	(23, 'Sharp2Apartment', 'Appartement Persan 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_04_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.642,"y":326.497,"z":186.313}', 1300000),
	(24, 'Sharp3Apartment', 'Appartement Persan 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_04_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.503,"y":331.318,"z":195.085}', 1300000),
	(25, 'Monochrome1Apartment', 'Appartement Monochrome 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_05_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.289,"y":328.086,"z":210.396}', 1300000),
	(26, 'Monochrome2Apartment', 'Appartement Monochrome 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_05_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.692,"y":326.762,"z":186.313}', 1300000),
	(27, 'Monochrome3Apartment', 'Appartement Monochrome 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_05_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.094,"y":330.976,"z":195.085}', 1300000),
	(28, 'Seductive1Apartment', 'Appartement Séduisant 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_06_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.263,"y":328.104,"z":210.396}', 1300000),
	(29, 'Seductive2Apartment', 'Appartement Séduisant 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_06_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.655,"y":326.611,"z":186.313}', 1300000),
	(30, 'Seductive3Apartment', 'Appartement Séduisant 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_06_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.3,"y":331.414,"z":195.085}', 1300000),
	(31, 'Regal1Apartment', 'Appartement Régal 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_07_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.956,"y":328.257,"z":210.396}', 1300000),
	(32, 'Regal2Apartment', 'Appartement Régal 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_07_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.545,"y":326.659,"z":186.313}', 1300000),
	(33, 'Regal3Apartment', 'Appartement Régal 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_07_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.087,"y":331.429,"z":195.123}', 1300000),
	(34, 'Aqua1Apartment', 'Appartement Aqua 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_08_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.187,"y":328.47,"z":210.396}', 1300000),
	(35, 'Aqua2Apartment', 'Appartement Aqua 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_08_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.658,"y":326.563,"z":186.313}', 1300000),
	(36, 'Aqua3Apartment', 'Appartement Aqua 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_08_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.287,"y":331.084,"z":195.086}', 1300000),
	(37, 'IntegrityWay', '4 Integrity Way', '{"x":-47.804,"y":-585.867,"z":36.956}', NULL, NULL, '{"x":-54.178,"y":-583.762,"z":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
	(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{"x":-31.409,"y":-594.927,"z":79.03}', '{"x":-26.098,"y":-596.909,"z":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-11.923,"y":-597.083,"z":78.43}', 1700000),
	(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{"x":-17.702,"y":-588.524,"z":89.114}', '{"x":-16.21,"y":-582.569,"z":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-26.327,"y":-588.384,"z":89.123}', 1700000),
	(40, 'DellPerroHeights', 'Dell Perro Heights', '{"x":-1447.06,"y":-538.28,"z":33.74}', NULL, NULL, '{"x":-1440.022,"y":-548.696,"z":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
	(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{"x":-1452.125,"y":-540.591,"z":73.044}', '{"x":-1455.435,"y":-535.79,"z":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1467.058,"y":-527.571,"z":72.443}', 1700000),
	(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{"x":-1451.562,"y":-523.535,"z":55.928}', '{"x":-1456.02,"y":-519.209,"z":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1457.026,"y":-530.219,"z":55.937}', 1700000);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;

-- Listage de la structure de la table initialvfx. whitelist
CREATE TABLE IF NOT EXISTS `whitelist` (
  `SteamID` text NOT NULL,
  `Nom` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Listage des données de la table initialvfx.whitelist : 127 rows
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
INSERT INTO `whitelist` (`SteamID`, `Nom`) VALUES
	('steam:1100001085fe617', 'Flyz'),
	('steam:1100001106c4bc0', 'DreamyRD'),
	('steam:11000013b243b61', 'DaWaxx'),
	('steam:11000011692978c', 'Bardia le clin\'s'),
	('steam:11000010d3b2ffa', 'Flozii'),
	('steam:11000013C98A98C', 'Wassim'),
	('steam:11000011ac90602', 'Hecate'),
	('steam:11000013d04a1be ', 'Luna'),
	('steam:11000010b9a3705', 'PuR Lisk4'),
	('steam:11000011ab37cd1', 'Maman Gaming'),
	('steam:110000115fba5e6', 'BeChocoo'),
	('steam:11000010a6e0214', 'Maxou l\'ems'),
	('steam:1100001005b0bb5', 'Kiba'),
	('steam:11000011b551c22', 'l\'éponge'),
	('steam:11000014126894da', 'Niro'),
	('steam:11000014288e186a', '2spii'),
	('steam:11000011387682e', NULL),
	('steam:110000114b6ed5e', NULL),
	('steam:11000013cb07679', NULL),
	('steam:110000117c87d0b', NULL),
	('steam:110000117cc7baf', NULL),
	('steam:11000011aeca15a', NULL),
	('steam:11000013d09c2b6', NULL),
	('steam:11000011958d3a3', NULL),
	('steam:110000101c4bca9', NULL),
	('steam:11000013cd73339', NULL),
	('steam:110000131e700e0', NULL),
	('steam:110000118884a71', NULL),
	('steam:11000010a0c3c2b', NULL),
	('steam:110000141636c38', NULL),
	('steam:110000109cfe178', NULL),
	('steam:11000011b2dfb83', NULL),
	('steam:110000116c62795', NULL),
	('steam:11000011932eb4e', NULL),
	('steam:110000134b9d82c', NULL),
	('steam:11000014126894d', NULL),
	('steam:1100001154655c3', NULL),
	('steam:11000011782361b', NULL),
	('steam:11000010b9a3705', NULL),
	('steam:11000013d4d018b', NULL),
	('steam:1100001401a0878', NULL),
	('steam:11000013e952c95', NULL),
	('steam:11000013d04a1be', NULL),
	('steam:11000010f3b1985', NULL),
	('steam:11000013f193f3d', NULL),
	('steam:11000010576a9e6', NULL),
	('steam:11000010e8a86f8', NULL),
	('steam:11000013eb361b6', NULL),
	('steam:11000010770c849', NULL),
	('steam:110000111e5f705', NULL),
	('steam:11000010ba935c4', NULL),
	('steam:110000142a38970', NULL),
	('steam:11000013208d9df', NULL),
	('steam:11000010ea934e8', NULL),
	('steam:11000011174cda8', NULL),
	('steam:11000010a6e0214', NULL),
	('steam:11000013fc251d0', NULL),
	('steam:110000140512b07', NULL),
	('steam:110000140a988b6', NULL),
	('steam:110000133702f39', NULL),
	('steam:110000103bcec3d', NULL),
	('steam:11000013422de8e', NULL),
	('steam:11000013752330b', NULL),
	('steam:110000134892018', NULL),
	('steam:11000011a6036eb', NULL),
	('steam:1100001417e12b9', NULL),
	('steam:110000134f1dc53', NULL),
	('steam:11000010e7565ee', NULL),
	('steam:1100001104cb61c', NULL),
	('steam:1100001364976d4', NULL),
	('steam:110000102481d53', NULL),
	('steam:1100001408143d1', NULL),
	('steam:11000010e7f3273\r\n', NULL),
	('steam:110000140179ffa', NULL),
	('steam:110000112cd9140', NULL),
	('steam:110000115f11416', NULL),
	('steam:11000011958d3a3', NULL),
	('steam: 110000137fc4b95', NULL),
	('steam:11000010891bf3c', NULL),
	('steam:11000013e120cdb', NULL),
	('steam:1100001324C1813', NULL),
	('steam:1100001188b2196', NULL),
	('steam:11000011a2aca3c', NULL),
	('steam:110000118c55903', NULL),
	('steam:11000011ab37cd1', NULL),
	('steam:110000112952914', NULL),
	('steam:110000141ab2cf4', NULL),
	('steam:1100001059b2eb2', NULL),
	('steam:11000013ce05668', NULL),
	('steam:11000013e6405a8', NULL),
	('steam:110000112952914', NULL),
	('steam:11000013d8fd987', NULL),
	('steam:110000109806c60', NULL),
	('steam:1100001333d35a2', NULL),
	('steam:11000013c18efa7', NULL),
	('steam:11000011482a2e3', NULL),
	('steam:1100001161b4df2', NULL),
	('steam:11000010f0655eb', NULL),
	('steam 110000117c87d0b', NULL),
	('steam:11000011b07ed6f', NULL),
	('steam:11000010e7f3273', NULL),
	('steam:110000109cf66c6', NULL),
	('steam:110000142a22c3f', NULL),
	('steam:11000013daff4bdg', NULL),
	('steam:110000142a22c3f', NULL),
	('steam:11000010f26cdf1', NULL),
	('steam:11000013fc251d0', NULL),
	('steam: 11000013658f94d', NULL),
	('steam:110000140179ffa', NULL),
	('steam:1100001141fa57a', NULL),
	('steam:110000137fc4b95', NULL),
	('steam:11000014288e186', NULL),
	('steam:110000118dcae45', NULL),
	('steam:1100001351d5c5b', NULL),
	('steam:11000011654d1e1', NULL),
	('steam:1100001420bdae4', NULL),
	('steam:110000117244b87', NULL),
	('steam:1100001141fa57a', NULL),
	('steam:11000010ddeea65', NULL),
	('steam:11000013daff4bd', NULL),
	('steam:110000137fc4b95\r\n', NULL),
	('steam:110000109087d61', NULL),
	('steam:11000014288e186', NULL),
	('steam:11000013e07cf4d', NULL),
	('steam:11000013fc251d0', NULL),
	('steam:11000011654d1e1', NULL),
	('steam:110000111bb04d5', NULL);
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
