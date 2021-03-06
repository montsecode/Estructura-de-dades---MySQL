-- MySQL Workbench Synchronization
-- Generated: 2021-03-07 21:50
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: monts

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE TABLE IF NOT EXISTS `mydb`.`categories_pizzes` (
  `id_categories_pizzes` INT(11) NOT NULL AUTO_INCREMENT,
  `categories_pizzes_nom` VARCHAR(45) NULL DEFAULT NULL,
  `productes_id_producte` INT(11) NOT NULL,
  `clients_id_clients` INT(11) NOT NULL,
  `clients_empleat_id_empleat` INT(11) NOT NULL,
  `clients_provincia_id_provincia1` INT(11) NOT NULL,
  `clients_localitat_id_localitat` INT(11) NOT NULL,
  PRIMARY KEY (`id_categories_pizzes`, `productes_id_producte`, `clients_id_clients`, `clients_empleat_id_empleat`, `clients_provincia_id_provincia1`, `clients_localitat_id_localitat`),
  INDEX `fk_categories_pizzes_productes_idx` (`productes_id_producte` ASC) VISIBLE,
  INDEX `fk_categories_pizzes_clients1_idx` (`clients_id_clients` ASC, `clients_empleat_id_empleat` ASC, `clients_provincia_id_provincia1` ASC, `clients_localitat_id_localitat` ASC) VISIBLE,
  CONSTRAINT `fk_categories_pizzes_productes`
    FOREIGN KEY (`productes_id_producte`)
    REFERENCES `mydb`.`productes` (`id_producte`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_categories_pizzes_clients1`
    FOREIGN KEY (`clients_id_clients` , `clients_empleat_id_empleat` , `clients_provincia_id_provincia1` , `clients_localitat_id_localitat`)
    REFERENCES `mydb`.`clients` (`id_clients` , `empleat_id_empleat` , `provincia_id_provincia1` , `localitat_id_localitat`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`clients` (
  `id_clients` INT(11) NOT NULL AUTO_INCREMENT,
  `clients_nom` VARCHAR(100) NULL DEFAULT NULL,
  `clients_cognoms` VARCHAR(150) NULL DEFAULT NULL,
  `clients_adreça` VARCHAR(100) NOT NULL,
  `clients_cp` INT(5) NOT NULL,
  `clients_localitat` VARCHAR(100) NULL DEFAULT NULL,
  `clients_provincia` VARCHAR(100) NULL DEFAULT NULL,
  `clients_telefon` INT(9) NOT NULL,
  `empleat_id_empleat` INT(11) NOT NULL,
  `provincia_id_provincia1` INT(11) NOT NULL,
  `localitat_id_localitat` INT(11) NOT NULL,
  PRIMARY KEY (`id_clients`, `empleat_id_empleat`, `provincia_id_provincia1`, `localitat_id_localitat`),
  INDEX `fk_clients_empleat1_idx` (`empleat_id_empleat` ASC) VISIBLE,
  INDEX `fk_clients_provincia2_idx` (`provincia_id_provincia1` ASC) VISIBLE,
  INDEX `fk_clients_localitat1_idx` (`localitat_id_localitat` ASC) VISIBLE,
  UNIQUE INDEX `clients_nom_UNIQUE` (`clients_nom` ASC) VISIBLE,
  CONSTRAINT `fk_clients_empleat1`
    FOREIGN KEY (`empleat_id_empleat`)
    REFERENCES `mydb`.`empleat` (`id_empleat`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_clients_provincia2`
    FOREIGN KEY (`provincia_id_provincia1`)
    REFERENCES `mydb`.`provincia` (`id_provincia`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_clients_localitat1`
    FOREIGN KEY (`localitat_id_localitat`)
    REFERENCES `mydb`.`localitat` (`id_localitat`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`localitat` (
  `id_localitat` INT(11) NOT NULL AUTO_INCREMENT,
  `localitat_nom` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_localitat`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`provincia` (
  `id_provincia` INT(11) NOT NULL AUTO_INCREMENT,
  `provincia_nom` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id_provincia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`comandes` (
  `id_comandes` INT(11) NOT NULL AUTO_INCREMENT,
  `comandes_data` DATE NOT NULL,
  `comandes_hora` TIME NOT NULL,
  `productes_id_producte` INT(11) NOT NULL,
  `clients_id_clients` INT(11) NOT NULL,
  `comandes_rep_domicili` VARCHAR(45) NULL DEFAULT NULL,
  `comandes_rep_botiga` VARCHAR(45) NULL DEFAULT NULL,
  `comandes_quantitat_prod` INT(11) NULL DEFAULT NULL,
  `comandes_preu_total` INT(11) NOT NULL,
  `comandes_tipus_prducte` VARCHAR(45) NOT NULL,
  `comandes_data` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_comandes`, `productes_id_producte`, `clients_id_clients`),
  INDEX `fk_comandes_productes1_idx` (`productes_id_producte` ASC) VISIBLE,
  INDEX `fk_comandes_clients1_idx` (`clients_id_clients` ASC) VISIBLE,
  CONSTRAINT `fk_comandes_productes1`
    FOREIGN KEY (`productes_id_producte`)
    REFERENCES `mydb`.`productes` (`id_producte`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comandes_clients1`
    FOREIGN KEY (`clients_id_clients`)
    REFERENCES `mydb`.`clients` (`id_clients`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`empleat` (
  `id_empleat` INT(10) NOT NULL,
  `empleat_nom` VARCHAR(100) NOT NULL,
  `empleat_cognoms` VARCHAR(150) NULL DEFAULT NULL,
  `empleat_nif` VARCHAR(9) NOT NULL,
  `empleat_telf` INT(9) NOT NULL,
  `empleat_cuiner` VARCHAR(45) NULL DEFAULT NULL,
  `empleat_repartidor` VARCHAR(45) NULL DEFAULT NULL,
  `botiga_id_botiga` INT(11) NOT NULL,
  PRIMARY KEY (`id_empleat`, `botiga_id_botiga`),
  INDEX `fk_empleat_botiga1_idx` (`botiga_id_botiga` ASC) VISIBLE,
  CONSTRAINT `fk_empleat_botiga1`
    FOREIGN KEY (`botiga_id_botiga`)
    REFERENCES `mydb`.`botiga` (`id_botiga`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`botiga` (
  `id_botiga` INT(10) NOT NULL,
  `botiga_adreça` VARCHAR(100) NOT NULL,
  `botiga_cp` INT(11) NOT NULL,
  `botiga_localitat` VARCHAR(100) NOT NULL,
  `botiga_provincia` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_botiga`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
