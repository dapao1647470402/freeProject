DROP TABLE IF EXISTS T_IMAGE;
CREATE TABLE T_IMAGE(
ID INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Id',
IMG_LOCATION_PRE VARCHAR(100) COMMENT 'Image location previous',
IMG_LOCATION_AFT VARCHAR(100) COMMENT 'Image location after(in the server)',
DIVIDE VARCHAR(2) COMMENT 'Image divide',
INS_DATE DATETIME COMMENT 'Insert Time',
INS_USER_ID VARCHAR(20) COMMENT 'Insert User',
INS_PROGRAM VARCHAR(20) COMMENT 'Insert Program',
UPD_DATE DATETIME COMMENT 'Update Time',
UPD_USER_ID VARCHAR(20) COMMENT 'Update User',
UPD_PROGRAM VARCHAR(20) COMMENT 'Update Program',
LOCK_VERSION BIGINT COMMENT 'Update Version'
) CHARACTER SET UTF8 COMMENT = 'Image Location and url';

INSERT INTO `freePj`.`t_image` (`ID`, `IMG_LOCATION_PRE`, `IMG_LOCATION_AFT`, `DIVIDE`, `INS_DATE`, `INS_USER_ID`, `INS_PROGRAM`, `UPD_DATE`, `UPD_USER_ID`, `UPD_PROGRAM`, `LOCK_VERSION`) VALUES ('1', 'http://localhost:8082/free.com/image/1.jpeg', 'http://localhost:8082/free.com/image/1.jpg', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `freePj`.`t_image` (`ID`, `IMG_LOCATION_PRE`, `IMG_LOCATION_AFT`, `DIVIDE`, `INS_DATE`, `INS_USER_ID`, `INS_PROGRAM`, `UPD_DATE`, `UPD_USER_ID`, `UPD_PROGRAM`, `LOCK_VERSION`) VALUES ('2', 'http://localhost:8082/free.com/image/1.jpeg', 'http://localhost:8082/free.com/image/2.jpg', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
