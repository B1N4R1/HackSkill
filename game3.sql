-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 17-11-2019 a las 17:11:24
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

DROP DATABASE IF EXISTS game;
CREATE DATABASE game;
USE game;

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

/*INSERT INTO `bankAccounts` (`id`, `bankAcc`, `bankPass`, `bankID`, `bankUser`, `cash`, `dateCreated`) VALUES
(12716004, 589491427, 'cTHUKK', 897261, 750714, 0, '2019-11-17 13:55:43'),
(12716005, 246146090, '8JYhNJ', 897261, 750715, 0, '2019-11-17 16:10:54');*/

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

/*INSERT INTO `cache` (`userID`, `reputation`) VALUES
(750709, 0),
(750710, 0),
(750711, 0),
(750712, 0),
(750713, 0),
(750714, 0),
(750715, 0);*/

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_profile`
--

CREATE TABLE `cache_profile` (
  `userID` int(5) UNSIGNED NOT NULL,
  `expireDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cache_profile`
--

/*INSERT INTO `cache_profile` (`userID`, `expireDate`) VALUES
(750715, '2019-11-17 16:10:54');*/

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

/*INSERT INTO `certifications` (`userID`, `certLevel`) VALUES
(750709, 0),
(750710, 0),
(750711, 0),
(750712, 0),
(750713, 0),
(750714, 0),
(750715, 0);*/

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
  `name` varchar(15) NOT NULL,
  `cpu` float NOT NULL DEFAULT 500,
  `hdd` float NOT NULL DEFAULT 100,
  `ram` float NOT NULL DEFAULT 256,
  `net` float NOT NULL DEFAULT 1,
  `isNPC` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hardware`
--

/*INSERT INTO `hardware` (`serverID`, `userID`, `name`, `cpu`, `hdd`, `ram`, `net`, `isNPC`) VALUES
(6593998, 750709, 'Server #1', 500, 100, 256, 1, 0),
(6593999, 750710, 'Server #1', 500, 100, 256, 1, 0),
(6594000, 750711, 'Server #1', 500, 100, 256, 1, 0),
(6594001, 750712, 'Server #1', 500, 100, 256, 1, 0),
(6594002, 750713, 'Server #1', 500, 100, 256, 1, 0),
(6594003, 897198, '', 4000, 50000, 2048, 100, 1),
(6594004, 897199, '', 3500, 20000, 2048, 20, 1),
(6594005, 897200, '', 4000, 10000, 2048, 50, 1),
(6594006, 897201, '', 4000, 10000, 2048, 20, 1),
(6594007, 897202, '', 4000, 10000, 2048, 100, 1),
(6594008, 897203, '', 8000, 50000, 4096, 1000, 1),
(6594009, 897204, '', 3500, 15000, 2048, 20, 1),
(6594010, 897205, '', 2500, 10000, 2048, 10, 1),
(6594011, 897206, '', 3500, 15000, 2048, 20, 1),
(6594012, 897207, '', 2500, 10000, 2048, 10, 1),
(6594013, 897208, '', 3500, 15000, 2048, 20, 1),
(6594014, 897209, '', 2500, 10000, 2048, 10, 1),
(6594015, 897210, '', 3500, 15000, 2048, 20, 1),
(6594016, 897211, '', 2500, 10000, 2048, 10, 1),
(6594017, 897212, '', 3500, 15000, 2048, 20, 1),
(6594018, 897213, '', 2500, 10000, 2048, 10, 1),
(6594019, 897214, '', 3500, 15000, 2048, 20, 1),
(6594020, 897215, '', 2500, 10000, 2048, 10, 1),
(6594021, 897216, '', 3500, 15000, 2048, 20, 1),
(6594022, 897217, '', 2500, 10000, 2048, 10, 1),
(6594023, 897218, '', 3500, 15000, 2048, 20, 1),
(6594024, 897219, '', 2500, 10000, 2048, 10, 1),
(6594025, 897220, '', 3500, 15000, 2048, 20, 1),
(6594026, 897221, '', 2500, 10000, 2048, 10, 1),
(6594027, 897222, '', 3500, 10000, 2048, 20, 1),
(6594028, 897223, '', 2500, 10000, 2048, 10, 1),
(6594029, 897224, '', 3500, 15000, 2048, 20, 1),
(6594030, 897225, '', 4500, 10000, 2048, 10, 1),
(6594031, 897226, '', 3500, 15000, 2048, 20, 1),
(6594032, 897227, '', 2500, 10000, 2048, 10, 1),
(6594033, 897228, '', 3500, 15000, 2048, 20, 1),
(6594034, 897229, '', 2500, 10000, 2048, 10, 1),
(6594035, 897230, '', 3500, 15000, 2048, 20, 1),
(6594036, 897231, '', 2500, 10000, 2048, 10, 1),
(6594037, 897232, '', 3500, 15000, 2048, 20, 1),
(6594038, 897233, '', 2500, 10000, 2048, 10, 1),
(6594039, 897234, '', 3500, 15000, 2048, 20, 1),
(6594040, 897235, '', 2500, 10000, 2048, 10, 1),
(6594041, 897236, '', 3500, 15000, 2048, 20, 1),
(6594042, 897237, '', 2500, 10000, 2048, 10, 1),
(6594043, 897238, '', 3500, 15000, 2048, 20, 1),
(6594044, 897239, '', 2500, 10000, 2048, 10, 1),
(6594045, 897240, '', 3500, 15000, 2048, 20, 1),
(6594046, 897241, '', 2500, 10000, 2048, 10, 1),
(6594047, 897242, '', 3500, 15000, 2048, 20, 1),
(6594048, 897243, '', 2500, 10000, 2048, 10, 1),
(6594049, 897244, '', 3500, 15000, 2048, 20, 1),
(6594050, 897245, '', 2500, 10000, 2048, 10, 1),
(6594051, 897246, '', 3500, 15000, 2048, 20, 1),
(6594052, 897247, '', 2500, 10000, 2048, 10, 1),
(6594053, 897248, '', 3500, 15000, 2048, 20, 1),
(6594054, 897249, '', 2500, 10000, 2048, 10, 1),
(6594055, 897250, '', 3500, 15000, 2048, 20, 1),
(6594056, 897251, '', 2000, 10000, 1024, 200, 1),
(6594057, 897252, '', 8000, 50000, 4096, 1000, 1),
(6594058, 897253, '', 4000, 50000, 2048, 50, 1),
(6594059, 897254, '', 4000, 50000, 2048, 50, 1),
(6594060, 897255, '', 4000, 50000, 2048, 50, 1),
(6594061, 897256, '', 4000, 50000, 2048, 100, 1),
(6594062, 897257, '', 4000, 50000, 2048, 75, 1),
(6594063, 897258, '', 4000, 20000, 1024, 10, 1),
(6594064, 897259, '', 4000, 50000, 2048, 100, 1),
(6594065, 897260, '', 4000, 50000, 2048, 100, 1),
(6594066, 897261, '', 2000, 20000, 2048, 10, 1),
(6594067, 897262, '', 3000, 40000, 2048, 20, 1),
(6594068, 897263, '', 2500, 20000, 1024, 15, 1),
(6594069, 897264, '', 6000, 20000, 2048, 100, 1),
(6594070, 897265, '', 4000, 10000, 2048, 20, 1),
(6594071, 897266, '', 1000, 5000, 512, 5, 1),
(6594072, 897267, '', 4000, 50000, 2048, 50, 1),
(6594073, 897268, '', 2000, 10000, 1024, 10, 1),
(6594074, 897269, '', 1500, 10000, 1024, 10, 1),
(6594075, 897270, '', 2500, 15000, 1536, 15, 1),
(6594076, 897271, '', 2500, 15000, 1536, 15, 1),
(6594077, 897272, '', 1000, 5000, 512, 5, 1),
(6594078, 897273, '', 2000, 10000, 1024, 10, 1),
(6594079, 897274, '', 1500, 10000, 1024, 10, 1),
(6594080, 897275, '', 2500, 15000, 1536, 15, 1),
(6594081, 897276, '', 2500, 15000, 1536, 15, 1),
(6594082, 897277, '', 3000, 20000, 2048, 20, 1),
(6594083, 897278, '', 3000, 20000, 2048, 20, 1),
(6594084, 897279, '', 4000, 50000, 2048, 50, 1),
(6594085, 897280, '', 4000, 50000, 2048, 50, 1),
(6594086, 897281, '', 4000, 50000, 2048, 50, 1),
(6594087, 897282, '', 1000, 5000, 512, 5, 1),
(6594088, 897283, '', 2000, 10000, 1024, 10, 1),
(6594089, 897284, '', 1500, 10000, 1024, 10, 1),
(6594090, 897285, '', 2500, 15000, 1536, 15, 1),
(6594091, 897286, '', 2500, 15000, 1536, 15, 1),
(6594092, 897287, '', 3000, 20000, 2048, 20, 1),
(6594093, 897288, '', 3000, 20000, 2048, 20, 1),
(6594094, 897289, '', 4000, 50000, 2048, 50, 1),
(6594095, 897290, '', 4000, 50000, 2048, 50, 1),
(6594096, 897291, '', 4000, 50000, 2048, 50, 1),
(6594097, 897292, '', 1000, 5000, 512, 5, 1),
(6594098, 897293, '', 2000, 10000, 1024, 10, 1),
(6594099, 897294, '', 1500, 10000, 1024, 10, 1),
(6594100, 897295, '', 2500, 15000, 1536, 15, 1),
(6594101, 897296, '', 2500, 15000, 1536, 15, 1),
(6594102, 897297, '', 3000, 20000, 2048, 20, 1),
(6594103, 897298, '', 3000, 20000, 2048, 20, 1),
(6594104, 897299, '', 4000, 50000, 2048, 50, 1),
(6594105, 897300, '', 4000, 50000, 2048, 50, 1),
(6594106, 750714, 'Server #1', 500, 100, 256, 1, 0),
(6594107, 750715, 'Server #1', 500, 100, 256, 1, 0);*/

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

/*INSERT INTO `hist_users_current` (`id`, `userID`, `user`, `reputation`, `age`, `clanID`, `clanName`, `timePlaying`, `missionCount`, `hackCount`, `ddosCount`, `ipResets`, `moneyEarned`, `moneyTransfered`, `moneyHardware`, `moneyResearch`, `warezSent`, `spamSent`, `bitcoinSent`, `profileViews`) VALUES
(750477, 750709, '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(750478, 750710, '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(750479, 750711, '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(750480, 750712, '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(750481, 750713, '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(750482, 750714, '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(750483, 750715, '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);*/

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `internet_connections`
--

CREATE TABLE `internet_connections` (
  `userID` int(5) NOT NULL,
  `ip` bigint(14) NOT NULL,
  `expires` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

/*INSERT INTO `log` (`userID`, `text`, `isNPC`) VALUES
(750709, '2019-11-17 14:26 - localhost installed current operating system', 0),
(750710, '2019-11-17 14:32 - localhost installed current operating system', 0),
(750711, '2019-11-17 14:40 - localhost installed current operating system', 0),
(750712, '2019-11-17 14:44 - localhost installed current operating system', 0),
(750713, '2019-11-17 14:51 - localhost installed current operating system', 0),
(897198, '', 1),
(897199, '', 1),
(897200, '', 1),
(897201, '', 1),
(897202, '', 1),
(897203, '', 1),
(897204, '', 1),
(897205, '', 1),
(897206, '', 1),
(897207, '', 1),
(897208, '', 1),
(897209, '', 1),
(897210, '', 1),
(897211, '', 1),
(897212, '', 1),
(897213, '', 1),
(897214, '', 1),
(897215, '', 1),
(897216, '', 1),
(897217, '', 1),
(897218, '', 1),
(897219, '', 1),
(897220, '', 1),
(897221, '', 1),
(897222, '', 1),
(897223, '', 1),
(897224, '', 1),
(897225, '', 1),
(897226, '', 1),
(897227, '', 1),
(897228, '', 1),
(897229, '', 1),
(897230, '', 1),
(897231, '', 1),
(897232, '', 1),
(897233, '', 1),
(897234, '', 1),
(897235, '', 1),
(897236, '', 1),
(897237, '', 1),
(897238, '', 1),
(897239, '', 1),
(897240, '', 1),
(897241, '', 1),
(897242, '', 1),
(897243, '', 1),
(897244, '', 1),
(897245, '', 1),
(897246, '', 1),
(897247, '', 1),
(897248, '', 1),
(897249, '', 1),
(897250, '', 1),
(897251, '', 1),
(897252, '', 1),
(897253, '', 1),
(897254, '', 1),
(897255, '', 1),
(897256, '', 1),
(897257, '', 1),
(897258, '', 1),
(897259, '', 1),
(897260, '', 1),
(897261, '', 1),
(897262, '', 1),
(897263, '', 1),
(897264, '', 1),
(897265, '', 1),
(897266, '', 1),
(897267, '', 1),
(897268, '', 1),
(897269, '', 1),
(897270, '', 1),
(897271, '', 1),
(897272, '', 1),
(897273, '', 1),
(897274, '', 1),
(897275, '', 1),
(897276, '', 1),
(897277, '', 1),
(897278, '', 1),
(897279, '', 1),
(897280, '', 1),
(897281, '', 1),
(897282, '', 1),
(897283, '', 1),
(897284, '', 1),
(897285, '', 1),
(897286, '', 1),
(897287, '', 1),
(897288, '', 1),
(897289, '', 1),
(897290, '', 1),
(897291, '', 1),
(897292, '', 1),
(897293, '', 1),
(897294, '', 1),
(897295, '', 1),
(897296, '', 1),
(897297, '', 1),
(897298, '', 1),
(897299, '', 1),
(897300, '', 1),
(750714, '2019-11-17 15:47 - localhost logged in\n2019-11-17 14:55 - localhost installed current operating system', 0),
(750715, '2019-11-17 17:10 - localhost installed current operating system', 0);*/

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
  `isRead` tinyint(1) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `info2` bigint(11) NOT NULL,
  `newInfo2` int(11) UNSIGNED NOT NULL,
  `missionStart` date NOT NULL,
  `missionEnd` date NOT NULL,
  `prize` int(6) NOT NULL,
  `userID` int(5) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `dateGenerated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

/*INSERT INTO `npc` (`id`, `npcType`, `npcIP`, `npcPass`, `downUntil`) VALUES
(897198, 20, 4168615584, 'aTfRa5A5', '2019-11-17 13:54:59'),
(897199, 2, 16909060, 'Q0Vs23rf', '2019-11-17 13:54:59'),
(897200, 2, 3994751047, 'aWGiMDLY', '2019-11-17 13:54:59'),
(897201, 2, 3158298987, '9j9Gl7LI', '2019-11-17 13:54:59'),
(897202, 2, 2020040795, 'PfZBKESs', '2019-11-17 13:54:59'),
(897203, 52, 2798679391, 'jYEixQ07', '2019-11-17 13:54:59'),
(897204, 7, 584188802, 'A1Q02MTh', '2019-11-17 13:54:59'),
(897205, 7, 2790866537, 'HJtbGjRz', '2019-11-17 13:54:59'),
(897206, 7, 1526048538, '7C5A6lUr', '2019-11-17 13:54:59'),
(897207, 7, 4002640404, '85fXI1SP', '2019-11-17 13:54:59'),
(897208, 7, 166215984, 'MQA75H9R', '2019-11-17 13:54:59'),
(897209, 7, 2465094794, 'PFSDOl66', '2019-11-17 13:54:59'),
(897210, 7, 3526962045, 'ltGOau3J', '2019-11-17 13:54:59'),
(897211, 7, 510218137, 'VCRPoVmn', '2019-11-17 13:54:59'),
(897212, 7, 3103512631, 'hY45Ri4j', '2019-11-17 13:54:59'),
(897213, 7, 353836098, 'SU3bDoDq', '2019-11-17 13:54:59'),
(897214, 7, 3681723354, 'gmAr7ulu', '2019-11-17 13:54:59'),
(897215, 7, 3619350240, 'f1BwTnE6', '2019-11-17 13:54:59'),
(897216, 7, 1322852807, 'qPT8mZ5K', '2019-11-17 13:54:59'),
(897217, 7, 3267736523, 'vCoPC2t2', '2019-11-17 13:54:59'),
(897218, 7, 2628012114, '6YNFhJU3', '2019-11-17 13:54:59'),
(897219, 7, 2563124493, 'wwOZT3mB', '2019-11-17 13:54:59'),
(897220, 7, 1408215105, 'AsqjccPZ', '2019-11-17 13:54:59'),
(897221, 7, 912155182, 'JjUS6gY9', '2019-11-17 13:54:59'),
(897222, 7, 61947512, 'OhMXhjvE', '2019-11-17 13:54:59'),
(897223, 7, 1424233398, 'wVeFvIe0', '2019-11-17 13:54:59'),
(897224, 7, 3586551017, 'IXduZFOW', '2019-11-17 13:54:59'),
(897225, 7, 704180967, 'CgUk8Tm1', '2019-11-17 13:54:59'),
(897226, 7, 2144606151, 'LSg9ji5Q', '2019-11-17 13:54:59'),
(897227, 7, 4049541092, 'WE8ZMwlh', '2019-11-17 13:54:59'),
(897228, 7, 3342168105, 'vsxlUPuA', '2019-11-17 13:54:59'),
(897229, 7, 4097801041, 'kpa95Ps6', '2019-11-17 13:54:59'),
(897230, 7, 1437864100, 'MR4YK1c8', '2019-11-17 13:54:59'),
(897231, 7, 790040431, 'Ur3eycva', '2019-11-17 13:54:59'),
(897232, 7, 775645026, 'bXG8rJdz', '2019-11-17 13:54:59'),
(897233, 7, 450854570, 'aDmH4O1U', '2019-11-17 13:54:59'),
(897234, 7, 1075778575, 'Cx84mFMx', '2019-11-17 13:54:59'),
(897235, 7, 3745677062, 'UUN2Oqk7', '2019-11-17 13:54:59'),
(897236, 7, 2786526593, 'MvlQ4gIZ', '2019-11-17 13:54:59'),
(897237, 7, 308996524, 'iInahVQB', '2019-11-17 13:54:59'),
(897238, 7, 871307971, 'o1uhh7Ti', '2019-11-17 13:54:59'),
(897239, 7, 320392193, 'webDbEYa', '2019-11-17 13:54:59'),
(897240, 7, 3215789417, 'G8KNAXX1', '2019-11-17 13:54:59'),
(897241, 7, 848123646, '6tOPHanz', '2019-11-17 13:54:59'),
(897242, 7, 1375869322, 'ESlFDNyV', '2019-11-17 13:54:59'),
(897243, 7, 3181095396, '3gCho1GU', '2019-11-17 13:54:59'),
(897244, 7, 2271825675, 'j7HIKaxq', '2019-11-17 13:54:59'),
(897245, 7, 4009421798, 'e0v6eBqm', '2019-11-17 13:54:59'),
(897246, 7, 3026367624, 'eriRrBFl', '2019-11-17 13:54:59'),
(897247, 7, 3886418883, 'tmM0N4AR', '2019-11-17 13:54:59'),
(897248, 7, 1914550693, 'mm09unlV', '2019-11-17 13:54:59'),
(897249, 7, 2004971381, 'HEwcL0OU', '2019-11-17 13:54:59'),
(897250, 7, 3168863242, 'RHgI5p1M', '2019-11-17 13:54:59'),
(897251, 5, 1842590196, 'qFAl72zT', '2019-11-17 13:54:59'),
(897252, 40, 3101262804, '8ToxJjb3', '2019-11-17 13:54:59'),
(897253, 6, 3578855142, 'eF06djZ3', '2019-11-17 13:54:59'),
(897254, 6, 3892539013, 'PUv3d1pE', '2019-11-17 13:54:59'),
(897255, 6, 1628480561, 'xo05e4Iz', '2019-11-17 13:54:59'),
(897256, 8, 3851680076, 'TXmfusIN', '2019-11-17 13:54:59'),
(897257, 30, 2491525404, 'yuq6LitC', '2019-11-17 13:54:59'),
(897258, 50, 3131051326, '01ILfv8y', '2019-11-17 13:54:59'),
(897259, 51, 3384880664, 'p2oJi0jJ', '2019-11-17 13:54:59'),
(897260, 45, 4123477945, 'WLb05jwC', '2019-11-17 13:54:59'),
(897261, 1, 1115170260, 'DhtPjaVD', '2019-11-17 13:54:59'),
(897262, 1, 4125528893, 'HYhen5Bq', '2019-11-17 13:54:59'),
(897263, 1, 649157414, 'Dh8y9su1', '2019-11-17 13:54:59'),
(897264, 1, 119659000, 'TKdmpH8j', '2019-11-17 13:54:59'),
(897265, 1, 1546042339, 'rfPAfVl9', '2019-11-17 13:54:59'),
(897266, 71, 3039315026, 'kMq22nti', '2019-11-17 13:54:59'),
(897267, 71, 1561048074, 'fp7nIN4h', '2019-11-17 13:54:59'),
(897268, 71, 3132625902, 'comcfqH4', '2019-11-17 13:54:59'),
(897269, 71, 169157423, 'MFMZeok0', '2019-11-17 13:54:59'),
(897270, 71, 3183002337, 'MKVUqF9G', '2019-11-17 13:54:59'),
(897271, 71, 2826182160, 'BjnJ3T6C', '2019-11-17 13:54:59'),
(897272, 71, 1596692621, 'iAXRwN4b', '2019-11-17 13:54:59'),
(897273, 71, 3649198565, 'ELxgSFKh', '2019-11-17 13:54:59'),
(897274, 71, 2219944884, '1M8ZEift', '2019-11-17 13:54:59'),
(897275, 71, 1962683791, 'FrrO9vjH', '2019-11-17 13:54:59'),
(897276, 71, 792062585, '6Uu2BQLZ', '2019-11-17 13:54:59'),
(897277, 71, 551917638, 'gNYNgpPV', '2019-11-17 13:54:59'),
(897278, 71, 8863511, 'E2CWHMjf', '2019-11-17 13:54:59'),
(897279, 71, 309561149, 'qZhj4DAz', '2019-11-17 13:54:59'),
(897280, 71, 2800821867, 'p5CF9VN8', '2019-11-17 13:54:59'),
(897281, 72, 1172272116, 'gB9X4OME', '2019-11-17 13:54:59'),
(897282, 72, 2775429690, '83teGx9u', '2019-11-17 13:54:59'),
(897283, 72, 3649364417, '1rn9rehS', '2019-11-17 13:54:59'),
(897284, 72, 2591936567, 'sm6f7Z9f', '2019-11-17 13:54:59'),
(897285, 72, 708488410, 'ftA9jzUP', '2019-11-17 13:54:59'),
(897286, 72, 1234511740, 'ysBtVsgD', '2019-11-17 13:54:59'),
(897287, 72, 1697614787, 'xQgE6BKM', '2019-11-17 13:54:59'),
(897288, 72, 1747638432, 'lK6ic9S6', '2019-11-17 13:54:59'),
(897289, 72, 2007879019, 'gbdb3mmu', '2019-11-17 13:54:59'),
(897290, 72, 102296023, 'ZKQ2X9Vq', '2019-11-17 13:54:59'),
(897291, 73, 2976414688, 'Xt9PBjOk', '2019-11-17 13:54:59'),
(897292, 73, 2629661505, 'ivaTPH5x', '2019-11-17 13:54:59'),
(897293, 73, 2515051147, '6T3oRyf0', '2019-11-17 13:54:59'),
(897294, 73, 2704829751, '1Iyq1YwU', '2019-11-17 13:54:59'),
(897295, 73, 3962448503, 'xvWqLBws', '2019-11-17 13:54:59'),
(897296, 73, 1907632851, 'Y5jW6oCo', '2019-11-17 13:54:59'),
(897297, 73, 2035337723, 'eQgWGJ7n', '2019-11-17 13:54:59'),
(897298, 73, 3410609311, 'Ob99XfnG', '2019-11-17 13:54:59'),
(897299, 73, 3840056759, 'RaBwye4T', '2019-11-17 13:54:59'),
(897300, 73, 2083046899, 'ERAm1YAw', '2019-11-17 13:54:59');*/

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

/*INSERT INTO `npc_info_en` (`npcID`, `name`, `web`) VALUES
(897198, 'Geek Pride Labs', ''),
(897199, 'First Whois', 'Welcome to the First Whois server. Enjoy our services!<ul class=\"whois\"><li><a href=\"internet?ip=229.147.249.76\"><span \nclass=\"item\">229.147.249.76</span> - <span \nclass=\"whois-member\">Download Center</span></a></li><li><a href=\"internet?ip=245.199.71.185\"><span \nclass=\"item\">245.199.71.185</span> - <span \nclass=\"whois-member\">Torrent Market</span></a></li><li><a href=\"internet?ip=3.177.62.120\"><span \nclass=\"item\">3.177.62.120</span> - <span \nclass=\"whois-member\">First Puzzle</span></a></li><li><a href=\"internet?ip=66.120.37.212\"><span class=\"item\">66.120.37.212</span> - <span class=\"whois-member\">First International Bank</span></a></li><li><a href=\"internet?ip=95.43.152.141\"><span class=\"item\">95.43.152.141</span> - <span class=\"whois-member\">elgooG</span></a></li><li><a href=\"internet?ip=132.81.171.180\"><span class=\"item\">132.81.171.180</span> - <span class=\"whois-member\">Murder King</span></a></li><li><a href=\"internet?ip=186.160.13.62\"><span \nclass=\"item\">186.160.13.62</span> - <span \nclass=\"whois-member\">Safenet</span></a></li><li><a href=\"internet?ip=47.53.234.121\"><span class=\"item\">47.53.234.121</span> - <span class=\"whois-member\">Pineapple</span></a></li></ul>Trending Sites:<ul class=\"whois\"><li><a href=\"internet?ip=109.211.177.244\"><span class=\"item\">109.211.177.244</span> - <span class=\"whois-member\">ISP - Internet Service Provider</span></a></li><li><a href=\"internet?ip=166.208.117.95\"><span class=\"item\">166.208.117.95</span> - <span class=\"whois-member\">NSA</span></a></li><li><a href=\"internet?ip=41.248.242.231\"><span \nclass=\"item\">41.248.242.231</span> - <span \nclass=\"whois-member\">Hacker News</span></a></li></ul>'),
(897200, 'Third Whois', 'Third Whois<ul class=\"whois\"><li><a href=\"internet?ip=92.38.187.227\"><span class=\"item\">92.38.187.227</span> - <span class=\"whois-member\">Swiss International Bank</span></a></li><li><a href=\"internet?ip=231.166.11.195\"><span class=\"item\">231.166.11.195</span> - <span class=\"whois-member\">Eduard Khil</span></a></li><li><a href=\"internet?ip=156.164.72.82\"><span class=\"item\">156.164.72.82</span> - <span class=\"whois-member\">Gnirut</span></a></li><li><a href=\"internet?ip=203.73.196.159\"><span class=\"item\">203.73.196.159</span> - <span class=\"whois-member\">Weird</span></a></li><li><a href=\"internet?ip=228.226.157.183\"><span class=\"item\">228.226.157.183</span> - <span class=\"whois-member\">Yahoo?</span></a></li><li><a href=\"internet?ip=184.217.131.212\"><span class=\"item\">184.217.131.212</span> - <span class=\"whois-member\">Bitcoin Market</span></a></li><li><a href=\"internet?ip=201.193.46.24\"><span class=\"item\">201.193.46.24</span> - <span class=\"whois-member\">FBI</span></a></li></ul>'),
(897201, 'Second Whois', 'Second Whois, INC.<ul class=\"whois\"><li><a href=\"internet?ip=38.177.91.38\"><span class=\"item\">38.177.91.38</span> - <span class=\"whois-member\">HEBC</span></a></li><li><a href=\"internet?ip=18.106.233.172\"><span class=\"item\">18.106.233.172</span> - <span class=\"whois-member\">Lorem Ipsum</span></a></li><li><a href=\"internet?ip=245.230.147.61\"><span class=\"item\">245.230.147.61</span> - <span class=\"whois-member\">American Expense</span></a></li><li><a href=\"internet?ip=184.251.216.55\"><span class=\"item\">184.251.216.55</span> - <span class=\"whois-member\">Hangman</span></a></li><li><a href=\"internet?ip=26.223.126.170\"><span class=\"item\">26.223.126.170</span> - <span class=\"whois-member\">Too Many Secrets</span></a></li><li><a href=\"internet?ip=165.109.178.58\"><span class=\"item\">165.109.178.58</span> - <span class=\"whois-member\">Hacker Inside</span></a></li><li><a href=\"internet?ip=73.149.39.124\"><span class=\"item\">73.149.39.124</span> - <span class=\"whois-member\">Life\'s Though</span></a></li><li><a href=\"internet?ip=181.40.68.82\"><span class=\"item\">181.40.68.82</span> - <span class=\"whois-member\">McDiabetes</span></a></li></ul>'),
(897202, 'Fourth Whois', 'Fourth Whois<ul class=\"whois\"><li><a href=\"internet?ip=7.33.217.248\"><span class=\"item\">7.33.217.248</span> - <span class=\"whois-member\">Ultimate Bank</span></a></li><li><a href=\"internet?ip=215.186.230.224\"><span class=\"item\">215.186.230.224</span> - <span class=\"whois-member\">Fsck You</span></a></li><li><a href=\"internet?ip=248.120.6.160\"><span class=\"item\">248.120.6.160</span> - <span class=\"whois-member\">Geek Pride Labs</span></a></li><li><a href=\"internet?ip=148.129.169.28\"><span class=\"item\">148.129.169.28</span> - <span class=\"whois-member\">Numataka Corp</span></a></li><li><a href=\"internet?ip=166.208.117.95\"><span class=\"item\">166.208.117.95</span> - <span class=\"whois-member\">NSA</span></a></li></ul>'),
(897203, 'NSA', '<div class=\"center\"><img src=\"img/nsa.png\"></div>'),
(897204, 'PUZZLE2', ''),
(897205, 'PUZZLE1', ''),
(897206, 'PUZZLE2', ''),
(897207, 'PUZZLE1', ''),
(897208, 'PUZZLE2', ''),
(897209, 'PUZZLE1', ''),
(897210, 'PUZZLE2', ''),
(897211, 'PUZZLE1', ''),
(897212, 'Hangman', '<style>\n#Hangman {border:1px #000000 solid;height:120px}\n</style>\n<div style=\"width:350px;position:relative;padding:4px\">\n<div style=\"font:bold 12pt \'\';color:#000000\">Hangman</div>\n<iframe id=\"Hangman\" src=\"http://www.thefreedictionary.com/_/WoD/hangman.aspx?#,x000000,x0000FF,10pt,\'\'\" width=\"100%\" scrolling=\"no\" frameborder=\"0\"></iframe>\n<div style=\"font:normal 8pt \'\';color:#000000\">\n<a style=\"color:#000000\" href=\"http://www.thefreedictionary.com/lookup.htm#Hangman\" rel=\"nofollow\">Hangman</a>\nprovided by <a style=\"color:#000000\" href=\"http://www.thefreedictionary.com/\">TheFreeDictionary</a>\n</div></div>'),
(897213, 'PUZZLE1', ''),
(897214, 'PUZZLE2', ''),
(897215, 'Fsck You', '<div class=\"center\"><img src=\"images/npc/linustorvalds.jpg\" alt=\"\"></div>'),
(897216, 'PUZZLE2', ''),
(897217, 'PUZZLE1', ''),
(897218, 'Gnirut', '<div class=\"center\"><img src=\"images/npc/alanturing.jpg\" alt=\"\"></div>'),
(897219, 'PUZZLE1', ''),
(897220, 'PUZZLE2', ''),
(897221, 'PUZZLE1', ''),
(897222, 'First Puzzle', 'Welcome to the First Puzzle. Follow the trail to get better softwares.<br/><br/>The First Puzzle is easy, but can you solve the next ones? Good luck :)'),
(897223, '3', '<div class=\"center\"><img src=\"images/npc/yuhack.jpg\" alt=\"\"></div>'),
(897224, '2', ''),
(897225, 'Hacker News', '<iframe src=\"http://ihackernews.com/\" width=\"100%\" height=\"500\" seamless></iframe><br/><br/> Disclaimer: (<a href=\"http://ihackernews.com/\">i</a>)<a href=\"https://news.ycombinator.com/\">HackerNews</a> is not related to Hacker Experience in any way.'),
(897226, '4', ''),
(897227, '7', ''),
(897228, '6', ''),
(897229, 'PUZZLE1', ''),
(897230, '8', '<iframe id=\"jodiframe\" src=\"http://wwwwwwwww.jodi.org/\" width=\"100%\" height=\"500px\" seamless=\"1\"></iframe>'),
(897231, 'PUZZLE1', ''),
(897232, 'PUZZLE2', ''),
(897233, 'Too Many Secrets', '<div class=\"center\"><img src=\"images/npc/toomanysecrets.JPG\" alt=\"\"></div>'),
(897234, 'PUZZLE2', ''),
(897235, 'PUZZLE1', ''),
(897236, 'PUZZLE2', ''),
(897237, 'Lorem Ipsum', '\n\n                                    <p style=\"max-width:600px; margin-left: 30px;\">\n    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam euismod luctus lorem eu bibendum. Suspendisse eget nisl \nvulputate, viverra orci at, malesuada neque. Sed scelerisque enim ac sem blandit sodales. Aenean et posuere tortor. \nNullam at mollis risus. Vivamus rhoncus pretium neque eu convallis. Nullam rhoncus gravida purus, non gravida tortor \nmolestie in. Proin ultricies semper eros, sit amet ornare lacus congue et.<br/><br/>\n Vivamus dapibus diam ut libero consectetur semper. Fusce pellentesque arcu nec iaculis suscipit. Sed eget nisi eget mauris sodales cursus sed non magna. Fusce porta nibh id lectus venenatis, id tempus felis lobortis. Quisque vel eleifend diam. Sed consequat feugiat nisl quis tempor. Nulla in orci at magna tempus euismod non id nunc. Maecenas vel malesuada nisi. Donec sed lacus eleifend, sollicitudin ipsum eu, vulputate libero. Donec bibendum tellus non faucibus sagittis. Mauris tincidunt vulputate mattis. \n <br/><br/>\n  In vel neque non felis convallis euismod non quis est. Quisque velit velit, posuere in turpis vel, varius sollicitudin nibh. Morbi ultrices hackris expiriencis amet nunc viverra varius. Donec ut quam libero. Etiam facilisis enim eu massa faucibus ullamcorper. Donec sollicitudin erat et porttitor porta. Integer sit amet viverra nisi. Integer vitae augue vestibulum, elementum justo in, luctus orci. Integer sit amet turpis luctus, commodo massa eu, malesuada quam. Donec feugiat, tortor in molestie ornare, mi mi viverra mauris, id pharetra purus augue ac sem. \n                                    </p>'),
(897238, 'PUZZLE2', ''),
(897239, 'PUZZLE1', ''),
(897240, 'PUZZLE2', ''),
(897241, 'PUZZLE1', ''),
(897242, 'PUZZLE2', ''),
(897243, 'PUZZLE1', ''),
(897244, 'PUZZLE2', ''),
(897245, 'PUZZLE1', ''),
(897246, 'PUZZLE2', ''),
(897247, 'Eduard Khil', '<div class=\"center\"><img src=\"images/npc/eduardkhil.jpg\" alt=\"\"></div>'),
(897248, 'PUZZLE2', ''),
(897249, 'PUZZLE1', ''),
(897250, 'PUZZLE2', ''),
(897251, 'ISP - Internet Service Provider', ''),
(897252, 'Bitcoin Market', '<span id=\"btc\"></span>'),
(897253, 'NPC1', ''),
(897254, 'NPC3', ''),
(897255, 'NPC2', ''),
(897256, 'Download Center', 'Welcome to the download center! <br/><br/> Download whatever you need. Unlimited bandwidth! <br/><br/> <strong>Username:</strong> download<br/><strong>Password:</strong> download'),
(897257, 'Numataka Corp', ''),
(897258, 'Safenet', ''),
(897259, 'FBI', ''),
(897260, 'Torrent Market', ''),
(897261, 'First International Bank', 'Welcome to the <strong>First International Bank</strong>.<br/><br/>We have a very modest defense, but at least you didn\'t have to pay for an account.<br/><br/><a href=\"internet?action=login&type=bank\">Login to your account</a>.'),
(897262, 'American Expense', '<div class=\"center\">Welcome to <strong>American Expense</strong>.<br/><a href=\"internet?action=login&type=bank\">Login</a><br/><br/><img src=\"images/npc/american-expense.jpg\"></div>'),
(897263, 'HEBC', '<div class=\"center\">Welcome to <strong>HEBC</strong>.<br/><a href=\"internet?action=login&type=bank\">Login</a><br/><br/><img src=\"images/npc/hebc.jpg\"></div>'),
(897264, 'Ultimate Bank', 'Welcome to the <strong>Ultimate Bank</strong>.<br/><br/>Safety matters! You won\'t find a safer bank.<br/><br/><a href=\"internet?action=login&type=bank\">Login now</a>'),
(897265, 'Swiss International Bank', '<div class=\"center\">Welcome to <strong>Swiss International Bank</strong>.<br/><a href=\"internet?action=login&type=bank\">Offshore account login</a><br/><br/><img src=\"images/npc/swiss.svg\"></div>'),
(897266, 'McDiabetes', '<div class=\"center\"><img alt=\"McDiabetes\" title=\"McDiabetes\" src=\"images/npc/mcdiabetes.jpg\"><br/><br/></div>'),
(897267, 'uPay', '<div class=\"center\"><img alt=\"uPay\" title=\"uPay\" src=\"images/npc/upay.jpg\"><br/><br/></div>'),
(897268, 'Capitalism', '<div class=\"center\"><img alt=\"Capitalism\" title=\"Capitalism\" src=\"images/npc/capitalism.png\"><br/><br/></div>'),
(897269, 'Gimme Your Bucks', '<div class=\"center\"><img alt=\"Gimme your bucks\" title=\"Gimme your bucks\" src=\"images/npc/gimmeyourbucks.jpeg\"><br/><br/></div>'),
(897270, 'Very Cheesy Pictures', '<div class=\"center\"><img alt=\"Very Cheesy Pictures\" title=\"Very Cheesy Pictures\" src=\"images/npc/verycheesypictures.jpg\"><br/><br/></div>'),
(897271, 'Fiasco Systems', '<div class=\"center\"><img alt=\"Fiasco\" title=\"Fiasco\" src=\"images/npc/fiasco.jpg\"><br/><br/></div>'),
(897272, 'elgooG', '<div class=\"center\"><img alt=\"elgooG\" title=\"elgooG\" src=\"images/npc/elgoog.png\"><br/><strong>Don\'t be evil.</strong><br/><span class=\"small\">unless it is profitable.</span></div>'),
(897273, 'Microlost', '<div class=\"center\"><img alt=\"Microlost\" title=\"Microlost\" src=\"images/npc/microlost.jpg\"><br/><br/>Will work for a while.</div>'),
(897274, 'Murder King', '<div class=\"center\"><img alt=\"Murder King\" title=\"Murder King\" src=\"images/npc/murderking.jpg\"><br/><br/><span class=\"small\">You\'ll get it our way.</span></div>'),
(897275, 'Hell Computers', '<div class=\"center\"><img alt=\"Hell Computers\" title=\"Hell Computers\" src=\"images/npc/hell.jpg\"><br/><br/></div>'),
(897276, 'Pineapple', '<div class=\"center\"><img alt=\"Pineapple\" title=\"Pineapple\" src=\"images/npc/pineapple.png\"><br/><br/>Appearence Costs <sup>&reg;</sup></div>'),
(897277, 'Stalker', '<div class=\"center\"><img alt=\"Stalker\" title=\"Stalker\" src=\"images/npc/stalker.jpg\"><br/><br/><span class=\"small\">Wasting peoples lives since 2004.</span></div>'),
(897278, 'WTF', '<div class=\"center\"><img alt=\"WTF\" title=\"WTF\" src=\"images/npc/wtf.jpg\"><br/><br/></div>'),
(897279, 'Noplace', '<div class=\"center\"><img alt=\"Noplace\" title=\"Noplace\" src=\"images/npc/noplace.jpg\"><br/><br/></div>'),
(897280, 'GayPal', '<div class=\"center\"><img alt=\"Gaypal\" title=\"Gaypal\" src=\"images/npc/gaypal.jpg\"><br/><br/></div>'),
(897281, 'Broke', '<div class=\"center\"><img alt=\"Broke\" title=\"Broke\" src=\"images/npc/broke.gif\"><br/><br/></div>'),
(897282, 'Hacker Inside', '<div class=\"center\"><img alt=\"Hacker Inside\" title=\"Hacker Inside\" src=\"images/npc/hackerinside.svg\"><br/><br/><span class=\"small\">Lammer outside</span></div>'),
(897283, 'Nokids', '<div class=\"center\"><img alt=\"Nokids\" title=\"Nokids\" src=\"images/npc/nokids.jpg\"><br/><br/></div>'),
(897284, 'CatVideos', '<div class=\"center\"><img alt=\"catVideos\" title=\"catVideos\" src=\"images/npc/catvideos.jpg\"><br/><br/><span class=\"small\">Don\'t read the comments.</span></div>'),
(897285, 'Titanic', '<div class=\"center\"><img alt=\"Titanic\" title=\"Titanic\" src=\"images/npc/titanic.jpg\"><br/><br/></div>'),
(897286, 'Life\'s Though', '<div class=\"center\"><img alt=\"Life\'s tough\" title=\"Life\'s tough\" src=\"images/npc/lifestough.jpg\"><br/><br/></div>'),
(897287, 'Fail', '<div class=\"center\"><img alt=\"Fail\" title=\"Fail\" src=\"images/npc/fail.jpg\"><br/><br/></div>'),
(897288, 'Oh Deere', '<div class=\"center\"><img alt=\"Oh Deere\" title=\"Oh Deere\" src=\"images/npc/ohdeere.JPG\"><br/><br/></div>'),
(897289, 'Elvi\'s', '<div class=\"center\"><img alt=\"Elvi\'s\" title=\"Elvi\'s\" src=\"images/npc/elvis.jpg\"><br/><br/></div>'),
(897290, 'Insane', '<div class=\"center\"><img alt=\"Insane\" title=\"Insane\" src=\"/images/npc/insane.JPG\"><br/><br/></div>'),
(897291, 'Abersnobby & Bitch', '<div class=\"center\"><img alt=\"Abersnobby & Bitch\" title=\"Abersnobby & Bitch\" src=\"images/npc/abersnobby.jpg\"><br/><br/></div>'),
(897292, 'Sexsi', '<div class=\"center\"><img alt=\"Sexsi\" title=\"Sexsi\" src=\"images/npc/sexsi.jpg\"><br/><br/><span class=\"small\">When there is no coke.</span></div>'),
(897293, 'Oops', '<div class=\"center\"><img alt=\"Oops\" title=\"Oops\" src=\"images/npc/oops.jpg\"><br/><br/><span class=\"small\">Consider it gone.</span></div>'),
(897294, 'Nothing to do', '<div class=\"center\"><img alt=\"Nothing to do\" title=\"Nothing to do\" src=\"images/npc/nothingtodo.jpg\"><br/><br/></div>'),
(897295, 'Toshibe', '<div class=\"center\"><img alt=\"Toshibe\" title=\"Toshibe\" src=\"images/npc/toshibe.png\"><br/><br/></div>'),
(897296, 'Sunk Microsystems', '<div class=\"center\"><img alt=\"Sunk\" title=\"Sunk\" src=\"images/npc/sunk.jpg\"><br/><br/></div>'),
(897297, 'Nuke', '<div class=\"center\"><img alt=\"Nuke\" title=\"Nuke\" src=\"images/npc/nuke.png\" style=\"background-color: #000;\"><br/><br/></div>'),
(897298, 'Weird', '<div class=\"center\"><img alt=\"Weird\" title=\"Weird\" src=\"images/npc/weird.gif\"><br/><br/></div>'),
(897299, 'Yahoo?', '<div class=\"center\"><img alt=\"Yahoo?\" title=\"Yahoo?\" src=\"images/npc/yahoo.jpg\"><br/><br/></div>'),
(897300, 'Pervert', '<div class=\"center\"><img alt=\"Pervert\" title=\"Pervert\" src=\"images/npc/pervert.jpg\"><br/><br/></div>');*/

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

/*INSERT INTO `npc_info_pt` (`npcID`, `name`, `web`) VALUES
(897198, 'Geek Pride Labs', ''),
(897199, 'Primeiro Whois', 'Bem-vindo ao primeiro whois!<ul class=\"whois\"><li><a href=\"internet?ip=229.147.249.76\"><span \nclass=\"item\">229.147.249.76</span> - <span \nclass=\"whois-member\">Centro de Downloads</span></a></li><li><a href=\"internet?ip=245.199.71.185\"><span \nclass=\"item\">245.199.71.185</span> - <span \nclass=\"whois-member\">Mercado de Torrents</span></a></li><li><a href=\"internet?ip=3.177.62.120\"><span \nclass=\"item\">3.177.62.120</span> - <span \nclass=\"whois-member\">Primeiro Enigma</span></a></li><li><a href=\"internet?ip=66.120.37.212\"><span class=\"item\">66.120.37.212</span> - <span class=\"whois-member\">Primeiro Banco Internacional</span></a></li><li><a href=\"internet?ip=95.43.152.141\"><span class=\"item\">95.43.152.141</span> - <span class=\"whois-member\">elgooG</span></a></li><li><a href=\"internet?ip=132.81.171.180\"><span class=\"item\">132.81.171.180</span> - <span class=\"whois-member\">Murder King</span></a></li><li><a href=\"internet?ip=47.53.234.121\"><span class=\"item\">47.53.234.121</span> - <span class=\"whois-member\">Pineapple</span></a></li></ul>Trending Sites:<ul class=\"whois\"><li><a href=\"internet?ip=109.211.177.244\"><span class=\"item\">109.211.177.244</span> - <span class=\"whois-member\">ISP - Provedor de ServiÃ§os</span></a></li><li><a href=\"internet?ip=166.208.117.95\"><span class=\"item\">166.208.117.95</span> - <span class=\"whois-member\">NSA</span></a></li><li><a href=\"internet?ip=41.248.242.231\"><span \nclass=\"item\">41.248.242.231</span> - <span \nclass=\"whois-member\">Hacker News</span></a></li></ul>'),
(897200, 'Terceiro Whois', 'Terceiro Whois<ul class=\"whois\"><li><a href=\"internet?ip=92.38.187.227\"><span class=\"item\">92.38.187.227</span> - <span class=\"whois-member\">Banco SuÃ­Ã§o Internacional</span></a></li><li><a href=\"internet?ip=231.166.11.195\"><span class=\"item\">231.166.11.195</span> - <span class=\"whois-member\">Eduard Khil</span></a></li><li><a href=\"internet?ip=156.164.72.82\"><span class=\"item\">156.164.72.82</span> - <span class=\"whois-member\">Gnirut</span></a></li><li><a href=\"internet?ip=203.73.196.159\"><span class=\"item\">203.73.196.159</span> - <span class=\"whois-member\">Weird</span></a></li><li><a href=\"internet?ip=228.226.157.183\"><span class=\"item\">228.226.157.183</span> - <span class=\"whois-member\">Yahoo?</span></a></li><li><a href=\"internet?ip=184.217.131.212\"><span class=\"item\">184.217.131.212</span> - <span class=\"whois-member\">Mercado Bitcoin</span></a></li><li><a href=\"internet?ip=201.193.46.24\"><span class=\"item\">201.193.46.24</span> - <span class=\"whois-member\">FBI</span></a></li></ul>'),
(897201, 'Segundo Whois', 'Second Whois, LTDA.<ul class=\"whois\"><li><a href=\"internet?ip=38.177.91.38\"><span class=\"item\">38.177.91.38</span> - <span class=\"whois-member\">HEBC</span></a></li><li><a href=\"internet?ip=18.106.233.172\"><span class=\"item\">18.106.233.172</span> - <span class=\"whois-member\">Lorem Ipsum</span></a></li><li><a href=\"internet?ip=245.230.147.61\"><span class=\"item\">245.230.147.61</span> - <span class=\"whois-member\">American Expense</span></a></li><li><a href=\"internet?ip=184.251.216.55\"><span class=\"item\">184.251.216.55</span> - <span class=\"whois-member\">Forca</span></a></li><li><a href=\"internet?ip=26.223.126.170\"><span class=\"item\">26.223.126.170</span> - <span class=\"whois-member\">Too Many Secrets</span></a></li><li><a href=\"internet?ip=165.109.178.58\"><span class=\"item\">165.109.178.58</span> - <span class=\"whois-member\">Hacker Inside</span></a></li><li><a href=\"internet?ip=73.149.39.124\"><span class=\"item\">73.149.39.124</span> - <span class=\"whois-member\">Life\'s Though</span></a></li><li><a href=\"internet?ip=181.40.68.82\"><span class=\"item\">181.40.68.82</span> - <span class=\"whois-member\">McDiabetes</span></a></li></ul>'),
(897202, 'Quarto Whois', 'Quarto Whois<ul class=\"whois\"><li><a href=\"internet?ip=7.33.217.248\"><span class=\"item\">7.33.217.248</span> - <span class=\"whois-member\">Banco Ultimate</span></a></li><li><a href=\"internet?ip=215.186.230.224\"><span class=\"item\">215.186.230.224</span> - <span class=\"whois-member\">Fsck You</span></a></li><li><a href=\"internet?ip=248.120.6.160\"><span class=\"item\">248.120.6.160</span> - <span class=\"whois-member\">Geek Pride Labs</span></a></li><li><a href=\"internet?ip=148.129.169.28\"><span class=\"item\">148.129.169.28</span> - <span class=\"whois-member\">Numataka Corp</span></a></li><li><a href=\"internet?ip=166.208.117.95\"><span class=\"item\">166.208.117.95</span> - <span class=\"whois-member\">NSA</span></a></li></ul>'),
(897203, 'NSA', '<div class=\"center\"><img src=\"img/nsa.png\"></div>'),
(897204, 'PUZZLE2', ''),
(897205, 'PUZZLE1', ''),
(897206, 'PUZZLE2', ''),
(897207, 'PUZZLE1', ''),
(897208, 'PUZZLE2', ''),
(897209, 'PUZZLE1', ''),
(897210, 'PUZZLE2', ''),
(897211, 'PUZZLE1', ''),
(897212, 'Forca', '<style>#Hangman {border:1px #000000 solid;background-color:;height:120px}</style>\n<div style=\"width:350px;position:relative;background-color:;padding:4px\">\n<div style=\"font:bold 12pt Arial;color:#000000\">Forca</div>\n<iframe id=\"Hangman\" src=\"http://pt.thefreedictionary.com/_/WoD/hangman.aspx?lang=pt#,x000000,x0000FF,10pt,Arial\" width=\"100%\" scrolling=\"no\" frameborder=\"0\"></iframe>\n<div style=\"font:normal 8pt Arial;color:#000000\">\n<a style=\"color:#000000\" href=\"http://pt.thefreedictionary.com/webmasters.htm\">Forca</a>\n fornecido por <a style=\"color:#000000\" href=\"http://pt.thefreedictionary.com/\">The Free Dictionary</a>\n</div></div>'),
(897213, 'PUZZLE1', ''),
(897214, 'PUZZLE2', ''),
(897215, 'Fsck You', '<div class=\"center\"><img src=\"images/npc/linustorvalds.jpg\" alt=\"\"></div>'),
(897216, 'PUZZLE2', ''),
(897217, 'PUZZLE1', ''),
(897218, 'Gnirut', '<div class=\"center\"><img src=\"images/npc/alanturing.jpg\" alt=\"\"></div>'),
(897219, 'PUZZLE1', ''),
(897220, 'PUZZLE2', ''),
(897221, 'PUZZLE1', ''),
(897222, 'Primeiro Enigma', 'Bem-vindo ao primeiro enigma. Siga a trilha para conseguir melhores softwares.<br/><br/>O primeiro enigma Ã© fÃ¡cil, mas serÃ¡ que vocÃª consegue resolver os prÃ³ximos? Boa sorte :)'),
(897223, '3', '<div class=\"center\"><img src=\"images/npc/yuhack.jpg\" alt=\"\"></div>'),
(897224, '2', ''),
(897225, 'Hacker News', '<iframe src=\"http://ihackernews.com/\" width=\"100%\" height=\"500\" seamless></iframe><br/><br/> Aviso: (<a href=\"http://ihackernews.com/\">i</a>)<a href=\"https://news.ycombinator.com/\">HackerNews</a> nÃ£o tem nenhuma relaÃ§Ã£o com Hacker Experience.'),
(897226, '4', ''),
(897227, '7', ''),
(897228, '6', ''),
(897229, 'PUZZLE1', ''),
(897230, '8', '<iframe id=\"jodiframe\" src=\"http://wwwwwwwww.jodi.org/\" width=\"100%\" height=\"500px\" seamless=\"1\"></iframe>'),
(897231, 'PUZZLE1', ''),
(897232, 'PUZZLE2', ''),
(897233, 'Too Many Secrets', '<div class=\"center\"><img src=\"images/npc/toomanysecrets.JPG\" alt=\"\"></div>'),
(897234, 'PUZZLE2', ''),
(897235, 'PUZZLE1', ''),
(897236, 'PUZZLE2', ''),
(897237, 'Lorem Ipsum', '\n\n                                    <p style=\"max-width:600px; \nmargin-left: 30px;\">\n    Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Nam euismod luctus lorem eu bibendum. Suspendisse eget \nnisl \nvulputate, viverra orci at, malesuada neque. Sed scelerisque enim\n ac sem blandit sodales. Aenean et posuere tortor. \nNullam at mollis \nrisus. Vivamus rhoncus pretium neque eu convallis. Nullam rhoncus \ngravida purus, non gravida tortor \nmolestie in. Proin ultricies semper \neros, sit amet ornare lacus congue et.<br/><br/>\n Vivamus \ndapibus diam ut libero consectetur semper. Fusce pellentesque arcu nec \niaculis suscipit. Sed eget nisi eget mauris sodales cursus sed non \nmagna. Fusce porta nibh id lectus venenatis, id tempus felis lobortis. \nQuisque vel eleifend diam. Sed consequat feugiat nisl quis tempor. Nulla\n in orci at magna tempus euismod non id nunc. Maecenas vel malesuada \nnisi. Donec sed lacus eleifend, sollicitudin ipsum eu, vulputate libero.\n Donec bibendum tellus non faucibus sagittis. Mauris tincidunt vulputate\n mattis. \n <br/><br/>\n  In vel neque non felis convallis \neuismod non quis est. Quisque velit velit, posuere in turpis vel, varius\n sollicitudin nibh. Morbi ultrices hackris expiriencis amet nunc viverra\n varius. Donec ut quam libero. Etiam facilisis enim eu massa faucibus \nullamcorper. Donec sollicitudin erat et porttitor porta. Integer sit \namet viverra nisi. Integer vitae augue vestibulum, elementum justo in, \nluctus orci. Integer sit amet turpis luctus, commodo massa eu, malesuada\n quam. Donec feugiat, tortor in molestie ornare, mi mi viverra mauris, \nid pharetra purus augue ac sem. \n                                   \n </p>'),
(897238, 'PUZZLE2', ''),
(897239, 'PUZZLE1', ''),
(897240, 'PUZZLE2', ''),
(897241, 'PUZZLE1', ''),
(897242, 'PUZZLE2', ''),
(897243, 'PUZZLE1', ''),
(897244, 'PUZZLE2', ''),
(897245, 'PUZZLE1', ''),
(897246, 'PUZZLE2', ''),
(897247, 'Eduard Khil', '<div class=\"center\"><img src=\"images/npc/eduardkhil.jpg\" alt=\"\"></div>'),
(897248, 'PUZZLE2', ''),
(897249, 'PUZZLE1', ''),
(897250, 'PUZZLE2', ''),
(897251, 'ISP - Provedor de ServiÃ§os', ''),
(897252, 'Mercado Bitcoin', '<span id=\"btc\"></span>'),
(897253, 'NPC1', ''),
(897254, 'NPC3', ''),
(897255, 'NPC2', ''),
(897256, 'Centro de Downloads', 'Bem-vindo ao centro de downloads! <br/><br/> FaÃ§a download do que vocÃª precisar. TransferÃªncia ilimitada!<br/><br/> <strong>UsuÃ¡rio:</strong> download<br/><strong>Senha:</strong> download'),
(897257, 'Numataka Corp', ''),
(897258, 'Safenet', ''),
(897259, 'FBI', ''),
(897260, 'Mercado de Torrents', ''),
(897261, 'Primeiro Banco Internacional', 'Bem-vindo ao <strong>Primeiro Banco Internacional</strong>.<br/><br/>NÃ³s temos uma proteÃ§Ã£o muito modesta, mas pelo menos vocÃª nÃ£o teve que pagar por sua conta.<br/><br/><a href=\"internet?action=login&type=bank\">Login to your account</a>.'),
(897262, 'American Expense', '<div class=\"center\">Bem-vindo ao <strong>American Expense</strong>.<br/><a href=\"internet?action=login&type=bank\">Entrar</a><br/><br/><img src=\"images/npc/american-expense.jpg\"></div>'),
(897263, 'HEBC', '<div class=\"center\">Bem-vindo ao <strong>HEBC</strong>.<br/><a href=\"internet?action=login&type=bank\">Entrar</a><br/><br/><img src=\"images/npc/hebc.jpg\"></div>'),
(897264, 'Banco Ultimate', 'Bem-vindo ao <strong>Banco Ultimate/strong>.<br/><br/>SeguranÃ§a importa! VocÃª nÃ£o vai encontrar um banco mais seguro.<br/><br/><a href=\"internet?action=login&type=bank\">Entrar</a>'),
(897265, 'Banco SuÃ­Ã§o Internacional', '<div class=\"center\">Bem-vindo ao <strong>Banco SuÃ­Ã§o Internacional</strong>.<br/><a href=\"internet?action=login&type=bank\">Entrar na sua conta</a><br/><br/><img src=\"images/npc/swiss.svg\"></div>'),
(897266, 'McDiabetes', '<div class=\"center\"><img alt=\"McDiabetes\" title=\"McDiabetes\" src=\"images/npc/mcdiabetes.jpg\"><br/><br/></div>'),
(897267, 'uPay', '<div class=\"center\"><img alt=\"uPay\" title=\"uPay\" src=\"images/npc/upay.jpg\"><br/><br/></div>'),
(897268, 'Capitalism', '<div class=\"center\"><img alt=\"Capitalism\" title=\"Capitalism\" src=\"images/npc/capitalism.png\"><br/><br/></div>'),
(897269, 'Gimme Your Bucks', '<div class=\"center\"><img alt=\"Gimme your bucks\" title=\"Gimme your bucks\" src=\"images/npc/gimmeyourbucks.jpeg\"><br/><br/></div>'),
(897270, 'Very Cheesy Pictures', '<div class=\"center\"><img alt=\"Very Cheesy Pictures\" title=\"Very Cheesy Pictures\" src=\"images/npc/verycheesypictures.jpg\"><br/><br/></div>'),
(897271, 'Fiasco Systems', '<div class=\"center\"><img alt=\"Fiasco\" title=\"Fiasco\" src=\"images/npc/fiasco.jpg\"><br/><br/></div>'),
(897272, 'elgooG', '<div class=\"center\"><img alt=\"elgooG\" title=\"elgooG\" src=\"images/npc/elgoog.png\"><br/><strong>Don\'t be evil.</strong><br/><span class=\"small\">a menos que compense.</span></div>'),
(897273, 'Microlost', '<div class=\"center\"><img alt=\"Microlost\" title=\"Microlost\" src=\"images/npc/microlost.jpg\"><br/><br/>Vai funcionar por um tempo.</div>'),
(897274, 'Murder King', '<div class=\"center\"><img alt=\"Murder King\" title=\"Murder King\" src=\"images/npc/murderking.jpg\"><br/><br/><span class=\"small\">You\'ll get it our way.</span></div>'),
(897275, 'Computadores Hell', '<div class=\"center\"><img alt=\"Hell Computers\" title=\"Hell Computers\" src=\"images/npc/hell.jpg\"><br/><br/></div>'),
(897276, 'Pineapple', '<div class=\"center\"><img alt=\"Pineapple\" title=\"Pineapple\" src=\"images/npc/pineapple.png\"><br/><br/>AparÃªncia Custa <sup>&reg;</sup></div>'),
(897277, 'Stalker', '<div class=\"center\"><img alt=\"Stalker\" title=\"Stalker\" src=\"images/npc/stalker.jpg\"><br/><br/><span class=\"small\">DesperdiÃ§ando a vida das pessoas desde 2004.</span></div>'),
(897278, 'WTF', '<div class=\"center\"><img alt=\"WTF\" title=\"WTF\" src=\"images/npc/wtf.jpg\"><br/><br/></div>'),
(897279, 'Noplace', '<div class=\"center\"><img alt=\"Noplace\" title=\"Noplace\" src=\"images/npc/noplace.jpg\"><br/><br/></div>'),
(897280, 'GayPal', '<div class=\"center\"><img alt=\"Gaypal\" title=\"Gaypal\" src=\"images/npc/gaypal.jpg\"><br/><br/></div>'),
(897281, 'Broke', '<div class=\"center\"><img alt=\"Broke\" title=\"Broke\" src=\"images/npc/broke.gif\"><br/><br/></div>'),
(897282, 'Hacker Inside', '<div class=\"center\"><img alt=\"Hacker Inside\" title=\"Hacker Inside\" src=\"images/npc/hackerinside.svg\"><br/><br/><span class=\"small\">Lammer outside</span></div>'),
(897283, 'Nokids', '<div class=\"center\"><img alt=\"Nokids\" title=\"Nokids\" src=\"images/npc/nokids.jpg\"><br/><br/></div>'),
(897284, 'CatVIdeos', '<div class=\"center\"><img alt=\"catVideos\" title=\"catVideos\" src=\"images/npc/catvideos.jpg\"><br/><br/><span class=\"small\">NÃ£o leia os comentÃ¡rios.</span></div>'),
(897285, 'Titanic', '<div class=\"center\"><img alt=\"Titanic\" title=\"Titanic\" src=\"images/npc/titanic.jpg\"><br/><br/></div>'),
(897286, 'Life\'s Though', '<div class=\"center\"><img alt=\"Life\'s tough\" title=\"Life\'s tough\" src=\"images/npc/lifestough.jpg\"><br/><br/></div>'),
(897287, 'Fail', '<div class=\"center\"><img alt=\"Fail\" title=\"Fail\" src=\"images/npc/fail.jpg\"><br/><br/></div>'),
(897288, 'Oh Deere', '<div class=\"center\"><img alt=\"Oh Deere\" title=\"Oh Deere\" src=\"images/npc/ohdeere.JPG\"><br/><br/></div>'),
(897289, 'Elvi\'s', '<div class=\"center\"><img alt=\"Elvi\'s\" title=\"Elvi\'s\" src=\"images/npc/elvis.jpg\"><br/><br/></div>'),
(897290, 'Insane', '<div class=\"center\"><img alt=\"Insane\" title=\"Insane\" src=\"/images/npc/insane.JPG\"><br/><br/></div>'),
(897291, 'Abersnobby & Bitch', '<div class=\"center\"><img alt=\"Abersnobby & Bitch\" title=\"Abersnobby & Bitch\" src=\"images/npc/abersnobby.jpg\"><br/><br/></div>'),
(897292, 'Sexsi', '<div class=\"center\"><img alt=\"Sexsi\" title=\"Sexsi\" src=\"images/npc/sexsi.jpg\"><br/><br/><span class=\"small\">Pode ser?</span></div>'),
(897293, 'Oops', '<div class=\"center\"><img alt=\"Oops\" title=\"Oops\" src=\"images/npc/oops.jpg\"><br/><br/><span class=\"small\">Consider it gone.</span></div>'),
(897294, 'Nothing to do', '<div class=\"center\"><img alt=\"Nothing to do\" title=\"Nothing to do\" src=\"images/npc/nothingtodo.jpg\"><br/><br/></div>'),
(897295, 'Toshibe', '<div class=\"center\"><img alt=\"Toshibe\" title=\"Toshibe\" src=\"images/npc/toshibe.png\"><br/><br/></div>'),
(897296, 'Sunk Microsystems', '<div class=\"center\"><img alt=\"Sunk\" title=\"Sunk\" src=\"images/npc/sunk.jpg\"><br/><br/></div>'),
(897297, 'Nuke', '<div class=\"center\"><img alt=\"Nuke\" title=\"Nuke\" src=\"images/npc/nuke.png\" style=\"background-color: #000;\"><br/><br/></div>'),
(897298, 'Weird', '<div class=\"center\"><img alt=\"Weird\" title=\"Weird\" src=\"images/npc/weird.gif\"><br/><br/></div>'),
(897299, 'Yahoo?', '<div class=\"center\"><img alt=\"Yahoo?\" title=\"Yahoo?\" src=\"images/npc/yahoo.jpg\"><br/><br/></div>'),
(897300, 'Pervert', '<div class=\"center\"><img alt=\"Pervert\" title=\"Pervert\" src=\"images/npc/pervert.jpg\"><br/><br/></div>');*/

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

/*INSERT INTO `npc_key` (`npcID`, `key`) VALUES
(897261, 'BANK/1'),
(897263, 'BANK/2'),
(897262, 'BANK/3'),
(897265, 'BANK/4'),
(897264, 'BANK/5'),
(897252, 'BITCOIN'),
(897256, 'DC'),
(897257, 'EVILCORP'),
(897259, 'FBI'),
(897272, 'HIRER/LEVEL1/1'),
(897267, 'HIRER/LEVEL1/10'),
(897266, 'HIRER/LEVEL1/11'),
(897269, 'HIRER/LEVEL1/12'),
(897268, 'HIRER/LEVEL1/13'),
(897271, 'HIRER/LEVEL1/14'),
(897270, 'HIRER/LEVEL1/15'),
(897274, 'HIRER/LEVEL1/2'),
(897273, 'HIRER/LEVEL1/3'),
(897276, 'HIRER/LEVEL1/4'),
(897275, 'HIRER/LEVEL1/5'),
(897278, 'HIRER/LEVEL1/6'),
(897277, 'HIRER/LEVEL1/7'),
(897280, 'HIRER/LEVEL1/8'),
(897279, 'HIRER/LEVEL1/9'),
(897282, 'HIRER/LEVEL2/1'),
(897281, 'HIRER/LEVEL2/10'),
(897284, 'HIRER/LEVEL2/2'),
(897283, 'HIRER/LEVEL2/3'),
(897286, 'HIRER/LEVEL2/4'),
(897285, 'HIRER/LEVEL2/5'),
(897288, 'HIRER/LEVEL2/6'),
(897287, 'HIRER/LEVEL2/7'),
(897290, 'HIRER/LEVEL2/8'),
(897289, 'HIRER/LEVEL2/9'),
(897292, 'HIRER/LEVEL3/1'),
(897291, 'HIRER/LEVEL3/10'),
(897294, 'HIRER/LEVEL3/2'),
(897293, 'HIRER/LEVEL3/3'),
(897296, 'HIRER/LEVEL3/4'),
(897295, 'HIRER/LEVEL3/5'),
(897298, 'HIRER/LEVEL3/6'),
(897297, 'HIRER/LEVEL3/7'),
(897300, 'HIRER/LEVEL3/8'),
(897299, 'HIRER/LEVEL3/9'),
(897251, 'ISP'),
(897198, 'MD'),
(897253, 'NPC/1'),
(897255, 'NPC/2'),
(897254, 'NPC/3'),
(897203, 'NSA'),
(897222, 'PUZZLE/1'),
(897234, 'PUZZLE/10'),
(897233, 'PUZZLE/11'),
(897236, 'PUZZLE/12'),
(897235, 'PUZZLE/13'),
(897238, 'PUZZLE/14'),
(897237, 'PUZZLE/15'),
(897240, 'PUZZLE/16'),
(897239, 'PUZZLE/17'),
(897242, 'PUZZLE/18'),
(897241, 'PUZZLE/19'),
(897224, 'PUZZLE/2'),
(897210, 'PUZZLE/20'),
(897211, 'PUZZLE/21'),
(897212, 'PUZZLE/22'),
(897213, 'PUZZLE/23'),
(897206, 'PUZZLE/24'),
(897207, 'PUZZLE/25'),
(897208, 'PUZZLE/26'),
(897209, 'PUZZLE/27'),
(897218, 'PUZZLE/28'),
(897219, 'PUZZLE/29'),
(897223, 'PUZZLE/3'),
(897244, 'PUZZLE/30'),
(897243, 'PUZZLE/31'),
(897250, 'PUZZLE/32'),
(897249, 'PUZZLE/33'),
(897248, 'PUZZLE/34'),
(897247, 'PUZZLE/35'),
(897246, 'PUZZLE/36'),
(897245, 'PUZZLE/37'),
(897232, 'PUZZLE/38'),
(897231, 'PUZZLE/39'),
(897226, 'PUZZLE/4'),
(897220, 'PUZZLE/40'),
(897221, 'PUZZLE/41'),
(897204, 'PUZZLE/42'),
(897205, 'PUZZLE/43'),
(897216, 'PUZZLE/44'),
(897217, 'PUZZLE/45'),
(897214, 'PUZZLE/46'),
(897215, 'PUZZLE/47'),
(897225, 'PUZZLE/5'),
(897228, 'PUZZLE/6'),
(897227, 'PUZZLE/7'),
(897230, 'PUZZLE/8'),
(897229, 'PUZZLE/9'),
(897258, 'SAFENET'),
(897260, 'TORRENT'),
(897199, 'WHOIS/1'),
(897201, 'WHOIS/2'),
(897200, 'WHOIS/3'),
(897202, 'WHOIS/4');*/

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

/*INSERT INTO `npc_reset` (`npcID`, `nextScan`) VALUES
(897208, '2019-11-17 14:54:59'),
(897233, '2019-11-17 14:54:59'),
(897300, '2019-11-17 14:54:59'),
(897237, '2019-11-17 15:54:59'),
(897201, '2019-11-17 16:54:59'),
(897256, '2019-11-17 16:54:59'),
(897214, '2019-11-17 18:54:59'),
(897250, '2019-11-17 18:54:59'),
(897280, '2019-11-17 18:54:59'),
(897236, '2019-11-17 19:54:59'),
(897241, '2019-11-17 19:54:59'),
(897258, '2019-11-17 19:54:59'),
(897245, '2019-11-17 20:54:59'),
(897298, '2019-11-17 20:54:59'),
(897207, '2019-11-17 21:54:59'),
(897252, '2019-11-17 21:54:59'),
(897255, '2019-11-17 21:54:59'),
(897231, '2019-11-17 22:54:59'),
(897281, '2019-11-17 22:54:59'),
(897225, '2019-11-17 23:54:59'),
(897264, '2019-11-17 23:54:59'),
(897276, '2019-11-17 23:54:59'),
(897210, '2019-11-18 00:54:59'),
(897227, '2019-11-18 00:54:59'),
(897228, '2019-11-18 00:54:59'),
(897243, '2019-11-18 01:54:59'),
(897290, '2019-11-18 01:54:59'),
(897238, '2019-11-18 02:54:59'),
(897266, '2019-11-18 02:54:59'),
(897235, '2019-11-18 04:54:59'),
(897240, '2019-11-18 04:54:59'),
(897277, '2019-11-18 04:54:59'),
(897295, '2019-11-18 04:54:59'),
(897223, '2019-11-18 05:54:59'),
(897270, '2019-11-18 06:54:59'),
(897296, '2019-11-18 06:54:59'),
(897211, '2019-11-18 07:54:59'),
(897219, '2019-11-18 07:54:59'),
(897226, '2019-11-18 08:54:59'),
(897198, '2019-11-18 09:54:59'),
(897251, '2019-11-18 09:54:59'),
(897283, '2019-11-18 09:54:59'),
(897293, '2019-11-18 09:54:59'),
(897205, '2019-11-18 10:54:59'),
(897213, '2019-11-18 10:54:59'),
(897292, '2019-11-18 10:54:59'),
(897288, '2019-11-18 11:54:59'),
(897222, '2019-11-18 13:54:59'),
(897232, '2019-11-18 13:54:59'),
(897199, '2019-11-18 14:54:59'),
(897224, '2019-11-18 14:54:59'),
(897286, '2019-11-18 15:54:59'),
(897294, '2019-11-18 15:54:59'),
(897216, '2019-11-18 16:54:59'),
(897253, '2019-11-18 16:54:59'),
(897209, '2019-11-18 17:54:59'),
(897249, '2019-11-18 17:54:59'),
(897203, '2019-11-18 18:54:59'),
(897220, '2019-11-18 18:54:59'),
(897278, '2019-11-18 19:54:59'),
(897212, '2019-11-18 20:54:59'),
(897239, '2019-11-18 20:54:59'),
(897247, '2019-11-18 20:54:59'),
(897271, '2019-11-18 21:54:59'),
(897221, '2019-11-18 22:54:59'),
(897242, '2019-11-18 22:54:59'),
(897291, '2019-11-18 22:54:59'),
(897202, '2019-11-18 23:54:59'),
(897275, '2019-11-18 23:54:59'),
(897285, '2019-11-18 23:54:59'),
(897297, '2019-11-18 23:54:59'),
(897272, '2019-11-19 00:54:59'),
(897274, '2019-11-19 00:54:59'),
(897289, '2019-11-19 00:54:59'),
(897261, '2019-11-19 01:54:59'),
(897268, '2019-11-19 01:54:59'),
(897273, '2019-11-19 01:54:59'),
(897218, '2019-11-19 02:54:59'),
(897230, '2019-11-19 02:54:59'),
(897234, '2019-11-19 02:54:59'),
(897254, '2019-11-19 02:54:59'),
(897287, '2019-11-19 02:54:59'),
(897257, '2019-11-19 04:54:59'),
(897217, '2019-11-19 05:54:59'),
(897260, '2019-11-19 05:54:59'),
(897262, '2019-11-19 05:54:59'),
(897267, '2019-11-19 05:54:59'),
(897248, '2019-11-19 06:54:59'),
(897259, '2019-11-19 06:54:59'),
(897215, '2019-11-19 07:54:59'),
(897229, '2019-11-19 08:54:59'),
(897269, '2019-11-19 08:54:59'),
(897279, '2019-11-19 08:54:59'),
(897200, '2019-11-19 09:54:59'),
(897246, '2019-11-19 09:54:59'),
(897244, '2019-11-19 10:54:59'),
(897263, '2019-11-19 10:54:59'),
(897206, '2019-11-19 11:54:59'),
(897299, '2019-11-19 12:54:59'),
(897282, '2019-11-19 13:54:59'),
(897265, '2019-11-19 14:54:59'),
(897204, '2019-11-19 15:54:59'),
(897284, '2019-11-19 15:54:59');*/

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
  `pTimeWorked` int(11) NOT NULL,
  `cpuUsage` double NOT NULL,
  `netUsage` double NOT NULL,
  `pLocal` tinyint(1) NOT NULL,
  `pNPC` tinyint(1) NOT NULL,
  `isPaused` tinyint(1) NOT NULL
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

/*INSERT INTO `ranking_user` (`userID`, `rank`) VALUES
(750709, -1),
(750710, -1),
(750711, -1),
(750712, -1),
(750713, -1),
(750714, -1),
(750715, -1);*/

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

/*INSERT INTO `round` (`id`, `name`, `startDate`, `endDate`, `status`) VALUES
(12, 'ROUND-BETA', '2019-11-17 15:46:48', '2021-12-23 16:56:00', 1);*/

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
COMMIT;

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
  `softRam` int(9) NOT NULL,
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

/*INSERT INTO `software` (`id`, `userID`, `softName`, `softVersion`, `softSize`, `softRam`, `softType`, `softLastEdit`, `softHidden`, `softHiddenWith`, `isNPC`, `originalFrom`, `licensedTo`, `isFolder`) VALUES
(13662031, 897198, 'Super Firewall', 100, 1730, 970, 4, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662032, 897198, 'Super Hasher', 100, 1890, 1110, 2, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662033, 897199, 'Decent SSH Exploit', 20, 57, 28, 14, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662034, 897199, 'Generic FTP Exploit', 18, 47, 22, 13, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662035, 897199, 'Winblows 8.1', 20, 63, 30, 17, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662036, 897199, 'Basic Analyzer', 10, 23, 8, 16, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662037, 897199, 'Decent Hasher', 20, 69, 33, 2, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662038, 897199, 'riddle', 10, 0, 0, 26, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662039, 897199, 'Decent Cracker', 21, 83, 41, 1, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662040, 897199, 'Decent Firewall', 20, 63, 30, 4, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662041, 897199, 'Generic Seeker', 19, 41, 20, 6, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662042, 897199, 'Decent Hidder', 20, 45, 22, 5, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662043, 897199, 'Decent Spam', 20, 36, 18, 8, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662044, 897199, 'Decent Anti-Virus', 20, 48, 23, 7, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662045, 897199, 'Decent Miner', 20, 63, 30, 20, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662046, 897199, 'Decent Warez', 20, 36, 18, 9, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662047, 897200, 'Big Hasher', 75, 1058, 623, 2, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662048, 897200, 'riddle', 10, 0, 0, 26, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662049, 897200, 'Amazing Cracker', 80, 1316, 778, 1, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662050, 897200, 'Advanced Firewall', 50, 413, 235, 4, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662051, 897200, 'Big Seeker', 75, 690, 407, 6, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662052, 897200, 'Big Hidder', 75, 690, 407, 5, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662053, 897200, 'Advanced SSH Exploit', 50, 374, 213, 14, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662054, 897200, 'Advanced FTP Exploit', 50, 374, 213, 13, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662055, 897200, 'Intermediate Analyzer', 30, 142, 78, 16, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662056, 897201, 'Competent SSH Exploit', 45, 299, 176, 14, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662057, 897201, 'Decent FTP Exploit', 20, 57, 28, 13, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662058, 897201, 'Fotoshop CS6', 30, 142, 78, 17, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662059, 897201, 'Decent Analyzer', 20, 63, 30, 16, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662060, 897201, 'Advanced Hasher', 50, 452, 257, 2, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662061, 897201, 'riddle', 10, 0, 0, 26, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662062, 897201, 'Advanced Cracker', 53, 555, 318, 1, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662063, 897201, 'Intermediate Firewall', 36, 207, 118, 4, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662064, 897201, 'Advanced Seeker', 50, 295, 168, 6, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662065, 897201, 'Advanced Hidder', 50, 295, 168, 5, '2019-11-17 14:54:59', 0, 0, 1, 0, 0, 0),
(13662066, 897201, 'Advanced Spam', 50, 236, 134, 8, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662067, 897201, 'Basic Nmap', 10, 23, 8, 15, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662068, 897201, 'Advanced Miner', 50, 413, 235, 20, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662069, 897201, 'Advanced Warez', 50, 236, 134, 9, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662070, 897202, 'Super Hasher', 100, 1890, 1110, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662071, 897202, 'riddle', 10, 0, 0, 26, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662072, 897202, 'Super Cracker', 110, 2230, 1350, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662073, 897202, 'Big Firewall', 70, 837, 490, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662074, 897202, 'Super Seeker', 100, 1250, 550, 6, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662075, 897202, 'Super Hidder', 100, 1250, 550, 5, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662076, 897202, 'Super Miner', 100, 1730, 970, 20, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662077, 897202, 'Super Warez', 100, 1010, 340, 9, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662078, 897202, 'Big SSH Exploit', 75, 874, 515, 14, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662079, 897202, 'Big FTP Exploit', 70, 757, 444, 13, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662080, 897203, 'Ultimate Hasher', 200, 5540, 3980, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662081, 897251, 'Decent Firewall', 20, 63, 30, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662082, 897251, 'Decent Hasher', 20, 69, 33, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662083, 897256, 'Basic Firewall', 10, 23, 8, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662084, 897256, 'Basic Hasher', 10, 26, 8, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662085, 897256, 'Basic Port Scan', 10, 23, 8, 3, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662086, 897256, 'Basic Cracker', 10, 28, 9, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662087, 897256, 'Basic Seeker', 10, 17, 6, 6, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662088, 897256, 'Basic Hidder', 10, 17, 6, 5, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662089, 897256, 'Basic FTP Exploit', 10, 21, 7, 13, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662090, 897256, 'Basic Spam', 10, 14, 5, 8, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662091, 897256, 'Basic Collector', 10, 16, 5, 11, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662092, 897256, 'Basic SSH Exploit', 10, 21, 7, 14, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662093, 897253, 'Basic Hasher', 10, 26, 8, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662094, 897252, 'Advanced Firewall', 50, 413, 235, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662095, 897252, 'Advanced Hasher', 50, 452, 257, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662096, 897252, 'Super Miner', 100, 1730, 970, 20, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662097, 897257, 'Super Firewall', 100, 1730, 970, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662098, 897257, 'Super Hasher', 100, 1890, 1110, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662099, 897258, 'Intermediate Firewall', 35, 195, 110, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662100, 897258, 'Advanced Hasher', 50, 452, 257, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662101, 897259, 'Big Firewall', 75, 966, 569, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662102, 897259, 'Super Hasher', 100, 1890, 1110, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662103, 897260, 'Decent Firewall', 25, 98, 51, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662104, 897260, 'Decent Hasher', 25, 107, 56, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662105, 897260, 'Winblows 8.1', 20, 63, 30, 17, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662106, 897260, 'F.L.I.E.N.D.S', 10, 23, 8, 17, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662107, 897260, 'Fotoshop CS6', 30, 142, 78, 17, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662108, 897261, 'Generic Firewall', 15, 39, 16, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662109, 897261, 'Generic Hasher', 15, 42, 17, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662110, 897262, 'Competent Firewall', 40, 258, 149, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662111, 897262, 'Competent Hasher', 40, 283, 163, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662112, 897263, 'Decent Firewall', 25, 98, 51, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662113, 897263, 'Decent Hasher', 25, 107, 56, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662114, 897264, 'Amazing Firewall', 80, 1106, 653, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662115, 897264, 'Amazing Hasher', 80, 1211, 715, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662116, 897265, 'Advanced Firewall', 60, 606, 351, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662117, 897265, 'Advanced Hasher', 60, 663, 384, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662118, 897266, 'Generic Cracker', 19, 69, 32, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662119, 897266, 'Generic Hasher', 17, 52, 23, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662120, 897266, 'Basic Spam', 11, 15, 5, 8, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662121, 897266, 'Generic Firewall', 17, 47, 21, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662122, 897267, 'Decent Cracker', 27, 136, 73, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662123, 897267, 'Decent Hasher', 20, 69, 33, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662124, 897267, 'Generic Firewall', 17, 47, 21, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662125, 897268, 'Decent Cracker', 25, 116, 61, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662126, 897268, 'Decent Hasher', 27, 125, 67, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662127, 897268, 'Decent Warez', 20, 36, 18, 9, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662128, 897268, 'Decent Firewall', 22, 76, 38, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662129, 897268, 'Decent FTP Exploit', 25, 89, 46, 13, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662130, 897269, 'Generic Cracker', 18, 62, 28, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662131, 897269, 'Generic Hasher', 17, 52, 23, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662132, 897269, 'Generic Spam', 15, 22, 9, 8, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662133, 897269, 'Decent Firewall', 25, 98, 51, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662134, 897269, 'Decent Anti-Virus', 23, 63, 32, 7, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662135, 897269, 'Decent Hidder', 22, 54, 27, 5, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662136, 897270, 'Generic Cracker', 17, 56, 25, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662137, 897270, 'Generic Hasher', 19, 63, 30, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662138, 897270, 'Decent Spam', 20, 36, 18, 8, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662139, 897270, 'Generic Firewall', 17, 47, 21, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662140, 897270, 'Basic Port Scan', 10, 23, 8, 3, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662141, 897270, 'Decent FTP Exploit', 25, 89, 46, 13, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662142, 897271, 'Decent Cracker', 26, 126, 66, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662143, 897271, 'Generic Hasher', 19, 63, 30, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662144, 897271, 'Decent Firewall', 20, 63, 30, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662145, 897272, 'Generic Cracker', 17, 56, 25, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662146, 897272, 'Basic Hasher', 14, 38, 15, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662147, 897272, 'Basic Firewall', 13, 31, 12, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662148, 897272, 'Generic FTP Exploit', 15, 35, 15, 13, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662149, 897272, 'Generic Miner', 15, 39, 16, 20, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662150, 897272, 'Basic SSH Exploit', 11, 23, 8, 14, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662151, 897273, 'Basic Cracker', 11, 30, 10, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662152, 897273, 'Basic Hasher', 12, 31, 11, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662153, 897273, 'Decent Spam', 20, 36, 18, 8, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662154, 897273, 'Basic Firewall', 10, 23, 8, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662155, 897273, 'Basic SSH Exploit', 13, 28, 11, 14, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662156, 897273, 'Basic FTP Exploit', 12, 26, 9, 13, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662157, 897273, 'Basic Warez', 10, 14, 5, 9, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662158, 897273, 'Basic Port Scan', 10, 23, 8, 3, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662159, 897274, 'Basic Cracker', 13, 37, 14, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662160, 897274, 'Basic Hasher', 11, 28, 10, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662161, 897274, 'Basic Hidder', 14, 25, 10, 5, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662162, 897274, 'Basic Firewall', 12, 28, 10, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662163, 897274, 'Basic Spam', 12, 16, 6, 8, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662164, 897274, 'Basic Seeker', 12, 20, 7, 6, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662165, 897274, 'Basic FTP Exploit', 11, 23, 8, 13, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662166, 897275, 'Basic Cracker', 13, 37, 14, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662167, 897275, 'Generic Hasher', 17, 52, 23, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662168, 897275, 'Decent Miner', 20, 63, 30, 20, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662169, 897275, 'Basic Firewall', 14, 35, 14, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662170, 897275, 'Generic Hidder', 16, 31, 13, 5, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662171, 897275, 'Generic Hidder', 16, 31, 13, 5, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662172, 897275, 'Basic Hidder', 13, 23, 9, 5, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662173, 897275, 'Generic Spam', 15, 22, 9, 8, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662174, 897276, 'Basic Cracker', 14, 41, 16, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662175, 897276, 'Basic Hasher', 13, 34, 13, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662176, 897276, 'Basic Spam', 12, 16, 6, 8, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662177, 897276, 'Generic Firewall', 17, 47, 21, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662178, 897276, 'Basic Port Scan', 10, 23, 8, 3, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662179, 897276, 'Basic FTP Exploit', 12, 26, 9, 13, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662180, 897276, 'Basic Seeker', 12, 20, 7, 6, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662181, 897276, 'Basic Warez', 13, 18, 7, 9, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662182, 897276, 'Basic Hidder', 11, 18, 6, 5, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662183, 897277, 'Decent Cracker', 20, 75, 36, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662184, 897277, 'Decent Hasher', 22, 83, 42, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662185, 897277, 'Generic SSH Exploit', 17, 43, 19, 14, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662186, 897277, 'Basic Firewall', 10, 23, 8, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662187, 897277, 'Basic Port Scan', 10, 23, 8, 3, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662188, 897277, 'Generic FTP Exploit', 16, 39, 17, 13, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662189, 897278, 'Decent Cracker', 22, 90, 45, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662190, 897278, 'Generic Hasher', 16, 47, 20, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662191, 897278, 'Basic Spam', 14, 20, 8, 8, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662192, 897278, 'Generic Firewall', 19, 58, 27, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662193, 897278, 'Basic Port Scan', 10, 23, 8, 3, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662194, 897278, 'Basic SSH Exploit', 14, 32, 13, 14, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662195, 897278, 'Generic Hidder', 18, 38, 17, 5, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662196, 897279, 'Decent Cracker', 27, 136, 73, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662197, 897279, 'Decent Hasher', 28, 135, 73, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662198, 897279, 'Decent Firewall', 24, 90, 46, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662199, 897280, 'Decent Cracker', 23, 99, 50, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662200, 897280, 'Decent Hasher', 25, 107, 56, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662201, 897280, 'Generic Warez', 15, 22, 9, 9, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662202, 897280, 'Decent Firewall', 20, 63, 30, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662203, 897280, 'Basic Anti-Virus', 13, 24, 9, 7, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662204, 897280, 'Generic FTP Exploit', 16, 39, 17, 13, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662205, 897281, 'Basic Hasher', 10, 26, 8, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662206, 897282, 'Intermediate Cracker', 35, 232, 131, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662207, 897282, 'Intermediate Hasher', 33, 189, 106, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662208, 897282, 'Decent Spam', 22, 44, 22, 8, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662209, 897282, 'Decent Firewall', 28, 123, 66, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662210, 897282, 'Basic Hidder', 12, 20, 7, 5, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662211, 897283, 'Advanced Cracker', 59, 696, 403, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662212, 897283, 'Competent Hasher', 42, 313, 182, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662213, 897283, 'Intermediate Spam', 39, 140, 81, 8, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662214, 897283, 'Intermediate Firewall', 34, 184, 103, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662215, 897283, 'Intermediate Seeker', 36, 148, 84, 6, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662216, 897283, 'Advanced FTP Exploit', 50, 374, 213, 13, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662217, 897284, 'Competent Cracker', 40, 307, 178, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662218, 897284, 'Intermediate Hasher', 30, 155, 85, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662219, 897284, 'Decent Spam', 24, 52, 27, 8, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662220, 897284, 'Intermediate Firewall', 37, 219, 125, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662221, 897284, 'Intermediate SSH Exploit', 33, 156, 88, 14, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662222, 897284, 'Decent FTP Exploit', 28, 111, 60, 13, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662223, 897284, 'Decent Seeker', 27, 82, 44, 6, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662224, 897285, 'Competent Cracker', 44, 375, 220, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662225, 897285, 'Intermediate Hasher', 38, 254, 146, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662226, 897285, 'Generic Spam', 19, 33, 16, 8, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662227, 897285, 'Decent Firewall', 28, 123, 66, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662228, 897285, 'Intermediate SSH Exploit', 33, 156, 88, 14, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662229, 897285, 'Competent FTP Exploit', 40, 234, 135, 13, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662230, 897286, 'Intermediate Cracker', 38, 276, 158, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662231, 897286, 'Advanced Hasher', 54, 532, 305, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662232, 897286, 'Decent Spam', 20, 36, 18, 8, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662233, 897286, 'Competent Firewall', 40, 258, 149, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662234, 897287, 'Advanced Cracker', 52, 534, 305, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662235, 897287, 'Advanced Hasher', 56, 574, 330, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662236, 897287, 'Intermediate Firewall', 30, 142, 78, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662237, 897288, 'Advanced Cracker', 56, 624, 359, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662238, 897288, 'Advanced Hasher', 52, 491, 281, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662239, 897288, 'Intermediate Spam', 39, 140, 81, 8, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662240, 897288, 'Intermediate Firewall', 36, 207, 118, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662241, 897288, 'Basic Port Scan', 10, 23, 8, 3, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662242, 897288, 'Intermediate FTP Exploit', 30, 128, 70, 13, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662243, 897288, 'Decent Seeker', 29, 95, 52, 6, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662244, 897288, 'Competent SSH Exploit', 46, 313, 185, 14, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662245, 897288, 'Intermediate Hidder', 36, 148, 84, 5, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662246, 897289, 'Basic Cracker', 14, 41, 16, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662247, 897289, 'Basic Hasher', 13, 34, 13, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662248, 897289, 'Basic Spam', 12, 16, 6, 8, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662249, 897289, 'Generic Firewall', 17, 47, 21, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662250, 897289, 'Basic Port Scan', 10, 23, 8, 3, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662251, 897289, 'Basic FTP Exploit', 12, 26, 9, 13, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662252, 897289, 'Basic Seeker', 12, 20, 7, 6, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662253, 897289, 'Basic Warez', 13, 18, 7, 9, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662254, 897289, 'Basic Hidder', 11, 18, 6, 5, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662255, 897290, 'Competent Cracker', 40, 307, 178, 1, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662256, 897290, 'Intermediate Hasher', 36, 227, 129, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662257, 897290, 'Competent Warez', 42, 164, 95, 9, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662258, 897290, 'Advanced Firewall', 59, 585, 338, 4, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662259, 897290, 'Advanced FTP Exploit', 63, 607, 353, 13, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662260, 897291, 'Basic Hasher', 10, 26, 8, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662261, 897292, 'Basic Hasher', 10, 26, 8, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662262, 897293, 'Basic Hasher', 10, 26, 8, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662263, 897294, 'Basic Hasher', 10, 26, 8, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662264, 897295, 'Basic Hasher', 10, 26, 8, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662265, 897296, 'Basic Hasher', 10, 26, 8, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662266, 897297, 'Basic Hasher', 10, 26, 8, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662267, 897298, 'Basic Hasher', 10, 26, 8, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662268, 897299, 'Basic Hasher', 10, 26, 8, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662269, 897300, 'Basic Hasher', 10, 26, 8, 2, '2019-11-17 14:55:00', 0, 0, 1, 0, 0, 0),
(13662270, 897204, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662271, 897204, 'Super Firewall', 100, 1730, 970, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662272, 897204, 'Amazing FTP Exploit', 87, 1192, 707, 13, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662273, 897204, 'Epic Hidder', 150, 1900, 850, 5, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662274, 897204, 'Epic Cracker', 150, 3450, 2250, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662275, 897204, 'Ultra Anti-Virus', 140, 1846, 852, 7, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662276, 897204, 'Advanced SSH Exploit', 62, 587, 341, 14, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662277, 897204, 'Ultra Hasher', 140, 2798, 1706, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662278, 897204, 'Super Seeker', 104, 1275, 547, 6, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662279, 897205, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662280, 897205, 'Super Firewall', 110, 1866, 1030, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662281, 897205, 'Amazing FTP Exploit', 88, 1220, 724, 13, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662282, 897205, 'Ultra Hidder', 134, 1611, 673, 5, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662283, 897205, 'Epic Cracker', 160, 3880, 2600, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662284, 897205, 'Amazing SSH Exploit', 82, 1053, 623, 14, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662285, 897205, 'Epic Hasher', 150, 3140, 1970, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662286, 897205, 'Epic Seeker', 150, 1900, 850, 6, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662287, 897205, 'Epic Miner', 150, 2830, 1690, 20, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662288, 897206, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662289, 897206, 'Intermediate Firewall', 32, 162, 90, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662290, 897206, 'Intermediate FTP Exploit', 36, 187, 107, 13, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662291, 897206, 'Intermediate Hidder', 37, 157, 90, 5, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662292, 897206, 'Competent Cracker', 44, 375, 220, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662293, 897206, 'Decent SSH Exploit', 24, 82, 42, 14, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662294, 897206, 'Competent Hasher', 42, 313, 182, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662295, 897206, 'Intermediate Seeker', 34, 131, 74, 6, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662296, 897206, 'Competent Miner', 40, 258, 149, 20, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662297, 897207, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662298, 897207, 'Intermediate Firewall', 34, 184, 103, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662299, 897207, 'Intermediate FTP Exploit', 34, 166, 94, 13, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662300, 897207, 'Competent Hidder', 40, 185, 107, 5, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662301, 897207, 'Competent Spam', 45, 189, 111, 8, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662302, 897207, 'Competent Cracker', 46, 412, 243, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662303, 897207, 'Intermediate SSH Exploit', 30, 128, 70, 14, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662304, 897207, 'Competent Hasher', 44, 345, 202, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662305, 897207, 'Intermediate Seeker', 37, 157, 90, 6, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662306, 897208, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662307, 897208, 'Intermediate Firewall', 34, 184, 103, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662308, 897208, 'Intermediate FTP Exploit', 36, 187, 107, 13, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662309, 897208, 'Competent Hidder', 46, 248, 146, 5, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662310, 897208, 'Competent Cracker', 48, 451, 267, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662311, 897208, 'Advanced Anti-Virus', 50, 315, 179, 7, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662312, 897208, 'Decent SSH Exploit', 20, 57, 28, 14, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662313, 897208, 'Competent Hasher', 46, 379, 223, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662314, 897208, 'Competent Seeker', 40, 185, 107, 6, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662315, 897209, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662316, 897209, 'Intermediate Firewall', 36, 207, 118, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662317, 897209, 'Intermediate FTP Exploit', 30, 128, 70, 13, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662318, 897209, 'Competent Hidder', 44, 225, 132, 5, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662319, 897209, 'Advanced Collector', 50, 275, 157, 11, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662320, 897209, 'Advanced Cracker', 50, 491, 280, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662321, 897209, 'Intermediate SSH Exploit', 30, 128, 70, 14, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662322, 897209, 'Competent Hasher', 48, 415, 245, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662323, 897209, 'Competent Seeker', 40, 185, 107, 6, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662324, 897210, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662325, 897210, 'Decent Firewall', 28, 123, 66, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662326, 897210, 'Decent FTP Exploit', 23, 75, 38, 13, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662327, 897210, 'Intermediate Hidder', 33, 123, 69, 5, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662328, 897210, 'Intermediate DDoS', 30, 88, 48, 10, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662329, 897210, 'Intermediate Cracker', 36, 246, 140, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662330, 897210, 'Generic SSH Exploit', 19, 52, 25, 14, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662331, 897210, 'Intermediate Breaker', 30, 95, 52, 12, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662332, 897210, 'Intermediate Hasher', 34, 201, 113, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662333, 897210, 'Decent Seeker', 27, 82, 44, 6, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662334, 897211, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662335, 897211, 'Intermediate Firewall', 30, 142, 78, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662336, 897211, 'Decent FTP Exploit', 22, 69, 34, 13, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662337, 897211, 'Competent Hidder', 40, 185, 107, 5, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662338, 897211, 'Intermediate Cracker', 38, 276, 158, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662339, 897211, 'Competent Anti-Virus', 40, 197, 114, 7, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662340, 897211, 'Decent SSH Exploit', 21, 63, 31, 14, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662341, 897211, 'Intermediate Hasher', 36, 227, 129, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662342, 897211, 'Competent Seeker', 40, 185, 107, 6, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662343, 897212, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662344, 897212, 'Intermediate Firewall', 30, 142, 78, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662345, 897212, 'Intermediate FTP Exploit', 30, 128, 70, 13, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662346, 897212, 'Intermediate Hidder', 37, 157, 90, 5, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662347, 897212, 'Competent Collector', 40, 172, 100, 11, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662348, 897212, 'Competent Spam', 40, 148, 86, 8, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662349, 897212, 'Competent Cracker', 40, 307, 178, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662350, 897212, 'Intermediate SSH Exploit', 30, 128, 70, 14, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662351, 897212, 'Intermediate Hasher', 38, 254, 146, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662352, 897212, 'Intermediate Seeker', 35, 140, 79, 6, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662353, 897213, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662354, 897213, 'Intermediate Firewall', 32, 162, 90, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662355, 897213, 'Decent FTP Exploit', 29, 120, 65, 13, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662356, 897213, 'Decent Hidder', 28, 88, 48, 5, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662357, 897213, 'Competent Warez', 40, 148, 86, 9, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662358, 897213, 'Competent Cracker', 42, 340, 198, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662359, 897213, 'Decent SSH Exploit', 22, 69, 34, 14, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662360, 897213, 'Competent Hasher', 40, 283, 163, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662361, 897213, 'Intermediate Seeker', 33, 123, 69, 6, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662362, 897214, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662363, 897214, 'Ultra Firewall', 140, 2526, 1462, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662364, 897214, 'Super FTP Exploit', 107, 1646, 855, 13, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662365, 897214, 'Ultra Hidder', 142, 1746, 752, 5, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662366, 897214, 'Epic Warez', 150, 1435, 430, 9, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662367, 897214, 'Ultimate Cracker', 190, 5470, 3950, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662368, 897214, 'Epic Anti-Virus', 150, 2055, 990, 7, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662369, 897214, 'Ultra SSH Exploit', 124, 1908, 990, 14, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662370, 897214, 'Ultimate Hasher', 180, 4442, 3038, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662371, 897214, 'Ultra Seeker', 134, 1611, 673, 6, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662372, 897215, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662373, 897215, 'Epic Firewall', 150, 2830, 1690, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662374, 897215, 'Ultra FTP Exploit', 127, 1966, 1026, 13, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662375, 897215, 'Ultra Hidder', 143, 1764, 763, 5, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662376, 897215, 'Ultimate Cracker', 200, 6100, 4500, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662377, 897215, 'Amazing SSH Exploit', 95, 1431, 852, 14, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662378, 897215, 'Ultimate Hasher', 190, 4968, 3487, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662379, 897215, 'Ultra Seeker', 128, 1522, 626, 6, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662380, 897216, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662381, 897216, 'Ultra Firewall', 120, 2044, 1132, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662382, 897216, 'Ultra FTP Exploit', 130, 2026, 1064, 13, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662383, 897216, 'Ultra Hidder', 149, 1880, 837, 5, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662384, 897216, 'Epic Cracker', 170, 4360, 3000, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662385, 897216, 'Ultra SSH Exploit', 130, 2026, 1064, 14, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662386, 897216, 'Epic Breaker', 150, 1745, 711, 12, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662387, 897216, 'Epic Hasher', 160, 3528, 2280, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662388, 897216, 'Ultra Seeker', 132, 1580, 656, 6, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662389, 897217, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662390, 897217, 'Ultra Firewall', 130, 2264, 1276, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662391, 897217, 'Ultra FTP Exploit', 127, 1966, 1026, 13, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662392, 897217, 'Ultra Hidder', 149, 1880, 837, 5, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662393, 897217, 'Epic Collector', 150, 1745, 711, 11, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662394, 897217, 'Epic Spam', 150, 1435, 430, 8, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662395, 897217, 'Ultimate Cracker', 180, 4890, 3450, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662396, 897217, 'Super SSH Exploit', 114, 1741, 897, 14, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662397, 897217, 'Epic Hasher', 170, 3962, 2636, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662398, 897217, 'Ultra Seeker', 142, 1746, 752, 6, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662399, 897218, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662400, 897218, 'Intermediate Firewall', 39, 245, 141, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662401, 897218, 'Intermediate FTP Exploit', 36, 187, 107, 13, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662402, 897218, 'Advanced DDoS', 50, 256, 146, 10, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662403, 897218, 'Advanced Cracker', 56, 624, 359, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662404, 897218, 'Competent SSH Exploit', 42, 259, 151, 14, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662405, 897218, 'Advanced Breaker', 50, 275, 157, 12, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662406, 897218, 'Advanced Hasher', 53, 511, 293, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662407, 897219, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662408, 897219, 'Intermediate Firewall', 39, 245, 141, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662409, 897219, 'Competent FTP Exploit', 42, 259, 151, 13, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662410, 897219, 'Advanced Hidder', 60, 433, 251, 5, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662411, 897219, 'Advanced Cracker', 59, 696, 403, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662412, 897219, 'Big Anti-Virus', 70, 638, 374, 7, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662413, 897219, 'Intermediate SSH Exploit', 33, 156, 88, 14, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662414, 897219, 'Advanced Hasher', 56, 574, 330, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662415, 897219, 'Advanced Miner', 60, 606, 351, 20, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662416, 897220, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662417, 897220, 'Amazing Firewall', 90, 1413, 840, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662418, 897220, 'Super Hidder', 104, 1275, 547, 5, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662419, 897220, 'Ultra Collector', 120, 1316, 488, 11, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662420, 897220, 'Ultra Spam', 120, 1108, 304, 8, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662421, 897220, 'Ultra Cracker', 130, 2740, 1700, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662422, 897220, 'Ultra Hasher', 120, 2252, 1316, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662423, 897220, 'Super Seeker', 110, 1320, 550, 6, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662424, 897221, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662425, 897221, 'Amazing Firewall', 90, 1413, 840, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662426, 897221, 'Amazing FTP Exploit', 90, 1279, 760, 13, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662427, 897221, 'Amazing Hidder', 98, 1205, 719, 5, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662428, 897221, 'Ultra Warez', 140, 1302, 364, 9, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662429, 897221, 'Ultra Cracker', 140, 3070, 1950, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662430, 897221, 'Amazing SSH Exploit', 90, 1279, 760, 14, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662431, 897221, 'Ultra Hasher', 130, 2502, 1489, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662432, 897221, 'Super Seeker', 102, 1262, 548, 6, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662433, 897222, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662434, 897222, 'Basic Firewall', 10, 23, 8, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662435, 897222, 'Basic FTP Exploit', 10, 21, 7, 13, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662436, 897222, 'Basic Hidder', 10, 17, 6, 5, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662437, 897222, 'Basic Cracker', 11, 30, 10, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662438, 897222, 'Basic Hasher', 10, 26, 8, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662439, 897223, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662440, 897223, 'Basic Firewall', 12, 28, 10, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662441, 897223, 'Basic FTP Exploit', 11, 23, 8, 13, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662442, 897223, 'Basic Hidder', 11, 18, 6, 5, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662443, 897223, 'Basic DDoS', 10, 15, 5, 10, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662444, 897223, 'Basic Cracker', 13, 37, 14, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662445, 897223, 'Basic SSH Exploit', 10, 21, 7, 14, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662446, 897223, 'Basic Breaker', 10, 16, 5, 12, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662447, 897223, 'Basic Hasher', 12, 31, 11, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662448, 897223, 'Basic Seeker', 10, 17, 6, 6, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662449, 897224, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662450, 897224, 'Basic Firewall', 10, 23, 8, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662451, 897224, 'Basic Warez', 10, 14, 5, 9, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662452, 897224, 'F.L.I.E.N.D.S', 10, 23, 8, 17, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662453, 897224, 'Basic Cracker', 12, 34, 12, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662454, 897224, 'Basic SSH Exploit', 10, 21, 7, 14, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662455, 897224, 'Basic Hasher', 11, 28, 10, 2, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662456, 897224, 'Basic Seeker', 12, 20, 7, 6, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662457, 897225, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662458, 897225, 'Basic Firewall', 14, 35, 14, 4, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662459, 897225, 'Generic FTP Exploit', 18, 47, 22, 13, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662460, 897225, 'Basic Hidder', 13, 23, 9, 5, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662461, 897225, 'Generic Collector', 15, 26, 11, 11, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662462, 897225, 'Generic Spam', 15, 22, 9, 8, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662463, 897225, 'Generic Cracker', 15, 46, 19, 1, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662464, 897225, 'Generic Anti-Virus', 15, 30, 12, 7, '2019-11-17 14:55:01', 0, 0, 1, 0, 0, 0),
(13662465, 897225, 'Basic Hasher', 14, 38, 15, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662466, 897225, 'Basic Seeker', 10, 17, 6, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662467, 897226, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662468, 897226, 'Basic Firewall', 12, 28, 10, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662469, 897226, 'Basic Hidder', 14, 25, 10, 5, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662470, 897226, 'Basic Cracker', 14, 41, 16, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662471, 897226, 'Basic SSH Exploit', 11, 23, 8, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662472, 897226, 'Basic Hasher', 13, 34, 13, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662473, 897226, 'Basic Seeker', 11, 18, 6, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662474, 897226, 'Basic Miner', 13, 31, 12, 20, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662475, 897227, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662476, 897227, 'Generic Firewall', 16, 43, 18, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662477, 897227, 'Basic FTP Exploit', 13, 28, 11, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662478, 897227, 'Generic Warez', 15, 22, 9, 9, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662479, 897227, 'Generic Cracker', 17, 56, 25, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662480, 897227, 'Generic Anti-Virus', 15, 30, 12, 7, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662481, 897227, 'Basic SSH Exploit', 12, 26, 9, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662482, 897227, 'Generic Hasher', 16, 47, 20, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662483, 897227, 'Generic Miner', 16, 43, 18, 20, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662484, 897228, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662485, 897228, 'Basic Firewall', 14, 35, 14, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662486, 897228, 'Basic FTP Exploit', 10, 21, 7, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662487, 897228, 'Generic Hidder', 15, 28, 12, 5, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662488, 897228, 'Generic Cracker', 16, 51, 22, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662489, 897228, 'Basic Anti-Virus', 12, 22, 8, 7, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662490, 897228, 'Basic SSH Exploit', 14, 32, 13, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662491, 897228, 'Generic Hasher', 15, 42, 17, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662492, 897228, 'Generic Seeker', 15, 28, 12, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662493, 897229, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662494, 897229, 'Generic Firewall', 18, 52, 24, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662495, 897229, 'Generic FTP Exploit', 17, 43, 19, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662496, 897229, 'Decent Collector', 20, 42, 20, 11, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662497, 897229, 'Generic Spam', 17, 27, 12, 8, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662498, 897229, 'Generic Cracker', 19, 69, 32, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662499, 897229, 'Basic Anti-Virus', 14, 27, 11, 7, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662500, 897229, 'Basic SSH Exploit', 13, 28, 11, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662501, 897229, 'Generic Hasher', 18, 57, 26, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662502, 897229, 'Decent Seeker', 20, 45, 22, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662503, 897230, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662504, 897230, 'Generic Firewall', 16, 43, 18, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662505, 897230, 'Basic FTP Exploit', 10, 21, 7, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662506, 897230, 'Generic Hidder', 17, 34, 15, 5, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662507, 897230, 'Generic DDoS', 15, 24, 10, 10, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662508, 897230, 'Basic Spam', 14, 20, 8, 8, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662509, 897230, 'Generic Cracker', 18, 62, 28, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662510, 897230, 'Basic SSH Exploit', 13, 28, 11, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662511, 897230, 'Generic Hasher', 17, 52, 23, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662512, 897230, 'Basic Seeker', 13, 23, 9, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662513, 897231, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662514, 897231, 'Amazing Firewall', 80, 1106, 653, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662515, 897231, 'Big FTP Exploit', 76, 899, 530, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662516, 897231, 'Super Hidder', 110, 1320, 550, 5, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662517, 897231, 'Ultra Cracker', 120, 2460, 1500, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662518, 897231, 'Ultra Anti-Virus', 120, 1524, 672, 7, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662519, 897231, 'Big SSH Exploit', 69, 735, 430, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662520, 897231, 'Super Hasher', 110, 2048, 1190, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662521, 897231, 'Amazing Seeker', 97, 1179, 703, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662522, 897232, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662523, 897232, 'Advanced Firewall', 60, 606, 351, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662524, 897232, 'Amazing FTP Exploit', 80, 1001, 591, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662525, 897232, 'Big Hidder', 68, 563, 329, 5, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662526, 897232, 'Big DDoS', 73, 566, 332, 10, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662527, 897232, 'Super Cracker', 100, 2050, 1250, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662528, 897232, 'Advanced SSH Exploit', 59, 529, 306, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662529, 897232, 'Super Breaker', 100, 1170, 481, 12, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662530, 897232, 'Amazing Hasher', 95, 1732, 1031, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662531, 897232, 'Amazing Seeker', 96, 1154, 688, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662532, 897233, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662533, 897233, 'Decent Firewall', 20, 63, 30, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662534, 897233, 'Decent FTP Exploit', 26, 96, 51, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662535, 897233, 'Generic Hidder', 18, 38, 17, 5, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662536, 897233, 'Decent DDoS', 20, 39, 19, 10, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662537, 897233, 'Decent Cracker', 22, 90, 45, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662538, 897233, 'Generic SSH Exploit', 19, 52, 25, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662539, 897233, 'Decent Hasher', 21, 76, 37, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662540, 897234, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662541, 897234, 'Generic Firewall', 18, 52, 24, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662542, 897234, 'Decent FTP Exploit', 20, 57, 28, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662543, 897234, 'Generic Hidder', 15, 28, 12, 5, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662544, 897234, 'Basic Spam', 14, 20, 8, 8, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662545, 897234, 'Decent Cracker', 20, 75, 36, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662546, 897234, 'Basic SSH Exploit', 12, 26, 9, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662547, 897234, 'Generic Hasher', 19, 63, 30, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662548, 897234, 'Generic Seeker', 16, 31, 13, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662549, 897235, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662550, 897235, 'Decent Firewall', 22, 76, 38, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662551, 897235, 'Decent FTP Exploit', 24, 82, 42, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662552, 897235, 'Decent Spam', 26, 61, 32, 8, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662553, 897235, 'Decent Cracker', 24, 107, 55, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662554, 897235, 'Decent SSH Exploit', 22, 69, 34, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662555, 897235, 'Decent Hasher', 23, 91, 46, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662556, 897235, 'Intermediate Seeker', 30, 101, 56, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662557, 897236, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662558, 897236, 'Decent Firewall', 20, 63, 30, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662559, 897236, 'Decent Hidder', 25, 70, 37, 5, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662560, 897236, 'Decent Cracker', 23, 99, 50, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662561, 897236, 'Decent Anti-Virus', 25, 75, 39, 7, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0);
INSERT INTO `software` (`id`, `userID`, `softName`, `softVersion`, `softSize`, `softRam`, `softType`, `softLastEdit`, `softHidden`, `softHiddenWith`, `isNPC`, `originalFrom`, `licensedTo`, `isFolder`) VALUES
(13662562, 897236, 'Decent SSH Exploit', 24, 82, 42, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662563, 897236, 'Decent Hasher', 22, 83, 42, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662564, 897237, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662565, 897237, 'Decent Firewall', 24, 90, 46, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662566, 897237, 'Decent FTP Exploit', 23, 75, 38, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662567, 897237, 'Basic Hidder', 10, 17, 6, 5, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662568, 897237, 'Decent Collector', 25, 65, 34, 11, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662569, 897237, 'Decent Cracker', 27, 136, 73, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662570, 897237, 'Decent Hasher', 25, 107, 56, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662571, 897237, 'Generic Seeker', 15, 28, 12, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662572, 897237, 'Intermediate Miner', 30, 142, 78, 20, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662573, 897238, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662574, 897238, 'Decent Firewall', 22, 76, 38, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662575, 897238, 'Decent FTP Exploit', 22, 69, 34, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662576, 897238, 'Generic Hidder', 19, 41, 20, 5, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662577, 897238, 'Decent Warez', 25, 56, 29, 9, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662578, 897238, 'Decent Cracker', 25, 116, 61, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662579, 897238, 'Generic SSH Exploit', 17, 43, 19, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662580, 897238, 'Decent Hasher', 24, 99, 51, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662581, 897238, 'Decent Seeker', 26, 76, 40, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662582, 897239, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662583, 897239, 'Decent Firewall', 26, 106, 56, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662584, 897239, 'Generic FTP Exploit', 16, 39, 17, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662585, 897239, 'Decent Hidder', 29, 95, 52, 5, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662586, 897239, 'Intermediate Warez', 33, 99, 55, 9, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662587, 897239, 'Intermediate Cracker', 30, 169, 92, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662588, 897239, 'Decent SSH Exploit', 20, 57, 28, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662589, 897239, 'Decent Hasher', 29, 145, 79, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662590, 897239, 'Intermediate Seeker', 36, 148, 84, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662591, 897240, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662592, 897240, 'Decent Firewall', 24, 90, 46, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662593, 897240, 'Generic FTP Exploit', 18, 47, 22, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662594, 897240, 'Intermediate Hidder', 33, 123, 69, 5, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662595, 897240, 'Intermediate Spam', 30, 81, 45, 8, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662596, 897240, 'Decent Cracker', 29, 157, 86, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662597, 897240, 'Intermediate Anti-Virus', 30, 108, 59, 7, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662598, 897240, 'Decent SSH Exploit', 24, 82, 42, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662599, 897240, 'Decent Hasher', 27, 125, 67, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662600, 897240, 'Decent Seeker', 28, 88, 48, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662601, 897241, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662602, 897241, 'Decent Firewall', 28, 123, 66, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662603, 897241, 'Decent FTP Exploit', 28, 111, 60, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662604, 897241, 'Intermediate Hidder', 30, 101, 56, 5, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662605, 897241, 'Intermediate Spam', 35, 112, 63, 8, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662606, 897241, 'Intermediate Cracker', 34, 219, 123, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662607, 897241, 'Intermediate Anti-Virus', 34, 140, 79, 7, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662608, 897241, 'Decent SSH Exploit', 24, 82, 42, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662609, 897241, 'Intermediate Hasher', 32, 177, 99, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662610, 897241, 'Decent Seeker', 28, 88, 48, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662611, 897242, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662612, 897242, 'Decent Firewall', 26, 106, 56, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662613, 897242, 'Intermediate FTP Exploit', 30, 128, 70, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662614, 897242, 'Intermediate Hidder', 37, 157, 90, 5, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662615, 897242, 'Intermediate Cracker', 32, 193, 107, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662616, 897242, 'Intermediate SSH Exploit', 30, 128, 70, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662617, 897242, 'Intermediate Hasher', 30, 155, 85, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662618, 897243, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662619, 897243, 'Competent Firewall', 42, 286, 167, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662620, 897243, 'Advanced FTP Exploit', 50, 374, 213, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662621, 897243, 'Advanced Hidder', 59, 418, 242, 5, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662622, 897243, 'Advanced Cracker', 64, 825, 481, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662623, 897243, 'Competent SSH Exploit', 45, 299, 176, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662624, 897243, 'Advanced Hasher', 62, 711, 413, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662625, 897243, 'Advanced Seeker', 56, 374, 216, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662626, 897244, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662627, 897244, 'Competent Firewall', 42, 286, 167, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662628, 897244, 'Competent FTP Exploit', 42, 259, 151, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662629, 897244, 'Big Collector', 70, 558, 327, 11, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662630, 897244, 'Big Spam', 70, 478, 280, 8, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662631, 897244, 'Advanced Cracker', 62, 772, 449, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662632, 897244, 'Competent SSH Exploit', 45, 299, 176, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662633, 897244, 'Advanced Hasher', 59, 640, 370, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662634, 897244, 'Advanced Seeker', 60, 433, 251, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662635, 897245, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662636, 897245, 'Advanced Firewall', 60, 606, 351, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662637, 897245, 'Competent FTP Exploit', 49, 358, 212, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662638, 897245, 'Amazing Hidder', 92, 1057, 629, 5, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662639, 897245, 'Super DDoS', 100, 1090, 410, 10, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662640, 897245, 'Amazing Cracker', 95, 1882, 1121, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662641, 897245, 'Big SSH Exploit', 66, 669, 391, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662642, 897245, 'Amazing Hasher', 90, 1548, 920, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662643, 897245, 'Super Seeker', 100, 1250, 550, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662644, 897246, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662645, 897246, 'Advanced Firewall', 55, 504, 290, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662646, 897246, 'Competent FTP Exploit', 47, 328, 194, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662647, 897246, 'Super Hidder', 100, 1250, 550, 5, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662648, 897246, 'Amazing Cracker', 90, 1682, 1000, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662649, 897246, 'Super Anti-Virus', 100, 1330, 620, 7, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662650, 897246, 'Big SSH Exploit', 70, 757, 444, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662651, 897246, 'Amazing Hasher', 85, 1374, 814, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662652, 897246, 'Big Seeker', 75, 690, 407, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662653, 897247, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662654, 897247, 'Advanced Firewall', 55, 504, 290, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662655, 897247, 'Competent FTP Exploit', 46, 313, 185, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662656, 897247, 'Big Hidder', 74, 671, 395, 5, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662657, 897247, 'Super Collector', 100, 1170, 481, 11, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662658, 897247, 'Super Spam', 100, 1010, 340, 8, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662659, 897247, 'Amazing Cracker', 85, 1494, 885, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662660, 897247, 'Advanced SSH Exploit', 50, 374, 213, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662661, 897247, 'Amazing Hasher', 80, 1211, 715, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662662, 897247, 'Big Seeker', 72, 634, 372, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662663, 897248, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662664, 897248, 'Competent Firewall', 48, 379, 224, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662665, 897248, 'Intermediate FTP Exploit', 39, 222, 128, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662666, 897248, 'Big Hidder', 68, 563, 329, 5, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662667, 897248, 'Big Cracker', 75, 1150, 677, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662668, 897248, 'Competent SSH Exploit', 42, 259, 151, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662669, 897248, 'Big Hasher', 71, 944, 554, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662670, 897248, 'Big Seeker', 70, 598, 350, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662671, 897248, 'Amazing Miner', 90, 1413, 840, 20, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662672, 897249, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662673, 897249, 'Competent Firewall', 45, 331, 194, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662674, 897249, 'Competent FTP Exploit', 42, 259, 151, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662675, 897249, 'Big Cracker', 71, 1026, 602, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662676, 897249, 'Amazing Anti-Virus', 80, 843, 498, 7, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662677, 897249, 'Advanced SSH Exploit', 50, 374, 213, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662678, 897249, 'Big Hasher', 68, 862, 504, 2, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662679, 897249, 'Big Seeker', 70, 598, 350, 6, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662680, 897250, 'puzzle', 0, 0, 0, 26, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662681, 897250, 'Competent Firewall', 45, 331, 194, 4, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662682, 897250, 'Competent FTP Exploit', 47, 328, 194, 13, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662683, 897250, 'Big Hidder', 70, 598, 350, 5, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662684, 897250, 'Big DDoS', 75, 598, 352, 10, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662685, 897250, 'Big Cracker', 68, 937, 548, 1, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662686, 897250, 'Competent SSH Exploit', 45, 299, 176, 14, '2019-11-17 14:55:02', 0, 0, 1, 0, 0, 0),
(13662687, 897250, 'Big Breaker', 75, 644, 379, 12, '2019-11-17 14:55:03', 0, 0, 1, 0, 0, 0),
(13662688, 897250, 'Advanced Hasher', 64, 759, 442, 2, '2019-11-17 14:55:03', 0, 0, 1, 0, 0, 0);*/

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

/*INSERT INTO `software_original` (`id`, `npcID`, `softName`, `softVersion`, `softSize`, `softRam`, `softType`, `running`, `licensedTo`) VALUES
(9886, 897198, 'Super Firewall', 100, 1730, 970, 4, 1, 0),
(9887, 897198, 'Super Hasher', 100, 1890, 1110, 2, 1, 0),
(9888, 897199, 'Decent SSH Exploit', 20, 57, 28, 14, 0, 0),
(9889, 897199, 'Generic FTP Exploit', 18, 47, 22, 13, 0, 0),
(9890, 897199, 'Winblows 8.1', 20, 63, 30, 17, 0, 0),
(9891, 897199, 'Basic Analyzer', 10, 23, 8, 16, 0, 0),
(9892, 897199, 'Decent Hasher', 20, 69, 33, 2, 1, 0),
(9893, 897199, 'riddle', 10, 0, 0, 26, 0, 0),
(9894, 897199, 'Decent Cracker', 21, 83, 41, 1, 1, 0),
(9895, 897199, 'Decent Firewall', 20, 63, 30, 4, 1, 0),
(9896, 897199, 'Generic Seeker', 19, 41, 20, 6, 0, 0),
(9897, 897199, 'Decent Hidder', 20, 45, 22, 5, 0, 0),
(9898, 897199, 'Decent Spam', 20, 36, 18, 8, 0, 0),
(9899, 897199, 'Decent Anti-Virus', 20, 48, 23, 7, 0, 0),
(9900, 897199, 'Decent Miner', 20, 63, 30, 20, 0, 0),
(9901, 897199, 'Decent Warez', 20, 36, 18, 9, 0, 0),
(9902, 897200, 'Big Hasher', 75, 1058, 623, 2, 1, 0),
(9903, 897200, 'riddle', 10, 0, 0, 26, 0, 0),
(9904, 897200, 'Amazing Cracker', 80, 1316, 778, 1, 1, 0),
(9905, 897200, 'Advanced Firewall', 50, 413, 235, 4, 1, 0),
(9906, 897200, 'Big Seeker', 75, 690, 407, 6, 0, 0),
(9907, 897200, 'Big Hidder', 75, 690, 407, 5, 0, 0),
(9908, 897200, 'Advanced SSH Exploit', 50, 374, 213, 14, 0, 0),
(9909, 897200, 'Advanced FTP Exploit', 50, 374, 213, 13, 0, 0),
(9910, 897200, 'Intermediate Analyzer', 30, 142, 78, 16, 0, 0),
(9911, 897201, 'Competent SSH Exploit', 45, 299, 176, 14, 0, 0),
(9912, 897201, 'Decent FTP Exploit', 20, 57, 28, 13, 0, 0),
(9913, 897201, 'Fotoshop CS6', 30, 142, 78, 17, 0, 0),
(9914, 897201, 'Decent Analyzer', 20, 63, 30, 16, 0, 0),
(9915, 897201, 'Advanced Hasher', 50, 452, 257, 2, 1, 0),
(9916, 897201, 'riddle', 10, 0, 0, 26, 0, 0),
(9917, 897201, 'Advanced Cracker', 53, 555, 318, 1, 1, 0),
(9918, 897201, 'Intermediate Firewall', 36, 207, 118, 4, 1, 0),
(9919, 897201, 'Advanced Seeker', 50, 295, 168, 6, 0, 0),
(9920, 897201, 'Advanced Hidder', 50, 295, 168, 5, 0, 0),
(9921, 897201, 'Advanced Spam', 50, 236, 134, 8, 0, 0),
(9922, 897201, 'Basic Nmap', 10, 23, 8, 15, 0, 0),
(9923, 897201, 'Advanced Miner', 50, 413, 235, 20, 0, 0),
(9924, 897201, 'Advanced Warez', 50, 236, 134, 9, 0, 0),
(9925, 897202, 'Super Hasher', 100, 1890, 1110, 2, 1, 0),
(9926, 897202, 'riddle', 10, 0, 0, 26, 0, 0),
(9927, 897202, 'Super Cracker', 110, 2230, 1350, 1, 1, 0),
(9928, 897202, 'Big Firewall', 70, 837, 490, 4, 1, 0),
(9929, 897202, 'Super Seeker', 100, 1250, 550, 6, 0, 0),
(9930, 897202, 'Super Hidder', 100, 1250, 550, 5, 0, 0),
(9931, 897202, 'Super Miner', 100, 1730, 970, 20, 0, 0),
(9932, 897202, 'Super Warez', 100, 1010, 340, 9, 0, 0),
(9933, 897202, 'Big SSH Exploit', 75, 874, 515, 14, 0, 0),
(9934, 897202, 'Big FTP Exploit', 70, 757, 444, 13, 0, 0),
(9935, 897203, 'Ultimate Hasher', 200, 5540, 3980, 2, 1, 0),
(9936, 897251, 'Decent Firewall', 20, 63, 30, 4, 1, 0),
(9937, 897251, 'Decent Hasher', 20, 69, 33, 2, 1, 0),
(9938, 897256, 'Basic Firewall', 10, 23, 8, 4, 1, 0),
(9939, 897256, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(9940, 897256, 'Basic Port Scan', 10, 23, 8, 3, 0, 0),
(9941, 897256, 'Basic Cracker', 10, 28, 9, 1, 1, 0),
(9942, 897256, 'Basic Seeker', 10, 17, 6, 6, 0, 0),
(9943, 897256, 'Basic Hidder', 10, 17, 6, 5, 0, 0),
(9944, 897256, 'Basic FTP Exploit', 10, 21, 7, 13, 0, 0),
(9945, 897256, 'Basic Spam', 10, 14, 5, 8, 0, 0),
(9946, 897256, 'Basic Collector', 10, 16, 5, 11, 0, 0),
(9947, 897256, 'Basic SSH Exploit', 10, 21, 7, 14, 0, 0),
(9948, 897253, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(9949, 897252, 'Advanced Firewall', 50, 413, 235, 4, 1, 0),
(9950, 897252, 'Advanced Hasher', 50, 452, 257, 2, 1, 0),
(9951, 897252, 'Super Miner', 100, 1730, 970, 20, 0, 0),
(9952, 897257, 'Super Firewall', 100, 1730, 970, 4, 1, 0),
(9953, 897257, 'Super Hasher', 100, 1890, 1110, 2, 1, 0),
(9954, 897258, 'Intermediate Firewall', 35, 195, 110, 4, 1, 0),
(9955, 897258, 'Advanced Hasher', 50, 452, 257, 2, 1, 0),
(9956, 897259, 'Big Firewall', 75, 966, 569, 4, 1, 0),
(9957, 897259, 'Super Hasher', 100, 1890, 1110, 2, 1, 0),
(9958, 897260, 'Decent Firewall', 25, 98, 51, 4, 1, 0),
(9959, 897260, 'Decent Hasher', 25, 107, 56, 2, 1, 0),
(9960, 897260, 'Winblows 8.1', 20, 63, 30, 17, 0, 0),
(9961, 897260, 'F.L.I.E.N.D.S', 10, 23, 8, 17, 0, 0),
(9962, 897260, 'Fotoshop CS6', 30, 142, 78, 17, 0, 0),
(9963, 897261, 'Generic Firewall', 15, 39, 16, 4, 1, 0),
(9964, 897261, 'Generic Hasher', 15, 42, 17, 2, 1, 0),
(9965, 897262, 'Competent Firewall', 40, 258, 149, 4, 1, 0),
(9966, 897262, 'Competent Hasher', 40, 283, 163, 2, 1, 0),
(9967, 897263, 'Decent Firewall', 25, 98, 51, 4, 1, 0),
(9968, 897263, 'Decent Hasher', 25, 107, 56, 2, 1, 0),
(9969, 897264, 'Amazing Firewall', 80, 1106, 653, 4, 1, 0),
(9970, 897264, 'Amazing Hasher', 80, 1211, 715, 2, 1, 0),
(9971, 897265, 'Advanced Firewall', 60, 606, 351, 4, 1, 0),
(9972, 897265, 'Advanced Hasher', 60, 663, 384, 2, 1, 0),
(9973, 897266, 'Generic Cracker', 19, 69, 32, 1, 1, 0),
(9974, 897266, 'Generic Hasher', 17, 52, 23, 2, 1, 0),
(9975, 897266, 'Basic Spam', 11, 15, 5, 8, 0, 0),
(9976, 897266, 'Generic Firewall', 17, 47, 21, 4, 1, 0),
(9977, 897267, 'Decent Cracker', 27, 136, 73, 1, 1, 0),
(9978, 897267, 'Decent Hasher', 20, 69, 33, 2, 1, 0),
(9979, 897267, 'Generic Firewall', 17, 47, 21, 4, 1, 0),
(9980, 897268, 'Decent Cracker', 25, 116, 61, 1, 1, 0),
(9981, 897268, 'Decent Hasher', 27, 125, 67, 2, 1, 0),
(9982, 897268, 'Decent Warez', 20, 36, 18, 9, 0, 0),
(9983, 897268, 'Decent Firewall', 22, 76, 38, 4, 1, 0),
(9984, 897268, 'Decent FTP Exploit', 25, 89, 46, 13, 0, 0),
(9985, 897269, 'Generic Cracker', 18, 62, 28, 1, 1, 0),
(9986, 897269, 'Generic Hasher', 17, 52, 23, 2, 1, 0),
(9987, 897269, 'Generic Spam', 15, 22, 9, 8, 0, 0),
(9988, 897269, 'Decent Firewall', 25, 98, 51, 4, 1, 0),
(9989, 897269, 'Decent Anti-Virus', 23, 63, 32, 7, 0, 0),
(9990, 897269, 'Decent Hidder', 22, 54, 27, 5, 0, 0),
(9991, 897270, 'Generic Cracker', 17, 56, 25, 1, 1, 0),
(9992, 897270, 'Generic Hasher', 19, 63, 30, 2, 1, 0),
(9993, 897270, 'Decent Spam', 20, 36, 18, 8, 0, 0),
(9994, 897270, 'Generic Firewall', 17, 47, 21, 4, 1, 0),
(9995, 897270, 'Basic Port Scan', 10, 23, 8, 3, 0, 0),
(9996, 897270, 'Decent FTP Exploit', 25, 89, 46, 13, 0, 0),
(9997, 897271, 'Decent Cracker', 26, 126, 66, 1, 1, 0),
(9998, 897271, 'Generic Hasher', 19, 63, 30, 2, 1, 0),
(9999, 897271, 'Decent Firewall', 20, 63, 30, 4, 1, 0),
(10000, 897272, 'Generic Cracker', 17, 56, 25, 1, 1, 0),
(10001, 897272, 'Basic Hasher', 14, 38, 15, 2, 1, 0),
(10002, 897272, 'Basic Firewall', 13, 31, 12, 4, 1, 0),
(10003, 897272, 'Generic FTP Exploit', 15, 35, 15, 13, 0, 0),
(10004, 897272, 'Generic Miner', 15, 39, 16, 20, 0, 0),
(10005, 897272, 'Basic SSH Exploit', 11, 23, 8, 14, 0, 0),
(10006, 897273, 'Basic Cracker', 11, 30, 10, 1, 1, 0),
(10007, 897273, 'Basic Hasher', 12, 31, 11, 2, 1, 0),
(10008, 897273, 'Decent Spam', 20, 36, 18, 8, 0, 0),
(10009, 897273, 'Basic Firewall', 10, 23, 8, 4, 1, 0),
(10010, 897273, 'Basic SSH Exploit', 13, 28, 11, 14, 0, 0),
(10011, 897273, 'Basic FTP Exploit', 12, 26, 9, 13, 0, 0),
(10012, 897273, 'Basic Warez', 10, 14, 5, 9, 0, 0),
(10013, 897273, 'Basic Port Scan', 10, 23, 8, 3, 0, 0),
(10014, 897274, 'Basic Cracker', 13, 37, 14, 1, 1, 0),
(10015, 897274, 'Basic Hasher', 11, 28, 10, 2, 1, 0),
(10016, 897274, 'Basic Hidder', 14, 25, 10, 5, 0, 0),
(10017, 897274, 'Basic Firewall', 12, 28, 10, 4, 1, 0),
(10018, 897274, 'Basic Spam', 12, 16, 6, 8, 0, 0),
(10019, 897274, 'Basic Seeker', 12, 20, 7, 6, 0, 0),
(10020, 897274, 'Basic FTP Exploit', 11, 23, 8, 13, 0, 0),
(10021, 897275, 'Basic Cracker', 13, 37, 14, 1, 1, 0),
(10022, 897275, 'Generic Hasher', 17, 52, 23, 2, 1, 0),
(10023, 897275, 'Decent Miner', 20, 63, 30, 20, 0, 0),
(10024, 897275, 'Basic Firewall', 14, 35, 14, 4, 1, 0),
(10025, 897275, 'Generic Hidder', 16, 31, 13, 5, 0, 0),
(10026, 897275, 'Generic Hidder', 16, 31, 13, 5, 0, 0),
(10027, 897275, 'Basic Hidder', 13, 23, 9, 5, 0, 0),
(10028, 897275, 'Generic Spam', 15, 22, 9, 8, 0, 0),
(10029, 897276, 'Basic Cracker', 14, 41, 16, 1, 1, 0),
(10030, 897276, 'Basic Hasher', 13, 34, 13, 2, 1, 0),
(10031, 897276, 'Basic Spam', 12, 16, 6, 8, 0, 0),
(10032, 897276, 'Generic Firewall', 17, 47, 21, 4, 1, 0),
(10033, 897276, 'Basic Port Scan', 10, 23, 8, 3, 0, 0),
(10034, 897276, 'Basic FTP Exploit', 12, 26, 9, 13, 0, 0),
(10035, 897276, 'Basic Seeker', 12, 20, 7, 6, 0, 0),
(10036, 897276, 'Basic Warez', 13, 18, 7, 9, 0, 0),
(10037, 897276, 'Basic Hidder', 11, 18, 6, 5, 0, 0),
(10038, 897277, 'Decent Cracker', 20, 75, 36, 1, 1, 0),
(10039, 897277, 'Decent Hasher', 22, 83, 42, 2, 1, 0),
(10040, 897277, 'Generic SSH Exploit', 17, 43, 19, 14, 0, 0),
(10041, 897277, 'Basic Firewall', 10, 23, 8, 4, 1, 0),
(10042, 897277, 'Basic Port Scan', 10, 23, 8, 3, 0, 0),
(10043, 897277, 'Generic FTP Exploit', 16, 39, 17, 13, 0, 0),
(10044, 897278, 'Decent Cracker', 22, 90, 45, 1, 1, 0),
(10045, 897278, 'Generic Hasher', 16, 47, 20, 2, 1, 0),
(10046, 897278, 'Basic Spam', 14, 20, 8, 8, 0, 0),
(10047, 897278, 'Generic Firewall', 19, 58, 27, 4, 1, 0),
(10048, 897278, 'Basic Port Scan', 10, 23, 8, 3, 0, 0),
(10049, 897278, 'Basic SSH Exploit', 14, 32, 13, 14, 0, 0),
(10050, 897278, 'Generic Hidder', 18, 38, 17, 5, 0, 0),
(10051, 897279, 'Decent Cracker', 27, 136, 73, 1, 1, 0),
(10052, 897279, 'Decent Hasher', 28, 135, 73, 2, 1, 0),
(10053, 897279, 'Decent Firewall', 24, 90, 46, 4, 1, 0),
(10054, 897280, 'Decent Cracker', 23, 99, 50, 1, 1, 0),
(10055, 897280, 'Decent Hasher', 25, 107, 56, 2, 1, 0),
(10056, 897280, 'Generic Warez', 15, 22, 9, 9, 0, 0),
(10057, 897280, 'Decent Firewall', 20, 63, 30, 4, 1, 0),
(10058, 897280, 'Basic Anti-Virus', 13, 24, 9, 7, 0, 0),
(10059, 897280, 'Generic FTP Exploit', 16, 39, 17, 13, 0, 0),
(10060, 897281, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10061, 897282, 'Intermediate Cracker', 35, 232, 131, 1, 1, 0),
(10062, 897282, 'Intermediate Hasher', 33, 189, 106, 2, 1, 0),
(10063, 897282, 'Decent Spam', 22, 44, 22, 8, 0, 0),
(10064, 897282, 'Decent Firewall', 28, 123, 66, 4, 1, 0),
(10065, 897282, 'Basic Hidder', 12, 20, 7, 5, 0, 0),
(10066, 897283, 'Advanced Cracker', 59, 696, 403, 1, 1, 0),
(10067, 897283, 'Competent Hasher', 42, 313, 182, 2, 1, 0),
(10068, 897283, 'Intermediate Spam', 39, 140, 81, 8, 0, 0),
(10069, 897283, 'Intermediate Firewall', 34, 184, 103, 4, 1, 0),
(10070, 897283, 'Intermediate Seeker', 36, 148, 84, 6, 0, 0),
(10071, 897283, 'Advanced FTP Exploit', 50, 374, 213, 13, 0, 0),
(10072, 897284, 'Competent Cracker', 40, 307, 178, 1, 1, 0),
(10073, 897284, 'Intermediate Hasher', 30, 155, 85, 2, 1, 0),
(10074, 897284, 'Decent Spam', 24, 52, 27, 8, 0, 0),
(10075, 897284, 'Intermediate Firewall', 37, 219, 125, 4, 1, 0),
(10076, 897284, 'Intermediate SSH Exploit', 33, 156, 88, 14, 0, 0),
(10077, 897284, 'Decent FTP Exploit', 28, 111, 60, 13, 0, 0),
(10078, 897284, 'Decent Seeker', 27, 82, 44, 6, 0, 0),
(10079, 897285, 'Competent Cracker', 44, 375, 220, 1, 1, 0),
(10080, 897285, 'Intermediate Hasher', 38, 254, 146, 2, 1, 0),
(10081, 897285, 'Generic Spam', 19, 33, 16, 8, 0, 0),
(10082, 897285, 'Decent Firewall', 28, 123, 66, 4, 1, 0),
(10083, 897285, 'Intermediate SSH Exploit', 33, 156, 88, 14, 0, 0),
(10084, 897285, 'Competent FTP Exploit', 40, 234, 135, 13, 0, 0),
(10085, 897286, 'Intermediate Cracker', 38, 276, 158, 1, 1, 0),
(10086, 897286, 'Advanced Hasher', 54, 532, 305, 2, 1, 0),
(10087, 897286, 'Decent Spam', 20, 36, 18, 8, 0, 0),
(10088, 897286, 'Competent Firewall', 40, 258, 149, 4, 1, 0),
(10089, 897287, 'Advanced Cracker', 52, 534, 305, 1, 1, 0),
(10090, 897287, 'Advanced Hasher', 56, 574, 330, 2, 1, 0),
(10091, 897287, 'Intermediate Firewall', 30, 142, 78, 4, 1, 0),
(10092, 897288, 'Advanced Cracker', 56, 624, 359, 1, 1, 0),
(10093, 897288, 'Advanced Hasher', 52, 491, 281, 2, 1, 0),
(10094, 897288, 'Intermediate Spam', 39, 140, 81, 8, 0, 0),
(10095, 897288, 'Intermediate Firewall', 36, 207, 118, 4, 1, 0),
(10096, 897288, 'Basic Port Scan', 10, 23, 8, 3, 0, 0),
(10097, 897288, 'Intermediate FTP Exploit', 30, 128, 70, 13, 0, 0),
(10098, 897288, 'Decent Seeker', 29, 95, 52, 6, 0, 0),
(10099, 897288, 'Competent SSH Exploit', 46, 313, 185, 14, 0, 0),
(10100, 897288, 'Intermediate Hidder', 36, 148, 84, 5, 0, 0),
(10101, 897289, 'Basic Cracker', 14, 41, 16, 1, 1, 0),
(10102, 897289, 'Basic Hasher', 13, 34, 13, 2, 1, 0),
(10103, 897289, 'Basic Spam', 12, 16, 6, 8, 0, 0),
(10104, 897289, 'Generic Firewall', 17, 47, 21, 4, 1, 0),
(10105, 897289, 'Basic Port Scan', 10, 23, 8, 3, 0, 0),
(10106, 897289, 'Basic FTP Exploit', 12, 26, 9, 13, 0, 0),
(10107, 897289, 'Basic Seeker', 12, 20, 7, 6, 0, 0),
(10108, 897289, 'Basic Warez', 13, 18, 7, 9, 0, 0),
(10109, 897289, 'Basic Hidder', 11, 18, 6, 5, 0, 0),
(10110, 897290, 'Competent Cracker', 40, 307, 178, 1, 1, 0),
(10111, 897290, 'Intermediate Hasher', 36, 227, 129, 2, 1, 0),
(10112, 897290, 'Competent Warez', 42, 164, 95, 9, 0, 0),
(10113, 897290, 'Advanced Firewall', 59, 585, 338, 4, 1, 0),
(10114, 897290, 'Advanced FTP Exploit', 63, 607, 353, 13, 0, 0),
(10115, 897291, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10116, 897292, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10117, 897293, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10118, 897294, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10119, 897295, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10120, 897296, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10121, 897297, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10122, 897298, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10123, 897299, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10124, 897300, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10125, 897204, 'puzzle', 0, 0, 0, 26, 0, 0),
(10126, 897204, 'Super Firewall', 100, 1730, 970, 4, 1, 0),
(10127, 897204, 'Amazing FTP Exploit', 87, 1192, 707, 13, 0, 0),
(10128, 897204, 'Epic Hidder', 150, 1900, 850, 5, 0, 0),
(10129, 897204, 'Epic Cracker', 150, 3450, 2250, 1, 1, 0),
(10130, 897204, 'Ultra Anti-Virus', 140, 1846, 852, 7, 0, 0),
(10131, 897204, 'Advanced SSH Exploit', 62, 587, 341, 14, 0, 0),
(10132, 897204, 'Ultra Hasher', 140, 2798, 1706, 2, 1, 0),
(10133, 897204, 'Super Seeker', 104, 1275, 547, 6, 0, 0),
(10134, 897205, 'puzzle', 0, 0, 0, 26, 0, 0),
(10135, 897205, 'Super Firewall', 110, 1866, 1030, 4, 1, 0),
(10136, 897205, 'Amazing FTP Exploit', 88, 1220, 724, 13, 0, 0),
(10137, 897205, 'Ultra Hidder', 134, 1611, 673, 5, 0, 0),
(10138, 897205, 'Epic Cracker', 160, 3880, 2600, 1, 1, 0),
(10139, 897205, 'Amazing SSH Exploit', 82, 1053, 623, 14, 0, 0),
(10140, 897205, 'Epic Hasher', 150, 3140, 1970, 2, 1, 0),
(10141, 897205, 'Epic Seeker', 150, 1900, 850, 6, 0, 0),
(10142, 897205, 'Epic Miner', 150, 2830, 1690, 20, 0, 0),
(10143, 897206, 'puzzle', 0, 0, 0, 26, 0, 0),
(10144, 897206, 'Intermediate Firewall', 32, 162, 90, 4, 1, 0),
(10145, 897206, 'Intermediate FTP Exploit', 36, 187, 107, 13, 0, 0),
(10146, 897206, 'Intermediate Hidder', 37, 157, 90, 5, 0, 0),
(10147, 897206, 'Competent Cracker', 44, 375, 220, 1, 1, 0),
(10148, 897206, 'Decent SSH Exploit', 24, 82, 42, 14, 0, 0),
(10149, 897206, 'Competent Hasher', 42, 313, 182, 2, 1, 0),
(10150, 897206, 'Intermediate Seeker', 34, 131, 74, 6, 0, 0),
(10151, 897206, 'Competent Miner', 40, 258, 149, 20, 0, 0),
(10152, 897207, 'puzzle', 0, 0, 0, 26, 0, 0),
(10153, 897207, 'Intermediate Firewall', 34, 184, 103, 4, 1, 0),
(10154, 897207, 'Intermediate FTP Exploit', 34, 166, 94, 13, 0, 0),
(10155, 897207, 'Competent Hidder', 40, 185, 107, 5, 0, 0),
(10156, 897207, 'Competent Spam', 45, 189, 111, 8, 0, 0),
(10157, 897207, 'Competent Cracker', 46, 412, 243, 1, 1, 0),
(10158, 897207, 'Intermediate SSH Exploit', 30, 128, 70, 14, 0, 0),
(10159, 897207, 'Competent Hasher', 44, 345, 202, 2, 1, 0),
(10160, 897207, 'Intermediate Seeker', 37, 157, 90, 6, 0, 0),
(10161, 897208, 'puzzle', 0, 0, 0, 26, 0, 0),
(10162, 897208, 'Intermediate Firewall', 34, 184, 103, 4, 1, 0),
(10163, 897208, 'Intermediate FTP Exploit', 36, 187, 107, 13, 0, 0),
(10164, 897208, 'Competent Hidder', 46, 248, 146, 5, 0, 0),
(10165, 897208, 'Competent Cracker', 48, 451, 267, 1, 1, 0),
(10166, 897208, 'Advanced Anti-Virus', 50, 315, 179, 7, 0, 0),
(10167, 897208, 'Decent SSH Exploit', 20, 57, 28, 14, 0, 0),
(10168, 897208, 'Competent Hasher', 46, 379, 223, 2, 1, 0),
(10169, 897208, 'Competent Seeker', 40, 185, 107, 6, 0, 0),
(10170, 897209, 'puzzle', 0, 0, 0, 26, 0, 0),
(10171, 897209, 'Intermediate Firewall', 36, 207, 118, 4, 1, 0),
(10172, 897209, 'Intermediate FTP Exploit', 30, 128, 70, 13, 0, 0),
(10173, 897209, 'Competent Hidder', 44, 225, 132, 5, 0, 0),
(10174, 897209, 'Advanced Collector', 50, 275, 157, 11, 0, 0),
(10175, 897209, 'Advanced Cracker', 50, 491, 280, 1, 1, 0),
(10176, 897209, 'Intermediate SSH Exploit', 30, 128, 70, 14, 0, 0),
(10177, 897209, 'Competent Hasher', 48, 415, 245, 2, 1, 0),
(10178, 897209, 'Competent Seeker', 40, 185, 107, 6, 0, 0),
(10179, 897210, 'puzzle', 0, 0, 0, 26, 0, 0),
(10180, 897210, 'Decent Firewall', 28, 123, 66, 4, 1, 0),
(10181, 897210, 'Decent FTP Exploit', 23, 75, 38, 13, 0, 0),
(10182, 897210, 'Intermediate Hidder', 33, 123, 69, 5, 0, 0),
(10183, 897210, 'Intermediate DDoS', 30, 88, 48, 10, 0, 0),
(10184, 897210, 'Intermediate Cracker', 36, 246, 140, 1, 1, 0),
(10185, 897210, 'Generic SSH Exploit', 19, 52, 25, 14, 0, 0),
(10186, 897210, 'Intermediate Breaker', 30, 95, 52, 12, 0, 0),
(10187, 897210, 'Intermediate Hasher', 34, 201, 113, 2, 1, 0),
(10188, 897210, 'Decent Seeker', 27, 82, 44, 6, 0, 0),
(10189, 897211, 'puzzle', 0, 0, 0, 26, 0, 0),
(10190, 897211, 'Intermediate Firewall', 30, 142, 78, 4, 1, 0),
(10191, 897211, 'Decent FTP Exploit', 22, 69, 34, 13, 0, 0),
(10192, 897211, 'Competent Hidder', 40, 185, 107, 5, 0, 0),
(10193, 897211, 'Intermediate Cracker', 38, 276, 158, 1, 1, 0),
(10194, 897211, 'Competent Anti-Virus', 40, 197, 114, 7, 0, 0),
(10195, 897211, 'Decent SSH Exploit', 21, 63, 31, 14, 0, 0),
(10196, 897211, 'Intermediate Hasher', 36, 227, 129, 2, 1, 0),
(10197, 897211, 'Competent Seeker', 40, 185, 107, 6, 0, 0),
(10198, 897212, 'puzzle', 0, 0, 0, 26, 0, 0),
(10199, 897212, 'Intermediate Firewall', 30, 142, 78, 4, 1, 0),
(10200, 897212, 'Intermediate FTP Exploit', 30, 128, 70, 13, 0, 0),
(10201, 897212, 'Intermediate Hidder', 37, 157, 90, 5, 0, 0),
(10202, 897212, 'Competent Collector', 40, 172, 100, 11, 0, 0),
(10203, 897212, 'Competent Spam', 40, 148, 86, 8, 0, 0),
(10204, 897212, 'Competent Cracker', 40, 307, 178, 1, 1, 0),
(10205, 897212, 'Intermediate SSH Exploit', 30, 128, 70, 14, 0, 0),
(10206, 897212, 'Intermediate Hasher', 38, 254, 146, 2, 1, 0),
(10207, 897212, 'Intermediate Seeker', 35, 140, 79, 6, 0, 0),
(10208, 897213, 'puzzle', 0, 0, 0, 26, 0, 0),
(10209, 897213, 'Intermediate Firewall', 32, 162, 90, 4, 1, 0),
(10210, 897213, 'Decent FTP Exploit', 29, 120, 65, 13, 0, 0),
(10211, 897213, 'Decent Hidder', 28, 88, 48, 5, 0, 0),
(10212, 897213, 'Competent Warez', 40, 148, 86, 9, 0, 0),
(10213, 897213, 'Competent Cracker', 42, 340, 198, 1, 1, 0),
(10214, 897213, 'Decent SSH Exploit', 22, 69, 34, 14, 0, 0),
(10215, 897213, 'Competent Hasher', 40, 283, 163, 2, 1, 0),
(10216, 897213, 'Intermediate Seeker', 33, 123, 69, 6, 0, 0),
(10217, 897214, 'puzzle', 0, 0, 0, 26, 0, 0),
(10218, 897214, 'Ultra Firewall', 140, 2526, 1462, 4, 1, 0),
(10219, 897214, 'Super FTP Exploit', 107, 1646, 855, 13, 0, 0),
(10220, 897214, 'Ultra Hidder', 142, 1746, 752, 5, 0, 0),
(10221, 897214, 'Epic Warez', 150, 1435, 430, 9, 0, 0),
(10222, 897214, 'Ultimate Cracker', 190, 5470, 3950, 1, 1, 0),
(10223, 897214, 'Epic Anti-Virus', 150, 2055, 990, 7, 0, 0),
(10224, 897214, 'Ultra SSH Exploit', 124, 1908, 990, 14, 0, 0),
(10225, 897214, 'Ultimate Hasher', 180, 4442, 3038, 2, 1, 0),
(10226, 897214, 'Ultra Seeker', 134, 1611, 673, 6, 0, 0),
(10227, 897215, 'puzzle', 0, 0, 0, 26, 0, 0),
(10228, 897215, 'Epic Firewall', 150, 2830, 1690, 4, 1, 0),
(10229, 897215, 'Ultra FTP Exploit', 127, 1966, 1026, 13, 0, 0),
(10230, 897215, 'Ultra Hidder', 143, 1764, 763, 5, 0, 0),
(10231, 897215, 'Ultimate Cracker', 200, 6100, 4500, 1, 1, 0),
(10232, 897215, 'Amazing SSH Exploit', 95, 1431, 852, 14, 0, 0),
(10233, 897215, 'Ultimate Hasher', 190, 4968, 3487, 2, 1, 0),
(10234, 897215, 'Ultra Seeker', 128, 1522, 626, 6, 0, 0),
(10235, 897216, 'puzzle', 0, 0, 0, 26, 0, 0),
(10236, 897216, 'Ultra Firewall', 120, 2044, 1132, 4, 1, 0),
(10237, 897216, 'Ultra FTP Exploit', 130, 2026, 1064, 13, 0, 0),
(10238, 897216, 'Ultra Hidder', 149, 1880, 837, 5, 0, 0),
(10239, 897216, 'Epic Cracker', 170, 4360, 3000, 1, 1, 0),
(10240, 897216, 'Ultra SSH Exploit', 130, 2026, 1064, 14, 0, 0),
(10241, 897216, 'Epic Breaker', 150, 1745, 711, 12, 0, 0),
(10242, 897216, 'Epic Hasher', 160, 3528, 2280, 2, 1, 0),
(10243, 897216, 'Ultra Seeker', 132, 1580, 656, 6, 0, 0),
(10244, 897217, 'puzzle', 0, 0, 0, 26, 0, 0),
(10245, 897217, 'Ultra Firewall', 130, 2264, 1276, 4, 1, 0),
(10246, 897217, 'Ultra FTP Exploit', 127, 1966, 1026, 13, 0, 0),
(10247, 897217, 'Ultra Hidder', 149, 1880, 837, 5, 0, 0),
(10248, 897217, 'Epic Collector', 150, 1745, 711, 11, 0, 0),
(10249, 897217, 'Epic Spam', 150, 1435, 430, 8, 0, 0),
(10250, 897217, 'Ultimate Cracker', 180, 4890, 3450, 1, 1, 0),
(10251, 897217, 'Super SSH Exploit', 114, 1741, 897, 14, 0, 0),
(10252, 897217, 'Epic Hasher', 170, 3962, 2636, 2, 1, 0),
(10253, 897217, 'Ultra Seeker', 142, 1746, 752, 6, 0, 0),
(10254, 897218, 'puzzle', 0, 0, 0, 26, 0, 0),
(10255, 897218, 'Intermediate Firewall', 39, 245, 141, 4, 1, 0),
(10256, 897218, 'Intermediate FTP Exploit', 36, 187, 107, 13, 0, 0),
(10257, 897218, 'Advanced DDoS', 50, 256, 146, 10, 0, 0),
(10258, 897218, 'Advanced Cracker', 56, 624, 359, 1, 1, 0),
(10259, 897218, 'Competent SSH Exploit', 42, 259, 151, 14, 0, 0),
(10260, 897218, 'Advanced Breaker', 50, 275, 157, 12, 0, 0),
(10261, 897218, 'Advanced Hasher', 53, 511, 293, 2, 1, 0),
(10262, 897219, 'puzzle', 0, 0, 0, 26, 0, 0),
(10263, 897219, 'Intermediate Firewall', 39, 245, 141, 4, 1, 0),
(10264, 897219, 'Competent FTP Exploit', 42, 259, 151, 13, 0, 0),
(10265, 897219, 'Advanced Hidder', 60, 433, 251, 5, 0, 0),
(10266, 897219, 'Advanced Cracker', 59, 696, 403, 1, 1, 0),
(10267, 897219, 'Big Anti-Virus', 70, 638, 374, 7, 0, 0),
(10268, 897219, 'Intermediate SSH Exploit', 33, 156, 88, 14, 0, 0),
(10269, 897219, 'Advanced Hasher', 56, 574, 330, 2, 1, 0),
(10270, 897219, 'Advanced Miner', 60, 606, 351, 20, 0, 0),
(10271, 897220, 'puzzle', 0, 0, 0, 26, 0, 0),
(10272, 897220, 'Amazing Firewall', 90, 1413, 840, 4, 1, 0),
(10273, 897220, 'Super Hidder', 104, 1275, 547, 5, 0, 0),
(10274, 897220, 'Ultra Collector', 120, 1316, 488, 11, 0, 0),
(10275, 897220, 'Ultra Spam', 120, 1108, 304, 8, 0, 0),
(10276, 897220, 'Ultra Cracker', 130, 2740, 1700, 1, 1, 0),
(10277, 897220, 'Ultra Hasher', 120, 2252, 1316, 2, 1, 0),
(10278, 897220, 'Super Seeker', 110, 1320, 550, 6, 0, 0),
(10279, 897221, 'puzzle', 0, 0, 0, 26, 0, 0),
(10280, 897221, 'Amazing Firewall', 90, 1413, 840, 4, 1, 0),
(10281, 897221, 'Amazing FTP Exploit', 90, 1279, 760, 13, 0, 0),
(10282, 897221, 'Amazing Hidder', 98, 1205, 719, 5, 0, 0),
(10283, 897221, 'Ultra Warez', 140, 1302, 364, 9, 0, 0),
(10284, 897221, 'Ultra Cracker', 140, 3070, 1950, 1, 1, 0),
(10285, 897221, 'Amazing SSH Exploit', 90, 1279, 760, 14, 0, 0),
(10286, 897221, 'Ultra Hasher', 130, 2502, 1489, 2, 1, 0),
(10287, 897221, 'Super Seeker', 102, 1262, 548, 6, 0, 0),
(10288, 897222, 'puzzle', 0, 0, 0, 26, 0, 0),
(10289, 897222, 'Basic Firewall', 10, 23, 8, 4, 1, 0),
(10290, 897222, 'Basic FTP Exploit', 10, 21, 7, 13, 0, 0),
(10291, 897222, 'Basic Hidder', 10, 17, 6, 5, 0, 0),
(10292, 897222, 'Basic Cracker', 11, 30, 10, 1, 1, 0),
(10293, 897222, 'Basic Hasher', 10, 26, 8, 2, 1, 0),
(10294, 897223, 'puzzle', 0, 0, 0, 26, 0, 0),
(10295, 897223, 'Basic Firewall', 12, 28, 10, 4, 1, 0),
(10296, 897223, 'Basic FTP Exploit', 11, 23, 8, 13, 0, 0),
(10297, 897223, 'Basic Hidder', 11, 18, 6, 5, 0, 0),
(10298, 897223, 'Basic DDoS', 10, 15, 5, 10, 0, 0),
(10299, 897223, 'Basic Cracker', 13, 37, 14, 1, 1, 0),
(10300, 897223, 'Basic SSH Exploit', 10, 21, 7, 14, 0, 0),
(10301, 897223, 'Basic Breaker', 10, 16, 5, 12, 0, 0),
(10302, 897223, 'Basic Hasher', 12, 31, 11, 2, 1, 0),
(10303, 897223, 'Basic Seeker', 10, 17, 6, 6, 0, 0),
(10304, 897224, 'puzzle', 0, 0, 0, 26, 0, 0),
(10305, 897224, 'Basic Firewall', 10, 23, 8, 4, 1, 0),
(10306, 897224, 'Basic Warez', 10, 14, 5, 9, 0, 0),
(10307, 897224, 'F.L.I.E.N.D.S', 10, 23, 8, 17, 0, 0),
(10308, 897224, 'Basic Cracker', 12, 34, 12, 1, 1, 0),
(10309, 897224, 'Basic SSH Exploit', 10, 21, 7, 14, 0, 0),
(10310, 897224, 'Basic Hasher', 11, 28, 10, 2, 1, 0),
(10311, 897224, 'Basic Seeker', 12, 20, 7, 6, 0, 0),
(10312, 897225, 'puzzle', 0, 0, 0, 26, 0, 0),
(10313, 897225, 'Basic Firewall', 14, 35, 14, 4, 1, 0),
(10314, 897225, 'Generic FTP Exploit', 18, 47, 22, 13, 0, 0),
(10315, 897225, 'Basic Hidder', 13, 23, 9, 5, 0, 0),
(10316, 897225, 'Generic Collector', 15, 26, 11, 11, 0, 0),
(10317, 897225, 'Generic Spam', 15, 22, 9, 8, 0, 0),
(10318, 897225, 'Generic Cracker', 15, 46, 19, 1, 1, 0),
(10319, 897225, 'Generic Anti-Virus', 15, 30, 12, 7, 0, 0),
(10320, 897225, 'Basic Hasher', 14, 38, 15, 2, 1, 0),
(10321, 897225, 'Basic Seeker', 10, 17, 6, 6, 0, 0),
(10322, 897226, 'puzzle', 0, 0, 0, 26, 0, 0),
(10323, 897226, 'Basic Firewall', 12, 28, 10, 4, 1, 0),
(10324, 897226, 'Basic Hidder', 14, 25, 10, 5, 0, 0),
(10325, 897226, 'Basic Cracker', 14, 41, 16, 1, 1, 0),
(10326, 897226, 'Basic SSH Exploit', 11, 23, 8, 14, 0, 0),
(10327, 897226, 'Basic Hasher', 13, 34, 13, 2, 1, 0),
(10328, 897226, 'Basic Seeker', 11, 18, 6, 6, 0, 0),
(10329, 897226, 'Basic Miner', 13, 31, 12, 20, 0, 0),
(10330, 897227, 'puzzle', 0, 0, 0, 26, 0, 0),
(10331, 897227, 'Generic Firewall', 16, 43, 18, 4, 1, 0),
(10332, 897227, 'Basic FTP Exploit', 13, 28, 11, 13, 0, 0),
(10333, 897227, 'Generic Warez', 15, 22, 9, 9, 0, 0),
(10334, 897227, 'Generic Cracker', 17, 56, 25, 1, 1, 0),
(10335, 897227, 'Generic Anti-Virus', 15, 30, 12, 7, 0, 0),
(10336, 897227, 'Basic SSH Exploit', 12, 26, 9, 14, 0, 0),
(10337, 897227, 'Generic Hasher', 16, 47, 20, 2, 1, 0),
(10338, 897227, 'Generic Miner', 16, 43, 18, 20, 0, 0),
(10339, 897228, 'puzzle', 0, 0, 0, 26, 0, 0),
(10340, 897228, 'Basic Firewall', 14, 35, 14, 4, 1, 0),
(10341, 897228, 'Basic FTP Exploit', 10, 21, 7, 13, 0, 0),
(10342, 897228, 'Generic Hidder', 15, 28, 12, 5, 0, 0),
(10343, 897228, 'Generic Cracker', 16, 51, 22, 1, 1, 0),
(10344, 897228, 'Basic Anti-Virus', 12, 22, 8, 7, 0, 0),
(10345, 897228, 'Basic SSH Exploit', 14, 32, 13, 14, 0, 0),
(10346, 897228, 'Generic Hasher', 15, 42, 17, 2, 1, 0),
(10347, 897228, 'Generic Seeker', 15, 28, 12, 6, 0, 0),
(10348, 897229, 'puzzle', 0, 0, 0, 26, 0, 0),
(10349, 897229, 'Generic Firewall', 18, 52, 24, 4, 1, 0),
(10350, 897229, 'Generic FTP Exploit', 17, 43, 19, 13, 0, 0),
(10351, 897229, 'Decent Collector', 20, 42, 20, 11, 0, 0),
(10352, 897229, 'Generic Spam', 17, 27, 12, 8, 0, 0),
(10353, 897229, 'Generic Cracker', 19, 69, 32, 1, 1, 0),
(10354, 897229, 'Basic Anti-Virus', 14, 27, 11, 7, 0, 0),
(10355, 897229, 'Basic SSH Exploit', 13, 28, 11, 14, 0, 0),
(10356, 897229, 'Generic Hasher', 18, 57, 26, 2, 1, 0),
(10357, 897229, 'Decent Seeker', 20, 45, 22, 6, 0, 0),
(10358, 897230, 'puzzle', 0, 0, 0, 26, 0, 0),
(10359, 897230, 'Generic Firewall', 16, 43, 18, 4, 1, 0),
(10360, 897230, 'Basic FTP Exploit', 10, 21, 7, 13, 0, 0),
(10361, 897230, 'Generic Hidder', 17, 34, 15, 5, 0, 0),
(10362, 897230, 'Generic DDoS', 15, 24, 10, 10, 0, 0),
(10363, 897230, 'Basic Spam', 14, 20, 8, 8, 0, 0),
(10364, 897230, 'Generic Cracker', 18, 62, 28, 1, 1, 0),
(10365, 897230, 'Basic SSH Exploit', 13, 28, 11, 14, 0, 0),
(10366, 897230, 'Generic Hasher', 17, 52, 23, 2, 1, 0),
(10367, 897230, 'Basic Seeker', 13, 23, 9, 6, 0, 0),
(10368, 897231, 'puzzle', 0, 0, 0, 26, 0, 0),
(10369, 897231, 'Amazing Firewall', 80, 1106, 653, 4, 1, 0),
(10370, 897231, 'Big FTP Exploit', 76, 899, 530, 13, 0, 0),
(10371, 897231, 'Super Hidder', 110, 1320, 550, 5, 0, 0),
(10372, 897231, 'Ultra Cracker', 120, 2460, 1500, 1, 1, 0),
(10373, 897231, 'Ultra Anti-Virus', 120, 1524, 672, 7, 0, 0),
(10374, 897231, 'Big SSH Exploit', 69, 735, 430, 14, 0, 0),
(10375, 897231, 'Super Hasher', 110, 2048, 1190, 2, 1, 0),
(10376, 897231, 'Amazing Seeker', 97, 1179, 703, 6, 0, 0),
(10377, 897232, 'puzzle', 0, 0, 0, 26, 0, 0),
(10378, 897232, 'Advanced Firewall', 60, 606, 351, 4, 1, 0),
(10379, 897232, 'Amazing FTP Exploit', 80, 1001, 591, 13, 0, 0),
(10380, 897232, 'Big Hidder', 68, 563, 329, 5, 0, 0),
(10381, 897232, 'Big DDoS', 73, 566, 332, 10, 0, 0),
(10382, 897232, 'Super Cracker', 100, 2050, 1250, 1, 1, 0),
(10383, 897232, 'Advanced SSH Exploit', 59, 529, 306, 14, 0, 0),
(10384, 897232, 'Super Breaker', 100, 1170, 481, 12, 0, 0),
(10385, 897232, 'Amazing Hasher', 95, 1732, 1031, 2, 1, 0),
(10386, 897232, 'Amazing Seeker', 96, 1154, 688, 6, 0, 0),
(10387, 897233, 'puzzle', 0, 0, 0, 26, 0, 0),
(10388, 897233, 'Decent Firewall', 20, 63, 30, 4, 1, 0),
(10389, 897233, 'Decent FTP Exploit', 26, 96, 51, 13, 0, 0),
(10390, 897233, 'Generic Hidder', 18, 38, 17, 5, 0, 0),
(10391, 897233, 'Decent DDoS', 20, 39, 19, 10, 0, 0),
(10392, 897233, 'Decent Cracker', 22, 90, 45, 1, 1, 0),
(10393, 897233, 'Generic SSH Exploit', 19, 52, 25, 14, 0, 0),
(10394, 897233, 'Decent Hasher', 21, 76, 37, 2, 1, 0),
(10395, 897234, 'puzzle', 0, 0, 0, 26, 0, 0),
(10396, 897234, 'Generic Firewall', 18, 52, 24, 4, 1, 0),
(10397, 897234, 'Decent FTP Exploit', 20, 57, 28, 13, 0, 0),
(10398, 897234, 'Generic Hidder', 15, 28, 12, 5, 0, 0),
(10399, 897234, 'Basic Spam', 14, 20, 8, 8, 0, 0),
(10400, 897234, 'Decent Cracker', 20, 75, 36, 1, 1, 0),
(10401, 897234, 'Basic SSH Exploit', 12, 26, 9, 14, 0, 0),
(10402, 897234, 'Generic Hasher', 19, 63, 30, 2, 1, 0),
(10403, 897234, 'Generic Seeker', 16, 31, 13, 6, 0, 0),
(10404, 897235, 'puzzle', 0, 0, 0, 26, 0, 0),
(10405, 897235, 'Decent Firewall', 22, 76, 38, 4, 1, 0),
(10406, 897235, 'Decent FTP Exploit', 24, 82, 42, 13, 0, 0),
(10407, 897235, 'Decent Spam', 26, 61, 32, 8, 0, 0),
(10408, 897235, 'Decent Cracker', 24, 107, 55, 1, 1, 0),
(10409, 897235, 'Decent SSH Exploit', 22, 69, 34, 14, 0, 0),
(10410, 897235, 'Decent Hasher', 23, 91, 46, 2, 1, 0),
(10411, 897235, 'Intermediate Seeker', 30, 101, 56, 6, 0, 0),
(10412, 897236, 'puzzle', 0, 0, 0, 26, 0, 0),
(10413, 897236, 'Decent Firewall', 20, 63, 30, 4, 1, 0),
(10414, 897236, 'Decent Hidder', 25, 70, 37, 5, 0, 0),
(10415, 897236, 'Decent Cracker', 23, 99, 50, 1, 1, 0),
(10416, 897236, 'Decent Anti-Virus', 25, 75, 39, 7, 0, 0),
(10417, 897236, 'Decent SSH Exploit', 24, 82, 42, 14, 0, 0),
(10418, 897236, 'Decent Hasher', 22, 83, 42, 2, 1, 0),
(10419, 897237, 'puzzle', 0, 0, 0, 26, 0, 0),
(10420, 897237, 'Decent Firewall', 24, 90, 46, 4, 1, 0),
(10421, 897237, 'Decent FTP Exploit', 23, 75, 38, 13, 0, 0),
(10422, 897237, 'Basic Hidder', 10, 17, 6, 5, 0, 0),
(10423, 897237, 'Decent Collector', 25, 65, 34, 11, 0, 0),
(10424, 897237, 'Decent Cracker', 27, 136, 73, 1, 1, 0),
(10425, 897237, 'Decent Hasher', 25, 107, 56, 2, 1, 0),
(10426, 897237, 'Generic Seeker', 15, 28, 12, 6, 0, 0),
(10427, 897237, 'Intermediate Miner', 30, 142, 78, 20, 0, 0),
(10428, 897238, 'puzzle', 0, 0, 0, 26, 0, 0),
(10429, 897238, 'Decent Firewall', 22, 76, 38, 4, 1, 0),
(10430, 897238, 'Decent FTP Exploit', 22, 69, 34, 13, 0, 0),
(10431, 897238, 'Generic Hidder', 19, 41, 20, 5, 0, 0),
(10432, 897238, 'Decent Warez', 25, 56, 29, 9, 0, 0),
(10433, 897238, 'Decent Cracker', 25, 116, 61, 1, 1, 0),
(10434, 897238, 'Generic SSH Exploit', 17, 43, 19, 14, 0, 0),
(10435, 897238, 'Decent Hasher', 24, 99, 51, 2, 1, 0),
(10436, 897238, 'Decent Seeker', 26, 76, 40, 6, 0, 0),
(10437, 897239, 'puzzle', 0, 0, 0, 26, 0, 0),
(10438, 897239, 'Decent Firewall', 26, 106, 56, 4, 1, 0),
(10439, 897239, 'Generic FTP Exploit', 16, 39, 17, 13, 0, 0),
(10440, 897239, 'Decent Hidder', 29, 95, 52, 5, 0, 0),
(10441, 897239, 'Intermediate Warez', 33, 99, 55, 9, 0, 0),
(10442, 897239, 'Intermediate Cracker', 30, 169, 92, 1, 1, 0),
(10443, 897239, 'Decent SSH Exploit', 20, 57, 28, 14, 0, 0),
(10444, 897239, 'Decent Hasher', 29, 145, 79, 2, 1, 0),
(10445, 897239, 'Intermediate Seeker', 36, 148, 84, 6, 0, 0),
(10446, 897240, 'puzzle', 0, 0, 0, 26, 0, 0),
(10447, 897240, 'Decent Firewall', 24, 90, 46, 4, 1, 0),
(10448, 897240, 'Generic FTP Exploit', 18, 47, 22, 13, 0, 0),
(10449, 897240, 'Intermediate Hidder', 33, 123, 69, 5, 0, 0),
(10450, 897240, 'Intermediate Spam', 30, 81, 45, 8, 0, 0),
(10451, 897240, 'Decent Cracker', 29, 157, 86, 1, 1, 0),
(10452, 897240, 'Intermediate Anti-Virus', 30, 108, 59, 7, 0, 0),
(10453, 897240, 'Decent SSH Exploit', 24, 82, 42, 14, 0, 0),
(10454, 897240, 'Decent Hasher', 27, 125, 67, 2, 1, 0),
(10455, 897240, 'Decent Seeker', 28, 88, 48, 6, 0, 0),
(10456, 897241, 'puzzle', 0, 0, 0, 26, 0, 0),
(10457, 897241, 'Decent Firewall', 28, 123, 66, 4, 1, 0),
(10458, 897241, 'Decent FTP Exploit', 28, 111, 60, 13, 0, 0),
(10459, 897241, 'Intermediate Hidder', 30, 101, 56, 5, 0, 0),
(10460, 897241, 'Intermediate Spam', 35, 112, 63, 8, 0, 0),
(10461, 897241, 'Intermediate Cracker', 34, 219, 123, 1, 1, 0),
(10462, 897241, 'Intermediate Anti-Virus', 34, 140, 79, 7, 0, 0),
(10463, 897241, 'Decent SSH Exploit', 24, 82, 42, 14, 0, 0),
(10464, 897241, 'Intermediate Hasher', 32, 177, 99, 2, 1, 0),
(10465, 897241, 'Decent Seeker', 28, 88, 48, 6, 0, 0),
(10466, 897242, 'puzzle', 0, 0, 0, 26, 0, 0),
(10467, 897242, 'Decent Firewall', 26, 106, 56, 4, 1, 0),
(10468, 897242, 'Intermediate FTP Exploit', 30, 128, 70, 13, 0, 0),
(10469, 897242, 'Intermediate Hidder', 37, 157, 90, 5, 0, 0),
(10470, 897242, 'Intermediate Cracker', 32, 193, 107, 1, 1, 0),
(10471, 897242, 'Intermediate SSH Exploit', 30, 128, 70, 14, 0, 0),
(10472, 897242, 'Intermediate Hasher', 30, 155, 85, 2, 1, 0),
(10473, 897243, 'puzzle', 0, 0, 0, 26, 0, 0),
(10474, 897243, 'Competent Firewall', 42, 286, 167, 4, 1, 0),
(10475, 897243, 'Advanced FTP Exploit', 50, 374, 213, 13, 0, 0),
(10476, 897243, 'Advanced Hidder', 59, 418, 242, 5, 0, 0),
(10477, 897243, 'Advanced Cracker', 64, 825, 481, 1, 1, 0),
(10478, 897243, 'Competent SSH Exploit', 45, 299, 176, 14, 0, 0),
(10479, 897243, 'Advanced Hasher', 62, 711, 413, 2, 1, 0),
(10480, 897243, 'Advanced Seeker', 56, 374, 216, 6, 0, 0),
(10481, 897244, 'puzzle', 0, 0, 0, 26, 0, 0),
(10482, 897244, 'Competent Firewall', 42, 286, 167, 4, 1, 0),
(10483, 897244, 'Competent FTP Exploit', 42, 259, 151, 13, 0, 0),
(10484, 897244, 'Big Collector', 70, 558, 327, 11, 0, 0),
(10485, 897244, 'Big Spam', 70, 478, 280, 8, 0, 0),
(10486, 897244, 'Advanced Cracker', 62, 772, 449, 1, 1, 0),
(10487, 897244, 'Competent SSH Exploit', 45, 299, 176, 14, 0, 0),
(10488, 897244, 'Advanced Hasher', 59, 640, 370, 2, 1, 0),
(10489, 897244, 'Advanced Seeker', 60, 433, 251, 6, 0, 0),
(10490, 897245, 'puzzle', 0, 0, 0, 26, 0, 0),
(10491, 897245, 'Advanced Firewall', 60, 606, 351, 4, 1, 0),
(10492, 897245, 'Competent FTP Exploit', 49, 358, 212, 13, 0, 0),
(10493, 897245, 'Amazing Hidder', 92, 1057, 629, 5, 0, 0),
(10494, 897245, 'Super DDoS', 100, 1090, 410, 10, 0, 0),
(10495, 897245, 'Amazing Cracker', 95, 1882, 1121, 1, 1, 0),
(10496, 897245, 'Big SSH Exploit', 66, 669, 391, 14, 0, 0),
(10497, 897245, 'Amazing Hasher', 90, 1548, 920, 2, 1, 0),
(10498, 897245, 'Super Seeker', 100, 1250, 550, 6, 0, 0),
(10499, 897246, 'puzzle', 0, 0, 0, 26, 0, 0),
(10500, 897246, 'Advanced Firewall', 55, 504, 290, 4, 1, 0),
(10501, 897246, 'Competent FTP Exploit', 47, 328, 194, 13, 0, 0),
(10502, 897246, 'Super Hidder', 100, 1250, 550, 5, 0, 0),
(10503, 897246, 'Amazing Cracker', 90, 1682, 1000, 1, 1, 0),
(10504, 897246, 'Super Anti-Virus', 100, 1330, 620, 7, 0, 0),
(10505, 897246, 'Big SSH Exploit', 70, 757, 444, 14, 0, 0),
(10506, 897246, 'Amazing Hasher', 85, 1374, 814, 2, 1, 0),
(10507, 897246, 'Big Seeker', 75, 690, 407, 6, 0, 0),
(10508, 897247, 'puzzle', 0, 0, 0, 26, 0, 0),
(10509, 897247, 'Advanced Firewall', 55, 504, 290, 4, 1, 0),
(10510, 897247, 'Competent FTP Exploit', 46, 313, 185, 13, 0, 0),
(10511, 897247, 'Big Hidder', 74, 671, 395, 5, 0, 0),
(10512, 897247, 'Super Collector', 100, 1170, 481, 11, 0, 0),
(10513, 897247, 'Super Spam', 100, 1010, 340, 8, 0, 0),
(10514, 897247, 'Amazing Cracker', 85, 1494, 885, 1, 1, 0),
(10515, 897247, 'Advanced SSH Exploit', 50, 374, 213, 14, 0, 0),
(10516, 897247, 'Amazing Hasher', 80, 1211, 715, 2, 1, 0),
(10517, 897247, 'Big Seeker', 72, 634, 372, 6, 0, 0),
(10518, 897248, 'puzzle', 0, 0, 0, 26, 0, 0),
(10519, 897248, 'Competent Firewall', 48, 379, 224, 4, 1, 0),
(10520, 897248, 'Intermediate FTP Exploit', 39, 222, 128, 13, 0, 0),
(10521, 897248, 'Big Hidder', 68, 563, 329, 5, 0, 0),
(10522, 897248, 'Big Cracker', 75, 1150, 677, 1, 1, 0),
(10523, 897248, 'Competent SSH Exploit', 42, 259, 151, 14, 0, 0),
(10524, 897248, 'Big Hasher', 71, 944, 554, 2, 1, 0),
(10525, 897248, 'Big Seeker', 70, 598, 350, 6, 0, 0),
(10526, 897248, 'Amazing Miner', 90, 1413, 840, 20, 0, 0),
(10527, 897249, 'puzzle', 0, 0, 0, 26, 0, 0),
(10528, 897249, 'Competent Firewall', 45, 331, 194, 4, 1, 0),
(10529, 897249, 'Competent FTP Exploit', 42, 259, 151, 13, 0, 0),
(10530, 897249, 'Big Cracker', 71, 1026, 602, 1, 1, 0),
(10531, 897249, 'Amazing Anti-Virus', 80, 843, 498, 7, 0, 0),
(10532, 897249, 'Advanced SSH Exploit', 50, 374, 213, 14, 0, 0),
(10533, 897249, 'Big Hasher', 68, 862, 504, 2, 1, 0),
(10534, 897249, 'Big Seeker', 70, 598, 350, 6, 0, 0),
(10535, 897250, 'puzzle', 0, 0, 0, 26, 0, 0),
(10536, 897250, 'Competent Firewall', 45, 331, 194, 4, 1, 0),
(10537, 897250, 'Competent FTP Exploit', 47, 328, 194, 13, 0, 0),
(10538, 897250, 'Big Hidder', 70, 598, 350, 5, 0, 0),
(10539, 897250, 'Big DDoS', 75, 598, 352, 10, 0, 0),
(10540, 897250, 'Big Cracker', 68, 937, 548, 1, 1, 0),
(10541, 897250, 'Competent SSH Exploit', 45, 299, 176, 14, 0, 0),
(10542, 897250, 'Big Breaker', 75, 644, 379, 12, 0, 0),
(10543, 897250, 'Advanced Hasher', 64, 759, 442, 2, 1, 0);*/

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

/*INSERT INTO `software_running` (`id`, `softID`, `userID`, `ramUsage`, `isNPC`) VALUES
(4803691, 13662031, 897198, 970, 1),
(4803692, 13662032, 897198, 1110, 1),
(4803693, 13662037, 897199, 33, 1),
(4803694, 13662039, 897199, 41, 1),
(4803695, 13662040, 897199, 30, 1),
(4803696, 13662047, 897200, 623, 1),
(4803697, 13662049, 897200, 778, 1),
(4803698, 13662050, 897200, 235, 1),
(4803699, 13662060, 897201, 257, 1),
(4803700, 13662062, 897201, 318, 1),
(4803701, 13662063, 897201, 118, 1),
(4803702, 13662070, 897202, 1110, 1),
(4803703, 13662072, 897202, 1350, 1),
(4803704, 13662073, 897202, 490, 1),
(4803705, 13662080, 897203, 3980, 1),
(4803706, 13662081, 897251, 30, 1),
(4803707, 13662082, 897251, 33, 1),
(4803708, 13662083, 897256, 8, 1),
(4803709, 13662084, 897256, 8, 1),
(4803710, 13662086, 897256, 9, 1),
(4803711, 13662093, 897253, 8, 1),
(4803712, 13662094, 897252, 235, 1),
(4803713, 13662095, 897252, 257, 1),
(4803714, 13662097, 897257, 970, 1),
(4803715, 13662098, 897257, 1110, 1),
(4803716, 13662099, 897258, 110, 1),
(4803717, 13662100, 897258, 257, 1),
(4803718, 13662101, 897259, 569, 1),
(4803719, 13662102, 897259, 1110, 1),
(4803720, 13662103, 897260, 51, 1),
(4803721, 13662104, 897260, 56, 1),
(4803722, 13662108, 897261, 16, 1),
(4803723, 13662109, 897261, 17, 1),
(4803724, 13662110, 897262, 149, 1),
(4803725, 13662111, 897262, 163, 1),
(4803726, 13662112, 897263, 51, 1),
(4803727, 13662113, 897263, 56, 1),
(4803728, 13662114, 897264, 653, 1),
(4803729, 13662115, 897264, 715, 1),
(4803730, 13662116, 897265, 351, 1),
(4803731, 13662117, 897265, 384, 1),
(4803732, 13662118, 897266, 32, 1),
(4803733, 13662119, 897266, 23, 1),
(4803734, 13662121, 897266, 21, 1),
(4803735, 13662122, 897267, 73, 1),
(4803736, 13662123, 897267, 33, 1),
(4803737, 13662124, 897267, 21, 1),
(4803738, 13662125, 897268, 61, 1),
(4803739, 13662126, 897268, 67, 1),
(4803740, 13662128, 897268, 38, 1),
(4803741, 13662130, 897269, 28, 1),
(4803742, 13662131, 897269, 23, 1),
(4803743, 13662133, 897269, 51, 1),
(4803744, 13662136, 897270, 25, 1),
(4803745, 13662137, 897270, 30, 1),
(4803746, 13662139, 897270, 21, 1),
(4803747, 13662142, 897271, 66, 1),
(4803748, 13662143, 897271, 30, 1),
(4803749, 13662144, 897271, 30, 1),
(4803750, 13662145, 897272, 25, 1),
(4803751, 13662146, 897272, 15, 1),
(4803752, 13662147, 897272, 12, 1),
(4803753, 13662151, 897273, 10, 1),
(4803754, 13662152, 897273, 11, 1),
(4803755, 13662154, 897273, 8, 1),
(4803756, 13662159, 897274, 14, 1),
(4803757, 13662160, 897274, 10, 1),
(4803758, 13662162, 897274, 10, 1),
(4803759, 13662166, 897275, 14, 1),
(4803760, 13662167, 897275, 23, 1),
(4803761, 13662169, 897275, 14, 1),
(4803762, 13662174, 897276, 16, 1),
(4803763, 13662175, 897276, 13, 1),
(4803764, 13662177, 897276, 21, 1),
(4803765, 13662183, 897277, 36, 1),
(4803766, 13662184, 897277, 42, 1),
(4803767, 13662186, 897277, 8, 1),
(4803768, 13662189, 897278, 45, 1),
(4803769, 13662190, 897278, 20, 1),
(4803770, 13662192, 897278, 27, 1),
(4803771, 13662196, 897279, 73, 1),
(4803772, 13662197, 897279, 73, 1),
(4803773, 13662198, 897279, 46, 1),
(4803774, 13662199, 897280, 50, 1),
(4803775, 13662200, 897280, 56, 1),
(4803776, 13662202, 897280, 30, 1),
(4803777, 13662205, 897281, 8, 1),
(4803778, 13662206, 897282, 131, 1),
(4803779, 13662207, 897282, 106, 1),
(4803780, 13662209, 897282, 66, 1),
(4803781, 13662211, 897283, 403, 1),
(4803782, 13662212, 897283, 182, 1),
(4803783, 13662214, 897283, 103, 1),
(4803784, 13662217, 897284, 178, 1),
(4803785, 13662218, 897284, 85, 1),
(4803786, 13662220, 897284, 125, 1),
(4803787, 13662224, 897285, 220, 1),
(4803788, 13662225, 897285, 146, 1),
(4803789, 13662227, 897285, 66, 1),
(4803790, 13662230, 897286, 158, 1),
(4803791, 13662231, 897286, 305, 1),
(4803792, 13662233, 897286, 149, 1),
(4803793, 13662234, 897287, 305, 1),
(4803794, 13662235, 897287, 330, 1),
(4803795, 13662236, 897287, 78, 1),
(4803796, 13662237, 897288, 359, 1),
(4803797, 13662238, 897288, 281, 1),
(4803798, 13662240, 897288, 118, 1),
(4803799, 13662246, 897289, 16, 1),
(4803800, 13662247, 897289, 13, 1),
(4803801, 13662249, 897289, 21, 1),
(4803802, 13662255, 897290, 178, 1),
(4803803, 13662256, 897290, 129, 1),
(4803804, 13662258, 897290, 338, 1),
(4803805, 13662260, 897291, 8, 1),
(4803806, 13662261, 897292, 8, 1),
(4803807, 13662262, 897293, 8, 1),
(4803808, 13662263, 897294, 8, 1),
(4803809, 13662264, 897295, 8, 1),
(4803810, 13662265, 897296, 8, 1),
(4803811, 13662266, 897297, 8, 1),
(4803812, 13662267, 897298, 8, 1),
(4803813, 13662268, 897299, 8, 1),
(4803814, 13662269, 897300, 8, 1),
(4803815, 13662271, 897204, 970, 1),
(4803816, 13662274, 897204, 2250, 1),
(4803817, 13662277, 897204, 1706, 1),
(4803818, 13662280, 897205, 1030, 1),
(4803819, 13662283, 897205, 2600, 1),
(4803820, 13662285, 897205, 1970, 1),
(4803821, 13662289, 897206, 90, 1),
(4803822, 13662292, 897206, 220, 1),
(4803823, 13662294, 897206, 182, 1),
(4803824, 13662298, 897207, 103, 1),
(4803825, 13662302, 897207, 243, 1),
(4803826, 13662304, 897207, 202, 1),
(4803827, 13662307, 897208, 103, 1),
(4803828, 13662310, 897208, 267, 1),
(4803829, 13662313, 897208, 223, 1),
(4803830, 13662316, 897209, 118, 1),
(4803831, 13662320, 897209, 280, 1),
(4803832, 13662322, 897209, 245, 1),
(4803833, 13662325, 897210, 66, 1),
(4803834, 13662329, 897210, 140, 1),
(4803835, 13662332, 897210, 113, 1),
(4803836, 13662335, 897211, 78, 1),
(4803837, 13662338, 897211, 158, 1),
(4803838, 13662341, 897211, 129, 1),
(4803839, 13662344, 897212, 78, 1),
(4803840, 13662349, 897212, 178, 1),
(4803841, 13662351, 897212, 146, 1),
(4803842, 13662354, 897213, 90, 1),
(4803843, 13662358, 897213, 198, 1),
(4803844, 13662360, 897213, 163, 1),
(4803845, 13662363, 897214, 1462, 1),
(4803846, 13662367, 897214, 3950, 1),
(4803847, 13662370, 897214, 3038, 1),
(4803848, 13662373, 897215, 1690, 1),
(4803849, 13662376, 897215, 4500, 1),
(4803850, 13662378, 897215, 3487, 1),
(4803851, 13662381, 897216, 1132, 1),
(4803852, 13662384, 897216, 3000, 1),
(4803853, 13662387, 897216, 2280, 1),
(4803854, 13662390, 897217, 1276, 1),
(4803855, 13662395, 897217, 3450, 1),
(4803856, 13662397, 897217, 2636, 1),
(4803857, 13662400, 897218, 141, 1),
(4803858, 13662403, 897218, 359, 1),
(4803859, 13662406, 897218, 293, 1),
(4803860, 13662408, 897219, 141, 1),
(4803861, 13662411, 897219, 403, 1),
(4803862, 13662414, 897219, 330, 1),
(4803863, 13662417, 897220, 840, 1),
(4803864, 13662421, 897220, 1700, 1),
(4803865, 13662422, 897220, 1316, 1),
(4803866, 13662425, 897221, 840, 1),
(4803867, 13662429, 897221, 1950, 1),
(4803868, 13662431, 897221, 1489, 1),
(4803869, 13662434, 897222, 8, 1),
(4803870, 13662437, 897222, 10, 1),
(4803871, 13662438, 897222, 8, 1),
(4803872, 13662440, 897223, 10, 1),
(4803873, 13662444, 897223, 14, 1),
(4803874, 13662447, 897223, 11, 1),
(4803875, 13662450, 897224, 8, 1),
(4803876, 13662453, 897224, 12, 1),
(4803877, 13662455, 897224, 10, 1),
(4803878, 13662458, 897225, 14, 1),
(4803879, 13662463, 897225, 19, 1),
(4803880, 13662465, 897225, 15, 1),
(4803881, 13662468, 897226, 10, 1),
(4803882, 13662470, 897226, 16, 1),
(4803883, 13662472, 897226, 13, 1),
(4803884, 13662476, 897227, 18, 1),
(4803885, 13662479, 897227, 25, 1),
(4803886, 13662482, 897227, 20, 1),
(4803887, 13662485, 897228, 14, 1),
(4803888, 13662488, 897228, 22, 1),
(4803889, 13662491, 897228, 17, 1),
(4803890, 13662494, 897229, 24, 1),
(4803891, 13662498, 897229, 32, 1),
(4803892, 13662501, 897229, 26, 1),
(4803893, 13662504, 897230, 18, 1),
(4803894, 13662509, 897230, 28, 1),
(4803895, 13662511, 897230, 23, 1),
(4803896, 13662514, 897231, 653, 1),
(4803897, 13662517, 897231, 1500, 1),
(4803898, 13662520, 897231, 1190, 1),
(4803899, 13662523, 897232, 351, 1),
(4803900, 13662527, 897232, 1250, 1),
(4803901, 13662530, 897232, 1031, 1),
(4803902, 13662533, 897233, 30, 1),
(4803903, 13662537, 897233, 45, 1),
(4803904, 13662539, 897233, 37, 1),
(4803905, 13662541, 897234, 24, 1),
(4803906, 13662545, 897234, 36, 1),
(4803907, 13662547, 897234, 30, 1),
(4803908, 13662550, 897235, 38, 1),
(4803909, 13662553, 897235, 55, 1),
(4803910, 13662555, 897235, 46, 1),
(4803911, 13662558, 897236, 30, 1),
(4803912, 13662560, 897236, 50, 1),
(4803913, 13662563, 897236, 42, 1),
(4803914, 13662565, 897237, 46, 1),
(4803915, 13662569, 897237, 73, 1),
(4803916, 13662570, 897237, 56, 1),
(4803917, 13662574, 897238, 38, 1),
(4803918, 13662578, 897238, 61, 1),
(4803919, 13662580, 897238, 51, 1),
(4803920, 13662583, 897239, 56, 1),
(4803921, 13662587, 897239, 92, 1),
(4803922, 13662589, 897239, 79, 1),
(4803923, 13662592, 897240, 46, 1),
(4803924, 13662596, 897240, 86, 1),
(4803925, 13662599, 897240, 67, 1),
(4803926, 13662602, 897241, 66, 1),
(4803927, 13662606, 897241, 123, 1),
(4803928, 13662609, 897241, 99, 1),
(4803929, 13662612, 897242, 56, 1),
(4803930, 13662615, 897242, 107, 1),
(4803931, 13662617, 897242, 85, 1),
(4803932, 13662619, 897243, 167, 1),
(4803933, 13662622, 897243, 481, 1),
(4803934, 13662624, 897243, 413, 1),
(4803935, 13662627, 897244, 167, 1),
(4803936, 13662631, 897244, 449, 1),
(4803937, 13662633, 897244, 370, 1),
(4803938, 13662636, 897245, 351, 1),
(4803939, 13662640, 897245, 1121, 1),
(4803940, 13662642, 897245, 920, 1),
(4803941, 13662645, 897246, 290, 1),
(4803942, 13662648, 897246, 1000, 1),
(4803943, 13662651, 897246, 814, 1),
(4803944, 13662654, 897247, 290, 1),
(4803945, 13662659, 897247, 885, 1),
(4803946, 13662661, 897247, 715, 1),
(4803947, 13662664, 897248, 224, 1),
(4803948, 13662667, 897248, 677, 1),
(4803949, 13662669, 897248, 554, 1),
(4803950, 13662673, 897249, 194, 1),
(4803951, 13662675, 897249, 602, 1),
(4803952, 13662678, 897249, 504, 1),
(4803953, 13662681, 897250, 194, 1),
(4803954, 13662685, 897250, 548, 1),
(4803955, 13662688, 897250, 442, 1);*/

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

/*INSERT INTO `stats_login` (`id`, `userID`, `loginTime`) VALUES
(4585265, 750714, '2019-11-17 13:56:57'),
(4585266, 750714, '2019-11-17 15:36:32'),
(4585267, 750714, '2019-11-17 15:37:41'),
(4585268, 750714, '2019-11-17 15:47:13'),
(4585269, 750714, '2019-11-17 15:47:14');*/

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

/*INSERT INTO `stats_register` (`userID`, `registrationDate`, `ip`) VALUES
(750714, '2019-11-17 13:55:43', '192.168.56.1'),
(750715, '2019-11-17 16:10:54', '192.168.56.1');*/

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

/*INSERT INTO `users` (`id`, `login`, `password`, `email`, `gamePass`, `gameIP`, `realIP`, `homeIP`, `learning`, `premium`, `lastLogin`) VALUES
(750709, 'B1N4R1', '$2a$13$8tvbh.hGtvcfGIvVrRn6I.jg3RZ.6gqJYplk6fHgbmPExq/38GS0a', 'gorkfern07@gmail.com', '446161', 3617707510, 0, 0, 0, 0, '2019-11-17 13:26:12'),
(750710, 'attempt', '$2a$13$tOViRiJnYW0Qibn1S92rLOO2YBDOnWwBIbzmLiq9BQttzg/bWWs7y', 'attempt@mail.com', '9G76CV', 3048432961, 0, 0, 0, 0, '2019-11-17 13:32:40'),
(750711, 'attempt2', '$2a$13$EsJsui9SansSXLUsUjcJReRQAM49U13iImrhRPkvk861tYhJkFxkC', 'attempt2@mail.com', '3QG4J0', 3119265019, 0, 0, 0, 0, '2019-11-17 13:40:42'),
(750712, 'attemptu', '$2a$13$J75ya8ezH2.KoA0X2BiX/ueeCtWDKtT3vXdPgQd4lDCNU.eRVgQtO', 'attemptu@mail.com', 'VC9L86', 3388462243, 0, 0, 0, 0, '2019-11-17 13:44:05'),
(750713, 'attempt3', '$2a$13$EO7E.Dw3YRt5ragjY2fbx.srHFljbikmGFJAel4oMEL7Uh0WILkB.', 'attempt3@mail.com', 'E37J3Y', 2735308142, 0, 0, 0, 0, '2019-11-17 13:51:19'),
(750714, 'attempt4', '$2a$13$HBhaYbPuz8LWwVPTx07/G.vq6vcA8mmYBe2Q.w78g9Fu/NieYBpJO', 'attempt4@mail.com', 'M97MC8', 2841410039, 0, 0, 0, 0, '2019-11-17 15:47:14'),
(750715, 'attempt5', '$2a$13$fUdUrnZJtn4x0qSNzKD9a.oCQxvqAfc7KsPajgCgbXLlVKF/UOaQS', 'attempt5@mail.com', '689WP8', 2229581367, 0, 0, 0, 0, '2019-11-17 16:10:54');*/

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

/*INSERT INTO `users_language` (`userID`, `lang`) VALUES
(750709, 'en'),
(750710, 'en'),
(750711, 'en'),
(750712, 'en'),
(750713, 'en'),
(750714, 'en'),
(750715, 'en');*/

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

/*INSERT INTO `users_learning` (`userID`, `learning`) VALUES
(750709, 1),
(750710, 1),
(750711, 1),
(750712, 1),
(750713, 1),
(750714, 1),
(750715, 1);*/

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_online`
--

CREATE TABLE `users_online` (
  `id` int(5) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `token` varchar(200) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

/*INSERT INTO `users_puzzle` (`userID`, `puzzleID`) VALUES
(750709, 0),
(750710, 0),
(750711, 0),
(750712, 0),
(750713, 0),
(750714, 0),
(750715, 0);*/

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

/*INSERT INTO `users_stats` (`uid`, `dateJoined`, `exp`, `certifications`, `awards`, `timePlaying`, `missionCount`, `hackCount`, `ddosCount`, `warezSent`, `spamSent`, `bitcoinSent`, `ipResets`, `lastIpReset`, `pwdResets`, `lastPwdReset`, `moneyEarned`, `moneyTransfered`, `moneyHardware`, `moneyResearch`, `profileViews`) VALUES
(750709, '2019-11-17 14:26:12', 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '2019-11-17 13:26:12', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 0),
(750710, '2019-11-17 14:32:40', 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '2019-11-17 13:32:40', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 0),
(750711, '2019-11-17 14:40:42', 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '2019-11-17 13:40:42', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 0),
(750712, '2019-11-17 14:44:05', 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '2019-11-17 13:44:05', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 0),
(750713, '2019-11-17 14:51:19', 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '2019-11-17 13:51:19', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 0),
(750714, '2019-11-17 14:55:43', 1, '', '', 15.5, 0, 0, 0, 0, 0, 0, 0, '2019-11-17 13:55:43', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 0),
(750715, '2019-11-17 17:10:54', 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '2019-11-17 16:10:54', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 0);*/

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
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12716006;

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
  MODIFY `serverID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6594108;

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
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=750484;

--
-- AUTO_INCREMENT de la tabla `internet_important`
--
ALTER TABLE `internet_important`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=970151;

--
-- AUTO_INCREMENT de la tabla `lists`
--
ALTER TABLE `lists`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4620175;

--
-- AUTO_INCREMENT de la tabla `lists_bankAccounts`
--
ALTER TABLE `lists_bankAccounts`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1511488;

--
-- AUTO_INCREMENT de la tabla `log`
--
ALTER TABLE `log`
  MODIFY `userID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=897301;

--
-- AUTO_INCREMENT de la tabla `log_edit`
--
ALTER TABLE `log_edit`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13490282;

--
-- AUTO_INCREMENT de la tabla `mails`
--
ALTER TABLE `mails`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4016487;

--
-- AUTO_INCREMENT de la tabla `missions`
--
ALTER TABLE `missions`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13887278;

--
-- AUTO_INCREMENT de la tabla `missions_history`
--
ALTER TABLE `missions_history`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13887173;

--
-- AUTO_INCREMENT de la tabla `news`
--
ALTER TABLE `news`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35359;

--
-- AUTO_INCREMENT de la tabla `news_history`
--
ALTER TABLE `news_history`
  MODIFY `newsID` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35359;

--
-- AUTO_INCREMENT de la tabla `npc`
--
ALTER TABLE `npc`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=897301;

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
  MODIFY `pid` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48831552;

--
-- AUTO_INCREMENT de la tabla `round`
--
ALTER TABLE `round`
  MODIFY `id` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `round_ddos`
--
ALTER TABLE `round_ddos`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=290530;

--
-- AUTO_INCREMENT de la tabla `software`
--
ALTER TABLE `software`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13662689;

--
-- AUTO_INCREMENT de la tabla `software_original`
--
ALTER TABLE `software_original`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10544;

--
-- AUTO_INCREMENT de la tabla `software_research`
--
ALTER TABLE `software_research`
  MODIFY `id` int(30) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=767171;

--
-- AUTO_INCREMENT de la tabla `software_running`
--
ALTER TABLE `software_running`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4803956;

--
-- AUTO_INCREMENT de la tabla `stats_login`
--
ALTER TABLE `stats_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4585270;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=750716;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
