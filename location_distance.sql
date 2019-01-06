DELIMITER $$

USE `database name`$$

DROP FUNCTION IF EXISTS `LOCATION_DISTANCE`$$

CREATE FUNCTION `LOCATION_DISTANCE`(latitude_1 DOUBLE, longitude_1 DOUBLE, latitude_2 DOUBLE, longitude_2 DOUBLE) RETURNS DOUBLE
BEGIN
   DECLARE theta DOUBLE;
   DECLARE dist DOUBLE;
   DECLARE miles DOUBLE;
   DECLARE kms DOUBLE;
   SET theta = longitude_1 - longitude_2;
   SET dist = DEGREES(ACOS(SIN(RADIANS(latitude_1)) * SIN(RADIANS(latitude_2)) +  COS(RADIANS(latitude_1)) * COS(RADIANS(latitude_2)) * COS(RADIANS(theta))));
   SET miles = dist * 60 * 1.1515;	
   SET kms = miles * 1.609344;	
   RETURN kms;
END$$

DELIMITER ;
