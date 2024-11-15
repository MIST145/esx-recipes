-- JG Advance Garages
---------------------
-- player_vehicles
ALTER TABLE `owned_vehicles` ADD COLUMN IF NOT EXISTS `fuel` INT(10) DEFAULT '100';
ALTER TABLE `owned_vehicles` ADD COLUMN IF NOT EXISTS `engine` INT(10) DEFAULT '1000';
ALTER TABLE `owned_vehicles` ADD COLUMN IF NOT EXISTS `body` INT(10) DEFAULT '1000';
ALTER TABLE `owned_vehicles` ADD COLUMN IF NOT EXISTS `damage` LONGTEXT DEFAULT '';
ALTER TABLE `owned_vehicles` ADD COLUMN IF NOT EXISTS `in_garage` TINYINT(1) DEFAULT '1';
ALTER TABLE `owned_vehicles` ADD COLUMN IF NOT EXISTS `garage_id` VARCHAR(255) DEFAULT 'Legion Square';
ALTER TABLE `owned_vehicles` ADD COLUMN IF NOT EXISTS `job_vehicle` TINYINT(1) DEFAULT '0';
ALTER TABLE `owned_vehicles` ADD COLUMN IF NOT EXISTS `job_vehicle_rank` INT(10) DEFAULT '0';
ALTER TABLE `owned_vehicles` ADD COLUMN IF NOT EXISTS `gang_vehicle` TINYINT(1) DEFAULT '0';
ALTER TABLE `owned_vehicles` ADD COLUMN IF NOT EXISTS `gang_vehicle_rank` INT(10) DEFAULT '0';
ALTER TABLE `owned_vehicles` ADD COLUMN IF NOT EXISTS `impound` INT(10) DEFAULT '0';
ALTER TABLE `owned_vehicles` ADD COLUMN IF NOT EXISTS `impound_retrievable` INT(10) DEFAULT '0';
ALTER TABLE `owned_vehicles` ADD COLUMN IF NOT EXISTS `impound_data` LONGTEXT DEFAULT '';
ALTER TABLE `owned_vehicles` ADD COLUMN IF NOT EXISTS `nickname` VARCHAR(255) DEFAULT '';

CREATE TABLE IF NOT EXISTS `player_priv_garages` (
    `id` INT(11) unsigned NOT NULL AUTO_INCREMENT,
    `owners` longtext,
    `name` VARCHAR(255),
    `type` VARCHAR(50),
    `x` FLOAT,
    `y` FLOAT,
    `z` FLOAT,
    `h` FLOAT,
    `distance` INT(11) DEFAULT '10',
    PRIMARY KEY (`id`)
);

-- JG Dealerships
-----------------
ALTER TABLE `owned_vehicles` ADD COLUMN IF NOT EXISTS `financed` tinyint(1) NOT NULL DEFAULT 0;
ALTER TABLE `owned_vehicles` ADD COLUMN IF NOT EXISTS `finance_data` longtext DEFAULT NULL;

CREATE TABLE IF NOT EXISTS `dealership_data` (
  `name` varchar(100) NOT NULL,
  `label` varchar(255) NOT NULL,
  `balance` float NOT NULL DEFAULT 0,
  `owner_id` varchar(255) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `employee_commission` int(11) DEFAULT '10',
  PRIMARY KEY (`name`)
);

CREATE TABLE IF NOT EXISTS `dealership_vehicles` (
  `spawn_code` varchar(100) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `hashkey` varchar(100) DEFAULT NULL,
  `category` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`spawn_code`)
);

CREATE TABLE IF NOT EXISTS `dealership_dispveh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealership` varchar(100) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `coords` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dispveh_dealership` (`dealership`),
  KEY `fk_dispveh_vehicle` (`vehicle`)
);

CREATE TABLE IF NOT EXISTS `dealership_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(100) NOT NULL,
  `dealership` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `cost` float NOT NULL DEFAULT 0,
  `delivery_time` int(11) NOT NULL,
  `order_created` datetime NOT NULL DEFAULT current_timestamp(),
  `fulfilled` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `orders_vehicle_fk` (`vehicle`),
  KEY `orders_dealership_fk` (`dealership`)
);

