-- Trabalho de introdução a sistemas de bancos de dados
-- Grupo:
-- Aline Rodrigues Guimarães Oliveira
-- Álvaro Martins Espíndola
-- João Victor Teófilo Salgado
-- Leonardo Amorim de Sena
-- Mateus Carvalho Gonçalves

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
	IF NEW.data_morte IS NOT NULL AND NEW.data_morte NOT BETWEEN NEW.data_nascimento AND CURDATE() THEN
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


-- ------------------ DELETES --------------------------

-- DELETA ARTISTAS QUE NASCERAM EM 1971
DELETE FROM artista
WHERE data_nascimento between '1971/01/01' and '1971/12/31';

-- DELETA MUSICAS QUE POSSUEM CONTEUDOS IMPROPRIOS
DELETE FROM musica
WHERE impropria = 1;

-- DELETA BANDAS DE ARTISTAS QUE JÁ MORRERAM
DELETE FROM banda
WHERE id_Artista IN
    (SELECT id_Artista
    FROM banda NATURAL JOIN banda_possui_artista NATURAL JOIN artista
    WHERE data_morte IS NOT NULL);

-- DELETA USUARIOS COM SENHAS FRACAS (MENOS QUE 4 CARACTERES)
DELETE FROM usuario
WHERE char_length(senha) < 4;

-- DELETA MUSICA DE NOME 'Stan'
DELETE FROM MUSICA
WHERE nome = 'Stan';

-- ------------------ INSERT --------------------------

INSERT INTO album(nome_album, capa)
VALUES ('Temple of Shadows', 'http://www.hebraico.pro.br/imagens/curiosidades/temple_of_shadows.jpg');
INSERT INTO album(nome_album, capa)
VALUES ('Angels Cry', 'https://is3-ssl.mzstatic.com/image/thumb/Music91/v4/fa/fd/b4/fafdb422-87df-d557-199d-785d0af021e1/191061559771.jpg/600x600bf.png');
INSERT INTO album(nome_album, capa)
VALUES ('Time To Be Free', 'https://andrecoelhomatos.files.wordpress.com/2012/02/andre-matos-time-to-be-free.jpg');
INSERT INTO album(nome_album, capa)
VALUES ('Blackwater Park', 'https://diogomarquesmusic.files.wordpress.com/2011/03/opeth-blackwater-park.jpg');
INSERT INTO album(nome_album, capa)
VALUES ('My Arms, Your Hearse', 'https://lastfm-img2.akamaized.net/i/u/770x0/2a6c2ca68c5747408df5d7701e0bf674.jpg');
INSERT INTO album(nome_album, capa)
VALUES ('Foco, Força e Fé', 'https://upload.wikimedia.org/wikipedia/pt/9/99/Foco%2C_For%C3%A7a_e_F%C3%A9.jpg');
INSERT INTO album(nome_album, capa)
VALUES ('The Lumineers', 'https://images-na.ssl-images-amazon.com/images/I/616wDxRkPoL.jpg');
INSERT INTO album(nome_album, capa)
VALUES ('Cleopatra', 'https://lastfm-img2.akamaized.net/i/u/770x0/ea77f864eff0a4283fa30b8edade7ddb.jpg');
INSERT INTO album(nome_album, capa)
VALUES ('The Slim Shady LP', 'https://theeduardafelix.files.wordpress.com/2016/07/715cvcuzk9l-_sl1034_.jpg');
INSERT INTO album(nome_album, capa)
VALUES ('The Marshall Mathers LP', 'https://lastfm-img2.akamaized.net/i/u/770x0/de87486b44ed660d8bc9b5fa9a416336.jpg');
INSERT INTO album(nome_album, capa)
VALUES ('News of the World', 'https://img.discogs.com/Jiwtt1dIc_1gFTSFBafv7kgXEK4=/fit-in/600x606/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-475599-1454715265-7842.jpeg.jpg');
INSERT INTO album(nome_album, capa)
VALUES ('I Am… Sasha Fierce', 'https://lastfm-img2.akamaized.net/i/u/770x0/0c53bcc3435d43cd9e2d65e9d78d7709.jpg');

