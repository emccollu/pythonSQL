-- Erign McCollum

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Odetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Odetails` (
  `ONO` INT NOT NULL,
  `PNO` INT NOT NULL,
  `QTY` INT NULL,
  PRIMARY KEY (`ONO`, `PNO`),
  INDEX `onoInd` (`ONO` ASC),
  CONSTRAINT `onoKey`
    FOREIGN KEY (`ONO`)
    REFERENCES `mydb`.`Orders` (`ONO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Zipcodes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Zipcodes` (
  `ZIP` INT NOT NULL,
  `CITY` VARCHAR(45) NULL,
  INDEX `zipInd` (`ZIP` ASC),
  CONSTRAINT `zipKey`
    FOREIGN KEY (`ZIP`)
    REFERENCES `mydb`.`Employees` (`ZIP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `zipKey`
    FOREIGN KEY (`ZIP`)
    REFERENCES `mydb`.`Customers` (`ZIP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `CNO` INT NULL,
  `CNAME` VARCHAR(45) NOT NULL,
  `STREET` VARCHAR(45) NULL,
  `ZIP` INT NOT NULL,
  `PHONE` VARCHAR(45) NULL,
  PRIMARY KEY (`CNO`),
  INDEX `cnoInd` (`CNO` ASC),
  INDEX `zipInd` (`ZIP` ASC),
  CONSTRAINT `cnoKey`
    FOREIGN KEY (`CNO`)
    REFERENCES `mydb`.`Orders` (`CNO`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION,
  CONSTRAINT `zipKey`
    FOREIGN KEY (`ZIP`)
    REFERENCES `mydb`.`Zipcodes` (`ZIP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `ONO` INT NOT NULL,
  `CNO` INT NOT NULL,
  `ENO` INT NOT NULL,
  `RECEIVED` DATE NULL,
  `SHIPPED` DATE NULL,
  PRIMARY KEY (`ONO`, `CNO`, `ENO`),
  INDEX `cnoKey` (`CNO` ASC),
  INDEX `onoKey` (`ONO` ASC),
  INDEX `enoKey_idx` (`ENO` ASC),
  CONSTRAINT `onoKey`
    FOREIGN KEY (`ONO`)
    REFERENCES `mydb`.`Odetails` (`ONO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cnoKey`
    FOREIGN KEY (`CNO`)
    REFERENCES `mydb`.`Customers` (`CNO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `enoKey`
    FOREIGN KEY (`ENO`)
    REFERENCES `mydb`.`Employees` (`ENO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Employees` (
  `ENO` INT NOT NULL,
  `ENAME`  NULL,
  `ZIP` INT NULL,
  `HDATE` DATE NULL,
  PRIMARY KEY (`ENO`),
  INDEX `enoInd` (`ENO` ASC),
  INDEX `zipInd` (`ZIP` ASC),
  CONSTRAINT `enoKey`
    FOREIGN KEY (`ENO`)
    REFERENCES `mydb`.`Orders` (`ENO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Parts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Parts` (
  `PNO` INT NOT NULL,
  `PNAME` VARCHAR(45) NOT NULL,
  `QOH` INT NULL,
  `PRICE` DECIMAL NULL,
  `OLEVEL` INT NULL,
  PRIMARY KEY (`PNO`),
  INDEX `pnoInd` (`PNO` ASC),
  CONSTRAINT `pnoKey`
    FOREIGN KEY (`PNO`)
    REFERENCES `mydb`.`Odetails` (`PNO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
