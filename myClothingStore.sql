-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 14, 2024 at 12:58 AM
-- Server version: 5.7.40
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clothingstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

DROP TABLE IF EXISTS `tbladmin`;
CREATE TABLE IF NOT EXISTS `tbladmin` (
  `adminID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`adminID`, `name`, `username`, `password`, `email`) VALUES
(1, 'Keaton Makuva', 'kmakuva', '$2y$10$OLPie6afx.91Rdcf3rIT.O32RYFFDoAh7v6yE1CuFMoIGj3IYxTdK', 'keaton.makuva@gmail.com'),
(2, 'David White', 'dwhite', '$2y$10$5kcVMN2ozn7TGr2bAIu/xu9.jFxLjkr6JgyFurK9KXX6HLELn5gcK', 'dwhite@bing.com'),
(3, 'Olivia Black', 'oblack', '$2y$10$hNjRND9GFQYT/hXaKhylau7dnw383dyD8HxdfT4q32g8ex67mQIfm', 'oblack@well.com'),
(4, 'James Blue', 'jblue', '$2y$10$xhK4Ips0i5Xewhdw0bA/3.vTHLCTRrbZjQQNzhoabGDwaziMWP4aO', 'jblue@example.com'),
(5, 'Sophia Red', 'sred', '$2y$10$0ZbfdwQHrgVnrXDUOlQHx.KIi/fhiU2TYSSR/cvGl/S91oWiydu4q', 'sred@dibbs.com');

-- --------------------------------------------------------

--
-- Table structure for table `tblaorder`
--

DROP TABLE IF EXISTS `tblaorder`;
CREATE TABLE IF NOT EXISTS `tblaorder` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `adminID` int(11) NOT NULL,
  `orderDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `orderStatus` varchar(50) DEFAULT NULL,
  `totalAmount` decimal(10,2) NOT NULL,
  `shippingAddress` varchar(255) NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `userID` (`userID`),
  KEY `adminID` (`adminID`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblaorder`
--

INSERT INTO `tblaorder` (`orderID`, `userID`, `adminID`, `orderDate`, `orderStatus`, `totalAmount`, `shippingAddress`) VALUES
(1, 2, 3, '2024-10-09 12:25:00', 'Shipped', '280.00', '456 Birch St Forest Hill'),
(2, 3, 2, '2024-10-10 05:50:00', 'Pending', '450.75', '789 Cedar St Mountain View'),
(3, 1, 3, '2024-10-11 08:15:00', 'Delivered', '180.25', '123 Walnut St Hilltop'),
(4, 3, 3, '2024-10-13 06:55:00', 'Canceled', '500.50', '789 Maple St Forest Hill'),
(5, 1, 1, '2024-10-14 09:20:00', 'Pending', '425.00', '123 Birch St Springfield'),
(6, 2, 2, '2024-10-15 06:05:00', 'Shipped', '299.99', '456 Pine St Redwood'),
(7, 3, 1, '2024-10-16 07:30:00', 'Delivered', '350.00', '789 Oak St Springfield'),
(8, 1, 2, '2024-10-17 10:00:00', 'Canceled', '225.50', '123 Elm St Riverside'),
(9, 2, 3, '2024-10-18 08:45:00', 'Pending', '500.00', '456 Cedar St Mountain View'),
(10, 3, 3, '2024-10-19 09:15:00', 'Shipped', '150.75', '789 Birch St Hillside'),
(11, 1, 1, '2024-10-20 05:40:00', 'Delivered', '350.50', '123 Maple St Forest Hill'),
(12, 3, 2, '2024-10-21 12:20:00', 'Pending', '275.00', '789 Oak St Mountain View'),
(13, 2, 1, '2024-10-22 13:00:00', 'Shipped', '450.25', '456 Pine St Springfield'),
(14, 1, 2, '2024-10-23 14:30:00', 'Canceled', '200.00', '123 Birch St Redwood'),
(15, 3, 1, '2024-10-24 11:45:00', 'Pending', '500.00', '789 Walnut St Riverside'),
(16, 1, 3, '2024-10-25 07:10:00', 'Shipped', '325.50', '123 Cedar St Mountain View'),
(17, 3, 2, '2024-10-26 09:25:00', 'Delivered', '180.00', '789 Maple St Springfield'),
(18, 2, 3, '2024-10-27 10:40:00', 'Pending', '350.75', '456 Oak St Redwood'),
(19, 1, 1, '2024-10-28 05:55:00', 'Shipped', '400.50', '123 Pine St Forest Hill'),
(20, 3, 3, '2024-10-29 08:20:00', 'Canceled', '450.00', '789 Walnut St Hillside'),
(21, 2, 1, '2024-10-30 09:10:00', 'Pending', '275.00', '456 Cedar St Riverside'),
(22, 3, 1, '2024-10-31 07:30:00', 'Shipped', '500.00', '789 Pine St Springfield'),
(23, 1, 2, '2024-11-01 05:00:00', 'Delivered', '250.75', '123 Oak St Redwood'),
(24, 2, 3, '2024-11-02 06:45:00', 'Canceled', '300.00', '456 Birch St Mountain View'),
(25, 3, 2, '2024-11-03 09:00:00', 'Pending', '200.25', '789 Cedar St Hillside'),
(26, 1, 1, '2024-11-04 08:35:00', 'Shipped', '175.50', '123 Walnut St Redwood'),
(27, 3, 3, '2024-11-05 11:50:00', 'Delivered', '350.00', '789 Maple St Forest Hill'),
(28, 2, 1, '2024-11-06 12:00:00', 'Pending', '425.75', '456 Pine St Redwood'),
(29, 3, 2, '2024-11-07 10:30:00', 'Canceled', '220.00', '789 Oak St Riverside'),
(30, 1, 3, '2024-11-08 08:10:00', 'Delivered', '275.00', '123 Pine St Springfield');

-- --------------------------------------------------------

--
-- Table structure for table `tblclothes`
--

DROP TABLE IF EXISTS `tblclothes`;
CREATE TABLE IF NOT EXISTS `tblclothes` (
  `clothes_id` int(11) NOT NULL AUTO_INCREMENT,
  `clothes_name` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `size` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`clothes_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblclothes`
--

INSERT INTO `tblclothes` (`clothes_id`, `clothes_name`, `description`, `price`, `size`, `color`, `stock_quantity`, `image_path`, `category`) VALUES
(1, 'Womens Shorts', 'A stylish short', '170.00', 'S', 'blue', 8, '_images/womens_shorts.jpg', 'Women'),
(2, 'Cargo Pants', 'Winter pants', '170.00', 'M', 'green', 8, '_images/cargo_pants.jpg', 'Women'),
(3, 'Red shirt ', 'summer clothing ', '350.00', 'M', 'red', 17, '_images/shirt.jpg', 'Men'),
(4, 'blue shirt ', 'summer clothing ', '350.00', 'M', 'blue', 17, '_images/tshirt.jpg', 'Men'),
(5, 'blue shirt ', 'summer clothing ', '350.00', 'M', 'blue', 17, '_images/blew.jpg', 'Men'),
(6, 'suite ', 'Mens Classic Suite ', '340.00', 'L', 'blue', 6, '_images/mens_suite.webp', 'Men'),
(7, 'Floral Classic Suite ', 'Womens Floral Classic Suite ', '213.00', 'L', 'pink', 12, '_images/womens_suite.webp', 'Women'),
(8, 'Track Pants', 'Mens blue trackpants ', '98.00', 'S', 'blue', 6, '_images/mens_trackpants.webp', 'Men');

-- --------------------------------------------------------

--
-- Table structure for table `tblseller`
--

DROP TABLE IF EXISTS `tblseller`;
CREATE TABLE IF NOT EXISTS `tblseller` (
  `sellerID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` enum('pending','verified','rejected') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`sellerID`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblseller`
--

INSERT INTO `tblseller` (`sellerID`, `name`, `username`, `password`, `email`, `status`) VALUES
(1, 'Victoria Ross', 'vross', '$2y$10$tsVytAB2M55K1tqvopH9SOTFveXsI25v4FxZRjCfMJAoNFsO7s1zu', 'vross@domain.com', 'verified'),
(2, 'Ethan Brown', 'ebrown', '$2y$10$e0wmkoFxy9uPWRKoa1Fprue8my.klfdZYu86yIapkinveWVXh0NMu', 'ebrown@webmail.com', 'pending'),
(3, 'Ava Davis', 'adavis', '$2y$10$kdeZl.Dlp25CAcQCin89BOiRwF9TaQ0d5/I5gm/nsRACkEz9pp70q', 'adavis@domain.com', 'pending'),
(4, 'Isabella White', 'iwhite', '$2y$10$7fsGie33XtbjqjeW7kRLS.PrTWiuSEGZ6XmUjnVp5C8sFq46EiXwO', 'iwhite@domain.com', 'rejected'),
(5, 'Amelia Harris', 'aharris', '$2y$10$YAx70/8wArWMIw0rL2KKlOqdp9boJP6tY97YKrFobCoD9ThWXfdgm', 'aharris@mail.com', 'verified'),
(6, 'Kelly Ross', 'kross', '$2y$10$z61InV94nT3SES2AYj2p9O0TMDt7E.EKDU.2Xg6cbkgTYkOANwx9y', 'kross@domain.com', 'verified'),
(7, 'Jacob Martinez', 'jacobm', '$2y$10$Gn1ixNRNrnmdhLTTKT3CBOTEEZtBQuwxpsD0T0H6N17M6yZ5tDmbK', 'jacobm@gmail.com', 'verified'),
(8, 'Sophia Green', 'sophiag', '$2y$10$VMc6OMQt.FJzW0RbUXNeHudQwVqJ6lY4mXNFiF2QT1aIGInlrE6Cq', 'sophiag@webmail.com', 'pending'),
(9, 'Mason Robinson', 'masonr', '$2y$10$vvqrI5NkSRqskPB2MCVGOO3yGbLxZLzOXF5qqJaurc.OS/jqeqWX2', 'masonr@domain.com', 'rejected'),
(10, 'Lucas Taylor', 'lucast', '$2y$10$UJscUtY.lLn9tk60GgZsm.SRyoHYWOgL2KiqLc6t1LT4y.ZTvOlV.', 'lucast@aol.com', 'verified'),
(11, 'Lily Thomas', 'lilyt', '$2y$10$BdHOpg7bEewUUFIq9gpcW.y/RfoWFzxreePmaNnjazmazBehzYRDG', 'lilyt@domain.com', 'verified'),
(12, 'Henry White', 'henryw', '$2y$10$7BEhaEN06xv3VQFe6oniJ.l.A.xX.IAEJWEzN0YeCF5cxup/YXkOG', 'henryw@aol.com', 'pending'),
(13, 'Ethan Scott', 'ethans', '$2y$10$rouMQcEAJMrzi8iGNzg.6.j.TZIMiW0NOiwKIidm8VRGyUX6jF20a', 'ethans@gmail.com', 'rejected'),
(14, 'Emily Mitchell', 'emilym', '$2y$10$jCRuewwPcH1cSpy8mydwrOn19.psBg0XLwjGlletVqwjGb/ZJGfOS', 'emilym@domain.com', 'verified'),
(15, 'Zoe Garcia', 'zoeg', '$2y$10$o2reZBt9LwfLqTk2JrnZ8.ubbd76JEMV0UNPfyCHbcjU0qQg6SSAa', 'zoeg@gmail.com', 'verified'),
(16, 'Owen Lewis', 'owenl', '$2y$10$C9pNQiBP36Kxc4OxleQOF.pbRnoSW.pT14oaatZ3jNOon74gWu6sG', 'owenl@mail.com', 'pending'),
(17, 'Sophia Perez', 'sophiap', '$2y$10$e0tvhxDpitTKiG7d1phttuCDmKCUi6kI9wDRrTyclpj1Pfg6SfBxS', 'sophiap@outlook.com', 'verified'),
(18, 'Noah Walker', 'noahw', '$2y$10$LxdEA.KiyUX2309plYhsEuOBN5wbSfclpnPYuCATZP0w5vLQhXqcy', 'noahw@domain.com', 'rejected'),
(19, 'Ella Jackson', 'ellaj', '$2y$10$TOyd5rCYT4huNcXRl09LOuDlBNv5jBIj8z0rxwt2guz7atZEEIl7m', 'ellaj@gmail.com', 'pending'),
(20, 'William Clark', 'williamc', '$2y$10$WmXVpJwc38h7Ut04OGgmm.gK9W2Utth3O1qFkZrwvtNEVS/YZcghS', 'williamc@webmail.com', 'verified'),
(21, 'Aiden Johnson', 'aidenj', '$2y$10$PmvxsrvrM353E0imQvWMPOpT.2msJ4OFLgvH6YVn01gQ6Ph50Dhaa', 'aidenj@aol.com', 'rejected'),
(22, 'Liam Wilson', 'liamp', '$2y$10$ij5iBXsZFjd5j8QNy/9lk.KplEy8LEx2JMcKaatkVFa5lcRm0IuTW', 'liamw@domain.com', 'verified'),
(23, 'Charlotte Evans', 'charlottee', '$2y$10$ImF5qNcvKIRdg9Xh1cqOE.HXmv3u6Dp8vJRojw3l6rW2pX98L3mKK', 'charlottee@mail.com', 'pending'),
(24, 'Scarlett Moore', 'scarlettm', '$2y$10$Ys1TxrUNqOeNAv1oxnNPN.OAhWDBf/rDrnYL2or1SfroRZL61.eKG', 'scarlettm@webmail.com', 'rejected'),
(25, 'Madison Roberts', 'madisonr', '$2y$10$jq4R72p99eGOhjt7dE0nWOVsGUl2B02j7kcNnEu0OjOrU16HKfq2S', 'madisonr@domain.com', 'verified'),
(26, 'Benjamin Hall', 'benjaminh', '$2y$10$fCU2TYOBxGoTZjGJyRUza.HTXHLdKa8z8gTD0F1hrAQBtpDtfvgRG', 'benjaminh@outlook.com', 'pending'),
(27, 'Jacob Scott', 'jacobs', '$2y$10$Ny/kjdIeZRkvB7E6vVzaz.S/pBEuHUXZBc01dCHTWJJ8ZdJ6FlK/a', 'jacobs@gmail.com', 'verified'),
(28, 'Sophie Adams', 'sophiea', '$2y$10$9GRl/iHMOYWCAQfr9QhAoehbMX35maLZGUj/v2ibo6Py8mebHP3qO', 'sophiea@domain.com', 'rejected'),
(29, 'Jack Cooper', 'jackc', '$2y$10$7o2xyT2SuJaAEH7SCCs9duwj6NzrEKUYhe4rn0UMBMWlDNT34Ia3C', 'jackc@aol.com', 'pending'),
(30, 'James Lee', 'jamesl', '$2y$10$a0HFEhzkNw5bl7iCQ7j/f.//7ZCrCGoc83bFoDx4yvcwc/kidv2qi', 'jamesl@mail.com', 'verified');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

DROP TABLE IF EXISTS `tbluser`;
CREATE TABLE IF NOT EXISTS `tbluser` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` enum('pending','verified','rejected') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`userID`, `name`, `username`, `password`, `email`, `status`) VALUES
(1, 'Kgosi Makuva', 'kgosi', '$2y$10$z/dFk4W2Rz68PPXBHg2qHubBuROikNJyvj0DcCJfQTRE1xSnkop96', 'kgosimakuva@gmail.com', 'verified'),
(2, 'David Johnson', 'davidj', '$2y$10$/XC0t8rJeu.nvXgKJ8ZvnODMnjHrumJeccjxT32e8LpaAq6KgnfBO', 'davidj@outlook.com', 'verified'),
(3, 'Emily Garcia', 'emilyg', '$2y$10$gtTiZtyYKb5dDrgKUetYWOiKTN79/VabzBpVFPNpATD42pvbbm/tC', 'emilyg@gmail.com', 'rejected'),
(4, 'Christine Lee', 'chrisl', '$2y$10$2SL/53FdzZHNevWPhi03A.sG74dhcll.QvpUCTG004yEL0bpTbTBa', 'chrisl@live.com', 'pending'),
(5, 'Jack Martin', 'jackcam', '$2y$10$09McauCbLqoIwgXw6p3UNOhcB3OtwgeM15pheBVyBfaoAXNI/pWvW', 'jackm@hotmail.com', 'pending'),
(6, 'Sophia Turner', 'sophiat', '$2y$10$rQoU4ntHmOMdg4Je84dy2eZG2/FZRzkLoyKAacPAgDZ1QDqkKl9qO', 'sophiat@gmail.com', 'verified'),
(7, 'Michael Brown', 'mikeb', '$2y$10$AaG9gE7HZyOJPBsR5oz4JuSaSbNQsKAikINs2T4CaoopD/I6B4eDm', 'mikeb@yahoo.com', 'verified'),
(8, 'Olivia Davis', 'oliviad', '$2y$10$tpjy.IZrz7iGIl7YHkqJz.cSFGjGSqfXE9DN7.0I1WW59ZGh64NHq', 'oliviad@aol.com', 'rejected'),
(9, 'Liam Wilson', 'liamw', '$2y$10$GrExPwFr9JP..lNf./g6leX1rHs0jTiKXDq.vcLc9i/sGIY1B8FE.', 'liamw@outlook.com', 'verified'),
(10, 'Ava Moore', 'avamoore', '$2y$10$tvA914WbRb/ukljd5F9NVuYPQXM4XwfXGwp38rJ.TT.PHrUAo/jI6', 'ava.m@live.com', 'pending'),
(11, 'James Taylor', 'jamest', '$2y$10$EgcZ2fSi3vaJP2xbJBburOMGMTyKXxN2yXkxXmtilkisF2DZVOKSq', 'jamest@aol.com', 'verified'),
(12, 'Isabella Anderson', 'isabellaa', '$2y$10$WLLTrkrapSuHc7NxMZMMKeD7LlNMG4Bm9IuIlr9DCpNRreb1C2iX.', 'isabellaa@gmail.com', 'rejected'),
(13, 'Benjamin Thomas', 'benjaminb', '$2y$10$lj9j05hXOMAVcT19ypgSTeIMta.SHYk/DUB7E/wUwxNOl5lXjhgKG', 'benjaminb@hotmail.com', 'pending'),
(14, 'Mia Harris', 'miaharris', '$2y$10$gOcvrRu82wLZ1uJEpzDudezhB9BgX4O1lbpkwZQbJUPZGKu7XeUxa', 'miaharris@yahoo.com', 'verified'),
(15, 'Lucas Clark', 'lucasc', '$2y$10$OS1H1PzkqlECdF4PebJgxOrDu71P4.WMrRwC7DquTQ068WUsLLBZu', 'lucasc@aol.com', 'verified'),
(16, 'Charlotte Lewis', 'charlotte', '$2y$10$yz88KQqB4To4GnrKcRDVQuz3/cZhbPloVpcsgHGKaAKtAMfIbsKvG', 'charlotte@yahoo.com', 'pending'),
(17, 'Ethan Young', 'ethany', '$2y$10$vDbQZO47ALIFX6yYFYX5t.I3t0lpnuKZ65cyoCsgNI7qCHBz4xbfu', 'ethany@outlook.com', 'verified'),
(18, 'Amelia Walker', 'ameliaw', '$2y$10$BrHz78341dlxOcn6L4EeCuURqX7ZujqOeQpuAnLkxfeqUkxK02eGu', 'ameliaw@gmail.com', 'rejected'),
(19, 'Sebastian King', 'sebastiank', '$2y$10$30JOyvBsFKSWisISGLvCd.twJJc7JgnAo0gmsxX4Z4xGuACok0otK', 'sebastiank@aol.com', 'pending'),
(20, 'Harper Scott', 'harpers', '$2y$10$OF1xYL2K8X1dJgHHMSoN7.kSIybQa3tDEWA0elElJedAWhCtMLsCG', 'harpers@gmail.com', 'verified'),
(21, 'Jackson Allen', 'jacksona', '$2y$10$Q31gQFTZ/HzxselMkp4M8.nUOWtuE1Z.3oox0DwWQ7XkDGD6IQJ1O', 'jacksona@live.com', 'verified'),
(22, 'Madison Martinez', 'madisonm', '$2y$10$AwHOQUB6LMSI0gzftQCyCO.AKTRuexCkLrdUMfx49rzkRFlMN72p6', 'madisonm@yahoo.com', 'pending'),
(23, 'Ella Nelson', 'ellanelson', '$2y$10$hXiMrGl7zlw9vCghCsYPWejyYhn.AvthctcbamRomQvLTdkVHmSWS', 'ellanelson@gmail.com', 'verified'),
(24, 'Henry Carter', 'henryc', '$2y$10$uQYQ5cz0dwIDeu6Q69aTc.BUA9hvzYavMBaa0Vpm31Tk22AgVo4Zy', 'henryc@outlook.com', 'rejected'),
(25, 'Scarlett Mitchell', 'scarlett', '$2y$10$E3xtc7vXf2kBy/9H.2o/Qe5Y7pZvPrdw9wb6ZPiTMVVXBeZ1dn2RC', 'scarlettm@hotmail.com', 'pending'),
(26, 'William Moore', 'williamm', '$2y$10$MBiqFET21nXk7L6oWT.rQeQWee3KiinE5FC4d/RWudwRGVuriXNvS', 'williamm@yahoo.com', 'verified'),
(27, 'Sofia Hall', 'sofiah', '$2y$10$p3ohWUM7liDTSIDbwRzYNOg2HgS/AMctiPl/e88gPlb9infqMTovu', 'sofiah@aol.com', 'verified'),
(28, 'Jackson Davis', 'jacksond', '$2y$10$S.JA6TBqpwVv1uuTuoez2uKApo8TcCpAU7hSAMB18xK2BxgQNl.o2', 'jacksond@gmail.com', 'rejected'),
(29, 'Zoe Rodriguez', 'zoerodriguez', '$2y$10$Ia92FBhvS0j68NoLmbmDweygVYN.7DaVPA6aEZD8lzjCm.G/lYCqq', 'zoerodriguez@yahoo.com', 'pending'),
(30, 'Lily Perez', 'lilyp', '$2y$10$iat0JxOSm7t0CUdfXoftk.wQG9WcLaxW/pM6nBhGStJsrXWoJPdY6', 'lilyp@gmail.com', 'verified');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_item`
--

DROP TABLE IF EXISTS `tbl_item`;
CREATE TABLE IF NOT EXISTS `tbl_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `size` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `stock_quantity` int(11) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `category` enum('Men','Women','Babies') NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_item`
--

INSERT INTO `tbl_item` (`item_id`, `item_name`, `description`, `price`, `size`, `color`, `stock_quantity`, `image_path`, `category`) VALUES
(1, 'Womens Shorts', 'A stylish short', '170.00', 'S', 'blue', 8, '_images/womens_shorts.jpg', 'Women'),
(2, 'Cargo Pants', 'Winter pants', '170.00', 'M', 'green', 8, '_images/cargo_pants.jpg', 'Women'),
(3, 'Red shirt ', 'summer clothing ', '350.00', 'M', 'red', 17, '_images/shirt.jpg', 'Men'),
(4, 'blue shirt ', 'summer clothing ', '350.00', 'M', 'blue', 17, '_images/tshirt.jpg', 'Men'),
(5, 'blue shirt ', 'summer clothing ', '350.00', 'M', 'blue', 17, '_images/blew.jpg', 'Men'),
(6, 'suite ', 'Mens Classic Suite ', '340.00', 'L', 'blue', 6, '_images/mens_suite.webp', 'Men'),
(7, 'Floral Classic Suite ', 'Womens Floral Classic Suite ', '213.00', 'L', 'pink', 12, '_images/womens_suite.webp', 'Women'),
(8, 'Track Pants', 'Mens blue trackpants ', '98.00', 'S', 'blue', 6, '_images/mens_trackpants.webp', 'Men');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
