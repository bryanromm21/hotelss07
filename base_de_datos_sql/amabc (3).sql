-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-05-2024 a las 20:11:33
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `amabc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date_activities` datetime NOT NULL,
  `end_activities` datetime NOT NULL,
  `specials_areas_id` bigint(20) UNSIGNED DEFAULT NULL,
  `descriptions_id` bigint(20) UNSIGNED NOT NULL,
  `progress` enum('inicio','proceso','finalizado') NOT NULL,
  `personals_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rooms_id` bigint(20) UNSIGNED DEFAULT NULL,
  `equips_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `activities`
--

INSERT INTO `activities` (`id`, `date_activities`, `end_activities`, `specials_areas_id`, `descriptions_id`, `progress`, `personals_id`, `created_at`, `updated_at`, `rooms_id`, `equips_id`) VALUES
(1, '2024-05-04 10:40:04', '2024-05-05 10:40:06', 1, 1, 'inicio', NULL, '2024-05-27 22:42:03', '2024-05-27 22:42:03', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activityreports`
--

CREATE TABLE `activityreports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `departaments_id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `progress` enum('en proceso','finalizado') NOT NULL,
  `departure date` date NOT NULL,
  `entry time` time NOT NULL,
  `departure time` time NOT NULL,
  `personals_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rooms_id` bigint(20) UNSIGNED DEFAULT NULL,
  `specials_areas_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lost_reports_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `activityreports`
--

INSERT INTO `activityreports` (`id`, `departaments_id`, `descripcion`, `observaciones`, `progress`, `departure date`, `entry time`, `departure time`, `personals_id`, `created_at`, `updated_at`, `rooms_id`, `specials_areas_id`, `lost_reports_id`) VALUES
(1, 1, '<p>acksklnsn</p>', NULL, 'en proceso', '2024-05-21', '12:01:02', '13:01:06', 1, '2024-05-28 00:01:26', '2024-05-28 00:01:26', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `breakdowns`
--

CREATE TABLE `breakdowns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `date_breakdowns` datetime NOT NULL,
  `state` varchar(255) NOT NULL,
  `priority` enum('Alta','Media','Baja') NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `personals_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rooms_id` bigint(20) UNSIGNED DEFAULT NULL,
  `departaments_id` bigint(20) UNSIGNED NOT NULL,
  `specials_areas_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `breakdowns`
--

INSERT INTO `breakdowns` (`id`, `description`, `date_breakdowns`, `state`, `priority`, `photo`, `personals_id`, `created_at`, `updated_at`, `rooms_id`, `departaments_id`, `specials_areas_id`) VALUES
(1, 'wfwfw', '2024-05-23 12:02:30', '[\"Limpio\"]', 'Alta', NULL, 1, '2024-05-28 00:03:55', '2024-05-28 00:03:55', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('a17961fa74e9275d529f489537f179c05d50c2f3', 'i:2;', 1716826566),
('a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1716826566;', 1716826566),
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:247:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:13:\"view_activity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:17:\"view_any_activity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:15:\"create_activity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:15:\"update_activity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:16:\"restore_activity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:20:\"restore_any_activity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:18:\"replicate_activity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:16:\"reorder_activity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:15:\"delete_activity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:19:\"delete_any_activity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:21:\"force_delete_activity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:25:\"force_delete_any_activity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:20:\"view_activityreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:24:\"view_any_activityreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:22:\"create_activityreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:22:\"update_activityreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:23:\"restore_activityreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:27:\"restore_any_activityreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:25:\"replicate_activityreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:23:\"reorder_activityreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:22:\"delete_activityreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:26:\"delete_any_activityreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:28:\"force_delete_activityreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:32:\"force_delete_any_activityreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:15:\"view_breakdowns\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:19:\"view_any_breakdowns\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:17:\"create_breakdowns\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:17:\"update_breakdowns\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:18:\"restore_breakdowns\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:22:\"restore_any_breakdowns\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:20:\"replicate_breakdowns\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:18:\"reorder_breakdowns\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:17:\"delete_breakdowns\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:21:\"delete_any_breakdowns\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:23:\"force_delete_breakdowns\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:27:\"force_delete_any_breakdowns\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:13:\"view_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:17:\"view_any_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:15:\"create_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:15:\"update_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:16:\"restore_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:20:\"restore_any_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:18:\"replicate_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:16:\"reorder_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:15:\"delete_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:19:\"delete_any_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:21:\"force_delete_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:25:\"force_delete_any_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:17:\"view_departaments\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:21:\"view_any_departaments\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:19:\"create_departaments\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:19:\"update_departaments\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:20:\"restore_departaments\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:24:\"restore_any_departaments\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:22:\"replicate_departaments\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:20:\"reorder_departaments\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:19:\"delete_departaments\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:23:\"delete_any_departaments\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:25:\"force_delete_departaments\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:29:\"force_delete_any_departaments\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:16:\"view_description\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:20:\"view_any_description\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:62;a:4:{s:1:\"a\";i:63;s:1:\"b\";s:18:\"create_description\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:63;a:4:{s:1:\"a\";i:64;s:1:\"b\";s:18:\"update_description\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:64;a:4:{s:1:\"a\";i:65;s:1:\"b\";s:19:\"restore_description\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:65;a:4:{s:1:\"a\";i:66;s:1:\"b\";s:23:\"restore_any_description\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:66;a:4:{s:1:\"a\";i:67;s:1:\"b\";s:21:\"replicate_description\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:67;a:4:{s:1:\"a\";i:68;s:1:\"b\";s:19:\"reorder_description\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:68;a:4:{s:1:\"a\";i:69;s:1:\"b\";s:18:\"delete_description\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:69;a:4:{s:1:\"a\";i:70;s:1:\"b\";s:22:\"delete_any_description\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:70;a:4:{s:1:\"a\";i:71;s:1:\"b\";s:24:\"force_delete_description\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:71;a:4:{s:1:\"a\";i:72;s:1:\"b\";s:28:\"force_delete_any_description\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:72;a:4:{s:1:\"a\";i:73;s:1:\"b\";s:10:\"view_equip\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:73;a:4:{s:1:\"a\";i:74;s:1:\"b\";s:14:\"view_any_equip\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:74;a:4:{s:1:\"a\";i:75;s:1:\"b\";s:12:\"create_equip\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:75;a:4:{s:1:\"a\";i:76;s:1:\"b\";s:12:\"update_equip\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:76;a:4:{s:1:\"a\";i:77;s:1:\"b\";s:13:\"restore_equip\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:77;a:4:{s:1:\"a\";i:78;s:1:\"b\";s:17:\"restore_any_equip\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:78;a:4:{s:1:\"a\";i:79;s:1:\"b\";s:15:\"replicate_equip\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:79;a:4:{s:1:\"a\";i:80;s:1:\"b\";s:13:\"reorder_equip\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:80;a:4:{s:1:\"a\";i:81;s:1:\"b\";s:12:\"delete_equip\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:81;a:4:{s:1:\"a\";i:82;s:1:\"b\";s:16:\"delete_any_equip\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:82;a:4:{s:1:\"a\";i:83;s:1:\"b\";s:18:\"force_delete_equip\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:83;a:4:{s:1:\"a\";i:84;s:1:\"b\";s:22:\"force_delete_any_equip\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:84;a:4:{s:1:\"a\";i:85;s:1:\"b\";s:17:\"view_faultreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:85;a:4:{s:1:\"a\";i:86;s:1:\"b\";s:21:\"view_any_faultreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:86;a:4:{s:1:\"a\";i:87;s:1:\"b\";s:19:\"create_faultreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:87;a:4:{s:1:\"a\";i:88;s:1:\"b\";s:19:\"update_faultreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:88;a:4:{s:1:\"a\";i:89;s:1:\"b\";s:20:\"restore_faultreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:89;a:4:{s:1:\"a\";i:90;s:1:\"b\";s:24:\"restore_any_faultreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:90;a:4:{s:1:\"a\";i:91;s:1:\"b\";s:22:\"replicate_faultreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:91;a:4:{s:1:\"a\";i:92;s:1:\"b\";s:20:\"reorder_faultreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:92;a:4:{s:1:\"a\";i:93;s:1:\"b\";s:19:\"delete_faultreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:93;a:4:{s:1:\"a\";i:94;s:1:\"b\";s:23:\"delete_any_faultreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:94;a:4:{s:1:\"a\";i:95;s:1:\"b\";s:25:\"force_delete_faultreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:95;a:4:{s:1:\"a\";i:96;s:1:\"b\";s:29:\"force_delete_any_faultreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:96;a:4:{s:1:\"a\";i:97;s:1:\"b\";s:9:\"view_lost\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:97;a:4:{s:1:\"a\";i:98;s:1:\"b\";s:13:\"view_any_lost\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:98;a:4:{s:1:\"a\";i:99;s:1:\"b\";s:11:\"create_lost\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:99;a:4:{s:1:\"a\";i:100;s:1:\"b\";s:11:\"update_lost\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:100;a:4:{s:1:\"a\";i:101;s:1:\"b\";s:12:\"restore_lost\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:101;a:4:{s:1:\"a\";i:102;s:1:\"b\";s:16:\"restore_any_lost\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:102;a:4:{s:1:\"a\";i:103;s:1:\"b\";s:14:\"replicate_lost\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:103;a:4:{s:1:\"a\";i:104;s:1:\"b\";s:12:\"reorder_lost\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:104;a:4:{s:1:\"a\";i:105;s:1:\"b\";s:11:\"delete_lost\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:105;a:4:{s:1:\"a\";i:106;s:1:\"b\";s:15:\"delete_any_lost\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:106;a:4:{s:1:\"a\";i:107;s:1:\"b\";s:17:\"force_delete_lost\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:107;a:4:{s:1:\"a\";i:108;s:1:\"b\";s:21:\"force_delete_any_lost\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:108;a:4:{s:1:\"a\";i:109;s:1:\"b\";s:18:\"view_lost::reports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:109;a:4:{s:1:\"a\";i:110;s:1:\"b\";s:22:\"view_any_lost::reports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:110;a:4:{s:1:\"a\";i:111;s:1:\"b\";s:20:\"create_lost::reports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:111;a:4:{s:1:\"a\";i:112;s:1:\"b\";s:20:\"update_lost::reports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:112;a:4:{s:1:\"a\";i:113;s:1:\"b\";s:21:\"restore_lost::reports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:113;a:4:{s:1:\"a\";i:114;s:1:\"b\";s:25:\"restore_any_lost::reports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:114;a:4:{s:1:\"a\";i:115;s:1:\"b\";s:23:\"replicate_lost::reports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:115;a:4:{s:1:\"a\";i:116;s:1:\"b\";s:21:\"reorder_lost::reports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:116;a:4:{s:1:\"a\";i:117;s:1:\"b\";s:20:\"delete_lost::reports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:117;a:4:{s:1:\"a\";i:118;s:1:\"b\";s:24:\"delete_any_lost::reports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:118;a:4:{s:1:\"a\";i:119;s:1:\"b\";s:26:\"force_delete_lost::reports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:119;a:4:{s:1:\"a\";i:120;s:1:\"b\";s:30:\"force_delete_any_lost::reports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:120;a:4:{s:1:\"a\";i:121;s:1:\"b\";s:17:\"view_orderreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:121;a:4:{s:1:\"a\";i:122;s:1:\"b\";s:21:\"view_any_orderreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:122;a:4:{s:1:\"a\";i:123;s:1:\"b\";s:19:\"create_orderreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:123;a:4:{s:1:\"a\";i:124;s:1:\"b\";s:19:\"update_orderreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:124;a:4:{s:1:\"a\";i:125;s:1:\"b\";s:20:\"restore_orderreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:125;a:4:{s:1:\"a\";i:126;s:1:\"b\";s:24:\"restore_any_orderreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:126;a:4:{s:1:\"a\";i:127;s:1:\"b\";s:22:\"replicate_orderreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:127;a:4:{s:1:\"a\";i:128;s:1:\"b\";s:20:\"reorder_orderreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:128;a:4:{s:1:\"a\";i:129;s:1:\"b\";s:19:\"delete_orderreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:129;a:4:{s:1:\"a\";i:130;s:1:\"b\";s:23:\"delete_any_orderreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:130;a:4:{s:1:\"a\";i:131;s:1:\"b\";s:25:\"force_delete_orderreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:131;a:4:{s:1:\"a\";i:132;s:1:\"b\";s:29:\"force_delete_any_orderreports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:132;a:4:{s:1:\"a\";i:133;s:1:\"b\";s:11:\"view_orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:133;a:4:{s:1:\"a\";i:134;s:1:\"b\";s:15:\"view_any_orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:134;a:4:{s:1:\"a\";i:135;s:1:\"b\";s:13:\"create_orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:135;a:4:{s:1:\"a\";i:136;s:1:\"b\";s:13:\"update_orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:136;a:4:{s:1:\"a\";i:137;s:1:\"b\";s:14:\"restore_orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:137;a:4:{s:1:\"a\";i:138;s:1:\"b\";s:18:\"restore_any_orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:138;a:4:{s:1:\"a\";i:139;s:1:\"b\";s:16:\"replicate_orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:139;a:4:{s:1:\"a\";i:140;s:1:\"b\";s:14:\"reorder_orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:140;a:4:{s:1:\"a\";i:141;s:1:\"b\";s:13:\"delete_orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:141;a:4:{s:1:\"a\";i:142;s:1:\"b\";s:17:\"delete_any_orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:142;a:4:{s:1:\"a\";i:143;s:1:\"b\";s:19:\"force_delete_orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:143;a:4:{s:1:\"a\";i:144;s:1:\"b\";s:23:\"force_delete_any_orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:144;a:4:{s:1:\"a\";i:145;s:1:\"b\";s:13:\"view_personal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:145;a:4:{s:1:\"a\";i:146;s:1:\"b\";s:17:\"view_any_personal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:146;a:4:{s:1:\"a\";i:147;s:1:\"b\";s:15:\"create_personal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:147;a:4:{s:1:\"a\";i:148;s:1:\"b\";s:15:\"update_personal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:148;a:4:{s:1:\"a\";i:149;s:1:\"b\";s:16:\"restore_personal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:149;a:4:{s:1:\"a\";i:150;s:1:\"b\";s:20:\"restore_any_personal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:150;a:4:{s:1:\"a\";i:151;s:1:\"b\";s:18:\"replicate_personal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:151;a:4:{s:1:\"a\";i:152;s:1:\"b\";s:16:\"reorder_personal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:152;a:4:{s:1:\"a\";i:153;s:1:\"b\";s:15:\"delete_personal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:153;a:4:{s:1:\"a\";i:154;s:1:\"b\";s:19:\"delete_any_personal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:154;a:4:{s:1:\"a\";i:155;s:1:\"b\";s:21:\"force_delete_personal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:155;a:4:{s:1:\"a\";i:156;s:1:\"b\";s:25:\"force_delete_any_personal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:156;a:4:{s:1:\"a\";i:157;s:1:\"b\";s:13:\"view_position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:157;a:4:{s:1:\"a\";i:158;s:1:\"b\";s:17:\"view_any_position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:158;a:4:{s:1:\"a\";i:159;s:1:\"b\";s:15:\"create_position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:159;a:4:{s:1:\"a\";i:160;s:1:\"b\";s:15:\"update_position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:160;a:4:{s:1:\"a\";i:161;s:1:\"b\";s:16:\"restore_position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:161;a:4:{s:1:\"a\";i:162;s:1:\"b\";s:20:\"restore_any_position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:162;a:4:{s:1:\"a\";i:163;s:1:\"b\";s:18:\"replicate_position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:163;a:4:{s:1:\"a\";i:164;s:1:\"b\";s:16:\"reorder_position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:164;a:4:{s:1:\"a\";i:165;s:1:\"b\";s:15:\"delete_position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:165;a:4:{s:1:\"a\";i:166;s:1:\"b\";s:19:\"delete_any_position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:166;a:4:{s:1:\"a\";i:167;s:1:\"b\";s:21:\"force_delete_position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:167;a:4:{s:1:\"a\";i:168;s:1:\"b\";s:25:\"force_delete_any_position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:168;a:4:{s:1:\"a\";i:169;s:1:\"b\";s:13:\"view_products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:169;a:4:{s:1:\"a\";i:170;s:1:\"b\";s:17:\"view_any_products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:170;a:4:{s:1:\"a\";i:171;s:1:\"b\";s:15:\"create_products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:171;a:4:{s:1:\"a\";i:172;s:1:\"b\";s:15:\"update_products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:172;a:4:{s:1:\"a\";i:173;s:1:\"b\";s:16:\"restore_products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:173;a:4:{s:1:\"a\";i:174;s:1:\"b\";s:20:\"restore_any_products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:174;a:4:{s:1:\"a\";i:175;s:1:\"b\";s:18:\"replicate_products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:175;a:4:{s:1:\"a\";i:176;s:1:\"b\";s:16:\"reorder_products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:176;a:4:{s:1:\"a\";i:177;s:1:\"b\";s:15:\"delete_products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:177;a:4:{s:1:\"a\";i:178;s:1:\"b\";s:19:\"delete_any_products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:178;a:4:{s:1:\"a\";i:179;s:1:\"b\";s:21:\"force_delete_products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:179;a:4:{s:1:\"a\";i:180;s:1:\"b\";s:25:\"force_delete_any_products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:180;a:4:{s:1:\"a\";i:181;s:1:\"b\";s:13:\"view_progress\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:181;a:4:{s:1:\"a\";i:182;s:1:\"b\";s:17:\"view_any_progress\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:182;a:4:{s:1:\"a\";i:183;s:1:\"b\";s:15:\"create_progress\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:183;a:4:{s:1:\"a\";i:184;s:1:\"b\";s:15:\"update_progress\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:184;a:4:{s:1:\"a\";i:185;s:1:\"b\";s:16:\"restore_progress\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:185;a:4:{s:1:\"a\";i:186;s:1:\"b\";s:20:\"restore_any_progress\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:186;a:4:{s:1:\"a\";i:187;s:1:\"b\";s:18:\"replicate_progress\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:187;a:4:{s:1:\"a\";i:188;s:1:\"b\";s:16:\"reorder_progress\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:188;a:4:{s:1:\"a\";i:189;s:1:\"b\";s:15:\"delete_progress\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:189;a:4:{s:1:\"a\";i:190;s:1:\"b\";s:19:\"delete_any_progress\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:190;a:4:{s:1:\"a\";i:191;s:1:\"b\";s:21:\"force_delete_progress\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:191;a:4:{s:1:\"a\";i:192;s:1:\"b\";s:25:\"force_delete_any_progress\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:192;a:4:{s:1:\"a\";i:193;s:1:\"b\";s:9:\"view_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:193;a:4:{s:1:\"a\";i:194;s:1:\"b\";s:13:\"view_any_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:194;a:4:{s:1:\"a\";i:195;s:1:\"b\";s:11:\"create_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:195;a:4:{s:1:\"a\";i:196;s:1:\"b\";s:11:\"update_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:196;a:4:{s:1:\"a\";i:197;s:1:\"b\";s:11:\"delete_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:197;a:4:{s:1:\"a\";i:198;s:1:\"b\";s:15:\"delete_any_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:198;a:4:{s:1:\"a\";i:199;s:1:\"b\";s:9:\"view_room\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:199;a:4:{s:1:\"a\";i:200;s:1:\"b\";s:13:\"view_any_room\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:200;a:4:{s:1:\"a\";i:201;s:1:\"b\";s:11:\"create_room\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:201;a:4:{s:1:\"a\";i:202;s:1:\"b\";s:11:\"update_room\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:202;a:4:{s:1:\"a\";i:203;s:1:\"b\";s:12:\"restore_room\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:203;a:4:{s:1:\"a\";i:204;s:1:\"b\";s:16:\"restore_any_room\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:204;a:4:{s:1:\"a\";i:205;s:1:\"b\";s:14:\"replicate_room\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:205;a:4:{s:1:\"a\";i:206;s:1:\"b\";s:12:\"reorder_room\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:206;a:4:{s:1:\"a\";i:207;s:1:\"b\";s:11:\"delete_room\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:207;a:4:{s:1:\"a\";i:208;s:1:\"b\";s:15:\"delete_any_room\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:208;a:4:{s:1:\"a\";i:209;s:1:\"b\";s:17:\"force_delete_room\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:209;a:4:{s:1:\"a\";i:210;s:1:\"b\";s:21:\"force_delete_any_room\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:210;a:4:{s:1:\"a\";i:211;s:1:\"b\";s:20:\"view_specials::areas\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:211;a:4:{s:1:\"a\";i:212;s:1:\"b\";s:24:\"view_any_specials::areas\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:212;a:4:{s:1:\"a\";i:213;s:1:\"b\";s:22:\"create_specials::areas\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:213;a:4:{s:1:\"a\";i:214;s:1:\"b\";s:22:\"update_specials::areas\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:214;a:4:{s:1:\"a\";i:215;s:1:\"b\";s:23:\"restore_specials::areas\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:215;a:4:{s:1:\"a\";i:216;s:1:\"b\";s:27:\"restore_any_specials::areas\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:216;a:4:{s:1:\"a\";i:217;s:1:\"b\";s:25:\"replicate_specials::areas\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:217;a:4:{s:1:\"a\";i:218;s:1:\"b\";s:23:\"reorder_specials::areas\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:218;a:4:{s:1:\"a\";i:219;s:1:\"b\";s:22:\"delete_specials::areas\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:219;a:4:{s:1:\"a\";i:220;s:1:\"b\";s:26:\"delete_any_specials::areas\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:220;a:4:{s:1:\"a\";i:221;s:1:\"b\";s:28:\"force_delete_specials::areas\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:221;a:4:{s:1:\"a\";i:222;s:1:\"b\";s:32:\"force_delete_any_specials::areas\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:222;a:4:{s:1:\"a\";i:223;s:1:\"b\";s:10:\"view_stock\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:223;a:4:{s:1:\"a\";i:224;s:1:\"b\";s:14:\"view_any_stock\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:224;a:4:{s:1:\"a\";i:225;s:1:\"b\";s:12:\"create_stock\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:225;a:4:{s:1:\"a\";i:226;s:1:\"b\";s:12:\"update_stock\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:226;a:4:{s:1:\"a\";i:227;s:1:\"b\";s:13:\"restore_stock\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:227;a:4:{s:1:\"a\";i:228;s:1:\"b\";s:17:\"restore_any_stock\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:228;a:4:{s:1:\"a\";i:229;s:1:\"b\";s:15:\"replicate_stock\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:229;a:4:{s:1:\"a\";i:230;s:1:\"b\";s:13:\"reorder_stock\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:230;a:4:{s:1:\"a\";i:231;s:1:\"b\";s:12:\"delete_stock\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:231;a:4:{s:1:\"a\";i:232;s:1:\"b\";s:16:\"delete_any_stock\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:232;a:4:{s:1:\"a\";i:233;s:1:\"b\";s:18:\"force_delete_stock\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:233;a:4:{s:1:\"a\";i:234;s:1:\"b\";s:22:\"force_delete_any_stock\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:234;a:4:{s:1:\"a\";i:235;s:1:\"b\";s:9:\"view_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:235;a:4:{s:1:\"a\";i:236;s:1:\"b\";s:13:\"view_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:236;a:4:{s:1:\"a\";i:237;s:1:\"b\";s:11:\"create_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:237;a:4:{s:1:\"a\";i:238;s:1:\"b\";s:11:\"update_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:238;a:4:{s:1:\"a\";i:239;s:1:\"b\";s:12:\"restore_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:239;a:4:{s:1:\"a\";i:240;s:1:\"b\";s:16:\"restore_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:240;a:4:{s:1:\"a\";i:241;s:1:\"b\";s:14:\"replicate_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:241;a:4:{s:1:\"a\";i:242;s:1:\"b\";s:12:\"reorder_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:242;a:4:{s:1:\"a\";i:243;s:1:\"b\";s:11:\"delete_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:243;a:4:{s:1:\"a\";i:244;s:1:\"b\";s:15:\"delete_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:244;a:4:{s:1:\"a\";i:245;s:1:\"b\";s:17:\"force_delete_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:245;a:4:{s:1:\"a\";i:246;s:1:\"b\";s:21:\"force_delete_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:246;a:4:{s:1:\"a\";i:247;s:1:\"b\";s:11:\"page_Themes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:1:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:11:\"super_admin\";s:1:\"c\";s:3:\"web\";}}}', 1716918387);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `categories` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `categories`, `created_at`, `updated_at`) VALUES
(1, 'blancos', '2024-05-28 00:07:52', '2024-05-28 00:07:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departaments`
--

