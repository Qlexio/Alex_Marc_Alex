-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 01 juil. 2022 à 10:46
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `rivecol`
--

-- --------------------------------------------------------

--
-- Structure de la table `accounts_shopper`
--

DROP TABLE IF EXISTS `accounts_shopper`;
CREATE TABLE IF NOT EXISTS `accounts_shopper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `accounts_shopper`
--

INSERT INTO `accounts_shopper` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$RAoSvsaPHP6FHRz6KM3wym$jnuzuGEfISsLe1qksDIkWJWbIl/H07DExOBZgYmvBzU=', '2022-06-30 16:59:45.923522', 1, 'lenny', '', '', 'casterlenny@gmail.com', 1, 1, '2022-06-17 12:33:13.432328'),
(11, 'pbkdf2_sha256$320000$ZlnbhZjMkRtJO55dTvNH61$hWYHH1xm+yCWH7LGlaRP6OdvSXh9pGA5A8YKfwmOqyY=', '2022-06-30 16:44:17.207587', 0, 'bob', '', '', '', 0, 1, '2022-06-30 16:44:17.122567'),
(10, 'pbkdf2_sha256$320000$JMlw6NQFg5fILrrNa1aPD6$6AMGqb5qRwXxHaAmxN2FoHUmcHZ+rLR9g01ceDpUll0=', '2022-06-20 17:16:50.379744', 0, 'test555', '', '', '', 0, 1, '2022-06-20 17:16:50.297723'),
(9, 'pbkdf2_sha256$320000$6h4d6Q6Ak7T2YTfeIYxfV0$2Xf6mxqZ/DqJspPFzLUQxD2c2BBmZnMFSCDyxUZejuI=', '2022-06-17 14:13:12.083786', 0, 'test', '', '', '', 0, 1, '2022-06-17 14:13:01.985782');

-- --------------------------------------------------------

--
-- Structure de la table `accounts_shopper_groups`
--

DROP TABLE IF EXISTS `accounts_shopper_groups`;
CREATE TABLE IF NOT EXISTS `accounts_shopper_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shopper_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_shopper_groups_shopper_id_group_id_81387419_uniq` (`shopper_id`,`group_id`),
  KEY `accounts_shopper_groups_shopper_id_b0fc95fd` (`shopper_id`),
  KEY `accounts_shopper_groups_group_id_e3f091d4` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `accounts_shopper_user_permissions`
--

DROP TABLE IF EXISTS `accounts_shopper_user_permissions`;
CREATE TABLE IF NOT EXISTS `accounts_shopper_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shopper_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_shopper_user_pe_shopper_id_permission_id_53b66cc3_uniq` (`shopper_id`,`permission_id`),
  KEY `accounts_shopper_user_permissions_shopper_id_1f93d8af` (`shopper_id`),
  KEY `accounts_shopper_user_permissions_permission_id_0d51f125` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `auth_permission`
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
(28, 'Can view articles', 7, 'view_articles'),
(29, 'Can add longueur_corps', 8, 'add_longueur_corps'),
(30, 'Can change longueur_corps', 8, 'change_longueur_corps'),
(31, 'Can delete longueur_corps', 8, 'delete_longueur_corps'),
(32, 'Can view longueur_corps', 8, 'view_longueur_corps'),
(33, 'Can add matiere', 9, 'add_matiere'),
(34, 'Can change matiere', 9, 'change_matiere'),
(35, 'Can delete matiere', 9, 'delete_matiere'),
(36, 'Can view matiere', 9, 'view_matiere'),
(37, 'Can add ral', 10, 'add_ral'),
(38, 'Can change ral', 10, 'change_ral'),
(39, 'Can delete ral', 10, 'delete_ral'),
(40, 'Can view ral', 10, 'view_ral'),
(41, 'Can add rivet', 11, 'add_rivet'),
(42, 'Can change rivet', 11, 'change_rivet'),
(43, 'Can delete rivet', 11, 'delete_rivet'),
(44, 'Can view rivet', 11, 'view_rivet'),
(45, 'Can add teinte', 12, 'add_teinte'),
(46, 'Can change teinte', 12, 'change_teinte'),
(47, 'Can delete teinte', 12, 'delete_teinte'),
(48, 'Can view teinte', 12, 'view_teinte'),
(49, 'Can add type_reference', 13, 'add_type_reference'),
(50, 'Can change type_reference', 13, 'change_type_reference'),
(51, 'Can delete type_reference', 13, 'delete_type_reference'),
(52, 'Can view type_reference', 13, 'view_type_reference'),
(53, 'Can add type_teinte', 14, 'add_type_teinte'),
(54, 'Can change type_teinte', 14, 'change_type_teinte'),
(55, 'Can delete type_teinte', 14, 'delete_type_teinte'),
(56, 'Can view type_teinte', 14, 'view_type_teinte'),
(57, 'Can add diametre_corps', 15, 'add_diametre_corps'),
(58, 'Can change diametre_corps', 15, 'change_diametre_corps'),
(59, 'Can delete diametre_corps', 15, 'delete_diametre_corps'),
(60, 'Can view diametre_corps', 15, 'view_diametre_corps'),
(61, 'Can add commande', 16, 'add_commande'),
(62, 'Can change commande', 16, 'change_commande'),
(63, 'Can delete commande', 16, 'delete_commande'),
(64, 'Can view commande', 16, 'view_commande'),
(65, 'Can add utilisateur', 17, 'add_utilisateur'),
(66, 'Can change utilisateur', 17, 'change_utilisateur'),
(67, 'Can delete utilisateur', 17, 'delete_utilisateur'),
(68, 'Can view utilisateur', 17, 'view_utilisateur'),
(69, 'Can add vente', 18, 'add_vente'),
(70, 'Can change vente', 18, 'change_vente'),
(71, 'Can delete vente', 18, 'delete_vente'),
(72, 'Can view vente', 18, 'view_vente'),
(73, 'Can add commande', 23, 'add_commande'),
(74, 'Can change commande', 23, 'change_commande'),
(75, 'Can delete commande', 23, 'delete_commande'),
(76, 'Can view commande', 23, 'view_commande'),
(77, 'Can add diametre_corps', 21, 'add_diametre_corps'),
(78, 'Can change diametre_corps', 21, 'change_diametre_corps'),
(79, 'Can delete diametre_corps', 21, 'delete_diametre_corps'),
(80, 'Can view diametre_corps', 21, 'view_diametre_corps'),
(81, 'Can add longueur_corps', 24, 'add_longueur_corps'),
(82, 'Can change longueur_corps', 24, 'change_longueur_corps'),
(83, 'Can delete longueur_corps', 24, 'delete_longueur_corps'),
(84, 'Can view longueur_corps', 24, 'view_longueur_corps'),
(85, 'Can add matiere', 22, 'add_matiere'),
(86, 'Can change matiere', 22, 'change_matiere'),
(87, 'Can delete matiere', 22, 'delete_matiere'),
(88, 'Can view matiere', 22, 'view_matiere'),
(89, 'Can add ral', 19, 'add_ral'),
(90, 'Can change ral', 19, 'change_ral'),
(91, 'Can delete ral', 19, 'delete_ral'),
(92, 'Can view ral', 19, 'view_ral'),
(93, 'Can add rivet', 20, 'add_rivet'),
(94, 'Can change rivet', 20, 'change_rivet'),
(95, 'Can delete rivet', 20, 'delete_rivet'),
(96, 'Can view rivet', 20, 'view_rivet'),
(97, 'Can add teinte', 25, 'add_teinte'),
(98, 'Can change teinte', 25, 'change_teinte'),
(99, 'Can delete teinte', 25, 'delete_teinte'),
(100, 'Can view teinte', 25, 'view_teinte'),
(101, 'Can add type_reference', 26, 'add_type_reference'),
(102, 'Can change type_reference', 26, 'change_type_reference'),
(103, 'Can delete type_reference', 26, 'delete_type_reference'),
(104, 'Can view type_reference', 26, 'view_type_reference'),
(105, 'Can add type_teinte', 27, 'add_type_teinte'),
(106, 'Can change type_teinte', 27, 'change_type_teinte'),
(107, 'Can delete type_teinte', 27, 'delete_type_teinte'),
(108, 'Can view type_teinte', 27, 'view_type_teinte'),
(109, 'Can add utilisateur', 28, 'add_utilisateur'),
(110, 'Can change utilisateur', 28, 'change_utilisateur'),
(111, 'Can delete utilisateur', 28, 'delete_utilisateur'),
(112, 'Can view utilisateur', 28, 'view_utilisateur'),
(113, 'Can add vente', 29, 'add_vente'),
(114, 'Can change vente', 29, 'change_vente'),
(115, 'Can delete vente', 29, 'delete_vente'),
(116, 'Can view vente', 29, 'view_vente'),
(117, 'Can add user', 30, 'add_shopper'),
(118, 'Can change user', 30, 'change_shopper'),
(119, 'Can delete user', 30, 'delete_shopper'),
(120, 'Can view user', 30, 'view_shopper'),
(121, 'Can add produit', 31, 'add_produit'),
(122, 'Can change produit', 31, 'change_produit'),
(123, 'Can delete produit', 31, 'delete_produit'),
(124, 'Can view produit', 31, 'view_produit'),
(125, 'Can add produits', 31, 'add_produits'),
(126, 'Can change produits', 31, 'change_produits'),
(127, 'Can delete produits', 31, 'delete_produits'),
(128, 'Can view produits', 31, 'view_produits'),
(129, 'Can add boite_au_ lettre', 32, 'add_boite_au_lettre'),
(130, 'Can change boite_au_ lettre', 32, 'change_boite_au_lettre'),
(131, 'Can delete boite_au_ lettre', 32, 'delete_boite_au_lettre'),
(132, 'Can view boite_au_ lettre', 32, 'view_boite_au_lettre'),
(133, 'Can add embouts', 33, 'add_embouts'),
(134, 'Can change embouts', 33, 'change_embouts'),
(135, 'Can delete embouts', 33, 'delete_embouts'),
(136, 'Can view embouts', 33, 'view_embouts'),
(137, 'Can add category', 31, 'add_category'),
(138, 'Can change category', 31, 'change_category'),
(139, 'Can delete category', 31, 'delete_category'),
(140, 'Can view category', 31, 'view_category'),
(141, 'Can add products', 34, 'add_products'),
(142, 'Can change products', 34, 'change_products'),
(143, 'Can delete products', 34, 'delete_products'),
(144, 'Can view products', 34, 'view_products'),
(145, 'Can add order', 35, 'add_order'),
(146, 'Can change order', 35, 'change_order'),
(147, 'Can delete order', 35, 'delete_order'),
(148, 'Can view order', 35, 'view_order'),
(149, 'Can add cart', 36, 'add_cart'),
(150, 'Can change cart', 36, 'change_cart'),
(151, 'Can delete cart', 36, 'delete_cart'),
(152, 'Can view cart', 36, 'view_cart');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$JiincRlgCTDKqMLZSjEqv3$ZHA/uXfkhgO/qd8hm+DJ2nZEM45AUUYm5rgiBLeKm8g=', '2022-06-16 13:39:29.663445', 1, 'lenny', '', '', 'casterlenny@gmail.com', 1, 1, '2022-06-16 13:39:14.068425');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `idCommande` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `diametre_corps`
--

DROP TABLE IF EXISTS `diametre_corps`;
CREATE TABLE IF NOT EXISTS `diametre_corps` (
  `idDiametreCorps` int(10) NOT NULL,
  `diametreCorps` decimal(2,1) NOT NULL,
  PRIMARY KEY (`idDiametreCorps`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `diametre_corps`
--

INSERT INTO `diametre_corps` (`idDiametreCorps`, `diametreCorps`) VALUES
(1, '2.4'),
(2, '3.0'),
(3, '3.2'),
(4, '3.4'),
(5, '4.0'),
(6, '4.8'),
(7, '5.0'),
(8, '6.0'),
(9, '6.4'),
(10, '7.8');

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-06-16 13:57:36.437297', '164', '164 (6)', 2, '[{\"changed\": {\"fields\": [\"Quantite\"]}}]', 20, 1),
(2, '2022-06-16 13:57:42.325429', '164', '164 (5)', 2, '[{\"changed\": {\"fields\": [\"Quantite\"]}}]', 20, 1),
(3, '2022-06-17 13:44:17.232415', '3', 'test1', 3, '', 30, 1),
(4, '2022-06-17 13:44:17.233462', '2', 'test', 3, '', 30, 1),
(5, '2022-06-17 14:08:20.437779', '7', 'test33560', 3, '', 30, 1),
(6, '2022-06-17 14:08:20.441256', '6', 'test23', 3, '', 30, 1),
(7, '2022-06-17 14:08:20.441256', '5', 'test2', 3, '', 30, 1),
(8, '2022-06-17 14:08:20.443332', '4', 'test', 3, '', 30, 1),
(9, '2022-06-17 14:12:52.672779', '8', 'test', 3, '', 30, 1),
(10, '2022-06-22 08:14:10.425910', '1', 'Produit object (1)', 1, '[{\"added\": {}}]', 31, 1),
(11, '2022-06-22 08:14:43.718084', '2', 'Produit object (2)', 1, '[{\"added\": {}}]', 31, 1),
(12, '2022-06-22 08:15:03.745090', '3', 'Produit object (3)', 1, '[{\"added\": {}}]', 31, 1),
(13, '2022-06-22 08:15:34.776081', '4', 'Produit object (4)', 1, '[{\"added\": {}}]', 31, 1),
(14, '2022-06-22 08:15:48.980080', '2', 'Produit object (2)', 2, '[{\"changed\": {\"fields\": [\"Nom Produit\"]}}]', 31, 1),
(15, '2022-06-22 08:16:02.103093', '1', 'Produit object (1)', 2, '[{\"changed\": {\"fields\": [\"Nom Produit\"]}}]', 31, 1),
(16, '2022-06-22 08:16:07.296079', '2', 'Produit object (2)', 2, '[{\"changed\": {\"fields\": [\"Nom Produit\"]}}]', 31, 1),
(17, '2022-06-22 12:16:11.446636', '7', 'Le selimphone', 1, '[{\"added\": {}}]', 31, 1),
(18, '2022-06-22 12:16:54.730173', '7', 'Le selimphone', 2, '[{\"changed\": {\"fields\": [\"Img Produit\"]}}]', 31, 1),
(19, '2022-06-22 12:17:15.645282', '7', 'Le selimphone', 3, '', 31, 1),
(20, '2022-06-23 08:21:25.528846', '4', 'vis-auto', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 31, 1),
(21, '2022-06-23 08:21:32.534835', '3', 'rivet-plat', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 31, 1),
(22, '2022-06-23 08:21:40.853448', '2', 'Embout-carre', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 31, 1),
(23, '2022-06-23 08:21:54.053841', '1', 'Boite-au-lettre', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 31, 1),
(24, '2022-06-23 08:21:59.901840', '3', 'Rivet-plat', 2, '[{\"changed\": {\"fields\": [\"Nom Produit\"]}}]', 31, 1),
(25, '2022-06-23 08:22:06.526843', '4', 'Vis-auto', 2, '[{\"changed\": {\"fields\": [\"Nom Produit\"]}}]', 31, 1),
(26, '2022-06-23 12:59:21.173755', '1', 'EMBOUTS object (1)', 1, '[{\"added\": {}}]', 33, 1),
(27, '2022-06-23 13:00:05.947172', '2', 'EMBOUTS object (2)', 1, '[{\"added\": {}}]', 33, 1),
(28, '2022-06-23 13:02:26.884838', '1', 'Boite_au_Lettre object (1)', 1, '[{\"added\": {}}]', 32, 1),
(29, '2022-06-24 07:29:13.524251', '4', 'Vis-auto', 3, '', 31, 1),
(30, '2022-06-24 07:30:27.176248', '1', 'Boite_au_lettre', 2, '[{\"changed\": {\"fields\": [\"Nom Produit\"]}}]', 31, 1),
(31, '2022-06-24 07:30:39.996249', '1', 'Boite_au_lettre', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 31, 1),
(32, '2022-06-24 07:35:18.693252', '1', 'Boite-au-lettre', 2, '[{\"changed\": {\"fields\": [\"Slug\", \"Nom Produit\"]}}]', 31, 1),
(33, '2022-06-28 12:08:42.387062', '1', 'Products object (1)', 1, '[{\"added\": {}}]', 34, 1),
(34, '2022-06-30 14:39:28.249546', '1', 'Products object (1)', 2, '[{\"changed\": {\"fields\": [\"Is Active?\"]}}]', 34, 1),
(35, '2022-06-30 14:39:33.280545', '3', 'Rivet-plat', 2, '[{\"changed\": {\"fields\": [\"Is Active?\"]}}]', 31, 1),
(36, '2022-06-30 14:39:38.135555', '2', 'Embout-carre', 2, '[{\"changed\": {\"fields\": [\"Is Active?\"]}}]', 31, 1),
(37, '2022-06-30 14:39:41.169538', '1', 'Boite-au-lettre', 2, '[{\"changed\": {\"fields\": [\"Is Active?\"]}}]', 31, 1),
(38, '2022-06-30 15:05:09.077221', '1', 'Products object (1)', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 34, 1);

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(30, 'accounts', 'shopper'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'polls', 'articles'),
(16, 'polls', 'commande'),
(15, 'polls', 'diametre_corps'),
(8, 'polls', 'longueur_corps'),
(9, 'polls', 'matiere'),
(10, 'polls', 'ral'),
(11, 'polls', 'rivet'),
(12, 'polls', 'teinte'),
(13, 'polls', 'type_reference'),
(14, 'polls', 'type_teinte'),
(17, 'polls', 'utilisateur'),
(18, 'polls', 'vente'),
(32, 'rivets', 'boite_au_lettre'),
(36, 'rivets', 'cart'),
(31, 'rivets', 'category'),
(23, 'rivets', 'commande'),
(21, 'rivets', 'diametre_corps'),
(33, 'rivets', 'embouts'),
(24, 'rivets', 'longueur_corps'),
(22, 'rivets', 'matiere'),
(35, 'rivets', 'order'),
(34, 'rivets', 'products'),
(19, 'rivets', 'ral'),
(20, 'rivets', 'rivet'),
(25, 'rivets', 'teinte'),
(26, 'rivets', 'type_reference'),
(27, 'rivets', 'type_teinte'),
(28, 'rivets', 'utilisateur'),
(29, 'rivets', 'vente'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_migrations`
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
(19, 'polls', '0002_remove_articles_article_articles_diametre_corps_and_more', '2022-02-14 16:02:40.723147'),
(20, 'polls', '0003_diametre_corps_liste_produit_longueur_corps_and_more', '2022-02-25 11:52:42.426816'),
(21, 'polls', '0004_matiere_ral_rivet_teinte_type_teinte_and_more', '2022-02-25 11:57:19.343696'),
(22, 'sessions', '0001_initial', '2022-02-25 11:57:20.855770'),
(23, 'polls', '0005_diametre_corps_longueur_corps_matiere_ral_rivet_and_more', '2022-02-25 12:06:21.830087'),
(24, 'polls', '0006_initial', '2022-02-25 12:07:10.863473'),
(25, 'polls', '0007_initial', '2022-02-25 12:08:09.026678'),
(26, 'rivets', '0001_initial', '2022-06-03 09:38:36.920443'),
(27, 'rivets', '0002_initial', '2022-06-03 09:41:03.794449'),
(28, 'accounts', '0001_initial', '2022-06-17 12:30:58.718450'),
(29, 'rivets', '0003_produit', '2022-06-21 13:29:23.731994'),
(30, 'rivets', '0004_rename_produit_produits_alter_produits_table', '2022-06-22 09:07:37.032193'),
(31, 'rivets', '0005_alter_produits_img_produit', '2022-06-22 09:31:16.703948'),
(32, 'rivets', '0006_produits_slug_alter_produits_img_produit', '2022-06-23 08:20:39.031706'),
(33, 'rivets', '0007_boite_au_lettre_embouts', '2022-06-23 12:44:05.059220'),
(34, 'rivets', '0008_delete_boite_au_lettre_delete_embouts', '2022-06-23 14:04:36.789072'),
(35, 'rivets', '0009_embouts_boite_au_lettre', '2022-06-23 14:05:19.618382'),
(36, 'rivets', '0010_remove_embouts_product_delete_boite_au_lettre_and_more', '2022-06-24 07:37:54.415211'),
(37, 'rivets', '0011_rename_produits_category_products', '2022-06-24 13:32:11.866886'),
(38, 'rivets', '0012_order', '2022-06-30 13:40:17.318690'),
(39, 'rivets', '0013_cart', '2022-06-30 14:14:53.183970'),
(40, 'rivets', '0014_remove_products_description_category_is_active_and_more', '2022-06-30 14:38:38.718371'),
(41, 'rivets', '0015_products_slug', '2022-06-30 15:04:07.746355'),
(42, 'rivets', '0016_alter_products_slug', '2022-06-30 15:04:32.675179');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('i6mry8qyydos7v1vtab2wwsuzbfh0bcw', 'e30:1o2BwB:5IpCvxhEPmLP59fOcXm_cMbFVjkK6eiFiRlLtP6wQMk', '2022-07-01 13:22:59.740416'),
('mgyxdogfy82srgzcliattn55q3lwx9nm', 'e30:1o2CRa:zdNwWinaVZIWuhleg2zJIO7RjhxcdBD9a8AwEMJdNuI', '2022-07-01 13:55:26.231993'),
('plccwpai5ndg6ymoxyywlb9amlpm8wrt', '.eJxVjEEOwiAQRe_C2hCggoNL956hGWYGqRpISrsy3l2bdKHb_977LzXiupRx7TKPE6uzsurwuyWkh9QN8B3rrWlqdZmnpDdF77Tra2N5Xnb376BgL9-ahhiiIIdEzEA2GEETXB7AOEIDICZJdBEh-Jyyt-EI4k7A2bjkHav3B_p7ODg:1o6xW5:eEDdYpVxjnyRhI5fdYwiRGpuuspRtL2Kci8A4OhqExk', '2022-07-14 16:59:45.923522');

