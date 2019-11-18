-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 17-11-2019 a las 18:05:10
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
