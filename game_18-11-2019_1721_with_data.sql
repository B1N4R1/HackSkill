-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 18-11-2019 a las 17:21:31
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `game`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id` tinyint(2) NOT NULL,
  `user` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(36) NOT NULL,
  `lastLogin` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_reports`
--

CREATE TABLE `admin_reports` (
  `id` int(5) NOT NULL,
  `errorID` int(5) NOT NULL,
  `userID` int(5) NOT NULL,
  `report` text NOT NULL,
  `critical` tinyint(1) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `read` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `badges_clans`
--

CREATE TABLE `badges_clans` (
  `badgeID` tinyint(3) NOT NULL,
  `priority` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `badges_users`
--

CREATE TABLE `badges_users` (
  `badgeID` tinyint(3) NOT NULL,
  `priority` smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bankAccounts`
--

CREATE TABLE `bankAccounts` (
  `id` int(12) NOT NULL,
  `bankAcc` bigint(12) NOT NULL,
  `bankPass` varchar(6) NOT NULL,
  `bankID` int(5) NOT NULL,
  `bankUser` int(5) NOT NULL,
  `cash` bigint(15) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bankAccounts`
--

INSERT INTO `bankAccounts` (`id`, `bankAcc`, `bankPass`, `bankID`, `bankUser`, `cash`, `dateCreated`) VALUES
(12716006, 828004422, 'Rxvs75', 897364, 750716, 0, '2019-11-17 17:15:56'),
(12716007, 724267811, 'XvcUnO', 897364, 750717, 0, '2019-11-17 17:46:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bankaccounts_expire`
--

CREATE TABLE `bankaccounts_expire` (
  `accID` int(30) UNSIGNED NOT NULL,
  `expireDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitcoin_wallets`
--

CREATE TABLE `bitcoin_wallets` (
  `address` varchar(34) NOT NULL,
  `userID` int(5) UNSIGNED NOT NULL,
  `npcID` int(5) UNSIGNED NOT NULL,
  `key` varchar(64) NOT NULL,
  `amount` decimal(12,7) UNSIGNED NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bugreports`
--

CREATE TABLE `bugreports` (
  `id` int(11) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bugText` text NOT NULL,
  `reportedBy` int(5) UNSIGNED NOT NULL,
  `sessionContent` text NOT NULL,
  `serverContent` text NOT NULL,
  `follow` tinyint(1) NOT NULL DEFAULT 0,
  `solved` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `userID` int(5) UNSIGNED NOT NULL,
  `reputation` int(6) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cache`
--

INSERT INTO `cache` (`userID`, `reputation`) VALUES
(750716, 0),
(750717, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_profile`
--

CREATE TABLE `cache_profile` (
  `userID` int(5) UNSIGNED NOT NULL,
  `expireDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certifications`
--

CREATE TABLE `certifications` (
  `userID` int(5) NOT NULL,
  `certLevel` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `certifications`
--

INSERT INTO `certifications` (`userID`, `certLevel`) VALUES
(750716, 0),
(750717, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `changelog`
--

CREATE TABLE `changelog` (
  `id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `text` text NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `author` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clan`
--

CREATE TABLE `clan` (
  `clanID` int(5) NOT NULL,
  `clanIP` int(11) UNSIGNED NOT NULL,
  `name` varchar(25) NOT NULL,
  `nick` varchar(3) NOT NULL,
  `desc` text NOT NULL,
  `slotsUsed` smallint(3) NOT NULL,
  `slotsTotal` smallint(3) NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdBy` int(5) NOT NULL,
  `powerTax` tinyint(2) NOT NULL,
  `moneyTax` tinyint(2) NOT NULL,
  `money` int(10) NOT NULL,
  `power` int(10) NOT NULL,
  `corp` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clan_badge`
--

CREATE TABLE `clan_badge` (
  `clanID` int(5) NOT NULL,
  `badgeID` smallint(3) NOT NULL,
  `round` tinyint(3) NOT NULL DEFAULT 0,
  `dateAdd` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clan_ddos`
--

CREATE TABLE `clan_ddos` (
  `attackerClan` int(5) NOT NULL,
  `victimClan` int(5) NOT NULL,
  `ddosID` int(5) NOT NULL,
  `displayAttacker` tinyint(1) NOT NULL DEFAULT 1,
  `displayVictim` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clan_ddos_history`
--

CREATE TABLE `clan_ddos_history` (
  `attackerClan` int(5) NOT NULL,
  `victimClan` int(5) NOT NULL,
  `ddosID` int(5) NOT NULL,
  `warID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clan_defcon`
--

CREATE TABLE `clan_defcon` (
  `id` int(5) NOT NULL,
  `attackerID` int(5) NOT NULL,
  `attackerClanID` int(4) NOT NULL,
  `victimID` int(5) NOT NULL,
  `victimClanID` int(4) NOT NULL,
  `attackDate` datetime NOT NULL,
  `clanServer` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clan_requests`
--

CREATE TABLE `clan_requests` (
  `id` int(5) NOT NULL,
  `clanID` int(5) UNSIGNED NOT NULL,
  `userID` int(5) NOT NULL,
  `adminID` int(5) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `askedDate` datetime NOT NULL,
  `msg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clan_stats`
--

CREATE TABLE `clan_stats` (
  `cid` int(5) NOT NULL,
  `totalMemberPower` int(11) NOT NULL,
  `averageMemberPower` int(10) NOT NULL,
  `averageMemberRanking` int(5) NOT NULL,
  `totalMoneyEarned` int(11) NOT NULL,
  `averageMoneyEarned` int(11) NOT NULL,
  `servers` smallint(3) NOT NULL,
  `members` int(5) NOT NULL,
  `pageClicks` int(5) NOT NULL,
  `won` int(4) NOT NULL,
  `lost` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clan_users`
--

CREATE TABLE `clan_users` (
  `id` int(5) NOT NULL,
  `clanID` int(5) NOT NULL,
  `userID` int(5) NOT NULL,
  `memberSince` date NOT NULL,
  `authLevel` tinyint(1) NOT NULL,
  `hierarchy` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clan_war`
--

CREATE TABLE `clan_war` (
  `id` int(5) NOT NULL,
  `clanID1` int(5) NOT NULL,
  `clanID2` int(5) NOT NULL,
  `score1` int(10) NOT NULL,
  `score2` int(10) NOT NULL,
  `startDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `endDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bounty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clan_war_history`
--

CREATE TABLE `clan_war_history` (
  `id` int(5) UNSIGNED NOT NULL,
  `idWinner` int(5) UNSIGNED NOT NULL,
  `idLoser` int(5) UNSIGNED NOT NULL,
  `scoreWinner` int(10) UNSIGNED NOT NULL,
  `scoreLoser` int(10) UNSIGNED NOT NULL,
  `startDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `endDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bounty` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doom_abort`
--

CREATE TABLE `doom_abort` (
  `doomID` int(5) UNSIGNED NOT NULL,
  `abortedBy` int(5) UNSIGNED NOT NULL,
  `abortDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `email_delete`
--

CREATE TABLE `email_delete` (
  `userID` int(5) NOT NULL,
  `code` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `email_reset`
--

CREATE TABLE `email_reset` (
  `userID` int(5) NOT NULL,
  `code` varchar(32) NOT NULL,
  `requestDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `email_verification`
--

CREATE TABLE `email_verification` (
  `userID` int(5) UNSIGNED NOT NULL,
  `email` varchar(60) NOT NULL,
  `code` varchar(25) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fbi`
--

CREATE TABLE `fbi` (
  `ip` bigint(11) NOT NULL,
  `reason` tinyint(1) NOT NULL,
  `bounty` bigint(15) NOT NULL,
  `dateAdd` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateEnd` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `friend_requests`
--

CREATE TABLE `friend_requests` (
  `id` int(5) NOT NULL,
  `userID` int(5) NOT NULL,
  `requestedBy` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hardware`
--

CREATE TABLE `hardware` (
  `serverID` int(5) NOT NULL,
  `userID` int(5) NOT NULL,
  `name` varchar(15) NOT NULL DEFAULT '',
  `cpu` float NOT NULL DEFAULT 500,
  `hdd` float NOT NULL DEFAULT 100,
  `ram` float NOT NULL DEFAULT 256,
  `net` float NOT NULL DEFAULT 1,
  `isNPC` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hardware`
--

INSERT INTO `hardware` (`serverID`, `userID`, `name`, `cpu`, `hdd`, `ram`, `net`, `isNPC`) VALUES
(6594108, 897301, '', 4000, 50000, 2048, 100, 1),
(6594109, 897302, '', 3500, 20000, 2048, 20, 1),
(6594110, 897303, '', 4000, 10000, 2048, 50, 1),
(6594111, 897304, '', 4000, 10000, 2048, 20, 1),
(6594112, 897305, '', 4000, 10000, 2048, 100, 1),
(6594113, 897306, '', 8000, 50000, 4096, 1000, 1),
(6594114, 897307, '', 3500, 15000, 2048, 20, 1),
(6594115, 897308, '', 2500, 10000, 2048, 10, 1),
(6594116, 897309, '', 3500, 15000, 2048, 20, 1),
(6594117, 897310, '', 2500, 10000, 2048, 10, 1),
(6594118, 897311, '', 3500, 15000, 2048, 20, 1),
(6594119, 897312, '', 2500, 10000, 2048, 10, 1),
(6594120, 897313, '', 3500, 15000, 2048, 20, 1),
(6594121, 897314, '', 2500, 10000, 2048, 10, 1),
(6594122, 897315, '', 3500, 15000, 2048, 20, 1),
(6594123, 897316, '', 2500, 10000, 2048, 10, 1),
(6594124, 897317, '', 3500, 15000, 2048, 20, 1),
(6594125, 897318, '', 2500, 10000, 2048, 10, 1),
(6594126, 897319, '', 3500, 15000, 2048, 20, 1),
(6594127, 897320, '', 2500, 10000, 2048, 10, 1),
(6594128, 897321, '', 3500, 15000, 2048, 20, 1),
(6594129, 897322, '', 2500, 10000, 2048, 10, 1),
(6594130, 897323, '', 3500, 15000, 2048, 20, 1),
(6594131, 897324, '', 2500, 10000, 2048, 10, 1),
(6594132, 897325, '', 3500, 10000, 2048, 20, 1),
(6594133, 897326, '', 2500, 10000, 2048, 10, 1),
(6594134, 897327, '', 3500, 15000, 2048, 20, 1),
(6594135, 897328, '', 4500, 10000, 2048, 10, 1),
(6594136, 897329, '', 3500, 15000, 2048, 20, 1),
(6594137, 897330, '', 2500, 10000, 2048, 10, 1),
(6594138, 897331, '', 3500, 15000, 2048, 20, 1),
(6594139, 897332, '', 2500, 10000, 2048, 10, 1),
(6594140, 897333, '', 3500, 15000, 2048, 20, 1),
(6594141, 897334, '', 2500, 10000, 2048, 10, 1),
(6594142, 897335, '', 3500, 15000, 2048, 20, 1),
(6594143, 897336, '', 2500, 10000, 2048, 10, 1),
(6594144, 897337, '', 3500, 15000, 2048, 20, 1),
(6594145, 897338, '', 2500, 10000, 2048, 10, 1),
(6594146, 897339, '', 3500, 15000, 2048, 20, 1),
(6594147, 897340, '', 2500, 10000, 2048, 10, 1),
(6594148, 897341, '', 3500, 15000, 2048, 20, 1),
(6594149, 897342, '', 2500, 10000, 2048, 10, 1),
(6594150, 897343, '', 3500, 15000, 2048, 20, 1),
(6594151, 897344, '', 2500, 10000, 2048, 10, 1),
(6594152, 897345, '', 3500, 15000, 2048, 20, 1),
(6594153, 897346, '', 2500, 10000, 2048, 10, 1),
(6594154, 897347, '', 3500, 15000, 2048, 20, 1),
(6594155, 897348, '', 2500, 10000, 2048, 10, 1),
(6594156, 897349, '', 3500, 15000, 2048, 20, 1),
(6594157, 897350, '', 2500, 10000, 2048, 10, 1),
(6594158, 897351, '', 3500, 15000, 2048, 20, 1),
(6594159, 897352, '', 2500, 10000, 2048, 10, 1),
(6594160, 897353, '', 3500, 15000, 2048, 20, 1),
(6594161, 897354, '', 2000, 10000, 1024, 200, 1),
(6594162, 897355, '', 8000, 50000, 4096, 1000, 1),
(6594163, 897356, '', 4000, 50000, 2048, 50, 1),
(6594164, 897357, '', 4000, 50000, 2048, 50, 1),
(6594165, 897358, '', 4000, 50000, 2048, 50, 1),
(6594166, 897359, '', 4000, 50000, 2048, 100, 1),
(6594167, 897360, '', 4000, 50000, 2048, 75, 1),
(6594168, 897361, '', 4000, 20000, 1024, 10, 1),
(6594169, 897362, '', 4000, 50000, 2048, 100, 1),
(6594170, 897363, '', 4000, 50000, 2048, 100, 1),
(6594171, 897364, '', 2000, 20000, 2048, 10, 1),
(6594172, 897365, '', 3000, 40000, 2048, 20, 1),
(6594173, 897366, '', 2500, 20000, 1024, 15, 1),
(6594174, 897367, '', 6000, 20000, 2048, 100, 1),
(6594175, 897368, '', 4000, 10000, 2048, 20, 1),
(6594176, 897369, '', 1000, 5000, 512, 5, 1),
(6594177, 897370, '', 4000, 50000, 2048, 50, 1),
(6594178, 897371, '', 2000, 10000, 1024, 10, 1),
(6594179, 897372, '', 1500, 10000, 1024, 10, 1),
(6594180, 897373, '', 2500, 15000, 1536, 15, 1),
(6594181, 897374, '', 2500, 15000, 1536, 15, 1),
(6594182, 897375, '', 1000, 5000, 512, 5, 1),
(6594183, 897376, '', 2000, 10000, 1024, 10, 1),
(6594184, 897377, '', 1500, 10000, 1024, 10, 1),
(6594185, 897378, '', 2500, 15000, 1536, 15, 1),
(6594186, 897379, '', 2500, 15000, 1536, 15, 1),
(6594187, 897380, '', 3000, 20000, 2048, 20, 1),
(6594188, 897381, '', 3000, 20000, 2048, 20, 1),
(6594189, 897382, '', 4000, 50000, 2048, 50, 1),
(6594190, 897383, '', 4000, 50000, 2048, 50, 1),
(6594191, 897384, '', 4000, 50000, 2048, 50, 1),
(6594192, 897385, '', 1000, 5000, 512, 5, 1),
(6594193, 897386, '', 2000, 10000, 1024, 10, 1),
(6594194, 897387, '', 1500, 10000, 1024, 10, 1),
(6594195, 897388, '', 2500, 15000, 1536, 15, 1),
(6594196, 897389, '', 2500, 15000, 1536, 15, 1),
(6594197, 897390, '', 3000, 20000, 2048, 20, 1),
(6594198, 897391, '', 3000, 20000, 2048, 20, 1),
(6594199, 897392, '', 4000, 50000, 2048, 50, 1),
(6594200, 897393, '', 4000, 50000, 2048, 50, 1),
(6594201, 897394, '', 4000, 50000, 2048, 50, 1),
(6594202, 897395, '', 1000, 5000, 512, 5, 1),
(6594203, 897396, '', 2000, 10000, 1024, 10, 1),
(6594204, 897397, '', 1500, 10000, 1024, 10, 1),
(6594205, 897398, '', 2500, 15000, 1536, 15, 1),
(6594206, 897399, '', 2500, 15000, 1536, 15, 1),
(6594207, 897400, '', 3000, 20000, 2048, 20, 1),
(6594208, 897401, '', 3000, 20000, 2048, 20, 1),
(6594209, 897402, '', 4000, 50000, 2048, 50, 1),
(6594210, 897403, '', 4000, 50000, 2048, 50, 1),
(6594211, 750716, 'Server #1', 500, 100, 256, 1, 0),
(6594212, 750717, 'Server #1', 500, 100, 256, 1, 0),
(6594213, 897405, '', 1500, 100, 256, 10, 1),
(6594214, 897406, '', 1500, 100, 256, 10, 1),
(6594215, 897407, '', 1500, 100, 256, 10, 1),
(6594216, 897408, '', 1500, 100, 256, 10, 1),
(6594217, 897409, '', 1500, 100, 256, 10, 1),
(6594218, 897410, '', 1500, 100, 256, 10, 1),
(6594219, 897411, '', 1500, 100, 256, 10, 1),
(6594220, 897412, '', 1500, 100, 256, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hardware_external`
--

CREATE TABLE `hardware_external` (
  `serverID` int(5) NOT NULL,
  `userID` int(5) NOT NULL,
  `name` varchar(15) NOT NULL,
  `size` int(4) NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hist_clans`
--

CREATE TABLE `hist_clans` (
  `id` int(5) NOT NULL,
  `cid` int(5) NOT NULL,
  `rank` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `nick` varchar(4) NOT NULL,
  `reputation` bigint(10) NOT NULL,
  `members` tinyint(3) NOT NULL,
  `round` tinyint(3) NOT NULL,
  `won` int(4) NOT NULL,
  `lost` int(4) NOT NULL,
  `rate` float NOT NULL,
  `clicks` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hist_clans_current`
--

CREATE TABLE `hist_clans_current` (
  `id` int(5) NOT NULL,
  `cid` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `nick` varchar(4) NOT NULL,
  `clanIP` bigint(12) NOT NULL,
  `reputation` bigint(10) NOT NULL,
  `members` tinyint(3) NOT NULL,
  `won` smallint(4) NOT NULL,
  `lost` smallint(4) NOT NULL,
  `rate` double NOT NULL,
  `clicks` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hist_clans_war`
--

CREATE TABLE `hist_clans_war` (
  `id` int(5) UNSIGNED NOT NULL,
  `idWinner` int(5) UNSIGNED NOT NULL,
  `idLoser` int(5) UNSIGNED NOT NULL,
  `scoreWinner` int(10) UNSIGNED NOT NULL,
  `scoreLoser` int(10) UNSIGNED NOT NULL,
  `startDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `endDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bounty` int(10) UNSIGNED NOT NULL,
  `round` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hist_ddos`
--

CREATE TABLE `hist_ddos` (
  `id` int(5) NOT NULL,
  `rank` int(4) NOT NULL,
  `round` tinyint(2) NOT NULL,
  `attID` int(5) NOT NULL,
  `attUser` varchar(35) NOT NULL,
  `vicID` int(5) NOT NULL,
  `vicUser` varchar(35) NOT NULL,
  `power` int(10) NOT NULL,
  `servers` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hist_doom`
--

CREATE TABLE `hist_doom` (
  `round` tinyint(3) NOT NULL,
  `doomCreatorID` int(5) UNSIGNED NOT NULL,
  `doomClanID` int(5) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hist_mails`
--

CREATE TABLE `hist_mails` (
  `id` int(5) UNSIGNED NOT NULL,
  `from` int(5) UNSIGNED NOT NULL,
  `to` int(5) UNSIGNED NOT NULL,
  `subject` varchar(50) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `dateSent` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `round` smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hist_missions`
--

CREATE TABLE `hist_missions` (
  `id` int(5) UNSIGNED NOT NULL,
  `userID` int(5) UNSIGNED NOT NULL,
  `type` tinyint(2) NOT NULL,
  `hirerID` int(5) UNSIGNED NOT NULL,
  `prize` int(6) NOT NULL,
  `missionEnd` datetime NOT NULL,
  `completed` tinyint(1) NOT NULL,
  `round` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hist_software`
--

CREATE TABLE `hist_software` (
  `id` int(5) NOT NULL,
  `rank` int(5) NOT NULL,
  `softName` varchar(50) NOT NULL,
  `softType` tinyint(2) NOT NULL,
  `softVersion` double NOT NULL,
  `owner` varchar(50) NOT NULL,
  `ownerID` int(5) NOT NULL,
  `round` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hist_users`
--

CREATE TABLE `hist_users` (
  `id` int(5) NOT NULL,
  `rank` int(5) NOT NULL,
  `userID` int(5) NOT NULL,
  `user` varchar(30) NOT NULL,
  `reputation` bigint(10) NOT NULL,
  `bestSoft` varchar(50) NOT NULL,
  `bestSoftVersion` float NOT NULL,
  `clanName` varchar(30) NOT NULL,
  `age` int(5) NOT NULL,
  `timePlaying` double NOT NULL,
  `bitcoinSent` double UNSIGNED NOT NULL,
  `spamSent` int(15) UNSIGNED NOT NULL,
  `warezSent` float UNSIGNED NOT NULL,
  `profileViews` int(5) UNSIGNED NOT NULL,
  `researchCount` int(5) UNSIGNED NOT NULL,
  `missionCount` int(5) NOT NULL,
  `hackCount` int(5) NOT NULL,
  `ddosCount` int(4) NOT NULL,
  `ipResets` int(4) NOT NULL,
  `moneyEarned` bigint(15) NOT NULL,
  `moneyTransfered` bigint(15) NOT NULL,
  `moneyHardware` bigint(15) NOT NULL,
  `moneyResearch` bigint(15) NOT NULL,
  `round` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hist_users_current`
--

CREATE TABLE `hist_users_current` (
  `id` int(5) NOT NULL,
  `userID` int(5) NOT NULL,
  `user` varchar(50) NOT NULL DEFAULT '',
  `reputation` bigint(15) NOT NULL DEFAULT 0,
  `age` int(4) NOT NULL DEFAULT 0,
  `clanID` int(5) NOT NULL DEFAULT 0,
  `clanName` varchar(50) NOT NULL DEFAULT '',
  `timePlaying` double NOT NULL DEFAULT 0,
  `missionCount` int(5) NOT NULL DEFAULT 0,
  `hackCount` int(5) NOT NULL DEFAULT 0,
  `ddosCount` int(5) NOT NULL DEFAULT 0,
  `ipResets` int(4) NOT NULL DEFAULT 0,
  `moneyEarned` bigint(15) NOT NULL DEFAULT 0,
  `moneyTransfered` bigint(15) NOT NULL DEFAULT 0,
  `moneyHardware` bigint(15) NOT NULL DEFAULT 0,
  `moneyResearch` bigint(15) NOT NULL DEFAULT 0,
  `warezSent` int(20) UNSIGNED NOT NULL DEFAULT 0,
  `spamSent` int(20) UNSIGNED NOT NULL DEFAULT 0,
  `bitcoinSent` double UNSIGNED DEFAULT 0,
  `profileViews` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hist_users_current`
--

INSERT INTO `hist_users_current` (`id`, `userID`, `user`, `reputation`, `age`, `clanID`, `clanName`, `timePlaying`, `missionCount`, `hackCount`, `ddosCount`, `ipResets`, `moneyEarned`, `moneyTransfered`, `moneyHardware`, `moneyResearch`, `warezSent`, `spamSent`, `bitcoinSent`, `profileViews`) VALUES
(750484, 750716, '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(750485, 750717, '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `internet_connections`
--

CREATE TABLE `internet_connections` (
  `userID` int(5) NOT NULL,
  `ip` bigint(14) NOT NULL,
  `expires` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `internet_connections`
--

INSERT INTO `internet_connections` (`userID`, `ip`, `expires`) VALUES
(750717, 2950904171, '2019-11-18 09:27:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `internet_home`
--

CREATE TABLE `internet_home` (
  `userID` int(5) UNSIGNED NOT NULL,
  `homeIP` bigint(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `internet_important`
--

CREATE TABLE `internet_important` (
  `id` int(10) UNSIGNED NOT NULL,
  `userID` int(5) UNSIGNED NOT NULL,
  `ip` bigint(11) UNSIGNED NOT NULL,
  `name` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `internet_important`
--

INSERT INTO `internet_important` (`id`, `userID`, `ip`, `name`) VALUES
(970151, 750717, 16909060, ''),
(970152, 750717, 631326715, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `internet_webserver`
--

CREATE TABLE `internet_webserver` (
  `id` int(5) NOT NULL,
  `webDesc` text NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lists`
--

CREATE TABLE `lists` (
  `id` int(5) NOT NULL,
  `userID` int(5) NOT NULL,
  `ip` bigint(11) NOT NULL,
  `user` varchar(8) NOT NULL,
  `pass` varchar(9) NOT NULL,
  `hackedTime` datetime NOT NULL,
  `virusID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lists`
--

INSERT INTO `lists` (`id`, `userID`, `ip`, `user`, `pass`, `hackedTime`, `virusID`) VALUES
(4620175, 750717, 2950904171, 'download', 'download', '2019-11-18 09:51:09', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lists_bankAccounts`
--

CREATE TABLE `lists_bankAccounts` (
  `id` int(5) NOT NULL,
  `userID` int(5) NOT NULL,
  `bankID` int(5) NOT NULL,
  `bankAcc` int(6) NOT NULL,
  `bankPass` varchar(6) NOT NULL,
  `bankIP` int(11) NOT NULL,
  `hackedDate` datetime NOT NULL,
  `lastMoney` int(10) NOT NULL,
  `lastMoneyDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lists_collect`
--

CREATE TABLE `lists_collect` (
  `userID` int(5) UNSIGNED NOT NULL,
  `collectText` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lists_notifications`
--

CREATE TABLE `lists_notifications` (
  `userID` int(5) NOT NULL,
  `ip` bigint(11) NOT NULL,
  `notificationType` tinyint(1) NOT NULL,
  `virusName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lists_specs`
--

CREATE TABLE `lists_specs` (
  `listID` int(5) UNSIGNED NOT NULL,
  `spec_net` int(5) NOT NULL DEFAULT 1,
  `spec_hdd` int(5) NOT NULL DEFAULT 1000
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lists_specs`
--

INSERT INTO `lists_specs` (`listID`, `spec_net`, `spec_hdd`) VALUES
(4620175, 100, 50000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lists_specs_analyzed`
--

CREATE TABLE `lists_specs_analyzed` (
  `listID` int(5) UNSIGNED NOT NULL,
  `minCPU` int(5) UNSIGNED NOT NULL,
  `maxCPU` int(5) UNSIGNED NOT NULL,
  `minRAM` int(5) UNSIGNED NOT NULL,
  `maxRAM` int(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE `log` (
  `userID` int(5) NOT NULL,
  `text` text NOT NULL DEFAULT '',
  `isNPC` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `log`
--

INSERT INTO `log` (`userID`, `text`, `isNPC`) VALUES
(897301, '', 1),
(897302, '', 1),
(897303, '', 1),
(897304, '', 1),
(897305, '', 1),
(897306, '', 1),
(897307, '', 1),
(897308, '', 1),
(897309, '', 1),
(897310, '', 1),
(897311, '', 1),
(897312, '', 1),
(897313, '', 1),
(897314, '', 1),
(897315, '', 1),
(897316, '', 1),
(897317, '', 1),
(897318, '', 1),
(897319, '', 1),
(897320, '', 1),
(897321, '', 1),
(897322, '', 1),
(897323, '', 1),
(897324, '', 1),
(897325, '', 1),
(897326, '', 1),
(897327, '', 1),
(897328, '', 1),
(897329, '', 1),
(897330, '', 1),
(897331, '', 1),
(897332, '', 1),
(897333, '', 1),
(897334, '', 1),
(897335, '', 1),
(897336, '', 1),
(897337, '', 1),
(897338, '', 1),
(897339, '', 1),
(897340, '', 1),
(897341, '', 1),
(897342, '', 1),
(897343, '', 1),
(897344, '', 1),
(897345, '', 1),
(897346, '', 1),
(897347, '', 1),
(897348, '', 1),
(897349, '', 1),
(897350, '', 1),
(897351, '', 1),
(897352, '', 1),
(897353, '', 1),
(897354, '', 1),
(897355, '', 1),
(897356, '', 1),
(897357, '', 1),
(897358, '', 1),
(897359, '2019-11-18 10:30 - [170.177.168.121] downloaded file Basic Cracker.crc (1.0) at localhost\n2019-11-18 09:27 - [170.177.168.121] logged in as download\n2019-11-18 08:57 - [170.177.168.121] downloaded file Basic Cracker.crc (1.0) at localhost\n2019-11-18 08:51 - [170.177.168.121] logged in as download\n', 1),
(897360, '', 1),
(897361, '', 1),
(897362, '', 1),
(897363, '', 1),
(897364, '2019-11-18 09:01 - [170.177.168.121] logged on account #724267811\n', 1),
(897365, '', 1),
(897366, '', 1),
(897367, '', 1),
(897368, '', 1),
(897369, '', 1),
(897370, '', 1),
(897371, '', 1),
(897372, '', 1),
(897373, '', 1),
(897374, '', 1),
(897375, '', 1),
(897376, '', 1),
(897377, '', 1),
(897378, '', 1),
(897379, '', 1),
(897380, '', 1),
(897381, '', 1),
(897382, '', 1),
(897383, '', 1),
(897384, '', 1),
(897385, '', 1),
(897386, '', 1),
(897387, '', 1),
(897388, '', 1),
(897389, '', 1),
(897390, '', 1),
(897391, '', 1),
(897392, '', 1),
(897393, '', 1),
(897394, '', 1),
(897395, '', 1),
(897396, '', 1),
(897397, '', 1),
(897398, '', 1),
(897399, '', 1),
(897400, '', 1),
(897401, '', 1),
(897402, '', 1),
(897403, '', 1),
(750716, '2019-11-17 18:15 - localhost installed current operating system', 0),
(750717, '2019-11-18 10:40 - localhost installed file Basic Cracker.crc (1.0)\n2019-11-18 10:30 - localhost downloaded file Basic Cracker.crc (1.0) at [170.177.168.121]\n2019-11-18 09:27 - localhost logged in to [175.227.57.107] as download\n2019-11-18 10:08 - localhost deleted file cracker.crc (1.0)\n2019-11-18 10:08 - localhost deleted file Basic Cracker.crc (1.0)\n2019-11-18 10:08 - localhost deleted file cracker.crc (1.0)\n2019-11-18 09:06 - localhost logged in\n2019-11-18 10:02 - localhost installed file cracker.crc (1.0)\n2019-11-18 09:01 - localhost logged on account #724267811 on bank [37.161.71.251]\n2019-11-18 08:58 - localhost installed file cracker.crc (1.0)\n2019-11-18 09:57 - localhost installed file cracker.crc (1.0)\n2019-11-18 08:57 - localhost downloaded file Basic Cracker.crc (1.0) at [170.177.168.121]\n2019-11-18 08:51 - localhost logged in to [175.227.57.107] as download\n2019-11-18 08:31 - localhost logged in\n2019-11-18 08:28 - localhost logged in\n2019-11-18 08:27 - localhost logged in\n2019-11-18 08:22 - localhost logged in\n2019-11-18 08:21 - localhost logged in\n2019-11-18 08:15 - localhost installed file cracker.crc (1.0)\n2019-11-18 09:15 - localhost installed file cracker.crc (1.0)\n2019-11-18 09:13 - localhost installed file cracker.crc (1.0)\n2019-11-17 18:48 - localhost installed file cracker.crc (1.0)\n2019-11-17 19:48 - localhost installed file cracker.crc (1.0)\n2019-11-17 18:47 - localhost installed file cracker.crc (1.0)\n2019-11-17 19:47 - localhost installed file cracker.crc (1.0)\n2019-11-17 18:44 - localhost logged in\n2019-11-17 18:42 - localhost logged in\n2019-11-17 18:39 - localhost logged in\n2019-11-17 17:46 - localhost logged in\n2019-11-17 18:46 - localhost installed current operating system', 0),
(897405, '', 1),
(897406, '', 1),
(897407, '', 1),
(897408, '', 1),
(897409, '', 1),
(897410, '', 1),
(897411, '', 1),
(897412, '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_edit`
--

CREATE TABLE `log_edit` (
  `id` int(5) UNSIGNED NOT NULL,
  `vicID` int(5) NOT NULL,
  `isNPC` tinyint(1) NOT NULL,
  `editorID` int(5) NOT NULL,
  `logText` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mails`
--

CREATE TABLE `mails` (
  `id` int(10) NOT NULL,
  `from` int(5) NOT NULL,
  `to` int(5) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `subject` varchar(40) NOT NULL,
  `text` text NOT NULL,
  `dateSent` datetime NOT NULL,
  `isRead` tinyint(1) NOT NULL DEFAULT 0,
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mails`
--

INSERT INTO `mails` (`id`, `from`, `to`, `type`, `subject`, `text`, `dateSent`, `isRead`, `isDeleted`) VALUES
(4016487, -1, 750717, 0, 'Doom the world!', 'Hello <strong>attempt9</strong>,<br/><br/>I\'m Ensei Tankado, CEO of Numataka Corporation, and I\'m the guy who sponsored your equipment.<br/><br/>You might have heard of the recent leak of former NSA employee Edward Snowden, right? Well, the guy said the agency holds an extremely powerful virus that easily spreads through the network.<br/>The Doom Virus, as it was named, was the result of a banned experiment from Geek Pride Labs.<br/>This virus, if correctly setup, can hold the entire Internet as hostage of one single server.<br/><br/>He also said that they use a fork of this virus to spy on every user of the world.<br/><br/>Funny story, everyone is blaming the NSA for spying, but no one sees the potential of the original Doom Virus.<br/><br/>Well, I think you know why we hired you now. No one was able to hack the NSA - <em>until now</em>.<br/><br/>Keep researching your softwares, and good luck on your duty. You are not the only one after the virus.<br/><br/>By the way, I have an unattended job here, hope you don\'t mind but I assigned it to you.<br/><br/><br/>Sincerely,<br/>Ensei Tankado.', '2019-11-17 19:45:14', 1, 0),
(4016488, -1, 750717, 0, 'Doom the world!', 'Hello <strong>attempt9</strong>,<br/><br/>I\'m Ensei Tankado, CEO of Numataka Corporation, and I\'m the guy who sponsored your equipment.<br/><br/>You might have heard of the recent leak of former NSA employee Edward Snowden, right? Well, the guy said the agency holds an extremely powerful virus that easily spreads through the network.<br/>The Doom Virus, as it was named, was the result of a banned experiment from Geek Pride Labs.<br/>This virus, if correctly setup, can hold the entire Internet as hostage of one single server.<br/><br/>He also said that they use a fork of this virus to spy on every user of the world.<br/><br/>Funny story, everyone is blaming the NSA for spying, but no one sees the potential of the original Doom Virus.<br/><br/>Well, I think you know why we hired you now. No one was able to hack the NSA - <em>until now</em>.<br/><br/>Keep researching your softwares, and good luck on your duty. You are not the only one after the virus.<br/><br/>By the way, I have an unattended job here, hope you don\'t mind but I assigned it to you.<br/><br/><br/>Sincerely,<br/>Ensei Tankado.', '2019-11-18 10:06:42', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mails_history`
--

CREATE TABLE `mails_history` (
  `mid` int(15) UNSIGNED NOT NULL,
  `infoDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `info1` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `missions`
--

CREATE TABLE `missions` (
  `id` int(5) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `hirer` bigint(11) UNSIGNED NOT NULL,
  `victim` bigint(11) UNSIGNED NOT NULL,
  `info` bigint(11) UNSIGNED NOT NULL,
  `newInfo` int(6) NOT NULL,
  `info2` bigint(11) NOT NULL DEFAULT 0,
  `newInfo2` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `missionStart` date NOT NULL DEFAULT current_timestamp(),
  `missionEnd` date NOT NULL DEFAULT '0000-00-00',
  `prize` int(6) NOT NULL,
  `userID` int(5) NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT 0,
  `dateGenerated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `missions`
--

INSERT INTO `missions` (`id`, `type`, `status`, `hirer`, `victim`, `info`, `newInfo`, `info2`, `newInfo2`, `missionStart`, `missionEnd`, `prize`, `userID`, `level`, `dateGenerated`) VALUES
(13887278, 80, 2, 1890999741, 4087210038, 2258688978, 0, 0, 0, '2019-11-17', '0000-00-00', 500, 750717, 0, '2019-11-17 18:43:09'),
(13887279, 80, 2, 1890999741, 3050515027, 4019826451, 0, 0, 0, '2019-11-17', '0000-00-00', 500, 750717, 0, '2019-11-17 18:45:14'),
(13887280, 80, 2, 1890999741, 3590107494, 3798506279, 0, 0, 0, '2019-11-18', '0000-00-00', 500, 750717, 0, '2019-11-18 09:06:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `missions_history`
--

CREATE TABLE `missions_history` (
  `id` int(5) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `hirer` bigint(11) NOT NULL,
  `missionEnd` date NOT NULL,
  `prize` int(6) NOT NULL,
  `userID` int(5) NOT NULL,
  `completed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `missions_seed`
--

CREATE TABLE `missions_seed` (
  `missionID` int(5) UNSIGNED NOT NULL,
  `greeting` tinyint(1) NOT NULL,
  `intro` tinyint(1) NOT NULL,
  `victim_call` tinyint(1) NOT NULL,
  `payment` tinyint(1) NOT NULL,
  `victim_location` tinyint(1) NOT NULL,
  `warning` tinyint(1) NOT NULL,
  `action` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `missions_seed`
--

INSERT INTO `missions_seed` (`missionID`, `greeting`, `intro`, `victim_call`, `payment`, `victim_location`, `warning`, `action`) VALUES
(13887278, 1, 1, 1, 2, 3, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `news`
--

CREATE TABLE `news` (
  `id` int(5) NOT NULL,
  `author` varchar(30) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL,
  `type` tinyint(2) NOT NULL,
  `info1` varchar(15) NOT NULL DEFAULT '',
  `info2` varchar(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `news`
--

INSERT INTO `news` (`id`, `author`, `title`, `content`, `date`, `type`, `info1`, `info2`) VALUES
(35359, '-8', 'Round #13 started', 'Ye\'all, get ready to hack! Round 13 just started.', '2019-11-17 18:14:31', 0, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `news_history`
--

CREATE TABLE `news_history` (
  `newsID` int(5) UNSIGNED NOT NULL,
  `info1` varchar(15) NOT NULL,
  `info2` varchar(15) NOT NULL,
  `infoDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npc`
--

CREATE TABLE `npc` (
  `id` int(5) NOT NULL,
  `npcType` tinyint(2) NOT NULL,
  `npcIP` bigint(11) NOT NULL,
  `npcPass` varchar(8) NOT NULL,
  `downUntil` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `npc`
--

INSERT INTO `npc` (`id`, `npcType`, `npcIP`, `npcPass`, `downUntil`) VALUES
(897301, 20, 1890999741, 'p7l3kqaC', '2019-11-17 17:14:27'),
(897302, 2, 16909060, 'N2rIjAJw', '2019-11-17 17:14:27'),
(897303, 2, 2808233479, 'w42cYMwy', '2019-11-17 17:14:27'),
(897304, 2, 3454137537, 'qBNOYylo', '2019-11-17 17:14:27'),
(897305, 2, 1837169360, 'wQfWuPNw', '2019-11-17 17:14:27'),
(897306, 52, 2107400348, '15rOXWNx', '2019-11-17 17:14:27'),
(897307, 7, 1271925270, 'zpBYVVsi', '2019-11-17 17:14:27'),
(897308, 7, 3811160708, 't1d8GRo0', '2019-11-17 17:14:27'),
(897309, 7, 1629818329, '4qPF3DPt', '2019-11-17 17:14:27'),
(897310, 7, 425945392, 'JAlHj8dQ', '2019-11-17 17:14:27'),
(897311, 7, 3493431019, 'Cta0RMDE', '2019-11-17 17:14:27'),
(897312, 7, 2246132780, 'gaV7134D', '2019-11-17 17:14:27'),
(897313, 7, 3560530509, 'menfxIJS', '2019-11-17 17:14:27'),
(897314, 7, 51320246, 'topvf9hZ', '2019-11-17 17:14:27'),
(897315, 7, 2262625671, 'SgTOT9GA', '2019-11-17 17:14:27'),
(897316, 7, 3006558922, 'eLiCpVoL', '2019-11-17 17:14:27'),
(897317, 7, 2773270208, 'irZCyPg0', '2019-11-17 17:14:27'),
(897318, 7, 1535986078, '0PSyTHbk', '2019-11-17 17:14:27'),
(897319, 7, 2891109199, 'vsNB5YXn', '2019-11-17 17:14:27'),
(897320, 7, 3553564821, 'nOElArc6', '2019-11-17 17:14:27'),
(897321, 7, 3070920317, 'drxVpM6B', '2019-11-17 17:14:27'),
(897322, 7, 732163147, 'fELeHnxp', '2019-11-17 17:14:27'),
(897323, 7, 1582451177, '4CfZ9yW4', '2019-11-17 17:14:27'),
(897324, 7, 3554643417, 'rLD14pYn', '2019-11-17 17:14:27'),
(897325, 7, 304176518, 'mGqjjRDr', '2019-11-17 17:14:27'),
(897326, 7, 899566292, 'SckPYOhb', '2019-11-17 17:14:27'),
(897327, 7, 3772474266, 'YnBaCAgX', '2019-11-17 17:14:27'),
(897328, 7, 2566622803, '8QE9LooU', '2019-11-17 17:14:27'),
(897329, 7, 4071877289, 'cIjLhVIQ', '2019-11-17 17:14:27'),
(897330, 7, 4047697888, 'C8kvRdAQ', '2019-11-17 17:14:27'),
(897331, 7, 2326283754, 'bj16vgn2', '2019-11-17 17:14:27'),
(897332, 7, 2242186036, 'yOTUIOaM', '2019-11-17 17:14:27'),
(897333, 7, 2410190456, '1cOEJFid', '2019-11-17 17:14:27'),
(897334, 7, 1405234358, 'V3i7AXxx', '2019-11-17 17:14:27'),
(897335, 7, 3139533362, 'sJWBHVSL', '2019-11-17 17:14:27'),
(897336, 7, 2324591866, '8hwZJLdG', '2019-11-17 17:14:27'),
(897337, 7, 3251382130, 'XjL5i5Cj', '2019-11-17 17:14:27'),
(897338, 7, 1862040204, 'aNKI6eS4', '2019-11-17 17:14:27'),
(897339, 7, 4055266144, 'f2PHdDu9', '2019-11-17 17:14:27'),
(897340, 7, 2740838515, 'rW6zZGwR', '2019-11-17 17:14:27'),
(897341, 7, 1773005737, 'g0T3WDaV', '2019-11-17 17:14:27'),
(897342, 7, 1214818258, 'xS12A5VN', '2019-11-17 17:14:27'),
(897343, 7, 1569149824, 'NZ27wziu', '2019-11-17 17:14:27'),
(897344, 7, 713547745, '8cyw6A9i', '2019-11-17 17:14:27'),
(897345, 7, 254773637, 'PnqUEgyC', '2019-11-17 17:14:27'),
(897346, 7, 1307059969, 'sPSHLk6p', '2019-11-17 17:14:27'),
(897347, 7, 2803751797, 'xXpT4DdT', '2019-11-17 17:14:27'),
(897348, 7, 3026378680, '4nU4uQdH', '2019-11-17 17:14:27'),
(897349, 7, 3004035662, 'e0m5v62Z', '2019-11-17 17:14:27'),
(897350, 7, 1561950514, 'RVOJqSVx', '2019-11-17 17:14:27'),
(897351, 7, 682460569, 'sgdL5oeu', '2019-11-17 17:14:27'),
(897352, 7, 2254820714, 'SXbGhSBF', '2019-11-17 17:14:27'),
(897353, 7, 1631488234, 'N3nBhCF2', '2019-11-17 17:14:27'),
(897354, 5, 1874876644, 'aLUB8BIR', '2019-11-17 17:14:27'),
(897355, 40, 1431255752, 'nWVArfpa', '2019-11-17 17:14:27'),
(897356, 6, 4057832471, 'BzQ9WtOz', '2019-11-17 17:14:27'),
(897357, 6, 1767085636, 'iWuBzsBa', '2019-11-17 17:14:27'),
(897358, 6, 2580709158, 'hpS70PxG', '2019-11-17 17:14:27'),
(897359, 8, 2950904171, 'EhgZSWU7', '2019-11-17 17:14:27'),
(897360, 30, 1882073937, 'mJByvHv5', '2019-11-17 17:14:27'),
(897361, 50, 87638089, 'wW5B3JP9', '2019-11-17 17:14:27'),
(897362, 51, 858935986, 'Sz9e3qtA', '2019-11-17 17:14:27'),
(897363, 45, 3958592324, '2aivLyQb', '2019-11-17 17:14:27'),
(897364, 1, 631326715, 'gTL0zBOc', '2019-11-17 17:14:27'),
(897365, 1, 836200561, '5mlyt6Ws', '2019-11-17 17:14:27'),
(897366, 1, 3775727625, 'E78EV6R7', '2019-11-17 17:14:27'),
(897367, 1, 185146842, 'QIDa8izG', '2019-11-17 17:14:27'),
(897368, 1, 4227578700, 'Te9EEaCd', '2019-11-17 17:14:27'),
(897369, 71, 2769012665, 'CPhvDRsE', '2019-11-17 17:14:27'),
(897370, 71, 3236846725, 'SJX6lh0R', '2019-11-17 17:14:27'),
(897371, 71, 2954746022, 'tScNrTF9', '2019-11-17 17:14:27'),
(897372, 71, 2984988999, '8TskCHuB', '2019-11-17 17:14:27'),
(897373, 71, 3621335455, '9Qx4IFnr', '2019-11-17 17:14:27'),
(897374, 71, 2573342566, 'wPVxJRwu', '2019-11-17 17:14:27'),
(897375, 71, 1697732359, '3Qa89mbR', '2019-11-17 17:14:27'),
(897376, 71, 1643322079, 'aXzV2XBT', '2019-11-17 17:14:27'),
(897377, 71, 1865683415, 'lJDqMwHc', '2019-11-17 17:14:27'),
(897378, 71, 1862308925, 'CCPx8RWE', '2019-11-17 17:14:27'),
(897379, 71, 3579715278, 'GTquj2n3', '2019-11-17 17:14:27'),
(897380, 71, 2152964358, 'xHirT2CM', '2019-11-17 17:14:27'),
(897381, 71, 2271792900, 'gyvbeBND', '2019-11-17 17:14:27'),
(897382, 71, 2460499829, 'pxkVZNvQ', '2019-11-17 17:14:27'),
(897383, 71, 438945922, '5uvSHFAm', '2019-11-17 17:14:27'),
(897384, 72, 2629257031, 'I1vInWLh', '2019-11-17 17:14:27'),
(897385, 72, 968683468, 'P6Moer3y', '2019-11-17 17:14:27'),
(897386, 72, 4139377642, 'tPJKb7a1', '2019-11-17 17:14:27'),
(897387, 72, 2623910381, 'q3uXiZTR', '2019-11-17 17:14:27'),
(897388, 72, 1444127349, 'G55uAL0O', '2019-11-17 17:14:27'),
(897389, 72, 1151643032, 'KOTIxIMO', '2019-11-17 17:14:27'),
(897390, 72, 1167850329, '0OHQi2lw', '2019-11-17 17:14:27'),
(897391, 72, 2809872210, 'XNigDEPY', '2019-11-17 17:14:27'),
(897392, 72, 3788446016, 'ZUirSfMl', '2019-11-17 17:14:27'),
(897393, 72, 1801631421, 'HxfxHIEj', '2019-11-17 17:14:27'),
(897394, 73, 1224805919, 'sSQs0MAd', '2019-11-17 17:14:27'),
(897395, 73, 256492742, 'kOG4aIW1', '2019-11-17 17:14:27'),
(897396, 73, 3072298640, 'RmLL2Tod', '2019-11-17 17:14:27'),
(897397, 73, 3799103481, 'Pif65Ta8', '2019-11-17 17:14:27'),
(897398, 73, 3544189097, 'VqnX0nEa', '2019-11-17 17:14:27'),
(897399, 73, 2276495248, '1FIDakF4', '2019-11-17 17:14:27'),
(897400, 73, 230255956, 'ZbfvNUBm', '2019-11-17 17:14:27'),
(897401, 73, 3152590715, 'ifddpZPq', '2019-11-17 17:14:27'),
(897402, 73, 2276294924, 'Lq53jaBW', '2019-11-17 17:14:27'),
(897403, 73, 2612945562, 'UE16mjR7', '2019-11-17 17:14:27'),
(897404, 80, 3212758778, 'euXv8sAv', '2019-11-17 18:36:41'),
(897405, 80, 2692711793, '9cFFJSz0', '2019-11-17 18:40:00'),
(897406, 80, 983515083, 'QoAYHz9A', '2019-11-17 18:40:00'),
(897407, 80, 4087210038, '94YmZFYs', '2019-11-17 18:43:09'),
(897408, 80, 2258688978, 'RqbHwvM3', '2019-11-17 18:43:09'),
(897409, 80, 3050515027, 'l0O138C6', '2019-11-17 18:45:14'),
(897410, 80, 4019826451, 'vGpvaQM1', '2019-11-17 18:45:14'),
(897411, 80, 3590107494, '0T0ciRTs', '2019-11-18 09:06:42'),
(897412, 80, 3798506279, 'IFN6HgrB', '2019-11-18 09:06:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npc_down`
--

CREATE TABLE `npc_down` (
  `npcID` int(5) UNSIGNED NOT NULL,
  `downDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `downUntil` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npc_expire`
--

CREATE TABLE `npc_expire` (
  `npcID` int(5) UNSIGNED NOT NULL,
  `expireDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npc_info_en`
--

CREATE TABLE `npc_info_en` (
  `npcID` int(5) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `web` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `npc_info_en`
--

INSERT INTO `npc_info_en` (`npcID`, `name`, `web`) VALUES
(897301, 'Geek Pride Labs', ''),
(897302, 'First Whois', 'Welcome to the First Whois server. Enjoy our services!<ul class=\"whois\"><li><a href=\"internet?ip=175.227.57.107\"><span \nclass=\"item\">175.227.57.107</span> - <span \nclass=\"whois-member\">Download Center</span></a></li><li><a href=\"internet?ip=235.243.83.68\"><span \nclass=\"item\">235.243.83.68</span> - <span \nclass=\"whois-member\">Torrent Market</span></a></li><li><a href=\"internet?ip=18.33.93.134\"><span \nclass=\"item\">18.33.93.134</span> - <span \nclass=\"whois-member\">First Puzzle</span></a></li><li><a href=\"internet?ip=37.161.71.251\"><span class=\"item\">37.161.71.251</span> - <span class=\"whois-member\">First International Bank</span></a></li><li><a href=\"internet?ip=101.49.87.7\"><span class=\"item\">101.49.87.7</span> - <span class=\"whois-member\">elgooG</span></a></li><li><a href=\"internet?ip=111.52.17.215\"><span class=\"item\">111.52.17.215</span> - <span class=\"whois-member\">Murder King</span></a></li><li><a href=\"internet?ip=5.57.64.73\"><span \nclass=\"item\">5.57.64.73</span> - <span \nclass=\"whois-member\">Safenet</span></a></li><li><a href=\"internet?ip=213.94.30.206\"><span class=\"item\">213.94.30.206</span> - <span class=\"whois-member\">Pineapple</span></a></li></ul>Trending Sites:<ul class=\"whois\"><li><a href=\"internet?ip=111.192.88.228\"><span class=\"item\">111.192.88.228</span> - <span class=\"whois-member\">ISP - Internet Service Provider</span></a></li><li><a href=\"internet?ip=125.156.96.156\"><span class=\"item\">125.156.96.156</span> - <span class=\"whois-member\">NSA</span></a></li><li><a href=\"internet?ip=152.251.142.83\"><span \nclass=\"item\">152.251.142.83</span> - <span \nclass=\"whois-member\">Hacker News</span></a></li></ul>'),
(897303, 'Third Whois', 'Third Whois<ul class=\"whois\"><li><a href=\"internet?ip=251.251.187.76\"><span class=\"item\">251.251.187.76</span> - <span class=\"whois-member\">Swiss International Bank</span></a></li><li><a href=\"internet?ip=93.25.121.50\"><span class=\"item\">93.25.121.50</span> - <span class=\"whois-member\">Eduard Khil</span></a></li><li><a href=\"internet?ip=183.10.134.125\"><span class=\"item\">183.10.134.125</span> - <span class=\"whois-member\">Gnirut</span></a></li><li><a href=\"internet?ip=187.232.183.123\"><span class=\"item\">187.232.183.123</span> - <span class=\"whois-member\">Weird</span></a></li><li><a href=\"internet?ip=135.173.129.12\"><span class=\"item\">135.173.129.12</span> - <span class=\"whois-member\">Yahoo?</span></a></li><li><a href=\"internet?ip=85.79.58.200\"><span class=\"item\">85.79.58.200</span> - <span class=\"whois-member\">Bitcoin Market</span></a></li><li><a href=\"internet?ip=51.50.82.178\"><span class=\"item\">51.50.82.178</span> - <span class=\"whois-member\">FBI</span></a></li></ul>'),
(897304, 'Second Whois', 'Second Whois, INC.<ul class=\"whois\"><li><a href=\"internet?ip=225.13.8.9\"><span class=\"item\">225.13.8.9</span> - <span class=\"whois-member\">HEBC</span></a></li><li><a href=\"internet?ip=163.93.224.115\"><span class=\"item\">163.93.224.115</span> - <span class=\"whois-member\">Lorem Ipsum</span></a></li><li><a href=\"internet?ip=49.215.104.113\"><span class=\"item\">49.215.104.113</span> - <span class=\"whois-member\">American Expense</span></a></li><li><a href=\"internet?ip=134.220.237.135\"><span class=\"item\">134.220.237.135</span> - <span class=\"whois-member\">Hangman</span></a></li><li><a href=\"internet?ip=138.142.116.250\"><span class=\"item\">138.142.116.250</span> - <span class=\"whois-member\">Too Many Secrets</span></a></li><li><a href=\"internet?ip=57.188.239.204\"><span class=\"item\">57.188.239.204</span> - <span class=\"whois-member\">Hacker Inside</span></a></li><li><a href=\"internet?ip=68.164.173.152\"><span class=\"item\">68.164.173.152</span> - <span class=\"whois-member\">Life\'s Though</span></a></li><li><a href=\"internet?ip=165.11.199.185\"><span class=\"item\">165.11.199.185</span> - <span class=\"whois-member\">McDiabetes</span></a></li></ul>'),
(897305, 'Fourth Whois', 'Fourth Whois<ul class=\"whois\"><li><a href=\"internet?ip=11.9.29.218\"><span class=\"item\">11.9.29.218</span> - <span class=\"whois-member\">Ultimate Bank</span></a></li><li><a href=\"internet?ip=91.141.73.158\"><span class=\"item\">91.141.73.158</span> - <span class=\"whois-member\">Fsck You</span></a></li><li><a href=\"internet?ip=112.182.93.189\"><span class=\"item\">112.182.93.189</span> - <span class=\"whois-member\">Geek Pride Labs</span></a></li><li><a href=\"internet?ip=112.46.43.81\"><span class=\"item\">112.46.43.81</span> - <span class=\"whois-member\">Numataka Corp</span></a></li><li><a href=\"internet?ip=125.156.96.156\"><span class=\"item\">125.156.96.156</span> - <span class=\"whois-member\">NSA</span></a></li></ul>'),
(897306, 'NSA', '<div class=\"center\"><img src=\"img/nsa.png\"></div>'),
(897307, 'PUZZLE2', ''),
(897308, 'PUZZLE1', ''),
(897309, 'PUZZLE2', ''),
(897310, 'PUZZLE1', ''),
(897311, 'PUZZLE2', ''),
(897312, 'PUZZLE1', ''),
(897313, 'PUZZLE2', ''),
(897314, 'PUZZLE1', ''),
(897315, 'Hangman', '<style>\n#Hangman {border:1px #000000 solid;height:120px}\n</style>\n<div style=\"width:350px;position:relative;padding:4px\">\n<div style=\"font:bold 12pt \'\';color:#000000\">Hangman</div>\n<iframe id=\"Hangman\" src=\"http://www.thefreedictionary.com/_/WoD/hangman.aspx?#,x000000,x0000FF,10pt,\'\'\" width=\"100%\" scrolling=\"no\" frameborder=\"0\"></iframe>\n<div style=\"font:normal 8pt \'\';color:#000000\">\n<a style=\"color:#000000\" href=\"http://www.thefreedictionary.com/lookup.htm#Hangman\" rel=\"nofollow\">Hangman</a>\nprovided by <a style=\"color:#000000\" href=\"http://www.thefreedictionary.com/\">TheFreeDictionary</a>\n</div></div>'),
(897316, 'PUZZLE1', ''),
(897317, 'PUZZLE2', ''),
(897318, 'Fsck You', '<div class=\"center\"><img src=\"images/npc/linustorvalds.jpg\" alt=\"\"></div>'),
(897319, 'PUZZLE2', ''),
(897320, 'PUZZLE1', ''),
(897321, 'Gnirut', '<div class=\"center\"><img src=\"images/npc/alanturing.jpg\" alt=\"\"></div>'),
(897322, 'PUZZLE1', ''),
(897323, 'PUZZLE2', ''),
(897324, 'PUZZLE1', ''),
(897325, 'First Puzzle', 'Welcome to the First Puzzle. Follow the trail to get better softwares.<br/><br/>The First Puzzle is easy, but can you solve the next ones? Good luck :)'),
(897326, '3', '<div class=\"center\"><img src=\"images/npc/yuhack.jpg\" alt=\"\"></div>'),
(897327, '2', ''),
(897328, 'Hacker News', '<iframe src=\"http://ihackernews.com/\" width=\"100%\" height=\"500\" seamless></iframe><br/><br/> Disclaimer: (<a href=\"http://ihackernews.com/\">i</a>)<a href=\"https://news.ycombinator.com/\">HackerNews</a> is not related to Hacker Experience in any way.'),
(897329, '4', ''),
(897330, '7', ''),
(897331, '6', ''),
(897332, 'PUZZLE1', ''),
(897333, '8', '<iframe id=\"jodiframe\" src=\"http://wwwwwwwww.jodi.org/\" width=\"100%\" height=\"500px\" seamless=\"1\"></iframe>'),
(897334, 'PUZZLE1', ''),
(897335, 'PUZZLE2', ''),
(897336, 'Too Many Secrets', '<div class=\"center\"><img src=\"images/npc/toomanysecrets.JPG\" alt=\"\"></div>'),
(897337, 'PUZZLE2', ''),
(897338, 'PUZZLE1', ''),
(897339, 'PUZZLE2', ''),
(897340, 'Lorem Ipsum', '\n\n                                    <p style=\"max-width:600px; margin-left: 30px;\">\n    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam euismod luctus lorem eu bibendum. Suspendisse eget nisl \nvulputate, viverra orci at, malesuada neque. Sed scelerisque enim ac sem blandit sodales. Aenean et posuere tortor. \nNullam at mollis risus. Vivamus rhoncus pretium neque eu convallis. Nullam rhoncus gravida purus, non gravida tortor \nmolestie in. Proin ultricies semper eros, sit amet ornare lacus congue et.<br/><br/>\n Vivamus dapibus diam ut libero consectetur semper. Fusce pellentesque arcu nec iaculis suscipit. Sed eget nisi eget mauris sodales cursus sed non magna. Fusce porta nibh id lectus venenatis, id tempus felis lobortis. Quisque vel eleifend diam. Sed consequat feugiat nisl quis tempor. Nulla in orci at magna tempus euismod non id nunc. Maecenas vel malesuada nisi. Donec sed lacus eleifend, sollicitudin ipsum eu, vulputate libero. Donec bibendum tellus non faucibus sagittis. Mauris tincidunt vulputate mattis. \n <br/><br/>\n  In vel neque non felis convallis euismod non quis est. Quisque velit velit, posuere in turpis vel, varius sollicitudin nibh. Morbi ultrices hackris expiriencis amet nunc viverra varius. Donec ut quam libero. Etiam facilisis enim eu massa faucibus ullamcorper. Donec sollicitudin erat et porttitor porta. Integer sit amet viverra nisi. Integer vitae augue vestibulum, elementum justo in, luctus orci. Integer sit amet turpis luctus, commodo massa eu, malesuada quam. Donec feugiat, tortor in molestie ornare, mi mi viverra mauris, id pharetra purus augue ac sem. \n                                    </p>'),
(897341, 'PUZZLE2', ''),
(897342, 'PUZZLE1', ''),
(897343, 'PUZZLE2', ''),
(897344, 'PUZZLE1', ''),
(897345, 'PUZZLE2', ''),
(897346, 'PUZZLE1', ''),
(897347, 'PUZZLE2', ''),
(897348, 'PUZZLE1', ''),
(897349, 'PUZZLE2', ''),
(897350, 'Eduard Khil', '<div class=\"center\"><img src=\"images/npc/eduardkhil.jpg\" alt=\"\"></div>'),
(897351, 'PUZZLE2', ''),
(897352, 'PUZZLE1', ''),
(897353, 'PUZZLE2', ''),
(897354, 'ISP - Internet Service Provider', ''),
(897355, 'Bitcoin Market', '<span id=\"btc\"></span>'),
(897356, 'NPC1', ''),
(897357, 'NPC3', ''),
(897358, 'NPC2', ''),
(897359, 'Download Center', 'Welcome to the download center! <br/><br/> Download whatever you need. Unlimited bandwidth! <br/><br/> <strong>Username:</strong> download<br/><strong>Password:</strong> download'),
(897360, 'Numataka Corp', ''),
(897361, 'Safenet', ''),
(897362, 'FBI', ''),
(897363, 'Torrent Market', ''),
(897364, 'First International Bank', 'Welcome to the <strong>First International Bank</strong>.<br/><br/>We have a very modest defense, but at least you didn\'t have to pay for an account.<br/><br/><a href=\"internet?action=login&type=bank\">Login to your account</a>.'),
(897365, 'American Expense', '<div class=\"center\">Welcome to <strong>American Expense</strong>.<br/><a href=\"internet?action=login&type=bank\">Login</a><br/><br/><img src=\"images/npc/american-expense.jpg\"></div>'),
(897366, 'HEBC', '<div class=\"center\">Welcome to <strong>HEBC</strong>.<br/><a href=\"internet?action=login&type=bank\">Login</a><br/><br/><img src=\"images/npc/hebc.jpg\"></div>'),
(897367, 'Ultimate Bank', 'Welcome to the <strong>Ultimate Bank</strong>.<br/><br/>Safety matters! You won\'t find a safer bank.<br/><br/><a href=\"internet?action=login&type=bank\">Login now</a>'),
(897368, 'Swiss International Bank', '<div class=\"center\">Welcome to <strong>Swiss International Bank</strong>.<br/><a href=\"internet?action=login&type=bank\">Offshore account login</a><br/><br/><img src=\"images/npc/swiss.svg\"></div>'),
(897369, 'McDiabetes', '<div class=\"center\"><img alt=\"McDiabetes\" title=\"McDiabetes\" src=\"images/npc/mcdiabetes.jpg\"><br/><br/></div>'),
(897370, 'uPay', '<div class=\"center\"><img alt=\"uPay\" title=\"uPay\" src=\"images/npc/upay.jpg\"><br/><br/></div>'),
(897371, 'Capitalism', '<div class=\"center\"><img alt=\"Capitalism\" title=\"Capitalism\" src=\"images/npc/capitalism.png\"><br/><br/></div>'),
(897372, 'Gimme Your Bucks', '<div class=\"center\"><img alt=\"Gimme your bucks\" title=\"Gimme your bucks\" src=\"images/npc/gimmeyourbucks.jpeg\"><br/><br/></div>'),
(897373, 'Very Cheesy Pictures', '<div class=\"center\"><img alt=\"Very Cheesy Pictures\" title=\"Very Cheesy Pictures\" src=\"images/npc/verycheesypictures.jpg\"><br/><br/></div>'),
(897374, 'Fiasco Systems', '<div class=\"center\"><img alt=\"Fiasco\" title=\"Fiasco\" src=\"images/npc/fiasco.jpg\"><br/><br/></div>'),
(897375, 'elgooG', '<div class=\"center\"><img alt=\"elgooG\" title=\"elgooG\" src=\"images/npc/elgoog.png\"><br/><strong>Don\'t be evil.</strong><br/><span class=\"small\">unless it is profitable.</span></div>'),
(897376, 'Microlost', '<div class=\"center\"><img alt=\"Microlost\" title=\"Microlost\" src=\"images/npc/microlost.jpg\"><br/><br/>Will work for a while.</div>'),
(897377, 'Murder King', '<div class=\"center\"><img alt=\"Murder King\" title=\"Murder King\" src=\"images/npc/murderking.jpg\"><br/><br/><span class=\"small\">You\'ll get it our way.</span></div>'),
(897378, 'Hell Computers', '<div class=\"center\"><img alt=\"Hell Computers\" title=\"Hell Computers\" src=\"images/npc/hell.jpg\"><br/><br/></div>'),
(897379, 'Pineapple', '<div class=\"center\"><img alt=\"Pineapple\" title=\"Pineapple\" src=\"images/npc/pineapple.png\"><br/><br/>Appearence Costs <sup>&reg;</sup></div>'),
(897380, 'Stalker', '<div class=\"center\"><img alt=\"Stalker\" title=\"Stalker\" src=\"images/npc/stalker.jpg\"><br/><br/><span class=\"small\">Wasting peoples lives since 2004.</span></div>'),
(897381, 'WTF', '<div class=\"center\"><img alt=\"WTF\" title=\"WTF\" src=\"images/npc/wtf.jpg\"><br/><br/></div>'),
(897382, 'Noplace', '<div class=\"center\"><img alt=\"Noplace\" title=\"Noplace\" src=\"images/npc/noplace.jpg\"><br/><br/></div>'),
(897383, 'GayPal', '<div class=\"center\"><img alt=\"Gaypal\" title=\"Gaypal\" src=\"images/npc/gaypal.jpg\"><br/><br/></div>'),
(897384, 'Broke', '<div class=\"center\"><img alt=\"Broke\" title=\"Broke\" src=\"images/npc/broke.gif\"><br/><br/></div>'),
(897385, 'Hacker Inside', '<div class=\"center\"><img alt=\"Hacker Inside\" title=\"Hacker Inside\" src=\"images/npc/hackerinside.svg\"><br/><br/><span class=\"small\">Lammer outside</span></div>'),
(897386, 'Nokids', '<div class=\"center\"><img alt=\"Nokids\" title=\"Nokids\" src=\"images/npc/nokids.jpg\"><br/><br/></div>'),
(897387, 'CatVideos', '<div class=\"center\"><img alt=\"catVideos\" title=\"catVideos\" src=\"images/npc/catvideos.jpg\"><br/><br/><span class=\"small\">Don\'t read the comments.</span></div>'),
(897388, 'Titanic', '<div class=\"center\"><img alt=\"Titanic\" title=\"Titanic\" src=\"images/npc/titanic.jpg\"><br/><br/></div>'),
(897389, 'Life\'s Though', '<div class=\"center\"><img alt=\"Life\'s tough\" title=\"Life\'s tough\" src=\"images/npc/lifestough.jpg\"><br/><br/></div>'),
(897390, 'Fail', '<div class=\"center\"><img alt=\"Fail\" title=\"Fail\" src=\"images/npc/fail.jpg\"><br/><br/></div>'),
(897391, 'Oh Deere', '<div class=\"center\"><img alt=\"Oh Deere\" title=\"Oh Deere\" src=\"images/npc/ohdeere.JPG\"><br/><br/></div>'),
(897392, 'Elvi\'s', '<div class=\"center\"><img alt=\"Elvi\'s\" title=\"Elvi\'s\" src=\"images/npc/elvis.jpg\"><br/><br/></div>'),
(897393, 'Insane', '<div class=\"center\"><img alt=\"Insane\" title=\"Insane\" src=\"/images/npc/insane.JPG\"><br/><br/></div>'),
(897394, 'Abersnobby & Bitch', '<div class=\"center\"><img alt=\"Abersnobby & Bitch\" title=\"Abersnobby & Bitch\" src=\"images/npc/abersnobby.jpg\"><br/><br/></div>'),
(897395, 'Sexsi', '<div class=\"center\"><img alt=\"Sexsi\" title=\"Sexsi\" src=\"images/npc/sexsi.jpg\"><br/><br/><span class=\"small\">When there is no coke.</span></div>'),
(897396, 'Oops', '<div class=\"center\"><img alt=\"Oops\" title=\"Oops\" src=\"images/npc/oops.jpg\"><br/><br/><span class=\"small\">Consider it gone.</span></div>'),
(897397, 'Nothing to do', '<div class=\"center\"><img alt=\"Nothing to do\" title=\"Nothing to do\" src=\"images/npc/nothingtodo.jpg\"><br/><br/></div>'),
(897398, 'Toshibe', '<div class=\"center\"><img alt=\"Toshibe\" title=\"Toshibe\" src=\"images/npc/toshibe.png\"><br/><br/></div>'),
(897399, 'Sunk Microsystems', '<div class=\"center\"><img alt=\"Sunk\" title=\"Sunk\" src=\"images/npc/sunk.jpg\"><br/><br/></div>'),
(897400, 'Nuke', '<div class=\"center\"><img alt=\"Nuke\" title=\"Nuke\" src=\"images/npc/nuke.png\" style=\"background-color: #000;\"><br/><br/></div>'),
(897401, 'Weird', '<div class=\"center\"><img alt=\"Weird\" title=\"Weird\" src=\"images/npc/weird.gif\"><br/><br/></div>'),
(897402, 'Yahoo?', '<div class=\"center\"><img alt=\"Yahoo?\" title=\"Yahoo?\" src=\"images/npc/yahoo.jpg\"><br/><br/></div>'),
(897403, 'Pervert', '<div class=\"center\"><img alt=\"Pervert\" title=\"Pervert\" src=\"images/npc/pervert.jpg\"><br/><br/></div>'),
(897404, 'Initech Corp', ''),
(897405, 'Initech Corp', ''),
(897406, 'Initech Corp', ''),
(897407, 'Initech Corp', ''),
(897408, 'Initech Corp', ''),
(897409, 'Initech Corp', ''),
(897410, 'Initech Corp', ''),
(897411, 'Initech Corp', ''),
(897412, 'Initech Corp', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npc_info_pt`
--

CREATE TABLE `npc_info_pt` (
  `npcID` int(5) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `web` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `npc_info_pt`
--

INSERT INTO `npc_info_pt` (`npcID`, `name`, `web`) VALUES
(897301, 'Geek Pride Labs', ''),
(897302, 'Primeiro Whois', 'Bem-vindo ao primeiro whois!<ul class=\"whois\"><li><a href=\"internet?ip=175.227.57.107\"><span \nclass=\"item\">175.227.57.107</span> - <span \nclass=\"whois-member\">Centro de Downloads</span></a></li><li><a href=\"internet?ip=235.243.83.68\"><span \nclass=\"item\">235.243.83.68</span> - <span \nclass=\"whois-member\">Mercado de Torrents</span></a></li><li><a href=\"internet?ip=18.33.93.134\"><span \nclass=\"item\">18.33.93.134</span> - <span \nclass=\"whois-member\">Primeiro Enigma</span></a></li><li><a href=\"internet?ip=37.161.71.251\"><span class=\"item\">37.161.71.251</span> - <span class=\"whois-member\">Primeiro Banco Internacional</span></a></li><li><a href=\"internet?ip=101.49.87.7\"><span class=\"item\">101.49.87.7</span> - <span class=\"whois-member\">elgooG</span></a></li><li><a href=\"internet?ip=111.52.17.215\"><span class=\"item\">111.52.17.215</span> - <span class=\"whois-member\">Murder King</span></a></li><li><a href=\"internet?ip=213.94.30.206\"><span class=\"item\">213.94.30.206</span> - <span class=\"whois-member\">Pineapple</span></a></li></ul>Trending Sites:<ul class=\"whois\"><li><a href=\"internet?ip=111.192.88.228\"><span class=\"item\">111.192.88.228</span> - <span class=\"whois-member\">ISP - Provedor de ServiÃ§os</span></a></li><li><a href=\"internet?ip=125.156.96.156\"><span class=\"item\">125.156.96.156</span> - <span class=\"whois-member\">NSA</span></a></li><li><a href=\"internet?ip=152.251.142.83\"><span \nclass=\"item\">152.251.142.83</span> - <span \nclass=\"whois-member\">Hacker News</span></a></li></ul>'),
(897303, 'Terceiro Whois', 'Terceiro Whois<ul class=\"whois\"><li><a href=\"internet?ip=251.251.187.76\"><span class=\"item\">251.251.187.76</span> - <span class=\"whois-member\">Banco SuÃ­Ã§o Internacional</span></a></li><li><a href=\"internet?ip=93.25.121.50\"><span class=\"item\">93.25.121.50</span> - <span class=\"whois-member\">Eduard Khil</span></a></li><li><a href=\"internet?ip=183.10.134.125\"><span class=\"item\">183.10.134.125</span> - <span class=\"whois-member\">Gnirut</span></a></li><li><a href=\"internet?ip=187.232.183.123\"><span class=\"item\">187.232.183.123</span> - <span class=\"whois-member\">Weird</span></a></li><li><a href=\"internet?ip=135.173.129.12\"><span class=\"item\">135.173.129.12</span> - <span class=\"whois-member\">Yahoo?</span></a></li><li><a href=\"internet?ip=85.79.58.200\"><span class=\"item\">85.79.58.200</span> - <span class=\"whois-member\">Mercado Bitcoin</span></a></li><li><a href=\"internet?ip=51.50.82.178\"><span class=\"item\">51.50.82.178</span> - <span class=\"whois-member\">FBI</span></a></li></ul>'),
(897304, 'Segundo Whois', 'Second Whois, LTDA.<ul class=\"whois\"><li><a href=\"internet?ip=225.13.8.9\"><span class=\"item\">225.13.8.9</span> - <span class=\"whois-member\">HEBC</span></a></li><li><a href=\"internet?ip=163.93.224.115\"><span class=\"item\">163.93.224.115</span> - <span class=\"whois-member\">Lorem Ipsum</span></a></li><li><a href=\"internet?ip=49.215.104.113\"><span class=\"item\">49.215.104.113</span> - <span class=\"whois-member\">American Expense</span></a></li><li><a href=\"internet?ip=134.220.237.135\"><span class=\"item\">134.220.237.135</span> - <span class=\"whois-member\">Forca</span></a></li><li><a href=\"internet?ip=138.142.116.250\"><span class=\"item\">138.142.116.250</span> - <span class=\"whois-member\">Too Many Secrets</span></a></li><li><a href=\"internet?ip=57.188.239.204\"><span class=\"item\">57.188.239.204</span> - <span class=\"whois-member\">Hacker Inside</span></a></li><li><a href=\"internet?ip=68.164.173.152\"><span class=\"item\">68.164.173.152</span> - <span class=\"whois-member\">Life\'s Though</span></a></li><li><a href=\"internet?ip=165.11.199.185\"><span class=\"item\">165.11.199.185</span> - <span class=\"whois-member\">McDiabetes</span></a></li></ul>'),
(897305, 'Quarto Whois', 'Quarto Whois<ul class=\"whois\"><li><a href=\"internet?ip=11.9.29.218\"><span class=\"item\">11.9.29.218</span> - <span class=\"whois-member\">Banco Ultimate</span></a></li><li><a href=\"internet?ip=91.141.73.158\"><span class=\"item\">91.141.73.158</span> - <span class=\"whois-member\">Fsck You</span></a></li><li><a href=\"internet?ip=112.182.93.189\"><span class=\"item\">112.182.93.189</span> - <span class=\"whois-member\">Geek Pride Labs</span></a></li><li><a href=\"internet?ip=112.46.43.81\"><span class=\"item\">112.46.43.81</span> - <span class=\"whois-member\">Numataka Corp</span></a></li><li><a href=\"internet?ip=125.156.96.156\"><span class=\"item\">125.156.96.156</span> - <span class=\"whois-member\">NSA</span></a></li></ul>'),
(897306, 'NSA', '<div class=\"center\"><img src=\"img/nsa.png\"></div>'),
(897307, 'PUZZLE2', ''),
(897308, 'PUZZLE1', ''),
(897309, 'PUZZLE2', ''),
(897310, 'PUZZLE1', ''),
(897311, 'PUZZLE2', ''),
(897312, 'PUZZLE1', ''),
(897313, 'PUZZLE2', ''),
(897314, 'PUZZLE1', ''),
(897315, 'Forca', '<style>#Hangman {border:1px #000000 solid;background-color:;height:120px}</style>\n<div style=\"width:350px;position:relative;background-color:;padding:4px\">\n<div style=\"font:bold 12pt Arial;color:#000000\">Forca</div>\n<iframe id=\"Hangman\" src=\"http://pt.thefreedictionary.com/_/WoD/hangman.aspx?lang=pt#,x000000,x0000FF,10pt,Arial\" width=\"100%\" scrolling=\"no\" frameborder=\"0\"></iframe>\n<div style=\"font:normal 8pt Arial;color:#000000\">\n<a style=\"color:#000000\" href=\"http://pt.thefreedictionary.com/webmasters.htm\">Forca</a>\n fornecido por <a style=\"color:#000000\" href=\"http://pt.thefreedictionary.com/\">The Free Dictionary</a>\n</div></div>'),
(897316, 'PUZZLE1', ''),
(897317, 'PUZZLE2', ''),
(897318, 'Fsck You', '<div class=\"center\"><img src=\"images/npc/linustorvalds.jpg\" alt=\"\"></div>'),
(897319, 'PUZZLE2', ''),
(897320, 'PUZZLE1', ''),
(897321, 'Gnirut', '<div class=\"center\"><img src=\"images/npc/alanturing.jpg\" alt=\"\"></div>'),
(897322, 'PUZZLE1', ''),
(897323, 'PUZZLE2', ''),
(897324, 'PUZZLE1', ''),
(897325, 'Primeiro Enigma', 'Bem-vindo ao primeiro enigma. Siga a trilha para conseguir melhores softwares.<br/><br/>O primeiro enigma Ã© fÃ¡cil, mas serÃ¡ que vocÃª consegue resolver os prÃ³ximos? Boa sorte :)'),
(897326, '3', '<div class=\"center\"><img src=\"images/npc/yuhack.jpg\" alt=\"\"></div>'),
(897327, '2', ''),
(897328, 'Hacker News', '<iframe src=\"http://ihackernews.com/\" width=\"100%\" height=\"500\" seamless></iframe><br/><br/> Aviso: (<a href=\"http://ihackernews.com/\">i</a>)<a href=\"https://news.ycombinator.com/\">HackerNews</a> nÃ£o tem nenhuma relaÃ§Ã£o com Hacker Experience.'),
(897329, '4', ''),
(897330, '7', ''),
(897331, '6', ''),
(897332, 'PUZZLE1', ''),
(897333, '8', '<iframe id=\"jodiframe\" src=\"http://wwwwwwwww.jodi.org/\" width=\"100%\" height=\"500px\" seamless=\"1\"></iframe>'),
(897334, 'PUZZLE1', ''),
(897335, 'PUZZLE2', ''),
(897336, 'Too Many Secrets', '<div class=\"center\"><img src=\"images/npc/toomanysecrets.JPG\" alt=\"\"></div>'),
(897337, 'PUZZLE2', ''),
(897338, 'PUZZLE1', ''),
(897339, 'PUZZLE2', ''),
(897340, 'Lorem Ipsum', '\n\n                                    <p style=\"max-width:600px; \nmargin-left: 30px;\">\n    Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Nam euismod luctus lorem eu bibendum. Suspendisse eget \nnisl \nvulputate, viverra orci at, malesuada neque. Sed scelerisque enim\n ac sem blandit sodales. Aenean et posuere tortor. \nNullam at mollis \nrisus. Vivamus rhoncus pretium neque eu convallis. Nullam rhoncus \ngravida purus, non gravida tortor \nmolestie in. Proin ultricies semper \neros, sit amet ornare lacus congue et.<br/><br/>\n Vivamus \ndapibus diam ut libero consectetur semper. Fusce pellentesque arcu nec \niaculis suscipit. Sed eget nisi eget mauris sodales cursus sed non \nmagna. Fusce porta nibh id lectus venenatis, id tempus felis lobortis. \nQuisque vel eleifend diam. Sed consequat feugiat nisl quis tempor. Nulla\n in orci at magna tempus euismod non id nunc. Maecenas vel malesuada \nnisi. Donec sed lacus eleifend, sollicitudin ipsum eu, vulputate libero.\n Donec bibendum tellus non faucibus sagittis. Mauris tincidunt vulputate\n mattis. \n <br/><br/>\n  In vel neque non felis convallis \neuismod non quis est. Quisque velit velit, posuere in turpis vel, varius\n sollicitudin nibh. Morbi ultrices hackris expiriencis amet nunc viverra\n varius. Donec ut quam libero. Etiam facilisis enim eu massa faucibus \nullamcorper. Donec sollicitudin erat et porttitor porta. Integer sit \namet viverra nisi. Integer vitae augue vestibulum, elementum justo in, \nluctus orci. Integer sit amet turpis luctus, commodo massa eu, malesuada\n quam. Donec feugiat, tortor in molestie ornare, mi mi viverra mauris, \nid pharetra purus augue ac sem. \n                                   \n </p>'),
(897341, 'PUZZLE2', ''),
(897342, 'PUZZLE1', ''),
(897343, 'PUZZLE2', ''),
(897344, 'PUZZLE1', ''),
(897345, 'PUZZLE2', ''),
(897346, 'PUZZLE1', ''),
(897347, 'PUZZLE2', ''),
(897348, 'PUZZLE1', ''),
(897349, 'PUZZLE2', ''),
(897350, 'Eduard Khil', '<div class=\"center\"><img src=\"images/npc/eduardkhil.jpg\" alt=\"\"></div>'),
(897351, 'PUZZLE2', ''),
(897352, 'PUZZLE1', ''),
(897353, 'PUZZLE2', ''),
(897354, 'ISP - Provedor de ServiÃ§os', ''),
(897355, 'Mercado Bitcoin', '<span id=\"btc\"></span>'),
(897356, 'NPC1', ''),
(897357, 'NPC3', ''),
(897358, 'NPC2', ''),
(897359, 'Centro de Downloads', 'Bem-vindo ao centro de downloads! <br/><br/> FaÃ§a download do que vocÃª precisar. TransferÃªncia ilimitada!<br/><br/> <strong>UsuÃ¡rio:</strong> download<br/><strong>Senha:</strong> download'),
(897360, 'Numataka Corp', ''),
(897361, 'Safenet', ''),
(897362, 'FBI', ''),
(897363, 'Mercado de Torrents', ''),
(897364, 'Primeiro Banco Internacional', 'Bem-vindo ao <strong>Primeiro Banco Internacional</strong>.<br/><br/>NÃ³s temos uma proteÃ§Ã£o muito modesta, mas pelo menos vocÃª nÃ£o teve que pagar por sua conta.<br/><br/><a href=\"internet?action=login&type=bank\">Login to your account</a>.'),
(897365, 'American Expense', '<div class=\"center\">Bem-vindo ao <strong>American Expense</strong>.<br/><a href=\"internet?action=login&type=bank\">Entrar</a><br/><br/><img src=\"images/npc/american-expense.jpg\"></div>'),
(897366, 'HEBC', '<div class=\"center\">Bem-vindo ao <strong>HEBC</strong>.<br/><a href=\"internet?action=login&type=bank\">Entrar</a><br/><br/><img src=\"images/npc/hebc.jpg\"></div>'),
(897367, 'Banco Ultimate', 'Bem-vindo ao <strong>Banco Ultimate/strong>.<br/><br/>SeguranÃ§a importa! VocÃª nÃ£o vai encontrar um banco mais seguro.<br/><br/><a href=\"internet?action=login&type=bank\">Entrar</a>'),
(897368, 'Banco SuÃ­Ã§o Internacional', '<div class=\"center\">Bem-vindo ao <strong>Banco SuÃ­Ã§o Internacional</strong>.<br/><a href=\"internet?action=login&type=bank\">Entrar na sua conta</a><br/><br/><img src=\"images/npc/swiss.svg\"></div>'),
(897369, 'McDiabetes', '<div class=\"center\"><img alt=\"McDiabetes\" title=\"McDiabetes\" src=\"images/npc/mcdiabetes.jpg\"><br/><br/></div>'),
(897370, 'uPay', '<div class=\"center\"><img alt=\"uPay\" title=\"uPay\" src=\"images/npc/upay.jpg\"><br/><br/></div>'),
(897371, 'Capitalism', '<div class=\"center\"><img alt=\"Capitalism\" title=\"Capitalism\" src=\"images/npc/capitalism.png\"><br/><br/></div>'),
(897372, 'Gimme Your Bucks', '<div class=\"center\"><img alt=\"Gimme your bucks\" title=\"Gimme your bucks\" src=\"images/npc/gimmeyourbucks.jpeg\"><br/><br/></div>'),
(897373, 'Very Cheesy Pictures', '<div class=\"center\"><img alt=\"Very Cheesy Pictures\" title=\"Very Cheesy Pictures\" src=\"images/npc/verycheesypictures.jpg\"><br/><br/></div>'),
(897374, 'Fiasco Systems', '<div class=\"center\"><img alt=\"Fiasco\" title=\"Fiasco\" src=\"images/npc/fiasco.jpg\"><br/><br/></div>'),
(897375, 'elgooG', '<div class=\"center\"><img alt=\"elgooG\" title=\"elgooG\" src=\"images/npc/elgoog.png\"><br/><strong>Don\'t be evil.</strong><br/><span class=\"small\">a menos que compense.</span></div>'),
(897376, 'Microlost', '<div class=\"center\"><img alt=\"Microlost\" title=\"Microlost\" src=\"images/npc/microlost.jpg\"><br/><br/>Vai funcionar por um tempo.</div>'),
(897377, 'Murder King', '<div class=\"center\"><img alt=\"Murder King\" title=\"Murder King\" src=\"images/npc/murderking.jpg\"><br/><br/><span class=\"small\">You\'ll get it our way.</span></div>'),
(897378, 'Computadores Hell', '<div class=\"center\"><img alt=\"Hell Computers\" title=\"Hell Computers\" src=\"images/npc/hell.jpg\"><br/><br/></div>'),
(897379, 'Pineapple', '<div class=\"center\"><img alt=\"Pineapple\" title=\"Pineapple\" src=\"images/npc/pineapple.png\"><br/><br/>AparÃªncia Custa <sup>&reg;</sup></div>'),
(897380, 'Stalker', '<div class=\"center\"><img alt=\"Stalker\" title=\"Stalker\" src=\"images/npc/stalker.jpg\"><br/><br/><span class=\"small\">DesperdiÃ§ando a vida das pessoas desde 2004.</span></div>'),
(897381, 'WTF', '<div class=\"center\"><img alt=\"WTF\" title=\"WTF\" src=\"images/npc/wtf.jpg\"><br/><br/></div>'),
(897382, 'Noplace', '<div class=\"center\"><img alt=\"Noplace\" title=\"Noplace\" src=\"images/npc/noplace.jpg\"><br/><br/></div>'),
(897383, 'GayPal', '<div class=\"center\"><img alt=\"Gaypal\" title=\"Gaypal\" src=\"images/npc/gaypal.jpg\"><br/><br/></div>'),
(897384, 'Broke', '<div class=\"center\"><img alt=\"Broke\" title=\"Broke\" src=\"images/npc/broke.gif\"><br/><br/></div>'),
(897385, 'Hacker Inside', '<div class=\"center\"><img alt=\"Hacker Inside\" title=\"Hacker Inside\" src=\"images/npc/hackerinside.svg\"><br/><br/><span class=\"small\">Lammer outside</span></div>'),
(897386, 'Nokids', '<div class=\"center\"><img alt=\"Nokids\" title=\"Nokids\" src=\"images/npc/nokids.jpg\"><br/><br/></div>'),
(897387, 'CatVIdeos', '<div class=\"center\"><img alt=\"catVideos\" title=\"catVideos\" src=\"images/npc/catvideos.jpg\"><br/><br/><span class=\"small\">NÃ£o leia os comentÃ¡rios.</span></div>'),
(897388, 'Titanic', '<div class=\"center\"><img alt=\"Titanic\" title=\"Titanic\" src=\"images/npc/titanic.jpg\"><br/><br/></div>'),
(897389, 'Life\'s Though', '<div class=\"center\"><img alt=\"Life\'s tough\" title=\"Life\'s tough\" src=\"images/npc/lifestough.jpg\"><br/><br/></div>'),
(897390, 'Fail', '<div class=\"center\"><img alt=\"Fail\" title=\"Fail\" src=\"images/npc/fail.jpg\"><br/><br/></div>'),
(897391, 'Oh Deere', '<div class=\"center\"><img alt=\"Oh Deere\" title=\"Oh Deere\" src=\"images/npc/ohdeere.JPG\"><br/><br/></div>'),
(897392, 'Elvi\'s', '<div class=\"center\"><img alt=\"Elvi\'s\" title=\"Elvi\'s\" src=\"images/npc/elvis.jpg\"><br/><br/></div>'),
(897393, 'Insane', '<div class=\"center\"><img alt=\"Insane\" title=\"Insane\" src=\"/images/npc/insane.JPG\"><br/><br/></div>'),
(897394, 'Abersnobby & Bitch', '<div class=\"center\"><img alt=\"Abersnobby & Bitch\" title=\"Abersnobby & Bitch\" src=\"images/npc/abersnobby.jpg\"><br/><br/></div>'),
(897395, 'Sexsi', '<div class=\"center\"><img alt=\"Sexsi\" title=\"Sexsi\" src=\"images/npc/sexsi.jpg\"><br/><br/><span class=\"small\">Pode ser?</span></div>'),
(897396, 'Oops', '<div class=\"center\"><img alt=\"Oops\" title=\"Oops\" src=\"images/npc/oops.jpg\"><br/><br/><span class=\"small\">Consider it gone.</span></div>'),
(897397, 'Nothing to do', '<div class=\"center\"><img alt=\"Nothing to do\" title=\"Nothing to do\" src=\"images/npc/nothingtodo.jpg\"><br/><br/></div>'),
(897398, 'Toshibe', '<div class=\"center\"><img alt=\"Toshibe\" title=\"Toshibe\" src=\"images/npc/toshibe.png\"><br/><br/></div>'),
(897399, 'Sunk Microsystems', '<div class=\"center\"><img alt=\"Sunk\" title=\"Sunk\" src=\"images/npc/sunk.jpg\"><br/><br/></div>'),
(897400, 'Nuke', '<div class=\"center\"><img alt=\"Nuke\" title=\"Nuke\" src=\"images/npc/nuke.png\" style=\"background-color: #000;\"><br/><br/></div>'),
(897401, 'Weird', '<div class=\"center\"><img alt=\"Weird\" title=\"Weird\" src=\"images/npc/weird.gif\"><br/><br/></div>'),
(897402, 'Yahoo?', '<div class=\"center\"><img alt=\"Yahoo?\" title=\"Yahoo?\" src=\"images/npc/yahoo.jpg\"><br/><br/></div>'),
(897403, 'Pervert', '<div class=\"center\"><img alt=\"Pervert\" title=\"Pervert\" src=\"images/npc/pervert.jpg\"><br/><br/></div>'),
(897404, 'Initech Corp', ''),
(897405, 'Initech Corp', ''),
(897406, 'Initech Corp', ''),
(897407, 'Initech Corp', ''),
(897408, 'Initech Corp', ''),
(897409, 'Initech Corp', ''),
(897410, 'Initech Corp', ''),
(897411, 'Initech Corp', ''),
(897412, 'Initech Corp', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npc_key`
--

CREATE TABLE `npc_key` (
  `npcID` int(5) UNSIGNED NOT NULL,
  `key` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `npc_key`
--

INSERT INTO `npc_key` (`npcID`, `key`) VALUES
(897364, 'BANK/1'),
(897366, 'BANK/2'),
(897365, 'BANK/3'),
(897368, 'BANK/4'),
(897367, 'BANK/5'),
(897355, 'BITCOIN'),
(897359, 'DC'),
(897360, 'EVILCORP'),
(897362, 'FBI'),
(897375, 'HIRER/LEVEL1/1'),
(897370, 'HIRER/LEVEL1/10'),
(897369, 'HIRER/LEVEL1/11'),
(897372, 'HIRER/LEVEL1/12'),
(897371, 'HIRER/LEVEL1/13'),
(897374, 'HIRER/LEVEL1/14'),
(897373, 'HIRER/LEVEL1/15'),
(897377, 'HIRER/LEVEL1/2'),
(897376, 'HIRER/LEVEL1/3'),
(897379, 'HIRER/LEVEL1/4'),
(897378, 'HIRER/LEVEL1/5'),
(897381, 'HIRER/LEVEL1/6'),
(897380, 'HIRER/LEVEL1/7'),
(897383, 'HIRER/LEVEL1/8'),
(897382, 'HIRER/LEVEL1/9'),
(897385, 'HIRER/LEVEL2/1'),
(897384, 'HIRER/LEVEL2/10'),
(897387, 'HIRER/LEVEL2/2'),
(897386, 'HIRER/LEVEL2/3'),
(897389, 'HIRER/LEVEL2/4'),
(897388, 'HIRER/LEVEL2/5'),
(897391, 'HIRER/LEVEL2/6'),
(897390, 'HIRER/LEVEL2/7'),
(897393, 'HIRER/LEVEL2/8'),
(897392, 'HIRER/LEVEL2/9'),
(897395, 'HIRER/LEVEL3/1'),
(897394, 'HIRER/LEVEL3/10'),
(897397, 'HIRER/LEVEL3/2'),
(897396, 'HIRER/LEVEL3/3'),
(897399, 'HIRER/LEVEL3/4'),
(897398, 'HIRER/LEVEL3/5'),
(897401, 'HIRER/LEVEL3/6'),
(897400, 'HIRER/LEVEL3/7'),
(897403, 'HIRER/LEVEL3/8'),
(897402, 'HIRER/LEVEL3/9'),
(897354, 'ISP'),
(897301, 'MD'),
(897356, 'NPC/1'),
(897358, 'NPC/2'),
(897357, 'NPC/3'),
(897306, 'NSA'),
(897325, 'PUZZLE/1'),
(897337, 'PUZZLE/10'),
(897336, 'PUZZLE/11'),
(897339, 'PUZZLE/12'),
(897338, 'PUZZLE/13'),
(897341, 'PUZZLE/14'),
(897340, 'PUZZLE/15'),
(897343, 'PUZZLE/16'),
(897342, 'PUZZLE/17'),
(897345, 'PUZZLE/18'),
(897344, 'PUZZLE/19'),
(897327, 'PUZZLE/2'),
(897313, 'PUZZLE/20'),
(897314, 'PUZZLE/21'),
(897315, 'PUZZLE/22'),
(897316, 'PUZZLE/23'),
(897309, 'PUZZLE/24'),
(897310, 'PUZZLE/25'),
(897311, 'PUZZLE/26'),
(897312, 'PUZZLE/27'),
(897321, 'PUZZLE/28'),
(897322, 'PUZZLE/29'),
(897326, 'PUZZLE/3'),
(897347, 'PUZZLE/30'),
(897346, 'PUZZLE/31'),
(897353, 'PUZZLE/32'),
(897352, 'PUZZLE/33'),
(897351, 'PUZZLE/34'),
(897350, 'PUZZLE/35'),
(897349, 'PUZZLE/36'),
(897348, 'PUZZLE/37'),
(897335, 'PUZZLE/38'),
(897334, 'PUZZLE/39'),
(897329, 'PUZZLE/4'),
(897323, 'PUZZLE/40'),
(897324, 'PUZZLE/41'),
(897307, 'PUZZLE/42'),
(897308, 'PUZZLE/43'),
(897319, 'PUZZLE/44'),
(897320, 'PUZZLE/45'),
(897317, 'PUZZLE/46'),
(897318, 'PUZZLE/47'),
(897328, 'PUZZLE/5'),
(897331, 'PUZZLE/6'),
(897330, 'PUZZLE/7'),
(897333, 'PUZZLE/8'),
(897332, 'PUZZLE/9'),
(897361, 'SAFENET'),
(897363, 'TORRENT'),
(897302, 'WHOIS/1'),
(897304, 'WHOIS/2'),
(897303, 'WHOIS/3'),
(897305, 'WHOIS/4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npc_reset`
--

CREATE TABLE `npc_reset` (
  `npcID` int(5) NOT NULL,
  `nextScan` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `npc_reset`
--

INSERT INTO `npc_reset` (`npcID`, `nextScan`) VALUES
(897305, '2019-11-18 14:14:27'),
(897349, '2019-11-18 14:14:27'),
(897355, '2019-11-18 14:14:27'),
(897393, '2019-11-18 14:14:27'),
(897330, '2019-11-18 15:14:27'),
(897403, '2019-11-18 15:14:27'),
(897333, '2019-11-18 16:14:27'),
(897314, '2019-11-18 17:14:27'),
(897369, '2019-11-18 17:14:27'),
(897396, '2019-11-18 17:14:27'),
(897379, '2019-11-18 18:14:27'),
(897389, '2019-11-18 18:14:27'),
(897334, '2019-11-18 19:14:27'),
(897336, '2019-11-18 19:14:27'),
(897365, '2019-11-18 19:14:27'),
(897381, '2019-11-18 19:14:27'),
(897322, '2019-11-18 20:10:01'),
(897377, '2019-11-18 20:10:01'),
(897324, '2019-11-18 20:14:27'),
(897363, '2019-11-18 21:14:27'),
(897302, '2019-11-18 22:14:27'),
(897371, '2019-11-18 22:14:27'),
(897372, '2019-11-18 22:14:27'),
(897344, '2019-11-18 23:14:27'),
(897312, '2019-11-19 00:14:27'),
(897361, '2019-11-19 00:14:27'),
(897384, '2019-11-19 00:14:27'),
(897308, '2019-11-19 01:14:27'),
(897380, '2019-11-19 01:14:27'),
(897383, '2019-11-19 01:14:27'),
(897358, '2019-11-19 02:14:27'),
(897368, '2019-11-19 02:14:27'),
(897376, '2019-11-19 02:14:27'),
(897348, '2019-11-19 03:14:27'),
(897303, '2019-11-19 04:14:27'),
(897386, '2019-11-19 04:14:27'),
(897354, '2019-11-19 06:14:27'),
(897329, '2019-11-19 07:14:27'),
(897332, '2019-11-19 07:14:27'),
(897388, '2019-11-19 07:14:27'),
(897316, '2019-11-19 08:14:27'),
(897345, '2019-11-19 08:14:27'),
(897319, '2019-11-19 09:14:27'),
(897342, '2019-11-19 09:14:27'),
(897373, '2019-11-19 09:14:27'),
(897390, '2019-11-19 09:14:27'),
(897318, '2019-11-19 10:14:27'),
(897320, '2019-11-19 10:14:27'),
(897328, '2019-11-19 10:14:27'),
(897364, '2019-11-19 10:14:27'),
(897301, '2019-11-19 11:10:01'),
(897306, '2019-11-19 11:10:01'),
(897310, '2019-11-19 11:10:01'),
(897311, '2019-11-19 11:10:01'),
(897313, '2019-11-19 11:10:01'),
(897317, '2019-11-19 11:10:01'),
(897321, '2019-11-19 11:10:01'),
(897325, '2019-11-19 11:10:01'),
(897326, '2019-11-19 11:10:01'),
(897327, '2019-11-19 11:10:01'),
(897331, '2019-11-19 11:10:01'),
(897335, '2019-11-19 11:10:01'),
(897339, '2019-11-19 11:10:01'),
(897340, '2019-11-19 11:10:01'),
(897341, '2019-11-19 11:10:01'),
(897343, '2019-11-19 11:10:01'),
(897350, '2019-11-19 11:10:01'),
(897351, '2019-11-19 11:10:01'),
(897352, '2019-11-19 11:10:01'),
(897353, '2019-11-19 11:10:01'),
(897356, '2019-11-19 11:10:01'),
(897357, '2019-11-19 11:10:01'),
(897370, '2019-11-19 11:10:01'),
(897387, '2019-11-19 11:10:01'),
(897391, '2019-11-19 11:10:01'),
(897394, '2019-11-19 11:10:01'),
(897395, '2019-11-19 11:10:01'),
(897398, '2019-11-19 11:10:01'),
(897399, '2019-11-19 11:10:01'),
(897401, '2019-11-19 11:10:01'),
(897402, '2019-11-19 11:10:01'),
(897304, '2019-11-19 11:14:27'),
(897338, '2019-11-19 11:14:27'),
(897346, '2019-11-19 12:14:27'),
(897367, '2019-11-19 12:14:27'),
(897385, '2019-11-19 12:14:27'),
(897315, '2019-11-19 14:10:02'),
(897359, '2019-11-19 14:10:02'),
(897362, '2019-11-19 14:10:02'),
(897366, '2019-11-19 14:10:02'),
(897375, '2019-11-19 14:10:02'),
(897382, '2019-11-19 14:10:02'),
(897397, '2019-11-19 14:10:02'),
(897307, '2019-11-19 14:14:27'),
(897309, '2019-11-19 14:14:27'),
(897378, '2019-11-19 15:14:27'),
(897347, '2019-11-19 16:14:27'),
(897360, '2019-11-19 16:14:27'),
(897392, '2019-11-19 16:14:27'),
(897374, '2019-11-19 17:14:27'),
(897323, '2019-11-19 19:14:27'),
(897337, '2019-11-19 19:14:27'),
(897400, '2019-11-19 19:14:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `id` int(15) NOT NULL,
  `userID` int(5) NOT NULL,
  `info` text NOT NULL,
  `paid` double NOT NULL,
  `original_amount` double NOT NULL,
  `plan` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments_history`
--

CREATE TABLE `payments_history` (
  `id` int(5) NOT NULL,
  `userID` int(5) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  `info` text NOT NULL,
  `paid` double NOT NULL,
  `plan` varchar(15) NOT NULL,
  `confirmation` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `premium_history`
--

CREATE TABLE `premium_history` (
  `id` int(5) UNSIGNED NOT NULL,
  `userID` int(5) NOT NULL,
  `boughtDate` datetime NOT NULL,
  `premiumUntil` datetime NOT NULL,
  `paid` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `processes`
--

CREATE TABLE `processes` (
  `pid` int(32) NOT NULL,
  `pCreatorID` int(5) NOT NULL,
  `pVictimID` int(5) NOT NULL,
  `pAction` smallint(3) NOT NULL,
  `pSoftID` int(32) NOT NULL,
  `pInfo` varchar(30) NOT NULL,
  `pInfoStr` text NOT NULL,
  `pTimeStart` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pTimePause` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pTimeEnd` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pTimeIdeal` int(5) NOT NULL,
  `pTimeWorked` int(11) NOT NULL DEFAULT 0,
  `cpuUsage` double NOT NULL DEFAULT 0,
  `netUsage` double NOT NULL DEFAULT 0,
  `pLocal` tinyint(1) NOT NULL DEFAULT 0,
  `pNPC` tinyint(1) DEFAULT 0,
  `isPaused` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `processes_paused`
--

CREATE TABLE `processes_paused` (
  `pid` int(30) NOT NULL,
  `timeLeft` int(6) NOT NULL,
  `timePaused` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `userID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile`
--

CREATE TABLE `profile` (
  `id` int(5) NOT NULL,
  `premium` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `reputation` bigint(15) NOT NULL,
  `rank` int(5) NOT NULL,
  `age` date NOT NULL,
  `timePlaying` float NOT NULL,
  `missionCount` int(5) NOT NULL,
  `hackCount` int(5) NOT NULL,
  `ipResets` smallint(4) NOT NULL,
  `ddosCount` smallint(5) NOT NULL,
  `warezSent` double NOT NULL,
  `spamSent` bigint(15) NOT NULL,
  `mailSent` int(5) NOT NULL,
  `moneyEarned` bigint(11) NOT NULL,
  `moneyTransfered` bigint(11) NOT NULL,
  `moneyHardware` bigint(11) NOT NULL,
  `moneyResearch` bigint(11) NOT NULL,
  `profileViews` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puzzle_solved`
--

CREATE TABLE `puzzle_solved` (
  `puzzleID` int(5) UNSIGNED NOT NULL,
  `userID` int(5) UNSIGNED NOT NULL,
  `solvedDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ranking_clan`
--

CREATE TABLE `ranking_clan` (
  `clanID` int(5) NOT NULL,
  `rank` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ranking_ddos`
--

CREATE TABLE `ranking_ddos` (
  `ddosID` int(5) NOT NULL,
  `rank` int(5) NOT NULL DEFAULT -1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ranking_software`
--

CREATE TABLE `ranking_software` (
  `softID` int(5) NOT NULL,
  `rank` int(5) NOT NULL DEFAULT -1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ranking_user`
--

CREATE TABLE `ranking_user` (
  `userID` int(5) NOT NULL,
  `rank` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ranking_user`
--

INSERT INTO `ranking_user` (`userID`, `rank`) VALUES
(750716, -1),
(750717, -1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `round`
--

CREATE TABLE `round` (
  `id` smallint(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `startDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `endDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `round`
--

INSERT INTO `round` (`id`, `name`, `startDate`, `endDate`, `status`) VALUES
(13, 'ROUND-BETA', '2019-11-17 17:14:16', '2021-12-23 16:56:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `round_ddos`
--

CREATE TABLE `round_ddos` (
  `id` int(5) NOT NULL,
  `attID` int(5) NOT NULL,
  `attUser` varchar(15) NOT NULL,
  `vicID` int(5) NOT NULL,
  `power` int(10) NOT NULL,
  `servers` int(3) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `vicNPC` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `round_stats`
--

CREATE TABLE `round_stats` (
  `id` tinyint(1) NOT NULL,
  `totalUsers` int(6) NOT NULL DEFAULT 0,
  `activeUsers` int(5) NOT NULL DEFAULT 0,
  `warezSent` double NOT NULL DEFAULT 0,
  `spamSent` bigint(15) NOT NULL DEFAULT 0,
  `bitcoinSent` double UNSIGNED NOT NULL DEFAULT 0,
  `mailSent` int(6) NOT NULL DEFAULT 0,
  `ddosCount` int(6) NOT NULL DEFAULT 0,
  `hackCount` int(5) NOT NULL DEFAULT 0,
  `clans` int(4) NOT NULL DEFAULT 0,
  `timePlaying` bigint(15) NOT NULL DEFAULT 0,
  `totalListed` int(6) NOT NULL DEFAULT 0,
  `totalVirus` int(5) NOT NULL DEFAULT 0,
  `totalMoney` bigint(20) NOT NULL DEFAULT 0,
  `researchCount` int(5) NOT NULL DEFAULT 0,
  `moneyResearch` int(20) UNSIGNED NOT NULL DEFAULT 0,
  `moneyHardware` int(20) UNSIGNED NOT NULL DEFAULT 0,
  `moneyEarned` int(20) UNSIGNED DEFAULT 0,
  `moneyTransfered` int(20) UNSIGNED NOT NULL DEFAULT 0,
  `usersClicks` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `missionCount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `totalConnections` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `totalTasks` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `totalSoftware` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `totalRunning` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `totalServers` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `clansWar` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `clansMembers` int(5) UNSIGNED NOT NULL DEFAULT 0,
  `clansClicks` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `onlineUsers` int(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `round_stats`
--

INSERT INTO `round_stats` (`id`, `totalUsers`, `activeUsers`, `warezSent`, `spamSent`, `bitcoinSent`, `mailSent`, `ddosCount`, `hackCount`, `clans`, `timePlaying`, `totalListed`, `totalVirus`, `totalMoney`, `researchCount`, `moneyResearch`, `moneyHardware`, `moneyEarned`, `moneyTransfered`, `usersClicks`, `missionCount`, `totalConnections`, `totalTasks`, `totalSoftware`, `totalRunning`, `totalServers`, `clansWar`, `clansMembers`, `clansClicks`, `onlineUsers`) VALUES
(13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `safeNet`
--

CREATE TABLE `safeNet` (
  `IP` bigint(11) NOT NULL,
  `reason` tinyint(1) NOT NULL,
  `startTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `endTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `count` tinyint(3) NOT NULL DEFAULT 1,
  `onFBI` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `server_stats`
--

CREATE TABLE `server_stats` (
  `id` tinyint(1) NOT NULL,
  `totalUsers` int(6) NOT NULL,
  `activeUsers` int(5) NOT NULL,
  `warezSent` double NOT NULL,
  `spamSent` bigint(15) NOT NULL,
  `mailSent` int(6) NOT NULL,
  `ddosCount` int(6) NOT NULL,
  `hackCount` int(5) NOT NULL,
  `clans` int(4) NOT NULL,
  `timePlaying` bigint(15) NOT NULL,
  `totalListed` int(5) NOT NULL,
  `totalVirus` int(6) NOT NULL,
  `totalMoney` bigint(20) NOT NULL,
  `researchCount` int(5) NOT NULL,
  `researchMoney` bigint(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `software`
--

CREATE TABLE `software` (
  `id` int(32) NOT NULL,
  `userID` int(5) NOT NULL,
  `softName` varchar(25) NOT NULL,
  `softVersion` int(5) NOT NULL,
  `softSize` int(8) NOT NULL,
  `softRam` int(9) NOT NULL DEFAULT 0,
  `softType` smallint(2) NOT NULL,
  `softLastEdit` datetime NOT NULL DEFAULT current_timestamp(),
  `softHidden` tinyint(1) NOT NULL DEFAULT 0,
  `softHiddenWith` bigint(20) NOT NULL DEFAULT 0,
  `isNPC` tinyint(1) NOT NULL,
  `originalFrom` bigint(20) NOT NULL DEFAULT 0,
  `licensedTo` int(5) NOT NULL DEFAULT 0,
  `isFolder` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `software`
--

INSERT INTO `software` (`id`, `userID`, `softName`, `softVersion`, `softSize`, `softRam`, `softType`, `softLastEdit`, `softHidden`, `softHiddenWith`, `isNPC`, `originalFrom`, `licensedTo`, `isFolder`) VALUES
(13662691, 897302, 'Decent SSH Exploit', 20, 57, 28, 14, '2019-11-17 18:14:27', 0, 0, 1, 0, 0, 0),
(13662692, 897302, 'Generic FTP Exploit', 18, 47, 22, 13, '2019-11-17 18:14:27', 0, 0, 1, 0, 0, 0),
(13662693, 897302, 'Winblows 8.1', 20, 63, 30, 17, '2019-11-17 18:14:27', 0, 0, 1, 0, 0, 0),
(13662694, 897302, 'Basic Analyzer', 10, 23, 8, 16, '2019-11-17 18:14:27', 0, 0, 1, 0, 0, 0),
(13662695, 897302, 'Decent Hasher', 20, 69, 33, 2, '2019-11-17 18:14:27', 0, 0, 1, 0, 0, 0),
(13662696, 897302, 'riddle', 10, 0, 0, 26, '2019-11-17 18:14:27', 0, 0, 1, 0, 0, 0),
(13662697, 897302, 'Decent Cracker', 21, 83, 41, 1, '2019-11-17 18:14:27', 0, 0, 1, 0, 0, 0),
(13662698, 897302, 'Decent Firewall', 20, 63, 30, 4, '2019-11-17 18:14:27', 0, 0, 1, 0, 0, 0),
(13662699, 897302, 'Generic Seeker', 19, 41, 20, 6, '2019-11-17 18:14:27', 0, 0, 1, 0, 0, 0),
(13662700, 897302, 'Decent Hidder', 20, 45, 22, 5, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662701, 897302, 'Decent Spam', 20, 36, 18, 8, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662702, 897302, 'Decent Anti-Virus', 20, 48, 23, 7, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662703, 897302, 'Decent Miner', 20, 63, 30, 20, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662704, 897302, 'Decent Warez', 20, 36, 18, 9, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662705, 897303, 'Big Hasher', 75, 1058, 623, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662706, 897303, 'riddle', 10, 0, 0, 26, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662707, 897303, 'Amazing Cracker', 80, 1316, 778, 1, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662708, 897303, 'Advanced Firewall', 50, 413, 235, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662709, 897303, 'Big Seeker', 75, 690, 407, 6, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662710, 897303, 'Big Hidder', 75, 690, 407, 5, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662711, 897303, 'Advanced SSH Exploit', 50, 374, 213, 14, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662712, 897303, 'Advanced FTP Exploit', 50, 374, 213, 13, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662713, 897303, 'Intermediate Analyzer', 30, 142, 78, 16, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662714, 897304, 'Competent SSH Exploit', 45, 299, 176, 14, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662715, 897304, 'Decent FTP Exploit', 20, 57, 28, 13, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662716, 897304, 'Fotoshop CS6', 30, 142, 78, 17, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662717, 897304, 'Decent Analyzer', 20, 63, 30, 16, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662718, 897304, 'Advanced Hasher', 50, 452, 257, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662719, 897304, 'riddle', 10, 0, 0, 26, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662720, 897304, 'Advanced Cracker', 53, 555, 318, 1, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662721, 897304, 'Intermediate Firewall', 36, 207, 118, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662722, 897304, 'Advanced Seeker', 50, 295, 168, 6, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662723, 897304, 'Advanced Hidder', 50, 295, 168, 5, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662724, 897304, 'Advanced Spam', 50, 236, 134, 8, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662725, 897304, 'Basic Nmap', 10, 23, 8, 15, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662726, 897304, 'Advanced Miner', 50, 413, 235, 20, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662727, 897304, 'Advanced Warez', 50, 236, 134, 9, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662728, 897305, 'Super Hasher', 100, 1890, 1110, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662729, 897305, 'riddle', 10, 0, 0, 26, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662730, 897305, 'Super Cracker', 110, 2230, 1350, 1, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662731, 897305, 'Big Firewall', 70, 837, 490, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662732, 897305, 'Super Seeker', 100, 1250, 550, 6, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662733, 897305, 'Super Hidder', 100, 1250, 550, 5, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662734, 897305, 'Super Miner', 100, 1730, 970, 20, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662735, 897305, 'Super Warez', 100, 1010, 340, 9, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662736, 897305, 'Big SSH Exploit', 75, 874, 515, 14, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662737, 897305, 'Big FTP Exploit', 70, 757, 444, 13, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662739, 897354, 'Decent Firewall', 20, 63, 30, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662740, 897354, 'Decent Hasher', 20, 69, 33, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662752, 897355, 'Advanced Firewall', 50, 413, 235, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662753, 897355, 'Advanced Hasher', 50, 452, 257, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662754, 897355, 'Super Miner', 100, 1730, 970, 20, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662755, 897360, 'Super Firewall', 100, 1730, 970, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662756, 897360, 'Super Hasher', 100, 1890, 1110, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662757, 897361, 'Intermediate Firewall', 35, 195, 110, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662758, 897361, 'Advanced Hasher', 50, 452, 257, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662761, 897363, 'Decent Firewall', 25, 98, 51, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662762, 897363, 'Decent Hasher', 25, 107, 56, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662763, 897363, 'Winblows 8.1', 20, 63, 30, 17, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662764, 897363, 'F.L.I.E.N.D.S', 10, 23, 8, 17, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662765, 897363, 'Fotoshop CS6', 30, 142, 78, 17, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662766, 897364, 'Generic Firewall', 15, 39, 16, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662767, 897364, 'Generic Hasher', 15, 42, 17, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662768, 897365, 'Competent Firewall', 40, 258, 149, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662769, 897365, 'Competent Hasher', 40, 283, 163, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662772, 897367, 'Amazing Firewall', 80, 1106, 653, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662773, 897367, 'Amazing Hasher', 80, 1211, 715, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662774, 897368, 'Advanced Firewall', 60, 606, 351, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662775, 897368, 'Advanced Hasher', 60, 663, 384, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662776, 897369, 'Generic Cracker', 19, 69, 32, 1, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662777, 897369, 'Generic Hasher', 17, 52, 23, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662778, 897369, 'Basic Spam', 11, 15, 5, 8, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662779, 897369, 'Generic Firewall', 17, 47, 21, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662783, 897371, 'Decent Cracker', 25, 116, 61, 1, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662784, 897371, 'Decent Hasher', 27, 125, 67, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662785, 897371, 'Decent Warez', 20, 36, 18, 9, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662786, 897371, 'Decent Firewall', 22, 76, 38, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662787, 897371, 'Decent FTP Exploit', 25, 89, 46, 13, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662788, 897372, 'Generic Cracker', 18, 62, 28, 1, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662789, 897372, 'Generic Hasher', 17, 52, 23, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662790, 897372, 'Generic Spam', 15, 22, 9, 8, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662791, 897372, 'Decent Firewall', 25, 98, 51, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662792, 897372, 'Decent Anti-Virus', 23, 63, 32, 7, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662793, 897372, 'Decent Hidder', 22, 54, 27, 5, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662794, 897373, 'Generic Cracker', 17, 56, 25, 1, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662795, 897373, 'Generic Hasher', 19, 63, 30, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662796, 897373, 'Decent Spam', 20, 36, 18, 8, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662797, 897373, 'Generic Firewall', 17, 47, 21, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662798, 897373, 'Basic Port Scan', 10, 23, 8, 3, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662799, 897373, 'Decent FTP Exploit', 25, 89, 46, 13, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662800, 897374, 'Decent Cracker', 26, 126, 66, 1, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662801, 897374, 'Generic Hasher', 19, 63, 30, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662802, 897374, 'Decent Firewall', 20, 63, 30, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662809, 897376, 'Basic Cracker', 11, 30, 10, 1, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662810, 897376, 'Basic Hasher', 12, 31, 11, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662811, 897376, 'Decent Spam', 20, 36, 18, 8, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662812, 897376, 'Basic Firewall', 10, 23, 8, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662813, 897376, 'Basic SSH Exploit', 13, 28, 11, 14, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662814, 897376, 'Basic FTP Exploit', 12, 26, 9, 13, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662815, 897376, 'Basic Warez', 10, 14, 5, 9, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662816, 897376, 'Basic Port Scan', 10, 23, 8, 3, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662824, 897378, 'Basic Cracker', 13, 37, 14, 1, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662825, 897378, 'Generic Hasher', 17, 52, 23, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662826, 897378, 'Decent Miner', 20, 63, 30, 20, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662827, 897378, 'Basic Firewall', 14, 35, 14, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662828, 897378, 'Generic Hidder', 16, 31, 13, 5, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662829, 897378, 'Generic Hidder', 16, 31, 13, 5, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662830, 897378, 'Basic Hidder', 13, 23, 9, 5, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662831, 897378, 'Generic Spam', 15, 22, 9, 8, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662832, 897379, 'Basic Cracker', 14, 41, 16, 1, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662833, 897379, 'Basic Hasher', 13, 34, 13, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662834, 897379, 'Basic Spam', 12, 16, 6, 8, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662835, 897379, 'Generic Firewall', 17, 47, 21, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662836, 897379, 'Basic Port Scan', 10, 23, 8, 3, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662837, 897379, 'Basic FTP Exploit', 12, 26, 9, 13, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662838, 897379, 'Basic Seeker', 12, 20, 7, 6, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662839, 897379, 'Basic Warez', 13, 18, 7, 9, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662840, 897379, 'Basic Hidder', 11, 18, 6, 5, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662841, 897380, 'Decent Cracker', 20, 75, 36, 1, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662842, 897380, 'Decent Hasher', 22, 83, 42, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662843, 897380, 'Generic SSH Exploit', 17, 43, 19, 14, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662844, 897380, 'Basic Firewall', 10, 23, 8, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662845, 897380, 'Basic Port Scan', 10, 23, 8, 3, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662846, 897380, 'Generic FTP Exploit', 16, 39, 17, 13, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662847, 897381, 'Decent Cracker', 22, 90, 45, 1, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662848, 897381, 'Generic Hasher', 16, 47, 20, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662849, 897381, 'Basic Spam', 14, 20, 8, 8, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662850, 897381, 'Generic Firewall', 19, 58, 27, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662851, 897381, 'Basic Port Scan', 10, 23, 8, 3, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662852, 897381, 'Basic SSH Exploit', 14, 32, 13, 14, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662853, 897381, 'Generic Hidder', 18, 38, 17, 5, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662857, 897383, 'Decent Cracker', 23, 99, 50, 1, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662858, 897383, 'Decent Hasher', 25, 107, 56, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662859, 897383, 'Generic Warez', 15, 22, 9, 9, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662860, 897383, 'Decent Firewall', 20, 63, 30, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662861, 897383, 'Basic Anti-Virus', 13, 24, 9, 7, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662862, 897383, 'Generic FTP Exploit', 16, 39, 17, 13, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662863, 897384, 'Basic Hasher', 10, 26, 8, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662864, 897385, 'Intermediate Cracker', 35, 232, 131, 1, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662865, 897385, 'Intermediate Hasher', 33, 189, 106, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662866, 897385, 'Decent Spam', 22, 44, 22, 8, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662867, 897385, 'Decent Firewall', 28, 123, 66, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662868, 897385, 'Basic Hidder', 12, 20, 7, 5, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662869, 897386, 'Advanced Cracker', 59, 696, 403, 1, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662870, 897386, 'Competent Hasher', 42, 313, 182, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662871, 897386, 'Intermediate Spam', 39, 140, 81, 8, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662872, 897386, 'Intermediate Firewall', 34, 184, 103, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662873, 897386, 'Intermediate Seeker', 36, 148, 84, 6, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662874, 897386, 'Advanced FTP Exploit', 50, 374, 213, 13, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662882, 897388, 'Competent Cracker', 44, 375, 220, 1, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662883, 897388, 'Intermediate Hasher', 38, 254, 146, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662884, 897388, 'Generic Spam', 19, 33, 16, 8, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662885, 897388, 'Decent Firewall', 28, 123, 66, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662886, 897388, 'Intermediate SSH Exploit', 33, 156, 88, 14, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662887, 897388, 'Competent FTP Exploit', 40, 234, 135, 13, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662888, 897389, 'Intermediate Cracker', 38, 276, 158, 1, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662889, 897389, 'Advanced Hasher', 54, 532, 305, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662890, 897389, 'Decent Spam', 20, 36, 18, 8, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662891, 897389, 'Competent Firewall', 40, 258, 149, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662892, 897390, 'Advanced Cracker', 52, 534, 305, 1, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662893, 897390, 'Advanced Hasher', 56, 574, 330, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662894, 897390, 'Intermediate Firewall', 30, 142, 78, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662904, 897392, 'Basic Cracker', 14, 41, 16, 1, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662905, 897392, 'Basic Hasher', 13, 34, 13, 2, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662906, 897392, 'Basic Spam', 12, 16, 6, 8, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662907, 897392, 'Generic Firewall', 17, 47, 21, 4, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662908, 897392, 'Basic Port Scan', 10, 23, 8, 3, '2019-11-17 18:14:28', 0, 0, 1, 0, 0, 0),
(13662909, 897392, 'Basic FTP Exploit', 12, 26, 9, 13, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662910, 897392, 'Basic Seeker', 12, 20, 7, 6, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662911, 897392, 'Basic Warez', 13, 18, 7, 9, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662912, 897392, 'Basic Hidder', 11, 18, 6, 5, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662913, 897393, 'Competent Cracker', 40, 307, 178, 1, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662914, 897393, 'Intermediate Hasher', 36, 227, 129, 2, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662915, 897393, 'Competent Warez', 42, 164, 95, 9, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662916, 897393, 'Advanced Firewall', 59, 585, 338, 4, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662917, 897393, 'Advanced FTP Exploit', 63, 607, 353, 13, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662920, 897396, 'Basic Hasher', 10, 26, 8, 2, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662924, 897400, 'Basic Hasher', 10, 26, 8, 2, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662927, 897403, 'Basic Hasher', 10, 26, 8, 2, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662928, 897307, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662929, 897307, 'Super Firewall', 100, 1730, 970, 4, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662930, 897307, 'Amazing FTP Exploit', 87, 1192, 707, 13, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662931, 897307, 'Epic Hidder', 150, 1900, 850, 5, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662932, 897307, 'Epic Cracker', 150, 3450, 2250, 1, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662933, 897307, 'Ultra Anti-Virus', 140, 1846, 852, 7, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662934, 897307, 'Advanced SSH Exploit', 62, 587, 341, 14, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662935, 897307, 'Ultra Hasher', 140, 2798, 1706, 2, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662936, 897307, 'Super Seeker', 104, 1275, 547, 6, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662937, 897308, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662938, 897308, 'Super Firewall', 110, 1866, 1030, 4, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662939, 897308, 'Amazing FTP Exploit', 88, 1220, 724, 13, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662940, 897308, 'Ultra Hidder', 134, 1611, 673, 5, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662941, 897308, 'Epic Cracker', 160, 3880, 2600, 1, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662942, 897308, 'Amazing SSH Exploit', 82, 1053, 623, 14, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662943, 897308, 'Epic Hasher', 150, 3140, 1970, 2, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662944, 897308, 'Epic Seeker', 150, 1900, 850, 6, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662945, 897308, 'Epic Miner', 150, 2830, 1690, 20, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662946, 897309, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662947, 897309, 'Intermediate Firewall', 32, 162, 90, 4, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662948, 897309, 'Intermediate FTP Exploit', 36, 187, 107, 13, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662949, 897309, 'Intermediate Hidder', 37, 157, 90, 5, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662950, 897309, 'Competent Cracker', 44, 375, 220, 1, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662951, 897309, 'Decent SSH Exploit', 24, 82, 42, 14, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662952, 897309, 'Competent Hasher', 42, 313, 182, 2, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662953, 897309, 'Intermediate Seeker', 34, 131, 74, 6, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662954, 897309, 'Competent Miner', 40, 258, 149, 20, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662973, 897312, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662974, 897312, 'Intermediate Firewall', 36, 207, 118, 4, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662975, 897312, 'Intermediate FTP Exploit', 30, 128, 70, 13, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662976, 897312, 'Competent Hidder', 44, 225, 132, 5, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662977, 897312, 'Advanced Collector', 50, 275, 157, 11, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662978, 897312, 'Advanced Cracker', 50, 491, 280, 1, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662979, 897312, 'Intermediate SSH Exploit', 30, 128, 70, 14, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662980, 897312, 'Competent Hasher', 48, 415, 245, 2, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662981, 897312, 'Competent Seeker', 40, 185, 107, 6, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662992, 897314, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662993, 897314, 'Intermediate Firewall', 30, 142, 78, 4, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662994, 897314, 'Decent FTP Exploit', 22, 69, 34, 13, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662995, 897314, 'Competent Hidder', 40, 185, 107, 5, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662996, 897314, 'Intermediate Cracker', 38, 276, 158, 1, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662997, 897314, 'Competent Anti-Virus', 40, 197, 114, 7, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662998, 897314, 'Decent SSH Exploit', 21, 63, 31, 14, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13662999, 897314, 'Intermediate Hasher', 36, 227, 129, 2, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663000, 897314, 'Competent Seeker', 40, 185, 107, 6, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663011, 897316, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663012, 897316, 'Intermediate Firewall', 32, 162, 90, 4, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663013, 897316, 'Decent FTP Exploit', 29, 120, 65, 13, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663014, 897316, 'Decent Hidder', 28, 88, 48, 5, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663015, 897316, 'Competent Warez', 40, 148, 86, 9, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663016, 897316, 'Competent Cracker', 42, 340, 198, 1, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663017, 897316, 'Decent SSH Exploit', 22, 69, 34, 14, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663018, 897316, 'Competent Hasher', 40, 283, 163, 2, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663019, 897316, 'Intermediate Seeker', 33, 123, 69, 6, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663030, 897318, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663031, 897318, 'Epic Firewall', 150, 2830, 1690, 4, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663032, 897318, 'Ultra FTP Exploit', 127, 1966, 1026, 13, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663033, 897318, 'Ultra Hidder', 143, 1764, 763, 5, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663034, 897318, 'Ultimate Cracker', 200, 6100, 4500, 1, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663035, 897318, 'Amazing SSH Exploit', 95, 1431, 852, 14, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663036, 897318, 'Ultimate Hasher', 190, 4968, 3487, 2, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663037, 897318, 'Ultra Seeker', 128, 1522, 626, 6, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663038, 897319, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663039, 897319, 'Ultra Firewall', 120, 2044, 1132, 4, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663040, 897319, 'Ultra FTP Exploit', 130, 2026, 1064, 13, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663041, 897319, 'Ultra Hidder', 149, 1880, 837, 5, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663042, 897319, 'Epic Cracker', 170, 4360, 3000, 1, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663043, 897319, 'Ultra SSH Exploit', 130, 2026, 1064, 14, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663044, 897319, 'Epic Breaker', 150, 1745, 711, 12, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663045, 897319, 'Epic Hasher', 160, 3528, 2280, 2, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663046, 897319, 'Ultra Seeker', 132, 1580, 656, 6, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663047, 897320, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663048, 897320, 'Ultra Firewall', 130, 2264, 1276, 4, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663049, 897320, 'Ultra FTP Exploit', 127, 1966, 1026, 13, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663050, 897320, 'Ultra Hidder', 149, 1880, 837, 5, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663051, 897320, 'Epic Collector', 150, 1745, 711, 11, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663052, 897320, 'Epic Spam', 150, 1435, 430, 8, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663053, 897320, 'Ultimate Cracker', 180, 4890, 3450, 1, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663054, 897320, 'Super SSH Exploit', 114, 1741, 897, 14, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663055, 897320, 'Epic Hasher', 170, 3962, 2636, 2, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663056, 897320, 'Ultra Seeker', 142, 1746, 752, 6, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663074, 897323, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663075, 897323, 'Amazing Firewall', 90, 1413, 840, 4, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663076, 897323, 'Super Hidder', 104, 1275, 547, 5, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663077, 897323, 'Ultra Collector', 120, 1316, 488, 11, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663078, 897323, 'Ultra Spam', 120, 1108, 304, 8, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663079, 897323, 'Ultra Cracker', 130, 2740, 1700, 1, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663080, 897323, 'Ultra Hasher', 120, 2252, 1316, 2, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663081, 897323, 'Super Seeker', 110, 1320, 550, 6, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663082, 897324, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663083, 897324, 'Amazing Firewall', 90, 1413, 840, 4, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663084, 897324, 'Amazing FTP Exploit', 90, 1279, 760, 13, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663085, 897324, 'Amazing Hidder', 98, 1205, 719, 5, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663086, 897324, 'Ultra Warez', 140, 1302, 364, 9, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663087, 897324, 'Ultra Cracker', 140, 3070, 1950, 1, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663088, 897324, 'Amazing SSH Exploit', 90, 1279, 760, 14, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663089, 897324, 'Ultra Hasher', 130, 2502, 1489, 2, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663090, 897324, 'Super Seeker', 102, 1262, 548, 6, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663115, 897328, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663116, 897328, 'Basic Firewall', 14, 35, 14, 4, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663117, 897328, 'Generic FTP Exploit', 18, 47, 22, 13, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663118, 897328, 'Basic Hidder', 13, 23, 9, 5, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663119, 897328, 'Generic Collector', 15, 26, 11, 11, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663120, 897328, 'Generic Spam', 15, 22, 9, 8, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663121, 897328, 'Generic Cracker', 15, 46, 19, 1, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663122, 897328, 'Generic Anti-Virus', 15, 30, 12, 7, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663123, 897328, 'Basic Hasher', 14, 38, 15, 2, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663124, 897328, 'Basic Seeker', 10, 17, 6, 6, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663125, 897329, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663126, 897329, 'Basic Firewall', 12, 28, 10, 4, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663127, 897329, 'Basic Hidder', 14, 25, 10, 5, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663128, 897329, 'Basic Cracker', 14, 41, 16, 1, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663129, 897329, 'Basic SSH Exploit', 11, 23, 8, 14, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663130, 897329, 'Basic Hasher', 13, 34, 13, 2, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663131, 897329, 'Basic Seeker', 11, 18, 6, 6, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663132, 897329, 'Basic Miner', 13, 31, 12, 20, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663133, 897330, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663134, 897330, 'Generic Firewall', 16, 43, 18, 4, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663135, 897330, 'Basic FTP Exploit', 13, 28, 11, 13, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663136, 897330, 'Generic Warez', 15, 22, 9, 9, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663137, 897330, 'Generic Cracker', 17, 56, 25, 1, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663138, 897330, 'Generic Anti-Virus', 15, 30, 12, 7, '2019-11-17 18:14:29', 0, 0, 1, 0, 0, 0),
(13663139, 897330, 'Basic SSH Exploit', 12, 26, 9, 14, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663140, 897330, 'Generic Hasher', 16, 47, 20, 2, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663141, 897330, 'Generic Miner', 16, 43, 18, 20, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663151, 897332, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663152, 897332, 'Generic Firewall', 18, 52, 24, 4, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663153, 897332, 'Generic FTP Exploit', 17, 43, 19, 13, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663154, 897332, 'Decent Collector', 20, 42, 20, 11, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663155, 897332, 'Generic Spam', 17, 27, 12, 8, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663156, 897332, 'Generic Cracker', 19, 69, 32, 1, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663157, 897332, 'Basic Anti-Virus', 14, 27, 11, 7, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663158, 897332, 'Basic SSH Exploit', 13, 28, 11, 14, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663159, 897332, 'Generic Hasher', 18, 57, 26, 2, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663160, 897332, 'Decent Seeker', 20, 45, 22, 6, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663161, 897333, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663162, 897333, 'Generic Firewall', 16, 43, 18, 4, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663163, 897333, 'Basic FTP Exploit', 10, 21, 7, 13, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663164, 897333, 'Generic Hidder', 17, 34, 15, 5, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663165, 897333, 'Generic DDoS', 15, 24, 10, 10, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663166, 897333, 'Basic Spam', 14, 20, 8, 8, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663167, 897333, 'Generic Cracker', 18, 62, 28, 1, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663168, 897333, 'Basic SSH Exploit', 13, 28, 11, 14, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663169, 897333, 'Generic Hasher', 17, 52, 23, 2, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663170, 897333, 'Basic Seeker', 13, 23, 9, 6, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663171, 897334, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663172, 897334, 'Amazing Firewall', 80, 1106, 653, 4, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663173, 897334, 'Big FTP Exploit', 76, 899, 530, 13, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663174, 897334, 'Super Hidder', 110, 1320, 550, 5, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663175, 897334, 'Ultra Cracker', 120, 2460, 1500, 1, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663176, 897334, 'Ultra Anti-Virus', 120, 1524, 672, 7, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663177, 897334, 'Big SSH Exploit', 69, 735, 430, 14, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663178, 897334, 'Super Hasher', 110, 2048, 1190, 2, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663179, 897334, 'Amazing Seeker', 97, 1179, 703, 6, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663190, 897336, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663191, 897336, 'Decent Firewall', 20, 63, 30, 4, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663192, 897336, 'Decent FTP Exploit', 26, 96, 51, 13, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663193, 897336, 'Generic Hidder', 18, 38, 17, 5, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663194, 897336, 'Decent DDoS', 20, 39, 19, 10, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663195, 897336, 'Decent Cracker', 22, 90, 45, 1, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663196, 897336, 'Generic SSH Exploit', 19, 52, 25, 14, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663197, 897336, 'Decent Hasher', 21, 76, 37, 2, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663198, 897337, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663199, 897337, 'Generic Firewall', 18, 52, 24, 4, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663200, 897337, 'Decent FTP Exploit', 20, 57, 28, 13, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663201, 897337, 'Generic Hidder', 15, 28, 12, 5, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663202, 897337, 'Basic Spam', 14, 20, 8, 8, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663203, 897337, 'Decent Cracker', 20, 75, 36, 1, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663204, 897337, 'Basic SSH Exploit', 12, 26, 9, 14, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663205, 897337, 'Generic Hasher', 19, 63, 30, 2, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663206, 897337, 'Generic Seeker', 16, 31, 13, 6, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663207, 897338, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663208, 897338, 'Decent Firewall', 22, 76, 38, 4, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663209, 897338, 'Decent FTP Exploit', 24, 82, 42, 13, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663210, 897338, 'Decent Spam', 26, 61, 32, 8, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663211, 897338, 'Decent Cracker', 24, 107, 55, 1, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663212, 897338, 'Decent SSH Exploit', 22, 69, 34, 14, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663213, 897338, 'Decent Hasher', 23, 91, 46, 2, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663214, 897338, 'Intermediate Seeker', 30, 101, 56, 6, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663240, 897342, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663241, 897342, 'Decent Firewall', 26, 106, 56, 4, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663242, 897342, 'Generic FTP Exploit', 16, 39, 17, 13, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663243, 897342, 'Decent Hidder', 29, 95, 52, 5, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663244, 897342, 'Intermediate Warez', 33, 99, 55, 9, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663245, 897342, 'Intermediate Cracker', 30, 169, 92, 1, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663246, 897342, 'Decent SSH Exploit', 20, 57, 28, 14, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663247, 897342, 'Decent Hasher', 29, 145, 79, 2, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663248, 897342, 'Intermediate Seeker', 36, 148, 84, 6, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663259, 897344, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663260, 897344, 'Decent Firewall', 28, 123, 66, 4, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663261, 897344, 'Decent FTP Exploit', 28, 111, 60, 13, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663262, 897344, 'Intermediate Hidder', 30, 101, 56, 5, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663263, 897344, 'Intermediate Spam', 35, 112, 63, 8, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663264, 897344, 'Intermediate Cracker', 34, 219, 123, 1, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663265, 897344, 'Intermediate Anti-Virus', 34, 140, 79, 7, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663266, 897344, 'Decent SSH Exploit', 24, 82, 42, 14, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663267, 897344, 'Intermediate Hasher', 32, 177, 99, 2, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663268, 897344, 'Decent Seeker', 28, 88, 48, 6, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663269, 897345, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663270, 897345, 'Decent Firewall', 26, 106, 56, 4, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663271, 897345, 'Intermediate FTP Exploit', 30, 128, 70, 13, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663272, 897345, 'Intermediate Hidder', 37, 157, 90, 5, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663273, 897345, 'Intermediate Cracker', 32, 193, 107, 1, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663274, 897345, 'Intermediate SSH Exploit', 30, 128, 70, 14, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663275, 897345, 'Intermediate Hasher', 30, 155, 85, 2, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663276, 897346, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663277, 897346, 'Competent Firewall', 42, 286, 167, 4, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663278, 897346, 'Advanced FTP Exploit', 50, 374, 213, 13, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663279, 897346, 'Advanced Hidder', 59, 418, 242, 5, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663280, 897346, 'Advanced Cracker', 64, 825, 481, 1, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663281, 897346, 'Competent SSH Exploit', 45, 299, 176, 14, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663282, 897346, 'Advanced Hasher', 62, 711, 413, 2, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663283, 897346, 'Advanced Seeker', 56, 374, 216, 6, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663284, 897347, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663285, 897347, 'Competent Firewall', 42, 286, 167, 4, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663286, 897347, 'Competent FTP Exploit', 42, 259, 151, 13, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663287, 897347, 'Big Collector', 70, 558, 327, 11, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663288, 897347, 'Big Spam', 70, 478, 280, 8, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663289, 897347, 'Advanced Cracker', 62, 772, 449, 1, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663290, 897347, 'Competent SSH Exploit', 45, 299, 176, 14, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663291, 897347, 'Advanced Hasher', 59, 640, 370, 2, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663292, 897347, 'Advanced Seeker', 60, 433, 251, 6, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663293, 897348, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663294, 897348, 'Advanced Firewall', 60, 606, 351, 4, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663295, 897348, 'Competent FTP Exploit', 49, 358, 212, 13, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663296, 897348, 'Amazing Hidder', 92, 1057, 629, 5, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663297, 897348, 'Super DDoS', 100, 1090, 410, 10, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663298, 897348, 'Amazing Cracker', 95, 1882, 1121, 1, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663299, 897348, 'Big SSH Exploit', 66, 669, 391, 14, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663300, 897348, 'Amazing Hasher', 90, 1548, 920, 2, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663301, 897348, 'Super Seeker', 100, 1250, 550, 6, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663302, 897349, 'puzzle', 0, 0, 0, 26, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663303, 897349, 'Advanced Firewall', 55, 504, 290, 4, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663304, 897349, 'Competent FTP Exploit', 47, 328, 194, 13, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663305, 897349, 'Super Hidder', 100, 1250, 550, 5, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663306, 897349, 'Amazing Cracker', 90, 1682, 1000, 1, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663307, 897349, 'Super Anti-Virus', 100, 1330, 620, 7, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663308, 897349, 'Big SSH Exploit', 70, 757, 444, 14, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663309, 897349, 'Amazing Hasher', 85, 1374, 814, 2, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663310, 897349, 'Big Seeker', 75, 690, 407, 6, '2019-11-17 18:14:30', 0, 0, 1, 0, 0, 0),
(13663350, 750717, 'Basic Cracker', 10, 28, 0, 1, '2019-11-18 10:30:57', 0, 0, 0, 13662744, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `software_external`
--

CREATE TABLE `software_external` (
  `id` bigint(20) NOT NULL,
  `userID` int(5) NOT NULL,
  `softName` varchar(50) NOT NULL,
  `softVersion` int(5) NOT NULL,
  `softSize` int(5) NOT NULL,
  `softRam` int(5) NOT NULL,
  `softType` tinyint(3) NOT NULL,
  `uploadDate` datetime NOT NULL,
  `licensedTo` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `software_folders`
--

CREATE TABLE `software_folders` (
  `folderID` int(30) NOT NULL,
  `softID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `software_original`
--

CREATE TABLE `software_original` (
  `id` int(30) NOT NULL,
  `npcID` int(5) NOT NULL,
  `softName` varchar(25) NOT NULL,
  `softVersion` int(5) NOT NULL,
  `softSize` int(6) NOT NULL,
  `softRam` int(9) NOT NULL,
  `softType` smallint(2) NOT NULL,
  `running` tinyint(1) NOT NULL,
  `licensedTo` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `software_original`
--

INSERT INTO `software_original` (`id`, `npcID`, `softName`, `softVersion`, `softSize`, `softRam`, `softType`, `running`, `licensedTo`) VALUES
(10544, 897301, 'Super Firewall', 100, 1730, 970, 4, 1, 0),
(10545, 897301, 'Super Hasher', 100, 1890, 1110, 2, 1, 0),
(10546, 897302, 'Decent SSH Exploit', 20, 57, 28, 14, 0, 0),
(10547, 897302, 'Generic FTP Exploit', 18, 47, 22, 13, 0, 0),
(10548, 897302, 'Winblows 8.1', 20, 63, 30, 17, 0, 0),
(10549, 897302, 'Basic Analyzer', 10, 23, 8, 16, 0, 0),
(10550, 897302, 'Decent Hasher', 20, 69, 33, 2, 1, 0),
(10551, 897302, 'riddle', 10, 0, 0, 26, 0, 0),
(10552, 897302, 'Decent Cracker', 21, 83, 41, 1, 1, 0),
(10553, 897302, 'Decent Firewall', 20, 63, 30, 4, 1, 0),
(10554, 897302, 'Generic Seeker', 19, 41, 20, 6, 0, 0),
(10555, 897302, 'Decent Hidder', 20, 45, 22, 5, 0, 0),
(10556, 897302, 'Decent Spam', 20, 36, 18, 8, 0, 0),
(10557, 897302, 'Decent Anti-Virus', 20, 48, 23, 7, 0, 0),
(10558, 897302, 'Decent Miner', 20, 63, 30, 20, 0, 0),
(10559, 897302, 'Decent Warez', 20, 36, 18, 9, 0, 0),
(10560, 897303, 'Big Hasher', 75, 1058, 623, 2, 1, 0),
(10561, 897303, 'riddle', 10, 0, 0, 26, 0, 0),
(10562, 897303, 'Amazing Cracker', 80, 1316, 778, 1, 1, 0),
(10563, 897303, 'Advanced Firewall', 50, 413, 235, 4, 1, 0),
(10564, 897303, 'Big Seeker', 75, 690, 407, 6, 0, 0),
(10565, 897303, 'Big Hidder', 75, 690, 407, 5, 0, 0),
(10566, 897303, 'Advanced SSH Exploit', 50, 374, 213, 14, 0, 0),
(10567, 897303, 'Advanced FTP Exploit', 50, 374, 213, 13, 0, 0),
(10568, 897303, 'Intermediate Analyzer', 30, 142, 78, 16, 0, 0),
(10569, 897304, 'Competent SSH Exploit', 45, 299, 176, 14, 0, 0),
(10570, 897304, 'Decent FTP Exploit', 20, 57, 28, 13, 0, 0),
(10571, 897304, 'Fotoshop CS6', 30, 142, 78, 17, 0, 0),
(10572, 897304, 'Decent Analyzer', 20, 63, 30, 16, 0, 0),
(10573, 897304, 'Advanced Hasher', 50, 452, 257, 2, 1, 0),
(10574, 897304, 'riddle', 10, 0, 0, 26, 0, 0),
(10575, 897304, 'Advanced Cracker', 53, 555, 318, 1, 1, 0),
(10576, 897304, 'Intermediate Firewall', 36, 207, 118, 4, 1, 0),
(10577, 897304, 'Advanced Seeker', 50, 295, 168, 6, 0, 0),
(10578, 897304, 'Advanced Hidder', 50, 295, 168, 5, 0, 0),
(10579, 897304, 'Advanced Spam', 50, 236, 134, 8, 0, 0),
(10580, 897304, 'Basic Nmap', 10, 23, 8, 15, 0, 0),
(10581, 897304, 'Advanced Miner', 50, 413, 235, 20, 0, 0),
(10582, 897304, 'Advanced Warez', 50, 236, 134, 9, 0, 0),
(10583, 897305, 'Super Hasher', 100, 1890, 1110, 2, 1, 0),
(10584, 897305, 'riddle', 10, 0, 0, 26, 0, 0),
(10585, 897305, 'Super Cracker', 110, 2230, 1350, 1, 1, 0),
(10586, 897305, 'Big Firewall', 70, 837, 490, 4, 1, 0),
(10587, 897305, 'Super Seeker', 100, 1250, 550, 6, 0, 0),
(10588, 897305, 'Super Hidder', 100, 1250, 550, 5, 0, 0),
(10589, 897305, 'Super Miner', 100, 1730, 970, 20, 0, 0),
(10590, 897305, 'Super Warez', 100, 1010, 340, 9, 0, 0),
(10591, 897305, 'Big SSH Exploit', 75, 874, 515, 14, 0, 0),
(10592, 897305, 'Big FTP Exploit', 70, 757, 444, 13, 0, 0),
(10593, 897306, 'Ultimate Hasher', 200, 5540, 3980, 2, 1, 0),
(10594, 897354, 'Decent Firewall', 20, 63, 30, 4, 1, 0),
(10595, 897354, 'Decent Hasher', 20, 69, 33, 2, 1, 0),
(10596, 897359, 'Basic Firewall', 10, 23, 8, 4, 1, 0),
(10597, 897359, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10598, 897359, 'Basic Port Scan', 10, 23, 8, 3, 0, 0),
(10599, 897359, 'Basic Cracker', 10, 28, 9, 1, 1, 0),
(10600, 897359, 'Basic Seeker', 10, 17, 6, 6, 0, 0),
(10601, 897359, 'Basic Hidder', 10, 17, 6, 5, 0, 0),
(10602, 897359, 'Basic FTP Exploit', 10, 21, 7, 13, 0, 0),
(10603, 897359, 'Basic Spam', 10, 14, 5, 8, 0, 0),
(10604, 897359, 'Basic Collector', 10, 16, 5, 11, 0, 0),
(10605, 897359, 'Basic SSH Exploit', 10, 21, 7, 14, 0, 0),
(10606, 897356, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10607, 897355, 'Advanced Firewall', 50, 413, 235, 4, 1, 0),
(10608, 897355, 'Advanced Hasher', 50, 452, 257, 2, 1, 0),
(10609, 897355, 'Super Miner', 100, 1730, 970, 20, 0, 0),
(10610, 897360, 'Super Firewall', 100, 1730, 970, 4, 1, 0),
(10611, 897360, 'Super Hasher', 100, 1890, 1110, 2, 1, 0),
(10612, 897361, 'Intermediate Firewall', 35, 195, 110, 4, 1, 0),
(10613, 897361, 'Advanced Hasher', 50, 452, 257, 2, 1, 0),
(10614, 897362, 'Big Firewall', 75, 966, 569, 4, 1, 0),
(10615, 897362, 'Super Hasher', 100, 1890, 1110, 2, 1, 0),
(10616, 897363, 'Decent Firewall', 25, 98, 51, 4, 1, 0),
(10617, 897363, 'Decent Hasher', 25, 107, 56, 2, 1, 0),
(10618, 897363, 'Winblows 8.1', 20, 63, 30, 17, 0, 0),
(10619, 897363, 'F.L.I.E.N.D.S', 10, 23, 8, 17, 0, 0),
(10620, 897363, 'Fotoshop CS6', 30, 142, 78, 17, 0, 0),
(10621, 897364, 'Generic Firewall', 15, 39, 16, 4, 1, 0),
(10622, 897364, 'Generic Hasher', 15, 42, 17, 2, 1, 0),
(10623, 897365, 'Competent Firewall', 40, 258, 149, 4, 1, 0),
(10624, 897365, 'Competent Hasher', 40, 283, 163, 2, 1, 0),
(10625, 897366, 'Decent Firewall', 25, 98, 51, 4, 1, 0),
(10626, 897366, 'Decent Hasher', 25, 107, 56, 2, 1, 0),
(10627, 897367, 'Amazing Firewall', 80, 1106, 653, 4, 1, 0),
(10628, 897367, 'Amazing Hasher', 80, 1211, 715, 2, 1, 0),
(10629, 897368, 'Advanced Firewall', 60, 606, 351, 4, 1, 0),
(10630, 897368, 'Advanced Hasher', 60, 663, 384, 2, 1, 0),
(10631, 897369, 'Generic Cracker', 19, 69, 32, 1, 1, 0),
(10632, 897369, 'Generic Hasher', 17, 52, 23, 2, 1, 0),
(10633, 897369, 'Basic Spam', 11, 15, 5, 8, 0, 0),
(10634, 897369, 'Generic Firewall', 17, 47, 21, 4, 1, 0),
(10635, 897370, 'Decent Cracker', 27, 136, 73, 1, 1, 0),
(10636, 897370, 'Decent Hasher', 20, 69, 33, 2, 1, 0),
(10637, 897370, 'Generic Firewall', 17, 47, 21, 4, 1, 0),
(10638, 897371, 'Decent Cracker', 25, 116, 61, 1, 1, 0),
(10639, 897371, 'Decent Hasher', 27, 125, 67, 2, 1, 0),
(10640, 897371, 'Decent Warez', 20, 36, 18, 9, 0, 0),
(10641, 897371, 'Decent Firewall', 22, 76, 38, 4, 1, 0),
(10642, 897371, 'Decent FTP Exploit', 25, 89, 46, 13, 0, 0),
(10643, 897372, 'Generic Cracker', 18, 62, 28, 1, 1, 0),
(10644, 897372, 'Generic Hasher', 17, 52, 23, 2, 1, 0),
(10645, 897372, 'Generic Spam', 15, 22, 9, 8, 0, 0),
(10646, 897372, 'Decent Firewall', 25, 98, 51, 4, 1, 0),
(10647, 897372, 'Decent Anti-Virus', 23, 63, 32, 7, 0, 0),
(10648, 897372, 'Decent Hidder', 22, 54, 27, 5, 0, 0),
(10649, 897373, 'Generic Cracker', 17, 56, 25, 1, 1, 0),
(10650, 897373, 'Generic Hasher', 19, 63, 30, 2, 1, 0),
(10651, 897373, 'Decent Spam', 20, 36, 18, 8, 0, 0),
(10652, 897373, 'Generic Firewall', 17, 47, 21, 4, 1, 0),
(10653, 897373, 'Basic Port Scan', 10, 23, 8, 3, 0, 0),
(10654, 897373, 'Decent FTP Exploit', 25, 89, 46, 13, 0, 0),
(10655, 897374, 'Decent Cracker', 26, 126, 66, 1, 1, 0),
(10656, 897374, 'Generic Hasher', 19, 63, 30, 2, 1, 0),
(10657, 897374, 'Decent Firewall', 20, 63, 30, 4, 1, 0),
(10658, 897375, 'Generic Cracker', 17, 56, 25, 1, 1, 0),
(10659, 897375, 'Basic Hasher', 14, 38, 15, 2, 1, 0),
(10660, 897375, 'Basic Firewall', 13, 31, 12, 4, 1, 0),
(10661, 897375, 'Generic FTP Exploit', 15, 35, 15, 13, 0, 0),
(10662, 897375, 'Generic Miner', 15, 39, 16, 20, 0, 0),
(10663, 897375, 'Basic SSH Exploit', 11, 23, 8, 14, 0, 0),
(10664, 897376, 'Basic Cracker', 11, 30, 10, 1, 1, 0),
(10665, 897376, 'Basic Hasher', 12, 31, 11, 2, 1, 0),
(10666, 897376, 'Decent Spam', 20, 36, 18, 8, 0, 0),
(10667, 897376, 'Basic Firewall', 10, 23, 8, 4, 1, 0),
(10668, 897376, 'Basic SSH Exploit', 13, 28, 11, 14, 0, 0),
(10669, 897376, 'Basic FTP Exploit', 12, 26, 9, 13, 0, 0),
(10670, 897376, 'Basic Warez', 10, 14, 5, 9, 0, 0),
(10671, 897376, 'Basic Port Scan', 10, 23, 8, 3, 0, 0),
(10672, 897377, 'Basic Cracker', 13, 37, 14, 1, 1, 0),
(10673, 897377, 'Basic Hasher', 11, 28, 10, 2, 1, 0),
(10674, 897377, 'Basic Hidder', 14, 25, 10, 5, 0, 0),
(10675, 897377, 'Basic Firewall', 12, 28, 10, 4, 1, 0),
(10676, 897377, 'Basic Spam', 12, 16, 6, 8, 0, 0),
(10677, 897377, 'Basic Seeker', 12, 20, 7, 6, 0, 0),
(10678, 897377, 'Basic FTP Exploit', 11, 23, 8, 13, 0, 0),
(10679, 897378, 'Basic Cracker', 13, 37, 14, 1, 1, 0),
(10680, 897378, 'Generic Hasher', 17, 52, 23, 2, 1, 0),
(10681, 897378, 'Decent Miner', 20, 63, 30, 20, 0, 0),
(10682, 897378, 'Basic Firewall', 14, 35, 14, 4, 1, 0),
(10683, 897378, 'Generic Hidder', 16, 31, 13, 5, 0, 0),
(10684, 897378, 'Generic Hidder', 16, 31, 13, 5, 0, 0),
(10685, 897378, 'Basic Hidder', 13, 23, 9, 5, 0, 0),
(10686, 897378, 'Generic Spam', 15, 22, 9, 8, 0, 0),
(10687, 897379, 'Basic Cracker', 14, 41, 16, 1, 1, 0),
(10688, 897379, 'Basic Hasher', 13, 34, 13, 2, 1, 0),
(10689, 897379, 'Basic Spam', 12, 16, 6, 8, 0, 0),
(10690, 897379, 'Generic Firewall', 17, 47, 21, 4, 1, 0),
(10691, 897379, 'Basic Port Scan', 10, 23, 8, 3, 0, 0),
(10692, 897379, 'Basic FTP Exploit', 12, 26, 9, 13, 0, 0),
(10693, 897379, 'Basic Seeker', 12, 20, 7, 6, 0, 0),
(10694, 897379, 'Basic Warez', 13, 18, 7, 9, 0, 0),
(10695, 897379, 'Basic Hidder', 11, 18, 6, 5, 0, 0),
(10696, 897380, 'Decent Cracker', 20, 75, 36, 1, 1, 0),
(10697, 897380, 'Decent Hasher', 22, 83, 42, 2, 1, 0),
(10698, 897380, 'Generic SSH Exploit', 17, 43, 19, 14, 0, 0),
(10699, 897380, 'Basic Firewall', 10, 23, 8, 4, 1, 0),
(10700, 897380, 'Basic Port Scan', 10, 23, 8, 3, 0, 0),
(10701, 897380, 'Generic FTP Exploit', 16, 39, 17, 13, 0, 0),
(10702, 897381, 'Decent Cracker', 22, 90, 45, 1, 1, 0),
(10703, 897381, 'Generic Hasher', 16, 47, 20, 2, 1, 0),
(10704, 897381, 'Basic Spam', 14, 20, 8, 8, 0, 0),
(10705, 897381, 'Generic Firewall', 19, 58, 27, 4, 1, 0),
(10706, 897381, 'Basic Port Scan', 10, 23, 8, 3, 0, 0),
(10707, 897381, 'Basic SSH Exploit', 14, 32, 13, 14, 0, 0),
(10708, 897381, 'Generic Hidder', 18, 38, 17, 5, 0, 0),
(10709, 897382, 'Decent Cracker', 27, 136, 73, 1, 1, 0),
(10710, 897382, 'Decent Hasher', 28, 135, 73, 2, 1, 0),
(10711, 897382, 'Decent Firewall', 24, 90, 46, 4, 1, 0),
(10712, 897383, 'Decent Cracker', 23, 99, 50, 1, 1, 0),
(10713, 897383, 'Decent Hasher', 25, 107, 56, 2, 1, 0),
(10714, 897383, 'Generic Warez', 15, 22, 9, 9, 0, 0),
(10715, 897383, 'Decent Firewall', 20, 63, 30, 4, 1, 0),
(10716, 897383, 'Basic Anti-Virus', 13, 24, 9, 7, 0, 0),
(10717, 897383, 'Generic FTP Exploit', 16, 39, 17, 13, 0, 0),
(10718, 897384, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10719, 897385, 'Intermediate Cracker', 35, 232, 131, 1, 1, 0),
(10720, 897385, 'Intermediate Hasher', 33, 189, 106, 2, 1, 0),
(10721, 897385, 'Decent Spam', 22, 44, 22, 8, 0, 0),
(10722, 897385, 'Decent Firewall', 28, 123, 66, 4, 1, 0),
(10723, 897385, 'Basic Hidder', 12, 20, 7, 5, 0, 0),
(10724, 897386, 'Advanced Cracker', 59, 696, 403, 1, 1, 0),
(10725, 897386, 'Competent Hasher', 42, 313, 182, 2, 1, 0),
(10726, 897386, 'Intermediate Spam', 39, 140, 81, 8, 0, 0),
(10727, 897386, 'Intermediate Firewall', 34, 184, 103, 4, 1, 0),
(10728, 897386, 'Intermediate Seeker', 36, 148, 84, 6, 0, 0),
(10729, 897386, 'Advanced FTP Exploit', 50, 374, 213, 13, 0, 0),
(10730, 897387, 'Competent Cracker', 40, 307, 178, 1, 1, 0),
(10731, 897387, 'Intermediate Hasher', 30, 155, 85, 2, 1, 0),
(10732, 897387, 'Decent Spam', 24, 52, 27, 8, 0, 0),
(10733, 897387, 'Intermediate Firewall', 37, 219, 125, 4, 1, 0),
(10734, 897387, 'Intermediate SSH Exploit', 33, 156, 88, 14, 0, 0),
(10735, 897387, 'Decent FTP Exploit', 28, 111, 60, 13, 0, 0),
(10736, 897387, 'Decent Seeker', 27, 82, 44, 6, 0, 0),
(10737, 897388, 'Competent Cracker', 44, 375, 220, 1, 1, 0),
(10738, 897388, 'Intermediate Hasher', 38, 254, 146, 2, 1, 0),
(10739, 897388, 'Generic Spam', 19, 33, 16, 8, 0, 0),
(10740, 897388, 'Decent Firewall', 28, 123, 66, 4, 1, 0),
(10741, 897388, 'Intermediate SSH Exploit', 33, 156, 88, 14, 0, 0),
(10742, 897388, 'Competent FTP Exploit', 40, 234, 135, 13, 0, 0),
(10743, 897389, 'Intermediate Cracker', 38, 276, 158, 1, 1, 0),
(10744, 897389, 'Advanced Hasher', 54, 532, 305, 2, 1, 0),
(10745, 897389, 'Decent Spam', 20, 36, 18, 8, 0, 0),
(10746, 897389, 'Competent Firewall', 40, 258, 149, 4, 1, 0),
(10747, 897390, 'Advanced Cracker', 52, 534, 305, 1, 1, 0),
(10748, 897390, 'Advanced Hasher', 56, 574, 330, 2, 1, 0),
(10749, 897390, 'Intermediate Firewall', 30, 142, 78, 4, 1, 0),
(10750, 897391, 'Advanced Cracker', 56, 624, 359, 1, 1, 0),
(10751, 897391, 'Advanced Hasher', 52, 491, 281, 2, 1, 0),
(10752, 897391, 'Intermediate Spam', 39, 140, 81, 8, 0, 0),
(10753, 897391, 'Intermediate Firewall', 36, 207, 118, 4, 1, 0),
(10754, 897391, 'Basic Port Scan', 10, 23, 8, 3, 0, 0),
(10755, 897391, 'Intermediate FTP Exploit', 30, 128, 70, 13, 0, 0),
(10756, 897391, 'Decent Seeker', 29, 95, 52, 6, 0, 0),
(10757, 897391, 'Competent SSH Exploit', 46, 313, 185, 14, 0, 0),
(10758, 897391, 'Intermediate Hidder', 36, 148, 84, 5, 0, 0),
(10759, 897392, 'Basic Cracker', 14, 41, 16, 1, 1, 0),
(10760, 897392, 'Basic Hasher', 13, 34, 13, 2, 1, 0),
(10761, 897392, 'Basic Spam', 12, 16, 6, 8, 0, 0),
(10762, 897392, 'Generic Firewall', 17, 47, 21, 4, 1, 0),
(10763, 897392, 'Basic Port Scan', 10, 23, 8, 3, 0, 0),
(10764, 897392, 'Basic FTP Exploit', 12, 26, 9, 13, 0, 0),
(10765, 897392, 'Basic Seeker', 12, 20, 7, 6, 0, 0),
(10766, 897392, 'Basic Warez', 13, 18, 7, 9, 0, 0),
(10767, 897392, 'Basic Hidder', 11, 18, 6, 5, 0, 0),
(10768, 897393, 'Competent Cracker', 40, 307, 178, 1, 1, 0),
(10769, 897393, 'Intermediate Hasher', 36, 227, 129, 2, 1, 0),
(10770, 897393, 'Competent Warez', 42, 164, 95, 9, 0, 0),
(10771, 897393, 'Advanced Firewall', 59, 585, 338, 4, 1, 0),
(10772, 897393, 'Advanced FTP Exploit', 63, 607, 353, 13, 0, 0),
(10773, 897394, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10774, 897395, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10775, 897396, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10776, 897397, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10777, 897398, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10778, 897399, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10779, 897400, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10780, 897401, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10781, 897402, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10782, 897403, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10783, 897307, 'puzzle', 0, 0, 0, 26, 0, 0),
(10784, 897307, 'Super Firewall', 100, 1730, 970, 4, 1, 0),
(10785, 897307, 'Amazing FTP Exploit', 87, 1192, 707, 13, 0, 0),
(10786, 897307, 'Epic Hidder', 150, 1900, 850, 5, 0, 0),
(10787, 897307, 'Epic Cracker', 150, 3450, 2250, 1, 1, 0),
(10788, 897307, 'Ultra Anti-Virus', 140, 1846, 852, 7, 0, 0),
(10789, 897307, 'Advanced SSH Exploit', 62, 587, 341, 14, 0, 0),
(10790, 897307, 'Ultra Hasher', 140, 2798, 1706, 2, 1, 0),
(10791, 897307, 'Super Seeker', 104, 1275, 547, 6, 0, 0),
(10792, 897308, 'puzzle', 0, 0, 0, 26, 0, 0),
(10793, 897308, 'Super Firewall', 110, 1866, 1030, 4, 1, 0),
(10794, 897308, 'Amazing FTP Exploit', 88, 1220, 724, 13, 0, 0),
(10795, 897308, 'Ultra Hidder', 134, 1611, 673, 5, 0, 0),
(10796, 897308, 'Epic Cracker', 160, 3880, 2600, 1, 1, 0),
(10797, 897308, 'Amazing SSH Exploit', 82, 1053, 623, 14, 0, 0),
(10798, 897308, 'Epic Hasher', 150, 3140, 1970, 2, 1, 0),
(10799, 897308, 'Epic Seeker', 150, 1900, 850, 6, 0, 0),
(10800, 897308, 'Epic Miner', 150, 2830, 1690, 20, 0, 0),
(10801, 897309, 'puzzle', 0, 0, 0, 26, 0, 0),
(10802, 897309, 'Intermediate Firewall', 32, 162, 90, 4, 1, 0),
(10803, 897309, 'Intermediate FTP Exploit', 36, 187, 107, 13, 0, 0),
(10804, 897309, 'Intermediate Hidder', 37, 157, 90, 5, 0, 0),
(10805, 897309, 'Competent Cracker', 44, 375, 220, 1, 1, 0),
(10806, 897309, 'Decent SSH Exploit', 24, 82, 42, 14, 0, 0),
(10807, 897309, 'Competent Hasher', 42, 313, 182, 2, 1, 0),
(10808, 897309, 'Intermediate Seeker', 34, 131, 74, 6, 0, 0),
(10809, 897309, 'Competent Miner', 40, 258, 149, 20, 0, 0),
(10810, 897310, 'puzzle', 0, 0, 0, 26, 0, 0),
(10811, 897310, 'Intermediate Firewall', 34, 184, 103, 4, 1, 0),
(10812, 897310, 'Intermediate FTP Exploit', 34, 166, 94, 13, 0, 0),
(10813, 897310, 'Competent Hidder', 40, 185, 107, 5, 0, 0),
(10814, 897310, 'Competent Spam', 45, 189, 111, 8, 0, 0),
(10815, 897310, 'Competent Cracker', 46, 412, 243, 1, 1, 0),
(10816, 897310, 'Intermediate SSH Exploit', 30, 128, 70, 14, 0, 0),
(10817, 897310, 'Competent Hasher', 44, 345, 202, 2, 1, 0),
(10818, 897310, 'Intermediate Seeker', 37, 157, 90, 6, 0, 0),
(10819, 897311, 'puzzle', 0, 0, 0, 26, 0, 0),
(10820, 897311, 'Intermediate Firewall', 34, 184, 103, 4, 1, 0),
(10821, 897311, 'Intermediate FTP Exploit', 36, 187, 107, 13, 0, 0),
(10822, 897311, 'Competent Hidder', 46, 248, 146, 5, 0, 0),
(10823, 897311, 'Competent Cracker', 48, 451, 267, 1, 1, 0),
(10824, 897311, 'Advanced Anti-Virus', 50, 315, 179, 7, 0, 0),
(10825, 897311, 'Decent SSH Exploit', 20, 57, 28, 14, 0, 0),
(10826, 897311, 'Competent Hasher', 46, 379, 223, 2, 1, 0),
(10827, 897311, 'Competent Seeker', 40, 185, 107, 6, 0, 0),
(10828, 897312, 'puzzle', 0, 0, 0, 26, 0, 0),
(10829, 897312, 'Intermediate Firewall', 36, 207, 118, 4, 1, 0),
(10830, 897312, 'Intermediate FTP Exploit', 30, 128, 70, 13, 0, 0),
(10831, 897312, 'Competent Hidder', 44, 225, 132, 5, 0, 0),
(10832, 897312, 'Advanced Collector', 50, 275, 157, 11, 0, 0),
(10833, 897312, 'Advanced Cracker', 50, 491, 280, 1, 1, 0),
(10834, 897312, 'Intermediate SSH Exploit', 30, 128, 70, 14, 0, 0),
(10835, 897312, 'Competent Hasher', 48, 415, 245, 2, 1, 0),
(10836, 897312, 'Competent Seeker', 40, 185, 107, 6, 0, 0),
(10837, 897313, 'puzzle', 0, 0, 0, 26, 0, 0),
(10838, 897313, 'Decent Firewall', 28, 123, 66, 4, 1, 0),
(10839, 897313, 'Decent FTP Exploit', 23, 75, 38, 13, 0, 0),
(10840, 897313, 'Intermediate Hidder', 33, 123, 69, 5, 0, 0),
(10841, 897313, 'Intermediate DDoS', 30, 88, 48, 10, 0, 0),
(10842, 897313, 'Intermediate Cracker', 36, 246, 140, 1, 1, 0),
(10843, 897313, 'Generic SSH Exploit', 19, 52, 25, 14, 0, 0),
(10844, 897313, 'Intermediate Breaker', 30, 95, 52, 12, 0, 0),
(10845, 897313, 'Intermediate Hasher', 34, 201, 113, 2, 1, 0),
(10846, 897313, 'Decent Seeker', 27, 82, 44, 6, 0, 0),
(10847, 897314, 'puzzle', 0, 0, 0, 26, 0, 0),
(10848, 897314, 'Intermediate Firewall', 30, 142, 78, 4, 1, 0),
(10849, 897314, 'Decent FTP Exploit', 22, 69, 34, 13, 0, 0),
(10850, 897314, 'Competent Hidder', 40, 185, 107, 5, 0, 0),
(10851, 897314, 'Intermediate Cracker', 38, 276, 158, 1, 1, 0),
(10852, 897314, 'Competent Anti-Virus', 40, 197, 114, 7, 0, 0),
(10853, 897314, 'Decent SSH Exploit', 21, 63, 31, 14, 0, 0),
(10854, 897314, 'Intermediate Hasher', 36, 227, 129, 2, 1, 0),
(10855, 897314, 'Competent Seeker', 40, 185, 107, 6, 0, 0),
(10856, 897315, 'puzzle', 0, 0, 0, 26, 0, 0),
(10857, 897315, 'Intermediate Firewall', 30, 142, 78, 4, 1, 0),
(10858, 897315, 'Intermediate FTP Exploit', 30, 128, 70, 13, 0, 0),
(10859, 897315, 'Intermediate Hidder', 37, 157, 90, 5, 0, 0),
(10860, 897315, 'Competent Collector', 40, 172, 100, 11, 0, 0),
(10861, 897315, 'Competent Spam', 40, 148, 86, 8, 0, 0),
(10862, 897315, 'Competent Cracker', 40, 307, 178, 1, 1, 0),
(10863, 897315, 'Intermediate SSH Exploit', 30, 128, 70, 14, 0, 0),
(10864, 897315, 'Intermediate Hasher', 38, 254, 146, 2, 1, 0),
(10865, 897315, 'Intermediate Seeker', 35, 140, 79, 6, 0, 0),
(10866, 897316, 'puzzle', 0, 0, 0, 26, 0, 0),
(10867, 897316, 'Intermediate Firewall', 32, 162, 90, 4, 1, 0),
(10868, 897316, 'Decent FTP Exploit', 29, 120, 65, 13, 0, 0),
(10869, 897316, 'Decent Hidder', 28, 88, 48, 5, 0, 0),
(10870, 897316, 'Competent Warez', 40, 148, 86, 9, 0, 0),
(10871, 897316, 'Competent Cracker', 42, 340, 198, 1, 1, 0),
(10872, 897316, 'Decent SSH Exploit', 22, 69, 34, 14, 0, 0),
(10873, 897316, 'Competent Hasher', 40, 283, 163, 2, 1, 0),
(10874, 897316, 'Intermediate Seeker', 33, 123, 69, 6, 0, 0),
(10875, 897317, 'puzzle', 0, 0, 0, 26, 0, 0),
(10876, 897317, 'Ultra Firewall', 140, 2526, 1462, 4, 1, 0),
(10877, 897317, 'Super FTP Exploit', 107, 1646, 855, 13, 0, 0),
(10878, 897317, 'Ultra Hidder', 142, 1746, 752, 5, 0, 0),
(10879, 897317, 'Epic Warez', 150, 1435, 430, 9, 0, 0),
(10880, 897317, 'Ultimate Cracker', 190, 5470, 3950, 1, 1, 0),
(10881, 897317, 'Epic Anti-Virus', 150, 2055, 990, 7, 0, 0),
(10882, 897317, 'Ultra SSH Exploit', 124, 1908, 990, 14, 0, 0),
(10883, 897317, 'Ultimate Hasher', 180, 4442, 3038, 2, 1, 0),
(10884, 897317, 'Ultra Seeker', 134, 1611, 673, 6, 0, 0),
(10885, 897318, 'puzzle', 0, 0, 0, 26, 0, 0),
(10886, 897318, 'Epic Firewall', 150, 2830, 1690, 4, 1, 0),
(10887, 897318, 'Ultra FTP Exploit', 127, 1966, 1026, 13, 0, 0),
(10888, 897318, 'Ultra Hidder', 143, 1764, 763, 5, 0, 0),
(10889, 897318, 'Ultimate Cracker', 200, 6100, 4500, 1, 1, 0),
(10890, 897318, 'Amazing SSH Exploit', 95, 1431, 852, 14, 0, 0),
(10891, 897318, 'Ultimate Hasher', 190, 4968, 3487, 2, 1, 0),
(10892, 897318, 'Ultra Seeker', 128, 1522, 626, 6, 0, 0),
(10893, 897319, 'puzzle', 0, 0, 0, 26, 0, 0),
(10894, 897319, 'Ultra Firewall', 120, 2044, 1132, 4, 1, 0),
(10895, 897319, 'Ultra FTP Exploit', 130, 2026, 1064, 13, 0, 0),
(10896, 897319, 'Ultra Hidder', 149, 1880, 837, 5, 0, 0),
(10897, 897319, 'Epic Cracker', 170, 4360, 3000, 1, 1, 0),
(10898, 897319, 'Ultra SSH Exploit', 130, 2026, 1064, 14, 0, 0),
(10899, 897319, 'Epic Breaker', 150, 1745, 711, 12, 0, 0),
(10900, 897319, 'Epic Hasher', 160, 3528, 2280, 2, 1, 0),
(10901, 897319, 'Ultra Seeker', 132, 1580, 656, 6, 0, 0),
(10902, 897320, 'puzzle', 0, 0, 0, 26, 0, 0),
(10903, 897320, 'Ultra Firewall', 130, 2264, 1276, 4, 1, 0),
(10904, 897320, 'Ultra FTP Exploit', 127, 1966, 1026, 13, 0, 0),
(10905, 897320, 'Ultra Hidder', 149, 1880, 837, 5, 0, 0),
(10906, 897320, 'Epic Collector', 150, 1745, 711, 11, 0, 0),
(10907, 897320, 'Epic Spam', 150, 1435, 430, 8, 0, 0),
(10908, 897320, 'Ultimate Cracker', 180, 4890, 3450, 1, 1, 0),
(10909, 897320, 'Super SSH Exploit', 114, 1741, 897, 14, 0, 0),
(10910, 897320, 'Epic Hasher', 170, 3962, 2636, 2, 1, 0),
(10911, 897320, 'Ultra Seeker', 142, 1746, 752, 6, 0, 0),
(10912, 897321, 'puzzle', 0, 0, 0, 26, 0, 0),
(10913, 897321, 'Intermediate Firewall', 39, 245, 141, 4, 1, 0),
(10914, 897321, 'Intermediate FTP Exploit', 36, 187, 107, 13, 0, 0),
(10915, 897321, 'Advanced DDoS', 50, 256, 146, 10, 0, 0),
(10916, 897321, 'Advanced Cracker', 56, 624, 359, 1, 1, 0),
(10917, 897321, 'Competent SSH Exploit', 42, 259, 151, 14, 0, 0),
(10918, 897321, 'Advanced Breaker', 50, 275, 157, 12, 0, 0),
(10919, 897321, 'Advanced Hasher', 53, 511, 293, 2, 1, 0),
(10920, 897322, 'puzzle', 0, 0, 0, 26, 0, 0),
(10921, 897322, 'Intermediate Firewall', 39, 245, 141, 4, 1, 0),
(10922, 897322, 'Competent FTP Exploit', 42, 259, 151, 13, 0, 0),
(10923, 897322, 'Advanced Hidder', 60, 433, 251, 5, 0, 0),
(10924, 897322, 'Advanced Cracker', 59, 696, 403, 1, 1, 0),
(10925, 897322, 'Big Anti-Virus', 70, 638, 374, 7, 0, 0),
(10926, 897322, 'Intermediate SSH Exploit', 33, 156, 88, 14, 0, 0),
(10927, 897322, 'Advanced Hasher', 56, 574, 330, 2, 1, 0),
(10928, 897322, 'Advanced Miner', 60, 606, 351, 20, 0, 0),
(10929, 897323, 'puzzle', 0, 0, 0, 26, 0, 0),
(10930, 897323, 'Amazing Firewall', 90, 1413, 840, 4, 1, 0),
(10931, 897323, 'Super Hidder', 104, 1275, 547, 5, 0, 0),
(10932, 897323, 'Ultra Collector', 120, 1316, 488, 11, 0, 0),
(10933, 897323, 'Ultra Spam', 120, 1108, 304, 8, 0, 0),
(10934, 897323, 'Ultra Cracker', 130, 2740, 1700, 1, 1, 0),
(10935, 897323, 'Ultra Hasher', 120, 2252, 1316, 2, 1, 0),
(10936, 897323, 'Super Seeker', 110, 1320, 550, 6, 0, 0),
(10937, 897324, 'puzzle', 0, 0, 0, 26, 0, 0),
(10938, 897324, 'Amazing Firewall', 90, 1413, 840, 4, 1, 0),
(10939, 897324, 'Amazing FTP Exploit', 90, 1279, 760, 13, 0, 0),
(10940, 897324, 'Amazing Hidder', 98, 1205, 719, 5, 0, 0),
(10941, 897324, 'Ultra Warez', 140, 1302, 364, 9, 0, 0),
(10942, 897324, 'Ultra Cracker', 140, 3070, 1950, 1, 1, 0),
(10943, 897324, 'Amazing SSH Exploit', 90, 1279, 760, 14, 0, 0),
(10944, 897324, 'Ultra Hasher', 130, 2502, 1489, 2, 1, 0),
(10945, 897324, 'Super Seeker', 102, 1262, 548, 6, 0, 0),
(10946, 897325, 'puzzle', 0, 0, 0, 26, 0, 0),
(10947, 897325, 'Basic Firewall', 10, 23, 8, 4, 1, 0),
(10948, 897325, 'Basic FTP Exploit', 10, 21, 7, 13, 0, 0),
(10949, 897325, 'Basic Hidder', 10, 17, 6, 5, 0, 0),
(10950, 897325, 'Basic Cracker', 11, 30, 10, 1, 1, 0),
(10951, 897325, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10952, 897326, 'puzzle', 0, 0, 0, 26, 0, 0),
(10953, 897326, 'Basic Firewall', 12, 28, 10, 4, 1, 0),
(10954, 897326, 'Basic FTP Exploit', 11, 23, 8, 13, 0, 0),
(10955, 897326, 'Basic Hidder', 11, 18, 6, 5, 0, 0),
(10956, 897326, 'Basic DDoS', 10, 15, 5, 10, 0, 0),
(10957, 897326, 'Basic Cracker', 13, 37, 14, 1, 1, 0),
(10958, 897326, 'Basic SSH Exploit', 10, 21, 7, 14, 0, 0),
(10959, 897326, 'Basic Breaker', 10, 16, 5, 12, 0, 0),
(10960, 897326, 'Basic Hasher', 12, 31, 11, 2, 1, 0),
(10961, 897326, 'Basic Seeker', 10, 17, 6, 6, 0, 0),
(10962, 897327, 'puzzle', 0, 0, 0, 26, 0, 0),
(10963, 897327, 'Basic Firewall', 10, 23, 8, 4, 1, 0),
(10964, 897327, 'Basic Warez', 10, 14, 5, 9, 0, 0),
(10965, 897327, 'F.L.I.E.N.D.S', 10, 23, 8, 17, 0, 0),
(10966, 897327, 'Basic Cracker', 12, 34, 12, 1, 1, 0),
(10967, 897327, 'Basic SSH Exploit', 10, 21, 7, 14, 0, 0),
(10968, 897327, 'Basic Hasher', 11, 28, 10, 2, 1, 0),
(10969, 897327, 'Basic Seeker', 12, 20, 7, 6, 0, 0),
(10970, 897328, 'puzzle', 0, 0, 0, 26, 0, 0),
(10971, 897328, 'Basic Firewall', 14, 35, 14, 4, 1, 0),
(10972, 897328, 'Generic FTP Exploit', 18, 47, 22, 13, 0, 0),
(10973, 897328, 'Basic Hidder', 13, 23, 9, 5, 0, 0),
(10974, 897328, 'Generic Collector', 15, 26, 11, 11, 0, 0),
(10975, 897328, 'Generic Spam', 15, 22, 9, 8, 0, 0),
(10976, 897328, 'Generic Cracker', 15, 46, 19, 1, 1, 0),
(10977, 897328, 'Generic Anti-Virus', 15, 30, 12, 7, 0, 0),
(10978, 897328, 'Basic Hasher', 14, 38, 15, 2, 1, 0),
(10979, 897328, 'Basic Seeker', 10, 17, 6, 6, 0, 0),
(10980, 897329, 'puzzle', 0, 0, 0, 26, 0, 0),
(10981, 897329, 'Basic Firewall', 12, 28, 10, 4, 1, 0),
(10982, 897329, 'Basic Hidder', 14, 25, 10, 5, 0, 0),
(10983, 897329, 'Basic Cracker', 14, 41, 16, 1, 1, 0),
(10984, 897329, 'Basic SSH Exploit', 11, 23, 8, 14, 0, 0),
(10985, 897329, 'Basic Hasher', 13, 34, 13, 2, 1, 0),
(10986, 897329, 'Basic Seeker', 11, 18, 6, 6, 0, 0),
(10987, 897329, 'Basic Miner', 13, 31, 12, 20, 0, 0),
(10988, 897330, 'puzzle', 0, 0, 0, 26, 0, 0),
(10989, 897330, 'Generic Firewall', 16, 43, 18, 4, 1, 0),
(10990, 897330, 'Basic FTP Exploit', 13, 28, 11, 13, 0, 0),
(10991, 897330, 'Generic Warez', 15, 22, 9, 9, 0, 0),
(10992, 897330, 'Generic Cracker', 17, 56, 25, 1, 1, 0),
(10993, 897330, 'Generic Anti-Virus', 15, 30, 12, 7, 0, 0),
(10994, 897330, 'Basic SSH Exploit', 12, 26, 9, 14, 0, 0),
(10995, 897330, 'Generic Hasher', 16, 47, 20, 2, 1, 0),
(10996, 897330, 'Generic Miner', 16, 43, 18, 20, 0, 0),
(10997, 897331, 'puzzle', 0, 0, 0, 26, 0, 0),
(10998, 897331, 'Basic Firewall', 14, 35, 14, 4, 1, 0),
(10999, 897331, 'Basic FTP Exploit', 10, 21, 7, 13, 0, 0),
(11000, 897331, 'Generic Hidder', 15, 28, 12, 5, 0, 0),
(11001, 897331, 'Generic Cracker', 16, 51, 22, 1, 1, 0),
(11002, 897331, 'Basic Anti-Virus', 12, 22, 8, 7, 0, 0),
(11003, 897331, 'Basic SSH Exploit', 14, 32, 13, 14, 0, 0),
(11004, 897331, 'Generic Hasher', 15, 42, 17, 2, 1, 0),
(11005, 897331, 'Generic Seeker', 15, 28, 12, 6, 0, 0),
(11006, 897332, 'puzzle', 0, 0, 0, 26, 0, 0),
(11007, 897332, 'Generic Firewall', 18, 52, 24, 4, 1, 0),
(11008, 897332, 'Generic FTP Exploit', 17, 43, 19, 13, 0, 0),
(11009, 897332, 'Decent Collector', 20, 42, 20, 11, 0, 0),
(11010, 897332, 'Generic Spam', 17, 27, 12, 8, 0, 0),
(11011, 897332, 'Generic Cracker', 19, 69, 32, 1, 1, 0),
(11012, 897332, 'Basic Anti-Virus', 14, 27, 11, 7, 0, 0),
(11013, 897332, 'Basic SSH Exploit', 13, 28, 11, 14, 0, 0),
(11014, 897332, 'Generic Hasher', 18, 57, 26, 2, 1, 0),
(11015, 897332, 'Decent Seeker', 20, 45, 22, 6, 0, 0),
(11016, 897333, 'puzzle', 0, 0, 0, 26, 0, 0),
(11017, 897333, 'Generic Firewall', 16, 43, 18, 4, 1, 0),
(11018, 897333, 'Basic FTP Exploit', 10, 21, 7, 13, 0, 0),
(11019, 897333, 'Generic Hidder', 17, 34, 15, 5, 0, 0),
(11020, 897333, 'Generic DDoS', 15, 24, 10, 10, 0, 0),
(11021, 897333, 'Basic Spam', 14, 20, 8, 8, 0, 0),
(11022, 897333, 'Generic Cracker', 18, 62, 28, 1, 1, 0),
(11023, 897333, 'Basic SSH Exploit', 13, 28, 11, 14, 0, 0),
(11024, 897333, 'Generic Hasher', 17, 52, 23, 2, 1, 0),
(11025, 897333, 'Basic Seeker', 13, 23, 9, 6, 0, 0),
(11026, 897334, 'puzzle', 0, 0, 0, 26, 0, 0),
(11027, 897334, 'Amazing Firewall', 80, 1106, 653, 4, 1, 0),
(11028, 897334, 'Big FTP Exploit', 76, 899, 530, 13, 0, 0),
(11029, 897334, 'Super Hidder', 110, 1320, 550, 5, 0, 0),
(11030, 897334, 'Ultra Cracker', 120, 2460, 1500, 1, 1, 0),
(11031, 897334, 'Ultra Anti-Virus', 120, 1524, 672, 7, 0, 0),
(11032, 897334, 'Big SSH Exploit', 69, 735, 430, 14, 0, 0),
(11033, 897334, 'Super Hasher', 110, 2048, 1190, 2, 1, 0),
(11034, 897334, 'Amazing Seeker', 97, 1179, 703, 6, 0, 0),
(11035, 897335, 'puzzle', 0, 0, 0, 26, 0, 0),
(11036, 897335, 'Advanced Firewall', 60, 606, 351, 4, 1, 0),
(11037, 897335, 'Amazing FTP Exploit', 80, 1001, 591, 13, 0, 0),
(11038, 897335, 'Big Hidder', 68, 563, 329, 5, 0, 0),
(11039, 897335, 'Big DDoS', 73, 566, 332, 10, 0, 0),
(11040, 897335, 'Super Cracker', 100, 2050, 1250, 1, 1, 0),
(11041, 897335, 'Advanced SSH Exploit', 59, 529, 306, 14, 0, 0),
(11042, 897335, 'Super Breaker', 100, 1170, 481, 12, 0, 0),
(11043, 897335, 'Amazing Hasher', 95, 1732, 1031, 2, 1, 0),
(11044, 897335, 'Amazing Seeker', 96, 1154, 688, 6, 0, 0),
(11045, 897336, 'puzzle', 0, 0, 0, 26, 0, 0),
(11046, 897336, 'Decent Firewall', 20, 63, 30, 4, 1, 0),
(11047, 897336, 'Decent FTP Exploit', 26, 96, 51, 13, 0, 0),
(11048, 897336, 'Generic Hidder', 18, 38, 17, 5, 0, 0),
(11049, 897336, 'Decent DDoS', 20, 39, 19, 10, 0, 0),
(11050, 897336, 'Decent Cracker', 22, 90, 45, 1, 1, 0),
(11051, 897336, 'Generic SSH Exploit', 19, 52, 25, 14, 0, 0),
(11052, 897336, 'Decent Hasher', 21, 76, 37, 2, 1, 0),
(11053, 897337, 'puzzle', 0, 0, 0, 26, 0, 0),
(11054, 897337, 'Generic Firewall', 18, 52, 24, 4, 1, 0),
(11055, 897337, 'Decent FTP Exploit', 20, 57, 28, 13, 0, 0),
(11056, 897337, 'Generic Hidder', 15, 28, 12, 5, 0, 0),
(11057, 897337, 'Basic Spam', 14, 20, 8, 8, 0, 0),
(11058, 897337, 'Decent Cracker', 20, 75, 36, 1, 1, 0),
(11059, 897337, 'Basic SSH Exploit', 12, 26, 9, 14, 0, 0),
(11060, 897337, 'Generic Hasher', 19, 63, 30, 2, 1, 0),
(11061, 897337, 'Generic Seeker', 16, 31, 13, 6, 0, 0),
(11062, 897338, 'puzzle', 0, 0, 0, 26, 0, 0),
(11063, 897338, 'Decent Firewall', 22, 76, 38, 4, 1, 0),
(11064, 897338, 'Decent FTP Exploit', 24, 82, 42, 13, 0, 0),
(11065, 897338, 'Decent Spam', 26, 61, 32, 8, 0, 0),
(11066, 897338, 'Decent Cracker', 24, 107, 55, 1, 1, 0),
(11067, 897338, 'Decent SSH Exploit', 22, 69, 34, 14, 0, 0),
(11068, 897338, 'Decent Hasher', 23, 91, 46, 2, 1, 0),
(11069, 897338, 'Intermediate Seeker', 30, 101, 56, 6, 0, 0),
(11070, 897339, 'puzzle', 0, 0, 0, 26, 0, 0),
(11071, 897339, 'Decent Firewall', 20, 63, 30, 4, 1, 0),
(11072, 897339, 'Decent Hidder', 25, 70, 37, 5, 0, 0),
(11073, 897339, 'Decent Cracker', 23, 99, 50, 1, 1, 0),
(11074, 897339, 'Decent Anti-Virus', 25, 75, 39, 7, 0, 0),
(11075, 897339, 'Decent SSH Exploit', 24, 82, 42, 14, 0, 0),
(11076, 897339, 'Decent Hasher', 22, 83, 42, 2, 1, 0),
(11077, 897340, 'puzzle', 0, 0, 0, 26, 0, 0),
(11078, 897340, 'Decent Firewall', 24, 90, 46, 4, 1, 0),
(11079, 897340, 'Decent FTP Exploit', 23, 75, 38, 13, 0, 0),
(11080, 897340, 'Basic Hidder', 10, 17, 6, 5, 0, 0),
(11081, 897340, 'Decent Collector', 25, 65, 34, 11, 0, 0),
(11082, 897340, 'Decent Cracker', 27, 136, 73, 1, 1, 0),
(11083, 897340, 'Decent Hasher', 25, 107, 56, 2, 1, 0),
(11084, 897340, 'Generic Seeker', 15, 28, 12, 6, 0, 0),
(11085, 897340, 'Intermediate Miner', 30, 142, 78, 20, 0, 0),
(11086, 897341, 'puzzle', 0, 0, 0, 26, 0, 0),
(11087, 897341, 'Decent Firewall', 22, 76, 38, 4, 1, 0),
(11088, 897341, 'Decent FTP Exploit', 22, 69, 34, 13, 0, 0),
(11089, 897341, 'Generic Hidder', 19, 41, 20, 5, 0, 0),
(11090, 897341, 'Decent Warez', 25, 56, 29, 9, 0, 0),
(11091, 897341, 'Decent Cracker', 25, 116, 61, 1, 1, 0),
(11092, 897341, 'Generic SSH Exploit', 17, 43, 19, 14, 0, 0),
(11093, 897341, 'Decent Hasher', 24, 99, 51, 2, 1, 0),
(11094, 897341, 'Decent Seeker', 26, 76, 40, 6, 0, 0),
(11095, 897342, 'puzzle', 0, 0, 0, 26, 0, 0),
(11096, 897342, 'Decent Firewall', 26, 106, 56, 4, 1, 0),
(11097, 897342, 'Generic FTP Exploit', 16, 39, 17, 13, 0, 0),
(11098, 897342, 'Decent Hidder', 29, 95, 52, 5, 0, 0),
(11099, 897342, 'Intermediate Warez', 33, 99, 55, 9, 0, 0),
(11100, 897342, 'Intermediate Cracker', 30, 169, 92, 1, 1, 0),
(11101, 897342, 'Decent SSH Exploit', 20, 57, 28, 14, 0, 0),
(11102, 897342, 'Decent Hasher', 29, 145, 79, 2, 1, 0),
(11103, 897342, 'Intermediate Seeker', 36, 148, 84, 6, 0, 0),
(11104, 897343, 'puzzle', 0, 0, 0, 26, 0, 0),
(11105, 897343, 'Decent Firewall', 24, 90, 46, 4, 1, 0),
(11106, 897343, 'Generic FTP Exploit', 18, 47, 22, 13, 0, 0),
(11107, 897343, 'Intermediate Hidder', 33, 123, 69, 5, 0, 0),
(11108, 897343, 'Intermediate Spam', 30, 81, 45, 8, 0, 0),
(11109, 897343, 'Decent Cracker', 29, 157, 86, 1, 1, 0),
(11110, 897343, 'Intermediate Anti-Virus', 30, 108, 59, 7, 0, 0),
(11111, 897343, 'Decent SSH Exploit', 24, 82, 42, 14, 0, 0),
(11112, 897343, 'Decent Hasher', 27, 125, 67, 2, 1, 0),
(11113, 897343, 'Decent Seeker', 28, 88, 48, 6, 0, 0),
(11114, 897344, 'puzzle', 0, 0, 0, 26, 0, 0),
(11115, 897344, 'Decent Firewall', 28, 123, 66, 4, 1, 0),
(11116, 897344, 'Decent FTP Exploit', 28, 111, 60, 13, 0, 0),
(11117, 897344, 'Intermediate Hidder', 30, 101, 56, 5, 0, 0),
(11118, 897344, 'Intermediate Spam', 35, 112, 63, 8, 0, 0),
(11119, 897344, 'Intermediate Cracker', 34, 219, 123, 1, 1, 0),
(11120, 897344, 'Intermediate Anti-Virus', 34, 140, 79, 7, 0, 0),
(11121, 897344, 'Decent SSH Exploit', 24, 82, 42, 14, 0, 0),
(11122, 897344, 'Intermediate Hasher', 32, 177, 99, 2, 1, 0),
(11123, 897344, 'Decent Seeker', 28, 88, 48, 6, 0, 0),
(11124, 897345, 'puzzle', 0, 0, 0, 26, 0, 0),
(11125, 897345, 'Decent Firewall', 26, 106, 56, 4, 1, 0),
(11126, 897345, 'Intermediate FTP Exploit', 30, 128, 70, 13, 0, 0),
(11127, 897345, 'Intermediate Hidder', 37, 157, 90, 5, 0, 0),
(11128, 897345, 'Intermediate Cracker', 32, 193, 107, 1, 1, 0),
(11129, 897345, 'Intermediate SSH Exploit', 30, 128, 70, 14, 0, 0),
(11130, 897345, 'Intermediate Hasher', 30, 155, 85, 2, 1, 0),
(11131, 897346, 'puzzle', 0, 0, 0, 26, 0, 0),
(11132, 897346, 'Competent Firewall', 42, 286, 167, 4, 1, 0),
(11133, 897346, 'Advanced FTP Exploit', 50, 374, 213, 13, 0, 0),
(11134, 897346, 'Advanced Hidder', 59, 418, 242, 5, 0, 0),
(11135, 897346, 'Advanced Cracker', 64, 825, 481, 1, 1, 0),
(11136, 897346, 'Competent SSH Exploit', 45, 299, 176, 14, 0, 0),
(11137, 897346, 'Advanced Hasher', 62, 711, 413, 2, 1, 0),
(11138, 897346, 'Advanced Seeker', 56, 374, 216, 6, 0, 0),
(11139, 897347, 'puzzle', 0, 0, 0, 26, 0, 0),
(11140, 897347, 'Competent Firewall', 42, 286, 167, 4, 1, 0),
(11141, 897347, 'Competent FTP Exploit', 42, 259, 151, 13, 0, 0),
(11142, 897347, 'Big Collector', 70, 558, 327, 11, 0, 0),
(11143, 897347, 'Big Spam', 70, 478, 280, 8, 0, 0),
(11144, 897347, 'Advanced Cracker', 62, 772, 449, 1, 1, 0),
(11145, 897347, 'Competent SSH Exploit', 45, 299, 176, 14, 0, 0),
(11146, 897347, 'Advanced Hasher', 59, 640, 370, 2, 1, 0),
(11147, 897347, 'Advanced Seeker', 60, 433, 251, 6, 0, 0),
(11148, 897348, 'puzzle', 0, 0, 0, 26, 0, 0),
(11149, 897348, 'Advanced Firewall', 60, 606, 351, 4, 1, 0),
(11150, 897348, 'Competent FTP Exploit', 49, 358, 212, 13, 0, 0),
(11151, 897348, 'Amazing Hidder', 92, 1057, 629, 5, 0, 0),
(11152, 897348, 'Super DDoS', 100, 1090, 410, 10, 0, 0),
(11153, 897348, 'Amazing Cracker', 95, 1882, 1121, 1, 1, 0),
(11154, 897348, 'Big SSH Exploit', 66, 669, 391, 14, 0, 0),
(11155, 897348, 'Amazing Hasher', 90, 1548, 920, 2, 1, 0),
(11156, 897348, 'Super Seeker', 100, 1250, 550, 6, 0, 0),
(11157, 897349, 'puzzle', 0, 0, 0, 26, 0, 0),
(11158, 897349, 'Advanced Firewall', 55, 504, 290, 4, 1, 0),
(11159, 897349, 'Competent FTP Exploit', 47, 328, 194, 13, 0, 0),
(11160, 897349, 'Super Hidder', 100, 1250, 550, 5, 0, 0),
(11161, 897349, 'Amazing Cracker', 90, 1682, 1000, 1, 1, 0),
(11162, 897349, 'Super Anti-Virus', 100, 1330, 620, 7, 0, 0),
(11163, 897349, 'Big SSH Exploit', 70, 757, 444, 14, 0, 0),
(11164, 897349, 'Amazing Hasher', 85, 1374, 814, 2, 1, 0),
(11165, 897349, 'Big Seeker', 75, 690, 407, 6, 0, 0),
(11166, 897350, 'puzzle', 0, 0, 0, 26, 0, 0),
(11167, 897350, 'Advanced Firewall', 55, 504, 290, 4, 1, 0),
(11168, 897350, 'Competent FTP Exploit', 46, 313, 185, 13, 0, 0),
(11169, 897350, 'Big Hidder', 74, 671, 395, 5, 0, 0),
(11170, 897350, 'Super Collector', 100, 1170, 481, 11, 0, 0),
(11171, 897350, 'Super Spam', 100, 1010, 340, 8, 0, 0),
(11172, 897350, 'Amazing Cracker', 85, 1494, 885, 1, 1, 0),
(11173, 897350, 'Advanced SSH Exploit', 50, 374, 213, 14, 0, 0),
(11174, 897350, 'Amazing Hasher', 80, 1211, 715, 2, 1, 0),
(11175, 897350, 'Big Seeker', 72, 634, 372, 6, 0, 0),
(11176, 897351, 'puzzle', 0, 0, 0, 26, 0, 0),
(11177, 897351, 'Competent Firewall', 48, 379, 224, 4, 1, 0),
(11178, 897351, 'Intermediate FTP Exploit', 39, 222, 128, 13, 0, 0),
(11179, 897351, 'Big Hidder', 68, 563, 329, 5, 0, 0),
(11180, 897351, 'Big Cracker', 75, 1150, 677, 1, 1, 0),
(11181, 897351, 'Competent SSH Exploit', 42, 259, 151, 14, 0, 0),
(11182, 897351, 'Big Hasher', 71, 944, 554, 2, 1, 0),
(11183, 897351, 'Big Seeker', 70, 598, 350, 6, 0, 0),
(11184, 897351, 'Amazing Miner', 90, 1413, 840, 20, 0, 0),
(11185, 897352, 'puzzle', 0, 0, 0, 26, 0, 0),
(11186, 897352, 'Competent Firewall', 45, 331, 194, 4, 1, 0),
(11187, 897352, 'Competent FTP Exploit', 42, 259, 151, 13, 0, 0),
(11188, 897352, 'Big Cracker', 71, 1026, 602, 1, 1, 0),
(11189, 897352, 'Amazing Anti-Virus', 80, 843, 498, 7, 0, 0),
(11190, 897352, 'Advanced SSH Exploit', 50, 374, 213, 14, 0, 0),
(11191, 897352, 'Big Hasher', 68, 862, 504, 2, 1, 0),
(11192, 897352, 'Big Seeker', 70, 598, 350, 6, 0, 0),
(11193, 897353, 'puzzle', 0, 0, 0, 26, 0, 0),
(11194, 897353, 'Competent Firewall', 45, 331, 194, 4, 1, 0),
(11195, 897353, 'Competent FTP Exploit', 47, 328, 194, 13, 0, 0),
(11196, 897353, 'Big Hidder', 70, 598, 350, 5, 0, 0),
(11197, 897353, 'Big DDoS', 75, 598, 352, 10, 0, 0),
(11198, 897353, 'Big Cracker', 68, 937, 548, 1, 1, 0),
(11199, 897353, 'Competent SSH Exploit', 45, 299, 176, 14, 0, 0),
(11200, 897353, 'Big Breaker', 75, 644, 379, 12, 0, 0),
(11201, 897353, 'Advanced Hasher', 64, 759, 442, 2, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `software_research`
--

CREATE TABLE `software_research` (
  `researched_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(30) UNSIGNED NOT NULL,
  `userID` int(5) UNSIGNED NOT NULL,
  `softID` int(10) UNSIGNED NOT NULL,
  `softwareType` tinyint(2) UNSIGNED NOT NULL,
  `newVersion` int(5) UNSIGNED NOT NULL,
  `softwareName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `software_running`
--

CREATE TABLE `software_running` (
  `id` int(30) NOT NULL,
  `softID` int(30) NOT NULL,
  `userID` int(5) NOT NULL,
  `ramUsage` int(5) NOT NULL,
  `isNPC` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `software_running`
--

INSERT INTO `software_running` (`id`, `softID`, `userID`, `ramUsage`, `isNPC`) VALUES
(4803958, 13662695, 897302, 33, 1),
(4803959, 13662697, 897302, 41, 1),
(4803960, 13662698, 897302, 30, 1),
(4803961, 13662705, 897303, 623, 1),
(4803962, 13662707, 897303, 778, 1),
(4803963, 13662708, 897303, 235, 1),
(4803964, 13662718, 897304, 257, 1),
(4803965, 13662720, 897304, 318, 1),
(4803966, 13662721, 897304, 118, 1),
(4803967, 13662728, 897305, 1110, 1),
(4803968, 13662730, 897305, 1350, 1),
(4803969, 13662731, 897305, 490, 1),
(4803971, 13662739, 897354, 30, 1),
(4803972, 13662740, 897354, 33, 1),
(4803977, 13662752, 897355, 235, 1),
(4803978, 13662753, 897355, 257, 1),
(4803979, 13662755, 897360, 970, 1),
(4803980, 13662756, 897360, 1110, 1),
(4803981, 13662757, 897361, 110, 1),
(4803982, 13662758, 897361, 257, 1),
(4803985, 13662761, 897363, 51, 1),
(4803986, 13662762, 897363, 56, 1),
(4803987, 13662766, 897364, 16, 1),
(4803988, 13662767, 897364, 17, 1),
(4803989, 13662768, 897365, 149, 1),
(4803990, 13662769, 897365, 163, 1),
(4803993, 13662772, 897367, 653, 1),
(4803994, 13662773, 897367, 715, 1),
(4803995, 13662774, 897368, 351, 1),
(4803996, 13662775, 897368, 384, 1),
(4803997, 13662776, 897369, 32, 1),
(4803998, 13662777, 897369, 23, 1),
(4803999, 13662779, 897369, 21, 1),
(4804003, 13662783, 897371, 61, 1),
(4804004, 13662784, 897371, 67, 1),
(4804005, 13662786, 897371, 38, 1),
(4804006, 13662788, 897372, 28, 1),
(4804007, 13662789, 897372, 23, 1),
(4804008, 13662791, 897372, 51, 1),
(4804009, 13662794, 897373, 25, 1),
(4804010, 13662795, 897373, 30, 1),
(4804011, 13662797, 897373, 21, 1),
(4804012, 13662800, 897374, 66, 1),
(4804013, 13662801, 897374, 30, 1),
(4804014, 13662802, 897374, 30, 1),
(4804018, 13662809, 897376, 10, 1),
(4804019, 13662810, 897376, 11, 1),
(4804020, 13662812, 897376, 8, 1),
(4804024, 13662824, 897378, 14, 1),
(4804025, 13662825, 897378, 23, 1),
(4804026, 13662827, 897378, 14, 1),
(4804027, 13662832, 897379, 16, 1),
(4804028, 13662833, 897379, 13, 1),
(4804029, 13662835, 897379, 21, 1),
(4804030, 13662841, 897380, 36, 1),
(4804031, 13662842, 897380, 42, 1),
(4804032, 13662844, 897380, 8, 1),
(4804033, 13662847, 897381, 45, 1),
(4804034, 13662848, 897381, 20, 1),
(4804035, 13662850, 897381, 27, 1),
(4804039, 13662857, 897383, 50, 1),
(4804040, 13662858, 897383, 56, 1),
(4804041, 13662860, 897383, 30, 1),
(4804042, 13662863, 897384, 8, 1),
(4804043, 13662864, 897385, 131, 1),
(4804044, 13662865, 897385, 106, 1),
(4804045, 13662867, 897385, 66, 1),
(4804046, 13662869, 897386, 403, 1),
(4804047, 13662870, 897386, 182, 1),
(4804048, 13662872, 897386, 103, 1),
(4804052, 13662882, 897388, 220, 1),
(4804053, 13662883, 897388, 146, 1),
(4804054, 13662885, 897388, 66, 1),
(4804055, 13662888, 897389, 158, 1),
(4804056, 13662889, 897389, 305, 1),
(4804057, 13662891, 897389, 149, 1),
(4804058, 13662892, 897390, 305, 1),
(4804059, 13662893, 897390, 330, 1),
(4804060, 13662894, 897390, 78, 1),
(4804064, 13662904, 897392, 16, 1),
(4804065, 13662905, 897392, 13, 1),
(4804066, 13662907, 897392, 21, 1),
(4804067, 13662913, 897393, 178, 1),
(4804068, 13662914, 897393, 129, 1),
(4804069, 13662916, 897393, 338, 1),
(4804072, 13662920, 897396, 8, 1),
(4804076, 13662924, 897400, 8, 1),
(4804079, 13662927, 897403, 8, 1),
(4804080, 13662929, 897307, 970, 1),
(4804081, 13662932, 897307, 2250, 1),
(4804082, 13662935, 897307, 1706, 1),
(4804083, 13662938, 897308, 1030, 1),
(4804084, 13662941, 897308, 2600, 1),
(4804085, 13662943, 897308, 1970, 1),
(4804086, 13662947, 897309, 90, 1),
(4804087, 13662950, 897309, 220, 1),
(4804088, 13662952, 897309, 182, 1),
(4804095, 13662974, 897312, 118, 1),
(4804096, 13662978, 897312, 280, 1),
(4804097, 13662980, 897312, 245, 1),
(4804101, 13662993, 897314, 78, 1),
(4804102, 13662996, 897314, 158, 1),
(4804103, 13662999, 897314, 129, 1),
(4804107, 13663012, 897316, 90, 1),
(4804108, 13663016, 897316, 198, 1),
(4804109, 13663018, 897316, 163, 1),
(4804113, 13663031, 897318, 1690, 1),
(4804114, 13663034, 897318, 4500, 1),
(4804115, 13663036, 897318, 3487, 1),
(4804116, 13663039, 897319, 1132, 1),
(4804117, 13663042, 897319, 3000, 1),
(4804118, 13663045, 897319, 2280, 1),
(4804119, 13663048, 897320, 1276, 1),
(4804120, 13663053, 897320, 3450, 1),
(4804121, 13663055, 897320, 2636, 1),
(4804128, 13663075, 897323, 840, 1),
(4804129, 13663079, 897323, 1700, 1),
(4804130, 13663080, 897323, 1316, 1),
(4804131, 13663083, 897324, 840, 1),
(4804132, 13663087, 897324, 1950, 1),
(4804133, 13663089, 897324, 1489, 1),
(4804143, 13663116, 897328, 14, 1),
(4804144, 13663121, 897328, 19, 1),
(4804145, 13663123, 897328, 15, 1),
(4804146, 13663126, 897329, 10, 1),
(4804147, 13663128, 897329, 16, 1),
(4804148, 13663130, 897329, 13, 1),
(4804149, 13663134, 897330, 18, 1),
(4804150, 13663137, 897330, 25, 1),
(4804151, 13663140, 897330, 20, 1),
(4804155, 13663152, 897332, 24, 1),
(4804156, 13663156, 897332, 32, 1),
(4804157, 13663159, 897332, 26, 1),
(4804158, 13663162, 897333, 18, 1),
(4804159, 13663167, 897333, 28, 1),
(4804160, 13663169, 897333, 23, 1),
(4804161, 13663172, 897334, 653, 1),
(4804162, 13663175, 897334, 1500, 1),
(4804163, 13663178, 897334, 1190, 1),
(4804167, 13663191, 897336, 30, 1),
(4804168, 13663195, 897336, 45, 1),
(4804169, 13663197, 897336, 37, 1),
(4804170, 13663199, 897337, 24, 1),
(4804171, 13663203, 897337, 36, 1),
(4804172, 13663205, 897337, 30, 1),
(4804173, 13663208, 897338, 38, 1),
(4804174, 13663211, 897338, 55, 1),
(4804175, 13663213, 897338, 46, 1),
(4804185, 13663241, 897342, 56, 1),
(4804186, 13663245, 897342, 92, 1),
(4804187, 13663247, 897342, 79, 1),
(4804191, 13663260, 897344, 66, 1),
(4804192, 13663264, 897344, 123, 1),
(4804193, 13663267, 897344, 99, 1),
(4804194, 13663270, 897345, 56, 1),
(4804195, 13663273, 897345, 107, 1),
(4804196, 13663275, 897345, 85, 1),
(4804197, 13663277, 897346, 167, 1),
(4804198, 13663280, 897346, 481, 1),
(4804199, 13663282, 897346, 413, 1),
(4804200, 13663285, 897347, 167, 1),
(4804201, 13663289, 897347, 449, 1),
(4804202, 13663291, 897347, 370, 1),
(4804203, 13663294, 897348, 351, 1),
(4804204, 13663298, 897348, 1121, 1),
(4804205, 13663300, 897348, 920, 1),
(4804206, 13663303, 897349, 290, 1),
(4804207, 13663306, 897349, 1000, 1),
(4804208, 13663309, 897349, 814, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `software_texts`
--

CREATE TABLE `software_texts` (
  `creator` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `userID` int(5) NOT NULL,
  `isNPC` tinyint(1) NOT NULL,
  `text` text NOT NULL,
  `lastEdit` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ddos` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stats_login`
--

CREATE TABLE `stats_login` (
  `id` int(11) NOT NULL,
  `userID` int(5) UNSIGNED NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `stats_login`
--

INSERT INTO `stats_login` (`id`, `userID`, `loginTime`) VALUES
(4585270, 750717, '2019-11-17 17:46:49'),
(4585271, 750717, '2019-11-17 18:39:45'),
(4585272, 750717, '2019-11-17 18:42:56'),
(4585273, 750717, '2019-11-17 18:44:57'),
(4585274, 750717, '2019-11-18 08:21:42'),
(4585275, 750717, '2019-11-18 08:22:39'),
(4585276, 750717, '2019-11-18 08:27:13'),
(4585277, 750717, '2019-11-18 08:28:51'),
(4585278, 750717, '2019-11-18 08:31:27'),
(4585279, 750717, '2019-11-18 09:06:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stats_register`
--

CREATE TABLE `stats_register` (
  `userID` int(5) UNSIGNED NOT NULL,
  `registrationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `stats_register`
--

INSERT INTO `stats_register` (`userID`, `registrationDate`, `ip`) VALUES
(750716, '2019-11-17 17:15:56', '192.168.56.1'),
(750717, '2019-11-17 17:46:34', '192.168.56.1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `login` varchar(15) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gamePass` varchar(8) NOT NULL,
  `gameIP` bigint(11) NOT NULL,
  `realIP` bigint(11) NOT NULL DEFAULT 0,
  `homeIP` bigint(11) DEFAULT 0,
  `learning` tinyint(1) NOT NULL DEFAULT 0,
  `premium` tinyint(1) NOT NULL DEFAULT 0,
  `lastLogin` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `email`, `gamePass`, `gameIP`, `realIP`, `homeIP`, `learning`, `premium`, `lastLogin`) VALUES
(750716, 'attempt7', '$2a$13$p4MdaxzuteqNHkaCSOlTWO9EMdm9/FPwqsbYdrOhooI3qhKh/uz5W', 'attempt7@mail.com', 'I0KMBE', 4269423565, 0, 0, 0, 0, '2019-11-17 17:15:56'),
(750717, 'attempt9', '$2a$13$m8iBdtANn2p0czHuylAJpOOUCiExzZ25Z/uae0VQSUyRqtnvPwOJO', 'attempt9@mail.com', 'N36HF2', 2863769721, 0, 0, 0, 0, '2019-11-18 09:06:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_admin`
--

CREATE TABLE `users_admin` (
  `userID` int(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_badge`
--

CREATE TABLE `users_badge` (
  `userID` int(5) NOT NULL,
  `badgeID` smallint(3) NOT NULL,
  `round` tinyint(3) NOT NULL DEFAULT 0,
  `dateAdd` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `priority` tinyint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_banned`
--

CREATE TABLE `users_banned` (
  `user_id` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_expire`
--

CREATE TABLE `users_expire` (
  `userID` int(5) UNSIGNED NOT NULL,
  `expireDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_facebook`
--

CREATE TABLE `users_facebook` (
  `gameID` int(5) NOT NULL,
  `userID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_friends`
--

CREATE TABLE `users_friends` (
  `userID` int(5) NOT NULL,
  `friendID` int(5) NOT NULL,
  `dateAdd` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_language`
--

CREATE TABLE `users_language` (
  `userID` int(5) UNSIGNED NOT NULL,
  `lang` varchar(2) NOT NULL DEFAULT 'en'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users_language`
--

INSERT INTO `users_language` (`userID`, `lang`) VALUES
(750716, 'en'),
(750717, 'en');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_learning`
--

CREATE TABLE `users_learning` (
  `userID` int(5) UNSIGNED NOT NULL,
  `learning` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users_learning`
--

INSERT INTO `users_learning` (`userID`, `learning`) VALUES
(750716, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_online`
--

CREATE TABLE `users_online` (
  `id` int(5) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `token` varchar(200) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users_online`
--

INSERT INTO `users_online` (`id`, `loginTime`, `token`) VALUES
(750717, '2019-11-18 09:06:28', '{\"user\":\"750717\",\"token\":\"f76739c0dedfca14f03214b212abe46f6ac5e4c2ef531d4bb6269596761b96da\",\"signature\":\"908baa9ef0655ef502d93eab4c4d71993ee6caabe4cca7db2704ad9c9c87fc02f4e3\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_premium`
--

CREATE TABLE `users_premium` (
  `id` int(5) UNSIGNED NOT NULL,
  `boughtDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `premiumUntil` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `totalPaid` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_puzzle`
--

CREATE TABLE `users_puzzle` (
  `userID` int(5) UNSIGNED NOT NULL,
  `puzzleID` int(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users_puzzle`
--

INSERT INTO `users_puzzle` (`userID`, `puzzleID`) VALUES
(750716, 0),
(750717, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_stats`
--

CREATE TABLE `users_stats` (
  `uid` int(5) NOT NULL,
  `dateJoined` datetime NOT NULL,
  `exp` int(10) NOT NULL DEFAULT 0,
  `certifications` varchar(30) NOT NULL DEFAULT '',
  `awards` varchar(50) NOT NULL DEFAULT '',
  `timePlaying` float NOT NULL DEFAULT 0,
  `missionCount` int(5) NOT NULL DEFAULT 0,
  `hackCount` int(5) NOT NULL DEFAULT 0,
  `ddosCount` int(5) NOT NULL DEFAULT 0,
  `warezSent` double DEFAULT 0,
  `spamSent` bigint(15) NOT NULL DEFAULT 0,
  `bitcoinSent` double UNSIGNED NOT NULL DEFAULT 0,
  `ipResets` int(5) NOT NULL DEFAULT 0,
  `lastIpReset` timestamp NOT NULL DEFAULT current_timestamp(),
  `pwdResets` mediumint(4) NOT NULL DEFAULT 0,
  `lastPwdReset` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `moneyEarned` bigint(15) NOT NULL DEFAULT 0,
  `moneyTransfered` bigint(15) NOT NULL DEFAULT 0,
  `moneyHardware` bigint(15) NOT NULL DEFAULT 0,
  `moneyResearch` bigint(15) NOT NULL DEFAULT 0,
  `profileViews` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users_stats`
--

INSERT INTO `users_stats` (`uid`, `dateJoined`, `exp`, `certifications`, `awards`, `timePlaying`, `missionCount`, `hackCount`, `ddosCount`, `warezSent`, `spamSent`, `bitcoinSent`, `ipResets`, `lastIpReset`, `pwdResets`, `lastPwdReset`, `moneyEarned`, `moneyTransfered`, `moneyHardware`, `moneyResearch`, `profileViews`) VALUES
(750716, '2019-11-17 18:15:56', 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '2019-11-17 17:15:56', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 0),
(750717, '2019-11-17 18:46:34', 363, '', '', 79.9, 0, 1, 0, 0, 0, 0, 0, '2019-11-17 17:46:34', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_twitter`
--

CREATE TABLE `users_twitter` (
  `gameID` int(5) NOT NULL,
  `userID` int(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `virus`
--

CREATE TABLE `virus` (
  `installedIp` bigint(11) NOT NULL,
  `installedBy` int(5) NOT NULL,
  `virusID` bigint(20) NOT NULL,
  `virusVersion` smallint(5) NOT NULL,
  `originalID` bigint(20) NOT NULL,
  `virusType` tinyint(2) NOT NULL,
  `lastCollect` varchar(19) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `virus_ddos`
--

CREATE TABLE `virus_ddos` (
  `userID` int(5) NOT NULL,
  `ip` bigint(11) NOT NULL,
  `ddosID` bigint(5) NOT NULL,
  `ddosName` varchar(30) NOT NULL,
  `ddosVersion` smallint(4) NOT NULL,
  `cpu` int(5) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `virus_doom`
--

CREATE TABLE `virus_doom` (
  `doomID` bigint(20) NOT NULL,
  `doomIP` bigint(12) NOT NULL,
  `creatorID` int(5) NOT NULL,
  `clanID` int(5) NOT NULL,
  `releaseDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `doomDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `admin_reports`
--
ALTER TABLE `admin_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `badges_clans`
--
ALTER TABLE `badges_clans`
  ADD PRIMARY KEY (`badgeID`);

--
-- Indices de la tabla `badges_users`
--
ALTER TABLE `badges_users`
  ADD PRIMARY KEY (`badgeID`);

--
-- Indices de la tabla `bankAccounts`
--
ALTER TABLE `bankAccounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`bankUser`),
  ADD KEY `bankUser` (`bankUser`,`bankAcc`,`bankID`),
  ADD KEY `bankAcc` (`bankAcc`);

--
-- Indices de la tabla `bankaccounts_expire`
--
ALTER TABLE `bankaccounts_expire`
  ADD KEY `expireDate` (`expireDate`),
  ADD KEY `accID` (`accID`);

--
-- Indices de la tabla `bitcoin_wallets`
--
ALTER TABLE `bitcoin_wallets`
  ADD PRIMARY KEY (`address`),
  ADD KEY `userID` (`userID`);

--
-- Indices de la tabla `bugreports`
--
ALTER TABLE `bugreports`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`userID`);

--
-- Indices de la tabla `cache_profile`
--
ALTER TABLE `cache_profile`
  ADD UNIQUE KEY `userID` (`userID`);

--
-- Indices de la tabla `certifications`
--
ALTER TABLE `certifications`
  ADD PRIMARY KEY (`userID`);

--
-- Indices de la tabla `changelog`
--
ALTER TABLE `changelog`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clan`
--
ALTER TABLE `clan`
  ADD PRIMARY KEY (`clanID`);

--
-- Indices de la tabla `clan_badge`
--
ALTER TABLE `clan_badge`
  ADD KEY `userID` (`clanID`);

--
-- Indices de la tabla `clan_ddos`
--
ALTER TABLE `clan_ddos`
  ADD KEY `attackerClan` (`attackerClan`);

--
-- Indices de la tabla `clan_ddos_history`
--
ALTER TABLE `clan_ddos_history`
  ADD KEY `attackerClan` (`attackerClan`);

--
-- Indices de la tabla `clan_defcon`
--
ALTER TABLE `clan_defcon`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clan_requests`
--
ALTER TABLE `clan_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clanID` (`clanID`);

--
-- Indices de la tabla `clan_stats`
--
ALTER TABLE `clan_stats`
  ADD PRIMARY KEY (`cid`);

--
-- Indices de la tabla `clan_users`
--
ALTER TABLE `clan_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clanID` (`clanID`),
  ADD KEY `userID` (`userID`);

--
-- Indices de la tabla `clan_war`
--
ALTER TABLE `clan_war`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clanID1` (`clanID1`,`clanID2`);

--
-- Indices de la tabla `clan_war_history`
--
ALTER TABLE `clan_war_history`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `doom_abort`
--
ALTER TABLE `doom_abort`
  ADD PRIMARY KEY (`doomID`);

--
-- Indices de la tabla `email_reset`
--
ALTER TABLE `email_reset`
  ADD KEY `userID` (`userID`);

--
-- Indices de la tabla `email_verification`
--
ALTER TABLE `email_verification`
  ADD PRIMARY KEY (`userID`);

--
-- Indices de la tabla `fbi`
--
ALTER TABLE `fbi`
  ADD KEY `ip` (`ip`);

--
-- Indices de la tabla `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `hardware`
--
ALTER TABLE `hardware`
  ADD PRIMARY KEY (`serverID`),
  ADD KEY `IndiceComNPC` (`userID`,`isNPC`);

--
-- Indices de la tabla `hardware_external`
--
ALTER TABLE `hardware_external`
  ADD UNIQUE KEY `serverID` (`serverID`),
  ADD KEY `userID` (`userID`);

--
-- Indices de la tabla `hist_clans`
--
ALTER TABLE `hist_clans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `reputation` (`reputation`);

--
-- Indices de la tabla `hist_clans_current`
--
ALTER TABLE `hist_clans_current`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `reputation` (`reputation`);

--
-- Indices de la tabla `hist_clans_war`
--
ALTER TABLE `hist_clans_war`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `hist_ddos`
--
ALTER TABLE `hist_ddos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `hist_doom`
--
ALTER TABLE `hist_doom`
  ADD KEY `round` (`round`);

--
-- Indices de la tabla `hist_mails`
--
ALTER TABLE `hist_mails`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `hist_missions`
--
ALTER TABLE `hist_missions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`);

--
-- Indices de la tabla `hist_software`
--
ALTER TABLE `hist_software`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `hist_users`
--
ALTER TABLE `hist_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userID_2` (`userID`,`round`),
  ADD KEY `userID` (`userID`);

--
-- Indices de la tabla `hist_users_current`
--
ALTER TABLE `hist_users_current`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `reputation` (`reputation`);

--
-- Indices de la tabla `internet_connections`
--
ALTER TABLE `internet_connections`
  ADD PRIMARY KEY (`userID`);

--
-- Indices de la tabla `internet_home`
--
ALTER TABLE `internet_home`
  ADD PRIMARY KEY (`userID`);

--
-- Indices de la tabla `internet_important`
--
ALTER TABLE `internet_important`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `internet_webserver`
--
ALTER TABLE `internet_webserver`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `lists`
--
ALTER TABLE `lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `ip` (`ip`),
  ADD KEY `virusID` (`virusID`);

--
-- Indices de la tabla `lists_bankAccounts`
--
ALTER TABLE `lists_bankAccounts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lists_collect`
--
ALTER TABLE `lists_collect`
  ADD PRIMARY KEY (`userID`);

--
-- Indices de la tabla `lists_notifications`
--
ALTER TABLE `lists_notifications`
  ADD KEY `userID` (`userID`);

--
-- Indices de la tabla `lists_specs`
--
ALTER TABLE `lists_specs`
  ADD PRIMARY KEY (`listID`);

--
-- Indices de la tabla `lists_specs_analyzed`
--
ALTER TABLE `lists_specs_analyzed`
  ADD PRIMARY KEY (`listID`);

--
-- Indices de la tabla `log`
--
ALTER TABLE `log`
  ADD KEY `userID` (`userID`);

--
-- Indices de la tabla `log_edit`
--
ALTER TABLE `log_edit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vicID` (`vicID`,`isNPC`),
  ADD KEY `editorID` (`editorID`);

--
-- Indices de la tabla `mails`
--
ALTER TABLE `mails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from` (`from`),
  ADD KEY `to` (`to`),
  ADD KEY `type` (`type`);

--
-- Indices de la tabla `mails_history`
--
ALTER TABLE `mails_history`
  ADD PRIMARY KEY (`mid`);

--
-- Indices de la tabla `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `status` (`status`);

--
-- Indices de la tabla `missions_history`
--
ALTER TABLE `missions_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `completed` (`completed`),
  ADD KEY `missionEnd` (`missionEnd`),
  ADD KEY `hirer` (`hirer`);

--
-- Indices de la tabla `missions_seed`
--
ALTER TABLE `missions_seed`
  ADD PRIMARY KEY (`missionID`);

--
-- Indices de la tabla `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `news_history`
--
ALTER TABLE `news_history`
  ADD PRIMARY KEY (`newsID`);

--
-- Indices de la tabla `npc`
--
ALTER TABLE `npc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `npcIP` (`npcIP`);

--
-- Indices de la tabla `npc_down`
--
ALTER TABLE `npc_down`
  ADD PRIMARY KEY (`npcID`),
  ADD KEY `downUntil` (`downUntil`);

--
-- Indices de la tabla `npc_expire`
--
ALTER TABLE `npc_expire`
  ADD PRIMARY KEY (`npcID`),
  ADD KEY `expireDate` (`expireDate`);

--
-- Indices de la tabla `npc_info_en`
--
ALTER TABLE `npc_info_en`
  ADD PRIMARY KEY (`npcID`);

--
-- Indices de la tabla `npc_info_pt`
--
ALTER TABLE `npc_info_pt`
  ADD PRIMARY KEY (`npcID`);

--
-- Indices de la tabla `npc_key`
--
ALTER TABLE `npc_key`
  ADD PRIMARY KEY (`npcID`),
  ADD KEY `key` (`key`);

--
-- Indices de la tabla `npc_reset`
--
ALTER TABLE `npc_reset`
  ADD PRIMARY KEY (`npcID`),
  ADD KEY `nextScan` (`nextScan`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`);

--
-- Indices de la tabla `payments_history`
--
ALTER TABLE `payments_history`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `premium_history`
--
ALTER TABLE `premium_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`);

--
-- Indices de la tabla `processes`
--
ALTER TABLE `processes`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `pCreatorID` (`pCreatorID`),
  ADD KEY `pNPC` (`pNPC`),
  ADD KEY `pVictimID` (`pVictimID`),
  ADD KEY `pTimeEnd` (`pTimeEnd`);

--
-- Indices de la tabla `processes_paused`
--
ALTER TABLE `processes_paused`
  ADD PRIMARY KEY (`pid`);

--
-- Indices de la tabla `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `puzzle_solved`
--
ALTER TABLE `puzzle_solved`
  ADD KEY `userID` (`userID`),
  ADD KEY `puzzleID` (`puzzleID`);

--
-- Indices de la tabla `ranking_clan`
--
ALTER TABLE `ranking_clan`
  ADD UNIQUE KEY `clanID` (`clanID`),
  ADD KEY `rank` (`rank`);

--
-- Indices de la tabla `ranking_ddos`
--
ALTER TABLE `ranking_ddos`
  ADD KEY `rank` (`rank`),
  ADD KEY `ddosID` (`ddosID`);

--
-- Indices de la tabla `ranking_software`
--
ALTER TABLE `ranking_software`
  ADD KEY `rank` (`rank`),
  ADD KEY `softID` (`softID`);

--
-- Indices de la tabla `ranking_user`
--
ALTER TABLE `ranking_user`
  ADD KEY `rank` (`rank`),
  ADD KEY `userID` (`userID`);

--
-- Indices de la tabla `round`
--
ALTER TABLE `round`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `round_ddos`
--
ALTER TABLE `round_ddos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attID` (`attID`),
  ADD KEY `attUser` (`attUser`),
  ADD KEY `vicID` (`vicID`),
  ADD KEY `power` (`power`);

--
-- Indices de la tabla `safeNet`
--
ALTER TABLE `safeNet`
  ADD KEY `IP` (`IP`);

--
-- Indices de la tabla `server_stats`
--
ALTER TABLE `server_stats`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `software`
--
ALTER TABLE `software`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`,`isNPC`);

--
-- Indices de la tabla `software_external`
--
ALTER TABLE `software_external`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`);

--
-- Indices de la tabla `software_folders`
--
ALTER TABLE `software_folders`
  ADD KEY `folderID` (`folderID`),
  ADD KEY `softID` (`softID`);

--
-- Indices de la tabla `software_original`
--
ALTER TABLE `software_original`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `software_research`
--
ALTER TABLE `software_research`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `softID` (`softID`);

--
-- Indices de la tabla `software_running`
--
ALTER TABLE `software_running`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID_isNPC` (`userID`,`isNPC`),
  ADD KEY `softID` (`softID`);

--
-- Indices de la tabla `software_texts`
--
ALTER TABLE `software_texts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID_isNPC` (`userID`,`isNPC`);

--
-- Indices de la tabla `stats_login`
--
ALTER TABLE `stats_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`);

--
-- Indices de la tabla `stats_register`
--
ALTER TABLE `stats_register`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `ip` (`ip`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gameIP` (`gameIP`),
  ADD KEY `lastLogin` (`lastLogin`);

--
-- Indices de la tabla `users_admin`
--
ALTER TABLE `users_admin`
  ADD PRIMARY KEY (`userID`);

--
-- Indices de la tabla `users_badge`
--
ALTER TABLE `users_badge`
  ADD KEY `userID` (`userID`);

--
-- Indices de la tabla `users_banned`
--
ALTER TABLE `users_banned`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `users_expire`
--
ALTER TABLE `users_expire`
  ADD PRIMARY KEY (`userID`);

--
-- Indices de la tabla `users_facebook`
--
ALTER TABLE `users_facebook`
  ADD PRIMARY KEY (`userID`);

--
-- Indices de la tabla `users_friends`
--
ALTER TABLE `users_friends`
  ADD PRIMARY KEY (`userID`,`friendID`);

--
-- Indices de la tabla `users_language`
--
ALTER TABLE `users_language`
  ADD PRIMARY KEY (`userID`);

--
-- Indices de la tabla `users_learning`
--
ALTER TABLE `users_learning`
  ADD PRIMARY KEY (`userID`);

--
-- Indices de la tabla `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users_premium`
--
ALTER TABLE `users_premium`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users_puzzle`
--
ALTER TABLE `users_puzzle`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `puzzleID` (`puzzleID`);

--
-- Indices de la tabla `users_stats`
--
ALTER TABLE `users_stats`
  ADD PRIMARY KEY (`uid`);

--
-- Indices de la tabla `users_twitter`
--
ALTER TABLE `users_twitter`
  ADD PRIMARY KEY (`userID`);

--
-- Indices de la tabla `virus`
--
ALTER TABLE `virus`
  ADD PRIMARY KEY (`virusID`),
  ADD KEY `por_instalacao` (`installedIp`,`installedBy`),
  ADD KEY `installedIp` (`installedIp`);

--
-- Indices de la tabla `virus_ddos`
--
ALTER TABLE `virus_ddos`
  ADD PRIMARY KEY (`userID`,`ip`),
  ADD KEY `ip` (`ip`),
  ADD KEY `ddosID` (`ddosID`);

--
-- Indices de la tabla `virus_doom`
--
ALTER TABLE `virus_doom`
  ADD KEY `doomID` (`doomID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id` tinyint(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `admin_reports`
--
ALTER TABLE `admin_reports`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bankAccounts`
--
ALTER TABLE `bankAccounts`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12716008;

--
-- AUTO_INCREMENT de la tabla `bugreports`
--
ALTER TABLE `bugreports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4289;

--
-- AUTO_INCREMENT de la tabla `changelog`
--
ALTER TABLE `changelog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clan`
--
ALTER TABLE `clan`
  MODIFY `clanID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23259;

--
-- AUTO_INCREMENT de la tabla `clan_defcon`
--
ALTER TABLE `clan_defcon`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29249;

--
-- AUTO_INCREMENT de la tabla `clan_requests`
--
ALTER TABLE `clan_requests`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63154;

--
-- AUTO_INCREMENT de la tabla `clan_users`
--
ALTER TABLE `clan_users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48282;

--
-- AUTO_INCREMENT de la tabla `clan_war`
--
ALTER TABLE `clan_war`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4764;

--
-- AUTO_INCREMENT de la tabla `clan_war_history`
--
ALTER TABLE `clan_war_history`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4494;

--
-- AUTO_INCREMENT de la tabla `friend_requests`
--
ALTER TABLE `friend_requests`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95891;

--
-- AUTO_INCREMENT de la tabla `hardware`
--
ALTER TABLE `hardware`
  MODIFY `serverID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6594221;

--
-- AUTO_INCREMENT de la tabla `hardware_external`
--
ALTER TABLE `hardware_external`
  MODIFY `serverID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329611;

--
-- AUTO_INCREMENT de la tabla `hist_clans`
--
ALTER TABLE `hist_clans`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67957;

--
-- AUTO_INCREMENT de la tabla `hist_clans_current`
--
ALTER TABLE `hist_clans_current`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23259;

--
-- AUTO_INCREMENT de la tabla `hist_clans_war`
--
ALTER TABLE `hist_clans_war`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1958;

--
-- AUTO_INCREMENT de la tabla `hist_ddos`
--
ALTER TABLE `hist_ddos`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159502;

--
-- AUTO_INCREMENT de la tabla `hist_mails`
--
ALTER TABLE `hist_mails`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hist_missions`
--
ALTER TABLE `hist_missions`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=486196;

--
-- AUTO_INCREMENT de la tabla `hist_software`
--
ALTER TABLE `hist_software`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=543259;

--
-- AUTO_INCREMENT de la tabla `hist_users`
--
ALTER TABLE `hist_users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=446252;

--
-- AUTO_INCREMENT de la tabla `hist_users_current`
--
ALTER TABLE `hist_users_current`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=750486;

--
-- AUTO_INCREMENT de la tabla `internet_important`
--
ALTER TABLE `internet_important`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=970153;

--
-- AUTO_INCREMENT de la tabla `lists`
--
ALTER TABLE `lists`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4620176;

--
-- AUTO_INCREMENT de la tabla `lists_bankAccounts`
--
ALTER TABLE `lists_bankAccounts`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1511488;

--
-- AUTO_INCREMENT de la tabla `log`
--
ALTER TABLE `log`
  MODIFY `userID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=897413;

--
-- AUTO_INCREMENT de la tabla `log_edit`
--
ALTER TABLE `log_edit`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13490282;

--
-- AUTO_INCREMENT de la tabla `mails`
--
ALTER TABLE `mails`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4016489;

--
-- AUTO_INCREMENT de la tabla `missions`
--
ALTER TABLE `missions`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13887281;

--
-- AUTO_INCREMENT de la tabla `missions_history`
--
ALTER TABLE `missions_history`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13887173;

--
-- AUTO_INCREMENT de la tabla `news`
--
ALTER TABLE `news`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35360;

--
-- AUTO_INCREMENT de la tabla `news_history`
--
ALTER TABLE `news_history`
  MODIFY `newsID` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35359;

--
-- AUTO_INCREMENT de la tabla `npc`
--
ALTER TABLE `npc`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=897413;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137918;

--
-- AUTO_INCREMENT de la tabla `payments_history`
--
ALTER TABLE `payments_history`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=359;

--
-- AUTO_INCREMENT de la tabla `premium_history`
--
ALTER TABLE `premium_history`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=891;

--
-- AUTO_INCREMENT de la tabla `processes`
--
ALTER TABLE `processes`
  MODIFY `pid` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48831569;

--
-- AUTO_INCREMENT de la tabla `round`
--
ALTER TABLE `round`
  MODIFY `id` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `round_ddos`
--
ALTER TABLE `round_ddos`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=290530;

--
-- AUTO_INCREMENT de la tabla `software`
--
ALTER TABLE `software`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13663351;

--
-- AUTO_INCREMENT de la tabla `software_original`
--
ALTER TABLE `software_original`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11202;

--
-- AUTO_INCREMENT de la tabla `software_research`
--
ALTER TABLE `software_research`
  MODIFY `id` int(30) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=767171;

--
-- AUTO_INCREMENT de la tabla `software_running`
--
ALTER TABLE `software_running`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4804221;

--
-- AUTO_INCREMENT de la tabla `stats_login`
--
ALTER TABLE `stats_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4585280;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=750718;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
