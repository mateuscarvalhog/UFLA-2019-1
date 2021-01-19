use `mydb`;


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