-- Adminer 4.8.1 MySQL 8.0.34 dump
SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';
SET NAMES utf8mb4;
-- CREATE DATABASE `ministages44_1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ministages44_1`;
-- --------------------------------------------------------
--
-- Structure de la table `t_profil` modif id
--
DROP TABLE IF EXISTS `t_profil`;
CREATE TABLE `t_profil` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nom` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
-- --------------------------------------------------------
--
-- Structure de la table `t_fonction` modif id
--
DROP TABLE IF EXISTS `t_fonction`;
CREATE TABLE `t_fonction` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nom` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
-- --------------------------------------------------------
--
-- Structure de la table `t_academie` modif id
--
DROP TABLE IF EXISTS `t_academie`;
CREATE TABLE `t_academie` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nom` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
-- --------------------------------------------------------
--
-- Structure de la table `t_typeetab` modif id
--
DROP TABLE IF EXISTS `t_typeetab`;
CREATE TABLE `t_typeetab` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nom` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci
           NOT NULL,
    `nomcourt` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT
               NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
--
-- Structure de la table `t_utilisateur`
--
DROP TABLE IF EXISTS `t_utilisateur`;
CREATE TABLE `t_utilisateur` (
    `id` int NOT NULL AUTO_INCREMENT,
    `identifiant` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `mdp` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `idprofil` int NOT NULL,
    `nom` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `prenom` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `mail` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `idfonction` int DEFAULT NULL,
    `tel` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `important` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `important2` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
    `rattacher` int DEFAULT NULL,
    `id_etablissement` int NULL,
    `clauses_texte` text character set utf8mb3 COLLATE utf8mb3_bin NULL,
    PRIMARY KEY (`id`),
    KEY `idfonction` (`idfonction`),
    KEY `idetablissement` (`id_etablissement`),
    KEY `idprofil` (`idprofil`),
    KEY `rattacher` (`rattacher`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
-- --------------------------------------------------------
--
-- Structure de la table `t_etablissement` modif
--
DROP TABLE IF EXISTS `t_etablissement`;
CREATE TABLE `t_etablissement` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nom` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `nom court` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `idtype` int NOT NULL,
    `idacademie` int NOT NULL,
    `adresse` varchar(150) NOT NULL,
    `ville` varchar(100) NOT NULL,
    `cp` varchar(5) NOT NULL,
    `mailetab` varchar(50) NOT NULL,
    `RNE` varchar(50) NOT NULL,
    `logo` text NOT NULL,
    `cachet` text NOT NULL,
    `tel` varchar(20) NOT NULL,
    PRIMARY KEY (`id`),
    KEY 'idtype' ('idtype'),
    KEY 'idacademie' ('idacademie')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
-- --------------------------------------------------------
--
-- Structure de la table `t_typeformation` modif id
--
DROP TABLE IF EXISTS `t_typeformation`;
CREATE TABLE `t_typeformation` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nom` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT
                NULL,
    `nomcourt` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin
       NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
-- --------------------------------------------------------
--
-- Structure de la table `t_formation` modif id
--
DROP TABLE IF EXISTS `t_formation`;
CREATE TABLE `t_formation` (
    `id` int NOT NULL AUTO_INCREMENT,
    `idtype` int NOT NULL,
    `nom` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    PRIMARY KEY (`id`),
    KEY `idtype` (`idtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
--
-- Structure de la table `logactionutilisateur` modif
--
DROP TABLE IF EXISTS `logactionutilisateur`;
CREATE TABLE `logactionutilisateur` (
    `id` int NOT NULL AUTO_INCREMENT,
    `action` varchar(256) character set utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `temps` TIME,
    `idUtilisateur` char(32) character set utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    PRIMARY KEY ('id'),
    KEY 'idUtilisateur' ('idutilisateur')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
-- --------------------------------------------------------
--
-- Structure de la table `t_formationfavorite` modif
--
DROP TABLE IF EXISTS `t_formationfavorite`;
CREATE TABLE `t_formationfavorite` (
    `id` int NOT NULL AUTO_INCREMENT,
    `idformation` int NOT NULL,
    `idutilisateur` int NOT NULL,
    PRIMARY KEY (`id`),
    KEY `idformation` (`idformation`),
    KEY `idutilisateur` (`idutilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utfmb3_bin;
-- --------------------------------------------------------
--
-- Structure de la table `t_ministage` modif pk id & id etab
--
DROP TABLE IF EXISTS `t_ministage`;
CREATE TABLE `t_ministage` (
    `id` int NOT NULL AUTO_INCREMENT,
    `idOffrant` int NOT NULL,
    `idformation` int NOT NULL,
    `civilite` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `nomProf` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `date` date NOT NULL,
    `hdebut` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `hfin` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `nbplace` int NOT NULL,
    `nbplacereste` int NOT NULL,
    `lieu` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id_2` (`id`),
    KEY `id` (`id`),
    KEY `id_3` (`id`),
    KEY `id_4` (`id`),
    KEY `id_5` (`id`),
    KEY `id_6` (`id`),
    KEY `idformation` (`idformation`),
    KEY `idetablissement` (`idOffrant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
-- --------------------------------------------------------
--
-- Structure de la table `t_reservation`
--
DROP TABLE IF EXISTS `t_reservation`;
CREATE TABLE `t_reservation` (
    `id` int NOT NULL AUTO_INCREMENT,
    `idmini` int NOT NULL,
    `nom` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `prenom` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `idReservant` int NOT NULL,
    `idEtabOrigine` int NULL,
    `confirmation` tinyint(1) NOT NULL,
    `rappel` smallint NOT NULL,
    `absence` smallint NOT NULL,
    PRIMARY KEY (`id`),
    KEY `idmini` (`idmini`),
    KEY `idmini_2` (`idmini`),
    KEY `idReservant` (`idreservant`),
    KEY 'idetablissement' ('idEtabOrigine')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Contraintes pour la table `t_utilisateur`
ALTER TABLE `t_utilisateur`
    ADD CONSTRAINT `FK_UtilisateurToFonction` FOREIGN KEY (`idfonction`) REFERENCES
        `t_fonction` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `FK_UtilisateurToProfil` FOREIGN KEY (`idprofil`) REFERENCES `t_profil`
        (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `FK_UtilisateurToEtablissement` FOREIGN KEY (`id_etablissement`) REFERENCES
        `t_etablissement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Contraintes pour la table `t_formationfavorite`
ALTER TABLE `t_formationfavorite`
    ADD CONSTRAINT `FK_FormFavToFormation` FOREIGN KEY ('idformation') REFERENCES 't_formation'('id')
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    ADD CONSTRAINT `FK_FormFavToUtilisateur` FOREIGN KEY ('idutilisateur') REFERENCES 't_utilisateur'('id')
        ON DELETE RESTRICT ON UPDATE RESTRICT;
--
-- Contraintes pour la table `t_formation`
ALTER TABLE `t_formation`
    ADD CONSTRAINT `FK_FormationToTypeformation` FOREIGN KEY (`idtype`) REFERENCES
        `t_typeformation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Contraintes pour la table `t_ministage`
ALTER TABLE `t_ministage`
    ADD CONSTRAINT `FK_MinistageToUtilisateur` FOREIGN KEY (`idOffrant`) REFERENCES
        `t_utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `FK_MinistageToFormation` FOREIGN KEY (`idformation`) REFERENCES
        `t_formation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Contraintes pour la table `t_reservation`
ALTER TABLE `t_reservation`
    ADD CONSTRAINT `FK_ReservationToUtilisateur` FOREIGN KEY (`idReservant`) REFERENCES
        `t_utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `FK_ReservationToMinistage` FOREIGN KEY (`idmini`) REFERENCES
        `t_ministage` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `FK_ReservationToEtablissement` FOREIGN KEY (`idEtabOrigine`) REFERENCES
        `t_etablissement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Contraintes pour la table `t_etablissement`
ALTER TABLE 't_etablissement'
    ADD CONSTRAINT 'FK_EtablissementToType' FOREIGN KEY (`idtype`) REFERENCES
        `t_typeformation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT 'FK_EtablissementToAcademie' FOREIGN KEY (`idacademie`) REFERENCES
        `t_academie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
