-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mer. 18 jan. 2023 à 22:52
-- Version du serveur : 5.7.39
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Projet Ubérisation`
--

-- --------------------------------------------------------

--
-- Structure de la table `Client`
--

CREATE TABLE `Client` (
  `idClient` int(11) NOT NULL,
  `nomClient` varchar(25) DEFAULT NULL,
  `prénomClientt` varchar(25) DEFAULT NULL,
  `adresseClient` text,
  `e-mailClient` text,
  `num_telClient` text,
  `num_Commande` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Client`
--

INSERT INTO `Client` (`idClient`, `nomClient`, `prénomClientt`, `adresseClient`, `e-mailClient`, `num_telClient`, `num_Commande`) VALUES
(12345670, 'Laiche', 'Ouassama', '2 avenue d\'Orgemont, Colombes', 'ousslaiche@gmail.com', '0654321298', 120),
(12345671, 'Belaidi', 'Souad', '3 rue de la liberté', 'souadbel@gmail.com', '0634329239', 121),
(12345672, 'Richard', 'Marie', '1 rue place de la république, Paris', 'marie13@hotmail.fr', '0754321298', 122),
(12345673, 'Sidali', 'Samir', '19 rue fontaine, Saint-Denis', 'sidalisam@gmai.com', '0734649212', 123),
(12345674, 'IDJERI', 'Masiine', '4 rue Villaret de joyeuse, Paris', 'massineidj@yahoo.fr', '0654721293', 126),
(12345675, 'Lu', 'Shan', '12 rue d\'Amsterdam', 'lushan@gmail.com', '0674521288', 125);

-- --------------------------------------------------------

--
-- Structure de la table `Commande`
--

