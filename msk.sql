
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE DATABASE IF NOT EXISTS `msk` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `msk`;

-- --------------------------------------------------------

--
-- Structure de la table `CATEGORIES`
--

DROP TABLE IF EXISTS `CATEGORIES`;
CREATE TABLE IF NOT EXISTS `CATEGORIES` (
  `ID_CATEGORIE` int NOT NULL AUTO_INCREMENT,
  `NOM` text NOT NULL,
  `DESCRIPTION_CAT` text,
  `ICONE` longblob,
  PRIMARY KEY (`ID_CATEGORIE`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `CATEGORIES`
--

INSERT INTO `CATEGORIES` (`ID_CATEGORIE`, `NOM`, `DESCRIPTION_CAT`, `ICONE`) VALUES
(8, 'Tapis', 'Tapis jay mn lhih', 0x2e2e2f2e2e2f75706c6f6164732f69636f6e65732f3636326534653966303838303774617069732e706e67),
(12, 'Sac a dos', 'Sac a dos fait a la main', 0x2e2e2f2e2e2f75706c6f6164732f69636f6e65732f363635383730373230626137657769636b65722d6261636b7061636b2d626167732d73616c6d616e2d6172746973616e616c2d3931323737382e77656270),
(3, 'Tajine', 'Découvrez notre sélection de tajines artisanaux, fabriqués à la main au Maroc. Chaque tajine est unique, conçu avec des matériaux de haute qualité, alliant esthétique traditionnelle et fonctionnalité. Parfaits pour cuisiner des plats marocains authentiques, nos tajines sont disponibles dans une variété de designs pour répondre à vos besoins culinaires. Ajoutez une touche d\'authenticité à votre cuisine avec nos tajines marocains.', 0x2e2e2f2e2e2f75706c6f6164732f69636f6e65732f3636343461623937376331653574616a696e652e706e67);

-- --------------------------------------------------------

--
-- Structure de la table `COMMANDES`
--

DROP TABLE IF EXISTS `COMMANDES`;
CREATE TABLE IF NOT EXISTS `COMMANDES` (
  `ID_COMMANDE` int NOT NULL AUTO_INCREMENT,
  `ID` int NOT NULL,
  `ID_PDT` int NOT NULL,
  `ADRESSE` text NOT NULL,
  `DATE_COMMANDE` date DEFAULT NULL,
  `TRACKING` text,
  `METHODE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Carte',
  PRIMARY KEY (`ID_COMMANDE`),
  KEY `FK_CONTENIR` (`ID_PDT`),
  KEY `FK_PASSER` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `COMMANDES`
--

INSERT INTO `COMMANDES` (`ID_COMMANDE`, `ID`, `ID_PDT`, `ADRESSE`, `DATE_COMMANDE`, `TRACKING`, `METHODE`) VALUES
(1, 3, 0, 'Oujda', '2024-05-11', 'q2Nk0h7jdj', ''),
(2, 3, 0, 'Oujda', '2024-05-11', 'lpzzZYpxBR', ''),
(7, 3, 0, 'Oujda', '2024-05-15', 'oaVQHKbkKW', ''),
(6, 3, 0, 'szdqzdzdzsd', '2024-05-11', 'm6bsEJpova', ''),
(8, 3, 0, 'Oujda', '2024-05-18', 'CNaYI6d86V', ''),
(16, 3, 0, 'kjygt', '2024-05-21', '1T20FisWkf', NULL),
(19, 3, 0, 'guhio', '2024-05-21', 'yaL5xlySHy', 'COD'),
(20, 3, 0, 'szdqzdzdzsd', '2024-05-21', 'TJtjLT7OFs', 'COD'),
(21, 3, 0, 'sdesz', '2024-05-21', 'LMrqRUZ3wP', 'COD'),
(22, 3, 0, 'cdecrv', '2024-05-21', 'Z1D5APbrbn', 'COD'),
(23, 3, 0, 'Oujdap', '2024-05-21', 'es2DgRAXC5', 'Carte'),
(24, 29, 0, 'Rabatp', '2024-05-21', 'SELXHIRyjb', 'COD'),
(25, 29, 0, 'dfghjklmlkjhgfdsdfghj', '2024-05-21', 'mL10vr3KyC', 'COD'),
(26, 29, 0, 'ks,o', '2024-05-21', 'UL4vCJcjPG', 'COD'),
(27, 18, 0, 'Rabat', '2024-05-23', 'mwTYhtw9Io', 'Carte'),
(28, 29, 0, 'Oujda final', '2024-05-24', 'KpUnMTyBiy', 'COD'),
(29, 1, 0, 'Oujda sidi yahya', '2024-05-30', 'eo2QxkKsSd', 'COD');

-- --------------------------------------------------------

--
-- Structure de la table `INCLURE`
--

DROP TABLE IF EXISTS `INCLURE`;
CREATE TABLE IF NOT EXISTS `INCLURE` (
  `ID_PDT` int NOT NULL,
  `ID_PANIER` int NOT NULL,
  PRIMARY KEY (`ID_PDT`,`ID_PANIER`),
  KEY `FK_INCLURE` (`ID_PANIER`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `INCLURE`
--

INSERT INTO `INCLURE` (`ID_PDT`, `ID_PANIER`) VALUES
(4, 20),
(4, 23),
(4, 24),
(4, 25),
(4, 26),
(4, 28),
(4, 30),
(4, 33),
(4, 34),
(5, 20),
(5, 21),
(5, 22),
(5, 29),
(5, 31),
(5, 39),
(8, 20),
(8, 22),
(8, 24),
(8, 26),
(8, 28),
(8, 31),
(8, 32),
(8, 33),
(8, 34),
(8, 35),
(8, 37),
(8, 38),
(8, 41),
(8, 42),
(8, 44),
(9, 26),
(9, 27),
(9, 28),
(9, 32),
(9, 42),
(14, 26),
(14, 29),
(14, 36),
(14, 40),
(14, 43),
(21, 44),
(21, 45);

-- --------------------------------------------------------

--
-- Structure de la table `PANIER`
--

DROP TABLE IF EXISTS `PANIER`;
CREATE TABLE IF NOT EXISTS `PANIER` (
  `ID_PANIER` int NOT NULL AUTO_INCREMENT,
  `ID` int NOT NULL,
  `QUANTITE` decimal(8,0) DEFAULT NULL,
  `DATE_CREE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PANIER`),
  KEY `FK_PANIER_UTILISATEURS` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `PANIER`
--

INSERT INTO `PANIER` (`ID_PANIER`, `ID`, `QUANTITE`, `DATE_CREE`) VALUES
(23, 3, '10493', '2024-05-18 13:29:05'),
(22, 3, '1593', '2024-05-15 13:16:26'),
(21, 3, '995', '2024-05-14 10:57:57'),
(20, 3, '4489', '2024-05-12 00:19:45'),
(24, 29, '3397', '2024-05-18 15:44:15'),
(25, 3, '2998', '2024-05-21 00:17:36'),
(26, 3, '6950', '2024-05-21 01:04:10'),
(27, 3, '2397', '2024-05-21 11:00:23'),
(28, 3, '2697', '2024-05-21 14:42:04'),
(29, 3, '228', '2024-05-21 14:47:59'),
(30, 3, '1499', '2024-05-21 14:49:02'),
(31, 3, '598', '2024-05-21 14:54:39'),
(32, 3, '1198', '2024-05-21 14:59:34'),
(33, 3, '1898', '2024-05-21 15:05:20'),
(34, 3, '1898', '2024-05-21 15:21:27'),
(35, 3, '399', '2024-05-21 15:22:56'),
(36, 3, '29', '2024-05-21 15:49:56'),
(37, 3, '1596', '2024-05-21 18:18:41'),
(38, 29, '1596', '2024-05-21 20:06:31'),
(39, 3, '796', '2024-05-21 20:24:52'),
(40, 29, '116', '2024-05-23 10:43:43'),
(41, 18, '399', '2024-05-23 10:46:21'),
(42, 29, '1198', '2024-05-24 01:42:56'),
(43, 1, '116', '2024-05-30 10:59:44'),
(44, 1, '759', '2024-05-30 13:31:32'),
(45, 1, '40', '2024-05-30 13:39:07');

-- --------------------------------------------------------

--
-- Structure de la table `PRODUITS`
--

DROP TABLE IF EXISTS `PRODUITS`;
CREATE TABLE IF NOT EXISTS `PRODUITS` (
  `ID_PDT` int NOT NULL AUTO_INCREMENT,
  `ID_CATEGORIE` int NOT NULL,
  `NOM_PDT` text,
  `DESCRIPTION_PDT` text,
  `PRIX_PDT` decimal(8,0) DEFAULT NULL,
  `IMAGE_PDT` longblob,
  `IMAGE2_PDT` longblob,
  `IMAGE3_PDT` longblob,
  `COOPERATIVE` text,
  PRIMARY KEY (`ID_PDT`),
  KEY `FK_PRODUITS_CATEGORIES` (`ID_CATEGORIE`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `PRODUITS`
--

INSERT INTO `PRODUITS` (`ID_PDT`, `ID_CATEGORIE`, `NOM_PDT`, `DESCRIPTION_PDT`, `PRIX_PDT`, `IMAGE_PDT`, `IMAGE2_PDT`, `IMAGE3_PDT`, `COOPERATIVE`) VALUES
(4, 8, 'tapis rouge', 'hjazbuj', '1499', 0x2e2e2f2e2e2f75706c6f6164732f70726f64756974732f363632653563653664313161337461706973206d726972742e706e67, '', '', 'Walo'),
(5, 3, 'tajine bleu', 'nsjqksocin', '199', 0x2e2e2f2e2e2f75706c6f6164732f70726f64756974732f3636326535383763346235636674616a696e65312e706e67, '', '', 'Walo'),
(8, 8, 'Tapis berbere', 'ghjklmlkjhgvcvbnj', '599', 0x2e2e2f2e2e2f75706c6f6164732f70726f64756974732f3636353164656466663333363654617069732042657262c3a87265204d61726f6361696e2e6a706567, 0x2e2e2f2e2e2f75706c6f6164732f70726f64756974732f3636353164656530303031356354617069732042657262c3a87265204d61726f6361696e2e6a706567, 0x2e2e2f2e2e2f75706c6f6164732f70726f64756974732f3636353164656530303066366354617069732042657262c3a87265204d61726f6361696e2e6a706567, 'Howa'),
(9, 8, 'zaxd', 'ousoisckgsiue_', '799', 0x2e2e2f2e2e2f75706c6f6164732f70726f64756974732f36363336643163386233373565746170697320322e706e67, '', '', 'Howa'),
(14, 8, 'Sac', 'sxdfgnuyt', '29', 0x2e2e2f2e2e2f75706c6f6164732f70726f64756974732f36363465343133396134656166626167332e706e67, 0x2e2e2f2e2e2f75706c6f6164732f70726f64756974732f36363465343133396135646661626167332d312e706e67, 0x2e2e2f2e2e2f75706c6f6164732f70726f64756974732f36363465343133396139353763626167332d322e706e67, 'Howa'),
(21, 12, 'Wicker backpack', 'The Selmane Artisanal wicker backpack is entirely handmade. This wicker backpack is a revisitation of the traditional art of basketry. The combination of materials and textures such as leather and wicker gives it a bohemian and contemporary spirit. The wicker backpack can be used as a fashion or decorative accessory.', '40', 0x2e2e2f2e2e2f75706c6f6164732f70726f64756974732f363635383731306230313337397769636b65722d6261636b7061636b2d626167732d73616c6d616e2d6172746973616e616c2d3931323737382e77656270, 0x2e2e2f2e2e2f75706c6f6164732f70726f64756974732f363635383731306230333065307769636b65722d6261636b7061636b2d626167732d73616c6d616e2d6172746973616e616c2d3436353133362e77656270, 0x2e2e2f2e2e2f75706c6f6164732f70726f64756974732f363635383731306230346132617769636b65722d6261636b7061636b2d626167732d73616c6d616e2d6172746973616e616c2d3931323737382e77656270, 'Selmane ');

-- --------------------------------------------------------

--
-- Structure de la table `TEMOIGNAGES`
--

DROP TABLE IF EXISTS `TEMOIGNAGES`;
CREATE TABLE IF NOT EXISTS `TEMOIGNAGES` (
  `ID_TEMOIGN` int NOT NULL AUTO_INCREMENT,
  `ID` int NOT NULL,
  `TEXT_TEMOIGN` text,
  `NOTE` decimal(1,0) DEFAULT NULL,
  PRIMARY KEY (`ID_TEMOIGN`),
  KEY `FK_TEMOIGNAGES_UTILISATEURS` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `TEMOIGNAGES`
--

INSERT INTO `TEMOIGNAGES` (`ID_TEMOIGN`, `ID`, `TEXT_TEMOIGN`, `NOTE`) VALUES
(1, 1, 'Jayed Jamil', '4'),
(2, 3, 'c\'est trop bien ce site', '5'),
(3, 1, 'Un Très Bon projet', '4'),
(4, 1, 'Je suis fier de ce projet ', '5'),
(5, 1, 'Bon mais nécessite un bon marketing', '3'),
(6, 1, 'J\'ai reçu mon produit avec un meilleur condition', '4'),
(7, 1, 'J\'ai pas aimer ', '2'),
(8, 1, 'Quelque chose qui ne va pas mais bon ', '4'),
(9, 1, 'J\'ai bien aimer l\'ajout du paiement enligne', '5');

-- --------------------------------------------------------

--
-- Structure de la table `UTILISATEURS`
--

DROP TABLE IF EXISTS `UTILISATEURS`;
CREATE TABLE IF NOT EXISTS `UTILISATEURS` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOM` text NOT NULL,
  `PRENOM` text NOT NULL,
  `EMAIL` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `MOT_DE_PASSE` text NOT NULL,
  `TELEPHONE` decimal(10,0) NOT NULL,
  `ROLE` enum('admin','client','cooperative') NOT NULL,
  `NOM_COOPERATIVE` text,
  `DATE_CREE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `EMAIL` (`EMAIL`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `UTILISATEURS`
--

INSERT INTO `UTILISATEURS` (`ID`, `NOM`, `PRENOM`, `EMAIL`, `MOT_DE_PASSE`, `TELEPHONE`, `ROLE`, `NOM_COOPERATIVE`, `DATE_CREE`) VALUES
(1, 'BELLAOUI', 'Oualid', 'bellaouioualid@gmail.com', 'oualid123', '651210227', 'admin', NULL, '2024-02-09 20:33:17'),
(3, 'user1', 'ml', 'user@gmail.com', 'user', '789123456', 'client', NULL, '2024-04-11 18:25:21'),
(18, 'Ahmed', 'Mohamed', 'nsqklj@gmail.com', '1234', '545789632', 'cooperative', 'Howa', '2024-05-07 01:27:39'),
(17, 'oualid', 'opi', 'lkjox@gmail.com', '3854836', '545789632', 'cooperative', 'mpok', '2024-05-06 22:50:10'),
(10, 'ghjkml', 'pourqquoi', 'nitsfg@gmail.com', '12369', '236548795', 'admin', NULL, '2024-04-28 14:39:28'),
(23, 'Ahmed', 'oskqp', 'louytew@gmail.com', '3.5486', '636548795', 'cooperative', 'Adre', '2024-05-07 02:12:53'),
(24, 'Abdelaziz', 'xsdzvg', 'nsqrmklj@gmail.com', 'dsvvd', '545789632', 'cooperative', 'yut', '2024-05-07 02:13:20'),
(30, 'ncdj', 'ieou', 'gtrc@gmail.com', '12547', '5845168684', 'client', NULL, NULL),
(25, 'Anas', 'Anas   ', 'anass@gmail.com', 'nbvcx', '545889632', 'cooperative', 'Walo', '2024-05-07 02:28:50'),
(26, 'Dizzy', 'Dross', 'msqmklj@gmail.com', 'edfght', '536542595', 'cooperative', 'Adre', '2024-05-07 02:29:24'),
(85, 'bellaoui', 'oualid', 'oualidbellaoui9@gmail.com', '1234', '612141519', 'client', NULL, '2024-05-30 13:24:33'),
(31, 'nom1', 'prenom1', 'email1@gmail.com', 'motdepasse1', '1234567890', 'client', NULL, NULL),
(32, 'nom2', 'prenom2', 'email2@gmail.com', 'motdepasse2', '1234567891', 'client', NULL, NULL),
(33, 'nom3', 'prenom3', 'email3@gmail.com', 'motdepasse3', '1234567892', 'client', NULL, NULL),
(34, 'nom4', 'prenom4', 'email4@gmail.com', 'motdepasse4', '1234567893', 'client', NULL, NULL),
(35, 'nom5', 'prenom5', 'email5@gmail.com', 'motdepasse5', '1234567894', 'client', NULL, NULL),
(36, 'nom6', 'prenom6', 'email6@gmail.com', 'motdepasse6', '1234567895', 'client', NULL, NULL),
(37, 'nom7', 'prenom7', 'email7@gmail.com', 'motdepasse7', '1234567896', 'client', NULL, NULL),
(38, 'nom8', 'prenom8', 'email8@gmail.com', 'motdepasse8', '1234567897', 'client', NULL, NULL),
(39, 'nom9', 'prenom9', 'email9@gmail.com', 'motdepasse9', '1234567898', 'client', NULL, NULL),
(40, 'nom10', 'prenom10', 'email10@gmail.com', 'motdepasse10', '1234567899', 'client', NULL, NULL),
(41, 'nom11', 'prenom11', 'email11@gmail.com', 'motdepasse11', '1234567800', 'client', NULL, NULL),
(42, 'nom12', 'prenom12', 'email12@gmail.com', 'motdepasse12', '1234567801', 'client', NULL, NULL),
(43, 'nom13', 'prenom13', 'email13@gmail.com', 'motdepasse13', '1234567802', 'client', NULL, NULL),
(44, 'nom14', 'prenom14', 'email14@gmail.com', 'motdepasse14', '1234567803', 'client', NULL, NULL),
(45, 'nom15', 'prenom15', 'email15@gmail.com', 'motdepasse15', '1234567804', 'client', NULL, NULL),
(46, 'nom16', 'prenom16', 'email16@gmail.com', 'motdepasse16', '1234567805', 'client', NULL, NULL),
(47, 'nom17', 'prenom17', 'email17@gmail.com', 'motdepasse17', '1234567806', 'client', NULL, NULL),
(86, 'Ahmed', 'Mohamed', 'realcoop@gmail.com', '1234', '645789523', 'cooperative', 'Selmane ', '2024-05-30 13:27:40');
COMMIT;