INSERT INTO artista(data_nascimento, data_morte, nome)
VALUES ('1971/10/22', NULL, 'Rafael Bittencourt');
INSERT INTO artista(data_nascimento, data_morte, nome)
VALUES ('1980/03/07', NULL, 'Felipe Andreoli');
INSERT INTO artista(data_nascimento, data_morte, nome)
VALUES ('1973/10/09', NULL, 'Fabio Lione');
INSERT INTO artista(data_nascimento, data_morte, nome)
VALUES ('1971/09/14', '2019/06/08', 'Andre Matos');
INSERT INTO artista(data_nascimento, data_morte, nome)
VALUES ('1974/04/17', NULL, 'Mikael Åkerfeldt');
INSERT INTO artista(data_nascimento, data_morte, nome)
VALUES ('1972/07/18', NULL, 'Fredrik Åkesson');
INSERT INTO artista(data_nascimento, data_morte, nome)
VALUES ('1978/04/06', NULL, 'Martín Méndez');
INSERT INTO artista(data_nascimento, data_morte, nome)
VALUES ('1986/04/11', NULL, 'Projota');
INSERT INTO artista(data_nascimento, data_morte, nome)
VALUES ('1972/10/17', NULL, 'Eminem');
INSERT INTO artista(data_nascimento, data_morte, nome)
VALUES ('1981/09/04', NULL,  "Beyonce");
INSERT INTO artista(data_nascimento, data_morte, nome)
VALUES ('1946/09/05', '1991/11/24', 'Freddie Mercury');
INSERT INTO artista(data_nascimento, data_morte, nome)
VALUES ('1947/07/19', NULL, 'Brian May');
INSERT INTO artista(data_nascimento, data_morte, nome)
VALUES ('1986/01/17', NULL, 'Jeremiah Fraites');
INSERT INTO artista(data_nascimento, data_morte, nome)
VALUES ('1982/12/30', NULL, 'Wesley Schultz');

INSERT INTO banda(nome_banda, data_fundacao)
VALUES ('The Lumineers', '2005/01/01');
INSERT INTO banda(nome_banda, data_fundacao)
VALUES ('Opeth', '1990/01/01');
INSERT INTO banda(nome_banda, data_fundacao)
VALUES ('Angra', '1991/01/01');
INSERT INTO banda(nome_banda, data_fundacao)
VALUES ('Queen', "1960-01-01");

INSERT INTO musica(nome, impropria)
VALUES ('Demon of the Fall', 0);
INSERT INTO musica(nome, impropria)
VALUES ('Harvest', 0);
INSERT INTO musica(nome, impropria)
VALUES ('Late Redemption', 0);
INSERT INTO musica(nome, impropria)
VALUES ('Carry On', 0);
INSERT INTO musica(nome, impropria)
VALUES ('Rio', 0);
INSERT INTO musica(nome, impropria)
VALUES ('Submarines', 0);
INSERT INTO musica(nome, impropria)
VALUES ('Ho Hey', 0);
INSERT INTO musica(nome, impropria)
VALUES ('Ophelia', 0);
INSERT INTO musica(nome, impropria)
VALUES ('My Name Is', 1);
INSERT INTO musica(nome, impropria)
VALUES ('Brain Damage', 1);
INSERT INTO musica(nome, impropria)
VALUES ('I`m Shady', 0);
INSERT INTO musica(nome, impropria)
VALUES ('The Real Slim Shady - Instrumental', 0);
INSERT INTO musica(nome, impropria)
VALUES ('The Real Slim Shady', 1);
INSERT INTO musica(nome, impropria)
VALUES ('Stan', 1);
INSERT INTO musica(nome, impropria)
VALUES ('Rezadeira', 0);
INSERT INTO musica(nome, impropria)
VALUES ('We Will Rock You', 0);
INSERT INTO musica(nome, impropria)
VALUES ('Spread Your Wings', 0);
INSERT INTO musica(nome, impropria)
VALUES ('Halo', 0);

INSERT INTO usuario(email, senha, nome, data_nascimento)
VALUES ('aline@gmail.com', '1234', 'aline', '1999-05-03');
INSERT INTO usuario(email, senha, nome, data_nascimento)  
VALUES ('maria@gmail.com', 'maria123', 'maria', '2000-01-09');
INSERT INTO usuario(email, senha, nome, data_nascimento)
VALUES ('roberto@gmail.com', '123456', 'roberto', '1983-03-10');

