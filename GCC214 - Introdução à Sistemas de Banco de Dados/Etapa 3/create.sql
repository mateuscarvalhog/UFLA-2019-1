-- MySQL Script generated by MySQL Workbench
-- Sat Jun 15 23:39:20 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Album`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Album` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Album` (
  `id_Album` INT NOT NULL auto_increment,
  `nome_album` VARCHAR(200) NOT NULL,
  `capa` VARCHAR(400) NOT NULL,
  `data_Lancamento` DATE NOT NULL,
  PRIMARY KEY (`id_Album`),
  UNIQUE INDEX `nome_album_UNIQUE` (`nome_album` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Artista`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Artista` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Artista` (
  `id_Artista` INT NOT NULL auto_increment,
  `data_nascimento` DATE NOT NULL,
  `data_morte` DATE NULL,
  `nome` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_Artista`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Artista_possui_Album`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Artista_possui_Album` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Artista_possui_Album` (
  `Artista_id_Artista` INT NOT NULL,
  `Album_id_Album` INT NOT NULL,
  `data_de_Lancamento` DATE NOT NULL,
  PRIMARY KEY (`Artista_id_Artista`, `Album_id_Album`),
  INDEX `fk_Artista_has_Album_Album1_idx` (`Album_id_Album` ASC) ,
  INDEX `fk_Artista_has_Album_Artista1_idx` (`Artista_id_Artista` ASC) ,
  CONSTRAINT `fk_Artista_has_Album_Artista1`
    FOREIGN KEY (`Artista_id_Artista`)
    REFERENCES `mydb`.`Artista` (`id_Artista`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Artista_has_Album_Album1`
    FOREIGN KEY (`Album_id_Album`)
    REFERENCES `mydb`.`Album` (`id_Album`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Banda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Banda` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Banda` (
  `id_Banda` INT NOT NULL auto_increment,
  `nome_banda` VARCHAR(200) NOT NULL,
  `data_fundacao` YEAR NOT NULL,
  PRIMARY KEY (`id_Banda`),
  UNIQUE INDEX `nome_banda_UNIQUE` (`nome_banda` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Banda_possui_Album`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Banda_possui_Album` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Banda_possui_Album` (
  `Banda_id_Banda` INT NOT NULL,
  `Album_id_Album` INT NOT NULL,
  `data_de_Lancamento` DATE NOT NULL,
  PRIMARY KEY (`Banda_id_Banda`, `Album_id_Album`),
  INDEX `fk_Banda_has_Album_Album1_idx` (`Album_id_Album` ASC) ,
  INDEX `fk_Banda_has_Album_Banda1_idx` (`Banda_id_Banda` ASC) ,
  CONSTRAINT `fk_Banda_has_Album_Banda1`
    FOREIGN KEY (`Banda_id_Banda`)
    REFERENCES `mydb`.`Banda` (`id_Banda`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Banda_has_Album_Album1`
    FOREIGN KEY (`Album_id_Album`)
    REFERENCES `mydb`.`Album` (`id_Album`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Banda_possui_Artista`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Banda_possui_Artista` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Banda_possui_Artista` (
  `Banda_id_Banda` INT NOT NULL,
  `Artista_id_Artista` INT NOT NULL,
  PRIMARY KEY (`Banda_id_Banda`, `Artista_id_Artista`),
  INDEX `fk_Banda_has_Artista_Artista1_idx` (`Artista_id_Artista` ASC) ,
  INDEX `fk_Banda_has_Artista_Banda1_idx` (`Banda_id_Banda` ASC) ,
  CONSTRAINT `fk_Banda_has_Artista_Banda1`
    FOREIGN KEY (`Banda_id_Banda`)
    REFERENCES `mydb`.`Banda` (`id_Banda`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Banda_has_Artista_Artista1`
    FOREIGN KEY (`Artista_id_Artista`)
    REFERENCES `mydb`.`Artista` (`id_Artista`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Musica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Musica` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Musica` (
  `id_Musica` INT NOT NULL auto_increment,
  `nome` VARCHAR(100) NOT NULL,
  `impropria` TINYINT NOT NULL,
  PRIMARY KEY (`id_Musica`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Musica_possui_Album`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Musica_possui_Album` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Musica_possui_Album` (
  `Musica_id_Musica` INT NOT NULL,
  `Album_id_Album` INT NOT NULL,
  `duracao` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`Musica_id_Musica`, `Album_id_Album`),
  INDEX `fk_Musica_has_Album_Album1_idx` (`Album_id_Album` ASC) ,
  INDEX `fk_Musica_has_Album_Musica1_idx` (`Musica_id_Musica` ASC) ,
  CONSTRAINT `fk_Musica_has_Album_Musica1`
    FOREIGN KEY (`Musica_id_Musica`)
    REFERENCES `mydb`.`Musica` (`id_Musica`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Musica_has_Album_Album1`
    FOREIGN KEY (`Album_id_Album`)
    REFERENCES `mydb`.`Album` (`id_Album`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Playlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Playlist` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Playlist` (
  `id_Playlist` INT NOT NULL auto_increment,
  `nome_playlist` VARCHAR(100) NOT NULL,
  `genero` VARCHAR(40) NOT NULL,
  `Usuario_id_Usuario` INT NOT NULL,
  PRIMARY KEY (`id_Playlist`),
  UNIQUE INDEX `nome_playlist_UNIQUE` (`nome_playlist` ASC) ,
  INDEX `fk_Playlist_Usuario1_idx` (`Usuario_id_Usuario` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Playlist_possui_Musica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Playlist_possui_Musica` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Playlist_possui_Musica` (
  `Playlist_id_Playlist` INT NOT NULL,
  `Musica_id_Musica` INT NOT NULL,
  PRIMARY KEY (`Playlist_id_Playlist`, `Musica_id_Musica`),
  INDEX `fk_Playlist_has_Musica_Musica1_idx` (`Musica_id_Musica` ASC) ,
  INDEX `fk_Playlist_has_Musica_Playlist1_idx` (`Playlist_id_Playlist` ASC) ,
  CONSTRAINT `fk_Playlist_has_Musica_Playlist1`
    FOREIGN KEY (`Playlist_id_Playlist`)
    REFERENCES `mydb`.`Playlist` (`id_Playlist`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Playlist_has_Musica_Musica1`
    FOREIGN KEY (`Musica_id_Musica`)
    REFERENCES `mydb`.`Musica` (`id_Musica`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Usuario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `id_Usuario` INT NOT NULL auto_increment,
  `email` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(256) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  PRIMARY KEY (`id_Usuario`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) )
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SET SQL_SAFE_UPDATES = 0;


-- --------------- ALTER TABLE ----------------------

-- ALTERA DOMÍNIO DA COLUNA data_fundacao DE YEAR PARA DATE
ALTER TABLE banda
MODIFY COLUMN data_fundacao DATE NOT NULL;

-- ADICIONA FOREIGN KEY EM PLAYLIST
ALTER TABLE playlist
ADD CONSTRAINT `fk_Playlist_Usuario1` FOREIGN KEY (`Usuario_id_Usuario`)
    REFERENCES `mydb`.`Usuario` (`id_Usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- DELETA ATRIBUTO QUE NÃO PERTENCE A TABELA
ALTER TABLE album
DROP COLUMN data_Lancamento;


-- ---------------- TRIGGERS -----------------------

-- TRIGGER QUE VERIFICA SE UM UPTADE EM DATA DE MORTE E VALIDO,
-- VERIFICANDO SE VALOR ESTA ENTRE NASCIMENTO DO ARTISTA E DATA ATUAL
DELIMITER //
CREATE TRIGGER verificar_morte
BEFORE UPDATE ON artista FOR EACH ROW
BEGIN
	IF NEW.data_morte NOT BETWEEN NEW.data_nascimento AND CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'Data inválida. Selecione uma data válida e tente novamente, por favor';
    END IF;
END //
DELIMITER ;
/*EXEMPLO DE UPDATE NÃO VÁLIDO PARA O TRIGGER
UPDATE artista 
set data_morte = '2021/01/01'
where id_Artista = 1;*/

-- TRIGGER QUE VALIDA VALOR DO ATRIBUTO 'IMPROPRIA' EM INSERCOES DE MUSICA;
-- VALORES VALIDOS SAO 0 E 1 (DEVIDO A ESCOLHA DO TIPO TINYINT),
-- MAS TAMBEM SAO ACEITOS BOOLEANOS PARA CONVERSAO*/
DELIMITER //
CREATE TRIGGER valida_impropria
BEFORE INSERT ON musica FOR EACH ROW
BEGIN
    IF (NEW.impropria = TRUE) THEN
        SET NEW.impropria = 1;
    ELSEIF (NEW.impropria = FALSE) THEN
        SET NEW.impropria = 0;
    ELSEIF (NEW.impropria NOT IN (0, 1)) THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'Valor invalido para o atributo. Por favor, tente novamente';
    END IF;
END //
DELIMITER ;
/*EXEMPLO DE INSERT NAO VALIDO PARA O TRIGGER
INSERT INTO musica
Values (22, 'a', 2);*/


-- TRIGGER QUE EVITA EXCLUSAO DE BANDAS CLASSICAS,
-- SAO CONSIDERADAS BANDAS CLASSICAS AQUELAS FORMADAS ANTES DE 1970
DELIMITER //
CREATE TRIGGER apagar_classicos
BEFORE DELETE ON banda FOR EACH ROW
BEGIN
    IF (EXTRACT(YEAR FROM OLD.data_fundacao) <= 1970) THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'Nao e possivel apagar bandas classicas';
    END IF;
END //
DELIMITER ;
/*EXEMPLO DE DELETE NAO VALIDO PARA O TRIGGER
INSERT INTO banda VALUES (55, 'The Beatles', '1960/01/01');
DELETE FROM banda WHERE banda.nome = 'The Beatles';*/


-- ------------------ VIEWS --------------------------
-- Playlists para todos os públicos 
CREATE VIEW `Playlists_Proprias`
AS SELECT * FROM `Playlist` WHERE `id_Playlist` IN (SELECT `Playlist_id_Playlist` FROM `Musica` AS `M` JOIN `Playlist_possui_Musica` AS `PM` ON `M`.`id_Musica` = `PM`.`Musica_id_Musica` WHERE `impropria` = 0);

-- Playlists de gênero variado  
CREATE VIEW `Playlist_Variada`
AS SELECT * FROM `Playlist` WHERE `genero` = "varios";

-- Bandas fundadas de 2000 a 2010
CREATE VIEW `Bandas_2000`
AS SELECT * FROM `Banda` WHERE `data_fundacao` BETWEEN "2000-01-01" AND "2010-12-31";


commit;