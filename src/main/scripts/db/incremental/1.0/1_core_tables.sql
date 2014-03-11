CREATE SCHEMA IF NOT EXISTS `backend` DEFAULT CHARACTER SET utf8;

-- Table `USER` for classes [com.jiggy.backend.security.User, com.jiggy.backend.framework.entity.AbstractEntity]
CREATE TABLE `USER`
(
  `ID` BIGINT NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` VARCHAR(256) BINARY NULL,
  `LAST_NAME` VARCHAR(256) BINARY NULL,
  `USERNAME` VARCHAR(256) BINARY NULL,
  `EMAIL` VARCHAR(256) BINARY NULL,
  `VERSION` BIGINT NOT NULL,
  `CREATED_BY` BIGINT NULL,
  `CREATED_DATE` BIGINT NULL,
  `LAST_MODIFIED_BY` BIGINT NULL,
  `LAST_MODIFIED_DATE` BIGINT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=INNODB;

-- Table `USER_CREDENTIALS` for classes [com.jiggy.backend.security.UserCredentials, com.jiggy.backend.framework.entity.AbstractEntity]
CREATE TABLE `USER_CREDENTIALS`
(
  `ID` BIGINT NOT NULL,
  `CHANGE_PASSWORD` BIT NULL,
  `PASSWORD` VARCHAR(256) BINARY NULL,
  `VERSION` BIGINT NOT NULL,
  `CREATED_BY` BIGINT NULL,
  `CREATED_DATE` BIGINT NULL,
  `LAST_MODIFIED_BY` BIGINT NULL,
  `LAST_MODIFIED_DATE` BIGINT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `USER_CREDENTIALS_UID_FK1` FOREIGN KEY (`ID`) REFERENCES `USER` (`ID`)
) ENGINE=INNODB;

-- Table `ROLE` for classes [com.jiggy.backend.security.Role]
CREATE TABLE `ROLE`
(
  `ID` BIGINT NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(256) BINARY NULL,
  `DESCRIPTION` VARCHAR(256) BINARY NULL,
  `VERSION` BIGINT NOT NULL,
  `CREATED_BY` BIGINT NULL,
  `CREATED_DATE` BIGINT NULL,
  `LAST_MODIFIED_BY` BIGINT NULL,
  `LAST_MODIFIED_DATE` BIGINT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=INNODB;

-- Table `PERMISSION` for classes [com.jiggy.backend.security.Permission, com.jiggy.backend.framework.entity.AbstractEntity]
CREATE TABLE `PERMISSION`
(
  `ID` BIGINT NOT NULL AUTO_INCREMENT,
  `RESOURCE` VARCHAR(256) BINARY NULL,
  `OPERATION` VARCHAR(256) BINARY NULL,
  `VERSION` BIGINT NOT NULL,
  `CREATED_BY` BIGINT NULL,
  `CREATED_DATE` BIGINT NULL,
  `LAST_MODIFIED_BY` BIGINT NULL,
  `LAST_MODIFIED_DATE` BIGINT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=INNODB;

-- Table `USER_ROLE` for join relationship
CREATE TABLE `USER_ROLE`
(
  `USER_ID` BIGINT NULL,
  `ROLE_ID` BIGINT NULL,
  PRIMARY KEY (`USER_ID`, `ROLE_ID`),
  CONSTRAINT `USER_ROLE_RID_FK2` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLE` (`ID`),
  CONSTRAINT `USER_ROLE_UID_FK1` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`ID`)
) ENGINE=INNODB;


-- Table `ROLE_PERMISSION` for join relationship
CREATE TABLE `ROLE_PERMISSION`
(
  `ROLE_ID` BIGINT NOT NULL,
  `PERMISSION_ID` BIGINT NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`PERMISSION_ID`),
  CONSTRAINT `ROLE_PERMISSION_FK1` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLE` (`ID`),
  CONSTRAINT `ROLE_PERMISSION_FK2` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `PERMISSION` (`ID`)
) ENGINE=INNODB;