INSERT INTO playlist(nome_playlist, genero, usuario_id_usuario)
VALUES ('Ritmo e Poesia', 'Rap', 1);
INSERT INTO playlist(nome_playlist, genero, usuario_id_usuario)
VALUES ('Metal Milkshake', 'Metal', 2);
INSERT INTO playlist(nome_playlist, genero, usuario_id_usuario)
VALUES ('Sofrência', 'varios', 1);
INSERT INTO playlist(nome_playlist, genero, usuario_id_usuario)
VALUES ('propria', 'varios', '1');
INSERT INTO playlist(nome_playlist, genero, usuario_id_usuario)
VALUES ('impropria', 'pop', '1');

INSERT INTO artista_possui_album
VALUES (4, 3, '2006/11/30');
INSERT INTO artista_possui_album
VALUES (8, 6, '2014/01/01');
INSERT INTO artista_possui_album
VALUES (9, 9, '1999/11/23');
INSERT INTO artista_possui_album
VALUES (9, 10, '2000/05/23');
INSERT INTO artista_possui_album
VALUES (10, 12, '2008/11/14');

INSERT INTO banda_possui_album
VALUES (1, 7, '2012/04/03');
INSERT INTO banda_possui_album
VALUES (1, 8, '2016/04/06');
INSERT INTO banda_possui_album
VALUES (2, 4, '2001/02/27');
INSERT INTO banda_possui_album
VALUES (2, 5, '1998/08/18');
INSERT INTO banda_possui_album
VALUES (3, 1, '2004/11/15');
INSERT INTO banda_possui_album
VALUES (3, 2, '1992/11/30');
INSERT INTO banda_possui_album
VALUES (4, 11, '1977/10/28');

INSERT INTO banda_possui_artista
VALUES (3, 1);
INSERT INTO banda_possui_artista
VALUES (3, 2);
INSERT INTO banda_possui_artista
VALUES (3, 3);
INSERT INTO banda_possui_artista
VALUES (3, 4);
INSERT INTO banda_possui_artista
VALUES (2, 5);
INSERT INTO banda_possui_artista
VALUES (2, 7);
INSERT INTO banda_possui_artista
VALUES (2, 8);
INSERT INTO banda_possui_artista
VALUES (1, 14);
INSERT INTO banda_possui_artista
VALUES (1, 13);
INSERT INTO banda_possui_artista
VALUES (4, 11);
INSERT INTO banda_possui_artista
VALUES (4, 12);

INSERT INTO musica_possui_album
VALUES (1, 5, 8.14);
INSERT INTO musica_possui_album
VALUES (2, 4, 7.37);
INSERT INTO musica_possui_album
VALUES (3, 1, 5.28);
INSERT INTO musica_possui_album
VALUES (4, 2, 4.56);
INSERT INTO musica_possui_album
VALUES (5, 3, 3.33);
INSERT INTO musica_possui_album
VALUES (6, 7, 3.26);
INSERT INTO musica_possui_album
VALUES (7, 7, 4.01);
INSERT INTO musica_possui_album
VALUES (8, 8, 3.45);
INSERT INTO musica_possui_album
VALUES (9, 9, 3.53);
INSERT INTO musica_possui_album
VALUES (10, 9, 3.24);
INSERT INTO musica_possui_album
VALUES (11, 9, 4.12);
INSERT INTO musica_possui_album
VALUES (12, 10, 3.40);
INSERT INTO musica_possui_album
VALUES (13, 10, 4.01);
INSERT INTO musica_possui_album
VALUES (14, 10, 3.39);
INSERT INTO musica_possui_album
VALUES (15, 6, 3.11);
INSERT INTO musica_possui_album
VALUES (16, 11, 3.19);
INSERT INTO musica_possui_album
VALUES (17, 11, 3.29);
INSERT INTO musica_possui_album
VALUES (18, 12, 4.10);

INSERT INTO playlist_possui_musica
VALUES (1, 13);
INSERT INTO playlist_possui_musica
VALUES (1, 14);
INSERT INTO playlist_possui_musica
VALUES (1, 15);
INSERT INTO playlist_possui_musica
VALUES (1, 9);
INSERT INTO playlist_possui_musica
VALUES (1, 10);
INSERT INTO playlist_possui_musica
VALUES (1, 11);
INSERT INTO playlist_possui_musica
VALUES (1, 12);
INSERT INTO playlist_possui_musica
VALUES (2, 1);
INSERT INTO playlist_possui_musica
VALUES (2, 2);
INSERT INTO playlist_possui_musica
VALUES (2, 3);
INSERT INTO playlist_possui_musica
VALUES (2, 4);
INSERT INTO playlist_possui_musica
VALUES (2, 5);
INSERT INTO playlist_possui_musica
VALUES (3, 6);
INSERT INTO playlist_possui_musica
VALUES (3, 7);
INSERT INTO playlist_possui_musica
VALUES (3, 8);
INSERT INTO playlist_possui_musica
VALUES (4, 1);
INSERT INTO playlist_possui_musica
VALUES (4, 2);
INSERT INTO playlist_possui_musica
VALUES (4, 3);
INSERT INTO playlist_possui_musica
VALUES (4, 4);
INSERT INTO playlist_possui_musica
VALUES (5, 9);
INSERT INTO playlist_possui_musica
VALUES (5, 10);
INSERT INTO playlist_possui_musica
VALUES (5, 13);
INSERT INTO playlist_possui_musica
VALUES (5, 14);

