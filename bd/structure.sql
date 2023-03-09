-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Database
-- ---

CREATE DATABASE IF NOT EXISTS leila CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci; 
USE leila;

-- ---
-- Table 'categorie'
-- 
-- ---

DROP TABLE IF EXISTS `categorie`;
		
CREATE TABLE `categorie` (
  `id` TINYINT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(50) NOT NULL,
  `rang` TINYINT NOT NULL,
  `id_parent` TINYINT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'plat'
-- 
-- ---

DROP TABLE IF EXISTS `plat`;
		
CREATE TABLE `plat` (
  `id` SMALLINT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NOT NULL,
  `detail` VARCHAR(500) NOT NULL,
  `portion` TINYINT NOT NULL DEFAULT 1,
  `prix` DECIMAL(5,2) NOT NULL,
  `id_categorie` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
KEY (`id_categorie`)
);

-- ---
-- Table 'vin'
-- 
-- ---

DROP TABLE IF EXISTS `vin`;
		
CREATE TABLE `vin` (
  `id` SMALLINT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NOT NULL,
  `detail` VARCHAR(500) NOT NULL,
  `provenance` VARCHAR(100) NOT NULL,
  `annee` YEAR NOT NULL,
  `prix` DECIMAL(5,2) NOT NULL,
  `id_categorie` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
KEY (`id_categorie`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `categorie` ADD FOREIGN KEY (id_parent) REFERENCES `categorie` (`id`);
ALTER TABLE `plat` ADD FOREIGN KEY (id_categorie) REFERENCES `categorie` (`id`);
ALTER TABLE `vin` ADD FOREIGN KEY (id_categorie) REFERENCES `categorie` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `categorie` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `plat` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `vin` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `categorie` (`id`,`nom`,`rang`,`id_parent`) VALUES
-- ('','','','');
-- INSERT INTO `plat` (`id`,`nom`,`detail`,`portion`,`prix`,`id_categorie`) VALUES
-- ('','','','','','');
-- INSERT INTO `vin` (`id`,`nom`,`detail`,`provenance`,`annee`,`prix`,`id_categorie`) VALUES
-- ('','','','','','','');