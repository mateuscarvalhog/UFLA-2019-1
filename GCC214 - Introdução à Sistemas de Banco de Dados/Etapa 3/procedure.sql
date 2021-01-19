use `mydb`;


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