-- ------------------ PROCEDURE --------------------------



-- Seleciona todas playlists que possuem músicas próprias para todas idades de um determinado usuário
DELIMITER //
CREATE PROCEDURE Playlist_Proprias_Usuario(
	`id_Usuario` INT
)
BEGIN
	IF (SELECT COUNT(*) FROM `Usuario` WHERE  `id_Usuario` = `id_Usuario`) > 0 THEN
		SELECT `nome` FROM `Usuario` WHERE  `id_Usuario` = `id_Usuario`;
		SELECT `nome`, `genero` FROM `Playlist` WHERE `Usuario_id_Usuario` = `id_Usuario` AND `id_Playlist` IN (SELECT `Playlist_id_Playlist` FROM `Musica` AS `M` JOIN `Playlist_possui_Musica` AS `PM` ON `M`.`id_Musica` = `PM`.`Musica_id_Musica` WHERE `impropria` = 0);
	-- ELSE
		-- PRINT 'Usuário não existente';
    END IF;
END//
DELIMITER ; 
CALL Playlist_Proprias_Usuario(1);
CALL Playlist_Proprias_Usuario(10);
DROP PROCEDURE Playlist_Proprias_Usuario;

-- Retorna bandas e seus respectivos albuns
DELIMITER //
CREATE PROCEDURE Albuns_Bandas()
BEGIN
	SET @conta = (SELECT COUNT(*) FROM `Banda`);
	WHILE @conta <> 0 DO
		IF (SELECT COUNT(*) FROM `Banda` AS `B` JOIN `Banda_possui_Album` AS `BA` ON `B`.`id_Banda` = `BA`.`Banda_id_Banda` WHERE `id_Banda` = @conta) > 0 THEN
			SELECT `nome_banda` AS `Nome Banda`, `nome_album` AS `Nome Album` FROM (`Banda` AS `B` JOIN `Banda_possui_Album` AS `BA` ON `B`.`id_Banda` = `BA`.`Banda_id_Banda`) JOIN `Album` AS `A` ON `A`.`id_Album` = `BA`.`Album_id_Album` WHERE `id_Banda` = @conta;
        END IF;
        SET @conta = @conta - 1;
	END WHILE;
END//
DELIMITER ;
CALL Albuns_Bandas();
DROP PROCEDURE Albuns_Bandas;


-- Retorna mês de aniversário de artistas
DELIMITER // 
CREATE PROCEDURE Artistas_Aniversariantes()
BEGIN
	SELECT CASE EXTRACT(MONTH FROM data_nascimento) 
             WHEN 01 THEN 'JAN'
             WHEN 02 THEN 'FEV'
             WHEN 03 THEN 'MAR'
             WHEN 04 THEN 'ABR'
             WHEN 05 THEN 'MAI'
             WHEN 06 THEN 'JUN'
             WHEN 07 THEN 'JUL'
             WHEN 08 THEN 'AGO'
             WHEN 09 THEN 'SET'
             WHEN 10 THEN 'OUT'
             WHEN 11 THEN 'NOV'
             WHEN 12 THEN 'DEZ'
          END AS mes, GROUP_CONCAT(nome) AS nome_artista
    FROM Artista
    GROUP BY mes;
END // 
DELIMITER ; 
CALL Artistas_Aniversariantes();

-- ----------------------- SELECTS -----------------------------


