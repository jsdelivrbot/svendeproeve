-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2017 at 01:28 PM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `svendeproeve`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresser`
--

CREATE TABLE `adresser` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `navn` varchar(256) NOT NULL,
  `gade` varchar(128) NOT NULL,
  `husnr` smallint(4) NOT NULL,
  `postnr` smallint(4) NOT NULL,
  `bynavn` varchar(128) NOT NULL,
  `tlf` int(12) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adresser`
--

INSERT INTO `adresser` (`id`, `navn`, `gade`, `husnr`, `postnr`, `bynavn`, `tlf`, `email`) VALUES
(1, 'Skørby Bibliotek', 'Park Allé', 335, 2100, 'København Ø', 67912801, 'info@skoerby-bibliotek.dk');

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `album_id` mediumint(8) UNSIGNED NOT NULL,
  `album_oprettet` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `album_kunstner` varchar(64) NOT NULL,
  `album_titel` varchar(128) NOT NULL,
  `album_img` varchar(255) DEFAULT NULL,
  `fk_genre_id` mediumint(8) UNSIGNED DEFAULT NULL,
  `fk_pris_id` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`album_id`, `album_oprettet`, `album_kunstner`, `album_titel`, `album_img`, `fk_genre_id`, `fk_pris_id`) VALUES
