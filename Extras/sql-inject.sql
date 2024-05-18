INSERT INTO `vehicle_categories` (name, label) VALUES
	('customs','Customs');

-- Mono mVehicle & mGarage Injection
-- esx-sna-fuel Injection
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(12) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(4) NOT NULL DEFAULT 0,
  `parking` varchar(60) DEFAULT 'Pillbox Hill',
  `pound` varchar(60) DEFAULT NULL,
  `datetimein` INT DEFAULT 0,
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  `mileage` int(11) DEFAULT 0,
  `coords` longtext DEFAULT NULL,
  `lastparking` varchar(100) DEFAULT NULL,
  `keys` longtext DEFAULT '[]',
  `metadata` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- renzu scoreboard sql
ALTER TABLE `users`
ADD avatar mediumtext NULL;
