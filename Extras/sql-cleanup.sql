-- Dropping job_grades table to UPDATE PAYS ETC.
DROP TABLE `job_grades`;

-- Dropping vehicles table to add Extra Vehicles
DROP TABLE `vehicles`;
DROP TABLE `vehicle_categories`;

-- Dropping licenses table to add Extra Licenses
DROP TABLE `licenses`;

-- Dropping esx_cardealer tables to add JG Dealerships
DROP TABLE `cardealer_vehicles`;
DROP TABLE `vehicle_sold`;
DROP TABLE `rented_vehicles`;


-- Dropping Data from Datastore table --  Removing esx_accessories data entrys
DELETE FROM datastore WHERE name = 'user_ears';
DELETE FROM datastore WHERE name = 'user_glasses';
DELETE FROM datastore WHERE name = 'user_helmet';
DELETE FROM datastore WHERE name = 'user_mask';

-- Dropping esx_banker Data from Datastore tables --  Removing esx_banker data entrys
DELETE FROM addon_account WHERE name = 'society_banker';
DELETE FROM jobs WHERE name = 'banker';
DELETE FROM jobs WHERE name = 'reporter';
