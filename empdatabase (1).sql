-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2023 at 04:24 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `empdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DeptID` int(11) NOT NULL,
  `DeptName` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DeptID`, `DeptName`, `Location`) VALUES
(211, 'Sales', 'New York'),
(212, 'Marketing', 'Los Angeles'),
(213, 'IT', 'San Francisco'),
(214, 'Finance', 'Chicago'),
(215, 'Human Resources', 'Dallas'),
(216, 'Research and Development', 'Boston');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmpNo` int(11) NOT NULL,
  `EmpName` varchar(255) NOT NULL,
  `Job` varchar(255) DEFAULT NULL,
  `Mgr` int(11) DEFAULT NULL,
  `HireDate` datetime NOT NULL,
  `Salary` decimal(10,0) DEFAULT NULL,
  `Commission` int(11) DEFAULT NULL,
  `DeptID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmpNo`, `EmpName`, `Job`, `Mgr`, `HireDate`, `Salary`, `Commission`, `DeptID`) VALUES
(1, 'John Doe', 'Manager', NULL, '2023-01-01 00:00:00', 60000, NULL, 211),
(2, 'Jane Smith', 'Developer', 1, '2023-02-15 00:00:00', 3500, 2000, 213),
(3, 'Bob Johnson', 'Analyst', 1, '1979-03-20 00:00:00', 3000, NULL, 212),
(4, 'Alice Brown', 'Designer', 1, '2023-04-10 00:00:00', 5000, 1500, 212),
(5, 'Charlie Green', 'Salesperson', 1, '2014-05-05 00:00:00', 2400, 3000, 211),
(6, 'Eva White', 'HR', NULL, '2023-06-15 00:00:00', 52000, NULL, 215),
(7, 'David Lee', 'Clerk', 2, '2023-07-20 00:00:00', 47000, NULL, 212),
(8, 'Grace Miller', 'Accountant', 0, '2023-08-12 00:00:00', 58000, 2000, 214),
(9, 'Frank Turner', 'IT', 3, '2023-09-25 00:00:00', 1500, NULL, 213),
(10, 'Olivia Taylor', 'Sales Manager', 0, '2023-10-18 00:00:00', 65000, 4000, 211);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DeptID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmpNo`),
  ADD KEY `DeptID` (`DeptID`),
  ADD KEY `FK_Mgr` (`Mgr`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `FK_Mgr` FOREIGN KEY (`Mgr`) REFERENCES `employee` (`EmpNo`),
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DeptID`) REFERENCES `department` (`DeptID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
