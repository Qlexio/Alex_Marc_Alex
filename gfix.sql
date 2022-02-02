-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 02 Février 2022 à 09:38
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `gfix`
--

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `idProduit` varchar(5) NOT NULL,
  `libelleProduit` char(50) NOT NULL,
  `diametreCorps` decimal(2,1) NOT NULL,
  `longueurCorps` int(3) NOT NULL,
  `idType` varchar(5) NOT NULL,
  PRIMARY KEY (`idProduit`),
  KEY `Produit_Type_FK` (`idType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`idProduit`, `libelleProduit`, `diametreCorps`, `longueurCorps`, `idType`) VALUES
('1', 'rivet', '3.2', 10, '1'),
('10', 'rivet', '6.0', 8, '1'),
('11', 'rivet', '6.0', 10, '1'),
('12', 'rivet', '6.0', 10, '1'),
('13', 'rivet', '3.2', 8, '2'),
('14', 'rivet', '3.2', 10, '2'),
('15', 'rivet', '3.2', 10, '2'),
('16', 'rivet', '4.0', 8, '2'),
('17', 'rivet', '4.0', 10, '2'),
('18', 'rivet', '4.0', 10, '2'),
('19', 'rivet', '4.8', 10, '2'),
('2', 'rivet', '3.2', 10, '1'),
('20', 'rivet', '4.8', 10, '2'),
('21', 'rivet', '4.8', 10, '2'),
('22', 'rivet', '6.0', 8, '2'),
('23', 'rivet', '6.0', 10, '2'),
('24', 'rivet', '6.0', 10, '2'),
('25', 'rivet', '3.2', 8, '3'),
('26', 'rivet', '3.2', 10, '3'),
('27', 'rivet', '3.2', 10, '3'),
('28', 'rivet', '4.0', 8, '3'),
('29', 'rivet', '4.0', 10, '3'),
('3', 'rivet', '3.2', 10, '1'),
('30', 'rivet', '4.0', 10, '3'),
('31', 'rivet', '4.8', 8, '3'),
('32', 'rivet', '4.8', 10, '3'),
('33', 'rivet', '4.8', 10, '3'),
('34', 'rivet', '6.0', 10, '3'),
('35', 'rivet', '6.0', 10, '3'),
('36', 'rivet', '6.0', 10, '3'),
('4', 'rivet', '4.0', 8, '1'),
('5', 'rivet', '4.0', 10, '1'),
('6', 'rivet', '4.0', 10, '1'),
('7', 'rivet', '4.8', 8, '1'),
('8', 'rivet', '4.8', 10, '1'),
('9', 'rivet', '4.8', 10, '1');

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `idType` varchar(5) NOT NULL,
  `libelleType` char(5) NOT NULL,
  PRIMARY KEY (`idType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `type`
--

INSERT INTO `type` (`idType`, `libelleType`) VALUES
('1', 'plat'),
('2', 'frais'),
('3', 'large'),
('4', 'extra');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `Produit_Type_FK` FOREIGN KEY (`idType`) REFERENCES `type` (`idType`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
