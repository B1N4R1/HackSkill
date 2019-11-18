-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 17-11-2019 a las 14:25:34
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
  `info1` varchar(15) NOT NULL,
  `info2` varchar(15) NOT NULL
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npc_info_pt`
--

CREATE TABLE `npc_info_pt` (
  `npcID` int(5) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `web` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npc_key`
--

CREATE TABLE `npc_key` (
  `npcID` int(5) UNSIGNED NOT NULL,
  `key` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npc_reset`
--

CREATE TABLE `npc_reset` (
  `npcID` int(5) NOT NULL,
  `nextScan` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `totalUsers` int(6) NOT NULL,
  `activeUsers` int(5) NOT NULL,
  `warezSent` double NOT NULL,
  `spamSent` bigint(15) NOT NULL,
  `bitcoinSent` double UNSIGNED NOT NULL,
  `mailSent` int(6) NOT NULL,
  `ddosCount` int(6) NOT NULL,
  `hackCount` int(5) NOT NULL,
  `clans` int(4) NOT NULL,
  `timePlaying` bigint(15) NOT NULL,
  `totalListed` int(6) NOT NULL,
  `totalVirus` int(5) NOT NULL,
  `totalMoney` bigint(20) NOT NULL,
  `researchCount` int(5) NOT NULL,
  `moneyResearch` int(20) UNSIGNED NOT NULL,
  `moneyHardware` int(20) UNSIGNED NOT NULL,
  `moneyEarned` int(20) UNSIGNED NOT NULL,
  `moneyTransfered` int(20) UNSIGNED NOT NULL,
  `usersClicks` int(10) UNSIGNED NOT NULL,
  `missionCount` int(10) UNSIGNED NOT NULL,
  `totalConnections` int(10) UNSIGNED NOT NULL,
  `totalTasks` int(10) UNSIGNED NOT NULL,
  `totalSoftware` int(10) UNSIGNED NOT NULL,
  `totalRunning` int(10) UNSIGNED NOT NULL,
  `totalServers` int(10) UNSIGNED NOT NULL,
  `clansWar` int(10) UNSIGNED NOT NULL,
  `clansMembers` int(5) UNSIGNED NOT NULL,
  `clansClicks` int(10) UNSIGNED NOT NULL,
  `onlineUsers` int(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stats_register`
--

CREATE TABLE `stats_register` (
  `userID` int(5) UNSIGNED NOT NULL,
  `registrationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_learning`
--

CREATE TABLE `users_learning` (
  `userID` int(5) UNSIGNED NOT NULL,
  `learning` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12716004;

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
  MODIFY `serverID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6593998;

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
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=750477;

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
  MODIFY `userID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=897198;

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
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=897198;

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
  MODIFY `id` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `round_ddos`
--
ALTER TABLE `round_ddos`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=290530;

--
-- AUTO_INCREMENT de la tabla `software`
--
ALTER TABLE `software`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13662031;

--
-- AUTO_INCREMENT de la tabla `software_original`
--
ALTER TABLE `software_original`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9886;

--
-- AUTO_INCREMENT de la tabla `software_research`
--
ALTER TABLE `software_research`
  MODIFY `id` int(30) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=767171;

--
-- AUTO_INCREMENT de la tabla `software_running`
--
ALTER TABLE `software_running`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4803691;

--
-- AUTO_INCREMENT de la tabla `stats_login`
--
ALTER TABLE `stats_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4585265;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=750709;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
