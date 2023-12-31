-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2023 at 12:08 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ytcommentsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `comment` text NOT NULL,
  `createdOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `userID`, `comment`, `createdOn`) VALUES
(1, 2, 'asdfasdfasdf', '2019-07-15 15:40:10'),
(2, 2, 'dfasdfasdf', '2019-07-18 08:15:38'),
(3, 2, 'dfasdfasdf', '2019-07-18 08:15:51'),
(4, 2, 'another one', '2019-07-18 08:25:48'),
(5, 2, 'aaaaaaaaaaaaaa', '2019-07-18 08:27:35'),
(6, 2, 'bbbbbbbbbbb', '2019-07-18 08:28:50'),
(7, 2, 'aaaaaaaaccccvcvvv', '2019-07-18 08:28:56'),
(8, 2, 'zzzzzzzzzzzz', '2019-07-18 08:36:29'),
(9, 2, 'yyyyyyyyyyyyyyyyyy', '2019-07-18 08:36:35'),
(11, 2, 'aaaaaaaaaaaaaaaaaa', '2019-07-18 08:39:11'),
(12, 2, 'aaaaaaaaaaaaa', '2019-07-18 08:43:56'),
(20, 2, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2019-07-25 11:45:59'),
(21, 3, 'Hello world', '2023-12-19 15:54:01');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `commentID` int(11) NOT NULL,
  `comment` text NOT NULL,
  `createdOn` datetime NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `commentID`, `comment`, `createdOn`, `userID`) VALUES
(1, 12, 'reply to 12', '2019-07-18 08:49:07', 2),
(2, 11, 'reply to 11', '2019-07-18 08:52:18', 2),
(18, 1, 'reply to \"reply to 12\"', '2019-07-25 11:45:52', 2),
(19, 20, 'bbbbbbbbbbbb', '2019-07-25 11:46:04', 2),
(30, 21, 'yes good ', '2023-12-19 15:54:17', 3),
(32, 20, 'iuooooooooooooooo', '2023-12-20 00:40:09', 3),
(34, 2, 'ooooooooooooooo', '2023-12-21 18:39:47', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `createdOn`) VALUES
(1, 'dfasdf', 'asdfasdf@live.com', '$2y$10$SqzYz8CNpQkoAE93ZkWmUeCOXqQ5QPNqcGTEyAvU0MD0JnUT19Nz.', '2019-07-15 15:19:51'),
(2, 'Senaid', 'senaid@live.com', '$2y$10$EJyBBoc0sX3n.fYw/PQ5leJuoHYqv2pxOp9w6z3Tixty7x0iAveDO', '2019-07-15 15:25:34'),
(3, 'iman', 'iman@gmail.com', '$2y$10$Vc9qTJ0NhWVhxszmFX1Ccu/BItGe0gwwQQVmFHreYm8h3oVUwH0r.', '2023-12-19 15:53:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commentID` (`commentID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_ibfk_5` FOREIGN KEY (`commentID`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `replies_ibfk_6` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
