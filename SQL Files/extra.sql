-- Renewed Banking
CREATE TABLE IF NOT EXISTS `bank_accounts_new` (
  `id` varchar(50) NOT NULL,
  `amount` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  `auth` longtext DEFAULT '[]',
  `isFrozen` int(11) DEFAULT 0,
  `creator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `bank_accounts_new` (`id`, `amount`, `transactions`, `auth`, `isFrozen`, `creator`) VALUES
	('ambulance', 0, '[]', '[]', 0, NULL),
	('cardealer', 0, '[]', '[]', 0, NULL),
	('mechanic', 0, '[]', '[]', 0, NULL),
	('police', 0, '[]', '[]', 0, NULL),
	('realestate', 0, '[]', '[]', 0, NULL),
	('lostmc', 0, '[]', '[]', 0, NULL),
	('ballas', 0, '[]', '[]', 0, NULL),
	('vagos', 0, '[]', '[]', 0, NULL),
	('cartel', 0, '[]', '[]', 0, NULL),
	('families', 0, '[]', '[]', 0, NULL),
	('triads', 0, '[]', '[]', 0, NULL);

CREATE TABLE IF NOT EXISTS `player_transactions` (
   `id` varchar(50) NOT NULL,
   `isFrozen` int(11) DEFAULT 0,
   `transactions` longtext DEFAULT '[]',
  PRIMARY KEY (`id`)
);

-- mono garage
ALTER TABLE `owned_vehicles`
   ADD COLUMN `owner` varchar(60) DEFAULT NULL,
   ADD COLUMN `plate` varchar(12) NOT NULL,
   ADD COLUMN `vehicle` longtext DEFAULT NULL,
   ADD COLUMN `type` varchar(20) NOT NULL DEFAULT 'car',
   ADD COLUMN `job` varchar(20) DEFAULT NULL,
   ADD COLUMN `stored` tinyint(4) NOT NULL DEFAULT 0,
   ADD COLUMN `parking` VARCHAR(60) DEFAULT NULL,
   ADD COLUMN `pound` VARCHAR(60) DEFAULT NULL,
   ADD COLUMN `infoimpound` longtext DEFAULT NULL,
   ADD COLUMN `lastparking` longtext DEFAULT NULL,
   ADD COLUMN `friends` longtext DEFAULT NULL,
   ADD COLUMN `fakeplate` varchar(12) DEFAULT NULL,
-- sna fuel
   ADD COLUMN `datetimein` INT DEFAULT 0;
