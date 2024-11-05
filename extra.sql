-- Dropping job_grades table to UPDATE PAYS ETC.
DROP TABLE `job_grades`;

-- Dropping vehicles table to add Extra Vehicles
DROP TABLE `vehicles`;

-- Dropping licenses table to add Extra Licenses
DROP TABLE `licenses`;

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

-- OX Doorlock
CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `ox_doorlock` (`id`, `name`, `data`) VALUES
	(1, 'PDM RH Main 1', '{"coords":{"x":-1269.185546875,"y":-369.2408447265625,"z":37.1052017211914},"lockSound":"door_bolt","doors":[{"model":73386408,"coords":{"x":-1269.7930908203126,"y":-368.1114807128906,"z":37.11116027832031},"heading":298},{"model":-1152174184,"coords":{"x":-1268.5780029296876,"y":-370.37017822265627,"z":37.0992431640625},"heading":298}],"maxDistance":1,"groups":{"cardealer":1},"unlockSound":"door_bolt","lockpick":true,"state":1,"lockpickDifficulty":["easy","easy","easy","easy","easy","medium"]}'),
	(2, 'PDM RH Main 2', '{"coords":{"x":-1260.7333984375,"y":-349.1142272949219,"z":37.11116027832031},"lockSound":"door_bolt","doors":[{"model":-1152174184,"coords":{"x":-1261.8756103515626,"y":-349.6961975097656,"z":37.11116027832031},"heading":207},{"model":73386408,"coords":{"x":-1259.59130859375,"y":-348.5322570800781,"z":37.11116027832031},"heading":207}],"maxDistance":1,"groups":{"cardealer":1},"unlockSound":"door_bolt","lockpick":true,"state":1,"lockpickDifficulty":["easy","easy","easy","easy","easy","medium"]}'),
	(3, 'PDM RH Garage', '{"coords":{"x":-1237.8436279296876,"y":-338.19476318359377,"z":37.60726928710937},"heading":207,"holdOpen":true,"model":1430328167,"lockSound":"metal_locker","doors":false,"maxDistance":5,"autolock":10,"groups":{"cardealer":1},"unlockSound":"door_bolt","lockpick":true,"state":1,"lockpickDifficulty":["easy","easy","easy","easy","easy","medium"],"doorRate":0.2}'),
	(4, 'PDM RH Office', '{"coords":{"x":-1243.6416015625,"y":-347.42779541015627,"z":37.47900009155273},"heading":298,"holdOpen":true,"model":-952356348,"lockSound":"metal_locker","doors":false,"maxDistance":1,"groups":{"cardealer":1},"unlockSound":"metallic_creak","lockpick":true,"state":1,"lockpickDifficulty":["easy","easy","medium"]}');

