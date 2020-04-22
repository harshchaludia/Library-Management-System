-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2020 at 12:39 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_key` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `author` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_key`, `title`, `author`, `subject`) VALUES
(121, 'Purus Maecenas Libero ', 'Declan Evans', 'Fiction'),
(122, 'Nisi Mauris ', 'Micah Bauer', 'Amet Literature'),
(123, 'Tincidunt Congue Turpis', 'Austin Rivera', ' Mystery'),
(124, 'Porttitor Scelerisque ', 'Nasim Sandoval', 'Romance'),
(125, 'Vitae Erat Vivamus', 'Byron Mack', ' Science'),
(126, 'Sem War', 'Silas Reynolds', ' History'),
(127, 'Elit Nulla ', 'Bradley Stanley', 'Law');

-- --------------------------------------------------------

--
-- Table structure for table `book_availability`
--

CREATE TABLE `book_availability` (
  `id` int(11) NOT NULL,
  `book_key` int(10) DEFAULT 0,
  `copies_available` int(20) NOT NULL,
  `in_stock` int(11) NOT NULL,
  `rental_eligible` text NOT NULL,
  `rented_copies` int(10) NOT NULL,
  `books_on_loan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_availability`
--

INSERT INTO `book_availability` (`id`, `book_key`, `copies_available`, `in_stock`, `rental_eligible`, `rented_copies`, `books_on_loan`) VALUES
(1, 121, 3, 5, 'false', 2, 0),
(2, 122, 2, 5, 'true', 0, 3),
(3, 123, 2, 4, 'true', 1, 1),
(4, 124, 3, 6, 'true', 0, 3),
(5, 125, 6, 7, 'false', 1, 0),
(6, 126, 7, 8, 'false', 1, 0),
(7, 127, 5, 6, 'false', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `book_information`
--

CREATE TABLE `book_information` (
  `book_key` int(10) DEFAULT 1,
  `isbn` int(20) NOT NULL,
  `langugae` text NOT NULL,
  `binding` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_information`
--

INSERT INTO `book_information` (`book_key`, `isbn`, `langugae`, `binding`) VALUES
(124, 14211134, 'French', 'hard'),
(123, 81086539, 'English', 'soft'),
(125, 229922518, 'French', 'hard'),
(122, 676625198, 'English', 'soft'),
(121, 730635632, 'English', 'hard'),
(127, 779635592, 'French', 'soft'),
(126, 851481145, 'English', 'hard');

-- --------------------------------------------------------

--
-- Table structure for table `book_issued_details`
--

CREATE TABLE `book_issued_details` (
  `receipt_no` int(10) NOT NULL,
  `book_key` int(10) DEFAULT 2,
  `issued_book_id` int(10) NOT NULL,
  `date_issued` date NOT NULL,
  `lend_type` text NOT NULL,
  `grace_period` varchar(50) NOT NULL,
  `time_issued_to_return` varchar(50) NOT NULL,
  `issued_to_member` int(10) DEFAULT 555555555,
  `issued_by_staff` int(10) DEFAULT 888888888
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_issued_details`
--

INSERT INTO `book_issued_details` (`receipt_no`, `book_key`, `issued_book_id`, `date_issued`, `lend_type`, `grace_period`, `time_issued_to_return`, `issued_to_member`, `issued_by_staff`) VALUES
(780, 124, 9, '2019-01-28', 'loan', '2 month', '2019-07-12', 645313005, 658442161),
(781, 123, 7, '2019-02-22', 'loan', '1 month', '2019-08-22', 304073483, 195720170),
(782, 122, 3, '2019-07-21', 'loan', '1 month', '2019-12-15', 256776597, 195720170),
(783, 124, 10, '2019-08-08', 'loan', '1 month', '2020-02-24', 370942977, 470835606),
(784, 127, 13, '2019-08-26', 'loan', '1 month', '2020-01-14', 256776597, 837797042),
(785, 126, 12, '2019-10-02', 'rent', '2 month', '2020-03-03', 102644032, 837797042),
(786, 122, 4, '2019-11-10', 'loan', '2 month', '2020-02-12', 667969801, 470835606),
(787, 121, 1, '2019-11-26', 'rent', '1 month', '2020-05-13', 256776597, 479194504),
(788, 125, 11, '2019-12-08', 'rent', '2 month', '2020-03-22', 645313005, 837797042),
(789, 123, 6, '2019-12-22', 'rent', '2 month', '2020-05-18', 256776597, 479194504),
(790, 122, 5, '2020-02-22', 'loan', '2 month', '2020-06-23', 492813885, 665257443),
(791, 124, 8, '2020-04-15', 'loan', '1 month', '2020-08-12', 105512344, 658442161),
(792, 121, 2, '2020-04-17', 'rent', '1 month', '2020-07-20', 645313005, 479194504);

-- --------------------------------------------------------

--
-- Table structure for table `library_card`
--

CREATE TABLE `library_card` (
  `ssn` int(10) NOT NULL,
  `expirty_date` date NOT NULL,
  `notice_comments` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `library_card`
--

INSERT INTO `library_card` (`ssn`, `expirty_date`, `notice_comments`) VALUES
(102644032, '2020-08-26', ' Your card expires in 4 months'),
(105512344, '2020-09-22', ' Your card expires in 5 months'),
(256776597, '2020-07-25', ' Your card expires in 3 months'),
(304073483, '2020-10-11', ' Your card expires in 6 months'),
(370942977, '2020-10-22', ' Your card expires in 6 months'),
(492813885, '2020-08-29', ' Your card expires in 4 months'),
(645313005, '2020-05-04', ' Your card expires in 1 months'),
(667969801, '2020-06-22', ' Your card expires in 2 months');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `ssn` int(10) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `address` varchar(100) NOT NULL,
  `campus_id` int(10) NOT NULL,
  `comments` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`ssn`, `phone_no`, `address`, `campus_id`, `comments`) VALUES
(102644032, '606-700-7707', '6138 Becker Street', 497970622, 'unleash magnetic methodologies'),
(105512344, '704-820-2238', '55 Green Drive', 790348557, 'synergize cross-platform infrastructures'),
(256776597, '258-260-5210', '50078 Macpherson Terrace', 545941825, 'disintermediate e-business niches'),
(304073483, '497-140-7462', '41027 Havey Plaza', 642180896, 'leverage extensible ROI'),
(370942977, '861-240-5495', '518 Fremont Drive', 119205960, 'drive global platforms'),
(492813885, '369-750-9560', '81 Ridgeview Crossing', 289521491, 'synthesize 24/7 eyeballs'),
(645313005, '461-750-3506', '63 Everett Place', 155270639, 'maximize global metrics'),
(667969801, '579-170-9867', '68 Corscot Avenue', 241379299, 'integrate bricks-and-clicks mindshare');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `designation_id` int(10) DEFAULT 0,
  `ssn` int(10) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`designation_id`, `ssn`, `name`) VALUES
(1, 195720170, 'Nita Schoenrock'),
(1, 470835606, 'Claudie Clavey'),
(2, 479194504, 'Randee Grayley'),
(4, 658442161, 'Violante Janjusevic'),
(3, 665257443, 'Annalee Rottery'),
(2, 837797042, 'Adel Yankov');

-- --------------------------------------------------------

--
-- Table structure for table `staff_designation`
--

CREATE TABLE `staff_designation` (
  `designation_id` int(10) NOT NULL,
  `designation_type` text NOT NULL,
  `designation_power` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff_designation`
--

INSERT INTO `staff_designation` (`designation_id`, `designation_type`, `designation_power`) VALUES
(1, 'department_staff', 0),
(2, 'library_assistant', 0),
(3, 'reference_staff', 1),
(4, 'cashier', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_key`);

--
-- Indexes for table `book_availability`
--
ALTER TABLE `book_availability`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `book_key_2` (`book_key`),
  ADD KEY `book_key` (`book_key`);

--
-- Indexes for table `book_information`
--
ALTER TABLE `book_information`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `book_key` (`book_key`);

--
-- Indexes for table `book_issued_details`
--
ALTER TABLE `book_issued_details`
  ADD PRIMARY KEY (`receipt_no`),
  ADD KEY `issued_by_staff` (`issued_to_member`),
  ADD KEY `issued_by_staff_2` (`issued_by_staff`),
  ADD KEY `book_key` (`book_key`);

--
-- Indexes for table `library_card`
--
ALTER TABLE `library_card`
  ADD PRIMARY KEY (`ssn`),
  ADD KEY `ssn` (`ssn`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`ssn`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`ssn`),
  ADD KEY `designation_id` (`designation_id`),
  ADD KEY `ssn` (`ssn`);

--
-- Indexes for table `staff_designation`
--
ALTER TABLE `staff_designation`
  ADD PRIMARY KEY (`designation_id`),
  ADD KEY `designation_id` (`designation_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book_availability`
--
ALTER TABLE `book_availability`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_availability`
--
ALTER TABLE `book_availability`
  ADD CONSTRAINT `book_availability_ibfk_1` FOREIGN KEY (`book_key`) REFERENCES `book` (`book_key`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `book_information`
--
ALTER TABLE `book_information`
  ADD CONSTRAINT `book_information_ibfk_1` FOREIGN KEY (`book_key`) REFERENCES `book` (`book_key`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `book_issued_details`
--
ALTER TABLE `book_issued_details`
  ADD CONSTRAINT `book_issued_details_ibfk_1` FOREIGN KEY (`issued_by_staff`) REFERENCES `staff` (`ssn`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `book_issued_details_ibfk_2` FOREIGN KEY (`book_key`) REFERENCES `book` (`book_key`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `book_issued_details_ibfk_3` FOREIGN KEY (`issued_to_member`) REFERENCES `member` (`ssn`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `library_card`
--
ALTER TABLE `library_card`
  ADD CONSTRAINT `library_card_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `member` (`ssn`) ON UPDATE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`designation_id`) REFERENCES `staff_designation` (`designation_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
