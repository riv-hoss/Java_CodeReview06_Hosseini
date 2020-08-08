-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 08, 2020 at 01:51 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `delivery_Amin_Hosseini`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `country` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `postal_code` int(11) NOT NULL,
  `house_number` int(11) NOT NULL,
  `door_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `country`, `city`, `street`, `postal_code`, `house_number`, `door_number`) VALUES
(1, 'Austria', 'Graz', 'Java-Gasse', 22334, 12, 21),
(2, 'Austria', 'Vienna', 'NotStrasse', 1050, 33, 56),
(3, 'Austria', 'Salzburt', 'Sixth Ave.', 889890, 21, 44),
(4, 'Austria', 'Vienna', 'Sesemi-Tur', 1120, 12, 12),
(5, 'Austria', 'Salzburg', 'SQL-Platz', 3879897, 4, 90),
(6, 'Austria', 'Linz', 'Meiner-Gasse', 4455, 1, 23);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_processes`
--

CREATE TABLE `delivery_processes` (
  `id` int(11) NOT NULL,
  `parcel_id` int(11) NOT NULL,
  `receiver_name` varchar(100) NOT NULL,
  `receiver_address_id` int(11) NOT NULL,
  `received_date` datetime DEFAULT NULL,
  `delivery_status` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery_processes`
--

INSERT INTO `delivery_processes` (`id`, `parcel_id`, `receiver_name`, `receiver_address_id`, `received_date`, `delivery_status`) VALUES
(1, 1, 'Jose Salsa', 4, '2020-07-29 17:03:11', b'1'),
(2, 2, 'Jim Jam', 5, '2019-02-17 05:16:12', b'1'),
(3, 3, 'Sam Mendez', 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `f_name` varchar(100) NOT NULL,
  `l_name` varchar(100) NOT NULL,
  `office_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `f_name`, `l_name`, `office_id`) VALUES
(1, 'Clint', 'EastBush', 2),
(2, 'Tom', 'Softy', 1),
(3, 'Aa', 'Bb', 3),
(4, 'Bob', 'Marly', 2),
(5, 'Tim', 'Coke', 1);

-- --------------------------------------------------------

--
-- Table structure for table `parcels`
--

CREATE TABLE `parcels` (
  `id` int(11) NOT NULL,
  `description` varchar(250) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `sender_name` varchar(100) NOT NULL,
  `sender_address_id` int(11) NOT NULL,
  `deposit_date` datetime NOT NULL,
  `pickup_location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parcels`
--

INSERT INTO `parcels` (`id`, `description`, `employee_id`, `sender_name`, `sender_address_id`, `deposit_date`, `pickup_location_id`) VALUES
(1, 'Fragile', 1, 'Joe Pesci', 1, '2020-07-21 12:12:12', 1),
(2, 'IMP', 3, 'Robert De Niro', 2, '2019-02-12 08:02:30', 3),
(3, 'EXP', 5, 'Rick Dalton', 3, '2012-01-17 21:20:42', 2);

-- --------------------------------------------------------

--
-- Table structure for table `post_offices`
--

CREATE TABLE `post_offices` (
  `id` int(11) NOT NULL,
  `country` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `postal_code` int(11) NOT NULL,
  `building_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post_offices`
--

INSERT INTO `post_offices` (`id`, `country`, `city`, `street`, `postal_code`, `building_number`) VALUES
(1, 'Austria', 'Vienna', 'zz-platz', 1030, 10),
(2, 'Austria', 'Linz', 'Traum Strasse', 1050, 23),
(3, 'Austria', 'Salzburg', 'Rest Ave.', 2378, 34);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_processes`
--
ALTER TABLE `delivery_processes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parcel_id` (`parcel_id`),
  ADD KEY `receiver_address_id` (`receiver_address_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `office_id` (`office_id`);

--
-- Indexes for table `parcels`
--
ALTER TABLE `parcels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `sender_address_id` (`sender_address_id`),
  ADD KEY `pickup_location_id` (`pickup_location_id`);

--
-- Indexes for table `post_offices`
--
ALTER TABLE `post_offices`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `delivery_processes`
--
ALTER TABLE `delivery_processes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `parcels`
--
ALTER TABLE `parcels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `post_offices`
--
ALTER TABLE `post_offices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery_processes`
--
ALTER TABLE `delivery_processes`
  ADD CONSTRAINT `delivery_processes_ibfk_1` FOREIGN KEY (`parcel_id`) REFERENCES `parcels` (`id`),
  ADD CONSTRAINT `delivery_processes_ibfk_2` FOREIGN KEY (`receiver_address_id`) REFERENCES `address` (`id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `post_offices` (`id`);

--
-- Constraints for table `parcels`
--
ALTER TABLE `parcels`
  ADD CONSTRAINT `parcels_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `parcels_ibfk_2` FOREIGN KEY (`sender_address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `parcels_ibfk_3` FOREIGN KEY (`pickup_location_id`) REFERENCES `post_offices` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
