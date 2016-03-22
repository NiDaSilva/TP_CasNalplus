-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 22 Mars 2016 à 17:47
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `tp10`
--

-- --------------------------------------------------------

--
-- Structure de la table `acteur`
--

CREATE TABLE IF NOT EXISTS `acteur` (
  `CODE` int(11) NOT NULL,
  `COTEPOPULARITE` int(11) DEFAULT NULL,
  `NOMPERSONNAGE` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `NOM` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `PRENOM` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `acteur`
--

INSERT INTO `acteur` (`CODE`, `COTEPOPULARITE`, `NOMPERSONNAGE`, `NOM`, `PRENOM`) VALUES
(1, 2, 'julien', 'edgard', 'christophe'),
(2, 2, 'jule', 'Junio', 'edouard');

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

CREATE TABLE IF NOT EXISTS `avis` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` int(11) NOT NULL,
  `NOTE` int(11) DEFAULT NULL,
  `COMMENTAIRE` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `I_FK_AVIS_PROGRAMME` (`CODE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `avis`
--

INSERT INTO `avis` (`ID`, `CODE`, `NOTE`, `COMMENTAIRE`) VALUES
(1, 1, 4, NULL);

--
-- Déclencheurs `avis`
--
DROP TRIGGER IF EXISTS `AjoutNote`;
DELIMITER //
CREATE TRIGGER `AjoutNote` BEFORE INSERT ON `avis`
 FOR EACH ROW begin

if(new.NOTE<0 or new.NOTE>5)
then
signal sqlstate '16440' set message_text = 'La note n est pas comprise entre 0 et 5';
end if;
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `chaine`
--

CREATE TABLE IF NOT EXISTS `chaine` (
  `ID` int(11) NOT NULL,
  `NOMCHAINE` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `chaine`
--

INSERT INTO `chaine` (`ID`, `NOMCHAINE`) VALUES
(1, 'CANAL+'),
(2, 'CANAL+ SPORT'),
(3, 'CANAL+ FAMILY'),
(4, 'CANAL+ CINEMA');

-- --------------------------------------------------------

--
-- Structure de la table `comprendre`
--

CREATE TABLE IF NOT EXISTS `comprendre` (
  `CODE` int(11) NOT NULL,
  `CODE_ACTEUR` int(11) NOT NULL DEFAULT '0',
  `CODE_REALISATEUR` int(11) NOT NULL DEFAULT '0',
  `CODE_INVITE` int(11) NOT NULL DEFAULT '0',
  `CODE_PRESENTATEUR` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CODE`,`CODE_ACTEUR`,`CODE_REALISATEUR`,`CODE_INVITE`,`CODE_PRESENTATEUR`),
  KEY `I_FK_COMPRENDRE_PROGRAMME` (`CODE`),
  KEY `I_FK_COMPRENDRE_ACTEUR` (`CODE_ACTEUR`),
  KEY `I_FK_COMPRENDRE_REALISATEUR` (`CODE_REALISATEUR`),
  KEY `I_FK_COMPRENDRE_INVITE` (`CODE_INVITE`),
  KEY `I_FK_COMPRENDRE_PRESENTATEUR` (`CODE_PRESENTATEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `comprendre`
--

INSERT INTO `comprendre` (`CODE`, `CODE_ACTEUR`, `CODE_REALISATEUR`, `CODE_INVITE`, `CODE_PRESENTATEUR`) VALUES
(1, 2, 3, 2, 2),
(3, 2, 2, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `diffuser`
--

CREATE TABLE IF NOT EXISTS `diffuser` (
  `ID` int(11) NOT NULL,
  `CODE` int(11) NOT NULL,
  `DATE` date NOT NULL,
  `HEURE` time NOT NULL,
  PRIMARY KEY (`ID`,`CODE`,`DATE`),
  KEY `I_FK_DIFFUSER_CHAINE` (`ID`),
  KEY `I_FK_DIFFUSER_PROGRAMME` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `diffuser`
--

INSERT INTO `diffuser` (`ID`, `CODE`, `DATE`, `HEURE`) VALUES
(1, 3, '2016-03-23', '02:06:01'),
(2, 1, '2016-03-31', '03:02:00');

-- --------------------------------------------------------

--
-- Structure de la table `invite`
--

CREATE TABLE IF NOT EXISTS `invite` (
  `CODE` int(11) NOT NULL,
  `COUT` int(11) DEFAULT NULL,
  `NOM` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `PRENOM` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `invite`
--

INSERT INTO `invite` (`CODE`, `COUT`, `NOM`, `PRENOM`) VALUES
(1, 142, 'lepers', 'julien'),
(2, 22, 'ferri', 'carine');

-- --------------------------------------------------------

--
-- Structure de la table `nationalite`
--

CREATE TABLE IF NOT EXISTS `nationalite` (
  `ID` int(11) NOT NULL,
  `NOMNATIONALITE` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `PAYS` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `nationalite`
--

INSERT INTO `nationalite` (`ID`, `NOMNATIONALITE`, `PAYS`) VALUES
(1, 'belge', 'belgique'),
(2, 'francaise', 'france'),
(3, 'Americaine', 'Etat-Unis'),
(4, 'Suisse', 'Suisse');

-- --------------------------------------------------------

--
-- Structure de la table `periode`
--

CREATE TABLE IF NOT EXISTS `periode` (
  `ID` smallint(6) NOT NULL,
  `HEUREDEBUT` time DEFAULT NULL,
  `HEUREFIN` time DEFAULT NULL,
  `LIBELLE` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `periode`
--

INSERT INTO `periode` (`ID`, `HEUREDEBUT`, `HEUREFIN`, `LIBELLE`) VALUES
(1, '00:00:00', '06:00:00', 'nuit'),
(2, '06:00:00', '12:00:00', 'matin');

-- --------------------------------------------------------

--
-- Structure de la table `presentateur`
--

CREATE TABLE IF NOT EXISTS `presentateur` (
  `CODE` int(11) NOT NULL,
  `PROFESSION` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `NOM` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `PRENOM` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `presentateur`
--

INSERT INTO `presentateur` (`CODE`, `PROFESSION`, `NOM`, `PRENOM`) VALUES
(1, 'presentateur', 'Castaldi', 'Benjamin'),
(2, 'presentateur', 'Drucker', 'Michel');

-- --------------------------------------------------------

--
-- Structure de la table `programme`
--

CREATE TABLE IF NOT EXISTS `programme` (
  `CODE` int(11) NOT NULL,
  `ID_P` smallint(6) NOT NULL,
  `ID_T` int(11) NOT NULL,
  `ID_S` smallint(6) DEFAULT NULL,
  `ID_N` int(11) NOT NULL,
  `DUREE` time DEFAULT NULL,
  `DESCRIPTION` varchar(20000) COLLATE utf8_bin DEFAULT NULL,
  `DIFFUSION` tinyint(1) DEFAULT NULL,
  `ANNEEREALISATION` date DEFAULT NULL,
  `TITRE` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `TITREORIGINAL` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `HD` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`CODE`),
  KEY `I_FK_PROGRAMME_PERIODE` (`ID_P`),
  KEY `I_FK_PROGRAMME_TYPE` (`ID_T`),
  KEY `I_FK_PROGRAMME_SIGNALETIQUEJEUNESSE` (`ID_S`),
  KEY `I_FK_PROGRAMME_NATIONALITE` (`ID_N`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `programme`
--

INSERT INTO `programme` (`CODE`, `ID_P`, `ID_T`, `ID_S`, `ID_N`, `DUREE`, `DESCRIPTION`, `DIFFUSION`, `ANNEEREALISATION`, `TITRE`, `TITREORIGINAL`, `HD`) VALUES
(1, 1, 2, 1, 2, '02:06:00', 'u XXIII siècle, dans un univers étrange et coloré, où tout espoir de survie est impossible sans la découverte du cinquième élément, un héros affronte le mal pour sauver l''humanité.', 1, '1997-05-17', 'LE CINQUIÈME ÉLÉMENT', 'LE CINQUIÈME ÉLÉMENT', 0),
(2, 1, 3, NULL, 2, '02:06:05', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l''imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n''a pas fait que survivre cinq siècles, mais s''est aussi adapté à la bureautique informatique, sans que son contenu n''en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusi', NULL, '2014-02-20', 'LES GRILLONS', 'LES GRILLONS', 1),
(3, 2, 4, 1, 1, '01:06:02', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis n', 1, '2016-03-14', 'D''OU VIENT IL', 'De Ciceron ', 0),
(4, 1, 5, NULL, 3, '06:02:04', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.', NULL, '2002-12-10', 'LES ROSES', 'PINK', NULL);

--
-- Déclencheurs `programme`
--
DROP TRIGGER IF EXISTS `HD`;
DELIMITER //
CREATE TRIGGER `HD` BEFORE INSERT ON `programme`
 FOR EACH ROW begin
if(new.HD != 1 or new.HD is not null)
then
signal sqlstate '16440' set message_text = 'HD est a null ou à -1';
end if;
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `realisateur`
--

CREATE TABLE IF NOT EXISTS `realisateur` (
  `CODE` int(11) NOT NULL,
  `NBFILM` int(11) DEFAULT NULL,
  `NOM` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `PRENOM` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `realisateur`
--

INSERT INTO `realisateur` (`CODE`, `NBFILM`, `NOM`, `PRENOM`) VALUES
(1, 2, 'Abrams', 'Jeffrey Jacob'),
(2, 4, 'Martin', 'Scorsese'),
(3, 5, 'Besson', 'Luc');

-- --------------------------------------------------------

--
-- Structure de la table `signaletiquejeunesse`
--

CREATE TABLE IF NOT EXISTS `signaletiquejeunesse` (
  `ID` smallint(6) NOT NULL,
  `AGE` char(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `signaletiquejeunesse`
--

INSERT INTO `signaletiquejeunesse` (`ID`, `AGE`) VALUES
(1, '10'),
(2, '12');

--
-- Déclencheurs `signaletiquejeunesse`
--
DROP TRIGGER IF EXISTS `AjoutAge`;
DELIMITER //
CREATE TRIGGER `AjoutAge` BEFORE INSERT ON `signaletiquejeunesse`
 FOR EACH ROW begin

if( new.AGE != 10 or new.AGE != 12 or new.AGE != 16 or new.AGE != 18)
then
signal sqlstate '16440' set message_text = 'l age  doit etre 10, 12, 16 ou 18';
end if;
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `ID` int(11) NOT NULL,
  `TYPEPROGRAMME` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `type`
--

INSERT INTO `type` (`ID`, `TYPEPROGRAMME`) VALUES
(1, 'Divertissement'),
(2, 'Film'),
(3, 'Serie'),
(4, 'Documentaire'),
(5, 'Journal');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `avis`
--
ALTER TABLE `avis`
  ADD CONSTRAINT `avis_ibfk_1` FOREIGN KEY (`CODE`) REFERENCES `programme` (`CODE`);

--
-- Contraintes pour la table `comprendre`
--
ALTER TABLE `comprendre`
  ADD CONSTRAINT `comprendre_ibfk_5` FOREIGN KEY (`CODE_PRESENTATEUR`) REFERENCES `presentateur` (`CODE`),
  ADD CONSTRAINT `comprendre_ibfk_1` FOREIGN KEY (`CODE`) REFERENCES `programme` (`CODE`),
  ADD CONSTRAINT `comprendre_ibfk_2` FOREIGN KEY (`CODE_ACTEUR`) REFERENCES `acteur` (`CODE`),
  ADD CONSTRAINT `comprendre_ibfk_3` FOREIGN KEY (`CODE_REALISATEUR`) REFERENCES `realisateur` (`CODE`),
  ADD CONSTRAINT `comprendre_ibfk_4` FOREIGN KEY (`CODE_INVITE`) REFERENCES `invite` (`CODE`);

--
-- Contraintes pour la table `diffuser`
--
ALTER TABLE `diffuser`
  ADD CONSTRAINT `diffuser_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `chaine` (`ID`),
  ADD CONSTRAINT `diffuser_ibfk_2` FOREIGN KEY (`CODE`) REFERENCES `programme` (`CODE`);

--
-- Contraintes pour la table `programme`
--
ALTER TABLE `programme`
  ADD CONSTRAINT `programme_ibfk_1` FOREIGN KEY (`ID_P`) REFERENCES `periode` (`ID`),
  ADD CONSTRAINT `programme_ibfk_2` FOREIGN KEY (`ID_T`) REFERENCES `type` (`ID`),
  ADD CONSTRAINT `programme_ibfk_3` FOREIGN KEY (`ID_S`) REFERENCES `signaletiquejeunesse` (`ID`),
  ADD CONSTRAINT `programme_ibfk_4` FOREIGN KEY (`ID_N`) REFERENCES `nationalite` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
