use `mydb`;


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