CREATE TABLE IF NOT EXISTS `dealership_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealership` varchar(255) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `plate` varchar(255) NOT NULL,
  `player` varchar(255) NOT NULL,
  `seller` varchar(255),
  `purchase_type` varchar(50) NOT NULL,
  `paid` float NOT NULL DEFAULT 0,
  `owed` float NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_sales_vehicle` (`vehicle`),
  KEY `fk_sales_dealership` (`dealership`),
  KEY `fk_sales_player` (`player`),
  KEY `fk_sales_plate` (`plate`)
);

CREATE TABLE IF NOT EXISTS `dealership_stock` (
  `dealership` varchar(100) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`dealership`, `vehicle`),
  KEY `vehicle_fk` (`vehicle`)
);

CREATE TABLE IF NOT EXISTS `dealership_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `dealership` varchar(255) NOT NULL,
  `role` varchar(100) NOT NULL,
  `joined` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_employees_dealership` (`dealership`)
);

-- OX Doorlock
--------------
CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO `ox_doorlock` (`id`, `name`, `data`) VALUES
	(1, 'PDM RH Main 1', '{"lockpickDifficulty":["easy","easy","easy","easy","easy"],"state":1,"doors":[{"model":73386408,"coords":{"x":-1269.7930908203126,"y":-368.1114807128906,"z":37.11116027832031},"heading":298},{"model":-1152174184,"coords":{"x":-1268.5780029296876,"y":-370.37017822265627,"z":37.0992431640625},"heading":298}],"coords":{"x":-1269.185546875,"y":-369.2408447265625,"z":37.1052017211914},"lockSound":"door_bolt","groups":{"pdmrockford":1},"unlockSound":"door_bolt","maxDistance":1,"lockpick":true}'),
	(2, 'PDM RH Main 2', '{"lockpickDifficulty":["easy","easy","easy","easy","easy"],"state":1,"doors":[{"model":-1152174184,"coords":{"x":-1261.8756103515626,"y":-349.6961975097656,"z":37.11116027832031},"heading":207},{"model":73386408,"coords":{"x":-1259.59130859375,"y":-348.5322570800781,"z":37.11116027832031},"heading":207}],"coords":{"x":-1260.7333984375,"y":-349.1142272949219,"z":37.11116027832031},"lockSound":"door_bolt","groups":{"pdmrockford":1},"unlockSound":"door_bolt","maxDistance":1,"lockpick":true}'),
	(3, 'PDM RH Garage', '{"lockpickDifficulty":["easy","easy","easy","easy","easy"],"state":1,"heading":207,"doors":false,"coords":{"x":-1237.8436279296876,"y":-338.19476318359377,"z":37.60726928710937},"autolock":10,"lockSound":"metal_locker","groups":{"pdmrockford":1},"unlockSound":"door_bolt","model":1430328167,"maxDistance":5,"lockpick":true,"doorRate":0.2,"holdOpen":true}'),
	(4, 'PDM RH Office', '{"lockpickDifficulty":["easy","easy","medium"],"state":1,"heading":298,"doors":false,"coords":{"x":-1243.94775390625,"y":-346.8536071777344,"z":37.47900009155273},"autolock":5,"lockSound":"metal_locker","groups":{"pdmrockford":2},"unlockSound":"metallic_creak","model":-952356348,"maxDistance":1,"lockpick":true}'),
	(6, 'PDM PB Main 1', '{"maxDistance":1,"state":0,"lockpick":true,"lockpickDifficulty":["easy","easy","easy","easy","easy"],"unlockSound":"door_bolt","coords":{"x":-247.210205078125,"y":6213.57275390625,"z":32.14298629760742},"lockSound":"door_bolt","doors":[{"model":1417577297,"heading":315,"coords":{"x":-246.5340118408203,"y":6212.89501953125,"z":32.14588165283203}},{"model":2059227086,"heading":315,"coords":{"x":-247.8863983154297,"y":6214.25048828125,"z":32.14009094238281}}]}'),
	(7, 'PDM PB Main 2', '{"lockpickDifficulty":["easy","easy","easy","easy","easy"],"state":1,"doors":[{"model":-2050436002,"coords":{"x":-229.76853942871095,"y":6216.2626953125,"z":32.4075698852539},"heading":315},{"model":100848840,"coords":{"x":-228.24365234375,"y":6214.73779296875,"z":32.4075698852539},"heading":315}],"coords":{"x":-229.006103515625,"y":6215.5,"z":32.4075698852539},"lockSound":"door_bolt","groups":{"pdmpaletobay":1},"unlockSound":"door_bolt","maxDistance":1,"lockpick":true}'),
	(8, 'PDM PB Main 3', '{"lockpickDifficulty":["easy","easy","easy","easy","easy"],"state":1,"doors":[{"model":100848840,"coords":{"x":-227.233642578125,"y":6219.71923828125,"z":32.20662689208984},"heading":227},{"model":-2050436002,"coords":{"x":-225.76284790039063,"y":6221.29638671875,"z":32.20662689208984},"heading":227}],"coords":{"x":-226.4982452392578,"y":6220.5078125,"z":32.20662689208984},"lockSound":"door_bolt","groups":{"pdmpaletobay":1},"unlockSound":"door_bolt","maxDistance":1,"lockpick":true}'),
	(10, 'PDM PB Garage', '{"lockpickDifficulty":["easy","easy","easy","easy","easy"],"state":1,"heading":224,"doors":false,"coords":{"x":-236.80198669433595,"y":6228.22607421875,"z":32.26290512084961},"autolock":10,"lockSound":"metal_locker","groups":{"pdmpaletobay":1},"unlockSound":"door_bolt","model":354430864,"maxDistance":5,"lockpick":true,"doorRate":0.2,"holdOpen":true}'),
	(11, 'PDM PB Office', '{"lockpickDifficulty":["easy","easy","medium"],"state":1,"heading":225,"doors":false,"coords":{"x":-222.48281860351563,"y":6220.31787109375,"z":32.20540618896484},"autolock":5,"lockSound":"metal_locker","groups":{"pdmrockford":2},"unlockSound":"metallic_creak","model":100848840,"maxDistance":1,"lockpick":true}'),
	(12, 'PDMMechDivider', '{"lockpickDifficulty":["easy","easy","easy","easy","easy"],"state":1,"holdOpen":true,"doors":[{"model":100848840,"coords":{"x":-227.07333374023438,"y":6228.265625,"z":32.20662689208984},"heading":316},{"model":-2050436002,"coords":{"x":-228.62588500976563,"y":6229.765625,"z":32.20662689208984},"heading":316}],"coords":{"x":-227.849609375,"y":6229.015625,"z":32.20662689208984},"autolock":5,"lockSound":"door_bolt","groups":{"pdmrpaletobay":4},"unlockSound":"door_bolt","maxDistance":1,"lockpick":true}');




-- Add Vehicle category - CUSTOMS
---------------------------------
INSERT INTO `vehicle_categories` (name, label) VALUES
	('customs','Customs');

-- Licences SQL Injection
-------------------------
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `licenses` (`type`, `label`) VALUES
	('aircraft', 'Aircraft License'),
	('boat', 'Boating Licence'),
	('dmv', 'Driving Permit'),
	('drive', 'Drivers License'),
	('drive_bike', 'Motorcycle License'),
	('drive_truck', 'Commercial Drivers License'),
	('flightdmv', 'Flying Permit'),
	('waterdmv', 'Boating Permit'),
	('weapon', 'Firearms License'),
	('weed_processing', 'Weed Processing License');

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('larrysautos', 'LarrysAutos', 0),
	('pdmpaletobay', 'PDM PaletoBay', 0),
	('pdmpillbox', 'PDM Pillbox', 0),
	('pdmrockford', 'PDM Rockford', 0);

-- Install JOBGRADES & Payrate Changes 
--------------------------------------
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Unemployed', 50, '{}', '{}'),
	(2, 'police', 0, 'recruit', 'Recruit', 100, '{}', '{}'),
	(3, 'police', 1, 'officer', 'Officer', 125, '{}', '{}'),
	(4, 'police', 2, 'sergeant', 'Sergeant', 150, '{}', '{}'),
	(5, 'police', 3, 'lieutenant', 'Lieutenant', 175, '{}', '{}'),
	(6, 'police', 4, 'boss', 'Captain', 200, '{}', '{}'),
	(15, 'lumberjack', 0, 'employee', 'Employee', 65, '{}', '{}'),
	(16, 'fisherman', 0, 'employee', 'Employee', 65, '{}', '{}'),
	(17, 'fueler', 0, 'employee', 'Employee', 65, '{}', '{}'),
	(19, 'tailor', 0, 'employee', 'Employee', 65, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(20, 'miner', 0, 'employee', 'Employee', 65, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(21, 'slaughterer', 0, 'employee', 'Employee', 65, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(22, 'ambulance', 0, 'ambulance', 'Jr. EMT', 125, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(23, 'ambulance', 1, 'doctor', 'EMT', 150, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(24, 'ambulance', 2, 'chief_doctor', 'Sr. EMT', 175, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(25, 'ambulance', 3, 'boss', 'EMT Supervisor', 200, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(26, 'mechanic', 0, 'recrue', 'Recruit', 100, '{}', '{}'),
	(27, 'mechanic', 1, 'novice', 'Novice', 125, '{}', '{}'),
	(28, 'mechanic', 2, 'experimente', 'Experienced', 150, '{}', '{}'),
	(29, 'mechanic', 3, 'chief', 'Leader', 175, '{}', '{}'),
	(30, 'mechanic', 4, 'boss', 'Boss', 200, '{}', '{}'),
	(31, 'taxi', 0, 'recrue', 'Recruit', 100, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(32, 'taxi', 1, 'novice', 'Cabby', 120, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(33, 'taxi', 2, 'experimente', 'Experienced', 130, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(34, 'taxi', 3, 'uber', 'Uber Cabby', 140, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(35, 'taxi', 4, 'boss', 'Lead Cabby', 150, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(36, 'pdmrockford', 1, 'sales', 'Salesman', 100, '{}', '{}'),
	(37, 'pdmrockford', 2, 'supervisor', 'Supervisor', 125, '{}', '{}'),
	(38, 'pdmrockford', 3, 'manager', 'Manager', 150, '{}', '{}'),
	(39, 'pdmrockford', 4, 'boss', 'Owner', 175, '{}', '{}'),
	(40, 'pdmpaletobay', 1, 'sales', 'Salesman', 100, '{}', '{}'),
	(41, 'pdmpaletobay', 2, 'supervisor', 'Supervisor', 125, '{}', '{}'),
	(42, 'pdmpaletobay', 3, 'manager', 'Manager', 150, '{}', '{}'),
	(43, 'pdmpaletobay', 4, 'boss', 'Owner', 175, '{}', '{}'),
	(44, 'pdmpillbox', 1, 'sales', 'Salesman', 100, '{}', '{}'),
	(45, 'pdmpillbox', 2, 'supervisor', 'Supervisor', 125, '{}', '{}'),
	(46, 'pdmpillbox', 3, 'manager', 'Manager', 150, '{}', '{}'),
	(47, 'pdmpillbox', 3, 'boss', 'Owner', 175, '{}', '{}'),
	(48, 'larrysautos', 1, 'sales', 'Salesman', 100, '{}', '{}'),
	(49, 'larrysautos', 2, 'supervisor', 'Supervisor', 125, '{}', '{}'),
	(50, 'larrysautos', 3, 'manager', 'Manager', 150, '{}', '{}'),
	(51, 'larrysautos', 3, 'boss', 'Owner', 175, '{}', '{}');

-- Install Player Starterpack table
-----------------------------------
CREATE TABLE IF NOT EXISTS `tcd_starterpack` (
  `id` int AUTO_INCREMENT PRIMARY KEY,
  `identifier` varchar(255) DEFAULT NULL,
  `date_received` varchar(10) DEFAULT NULL,
  `received` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- esx-sna-fuel Injection
-- CREATE TABLE IF NOT EXISTS `owned_vehicles` (
--  `datetimein` INT DEFAULT 0,
--  PRIMARY KEY (`id`)
--) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- IT_Drugs SQL Injection
  -- Install the drug_plants table
  CREATE TABLE IF NOT EXISTS drug_plants (
      id VARCHAR(11) NOT NULL, PRIMARY KEY(id),
      owner LONGTEXT DEFAULT NULL,
      coords LONGTEXT NOT NULL,
      time INT(255) NOT NULL,
      type VARCHAR(100) NOT NULL,
      health DOUBLE NOT NULL DEFAULT 100,
      fertilizer DOUBLE NOT NULL DEFAULT 0,
      water DOUBLE NOT NULL DEFAULT 0,
      growtime INT(11) NOT NULL
  );
 
  -- Install the drug_processing table
  CREATE TABLE IF NOT EXISTS drug_processing (
      id VARCHAR(11) NOT NULL, PRIMARY KEY(id),
      coords LONGTEXT NOT NULL,
      rotation DOUBLE NOT NULL,
      owner LONGTEXT NOT NULL,
      type VARCHAR(100) NOT NULL
  );
