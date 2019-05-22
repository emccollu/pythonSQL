SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `MailOrder` DEFAULT CHARACTER SET utf8 ;
USE `MailOrder` ;
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MailOrder`.`Odetails` ;
CREATE TABLE IF NOT EXISTS `MailOrder`.`Odetails` (
  `ONO` INT NOT NULL,
  `PNO` INT NOT NULL,
  `QTY` INT NULL,
  PRIMARY KEY (`PNO`, `ONO`))
ENGINE = InnoDB;
CREATE INDEX `onoInd` ON `MailOrder`.`Odetails` (`ONO` ASC);
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MailOrder`.`Zipcodes` ;
CREATE TABLE IF NOT EXISTS `MailOrder`.`Zipcodes` (
  `ZIP` INT NOT NULL,
  `CITY` VARCHAR(45) NULL)
ENGINE = InnoDB;
CREATE INDEX `zipInd` ON `MailOrder`.`Zipcodes` (`ZIP` ASC);
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MailOrder`.`Customers` ;
CREATE TABLE IF NOT EXISTS `MailOrder`.`Customers` (
  `CNO` INT NOT NULL,
  `CNAME` VARCHAR(45) NOT NULL,
  `STREET` VARCHAR(45) NULL,
  `ZIP` INT NOT NULL,
  `PHONE` VARCHAR(45) NULL,
  PRIMARY KEY (`CNO`))
ENGINE = InnoDB;
CREATE INDEX `cnoInd` ON `MailOrder`.`Customers` (`CNO` ASC);
CREATE INDEX `zipInd` ON `MailOrder`.`Customers` (`ZIP` ASC);
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MailOrder`.`Orders` ;
CREATE TABLE IF NOT EXISTS `MailOrder`.`Orders` (
  `ONO` INT NOT NULL,
  `CNO` INT NOT NULL,
  `ENO` INT NOT NULL,
  `RECEIVED` DATE NULL,
  `SHIPPED` DATE NULL,
  PRIMARY KEY (`ONO`))
ENGINE = InnoDB;
CREATE INDEX `cnoKey` ON `MailOrder`.`Orders` (`CNO` ASC);
CREATE INDEX `onoKey` ON `MailOrder`.`Orders` (`ONO` ASC);
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MailOrder`.`Employees` ;
CREATE TABLE IF NOT EXISTS `MailOrder`.`Employees` (
  `ENO` INT NOT NULL,
  `ENAME` VARCHAR(45) NULL,
  `ZIP` INT NOT NULL,
  `HDATE` DATE NULL,
  PRIMARY KEY (`ENO`))
ENGINE = InnoDB;
CREATE INDEX `enoInd` ON `MailOrder`.`Employees` (`ENO` ASC);
CREATE INDEX `zipInd` ON `MailOrder`.`Employees` (`ZIP` ASC);
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MailOrder`.`Parts` ;
CREATE TABLE IF NOT EXISTS `MailOrder`.`Parts` (
  `PNO` INT NOT NULL,
  `PNAME` VARCHAR(45) NOT NULL,
  `QOH` INT NULL,
  `PRICE` DECIMAL(4,2) NULL,
  `OLEVEL` INT NULL,
  PRIMARY KEY (`PNO`))
