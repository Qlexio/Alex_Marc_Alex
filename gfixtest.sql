-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 16 Février 2022 à 17:02
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `gfixtest`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `diametre_corps`
--

CREATE TABLE IF NOT EXISTS `diametre_corps` (
  `idDiametreCorps` varchar(5) NOT NULL,
  `diametreCorps` float NOT NULL,
  PRIMARY KEY (`idDiametreCorps`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `diametre_corps`
--

INSERT INTO `diametre_corps` (`idDiametreCorps`, `diametreCorps`) VALUES
('1', 3.2),
('2', 4),
('3', 4.8),
('4', 6);

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Contenu de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-02-14 16:01:35.618277'),
(2, 'auth', '0001_initial', '2022-02-14 16:02:04.578908'),
(3, 'admin', '0001_initial', '2022-02-14 16:02:08.575627'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-02-14 16:02:08.653583'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-02-14 16:02:08.729155'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-02-14 16:02:19.679675'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-02-14 16:02:24.351019'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-02-14 16:02:30.021679'),
(9, 'auth', '0004_alter_user_username_opts', '2022-02-14 16:02:30.159949'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-02-14 16:02:33.115479'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-02-14 16:02:33.201447'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-02-14 16:02:33.239986'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-02-14 16:02:34.160734'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-02-14 16:02:35.568129'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-02-14 16:02:36.453334'),
(16, 'auth', '0011_update_proxy_permissions', '2022-02-14 16:02:36.535287'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-02-14 16:02:37.486885'),
(18, 'polls', '0001_initial', '2022-02-14 16:02:37.881438'),
(19, 'polls', '0002_remove_articles_article_articles_diametre_corps_and_more', '2022-02-14 16:02:40.723147');

-- --------------------------------------------------------

--
-- Structure de la table `longueur_corps`
--

CREATE TABLE IF NOT EXISTS `longueur_corps` (
  `idLongueurCorps` varchar(5) NOT NULL,
  `longueurCorps` float NOT NULL,
  PRIMARY KEY (`idLongueurCorps`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `longueur_corps`
--

INSERT INTO `longueur_corps` (`idLongueurCorps`, `longueurCorps`) VALUES
('1', 8),
('2', 10),
('3', 14),
('4', 16),
('5', 20);

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE IF NOT EXISTS `matiere` (
  `idMatiere` varchar(5) NOT NULL,
  `libelle` char(50) NOT NULL,
  PRIMARY KEY (`idMatiere`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `matiere`
--

INSERT INTO `matiere` (`idMatiere`, `libelle`) VALUES
('1', 'aluminium'),
('2', 'acier');

-- --------------------------------------------------------

--
-- Structure de la table `polls_articles`
--

CREATE TABLE IF NOT EXISTS `polls_articles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `diametre_corps` double NOT NULL,
  `longueur_corps` int(11) NOT NULL,
  `type_rivet` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ral`
--

CREATE TABLE IF NOT EXISTS `ral` (
  `idRal` varchar(5) NOT NULL,
  `idTeinte` varchar(5) NOT NULL,
  `numeroRal` int(11) NOT NULL,
  `code_hex` varchar(50) NOT NULL,
  PRIMARY KEY (`idRal`),
  KEY `Ral_Teinte_FK` (`idTeinte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ral`
--

INSERT INTO `ral` (`idRal`, `idTeinte`, `numeroRal`, `code_hex`) VALUES
('1', '2', 1000, '#cdba88'),
('10', '4', 3001, '	#9b2423'),
('11', '4', 3002, '	#9b2321'),
('12', '4', 3003, '	#861a22'),
('2', '2', 1001, '#d0b084'),
('3', '2', 1002, '#d2aa6d'),
('4', '2', 1003, '	#f9a800'),
('5', '3', 2000, '	#da6e00'),
('6', '3', 2001, '	#ba481b'),
('7', '3', 2002, '	#bf3922'),
('8', '3', 2003, '#f67828'),
('9', '4', 3000, '	#a72920');

-- --------------------------------------------------------

--
-- Structure de la table `rivet`
--

CREATE TABLE IF NOT EXISTS `rivet` (
  `idRivet` varchar(5) NOT NULL,
  `idMatiereCorps` varchar(5) NOT NULL,
  `idMatiereTige` varchar(5) NOT NULL,
  `idType` varchar(5) NOT NULL,
  `idDiametreCorps` varchar(5) NOT NULL,
  `idLongueurCorps` varchar(5) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix` float NOT NULL,
  PRIMARY KEY (`idRivet`),
  KEY `rivet_type_reference_FK` (`idType`),
  KEY `rivet_longueur_corps0_FK` (`idLongueurCorps`),
  KEY `rivet_diametre_corps1_FK` (`idDiametreCorps`),
  KEY `rivet_matiere2_FK` (`idMatiereCorps`),
  KEY `rivet_matiere3_FK` (`idMatiereTige`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `rivet`
--

INSERT INTO `rivet` (`idRivet`, `idMatiereCorps`, `idMatiereTige`, `idType`, `idDiametreCorps`, `idLongueurCorps`, `quantite`, `prix`) VALUES
('1', '1', '2', '1', '1', '2', 5, 0.02),
('10', '1', '2', '1', '4', '1', 5, 0.02),
('11', '1', '2', '2', '1', '1', 5, 0.02),
('12', '1', '2', '2', '2', '2', 50, 0.07),
('13', '1', '2', '2', '3', '2', 5, 0.02),
('2', '1', '2', '1', '1', '4', 100, 0.03),
('3', '1', '2', '1', '1', '5', 5, 0.02),
('4', '1', '2', '1', '2', '1', 5, 0.04),
('5', '1', '2', '1', '2', '2', 30, 0.02),
('6', '1', '2', '1', '2', '5', 5, 0.02),
('7', '1', '2', '1', '3', '1', 25, 0.02),
('8', '1', '2', '1', '3', '2', 10, 0.02),
('9', '1', '2', '1', '3', '4', 89, 0.05);

-- --------------------------------------------------------

--
-- Structure de la table `teinte`
--

CREATE TABLE IF NOT EXISTS `teinte` (
  `idTeinte` varchar(5) NOT NULL,
  `libelle` char(50) NOT NULL,
  PRIMARY KEY (`idTeinte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `teinte`
--

INSERT INTO `teinte` (`idTeinte`, `libelle`) VALUES
('1', 'aucune'),
('10', 'blanc et noir'),
('2', 'jaune'),
('3', 'orange'),
('4', 'rouge'),
('5', 'violet'),
('6', 'bleu'),
('7', 'vert'),
('8', 'gris'),
('9', 'brun');

-- --------------------------------------------------------

--
-- Structure de la table `type_reference`
--

CREATE TABLE IF NOT EXISTS `type_reference` (
  `idType` varchar(5) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`idType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `type_reference`
--

INSERT INTO `type_reference` (`idType`, `libelle`) VALUES
('1', 'plat'),
('2', 'fraisé'),
('3', 'large'),
('4', 'extra_large');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `ral`
--
ALTER TABLE `ral`
  ADD CONSTRAINT `Ral_Teinte_FK` FOREIGN KEY (`idTeinte`) REFERENCES `teinte` (`idTeinte`);

--
-- Contraintes pour la table `rivet`
--
ALTER TABLE `rivet`
  ADD CONSTRAINT `rivet_diametre_corps1_FK` FOREIGN KEY (`idDiametreCorps`) REFERENCES `diametre_corps` (`idDiametreCorps`),
  ADD CONSTRAINT `rivet_longueur_corps0_FK` FOREIGN KEY (`idLongueurCorps`) REFERENCES `longueur_corps` (`idLongueurCorps`),
  ADD CONSTRAINT `rivet_matiere2_FK` FOREIGN KEY (`idMatiereCorps`) REFERENCES `matiere` (`idMatiere`),
  ADD CONSTRAINT `rivet_matiere3_FK` FOREIGN KEY (`idMatiereTige`) REFERENCES `matiere` (`idMatiere`),
  ADD CONSTRAINT `rivet_type_reference_FK` FOREIGN KEY (`idType`) REFERENCES `type_reference` (`idType`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
