use `mydb`;


CREATE USER 'artista'@'localhost' IDENTIFIED BY '0192';
CREATE USER 'usuario'@'localhost' IDENTIFIED BY '0193';
-- DROP USER 'artista'@'localhost';

GRANT ALL ON mydb.Musica TO 'artista'@'localhost';
GRANT ALL ON mydb.Playlist TO 'usuario'@'localhost';

GRANT ALL ON mydb.Album TO 'usuario'@'localhost';
REVOKE ALL ON mydb.Album FROM 'usuario'@'localhost';