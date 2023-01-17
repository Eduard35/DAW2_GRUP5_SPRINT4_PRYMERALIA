-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 29-11-2022 a las 14:09:42
-- Versión del servidor: 10.6.11-MariaDB-1:10.6.11+maria~ubu2004
-- Versión de PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pymeralias2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activities`
--

CREATE TABLE `activities` (
  `id_activity` int(11) NOT NULL,
  `name_activity` varchar(50) NOT NULL,
  `description_activity` varchar(500) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `final_date` datetime DEFAULT NULL,
  `id_course` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `answers`
--

CREATE TABLE `answers` (
  `id_answer` int(11) NOT NULL,
  `name_answer` varchar(50) NOT NULL,
  `description_answer` varchar(500) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `id_question` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `budgets`
--

CREATE TABLE `budgets` (
  `id_budget` int(11) NOT NULL,
  `price` double NOT NULL,
  `accepted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companies`
--

CREATE TABLE `companies` (
  `id_company` int(11) NOT NULL,
  `name_company` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `cif` varchar(50) NOT NULL,
  `hidden` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `companies`
--

INSERT INTO `companies` (`id_company`, `name_company`, `email`, `phone_number`, `cif`, `hidden`) VALUES
(1, 'Institut Montsià', 'ajuda@iesmontsia.org', 612737127, '43870', 0),
(2, 'Hitech Informatica', 'ajuda@hitech.es', 619834261, '43870', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

CREATE TABLE `courses` (
  `id_course` int(11) NOT NULL,
  `name_course` varchar(50) NOT NULL,
  `description_course` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `hidden` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deliveries`
--