ENGINE = InnoDB;
CREATE INDEX `pnoInd` ON `MailOrder`.`Parts` (`PNO` ASC);
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- -----------------------------------------------------
START TRANSACTION;
USE `MailOrder`;
INSERT INTO `MailOrder`.`Odetails` (`ONO`, `PNO`, `QTY`) VALUES (1020, 10506, 1);
INSERT INTO `MailOrder`.`Odetails` (`ONO`, `PNO`, `QTY`) VALUES (1020, 10507, 1);
INSERT INTO `MailOrder`.`Odetails` (`ONO`, `PNO`, `QTY`) VALUES (1020, 10508, 2);
INSERT INTO `MailOrder`.`Odetails` (`ONO`, `PNO`, `QTY`) VALUES (1020, 10509, 3);
INSERT INTO `MailOrder`.`Odetails` (`ONO`, `PNO`, `QTY`) VALUES (1021, 10601, 4);
INSERT INTO `MailOrder`.`Odetails` (`ONO`, `PNO`, `QTY`) VALUES (1022, 10601, 1);
INSERT INTO `MailOrder`.`Odetails` (`ONO`, `PNO`, `QTY`) VALUES (1022, 10701, 1);
INSERT INTO `MailOrder`.`Odetails` (`ONO`, `PNO`, `QTY`) VALUES (1023, 10800, 1);
INSERT INTO `MailOrder`.`Odetails` (`ONO`, `PNO`, `QTY`) VALUES (1023, 10900, 1);
COMMIT;
-- -----------------------------------------------------
START TRANSACTION;
USE `MailOrder`;
INSERT INTO `MailOrder`.`Zipcodes` (`ZIP`, `CITY`) VALUES (67226, 'Wichita');
INSERT INTO `MailOrder`.`Zipcodes` (`ZIP`, `CITY`) VALUES (60606, 'Fort Dodge');
INSERT INTO `MailOrder`.`Zipcodes` (`ZIP`, `CITY`) VALUES (50302, 'Kansas City');
INSERT INTO `MailOrder`.`Zipcodes` (`ZIP`, `CITY`) VALUES (54444, 'Columbia');
INSERT INTO `MailOrder`.`Zipcodes` (`ZIP`, `CITY`) VALUES (66002, 'Liberal');
INSERT INTO `MailOrder`.`Zipcodes` (`ZIP`, `CITY`) VALUES (61111, 'Fort Hayes');
COMMIT;
-- -----------------------------------------------------
START TRANSACTION;
USE `MailOrder`;
INSERT INTO `MailOrder`.`Customers` (`CNO`, `CNAME`, `STREET`, `ZIP`, `PHONE`) VALUES (1111, 'Charles', '123 Main St', 67226, '316-636-5555');
INSERT INTO `MailOrder`.`Customers` (`CNO`, `CNAME`, `STREET`, `ZIP`, `PHONE`) VALUES (2222, 'Berram', '237 Ash Ave', 67226, '316-689-5555');
INSERT INTO `MailOrder`.`Customers` (`CNO`, `CNAME`, `STREET`, `ZIP`, `PHONE`) VALUES (3333, 'Barbara', '111 Inwood St', 60606, '316-111-1234');
COMMIT;
-- -----------------------------------------------------
START TRANSACTION;
USE `MailOrder`;
INSERT INTO `MailOrder`.`Orders` (`ONO`, `CNO`, `ENO`, `RECEIVED`, `SHIPPED`) VALUES (1020, 1111, 1000, '1994-12-10', '1994-12-12');
INSERT INTO `MailOrder`.`Orders` (`ONO`, `CNO`, `ENO`, `RECEIVED`, `SHIPPED`) VALUES (1021, 1111, 1000, '1995-01-12', '1995-01-15');
INSERT INTO `MailOrder`.`Orders` (`ONO`, `CNO`, `ENO`, `RECEIVED`, `SHIPPED`) VALUES (1022, 2222, 1001, '1995-02-13', '1995-02-20');
INSERT INTO `MailOrder`.`Orders` (`ONO`, `CNO`, `ENO`, `RECEIVED`, `SHIPPED`) VALUES (1023, 3333, 1000, '1997-06-20', '1998-02-20');
COMMIT;
-- -----------------------------------------------------
START TRANSACTION;
USE `MailOrder`;
INSERT INTO `MailOrder`.`Employees` (`ENO`, `ENAME`, `ZIP`, `HDATE`) VALUES (1000, 'Jones', 67226, '1995-12-12');
INSERT INTO `MailOrder`.`Employees` (`ENO`, `ENAME`, `ZIP`, `HDATE`) VALUES (1001, 'Smith', 60606, '1992-01-01');
INSERT INTO `MailOrder`.`Employees` (`ENO`, `ENAME`, `ZIP`, `HDATE`) VALUES (1002, 'Brown', 50302, '1994-10-01');
COMMIT;
-- -----------------------------------------------------
START TRANSACTION;
USE `MailOrder`;
INSERT INTO `MailOrder`.`Parts` (`PNO`, `PNAME`, `QOH`, `PRICE`, `OLEVEL`) VALUES (10506, 'Land Before Time I', 200, 19.99, NULL);
INSERT INTO `MailOrder`.`Parts` (`PNO`, `PNAME`, `QOH`, `PRICE`, `OLEVEL`) VALUES (10507, 'Land Before Time II', 156, 19.99, 20);
INSERT INTO `MailOrder`.`Parts` (`PNO`, `PNAME`, `QOH`, `PRICE`, `OLEVEL`) VALUES (10508, 'Land Before Time III', 190, 19.99, 20);
INSERT INTO `MailOrder`.`Parts` (`PNO`, `PNAME`, `QOH`, `PRICE`, `OLEVEL`) VALUES (10509, 'Land Before Time IV', 60, 19.99, 20);
INSERT INTO `MailOrder`.`Parts` (`PNO`, `PNAME`, `QOH`, `PRICE`, `OLEVEL`) VALUES (10601, 'Sleeping Beauty', 300, 24.99, 20);
INSERT INTO `MailOrder`.`Parts` (`PNO`, `PNAME`, `QOH`, `PRICE`, `OLEVEL`) VALUES (10701, 'When Harry Met Sally', 120, 19.99, 30);
INSERT INTO `MailOrder`.`Parts` (`PNO`, `PNAME`, `QOH`, `PRICE`, `OLEVEL`) VALUES (10800, 'Dirty Harry', 140, 14.99, 30);
INSERT INTO `MailOrder`.`Parts` (`PNO`, `PNAME`, `QOH`, `PRICE`, `OLEVEL`) VALUES (10900, 'Dr. Zhivago', 100, 24.99, 30);
COMMIT;
-- -----------------------------------------------------
--   XXXX   QUERIES   XXXX
-- -----------------------------------------------------
-- 1) Select everything from table odetails where the quantity of the QTY column is greater than 1.
-- -----------------------------------------------------
SELECT * FROM Odetails WHERE QTY>1;
-- -----------------------------------------------------
-- 2) Select two columns PNO and ONO from table odetails where the quantity of the QTY column is equal to 1.
-- -----------------------------------------------------
SELECT PNO, ONO FROM Odetails WHERE QTY=1;
-- -----------------------------------------------------
-- 3) Select all from table zipcodes where the city starts with Co.
-- -----------------------------------------------------
SELECT * FROM Zipcodes WHERE CITY LIKE "Co%";
-- -----------------------------------------------------
-- 4) Select all from table parts where PRICE is between 14.98 and 19.99.
-- -----------------------------------------------------
SELECT * FROM Parts WHERE PRICE BETWEEN 14.98 AND 19.99;
-- -----------------------------------------------------
-- 5) Select the total number of ONO from table orders and group by CNO column values.
-- -----------------------------------------------------
SELECT ONO, COUNT(*) FROM Orders GROUP BY CNO ASC;
-- -----------------------------------------------------
-- 6) Select columns CNAME and PHONE from table customers where the zipcode is
-- greater than 61000 or the customer’s phone number starts with 316 area code.
-- -----------------------------------------------------
SELECT CNAME,PHONE FROM Customers WHERE ZIP>61000 OR PHONE LIKE '316*';
-- -----------------------------------------------------
-- 7) Show PNAME and QOH from table parts and order the results by the QOH in
-- descending order.
-- -----------------------------------------------------
SELECT PNAME, QOH FROM Parts ORDER BY QOH DESC;
-- -----------------------------------------------------
-- 8) Remove duplicates ONO values from table odetails.
-- -----------------------------------------------------
SELECT ONO FROM Odetails GROUP BY ONO;
-- -----------------------------------------------------
-- 9) Select all from table zipcodes where city name is in the set Columbia, Fort Hayes, Las Vegas.
-- -----------------------------------------------------
SELECT * FROM Zipcodes
	WHERE CITY='Columbia' OR CITY='Fort Hayes' OR CITY='Las Vegas';