CREATE TABLE `departaments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `departaments` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `departaments`
--

INSERT INTO `departaments` (`id`, `departaments`, `created_at`, `updated_at`) VALUES
(1, 'mantenimiento', '2024-05-27 22:22:50', '2024-05-27 22:22:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descriptions`
--

CREATE TABLE `descriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `descriptions`
--

INSERT INTO `descriptions` (`id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'asdf', '2024-05-27 22:40:38', '2024-05-27 22:40:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equips`
--

CREATE TABLE `equips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `equips`
--

INSERT INTO `equips` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'equipo1', '2024-05-27 22:24:52', '2024-05-27 22:24:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `faultreports`
--

CREATE TABLE `faultreports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `departaments_id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `personals_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rooms_id` bigint(20) UNSIGNED DEFAULT NULL,
  `specials_areas_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `faultreports`
--

INSERT INTO `faultreports` (`id`, `departaments_id`, `descripcion`, `date`, `photo`, `personals_id`, `created_at`, `updated_at`, `rooms_id`, `specials_areas_id`) VALUES
(1, 1, '<p>dwdfwffwe</p>', '2024-05-01', NULL, 1, '2024-05-28 00:06:19', '2024-05-28 00:06:19', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `losts`
--

CREATE TABLE `losts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `departaments_id` bigint(20) UNSIGNED NOT NULL,
  `specials_areas_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date of foud` date NOT NULL,
  `date of return` date DEFAULT NULL,
  `return_object` enum('devuelto','no devuelto') NOT NULL,
  `personals_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rooms_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `losts`
--

INSERT INTO `losts` (`id`, `descripcion`, `photo`, `departaments_id`, `specials_areas_id`, `date of foud`, `date of return`, `return_object`, `personals_id`, `created_at`, `updated_at`, `rooms_id`) VALUES
(1, 'tydytfhghc', NULL, 1, 1, '2024-05-22', '2024-05-16', 'devuelto', 1, '2024-05-27 22:47:56', '2024-05-27 22:47:56', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lost_reports`
--

CREATE TABLE `lost_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `departaments_id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `date of foud` date NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `personals_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rooms_id` bigint(20) UNSIGNED DEFAULT NULL,
  `specials_areas_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `lost_reports`
--

INSERT INTO `lost_reports` (`id`, `departaments_id`, `descripcion`, `date of foud`, `photo`, `personals_id`, `created_at`, `updated_at`, `rooms_id`, `specials_areas_id`) VALUES
(1, 1, '<p>adasgdsbfdbfsdv</p>', '2024-05-10', NULL, 1, '2024-05-27 23:51:04', '2024-05-27 23:51:04', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_05_09_124748_create_equips_table', 1),
(5, '2024_05_09_214717_create_positions_table', 1),
(6, '2024_05_09_214748_create_personals_table', 1),
(7, '2024_05_10_152229_create_rooms_table', 1),
(8, '2024_05_10_152230_create_specials_areas_table', 1),
(9, '2024_05_10_152240_create_descriptions_table', 1),
(10, '2024_05_10_152255_create_activities_table', 1),
(11, '2024_05_11_005757_create_progress_table', 1),
(12, '2024_05_13_125725_create_departaments_table', 1),
(13, '2024_05_13_125738_create_losts_table', 1),
(26, '2024_05_13_130056_create_lost_reports_table', 2),
(28, '2024_05_19_204603_create_breakdowns_table', 2),
(29, '2024_05_19_224419_create_categories_table', 2),
(30, '2024_05_19_224420_create_products_table', 2),
(31, '2024_05_19_234520_create_stocks_table', 2),
(32, '2024_05_20_014244_create_orders_table', 2),
(33, '2024_05_21_002705_add_themes_settings_to_users_table', 2),
(34, '2024_05_27_011855_create_activityreports_table', 2),
(35, '2024_05_27_013459_create_faultreports_table', 2),
(36, '2024_05_27_024808_create_orderreports_table', 2),
(37, '2024_05_17_204932_create_permission_tables', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orderreports`
--

CREATE TABLE `orderreports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `departaments_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `personals_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `categories_id` bigint(20) UNSIGNED NOT NULL,
  `products_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `orderreports`
--

INSERT INTO `orderreports` (`id`, `departaments_id`, `date`, `personals_id`, `created_at`, `updated_at`, `categories_id`, `products_id`) VALUES
(1, 1, '2024-05-03', 1, '2024-05-28 00:11:02', '2024-05-28 00:11:02', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `amount` int(11) NOT NULL,
  `personals_id` bigint(20) UNSIGNED NOT NULL,
  `departaments_id` bigint(20) UNSIGNED NOT NULL,
  `products_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `date`, `amount`, `personals_id`, `departaments_id`, `products_id`, `created_at`, `updated_at`) VALUES
(1, '2024-05-09', 123, 1, 1, 1, '2024-05-28 00:10:18', '2024-05-28 00:10:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view_activity', 'web', '2024-05-27 23:45:31', '2024-05-27 23:45:31'),
(2, 'view_any_activity', 'web', '2024-05-27 23:45:31', '2024-05-27 23:45:31'),
(3, 'create_activity', 'web', '2024-05-27 23:45:31', '2024-05-27 23:45:31'),
(4, 'update_activity', 'web', '2024-05-27 23:45:31', '2024-05-27 23:45:31'),
(5, 'restore_activity', 'web', '2024-05-27 23:45:31', '2024-05-27 23:45:31'),
(6, 'restore_any_activity', 'web', '2024-05-27 23:45:31', '2024-05-27 23:45:31'),
(7, 'replicate_activity', 'web', '2024-05-27 23:45:31', '2024-05-27 23:45:31'),
(8, 'reorder_activity', 'web', '2024-05-27 23:45:31', '2024-05-27 23:45:31'),
(9, 'delete_activity', 'web', '2024-05-27 23:45:32', '2024-05-27 23:45:32'),
(10, 'delete_any_activity', 'web', '2024-05-27 23:45:32', '2024-05-27 23:45:32'),
(11, 'force_delete_activity', 'web', '2024-05-27 23:45:32', '2024-05-27 23:45:32'),
(12, 'force_delete_any_activity', 'web', '2024-05-27 23:45:32', '2024-05-27 23:45:32'),
(13, 'view_activityreports', 'web', '2024-05-27 23:45:33', '2024-05-27 23:45:33'),
(14, 'view_any_activityreports', 'web', '2024-05-27 23:45:33', '2024-05-27 23:45:33'),
(15, 'create_activityreports', 'web', '2024-05-27 23:45:33', '2024-05-27 23:45:33'),
(16, 'update_activityreports', 'web', '2024-05-27 23:45:33', '2024-05-27 23:45:33'),
(17, 'restore_activityreports', 'web', '2024-05-27 23:45:33', '2024-05-27 23:45:33'),
(18, 'restore_any_activityreports', 'web', '2024-05-27 23:45:33', '2024-05-27 23:45:33'),
(19, 'replicate_activityreports', 'web', '2024-05-27 23:45:33', '2024-05-27 23:45:33'),
(20, 'reorder_activityreports', 'web', '2024-05-27 23:45:33', '2024-05-27 23:45:33'),
(21, 'delete_activityreports', 'web', '2024-05-27 23:45:33', '2024-05-27 23:45:33'),
(22, 'delete_any_activityreports', 'web', '2024-05-27 23:45:33', '2024-05-27 23:45:33'),
(23, 'force_delete_activityreports', 'web', '2024-05-27 23:45:33', '2024-05-27 23:45:33'),
(24, 'force_delete_any_activityreports', 'web', '2024-05-27 23:45:34', '2024-05-27 23:45:34'),
(25, 'view_breakdowns', 'web', '2024-05-27 23:45:34', '2024-05-27 23:45:34'),
(26, 'view_any_breakdowns', 'web', '2024-05-27 23:45:34', '2024-05-27 23:45:34'),
(27, 'create_breakdowns', 'web', '2024-05-27 23:45:34', '2024-05-27 23:45:34'),
(28, 'update_breakdowns', 'web', '2024-05-27 23:45:34', '2024-05-27 23:45:34'),
(29, 'restore_breakdowns', 'web', '2024-05-27 23:45:35', '2024-05-27 23:45:35'),
(30, 'restore_any_breakdowns', 'web', '2024-05-27 23:45:35', '2024-05-27 23:45:35'),
(31, 'replicate_breakdowns', 'web', '2024-05-27 23:45:35', '2024-05-27 23:45:35'),
(32, 'reorder_breakdowns', 'web', '2024-05-27 23:45:35', '2024-05-27 23:45:35'),
(33, 'delete_breakdowns', 'web', '2024-05-27 23:45:35', '2024-05-27 23:45:35'),
(34, 'delete_any_breakdowns', 'web', '2024-05-27 23:45:35', '2024-05-27 23:45:35'),
(35, 'force_delete_breakdowns', 'web', '2024-05-27 23:45:35', '2024-05-27 23:45:35'),
(36, 'force_delete_any_breakdowns', 'web', '2024-05-27 23:45:35', '2024-05-27 23:45:35'),
(37, 'view_category', 'web', '2024-05-27 23:45:36', '2024-05-27 23:45:36'),
(38, 'view_any_category', 'web', '2024-05-27 23:45:36', '2024-05-27 23:45:36'),
(39, 'create_category', 'web', '2024-05-27 23:45:36', '2024-05-27 23:45:36'),
(40, 'update_category', 'web', '2024-05-27 23:45:36', '2024-05-27 23:45:36'),
(41, 'restore_category', 'web', '2024-05-27 23:45:36', '2024-05-27 23:45:36'),
(42, 'restore_any_category', 'web', '2024-05-27 23:45:36', '2024-05-27 23:45:36'),
(43, 'replicate_category', 'web', '2024-05-27 23:45:36', '2024-05-27 23:45:36'),
(44, 'reorder_category', 'web', '2024-05-27 23:45:36', '2024-05-27 23:45:36'),
(45, 'delete_category', 'web', '2024-05-27 23:45:36', '2024-05-27 23:45:36'),
(46, 'delete_any_category', 'web', '2024-05-27 23:45:36', '2024-05-27 23:45:36'),
(47, 'force_delete_category', 'web', '2024-05-27 23:45:37', '2024-05-27 23:45:37'),
(48, 'force_delete_any_category', 'web', '2024-05-27 23:45:37', '2024-05-27 23:45:37'),
(49, 'view_departaments', 'web', '2024-05-27 23:45:37', '2024-05-27 23:45:37'),
(50, 'view_any_departaments', 'web', '2024-05-27 23:45:37', '2024-05-27 23:45:37'),
(51, 'create_departaments', 'web', '2024-05-27 23:45:37', '2024-05-27 23:45:37'),
(52, 'update_departaments', 'web', '2024-05-27 23:45:37', '2024-05-27 23:45:37'),
(53, 'restore_departaments', 'web', '2024-05-27 23:45:37', '2024-05-27 23:45:37'),
(54, 'restore_any_departaments', 'web', '2024-05-27 23:45:37', '2024-05-27 23:45:37'),
(55, 'replicate_departaments', 'web', '2024-05-27 23:45:37', '2024-05-27 23:45:37'),
(56, 'reorder_departaments', 'web', '2024-05-27 23:45:37', '2024-05-27 23:45:37'),
(57, 'delete_departaments', 'web', '2024-05-27 23:45:37', '2024-05-27 23:45:37'),
(58, 'delete_any_departaments', 'web', '2024-05-27 23:45:38', '2024-05-27 23:45:38'),
(59, 'force_delete_departaments', 'web', '2024-05-27 23:45:38', '2024-05-27 23:45:38'),
(60, 'force_delete_any_departaments', 'web', '2024-05-27 23:45:38', '2024-05-27 23:45:38'),
(61, 'view_description', 'web', '2024-05-27 23:45:38', '2024-05-27 23:45:38'),
(62, 'view_any_description', 'web', '2024-05-27 23:45:38', '2024-05-27 23:45:38'),
(63, 'create_description', 'web', '2024-05-27 23:45:38', '2024-05-27 23:45:38'),
(64, 'update_description', 'web', '2024-05-27 23:45:38', '2024-05-27 23:45:38'),
(65, 'restore_description', 'web', '2024-05-27 23:45:38', '2024-05-27 23:45:38'),
(66, 'restore_any_description', 'web', '2024-05-27 23:45:38', '2024-05-27 23:45:38'),
(67, 'replicate_description', 'web', '2024-05-27 23:45:38', '2024-05-27 23:45:38'),
(68, 'reorder_description', 'web', '2024-05-27 23:45:39', '2024-05-27 23:45:39'),
(69, 'delete_description', 'web', '2024-05-27 23:45:39', '2024-05-27 23:45:39'),
(70, 'delete_any_description', 'web', '2024-05-27 23:45:39', '2024-05-27 23:45:39'),
(71, 'force_delete_description', 'web', '2024-05-27 23:45:39', '2024-05-27 23:45:39'),
(72, 'force_delete_any_description', 'web', '2024-05-27 23:45:39', '2024-05-27 23:45:39'),
(73, 'view_equip', 'web', '2024-05-27 23:45:39', '2024-05-27 23:45:39'),
(74, 'view_any_equip', 'web', '2024-05-27 23:45:39', '2024-05-27 23:45:39'),
(75, 'create_equip', 'web', '2024-05-27 23:45:39', '2024-05-27 23:45:39'),
(76, 'update_equip', 'web', '2024-05-27 23:45:39', '2024-05-27 23:45:39'),
(77, 'restore_equip', 'web', '2024-05-27 23:45:39', '2024-05-27 23:45:39'),
(78, 'restore_any_equip', 'web', '2024-05-27 23:45:40', '2024-05-27 23:45:40'),
(79, 'replicate_equip', 'web', '2024-05-27 23:45:40', '2024-05-27 23:45:40'),
(80, 'reorder_equip', 'web', '2024-05-27 23:45:40', '2024-05-27 23:45:40'),
(81, 'delete_equip', 'web', '2024-05-27 23:45:40', '2024-05-27 23:45:40'),
(82, 'delete_any_equip', 'web', '2024-05-27 23:45:40', '2024-05-27 23:45:40'),
(83, 'force_delete_equip', 'web', '2024-05-27 23:45:40', '2024-05-27 23:45:40'),
(84, 'force_delete_any_equip', 'web', '2024-05-27 23:45:40', '2024-05-27 23:45:40'),
(85, 'view_faultreports', 'web', '2024-05-27 23:45:40', '2024-05-27 23:45:40'),
(86, 'view_any_faultreports', 'web', '2024-05-27 23:45:40', '2024-05-27 23:45:40'),
(87, 'create_faultreports', 'web', '2024-05-27 23:45:40', '2024-05-27 23:45:40'),
(88, 'update_faultreports', 'web', '2024-05-27 23:45:40', '2024-05-27 23:45:40'),
(89, 'restore_faultreports', 'web', '2024-05-27 23:45:41', '2024-05-27 23:45:41'),
(90, 'restore_any_faultreports', 'web', '2024-05-27 23:45:41', '2024-05-27 23:45:41'),
(91, 'replicate_faultreports', 'web', '2024-05-27 23:45:41', '2024-05-27 23:45:41'),
(92, 'reorder_faultreports', 'web', '2024-05-27 23:45:41', '2024-05-27 23:45:41'),
(93, 'delete_faultreports', 'web', '2024-05-27 23:45:41', '2024-05-27 23:45:41'),
(94, 'delete_any_faultreports', 'web', '2024-05-27 23:45:41', '2024-05-27 23:45:41'),
(95, 'force_delete_faultreports', 'web', '2024-05-27 23:45:41', '2024-05-27 23:45:41'),
(96, 'force_delete_any_faultreports', 'web', '2024-05-27 23:45:41', '2024-05-27 23:45:41'),
(97, 'view_lost', 'web', '2024-05-27 23:45:42', '2024-05-27 23:45:42'),
(98, 'view_any_lost', 'web', '2024-05-27 23:45:42', '2024-05-27 23:45:42'),
(99, 'create_lost', 'web', '2024-05-27 23:45:42', '2024-05-27 23:45:42'),
(100, 'update_lost', 'web', '2024-05-27 23:45:42', '2024-05-27 23:45:42'),
(101, 'restore_lost', 'web', '2024-05-27 23:45:42', '2024-05-27 23:45:42'),
(102, 'restore_any_lost', 'web', '2024-05-27 23:45:42', '2024-05-27 23:45:42'),
(103, 'replicate_lost', 'web', '2024-05-27 23:45:42', '2024-05-27 23:45:42'),
(104, 'reorder_lost', 'web', '2024-05-27 23:45:42', '2024-05-27 23:45:42'),
(105, 'delete_lost', 'web', '2024-05-27 23:45:42', '2024-05-27 23:45:42'),
(106, 'delete_any_lost', 'web', '2024-05-27 23:45:43', '2024-05-27 23:45:43'),
(107, 'force_delete_lost', 'web', '2024-05-27 23:45:43', '2024-05-27 23:45:43'),
(108, 'force_delete_any_lost', 'web', '2024-05-27 23:45:43', '2024-05-27 23:45:43'),
(109, 'view_lost::reports', 'web', '2024-05-27 23:45:43', '2024-05-27 23:45:43'),
(110, 'view_any_lost::reports', 'web', '2024-05-27 23:45:43', '2024-05-27 23:45:43'),
(111, 'create_lost::reports', 'web', '2024-05-27 23:45:43', '2024-05-27 23:45:43'),
(112, 'update_lost::reports', 'web', '2024-05-27 23:45:43', '2024-05-27 23:45:43'),
(113, 'restore_lost::reports', 'web', '2024-05-27 23:45:43', '2024-05-27 23:45:43'),
(114, 'restore_any_lost::reports', 'web', '2024-05-27 23:45:43', '2024-05-27 23:45:43'),
(115, 'replicate_lost::reports', 'web', '2024-05-27 23:45:43', '2024-05-27 23:45:43'),
(116, 'reorder_lost::reports', 'web', '2024-05-27 23:45:43', '2024-05-27 23:45:43'),
(117, 'delete_lost::reports', 'web', '2024-05-27 23:45:43', '2024-05-27 23:45:43'),
(118, 'delete_any_lost::reports', 'web', '2024-05-27 23:45:44', '2024-05-27 23:45:44'),
(119, 'force_delete_lost::reports', 'web', '2024-05-27 23:45:44', '2024-05-27 23:45:44'),
(120, 'force_delete_any_lost::reports', 'web', '2024-05-27 23:45:44', '2024-05-27 23:45:44'),
(121, 'view_orderreports', 'web', '2024-05-27 23:45:44', '2024-05-27 23:45:44'),
(122, 'view_any_orderreports', 'web', '2024-05-27 23:45:44', '2024-05-27 23:45:44'),
(123, 'create_orderreports', 'web', '2024-05-27 23:45:44', '2024-05-27 23:45:44'),
(124, 'update_orderreports', 'web', '2024-05-27 23:45:44', '2024-05-27 23:45:44'),
(125, 'restore_orderreports', 'web', '2024-05-27 23:45:44', '2024-05-27 23:45:44'),
(126, 'restore_any_orderreports', 'web', '2024-05-27 23:45:44', '2024-05-27 23:45:44'),
(127, 'replicate_orderreports', 'web', '2024-05-27 23:45:44', '2024-05-27 23:45:44'),
(128, 'reorder_orderreports', 'web', '2024-05-27 23:45:45', '2024-05-27 23:45:45'),
(129, 'delete_orderreports', 'web', '2024-05-27 23:45:45', '2024-05-27 23:45:45'),
(130, 'delete_any_orderreports', 'web', '2024-05-27 23:45:45', '2024-05-27 23:45:45'),
(131, 'force_delete_orderreports', 'web', '2024-05-27 23:45:45', '2024-05-27 23:45:45'),
(132, 'force_delete_any_orderreports', 'web', '2024-05-27 23:45:45', '2024-05-27 23:45:45'),
(133, 'view_orders', 'web', '2024-05-27 23:45:45', '2024-05-27 23:45:45'),
(134, 'view_any_orders', 'web', '2024-05-27 23:45:45', '2024-05-27 23:45:45'),
(135, 'create_orders', 'web', '2024-05-27 23:45:45', '2024-05-27 23:45:45'),
(136, 'update_orders', 'web', '2024-05-27 23:45:45', '2024-05-27 23:45:45'),
(137, 'restore_orders', 'web', '2024-05-27 23:45:45', '2024-05-27 23:45:45'),
(138, 'restore_any_orders', 'web', '2024-05-27 23:45:45', '2024-05-27 23:45:45'),
(139, 'replicate_orders', 'web', '2024-05-27 23:45:45', '2024-05-27 23:45:45'),
(140, 'reorder_orders', 'web', '2024-05-27 23:45:45', '2024-05-27 23:45:45'),
(141, 'delete_orders', 'web', '2024-05-27 23:45:45', '2024-05-27 23:45:45'),
(142, 'delete_any_orders', 'web', '2024-05-27 23:45:45', '2024-05-27 23:45:45'),
(143, 'force_delete_orders', 'web', '2024-05-27 23:45:45', '2024-05-27 23:45:45'),
(144, 'force_delete_any_orders', 'web', '2024-05-27 23:45:46', '2024-05-27 23:45:46'),
(145, 'view_personal', 'web', '2024-05-27 23:45:46', '2024-05-27 23:45:46'),
(146, 'view_any_personal', 'web', '2024-05-27 23:45:46', '2024-05-27 23:45:46'),
(147, 'create_personal', 'web', '2024-05-27 23:45:46', '2024-05-27 23:45:46'),
(148, 'update_personal', 'web', '2024-05-27 23:45:46', '2024-05-27 23:45:46'),
(149, 'restore_personal', 'web', '2024-05-27 23:45:46', '2024-05-27 23:45:46'),
(150, 'restore_any_personal', 'web', '2024-05-27 23:45:46', '2024-05-27 23:45:46'),
(151, 'replicate_personal', 'web', '2024-05-27 23:45:46', '2024-05-27 23:45:46'),
(152, 'reorder_personal', 'web', '2024-05-27 23:45:46', '2024-05-27 23:45:46'),
(153, 'delete_personal', 'web', '2024-05-27 23:45:46', '2024-05-27 23:45:46'),
(154, 'delete_any_personal', 'web', '2024-05-27 23:45:46', '2024-05-27 23:45:46'),
(155, 'force_delete_personal', 'web', '2024-05-27 23:45:46', '2024-05-27 23:45:46'),
(156, 'force_delete_any_personal', 'web', '2024-05-27 23:45:46', '2024-05-27 23:45:46'),
(157, 'view_position', 'web', '2024-05-27 23:45:46', '2024-05-27 23:45:46'),
(158, 'view_any_position', 'web', '2024-05-27 23:45:47', '2024-05-27 23:45:47'),
(159, 'create_position', 'web', '2024-05-27 23:45:47', '2024-05-27 23:45:47'),
(160, 'update_position', 'web', '2024-05-27 23:45:47', '2024-05-27 23:45:47'),
(161, 'restore_position', 'web', '2024-05-27 23:45:47', '2024-05-27 23:45:47'),
(162, 'restore_any_position', 'web', '2024-05-27 23:45:47', '2024-05-27 23:45:47'),
(163, 'replicate_position', 'web', '2024-05-27 23:45:47', '2024-05-27 23:45:47'),
(164, 'reorder_position', 'web', '2024-05-27 23:45:47', '2024-05-27 23:45:47'),
(165, 'delete_position', 'web', '2024-05-27 23:45:47', '2024-05-27 23:45:47'),
(166, 'delete_any_position', 'web', '2024-05-27 23:45:47', '2024-05-27 23:45:47'),
(167, 'force_delete_position', 'web', '2024-05-27 23:45:47', '2024-05-27 23:45:47'),
(168, 'force_delete_any_position', 'web', '2024-05-27 23:45:47', '2024-05-27 23:45:47'),
(169, 'view_products', 'web', '2024-05-27 23:45:47', '2024-05-27 23:45:47'),
(170, 'view_any_products', 'web', '2024-05-27 23:45:47', '2024-05-27 23:45:47'),
(171, 'create_products', 'web', '2024-05-27 23:45:48', '2024-05-27 23:45:48'),
(172, 'update_products', 'web', '2024-05-27 23:45:48', '2024-05-27 23:45:48'),
(173, 'restore_products', 'web', '2024-05-27 23:45:48', '2024-05-27 23:45:48'),
(174, 'restore_any_products', 'web', '2024-05-27 23:45:48', '2024-05-27 23:45:48'),
(175, 'replicate_products', 'web', '2024-05-27 23:45:48', '2024-05-27 23:45:48'),
(176, 'reorder_products', 'web', '2024-05-27 23:45:48', '2024-05-27 23:45:48'),
(177, 'delete_products', 'web', '2024-05-27 23:45:48', '2024-05-27 23:45:48'),
(178, 'delete_any_products', 'web', '2024-05-27 23:45:49', '2024-05-27 23:45:49'),
(179, 'force_delete_products', 'web', '2024-05-27 23:45:49', '2024-05-27 23:45:49'),
(180, 'force_delete_any_products', 'web', '2024-05-27 23:45:49', '2024-05-27 23:45:49'),
(181, 'view_progress', 'web', '2024-05-27 23:45:49', '2024-05-27 23:45:49'),
(182, 'view_any_progress', 'web', '2024-05-27 23:45:49', '2024-05-27 23:45:49'),
(183, 'create_progress', 'web', '2024-05-27 23:45:49', '2024-05-27 23:45:49'),
(184, 'update_progress', 'web', '2024-05-27 23:45:49', '2024-05-27 23:45:49'),
(185, 'restore_progress', 'web', '2024-05-27 23:45:49', '2024-05-27 23:45:49'),
(186, 'restore_any_progress', 'web', '2024-05-27 23:45:49', '2024-05-27 23:45:49'),
(187, 'replicate_progress', 'web', '2024-05-27 23:45:49', '2024-05-27 23:45:49'),
(188, 'reorder_progress', 'web', '2024-05-27 23:45:49', '2024-05-27 23:45:49'),
(189, 'delete_progress', 'web', '2024-05-27 23:45:50', '2024-05-27 23:45:50'),
(190, 'delete_any_progress', 'web', '2024-05-27 23:45:50', '2024-05-27 23:45:50'),
(191, 'force_delete_progress', 'web', '2024-05-27 23:45:50', '2024-05-27 23:45:50'),
(192, 'force_delete_any_progress', 'web', '2024-05-27 23:45:50', '2024-05-27 23:45:50'),
(193, 'view_role', 'web', '2024-05-27 23:45:50', '2024-05-27 23:45:50'),
(194, 'view_any_role', 'web', '2024-05-27 23:45:50', '2024-05-27 23:45:50'),
(195, 'create_role', 'web', '2024-05-27 23:45:50', '2024-05-27 23:45:50'),
(196, 'update_role', 'web', '2024-05-27 23:45:50', '2024-05-27 23:45:50'),
(197, 'delete_role', 'web', '2024-05-27 23:45:50', '2024-05-27 23:45:50'),
(198, 'delete_any_role', 'web', '2024-05-27 23:45:50', '2024-05-27 23:45:50'),
(199, 'view_room', 'web', '2024-05-27 23:45:51', '2024-05-27 23:45:51'),
(200, 'view_any_room', 'web', '2024-05-27 23:45:51', '2024-05-27 23:45:51'),
(201, 'create_room', 'web', '2024-05-27 23:45:51', '2024-05-27 23:45:51'),
(202, 'update_room', 'web', '2024-05-27 23:45:51', '2024-05-27 23:45:51'),
(203, 'restore_room', 'web', '2024-05-27 23:45:51', '2024-05-27 23:45:51'),
(204, 'restore_any_room', 'web', '2024-05-27 23:45:51', '2024-05-27 23:45:51'),
(205, 'replicate_room', 'web', '2024-05-27 23:45:51', '2024-05-27 23:45:51'),
(206, 'reorder_room', 'web', '2024-05-27 23:45:51', '2024-05-27 23:45:51'),
(207, 'delete_room', 'web', '2024-05-27 23:45:51', '2024-05-27 23:45:51'),
(208, 'delete_any_room', 'web', '2024-05-27 23:45:51', '2024-05-27 23:45:51'),
(209, 'force_delete_room', 'web', '2024-05-27 23:45:52', '2024-05-27 23:45:52'),
(210, 'force_delete_any_room', 'web', '2024-05-27 23:45:52', '2024-05-27 23:45:52'),
(211, 'view_specials::areas', 'web', '2024-05-27 23:45:52', '2024-05-27 23:45:52'),
(212, 'view_any_specials::areas', 'web', '2024-05-27 23:45:52', '2024-05-27 23:45:52'),
(213, 'create_specials::areas', 'web', '2024-05-27 23:45:52', '2024-05-27 23:45:52'),
(214, 'update_specials::areas', 'web', '2024-05-27 23:45:52', '2024-05-27 23:45:52'),
(215, 'restore_specials::areas', 'web', '2024-05-27 23:45:52', '2024-05-27 23:45:52'),
(216, 'restore_any_specials::areas', 'web', '2024-05-27 23:45:52', '2024-05-27 23:45:52'),
(217, 'replicate_specials::areas', 'web', '2024-05-27 23:45:52', '2024-05-27 23:45:52'),
(218, 'reorder_specials::areas', 'web', '2024-05-27 23:45:52', '2024-05-27 23:45:52'),
(219, 'delete_specials::areas', 'web', '2024-05-27 23:45:52', '2024-05-27 23:45:52'),
(220, 'delete_any_specials::areas', 'web', '2024-05-27 23:45:52', '2024-05-27 23:45:52'),
(221, 'force_delete_specials::areas', 'web', '2024-05-27 23:45:52', '2024-05-27 23:45:52'),
(222, 'force_delete_any_specials::areas', 'web', '2024-05-27 23:45:52', '2024-05-27 23:45:52'),
(223, 'view_stock', 'web', '2024-05-27 23:45:53', '2024-05-27 23:45:53'),
(224, 'view_any_stock', 'web', '2024-05-27 23:45:53', '2024-05-27 23:45:53'),
(225, 'create_stock', 'web', '2024-05-27 23:45:53', '2024-05-27 23:45:53'),
(226, 'update_stock', 'web', '2024-05-27 23:45:53', '2024-05-27 23:45:53'),
(227, 'restore_stock', 'web', '2024-05-27 23:45:53', '2024-05-27 23:45:53'),
(228, 'restore_any_stock', 'web', '2024-05-27 23:45:53', '2024-05-27 23:45:53'),
(229, 'replicate_stock', 'web', '2024-05-27 23:45:53', '2024-05-27 23:45:53'),
(230, 'reorder_stock', 'web', '2024-05-27 23:45:53', '2024-05-27 23:45:53'),
(231, 'delete_stock', 'web', '2024-05-27 23:45:53', '2024-05-27 23:45:53'),
(232, 'delete_any_stock', 'web', '2024-05-27 23:45:53', '2024-05-27 23:45:53'),
(233, 'force_delete_stock', 'web', '2024-05-27 23:45:53', '2024-05-27 23:45:53'),
(234, 'force_delete_any_stock', 'web', '2024-05-27 23:45:53', '2024-05-27 23:45:53'),
(235, 'view_user', 'web', '2024-05-27 23:45:54', '2024-05-27 23:45:54'),
(236, 'view_any_user', 'web', '2024-05-27 23:45:54', '2024-05-27 23:45:54'),
(237, 'create_user', 'web', '2024-05-27 23:45:54', '2024-05-27 23:45:54'),
(238, 'update_user', 'web', '2024-05-27 23:45:54', '2024-05-27 23:45:54'),
(239, 'restore_user', 'web', '2024-05-27 23:45:54', '2024-05-27 23:45:54'),
(240, 'restore_any_user', 'web', '2024-05-27 23:45:54', '2024-05-27 23:45:54'),
(241, 'replicate_user', 'web', '2024-05-27 23:45:54', '2024-05-27 23:45:54'),
(242, 'reorder_user', 'web', '2024-05-27 23:45:54', '2024-05-27 23:45:54'),
(243, 'delete_user', 'web', '2024-05-27 23:45:54', '2024-05-27 23:45:54'),
(244, 'delete_any_user', 'web', '2024-05-27 23:45:55', '2024-05-27 23:45:55'),
(245, 'force_delete_user', 'web', '2024-05-27 23:45:55', '2024-05-27 23:45:55'),
(246, 'force_delete_any_user', 'web', '2024-05-27 23:45:55', '2024-05-27 23:45:55'),
(247, 'page_Themes', 'web', '2024-05-27 23:45:59', '2024-05-27 23:45:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personals`
--

CREATE TABLE `personals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `birthdate` date NOT NULL,
  `CI` text DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `passport` text DEFAULT NULL,
  `sex` enum('masculino','femenino') NOT NULL,
  `email` text NOT NULL,
  `emergency_contac` varchar(255) NOT NULL,
  `positions_id` bigint(20) UNSIGNED NOT NULL,
  `equips_id` bigint(20) UNSIGNED NOT NULL,
  `users_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personals`
--

INSERT INTO `personals` (`id`, `name`, `photo`, `age`, `birthdate`, `CI`, `nationality`, `passport`, `sex`, `email`, `emergency_contac`, `positions_id`, `equips_id`, `users_id`, `created_at`, `updated_at`) VALUES
(1, 'bryan ortega', NULL, 23, '2001-03-21', '1321', NULL, NULL, 'masculino', 'admin4@gmail.com', '5913131232', 1, 1, 1, '2024-05-27 22:32:21', '2024-05-27 22:32:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `positions`
--

CREATE TABLE `positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `positions` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `positions`
--

INSERT INTO `positions` (`id`, `positions`, `created_at`, `updated_at`) VALUES
(1, 'ama de llaves', '2024-05-27 22:24:34', '2024-05-27 22:24:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `products` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `categories_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `products`, `stock`, `brand`, `categories_id`, `created_at`, `updated_at`) VALUES
(1, 'sabana', 123, 'dex', 1, '2024-05-28 00:08:37', '2024-05-28 00:08:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `progress`
--

CREATE TABLE `progress` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `activities_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'web', '2024-05-27 23:45:32', '2024-05-27 23:45:32'),
(2, 'panel_user', 'web', '2024-05-27 23:46:01', '2024-05-27 23:46:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(180, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1),
(191, 1),
(192, 1),
(193, 1),
(194, 1),
(195, 1),
(196, 1),
(197, 1),
(198, 1),
(199, 1),
(200, 1),
(201, 1),
(202, 1),
(203, 1),
(204, 1),
(205, 1),
(206, 1),
(207, 1),
(208, 1),
(209, 1),
(210, 1),
(211, 1),
(212, 1),
(213, 1),
(214, 1),
(215, 1),
(216, 1),
(217, 1),
(218, 1),
(219, 1),
(220, 1),
(221, 1),
(222, 1),
(223, 1),
(224, 1),
(225, 1),
(226, 1),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 1),
(235, 1),
(236, 1),
(237, 1),
(238, 1),
(239, 1),
(240, 1),
(241, 1),
(242, 1),
(243, 1),
(244, 1),
(245, 1),
(246, 1),
(247, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rooms` text NOT NULL,
  `rooms_number` text NOT NULL,
  `rooms_price` decimal(50,2) NOT NULL,
  `rooms_type` enum('matrimonial','doble','individual') NOT NULL,
  `capacity` int(11) NOT NULL,
  `state` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rooms`
--

INSERT INTO `rooms` (`id`, `rooms`, `rooms_number`, `rooms_price`, `rooms_type`, `capacity`, `state`, `created_at`, `updated_at`) VALUES
(1, 'eawff', '214213', 12.00, 'doble', 21, '[\"Limpio\"]', '2024-05-27 22:34:22', '2024-05-27 22:34:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('XhEaM35PzO3DkwYvqmWs22P89sYbpJtlG4uyeFyH', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoicktOdmJGVEJzbWRKaVgyM1EyUnVGUEVGNXVyOUswRkhUQ1FFMmRaOSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vb3JkZXJyZXBvcnRzLzEvZWRpdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiREcDRHSkRhNlhtRFdHdTcybHB4c3Z1WGFPbDVubFdob1RmNnFPdXRzbXJJbXpjSDdRTEx4LiI7czo4OiJmaWxhbWVudCI7YTowOnt9fQ==', 1716833476);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `specials_areas`
--

CREATE TABLE `specials_areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Area` varchar(255) NOT NULL,
  `Ubicacion` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `specials_areas`
--

INSERT INTO `specials_areas` (`id`, `Area`, `Ubicacion`, `created_at`, `updated_at`) VALUES
(1, 'pisina', 'patio', '2024-05-27 22:23:18', '2024-05-27 22:23:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `date_entry` date NOT NULL,
  `amount` varchar(255) NOT NULL,
  `personals_id` bigint(20) UNSIGNED NOT NULL,
  `departaments_id` bigint(20) UNSIGNED NOT NULL,
  `products_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `stocks`
--

INSERT INTO `stocks` (`id`, `description`, `photo`, `date_entry`, `amount`, `personals_id`, `departaments_id`, `products_id`, `created_at`, `updated_at`) VALUES
(1, 'qefww', NULL, '2024-12-12', '12', 1, 1, 1, '2024-05-28 00:09:34', '2024-05-28 00:09:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `theme` varchar(255) DEFAULT 'default',
  `theme_color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `theme`, `theme_color`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$Dp4GJDa6XmDWGu72lpxsvuXaOl5nlWhoTf6qOutsmrImzcH7QLLx.', NULL, '2024-05-27 22:11:48', '2024-05-27 22:11:48', 'default', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activities_specials_areas_id_foreign` (`specials_areas_id`),
  ADD KEY `activities_descriptions_id_foreign` (`descriptions_id`),
  ADD KEY `activities_personals_id_foreign` (`personals_id`),
  ADD KEY `activities_rooms_id_foreign` (`rooms_id`),
  ADD KEY `activities_equips_id_foreign` (`equips_id`);

--
-- Indices de la tabla `activityreports`
--
ALTER TABLE `activityreports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activityreports_departaments_id_foreign` (`departaments_id`),
  ADD KEY `activityreports_personals_id_foreign` (`personals_id`),
  ADD KEY `activityreports_rooms_id_foreign` (`rooms_id`),
  ADD KEY `activityreports_specials_areas_id_foreign` (`specials_areas_id`),
  ADD KEY `activityreports_lost_reports_id_foreign` (`lost_reports_id`);

--
-- Indices de la tabla `breakdowns`
--
ALTER TABLE `breakdowns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `breakdowns_personals_id_foreign` (`personals_id`),
  ADD KEY `breakdowns_rooms_id_foreign` (`rooms_id`),
  ADD KEY `breakdowns_departaments_id_foreign` (`departaments_id`),
  ADD KEY `breakdowns_specials_areas_id_foreign` (`specials_areas_id`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departaments`
--
ALTER TABLE `departaments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `descriptions`
--
ALTER TABLE `descriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `equips`
--
ALTER TABLE `equips`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `faultreports`
--
ALTER TABLE `faultreports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faultreports_departaments_id_foreign` (`departaments_id`),
  ADD KEY `faultreports_personals_id_foreign` (`personals_id`),
  ADD KEY `faultreports_rooms_id_foreign` (`rooms_id`),
  ADD KEY `faultreports_specials_areas_id_foreign` (`specials_areas_id`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `losts`
--
ALTER TABLE `losts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `losts_departaments_id_foreign` (`departaments_id`),
  ADD KEY `losts_specials_areas_id_foreign` (`specials_areas_id`),
  ADD KEY `losts_personals_id_foreign` (`personals_id`),
  ADD KEY `losts_rooms_id_foreign` (`rooms_id`);

--
-- Indices de la tabla `lost_reports`
--
ALTER TABLE `lost_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lost_reports_departaments_id_foreign` (`departaments_id`),
  ADD KEY `lost_reports_personals_id_foreign` (`personals_id`),
  ADD KEY `lost_reports_rooms_id_foreign` (`rooms_id`),
  ADD KEY `lost_reports_specials_areas_id_foreign` (`specials_areas_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `orderreports`
--
ALTER TABLE `orderreports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderreports_departaments_id_foreign` (`departaments_id`),
  ADD KEY `orderreports_personals_id_foreign` (`personals_id`),
  ADD KEY `orderreports_categories_id_foreign` (`categories_id`),
  ADD KEY `orderreports_products_id_foreign` (`products_id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_personals_id_foreign` (`personals_id`),
  ADD KEY `orders_departaments_id_foreign` (`departaments_id`),
  ADD KEY `orders_products_id_foreign` (`products_id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `personals`
--
ALTER TABLE `personals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personals_ci_unique` (`CI`) USING HASH,
  ADD UNIQUE KEY `personals_email_unique` (`email`) USING HASH,
  ADD KEY `personals_positions_id_foreign` (`positions_id`),
  ADD KEY `personals_equips_id_foreign` (`equips_id`),
  ADD KEY `personals_users_id_foreign` (`users_id`);

--
-- Indices de la tabla `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_categories_id_foreign` (`categories_id`);

--
-- Indices de la tabla `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `progress_activities_id_foreign` (`activities_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `specials_areas`
--
ALTER TABLE `specials_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stocks_personals_id_foreign` (`personals_id`),
  ADD KEY `stocks_departaments_id_foreign` (`departaments_id`),
  ADD KEY `stocks_products_id_foreign` (`products_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `activityreports`
--
ALTER TABLE `activityreports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `breakdowns`
--
ALTER TABLE `breakdowns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `departaments`
--
ALTER TABLE `departaments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `descriptions`
--
ALTER TABLE `descriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `equips`
--
ALTER TABLE `equips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `faultreports`
--
ALTER TABLE `faultreports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `losts`
--
ALTER TABLE `losts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `lost_reports`
--
ALTER TABLE `lost_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `orderreports`
--
ALTER TABLE `orderreports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- AUTO_INCREMENT de la tabla `personals`
--
ALTER TABLE `personals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `progress`
--
ALTER TABLE `progress`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `specials_areas`
--
ALTER TABLE `specials_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_descriptions_id_foreign` FOREIGN KEY (`descriptions_id`) REFERENCES `descriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `activities_equips_id_foreign` FOREIGN KEY (`equips_id`) REFERENCES `equips` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `activities_personals_id_foreign` FOREIGN KEY (`personals_id`) REFERENCES `personals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `activities_rooms_id_foreign` FOREIGN KEY (`rooms_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `activities_specials_areas_id_foreign` FOREIGN KEY (`specials_areas_id`) REFERENCES `specials_areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `activityreports`
--
ALTER TABLE `activityreports`
  ADD CONSTRAINT `activityreports_departaments_id_foreign` FOREIGN KEY (`departaments_id`) REFERENCES `departaments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `activityreports_lost_reports_id_foreign` FOREIGN KEY (`lost_reports_id`) REFERENCES `lost_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `activityreports_personals_id_foreign` FOREIGN KEY (`personals_id`) REFERENCES `personals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `activityreports_rooms_id_foreign` FOREIGN KEY (`rooms_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `activityreports_specials_areas_id_foreign` FOREIGN KEY (`specials_areas_id`) REFERENCES `specials_areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `breakdowns`
--
ALTER TABLE `breakdowns`
  ADD CONSTRAINT `breakdowns_departaments_id_foreign` FOREIGN KEY (`departaments_id`) REFERENCES `departaments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `breakdowns_personals_id_foreign` FOREIGN KEY (`personals_id`) REFERENCES `personals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `breakdowns_rooms_id_foreign` FOREIGN KEY (`rooms_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `breakdowns_specials_areas_id_foreign` FOREIGN KEY (`specials_areas_id`) REFERENCES `specials_areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `faultreports`
--
ALTER TABLE `faultreports`
  ADD CONSTRAINT `faultreports_departaments_id_foreign` FOREIGN KEY (`departaments_id`) REFERENCES `departaments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faultreports_personals_id_foreign` FOREIGN KEY (`personals_id`) REFERENCES `personals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faultreports_rooms_id_foreign` FOREIGN KEY (`rooms_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faultreports_specials_areas_id_foreign` FOREIGN KEY (`specials_areas_id`) REFERENCES `specials_areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `losts`
--
ALTER TABLE `losts`
  ADD CONSTRAINT `losts_departaments_id_foreign` FOREIGN KEY (`departaments_id`) REFERENCES `departaments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `losts_personals_id_foreign` FOREIGN KEY (`personals_id`) REFERENCES `personals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `losts_rooms_id_foreign` FOREIGN KEY (`rooms_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `losts_specials_areas_id_foreign` FOREIGN KEY (`specials_areas_id`) REFERENCES `specials_areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `lost_reports`
--
ALTER TABLE `lost_reports`
  ADD CONSTRAINT `lost_reports_departaments_id_foreign` FOREIGN KEY (`departaments_id`) REFERENCES `departaments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lost_reports_personals_id_foreign` FOREIGN KEY (`personals_id`) REFERENCES `personals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lost_reports_rooms_id_foreign` FOREIGN KEY (`rooms_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lost_reports_specials_areas_id_foreign` FOREIGN KEY (`specials_areas_id`) REFERENCES `specials_areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `orderreports`
--
ALTER TABLE `orderreports`
  ADD CONSTRAINT `orderreports_categories_id_foreign` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderreports_departaments_id_foreign` FOREIGN KEY (`departaments_id`) REFERENCES `departaments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderreports_personals_id_foreign` FOREIGN KEY (`personals_id`) REFERENCES `personals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderreports_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_departaments_id_foreign` FOREIGN KEY (`departaments_id`) REFERENCES `departaments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_personals_id_foreign` FOREIGN KEY (`personals_id`) REFERENCES `personals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `personals`
--
ALTER TABLE `personals`
  ADD CONSTRAINT `personals_equips_id_foreign` FOREIGN KEY (`equips_id`) REFERENCES `equips` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `personals_positions_id_foreign` FOREIGN KEY (`positions_id`) REFERENCES `positions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `personals_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_categories_id_foreign` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `progress`
--
ALTER TABLE `progress`
  ADD CONSTRAINT `progress_activities_id_foreign` FOREIGN KEY (`activities_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_departaments_id_foreign` FOREIGN KEY (`departaments_id`) REFERENCES `departaments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stocks_personals_id_foreign` FOREIGN KEY (`personals_id`) REFERENCES `personals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stocks_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
