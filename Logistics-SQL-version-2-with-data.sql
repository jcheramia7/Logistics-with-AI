-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 08, 2017 at 09:32 PM
-- Server version: 5.7.18
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `logistics`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `barangay_id` varchar(10) NOT NULL,
  `city_municipal_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `street_address_2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `created_at` int(11) DEFAULT NULL,
  `auth_rule_name` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `description` text,
  `data` text,
  `created_at` varchar(45) DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  `rule_name` varchar(64) DEFAULT NULL,
  `auth_rule_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `child` varchar(64) NOT NULL,
  `parent` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` varchar(45) DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `barangay`
--

CREATE TABLE `barangay` (
  `id` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `longitude` decimal(20,0) DEFAULT NULL,
  `latitude` decimal(20,0) DEFAULT NULL,
  `population` int(11) DEFAULT NULL,
  `timestamp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `city_municipal`
--

CREATE TABLE `city_municipal` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `longitude` decimal(20,0) DEFAULT NULL,
  `latitude` decimal(20,0) DEFAULT NULL,
  `population` int(11) DEFAULT NULL,
  `timestamp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_number`
--

CREATE TABLE `contact_number` (
  `id` int(11) NOT NULL,
  `contact_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_status`
--

CREATE TABLE `delivery_status` (
  `id` int(11) NOT NULL,
  `name` enum('Pending','Confirmed','In Transit','Arrived') NOT NULL,
  `timestamp` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivery_status`
--

INSERT INTO `delivery_status` (`id`, `name`, `timestamp`, `description`) VALUES
(1, 'Pending', '08-07-2017', NULL),
(2, 'Confirmed', '08-07-2017', NULL),
(3, 'In Transit', NULL, NULL),
(4, 'Arrived', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `disaster`
--

CREATE TABLE `disaster` (
  `id` int(11) NOT NULL,
  `disaster_type` int(11) NOT NULL,
  `month` varchar(45) DEFAULT NULL,
  `day` varchar(45) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `address_barangay_id` varchar(10) NOT NULL,
  `address_city_municipal_id` int(11) NOT NULL,
  `address_province_id` int(11) NOT NULL,
  `address_region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `disaster_type`
--

CREATE TABLE `disaster_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` varchar(20) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `disaster_type`
--

INSERT INTO `disaster_type` (`id`, `name`, `timestamp`, `description`) VALUES
(1, 'Tornadoes and Severe Storms', '08-07-2017', 'Tornadoes are outgrowths of powerful thunderstorms that appear as rotating, funnel-shaped clouds. They extend from a thunderstorm to the ground with violent winds that average 30 miles per hour. Also, they can vary in speed dramatically from being stationary to 70 miles per hour. '),
(2, 'Hurricanes and Tropical Storms', '08-07-2017', NULL),
(3, 'Floods', '08-07-2017', 'They occur when land that is normally dry experiences an overflow of water. Several events cause floods, including hurricanes and tropical storms, failed dams or levees, and flash floods that occur within a few minutes or hours of excessive rainfall.'),
(4, 'Wildfires', '08-07-2017', 'Wildfires are usually triggered by lightning or accidents and often go unnoticed at first. They can spread quickly and are especially destructive if they occur near forests, rural areas, remote mountain sites, and other woodland settings where people live. While not reported as often as floods or tornadoes and severe storms, they, too, can cause emotional distress in people living in affected areas.'),
(5, 'Earthquakes', '08-07-2017', 'An earthquake is the shifting of the Earthâ€™s plates, which results in a sudden shaking of the ground that can last for a few seconds to a few minutes. Within seconds, mild initial shaking can strengthen and become violent. Earthquakes happen without warning and can happen at any time of year.'),
(6, 'Drought', '08-07-2016', 'A drought is a normal, reoccurring weather event that can vary in intensity and duration by region of the country and even by location within a state. Drought occurs when there is lower than average precipitation over a significant period of time, usually a season or more. Other causes of drought can be a delay in the rainy season or the timing of rain in relation to crop growth.'),
(7, 'Agricultural diseases & pests', '08-07-2016', NULL),
(8, 'Damaging Winds', '08-07-2016', NULL),
(9, 'Emergency diseases (pandemic influenza)', '08-07-2016', NULL),
(10, 'Hail', '08-07-2016', NULL),
(11, 'Landslides & debris flow', '08-07-2016', NULL),
(12, 'Tsunami', '08-07-2016', NULL),
(13, 'Sinkholes', '08-07-2016', NULL),
(14, 'Power service disruption & blackout', '08-07-2017', NULL),
(15, 'Nuclear power plant and nuclear blast', '08-07-2017', NULL),
(16, 'Radiological emergencies', NULL, NULL),
(17, 'Explosion', '08-07-2017', NULL),
(18, 'Volcanic eruption', '08-07-2017', NULL),
(19, 'War', '08-07-2017', NULL),
(20, 'Structure Failure', '08-07-2017', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `id` int(11) NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `donation_type_id` int(11) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `donation_type`
--

CREATE TABLE `donation_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `description` text,
  `supply_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `id` int(11) NOT NULL,
  `personal_info` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `driver_of_vehicle`
--

CREATE TABLE `driver_of_vehicle` (
  `vehicle_plate_number` varchar(10) NOT NULL,
  `driver_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `legal_structure`
--

CREATE TABLE `legal_structure` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `timestamp` varchar(20) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `legal_structure`
--

INSERT INTO `legal_structure` (`id`, `name`, `timestamp`, `description`) VALUES
(1, 'Affiliate', NULL, NULL),
(2, 'Corporation', NULL, NULL),
(3, 'Incorporated', NULL, NULL),
(4, 'LLC', NULL, NULL),
(5, 'Non-incorporated', NULL, NULL),
(6, 'Non-Proft', NULL, NULL),
(7, 'Partnership', NULL, NULL),
(8, 'Publicly Traded', NULL, NULL),
(9, 'Solely Owned', NULL, NULL),
(10, 'Subsidiary', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal`
--

CREATE TABLE `personal` (
  `id` int(11) NOT NULL,
  `first` varchar(90) NOT NULL,
  `middle` varchar(90) DEFAULT NULL,
  `last` varchar(90) NOT NULL,
  `birth_month` enum('January','February','March','April','May','June','July','August','September','October','November','December') NOT NULL,
  `birth_day` int(11) NOT NULL,
  `birth_year` int(11) NOT NULL,
  `sex` varchar(45) NOT NULL,
  `nationality` int(11) NOT NULL,
  `contact_number` int(11) NOT NULL,
  `address_barangay_id` varchar(10) NOT NULL,
  `address_city_municipal_id` int(11) NOT NULL,
  `address_province_id` int(11) NOT NULL,
  `address_region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `primary_commodity`
--

CREATE TABLE `primary_commodity` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` varchar(20) DEFAULT NULL,
  `descrption` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `primary_commodity`
--

INSERT INTO `primary_commodity` (`id`, `name`, `timestamp`, `descrption`) VALUES
(1, 'Animal Supplies', NULL, NULL),
(2, 'Appliances/Kitchen Equipment', NULL, NULL),
(3, 'Architectural and Engineering Services', NULL, NULL),
(4, 'Art, Music, Theatre Equipment and Supplies', NULL, NULL),
(5, 'Athletic Equipment and Supplies', NULL, NULL),
(6, 'Audio-Video, Electronics, Photo Equipment', NULL, NULL),
(7, 'Carpet and Flooring', NULL, NULL),
(8, 'Catering and Beverages Services', NULL, NULL),
(9, 'Chemicals', NULL, NULL),
(10, 'Cleaning Equipment and Supplies', NULL, NULL),
(11, 'Computer Equipment and Accessories (PC, Servers)', NULL, NULL),
(12, 'Construction, Building Support, Repairs, and Renovation Services', NULL, NULL),
(13, 'Consulting, Legal and Professional Services', NULL, NULL),
(14, 'Document Storage Services', NULL, NULL),
(15, 'Dry Ice', NULL, NULL),
(16, 'Educational and Training Services', NULL, NULL),
(17, 'Environmental Services', NULL, NULL),
(18, 'Food and Beverage Product', NULL, NULL),
(19, 'Medical Equipment and Supplies', NULL, NULL),
(20, 'HR Recruiting Services and Temporary Labor Services', NULL, NULL),
(21, 'Miscellaneous', NULL, NULL),
(22, 'Pest Exterminator Services', NULL, NULL),
(23, 'Security Equipment', NULL, NULL),
(24, 'Telecommunications', NULL, NULL),
(25, 'Transportation', NULL, NULL),
(26, 'Utilities', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `longitude` decimal(20,0) DEFAULT NULL,
  `latitude` decimal(20,0) DEFAULT NULL,
  `population` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `longitude` decimal(20,0) DEFAULT NULL,
  `latitude` decimal(20,0) DEFAULT NULL,
  `population` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`id`, `name`, `longitude`, `latitude`, `population`) VALUES
(1, 'ARMM', '124', '7', 3781387),
(2, 'CAR', '121', '17', 1722006),
(3, 'MIMAROPA Region', '121', '13', 2963360),
(4, 'NCR', '121', '15', 12877253),
(5, 'NIR', '123', '10', 4414131),
(6, 'Region I', '121', '16', 5026128),
(7, 'Region II', '122', '17', 3451410),
(8, 'Region III', '121', '15', 11218177),
(9, 'Region IV-A', '121', '14', 14414774),
(10, 'Region IX', '123', '8', 3629783),
(11, 'Region V', '124', '13', 5796989),
(12, 'Region VI', '123', '11', 4477247),
(13, 'Region VII', '124', '10', 6041903),
(14, 'Region VIII', '125', '12', 4440150),
(15, 'Region X', '125', '8', 4689302),
(16, 'Region XI', '126', '7', 4893318),
(17, 'Region XII', '125', '6', 4545276),
(18, 'Region XIII', '126', '9', 2596709);

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `date_requested` varchar(45) DEFAULT NULL,
  `date_needed` varchar(45) DEFAULT NULL,
  `quantity` varchar(45) DEFAULT NULL,
  `description` text,
  `tracking_number` int(11) DEFAULT NULL,
  `delivery_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_barangay_id` varchar(10) NOT NULL,
  `address_city_municipal_id` int(11) NOT NULL,
  `address_province_id` int(11) NOT NULL,
  `address_region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `requested_supply`
--

CREATE TABLE `requested_supply` (
  `request_id` int(11) NOT NULL,
  `request_user_info_user_id` int(11) NOT NULL,
  `supply_detail_info_supplier` int(11) NOT NULL,
  `supply_detail_info_supply_code` int(11) NOT NULL,
  `quantity` varchar(45) DEFAULT NULL,
  `start_date_expected` varchar(45) DEFAULT NULL,
  `start_date_actual` varchar(45) DEFAULT NULL,
  `end_date_expected` varchar(45) DEFAULT NULL,
  `end_date_actual` varchar(45) DEFAULT NULL,
  `vehicle_plate_number` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `principal_name` varchar(255) DEFAULT NULL,
  `principal_title` enum('CEO','President') DEFAULT NULL,
  `business_number_of_year` int(11) DEFAULT NULL,
  `description` text,
  `supplier_type` int(11) NOT NULL,
  `legal_structure_id` int(11) NOT NULL,
  `primary_commodity_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_has_contact_number`
--

CREATE TABLE `supplier_has_contact_number` (
  `supplier_id` int(11) NOT NULL,
  `contact_number_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_type`
--

CREATE TABLE `supplier_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `timestamp` varchar(20) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier_type`
--

INSERT INTO `supplier_type` (`id`, `name`, `timestamp`, `description`) VALUES
(1, 'Manufacturers and Vendors', '08-07-2017', 'These are the companies that research, develop and actually produce the finished product ready for purchase. Manufacturers and vendors are the source of the supply chain.  Distributors, wholesalers, resellers and retailers who purchase goods from manufacturers and vendors benefit from the cheapest prices because no other companies have added their margin to cost of the goods yet.'),
(2, 'Wholesalers and Distributors', '08-07-2017', 'These suppliers are companies that buy in bulk from several manufacturers or vendors. They warehouse the goods for reselling to smaller local distributors, wholesalers and retailers. Distributors and wholesalers may also supply larger quantities to organisations or government departments directly. A genuine wholesale supplier will require your VAT or Tax ID number. This distinguishes them from discount retailers and resellers who market, particularly online, as wholesalers.'),
(3, 'Affiliate Merchants ', '08-07-2017', 'An affiliate merchant is a supplier that wishes to drive traffic to their website or sales of their product through banner ads and links placed throughout a network of affiliates. Merchants will normally pay affiliates a commission for every visit to the website or every sales conversion.'),
(4, 'Franchisors', '08-07-2017', 'A franchisor is a business owner and will grant a licence to an individual, which allows them to develop their own business using the trademark, name, know-how and business systems of the franchisor which includes suppliers and often at better pricing than an individual could get themselves.\r\n'),
(5, 'Importers and exporters', '08-07-2017', 'These suppliers will purchase products from manufacturers in one country and either export them to a distributor in a different country, or import them from an exporter into their country. Some may travel abroad to buy direct from suppliers in another country.'),
(6, 'Independent crafts people', '08-07-2017', 'These are normally manufacturers of products they have designed or produced on smaller unique scales of economy and will usually sell direct to retailers or the end consumer through agents or trade shows.'),
(7, 'Dropshippers ', '08-07-2017', 'These are suppliers of products from single or multiple companies that will deliver direct to the buyer once they have made the purchase from your business. This can be cost effective as it eliminates the need for storage or display of the items for sale.');

-- --------------------------------------------------------

--
-- Table structure for table `supply`
--

CREATE TABLE `supply` (
  `code` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date_expiration` varchar(25) DEFAULT NULL,
  `date_received` varchar(25) DEFAULT NULL,
  `description` text,
  `timestamp` varchar(25) DEFAULT NULL,
  `supply_type` int(11) NOT NULL,
  `unit_of_measurement_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supply_detail_info`
--

CREATE TABLE `supply_detail_info` (
  `supplier_id` int(11) NOT NULL,
  `supply_code` int(11) NOT NULL,
  `address_barangay` varchar(10) NOT NULL,
  `address_city_municipal` int(11) NOT NULL,
  `address_province` int(11) NOT NULL,
  `address_region` int(11) NOT NULL,
  `warehouse` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supply_in_warehouse`
--

CREATE TABLE `supply_in_warehouse` (
  `supply_detail_info_supplier_id` int(11) NOT NULL,
  `supply_detail_info_supply_code` int(11) NOT NULL,
  `warehouse_detail_info_warehouse_id` int(11) NOT NULL,
  `warehouse_detail_info_contact_number_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supply_type`
--

CREATE TABLE `supply_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supply_type`
--

INSERT INTO `supply_type` (`id`, `name`, `timestamp`, `description`) VALUES
(1, 'Class I - Subsistence', '08-07-2017', 'A - Nonperishable\r\nC - Combat Rations\r\nR - Refrigerated\r\nS - Other Nonrefrigerated\r\nW - Water'),
(3, 'Class II - Clothing, Individual Equipment, Tools, Admin. Supplies', '08-07-2017', 'A - Air\r\nB - Ground Support Materiel\r\nE - General Supplies\r\nF - Clothing\r\nG - Electronics\r\nM - Weapons\r\nT - Industrial Supplies'),
(4, 'Class III - Petroleum, Oils, Lubricants', '08-07-2017', 'A - POL for Aircraft\r\nW - POL for Surface Vehicles\r\nP - Packaged POL'),
(5, 'Class IV - Construction Materials', '08-07-2017', 'A - Construction \r\nB - Barrier'),
(6, 'Class V - Ammunition', '08-07-2017', 'A - Air Delivery\r\nW - Ground'),
(7, 'Class VI - Personal Demand Items', '08-07-2017', ''),
(8, 'Class VII - Major End Items: Racks, Pylons, Tracked Vehicles, Etc.', '08-07-2017', 'A - Air\r\nB - Ground Support Materiel\r\nD - Admin. Vehicles\r\nG - Electronics\r\nJ - Racks, Adaptors, Pylons\r\nK - Tactical Vehicles\r\nL - Missiles\r\nM - Weapons\r\nN - Special Weapons\r\nX - Aircraft Engines'),
(9, 'Class VIII - Medical Materials', '08-07-2017', 'A - Medical Materiel\r\nB - Blood / Fluids'),
(10, 'Class IX - Repair Parts', '08-07-2017', 'A - Air\r\nB - Ground Support Materiel\r\nD - Admin. Vehicles\r\nG - Electronics\r\nK - Tactical Vehicles\r\nL - Missiles\r\nM - Weapons\r\nN - Special Weapons\r\nX - Aircraft Engines'),
(11, 'Class X - Material For Nonmilitary Programs (Miscellaneous)', '08-07-2017', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `unit_of_measurement`
--

CREATE TABLE `unit_of_measurement` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unit_of_measurement`
--

INSERT INTO `unit_of_measurement` (`id`, `name`) VALUES
(4, 'Gram'),
(2, 'kilogram (kg)'),
(1, 'meter (m)'),
(6, 'Microgram'),
(5, 'Milligram'),
(8, 'Ounce'),
(7, 'Pound'),
(3, 'Tonne');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `status` smallint(6) DEFAULT NULL,
  `created_at` varchar(10) DEFAULT NULL,
  `updated_at` varchar(10) DEFAULT NULL,
  `user_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_has_donation`
--

CREATE TABLE `user_has_donation` (
  `user_info_user_id` int(11) NOT NULL,
  `donation_id` int(11) NOT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL,
  `personal_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` varchar(25) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `plate_number` varchar(10) NOT NULL,
  `model` varchar(100) DEFAULT NULL,
  `is_lease` tinyint(4) DEFAULT NULL,
  `timestamp` varchar(25) DEFAULT NULL,
  `vehicle_category` int(11) NOT NULL,
  `vehicle_type` int(11) NOT NULL,
  `available_day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') DEFAULT NULL,
  `available_hour_start` varchar(10) DEFAULT NULL,
  `available_hour_end` varchar(10) DEFAULT NULL,
  `vehicle_size_id` int(11) NOT NULL,
  `address_barangay_id` varchar(10) NOT NULL,
  `address_city_municipal_id` int(11) NOT NULL,
  `address_province_id` int(11) NOT NULL,
  `address_region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_category`
--

CREATE TABLE `vehicle_category` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vehicle_category`
--

INSERT INTO `vehicle_category` (`id`, `name`, `timestamp`, `description`) VALUES
(1, 'Air', '08-07-2017', NULL),
(2, 'Sea', '08-07-2017', NULL),
(3, 'Land', '08-07-2017', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_size`
--

CREATE TABLE `vehicle_size` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `timestamp` varchar(25) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_type`
--

CREATE TABLE `vehicle_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` varchar(25) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vehicle_type`
--

INSERT INTO `vehicle_type` (`id`, `name`, `timestamp`, `description`) VALUES
(1, 'Convertible', '08-07-2017', 'If you can drop the top to feel the wind in your hair, the car is a convertible. Convertibles, sometimes called cabriolets or roadsters, come with either a soft folding top or a retractable hardtop.'),
(2, 'Coupe', '08-07-2017', 'A coupe has two doors and a conventional trunk or a sloping back with a hinged rear cargo hatch that opens upward.'),
(3, 'Crossover', '08-07-2017', 'Crossovers are tall wagons and SUVs that are based on a passenger-car platform\'s architecture (as opposed to a truck\'s) for improved ride, comfort and fuel economy. They come in all sizes, and many offer a third-row seat. A light-duty four-wheel-drive or all-wheel-drive system is usually optional. '),
(4, 'Diesel', '08-07-2017', 'A diesel is a vehicle whose engine runs on diesel fuel rather than gasoline. '),
(5, 'Hatchback', '08-07-2017', 'A hatchback is a car with a two- or four-door body configuration and a sloping back with a hinged rear cargo hatch that opens upward. '),
(6, 'Hybrid/Electric', '08-07-2017', 'A hybrid vehicle has both a gasoline-powered engine and an electric motor that operate in unison and/or independently to propel the vehicle.'),
(7, 'Luxury', '08-07-2017', NULL),
(8, 'Minivan', '08-07-2017', 'A minivan has a short hood and a box-shaped body enclosing a large passenger/cargo area. '),
(9, 'Sedan', '08-07-2017', 'A sedan has four doors and a conventional trunk or a sloping back with a hinged rear trunk lid that opens upward. '),
(10, 'SUV', '08-07-2017', 'Sport-utility vehicles offer available four-wheel or all-wheel drive and raised ground clearance in combination with a two- or four-door body. '),
(11, 'Truck', '08-07-2017', 'A truck has two or four doors and an exposed cargo bed.'),
(12, 'Wagon', '08-07-2017', 'Wagons have all the same passenger room and driving characteristics as the sedans they\'re based on, but offer more cargo room. A few of the larger wagons even offer a third-row seat. Automakers sometimes come up with names like \"Avant\" or \"Sportback\" or avoid the term wagon altogether. Here\'s an easy way to determine whether a vehicle is a wagon: The roof line of a wagon continues past the rear doors. '),
(13, 'Agricultural', '08-07-2017', 'For agricultural'),
(14, 'Pickup', '08-07-2017', 'Any vehicle with an open cargo bed in the rear.'),
(15, 'Scooter', '08-07-2017', NULL),
(16, 'Ambulance', '08-07-2017', NULL),
(17, 'Motorcycle', '08-07-2017', NULL),
(18, 'Rickshaw', '08-07-2017', NULL),
(19, 'Bulldozer', '08-07-2017', NULL),
(20, 'Dump Trucks', '08-07-2017', NULL),
(21, 'Tractor', '08-07-2017', NULL),
(22, 'Excavator', '08-07-2017', NULL),
(23, 'Helicopter', '08-07-2017', NULL),
(24, 'Terex', '08-07-2017', NULL),
(25, 'Tank', '08-07-2017', NULL),
(26, 'Boat', '08-07-2017', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `contact_person_name` varchar(255) DEFAULT NULL,
  `year_established` int(11) DEFAULT NULL,
  `description` text,
  `area` varchar(45) DEFAULT NULL,
  `timestamp` varchar(25) DEFAULT NULL,
  `open_hours` varchar(15) DEFAULT NULL,
  `close_hours` varchar(15) DEFAULT NULL,
  `open_day` varchar(45) DEFAULT NULL,
  `warehouse_type_id` int(11) NOT NULL,
  `warehouse_category_id` int(11) NOT NULL,
  `address_barangay_id` varchar(10) NOT NULL,
  `address_city_municipal_id` int(11) NOT NULL,
  `address_province_id` int(11) NOT NULL,
  `address_region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_category`
--

CREATE TABLE `warehouse_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` varchar(25) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `warehouse_category`
--

INSERT INTO `warehouse_category` (`id`, `name`, `timestamp`, `description`) VALUES
(1, 'Public Warehouse', '08-06-2017', 'Owned and operated by private individuals for renting purpose. Those who open a public warehouse use it as hire to any interested persons and groups who paid rent fee to the owner of the warehouse.'),
(2, 'Manufacturer Warehouse', '08-06-2017', 'Owned and controlled by producers or companies who are into the production of goods. The companies or producers established the warehouse in order to store their goods after production until they are needed.'),
(3, 'Bonded Warehouse', '08-06-2017', 'Used to store goods whose duty is are not yet paid. Once the owner of the goods settle the custom duty a release ï¿½warrantï¿½ will be issued by custom authorities. This document empowers its holder the goods named on it. This warehouse is normally located at the borders and operated by the custom authority.'),
(4, 'Whosesale Warehouse', '08-06-2017', 'Owned and controlled by the wholesaler for storing goods after purchase from the producers until they are sold to retailers or directly to the final consumers. The wholesaler buy in bulk from the producers and sell in small units to the retailer therefore, the wholesaler break the bulk of goods purchased and kept them in the warehouse until they bought.'),
(5, 'Overseas Warehouse', '08-06-2017', 'These catered for the overseas trade. They became the meeting places for overseas wholesale buyers where printed and plain could be discussed and ordered.'),
(6, 'Packing Warehouse', '08-06-2017', 'The main purpose of packing warehouses was the picking, checking, labelling and packing of goods for export.'),
(7, 'Railway Warehouse', '08-06-2017', 'Warehouses were built close to the major stations in railway hubs.'),
(8, 'Canal Warehouse', '08-06-2017', 'All these warehouse types can trace their origins back to the canal warehouses which were used for trans-shipment and storage.'),
(9, 'Climate-Controlled Warehouse', '08-06-2017', 'Handles many types of products including those that need special handling conditions such as freezers for storing frozen products, humidity-controlled environments for delicate products, such as produce or flowers, and dirt-free facilities for handling highly sensitive computer products.'),
(10, 'Distribution Center', '08-06-2017', 'For temporary activity. These warehouses serve as points in the distribution system at which products are received from many suppliers and quickly shipped out to many customers (e.g. Perishable goods enters in morning and distributed by the end of the day).'),
(11, 'State Warehouse', '08-06-2017', 'Created by the government to store contraband or smuggled goods seized by the custom authority.'),
(12, 'Sorting and Consolidation Warehouses: ', NULL, 'his warehouse type is not principally used for storage, but rather for receiving large inbound shipments and then breaking them down into smaller outbound loads. They might also be used for consolidating small inbound shipments into larger ones for dispatch to customers such as retail chains.'),
(13, 'Storage Warehouses', NULL, ' This warehouse type is often used for long-term storage of finished goods as part of a companyâ€™s outbound supply chain operation.Storage warehouses are also used by companies specializing in maintenance, repair, and similar activities where parts and equipment need to be stored ready for use when required.');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_detail_info`
--

CREATE TABLE `warehouse_detail_info` (
  `warehouse_id` int(11) NOT NULL,
  `contact_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_type`
--

CREATE TABLE `warehouse_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`barangay_id`,`city_municipal_id`,`province_id`,`region_id`),
  ADD KEY `fk_address_city_municipal1_idx` (`city_municipal_id`),
  ADD KEY `fk_address_province1_idx` (`province_id`),
  ADD KEY `fk_address_region1_idx` (`region_id`);

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`auth_rule_name`,`user_id`),
  ADD KEY `fk_auth_assignment_user1_idx` (`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `fk_auth_item_auth_rule1_idx` (`auth_rule_name`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`child`,`parent`),
  ADD KEY `fk_auth_item_has_auth_item_auth_item2_idx` (`parent`),
  ADD KEY `fk_auth_item_has_auth_item_auth_item1_idx` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `barangay`
--
ALTER TABLE `barangay`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `city_municipal`
--
ALTER TABLE `city_municipal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `contact_number`
--
ALTER TABLE `contact_number`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `delivery_status`
--
ALTER TABLE `delivery_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `disaster`
--
ALTER TABLE `disaster`
  ADD PRIMARY KEY (`id`,`disaster_type`,`address_barangay_id`,`address_city_municipal_id`,`address_province_id`,`address_region_id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_disaster_disaster_type1_idx` (`disaster_type`),
  ADD KEY `fk_disaster_address1_idx` (`address_barangay_id`,`address_city_municipal_id`,`address_province_id`,`address_region_id`);

--
-- Indexes for table `disaster_type`
--
ALTER TABLE `disaster_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_donation_donation_type1_idx` (`donation_type_id`);

--
-- Indexes for table `donation_type`
--
ALTER TABLE `donation_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `fk_donation_type_supply_type1_idx` (`supply_type_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_driver_personal1_idx` (`personal_info`);

--
-- Indexes for table `driver_of_vehicle`
--
ALTER TABLE `driver_of_vehicle`
  ADD PRIMARY KEY (`vehicle_plate_number`,`driver_id`),
  ADD KEY `fk_vehicle_has_driver_driver1_idx` (`driver_id`),
  ADD KEY `fk_vehicle_has_driver_vehicle1_idx` (`vehicle_plate_number`);

--
-- Indexes for table `legal_structure`
--
ALTER TABLE `legal_structure`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_personal_contact_number1_idx` (`contact_number`),
  ADD KEY `fk_personal_address1_idx` (`address_barangay_id`,`address_city_municipal_id`,`address_province_id`,`address_region_id`);

--
-- Indexes for table `primary_commodity`
--
ALTER TABLE `primary_commodity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_request_delivery_status1_idx` (`delivery_status`),
  ADD KEY `fk_request_user_info1_idx` (`user_id`),
  ADD KEY `fk_request_address1_idx` (`address_barangay_id`,`address_city_municipal_id`,`address_province_id`,`address_region_id`);

--
-- Indexes for table `requested_supply`
--
ALTER TABLE `requested_supply`
  ADD PRIMARY KEY (`request_id`,`request_user_info_user_id`,`supply_detail_info_supplier`,`supply_detail_info_supply_code`,`vehicle_plate_number`),
  ADD KEY `fk_request_has_supply_detail_info_supply_detail_info1_idx` (`supply_detail_info_supplier`,`supply_detail_info_supply_code`),
  ADD KEY `fk_request_has_supply_detail_info_request1_idx` (`request_id`,`request_user_info_user_id`),
  ADD KEY `fk_requested_supply_vehicle1_idx` (`vehicle_plate_number`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `fk_supplier_supplier_type1_idx` (`supplier_type`),
  ADD KEY `fk_supplier_legal_structure1_idx` (`legal_structure_id`),
  ADD KEY `fk_supplier_primary_commodity1_idx` (`primary_commodity_id`);

--
-- Indexes for table `supplier_has_contact_number`
--
ALTER TABLE `supplier_has_contact_number`
  ADD PRIMARY KEY (`supplier_id`,`contact_number_id`),
  ADD KEY `fk_supplier_has_contact_number_contact_number1_idx` (`contact_number_id`),
  ADD KEY `fk_supplier_has_contact_number_supplier1_idx` (`supplier_id`);

--
-- Indexes for table `supplier_type`
--
ALTER TABLE `supplier_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `supply`
--
ALTER TABLE `supply`
  ADD PRIMARY KEY (`code`),
  ADD UNIQUE KEY `id_UNIQUE` (`code`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `fk_supply_supply_type1_idx` (`supply_type`),
  ADD KEY `fk_supply_unit_of_measurement1_idx` (`unit_of_measurement_id`);

--
-- Indexes for table `supply_detail_info`
--
ALTER TABLE `supply_detail_info`
  ADD PRIMARY KEY (`supplier_id`,`supply_code`),
  ADD KEY `fk_supplier_has_supply_supply1_idx` (`supply_code`),
  ADD KEY `fk_supplier_has_supply_supplier1_idx` (`supplier_id`),
  ADD KEY `fk_supply_detail_info_address1_idx` (`address_barangay`,`address_city_municipal`,`address_province`,`address_region`),
  ADD KEY `fk_supply_detail_info_warehouse1_idx` (`warehouse`);

--
-- Indexes for table `supply_in_warehouse`
--
ALTER TABLE `supply_in_warehouse`
  ADD PRIMARY KEY (`supply_detail_info_supplier_id`,`supply_detail_info_supply_code`,`warehouse_detail_info_warehouse_id`,`warehouse_detail_info_contact_number_id`),
  ADD KEY `fk_warehouse_has_supply_detail_info_supply_detail_info1_idx` (`supply_detail_info_supplier_id`,`supply_detail_info_supply_code`),
  ADD KEY `fk_supply_storage_info_warehouse_detail_info1_idx` (`warehouse_detail_info_warehouse_id`,`warehouse_detail_info_contact_number_id`);

--
-- Indexes for table `supply_type`
--
ALTER TABLE `supply_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `unit_of_measurement`
--
ALTER TABLE `unit_of_measurement`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `fk_user_user_type1_idx` (`user_type`);

--
-- Indexes for table `user_has_donation`
--
ALTER TABLE `user_has_donation`
  ADD PRIMARY KEY (`user_info_user_id`,`donation_id`),
  ADD KEY `fk_user_info_has_donation_donation1_idx` (`donation_id`),
  ADD KEY `fk_user_info_has_donation_user_info1_idx` (`user_info_user_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_user_has_personal_personal1_idx` (`personal_id`),
  ADD KEY `fk_user_has_personal_user1_idx` (`user_id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`plate_number`),
  ADD UNIQUE KEY `id_UNIQUE` (`plate_number`),
  ADD KEY `fk_vehicle_vehicle_category1_idx` (`vehicle_category`),
  ADD KEY `fk_vehicle_vehicle_type1_idx` (`vehicle_type`),
  ADD KEY `fk_vehicle_vehicle_size1_idx` (`vehicle_size_id`),
  ADD KEY `fk_vehicle_address1_idx` (`address_barangay_id`,`address_city_municipal_id`,`address_province_id`,`address_region_id`);

--
-- Indexes for table `vehicle_category`
--
ALTER TABLE `vehicle_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `vehicle_size`
--
ALTER TABLE `vehicle_size`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `vehicle_type`
--
ALTER TABLE `vehicle_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `vehicle_typecol_UNIQUE` (`name`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_warehouse_warehouse_type1_idx` (`warehouse_type_id`),
  ADD KEY `fk_warehouse_warehouse_category1_idx` (`warehouse_category_id`),
  ADD KEY `fk_warehouse_address1_idx` (`address_barangay_id`,`address_city_municipal_id`,`address_province_id`,`address_region_id`);

--
-- Indexes for table `warehouse_category`
--
ALTER TABLE `warehouse_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `warehouse_detail_info`
--
ALTER TABLE `warehouse_detail_info`
  ADD PRIMARY KEY (`warehouse_id`,`contact_number`),
  ADD KEY `fk_warehouse_has_contact_number_contact_number1_idx` (`contact_number`),
  ADD KEY `fk_warehouse_has_contact_number_warehouse1_idx` (`warehouse_id`);

--
-- Indexes for table `warehouse_type`
--
ALTER TABLE `warehouse_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `city_municipal`
--
ALTER TABLE `city_municipal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact_number`
--
ALTER TABLE `contact_number`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `delivery_status`
--
ALTER TABLE `delivery_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `disaster`
--
ALTER TABLE `disaster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `disaster_type`
--
ALTER TABLE `disaster_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `donation`
--
ALTER TABLE `donation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `donation_type`
--
ALTER TABLE `donation_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `legal_structure`
--
ALTER TABLE `legal_structure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `personal`
--
ALTER TABLE `personal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `primary_commodity`
--
ALTER TABLE `primary_commodity`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supplier_type`
--
ALTER TABLE `supplier_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `supply`
--
ALTER TABLE `supply`
  MODIFY `code` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supply_type`
--
ALTER TABLE `supply_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `unit_of_measurement`
--
ALTER TABLE `unit_of_measurement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vehicle_category`
--
ALTER TABLE `vehicle_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vehicle_size`
--
ALTER TABLE `vehicle_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vehicle_type`
--
ALTER TABLE `vehicle_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `warehouse_category`
--
ALTER TABLE `warehouse_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `warehouse_type`
--
ALTER TABLE `warehouse_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_address_barangay1` FOREIGN KEY (`barangay_id`) REFERENCES `barangay` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_address_city_municipal1` FOREIGN KEY (`city_municipal_id`) REFERENCES `city_municipal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_address_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_address_region1` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `fk_auth_assignment_auth_rule1` FOREIGN KEY (`auth_rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_auth_assignment_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `fk_auth_item_auth_rule1` FOREIGN KEY (`auth_rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `fk_auth_item_has_auth_item_auth_item1` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_auth_item_has_auth_item_auth_item2` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `disaster`
--
ALTER TABLE `disaster`
  ADD CONSTRAINT `fk_disaster_address1` FOREIGN KEY (`address_barangay_id`,`address_city_municipal_id`,`address_province_id`,`address_region_id`) REFERENCES `address` (`barangay_id`, `city_municipal_id`, `province_id`, `region_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_disaster_disaster_type1` FOREIGN KEY (`disaster_type`) REFERENCES `disaster_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `donation`
--
ALTER TABLE `donation`
  ADD CONSTRAINT `fk_donation_donation_type1` FOREIGN KEY (`donation_type_id`) REFERENCES `donation_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `donation_type`
--
ALTER TABLE `donation_type`
  ADD CONSTRAINT `fk_donation_type_supply_type1` FOREIGN KEY (`supply_type_id`) REFERENCES `supply_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `fk_driver_personal1` FOREIGN KEY (`personal_info`) REFERENCES `personal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `driver_of_vehicle`
--
ALTER TABLE `driver_of_vehicle`
  ADD CONSTRAINT `fk_vehicle_has_driver_driver1` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vehicle_has_driver_vehicle1` FOREIGN KEY (`vehicle_plate_number`) REFERENCES `vehicle` (`plate_number`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `fk_personal_address1` FOREIGN KEY (`address_barangay_id`,`address_city_municipal_id`,`address_province_id`,`address_region_id`) REFERENCES `address` (`barangay_id`, `city_municipal_id`, `province_id`, `region_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personal_contact_number1` FOREIGN KEY (`contact_number`) REFERENCES `contact_number` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `fk_request_address1` FOREIGN KEY (`address_barangay_id`,`address_city_municipal_id`,`address_province_id`,`address_region_id`) REFERENCES `address` (`barangay_id`, `city_municipal_id`, `province_id`, `region_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_request_delivery_status1` FOREIGN KEY (`delivery_status`) REFERENCES `delivery_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_request_user_info1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `requested_supply`
--
ALTER TABLE `requested_supply`
  ADD CONSTRAINT `fk_request_has_supply_detail_info_request1` FOREIGN KEY (`request_id`,`request_user_info_user_id`) REFERENCES `request` (`id`, `user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_request_has_supply_detail_info_supply_detail_info1` FOREIGN KEY (`supply_detail_info_supplier`,`supply_detail_info_supply_code`) REFERENCES `supply_detail_info` (`supplier_id`, `supply_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_requested_supply_vehicle1` FOREIGN KEY (`vehicle_plate_number`) REFERENCES `vehicle` (`plate_number`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `fk_supplier_legal_structure1` FOREIGN KEY (`legal_structure_id`) REFERENCES `legal_structure` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_supplier_primary_commodity1` FOREIGN KEY (`primary_commodity_id`) REFERENCES `primary_commodity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_supplier_supplier_type1` FOREIGN KEY (`supplier_type`) REFERENCES `supplier_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `supplier_has_contact_number`
--
ALTER TABLE `supplier_has_contact_number`
  ADD CONSTRAINT `fk_supplier_has_contact_number_contact_number1` FOREIGN KEY (`contact_number_id`) REFERENCES `contact_number` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_supplier_has_contact_number_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `supply`
--
ALTER TABLE `supply`
  ADD CONSTRAINT `fk_supply_supply_type1` FOREIGN KEY (`supply_type`) REFERENCES `supply_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_supply_unit_of_measurement1` FOREIGN KEY (`unit_of_measurement_id`) REFERENCES `unit_of_measurement` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `supply_detail_info`
--
ALTER TABLE `supply_detail_info`
  ADD CONSTRAINT `fk_supplier_has_supply_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_supplier_has_supply_supply1` FOREIGN KEY (`supply_code`) REFERENCES `supply` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_supply_detail_info_address1` FOREIGN KEY (`address_barangay`,`address_city_municipal`,`address_province`,`address_region`) REFERENCES `address` (`barangay_id`, `city_municipal_id`, `province_id`, `region_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_supply_detail_info_warehouse1` FOREIGN KEY (`warehouse`) REFERENCES `warehouse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `supply_in_warehouse`
--
ALTER TABLE `supply_in_warehouse`
  ADD CONSTRAINT `fk_supply_storage_info_warehouse_detail_info1` FOREIGN KEY (`warehouse_detail_info_warehouse_id`,`warehouse_detail_info_contact_number_id`) REFERENCES `warehouse_detail_info` (`warehouse_id`, `contact_number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_warehouse_has_supply_detail_info_supply_detail_info1` FOREIGN KEY (`supply_detail_info_supplier_id`,`supply_detail_info_supply_code`) REFERENCES `supply_detail_info` (`supplier_id`, `supply_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_user_type1` FOREIGN KEY (`user_type`) REFERENCES `user_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_has_donation`
--
ALTER TABLE `user_has_donation`
  ADD CONSTRAINT `fk_user_info_has_donation_donation1` FOREIGN KEY (`donation_id`) REFERENCES `donation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_info_has_donation_user_info1` FOREIGN KEY (`user_info_user_id`) REFERENCES `user_info` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_info`
--
ALTER TABLE `user_info`
  ADD CONSTRAINT `fk_user_has_personal_personal1` FOREIGN KEY (`personal_id`) REFERENCES `personal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_personal_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `fk_vehicle_address1` FOREIGN KEY (`address_barangay_id`,`address_city_municipal_id`,`address_province_id`,`address_region_id`) REFERENCES `address` (`barangay_id`, `city_municipal_id`, `province_id`, `region_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vehicle_vehicle_category1` FOREIGN KEY (`vehicle_category`) REFERENCES `vehicle_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vehicle_vehicle_size1` FOREIGN KEY (`vehicle_size_id`) REFERENCES `vehicle_size` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vehicle_vehicle_type1` FOREIGN KEY (`vehicle_type`) REFERENCES `vehicle_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `fk_warehouse_address1` FOREIGN KEY (`address_barangay_id`,`address_city_municipal_id`,`address_province_id`,`address_region_id`) REFERENCES `address` (`barangay_id`, `city_municipal_id`, `province_id`, `region_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_warehouse_warehouse_category1` FOREIGN KEY (`warehouse_category_id`) REFERENCES `warehouse_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_warehouse_warehouse_type1` FOREIGN KEY (`warehouse_type_id`) REFERENCES `warehouse_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `warehouse_detail_info`
--
ALTER TABLE `warehouse_detail_info`
  ADD CONSTRAINT `fk_warehouse_has_contact_number_contact_number1` FOREIGN KEY (`contact_number`) REFERENCES `contact_number` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_warehouse_has_contact_number_warehouse1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
