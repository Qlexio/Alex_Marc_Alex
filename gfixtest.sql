-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 08 Février 2022 à 14:05
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
(1, 'contenttypes', '0001_initial', '2022-02-07 10:06:20.695094'),
(2, 'auth', '0001_initial', '2022-02-07 10:06:29.095865'),
(3, 'admin', '0001_initial', '2022-02-07 10:06:31.348509'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-02-07 10:06:31.385673'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-02-07 10:06:31.433272'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-02-07 10:06:32.433905'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-02-07 10:06:33.138403'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-02-07 10:06:33.828199'),
(9, 'auth', '0004_alter_user_username_opts', '2022-02-07 10:06:33.880230'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-02-07 10:06:34.409901'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-02-07 10:06:34.471202'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-02-07 10:06:34.517162'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-02-07 10:06:35.164608'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-02-07 10:06:35.918161'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-02-07 10:06:36.628842'),
(16, 'auth', '0011_update_proxy_permissions', '2022-02-07 10:06:36.709027'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-02-07 10:06:37.465365'),
(18, 'polls', '0001_initial', '2022-02-07 10:06:37.763993'),
(19, 'polls', '0002_remove_articles_article_articles_diametre_corps_and_more', '2022-02-07 10:06:40.455503');

-- --------------------------------------------------------

--
-- Structure de la table `liste_produit`
--

CREATE TABLE IF NOT EXISTS `liste_produit` (
  `idListe` varchar(5) NOT NULL,
  `idReference` varchar(5) NOT NULL,
  `idType` varchar(5) NOT NULL,
  `idLongueurCorps` varchar(5) NOT NULL,
  `idDiametreCorps` varchar(5) NOT NULL,
  PRIMARY KEY (`idListe`),
  KEY `liste_produit_reference_FK` (`idReference`),
  KEY `liste_produit_type_reference0_FK` (`idType`),
  KEY `liste_produit_longueur_corps1_FK` (`idLongueurCorps`),
  KEY `liste_produit_diametre_corps2_FK` (`idDiametreCorps`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `liste_produit`
--

INSERT INTO `liste_produit` (`idListe`, `idReference`, `idType`, `idLongueurCorps`, `idDiametreCorps`) VALUES
('1', '1', '1', '2', '1'),
('10', '1', '1', '1', '4'),
('11', '1', '2', '1', '1'),
('12', '1', '2', '2', '2'),
('13', '1', '2', '2', '3'),
('2', '1', '1', '4', '1'),
('3', '1', '1', '5', '1'),
('4', '1', '1', '1', '2'),
('5', '1', '1', '2', '2'),
('6', '1', '1', '5', '2'),
('7', '1', '1', '1', '3'),
('8', '1', '1', '2', '3'),
('9', '1', '1', '4', '3');

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
('5', 20),
('6', 50);

-- --------------------------------------------------------

--
-- Structure de la table `matiere_corps`
--

CREATE TABLE IF NOT EXISTS `matiere_corps` (
  `idMatiereCorps` varchar(5) NOT NULL,
  `matiereCorps` char(5) NOT NULL,
  PRIMARY KEY (`idMatiereCorps`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `matiere_corps`
--

INSERT INTO `matiere_corps` (`idMatiereCorps`, `matiereCorps`) VALUES
('1', 'alumi'),
('2', 'acier');

-- --------------------------------------------------------

--
-- Structure de la table `matiere_tige`
--

CREATE TABLE IF NOT EXISTS `matiere_tige` (
  `idMatiereTige` varchar(5) NOT NULL,
  `matiereTige` char(50) NOT NULL,
  PRIMARY KEY (`idMatiereTige`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `matiere_tige`
--

INSERT INTO `matiere_tige` (`idMatiereTige`, `matiereTige`) VALUES
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
-- Structure de la table `reference`
--

CREATE TABLE IF NOT EXISTS `reference` (
  `idReference` varchar(5) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `idMatiereCorps` varchar(5) NOT NULL,
  `idMatiereTige` varchar(5) NOT NULL,
  PRIMARY KEY (`idReference`),
  KEY `reference_matiere_tige_FK` (`idMatiereTige`),
  KEY `reference_matiere_corps0_FK` (`idMatiereCorps`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `reference`
--

INSERT INTO `reference` (`idReference`, `libelle`, `idMatiereCorps`, `idMatiereTige`) VALUES
('1', 'rivet', '1', '2'),
('2', 'vice', '1', '2'),
('3', 'rivet', '2', '1'),
('4', 'vice', '2', '2');

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
-- Contraintes pour la table `liste_produit`
--
ALTER TABLE `liste_produit`
  ADD CONSTRAINT `liste_produit_diametre_corps2_FK` FOREIGN KEY (`idDiametreCorps`) REFERENCES `diametre_corps` (`idDiametreCorps`),
  ADD CONSTRAINT `liste_produit_longueur_corps1_FK` FOREIGN KEY (`idLongueurCorps`) REFERENCES `longueur_corps` (`idLongueurCorps`),
  ADD CONSTRAINT `liste_produit_reference_FK` FOREIGN KEY (`idReference`) REFERENCES `reference` (`idReference`),
  ADD CONSTRAINT `liste_produit_type_reference0_FK` FOREIGN KEY (`idType`) REFERENCES `type_reference` (`idType`);

--
-- Contraintes pour la table `reference`
--
ALTER TABLE `reference`
  ADD CONSTRAINT `reference_matiere_corps0_FK` FOREIGN KEY (`idMatiereCorps`) REFERENCES `matiere_corps` (`idMatiereCorps`),
  ADD CONSTRAINT `reference_matiere_tige_FK` FOREIGN KEY (`idMatiereTige`) REFERENCES `matiere_tige` (`idMatiereTige`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