(4, '2017-10-04 11:52:46', 'Shakira', 'Oral Fixation 2', '1507117966_shakira.jpg', 1, 2),
(5, '2017-10-04 11:53:32', 'Red Hot Chili Peppers', 'Stadium Arcadium', '1507118012_StadiumArcadium.jpg', 2, 3),
(6, '2017-10-04 11:54:20', 'Gnarls Barkley', 'St. Elsewhere', '1507118060_Gnarls_Barkley.jpg', 1, 2),
(7, '2017-10-04 11:54:58', 'Niels Skousen', 'Daddy Longleg', '1507118098_SkousenDaddyLongleg.jpg', 3, 1),
(8, '2017-10-04 11:55:27', 'Knopfler & Harris', 'All The Roadrunning', '1507118127_KnopflerHarrisRoadrunning.jpg', 1, 2),
(9, '2017-10-04 11:56:02', 'Bruce Springsteen', 'We Shall Overcome The Seeger Sessions', '1507118162_SpringsteenOvercome.jpg', 4, 2),
(10, '2017-10-04 11:56:34', 'Johnson', 'Det Passer', '1507118194_JohnsonPasser.jpg', 7, 2),
(11, '2017-10-04 11:57:23', 'Diverse Artister', 'Eurovision Song Contest 2006', '1507118243_Eurovision.jpg', 1, 1),
(12, '2017-10-04 11:58:34', 'Danser Med Drenge', 'Vores Bedste', '1507118314_DanserMedBedste.jpg', 3, 2),
(13, '2017-10-04 11:59:03', 'Koppel Thomas', 'Improvisationer For Klaver', '1507118343_KoppelImprovisationer.jpg', 6, 2),
(14, '2017-10-04 11:59:33', 'Roy Orbison', 'The Very Best Of', '1507118373_OrbisonBestOf.jpg', 1, 2),
(15, '2017-10-04 11:59:56', 'Juanes', 'Mi Sangre', '1507118396_JuanesMiSangre.jpg', 5, 2),
(16, '2017-10-04 12:00:39', 'Rasmus Nøhr', 'Lykkelig Smutning', '1507118439_RasmusNohrSmutning.jpg', 3, 2),
(17, '2017-10-04 12:01:01', 'Sidsel', 'Where Are My Shoes', '1507118461_SidselWhereShoes.jpg', 3, 2),
(18, '2017-10-04 12:01:29', 'Crazy Frog', 'More Crazy hits', '1507118489_CrazyFrogMore.jpg', 1, 2),
(19, '2017-10-04 12:01:50', 'Madonna', 'Confessions On A Dancefloor', '1507118510_MadonnaConfessions.jpg', 1, 2),
(20, '2017-10-04 12:02:08', 'Bryan Rice', 'Confessional', '1507118528_BryanRice.jpg', 1, 2),
(21, '2017-10-04 12:02:33', 'Michael Bublé', 'It\'s time', '1507118553_Buble.jpg', 1, 2),
(22, '2017-10-04 12:02:54', 'TV2', 'De Første Kærester På Månen', '1507118574_TV2.jpg', 3, 2),
(23, '2017-10-04 12:03:13', 'Kelly Clarkson', 'Breakaway', '1507118593_Clarkson.jpg', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `anmeldelser`
--

CREATE TABLE `anmeldelser` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `oprettet` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `overskrift` mediumtext NOT NULL,
  `tekst` text NOT NULL,
  `link` varchar(255) DEFAULT '#',
  `fk_bruger_id` mediumint(8) UNSIGNED DEFAULT NULL,
  `fk_album_id` mediumint(8) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `brugere`
--

CREATE TABLE `brugere` (
  `bruger_id` mediumint(8) UNSIGNED NOT NULL,
  `bruger_status` tinyint(1) UNSIGNED DEFAULT '1',
  `bruger_oprettet` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bruger_sidste_login` timestamp NULL DEFAULT NULL,
  `bruger_brugernavn` varchar(50) NOT NULL,
  `bruger_beskrivelse` text,
  `bruger_password` varchar(255) NOT NULL,
  `bruger_img` varchar(255) DEFAULT NULL,
  `fk_rolle_id` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brugere`
--

INSERT INTO `brugere` (`bruger_id`, `bruger_status`, `bruger_oprettet`, `bruger_sidste_login`, `bruger_brugernavn`, `bruger_beskrivelse`, `bruger_password`, `bruger_img`, `fk_rolle_id`) VALUES
(1, 1, '2017-10-02 19:10:51', '2017-10-06 11:28:14', 'admin', 'all hail the admin', '$2y$10$1X9ITA0jvKlr9ZeY9QWnVu5EpIJ02S94/TTLbYelGNOgnvWaCKpm.', NULL, 2),
(2, 1, '2017-10-04 09:11:39', '2017-10-06 11:28:09', 'Pelle', '<p>Jeg er en fodboldn&oslash;rd fra <strong>Nr. Snede</strong> der elsker reagae. Hvis det skal v&aelig;re dansk skal det v&aelig;re Rasmus N&oslash;hr, han er bare for sej :-)</p>\r\n', '$2y$11$Vggoka7PkifC.qOGK.PERebLsQ1yK25iDz85SDEbIg0AWJcArDwKW', '1507268290_imala.jpg', 1),
(3, 1, '2017-10-05 12:23:10', '2017-10-06 08:32:58', 'HelterSkelter', '<p>Lorem ipsum dol<em>or sit amet, consectetur adipisicing elit. Accusamus commodi maiores quos recusandae ullam. Accusamus commodi cupiditate delectus dolores eaque et exercitationem explic</em>abo non quasi repellat. Accusamu<strong>s aliqua</strong>m iure sunt!</p>\r\n', '$2y$11$gQgPmhA.kxI3rIwRP1hnhe9NWHj13tWGxmJcqGU3w1gVKr9QWKqNK', '1507206190_blackwhite.jpeg', 1),
(6, 1, '2017-10-05 14:39:39', '2017-10-06 08:35:12', 'PolleFraSnave', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus commodi maiores quos recusandae ullam. Accusamus commodi cupiditate delectus dolores eaque et exercitationem explicabo non quasi repellat. Accusamus aliquam iure sunt!</p>\r\n', '$2y$11$EF1.NzfuOMISlkgcqkQlce6A82SaTlUF3Kudw/4jdpAMbeGmL5Hgi', '1507268371_profile-img.png', 1),
(7, 1, '2017-10-05 15:23:28', '2017-10-06 08:36:33', 'PerSyvspring', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus commodi maiores quos recusandae ullam. Accusamus commodi cupiditate delectus dolores eaque et exercitationem explicabo non quasi repellat. Accusamus aliquam iure sunt!</p>\r\n', '$2y$11$Y.U6sXHP0/Ib4QIV/iK4u.mR0phe79z1wp4jOsvoqStkEe3wpL1OO', '1507217008_viewImage.jpg', 1),
(8, 1, '2017-10-05 15:27:53', '2017-10-06 08:48:57', 'Sandkassens Konge', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus commodi maiores quos recusandae ullam. Accusamus commodi cupiditate delectus dolores eaque et exercitationem explicabo non quasi repellat. Accusamus aliquam iure sunt!</p>\r\n', '$2y$11$O75wpInbDEGh5jr2F4MR2ODELFI2Sxg6evD..sxbLTP4lUuP7O322', '1507217273_profile_photo.jpg', 1),
(9, 1, '2017-10-05 15:43:01', '2017-10-05 15:43:20', 'Razzzmuzzz', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus commodi maiores quos recusandae ullam. Accusamus commodi cupiditate delectus dolores eaque et exercitationem explicabo non quasi repellat. Accusamus aliquam iure sunt!</p>\r\n', '$2y$11$V0HhYSaxXFpwNPsgh7SL3.iGJhhnRCqoWXOqg8WFUp/2ZDD68WSiC', '1507218181_1065-IMG_2529.jpg', 1),
(10, 1, '2017-10-05 15:44:24', NULL, 'BeatNick9', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus commodi maiores quos recusandae ullam. Accusamus commodi cupiditate delectus dolores eaque et exercitationem explicabo non quasi repellat. Accusamus aliquam iure sunt!</p>\r\n', '$2y$11$UvBxJpovFSXjn/Ro.P9NEOza.l9pnOAzfX9hP3akfT5sP0VwAxhO6', '1507218263_Profile1.gif', 1),
(11, 1, '2017-10-05 15:45:04', NULL, 'T-Bird Man', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus commodi maiores quos recusandae ullam. Accusamus commodi cupiditate delectus dolores eaque et exercitationem explicabo non quasi repellat. Accusamus aliquam iure sunt!</p>\r\n', '$2y$11$6cohkSp2cQw.5X8QbeFGPOL8f7u.P4m7pGai6tPU8Iz/sPLUYY7KK', '1507218304_user2.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `genrer`
--

CREATE TABLE `genrer` (
  `genre_id` mediumint(8) UNSIGNED NOT NULL,
  `genre_navn` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genrer`
--

INSERT INTO `genrer` (`genre_id`, `genre_navn`) VALUES
(1, 'Pop'),
(2, 'Rock'),
(3, 'Dansk'),
(4, 'Folk'),
(5, 'Latin'),
(6, 'Jazz'),
(7, 'Hiphop');

-- --------------------------------------------------------

--
-- Table structure for table `kontakt`
--

CREATE TABLE `kontakt` (
  `kontakt_id` int(10) UNSIGNED NOT NULL,
  `kontakt_navn` varchar(64) NOT NULL,
  `kontakt_adresse` varchar(128) NOT NULL,
  `kontakt_tlf` smallint(10) UNSIGNED NOT NULL,
  `kontakt_email` varchar(128) NOT NULL,
  `kontakt_besked` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `konti`
--

CREATE TABLE `konti` (
  `konto_id` mediumint(8) UNSIGNED NOT NULL,
  `konto_saldo` int(10) UNSIGNED NOT NULL,
  `fk_bruger_id` mediumint(8) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konti`
--

INSERT INTO `konti` (`konto_id`, `konto_saldo`, `fk_bruger_id`) VALUES
(1, 1400, 2),
(2, 1350, 3),
(3, 1400, 6),
(4, 1400, 7),
(5, 1400, 8),
(6, 1500, 9),
(7, 1500, 10),
(8, 1500, 11);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `log_tid` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log_beskrivelse` text NOT NULL,
  `fk_bruger_id` mediumint(8) UNSIGNED DEFAULT NULL,
  `fk_log_type` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`log_id`, `log_tid`, `log_beskrivelse`, `fk_bruger_id`, `fk_log_type`) VALUES
(1, '2017-10-04 08:57:35', 'Brugeren med id 3 blev oprettet', 1, 1),
(2, '2017-10-04 08:57:35', 'Brugeren med id 3 fik overførst 1500 grunker til sin nye konto', 1, 1),
(3, '2017-10-04 09:11:39', 'Brugeren med id 2 blev oprettet', 1, 1),
(4, '2017-10-04 09:11:39', 'Brugeren med id 2 fik overførst 1500 grunker til sin nye konto', 1, 1),
(8, '2017-10-04 11:21:48', 'Albummet med id 1 blev oprettet', 1, 1),
(9, '2017-10-04 11:43:25', 'Albummet med id 2 blev oprettet', 1, 1),
(10, '2017-10-04 11:49:31', 'Albummet med id 3 blev oprettet', 1, 1),
(11, '2017-10-04 11:49:37', 'Et album blev slettet', 1, 3),
(12, '2017-10-04 11:52:46', 'Albummet med id 4 blev oprettet', 1, 1),
(13, '2017-10-04 11:53:33', 'Albummet med id 5 blev oprettet', 1, 1),
(14, '2017-10-04 11:54:20', 'Albummet med id 6 blev oprettet', 1, 1),
(15, '2017-10-04 11:54:58', 'Albummet med id 7 blev oprettet', 1, 1),
(16, '2017-10-04 11:55:27', 'Albummet med id 8 blev oprettet', 1, 1),
(17, '2017-10-04 11:56:02', 'Albummet med id 9 blev oprettet', 1, 1),
(18, '2017-10-04 11:56:34', 'Albummet med id 10 blev oprettet', 1, 1),
(19, '2017-10-04 11:57:23', 'Albummet med id 11 blev oprettet', 1, 1),
(20, '2017-10-04 11:58:34', 'Albummet med id 12 blev oprettet', 1, 1),
(21, '2017-10-04 11:59:03', 'Albummet med id 13 blev oprettet', 1, 1),
(22, '2017-10-04 11:59:33', 'Albummet med id 14 blev oprettet', 1, 1),
(23, '2017-10-04 11:59:56', 'Albummet med id 15 blev oprettet', 1, 1),
(24, '2017-10-04 12:00:39', 'Albummet med id 16 blev oprettet', 1, 1),
(25, '2017-10-04 12:01:02', 'Albummet med id 17 blev oprettet', 1, 1),
(26, '2017-10-04 12:01:29', 'Albummet med id 18 blev oprettet', 1, 1),
(27, '2017-10-04 12:01:50', 'Albummet med id 19 blev oprettet', 1, 1),
(28, '2017-10-04 12:02:08', 'Albummet med id 20 blev oprettet', 1, 1),
(29, '2017-10-04 12:02:33', 'Albummet med id 21 blev oprettet', 1, 1),
(30, '2017-10-04 12:02:54', 'Albummet med id 22 blev oprettet', 1, 1),
(31, '2017-10-04 12:03:13', 'Albummet med id 23 blev oprettet', 1, 1),
(32, '2017-10-04 13:34:59', 'Albummet med id 24 blev oprettet', 1, 1),
(42, '2017-10-04 18:27:35', 'Et album blev slettet', 1, 3),
(43, '2017-10-04 18:29:27', 'Albummet med id 0 blev redigeret', 1, 2),
(48, '2017-10-04 19:11:53', 'Brugeren \"admin\" med id 1 loggede ind', 1, 4),
(50, '2017-10-04 19:34:09', 'Albummet med id 21 blev redigeret', 1, 2),
(51, '2017-10-04 19:40:59', 'Brugeren \"Pelle\" med id 2 loggede ind', 2, 4),
(52, '2017-10-04 19:54:43', 'Brugeren \"Pelle\" med id 2 loggede ind', 2, 4),
(53, '2017-10-05 11:15:58', 'Brugeren \"Pelle\" med id 2 loggede ind', 2, 4),
(54, '2017-10-05 12:22:49', 'Brugeren \"admin\" med id 1 loggede ind', 1, 4),
(55, '2017-10-05 12:23:10', 'Brugeren med id 3 blev oprettet', 1, 1),
(56, '2017-10-05 12:23:10', 'Brugeren med id 3 fik overførst 1500 grunker til sin nye konto', 1, 1),
(60, '2017-10-05 14:39:40', 'Profil med id 6 blev oprettet', 6, 1),
(61, '2017-10-05 15:23:28', 'Profil med id 7 blev oprettet', 7, 1),
(63, '2017-10-05 15:27:53', 'Profil med id 8 blev oprettet', 8, 1),
(64, '2017-10-05 15:27:54', 'Der blev indsat 1500 grunker på en ny konto med id 5', 1, 1),
(65, '2017-10-05 15:35:55', 'Brugeren \"admin\" med id 1 loggede ind', 1, 4),
(66, '2017-10-05 15:36:02', 'Brugeren \"PolleFraSnave\" med id 6 loggede ind', 6, 4),
(67, '2017-10-05 15:43:01', 'Profil med id 9 blev oprettet', 9, 1),
(68, '2017-10-05 15:43:01', 'Der blev indsat 1500 grunker på en ny konto med id 6', 1, 1),
(69, '2017-10-05 15:43:20', 'Brugeren \"Razzzmuzzz\" med id 9 loggede ind', 9, 4),
(70, '2017-10-05 15:44:24', 'Profil med id 10 blev oprettet', 10, 1),
(71, '2017-10-05 15:44:24', 'Der blev indsat 1500 grunker på en ny konto med id 7', 1, 1),
(72, '2017-10-05 15:45:04', 'Profil med id 11 blev oprettet', 11, 1),
(73, '2017-10-05 15:45:04', 'Der blev indsat 1500 grunker på en ny konto med id 8', 1, 1),
(74, '2017-10-05 16:01:10', 'Brugeren \"admin\" med id 1 loggede ind', 1, 4),
(75, '2017-10-05 16:02:27', 'Brugeren \"Pelle\" med id 2 loggede ind', 2, 4),
(77, '2017-10-05 16:07:23', 'Der blev indsat 1500 grunker på en ny konto med id 9', 1, 1),
(78, '2017-10-05 16:07:29', 'Brugeren \"admin\" med id 1 loggede ind', 1, 4),
(80, '2017-10-05 16:08:20', 'Brugeren \"admin\" med id 1 loggede ind', 1, 4),
(81, '2017-10-05 16:11:52', 'Brugeren \"Pelle\" med id 2 loggede ind', 2, 4),
(82, '2017-10-05 16:22:57', 'Brugeren \"Pelle\" med id 2 loggede ind', 2, 4),
(83, '2017-10-06 05:39:18', 'Brugeren \"PolleFraSnave\" med id 6 loggede ind', 6, 4),
(84, '2017-10-06 05:39:31', 'Profilen blev redigeret', 6, 2),
(85, '2017-10-06 07:17:41', 'Brugeren \"admin\" med id 1 loggede ind', 1, 4),
(86, '2017-10-06 08:18:50', 'Brugeren \"Pelle\" med id 2 loggede ind', 2, 4),
(88, '2017-10-06 08:32:05', 'Bruger købte album med id 6', 2, 1),
(89, '2017-10-06 08:32:58', 'Brugeren \"HelterSkelter\" med id 3 loggede ind', 3, 4),
(90, '2017-10-06 08:34:09', 'Bruger købte album med id 5', 3, 1),
(91, '2017-10-06 08:35:12', 'Brugeren \"PolleFraSnave\" med id 6 loggede ind', 6, 4),
(92, '2017-10-06 08:35:22', 'Bruger købte album med id 7', 6, 1),
(93, '2017-10-06 08:35:45', 'Bruger købte album med id 7', 6, 1),
(94, '2017-10-06 08:36:33', 'Brugeren \"PerSyvspring\" med id 7 loggede ind', 7, 4),
(95, '2017-10-06 08:36:37', 'Bruger købte album med id 8', 7, 1),
(96, '2017-10-06 08:48:57', 'Brugeren \"Sandkassens Konge\" med id 8 loggede ind', 8, 4),
(97, '2017-10-06 08:49:10', 'Bruger købte album med id 9', 8, 1),
(106, '2017-10-06 09:13:51', 'Brugeren \"admin\" med id 1 loggede ind', 1, 4),
(109, '2017-10-06 09:36:27', 'Brugeren \"admin\" med id 1 loggede ind', 1, 4),
(110, '2017-10-06 10:04:59', 'En bruger blev slettet', 1, 3),
(112, '2017-10-06 10:08:07', 'Der blev indsat 1500 grunker på en ny konto med id 12', 1, 1),
(116, '2017-10-06 10:09:16', 'Brugeren \"admin\" med id 1 loggede ind', 1, 4),
(117, '2017-10-06 10:09:27', 'En bruger blev slettet', 1, 3),
(118, '2017-10-06 10:27:33', 'Brugeren \"Pelle\" med id 2 loggede ind', 2, 4),
(119, '2017-10-06 10:28:59', 'Brugeren \"admin\" med id 1 loggede ind', 1, 4),
(120, '2017-10-06 11:28:09', 'Brugeren \"Pelle\" med id 2 loggede ind', 2, 4),
(121, '2017-10-06 11:28:14', 'Brugeren \"admin\" med id 1 loggede ind', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `log_typer`
--

CREATE TABLE `log_typer` (
  `log_type_id` tinyint(3) UNSIGNED NOT NULL,
  `log_type_navn` varchar(45) NOT NULL,
  `log_type_css` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log_typer`
--

INSERT INTO `log_typer` (`log_type_id`, `log_type_navn`, `log_type_css`) VALUES
(1, 'opret', 'success'),
(2, 'opdater', 'warning'),
(3, 'slet', 'danger'),
(4, 'info', 'info');

-- --------------------------------------------------------

--
-- Table structure for table `priser`
--

CREATE TABLE `priser` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `vaerdi` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `priser`
--

INSERT INTO `priser` (`id`, `vaerdi`) VALUES
(1, 50),
(2, 100),
(3, 150);

-- --------------------------------------------------------

--
-- Table structure for table `roller`
--

CREATE TABLE `roller` (
  `rolle_id` tinyint(3) UNSIGNED NOT NULL,
  `rolle_navn` varchar(25) NOT NULL,
  `rolle_niveau` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roller`
--

INSERT INTO `roller` (`rolle_id`, `rolle_navn`, `rolle_niveau`) VALUES
(1, 'bruger', 100),
(2, 'admin', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `sider`
--

CREATE TABLE `sider` (
  `side_id` tinyint(3) UNSIGNED NOT NULL,
  `side_status` tinyint(1) UNSIGNED NOT NULL,
  `side_url` varchar(128) NOT NULL,
  `side_nav_sortering` tinyint(3) UNSIGNED NOT NULL,
  `side_nav_visning` tinyint(1) UNSIGNED NOT NULL,
  `side_nav_label` varchar(50) DEFAULT NULL,
  `side_titel` varchar(55) NOT NULL,
  `side_indhold` text,
  `fk_side_include_id` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sider`
--

INSERT INTO `sider` (`side_id`, `side_status`, `side_url`, `side_nav_sortering`, `side_nav_visning`, `side_nav_label`, `side_titel`, `side_indhold`, `fk_side_include_id`) VALUES
(1, 1, '', 1, 1, 'Forside', 'Velkommen Hos DJ Grunk.', 'Her hos DJ Grunk kan du være med til at bestemme hvilken musik der skal indkøbes til Musikbiblioteket. Hvis du ikke allerede er oprettet som bruger så skynd dig at blive det. Så får du nemlig også 1500 Grunker som du kan bruge til at “købe” for i musikbutikken.					\r\nDe cd’er der bliver købt flest gange havner på hitlisten her til venstre og hvis du er med til at få dine favoritter på hitlisten er der større chance for at du hurtigere kan låne dem på Musikbiblioteket.					\r\nDu kan også lave dine egne anmeldelser, så andre brugere kan se hvilken musik der er på toppen i øjeblikket.					\r\nKik dig omkring og vær med til at sætte liv i kludene.DJ Grunk.					\r\n', 1),
(2, 1, 'musikbutikken', 2, 1, 'Musikbutikken', 'Musikbutikken', NULL, 2),
(3, 1, 'anmeldelser', 3, 1, 'Anmeldelser', 'Anmeldelser af musik', NULL, 3),
(4, 1, 'profil', 4, 1, 'Min Profil', 'Din profil', NULL, 4),
(5, 1, 'kontakt', 5, 1, 'Kontakt', 'Kontakt DJ Grunk og hans venner', 'Hvis du har spørgsmål eller til DJ Grunk eller en af hans venner på biblioteket er du velkommen til at komme forbi. Vi har åbent på biblioteket alle hver- og lørdage. 					\r\nDu kan ogås ringe eller skrive, eller brug formularen nederst til højre så skal vi nok sørge for at DJ Grunk får din besked.					\r\n', 5),
(6, 1, 'opret-profil', 11, 0, NULL, 'Opret en profil', '', 6),
(7, 1, 'rediger-profil', 15, 0, NULL, 'Rediger din profil', '', 7),
(8, 1, 'album', 22, 0, NULL, 'Albumvisning', '', 8);

-- --------------------------------------------------------

--
-- Table structure for table `side_includes`
--

CREATE TABLE `side_includes` (
  `side_include_id` tinyint(3) UNSIGNED NOT NULL,
  `side_include_navn` varchar(50) NOT NULL,
  `side_include_filnavn` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `side_includes`
--

INSERT INTO `side_includes` (`side_include_id`, `side_include_navn`, `side_include_filnavn`) VALUES
(1, 'forside', 'velkommen.php'),
(2, 'musikbutikken', 'musikbutik.php'),
(3, 'anmeldelser', 'anmeldelser.php'),
(4, 'profil', 'profil.php'),
(5, 'kontakt', 'kontakt.php'),
(6, 'opret profil', 'opret-profil.php'),
(7, 'rediger profil', 'rediger-profil.php'),
(8, 'album', 'album.php');

-- --------------------------------------------------------

--
-- Table structure for table `tidspunkter`
--

CREATE TABLE `tidspunkter` (
  `tidspunkt_id` int(11) NOT NULL,
  `tidspunkt_ugedag` enum('Mandag','Tirsdag','Onsdag','Torsdag','Fredag','Lørdag','Søndag') CHARACTER SET utf8 NOT NULL,
  `tidspunkt_tid_fra` time NOT NULL,
  `tidspunkt_tid_til` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `tidspunkter`
--

INSERT INTO `tidspunkter` (`tidspunkt_id`, `tidspunkt_ugedag`, `tidspunkt_tid_fra`, `tidspunkt_tid_til`) VALUES
(6, 'Mandag', '10:00:00', '18:00:00'),
(7, 'Tirsdag', '10:00:00', '18:00:00'),
(8, 'Onsdag', '10:00:00', '18:00:00'),
(9, 'Torsdag', '10:00:00', '18:00:00'),
(10, 'Fredag', '10:00:00', '18:00:00'),
(11, 'Lørdag', '09:00:00', '13:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `transaktioner`
--

CREATE TABLE `transaktioner` (
  `id` int(10) UNSIGNED NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_konto_id` mediumint(8) UNSIGNED DEFAULT NULL,
  `fk_album_id` mediumint(8) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaktioner`
--

INSERT INTO `transaktioner` (`id`, `timestamp`, `fk_konto_id`, `fk_album_id`) VALUES
(2, '2017-10-06 08:32:05', 1, 6),
(3, '2017-10-06 08:34:09', 2, 5),
(4, '2017-10-06 08:35:22', 3, 7),
(6, '2017-10-06 08:36:37', 4, 8),
(7, '2017-10-06 08:49:10', 5, 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresser`
--
ALTER TABLE `adresser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `fk_genre_id` (`fk_genre_id`),
  ADD KEY `fk_pris_id` (`fk_pris_id`);

--
-- Indexes for table `anmeldelser`
--
ALTER TABLE `anmeldelser`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anmeldelser_ibfk_1` (`fk_album_id`),
  ADD KEY `anmeldelser_ibfk_2` (`fk_bruger_id`);

--
-- Indexes for table `brugere`
--
ALTER TABLE `brugere`
  ADD PRIMARY KEY (`bruger_id`),
  ADD UNIQUE KEY `bruger_brugernavn` (`bruger_brugernavn`),
  ADD KEY `fk_rolle_id` (`fk_rolle_id`);

--
-- Indexes for table `genrer`
--
ALTER TABLE `genrer`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `kontakt`
--
ALTER TABLE `kontakt`
  ADD PRIMARY KEY (`kontakt_id`);

--
-- Indexes for table `konti`
--
ALTER TABLE `konti`
  ADD PRIMARY KEY (`konto_id`),
  ADD KEY `fk_bruger_id` (`fk_bruger_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `logs_ibfk_1` (`fk_log_type`),
  ADD KEY `fk_bruger_id` (`fk_bruger_id`);

--
-- Indexes for table `log_typer`
--
ALTER TABLE `log_typer`
  ADD PRIMARY KEY (`log_type_id`);

--
-- Indexes for table `priser`
--
ALTER TABLE `priser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roller`
--
ALTER TABLE `roller`
  ADD PRIMARY KEY (`rolle_id`);

--
-- Indexes for table `sider`
--
ALTER TABLE `sider`
  ADD PRIMARY KEY (`side_id`),
  ADD KEY `sider_ibfk_1` (`fk_side_include_id`);

--
-- Indexes for table `side_includes`
--
ALTER TABLE `side_includes`
  ADD PRIMARY KEY (`side_include_id`);

--
-- Indexes for table `tidspunkter`
--
ALTER TABLE `tidspunkter`
  ADD PRIMARY KEY (`tidspunkt_id`);

--
-- Indexes for table `transaktioner`
--
ALTER TABLE `transaktioner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_album_id` (`fk_album_id`),
  ADD KEY `fk_konto_id` (`fk_konto_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresser`
--
ALTER TABLE `adresser`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `album_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `anmeldelser`
--
ALTER TABLE `anmeldelser`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `brugere`
--
ALTER TABLE `brugere`
  MODIFY `bruger_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `genrer`
--
ALTER TABLE `genrer`
  MODIFY `genre_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `kontakt`
--
ALTER TABLE `kontakt`
  MODIFY `kontakt_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `konti`
--
ALTER TABLE `konti`
  MODIFY `konto_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;
--
-- AUTO_INCREMENT for table `log_typer`
--
ALTER TABLE `log_typer`
  MODIFY `log_type_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `priser`
--
ALTER TABLE `priser`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `roller`
--
ALTER TABLE `roller`
  MODIFY `rolle_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sider`
--
ALTER TABLE `sider`
  MODIFY `side_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `side_includes`
--
ALTER TABLE `side_includes`
  MODIFY `side_include_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tidspunkter`
--
ALTER TABLE `tidspunkter`
  MODIFY `tidspunkt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `transaktioner`
--
ALTER TABLE `transaktioner`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`fk_genre_id`) REFERENCES `genrer` (`genre_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `albums_ibfk_2` FOREIGN KEY (`fk_pris_id`) REFERENCES `priser` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `anmeldelser`
--
ALTER TABLE `anmeldelser`
  ADD CONSTRAINT `anmeldelser_ibfk_1` FOREIGN KEY (`fk_album_id`) REFERENCES `albums` (`album_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `anmeldelser_ibfk_2` FOREIGN KEY (`fk_bruger_id`) REFERENCES `brugere` (`bruger_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `brugere`
--
ALTER TABLE `brugere`
  ADD CONSTRAINT `brugere_ibfk_1` FOREIGN KEY (`fk_rolle_id`) REFERENCES `roller` (`rolle_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `konti`
--
ALTER TABLE `konti`
  ADD CONSTRAINT `konti_ibfk_1` FOREIGN KEY (`fk_bruger_id`) REFERENCES `brugere` (`bruger_id`) ON UPDATE CASCADE;

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`fk_log_type`) REFERENCES `log_typer` (`log_type_id`),
  ADD CONSTRAINT `logs_ibfk_2` FOREIGN KEY (`fk_bruger_id`) REFERENCES `brugere` (`bruger_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sider`
--
ALTER TABLE `sider`
  ADD CONSTRAINT `sider_ibfk_1` FOREIGN KEY (`fk_side_include_id`) REFERENCES `side_includes` (`side_include_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `transaktioner`
--
ALTER TABLE `transaktioner`
  ADD CONSTRAINT `transaktioner_ibfk_1` FOREIGN KEY (`fk_album_id`) REFERENCES `albums` (`album_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaktioner_ibfk_2` FOREIGN KEY (`fk_konto_id`) REFERENCES `konti` (`konto_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
