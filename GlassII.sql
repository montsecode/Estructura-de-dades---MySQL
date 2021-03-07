-- MySQL Workbench Synchronization
-- Generated: 2021-03-07 17:55
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: monts

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `GlassesShopII` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `GlassesShopII`.`customer` (
  `id_customer` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(45) NULL DEFAULT NULL,
  `customer_surname1` VARCHAR(45) NULL DEFAULT NULL,
  `customer_surname2` VARCHAR(45) NULL DEFAULT NULL,
  `customer_tlef` VARCHAR(45) NULL DEFAULT NULL,
  `customer_email` VARCHAR(45) NULL DEFAULT NULL,
  `customer_post_ad` VARCHAR(60) NULL DEFAULT NULL,
  `customer_cp` INT(11) NULL DEFAULT NULL,
  `customer_town` VARCHAR(45) NULL DEFAULT NULL,
  `customer_rec` INT(11) NULL DEFAULT NULL,
  `customer_regdate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_customer`),
  UNIQUE INDEX `id_customer_Unique` () VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GlassesShopII`.`glass` (
  `id_glass` INT(11) NOT NULL,
  `glass_model` VARCHAR(45) NULL DEFAULT NULL,
  `glass_price` FLOAT(11) NULL DEFAULT NULL,
  `lens_id_lens` INT(11) NOT NULL,
  `frame_id_frame` INT(11) NOT NULL,
  `brand_id_brand` INT(11) NOT NULL,
  PRIMARY KEY (`id_glass`, `lens_id_lens`, `frame_id_frame`, `brand_id_brand`),
  INDEX `fk_glass_lens1_idx` (`lens_id_lens` ASC) VISIBLE,
  INDEX `fk_glass_frame1_idx` (`frame_id_frame` ASC) VISIBLE,
  INDEX `fk_glass_brand1_idx` (`brand_id_brand` ASC) VISIBLE,
  CONSTRAINT `fk_glass_lens1`
    FOREIGN KEY (`lens_id_lens`)
    REFERENCES `GlassesShopII`.`lens` (`id_lens`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_glass_frame1`
    FOREIGN KEY (`frame_id_frame`)
    REFERENCES `GlassesShopII`.`frame` (`id_frame`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_glass_brand1`
    FOREIGN KEY (`brand_id_brand`)
    REFERENCES `GlassesShopII`.`brand` (`id_brand`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GlassesShopII`.`lens` (
  `id_lens` INT(11) NOT NULL AUTO_INCREMENT,
  `lens_name` VARCHAR(45) NULL DEFAULT NULL,
  `lens_calibration` VARCHAR(45) NULL DEFAULT NULL,
  `lens_colour` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_lens`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GlassesShopII`.`sale` (
  `id_sale` INT(11) NOT NULL AUTO_INCREMENT,
  `sale_date` DATE NULL DEFAULT NULL,
  `item_Number` INT(11) NULL DEFAULT NULL,
  `customer_id_customer` INT(11) NOT NULL,
  `employee_id_employee` INT(11) NOT NULL,
  `glass_id_glass` INT(11) NOT NULL,
  PRIMARY KEY (`id_sale`, `customer_id_customer`, `employee_id_employee`, `glass_id_glass`),
  INDEX `fk_sale_customer_idx` (`customer_id_customer` ASC) VISIBLE,
  INDEX `fk_sale_employee1_idx` (`employee_id_employee` ASC) VISIBLE,
  INDEX `fk_sale_glass1_idx` (`glass_id_glass` ASC) VISIBLE,
  CONSTRAINT `fk_sale_customer`
    FOREIGN KEY (`customer_id_customer`)
    REFERENCES `GlassesShopII`.`customer` (`id_customer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_sale_employee1`
    FOREIGN KEY (`employee_id_employee`)
    REFERENCES `GlassesShopII`.`employee` (`id_employee`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_sale_glass1`
    FOREIGN KEY (`glass_id_glass`)
    REFERENCES `GlassesShopII`.`glass` (`id_glass`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GlassesShopII`.`frame` (
  `id_frame` INT(11) NOT NULL AUTO_INCREMENT,
  `frame_name` VARCHAR(45) NULL DEFAULT NULL,
  `frame_type` VARCHAR(45) NULL DEFAULT NULL,
  `frame_colour` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_frame`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GlassesShopII`.`brand` (
  `id_brand` INT(11) NOT NULL AUTO_INCREMENT,
  `brand_name` VARCHAR(45) NULL DEFAULT NULL,
  `brand_has_dealer_dealer_id_dealer` INT(11) NOT NULL,
  PRIMARY KEY (`id_brand`, `brand_has_dealer_dealer_id_dealer`),
  INDEX `fk_brand_brand_has_dealer1_idx` (`brand_has_dealer_dealer_id_dealer` ASC) VISIBLE,
  CONSTRAINT `fk_brand_brand_has_dealer1`
    FOREIGN KEY (`brand_has_dealer_dealer_id_dealer`)
    REFERENCES `GlassesShopII`.`brand_has_dealer` (`dealer_id_dealer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GlassesShopII`.`dealer` (
  `id_dealer` INT(11) NOT NULL AUTO_INCREMENT,
  `dealer_name` VARCHAR(45) NULL DEFAULT NULL,
  `dealer_surname1` VARCHAR(45) NULL DEFAULT NULL,
  `dealer_surname2` VARCHAR(45) NULL DEFAULT NULL,
  `dealer_company_name` VARCHAR(45) NULL DEFAULT NULL,
  `dealer_telf` VARCHAR(45) NULL DEFAULT NULL,
  `dealer_fax` VARCHAR(45) NULL DEFAULT NULL,
  `dealer_nif` VARCHAR(9) NULL DEFAULT NULL,
  PRIMARY KEY (`id_dealer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GlassesShopII`.`purchase` (
  `id_purchase` INT(11) NOT NULL AUTO_INCREMENT,
  `purchase_brand` INT(11) NULL DEFAULT NULL,
  `glass_id_glass` INT(11) NOT NULL,
  `dealer_id_dealer` INT(11) NOT NULL,
  `employee_id_employee` INT(11) NOT NULL,
  PRIMARY KEY (`id_purchase`, `glass_id_glass`, `dealer_id_dealer`, `employee_id_employee`),
  INDEX `fk_purchase_glass1_idx` (`glass_id_glass` ASC) VISIBLE,
  INDEX `fk_purchase_dealer1_idx` (`dealer_id_dealer` ASC) VISIBLE,
  INDEX `fk_purchase_employee1_idx` (`employee_id_employee` ASC) VISIBLE,
  CONSTRAINT `fk_purchase_glass1`
    FOREIGN KEY (`glass_id_glass`)
    REFERENCES `GlassesShopII`.`glass` (`id_glass`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_purchase_dealer1`
    FOREIGN KEY (`dealer_id_dealer`)
    REFERENCES `GlassesShopII`.`dealer` (`id_dealer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_purchase_employee1`
    FOREIGN KEY (`employee_id_employee`)
    REFERENCES `GlassesShopII`.`employee` (`id_employee`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GlassesShopII`.`employee` (
  `id_employee` INT(11) NOT NULL AUTO_INCREMENT,
  `employee_name` VARCHAR(45) NULL DEFAULT NULL,
  `employee_surname1` VARCHAR(45) NULL DEFAULT NULL,
  `employee_surname2` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_employee`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GlassesShopII`.`brand_has_dealer` (
  `dealer_id_dealer` INT(11) NOT NULL AUTO_INCREMENT,
  `brand_id_brand` INT(11) NOT NULL,
  PRIMARY KEY (`dealer_id_dealer`, `brand_id_brand`),
  INDEX `fk_brand_has_dealer_dealer1` (`dealer_id_dealer` ASC) VISIBLE,
  INDEX `fk_brand_has_dealer_brand1` (`brand_id_brand` ASC) VISIBLE,
  CONSTRAINT `fk_brand_has_dealer_dealer1`
    FOREIGN KEY (`dealer_id_dealer` , `brand_id_brand`)
    REFERENCES `GlassesShopII`.`dealer` (`id_dealer` , `id_dealer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
