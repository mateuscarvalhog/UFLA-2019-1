use mydb;

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