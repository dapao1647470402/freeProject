DROP TABLE IF EXISTS T_USER;
CREATE TABLE T_USER(
	USER_ID	VARCHAR(20) PRIMARY KEY,
	ACCOUNT VARCHAR(20) NOT NULL COMMENT 'account',
	psd VARCHAR(20) NOT NULL COMMENT 'password',
	INS_DATE DATETIME COMMENT 'Insert Time',
	INS_USER_ID VARCHAR(20) COMMENT 'Insert User',
	INS_PROGRAM VARCHAR(20) COMMENT 'Insert Program',
	UPD_DATE DATETIME COMMENT 'Update Time',
	UPD_USER_ID VARCHAR(20) COMMENT 'Update User',
	UPD_PROGRAM VARCHAR(20) COMMENT 'Update Program',
	LOCK_VERSION BIGINT COMMENT 'Update Version'
) COMMENT = 'User';