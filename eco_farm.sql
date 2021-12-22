-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2021 at 04:21 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eco farm`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `A_Username` varchar(100) NOT NULL,
  `A_Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`A_Username`, `A_Password`) VALUES
('Aniket', 'Aniket');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `Ca_Id` int(11) NOT NULL,
  `P_Code` int(11) NOT NULL,
  `O_Date` date NOT NULL,
  `Qty` int(11) NOT NULL,
  `Cu_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `C_Id` int(11) NOT NULL,
  `C_Name` varchar(50) NOT NULL,
  `C_Location` varchar(150) NOT NULL,
  `C_Mobile` varchar(15) NOT NULL,
  `C_Date` date NOT NULL,
  `C_Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Cu_Id` int(11) NOT NULL,
  `Cu_Name` varchar(100) NOT NULL,
  `Cu_Location` varchar(100) NOT NULL,
  `Cu_Mobile` varchar(100) NOT NULL,
  `Cu_Username` varchar(100) NOT NULL,
  `Cu_Email` varchar(100) NOT NULL,
  `Cu_Password` varchar(100) NOT NULL,
  `Cu_Security` varchar(200) NOT NULL,
  `Cu_Answer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Cu_Id`, `Cu_Name`, `Cu_Location`, `Cu_Mobile`, `Cu_Username`, `Cu_Email`, `Cu_Password`, `Cu_Security`, `Cu_Answer`) VALUES
(1, 'Aniket', 'Pune', '9763517223', 'Ankii', 'aniketkalambe777@gmail.com', '123', 'Aniket', 'Aniket');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `O_Id` int(11) NOT NULL,
  `O_Date` date NOT NULL,
  `Cu_Id` int(11) NOT NULL,
  `P_Code` int(11) NOT NULL,
  `O_Qunatity` int(11) NOT NULL,
  `O_Bill` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `P_Code` int(11) NOT NULL,
  `P_Category` varchar(100) NOT NULL,
  `P_Name` varchar(100) NOT NULL,
  `P_Price` double NOT NULL,
  `P_Stock` int(11) NOT NULL,
  `P_Description` varchar(100) NOT NULL,
  `P_Image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`P_Code`, `P_Category`, `P_Name`, `P_Price`, `P_Stock`, `P_Description`, `P_Image`) VALUES
(1, 'Vegetables', 'Brinjal', 40, 5, 'This is organic food without using chemicals.', ''),
(2, 'Vegetables', 'Tomato', 50, 5, 'This is organic food without using chemicals.', ''),
(3, 'vege', 'Potato', 10, 20, 'organic', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`A_Username`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`Ca_Id`),
  ADD KEY `Cu_Id` (`Cu_Id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`C_Id`),
  ADD UNIQUE KEY `C_Mobile` (`C_Mobile`,`C_Email`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Cu_Id`),
  ADD UNIQUE KEY `Cu_Mobile` (`Cu_Mobile`,`Cu_Username`),
  ADD UNIQUE KEY `Cu_Email` (`Cu_Email`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`O_Id`),
  ADD KEY `P_Code` (`P_Code`),
  ADD KEY `Cu_Id` (`Cu_Id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`P_Code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `Ca_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `C_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Cu_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `O_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `P_Code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`Cu_Id`) REFERENCES `customer` (`Cu_Id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`Cu_Id`) REFERENCES `customer` (`Cu_Id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`P_Code`) REFERENCES `product` (`P_Code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
