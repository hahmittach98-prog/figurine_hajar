-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 06 oct. 2026 à 11:04
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `figurine_hajar_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20261006070728', '2026-10-06 07:07:49', 35),
('DoctrineMigrations\\Version20261006072900', '2026-10-06 07:29:17', 255),
('DoctrineMigrations\\Version20261006082020', '2026-10-06 08:20:49', 203),
('DoctrineMigrations\\Version20261006093706', '2026-10-06 09:37:22', 180);

-- --------------------------------------------------------

--
-- Structure de la table `figurines`
--

DROP TABLE IF EXISTS `figurines`;
CREATE TABLE IF NOT EXISTS `figurines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext,
  `image_name` varchar(500) NOT NULL,
  `prix` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_45D9EB61A76ED395` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `figurines`
--

INSERT INTO `figurines` (`id`, `title`, `description`, `image_name`, `prix`, `created_at`, `updated_at`, `user_id`) VALUES
(4, 'dragoBall Z', 'Disponible seulement, en ligne ? Votre figurine préférée !', 'dragonball-6ac4cfed53b02842854600.webp', 49, '2026-10-06 10:39:41', '2026-10-06 10:39:41', 3),
(3, 'Winx Club', 'Les winx , animés des années 2000 . 4 figurines disponibles chez nous : Flora , Luna , Elsa et Bloom', 'winx-6ac4c8fe3c3b9615635550.webp', 56, '2026-10-06 10:10:06', '2026-10-06 10:10:06', 1),
(5, 'Le mega Dragon', 'Le méga dragon vient tout droit du Japon . Il est exclusive en Belgique. Achetez le rapidement avant la rupture de stock.', 'dragon-6ac4d036ac8ee371347735.webp', 23, '2026-10-06 10:40:54', '2026-10-06 10:40:54', 3),
(6, 'Power rangers', 'Power Rangers est une franchise de médias américaine fondée sur une équipe de super-héros. Les Power Rangers sont adaptés des séries japonaises Super sentai, les producteurs américains rachetant les droits d\'utilisation des images et les costumes aux producteurs japonais.', 'powerangers-6ac4d135ea95f336075880.webp', 35.99, '2026-10-06 10:45:09', '2026-10-06 10:45:09', 4),
(7, 'Teletubbies', 'Les Télétubbies (Teletubbies) est une série télévisée britannique pour la jeunesse en 365 épisodes de 25 minutes, créée par Anne Wood et Andrew Davenport, produite par Ragdoll Productions. La série originale a été diffusée à partir du 31 mars 1997 sur le réseau BBC et destinée principalement aux tout-petits de 1 à 4 ans.', 'telletubies-6ac4d1837d3a7148593075.webp', 28.99, '2026-10-06 10:46:27', '2026-10-06 10:46:27', 4),
(8, 'Elsa - Reine des neiges', 'Elsa d\'Arendelle, aussi appelée la Reine des neiges, est un personnage de fiction qui est apparu pour la première fois dans le 53e Classique d\'animation des studios Disney, La Reine des neiges. Elle est interprétée en version originale (anglais) par Idina Menzel, et doublée par Anaïs Delva en français, et par Aurélie Morgane en français canadien seulement pour les parties non chantées.', 'elsa-6ac4d29eb96a9192998884.webp', 18.99, '2026-10-06 10:51:10', '2026-10-06 10:51:10', 3),
(9, 'Homer Simpson', 'Homer Jay Simpson est le principal personnage fictif de la série télévisée d\'animation Les Simpson et le père de la famille du même nom. Il est doublé par Dan Castellaneta dans la version originale, Philippe Peythieu dans la version française et Hubert Gagnon puis par Thiéry Dubé dans la version québécoise. Homer est apparu pour la première fois à la télévision avec le reste de la famille dans le court métrage Good Night, le 19 avril 1987. H', 'homer-6ac4d2eda759e979242246.webp', 18.56, '2026-10-06 10:52:29', '2026-10-06 10:52:29', 3),
(10, 'Marge Simpson', 'Homer Jay Simpson est le principal personnage fictif de la série télévisée d\'animation Les Simpson et le père de la famille du même nom. Il est doublé par Dan Castellaneta dans la version originale, Philippe Peythieu dans la version française et Hubert Gagnon puis par Thiéry Dubé dans la version québécoise. Homer est apparu pour la première fois à la télévision avec le reste de la famille dans le court métrage Good Night, le 19 avril 1987. H', 'marge-6ac4d371c547a696709702.webp', 22.5, '2026-10-06 10:54:41', '2026-10-06 10:54:41', 4),
(11, 'Le rataTouille', 'Homer Jay Simpson est le principal personnage fictif de la série télévisée d\'animation Les Simpson et le père de la famille du même nom. Il est doublé par Dan Castellaneta dans la version originale, Philippe Peythieu dans la version française et Hubert Gagnon puis par Thiéry Dubé dans la version québécoise. Homer est apparu pour la première fois à la télévision avec le reste de la famille dans le court métrage Good Night, le 19 avril 1987. H', 'ratatoutille-6ac4d3c7a434d352109854.webp', 10.4, '2026-10-06 10:56:07', '2026-10-06 10:56:07', 4),
(12, 'Dora', 'Dora l\'exploratrice (Dora the Explorer) est une série télévisée d\'animation américaine pour la jeunesse créée par Valerie Walsh, Eric Weiner et Chris Gifford et diffusée entre le 14 août 2000 et le 9 août 2019 sur la chaîne Nickelodeon.', 'dora-6ac4d4477f195635078130.webp', 18, '2026-10-06 10:58:15', '2026-10-06 10:58:15', 1),
(13, 'Bébé Lyly', 'En 1958, il remporte un vif succès au Brésil avec la chanson Chega de Saudade[3], mais ce n\'est qu\'en 1964 que son succès devient international avec son interprétation de Garota de Ipanema (The Girl From Ipanema), accompagné de Stan Getz. Depuis, cette chanson a été reprise en diverses langues par de nombreux artistes prestigieux tels que Frank Sinatra, Nat King Cole ou encore Ella Fitzgerald.', 'bebe-6ac4d4a5a2b92916544719.webp', 9.99, '2026-10-06 10:59:49', '2026-10-06 10:59:49', 1),
(14, 'K-POP', 'K-pop (abréviation de Korean pop[1]) est un terme désignant plusieurs genres musicaux (dance-pop, pop ballad, électronique[2], etc.) originaires de Corée du Sud et caractérisés par une large variété d\'éléments audiovisuels.', 'kpop-6ac4d4fa69cc8533265756.webp', 32.85, '2026-10-06 11:01:14', '2026-10-06 11:01:14', 1);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0E3BD61CE16BA31DBBF396750` (`queue_name`,`available_at`,`delivered_at`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `image_name` varchar(500) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_verified` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `image_name`, `created_at`, `updated_at`, `email`, `roles`, `password`, `is_verified`) VALUES
(1, 'hajar', 'ahmittach', 'drapeau3-6ac4c57b9fd95017163387.png', '2026-10-06 08:21:29', '2026-10-06 09:55:07', 'hajar@figu.be', '[]', '$2y$13$KTXdFVFo0GbDicoIil20t.SG7TuW6xO.6uTMt8P/THIge4s74A7A2', 1),
(2, 'adam', 'Ahmittach', NULL, '2026-10-06 10:28:40', '2026-10-06 10:28:40', 'adam@figurine.be', '[]', '$2y$13$p3/BKaJHXYnYsaf22rWM/uV8M6YXWCijvWxZJIb1MW7MuGaBb.ne6', 0),
(3, 'adam', 'jedou', 'drapeau2-6ac4cf62279fc937426749.png', '2026-10-06 10:30:08', '2026-10-06 10:37:35', 'adam@figu.be', '[]', '$2y$13$ksmpL/uraCsXQPRxAqa73.pcCjCk7RxvrYO3/50M2NLe17a5AkaI6', 1),
(4, 'houri', 'meri', 'bond-6ac4d331ef8c9620751755.jpg', '2026-10-06 10:41:35', '2026-10-06 10:53:37', 'houri@cfitech.be', '[]', '$2y$13$FoNf925dzpAgyRsOA0BcIOlFLFVYPsi3exD4X6MdKloh9IRlZonXa', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