-- -----------------------------------------------------
-- 10) Select all from table odetails and display columns in the order STREET, PHONE, ZIP, CNAME,
--     and CNO.
-- -----------------------------------------------------
SELECT STREET, PHONE, ZIP, CNAME, CNO FROM Customers;
-- -----------------------------------------------------
-- 11) Select all from table parts where QOH is not between 50 and 130.
-- -----------------------------------------------------
SELECT * FROM Parts WHERE QOH NOT BETWEEN 50 AND 130;
-- -----------------------------------------------------
-- Joins
-- -----------------------------------------------------
-- -----------------------------------------------------
-- 1) Select all from parts and join it with odetails based on PNO.
-- -----------------------------------------------------
SELECT Parts.* FROM Parts INNER JOIN Odetails
	ON Parts.PNO = Odetails.PNO;
-- -----------------------------------------------------
-- 2) Select all from zipcodes and inner join it with customers based on zipcodes.
-- -----------------------------------------------------
SELECT Zipcodes.*,Customers.* FROM Zipcodes INNER JOIN Customers
	ON Customers.zip = Zipcodes.zip;
-- -----------------------------------------------------
-- 3) Select all from zipcodes and left join it with customers based on zipcodes.
- -----------------------------------------------------
SELECT Zipcodes.*, Customers.* FROM Zipcodes LEFT JOIN Customers
	ON Zipcodes.zip = Customers.zip;
