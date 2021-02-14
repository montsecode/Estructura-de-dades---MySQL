SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Glasses_Shop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Glasses_Shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Glasses_Shop` DEFAULT CHARACTER SET utf8 ;
USE `Glasses_Shop` ;

-- -----------------------------------------------------
-- Table `Glasses_Shop`.`Glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Glasses_Shop`.`Glasses` (
  `glasses_id` INT NOT NULL,
  `glasses_rate` FLOAT NULL,
  `glasses_type` VARCHAR(45) NULL,
  PRIMARY KEY (`glasses_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Glasses_Shop`.`Suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Glasses_Shop`.`Suppliers` (
  `suppliers_id` INT NOT NULL,
  `suppliers_name` VARCHAR(45) NULL,
  `supplier_address` VARCHAR(150) NULL,
  `suppliers_Tel` VARCHAR(45) NULL,
  `suppliers_fax` VARCHAR(45) NULL,
  `suppliers_cif` VARCHAR(9) NULL,
  `Suppliers_col` VARCHAR(45) NULL,
  `Glasses_glasses_id` INT NOT NULL,
  PRIMARY KEY (`suppliers_id`),
  INDEX `fk_Suppliers_Glasses1_idx` (`Glasses_glasses_id` ASC) VISIBLE,
  CONSTRAINT `fk_Suppliers_Glasses1`
    FOREIGN KEY (`Glasses_glasses_id`)
    REFERENCES `Glasses_Shop`.`Glasses` (`glasses_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Glasses_Shop`.`Lenses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Glasses_Shop`.`Lenses` (
  `lenses_id` INT NOT NULL,
  `lenses_type` VARCHAR(45) NULL,
  `lenses_measurement` VARCHAR(45) NULL,
  `lenses_colour` VARCHAR(45) NULL,
  `Glasses_glasses_id` INT NOT NULL,
  PRIMARY KEY (`lenses_id`, `Glasses_glasses_id`),
  INDEX `fk_Lenses_Glasses_idx` (`Glasses_glasses_id` ASC) VISIBLE,
  CONSTRAINT `fk_Lenses_Glasses`
    FOREIGN KEY (`Glasses_glasses_id`)
    REFERENCES `Glasses_Shop`.`Glasses` (`glasses_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Glasses_Shop`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Glasses_Shop`.`Customers` (
  `customers_id` INT NOT NULL,
  `customers_name` VARCHAR(45) NULL,
  `customers_address` VARCHAR(150) NULL,
  `customers_mail` VARCHAR(45) NULL,
  `customers_tel` VARCHAR(45) NULL,
  `customers_date` DATE NULL,
  `Customers_reference` INT NULL,
  PRIMARY KEY (`customers_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Glasses_Shop`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Glasses_Shop`.`Employee` (
  `Employee_id` INT NOT NULL,
  `employee_name` VARCHAR(45) NULL,
  PRIMARY KEY (`Employee_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Glasses_Shop`.`Sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Glasses_Shop`.`Sale` (
  `Sale_id` INT NOT NULL,
  `Sale_REFINVOICE` INT NULL,
  `Sale_DATE` DATETIME NULL,
  `Glasses_glasses_id` INT NOT NULL,
  `Employee_Employee_id` INT NOT NULL,
  `Customers_customers_id` INT NOT NULL,
  PRIMARY KEY (`Sale_id`, `Glasses_glasses_id`, `Employee_Employee_id`, `Customers_customers_id`),
  INDEX `fk_Sale_Glasses1_idx` (`Glasses_glasses_id` ASC) VISIBLE,
  INDEX `fk_Sale_Employee1_idx` (`Employee_Employee_id` ASC) VISIBLE,
  INDEX `fk_Sale_Customers1_idx` (`Customers_customers_id` ASC) VISIBLE,
  CONSTRAINT `fk_Sale_Glasses1`
    FOREIGN KEY (`Glasses_glasses_id`)
    REFERENCES `Glasses_Shop`.`Glasses` (`glasses_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Sale_Employee1`
    FOREIGN KEY (`Employee_Employee_id`)
    REFERENCES `Glasses_Shop`.`Employee` (`Employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Sale_Customers1`
    FOREIGN KEY (`Customers_customers_id`)
    REFERENCES `Glasses_Shop`.`Customers` (`customers_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN