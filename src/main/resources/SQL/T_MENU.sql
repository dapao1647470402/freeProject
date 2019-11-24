DROP TABLE IF EXISTS T_MENU;
CREATE TABLE T_MENU(
MENU_GROUP_ID VARCHAR(20) NOT NULL COMMENT 'Menu Group Id',
MENU_GROUP_NAME VARCHAR(50) NOT NULL COMMENT 'Menu Group Name',
MENU_GROUP_AUTHORITY CHAR(2) COMMENT 'Menu Group Authority',
MENU_ID VARCHAR(20) NOT NULL COMMENT 'Primary Key(SubMenu Id)',
MENU_NAME VARCHARACTER(50) NOT NULL COMMENT 'SubMenu Name',
MENU_AUTHORITY CHAR(2) COMMENT 'Menu Group Authority',
INS_DATE DATETIME COMMENT 'Insert Time',
INS_USER_ID VARCHAR(20) COMMENT 'Insert User',
INS_PROGRAM VARCHAR(20) COMMENT 'Insert Program',
UPD_DATE DATETIME COMMENT 'Update Time',
UPD_USER_ID VARCHAR(20) COMMENT 'Update User',
UPD_PROGRAM VARCHAR(20) COMMENT 'Update Program',
SORT_NO INT(10) COMMENT 'Sort Number',
LOCK_VERSION BIGINT COMMENT 'Update Version',
PRIMARY KEY(MENU_GROUP_ID,MENU_ID)
) CHARACTER SET UTF8 COMMENT = 'Menu'

INSERT INTO `freepj`.`t_menu` (`MENU_GROUP_ID`, `MENU_GROUP_NAME`, `MENU_GROUP_AUTHORITY`, `MENU_ID`, `MENU_NAME`, `MENU_AUTHORITY`, `INS_DATE`, `INS_USER_ID`, `INS_PROGRAM`, `UPD_DATE`, `UPD_USER_ID`, `UPD_PROGRAM`, `SORT_NO`, `LOCK_VERSION`) VALUES ('1', '学习之地', '01', 'sty0000', '知识交互(建设中)', '01', '2018-10-27 10:05:14', 'admin', NULL, '2018-10-27 10:05:25', 'admin', NULL, 1 , '0');
INSERT INTO `freepj`.`t_menu` (`MENU_GROUP_ID`, `MENU_GROUP_NAME`, `MENU_GROUP_AUTHORITY`, `MENU_ID`, `MENU_NAME`, `MENU_AUTHORITY`, `INS_DATE`, `INS_USER_ID`, `INS_PROGRAM`, `UPD_DATE`, `UPD_USER_ID`, `UPD_PROGRAM`, `SORT_NO`, `LOCK_VERSION`) VALUES ('9', '系统之地', '09', 'sys0501', '用户信息展示', '90', '2018-08-25 10:05:14', 'admin', NULL, '2018-08-25 10:05:25', 'admin', NULL, 1 , '0');
INSERT INTO `freepj`.`t_menu` (`MENU_GROUP_ID`, `MENU_GROUP_NAME`, `MENU_GROUP_AUTHORITY`, `MENU_ID`, `MENU_NAME`, `MENU_AUTHORITY`, `INS_DATE`, `INS_USER_ID`, `INS_PROGRAM`, `UPD_DATE`, `UPD_USER_ID`, `UPD_PROGRAM`, `SORT_NO`, `LOCK_VERSION`) VALUES ('9', '系统之地', '09', 'sys0402', '菜单配置(建设中)', '90', '2018-08-25 10:05:14', 'admin', NULL, '2018-08-25 10:05:25', 'admin', NULL, 2, '0');
INSERT INTO `freepj`.`t_menu` (`MENU_GROUP_ID`, `MENU_GROUP_NAME`, `MENU_GROUP_AUTHORITY`, `MENU_ID`, `MENU_NAME`, `MENU_AUTHORITY`, `INS_DATE`, `INS_USER_ID`, `INS_PROGRAM`, `UPD_DATE`, `UPD_USER_ID`, `UPD_PROGRAM`, `SORT_NO`, `LOCK_VERSION`) VALUES ('9', '系统之地', '09', 'sys0302', '意见采集(建设中)', '00', '2018-08-25 10:05:14', 'admin', NULL, '2018-08-25 10:05:25', 'admin', NULL, 3, '0');
INSERT INTO `freepj`.`t_menu` (`MENU_GROUP_ID`, `MENU_GROUP_NAME`, `MENU_GROUP_AUTHORITY`, `MENU_ID`, `MENU_NAME`, `MENU_AUTHORITY`, `INS_DATE`, `INS_USER_ID`, `INS_PROGRAM`, `UPD_DATE`, `UPD_USER_ID`, `UPD_PROGRAM`, `SORT_NO`, `LOCK_VERSION`) VALUES ('9', '系统之地', '09', 'sys0000', '更多设置(建设中)', '90', '2018-08-25 10:05:14', 'admin', NULL, '2018-08-25 10:05:25', 'admin', NULL, 4, '0');