-- --------------------------------------------------------

--
-- Structure de la table `longueur_corps`
--

DROP TABLE IF EXISTS `longueur_corps`;
CREATE TABLE IF NOT EXISTS `longueur_corps` (
  `idLongueurCorps` int(10) NOT NULL,
  `longueurCorps` int(10) NOT NULL,
  PRIMARY KEY (`idLongueurCorps`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `longueur_corps`
--

INSERT INTO `longueur_corps` (`idLongueurCorps`, `longueurCorps`) VALUES
(1, 4),
(2, 5),
(3, 6),
(4, 7),
(5, 8),
(6, 9),
(7, 10),
(8, 11),
(9, 12),
(10, 14),
(11, 15),
(12, 16),
(13, 18),
(14, 20),
(15, 22),
(16, 24),
(17, 25),
(18, 26),
(19, 28),
(20, 30),
(21, 35),
(22, 40),
(23, 45),
(24, 50),
(25, 60),
(26, 65),
(27, 70),
(28, 90),
(29, 100);

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `idMatiere` int(10) NOT NULL,
  `libelle` char(50) NOT NULL,
  PRIMARY KEY (`idMatiere`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`idMatiere`, `libelle`) VALUES
(1, 'Aluminium'),
(2, 'Acier');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `id_Produit` int(11) NOT NULL,
  `nom_Produit` varchar(50) NOT NULL,
  `img_Produit` varchar(100) DEFAULT NULL,
  `slug` varchar(128) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_Produit`),
  KEY `Produits_slug_b2a427a3` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id_Produit`, `nom_Produit`, `img_Produit`, `slug`, `is_active`) VALUES
(1, 'Boite-au-lettre', 'products/bal_rouge.png', 'boiteaulettre', 1),
(2, 'Embout-carre', 'products/embout-carre.jpg', 'emboutcarre', 1),
(3, 'Rivet-plat', 'products/rivet-plat.jpg', 'rivetplat', 1);

-- --------------------------------------------------------

--
-- Structure de la table `ral`
--

DROP TABLE IF EXISTS `ral`;
CREATE TABLE IF NOT EXISTS `ral` (
  `idRal` int(10) NOT NULL,
  `idTeinte` int(10) NOT NULL,
  `idType` int(10) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `code_hex` varchar(50) NOT NULL,
  PRIMARY KEY (`idRal`),
  KEY `ral_teinte_FK` (`idTeinte`),
  KEY `ral_type_teinte0_FK` (`idType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ral`
--

INSERT INTO `ral` (`idRal`, `idTeinte`, `idType`, `libelle`, `code_hex`) VALUES
(1, 2, 2, '1000 / Beige vert', '#cdba88'),
(2, 2, 3, '1000 / Beige vert', '#cdba88'),
(3, 2, 2, '1001 / Beige', '#d0b084'),
(4, 2, 3, '1001 / Beige', '#d0b084'),
(5, 2, 2, '1002 / Jaune sable', '#d2aa6d'),
(6, 2, 3, '1002 / Jaune sable', '#d2aa6d'),
(7, 2, 2, '1003 / Jaune de sécurité', '#f9a800'),
(8, 2, 3, '1003 / Jaune de sécurité', '#f9a800'),
(9, 2, 2, '1004 / Jaune or', '#e49e00'),
(10, 2, 3, '1004 / Jaune or', '#e49e00'),
(11, 2, 2, '1005 / Jaune miel', '#cb8e00'),
(12, 2, 3, '1005 / Jaune miel', '#cb8e00'),
(13, 2, 2, '1006 / Jaune maïs', '#e29000'),
(14, 2, 3, '1006 / Jaune maïs', '#e29000'),
(15, 2, 2, '1007 / Jaune narcisse', '#e88c00'),
(16, 2, 3, '1007 / Jaune narcisse', '#e88c00'),
(17, 2, 2, '1011 / Beige brun', '#af804f'),
(18, 2, 3, '1011 / Beige brun', '#af804f'),
(19, 2, 2, '1012 / Jaune citron', '#ddaf27'),
(20, 2, 3, '1012 / Jaune citron', '#ddaf27'),
(21, 2, 2, '1013 / Blanc perlé', '#af804f'),
(22, 2, 3, '1013 / Blanc perlé', '#af804f'),
(23, 2, 2, '1014 / Ivoire', '#ddc49a'),
(24, 2, 3, '1014 / Ivoire', '#ddc49a'),
(25, 2, 2, '1015 / Ivoire clair', '#e6d2b5'),
(26, 2, 3, '1015 / Ivoire clair', '#e6d2b5'),
(27, 2, 2, '1016 / Jaune soufre', '#f1dd38'),
(28, 2, 3, '1016 / Jaune soufre', '#f1dd38'),
(29, 2, 2, '1017 / Jaune safran', '#f6a950'),
(30, 2, 3, '1017 / Jaune safran', '#f6a950'),
(31, 2, 2, '1018 / Jaune zinc', '#faca30'),
(32, 2, 3, '1018 / Jaune zinc', '#faca30'),
(33, 2, 2, '1019 / Beige gris', '#a48f7a'),
(34, 2, 3, '1019 / Beige gris', '#a48f7a'),
(35, 2, 2, '1020 / Jaune olive', '#a08f65'),
(36, 2, 3, '1020 / Jaune olive', '#a08f65'),
(37, 2, 2, '1021 / Jaune colza', '#f6b600'),
(38, 2, 3, '1021 / Jaune colza', '#f6b600'),
(39, 2, 2, '1023 / Jaune signalisation', '#f7b500'),
(40, 2, 3, '1023 / Jaune signalisation', '#f7b500'),
(41, 2, 2, '1024 / Jaune ocre', '#ba8f4c'),
(42, 2, 3, '1024 / Jaune ocre', '#ba8f4c'),
(43, 2, 2, '1026 / Jaune brillant', '#ffff00'),
(44, 2, 3, '1026 / Jaune brillant', '#ffff00'),
(45, 2, 2, '1027 / Jaune curry', '#a77f0e'),
(46, 2, 3, '1027 / Jaune curry', '#a77f0e'),
(47, 2, 2, '1028 / Jaune melon', '#ff9b00'),
(48, 2, 3, '1028 / Jaune melon', '#ff9b00'),
(49, 2, 2, '1032 / Jaune genêt', '#e2a300'),
(50, 2, 3, '1032 / Jaune genêt', '#e2a300'),
(51, 2, 2, '1033 / Jaune dahlia', '#f99a1c'),
(52, 2, 3, '1033 / Jaune dahlia', '#f99a1c'),
(53, 2, 2, '1034 / Jaune pastel', '#a08f65'),
(54, 2, 3, '1034 / Jaune pastel', '#a08f65'),
(55, 2, 2, '1035 / Beige nacré', '#908370'),
(56, 2, 3, '1035 / Beige nacré', '#908370'),
(57, 2, 2, '1036 / Or nacré', '#80643f'),
(58, 2, 3, '1036 / Or nacré', '#80643f'),
(59, 2, 2, '1037 / Jaune soleil', '#f09200'),
(60, 2, 3, '1037 / Jaune soleil', '#f09200'),
(61, 3, 2, '2000 / Orangé jaune', '#da6e00'),
(62, 3, 3, '2000 / Orangé jaune', '#da6e00'),
(63, 3, 2, '2001 / Orangé rouge', '#ba481b'),
(64, 3, 3, '2001 / Orangé rouge', '#ba481b'),
(65, 3, 2, '2002 / Orangé sang', '#bf3922'),
(66, 3, 3, '2002 / Orangé sang', '#bf3922'),
(67, 3, 2, '2003 / Orangé pastel', '#f67828'),
(68, 3, 3, '2003 / Orangé pastel', '#f67828'),
(69, 3, 2, '2004 / Orangé Orangé pur', '#e25303'),
(70, 3, 3, '2004 / Orangé Orangé pur', '#e25303'),
(71, 3, 2, '2005 / Orangé brillant', '#ff4d06'),
(72, 3, 3, '2005 / Orangé brillant', '#ff4d06'),
(73, 3, 2, '2007 / Orangé clair brillant', '#ffb200'),
(74, 3, 3, '2007 / Orangé clair brillant', '#ffb200'),
(75, 3, 2, '2008 / Orangé rouge clair', '#ed6b21'),
(76, 3, 3, '2008 / Orangé rouge clair', '#ed6b21'),
(77, 3, 2, '2009 / Orangé signalisation', '#de5307'),
(78, 3, 3, '2009 / Orangé signalisation', '#de5307'),
(79, 3, 2, '2010 / Orangé de sécurité', '#d05d28'),
(80, 3, 3, '2010 / Orangé de sécurité', '#d05d28'),
(81, 3, 2, '2011 / Orangé foncé', '#e26e0e'),
(82, 3, 3, '2011 / Orangé foncé', '#e26e0e'),
(83, 3, 2, '2012 / Orangé saumon', '#d5654d'),
(84, 3, 3, '2012 / Orangé saumon', '#d5654d'),
(85, 3, 2, '2013 / Orangé nacré', '#923e25'),
(86, 3, 3, '2013 / Orangé nacré', '#923e25'),
(87, 4, 2, '3000 / Rouge feu', '#a72920'),
(88, 4, 3, '3000 / Rouge feu', '#a72920'),
(89, 4, 2, '3001 / Rouge de sécurité', '#9b2423'),
(90, 4, 3, '3001 / Rouge de sécurité', '#9b2423'),
(91, 4, 3, '3002 / Rouge carmin', '#9b2321'),
(92, 4, 2, '3002 / Rouge carmin', '#9b2321'),
(93, 4, 3, '3003 / Rouge rubis', '#861a22'),
(94, 4, 2, '3003 / Rouge rubis', '#861a22'),
(95, 4, 2, '3004 / Rouge pourpre', '#6b1c23'),
(96, 4, 3, '3004 / Rouge pourpre', '#6b1c23'),
(97, 4, 2, '3005 / Rouge vin', '#59191f'),
(98, 4, 3, '3005 / Rouge vin', '#59191f'),
(99, 4, 2, '3007 / Rouge noir', '#3e2022'),
(100, 4, 3, '3007 / Rouge noir', '#3e2022'),
(101, 4, 2, '3009 / Rouge oxyde', '#6d342d'),
(102, 4, 3, '3009 / Rouge oxyde', '#6d342d'),
(103, 4, 2, '3011 / Rouge brun', '#792423'),
(104, 4, 3, '3011 / Rouge brun', '#792423'),
(105, 4, 2, '3012 / Rouge beige', '#c6846d'),
(106, 4, 3, '3012 / Rouge beige', '#c6846d'),
(107, 4, 2, '3013 / Rouge tomate', '#972e25'),
(108, 4, 3, '3013 / Rouge tomate', '#972e25'),
(109, 4, 2, '3014 / Vieux  rose', '#cb7375'),
(110, 4, 3, '3014 / Vieux  rose', '#cb7375'),
(111, 4, 2, '3015 / Rose clair', '#d8a0a6'),
(112, 4, 3, '3015 / Rose clair', '#d8a0a6'),
(113, 4, 2, '3016 / Rouge corail', '#a63d2f'),
(114, 4, 3, '3016 / Rouge corail', '#a63d2f'),
(115, 4, 2, '3017 / Rosé', '#cb555d'),
(116, 4, 3, '3017 / Rosé', '#cb555d'),
(117, 4, 2, '3018 / Rouge fraise', '#c73f4a'),
(118, 4, 3, '3018 / Rouge fraise', '#c73f4a'),
(119, 4, 2, '3020 / Rouge signalisation', '#bb1e10'),
(120, 4, 3, '3020 / Rouge signalisation', '#bb1e10'),
(121, 4, 2, '3022 / Rouge saumon', '#cf6955'),
(122, 4, 3, '3022 / Rouge saumon', '#cf6955'),
(123, 4, 2, '3024 / Rouge brillant', '#ff2d21'),
(124, 4, 3, '3024 / Rouge brillant', '#ff2d21'),
(125, 4, 2, '3026 / Rouge clair brillant', '#ff2a1b'),
(126, 4, 3, '3026 / Rouge clair brillant', '#ff2a1b'),
(127, 4, 2, '3027 / Rouge framboise', '#ab273c'),
(128, 4, 3, '3027 / Rouge framboise', '#ab273c'),
(129, 4, 2, '3028 / Rouge pu', '#cc2c24'),
(130, 4, 3, '3028 / Rouge pu', '#cc2c24'),
(131, 4, 2, '3031 / Rouge oriental', '#a63437'),
(132, 4, 3, '3031 / Rouge oriental', '#a63437'),
(133, 4, 2, '3032 / Rouge rubis nacré', '#701d23'),
(134, 4, 3, '3032 / Rouge rubis nacré', '#701d23'),
(135, 4, 2, '3033 / Rose nacré', '#a53a2d'),
(136, 4, 3, '3033 / Rose nacré', '#a53a2d'),
(137, 5, 2, '4001 / Lilas rouge', '#816183'),
(138, 5, 3, '4001 / Lilas rouge', '#816183'),
(139, 5, 2, '4002 / Violet rouge', '#8d3c4b'),
(140, 5, 3, '4002 / Violet rouge', '#8d3c4b'),
(141, 5, 2, '4003 / Violet bruyère', '#c4618c'),
(142, 5, 3, '4003 / Violet bruyère', '#c4618c'),
(143, 5, 2, '4004 / Violet bordeaux', '#651e38'),
(144, 5, 3, '4004 / Violet bordeaux', '#651e38'),
(145, 5, 2, '4005 / Lilas bleu', '#76689a'),
(146, 5, 3, '4005 / Lilas bleu', '#76689a'),
(147, 5, 2, '4006 / Pourpre signalisation', '#903373'),
(148, 5, 3, '4006 / Pourpre signalisation', '#903373'),
(149, 5, 2, '4007 / Violet pourpre', '#47243c'),
(150, 5, 3, '4007 / Violet pourpre', '#47243c'),
(151, 5, 2, '4008 / Violet de sécurité', '#844c82'),
(152, 5, 3, '4008 / Violet de sécurité', '#844c82'),
(153, 5, 2, '4009 / Violet pastel', '#9d8692'),
(154, 5, 3, '4009 / Violet pastel', '#9d8692'),
(155, 5, 2, '4010 / Telemagenta', '#bc4077'),
(156, 5, 3, '4010 / Telemagenta', '#bc4077'),
(157, 5, 2, '4011 / Violet nacré', '#6e6387'),
(158, 5, 3, '4011 / Violet nacré', '#6e6387'),
(159, 5, 2, '4012 / Mûre nacré', '#6b6b7f'),
(160, 5, 3, '4012 / Mûre nacré', '#6b6b7f'),
(161, 6, 2, '5000 / Bleu violet', '#314f6f'),
(162, 6, 3, '5000 / Bleu violet', '#314f6f'),
(163, 6, 2, '5001 / Bleu vert', '#0f4c64'),
(164, 6, 3, '5001 / Bleu vert', '#0f4c64'),
(165, 6, 2, '5002 / Bleu outremer', '#00387b'),
(166, 6, 3, '5002 / Bleu outremer', '#00387b'),
(167, 6, 2, '5003 / Bleu saphir', '#1f3855'),
(168, 6, 3, '5003 / Bleu saphir', '#1f3855'),
(169, 6, 2, '5004 / Bleu noir', '#191e28'),
(170, 6, 3, '5004 / Bleu noir', '#191e28'),
(171, 6, 2, '5005 / Bleu de sécurité', '#005387'),
(172, 6, 3, '5005 / Bleu de sécurité', '#005387'),
(173, 6, 2, '5007 / Bleu brillant', '#376b8c'),
(174, 6, 3, '5007 / Bleu brillant', '#376b8c'),
(175, 6, 2, '5008 / Bleu gris', '#2b3a44'),
(176, 6, 3, '5008 / Bleu gris', '#2b3a44'),
(177, 6, 2, '5009 / Bleu azur', '#225f78'),
(178, 6, 3, '5009 / Bleu azur', '#225f78'),
(179, 6, 2, '5010 / Bleu gentiane', '#004f7c'),
(180, 6, 3, '5010 / Bleu gentiane', '#004f7c'),
(181, 6, 2, '5011 / Bleu acier', '#1a2b3c'),
(182, 6, 3, '5011 / Bleu acier', '#1a2b3c'),
(183, 6, 2, '5012 / Bleu clair', '#0089b6'),
(184, 6, 3, '5012 / Bleu clair', '#0089b6'),
(185, 6, 2, '5013 / Bleu cobalt', '#193153'),
(186, 6, 3, '5013 / Bleu cobalt', '#193153'),
(187, 6, 2, '5014 / Bleu pigeon', '#637d96'),
(188, 6, 3, '5014 / Bleu pigeon', '#637d96'),
(189, 6, 2, '5015 / Bleu ciel', '#007cb0'),
(190, 6, 3, '5015 / Bleu ciel', '#007cb0'),
(191, 6, 2, '5017 / Bleu signalisation', '#005b8c'),
(192, 6, 3, '5017 / Bleu signalisation', '#005b8c'),
(193, 6, 2, '5018 / Bleu turquoise', '#058b8c'),
(194, 6, 3, '5018 / Bleu turquoise', '#058b8c'),
(195, 6, 2, '5019 / Bleu capri', '#005e83'),
(196, 6, 3, '5019 / Bleu capri', '#005e83'),
(197, 6, 2, '5020 / Bleu océan', '#00414b'),
(198, 6, 3, '5020 / Bleu océan', '#00414b'),
(199, 6, 2, '5021 / Bleu d’eau', '#007577'),
(200, 6, 3, '5021 / Bleu d’eau', '#007577'),
(201, 6, 2, '5022 / Bleu nocturne', '#222d5a'),
(202, 6, 3, '5022 / Bleu nocturne', '#222d5a'),
(203, 6, 2, '5023 / Bleu distant', '#42698c'),
(204, 6, 3, '5023 / Bleu distant', '#42698c'),
(205, 6, 2, '5024 / Bleu pastel', '#6093ac'),
(206, 6, 3, '5024 / Bleu pastel', '#6093ac'),
(207, 6, 2, '5025 / Gentiane nacré', '#21697c'),
(208, 6, 3, '5025 / Gentiane nacré', '#21697c'),
(209, 6, 2, '5026 / Bleu nuit nacré', '#005e83'),
(210, 6, 3, '5026 / Bleu nuit nacré', '#005e83'),
(211, 7, 2, '6000 / Vert  patine', '#3c7460'),
(212, 7, 3, '6000 / Vert  patine', '#3c7460'),
(213, 7, 2, '6001 / Bleu émeraude', '#366735'),
(214, 7, 3, '6001 / Bleu émeraude', '#366735'),
(215, 7, 2, '6002 / Vert  feuillage', '#325928'),
(216, 7, 3, '6002 / Vert  feuillage', '#325928'),
(217, 7, 2, '6003 / Vert  olive', '#50533c'),
(218, 7, 3, '6003 / Vert  olive', '#50533c'),
(219, 7, 2, '6004 / Vert  bleu', '#024442'),
(220, 7, 3, '6004 / Vert  bleu', '#024442'),
(221, 7, 2, '6005 / Vert  mousse', '#114232'),
(222, 7, 3, '6005 / Vert  mousse', '#114232'),
(223, 7, 2, '6006 / Olive gris', '#3c392e'),
(224, 7, 3, '6006 / Olive gris', '#3c392e'),
(225, 7, 2, '6007 / Vert  bouteille', '#2c3222'),
(226, 7, 3, '6007 / Vert  bouteille', '#2c3222'),
(227, 7, 2, '6008 / Vert  brun', '#37342a'),
(228, 7, 3, '6008 / Vert  brun', '#37342a'),
(229, 7, 2, '6009 / Vert  sapin', '#27352a'),
(230, 7, 3, '6009 / Vert  sapin', '#27352a'),
(231, 7, 2, '6010 / Vert  herbe', '#4d6f39'),
(232, 7, 3, '6010 / Vert  herbe', '#4d6f39'),
(233, 7, 2, '6011 / Vert  réséda', '#6c7c59'),
(234, 7, 3, '6011 / Vert  réséda', '#6c7c59'),
(235, 7, 2, '6012 / Vert  noir', '#303d3a'),
(236, 7, 3, '6012 / Vert  noir', '#303d3a'),
(237, 7, 2, '6013 / Vert  jonc', '#7d765a'),
(238, 7, 3, '6013 / Vert  jonc', '#7d765a'),
(239, 7, 2, '6014 / Olive jaune', '#474135'),
(240, 7, 3, '6014 / Olive jaune', '#474135'),
(241, 7, 2, '6015 / Olive noir', '#3d3d36'),
(242, 7, 3, '6015 / Olive noir', '#3d3d36'),
(243, 7, 2, '6016 / Vert turquoise', '#00694c'),
(244, 7, 3, '6016 / Vert  turquoise', '#00694c'),
(245, 7, 2, '6017 / Vert mai', '#587f40'),
(246, 7, 3, '6017 / Vert mai', '#587f40'),
(247, 7, 2, '6018 / Vert jaune', '#61993b'),
(248, 7, 3, '6018 / Vert jaune', '#61993b'),
(249, 7, 2, '6019 / Vert blanc', '#b9ceac'),
(250, 7, 3, '6019 / Vert blanc', '#b9ceac'),
(251, 7, 2, '6020 / Vert oxyde chromique', '#37422f'),
(252, 7, 3, '6020 / Vert oxyde chromique', '#37422f'),
(253, 7, 2, '6021 / Vert pâle', '#8a9977'),
(254, 7, 3, '6021 / Vert pâle', '#8a9977'),
(255, 7, 2, '6022 / Olive brun', '#3a3327'),
(256, 7, 3, '6022 / Olive brun', '#3a3327'),
(257, 7, 2, '6024 / Vert signalisation', '#3c7460'),
(258, 7, 3, '6024 / Vert signalisation', '#3c7460'),
(259, 7, 2, '6025 / Vert fougère', '#5e6e3b'),
(260, 7, 3, '6025 / Vert fougère', '#5e6e3b'),
(261, 7, 2, '6026 / Vert opale', '#005f4e'),
(262, 7, 3, '6026 / Vert opale', '#005f4e'),
(263, 7, 2, '6027 / Vert clair', '#7ebab5'),
(264, 7, 3, '6027 / Vert clair', '#7ebab5'),
(265, 7, 2, '6028 / Vert pin', '#315442'),
(266, 7, 3, '6028 / Vert pin', '#315442'),
(267, 7, 2, '6029 / Vert menthe', '#006f3d'),
(268, 7, 3, '6029 / Vert menthe', '#006f3d'),
(269, 7, 2, '6032 / Vert de sécurité', '#237f52'),
(270, 7, 3, '6032 / Vert de sécurité', '#237f52'),
(271, 7, 2, '6033 / Turquoise menthe', '#46877f'),
(272, 7, 3, '6033 / Turquoise menthe', '#46877f'),
(273, 7, 2, '6034 / Turquoise pastel', '#7aacac'),
(274, 7, 3, '6034 / Turquoise pastel', '#7aacac'),
(275, 7, 2, '6035 / Vert nacré', '#194d25'),
(276, 7, 3, '6035 / Vert nacré', '#194d25'),
(277, 7, 2, '6036 / Vert opal nacré', '#04574b'),
(278, 7, 3, '6036 / Vert opal nacré', '#04574b'),
(279, 7, 2, '6037 / Vert pur', '#008b29'),
(280, 7, 3, '6037 / Vert pur', '#008b29'),
(281, 7, 2, '6038 / Vert brillant', '#00b51a'),
(282, 7, 3, '6038 / Vert brillant', '#00b51a'),
(283, 8, 2, '7000 / Gris petit-gris', '#7a888e'),
(284, 8, 3, '7000 / Gris petit-gris', '#7a888e'),
(285, 8, 2, '7001 / Gris argent', '#8c969d'),
(286, 8, 3, '7001 / Gris argent', '#8c969d'),
(287, 8, 2, '7002 / Gris olive', '#817863'),
(288, 8, 3, '7002 / Gris olive', '#817863'),
(289, 8, 2, '7003 / Gris mousse', '#7a7669'),
(290, 8, 3, '7003 / Gris mousse', '#7a7669'),
(291, 8, 2, '7004 / Gris de sécurité', '#9b9b9b'),
(292, 8, 3, '7004 / Gris de sécurité', '#9b9b9b'),
(293, 8, 2, '7005 / Gris souris', '#6c6e6b'),
(294, 8, 3, '7005 / Gris souris', '#6c6e6b'),
(295, 8, 2, '7006 / Gris beige', '#766a5e'),
(296, 8, 3, '7006 / Gris beige', '#766a5e'),
(297, 8, 2, '7008 / Gris kaki', '#745e3d'),
(298, 8, 3, '7008 / Gris kaki', '#745e3d'),
(299, 8, 2, '7009 / Gris vert', '#5d6058'),
(300, 8, 3, '7009 / Gris vert', '#5d6058'),
(301, 8, 2, '7010 / Gris tente', '#585c56'),
(302, 8, 3, '7010 / Gris tente', '#585c56'),
(303, 8, 2, '7011 / Gris fer', '#52595d'),
(304, 8, 3, '7011 / Gris fer', '#52595d'),
(305, 8, 2, '7012 / Gris basalte', '#575d5e'),
(306, 8, 3, '7012 / Gris basalte', '#575d5e'),
(307, 8, 2, '7013 / Gris brun', '#575044'),
(308, 8, 3, '7013 / Gris brun', '#575044'),
(309, 8, 2, '7015 / Gris ardoise', '#4f5358'),
(310, 8, 3, '7015 / Gris ardoise', '#4f5358'),
(311, 8, 2, '7016 / Gris anthracite', '#383e42'),
(312, 8, 3, '7016 / Gris anthracite', '#383e42'),
(313, 8, 2, '7021 / Gris noir', '#8c969d'),
(314, 8, 3, '7021 / Gris noir', '#8c969d'),
(315, 8, 2, '7022 / Gris terre d’ombre', '#4c4a44'),
(316, 8, 3, '7022 / Gris terre d’ombre', '#4c4a44'),
(317, 8, 2, '7023 / Gris béton', '#808076'),
(318, 8, 3, '7023 / Gris béton', '#808076'),
(319, 8, 2, '7024 / Gris graphite', '#45494e'),
(320, 8, 3, '7024 / Gris graphite', '#45494e'),
(321, 8, 2, '7026 / Gris granit', '#374345'),
(322, 8, 3, '7026 / Gris granit', '#374345'),
(323, 8, 2, '7030 / Gris pierre', '#928e85'),
(324, 8, 3, '7030 / Gris pierre', '#928e85'),
(325, 8, 2, '7031 / Gris bleu', '#5b686d'),
(326, 8, 3, '7031 / Gris bleu', '#5b686d'),
(327, 8, 2, '7032 / Gris silex', '#b5b0a1'),
(328, 8, 3, '7032 / Gris silex', '#b5b0a1'),
(329, 8, 2, '7033 / Gris ciment', '#7f8274'),
(330, 8, 3, '7033 / Gris ciment', '#7f8274'),
(331, 8, 2, '7034 / Gris jaune', '#92886f'),
(332, 8, 3, '7034 / Gris jaune', '#92886f'),
(333, 8, 2, '7035 / Gris clair', '#c5c7c4'),
(334, 8, 3, '7035 / Gris clair', '#c5c7c4'),
(335, 8, 2, '7036 / Gris platine', '#979392'),
(336, 8, 3, '7036 / Gris platine', '#979392'),
(337, 8, 2, '7037 / Gris poussière', '#7a7b7a'),
(338, 8, 3, '7037 / Gris poussière', '#7a7b7a'),
(339, 8, 2, '7038 / Gris agate', '#b0b0a9'),
(340, 8, 3, '7038 / Gris agate', '#b0b0a9'),
(341, 8, 2, '7039 / Gris quartz', '#8c969d'),
(342, 8, 3, '7039 / Gris quartz', '#8c969d'),
(343, 8, 2, '7040 / Gris fenêtre', '#989ea1'),
(344, 8, 3, '7040 / Gris fenêtre', '#989ea1'),
(345, 8, 2, '7042 / Gris signalisation A', '#8e9291'),
(346, 8, 3, '7042 / Gris signalisation A', '#8e9291'),
(347, 8, 2, '7043 / Gris signalisation B', '#4f5250'),
(348, 8, 3, '7043 / Gris signalisation B', '#4f5250'),
(349, 8, 2, '7044 / Gris soie', '#b7b3a8'),
(350, 8, 3, '7044 / Gris soie', '#b7b3a8'),
(351, 8, 2, '7045 / Telegris 1', '#8d9295'),
(352, 8, 3, '7045 / Telegris 1', '#8d9295'),
(353, 8, 2, '7046 / Telegris 2', '#7f868a'),
(354, 8, 3, '7046 / Telegris 2', '#7f868a'),
(355, 8, 2, '7047 / Telegris 4', '#c8c8c7'),
(356, 8, 3, '7047 / Telegris 4', '#c8c8c7'),
(357, 8, 2, '7048 / Gris souris nacré', '#817b73'),
(358, 8, 3, '7048 / Gris souris nacré', '#817b73'),
(359, 9, 2, '8000 / Brun vert', '#89693e'),
(360, 9, 3, '8000 / Brun vert', '#89693e'),
(361, 9, 2, '8001 / Brun terre de Sienne', '#9d622b'),
(362, 9, 3, '8001 / Brun terre de Sienne', '#9d622b'),
(363, 9, 2, '8002 / Brun de sécurité', '#794d3e'),
(364, 9, 3, '8002 / Brun de sécurité', '#794d3e'),
(365, 9, 2, '8003 / Brun argile', '#7e4b26'),
(366, 9, 3, '8003 / Brun argile', '#7e4b26'),
(367, 9, 2, '8004 / Brun cuivré', '#8d4931'),
(368, 9, 3, '8004 / Brun cuivré', '#8d4931'),
(369, 9, 2, '8007 / Brun fauve', '#70452a'),
(370, 9, 3, '8007 / Brun fauve', '#70452a'),
(371, 9, 2, '8008 / Brun olive', '#724a25'),
(372, 9, 3, '8008 / Brun olive', '#724a25'),
(373, 9, 2, '8011 / Brun noisette', '#5a3826'),
(374, 9, 3, '8011 / Brun noisette', '#5a3826'),
(375, 9, 2, '8012 / Brun rouge', '#66332b'),
(376, 9, 3, '8012 / Brun rouge', '#66332b'),
(377, 9, 2, '8014 / Brun sépia', '#4a3526'),
(378, 9, 3, '8014 / Brun sépia', '#4a3526'),
(379, 9, 2, '8015 / Marron', '#5e2f26'),
(380, 9, 3, '8015 / Marron', '#5e2f26'),
(381, 9, 2, '8016 / Brun acajou', '#4c2b20'),
(382, 9, 3, '8016 / Brun acajou', '#4c2b20'),
(383, 9, 2, '8017 / Brun chocolat', '#442f29'),
(384, 9, 3, '8017 / Brun chocolat', '#442f29'),
(385, 9, 2, '8019 / Brun gris', '#3d3635'),
(386, 9, 3, '8019 / Brun gris', '#3d3635'),
(387, 9, 2, '8022 / Brun noir', '#1a1718'),
(388, 9, 3, '8022 / Brun noir', '#1a1718'),
(389, 9, 2, '8023 / Brun orangé', '#a45729'),
(390, 9, 3, '8023 / Brun orangé', '#a45729'),
(391, 9, 2, '8024 / Brun beige', '#795038'),
(392, 9, 3, '8024 / Brun beige', '#795038'),
(393, 9, 2, '8025 / Brun pâle', '#755847'),
(394, 9, 3, '8025 / Brun pâle', '#755847'),
(395, 9, 2, '8028 / Brun terre', '#513a2a'),
(396, 9, 3, '8028 / Brun terre', '#513a2a'),
(397, 9, 2, '8029 / Cuivre nacré', '#7f4031'),
(398, 9, 3, '8029 / Cuivre nacré', '#7f4031'),
(399, 10, 2, '9001 / Blanc crème', '#e9e0d2'),
(400, 10, 3, '9001 / Blanc crème', '#e9e0d2'),
(401, 10, 2, '9002 / Blanc gris', '#d7d5cb'),
(402, 10, 3, '9002 / Blanc gris', '#d7d5cb'),
(403, 10, 2, '9003 / Blanc de sécurité', '#ecece7'),
(404, 10, 3, '9003 / Blanc de sécurité', '#ecece7'),
(405, 10, 2, '9004 / Noir de sécurité', '#2b2b2c'),
(406, 10, 3, '9004 / Noir de sécurité', '#2b2b2c'),
(407, 10, 2, '9005 / Noir foncé', '#0e0e10'),
(408, 10, 3, '9005 / Noir foncé', '#0e0e10'),
(409, 10, 2, '9006 / Aluminium blanc', '#a1a1a0'),
(410, 10, 3, '9006 / Aluminium blanc', '#a1a1a0'),
(411, 10, 2, '9007 / Aluminium gris', '#878581'),
(412, 10, 3, '9007 / Aluminium gris', '#878581'),
(413, 10, 2, '9010 / Blanc pur', '#f1ece1'),
(414, 10, 3, '9010 / Blanc pur', '#f1ece1'),
(415, 10, 2, '9011 / Noir graphite', '#27292b'),
(416, 10, 3, '9011 / Noir graphite', '#27292b'),
(417, 10, 2, '9016 / Blanc signalisation', '#f1f0ea'),
(418, 10, 3, '9016 / Blanc signalisation', '#f1f0ea'),
(419, 10, 2, '9017 / Noir signalisation', '#2a292a'),
(420, 10, 3, '9017 / Noir signalisation', '#2a292a'),
(421, 10, 2, '9018 / Blanc papyrus', '#c8cbc4'),
(422, 10, 3, '9018 / Blanc papyrus', '#c8cbc4'),
(423, 10, 2, '9022 / Gris clair nacré', '#858583'),
(424, 10, 3, '9022 / Gris clair nacré', '#858583'),
(425, 10, 2, '9023 / Gris fonçé nacré', '#797b7a'),
(426, 10, 3, '9023 / Gris fonçé nacré', '#797b7a');

-- --------------------------------------------------------

--
-- Structure de la table `rivet`
--

DROP TABLE IF EXISTS `rivet`;
CREATE TABLE IF NOT EXISTS `rivet` (
  `idRivet` int(10) NOT NULL,
  `idMatiereCorps` int(10) NOT NULL,
  `idMatiereTige` int(10) NOT NULL,
  `idType` int(10) NOT NULL,
  `idDiametreCorps` int(10) NOT NULL,
  `idLongueurCorps` int(10) NOT NULL,
  `quantite` int(10) NOT NULL,
  `prix_brut` float NOT NULL,
  `prix_peint` float NOT NULL,
  PRIMARY KEY (`idRivet`),
  KEY `rivet_type_reference_FK` (`idType`),
  KEY `rivet_longueur_corps0_FK` (`idLongueurCorps`),
  KEY `rivet_diametre_corps1_FK` (`idDiametreCorps`),
  KEY `rivet_matiere2_FK` (`idMatiereCorps`),
  KEY `rivet_matiere3_FK` (`idMatiereTige`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `rivet`
--

INSERT INTO `rivet` (`idRivet`, `idMatiereCorps`, `idMatiereTige`, `idType`, `idDiametreCorps`, `idLongueurCorps`, `quantite`, `prix_brut`, `prix_peint`) VALUES
(1, 1, 2, 1, 1, 1, 5, 0.24, 0.55),
(2, 1, 2, 1, 1, 2, 5, 0.24, 0.55),
(3, 1, 2, 1, 1, 3, 5, 0.24, 0.55),
(4, 1, 2, 1, 1, 5, 5, 0.24, 0.55),
(5, 1, 2, 1, 1, 7, 5, 0.24, 0.55),
(6, 1, 2, 1, 1, 9, 5, 0.24, 0.55),
(7, 1, 2, 1, 2, 1, 5, 0.24, 0.55),
(8, 1, 2, 1, 2, 3, 5, 0.24, 0.55),
(9, 1, 2, 1, 2, 5, 5, 0.24, 0.55),
(10, 1, 2, 1, 2, 7, 5, 0.24, 0.55),
(11, 1, 2, 1, 2, 9, 5, 0.24, 0.55),
(12, 1, 2, 1, 2, 10, 5, 0.24, 0.55),
(13, 1, 2, 1, 2, 12, 5, 0.24, 0.55),
(14, 1, 2, 1, 2, 13, 5, 0.24, 0.55),
(15, 1, 2, 1, 2, 14, 5, 0.24, 0.55),
(16, 1, 2, 1, 2, 17, 5, 0.4, 0.69),
(17, 1, 2, 1, 3, 1, 5, 0.24, 0.55),
(18, 1, 2, 1, 3, 3, 5, 0.24, 0.55),
(19, 1, 2, 1, 3, 5, 5, 0.24, 0.55),
(20, 1, 2, 1, 3, 7, 5, 0.24, 0.55),
(21, 1, 2, 1, 3, 9, 5, 0.24, 0.55),
(22, 1, 2, 1, 3, 10, 5, 0.24, 0.55),
(23, 1, 2, 1, 3, 12, 5, 0.24, 0.55),
(24, 1, 2, 1, 3, 13, 5, 0.24, 0.55),
(25, 1, 2, 1, 3, 14, 5, 0.24, 0.55),
(26, 1, 2, 1, 3, 17, 5, 0.3, 0.61),
(27, 1, 2, 1, 4, 9, 5, 0.24, 0.55),
(28, 1, 2, 1, 5, 3, 5, 0.24, 0.55),
(29, 1, 2, 1, 5, 5, 5, 0.24, 0.55),
(30, 1, 2, 1, 5, 7, 5, 0.24, 0.55),
(31, 1, 2, 1, 5, 9, 5, 0.24, 0.55),
(32, 1, 2, 1, 5, 10, 5, 0.24, 0.55),
(33, 1, 2, 1, 5, 12, 5, 0.24, 0.55),
(34, 1, 2, 1, 5, 13, 5, 0.24, 0.55),
(35, 1, 2, 1, 5, 14, 5, 0.24, 0.55),
(36, 1, 2, 1, 5, 17, 5, 0.25, 0.57),
(37, 1, 2, 1, 5, 20, 5, 0.25, 0.57),
(38, 1, 2, 1, 5, 21, 5, 0.27, 0.58),
(39, 1, 2, 1, 6, 3, 5, 0.24, 0.55),
(40, 1, 2, 1, 6, 5, 5, 0.24, 0.55),
(41, 1, 2, 1, 6, 7, 5, 0.24, 0.55),
(42, 1, 2, 1, 6, 9, 5, 0.24, 0.55),
(43, 1, 2, 1, 6, 10, 5, 0.24, 0.55),
(44, 1, 2, 1, 6, 12, 5, 0.24, 0.55),
(45, 1, 2, 1, 6, 13, 5, 0.24, 0.55),
(46, 1, 2, 1, 6, 14, 5, 0.24, 0.55),
(47, 1, 2, 1, 6, 15, 5, 0.24, 0.55),
(48, 1, 2, 1, 6, 17, 5, 0.25, 0.57),
(49, 1, 2, 1, 6, 19, 5, 0.29, 0.6),
(50, 1, 2, 1, 6, 20, 5, 0.27, 0.58),
(51, 1, 2, 1, 6, 21, 5, 0.29, 0.6),
(52, 1, 2, 1, 6, 22, 5, 0.32, 0.62),
(53, 1, 2, 1, 6, 23, 5, 0.36, 0.66),
(54, 1, 2, 1, 6, 24, 5, 0.42, 0.72),
(55, 1, 2, 1, 6, 25, 5, 0.62, 0.9),
(56, 1, 2, 1, 6, 26, 5, 0.62, 0.9),
(57, 1, 2, 1, 6, 27, 5, 0.79, 1.04),
(58, 1, 2, 1, 6, 28, 5, 0.95, 1.18),
(59, 1, 2, 1, 6, 29, 5, 1.1, 1.31),
(60, 1, 2, 1, 7, 5, 5, 0.25, 0.57),
(61, 1, 2, 1, 7, 7, 5, 0.35, 0.65),
(62, 1, 2, 1, 7, 9, 5, 0.25, 0.57),
(63, 1, 2, 1, 7, 10, 5, 0.38, 0.68),
(64, 1, 2, 1, 7, 20, 5, 0.3, 0.61),
(65, 1, 2, 1, 8, 5, 5, 0.27, 0.58),
(66, 1, 2, 1, 8, 7, 5, 0.25, 0.57),
(67, 1, 2, 1, 8, 9, 5, 0.27, 0.58),
(68, 1, 2, 1, 8, 10, 5, 0.25, 0.57),
(69, 1, 2, 1, 8, 11, 5, 0.27, 0.58),
(70, 1, 2, 1, 8, 12, 5, 0.25, 0.57),
(71, 1, 2, 1, 8, 13, 5, 0.29, 0.6),
(72, 1, 2, 1, 8, 15, 5, 0.29, 0.6),
(73, 1, 2, 1, 8, 17, 5, 0.29, 0.6),
(74, 1, 2, 1, 8, 18, 5, 0.29, 0.6),
(75, 1, 2, 1, 8, 20, 5, 0.32, 0.62),
(76, 1, 2, 1, 8, 21, 5, 0.35, 0.65),
(77, 1, 2, 1, 8, 22, 5, 0.38, 0.68),
(78, 1, 2, 1, 8, 23, 5, 0.46, 0.74),
(79, 1, 2, 1, 8, 24, 5, 1.28, 1.48),
(80, 1, 2, 1, 9, 7, 5, 0.27, 0.58),
(81, 1, 2, 1, 9, 9, 5, 0.27, 0.58),
(82, 1, 2, 1, 9, 11, 5, 0.29, 0.6),
(83, 1, 2, 1, 9, 12, 5, 0.29, 0.6),
(84, 1, 2, 1, 9, 13, 5, 0.29, 0.6),
(85, 1, 2, 1, 9, 14, 5, 0.29, 0.6),
(86, 1, 2, 1, 9, 15, 5, 0.3, 0.61),
(87, 1, 2, 1, 9, 17, 5, 0.34, 0.64),
(88, 1, 2, 1, 9, 20, 5, 0.34, 0.64),
(89, 1, 2, 1, 10, 11, 5, 0.4, 0.69),
(90, 1, 2, 1, 10, 13, 5, 0.4, 0.69),
(91, 1, 2, 1, 10, 18, 5, 0.47, 0.76),
(92, 1, 2, 2, 1, 3, 5, 0.24, 0.55),
(93, 1, 2, 2, 1, 5, 5, 0.24, 0.55),
(94, 1, 2, 2, 1, 7, 5, 0.25, 0.57),
(95, 1, 2, 2, 2, 3, 5, 0.24, 0.55),
(96, 1, 2, 2, 2, 5, 5, 0.24, 0.55),
(97, 1, 2, 2, 2, 7, 5, 0.24, 0.55),
(98, 1, 2, 2, 2, 9, 5, 0.24, 0.55),
(99, 1, 2, 2, 2, 10, 5, 0.24, 0.55),
(100, 1, 2, 2, 2, 12, 5, 0.25, 0.57),
(101, 1, 2, 2, 2, 13, 5, 0.24, 0.55),
(102, 1, 2, 2, 3, 3, 5, 0.24, 0.55),
(103, 1, 2, 2, 3, 4, 5, 0.24, 0.55),
(104, 1, 2, 2, 3, 5, 5, 0.24, 0.55),
(105, 1, 2, 2, 3, 7, 5, 0.24, 0.55),
(106, 1, 2, 2, 3, 9, 5, 0.24, 0.55),
(107, 1, 2, 2, 3, 10, 5, 0.24, 0.55),
(108, 1, 2, 2, 3, 12, 5, 0.24, 0.55),
(109, 1, 2, 2, 3, 13, 5, 0.24, 0.55),
(110, 1, 2, 2, 5, 3, 5, 0.24, 0.55),
(111, 1, 2, 2, 5, 4, 5, 0.24, 0.55),
(112, 1, 2, 2, 5, 5, 5, 0.24, 0.55),
(113, 1, 2, 2, 5, 7, 5, 0.24, 0.55),
(114, 1, 2, 2, 5, 9, 5, 0.24, 0.55),
(115, 1, 2, 2, 5, 10, 5, 0.24, 0.55),
(116, 1, 2, 2, 5, 12, 5, 0.24, 0.55),
(117, 1, 2, 2, 5, 13, 5, 0.24, 0.55),
(118, 1, 2, 2, 5, 14, 5, 0.24, 0.55),
(119, 1, 2, 2, 5, 17, 5, 0.25, 0.57),
(120, 1, 2, 2, 6, 5, 5, 0.24, 0.55),
(121, 1, 2, 2, 6, 7, 5, 0.24, 0.55),
(122, 1, 2, 2, 6, 9, 5, 0.24, 0.55),
(123, 1, 2, 2, 6, 10, 5, 0.25, 0.57),
(124, 1, 2, 2, 6, 12, 5, 0.25, 0.57),
(125, 1, 2, 2, 6, 13, 5, 0.25, 0.57),
(126, 1, 2, 2, 6, 14, 5, 0.27, 0.58),
(127, 1, 2, 2, 6, 15, 5, 0.27, 0.58),
(128, 1, 2, 2, 6, 17, 5, 0.29, 0.6),
(129, 1, 2, 2, 6, 20, 5, 0.4, 0.69),
(130, 1, 2, 2, 7, 9, 5, 0.36, 0.66),
(131, 1, 2, 2, 7, 12, 5, 0.41, 0.7),
(132, 1, 2, 2, 7, 20, 5, 0.34, 0.64),
(133, 1, 2, 3, 5, 5, 5, 0.24, 0.55),
(134, 1, 2, 3, 5, 14, 5, 0.24, 0.55),
(135, 1, 2, 3, 6, 5, 5, 0.24, 0.55),
(136, 1, 2, 3, 6, 7, 5, 0.24, 0.55),
(137, 1, 2, 3, 6, 9, 5, 0.24, 0.55),
(138, 1, 2, 3, 6, 10, 5, 0.24, 0.55),
(139, 1, 2, 3, 6, 12, 5, 0.25, 0.57),
(140, 1, 2, 3, 6, 13, 5, 0.25, 0.57),
(141, 1, 2, 3, 6, 14, 5, 0.27, 0.58),
(142, 1, 2, 3, 6, 17, 5, 0.29, 0.6),
(143, 1, 2, 3, 6, 20, 5, 0.34, 0.64),
(144, 1, 2, 3, 6, 21, 5, 0.38, 0.68),
(145, 1, 2, 3, 6, 22, 5, 0.41, 0.7),
(146, 1, 2, 3, 7, 9, 5, 0.25, 0.57),
(147, 1, 2, 3, 7, 10, 5, 0.24, 0.55),
(148, 1, 2, 3, 7, 14, 5, 0.25, 0.57),
(149, 1, 2, 3, 8, 14, 5, 0.38, 0.68),
(150, 1, 2, 4, 3, 3, 5, 0.24, 0.55),
(151, 1, 2, 4, 3, 7, 5, 0.24, 0.55),
(152, 1, 2, 4, 3, 9, 5, 0.24, 0.55),
(153, 1, 2, 4, 3, 12, 5, 0.24, 0.55),
(154, 1, 2, 4, 5, 5, 5, 0.24, 0.55),
(155, 1, 2, 4, 5, 7, 5, 0.24, 0.55),
(156, 1, 2, 4, 5, 9, 5, 0.24, 0.55),
(157, 1, 2, 4, 5, 10, 5, 0.24, 0.55),
(158, 1, 2, 4, 5, 12, 5, 0.25, 0.57),
(159, 1, 2, 4, 5, 13, 5, 0.25, 0.57),
(160, 1, 2, 4, 6, 12, 5, 0.25, 0.57),
(161, 1, 2, 4, 6, 13, 5, 0.3, 0.61),
(162, 1, 2, 4, 6, 14, 5, 0.29, 0.6),
(163, 1, 2, 4, 6, 21, 5, 0.32, 0.62),
(164, 1, 2, 4, 9, 9, 5, 0.38, 0.68),
(165, 1, 2, 4, 9, 12, 5, 0.41, 0.7);

-- --------------------------------------------------------

--
-- Structure de la table `rivets_cart`
--

DROP TABLE IF EXISTS `rivets_cart`;
CREATE TABLE IF NOT EXISTS `rivets_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordered` tinyint(1) NOT NULL,
  `ordered_date` datetime(6) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rivets_cart_orders`
--

DROP TABLE IF EXISTS `rivets_cart_orders`;
CREATE TABLE IF NOT EXISTS `rivets_cart_orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cart_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rivets_cart_orders_cart_id_order_id_deef752f_uniq` (`cart_id`,`order_id`),
  KEY `rivets_cart_orders_cart_id_0a49a408` (`cart_id`),
  KEY `rivets_cart_orders_order_id_e88c24c3` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rivets_order`
--

DROP TABLE IF EXISTS `rivets_order`;
CREATE TABLE IF NOT EXISTS `rivets_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `ordered` tinyint(1) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rivets_order_product_id_26127413` (`product_id`),
  KEY `rivets_order_user_id_658c0b53` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rivets_products`
--

DROP TABLE IF EXISTS `rivets_products`;
CREATE TABLE IF NOT EXISTS `rivets_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `slug` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rivets_products_category_id_46354f3c` (`category_id`),
  KEY `rivets_products_slug_1c66eabc` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `rivets_products`
--

INSERT INTO `rivets_products` (`id`, `name`, `price`, `image`, `category_id`, `is_active`, `slug`) VALUES
(1, 'boite', 200, 'uploads/products/bal_bleue_1.png', 1, 1, 'boite');

-- --------------------------------------------------------

--
-- Structure de la table `teinte`
--

DROP TABLE IF EXISTS `teinte`;
CREATE TABLE IF NOT EXISTS `teinte` (
  `idTeinte` int(10) NOT NULL,
  `libelle` char(50) NOT NULL,
  PRIMARY KEY (`idTeinte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `teinte`
--

INSERT INTO `teinte` (`idTeinte`, `libelle`) VALUES
(1, 'Aucune'),
(2, 'Jaune'),
(3, 'Orange'),
(4, 'Rouge'),
(5, 'Violet'),
(6, 'Bleu'),
(7, 'Vert'),
(8, 'Gris'),
(9, 'Brun'),
(10, 'Blanc et noir');

-- --------------------------------------------------------

--
-- Structure de la table `type_reference`
--

DROP TABLE IF EXISTS `type_reference`;
CREATE TABLE IF NOT EXISTS `type_reference` (
  `idType` int(10) NOT NULL,
  `libelle` char(50) NOT NULL,
  PRIMARY KEY (`idType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_reference`
--

INSERT INTO `type_reference` (`idType`, `libelle`) VALUES
(1, 'Plat'),
(2, 'Fraisé'),
(3, 'Large'),
(4, 'Extra large');

-- --------------------------------------------------------

--
-- Structure de la table `type_teinte`
--

DROP TABLE IF EXISTS `type_teinte`;
CREATE TABLE IF NOT EXISTS `type_teinte` (
  `idType` int(10) NOT NULL,
  `libelle` char(50) NOT NULL,
  PRIMARY KEY (`idType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_teinte`
--

INSERT INTO `type_teinte` (`idType`, `libelle`) VALUES
(1, 'Aucun'),
(2, 'Mat'),
(3, 'Brillant');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `idUtilisateur` int(10) NOT NULL,
  `nom` char(50) NOT NULL,
  `prenom` char(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `telephone` int(10) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `statut` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

DROP TABLE IF EXISTS `vente`;
CREATE TABLE IF NOT EXISTS `vente` (
  `idVente` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
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
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `ral`
--
ALTER TABLE `ral`
  ADD CONSTRAINT `ral_teinte_FK` FOREIGN KEY (`idTeinte`) REFERENCES `teinte` (`idTeinte`),
  ADD CONSTRAINT `ral_type_teinte0_FK` FOREIGN KEY (`idType`) REFERENCES `type_teinte` (`idType`);

--
-- Contraintes pour la table `rivet`
--
ALTER TABLE `rivet`
  ADD CONSTRAINT `rivet_diametre_corps1_FK` FOREIGN KEY (`idDiametreCorps`) REFERENCES `diametre_corps` (`idDiametreCorps`),
  ADD CONSTRAINT `rivet_longueur_corps0_FK` FOREIGN KEY (`idLongueurCorps`) REFERENCES `longueur_corps` (`idLongueurCorps`),
  ADD CONSTRAINT `rivet_matiere2_FK` FOREIGN KEY (`idMatiereCorps`) REFERENCES `matiere` (`idMatiere`),
  ADD CONSTRAINT `rivet_matiere3_FK` FOREIGN KEY (`idMatiereTige`) REFERENCES `matiere` (`idMatiere`),
  ADD CONSTRAINT `rivet_type_reference_FK` FOREIGN KEY (`idType`) REFERENCES `type_reference` (`idType`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
