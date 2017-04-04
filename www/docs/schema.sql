-- MySQL Script generated by MySQL Workbench
-- 09/02/15 04:17:00
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NULL AUTO_INCREMENT,
  `login` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NOT NULL,
  `registr_date` INT NULL DEFAULT UNIX_TIMESTAMP(),
  `is_admin` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teacher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teacher` ;

CREATE TABLE IF NOT EXISTS `teacher` (
  `id` INT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_teacher_user1_idx` (`user_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `institute`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `institute` ;

CREATE TABLE IF NOT EXISTS `institute` (
  `id` INT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `full_name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `specialization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `specialization` ;

CREATE TABLE IF NOT EXISTS `specialization` (
  `id` INT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `group` ;

CREATE TABLE IF NOT EXISTS `group` (
  `id` INT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student` ;

CREATE TABLE IF NOT EXISTS `student` (
  `id` INT UNSIGNED NULL AUTO_INCREMENT,
  `institute_id` INT UNSIGNED NOT NULL,
  `group_id` INT UNSIGNED NOT NULL,
  `course` INT UNSIGNED NOT NULL DEFAULT 1,
  `name` VARCHAR(100) NOT NULL,
  `med_group` ENUM('основная', 'подготовительная', 'специальная') NOT NULL,
  `department` ENUM('основное', 'специальное', 'спортивное') NOT NULL,
  `specialization_id` INT UNSIGNED NOT NULL,
  `teacher_id` INT UNSIGNED NOT NULL,
  `time_1` VARCHAR(45) NOT NULL,
  `time_2` VARCHAR(45) NOT NULL,
  `student_id` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_student_teacher1_idx` (`teacher_id` ASC),
  INDEX `fk_student_institute1_idx` (`institute_id` ASC),
  INDEX `fk_student_specialization1_idx` (`specialization_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_student_group1_idx` (`group_id` ASC),
  UNIQUE INDEX `student_id_UNIQUE` (`student_id` ASC),
  INDEX `fk_student_users1_idx` (`user_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `certification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `certification` ;

CREATE TABLE IF NOT EXISTS `certification` (
  `id` INT NULL AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `course` INT UNSIGNED NOT NULL,
  `october` TINYINT(1) NULL,
  `theory_1` TINYINT(1) NULL,
  `practice_1` TINYINT(1) NULL,
  `march` TINYINT(1) NULL,
  `theory_2` TINYINT(1) NULL,
  `practie_2` TINYINT(1) NULL,
  `norm` INT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_certification_student1_idx` (`student_id` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;