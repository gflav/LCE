-- phpMyAdmin SQL Dump
-- version 4.3.6
-- http://www.phpmyadmin.net
--
-- Host: us-nj.mysql.verthosting.com
-- Generation Time: Jun 06, 2015 at 02:21 PM
-- Server version: 5.6.21-1~dotdeb.1
-- PHP Version: 5.5.19-1~dotdeb.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gabef`
--

-- --------------------------------------------------------

--
-- Table structure for table `server_traders`
--

CREATE TABLE IF NOT EXISTS `server_traders` (
  `id` int(11) NOT NULL,
  `classname` varchar(128) NOT NULL,
  `instance` int(11) NOT NULL,
  `status` varchar(32) NOT NULL,
  `static` text,
  `desc` varchar(128) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `server_traders`
--

INSERT INTO `server_traders` (`id`, `classname`, `instance`, `status`, `static`, `desc`) VALUES
(1, 'CIV_EuroMan01_EP1', 11, 'friendly', NULL, 'Weapons Trader - Bash'),
(2, 'Rocker4', 11, 'friendly', NULL, 'Weapons Trader - Klen'),
(3, 'Woodlander3', 11, 'friendly', NULL, 'Parts Trader - Bash'),
(4, 'Woodlander1', 11, 'friendly', '', 'Parts Trader - Klen'),
(5, 'RU_WorkWoman1', 11, 'friendly', '["ItemCopperBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Copper Bar",101]', 'Can Trader - Klen'),
(6, 'RU_WorkWoman5', 11, 'friendly', '["ItemCopperBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Copper Bar",101]', 'Can Trader - Bash'),
(7, 'Rita_Ensler_EP1', 11, 'neutral', '["ItemCopperBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Copper Bar",101]', 'Can Trader - Stary'),
(8, 'CIV_EuroMan02_EP1', 11, 'friendly', '', 'Ammo Trader - Bash'),
(9, 'RU_Citizen3', 11, 'friendly', '', 'Ammo Trader - Klen'),
(10, 'Pilot_EP1', 11, 'neutral', '', 'Ammo Trader - Stary'),
(11, 'Worker3', 11, 'friendly', '', 'Auto Trader - Bash'),
(12, 'Profiteer4', 11, 'friendly', '', 'Auto Trader - Klen'),
(13, 'Dr_Hladik_EP1', 11, 'friendly', '["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]', 'Doctor - Bash'),
(14, 'Doctor', 11, 'friendly', '["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]', 'Doctor - Klen'),
(15, 'RU_Functionary1', 11, 'friendly', '', 'Hero Traders'),
(16, 'RU_Villager3', 11, 'neutral', '', 'Boat Trader'),
(17, 'TK_CIV_Takistani04_EP1', 11, 'neutral', '', 'High End Weapons'),
(18, 'RU_Citizen4', 11, 'neutral', '', 'Wholesaler - Solnichniy'),
(19, 'RU_Citizen1', 11, 'neutral', '', 'Wholesaler - Balota'),
(20, 'Functionary1', 1, 'friendly', '', 'Hero Traders'),
(21, 'RU_Profiteer3', 1, 'neutral', '', 'High End Weapons - Khush'),
(22, 'Profiteer1', 1, 'neutral', '', 'High End Ammo - Khush'),
(23, 'RU_Sportswoman5', 1, 'friendly', '["ItemCopperBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Copper Bar",101]', 'Can Trader - Khush'),
(24, 'TK_CIV_Takistani05_EP1', 1, 'friendly', '', 'Parts Trader - Khush'),
(25, 'Dr_Annie_Baker_EP1', 1, 'friendly', '["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]', 'Doctor - Khush'),
(26, 'Woodlander2', 1, 'friendly', '', 'Auto Trader - Khush'),
(27, 'TK_CIV_Takistani03_EP1', 1, 'friendly', '', 'Car Parts - Nur'),
(28, 'TK_CIV_Takistani06_EP1', 1, 'friendly', '', 'Weapons Trader - Nur'),
(29, 'TK_CIV_Takistani04_EP1', 1, 'friendly', '', 'Ammo Trader - Nur'),
(30, 'TK_CIV_Woman03_EP1', 1, 'friendly', '["ItemCopperBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Copper Bar",101]', 'Can Trader - Nur'),
(31, 'TK_CIV_Woman02_EP1', 1, 'friendly', '["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]', 'Doctor - Nur'),
(32, 'RU_Profiteer2', 1, 'friendly', '', 'Auto Trader - Garm'),
(33, 'TK_CIV_Takistani02_EP1', 1, 'friendly', '', 'Car Parts - Garm'),
(34, 'RU_Damsel4', 1, 'friendly', '["ItemCopperBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Copper Bar",101]', 'Can Trader - Garm'),
(35, 'RU_Woodlander3', 1, 'neutral', '', 'Wholesaler - South'),
(36, 'RU_Citizen4', 1, 'neutral', '', 'Wholesaler - North'),
(37, 'RU_Pilot', 1, 'neutral', '', 'Airplane Dealer'),
(38, 'RU_Worker1', 6, 'neutral', '', 'Whiskey''s Parts Shop'),
(39, 'Dr_Annie_Baker_EP1', 6, 'friendly', '["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]', 'Melly''s Medical'),
(40, 'CIV_EuroWoman01_EP1', 6, 'friendly', '', 'Alejandria''s General Supplies'),
(41, 'ibr_lingorman2s', 6, 'neutral', '', 'Blivion''s Wholesale Items'),
(42, 'Worker2', 6, 'friendly', '', 'Axle''s Repair Shop'),
(43, 'TK_CIV_Woman03_EP1', 6, 'friendly', '["ItemCopperBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Copper Bar",101]', 'Stella''s General Goods'),
(44, 'ibr_lingorman3s', 6, 'neutral', '', 'Clive''s Wholesale'),
(45, 'ibr_lingorman5s', 6, 'neutral', '', 'Big Bob''s Boats'),
(46, 'ibr_lingorman4s', 6, 'friendly', '', 'Juan''s Tour Boats'),
(47, 'ibr_lingorman2', 6, 'friendly', '', 'Jd''z Armed Boats'),
(48, 'Citizen2_EP1', 6, 'friendly', '', 'Green''s Quality Cars'),
(49, 'Worker1', 6, 'friendly', '', 'Lyle''s Parts'),
(50, 'RU_Madam3', 6, 'neutral', '["ItemCopperBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Copper Bar",101]', 'Bag Lady Gina'),
(51, 'Pilot', 6, 'friendly', '', 'Chip''s Choppers'),
(52, 'CIV_EuroMan02_EP1', 6, 'friendly', '', 'Jim''s Ammo'),
(53, 'CIV_EuroMan01_EP1', 6, 'friendly', '', 'Joe''s Weapons'),
(54, 'ibr_lingorman7s', 6, 'friendly', '', 'Rodger''s 4x4'),
(55, 'Damsel3', 6, 'friendly', '["ItemCopperBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Copper Bar",101]', 'Tina''s Tarts'),
(56, 'Rocker4', 6, 'friendly', '', 'Sly''s Moto'),
(57, 'Worker4', 6, 'neutral', '', 'Jim''s Used Cars'),
(58, 'ibr_lingorman7', 6, 'neutral', '', 'Chucks Weapons'),
(59, 'ibr_lingorman5', 6, 'neutral', '', 'Buck''s Shot'),
(60, 'Citizen3_EP1', 6, 'neutral', '', 'Santo''s Wholesale'),
(61, 'ibr_lingorman6', 6, 'friendly', '', 'Tire Guy'),
(62, 'ibr_lingorman6s', 6, 'friendly', '', 'Raul''s Parts'),
(63, 'TK_CIV_Woman02_EP1', 6, 'neutral', '', 'Samish Shop'),
(64, 'Pilot_EP1', 6, 'friendly', '', 'AWOL''s Planes'),
(65, 'TK_CIV_Worker01_EP1', 6, 'friendly', '', 'Rommelo''s Raceway'),
(66, 'RU_Doctor', 6, 'neutral', '["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]', 'Mad Scientist '),
(67, 'TK_CIV_Woman02_EP1', 4, 'neutral', '', 'Farhah''s General Supplies'),
(68, 'TK_CIV_Takistani05_EP1', 4, 'neutral', '', 'Akwhell''s Vehicles'),
(69, 'TK_CIV_Takistani03_EP1', 4, 'neutral', '', 'Amjad''s Ammunition'),
(70, 'TK_CIV_Takistani02_EP1', 4, 'neutral', '', 'Hassan''s Weapons'),
(71, 'CIV_EuroMan01_EP1', 4, 'friendly', '', 'Dan''s Parts'),
(72, 'CIV_EuroMan02_EP1', 4, 'friendly', '', 'Darren''s Auto'),
(73, 'Dr_Hladik_EP1', 4, 'friendly', '["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]', 'Dr. House'),
(74, 'CIV_EuroWoman01_EP1', 4, 'friendly', '', 'Heather''s General Supplies'),
(76, 'Worker1', 4, 'friendly', '', 'Greg''s Ammunition'),
(77, 'Tanny_PMC', 4, 'friendly', '', 'Joe''s Weapons'),
(78, 'Profiteer4', 4, 'friendly', '', 'Steven''s Hero Shop'),
(79, 'GUE_Worker2', 13, 'friendly', '', 'Pete''s Armed Choppers'),
(80, 'Soldier_Sniper_KSVK_PMC', 13, 'friendly', '', 'Jacks Weapons'),
(81, 'Soldier_GL_PMC', 13, 'friendly', '', 'Robby''s Ammo Dump'),
(82, 'GUE_Soldier_Pilot', 13, 'friendly', '', 'Hanz Unarmed Choppers'),
(83, 'GUE_Woodlander3', 13, 'friendly', '', 'Scott''s Repair Shop'),
(84, 'Worker4', 13, 'neutral', '', 'Capt. Yak'),
(85, 'Reynolds_PMC', 13, 'neutral', '', 'Wholesaler Reynolds'),
(86, 'Soldier_Sniper_PMC', 13, 'friendly', '', 'Chucks Hero Shop'),
(87, 'GUE_Soldier_3', 13, 'friendly', '', 'Tom''s Armed Vehicles'),
(88, 'RU_Doctor', 13, 'friendly', '', 'Dr. Hammond'),
(89, 'Doctor', 13, 'friendly', '', 'Bones'),
(90, 'UN_CDF_Soldier_Pilot_EP1', 13, 'friendly', '', 'Murdock''s Planes'),
(91, 'RU_Worker4', 13, 'neutral', '', 'Sven''s Parts'),
(92, 'RU_Woodlander4', 13, 'neutral', '', 'Slav''s Vehicles'),
(93, 'Citizen3', 13, 'neutral', '', 'Trin''s General Supplies'),
(94, 'RU_Damsel5', 13, 'friendly', '["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]', 'Melissa''s General Supplies'),
(95, 'Dr_Hladik_EP1', 13, 'neutral', '["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]', 'Dr. Vu'),
(96, 'GUE_Commander', 13, 'neutral', '', 'Gabriel''s Weapons'),
(97, 'GUE_Soldier_CO', 13, 'neutral', '', 'Cohaagen''s Ammunition'),
(98, 'Profiteer2_EP1', 13, 'neutral', '', 'Chad''s Armed Boats'),
(99, 'RU_Farmwife5', 13, 'neutral', '', 'Mrs. Doubtfire'),
(100, 'GUE_Woodlander1', 13, 'neutral', '', 'Dante''s Bandit Choppers'),
(101, 'RU_Worker1', 13, 'neutral', '', 'Javon''s Parts'),
(102, 'GUE_Soldier_2', 13, 'neutral', '', 'Wholesaler Darren'),
(103, 'Worker2', 11, 'neutral', '', 'Airplane Dealer'),
(104, 'GUE_Villager4', 15, 'friendly', '', 'Bastions Parts Supplies'),
(105, 'RU_Farmwife4', 15, 'friendly', '["ItemCopperBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Copper Bar",101]', 'Alda''s General Supplies'),
(106, 'RU_Farmwife3', 15, 'neutral', '["ItemCopperBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Copper Bar",101]', 'Carole''s General Supplies'),
(107, 'Dr_Hladik_EP1', 15, 'friendly', '["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]', 'Dr. Zoidberg'),
(108, 'CIV_Contractor2_BAF', 15, 'friendly', '', 'High End Ammo'),
(109, 'Soldier_Sniper_PMC', 15, 'friendly', '', 'High End Weapons'),
(110, 'GUE_Soldier_Pilot', 15, 'friendly', '', 'Rutahn''s Vehicles.'),
(111, 'GUE_Soldier_2', 15, 'neutral', '', 'Rhven''s Weapons'),
(112, 'GUE_Soldier_1', 15, 'neutral', '', 'Merkaba''s Ammo'),
(113, 'GUE_Soldier_CO', 15, 'neutral', '', 'Robsyah''s Choppers'),
(114, 'GUE_Woodlander2', 15, 'friendly', '', 'Popeye''s Boats '),
(115, 'GUE_Soldier_Crew', 15, 'neutral', '', 'Aaron''s Vehicles'),
(116, 'Woodlander2', 15, 'neutral', '', 'Staven''s Repair Shop'),
(117, 'UN_CDF_Soldier_MG_EP1', 15, 'friendly', '', 'Larz''s Wholesale'),
(118, 'UN_CDF_Soldier_EP1', 15, 'friendly', '', 'Dateu''s Wholesale'),
(119, 'Tanny_PMC', 15, 'hero', '', 'Tanner''s Hero Supplies'),
(120, 'UN_CDF_Soldier_Pilot_EP1', 15, 'friendly', '', 'Piloted Vehicles'),
(121, 'GUE_Soldier_Pilot', 16, 'friendly', '', 'AWOL''s Airfield'),
(122, 'UN_CDF_Soldier_MG_EP1', 16, 'neutral', '', 'West''s Wholesaler'),
(123, 'GUE_Soldier_Medic', 16, 'neutral', '["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]', 'Neutral Medic'),
(124, 'GUE_Woodlander1', 16, 'neutral', '', 'Stavz Ammo'),
(125, 'GUE_Commander', 16, 'neutral', '', 'Stevhn''s Weapons'),
(126, 'Tanny_PMC', 16, 'hero', '', 'Trevors Hero Supplies.'),
(127, 'BAF_Soldier_AMG_W', 16, 'friendly', '', 'Roberts Ammo'),
(128, 'BAF_Soldier_AAA_DDPM', 16, 'friendly', '', 'Drakes Weapons'),
(129, 'GUE_Soldier_3', 16, 'neutral', '', 'Brians Vehicles'),
(130, 'GUE_Soldier_1', 16, 'neutral', '', 'Sam''s Boats'),
(131, 'BAF_Pilot_MTP', 16, 'hero', '', 'Darren''s Hero Vehicles'),
(132, 'GUE_Soldier_Sab', 16, 'neutral', '', 'Green''s Air Vehicles'),
(133, 'US_Soldier_Medic_EP1', 16, 'friendly', '["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]', 'Perry''s Medical'),
(134, 'CZ_Special_Forces_MG_DES_EP1', 16, 'friendly', '', 'Kypex''s Vehicles'),
(135, 'Damsel5', 16, 'friendly', '["ItemCopperBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Copper Bar",101]', 'Melly''s General Supplies'),
(136, 'GUE_Woodlander3', 16, 'friendly', '', 'Jim''s Repair/Building Supplies'),
(137, 'UN_CDF_Soldier_AAT_EP1', 16, 'neutral', '', 'South West Wholesaler'),
(138, 'RU_Farmwife1', 16, 'neutral', '["ItemCopperBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Copper Bar",101]', 'Bertha''s General Supplies'),
(139, 'Citizen2_EP1', 16, 'neutral', '', 'Rocky''s Parts/Building Supplies'),
(140, 'CIV_Contractor1_BAF', 6, 'neutral', '', 'Jeeves'),
(141, 'GUE_Soldier_MG', 11, 'neutral', '', 'Black Market - Olsha'),
(142, 'TK_GUE_Soldier_Sniper_EP1', 1, 'neutral', '', 'Apu Nahasapeemapetilon Black Market'),
(143, 'Tanny_PMC', 17, 'hero', '', 'Hero Vendor'),
(144, 'US_Delta_Force_AR_EP1', 17, 'friendly', '', 'Ammunition Friendly'),
(145, 'BAF_Soldier_AAR_DDPM', 17, 'friendly', '', 'Weapons Friendly'),
(146, 'Drake', 17, 'friendly', '', 'Friendly Vehicles'),
(147, 'Damsel2', 17, 'neutral', '["ItemCopperBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Copper Bar",101]', 'General Store'),
(148, 'GUE_Soldier_MG', 17, 'neutral', '', 'Weapons neutral'),
(149, 'GUE_Soldier_GL', 17, 'neutral', '', 'Ammunition Neutral'),
(150, 'TK_GUE_Soldier_5_EP1', 17, 'neutral', '', 'Neutral Building/Parts'),
(151, 'GUE_Soldier_2', 17, 'hostile', '', 'Bandit Trader'),
(152, 'Soldier_Sniper_PMC', 17, 'neutral', '', 'Aircraft Dealer'),
(153, 'GUE_Soldier_3', 17, 'neutral', '', 'Vehicles Neutral'),
(154, 'Soldier_GL_M16A2_PMC', 17, 'neutral', '', 'Black Market Vendor'),
(155, 'UN_CDF_Soldier_Crew_EP1', 17, 'friendly', '', 'Friendly Building/Parts'),
(156, 'UN_CDF_Soldier_Pilot_EP1', 17, 'friendly', '', 'Friendly Vehicles 2'),
(157, 'GUE_Worker2', 17, 'friendly', '["ItemCopperBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Copper Bar",101]', 'General Store 2'),
(158, 'Dr_Annie_Baker_EP1', 17, 'friendly', '["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]', 'Medical Supplies'),
(159, 'Soldier_MG_PKM_PMC', 17, 'friendly', '', 'Weapons friendly 2'),
(160, 'Soldier_MG_PMC', 17, 'friendly', '', 'Ammunition friendly 2'),
(161, 'GUE_Soldier_CO', 17, 'neutral', '', 'East Wholesaler'),
(162, 'Farmwife4', 17, 'neutral', '["ItemCopperBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Copper Bar",101]', 'General Store 3'),
(163, 'FR_Sykes', 17, 'neutral', '', 'West Wholesaler'),
(164, 'GUE_Villager4', 17, 'neutral', '', 'Boat Vendor'),
(165, 'TK_CIV_Takistani04_EP1', 17, 'neutral', '', 'Weapons neutral 2'),
(166, 'Pilot_EP1', 17, 'neutral', '', 'Ammunition Neutral 2'),
(167, 'RU_Profiteer4', 17, 'neutral', '', 'Vehicles Neutral 2'),
(168, 'Woodlander3', 17, 'neutral', '', 'Neutral Building/Parts'),
(169, 'Dr_Hladik_EP1', 17, 'neutral', '["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]', 'Medical Supplies 2'),
(170, 'Doctor', 17, 'neutral', '["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]', 'Medical Supplies 3'),
(171, 'HouseWife1', 17, 'neutral', '', 'Boat Trader 2'),
(172, 'Citizen3_EP1', 17, 'neutral', '', 'Wholesale 3'),
(173, 'ibr_lingorman6', 17, 'friendly', '', 'Friendly Building/parts 2'),
(174, 'ibr_lingorman6s', 17, 'friendly', '', 'Friendly Building/Parts 3'),
(175, 'TK_CIV_Woman02_EP1', 17, 'neutral', '', 'General Store 4'),
(176, 'Damsel3', 17, 'friendly', '', 'General Store 5'),
(177, 'Ins_Soldier_Sab', 11, 'harbinger', '', 'Harbinger Trader'),
(178, 'GUE_Commander', 11, 'messiah', '', 'Messiah Trader'),
(179, 'US_Delta_Force_Undercover_Takistani06_EP1', 11, '', NULL, 'Zero Trader');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `server_traders`
--
ALTER TABLE `server_traders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `server_traders`
--
ALTER TABLE `server_traders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=180;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