-- -----------------------------------------------------
-- 4) Select PNAME and QTY from table parts and right join it with odetails based on the PNO.
-- -----------------------------------------------------
SELECT Parts.PNAME,Odetails.QTY FROM Parts RIGHT JOIN Odetails
	ON Parts.PNO = Odetails.PNO;
-- -----------------------------------------------------
-- 5) Select ENO, RECEIVED, SHIPPED dates and Join employee and orders.
-- -----------------------------------------------------
SELECT Employees.ENO,Orders.RECEIVED,Orders.SHIPPED
	FROM Employees JOIN Orders ON Employees.ENO = Orders.ENO;
-- -----------------------------------------------------
-- 6) Select PNAME, RECEIVED, and QTY and join tables odetails, parts, and orders.
-- Then order in alphabetic order PNAME.
-- -----------------------------------------------------
SELECT Parts.PNAME, Orders.RECEIVED, Odetails.QTY
	FROM Odetails`
    INNER JOIN Parts ON Odetails.PNO = Parts.PNO
    INNER JOIN Orders ON Odetails.ONO = Orders.ONO
	ORDER BY Parts.PNAME;
-- -----------------------------------------------------
-- 7) Select ENAME, CNAME, and CITY from their respective tables joined by their zipcodes.
-- -----------------------------------------------------
SELECT Employees.ENAME, Customers.CNAME, Zipcodes.CITY
	FROM Zipcodes
    INNER JOIN Employees ON Zipcodes.ZIP = Employees.ZIP
    INNER JOIN Customers ON Zipcodes.ZIP = Customers.ZIP;
-- -----------------------------------------------------
-- Nested Select Statements
-- -----------------------------------------------------
-- 1) Select ENAME, HDATE, ZIP from employees where the zip code is greater
-- than the average zipcode from zipcodes.
-- -----------------------------------------------------
SELECT ENAME,HDATE,ZIP FROM Employees
    WHERE ZIP > (SELECT AVG(ZIP) FROM Zipcodes);
-- -----------------------------------------------------
-- 2) Select all from parts where the PNO quantity in odetails is greater
-- than or equal to 3.
-- -----------------------------------------------------
SELECT Parts.* FROM Parts INNER JOIN Odetails ON Parts.PNO = Odetails.PNO
	AND Odetails.QTY >= 3;