CREATE TABLE `Commande` (
  `num_Commande` int(11) NOT NULL,
  `tarif` varchar(20) DEFAULT NULL,
  `trajet` text,
  `dateCommande` date DEFAULT NULL,
  `heureCommande` time DEFAULT NULL,
  `idClient` int(11) DEFAULT NULL,
  `idPrestation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Commande`
--

INSERT INTO `Commande` (`num_Commande`, `tarif`, `trajet`, `dateCommande`, `heureCommande`, `idClient`, `idPrestation`) VALUES
(120, '12€', '25-35min', '2023-01-12', '12:10:04', 12345670, 2354),
(121, '50€', '45-55min', '2023-01-12', '11:13:46', 12345671, 1234),
(122, '31€', '40-50min', '2023-01-12', '13:17:28', 12345673, 2145),
(123, '35€', '35-45min', '2023-01-12', '13:29:57', 12345672, 2178),
(124, '25€', '45-55min', '2023-01-12', '20:55:34', 12345670, 2178),
(125, '86€', '1h-1h30min', '2023-01-12', '17:58:00', 12345675, 2354),
(126, '15,99€', '20-40min', '2023-01-12', '18:01:13', 12345674, 1234);

-- --------------------------------------------------------

--
-- Structure de la table `Facturation`
--

CREATE TABLE `Facturation` (
  `numFacturation` int(11) NOT NULL,
  `num_Commande` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Facturation`
--

INSERT INTO `Facturation` (`numFacturation`, `num_Commande`) VALUES
(1001, 120),
(1002, 121),
(1003, 122),
(1004, 123),
(1006, 124),
(1007, 125),
(1008, 126);

-- --------------------------------------------------------

--
-- Structure de la table `Plateforme`
--

CREATE TABLE `Plateforme` (
  `idPlateforme` int(11) NOT NULL,
  `nomPlateforme` varchar(50) DEFAULT NULL,
  `site_webPlateforme` varchar(100) DEFAULT NULL,
  `catégoriePlateforme` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Plateforme`
--

INSERT INTO `Plateforme` (`idPlateforme`, `nomPlateforme`, `site_webPlateforme`, `catégoriePlateforme`) VALUES
(1, 'UberEat', 'https://www.ubereats.com/fr', 'Livraison_fastfood'),
(2, 'Jow', 'https://jow.fr/', 'Livraison_courses'),
(3, 'Deliveroo', 'https://deliveroo.fr/fr/', 'Livraison_fastfood'),
(4, 'DHL', 'https://www.dhl.com/fr-fr/home.html', 'Livraison_colis');

-- --------------------------------------------------------

--
-- Structure de la table `Prestataire`
--

CREATE TABLE `Prestataire` (
  `idPrestataire` int(11) NOT NULL,
  `nomPrestataire` varchar(20) DEFAULT NULL,
  `prénomPrestataire` varchar(20) DEFAULT NULL,
  `numPrestataire` text,
  `e-mailPrestataire` varchar(255) DEFAULT NULL,
  `adressePrestataire` text,
  `Véhicule` varchar(100) DEFAULT NULL,
  `idPlateforme` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Prestataire`
--

INSERT INTO `Prestataire` (`idPrestataire`, `nomPrestataire`, `prénomPrestataire`, `numPrestataire`, `e-mailPrestataire`, `adressePrestataire`, `Véhicule`, `idPlateforme`) VALUES
(1234, 'Pierre', 'Samuel', '0675436598', 'pierre_sam@gmail.com', 'Gennevilliers', 'MOTO', 1),
(2145, 'Salmi', 'Karim', '0682192345', 'salmi.karim@gmail.com', 'Paris', 'MOTO', 2),
(2178, 'Kadi', 'Islam', '0689191332', 'islam_kadi@hotmail.fr', 'Argenteuil', 'Voiture Kia Picanto', 4),
(2354, 'Chahbi', 'Idir', '0768991331', 'idirchahbi@gmail.com', 'Gennevilliers', 'MOTO', 3),
(3219, 'Saadi', 'Hocine', '0654231456', 'hocinesaadi@gmail.com', 'Saint lazar', 'MOTO', 1);

-- --------------------------------------------------------

--
-- Structure de la table `Prestation`
--

CREATE TABLE `Prestation` (
  `idPestation` int(11) NOT NULL,
  `nomPrestation` varchar(30) DEFAULT NULL,
  `num_Commande` int(11) DEFAULT NULL,
  `idPlateforme` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Prestation`
--

INSERT INTO `Prestation` (`idPestation`, `nomPrestation`, `num_Commande`, `idPlateforme`) VALUES
(1, 'Livraison de courses', 125, 2),
(2, 'Livraison de fastefood', 123, 1),
(3, 'Livraison de colis', 120, 4);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`idClient`),
  ADD KEY `num_Commande` (`num_Commande`) USING BTREE;

--
-- Index pour la table `Commande`
--
ALTER TABLE `Commande`
  ADD PRIMARY KEY (`num_Commande`),
  ADD KEY `Secondaire` (`idClient`) USING BTREE,
  ADD KEY `Secon` (`idPrestation`);

--
-- Index pour la table `Facturation`
--
ALTER TABLE `Facturation`
  ADD PRIMARY KEY (`numFacturation`),
  ADD KEY `Secondaire` (`num_Commande`) USING BTREE;

--
-- Index pour la table `Plateforme`
--
ALTER TABLE `Plateforme`
  ADD PRIMARY KEY (`idPlateforme`) USING BTREE;

--
-- Index pour la table `Prestataire`
--
ALTER TABLE `Prestataire`
  ADD PRIMARY KEY (`idPrestataire`) USING BTREE,
  ADD KEY `Secondaire` (`idPlateforme`) USING BTREE;

--
-- Index pour la table `Prestation`
--
ALTER TABLE `Prestation`
  ADD PRIMARY KEY (`idPestation`),
  ADD KEY `Secon` (`idPlateforme`),
  ADD KEY `Secondaire` (`num_Commande`) USING BTREE;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Client`
--
ALTER TABLE `Client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `Commande` (`num_Commande`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `Facturation`
--
ALTER TABLE `Facturation`
  ADD CONSTRAINT `facturation_ibfk_1` FOREIGN KEY (`numFacturation`) REFERENCES `Commande` (`num_Commande`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `Prestataire`
--
ALTER TABLE `Prestataire`
  ADD CONSTRAINT `prestataire_ibfk_1` FOREIGN KEY (`idPlateforme`) REFERENCES `Plateforme` (`idPlateforme`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `Prestation`
--
ALTER TABLE `Prestation`
  ADD CONSTRAINT `prestation_ibfk_1` FOREIGN KEY (`num_Commande`) REFERENCES `Commande` (`num_Commande`),
  ADD CONSTRAINT `prestation_ibfk_2` FOREIGN KEY (`idPlateforme`) REFERENCES `Plateforme` (`idPlateforme`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
