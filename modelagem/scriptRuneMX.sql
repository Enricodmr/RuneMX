CREATE DATABASE RuneMX;
USE RuneMX;

show tables;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50)
);

CREATE TABLE aviso(
id INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(45),
tema VARCHAR(45),
descricao VARCHAR(45),
fkUsuario INT,
CONSTRAINT fkPostUsuario foreign key (fkUsuario) references usuario(id)
);

CREATE TABLE resposta(
idResposta INT auto_increment,
conteudo VARCHAR(255),
fkUsuario INT,
fkPost INT,
CONSTRAINT RespostaUsuario foreign key (fkUsuario) references usuario(id),
CONSTRAINT RespostaPost foreign key (fkPost) references aviso(id),
CONSTRAINT RespostaUsuarioPost PRIMARY KEY (idResposta,fkUsuario,fkPost)
);


CREATE TABLE quiz(
idQuizz INT PRIMARY KEY auto_increment,
qtdPontos INT,
fkUsuario INT,
CONSTRAINT fkUsuarioQuiz foreign key (fkUsuario) references usuario(id)
);

SELECT * FROM usuario;

SELECT * FROM quiz;

ALTER TABLE quiz RENAME COLUMN pontos to QtdPontos;
INSERT INTO posts VALUES(
DEFAULT,'oLOCO','kogudo 1k pdl','Soloq',1,'2024-11-13 18:02:00'
);

-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

create table quiz(
idQuizz INT PRIMARY KEY auto_increment,
qtdPontos INT,
fkUsuario INT,
foreign key (fkUsuario) references usuario(id)
);

select * from usuario;
select * from quiz;

select truncate(avg(qtdPontos),0) AS MediaPontuacao from quiz;


SELECT a.id AS idAviso,
            a.titulo,
            a.tema,
            a.descricao,
            a.fk_usuario,
            u.id AS idUsuario,
            u.nome,
            u.email,
            u.senha
        FROM aviso a
            INNER JOIN usuario u
                ON a.fk_usuario = u.id
        WHERE a.id = 8;