SELECT `nome` as `Nome Playlist/Criador` FROM `Playlist` WHERE `Usuario_id_Usuario` = 1 UNION SELECT `nome` FROM `Usuario` WHERE `id_Usuario` = 1;
SELECT `nome` as `Nome Criador`, COUNT(`nome_playlist`) as `Playlists Criadas` FROM `Playlist` JOIN `Usuario` ON `Playlist`.`Usuario_id_Usuario` = `Usuario`.`id_Usuario` GROUP BY `Usuario_id_Usuario`;
SELECT `nome` as `Artistas Vivos` FROM `Artista` WHERE `data_morte` IS NULL;
SELECT `nome` as `Artistas Mortos` FROM `Artista` WHERE `data_morte` IS NOT NULL;
SELECT `nome_banda` as `Banda Contemporânea`, `data_fundacao` as `Data de Fundação` FROM `Banda` HAVING `data_fundacao` >= "2000-01-01";
SELECT `nome_playlist` as `Playlist +18` FROM `playlist` WHERE `id_Playlist` IN (SELECT `Playlist_id_Playlist` FROM `Musica` AS `M` JOIN `Playlist_possui_Musica` AS `PM` ON `M`.`id_Musica` = `PM`.`Musica_id_Musica` WHERE `impropria` = 1);
SELECT `nome_banda` as `Nome Banda` FROM `Banda` WHERE `data_fundacao` BETWEEN "1900-01-01" AND "1999-12-31" ORDER BY `nome_banda`;
SELECT `nome_playlist` as `Nome Playlist` FROM `Playlist` WHERE `nome_playlist` LIKE 'a%' OR `nome_playlist` LIKE '%a';
SELECT `nome` as `Nome Criador`, `nome_playlist` as `Playlist` FROM `Playlist` RIGHT JOIN `Usuario` ON `Playlist`.`Usuario_id_Usuario` = `Usuario`.`id_Usuario` GROUP BY `Usuario_id_Usuario`;
SELECT `nome` as `Usuario maior de 18 anos` FROM `Usuario` WHERE EXISTS (SELECT * FROM `Usuario` WHERE `data_nascimento` < "2001-01-01");
SELECT `nome_playlist` as `Playlists` FROM `Playlist` WHERE `id_Playlist` = ANY (SELECT `Playlist_id_Playlist` FROM `playlist_possui_musica` AS `P` JOIN `Musica` AS `M` ON `P`.`Musica_id_musica`=`M`.`id_Musica`);
SELECT `nome_playlist` as `Playlists` FROM `Playlist` WHERE `id_Playlist` = ALL (SELECT `Playlist_id_Playlist` FROM `playlist_possui_musica` AS `P` JOIN `Musica` AS `M` ON `P`.`Musica_id_musica`=`M`.`id_Musica`);


-- ------------------------- UPDATES ----------------------


-- MUDA A DATA DE FUNDAÇAO DE BANDAS FUNDADAS EM 1960 PARA 1970
UPDATE `Banda` 
SET `data_fundacao` = "1970-01-01"
WHERE `data_fundacao` <= "1960-01-01";

-- MUDA A DATA DE MORTE APOS MUNDO ACABAR EM 2012
UPDATE `Artista`
SET `data_morte` = "2012-12-12"
WHERE `data_morte` IS NULL;

-- DEFINE NOME DE TODAS AS PLAYLISTS COM MUSICAS IMPROPRIAS
UPDATE `Playlist`
SET `nome` = "+18"
WHERE `id_Playlist` IN (SELECT `Playlist_id_Playlist` FROM `Musica` AS `M` JOIN `Playlist_possui_Musica` AS `PM` ON `M`.`id_Musica` = `PM`.`Musica_id_Musica` WHERE `impropria` = 1);

-- DEFINE NOVA SENHA PARA USUARIOS COM SENHAS INADEQUADAS
UPDATE `Usuario`
SET `senha` = "nova_senha_requerida"
WHERE `senha` = "1234" OR `senha` = "123456" OR `senha` = "12345678";

-- MUDA GENERO DE PLAYLISTS DE POP
UPDATE `Playlist`
SET `genero` = "pop e varios"
WHERE `genero` = "pop";

-- -------------------------------- USERS ------------------

CREATE USER 'artista'@'localhost' IDENTIFIED BY '0192';
CREATE USER 'usuario'@'localhost' IDENTIFIED BY '0193';
-- DROP USER 'artista'@'localhost';

GRANT ALL ON mydb.Musica TO 'artista'@'localhost';
GRANT ALL ON mydb.Playlist TO 'usuario'@'localhost';

GRANT ALL ON mydb.Album TO 'usuario'@'localhost';
REVOKE ALL ON mydb.Album FROM 'usuario'@'localhost';
