-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2022 at 10:06 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seer`
--

-- --------------------------------------------------------

--
-- Table structure for table `all_courses`
--

CREATE TABLE `all_courses` (
  `c_name` varchar(255) NOT NULL,
  `c_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `all_courses`
--

INSERT INTO `all_courses` (`c_name`, `c_id`) VALUES
('Linear Algebra', 'MATH 2183'),
('Biology for Engineers', 'BIO 3105'),
('Object Oriented Programming', 'CSE 1115'),
('Data Structure and Algorithms I', 'CSE 2215'),
('Database Management Systems', 'CSE 3521'),
('Theory of Computation', 'CSE 2233'),
('Cryptography', 'CSE 4783'),
('Probability and Statistics', 'MATH 2205'),
('Web Programming', 'CSE 4165'),
('Digital Logic Design', 'CSE 1325'),
('Discrete Maths', 'CSE 2213');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `c_name` varchar(255) DEFAULT NULL,
  `section` varchar(1) DEFAULT NULL,
  `sec_id` varchar(15) DEFAULT NULL,
  `student_id` int(9) DEFAULT NULL,
  `teacher_id` int(9) DEFAULT NULL,
  `goal` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`c_name`, `section`, `sec_id`, `student_id`, `teacher_id`, `goal`) VALUES
('Linear Algebra', 'A', NULL, NULL, 123, NULL),
('Data Structure and Algorithms I', 'B', NULL, NULL, 123, NULL),
('Discrete Maths', 'C', NULL, NULL, 123, NULL),
('Linear Algebra', 'A', NULL, 11183070, 123, 'A'),
('Data Structure and Algorithms I', 'B', NULL, 11183070, 123, 'A'),
('Discrete Maths', 'C', NULL, 11183070, 123, 'A'),
('Cryptography', 'B', NULL, NULL, 123, NULL),
('Biology for Engineers', 'D', NULL, 11183021, 123, 'A'),
('Database Management Systems', 'E', NULL, 11183021, 112, 'A'),
('Biology for Engineers', 'D', NULL, 11183013, 123, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `grade` varchar(1) NOT NULL,
  `g_mark` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`grade`, `g_mark`) VALUES
('A', 91);

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `student_id` int(9) NOT NULL,
  `s_name` varchar(255) NOT NULL,
  `teacher_id` int(15) NOT NULL,
  `c_name` varchar(255) NOT NULL,
  `ct1` int(2) DEFAULT NULL,
  `ct2` int(2) DEFAULT NULL,
  `ct3` int(2) DEFAULT NULL,
  `ct4` int(2) DEFAULT NULL,
  `ct5` int(2) DEFAULT NULL,
  `mid` int(2) DEFAULT NULL,
  `final` int(2) DEFAULT NULL,
  `assignment` int(2) DEFAULT NULL,
  `attendance` int(2) DEFAULT NULL,
  `section` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`student_id`, `s_name`, `teacher_id`, `c_name`, `ct1`, `ct2`, `ct3`, `ct4`, `ct5`, `mid`, `final`, `assignment`, `attendance`, `section`) VALUES
(11183013, 'Sadman', 123, 'Biology for Engineers', 12, 12, 4, 14, 0, 24, 34, 5, 5, 'D');

-- --------------------------------------------------------

--
-- Table structure for table `overseer`
--

CREATE TABLE `overseer` (
  `admin_id` int(11) NOT NULL,
  `flag` int(1) NOT NULL,
  `ad_name` varchar(255) NOT NULL,
  `ad_pass` varchar(15) NOT NULL,
  `ad_email` varchar(255) NOT NULL,
  `student_id` int(9) DEFAULT NULL,
  `teacher_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `overseer`
--

INSERT INTO `overseer` (`admin_id`, `flag`, `ad_name`, `ad_pass`, `ad_email`, `student_id`, `teacher_id`) VALUES
(1111, 3, 'asddasd', '1234', 'asdsd@gmail.com', 131233, 1),
(25071999, 3, 'Zyan', 'overseer123', 'zyan.islam99@gmail.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `sec_id` varchar(10) NOT NULL,
  `c_section` varchar(1) NOT NULL,
  `s_mid` int(4) NOT NULL,
  `s_final` int(4) NOT NULL,
  `s_ct` int(4) NOT NULL,
  `student_id` int(9) NOT NULL,
  `teacher_id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`sec_id`, `c_section`, `s_mid`, `s_final`, `s_ct`, `student_id`, `teacher_id`) VALUES
