
-- CLEAR OWNED VEHICLE TABLE
ALTER TABLE `owned_vehicles`
DROP COLUMN IF EXISTS `owner`;
ALTER TABLE `owned_vehicles`
DROP COLUMN IF EXISTS `plate`;
ALTER TABLE `owned_vehicles`
DROP COLUMN IF EXISTS `vehicle`;
ALTER TABLE `owned_vehicles`
DROP COLUMN IF EXISTS `type`;
ALTER TABLE `owned_vehicles`
DROP COLUMN IF EXISTS `job`;
ALTER TABLE `owned_vehicles`
DROP COLUMN IF EXISTS `stored`;
ALTER TABLE `owned_vehicles`
DROP COLUMN IF EXISTS `parking`;
ALTER TABLE `owned_vehicles`
DROP COLUMN IF EXISTS `pound`;
