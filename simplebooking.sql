-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema simplebooking
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema simplebooking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `simplebooking` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `simplebooking` ;

-- -----------------------------------------------------
-- Table `simplebooking`.`evenement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `simplebooking`.`evenement` (
  `evenement_id` INT NOT NULL AUTO_INCREMENT,
  `date_de_creation` DATE NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`evenement_id`),
  UNIQUE INDEX `evenement_id_UNIQUE` (`evenement_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `simplebooking`.`show`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `simplebooking`.`show` (
  `show_id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(255) NOT NULL,
  `prix` INT NOT NULL,
  `ticket_count` INT NOT NULL,
  `date_de_show` DATETIME(3) NOT NULL,
  `status` TINYINT NOT NULL,
  `date_de_creation` DATE NOT NULL,
  `evenement_evenement_id` INT NOT NULL,
  PRIMARY KEY (`show_id`),
  UNIQUE INDEX `show_id_UNIQUE` (`show_id` ASC) VISIBLE,
  INDEX `fk_show_evenement1_idx` (`evenement_evenement_id` ASC) VISIBLE,
  CONSTRAINT `fk_show_evenement1`
    FOREIGN KEY (`evenement_evenement_id`)
    REFERENCES `simplebooking`.`evenement` (`evenement_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `simplebooking`.`ville`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `simplebooking`.`ville` (
  `ville_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `region` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ville_id`),
  UNIQUE INDEX `ville_id_UNIQUE` (`ville_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `simplebooking`.`acceuillir`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `simplebooking`.`acceuillir` (
  `VILLE_ville_id` INT NOT NULL,
  `SHOW_show_id` INT NOT NULL,
  PRIMARY KEY (`VILLE_ville_id`, `SHOW_show_id`),
  INDEX `fk_ACCEUILLIR_SHOW1_idx` (`SHOW_show_id` ASC) VISIBLE,
  CONSTRAINT `fk_ACCEUILLIR_SHOW1`
    FOREIGN KEY (`SHOW_show_id`)
    REFERENCES `simplebooking`.`show` (`show_id`),
  CONSTRAINT `fk_ACCEUILLIR_VILLE1`
    FOREIGN KEY (`VILLE_ville_id`)
    REFERENCES `simplebooking`.`ville` (`ville_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `simplebooking`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `simplebooking`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `age` INT NOT NULL,
  `role` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `simplebooking`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `simplebooking`.`cart` (
  `cart_id` INT NOT NULL AUTO_INCREMENT,
  `total` INT NULL DEFAULT NULL,
  `reservation_count` INT NULL DEFAULT NULL,
  `USER_user_id` INT NOT NULL,
  PRIMARY KEY (`cart_id`, `USER_user_id`),
  UNIQUE INDEX `cart_id_UNIQUE` (`cart_id` ASC) VISIBLE,
  INDEX `fk_CART_USER_idx` (`USER_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_CART_USER`
    FOREIGN KEY (`USER_user_id`)
    REFERENCES `simplebooking`.`user` (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `simplebooking`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `simplebooking`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE INDEX `category_id_UNIQUE` (`category_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `simplebooking`.`generalize`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `simplebooking`.`generalize` (
  `CATEGORY_category_id` INT NOT NULL,
  `EVENEMENT_evenement_id` INT NOT NULL,
  PRIMARY KEY (`CATEGORY_category_id`, `EVENEMENT_evenement_id`),
  INDEX `fk_GENERALIZE_CATEGORY1_idx` (`CATEGORY_category_id` ASC) VISIBLE,
  INDEX `fk_GENERALIZE_EVENEMENT1_idx` (`EVENEMENT_evenement_id` ASC) VISIBLE,
  CONSTRAINT `fk_GENERALIZE_CATEGORY1`
    FOREIGN KEY (`CATEGORY_category_id`)
    REFERENCES `simplebooking`.`category` (`category_id`),
  CONSTRAINT `fk_GENERALIZE_EVENEMENT1`
    FOREIGN KEY (`EVENEMENT_evenement_id`)
    REFERENCES `simplebooking`.`evenement` (`evenement_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `simplebooking`.`paiment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `simplebooking`.`paiment` (
  `paiment_id` INT NOT NULL AUTO_INCREMENT,
  `montant` INT NOT NULL,
  `date_operation` TIMESTAMP(3) NOT NULL,
  `mode_de_paiment` VARCHAR(45) NOT NULL,
  `CART_cart_id` INT NOT NULL,
  `CART_USER_user_id` INT NOT NULL,
  PRIMARY KEY (`paiment_id`, `CART_cart_id`, `CART_USER_user_id`),
  UNIQUE INDEX `paiment_id_UNIQUE` (`paiment_id` ASC) VISIBLE,
  INDEX `fk_PAIMENT_CART1_idx` (`CART_cart_id` ASC, `CART_USER_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_PAIMENT_CART1`
    FOREIGN KEY (`CART_cart_id` , `CART_USER_user_id`)
    REFERENCES `simplebooking`.`cart` (`cart_id` , `USER_user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `simplebooking`.`reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `simplebooking`.`reservation` (
  `reservation_id` INT NOT NULL AUTO_INCREMENT,
  `date_de_reservation` DATE NOT NULL,
  `CART_cart_id` INT NOT NULL,
  `SHOW_show_id` INT NOT NULL,
  PRIMARY KEY (`reservation_id`, `CART_cart_id`, `SHOW_show_id`),
  UNIQUE INDEX `reservation_id_UNIQUE` (`reservation_id` ASC) VISIBLE,
  INDEX `fk_RESERVATION_CART1_idx` (`CART_cart_id` ASC) VISIBLE,
  INDEX `fk_RESERVATION_SHOW1_idx` (`SHOW_show_id` ASC) VISIBLE,
  CONSTRAINT `fk_RESERVATION_CART1`
    FOREIGN KEY (`CART_cart_id`)
    REFERENCES `simplebooking`.`cart` (`cart_id`),
  CONSTRAINT `fk_RESERVATION_SHOW1`
    FOREIGN KEY (`SHOW_show_id`)
    REFERENCES `simplebooking`.`show` (`show_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

