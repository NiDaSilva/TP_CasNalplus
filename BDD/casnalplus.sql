-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 18 Avril 2016 à 21:11
-- Version du serveur :  5.7.9
-- Version de PHP :  5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `casnalplus`
--

-- --------------------------------------------------------

--
-- Structure de la table `acteur`
--

DROP TABLE IF EXISTS `acteur`;
CREATE TABLE IF NOT EXISTS `acteur` (
  `CODE` char(32) NOT NULL,
  `COTE` decimal(10,2) DEFAULT NULL,
  `NOM` char(32) DEFAULT NULL,
  `PRENOM` char(32) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `acteur`
--

INSERT INTO `acteur` (`CODE`, `COTE`, `NOM`, `PRENOM`) VALUES
('10', '4.00', NULL, NULL),
('11', '5.00', NULL, NULL),
('2', '1.00', NULL, NULL),
('3', '2.00', NULL, NULL),
('4', '3.00', NULL, NULL),
('5', '4.00', NULL, NULL),
('6', '5.00', NULL, NULL),
('7', '1.00', NULL, NULL),
('8', '2.00', NULL, NULL),
('9', '3.00', NULL, NULL);

--
-- Déclencheurs `acteur`
--
DROP TRIGGER IF EXISTS `before_insert_acteur`;
DELIMITER $$
CREATE TRIGGER `before_insert_acteur` BEFORE INSERT ON `acteur` FOR EACH ROW BEGIN
	if(new.COTE<0)
    THEN
    	set new.COTE=0;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

DROP TABLE IF EXISTS `avis`;
CREATE TABLE IF NOT EXISTS `avis` (
  `CODE` char(32) NOT NULL,
  `ID` char(32) NOT NULL,
  `NOTE` decimal(10,2) DEFAULT NULL,
  `COMMENTAIRE` char(32) DEFAULT NULL,
  PRIMARY KEY (`CODE`,`ID`),
  KEY `I_FK_AVIS_PROGRAMME` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déclencheurs `avis`
--
DROP TRIGGER IF EXISTS `before_insert_avis`;
DELIMITER $$
CREATE TRIGGER `before_insert_avis` BEFORE INSERT ON `avis` FOR EACH ROW BEGIN
	if(new.NOTE<0)
    THEN
    	set new.NOTE=0;
    END IF;
    if(new.NOTE>5)
    THEN
    	set new.NOTE = 5;
    END IF;
    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `avoir`
--

DROP TABLE IF EXISTS `avoir`;
CREATE TABLE IF NOT EXISTS `avoir` (
  `CODE` char(32) NOT NULL,
  `CODE_1` char(32) NOT NULL,
  PRIMARY KEY (`CODE`,`CODE_1`),
  KEY `I_FK_AVOIR_INTERVENANT` (`CODE`),
  KEY `I_FK_AVOIR_PROGRAMME` (`CODE_1`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `avoir`
--

INSERT INTO `avoir` (`CODE`, `CODE_1`) VALUES
('10', '1'),
('17', '1'),
('19', '1'),
('4', '1'),
('9', '1');

-- --------------------------------------------------------

--
-- Structure de la table `chaine`
--

DROP TABLE IF EXISTS `chaine`;
CREATE TABLE IF NOT EXISTS `chaine` (
  `ID` char(32) NOT NULL,
  `LIBELLE` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `chaine`
--

INSERT INTO `chaine` (`ID`, `LIBELLE`) VALUES
('1', 'Nal+'),
('2', 'Nal+ Cinema'),
('3', 'Nal+ Series'),
('4', 'Nal+ Sport'),
('5', 'Nal+ Family'),
('6', 'Nal+ Decale');

-- --------------------------------------------------------

--
-- Structure de la table `date_heure`
--

DROP TABLE IF EXISTS `date_heure`;
CREATE TABLE IF NOT EXISTS `date_heure` (
  `ID` char(32) NOT NULL,
  `ID_REL_1` char(32) NOT NULL,
  `DATEH` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `I_FK_DATE_HEURE_PERIODE` (`ID_REL_1`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `date_heure`
--

INSERT INTO `date_heure` (`ID`, `ID_REL_1`, `DATEH`) VALUES
('1', '1', '2016-04-19 00:00:00'),
('10', '2', '2016-04-19 09:00:00'),
('11', '2', '2016-04-19 10:00:00'),
('12', '2', '2016-04-19 11:00:00'),
('13', '3', '2016-04-19 12:00:00'),
('14', '3', '2016-04-19 13:00:00'),
('15', '3', '2016-04-19 14:00:00'),
('16', '3', '2016-04-19 15:00:00'),
('17', '3', '2016-04-19 16:00:00'),
('18', '3', '2016-04-19 17:00:00'),
('19', '3', '2016-04-19 18:00:00'),
('2', '1', '2016-04-19 01:00:00'),
('20', '4', '2016-04-19 19:00:00'),
('21', '4', '2016-04-19 20:00:00'),
('22', '4', '2016-04-19 21:00:00'),
('23', '5', '2016-04-19 22:00:00'),
('24', '5', '2016-04-19 23:00:00'),
('3', '1', '2016-04-19 02:00:00'),
('4', '1', '2016-04-19 03:00:00'),
('5', '1', '2016-04-19 04:00:00'),
('6', '1', '2016-04-19 05:00:00'),
('7', '2', '2016-04-19 06:00:00'),
('8', '2', '2016-04-19 07:00:00'),
('9', '2', '2016-04-19 08:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `diffusion`
--

DROP TABLE IF EXISTS `diffusion`;
CREATE TABLE IF NOT EXISTS `diffusion` (
  `CODE` char(32) NOT NULL,
  `ID` char(32) NOT NULL,
  `ID_1` char(32) NOT NULL,
  PRIMARY KEY (`CODE`,`ID`,`ID_1`),
  KEY `I_FK_DIFFUSION_PROGRAMME` (`CODE`),
  KEY `I_FK_DIFFUSION_DATE_HEURE` (`ID`),
  KEY `I_FK_DIFFUSION_CHAINE` (`ID_1`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `diffusion`
--

INSERT INTO `diffusion` (`CODE`, `ID`, `ID_1`) VALUES
('1', '1', '2'),
('10', '9', '4'),
('11', '16', '1'),
('12', '18', '1'),
('13', '18', '2'),
('14', '19', '2'),
('15', '17', '4'),
('16', '18', '4'),
('17', '1', '1'),
('18', '3', '1'),
('19', '5', '1'),
('2', '13', '3'),
('20', '4', '2'),
('21', '6', '2'),
('22', '5', '3'),
('23', '6', '3'),
('24', '3', '4'),
('25', '4', '4'),
('26', '6', '4'),
('27', '7', '1'),
('28', '10', '1'),
('29', '12', '1'),
('3', '14', '1'),
('30', '8', '2'),
('31', '9', '2'),
('32', '11', '2'),
('33', '10', '3'),
('34', '11', '3'),
('35', '12', '3'),
('36', '11', '4'),
('37', '12', '4'),
('38', '20', '2'),
('39', '21', '2'),
('4', '15', '4'),
('40', '22', '2'),
('41', '21', '3'),
('42', '22', '3'),
('43', '22', '4'),
('44', '23', '1'),
('45', '24', '2'),
('46', '23', '4'),
('5', '16', '2'),
('6', '2', '3'),
('7', '18', '3'),
('8', '19', '3'),
('9', '20', '1');

--
-- Déclencheurs `diffusion`
--
DROP TRIGGER IF EXISTS `before_insert_diffusion`;
DELIMITER $$
CREATE TRIGGER `before_insert_diffusion` BEFORE INSERT ON `diffusion` FOR EACH ROW BEGIN
	IF EXISTS(SELECT*FROM diffusion WHERE ID=new.ID AND ID_1=new.ID_1)
    THEN
    	signal sqlstate '16440' set message_text = 'programme deja present à cette heure sur cette chaine';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `intervenant`
--

DROP TABLE IF EXISTS `intervenant`;
CREATE TABLE IF NOT EXISTS `intervenant` (
  `CODE` char(32) NOT NULL,
  `NOM` char(32) DEFAULT NULL,
  `PRENOM` char(32) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `intervenant`
--

INSERT INTO `intervenant` (`CODE`, `NOM`, `PRENOM`) VALUES
('1', 'PIERRE', 'INGENIEUR'),
('10', 'De Niro', 'Robert'),
('11', 'di Caprio', 'Leonardo'),
('12', 'Kubrick', 'Stanley'),
('13', 'Renoir', 'Jean'),
('14', 'Ford Coppola', 'Francis'),
('15', 'Kurosawa', 'Akira'),
('16', 'Scorsese', 'Martin'),
('17', 'Spielberg', 'Steven'),
('18', 'Tarantino', 'Quentin'),
('19', 'Chaplin', 'Charlie'),
('2', 'Berry', 'Halle'),
('20', 'Amar', 'Paul'),
('21', 'Essebag', 'Jacques'),
('22', 'Aliagas', 'Nikos'),
('23', 'Arnaud', 'Julien'),
('24', 'Bern', 'Stéphane'),
('25', 'Ardisson', 'Thierry'),
('26', 'Achour', 'Mouloud'),
('27', 'Sérillon', 'Claude'),
('28', 'Poivre d''arvor', 'Patrick'),
('29', 'Calvi', 'Yves'),
('3', 'Myers', 'Mike'),
('30', 'Godard', 'Jean-Luc'),
('31', 'Allen', 'Woody'),
('4', 'Carrey', 'Jim'),
('5', 'Travolta', 'John'),
('6', 'Gibson', 'Mel'),
('7', 'Jolie', 'Angelina'),
('8', 'Caine', 'Michael'),
('9', 'Cage', 'Nicolas');

--
-- Déclencheurs `intervenant`
--
DROP TRIGGER IF EXISTS `before_delete_intervenant`;
DELIMITER $$
CREATE TRIGGER `before_delete_intervenant` BEFORE DELETE ON `intervenant` FOR EACH ROW BEGIN
	DELETE FROM acteur WHERE CODE = old.CODE;
    DELETE FROM invite WHERE CODE = old.CODE;
    DELETE FROM presentateur WHERE CODE = old.CODE;
    DELETE FROM realisateur WHERE CODE = old.CODE;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `invite`
--

DROP TABLE IF EXISTS `invite`;
CREATE TABLE IF NOT EXISTS `invite` (
  `CODE` char(32) NOT NULL,
  `TARIF` decimal(10,2) DEFAULT NULL,
  `NOM` char(32) DEFAULT NULL,
  `PRENOM` char(32) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `nationalite`
--

DROP TABLE IF EXISTS `nationalite`;
CREATE TABLE IF NOT EXISTS `nationalite` (
  `ID` char(32) NOT NULL,
  `LIBELLE` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `nationalite`
--

INSERT INTO `nationalite` (`ID`, `LIBELLE`) VALUES
('1', 'Allemand'),
('10', 'Portugais'),
('2', 'Francais'),
('3', 'Espagnol'),
('4', 'Americain'),
('5', 'Italien'),
('6', 'Indien'),
('7', 'Bresilien'),
('8', 'Grec'),
('9', 'Mexicain');

-- --------------------------------------------------------

--
-- Structure de la table `periode`
--

DROP TABLE IF EXISTS `periode`;
CREATE TABLE IF NOT EXISTS `periode` (
  `ID` char(32) NOT NULL,
  `LIBELLE` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `periode`
--

INSERT INTO `periode` (`ID`, `LIBELLE`) VALUES
('1', 'Nuit'),
('2', 'Matin'),
('3', 'Apresmidi'),
('4', 'DebutSoiree'),
('5', 'Soiree');

-- --------------------------------------------------------

--
-- Structure de la table `presentateur`
--

DROP TABLE IF EXISTS `presentateur`;
CREATE TABLE IF NOT EXISTS `presentateur` (
  `CODE` char(32) NOT NULL,
  `PROFESSION` char(32) DEFAULT NULL,
  `NOM` char(32) DEFAULT NULL,
  `PRENOM` char(32) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `presentateur`
--

INSERT INTO `presentateur` (`CODE`, `PROFESSION`, `NOM`, `PRENOM`) VALUES
('20', 'Avocat', NULL, NULL),
('21', 'Ergothérapeute', NULL, NULL),
('22', 'Mandataire judiciaire', NULL, NULL),
('23', 'Sage-femme', NULL, NULL),
('24', 'Ostéopathe', NULL, NULL),
('25', 'Orthoptiste', NULL, NULL),
('26', 'Médecin', NULL, NULL),
('27', 'Notaire', NULL, NULL),
('28', 'Chirurgien-dentiste', NULL, NULL),
('29', 'Conseil en investissements finan', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `programme`
--

DROP TABLE IF EXISTS `programme`;
CREATE TABLE IF NOT EXISTS `programme` (
  `CODE` char(32) NOT NULL,
  `ID` char(32) DEFAULT NULL,
  `ID_CORRESPOND` char(32) NOT NULL,
  `ID_ORIGINAIRE` char(32) NOT NULL,
  `NOM` char(32) DEFAULT NULL,
  `DUREE` time DEFAULT NULL,
  `DESCRIPTION` text,
  `ANNEE` int(11) DEFAULT NULL,
  `INEDIT` tinyint(4) DEFAULT NULL,
  `HD` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`CODE`),
  KEY `I_FK_PROGRAMME_SIGNALETIQUE` (`ID`),
  KEY `I_FK_PROGRAMME_TYPE_PROGRAMME` (`ID_CORRESPOND`),
  KEY `I_FK_PROGRAMME_NATIONALITE` (`ID_ORIGINAIRE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `programme`
--

INSERT INTO `programme` (`CODE`, `ID`, `ID_CORRESPOND`, `ID_ORIGINAIRE`, `NOM`, `DUREE`, `DESCRIPTION`, `ANNEE`, `INEDIT`, `HD`) VALUES
('1', '2', '1', '4', 'Fast And Furious', '02:00:00', 'Dominic Toretto est un ex-prisonnier désormais pilote de courses de rue. Il est entouré d''une bande composée de Letty, Vince, Jesse, Leon et de sa sœur Mia Toretto.', 2015, 0, 1),
('10', NULL, '1', '2', 'Taxi 3', '01:30:00', 'Depuis huit mois, la police de Marseille est confrontée à un mystérieux gang en rollers déguisé en pères Noël. L''enquête piétine alors qu’Émilien et le commissaire Gibert multiplient les bourdes', 2003, 0, 0),
('11', '2', '1', '4', 'Fast And Furious', '02:00:00', 'Dominic Toretto est un ex-prisonnier désormais pilote de courses de rue. Il est entouré d''une bande composée de Letty, Vince, Jesse, Leon et de sa sœur Mia Toretto.', 2015, 0, 1),
('12', NULL, '1', '2', 'Taxi 3', '01:30:00', 'Depuis huit mois, la police de Marseille est confrontée à un mystérieux gang en rollers déguisé en pères Noël. L''enquête piétine alors qu’Émilien et le commissaire Gibert multiplient les bourdes', 2003, 0, 0),
('13', '2', '7', '7', 'Favelas', '02:00:00', 'Thriller', 2014, 0, 0),
('14', NULL, '13', '11', 'Manchester city/Manchester Unite', '02:00:00', 'Match de foot opposant les deux équipes', 2016, 0, 1),
('15', NULL, '1', '2', 'Taxi 2', '01:30:00', 'Alors que Jean-Louis Schlesser et son copilote Henri Magne sont en course, Daniel arrive derrière avec son taxi et essaie de les doubler. En effet, il doit transporter au plus vite une femme enceinte prise de violentes contractions', 2000, 1, 0),
('16', '1', '1', '4', 'Divergente 2 : L''insurrection', '02:00:00', 'Après la destruction du territoire de la faction des Altruistes par Jeanine, cheffe des Érudits ; Tris, Tobias, Caleb et Marcus se réfugient chez les Fraternels, attendant que la situation se calme', 2015, 0, 1),
('17', NULL, '2', '11', 'Enquete de foot', '01:00:00', 'Sport', 2016, 0, 1),
('18', '2', '10', '12', 'Vikings', '00:40:00', 'La série suit les exploits d''un groupe de Vikings mené par Ragnar Lothbrok, l''un des plus populaires héros vikings de tous les temps au destin semi-légendaire. Ragnar serait d''origine danoise, suédoise ou encore norvégienne selon les sources', 2013, 1, 0),
('19', '2', '10', '12', 'Vikings', '00:40:00', 'La série suit les exploits d''un groupe de Vikings mené par Ragnar Lothbrok, l''un des plus populaires héros vikings de tous les temps au destin semi-légendaire. Ragnar serait d''origine danoise, suédoise ou encore norvégienne selon les sources', 2013, 1, 0),
('2', '2', '7', '7', 'Favelas', '02:00:00', 'Thriller', 2014, 0, 0),
('20', '2', '1', '4', 'Fast And Furious', '02:00:00', 'Dominic Toretto est un ex-prisonnier désormais pilote de courses de rue. Il est entouré d''une bande composée de Letty, Vince, Jesse, Leon et de sa sœur Mia Toretto.', 2015, 0, 1),
('21', NULL, '1', '2', 'Taxi 3', '01:30:00', 'Depuis huit mois, la police de Marseille est confrontée à un mystérieux gang en rollers déguisé en pères Noël. L''enquête piétine alors qu’Émilien et le commissaire Gibert multiplient les bourdes', 2003, 0, 0),
('22', '2', '7', '7', 'Favelas', '02:00:00', 'Thriller', 2014, 0, 0),
('23', NULL, '13', '11', 'Manchester city/Manchester Unite', '02:00:00', 'Sport', 2016, 0, 1),
('24', NULL, '1', '2', 'Taxi 2', '01:30:00', 'Alors que Jean-Louis Schlesser et son copilote Henri Magne sont en course, Daniel arrive derrière avec son taxi et essaie de les doubler. En effet, il doit transporter au plus vite une femme enceinte prise de violentes contractions', 2000, 1, 0),
('25', '1', '1', '4', 'Divergente 2 : L''insurrection', '02:00:00', 'Après la destruction du territoire de la faction des Altruistes par Jeanine, cheffe des Érudits ; Tris, Tobias, Caleb et Marcus se réfugient chez les Fraternels, attendant que la situation se calme', 2015, 0, 1),
('26', NULL, '2', '11', 'Enquete de foot', '01:00:00', 'Sport', 2016, 0, 1),
('27', '2', '10', '12', 'Vikings', '00:40:00', 'La série suit les exploits d''un groupe de Vikings mené par Ragnar Lothbrok, l''un des plus populaires héros vikings de tous les temps au destin semi-légendaire. Ragnar serait d''origine danoise, suédoise ou encore norvégienne selon les sources', 2013, 1, 0),
('28', '2', '10', '12', 'Vikings', '00:40:00', 'La série suit les exploits d''un groupe de Vikings mené par Ragnar Lothbrok, l''un des plus populaires héros vikings de tous les temps au destin semi-légendaire. Ragnar serait d''origine danoise, suédoise ou encore norvégienne selon les sources', 2013, 1, 0),
('29', '2', '1', '4', 'Fast And Furious', '02:00:00', 'Dominic Toretto est un ex-prisonnier désormais pilote de courses de rue. Il est entouré d''une bande composée de Letty, Vince, Jesse, Leon et de sa sœur Mia Toretto.', 2015, 0, 1),
('3', NULL, '13', '11', 'Manchester city/Manchester Unite', '02:00:00', 'Sport', 2016, 0, 1),
('30', NULL, '1', '2', 'Taxi 3', '01:30:00', 'Depuis huit mois, la police de Marseille est confrontée à un mystérieux gang en rollers déguisé en pères Noël. L''enquête piétine alors qu’Émilien et le commissaire Gibert multiplient les bourdes', 2003, 0, 0),
('31', '2', '7', '7', 'Favelas', '02:00:00', 'Thriller', 2014, 0, 0),
('32', NULL, '13', '11', 'Manchester city/Manchester Unite', '02:00:00', 'Sport', 2016, 0, 1),
('33', NULL, '1', '2', 'Taxi 2', '01:30:00', 'Alors que Jean-Louis Schlesser et son copilote Henri Magne sont en course, Daniel arrive derrière avec son taxi et essaie de les doubler. En effet, il doit transporter au plus vite une femme enceinte prise de violentes contractions', 2000, 1, 0),
('34', '1', '1', '4', 'Divergente 2 : L''insurrection', '02:00:00', 'Après la destruction du territoire de la faction des Altruistes par Jeanine, cheffe des Érudits ; Tris, Tobias, Caleb et Marcus se réfugient chez les Fraternels, attendant que la situation se calme', 2015, 0, 1),
('35', NULL, '2', '11', 'Enquete de foot', '01:00:00', 'Sport', 2016, 0, 1),
('36', '2', '10', '12', 'Vikings', '00:40:00', 'La série suit les exploits d''un groupe de Vikings mené par Ragnar Lothbrok, l''un des plus populaires héros vikings de tous les temps au destin semi-légendaire. Ragnar serait d''origine danoise, suédoise ou encore norvégienne selon les sources', 2013, 1, 0),
('37', '2', '10', '12', 'Vikings', '00:40:00', 'La série suit les exploits d''un groupe de Vikings mené par Ragnar Lothbrok, l''un des plus populaires héros vikings de tous les temps au destin semi-légendaire. Ragnar serait d''origine danoise, suédoise ou encore norvégienne selon les sources', 2013, 1, 0),
('38', '2', '1', '4', 'Fast And Furious', '02:00:00', 'Dominic Toretto est un ex-prisonnier désormais pilote de courses de rue. Il est entouré d''une bande composée de Letty, Vince, Jesse, Leon et de sa sœur Mia Toretto.', 2015, 0, 1),
('39', NULL, '1', '2', 'Taxi 3', '01:30:00', 'Depuis huit mois, la police de Marseille est confrontée à un mystérieux gang en rollers déguisé en pères Noël. L''enquête piétine alors qu’Émilien et le commissaire Gibert multiplient les bourdes', 2003, 0, 0),
('4', NULL, '1', '2', 'Taxi 2', '01:30:00', 'Alors que Jean-Louis Schlesser et son copilote Henri Magne sont en course, Daniel arrive derrière avec son taxi et essaie de les doubler. En effet, il doit transporter au plus vite une femme enceinte prise de violentes contractions', 2000, 1, 0),
('40', '2', '7', '7', 'Favelas', '02:00:00', 'Thriller', 2014, 0, 0),
('41', NULL, '13', '11', 'Manchester city/Manchester Unite', '02:00:00', 'Sport', 2016, 0, 1),
('42', NULL, '1', '2', 'Taxi 2', '01:30:00', 'Alors que Jean-Louis Schlesser et son copilote Henri Magne sont en course, Daniel arrive derrière avec son taxi et essaie de les doubler. En effet, il doit transporter au plus vite une femme enceinte prise de violentes contractions', 2000, 1, 0),
('43', '1', '1', '4', 'Divergente 2 : L''insurrection', '02:00:00', 'Après la destruction du territoire de la faction des Altruistes par Jeanine, cheffe des Érudits ; Tris, Tobias, Caleb et Marcus se réfugient chez les Fraternels, attendant que la situation se calme', 2015, 0, 1),
('44', NULL, '2', '11', 'Enquete de foot', '01:00:00', 'Sport', 2016, 0, 1),
('45', '2', '10', '12', 'Vikings', '00:40:00', 'La série suit les exploits d''un groupe de Vikings mené par Ragnar Lothbrok, l''un des plus populaires héros vikings de tous les temps au destin semi-légendaire. Ragnar serait d''origine danoise, suédoise ou encore norvégienne selon les sources', 2013, 1, 0),
('46', '2', '10', '12', 'Vikings', '00:40:00', 'La série suit les exploits d''un groupe de Vikings mené par Ragnar Lothbrok, l''un des plus populaires héros vikings de tous les temps au destin semi-légendaire. Ragnar serait d''origine danoise, suédoise ou encore norvégienne selon les sources', 2013, 1, 0),
('5', '1', '1', '4', 'Divergente 2 : L''insurrection', '02:00:00', 'Après la destruction du territoire de la faction des Altruistes par Jeanine, cheffe des Érudits ; Tris, Tobias, Caleb et Marcus se réfugient chez les Fraternels, attendant que la situation se calme', 2015, 0, 1),
('6', NULL, '2', '11', 'Enquete de foot', '01:00:00', 'Sport', 2016, 0, 1),
('7', '2', '10', '12', 'Vikings', '00:40:00', 'La série suit les exploits d''un groupe de Vikings mené par Ragnar Lothbrok, l''un des plus populaires héros vikings de tous les temps au destin semi-légendaire. Ragnar serait d''origine danoise, suédoise ou encore norvégienne selon les sources', 2013, 1, 0),
('8', '2', '10', '12', 'Vikings', '00:40:00', 'La série suit les exploits d''un groupe de Vikings mené par Ragnar Lothbrok, l''un des plus populaires héros vikings de tous les temps au destin semi-légendaire. Ragnar serait d''origine danoise, suédoise ou encore norvégienne selon les sources', 2013, 1, 0),
('9', '2', '10', '12', 'Vikings', '00:40:00', 'La série suit les exploits d''un groupe de Vikings mené par Ragnar Lothbrok, l''un des plus populaires héros vikings de tous les temps au destin semi-légendaire. Ragnar serait d''origine danoise, suédoise ou encore norvégienne selon les sources', 2013, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `realisateur`
--

DROP TABLE IF EXISTS `realisateur`;
CREATE TABLE IF NOT EXISTS `realisateur` (
  `CODE` char(32) NOT NULL,
  `NBFILM` int(11) DEFAULT NULL,
  `NOM` char(32) DEFAULT NULL,
  `PRENOM` char(32) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `realisateur`
--

INSERT INTO `realisateur` (`CODE`, `NBFILM`, `NOM`, `PRENOM`) VALUES
('12', 64, NULL, NULL),
('13', 32, NULL, NULL),
('14', 7, NULL, NULL),
('15', 27, NULL, NULL),
('16', 145, NULL, NULL),
('17', 23, NULL, NULL),
('18', 19, NULL, NULL),
('19', 72, NULL, NULL),
('30', 45, NULL, NULL),
('31', 26, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `signaletique`
--

DROP TABLE IF EXISTS `signaletique`;
CREATE TABLE IF NOT EXISTS `signaletique` (
  `ID` char(32) NOT NULL,
  `LIBELLE` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `signaletique`
--

INSERT INTO `signaletique` (`ID`, `LIBELLE`) VALUES
('1', '-10 ans'),
('2', '-12 ans'),
('3', '-16 ans'),
('4', '-18 ans');

-- --------------------------------------------------------

--
-- Structure de la table `type_programme`
--

DROP TABLE IF EXISTS `type_programme`;
CREATE TABLE IF NOT EXISTS `type_programme` (
  `ID` char(32) NOT NULL,
  `LIBELLE` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `type_programme`
--

INSERT INTO `type_programme` (`ID`, `LIBELLE`) VALUES
('1', 'Cinema / Film'),
('10', 'Series Comedie'),
('11', 'Decouverte magazine'),
('12', 'Jeunesse Animation'),
('13', 'Sport / Magazine sport'),
('14', 'Cinema / Film passion'),
('15', NULL),
('16', NULL),
('17', NULL),
('18', NULL),
('2', 'Series Suspense'),
('3', 'Documentaire'),
('4', 'Dessin-Animee'),
('5', 'Cinema / Film Suspense'),
('6', 'Autre'),
('7', 'Culture Infos'),
('8', 'Sport / Emission sportive'),
('9', 'Cinema / Film Action-Aventure');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `acteur`
--
ALTER TABLE `acteur`
  ADD CONSTRAINT `acteur_ibfk_1` FOREIGN KEY (`CODE`) REFERENCES `intervenant` (`CODE`);

--
-- Contraintes pour la table `avis`
--
ALTER TABLE `avis`
  ADD CONSTRAINT `avis_ibfk_1` FOREIGN KEY (`CODE`) REFERENCES `programme` (`CODE`);

--
-- Contraintes pour la table `avoir`
--
ALTER TABLE `avoir`
  ADD CONSTRAINT `avoir_ibfk_1` FOREIGN KEY (`CODE`) REFERENCES `intervenant` (`CODE`),
  ADD CONSTRAINT `avoir_ibfk_2` FOREIGN KEY (`CODE_1`) REFERENCES `programme` (`CODE`);

--
-- Contraintes pour la table `date_heure`
--
ALTER TABLE `date_heure`
  ADD CONSTRAINT `date_heure_ibfk_1` FOREIGN KEY (`ID_REL_1`) REFERENCES `periode` (`ID`);

--
-- Contraintes pour la table `diffusion`
--
ALTER TABLE `diffusion`
  ADD CONSTRAINT `diffusion_ibfk_1` FOREIGN KEY (`CODE`) REFERENCES `programme` (`CODE`),
  ADD CONSTRAINT `diffusion_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `date_heure` (`ID`),
  ADD CONSTRAINT `diffusion_ibfk_3` FOREIGN KEY (`ID_1`) REFERENCES `chaine` (`ID`);

--
-- Contraintes pour la table `invite`
--
ALTER TABLE `invite`
  ADD CONSTRAINT `invite_ibfk_1` FOREIGN KEY (`CODE`) REFERENCES `intervenant` (`CODE`);

--
-- Contraintes pour la table `presentateur`
--
ALTER TABLE `presentateur`
  ADD CONSTRAINT `presentateur_ibfk_1` FOREIGN KEY (`CODE`) REFERENCES `intervenant` (`CODE`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