CREATE TABLE `deliveries` (
  `id_delivery` int(11) NOT NULL,
  `locate` varchar(50) NOT NULL,
  `grade` decimal(2,2) DEFAULT NULL,
  `id_activity` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devices`
--

CREATE TABLE `devices` (
  `id_device` int(11) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `model_devices` varchar(100) NOT NULL,
  `mac_ethernet` varchar(20) NOT NULL,
  `mac_wifi` varchar(20) DEFAULT NULL,
  `id_type` int(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `device_state` varchar(20) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `serial_number` varchar(30) NOT NULL,
  `id_user` int(11) NOT NULL,
  `hidden` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `devices`
--

INSERT INTO `devices` (`id_device`, `brand`, `model_devices`, `mac_ethernet`, `mac_wifi`, `id_type`, `description`, `device_state`, `tag`, `serial_number`, `id_user`, `hidden`) VALUES
(1, 'HP', 'Omen 16', '0d:16:ed:8a:a0:16', NULL, 1, 'Portatil gamer', 'Correcte', '1000', 'AjadJsopnol', 1, NULL),
(2, 'Lenovo', 'Lenovo Ideadpad 5', 'b2:47:c0:2a:6e:57', NULL, 2, 'PC de sobretaula', 'Correcte', '2000', 'pdvgWQspcn', 2, '2022-11-22'),
(3, 'DELL', 'Dell x192 Gen', '1c:6c:e4:7f:c3:4e', NULL, 1, 'Portatil per a prestec', 'Correcte', '3000', 'BuczXbseQb', 2, NULL),
(4, 'Macbook', 'Pro', 'ad:1d:j2:o0:1d:vd', '', 2, 'descripción random', 'Correcte', '4812', 'D9w981A2yh19d', 1, '2022-11-29'),
(5, 'Kinston', '128 GB', '', '', 3, 'Pen drive', 'Correcte', '6125', '', 3, '2022-11-29'),
(6, 'HONOR', 'MagicBook 16', 'a3:a2:a9:d5:cd:db', '', 1, 'Portatil de estudios', 'Correcte', '9060', '891jmGYU16kd', 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emblems`
--

CREATE TABLE `emblems` (
  `id_emblem` int(11) NOT NULL,
  `name_emblem` varchar(50) NOT NULL,
  `description_emblem` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `id_course` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grade`
--

CREATE TABLE `grade` (
  `id_grade` int(11) NOT NULL,
  `qualification` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `hidden` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impacts`
--

CREATE TABLE `impacts` (
  `id_impact` int(11) NOT NULL,
  `name_type_impact` varchar(50) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `id_answer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interventions`
--

CREATE TABLE `interventions` (
  `id_intervention` int(11) NOT NULL,
  `name_type_intervention` varchar(50) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `id_answer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventories`
--

CREATE TABLE `inventories` (
  `id_inventory` int(11) NOT NULL,
  `inventory_number` int(11) DEFAULT NULL,
  `id_device` int(11) NOT NULL,
  `hidden` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `inventories`
--

INSERT INTO `inventories` (`id_inventory`, `inventory_number`, `id_device`, `hidden`) VALUES
(1, 1000, 1, NULL),
(2, 2000, 2, '2022-11-22'),
(3, 3000, 3, NULL),
(5, 4812, 4, '2022-11-29'),
(6, 6125, 5, '2022-11-29'),
(7, 9060, 6, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `probabilities`
--

CREATE TABLE `probabilities` (
  `id_probability` int(11) NOT NULL,
  `name_type_probability` varchar(50) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `id_answer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `questionnaries`
--

CREATE TABLE `questionnaries` (
  `id_questionary` int(11) NOT NULL,
  `name_questionary` varchar(50) NOT NULL,
  `autor_questionary` varchar(50) DEFAULT NULL,
  `date_questionary` date DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `questions`
--

CREATE TABLE `questions` (
  `id_question` int(11) NOT NULL,
  `name_question` varchar(50) NOT NULL,
  `description_question` varchar(500) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `id_questionary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ratings`
--

CREATE TABLE `ratings` (
  `id_rating` int(11) NOT NULL,
  `rating` varchar(50) NOT NULL,
  `Feedback` varchar(50) NOT NULL,
  `id_course` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recommendations`
--

CREATE TABLE `recommendations` (
  `id_recommendation` int(11) NOT NULL,
  `name_recommendation` varchar(50) NOT NULL,
  `description_recommendation` varchar(500) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `id_answer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reports`
--

CREATE TABLE `reports` (
  `id_report` int(11) NOT NULL,
  `name_report` varchar(50) NOT NULL,
  `date_report` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resources_files`
--

CREATE TABLE `resources_files` (
  `id_resource_file` int(11) NOT NULL,
  `name_resource_file` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `id_course` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resources_text`
--

CREATE TABLE `resources_text` (
  `id_resource_text` int(11) NOT NULL,
  `name_resource_text` varchar(50) NOT NULL,
  `description_resource_text` varchar(1000) NOT NULL,
  `id_course` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resourses_uml`
--

CREATE TABLE `resourses_uml` (
  `id_resource_uml` int(11) NOT NULL,
  `name_resource_uml` varchar(50) NOT NULL,
  `location` varchar(100) NOT NULL,
  `id_course` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `results`
--

CREATE TABLE `results` (
  `id_result` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `id_answer` int(11) NOT NULL,
  `id_report` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `risks`
--

CREATE TABLE `risks` (
  `id_risk` int(11) NOT NULL,
  `name_type_risk` varchar(50) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `id_answer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasks`
--

CREATE TABLE `tasks` (
  `id_task` int(11) NOT NULL,
  `name_task` varchar(100) NOT NULL,
  `description_task` varchar(500) NOT NULL,
  `accepted` tinyint(1) NOT NULL,
  `state` enum('ToDo','InProgress','Done') DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `final_date` datetime DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_questionary` int(11) NOT NULL,
  `id_recommendation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `task_budget`
--

CREATE TABLE `task_budget` (
  `id_task_budget` int(11) NOT NULL,
  `price` double NOT NULL,
  `id_task` int(11) NOT NULL,
  `id_budget` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `types_measures`
--

CREATE TABLE `types_measures` (
  `id_type_measure` int(11) NOT NULL,
  `name_type_measure` varchar(50) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `id_answer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_device`
--

CREATE TABLE `type_device` (
  `id_type_device` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `type_device`
--

INSERT INTO `type_device` (`id_type_device`, `name`) VALUES
(1, 'Portatil'),
(2, 'PC'),
(3, 'USB');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `dni` varchar(50) NOT NULL,
  `name_user` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `emblems` varchar(50) DEFAULT NULL,
  `nick_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `id_company` int(11) DEFAULT NULL,
  `type_user` enum('admin','worker','client') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `dni`, `name_user`, `last_name`, `phone_number`, `email`, `emblems`, `nick_name`, `password`, `hidden`, `id_company`, `type_user`) VALUES
(1, 'G81723871238', 'Almendra', 'Cortes', 618279381, 'almendrita', NULL, 'Almendra420', 'almendra123', 0, 1, 'admin'),
(2, 'F33782633732', 'Paula', 'Lopez', 618374987, 'paula@hitech.es', NULL, 'Paula22', 'paula123', 0, 2, 'admin'),
(3, 'F91273129301', 'Tudor', 'Constantin', 617384601, 'tudoreusebiu@iesmontsia.org', NULL, '', 'tudor123', 0, NULL, 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_courses`
--

CREATE TABLE `user_courses` (
  `id_user_course` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_course` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_emblems`
--

CREATE TABLE `user_emblems` (
  `id_user_emblem` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_emblem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id_activity`),
  ADD KEY `id_course` (`id_course`);

--
-- Indices de la tabla `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id_answer`),
  ADD KEY `id_question` (`id_question`);

--
-- Indices de la tabla `budgets`
--
ALTER TABLE `budgets`
  ADD PRIMARY KEY (`id_budget`);

--
-- Indices de la tabla `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id_company`);

--
-- Indices de la tabla `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id_course`);

--
-- Indices de la tabla `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id_delivery`),
  ADD KEY `id_activity` (`id_activity`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id_device`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `emblems`
--
ALTER TABLE `emblems`
  ADD PRIMARY KEY (`id_emblem`),
  ADD KEY `id_course` (`id_course`);

--
-- Indices de la tabla `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`id_grade`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `impacts`
--
ALTER TABLE `impacts`
  ADD PRIMARY KEY (`id_impact`),
  ADD KEY `id_answer` (`id_answer`);

--
-- Indices de la tabla `interventions`
--
ALTER TABLE `interventions`
  ADD PRIMARY KEY (`id_intervention`),
  ADD KEY `id_answer` (`id_answer`);

--
-- Indices de la tabla `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id_inventory`),
  ADD KEY `id_device` (`id_device`);

--
-- Indices de la tabla `probabilities`
--
ALTER TABLE `probabilities`
  ADD PRIMARY KEY (`id_probability`),
  ADD KEY `id_answer` (`id_answer`);

--
-- Indices de la tabla `questionnaries`
--
ALTER TABLE `questionnaries`
  ADD PRIMARY KEY (`id_questionary`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id_question`),
  ADD KEY `id_questionary` (`id_questionary`);

--
-- Indices de la tabla `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id_rating`),
  ADD KEY `id_course` (`id_course`);

--
-- Indices de la tabla `recommendations`
--
ALTER TABLE `recommendations`
  ADD PRIMARY KEY (`id_recommendation`),
  ADD KEY `id_answer` (`id_answer`);

--
-- Indices de la tabla `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id_report`);

--
-- Indices de la tabla `resources_files`
--
ALTER TABLE `resources_files`
  ADD PRIMARY KEY (`id_resource_file`),
  ADD KEY `id_course` (`id_course`);

--
-- Indices de la tabla `resources_text`
--
ALTER TABLE `resources_text`
  ADD PRIMARY KEY (`id_resource_text`),
  ADD KEY `id_course` (`id_course`);

--
-- Indices de la tabla `resourses_uml`
--
ALTER TABLE `resourses_uml`
  ADD PRIMARY KEY (`id_resource_uml`),
  ADD KEY `id_course` (`id_course`);

--
-- Indices de la tabla `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id_result`),
  ADD KEY `id_answer` (`id_answer`),
  ADD KEY `id_report` (`id_report`);

--
-- Indices de la tabla `risks`
--
ALTER TABLE `risks`
  ADD PRIMARY KEY (`id_risk`),
  ADD KEY `id_answer` (`id_answer`);

--
-- Indices de la tabla `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id_task`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_questionary` (`id_questionary`),
  ADD KEY `id_recommendation` (`id_recommendation`);

--
-- Indices de la tabla `task_budget`
--
ALTER TABLE `task_budget`
  ADD PRIMARY KEY (`id_task_budget`),
  ADD KEY `id_task` (`id_task`),
  ADD KEY `id_budget` (`id_budget`);

--
-- Indices de la tabla `types_measures`
--
ALTER TABLE `types_measures`
  ADD PRIMARY KEY (`id_type_measure`),
  ADD KEY `id_answer` (`id_answer`);

--
-- Indices de la tabla `type_device`
--
ALTER TABLE `type_device`
  ADD PRIMARY KEY (`id_type_device`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `id_company` (`id_company`);

--
-- Indices de la tabla `user_courses`
--
ALTER TABLE `user_courses`
  ADD PRIMARY KEY (`id_user_course`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_course` (`id_course`);

--
-- Indices de la tabla `user_emblems`
--
ALTER TABLE `user_emblems`
  ADD PRIMARY KEY (`id_user_emblem`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_emblem` (`id_emblem`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activities`
--
ALTER TABLE `activities`
  MODIFY `id_activity` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `answers`
--
ALTER TABLE `answers`
  MODIFY `id_answer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `budgets`
--
ALTER TABLE `budgets`
  MODIFY `id_budget` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `companies`
--
ALTER TABLE `companies`
  MODIFY `id_company` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `courses`
--
ALTER TABLE `courses`
  MODIFY `id_course` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id_delivery` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `devices`
--
ALTER TABLE `devices`
  MODIFY `id_device` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `emblems`
--
ALTER TABLE `emblems`
  MODIFY `id_emblem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grade`
--
ALTER TABLE `grade`
  MODIFY `id_grade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `impacts`
--
ALTER TABLE `impacts`
  MODIFY `id_impact` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `interventions`
--
ALTER TABLE `interventions`
  MODIFY `id_intervention` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id_inventory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `probabilities`
--
ALTER TABLE `probabilities`
  MODIFY `id_probability` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `questionnaries`
--
ALTER TABLE `questionnaries`
  MODIFY `id_questionary` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `questions`
--
ALTER TABLE `questions`
  MODIFY `id_question` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id_rating` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recommendations`
--
ALTER TABLE `recommendations`
  MODIFY `id_recommendation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reports`
--
ALTER TABLE `reports`
  MODIFY `id_report` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resources_files`
--
ALTER TABLE `resources_files`
  MODIFY `id_resource_file` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resources_text`
--
ALTER TABLE `resources_text`
  MODIFY `id_resource_text` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resourses_uml`
--
ALTER TABLE `resourses_uml`
  MODIFY `id_resource_uml` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `results`
--
ALTER TABLE `results`
  MODIFY `id_result` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `risks`
--
ALTER TABLE `risks`
  MODIFY `id_risk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id_task` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `task_budget`
--
ALTER TABLE `task_budget`
  MODIFY `id_task_budget` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `types_measures`
--
ALTER TABLE `types_measures`
  MODIFY `id_type_measure` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `type_device`
--
ALTER TABLE `type_device`
  MODIFY `id_type_device` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user_courses`
--
ALTER TABLE `user_courses`
  MODIFY `id_user_course` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_emblems`
--
ALTER TABLE `user_emblems`
  MODIFY `id_user_emblem` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id_course`);

--
-- Filtros para la tabla `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`id_question`) REFERENCES `questions` (`id_question`);

--
-- Filtros para la tabla `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `deliveries_ibfk_1` FOREIGN KEY (`id_activity`) REFERENCES `activities` (`id_activity`),
  ADD CONSTRAINT `deliveries_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Filtros para la tabla `devices`
--
ALTER TABLE `devices`
  ADD CONSTRAINT `devices_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type_device` (`id_type_device`),
  ADD CONSTRAINT `devices_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Filtros para la tabla `emblems`
--
ALTER TABLE `emblems`
  ADD CONSTRAINT `emblems_ibfk_1` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id_course`);

--
-- Filtros para la tabla `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Filtros para la tabla `impacts`
--
ALTER TABLE `impacts`
  ADD CONSTRAINT `impacts_ibfk_1` FOREIGN KEY (`id_answer`) REFERENCES `answers` (`id_answer`);

--
-- Filtros para la tabla `interventions`
--
ALTER TABLE `interventions`
  ADD CONSTRAINT `interventions_ibfk_1` FOREIGN KEY (`id_answer`) REFERENCES `answers` (`id_answer`);

--
-- Filtros para la tabla `inventories`
--
ALTER TABLE `inventories`
  ADD CONSTRAINT `inventories_ibfk_1` FOREIGN KEY (`id_device`) REFERENCES `devices` (`id_device`);

--
-- Filtros para la tabla `probabilities`
--
ALTER TABLE `probabilities`
  ADD CONSTRAINT `probabilities_ibfk_1` FOREIGN KEY (`id_answer`) REFERENCES `answers` (`id_answer`);

--
-- Filtros para la tabla `questionnaries`
--
ALTER TABLE `questionnaries`
  ADD CONSTRAINT `questionnaries_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Filtros para la tabla `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`id_questionary`) REFERENCES `questionnaries` (`id_questionary`);

--
-- Filtros para la tabla `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id_course`);

--
-- Filtros para la tabla `recommendations`
--
ALTER TABLE `recommendations`
  ADD CONSTRAINT `recommendations_ibfk_1` FOREIGN KEY (`id_answer`) REFERENCES `answers` (`id_answer`);

--
-- Filtros para la tabla `resources_files`
--
ALTER TABLE `resources_files`
  ADD CONSTRAINT `resources_files_ibfk_1` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id_course`);

--
-- Filtros para la tabla `resources_text`
--
ALTER TABLE `resources_text`
  ADD CONSTRAINT `resources_text_ibfk_1` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id_course`);

--
-- Filtros para la tabla `resourses_uml`
--
ALTER TABLE `resourses_uml`
  ADD CONSTRAINT `resourses_uml_ibfk_1` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id_course`);

--
-- Filtros para la tabla `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`id_answer`) REFERENCES `answers` (`id_answer`),
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`id_report`) REFERENCES `reports` (`id_report`);

--
-- Filtros para la tabla `risks`
--
ALTER TABLE `risks`
  ADD CONSTRAINT `risks_ibfk_1` FOREIGN KEY (`id_answer`) REFERENCES `answers` (`id_answer`);

--
-- Filtros para la tabla `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`id_questionary`) REFERENCES `questionnaries` (`id_questionary`),
  ADD CONSTRAINT `tasks_ibfk_3` FOREIGN KEY (`id_recommendation`) REFERENCES `recommendations` (`id_recommendation`);

--
-- Filtros para la tabla `task_budget`
--
ALTER TABLE `task_budget`
  ADD CONSTRAINT `task_budget_ibfk_1` FOREIGN KEY (`id_task`) REFERENCES `tasks` (`id_task`),
  ADD CONSTRAINT `task_budget_ibfk_2` FOREIGN KEY (`id_budget`) REFERENCES `budgets` (`id_budget`);

--
-- Filtros para la tabla `types_measures`
--
ALTER TABLE `types_measures`
  ADD CONSTRAINT `types_measures_ibfk_1` FOREIGN KEY (`id_answer`) REFERENCES `answers` (`id_answer`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id_company`);

--
-- Filtros para la tabla `user_courses`
--
ALTER TABLE `user_courses`
  ADD CONSTRAINT `user_courses_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `user_courses_ibfk_2` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id_course`);

--
-- Filtros para la tabla `user_emblems`
--
ALTER TABLE `user_emblems`
  ADD CONSTRAINT `user_emblems_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `user_emblems_ibfk_2` FOREIGN KEY (`id_emblem`) REFERENCES `emblems` (`id_emblem`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
