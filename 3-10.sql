-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.0.45-community-nt - MySQL Community Edition (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for db_railway
CREATE DATABASE IF NOT EXISTS `db_railway` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_railway`;

-- Dumping structure for table db_railway.tbl_admin
CREATE TABLE IF NOT EXISTS `tbl_admin` (
  `admin_id` int(11) NOT NULL auto_increment,
  `adminuname` varchar(50) NOT NULL default '0',
  `adminpwd` varchar(50) NOT NULL default '0',
  PRIMARY KEY  (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table db_railway.tbl_admin: ~1 rows (approximately)
DELETE FROM `tbl_admin`;
/*!40000 ALTER TABLE `tbl_admin` DISABLE KEYS */;
INSERT INTO `tbl_admin` (`admin_id`, `adminuname`, `adminpwd`) VALUES
	(1, 'admin', 'admin123');
/*!40000 ALTER TABLE `tbl_admin` ENABLE KEYS */;

-- Dumping structure for table db_railway.tbl_compartment
CREATE TABLE IF NOT EXISTS `tbl_compartment` (
  `com_id` int(11) NOT NULL auto_increment,
  `com_name` varchar(50) NOT NULL default '0',
  PRIMARY KEY  (`com_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table db_railway.tbl_compartment: ~5 rows (approximately)
DELETE FROM `tbl_compartment`;
/*!40000 ALTER TABLE `tbl_compartment` DISABLE KEYS */;
INSERT INTO `tbl_compartment` (`com_id`, `com_name`) VALUES
	(1, 'general'),
	(2, 'sleeper'),
	(3, 'ladies'),
	(4, 'Ac coach'),
	(5, 'D coach');
/*!40000 ALTER TABLE `tbl_compartment` ENABLE KEYS */;

-- Dumping structure for table db_railway.tbl_day
CREATE TABLE IF NOT EXISTS `tbl_day` (
  `day_id` int(11) NOT NULL auto_increment,
  `day_name` varchar(50) NOT NULL default '0',
  PRIMARY KEY  (`day_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table db_railway.tbl_day: ~3 rows (approximately)
DELETE FROM `tbl_day`;
/*!40000 ALTER TABLE `tbl_day` DISABLE KEYS */;
INSERT INTO `tbl_day` (`day_id`, `day_name`) VALUES
	(1, 'Monday'),
	(2, 'Tuesday'),
	(3, 'Wednesday'),
	(4, 'Thursday'),
	(5, 'Friday'),
	(6, 'Saturday'),
	(7, 'Sunday');
/*!40000 ALTER TABLE `tbl_day` ENABLE KEYS */;

-- Dumping structure for table db_railway.tbl_fare
CREATE TABLE IF NOT EXISTS `tbl_fare` (
  `fare_id` int(11) NOT NULL auto_increment,
  `train_id` int(11) NOT NULL,
  `com_id` date NOT NULL,
  `fare_rate` int(11) NOT NULL,
  PRIMARY KEY  (`fare_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_railway.tbl_fare: ~0 rows (approximately)
DELETE FROM `tbl_fare`;
/*!40000 ALTER TABLE `tbl_fare` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_fare` ENABLE KEYS */;

-- Dumping structure for table db_railway.tbl_registration
CREATE TABLE IF NOT EXISTS `tbl_registration` (
  `reg_id` int(11) NOT NULL auto_increment,
  `reg_fname` varchar(50) NOT NULL default '0',
  `reg_mname` varchar(50) NOT NULL default '0',
  `reg_lname` varchar(50) NOT NULL default '0',
  `address` varchar(50) NOT NULL default '0',
  `gender` varchar(50) NOT NULL default '0',
  `dob` date NOT NULL,
  `mob` varchar(50) NOT NULL default '0',
  `email` varchar(50) NOT NULL default '0',
  `uname` varchar(50) NOT NULL default '0',
  `pwd` varchar(50) NOT NULL default '0',
  PRIMARY KEY  (`reg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table db_railway.tbl_registration: ~1 rows (approximately)
DELETE FROM `tbl_registration`;
/*!40000 ALTER TABLE `tbl_registration` DISABLE KEYS */;
INSERT INTO `tbl_registration` (`reg_id`, `reg_fname`, `reg_mname`, `reg_lname`, `address`, `gender`, `dob`, `mob`, `email`, `uname`, `pwd`) VALUES
	(1, 'Gopika', 'K', 'Gopi', 'Kallarkudy', 'Female', '1996-06-03', '9526290469', 'gopikakgopi110@gmail.com', 'gopz', '1234');
/*!40000 ALTER TABLE `tbl_registration` ENABLE KEYS */;

-- Dumping structure for table db_railway.tbl_route
CREATE TABLE IF NOT EXISTS `tbl_route` (
  `route_id` int(11) NOT NULL auto_increment,
  `route_name` varchar(50) NOT NULL default '0',
  `route_distance` int(11) NOT NULL default '0',
  PRIMARY KEY  (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table db_railway.tbl_route: ~2 rows (approximately)
DELETE FROM `tbl_route`;
/*!40000 ALTER TABLE `tbl_route` DISABLE KEYS */;
INSERT INTO `tbl_route` (`route_id`, `route_name`, `route_distance`) VALUES
	(1, 'TVM-Kannur', 350),
	(2, 'Kannur-TVM', 350),
	(3, 'Alappuzha-Kozhikode', 229),
	(4, 'Kozhikode-Alappuzha', 229),
	(5, 'Palakkad-Kasargod', 303),
	(6, 'Kasargod-Palakkad', 303);
/*!40000 ALTER TABLE `tbl_route` ENABLE KEYS */;

-- Dumping structure for table db_railway.tbl_route_station
CREATE TABLE IF NOT EXISTS `tbl_route_station` (
  `rs_id` int(11) NOT NULL auto_increment,
  `route_id` int(11) NOT NULL default '0',
  `station_id` int(11) NOT NULL default '0',
  `rs_distance` double NOT NULL,
  PRIMARY KEY  (`rs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table db_railway.tbl_route_station: ~10 rows (approximately)
DELETE FROM `tbl_route_station`;
/*!40000 ALTER TABLE `tbl_route_station` DISABLE KEYS */;
INSERT INTO `tbl_route_station` (`rs_id`, `route_id`, `station_id`, `rs_distance`) VALUES
	(15, 2, 2, 468);
/*!40000 ALTER TABLE `tbl_route_station` ENABLE KEYS */;

-- Dumping structure for table db_railway.tbl_seat
CREATE TABLE IF NOT EXISTS `tbl_seat` (
  `seat_id` int(11) NOT NULL auto_increment,
  `seat_count` int(11) NOT NULL,
  `train_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  PRIMARY KEY  (`seat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table db_railway.tbl_seat: ~3 rows (approximately)
DELETE FROM `tbl_seat`;
/*!40000 ALTER TABLE `tbl_seat` DISABLE KEYS */;
INSERT INTO `tbl_seat` (`seat_id`, `seat_count`, `train_id`, `com_id`) VALUES
	(1, 58, 1, 1),
	(2, 5565, 2, 2),
	(3, 44, 1, 3);
/*!40000 ALTER TABLE `tbl_seat` ENABLE KEYS */;

-- Dumping structure for table db_railway.tbl_station
CREATE TABLE IF NOT EXISTS `tbl_station` (
  `station_id` int(11) NOT NULL auto_increment,
  `station_name` varchar(50) NOT NULL default '0',
  `station_master` varchar(50) NOT NULL default '0',
  `station_phno` varchar(50) NOT NULL default '0',
  PRIMARY KEY  (`station_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table db_railway.tbl_station: ~6 rows (approximately)
DELETE FROM `tbl_station`;
/*!40000 ALTER TABLE `tbl_station` DISABLE KEYS */;
INSERT INTO `tbl_station` (`station_id`, `station_name`, `station_master`, `station_phno`) VALUES
	(1, 'Kollam', 'aasas', '123'),
	(2, 'Kannur', 'Kannur', '9746694035'),
	(3, 'Trivandrum', 'Trivandrum', '9746694035'),
	(4, 'KozhiKode', 'KozhiKode', '9746694035'),
	(5, 'Malapuram', 'Malapuram', '9746694035'),
	(6, 'Palakadu', 'Palakadu', '9746694035');
/*!40000 ALTER TABLE `tbl_station` ENABLE KEYS */;

-- Dumping structure for table db_railway.tbl_train
CREATE TABLE IF NOT EXISTS `tbl_train` (
  `train_id` int(11) NOT NULL auto_increment,
  `train_name` varchar(50) NOT NULL default '0',
  `train_type` varchar(50) NOT NULL default '0',
  `train_status` varchar(50) NOT NULL default '0',
  `train_no` int(11) NOT NULL default '0',
  PRIMARY KEY  (`train_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table db_railway.tbl_train: ~4 rows (approximately)
DELETE FROM `tbl_train`;
/*!40000 ALTER TABLE `tbl_train` DISABLE KEYS */;
INSERT INTO `tbl_train` (`train_id`, `train_name`, `train_type`, `train_status`, `train_no`) VALUES
	(1, 'Nilambur Road Palakkad Passenger', 'Passenger', '', 56610),
	(2, 'Prasuram Express', 'Express', '', 16650),
	(3, 'Eranad Express', 'Express', '', 16605),
	(4, 'Mangala Lakshadweep SF Express', 'Super Fast', '', 12617);
/*!40000 ALTER TABLE `tbl_train` ENABLE KEYS */;

-- Dumping structure for table db_railway.tbl_trainroutehead
CREATE TABLE IF NOT EXISTS `tbl_trainroutehead` (
  `trainroutehead_id` int(11) NOT NULL auto_increment,
  `train_id` varchar(50) default '0',
  `rout_id` varchar(50) default '0',
  PRIMARY KEY  (`trainroutehead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_railway.tbl_trainroutehead: ~0 rows (approximately)
DELETE FROM `tbl_trainroutehead`;
/*!40000 ALTER TABLE `tbl_trainroutehead` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_trainroutehead` ENABLE KEYS */;

-- Dumping structure for table db_railway.tbl_trainroute_details
CREATE TABLE IF NOT EXISTS `tbl_trainroute_details` (
  `trainroutedet_id` int(11) NOT NULL auto_increment,
  `day_id` int(11) NOT NULL default '0',
  `rs_id` int(11) NOT NULL default '0',
  `arrival_time` time default NULL,
  `departuretime` time default NULL,
  PRIMARY KEY  (`trainroutedet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_railway.tbl_trainroute_details: ~0 rows (approximately)
DELETE FROM `tbl_trainroute_details`;
/*!40000 ALTER TABLE `tbl_trainroute_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_trainroute_details` ENABLE KEYS */;

-- Dumping structure for table db_railway.tbl_traintype
CREATE TABLE IF NOT EXISTS `tbl_traintype` (
  `traintype_id` int(11) NOT NULL auto_increment,
  `traintype_name` varchar(50) NOT NULL default '0',
  `traintype_speed` int(11) NOT NULL default '0',
  PRIMARY KEY  (`traintype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table db_railway.tbl_traintype: ~4 rows (approximately)
DELETE FROM `tbl_traintype`;
/*!40000 ALTER TABLE `tbl_traintype` DISABLE KEYS */;
INSERT INTO `tbl_traintype` (`traintype_id`, `traintype_name`, `traintype_speed`) VALUES
	(1, 'Express', 36),
	(2, 'Fast passenger', 80),
	(3, 'Super Fast', 60),
	(4, 'Passenger', 45);
/*!40000 ALTER TABLE `tbl_traintype` ENABLE KEYS */;

-- Dumping structure for table db_railway.tbl_train_route
CREATE TABLE IF NOT EXISTS `tbl_train_route` (
  `tr_id` int(11) NOT NULL auto_increment,
  `train_id` int(11) NOT NULL default '0',
  `rs_id` int(11) NOT NULL default '0',
  `tr_arrivaltime` time NOT NULL default '00:00:00',
  `tr_departuretime` time NOT NULL default '00:00:00',
  `day_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`tr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_railway.tbl_train_route: ~0 rows (approximately)
DELETE FROM `tbl_train_route`;
/*!40000 ALTER TABLE `tbl_train_route` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_train_route` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
