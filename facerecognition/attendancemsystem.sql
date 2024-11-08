-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2024 at 08:22 AM
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
-- Database: `attendancemsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `emailAddress` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`Id`, `firstName`, `lastName`, `emailAddress`, `password`) VALUES
(1, 'Admin', '', 'admin', 'c670ddc55c979ea11545f3d52d1b9f5f');

-- --------------------------------------------------------

--
-- Table structure for table `tblattendance`
--

CREATE TABLE `tblattendance` (
  `attendanceID` int(50) NOT NULL,
  `studentRegistrationNumber` varchar(100) NOT NULL,
  `course` varchar(100) NOT NULL,
  `attendanceStatus` varchar(100) NOT NULL,
  `dateMarked` date NOT NULL,
  `unit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcourse`
--

CREATE TABLE `tblcourse` (
  `ID` int(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `facultyID` int(50) NOT NULL,
  `dateCreated` date NOT NULL,
  `courseCode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcourse`
--

INSERT INTO `tblcourse` (`ID`, `name`, `facultyID`, `dateCreated`, `courseCode`) VALUES
(19, 'BS Information Technology', 17, '2024-06-15', '1'),
(20, 'BS Agriculture', 18, '2024-06-15', '2');

-- --------------------------------------------------------

--
-- Table structure for table `tblfaculty`
--

CREATE TABLE `tblfaculty` (
  `Id` int(10) NOT NULL,
  `facultyName` varchar(255) NOT NULL,
  `facultyCode` varchar(50) NOT NULL,
  `dateRegistered` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblfaculty`
--

INSERT INTO `tblfaculty` (`Id`, `facultyName`, `facultyCode`, `dateRegistered`) VALUES
(18, 'College of Agriculture', '2', '2024-06-15'),
(17, 'College of Information Technology', '1', '2024-06-15');

-- --------------------------------------------------------

--
-- Table structure for table `tbllecture`
--

CREATE TABLE `tbllecture` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phoneNo` varchar(50) NOT NULL,
  `facultyCode` varchar(50) NOT NULL,
  `dateCreated` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbllecture`
--

INSERT INTO `tbllecture` (`Id`, `firstName`, `lastName`, `emailAddress`, `password`, `phoneNo`, `facultyCode`, `dateCreated`) VALUES
(23, 'Instructor', 'Instructor', 'instructor', '5f4dcc3b5aa765d61d8327deb882cf99', '1231231', '1', '2024-06-15');

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `registrationNumber` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `faculty` varchar(10) NOT NULL,
  `courseCode` varchar(20) NOT NULL,
  `studentImage1` varchar(300) NOT NULL,
  `studentImage2` varchar(300) NOT NULL,
  `dateRegistered` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`Id`, `firstName`, `lastName`, `registrationNumber`, `email`, `faculty`, `courseCode`, `studentImage1`, `studentImage2`, `dateRegistered`) VALUES
(133, 'Student', '2', '222222222', 'galahan1987@gmail.com', '1', '1', '222222222_image1.png', '222222222_image2.png', '2024-06-15'),
(132, 'Student', '1', '111111111', 'asd@asd.asd', '1', '1', '111111111_image1.png', '111111111_image2.png', '2024-06-15');

-- --------------------------------------------------------

--
-- Table structure for table `tblunit`
--

CREATE TABLE `tblunit` (
  `ID` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `unitCode` varchar(50) NOT NULL,
  `courseID` varchar(50) NOT NULL,
  `dateCreated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblunit`
--

INSERT INTO `tblunit` (`ID`, `name`, `unitCode`, `courseID`, `dateCreated`) VALUES
(9, 'Readings in Phil Hist', 'RPH-101', '19', '2024-06-15'),
(10, 'Math', 'Math-101', '19', '2024-06-15');

-- --------------------------------------------------------

--
-- Table structure for table `tblvenue`
--

CREATE TABLE `tblvenue` (
  `ID` int(10) NOT NULL,
  `className` varchar(50) NOT NULL,
  `facultyCode` varchar(50) NOT NULL,
  `currentStatus` varchar(50) NOT NULL,
  `capacity` int(10) NOT NULL,
  `classification` varchar(50) NOT NULL,
  `dateCreated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblvenue`
--

INSERT INTO `tblvenue` (`ID`, `className`, `facultyCode`, `currentStatus`, `capacity`, `classification`, `dateCreated`) VALUES
(9, 'Room 1', '1', 'availlable', 30, 'class', '2024-06-15'),
(10, 'Room 2', '1', 'availlable', 30, 'laboratory', '2024-06-15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblattendance`
--
ALTER TABLE `tblattendance`
  ADD PRIMARY KEY (`attendanceID`);

--
-- Indexes for table `tblcourse`
--
ALTER TABLE `tblcourse`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblfaculty`
--
ALTER TABLE `tblfaculty`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tbllecture`
--
ALTER TABLE `tbllecture`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblunit`
--
ALTER TABLE `tblunit`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblvenue`
--
ALTER TABLE `tblvenue`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblattendance`
--
ALTER TABLE `tblattendance`
  MODIFY `attendanceID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=483;

--
-- AUTO_INCREMENT for table `tblcourse`
--
ALTER TABLE `tblcourse`
  MODIFY `ID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tblfaculty`
--
ALTER TABLE `tblfaculty`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbllecture`
--
ALTER TABLE `tbllecture`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `tblunit`
--
ALTER TABLE `tblunit`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblvenue`
--
ALTER TABLE `tblvenue`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
