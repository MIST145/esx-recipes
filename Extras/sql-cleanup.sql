-- Dropping vehicles table to add Extra Vehicles
##-- DROP TABLE `vehicles`;

-- Dropping owned_vehicles table to add Mono - mVehicle & mGarage
##-- DROP TABLE `owned_vehicles`;

-- Dropping job_grades table to UPDATE PAYS ETC.
##-- DROP TABLE `job_grades`;

-- Dropping Data from Datastore table --  Removing esx_accessories data entrys
DELETE FROM datastore WHERE name = 'user_ears';
DELETE FROM datastore WHERE name = 'user_glasses';
DELETE FROM datastore WHERE name = 'user_helmet';
DELETE FROM datastore WHERE name = 'user_mask';

-- Dropping esx_banker Data from Datastore tables --  Removing esx_banker data entrys
DELETE FROM addon_account WHERE name = 'society_banker';
DELETE FROM jobs WHERE name = 'banker';
DELETE FROM jobs WHERE name = 'reporter';
DELETE FROM job_grades WHERE job_name = 'banker';
DELETE FROM job_grades WHERE job_name = 'reporter';
