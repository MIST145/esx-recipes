INSERT INTO `vehicle_categories` (name, label) VALUES
	('customs','Customs');

-- Mono mVehicle & mGarage SQL Injection
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

-- renzu scoreboard SQL Injection
ALTER TABLE `users`
ADD avatar mediumtext NULL;

-- IT_Drugs SQL Injection
-- Install the drug_plants table
CREATE TABLE IF NOT EXISTS drug_plants (id INT(11) NOT NULL AUTO_INCREMENT, PRIMARY KEY(id));
ALTER TABLE drug_plants ADD IF NOT EXISTS coords LONGTEXT NOT NULL;
ALTER TABLE drug_plants ADD IF NOT EXISTS time INT(255) NOT NULL;
ALTER TABLE drug_plants ADD IF NOT EXISTS type VARCHAR(100) NOT NULL;
ALTER TABLE drug_plants ADD IF NOT EXISTS health DOUBLE NOT NULL DEFAULT 100;
ALTER TABLE drug_plants ADD IF NOT EXISTS fertilizer DOUBLE NOT NULL DEFAULT 0;
ALTER TABLE drug_plants ADD IF NOT EXISTS water DOUBLE NOT NULL DEFAULT 0;
ALTER TABLE drug_plants ADD IF NOT EXISTS growtime INT(11) NOT NULL;

-- Install the drug_processing table
CREATE TABLE IF NOT EXISTS drug_processing (id INT(11) NOT NULL AUTO_INCREMENT, PRIMARY KEY(id));
ALTER TABLE drug_processing ADD IF NOT EXISTS coords LONGTEXT NOT NULL;
ALTER TABLE drug_processing ADD IF NOT EXISTS rotation DOUBLE NOT NULL;
ALTER TABLE drug_processing ADD IF NOT EXISTS type VARCHAR(100) NOT NULL;


