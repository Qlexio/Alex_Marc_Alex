-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 02 Février 2022 à 17:56
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Contenu de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add articles', 7, 'add_articles'),
(26, 'Can change articles', 7, 'change_articles'),
(27, 'Can delete articles', 7, 'delete_articles'),
(28, 'Can view articles', 7, 'view_articles');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'polls', 'articles'),
(6, 'sessions', 'session');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Contenu de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-02-02 16:37:38.755931'),
(2, 'auth', '0001_initial', '2022-02-02 16:37:46.629879'),
(3, 'admin', '0001_initial', '2022-02-02 16:37:49.324952'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-02-02 16:37:49.423642'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-02-02 16:37:49.566436'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-02-02 16:37:50.785256'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-02-02 16:37:51.520546'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-02-02 16:37:52.225652'),
(9, 'auth', '0004_alter_user_username_opts', '2022-02-02 16:37:52.306166'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-02-02 16:37:52.835005'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-02-02 16:37:52.901036'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-02-02 16:37:52.957207'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-02-02 16:37:53.820433'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-02-02 16:37:54.866231'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-02-02 16:37:55.467835'),
(16, 'auth', '0011_update_proxy_permissions', '2022-02-02 16:37:55.518318'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-02-02 16:37:56.300467'),
(18, 'polls', '0001_initial', '2022-02-02 16:37:56.951970'),
(19, 'polls', '0002_remove_articles_article_articles_diametre_corps_and_more', '2022-02-02 16:37:58.777603'),
(20, 'sessions', '0001_initial', '2022-02-02 16:37:59.361621');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `liste_produit`
--

CREATE TABLE IF NOT EXISTS `liste_produit` (
  `idReference` varchar(5) NOT NULL,
  `idLongueurCorps` varchar(5) NOT NULL,
  `idType` varchar(50) NOT NULL,
  `idDiametreCorps` varchar(5) NOT NULL,
  PRIMARY KEY (`idReference`,`idLongueurCorps`,`idType`,`idDiametreCorps`),
  KEY `liste_produit_longueur_corps0_FK` (`idLongueurCorps`),
  KEY `liste_produit_type_reference1_FK` (`idType`),
  KEY `liste_produit_diametre_corps2_FK` (`idDiametreCorps`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `liste_produit`
--

INSERT INTO `liste_produit` (`idReference`, `idLongueurCorps`, `idType`, `idDiametreCorps`) VALUES
('1', '1', '1', '2'),
('1', '1', '1', '3'),
('1', '1', '1', '4'),
('1', '1', '2', '1'),
('1', '2', '1', '1'),
('1', '2', '1', '2'),
('1', '2', '1', '3'),
('1', '2', '2', '2'),
('1', '2', '2', '3'),
('1', '4', '1', '1'),
('1', '4', '1', '3'),
('1', '5', '1', '1'),
('1', '5', '1', '2');

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
  `libelle` varchar(5) NOT NULL,
  PRIMARY KEY (`idReference`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `reference`
--

INSERT INTO `reference` (`idReference`, `libelle`) VALUES
('1', 'rivet'),
('2', 'vice');

-- --------------------------------------------------------

--
-- Structure de la table `type_reference`
--

CREATE TABLE IF NOT EXISTS `type_reference` (
  `idType` varchar(50) NOT NULL,
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
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

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
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `liste_produit`
--
ALTER TABLE `liste_produit`
  ADD CONSTRAINT `liste_produit_reference_FK` FOREIGN KEY (`idReference`) REFERENCES `reference` (`idReference`),
  ADD CONSTRAINT `liste_produit_longueur_corps0_FK` FOREIGN KEY (`idLongueurCorps`) REFERENCES `longueur_corps` (`idLongueurCorps`),
  ADD CONSTRAINT `liste_produit_type_reference1_FK` FOREIGN KEY (`idType`) REFERENCES `type_reference` (`idType`),
  ADD CONSTRAINT `liste_produit_diametre_corps2_FK` FOREIGN KEY (`idDiametreCorps`) REFERENCES `diametre_corps` (`idDiametreCorps`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
