-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2021 at 03:40 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `interview`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookmark`
--

CREATE TABLE `bookmark` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `ca_article_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookmark`
--

INSERT INTO `bookmark` (`id`, `question_id`, `ca_article_id`, `video_id`, `user_id`, `created_date`) VALUES
(1, 1, 1, 1, 1, '2021-09-18 11:26:59'),
(2, 1, 1, 2, 1, '2021-09-18 11:26:59'),
(3, 1, 1, 2, 2, '2021-09-18 11:26:59');

-- --------------------------------------------------------

--
-- Table structure for table `packages_program_mapping`
--

CREATE TABLE `packages_program_mapping` (
  `id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `program_id` int(11) DEFAULT NULL,
  `excluded_category` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `packages_program_mapping`
--

INSERT INTO `packages_program_mapping` (`id`, `package_id`, `program_id`, `excluded_category`) VALUES
(1, 1, 1, '1'),
(2, 2, 2, '1');

-- --------------------------------------------------------

--
-- Table structure for table `program_video_mapping`
--

CREATE TABLE `program_video_mapping` (
  `id` int(11) NOT NULL,
  `program_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `video_order` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `status` tinyint(2) DEFAULT 1,
  `is_live` tinyint(2) NOT NULL DEFAULT 0,
  `schedule_id` int(11) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `ebook_id` varchar(100) DEFAULT NULL,
  `discussion_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `program_video_mapping`
--

INSERT INTO `program_video_mapping` (`id`, `program_id`, `video_id`, `title`, `video_order`, `start_date`, `status`, `is_live`, `schedule_id`, `test_id`, `ebook_id`, `discussion_link`) VALUES
(1, 1, 1, 'test1', 1, '2021-09-11 18:14:10', 1, 0, 1, 1, NULL, NULL),
(2, 2, 2, 'test1', 1, '2021-09-11 18:14:10', 1, 0, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_detail`
--

CREATE TABLE `transaction_detail` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `transaction_date` timestamp NULL DEFAULT NULL,
  `mode` varchar(50) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `class_mode` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1-Online,2-Classroom',
  `domain_id` int(11) NOT NULL DEFAULT 2,
  `online_merchant` int(11) NOT NULL DEFAULT 1 COMMENT '1-PayuMoney, 2-CcAvenue',
  `status` tinyint(4) DEFAULT 0 COMMENT '0 - Inactive, 1 - Success, 2 - Amount not matched',
  `hash` varchar(500) DEFAULT NULL,
  `source_from` varchar(500) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `reference_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_detail`
--

INSERT INTO `transaction_detail` (`id`, `user_id`, `package_id`, `transaction_id`, `transaction_date`, `mode`, `amount`, `comment`, `class_mode`, `domain_id`, `online_merchant`, `status`, `hash`, `source_from`, `added_by`, `reference_id`) VALUES
(1, 1, 1, '12345678', '2021-09-18 12:42:50', 'COD', '1599', NULL, 1, 2, 1, 0, NULL, NULL, NULL, NULL),
(2, 2, 1, '12345678', '2021-09-18 12:42:50', 'COD', '1599', NULL, 1, 2, 1, 0, NULL, NULL, NULL, NULL),
(3, 1, 2, '12345678', '2021-09-18 12:42:50', 'COD', '1599', NULL, 1, 2, 1, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `domain_id` int(11) DEFAULT 1,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL COMMENT 'Only for Mentor and Faculty',
  `user_type` int(2) DEFAULT 1 COMMENT '0-SuperAdmin,1-Student,2-Staff,4-Admin,5-Teacher,6-Mentor',
  `contact` varchar(20) DEFAULT NULL,
  `gender` varchar(500) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `state` int(5) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `user_avatar_thumb` varchar(500) DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT 0,
  `roll_no` int(11) DEFAULT NULL,
  `upscroll` varchar(100) DEFAULT NULL,
  `facebook_id` varchar(255) NOT NULL,
  `google_id` varchar(255) NOT NULL,
  `mobile_verified` tinyint(4) NOT NULL DEFAULT 0,
  `email_verified` tinyint(4) NOT NULL DEFAULT 0,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_notification_read` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `salt` varchar(255) DEFAULT NULL,
  `reference_id` varchar(100) DEFAULT NULL,
  `custom_rollno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `domain_id`, `username`, `email`, `password`, `fullname`, `display_name`, `user_type`, `contact`, `gender`, `dob`, `state`, `city`, `address`, `user_avatar_thumb`, `activated`, `roll_no`, `upscroll`, `facebook_id`, `google_id`, `mobile_verified`, `email_verified`, `last_login`, `last_notification_read`, `created`, `modified`, `salt`, `reference_id`, `custom_rollno`) VALUES
(1, 1, 'Mohit', 'mohit@gmail.com', '12345', 'Mohit Rawat', 'Mohit', 1, '1234567890', 'Male', '10-06-1997', 1, '1', 'test23', NULL, 0, NULL, NULL, '', '', 0, 0, '2021-09-18 00:00:00', '2021-09-17 00:00:00', '2021-09-17 00:00:00', '2021-09-17 00:00:00', NULL, NULL, NULL),
(2, 1, 'Deepak', 'deepak@gmail.com', '12345', 'Deepak Rawat', 'Deepak', 1, '1234567890', 'Male', '10-06-1997', 1, '1', 'test23', NULL, 0, NULL, NULL, '', '', 0, 0, '2021-09-18 00:00:00', '2021-09-17 00:00:00', '2021-09-17 00:00:00', '2021-09-17 00:00:00', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `program_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT 0,
  `tought_by` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `video_url` varchar(500) DEFAULT NULL,
  `video_type` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `is_premium` tinyint(1) DEFAULT 0,
  `is_featured` tinyint(1) DEFAULT 0,
  `aws_class` tinyint(4) DEFAULT NULL,
  `aws_class_live` tinyint(4) NOT NULL DEFAULT 1,
  `visible_from` timestamp NULL DEFAULT NULL,
  `visible_till` timestamp NULL DEFAULT NULL,
  `added_on` timestamp NULL DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `title`, `program_id`, `category_id`, `tought_by`, `order`, `description`, `duration`, `video_url`, `video_type`, `thumbnail`, `status`, `is_premium`, `is_featured`, `aws_class`, `aws_class_live`, `visible_from`, `visible_till`, `added_on`, `added_by`, `updated_on`, `updated_by`) VALUES
(1, 'Test Video', 1, 1, 'Self', 12, 'Test Description', '1', 'ertyuiopk', 1, 'tyuiopk.jpg', 0, 0, 0, NULL, 1, NULL, NULL, '2021-09-18 11:26:09', NULL, NULL, NULL),
(2, 'Test Video 2', 1, 1, 'Self', 12, 'Test Description', '1', 'ertyuiopk', 1, 'tyuiopk.jpg', 0, 0, 0, NULL, 1, NULL, NULL, '2021-09-18 11:26:09', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages_program_mapping`
--
ALTER TABLE `packages_program_mapping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_video_mapping`
--
ALTER TABLE `program_video_mapping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD KEY `email` (`email`),
  ADD KEY `contact` (`contact`),
  ADD KEY `fullname` (`fullname`),
  ADD KEY `activated` (`activated`),
  ADD KEY `user_type` (`user_type`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookmark`
--
ALTER TABLE `bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `packages_program_mapping`
--
ALTER TABLE `packages_program_mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `program_video_mapping`
--
ALTER TABLE `program_video_mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