('123', 'a', 12, 32, 12, 11183021, 123);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(9) NOT NULL,
  `flag` int(1) NOT NULL,
  `s_name` varchar(255) NOT NULL,
  `s_email` varchar(255) NOT NULL,
  `s_password` varchar(15) NOT NULL,
  `s_phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `flag`, `s_name`, `s_email`, `s_password`, `s_phone`) VALUES
(11183013, 1, 'Sadman', 'sakib@gmail.com', '456', 1681829883),
(11183021, 1, 'Azwad', 'azwadkhan613@gmail.com', '1234', 1739083971),
(11183050, 1, 'Darius', 'sakibs021@gmail.com', '154', 1739083971),
(11183070, 1, 'Fahad', 'zyan.islam99@gmail.com', '123', 123);

-- --------------------------------------------------------

--
-- Table structure for table `stu_log`
--

CREATE TABLE `stu_log` (
  `student_id` int(9) NOT NULL,
  `s_login_time` time NOT NULL,
  `s_login_date` date NOT NULL,
  `s_logout_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stu_log`
--

INSERT INTO `stu_log` (`student_id`, `s_login_time`, `s_login_date`, `s_logout_time`) VALUES
(11183070, '02:12:23', '2022-05-20', '02:12:54'),
(11183021, '14:01:35', '2022-05-21', '14:02:00'),
(11183013, '14:01:09', '2022-05-21', '14:01:26');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacher_id` int(10) NOT NULL,
  `flag` int(1) NOT NULL,
  `t_name` varchar(255) NOT NULL,
  `t_email` varchar(255) NOT NULL,
  `t_phone` int(11) NOT NULL,
  `t_password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacher_id`, `flag`, `t_name`, `t_email`, `t_phone`, `t_password`) VALUES
(1, 2, 'Sadman ', 'sakibs021@gmail.com', 1642015812, '123'),
(2, 2, 'Sadman ', 'asd@gasjdg.com', 2147483647, '123'),
(112, 2, 'Imam', 'imam@uiu.ac.bd', 1234, '123'),
(123, 2, 'Fahad', 'fahad@uiu.com', 123213123, '1234');

-- --------------------------------------------------------

--
-- Table structure for table `teach_log`
--

CREATE TABLE `teach_log` (
  `teacher_id` int(255) NOT NULL,
  `t_login_time` time NOT NULL,
  `t_login_date` date NOT NULL,
  `t_logout_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teach_log`
--

INSERT INTO `teach_log` (`teacher_id`, `t_login_time`, `t_login_date`, `t_logout_time`) VALUES
(112, '22:49:42', '2022-05-20', '22:50:49'),
(123, '13:54:32', '2022-05-21', '13:58:04');

-- --------------------------------------------------------

--
-- Table structure for table `t_course`
--

CREATE TABLE `t_course` (
  `c_name` varchar(255) NOT NULL,
  `section` varchar(1) NOT NULL,
  `teacher_id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_course`
--

INSERT INTO `t_course` (`c_name`, `section`, `teacher_id`) VALUES
('Biology for Engineers', 'D', 123),
('Database Management Systems', 'E', 112),
('Object Oriented Programming', 'C', 112);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD KEY `student_id` (`student_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD KEY `student_id` (`student_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `overseer`
--
ALTER TABLE `overseer`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `teacher_ini` (`teacher_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD KEY `student_id` (`student_id`),
  ADD KEY `teacher_ini` (`teacher_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `stu_log`
--
ALTER TABLE `stu_log`
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacher_id`);

--
-- Indexes for table `teach_log`
--
ALTER TABLE `teach_log`
  ADD KEY `teacher_ini` (`teacher_id`);

--
-- Indexes for table `t_course`
--
ALTER TABLE `t_course`
  ADD KEY `teacher_id` (`teacher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `teacher_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
