CREATE DATABASE RuneMX;

USE RuneMX;

CREATE TABLE usuario(
idUsuario INT PRIMARY KEY auto_increment,
usuario VARCHAR(45),
email VARCHAR(255),
senha VARChAR(45)
);

CREATE TABLE posts(
idPost INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(45),
conteudo VARCHAR(45),
tema VARCHAR(45),
fkUsuario INT,
dataPost DATETIME,
CONSTRAINT fkPostUsuario foreign key (fkUsuario) references usuario(idUsuario)
);

CREATE TABLE resposta(
idResposta INT auto_increment,
conteudo VARCHAR(45),
fkUsuario INT,
fkPost INT,
CONSTRAINT RespostaUsuario foreign key (fkUsuario) references usuario(idUsuario),
CONSTRAINT RespostaPost foreign key (fkPost) references Posts(idPost),
CONSTRAINT RespostaUsuarioPost PRIMARY KEY (idResposta,fkUsuario,fkPost)
);

CREATE TABLE 