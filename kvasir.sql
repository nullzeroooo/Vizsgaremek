-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Gép: localhost:3306
-- Létrehozás ideje: 2026. Okt 20. 07:49
-- Kiszolgáló verziója: 5.7.24
-- PHP verzió: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `kvasir`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `bookmarked` tinyint(4) NOT NULL,
  `length` int(11) NOT NULL,
  `language` text NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `curency` enum('Ft','euro','usd') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `course_content`
--

CREATE TABLE `course_content` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `rate` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `subcription`
--

CREATE TABLE `subcription` (
  `id` int(11) NOT NULL,
  `is_subcribed` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `names` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tag_x_course`
--

CREATE TABLE `tag_x_course` (
  `id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `topic`
--

CREATE TABLE `topic` (
  `id` int(11) NOT NULL,
  `names` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `subcription_id` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_teacher` (`teacher_id`),
  ADD KEY `fk_topic` (`topic_id`),
  ADD KEY `fk_content` (`content_id`);

--
-- A tábla indexei `course_content`
--
ALTER TABLE `course_content`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_course_review` (`course_id`),
  ADD KEY `fk_user_review` (`user_id`);

--
-- A tábla indexei `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `subcription`
--
ALTER TABLE `subcription`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `tag_x_course`
--
ALTER TABLE `tag_x_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tag` (`tag_id`),
  ADD KEY `fk_course` (`course_id`);

--
-- A tábla indexei `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_role` (`role_id`),
  ADD KEY `fk_subcription` (`subcription_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `course_content`
--
ALTER TABLE `course_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `subcription`
--
ALTER TABLE `subcription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `tag_x_course`
--
ALTER TABLE `tag_x_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `topic`
--
ALTER TABLE `topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `fk_content` FOREIGN KEY (`content_id`) REFERENCES `course_content` (`id`),
  ADD CONSTRAINT `fk_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `fk_topic` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`);

--
-- Megkötések a táblához `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `fk_course_review` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `fk_user_review` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Megkötések a táblához `tag_x_course`
--
ALTER TABLE `tag_x_course`
  ADD CONSTRAINT `fk_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `fk_tag` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);

--
-- Megkötések a táblához `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `fk_subcription` FOREIGN KEY (`subcription_id`) REFERENCES `subcription` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
