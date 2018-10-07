-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 07, 2018 at 05:44 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `disastermanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int(8) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contact_form`
--

DROP TABLE IF EXISTS `contact_form`;
CREATE TABLE IF NOT EXISTS `contact_form` (
  `contact_form_id` int(8) NOT NULL,
  `founders` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `linkedin` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contact_info`
--

DROP TABLE IF EXISTS `contact_info`;
CREATE TABLE IF NOT EXISTS `contact_info` (
  `email` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `contact_id` int(8) NOT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `day`
--

DROP TABLE IF EXISTS `day`;
CREATE TABLE IF NOT EXISTS `day` (
  `day_id` int(8) NOT NULL,
  `day_type` char(20) NOT NULL,
  PRIMARY KEY (`day_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `disaster_type`
--

DROP TABLE IF EXISTS `disaster_type`;
CREATE TABLE IF NOT EXISTS `disaster_type` (
  `disaster_id` int(8) NOT NULL,
  `disaster_type` varchar(255) NOT NULL,
  PRIMARY KEY (`disaster_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `donation_form`
--

DROP TABLE IF EXISTS `donation_form`;
CREATE TABLE IF NOT EXISTS `donation_form` (
  `donor_id` int(8) NOT NULL,
  `amount` float NOT NULL,
  `donor_type_fk` int(8) NOT NULL,
  `donor_name` varchar(255) NOT NULL,
  PRIMARY KEY (`donor_id`),
  KEY `donor_type_fk` (`donor_type_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `donor_type`
--

DROP TABLE IF EXISTS `donor_type`;
CREATE TABLE IF NOT EXISTS `donor_type` (
  `donor_id` int(11) NOT NULL,
  `volunteer_fk` int(8) NOT NULL,
  `organization_fk` int(8) NOT NULL,
  PRIMARY KEY (`donor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `local_resource_form`
--

DROP TABLE IF EXISTS `local_resource_form`;
CREATE TABLE IF NOT EXISTS `local_resource_form` (
  `local_resource_form_id` int(8) NOT NULL,
  `location_scope` text NOT NULL,
  `resource_provider_fk` int(8) NOT NULL,
  `contact_info_fk` int(8) NOT NULL,
  `disaster_fk` int(8) NOT NULL,
  PRIMARY KEY (`local_resource_form_id`),
  KEY `resource_provider_fk` (`resource_provider_fk`),
  KEY `contact_info_fk` (`contact_info_fk`),
  KEY `disaster_fk` (`disaster_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `organization_form`
--

DROP TABLE IF EXISTS `organization_form`;
CREATE TABLE IF NOT EXISTS `organization_form` (
  `organization_id` int(8) NOT NULL,
  `organization_name_fk` int(8) NOT NULL,
  `location_scope` text NOT NULL,
  `disaster_fk` int(8) NOT NULL,
  `resource_fk` int(8) NOT NULL,
  `contact_fk` int(8) NOT NULL,
  `address_fk` int(8) NOT NULL,
  PRIMARY KEY (`organization_id`),
  KEY `disaster_fk` (`disaster_fk`),
  KEY `resource_fk` (`resource_fk`),
  KEY `contact_fk` (`contact_fk`),
  KEY `address_fk` (`address_fk`),
  KEY `organization_name_fk` (`organization_name_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `organization_name`
--

DROP TABLE IF EXISTS `organization_name`;
CREATE TABLE IF NOT EXISTS `organization_name` (
  `org_id` int(8) NOT NULL,
  `org_name` varchar(255) NOT NULL,
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resource_provider`
--

DROP TABLE IF EXISTS `resource_provider`;
CREATE TABLE IF NOT EXISTS `resource_provider` (
  `resource_provider_id` int(8) NOT NULL,
  `resource_provider_type` varchar(255) NOT NULL,
  PRIMARY KEY (`resource_provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resource_type`
--

DROP TABLE IF EXISTS `resource_type`;
CREATE TABLE IF NOT EXISTS `resource_type` (
  `resource_id` int(8) NOT NULL,
  `resource_type` varchar(255) NOT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
CREATE TABLE IF NOT EXISTS `skill` (
  `skill_id` int(8) NOT NULL,
  `skill_type` varchar(255) NOT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `volunteer_form`
--

DROP TABLE IF EXISTS `volunteer_form`;
CREATE TABLE IF NOT EXISTS `volunteer_form` (
  `volunteer_id` int(8) NOT NULL,
  `contact_fk` int(8) NOT NULL,
  `location_scope` text NOT NULL,
  `skill_fk` int(8) NOT NULL,
  `password` int(8) NOT NULL,
  `street_address` varchar(255) NOT NULL,
  `day_fk` int(8) NOT NULL,
  `organization_name_fk` int(8) NOT NULL,
  `resource_fk` int(8) NOT NULL,
  `recruited` char(1) NOT NULL DEFAULT 'N',
  `volunteer_name` varchar(255) NOT NULL,
  PRIMARY KEY (`volunteer_id`),
  KEY `contact_fk` (`contact_fk`),
  KEY `skill_fk` (`skill_fk`),
  KEY `day` (`day_fk`),
  KEY `organization_name_fk` (`organization_name_fk`),
  KEY `resource_fk` (`resource_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `donation_form`
--
ALTER TABLE `donation_form`
  ADD CONSTRAINT `donation_form_ibfk_1` FOREIGN KEY (`donor_type_fk`) REFERENCES `donor_type` (`donor_id`) ON UPDATE CASCADE;

--
-- Constraints for table `local_resource_form`
--
ALTER TABLE `local_resource_form`
  ADD CONSTRAINT `local_resource_form_ibfk_1` FOREIGN KEY (`contact_info_fk`) REFERENCES `contact_info` (`contact_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `local_resource_form_ibfk_2` FOREIGN KEY (`resource_provider_fk`) REFERENCES `resource_provider` (`resource_provider_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `local_resource_form_ibfk_3` FOREIGN KEY (`disaster_fk`) REFERENCES `disaster_type` (`disaster_id`) ON UPDATE CASCADE;

--
-- Constraints for table `organization_form`
--
ALTER TABLE `organization_form`
  ADD CONSTRAINT `organization_form_ibfk_1` FOREIGN KEY (`disaster_fk`) REFERENCES `disaster_type` (`disaster_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `organization_form_ibfk_2` FOREIGN KEY (`resource_fk`) REFERENCES `resource_type` (`resource_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `organization_form_ibfk_3` FOREIGN KEY (`contact_fk`) REFERENCES `contact_info` (`contact_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `organization_form_ibfk_4` FOREIGN KEY (`address_fk`) REFERENCES `address` (`address_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `organization_form_ibfk_5` FOREIGN KEY (`organization_name_fk`) REFERENCES `organization_name` (`org_id`) ON UPDATE CASCADE;

--
-- Constraints for table `volunteer_form`
--
ALTER TABLE `volunteer_form`
  ADD CONSTRAINT `volunteer_form_ibfk_1` FOREIGN KEY (`contact_fk`) REFERENCES `contact_info` (`contact_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `volunteer_form_ibfk_4` FOREIGN KEY (`skill_fk`) REFERENCES `skill` (`skill_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `volunteer_form_ibfk_5` FOREIGN KEY (`day_fk`) REFERENCES `day` (`day_id`),
  ADD CONSTRAINT `volunteer_form_ibfk_6` FOREIGN KEY (`organization_name_fk`) REFERENCES `organization_name` (`org_id`),
  ADD CONSTRAINT `volunteer_form_ibfk_7` FOREIGN KEY (`resource_fk`) REFERENCES `resource_type` (`resource_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
