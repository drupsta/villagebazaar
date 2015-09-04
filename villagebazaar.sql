-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2015 at 11:45 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `villagebazaar`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_address`
--

CREATE TABLE IF NOT EXISTS `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `tax_id` varchar(32) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `dungkhag_id` int(3) NOT NULL,
  `geog` varchar(250) NOT NULL,
  `postoffice` varchar(250) NOT NULL,
  `csc_id` int(4) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `oc_address`
--

INSERT INTO `oc_address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `company_id`, `tax_id`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`, `dungkhag_id`, `geog`, `postoffice`, `csc_id`) VALUES
(5, 6, 'Admin', 'Root', '', '', '', 'CST, Rinchending', '', 'Phuentsholing', '211011', 25, 384, 0, '', '', 3),
(6, 7, 'Cec Admin', 'Admin', '', '', '', 'B-30, Sector 62', '', 'Noida', '201307', 99, 0, 0, '', '', 4),
(11, 12, 'ANGEL', 'DIEZ', '', '', '', 'Jawalakhel', '', 'Patan', '112233', 149, 2327, 0, '', '', 4),
(19, 28, 'Tandin', 'Wangchuk', '', '', '', 'CST Rinchending', 'Kharbandi', 'Wamrong', '', 25, 397, 12, 'Kangpara', 'Wamrong PO', 8),
(20, 30, 'Manoj', 'Chhetri', '', '', '', 'CST Rinchending', '', 'Phuentsholing', '', 25, 384, 1, 'Phuentsholing ', 'Phuentsholing GPO', 8);

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(32) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor');

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner`
--

CREATE TABLE IF NOT EXISTS `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Samsung Tab', 1),
(8, 'Manufacturers', 1),
(9, 'slide', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=137 ;

--
-- Dumping data for table `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`) VALUES
(54, 7, 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'data/demo/samsung_banner.jpg'),
(77, 6, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'data/demo/hp_banner.jpg'),
(93, 8, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=10', 'data/canon_logo.jpg'),
(136, 9, '', 'data/Resized-DIXL8.jpg'),
(135, 9, '', 'data/Resized-VHWII.jpg'),
(92, 8, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=8', 'data/demo/apple_logo.jpg'),
(133, 9, '', 'data/new.jpg'),
(134, 9, '', 'data/Resized-2DHNV.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image_description`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner_image_description`
--

INSERT INTO `oc_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(54, 1, 7, 'Samsung Tab 10.1'),
(77, 1, 6, 'HP Banner'),
(93, 1, 8, 'fasso'),
(92, 1, 8, 'indian handicraft'),
(136, 1, 9, 'Agriculture'),
(135, 1, 9, 'Electronic Items'),
(134, 1, 9, 'Furnitures'),
(133, 1, 9, 'Handicrafts');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category`
--

CREATE TABLE IF NOT EXISTS `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=337 ;

--
-- Dumping data for table `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(266, '', 0, 0, 0, 0, 1, '2015-04-11 20:52:44', '2015-04-11 20:52:44'),
(267, '', 0, 0, 0, 0, 1, '2015-04-11 20:54:20', '2015-04-11 20:54:34'),
(268, '', 0, 0, 0, 0, 1, '2015-04-11 20:55:08', '2015-04-11 20:55:08'),
(269, '', 0, 0, 0, 0, 1, '2015-04-11 20:55:39', '2015-04-11 20:55:39'),
(270, '', 0, 0, 0, 0, 1, '2015-04-11 20:56:06', '2015-04-11 20:56:06'),
(271, '', 0, 0, 0, 0, 1, '2015-04-11 20:56:40', '2015-04-11 20:56:40'),
(272, '', 0, 0, 0, 0, 1, '2015-04-11 20:57:47', '2015-04-11 20:57:47'),
(273, '', 0, 0, 0, 0, 1, '2015-04-11 20:58:28', '2015-04-11 20:58:28'),
(274, '', 0, 0, 0, 0, 1, '2015-04-11 20:58:57', '2015-04-11 20:58:57'),
(275, '', 0, 0, 0, 0, 1, '2015-04-11 20:59:34', '2015-04-11 20:59:34'),
(276, '', 0, 0, 0, 0, 1, '2015-04-11 22:26:14', '2015-04-11 22:26:14'),
(277, '', 266, 0, 0, 0, 1, '2015-04-13 23:35:24', '2015-04-13 23:35:24'),
(278, 'data/pulse.jpg', 266, 0, 0, 0, 1, '2015-04-13 23:59:14', '2015-04-14 11:06:11'),
(279, '', 266, 0, 0, 0, 1, '2015-04-13 23:59:46', '2015-04-13 23:59:46'),
(280, '', 266, 0, 0, 0, 1, '2015-04-14 00:00:26', '2015-04-14 00:00:26'),
(281, '', 268, 0, 0, 0, 1, '2015-04-14 00:01:03', '2015-04-14 00:01:03'),
(282, '', 267, 0, 0, 0, 1, '2015-04-14 00:01:55', '2015-04-14 00:01:55'),
(283, '', 267, 0, 0, 0, 1, '2015-04-14 00:02:27', '2015-04-14 00:02:27'),
(284, '', 0, 0, 0, 0, 0, '2015-04-14 10:55:14', '2015-04-14 10:55:14'),
(285, 'data/compaq_presario.jpg', 275, 0, 0, 0, 0, '2015-04-14 11:09:30', '2015-04-14 11:09:30'),
(286, '', 267, 0, 0, 0, 1, '2015-04-14 11:11:09', '2015-04-14 11:11:09'),
(287, '', 267, 0, 0, 0, 1, '2015-04-14 11:11:37', '2015-04-14 11:11:37'),
(288, '', 267, 0, 0, 0, 1, '2015-04-14 11:12:03', '2015-04-14 11:12:03'),
(289, '', 267, 0, 0, 0, 1, '2015-04-14 11:15:09', '2015-04-14 11:15:09'),
(324, '', 274, 0, 0, 0, 1, '2015-04-14 22:33:22', '2015-04-14 22:33:22'),
(325, '', 274, 0, 0, 0, 1, '2015-04-14 22:33:51', '2015-04-14 22:33:51'),
(326, '', 274, 0, 0, 0, 1, '2015-04-14 22:34:15', '2015-04-14 22:34:15'),
(334, '', 276, 0, 0, 0, 1, '2015-04-14 22:39:32', '2015-04-14 22:39:32'),
(333, '', 276, 0, 0, 0, 1, '2015-04-14 22:39:14', '2015-04-14 22:39:14'),
(332, '', 275, 0, 0, 0, 1, '2015-04-14 22:38:21', '2015-04-14 22:38:21'),
(330, '', 275, 0, 0, 0, 1, '2015-04-14 22:35:45', '2015-04-14 22:35:45'),
(329, '', 275, 0, 0, 0, 1, '2015-04-14 22:35:28', '2015-04-14 22:35:28'),
(328, '', 275, 0, 0, 0, 1, '2015-04-14 22:35:12', '2015-04-14 22:35:12'),
(327, '', 275, 0, 0, 0, 1, '2015-04-14 22:34:47', '2015-04-14 22:34:47'),
(323, '', 301, 0, 0, 0, 1, '2015-04-14 22:32:36', '2015-04-14 22:32:36'),
(322, '', 273, 0, 0, 0, 1, '2015-04-14 22:31:50', '2015-04-14 22:31:50'),
(321, '', 272, 0, 0, 0, 1, '2015-04-14 22:30:27', '2015-04-14 22:30:27'),
(320, '', 272, 0, 0, 0, 1, '2015-04-14 22:30:05', '2015-04-14 22:30:05'),
(319, '', 271, 0, 0, 0, 1, '2015-04-14 22:27:48', '2015-04-14 22:27:48'),
(318, '', 271, 0, 0, 0, 1, '2015-04-14 22:27:26', '2015-04-14 22:27:26'),
(317, '', 271, 0, 0, 0, 1, '2015-04-14 22:27:12', '2015-04-14 22:27:12'),
(316, '', 267, 0, 0, 0, 1, '2015-04-14 22:26:00', '2015-04-14 22:26:00'),
(315, '', 267, 0, 0, 0, 1, '2015-04-14 22:25:41', '2015-04-14 22:25:41'),
(314, '', 267, 0, 0, 0, 1, '2015-04-14 22:25:22', '2015-04-14 22:25:22'),
(313, '', 300, 0, 0, 0, 1, '2015-04-14 22:24:47', '2015-04-14 22:24:47'),
(312, '', 300, 0, 0, 0, 1, '2015-04-14 22:24:32', '2015-04-14 22:24:32'),
(311, '', 300, 0, 0, 0, 1, '2015-04-14 22:24:07', '2015-04-14 22:24:07'),
(310, '', 300, 0, 0, 0, 1, '2015-04-14 22:23:40', '2015-04-14 22:23:40'),
(309, '', 299, 0, 0, 0, 1, '2015-04-14 22:23:14', '2015-04-14 22:23:14'),
(308, '', 298, 0, 0, 0, 1, '2015-04-14 22:22:18', '2015-04-14 22:22:18'),
(307, '', 298, 0, 0, 0, 1, '2015-04-14 22:22:02', '2015-04-14 22:22:02'),
(306, '', 297, 0, 0, 0, 1, '2015-04-14 22:21:16', '2015-04-14 22:21:16'),
(305, '', 296, 0, 0, 0, 1, '2015-04-14 22:20:43', '2015-04-14 22:20:43'),
(304, '', 296, 0, 0, 0, 1, '2015-04-14 22:20:27', '2015-04-14 22:20:27'),
(303, '', 296, 0, 0, 0, 1, '2015-04-14 22:14:52', '2015-04-14 22:14:52'),
(302, '', 296, 0, 0, 0, 1, '2015-04-14 22:14:31', '2015-04-14 22:14:31'),
(301, '', 0, 0, 0, 0, 1, '2015-04-14 22:13:33', '2015-04-14 22:13:33'),
(300, '', 0, 0, 0, 0, 1, '2015-04-14 22:12:39', '2015-04-14 22:12:39'),
(299, '', 0, 0, 0, 0, 1, '2015-04-14 22:11:45', '2015-04-14 22:11:45'),
(298, '', 0, 0, 0, 0, 1, '2015-04-14 22:11:23', '2015-04-14 22:11:23'),
(297, '', 0, 0, 0, 0, 1, '2015-04-14 22:10:54', '2015-04-14 22:10:54'),
(296, '', 0, 0, 0, 0, 1, '2015-04-14 22:10:28', '2015-04-14 22:10:28'),
(295, '', 271, 0, 0, 0, 1, '2015-04-14 13:30:38', '2015-04-14 13:30:38'),
(294, '', 0, 0, 0, 0, 0, '2015-04-14 13:29:25', '2015-04-14 13:29:25'),
(293, '', 270, 0, 0, 0, 1, '2015-04-14 11:17:06', '2015-04-14 11:17:06'),
(292, '', 270, 0, 0, 0, 1, '2015-04-14 11:16:43', '2015-04-14 11:16:43'),
(291, '', 270, 0, 0, 0, 1, '2015-04-14 11:16:31', '2015-04-14 11:16:31'),
(290, '', 269, 0, 0, 0, 1, '2015-04-14 11:15:50', '2015-04-14 11:15:50'),
(265, 'data/Metallic-Handicraft-Items.jpg', 0, 0, 0, 0, 0, '2015-04-11 20:10:29', '2015-04-11 20:31:09');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_description`
--

CREATE TABLE IF NOT EXISTS `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES
(334, 1, 'Sculptures', '&lt;p&gt;Sculptures&lt;/p&gt;\r\n', '', ''),
(277, 1, 'Pesticides', '&lt;p&gt;Pesticides&lt;/p&gt;\r\n', '', ''),
(266, 1, 'Agriculture', '&lt;p&gt;Agriculture&lt;/p&gt;\r\n', '', ''),
(267, 1, 'Furnitures', '&lt;p&gt;Furnitures&lt;/p&gt;\r\n', '', ''),
(268, 1, 'Handicrafts', '&lt;p&gt;Handicrafts&lt;/p&gt;\r\n', '', ''),
(269, 1, 'Groceries', '&lt;p&gt;Groceries&lt;/p&gt;\r\n', '', ''),
(270, 1, 'Handlooms', '&lt;p&gt;Handlooms&lt;/p&gt;\r\n', '', ''),
(271, 1, 'Real Estate', '&lt;p&gt;Real Estate&lt;/p&gt;\r\n', '', ''),
(272, 1, 'Services', '&lt;p&gt;Services&lt;/p&gt;\r\n', '', ''),
(273, 1, 'Sports &amp; Recreation', '&lt;p&gt;Sports and Recreation&lt;/p&gt;\r\n', '', ''),
(274, 1, 'Tools and Materials', '&lt;p&gt;Tools and Materials&lt;/p&gt;\r\n', '', ''),
(275, 1, 'Vehicles', '&lt;p&gt;Vehicles&lt;/p&gt;\r\n', '', ''),
(276, 1, 'Woodcrafts', '&lt;p&gt;Woodcrafts&lt;/p&gt;\r\n', '', ''),
(326, 1, 'Knifes(Patang)', '&lt;p&gt;Knifes(Patang)&lt;/p&gt;\r\n', '', ''),
(325, 1, 'Spades and shovel', '&lt;p&gt;Spades and shovel&lt;/p&gt;\r\n', '', ''),
(324, 1, 'Firewood', '&lt;p&gt;Firewoods&lt;/p&gt;\r\n', '', ''),
(323, 1, 'Notebooks', '&lt;p&gt;Notebooks&lt;/p&gt;\r\n', '', ''),
(294, 1, 'cdfsdfsd', '&lt;p&gt;dfdfgfdg&lt;/p&gt;\r\n', '', ''),
(322, 1, 'Events and Activities', '&lt;p&gt;Events and Activities&lt;/p&gt;\r\n', '', ''),
(321, 1, 'Rituals', '&lt;p&gt;Rituals&lt;/p&gt;\r\n', '', ''),
(320, 1, 'Astrology', '&lt;p&gt;Astrology&lt;/p&gt;\r\n', '', ''),
(319, 1, 'Flat for Sale', '&lt;p&gt;Flat for Sale&lt;/p&gt;\r\n', '', ''),
(290, 1, 'Pulses', '&lt;p&gt;Pulses&lt;/p&gt;\r\n', '', ''),
(318, 1, 'Land for Sale', '', '', ''),
(317, 1, 'House for Sale', '&lt;p&gt;House for Sale&lt;/p&gt;\r\n', '', ''),
(316, 1, 'Chethri', '&lt;p&gt;Chethri&lt;/p&gt;\r\n', '', ''),
(315, 1, 'Choeshom', '', '', ''),
(314, 1, 'Sofa sets', '', '', ''),
(313, 1, 'Game Consoles', '', '', ''),
(312, 1, 'TV', '', '', ''),
(311, 1, 'Mobiles', '', '', ''),
(310, 1, 'Cameras', '', '', ''),
(309, 1, 'Fragrances', '&lt;p&gt;Fragrances&lt;/p&gt;\r\n', '', ''),
(308, 1, 'Laptops', '&lt;p&gt;Laptops&lt;/p&gt;\r\n', '', ''),
(307, 1, 'Desktops', '&lt;p&gt;Desktops&lt;/p&gt;\r\n', '', ''),
(306, 1, 'Lost &amp; Found', '&lt;p&gt;Lost &amp;amp; Found&lt;/p&gt;\r\n', '', ''),
(305, 1, 'Biography', '&lt;p&gt;Biography&lt;/p&gt;\r\n', '', ''),
(304, 1, 'Religion', '&lt;p&gt;Religion&lt;/p&gt;\r\n', '', ''),
(303, 1, 'History', '&lt;p&gt;History&lt;/p&gt;\r\n', '', ''),
(302, 1, 'Classics', '&lt;p&gt;Classics&lt;/p&gt;\r\n', '', ''),
(301, 1, 'Stationaries', '&lt;p&gt;Stationaries&lt;/p&gt;\r\n', '', ''),
(300, 1, 'Electronics', '&lt;p&gt;Electronics Items&lt;/p&gt;\r\n', '', ''),
(299, 1, 'Cosmetics', '&lt;p&gt;Cosmetics&lt;/p&gt;\r\n', '', ''),
(298, 1, 'Computers &amp; Software', '&lt;p&gt;Computers &amp;amp; Software&lt;/p&gt;\r\n', '', ''),
(297, 1, 'Community', '&lt;p&gt;Community&lt;/p&gt;\r\n', '', ''),
(296, 1, 'Books', '&lt;p&gt;Books&lt;/p&gt;\r\n', '', ''),
(295, 1, 'Apartments for Rent', '&lt;p&gt;Apartments for Rent&lt;/p&gt;\r\n', '', ''),
(293, 1, 'kara', '&lt;p&gt;kara&lt;/p&gt;\r\n', '', ''),
(292, 1, 'Ghos', '&lt;p&gt;Ghos&lt;/p&gt;\r\n', '', ''),
(291, 1, 'Kiras', '&lt;p&gt;Kiras&lt;/p&gt;\r\n', '', ''),
(289, 1, 'Garden Furnitures', '&lt;p&gt;Garden Furnitures&lt;/p&gt;\r\n', '', ''),
(288, 1, 'Decor Accessories', '&lt;p&gt;Decor Accessories&lt;/p&gt;\r\n', '', ''),
(287, 1, 'Computer Tables', '&lt;p&gt;Computer Tables&lt;/p&gt;\r\n', '', ''),
(286, 1, 'Chairs', '&lt;p&gt;Chairs&lt;/p&gt;\r\n', '', ''),
(333, 1, 'Masks', '&lt;p&gt;Masks&lt;/p&gt;\r\n', '', ''),
(283, 1, 'Arts and Antiques', '&lt;p&gt;Arts and Antiques&lt;/p&gt;\r\n', '', ''),
(282, 1, 'Appliances', '&lt;p&gt;Appliances&lt;/p&gt;\r\n', '', ''),
(281, 1, 'Handmade Gifts', '&lt;p&gt;Handmade Gifts&lt;/p&gt;\r\n', '', ''),
(280, 1, 'Fertilizers', '&lt;p&gt;Fertilizers&lt;/p&gt;\r\n', '', ''),
(279, 1, 'Farming Tools', '&lt;p&gt;Farming Tools&lt;/p&gt;\r\n', '', ''),
(278, 1, 'Agro Products', '&lt;p&gt;Agro Products&lt;/p&gt;\r\n', '', ''),
(327, 1, 'Bicylces', '&lt;p&gt;Bicylces&lt;/p&gt;\r\n', '', ''),
(328, 1, 'Two Wheelers', '&lt;p&gt;Two Wheelers&lt;/p&gt;\r\n', '', ''),
(329, 1, 'Used Cars', '&lt;p&gt;Used Cars&lt;/p&gt;\r\n', '', ''),
(330, 1, 'New Cars', '&lt;p&gt;New Cars&lt;/p&gt;\r\n', '', ''),
(332, 1, 'Power Tillers', '&lt;p&gt;Power Tillers&lt;/p&gt;\r\n', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_filter`
--

CREATE TABLE IF NOT EXISTS `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_path`
--

CREATE TABLE IF NOT EXISTS `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(298, 298, 0),
(297, 297, 0),
(299, 299, 0),
(289, 267, 0),
(335, 335, 0),
(334, 334, 1),
(334, 276, 0),
(333, 333, 1),
(333, 276, 0),
(332, 332, 1),
(332, 275, 0),
(331, 331, 0),
(330, 330, 1),
(330, 275, 0),
(329, 329, 1),
(329, 275, 0),
(328, 328, 1),
(328, 275, 0),
(327, 327, 1),
(327, 275, 0),
(326, 326, 1),
(326, 274, 0),
(325, 325, 1),
(325, 274, 0),
(324, 324, 1),
(324, 274, 0),
(323, 323, 1),
(323, 301, 0),
(322, 322, 1),
(322, 273, 0),
(321, 321, 1),
(321, 272, 0),
(320, 320, 1),
(320, 272, 0),
(319, 319, 1),
(319, 271, 0),
(318, 318, 1),
(318, 271, 0),
(317, 317, 1),
(317, 271, 0),
(316, 316, 1),
(316, 267, 0),
(315, 315, 1),
(315, 267, 0),
(314, 314, 1),
(314, 267, 0),
(313, 313, 1),
(313, 300, 0),
(312, 312, 1),
(312, 300, 0),
(311, 311, 1),
(311, 300, 0),
(310, 310, 1),
(310, 300, 0),
(309, 309, 1),
(309, 299, 0),
(308, 308, 1),
(308, 298, 0),
(307, 307, 1),
(307, 298, 0),
(306, 306, 1),
(306, 297, 0),
(305, 305, 1),
(305, 296, 0),
(304, 304, 1),
(304, 296, 0),
(303, 303, 1),
(303, 296, 0),
(302, 302, 1),
(302, 296, 0),
(301, 301, 0),
(300, 300, 0),
(296, 296, 0),
(295, 295, 1),
(295, 271, 0),
(293, 293, 1),
(293, 270, 0),
(292, 292, 1),
(292, 270, 0),
(291, 291, 1),
(291, 270, 0),
(290, 290, 1),
(290, 269, 0),
(289, 289, 1),
(288, 288, 1),
(288, 267, 0),
(287, 287, 1),
(287, 267, 0),
(286, 267, 0),
(286, 286, 1),
(283, 283, 1),
(277, 277, 1),
(277, 266, 0),
(283, 267, 0),
(282, 282, 1),
(282, 267, 0),
(281, 281, 1),
(281, 268, 0),
(280, 280, 1),
(280, 266, 0),
(279, 279, 1),
(279, 266, 0),
(278, 278, 1),
(278, 266, 0),
(275, 275, 0),
(274, 274, 0),
(273, 273, 0),
(270, 270, 0),
(272, 272, 0),
(271, 271, 0),
(269, 269, 0),
(268, 268, 0),
(267, 267, 0),
(266, 266, 0),
(276, 276, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_country`
--

CREATE TABLE IF NOT EXISTS `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=254 ;

--
-- Dumping data for table `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon`
--

CREATE TABLE IF NOT EXISTS `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2011-01-01', '2012-01-01', 10, '10', 1, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2009-03-01', '2009-08-31', 10, '10', 1, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '1970-11-01', '2020-11-01', 100000, '10000', 1, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_category`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_history`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_product`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_csc_detail`
--

CREATE TABLE IF NOT EXISTS `oc_csc_detail` (
  `csc_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `zone_name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`csc_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `oc_csc_detail`
--

INSERT INTO `oc_csc_detail` (`csc_id`, `name`, `address`, `country_id`, `zone_id`, `zone_name`) VALUES
(8, 'Mewang CeC', 'Mewang, Thimphu', 25, 396, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oc_currency`
--

CREATE TABLE IF NOT EXISTS `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Pound Sterling', 'GBP', 'Â£', '', '2', 0.66520000, 1, '2015-04-23 07:28:10'),
(2, 'US Dollar', 'USD', 'Rs.', '', '2', 1.00000000, 1, '2015-04-23 07:28:10'),
(3, 'Euro', 'EUR', '', 'â‚¬', '2', 0.93339998, 1, '2015-04-23 07:28:10'),
(4, 'Ngultrum', 'Nu', 'Nu.', '', '2', 1.00000000, 1, '2015-04-23 07:27:47');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer`
--

CREATE TABLE IF NOT EXISTS `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `country_code` varchar(10) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `std` varchar(6) NOT NULL,
  `landline` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `oc_customer`
--

INSERT INTO `oc_customer` (`customer_id`, `store_id`, `username`, `firstname`, `lastname`, `email`, `country_code`, `telephone`, `std`, `landline`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `customer_group_id`, `ip`, `status`, `approved`, `token`, `date_added`) VALUES
(6, 0, 'Root', 'Admin', 'Root', 'root@gmail.com', '', '9123456789', '', '', '', '8666f71fc82bffe04307c652b10a95507a2a6f33', '2907e2e78', 'a:0:{}', 'a:0:{}', 0, 5, 1, '127.0.0.1', 1, 1, '', '2014-07-23 11:10:39'),
(7, 0, 'Cec', 'Cec Admin', 'admin', 'cec@gmail.com', '', '1234567890', '', '', '', '851296d674b55b070eb9ee2190772551017ff697', '610a6728b', 'a:0:{}', '', 0, 6, 1, '127.0.0.1', 1, 1, '', '2014-07-23 16:54:58'),
(12, 0, 'angel', 'ANGEL', 'DIEZ', 'adiez@dartec.com', '', '9808669609', '', '', '', '233ca216b78735b8e23bb8ce68768016bab5fc8a', '7935af7ed', 'a:0:{}', '', 0, 11, 1, '127.0.0.1', 1, 1, '', '2014-04-17 23:23:11'),
(28, 0, 'Tandin', 'Tandin', 'Wangchuk', 'tandin@cst.edu.bt', '', '17718323', '05', '022342', '', '1abb6c715b12ccd95d780cbc1756f36b0a5181b2', 'bfd0ee731', 'a:0:{}', 'a:0:{}', 0, 19, 1, '127.0.0.1', 1, 1, '', '2015-04-01 22:37:07'),
(29, 0, 'Manoj', 'Manoj', 'Chhetri', 'manojchhetrip@gmail.com', '', '17718323', '', '', '', 'b88f2df596528d41dbb761273a690757bf3feef5', 'c5becbe15', 'a:0:{}', '', 0, 0, 1, '127.0.0.1', 1, 1, '', '2015-04-13 12:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ban_ip`
--

CREATE TABLE IF NOT EXISTS `oc_customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_field`
--

CREATE TABLE IF NOT EXISTS `oc_customer_field` (
  `customer_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `company_id_display` int(1) NOT NULL,
  `company_id_required` int(1) NOT NULL,
  `tax_id_display` int(1) NOT NULL,
  `tax_id_required` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `company_id_display`, `company_id_required`, `tax_id_display`, `tax_id_required`, `sort_order`) VALUES
(1, 0, 1, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_history`
--

CREATE TABLE IF NOT EXISTS `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ip`
--

CREATE TABLE IF NOT EXISTS `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `oc_customer_ip`
--

INSERT INTO `oc_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '220.156.187.4', '2014-07-11 13:13:32'),
(2, 2, '220.156.187.4', '2014-07-11 14:40:19'),
(3, 3, '220.156.187.4', '2014-07-11 16:06:21'),
(4, 3, '184.151.114.157', '2014-07-11 17:24:45'),
(5, 3, '223.184.89.250', '2014-07-11 17:24:50'),
(6, 4, '127.0.0.1', '2014-07-16 11:38:22'),
(7, 3, '127.0.0.1', '2014-07-17 15:01:41'),
(8, 5, '127.0.0.1', '2014-07-22 11:46:42'),
(9, 6, '127.0.0.1', '2014-07-23 11:11:55'),
(10, 7, '127.0.0.1', '2014-07-23 16:55:55'),
(11, 1, '127.0.0.1', '2014-08-04 11:10:24'),
(12, 9, '127.0.0.1', '2014-08-07 11:47:58'),
(13, 10, '127.0.0.1', '2014-08-07 11:56:26'),
(14, 11, '127.0.0.1', '2014-09-24 14:41:25'),
(15, 12, '127.0.0.1', '2014-08-14 16:15:15'),
(16, 23, '127.0.0.1', '2014-08-25 12:51:50'),
(17, 24, '127.0.0.1', '2014-08-28 12:46:21'),
(18, 25, '127.0.0.1', '2014-08-28 12:47:43'),
(19, 27, '127.0.0.1', '2015-03-29 12:01:54'),
(20, 28, '127.0.0.1', '2015-04-01 22:38:05'),
(21, 29, '127.0.0.1', '2015-04-13 12:32:32');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_online`
--

CREATE TABLE IF NOT EXISTS `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_reward`
--

CREATE TABLE IF NOT EXISTS `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  `location` varchar(32) NOT NULL,
  `position` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_to_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download`
--

CREATE TABLE IF NOT EXISTS `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download_description`
--

CREATE TABLE IF NOT EXISTS `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_dungkhag`
--

CREATE TABLE IF NOT EXISTS `oc_dungkhag` (
  `dungkhag_id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`dungkhag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `oc_dungkhag`
--

INSERT INTO `oc_dungkhag` (`dungkhag_id`, `name`, `zone_id`, `code`) VALUES
(1, 'Phuentsholing', 384, NULL),
(2, 'Nanglam', 391, NULL),
(3, 'Lhamoizingkha', 385, NULL),
(4, 'Sombaykha', 387, NULL),
(5, 'Weringla', 389, NULL),
(6, 'Jomotshangkha', 393, NULL),
(7, 'Samdrupcholing', 393, NULL),
(8, 'Dorokha', 394, NULL),
(9, 'Gelephu', 395, NULL),
(10, 'Lingshi', 396, NULL),
(11, 'Wamrong', 397, NULL),
(12, 'Thrimshing', 397, NULL),
(13, 'Sakteng', 397, NULL),
(14, 'Panbang', 4036, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension`
--

CREATE TABLE IF NOT EXISTS `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=439 ;

--
-- Dumping data for table `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(23, 'payment', 'cod'),
(22, 'total', 'shipping'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(410, 'module', 'banner'),
(426, 'module', 'carousel'),
(390, 'total', 'credit'),
(387, 'shipping', 'flat'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(389, 'total', 'coupon'),
(413, 'module', 'category'),
(411, 'module', 'affiliate'),
(393, 'total', 'reward'),
(398, 'total', 'voucher'),
(407, 'payment', 'free_checkout'),
(419, 'module', 'slideshow'),
(433, 'module', 'welcome'),
(436, 'module', 'pdf_catalog'),
(438, 'module', 'latest');

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter`
--

CREATE TABLE IF NOT EXISTS `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `country_id`, `zone_id`, `description`, `date_modified`, `date_added`) VALUES
(22, 'Gedu', 25, 384, '', '0000-00-00 00:00:00', '2015-03-25 12:24:25'),
(21, 'Phuentsholing', 25, 384, '', '0000-00-00 00:00:00', '2015-03-21 20:10:12'),
(23, 'Chamkhar', 25, 4038, '', '0000-00-00 00:00:00', '2015-03-25 12:48:48'),
(24, 'Trashigang', 25, 397, '', '0000-00-00 00:00:00', '2015-03-25 12:49:13'),
(25, 'Kanglung', 25, 397, '', '0000-00-00 00:00:00', '2015-03-25 12:49:33'),
(26, 'Gelephu', 25, 395, '', '0000-00-00 00:00:00', '2015-03-25 22:02:51'),
(27, 'Sarpang', 25, 395, '', '0000-00-00 00:00:00', '2015-03-25 22:03:50');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information`
--

CREATE TABLE IF NOT EXISTS `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_description`
--

CREATE TABLE IF NOT EXISTS `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`) VALUES
(4, 1, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n'),
(3, 1, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_language`
--

CREATE TABLE IF NOT EXISTS `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `filename`, `sort_order`, `status`) VALUES
(1, 'English', 'en', 'en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 'english', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout`
--

CREATE TABLE IF NOT EXISTS `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information');

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_route`
--

CREATE TABLE IF NOT EXISTS `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(30, 6, 0, 'account'),
(17, 10, 0, 'affiliate/'),
(29, 3, 0, 'product/category'),
(26, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(22, 5, 0, 'product/manufacturer'),
(23, 7, 0, 'checkout/'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class`
--

CREATE TABLE IF NOT EXISTS `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'data/demo/htc_logo.jpg', 0),
(6, 'Palm', 'data/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'data/demo/hp_logo.jpg', 0),
(8, 'Apple', 'data/demo/apple_logo.jpg', 0),
(9, 'Canon', 'data/demo/canon_logo.jpg', 0),
(10, 'Sony', 'data/demo/sony_logo.jpg', 0),
(11, 'Handicrafts Emporium', NULL, 0),
(13, 'Neelkamal', '', 0),
(14, 'Other', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(13, 0),
(14, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_openbay_faq`
--

CREATE TABLE IF NOT EXISTS `oc_openbay_faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_openbay_faq`
--

INSERT INTO `oc_openbay_faq` (`id`, `route`) VALUES
(1, 'module/ebaydisplay');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option`
--

CREATE TABLE IF NOT EXISTS `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 2),
(2, 'checkbox', 3),
(4, 'text', 4),
(5, 'select', 1),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 1),
(12, 'date', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order`
--

CREATE TABLE IF NOT EXISTS `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(32) NOT NULL,
  `payment_company_id` varchar(32) NOT NULL,
  `payment_tax_id` varchar(32) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(32) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_download`
--

CREATE TABLE IF NOT EXISTS `oc_order_download` (
  `order_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_field`
--

CREATE TABLE IF NOT EXISTS `oc_order_field` (
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_fraud`
--

CREATE TABLE IF NOT EXISTS `oc_order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_history`
--

CREATE TABLE IF NOT EXISTS `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_option`
--

CREATE TABLE IF NOT EXISTS `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_product`
--

CREATE TABLE IF NOT EXISTS `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `profile_name` varchar(255) NOT NULL,
  `profile_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `profile_reference` varchar(255) NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_status`
--

CREATE TABLE IF NOT EXISTS `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(7, 1, 'Canceled'),
(5, 1, 'Complete'),
(1, 1, 'Pending'),
(15, 1, 'Processed');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_total`
--

CREATE TABLE IF NOT EXISTS `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `idx_orders_total_orders_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_price_duration`
--

CREATE TABLE IF NOT EXISTS `oc_price_duration` (
  `duration_id` int(10) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `value` int(10) DEFAULT NULL,
  PRIMARY KEY (`duration_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oc_price_duration`
--

INSERT INTO `oc_price_duration` (`duration_id`, `title`, `value`) VALUES
(1, '1', 1),
(2, '2', 2),
(3, '3', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oc_pricing_policy`
--

CREATE TABLE IF NOT EXISTS `oc_pricing_policy` (
  `policy_id` int(10) NOT NULL AUTO_INCREMENT,
  `duration_policy_id` int(10) DEFAULT NULL,
  `from_price_range` int(50) DEFAULT NULL,
  `to_price_range` int(255) DEFAULT NULL,
  `amount_percentage` int(10) DEFAULT NULL,
  `date_added` date NOT NULL,
  `date_modified` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`policy_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `oc_pricing_policy`
--

INSERT INTO `oc_pricing_policy` (`policy_id`, `duration_policy_id`, `from_price_range`, `to_price_range`, `amount_percentage`, `date_added`, `date_modified`, `status`) VALUES
(5, 2, 10001, 50000, 3, '2014-01-01', '9999-12-31', 1),
(6, 2, 50001, 999999999, 4, '2014-01-01', '9999-12-31', 1),
(53, 1, 1, 10000, 1, '2015-04-04', '9999-12-31', 1),
(2, 1, 10001, 50000, 2, '2014-01-01', '2015-04-04', 1),
(4, 2, 1, 10000, 2, '2014-01-01', '9999-12-31', 1),
(3, 1, 50001, 999999999, 3, '2014-01-01', '9999-12-31', 1),
(52, 3, 1, 10000, 3, '2015-04-04', '9999-12-31', 1),
(8, 3, 10001, 50000, 4, '2014-01-01', '9999-12-31', 1),
(9, 3, 50001, 999999999, 5, '2014-01-01', '9999-12-31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product`
--

CREATE TABLE IF NOT EXISTS `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL,
  `date_expiry` date NOT NULL,
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `producer` varchar(250) DEFAULT NULL,
  `price_duration_id` int(10) DEFAULT NULL,
  `tax` decimal(15,2) DEFAULT NULL,
  `payment_status` varchar(64) NOT NULL,
  `product_type` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=93 ;

--
-- Dumping data for table `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `date_expiry`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `date_added`, `date_modified`, `viewed`, `user_id`, `producer`, `price_duration_id`, `tax`, `payment_status`, `product_type`) VALUES
(92, '', '', '', '', '', '', '', '', 1, 0, 'data/apples.jpg', 0, 1, '100.00', 0, 0, '0000-00-00', '2015-06-18', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 0, 1, '2015-04-19 23:38:43', '0000-00-00 00:00:00', 6, 36, '', 2, '2.00', '', 'new');

-- --------------------------------------------------------

--
-- Table structure for table `oc_productmaps`
--

CREATE TABLE IF NOT EXISTS `oc_productmaps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p` point NOT NULL,
  `zoom` tinyint(3) unsigned NOT NULL DEFAULT '14',
  `address` varchar(128) NOT NULL DEFAULT 'Some place',
  `width` int(10) unsigned NOT NULL DEFAULT '600',
  `height` int(10) unsigned NOT NULL DEFAULT '400',
  `id_product` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_product` (`id_product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_description`
--

CREATE TABLE IF NOT EXISTS `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `tag`) VALUES
(92, 1, 'Apples', 'Apples', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_discount`
--

CREATE TABLE IF NOT EXISTS `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=441 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_filter`
--

CREATE TABLE IF NOT EXISTS `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_image`
--

CREATE TABLE IF NOT EXISTS `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2447 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option`
--

CREATE TABLE IF NOT EXISTS `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=227 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_profile`
--

CREATE TABLE IF NOT EXISTS `oc_product_profile` (
  `product_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`profile_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related`
--

CREATE TABLE IF NOT EXISTS `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_reward`
--

CREATE TABLE IF NOT EXISTS `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=550 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_special`
--

CREATE TABLE IF NOT EXISTS `oc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=440 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_category`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(92, 278);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_download`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(92, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_type`
--

CREATE TABLE IF NOT EXISTS `oc_product_type` (
  `product_type` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_type`
--

INSERT INTO `oc_product_type` (`product_type`) VALUES
('All'),
('New'),
('Used');

-- --------------------------------------------------------

--
-- Table structure for table `oc_profile`
--

CREATE TABLE IF NOT EXISTS `oc_profile` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_profile_description`
--

CREATE TABLE IF NOT EXISTS `oc_profile_description` (
  `profile_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`profile_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return`
--

CREATE TABLE IF NOT EXISTS `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_action`
--

CREATE TABLE IF NOT EXISTS `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_history`
--

CREATE TABLE IF NOT EXISTS `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_reason`
--

CREATE TABLE IF NOT EXISTS `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_status`
--

CREATE TABLE IF NOT EXISTS `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Table structure for table `oc_review`
--

CREATE TABLE IF NOT EXISTS `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_seller_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_seller_to_store` (
  `user_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oc_seller_to_store`
--

INSERT INTO `oc_seller_to_store` (`user_id`, `store_id`) VALUES
(2, 0),
(3, 0),
(5, 0),
(10, 0),
(10, 0),
(1, 0),
(3, 0),
(10, 0),
(18, 0),
(18, 0),
(6, 0),
(6, 0),
(6, 0),
(21, 0),
(20, 0),
(23, 0),
(28, 0),
(28, 0),
(23, 0),
(36, 0),
(36, 0),
(36, 0),
(36, 0),
(36, 0),
(36, 0),
(36, 0),
(36, 0),
(36, 0),
(36, 0),
(36, 0),
(36, 0),
(36, 0),
(36, 0),
(36, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_setting`
--

CREATE TABLE IF NOT EXISTS `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1343 ;

--
-- Dumping data for table `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `group`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(34, 0, 'flat', 'flat_sort_order', '1', 0),
(35, 0, 'flat', 'flat_status', '1', 0),
(36, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(37, 0, 'flat', 'flat_tax_class_id', '9', 0),
(569, 0, 'carousel', 'carousel_module', 'a:1:{i:0;a:9:{s:9:"banner_id";s:1:"8";s:5:"limit";s:1:"5";s:6:"scroll";s:1:"3";s:5:"width";s:2:"80";s:6:"height";s:2:"80";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"0";s:10:"sort_order";s:1:"3";}}', 1),
(41, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(56, 0, 'affiliate', 'affiliate_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:2:"10";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(1290, 0, 'config', 'config_icon', 'data/cart.png', 0),
(1291, 0, 'config', 'config_image_category_width', '80', 0),
(1292, 0, 'config', 'config_image_category_height', '80', 0),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(103, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(104, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(717, 0, 'latest', 'latest_module', 'a:1:{i:0;a:7:{s:5:"limit";s:1:"6";s:11:"image_width";s:2:"80";s:12:"image_height";s:2:"80";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}}', 1),
(706, 0, 'pdf_catalog', 'pdf_catalog_image_width', '100', 0),
(707, 0, 'pdf_catalog', 'pdf_catalog_item_per_page', '6', 0),
(708, 0, 'pdf_catalog', 'pdf_catalog_display_description', '1', 0),
(1293, 0, 'config', 'config_image_thumb_width', '228', 0),
(1294, 0, 'config', 'config_image_thumb_height', '228', 0),
(1295, 0, 'config', 'config_image_popup_width', '500', 0),
(1296, 0, 'config', 'config_image_popup_height', '500', 0),
(1297, 0, 'config', 'config_image_product_width', '80', 0),
(1298, 0, 'config', 'config_image_product_height', '80', 0),
(1299, 0, 'config', 'config_image_additional_width', '74', 0),
(1300, 0, 'config', 'config_image_additional_height', '74', 0),
(1301, 0, 'config', 'config_image_related_width', '80', 0),
(1302, 0, 'config', 'config_image_related_height', '80', 0),
(1303, 0, 'config', 'config_image_compare_width', '90', 0),
(1304, 0, 'config', 'config_image_compare_height', '90', 0),
(1305, 0, 'config', 'config_image_wishlist_width', '47', 0),
(1306, 0, 'config', 'config_image_wishlist_height', '47', 0),
(1307, 0, 'config', 'config_image_cart_width', '47', 0),
(1308, 0, 'config', 'config_image_cart_height', '47', 0),
(1309, 0, 'config', 'config_ftp_host', 'localhost', 0),
(1310, 0, 'config', 'config_ftp_port', '21', 0),
(1311, 0, 'config', 'config_ftp_username', '', 0),
(1312, 0, 'config', 'config_ftp_password', '', 0),
(1313, 0, 'config', 'config_ftp_root', '', 0),
(1314, 0, 'config', 'config_ftp_status', '0', 0),
(1315, 0, 'config', 'config_mail_protocol', 'mail', 0),
(1316, 0, 'config', 'config_mail_parameter', '', 0),
(1317, 0, 'config', 'config_smtp_host', '', 0),
(1318, 0, 'config', 'config_smtp_username', '', 0),
(1319, 0, 'config', 'config_smtp_password', '', 0),
(1320, 0, 'config', 'config_smtp_port', '25', 0),
(1321, 0, 'config', 'config_smtp_timeout', '5', 0),
(1322, 0, 'config', 'config_alert_mail', '0', 0),
(1323, 0, 'config', 'config_account_mail', '0', 0),
(1324, 0, 'config', 'config_alert_emails', '', 0),
(1325, 0, 'config', 'config_fraud_detection', '0', 0),
(1326, 0, 'config', 'config_fraud_key', '', 0),
(1327, 0, 'config', 'config_fraud_score', '', 0),
(1328, 0, 'config', 'config_fraud_status_id', '7', 0),
(1329, 0, 'config', 'config_secure', '0', 0),
(1330, 0, 'config', 'config_shared', '0', 0),
(1331, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(1341, 0, 'config', 'config_error_filename', 'error.txt', 0),
(1340, 0, 'config', 'config_error_log', '1', 0),
(1339, 0, 'config', 'config_error_display', '1', 0),
(1338, 0, 'config', 'config_compression', '0', 0),
(1337, 0, 'config', 'config_encryption', '8f2760aad340936fca6c75bb11c47f69', 0),
(1336, 0, 'config', 'config_password', '1', 0),
(1335, 0, 'config', 'config_maintenance', '0', 0),
(1334, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/jpeg\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/tiff\r\nimage/svg+xml\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/postscript\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet', 0),
(1332, 0, 'config', 'config_seo_url', '0', 0),
(1333, 0, 'config', 'config_file_extension_allowed', 'txt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nrtf\r\nxls\r\nppt\r\nodt\r\nods', 0),
(705, 0, 'pdf_catalog', 'pdf_catalog_image_height', '100', 0),
(704, 0, 'pdf_catalog', 'pdf_catalog_keywords', '', 0),
(703, 0, 'pdf_catalog', 'pdf_catalog_subject', '', 0),
(572, 0, 'welcome', 'welcome_module', 'a:1:{i:1;a:5:{s:11:"description";a:1:{i:1;s:316:"&lt;p&gt;&lt;strong&gt;Village Bazar is an e-Commerce solution that allows the efficient and cost-effective showcasing and sale of rural products and services. The foremost idea behind the Village Bazaar solution is to showcase a variety of products and services sold by rural communities.&lt;/strong&gt;&lt;/p&gt;\r\n";}s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(724, 0, 'slideshow', 'slideshow_module', 'a:1:{i:0;a:7:{s:9:"banner_id";s:1:"9";s:5:"width";s:3:"980";s:6:"height";s:3:"240";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}}', 1),
(702, 0, 'pdf_catalog', 'pdf_catalog_title', '', 0),
(699, 0, 'pdf_catalog', 'pdf_catalog_display_toc', '1', 0),
(700, 0, 'pdf_catalog', 'pdf_catalog_max_products', '200', 0),
(701, 0, 'pdf_catalog', 'pdf_catalog_author', '', 0),
(698, 0, 'pdf_catalog', 'pdf_catalog_display_categories', '1', 0),
(697, 0, 'pdf_catalog', 'pdf_catalog_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(709, 0, 'pdf_catalog', 'pdf_catalog_description', '', 0),
(715, 0, 'category', 'category_module', 'a:2:{i:0;a:4:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}i:1;a:4:{s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(1289, 0, 'config', 'config_logo', 'data/logo.png', 0),
(1288, 0, 'config', 'config_return_status_id', '2', 0),
(1287, 0, 'config', 'config_return_id', '0', 0),
(1286, 0, 'config', 'config_commission', '5', 0),
(1285, 0, 'config', 'config_affiliate_id', '4', 0),
(1284, 0, 'config', 'config_stock_status_id', '5', 0),
(1283, 0, 'config', 'config_stock_checkout', '0', 0),
(1282, 0, 'config', 'config_stock_warning', '0', 0),
(1281, 0, 'config', 'config_stock_display', '0', 0),
(1280, 0, 'config', 'config_complete_status_id', '5', 0),
(1279, 0, 'config', 'config_order_status_id', '1', 0),
(1278, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(1277, 0, 'config', 'config_order_edit', '100', 0),
(1276, 0, 'config', 'config_checkout_id', '0', 0),
(1275, 0, 'config', 'config_guest_checkout', '1', 0),
(1274, 0, 'config', 'config_cart_weight', '1', 0),
(1273, 0, 'config', 'config_account_id', '3', 0),
(1272, 0, 'config', 'config_customer_price', '0', 0),
(1271, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1),
(1270, 0, 'config', 'config_customer_group_id', '1', 0),
(1260, 0, 'config', 'config_product_count', '1', 0),
(1261, 0, 'config', 'config_review_status', '1', 0),
(1262, 0, 'config', 'config_download', '1', 0),
(1263, 0, 'config', 'config_voucher_min', '1', 0),
(1264, 0, 'config', 'config_voucher_max', '1000', 0),
(1265, 0, 'config', 'config_tax', '1', 0),
(1266, 0, 'config', 'config_vat', '0', 0),
(1267, 0, 'config', 'config_tax_default', 'shipping', 0),
(1268, 0, 'config', 'config_tax_customer', 'shipping', 0),
(1269, 0, 'config', 'config_customer_online', '0', 0),
(1259, 0, 'config', 'config_admin_limit', '20', 0),
(1256, 0, 'config', 'config_length_class_id', '1', 0),
(1257, 0, 'config', 'config_weight_class_id', '1', 0),
(1258, 0, 'config', 'config_catalog_limit', '15', 0),
(1244, 0, 'config', 'config_telephone', '+975-16553812', 0),
(1245, 0, 'config', 'config_fax', '+975-16478518', 0),
(1246, 0, 'config', 'config_title', 'Village Bazar', 0),
(1247, 0, 'config', 'config_meta_description', '', 0),
(1248, 0, 'config', 'config_template', 'default', 0),
(1249, 0, 'config', 'config_layout_id', '4', 0),
(1250, 0, 'config', 'config_country_id', '25', 0),
(1251, 0, 'config', 'config_zone_id', '384', 0),
(1252, 0, 'config', 'config_language', 'en', 0),
(1253, 0, 'config', 'config_admin_language', 'en', 0),
(1254, 0, 'config', 'config_currency', 'Nu', 0),
(1255, 0, 'config', 'config_currency_auto', '1', 0),
(1243, 0, 'config', 'config_email', 'icts@cst.edu.bt', 0),
(1242, 0, 'config', 'config_address', 'CST, Rinchending\r\nPhuentsholing, Bhutan', 0),
(1241, 0, 'config', 'config_owner', 'College of Science and Technology', 0),
(1240, 0, 'config', 'config_name', 'Village Bazaar', 0),
(1342, 0, 'config', 'config_google_analytics', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_stock_status`
--

CREATE TABLE IF NOT EXISTS `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order'),
(5, 1, 'Out Of Stock'),
(6, 1, '2 - 3 Days');

-- --------------------------------------------------------

--
-- Table structure for table `oc_store`
--

CREATE TABLE IF NOT EXISTS `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_class`
--

CREATE TABLE IF NOT EXISTS `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed Stuff', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- Dumping data for table `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 5, 'VAT (17.5%)', '17.5000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 5, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rule`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

--
-- Dumping data for table `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_url_alias`
--

CREATE TABLE IF NOT EXISTS `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=777 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_user`
--

CREATE TABLE IF NOT EXISTS `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `country_code` varchar(10) NOT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `address_1` varchar(250) DEFAULT NULL,
  `address_2` varchar(250) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postcode` int(10) DEFAULT NULL,
  `country_id` int(50) DEFAULT NULL,
  `zone_id` int(50) DEFAULT NULL,
  `dungkhag_id` int(3) NOT NULL,
  `geog` varchar(250) NOT NULL,
  `std` varchar(6) NOT NULL,
  `landline` varchar(32) DEFAULT NULL,
  `postoffice` varchar(250) DEFAULT NULL,
  `csc_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `code`, `ip`, `status`, `date_added`, `country_code`, `telephone`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`, `dungkhag_id`, `geog`, `std`, `landline`, `postoffice`, `csc_id`) VALUES
(6, 1, 'angel', '233ca216b78735b8e23bb8ce68768016bab5fc8a', '7935af7ed', 'ANGEL', 'DIEZ', 'adiez@dartec.com', '', '127.0.0.1', 1, '2014-04-17 23:23:11', '', '9808669609', 'Jawalakhel', '', 'Patan', 112233, 149, 2327, 0, '', '', '', '', 4),
(24, 1, 'Root', '9b53dc9669376dfe9c2bad8574764c6d4b2d7ca5', 'e4ed3ab77', 'Admin', 'Root', 'root@gmail.com', '', '127.0.0.1', 1, '2014-07-23 11:10:39', '', '9123456789', 'CST, Rinchending', NULL, 'Phuentsholing', 211011, 25, 384, 0, '', '', '303633', '', 3),
(25, 1, 'Cec', '390703029a17fa15023ef6d6369b3d0a62a97cdd', 'da705f960', 'Cec Admin', 'admin', 'cec@gmail.com', '', '127.0.0.1', 1, '2014-07-23 16:54:58', '', '1234567890', 'B-30, Sector 62', NULL, 'Noida', 201307, 99, 0, 0, '', '', '', NULL, 4),
(36, 1, 'Tandin', '641973fb36687a83c23465993c5554347bfebb05', '95a62d0cf', 'Tandin', 'Wangchuk', 'tandin@cst.edu.bt', '', '127.0.0.1', 1, '2015-04-01 22:37:07', '', '17718323', 'CST Rinchending', NULL, 'Wamrong', NULL, 25, 397, 1, 'Phuentsholing', '05', '022342', 'Wamrong PO', 8),
(38, 11, 'Manoj', '1d1826b4eb24e817009a53adecdf873d537d9d96', 'a276d0ad3', 'Manoj', 'Chhetri', 'manojchhetrip@gmail.com', '', '127.0.0.1', 1, '2015-04-13 12:32:20', '', '17718323', 'CST Rinchending', NULL, 'Phuentsholing', NULL, 25, 384, 1, 'Phuentsholing ', '', '', 'Phuentsholing GPO', 8);

-- --------------------------------------------------------

--
-- Table structure for table `oc_user_group`
--

CREATE TABLE IF NOT EXISTS `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Top Administrator', 'a:2:{s:6:"access";a:189:{i:0;s:17:"account/CreateNew";i:1;s:22:"account/sellerregister";i:2;s:14:"amazon/listing";i:3;s:14:"amazon/product";i:4;s:16:"amazonus/listing";i:5;s:16:"amazonus/product";i:6;s:17:"catalog/attribute";i:7;s:23:"catalog/attribute_group";i:8;s:15:"catalog/catalog";i:9;s:16:"catalog/category";i:10;s:16:"catalog/download";i:11;s:14:"catalog/filter";i:12;s:19:"catalog/information";i:13;s:20:"catalog/manufacturer";i:14;s:14:"catalog/option";i:15;s:11:"catalog/pay";i:16;s:15:"catalog/product";i:17;s:16:"catalog/product1";i:18;s:17:"catalog/product_1";i:19;s:17:"catalog/productss";i:20;s:15:"catalog/profile";i:21;s:14:"catalog/review";i:22;s:19:"catalog/subcategory";i:23;s:18:"common/filemanager";i:24;s:14:"common/header1";i:25;s:19:"common/header_14May";i:26;s:16:"common/header_up";i:27;s:18:"common/home_backup";i:28;s:13:"common/login1";i:29;s:13:"design/banner";i:30;s:19:"design/custom_field";i:31;s:13:"design/design";i:32;s:13:"design/layout";i:33;s:12:"ebay/profile";i:34;s:13:"ebay/template";i:35;s:20:"extension/bulk_order";i:36;s:19:"extension/dashboard";i:37;s:14:"extension/feed";i:38;s:17:"extension/manager";i:39;s:16:"extension/module";i:40;s:17:"extension/openbay";i:41;s:17:"extension/payment";i:42;s:18:"extension/shipping";i:43;s:15:"extension/total";i:44;s:16:"feed/google_base";i:45;s:19:"feed/google_sitemap";i:46;s:8:"help/doc";i:47;s:9:"help/help";i:48;s:9:"help/home";i:49;s:12:"help/support";i:50;s:20:"localisation/country";i:51;s:16:"localisation/csc";i:52;s:17:"localisation/csc1";i:53;s:21:"localisation/currency";i:54;s:21:"localisation/dungkhag";i:55;s:21:"localisation/geo_zone";i:56;s:21:"localisation/language";i:57;s:25:"localisation/length_class";i:58;s:25:"localisation/localisation";i:59;s:25:"localisation/order_status";i:60;s:26:"localisation/return_action";i:61;s:26:"localisation/return_reason";i:62;s:26:"localisation/return_status";i:63;s:25:"localisation/stock_status";i:64;s:22:"localisation/tax_class";i:65;s:21:"localisation/tax_rate";i:66;s:25:"localisation/weight_class";i:67;s:17:"localisation/zone";i:68;s:14:"module/account";i:69;s:16:"module/affiliate";i:70;s:29:"module/amazon_checkout_layout";i:71;s:13:"module/banner";i:72;s:17:"module/bestseller";i:73;s:15:"module/carousel";i:74;s:15:"module/category";i:75;s:18:"module/ebaydisplay";i:76;s:15:"module/featured";i:77;s:13:"module/filter";i:78;s:18:"module/google_talk";i:79;s:18:"module/information";i:80;s:13:"module/latest";i:81;s:19:"module/manufacturer";i:82;s:18:"module/pdf_catalog";i:83;s:14:"module/popular";i:84;s:16:"module/pp_layout";i:85;s:16:"module/slideshow";i:86;s:14:"module/special";i:87;s:12:"module/store";i:88;s:14:"module/welcome";i:89;s:14:"openbay/amazon";i:90;s:16:"openbay/amazonus";i:91;s:15:"openbay/openbay";i:92;s:12:"openbay/play";i:93;s:23:"payment/amazon_checkout";i:94;s:24:"payment/authorizenet_aim";i:95;s:21:"payment/bank_transfer";i:96;s:14:"payment/cheque";i:97;s:11:"payment/cod";i:98;s:21:"payment/free_checkout";i:99;s:22:"payment/klarna_account";i:100;s:22:"payment/klarna_invoice";i:101;s:14:"payment/liqpay";i:102;s:20:"payment/moneybookers";i:103;s:14:"payment/nochex";i:104;s:15:"payment/paymate";i:105;s:16:"payment/paypoint";i:106;s:13:"payment/payza";i:107;s:26:"payment/perpetual_payments";i:108;s:18:"payment/pp_express";i:109;s:25:"payment/pp_payflow_iframe";i:110;s:14:"payment/pp_pro";i:111;s:21:"payment/pp_pro_iframe";i:112;s:17:"payment/pp_pro_pf";i:113;s:17:"payment/pp_pro_uk";i:114;s:19:"payment/pp_standard";i:115;s:15:"payment/sagepay";i:116;s:22:"payment/sagepay_direct";i:117;s:18:"payment/sagepay_us";i:118;s:19:"payment/twocheckout";i:119;s:28:"payment/web_payment_software";i:120;s:16:"payment/worldpay";i:121;s:10:"play/order";i:122;s:12:"play/product";i:123;s:15:"pricing/pricing";i:124;s:23:"report/Category_product";i:125;s:21:"report/active_sellers";i:126;s:27:"report/affiliate_commission";i:127;s:22:"report/customer_credit";i:128;s:22:"report/customer_online";i:129;s:21:"report/customer_order";i:130;s:22:"report/customer_reward";i:131;s:25:"report/product_advertised";i:132;s:26:"report/product_advertised1";i:133;s:23:"report/product_category";i:134;s:21:"report/product_expiry";i:135;s:24:"report/product_purchased";i:136;s:21:"report/product_viewed";i:137;s:13:"report/report";i:138;s:18:"report/sale_coupon";i:139;s:17:"report/sale_order";i:140;s:18:"report/sale_return";i:141;s:20:"report/sale_shipping";i:142;s:15:"report/sale_tax";i:143;s:20:"report/users_profile";i:144;s:14:"sale/affiliate";i:145;s:12:"sale/contact";i:146;s:11:"sale/coupon";i:147;s:13:"sale/customer";i:148;s:20:"sale/customer_ban_ip";i:149;s:19:"sale/customer_group";i:150;s:10:"sale/order";i:151;s:14:"sale/recurring";i:152;s:11:"sale/return";i:153;s:9:"sale/sale";i:154;s:12:"sale/voucher";i:155;s:18:"sale/voucher_theme";i:156;s:15:"setting/setting";i:157;s:13:"setting/store";i:158;s:16:"shipping/auspost";i:159;s:17:"shipping/citylink";i:160;s:14:"shipping/fedex";i:161;s:13:"shipping/flat";i:162;s:13:"shipping/free";i:163;s:13:"shipping/item";i:164;s:23:"shipping/parcelforce_48";i:165;s:15:"shipping/pickup";i:166;s:19:"shipping/royal_mail";i:167;s:12:"shipping/ups";i:168;s:13:"shipping/usps";i:169;s:15:"shipping/weight";i:170;s:13:"system/system";i:171;s:11:"tool/backup";i:172;s:14:"tool/error_log";i:173;s:12:"total/coupon";i:174;s:12:"total/credit";i:175;s:14:"total/handling";i:176;s:16:"total/klarna_fee";i:177;s:19:"total/low_order_fee";i:178;s:12:"total/reward";i:179;s:14:"total/shipping";i:180;s:15:"total/sub_total";i:181;s:9:"total/tax";i:182;s:11:"total/total";i:183;s:13:"total/voucher";i:184;s:14:"user/myaccount";i:185;s:12:"user/success";i:186;s:9:"user/user";i:187;s:11:"user/user_1";i:188;s:20:"user/user_permission";}s:6:"modify";a:189:{i:0;s:17:"account/CreateNew";i:1;s:22:"account/sellerregister";i:2;s:14:"amazon/listing";i:3;s:14:"amazon/product";i:4;s:16:"amazonus/listing";i:5;s:16:"amazonus/product";i:6;s:17:"catalog/attribute";i:7;s:23:"catalog/attribute_group";i:8;s:15:"catalog/catalog";i:9;s:16:"catalog/category";i:10;s:16:"catalog/download";i:11;s:14:"catalog/filter";i:12;s:19:"catalog/information";i:13;s:20:"catalog/manufacturer";i:14;s:14:"catalog/option";i:15;s:11:"catalog/pay";i:16;s:15:"catalog/product";i:17;s:16:"catalog/product1";i:18;s:17:"catalog/product_1";i:19;s:17:"catalog/productss";i:20;s:15:"catalog/profile";i:21;s:14:"catalog/review";i:22;s:19:"catalog/subcategory";i:23;s:18:"common/filemanager";i:24;s:14:"common/header1";i:25;s:19:"common/header_14May";i:26;s:16:"common/header_up";i:27;s:18:"common/home_backup";i:28;s:13:"common/login1";i:29;s:13:"design/banner";i:30;s:19:"design/custom_field";i:31;s:13:"design/design";i:32;s:13:"design/layout";i:33;s:12:"ebay/profile";i:34;s:13:"ebay/template";i:35;s:20:"extension/bulk_order";i:36;s:19:"extension/dashboard";i:37;s:14:"extension/feed";i:38;s:17:"extension/manager";i:39;s:16:"extension/module";i:40;s:17:"extension/openbay";i:41;s:17:"extension/payment";i:42;s:18:"extension/shipping";i:43;s:15:"extension/total";i:44;s:16:"feed/google_base";i:45;s:19:"feed/google_sitemap";i:46;s:8:"help/doc";i:47;s:9:"help/help";i:48;s:9:"help/home";i:49;s:12:"help/support";i:50;s:20:"localisation/country";i:51;s:16:"localisation/csc";i:52;s:17:"localisation/csc1";i:53;s:21:"localisation/currency";i:54;s:21:"localisation/dungkhag";i:55;s:21:"localisation/geo_zone";i:56;s:21:"localisation/language";i:57;s:25:"localisation/length_class";i:58;s:25:"localisation/localisation";i:59;s:25:"localisation/order_status";i:60;s:26:"localisation/return_action";i:61;s:26:"localisation/return_reason";i:62;s:26:"localisation/return_status";i:63;s:25:"localisation/stock_status";i:64;s:22:"localisation/tax_class";i:65;s:21:"localisation/tax_rate";i:66;s:25:"localisation/weight_class";i:67;s:17:"localisation/zone";i:68;s:14:"module/account";i:69;s:16:"module/affiliate";i:70;s:29:"module/amazon_checkout_layout";i:71;s:13:"module/banner";i:72;s:17:"module/bestseller";i:73;s:15:"module/carousel";i:74;s:15:"module/category";i:75;s:18:"module/ebaydisplay";i:76;s:15:"module/featured";i:77;s:13:"module/filter";i:78;s:18:"module/google_talk";i:79;s:18:"module/information";i:80;s:13:"module/latest";i:81;s:19:"module/manufacturer";i:82;s:18:"module/pdf_catalog";i:83;s:14:"module/popular";i:84;s:16:"module/pp_layout";i:85;s:16:"module/slideshow";i:86;s:14:"module/special";i:87;s:12:"module/store";i:88;s:14:"module/welcome";i:89;s:14:"openbay/amazon";i:90;s:16:"openbay/amazonus";i:91;s:15:"openbay/openbay";i:92;s:12:"openbay/play";i:93;s:23:"payment/amazon_checkout";i:94;s:24:"payment/authorizenet_aim";i:95;s:21:"payment/bank_transfer";i:96;s:14:"payment/cheque";i:97;s:11:"payment/cod";i:98;s:21:"payment/free_checkout";i:99;s:22:"payment/klarna_account";i:100;s:22:"payment/klarna_invoice";i:101;s:14:"payment/liqpay";i:102;s:20:"payment/moneybookers";i:103;s:14:"payment/nochex";i:104;s:15:"payment/paymate";i:105;s:16:"payment/paypoint";i:106;s:13:"payment/payza";i:107;s:26:"payment/perpetual_payments";i:108;s:18:"payment/pp_express";i:109;s:25:"payment/pp_payflow_iframe";i:110;s:14:"payment/pp_pro";i:111;s:21:"payment/pp_pro_iframe";i:112;s:17:"payment/pp_pro_pf";i:113;s:17:"payment/pp_pro_uk";i:114;s:19:"payment/pp_standard";i:115;s:15:"payment/sagepay";i:116;s:22:"payment/sagepay_direct";i:117;s:18:"payment/sagepay_us";i:118;s:19:"payment/twocheckout";i:119;s:28:"payment/web_payment_software";i:120;s:16:"payment/worldpay";i:121;s:10:"play/order";i:122;s:12:"play/product";i:123;s:15:"pricing/pricing";i:124;s:23:"report/Category_product";i:125;s:21:"report/active_sellers";i:126;s:27:"report/affiliate_commission";i:127;s:22:"report/customer_credit";i:128;s:22:"report/customer_online";i:129;s:21:"report/customer_order";i:130;s:22:"report/customer_reward";i:131;s:25:"report/product_advertised";i:132;s:26:"report/product_advertised1";i:133;s:23:"report/product_category";i:134;s:21:"report/product_expiry";i:135;s:24:"report/product_purchased";i:136;s:21:"report/product_viewed";i:137;s:13:"report/report";i:138;s:18:"report/sale_coupon";i:139;s:17:"report/sale_order";i:140;s:18:"report/sale_return";i:141;s:20:"report/sale_shipping";i:142;s:15:"report/sale_tax";i:143;s:20:"report/users_profile";i:144;s:14:"sale/affiliate";i:145;s:12:"sale/contact";i:146;s:11:"sale/coupon";i:147;s:13:"sale/customer";i:148;s:20:"sale/customer_ban_ip";i:149;s:19:"sale/customer_group";i:150;s:10:"sale/order";i:151;s:14:"sale/recurring";i:152;s:11:"sale/return";i:153;s:9:"sale/sale";i:154;s:12:"sale/voucher";i:155;s:18:"sale/voucher_theme";i:156;s:15:"setting/setting";i:157;s:13:"setting/store";i:158;s:16:"shipping/auspost";i:159;s:17:"shipping/citylink";i:160;s:14:"shipping/fedex";i:161;s:13:"shipping/flat";i:162;s:13:"shipping/free";i:163;s:13:"shipping/item";i:164;s:23:"shipping/parcelforce_48";i:165;s:15:"shipping/pickup";i:166;s:19:"shipping/royal_mail";i:167;s:12:"shipping/ups";i:168;s:13:"shipping/usps";i:169;s:15:"shipping/weight";i:170;s:13:"system/system";i:171;s:11:"tool/backup";i:172;s:14:"tool/error_log";i:173;s:12:"total/coupon";i:174;s:12:"total/credit";i:175;s:14:"total/handling";i:176;s:16:"total/klarna_fee";i:177;s:19:"total/low_order_fee";i:178;s:12:"total/reward";i:179;s:14:"total/shipping";i:180;s:15:"total/sub_total";i:181;s:9:"total/tax";i:182;s:11:"total/total";i:183;s:13:"total/voucher";i:184;s:14:"user/myaccount";i:185;s:12:"user/success";i:186;s:9:"user/user";i:187;s:11:"user/user_1";i:188;s:20:"user/user_permission";}}'),
(11, 'Buyer/Seller', 'a:3:{s:6:"access";a:173:{i:0;s:14:"amazon/listing";i:1;s:14:"amazon/product";i:2;s:16:"amazonus/listing";i:3;s:16:"amazonus/product";i:4;s:17:"catalog/attribute";i:5;s:23:"catalog/attribute_group";i:6;s:15:"catalog/catalog";i:7;s:16:"catalog/category";i:8;s:16:"catalog/download";i:9;s:14:"catalog/filter";i:10;s:19:"catalog/information";i:11;s:20:"catalog/manufacturer";i:12;s:14:"catalog/option";i:13;s:15:"catalog/product";i:14;s:16:"catalog/product1";i:15;s:17:"catalog/productss";i:16;s:15:"catalog/profile";i:17;s:14:"catalog/review";i:18;s:18:"common/filemanager";i:19;s:16:"common/header_up";i:20;s:18:"common/home_backup";i:21;s:13:"common/login1";i:22;s:13:"design/banner";i:23;s:19:"design/custom_field";i:24;s:13:"design/design";i:25;s:13:"design/layout";i:26;s:12:"ebay/profile";i:27;s:13:"ebay/template";i:28;s:20:"extension/bulk_order";i:29;s:19:"extension/dashboard";i:30;s:14:"extension/feed";i:31;s:17:"extension/manager";i:32;s:16:"extension/module";i:33;s:17:"extension/openbay";i:34;s:17:"extension/payment";i:35;s:18:"extension/shipping";i:36;s:15:"extension/total";i:37;s:16:"feed/google_base";i:38;s:19:"feed/google_sitemap";i:39;s:8:"help/doc";i:40;s:9:"help/help";i:41;s:9:"help/home";i:42;s:12:"help/support";i:43;s:20:"localisation/country";i:44;s:16:"localisation/csc";i:45;s:17:"localisation/csc1";i:46;s:21:"localisation/currency";i:47;s:21:"localisation/geo_zone";i:48;s:21:"localisation/language";i:49;s:25:"localisation/length_class";i:50;s:25:"localisation/localisation";i:51;s:25:"localisation/order_status";i:52;s:26:"localisation/return_action";i:53;s:26:"localisation/return_reason";i:54;s:26:"localisation/return_status";i:55;s:25:"localisation/stock_status";i:56;s:22:"localisation/tax_class";i:57;s:21:"localisation/tax_rate";i:58;s:25:"localisation/weight_class";i:59;s:17:"localisation/zone";i:60;s:14:"module/account";i:61;s:16:"module/affiliate";i:62;s:29:"module/amazon_checkout_layout";i:63;s:13:"module/banner";i:64;s:17:"module/bestseller";i:65;s:15:"module/carousel";i:66;s:15:"module/category";i:67;s:18:"module/ebaydisplay";i:68;s:15:"module/featured";i:69;s:13:"module/filter";i:70;s:18:"module/google_talk";i:71;s:18:"module/information";i:72;s:13:"module/latest";i:73;s:19:"module/manufacturer";i:74;s:18:"module/pdf_catalog";i:75;s:14:"module/popular";i:76;s:16:"module/pp_layout";i:77;s:16:"module/slideshow";i:78;s:14:"module/special";i:79;s:12:"module/store";i:80;s:14:"module/welcome";i:81;s:14:"openbay/amazon";i:82;s:16:"openbay/amazonus";i:83;s:15:"openbay/openbay";i:84;s:12:"openbay/play";i:85;s:23:"payment/amazon_checkout";i:86;s:24:"payment/authorizenet_aim";i:87;s:21:"payment/bank_transfer";i:88;s:14:"payment/cheque";i:89;s:11:"payment/cod";i:90;s:21:"payment/free_checkout";i:91;s:22:"payment/klarna_account";i:92;s:22:"payment/klarna_invoice";i:93;s:14:"payment/liqpay";i:94;s:20:"payment/moneybookers";i:95;s:14:"payment/nochex";i:96;s:15:"payment/paymate";i:97;s:16:"payment/paypoint";i:98;s:13:"payment/payza";i:99;s:26:"payment/perpetual_payments";i:100;s:18:"payment/pp_express";i:101;s:25:"payment/pp_payflow_iframe";i:102;s:14:"payment/pp_pro";i:103;s:21:"payment/pp_pro_iframe";i:104;s:17:"payment/pp_pro_pf";i:105;s:17:"payment/pp_pro_uk";i:106;s:19:"payment/pp_standard";i:107;s:15:"payment/sagepay";i:108;s:22:"payment/sagepay_direct";i:109;s:18:"payment/sagepay_us";i:110;s:19:"payment/twocheckout";i:111;s:28:"payment/web_payment_software";i:112;s:16:"payment/worldpay";i:113;s:10:"play/order";i:114;s:12:"play/product";i:115;s:15:"pricing/pricing";i:116;s:27:"report/affiliate_commission";i:117;s:22:"report/customer_credit";i:118;s:22:"report/customer_online";i:119;s:21:"report/customer_order";i:120;s:22:"report/customer_reward";i:121;s:24:"report/product_purchased";i:122;s:21:"report/product_viewed";i:123;s:13:"report/report";i:124;s:18:"report/sale_coupon";i:125;s:17:"report/sale_order";i:126;s:18:"report/sale_return";i:127;s:20:"report/sale_shipping";i:128;s:15:"report/sale_tax";i:129;s:14:"sale/affiliate";i:130;s:12:"sale/contact";i:131;s:11:"sale/coupon";i:132;s:13:"sale/customer";i:133;s:20:"sale/customer_ban_ip";i:134;s:19:"sale/customer_group";i:135;s:10:"sale/order";i:136;s:14:"sale/recurring";i:137;s:11:"sale/return";i:138;s:9:"sale/sale";i:139;s:12:"sale/voucher";i:140;s:18:"sale/voucher_theme";i:141;s:15:"setting/setting";i:142;s:13:"setting/store";i:143;s:16:"shipping/auspost";i:144;s:17:"shipping/citylink";i:145;s:14:"shipping/fedex";i:146;s:13:"shipping/flat";i:147;s:13:"shipping/free";i:148;s:13:"shipping/item";i:149;s:23:"shipping/parcelforce_48";i:150;s:15:"shipping/pickup";i:151;s:19:"shipping/royal_mail";i:152;s:12:"shipping/ups";i:153;s:13:"shipping/usps";i:154;s:15:"shipping/weight";i:155;s:13:"system/system";i:156;s:11:"tool/backup";i:157;s:14:"tool/error_log";i:158;s:12:"total/coupon";i:159;s:12:"total/credit";i:160;s:14:"total/handling";i:161;s:16:"total/klarna_fee";i:162;s:19:"total/low_order_fee";i:163;s:12:"total/reward";i:164;s:14:"total/shipping";i:165;s:15:"total/sub_total";i:166;s:9:"total/tax";i:167;s:11:"total/total";i:168;s:13:"total/voucher";i:169;s:14:"user/myaccount";i:170;s:12:"user/success";i:171;s:9:"user/user";i:172;s:20:"user/user_permission";}s:6:"modify";a:173:{i:0;s:14:"amazon/listing";i:1;s:14:"amazon/product";i:2;s:16:"amazonus/listing";i:3;s:16:"amazonus/product";i:4;s:17:"catalog/attribute";i:5;s:23:"catalog/attribute_group";i:6;s:15:"catalog/catalog";i:7;s:16:"catalog/category";i:8;s:16:"catalog/download";i:9;s:14:"catalog/filter";i:10;s:19:"catalog/information";i:11;s:20:"catalog/manufacturer";i:12;s:14:"catalog/option";i:13;s:15:"catalog/product";i:14;s:16:"catalog/product1";i:15;s:17:"catalog/productss";i:16;s:15:"catalog/profile";i:17;s:14:"catalog/review";i:18;s:18:"common/filemanager";i:19;s:16:"common/header_up";i:20;s:18:"common/home_backup";i:21;s:13:"common/login1";i:22;s:13:"design/banner";i:23;s:19:"design/custom_field";i:24;s:13:"design/design";i:25;s:13:"design/layout";i:26;s:12:"ebay/profile";i:27;s:13:"ebay/template";i:28;s:20:"extension/bulk_order";i:29;s:19:"extension/dashboard";i:30;s:14:"extension/feed";i:31;s:17:"extension/manager";i:32;s:16:"extension/module";i:33;s:17:"extension/openbay";i:34;s:17:"extension/payment";i:35;s:18:"extension/shipping";i:36;s:15:"extension/total";i:37;s:16:"feed/google_base";i:38;s:19:"feed/google_sitemap";i:39;s:8:"help/doc";i:40;s:9:"help/help";i:41;s:9:"help/home";i:42;s:12:"help/support";i:43;s:20:"localisation/country";i:44;s:16:"localisation/csc";i:45;s:17:"localisation/csc1";i:46;s:21:"localisation/currency";i:47;s:21:"localisation/geo_zone";i:48;s:21:"localisation/language";i:49;s:25:"localisation/length_class";i:50;s:25:"localisation/localisation";i:51;s:25:"localisation/order_status";i:52;s:26:"localisation/return_action";i:53;s:26:"localisation/return_reason";i:54;s:26:"localisation/return_status";i:55;s:25:"localisation/stock_status";i:56;s:22:"localisation/tax_class";i:57;s:21:"localisation/tax_rate";i:58;s:25:"localisation/weight_class";i:59;s:17:"localisation/zone";i:60;s:14:"module/account";i:61;s:16:"module/affiliate";i:62;s:29:"module/amazon_checkout_layout";i:63;s:13:"module/banner";i:64;s:17:"module/bestseller";i:65;s:15:"module/carousel";i:66;s:15:"module/category";i:67;s:18:"module/ebaydisplay";i:68;s:15:"module/featured";i:69;s:13:"module/filter";i:70;s:18:"module/google_talk";i:71;s:18:"module/information";i:72;s:13:"module/latest";i:73;s:19:"module/manufacturer";i:74;s:18:"module/pdf_catalog";i:75;s:14:"module/popular";i:76;s:16:"module/pp_layout";i:77;s:16:"module/slideshow";i:78;s:14:"module/special";i:79;s:12:"module/store";i:80;s:14:"module/welcome";i:81;s:14:"openbay/amazon";i:82;s:16:"openbay/amazonus";i:83;s:15:"openbay/openbay";i:84;s:12:"openbay/play";i:85;s:23:"payment/amazon_checkout";i:86;s:24:"payment/authorizenet_aim";i:87;s:21:"payment/bank_transfer";i:88;s:14:"payment/cheque";i:89;s:11:"payment/cod";i:90;s:21:"payment/free_checkout";i:91;s:22:"payment/klarna_account";i:92;s:22:"payment/klarna_invoice";i:93;s:14:"payment/liqpay";i:94;s:20:"payment/moneybookers";i:95;s:14:"payment/nochex";i:96;s:15:"payment/paymate";i:97;s:16:"payment/paypoint";i:98;s:13:"payment/payza";i:99;s:26:"payment/perpetual_payments";i:100;s:18:"payment/pp_express";i:101;s:25:"payment/pp_payflow_iframe";i:102;s:14:"payment/pp_pro";i:103;s:21:"payment/pp_pro_iframe";i:104;s:17:"payment/pp_pro_pf";i:105;s:17:"payment/pp_pro_uk";i:106;s:19:"payment/pp_standard";i:107;s:15:"payment/sagepay";i:108;s:22:"payment/sagepay_direct";i:109;s:18:"payment/sagepay_us";i:110;s:19:"payment/twocheckout";i:111;s:28:"payment/web_payment_software";i:112;s:16:"payment/worldpay";i:113;s:10:"play/order";i:114;s:12:"play/product";i:115;s:15:"pricing/pricing";i:116;s:27:"report/affiliate_commission";i:117;s:22:"report/customer_credit";i:118;s:22:"report/customer_online";i:119;s:21:"report/customer_order";i:120;s:22:"report/customer_reward";i:121;s:24:"report/product_purchased";i:122;s:21:"report/product_viewed";i:123;s:13:"report/report";i:124;s:18:"report/sale_coupon";i:125;s:17:"report/sale_order";i:126;s:18:"report/sale_return";i:127;s:20:"report/sale_shipping";i:128;s:15:"report/sale_tax";i:129;s:14:"sale/affiliate";i:130;s:12:"sale/contact";i:131;s:11:"sale/coupon";i:132;s:13:"sale/customer";i:133;s:20:"sale/customer_ban_ip";i:134;s:19:"sale/customer_group";i:135;s:10:"sale/order";i:136;s:14:"sale/recurring";i:137;s:11:"sale/return";i:138;s:9:"sale/sale";i:139;s:12:"sale/voucher";i:140;s:18:"sale/voucher_theme";i:141;s:15:"setting/setting";i:142;s:13:"setting/store";i:143;s:16:"shipping/auspost";i:144;s:17:"shipping/citylink";i:145;s:14:"shipping/fedex";i:146;s:13:"shipping/flat";i:147;s:13:"shipping/free";i:148;s:13:"shipping/item";i:149;s:23:"shipping/parcelforce_48";i:150;s:15:"shipping/pickup";i:151;s:19:"shipping/royal_mail";i:152;s:12:"shipping/ups";i:153;s:13:"shipping/usps";i:154;s:15:"shipping/weight";i:155;s:13:"system/system";i:156;s:11:"tool/backup";i:157;s:14:"tool/error_log";i:158;s:12:"total/coupon";i:159;s:12:"total/credit";i:160;s:14:"total/handling";i:161;s:16:"total/klarna_fee";i:162;s:19:"total/low_order_fee";i:163;s:12:"total/reward";i:164;s:14:"total/shipping";i:165;s:15:"total/sub_total";i:166;s:9:"total/tax";i:167;s:11:"total/total";i:168;s:13:"total/voucher";i:169;s:14:"user/myaccount";i:170;s:12:"user/success";i:171;s:9:"user/user";i:172;s:20:"user/user_permission";}s:4:"view";a:157:{i:0;s:14:"amazon/listing";i:1;s:16:"amazonus/listing";i:2;s:17:"catalog/attribute";i:3;s:23:"catalog/attribute_group";i:4;s:16:"catalog/category";i:5;s:16:"catalog/download";i:6;s:14:"catalog/filter";i:7;s:19:"catalog/information";i:8;s:20:"catalog/manufacturer";i:9;s:14:"catalog/option";i:10;s:15:"catalog/profile";i:11;s:14:"catalog/review";i:12;s:18:"common/filemanager";i:13;s:16:"common/header_up";i:14;s:13:"design/banner";i:15;s:19:"design/custom_field";i:16;s:13:"design/design";i:17;s:13:"design/layout";i:18;s:12:"ebay/profile";i:19;s:13:"ebay/template";i:20;s:20:"extension/bulk_order";i:21;s:19:"extension/dashboard";i:22;s:14:"extension/feed";i:23;s:17:"extension/manager";i:24;s:16:"extension/module";i:25;s:17:"extension/openbay";i:26;s:17:"extension/payment";i:27;s:18:"extension/shipping";i:28;s:15:"extension/total";i:29;s:16:"feed/google_base";i:30;s:19:"feed/google_sitemap";i:31;s:8:"help/doc";i:32;s:9:"help/home";i:33;s:12:"help/support";i:34;s:20:"localisation/country";i:35;s:21:"localisation/currency";i:36;s:21:"localisation/geo_zone";i:37;s:21:"localisation/language";i:38;s:25:"localisation/length_class";i:39;s:25:"localisation/localisation";i:40;s:25:"localisation/order_status";i:41;s:26:"localisation/return_action";i:42;s:26:"localisation/return_reason";i:43;s:26:"localisation/return_status";i:44;s:25:"localisation/stock_status";i:45;s:22:"localisation/tax_class";i:46;s:21:"localisation/tax_rate";i:47;s:25:"localisation/weight_class";i:48;s:17:"localisation/zone";i:49;s:14:"module/account";i:50;s:16:"module/affiliate";i:51;s:29:"module/amazon_checkout_layout";i:52;s:13:"module/banner";i:53;s:17:"module/bestseller";i:54;s:15:"module/carousel";i:55;s:18:"module/ebaydisplay";i:56;s:15:"module/featured";i:57;s:13:"module/filter";i:58;s:18:"module/google_talk";i:59;s:18:"module/information";i:60;s:13:"module/latest";i:61;s:19:"module/manufacturer";i:62;s:18:"module/pdf_catalog";i:63;s:16:"module/pp_layout";i:64;s:16:"module/slideshow";i:65;s:14:"module/special";i:66;s:12:"module/store";i:67;s:14:"module/welcome";i:68;s:14:"openbay/amazon";i:69;s:16:"openbay/amazonus";i:70;s:15:"openbay/openbay";i:71;s:12:"openbay/play";i:72;s:23:"payment/amazon_checkout";i:73;s:24:"payment/authorizenet_aim";i:74;s:21:"payment/bank_transfer";i:75;s:14:"payment/cheque";i:76;s:11:"payment/cod";i:77;s:21:"payment/free_checkout";i:78;s:22:"payment/klarna_account";i:79;s:22:"payment/klarna_invoice";i:80;s:14:"payment/liqpay";i:81;s:20:"payment/moneybookers";i:82;s:14:"payment/nochex";i:83;s:15:"payment/paymate";i:84;s:16:"payment/paypoint";i:85;s:13:"payment/payza";i:86;s:26:"payment/perpetual_payments";i:87;s:18:"payment/pp_express";i:88;s:25:"payment/pp_payflow_iframe";i:89;s:14:"payment/pp_pro";i:90;s:21:"payment/pp_pro_iframe";i:91;s:17:"payment/pp_pro_pf";i:92;s:17:"payment/pp_pro_uk";i:93;s:19:"payment/pp_standard";i:94;s:15:"payment/sagepay";i:95;s:22:"payment/sagepay_direct";i:96;s:18:"payment/sagepay_us";i:97;s:19:"payment/twocheckout";i:98;s:28:"payment/web_payment_software";i:99;s:16:"payment/worldpay";i:100;s:10:"play/order";i:101;s:15:"pricing/pricing";i:102;s:27:"report/affiliate_commission";i:103;s:22:"report/customer_credit";i:104;s:22:"report/customer_online";i:105;s:21:"report/customer_order";i:106;s:22:"report/customer_reward";i:107;s:24:"report/product_purchased";i:108;s:21:"report/product_viewed";i:109;s:13:"report/report";i:110;s:18:"report/sale_coupon";i:111;s:17:"report/sale_order";i:112;s:18:"report/sale_return";i:113;s:20:"report/sale_shipping";i:114;s:15:"report/sale_tax";i:115;s:14:"sale/affiliate";i:116;s:12:"sale/contact";i:117;s:11:"sale/coupon";i:118;s:13:"sale/customer";i:119;s:20:"sale/customer_ban_ip";i:120;s:19:"sale/customer_group";i:121;s:10:"sale/order";i:122;s:14:"sale/recurring";i:123;s:11:"sale/return";i:124;s:9:"sale/sale";i:125;s:12:"sale/voucher";i:126;s:18:"sale/voucher_theme";i:127;s:15:"setting/setting";i:128;s:13:"setting/store";i:129;s:16:"shipping/auspost";i:130;s:17:"shipping/citylink";i:131;s:14:"shipping/fedex";i:132;s:13:"shipping/flat";i:133;s:13:"shipping/free";i:134;s:13:"shipping/item";i:135;s:23:"shipping/parcelforce_48";i:136;s:15:"shipping/pickup";i:137;s:19:"shipping/royal_mail";i:138;s:12:"shipping/ups";i:139;s:13:"shipping/usps";i:140;s:15:"shipping/weight";i:141;s:13:"system/system";i:142;s:11:"tool/backup";i:143;s:14:"tool/error_log";i:144;s:12:"total/coupon";i:145;s:12:"total/credit";i:146;s:14:"total/handling";i:147;s:16:"total/klarna_fee";i:148;s:19:"total/low_order_fee";i:149;s:12:"total/reward";i:150;s:14:"total/shipping";i:151;s:15:"total/sub_total";i:152;s:9:"total/tax";i:153;s:11:"total/total";i:154;s:13:"total/voucher";i:155;s:9:"user/user";i:156;s:20:"user/user_permission";}}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_village`
--

CREATE TABLE IF NOT EXISTS `oc_village` (
  `village_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL,
  `date_added` date NOT NULL,
  `date_modified` date NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`village_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_history`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'data/demo/canon_eos_5d_2.jpg'),
(7, 'data/demo/gift-voucher-birthday.jpg'),
(6, 'data/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4039 ;

--
-- Dumping data for table `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(4038, 25, 'Bumthang', '', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(4036, 25, 'Zhemgang', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=72 ;

--
-- Dumping data for table `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(68, 99, 1505, 6, '2014-03-07 10:25:16', '0000-00-00 00:00:00'),
(70, 99, 1506, 5, '2014-04-02 11:57:30', '0000-00-00 00:00:00'),
(69, 99, 1506, 7, '2014-04-02 11:50:18', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
