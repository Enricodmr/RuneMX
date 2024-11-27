-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE aquatech;

USE aquatech;

CREATE TABLE empresa (
	id INT PRIMARY KEY AUTO_INCREMENT,
	razao_social VARCHAR(50),
	cnpj CHAR(14),
	codigo_ativacao VARCHAR(50)
);

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
	fk_empresa INT,
	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

create table quiz (
	idQuiz INT PRIMARY KEY AUTO_INCREMENT,
	pontos INT,
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERECES usuario (id)
);

-----


CREATE DATABASE runemx;

USE runemx;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
    tema VARCHAR(45),
	descricao VARCHAR(255),
	fkUsuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id),
	constraint chkTema CHECK (tema in('meme','estrategia','lore','comunidade'))
);

desc quiz;

create table quiz(
idQuizz INT PRIMARY KEY auto_increment,
qtdPontos INT,
fkUsuario INT,
foreign key (fkUsuario) references usuario(id)
);

SELECT 
            a.id AS idAviso,
            a.titulo,
            a.descricao,
            a.fk_usuario,
            u.id AS idUsuario,
            u.nome,
            u.email,
            u.senha
        FROM aviso a
            INNER JOIN usuario u
                ON a.fk_usuario = u.id
                    ORDER BY a.id DESC;

select * FROM usuario;

drop table resposta;

CREATE TABLE resposta(
idResposta INT auto_increment,
descricao VARCHAR(255),
fkUsuario INT,
fkPost INT,
CONSTRAINT RespostaUsuario foreign key (fkUsuario) references usuario(id),
CONSTRAINT RespostaPost foreign key (fkPost) references aviso(id),
CONSTRAINT RespostaUsuarioPost PRIMARY KEY (idResposta,fkUsuario,fkPost)
);


INSERT INTO usuario (nome, email, senha)
VALUES 
('Rodrigo Marques', 'rodrigo.marques@gmail.com', 'R@d_Marques22'),
('Ana Souza', 'ana.souza@gmail.com', 'A#na_Souza32'),
('Carlos Lima', 'carlos.lima@gmail.com', 'C%lima2023!'),
('Mariana Oliveira', 'mariana.oliveira@gmail.com', 'M@Oliveira77'),
('Lucas Santos', 'lucas.santos@gmail.com', 'L$Santos_123'),
('Fernanda Costa', 'fernanda.costa@gmail.com', 'F!costa45'),
('Pedro Almeida', 'pedro.almeida@gmail.com', 'P@Almeida99'),
('Juliana Freitas', 'juliana.freitas@gmail.com', 'J#Freitas2022'),
('Bruno Silva', 'bruno.silva@gmail.com', 'B&Silva$78'),
('Camila Torres', 'camila.torres@gmail.com', 'C!Torres55'),
('Ricardo Nunes', 'ricardo.nunes@gmail.com', 'R%Nunes88!'),
('Paula Ramos', 'paula.ramos@gmail.com', 'P@Ramos_24'),
('Felipe Souza', 'felipe.souza@gmail.com', 'F#Souza112'),
('Isabela Ferreira', 'isabela.ferreira@gmail.com', 'I$Ferreira91'),
('André Pereira', 'andre.pereira@gmail.com', 'A&Pereira@44'),
('Laura Machado', 'laura.machado@gmail.com', 'L@Machado66!'),
('João Mendes', 'joao.mendes@gmail.com', 'J#Mendes$88'),
('Clara Dias', 'clara.dias@gmail.com', 'C&Dias99!'),
('Rafael Gomes', 'rafael.gomes@gmail.com', 'R@Gomes_22'),
('Beatriz Lima', 'beatriz.lima@gmail.com', 'B#Lima78%'),
('Thiago Barros', 'thiago.barros@gmail.com', 'T$Barros55'),
('Gabriela Silva', 'gabriela.silva@gmail.com', 'G!Silva44'),
('Eduardo Costa', 'eduardo.costa@gmail.com', 'E%Costa$33'),
('Amanda Oliveira', 'amanda.oliveira@gmail.com', 'A@Oliveira99!'),
('Diego Santos', 'diego.santos@gmail.com', 'D#Santos_77'),
('Priscila Ribeiro', 'priscila.ribeiro@gmail.com', 'P&Ribeiro@88'),
('Vinícius Alves', 'vinicius.alves@gmail.com', 'V@Alves$44'),
('Carolina Rocha', 'carolina.rocha@gmail.com', 'C#Rocha123'),
('Henrique Martins', 'henrique.martins@gmail.com', 'H$Martins_12'),
('Larissa Cunha', 'larissa.cunha@gmail.com', 'L!Cunha_99'),
('Miguel Carvalho', 'miguel.carvalho@gmail.com', 'M@Carvalho55!'),
('Alice Fernandes', 'alice.fernandes@gmail.com', 'A#Fernandes33'),
('Matheus Castro', 'matheus.castro@gmail.com', 'M%Castro22'),
('Bianca Vieira', 'bianca.vieira@gmail.com', 'B@Vieira88'),
('Renato Duarte', 'renato.duarte@gmail.com', 'R#Duarte44'),
('Sofia Mendes', 'sofia.mendes@gmail.com', 'S&Mendes12'),
('Igor Brito', 'igor.brito@gmail.com', 'I@Brito33!'),
('Vanessa Araújo', 'vanessa.araujo@gmail.com', 'V#Araujo99'),
('Fábio Teixeira', 'fabio.teixeira@gmail.com', 'F%Teixeira55'),
('Patrícia Moraes', 'patricia.moraes@gmail.com', 'P@Moraes88'),
('Victor Andrade', 'victor.andrade@gmail.com', 'V#Andrade33'),
('Jéssica Reis', 'jessica.reis@gmail.com', 'J%Reis99'),
('Otávio Moreira', 'otavio.moreira@gmail.com', 'O@Moreira44'),
('Evelyn Pires', 'evelyn.pires@gmail.com', 'E#Pires77'),
('Daniela Lopes', 'daniela.lopes@gmail.com', 'D$Lopes12'),
('Leandro Maciel', 'leandro.maciel@gmail.com', 'L!Maciel55'),
('Helena Santana', 'helena.santana@gmail.com', 'H@Santana88'),
('Caio Rocha', 'caio.rocha@gmail.com', 'C#Rocha33!'),
('Sabrina Almeida', 'sabrina.almeida@gmail.com', 'S%Almeida44');
ALTER TABLE aviso MODIFY COLUMN descricao VARCHAR(255);
ALTER TABLE aviso ADD constraint chkTema CHECK (tema in('meme','estrategia','lore','comunidade'));
-- Inserindo 50 avisos relacionados a League of Legends
INSERT INTO aviso (titulo, tema, descricao, fkUsuario)
VALUES
('Estratégia para subir de elo', 'estrategia', 'Aprenda as melhores rotas para garantir sua vitória.', 1),
('Os melhores campeões para iniciantes', 'comunidade', 'Descubra os campeões mais fáceis de aprender.', 2),
('Como melhorar sua visão de mapa', 'estrategia', 'Dicas para wardar e evitar ganks.', 3),
('Rotação de campeões gratuitos desta semana', 'comunidade', 'Veja quais campeões estão grátis.', 4),
('Tier list atualizada', 'estrategia', 'Saiba quais campeões estão mais fortes no meta.', 5),
('Dicas para subir no SoloQ', 'estrategia', 'Conselhos para melhorar sua performance em rankeds.', 6),
('Os melhores combos de runas', 'lore', 'Configure suas runas de maneira eficiente.', 7),
('Como jogar de suporte no meta atual', 'estrategia', 'Estratégias para ser um suporte efetivo.', 8),
('Entenda as atualizações mais recentes', 'estrategia', 'Resumo das mudanças do último patch.', 9),
('Jogando no topo: os campeões mais fortes', 'comunidade', 'Escolhas dominantes para a rota do topo.', 10),
('Controle de dragões e arautos', 'estrategia', 'Dicas para dominar os objetivos neutros.', 11),
('O papel do midlaner no jogo', 'estrategia', 'Como impactar o mapa jogando no meio.', 12),
('Os segredos para jogar de ADC', 'estrategia', 'Como carregar partidas jogando na bot lane.', 13),
('A arte do split push', 'meme', 'Pega sion, se terminar com menos de 15 mortes ainda tá ruim!', 14),
('Comunicação eficiente com sua equipe', 'estrategia', 'Melhore a sinergia com seus aliados.', 15),
('Como lidar com campeões OP', 'meme', 'Bíblia e muita fé amigo!', 16),
('Qual é o momento certo para forçar uma luta?', 'estrategia', 'Decisões táticas em teamfights.', 17),
('A melhor skin lançada recentemente', 'meme', 'GRAGAS KDA!!!', 18),
('Builds alternativas que funcionam', 'meme', 'Já tentaram o tryndamere AP?', 19),
('Aprendendo a snowballar no early game', 'estrategia', 'Transforme vantagens iniciais em vitórias.', 20),
('Como evitar tilt e jogar melhor', 'estrategia', 'Controle emocional no jogo.', 21),
('Os counters mais efetivos para Zed', 'estrategia', 'Como lidar com o assassino das sombras.', 22),
('Por que wardar é tão importante?', 'estrategia', 'Impacto da visão no jogo.', 23),
('As estratégias dos Challengers!', 'estrategia', 'Táticas dos melhores jogadores.', 24),
('O que é macro play e como usá-lo?', 'estrategia', 'Entenda como dominar a estratégia global.', 25),
('Ajustando sua sensibilidade no mouse', 'comunidade', 'Como encontrar a configuração perfeita.', 26),
('Builds imbatíveis para Jinx', 'estrategia', 'Potencialize sua carry favorita.', 27),
('Entendendo os buffs e nerfs mais recentes', 'estrategia', 'O que mudou no último patch.', 28),
('Dicas para subir de ferro para prata', 'estrategia', 'Evolua suas habilidades e saia do low elo.', 29),
('Coaching: vale a pena contratar?', 'comunidade', 'Vantagens e desvantagens.', 30),
('Os itens mais quebrados atualmente', 'estrategia', 'Descubra os melhores itens no meta.', 31),
('Desempenho no ARAM: dicas e truques', 'estrategia', 'Seja o MVP no modo All Random All Mid.', 32),
('Os melhores campeões para jungle', 'estrategia', 'Domine a selva com essas escolhas.', 33),
('Como jogar de Yasuo sem irritar sua equipe', 'meme', 'Chat desativado e pare de se matar!', 34),
('Análise dos últimos playoffs', 'comunidade', 'Veja como os profissionais jogaram.', 35),
('Dicas avançadas para teamfights', 'estrategia', 'Ganhe confrontos decisivos.', 36),
('Quem matou o mestre do Yasuo?', 'lore', 'Quem realmente matou o mestre do Yasuo na guerra entre Ionia e Noxus?', 37),
('Quem prendeu o Sylas', 'lore', 'Quem foi o responsável pela prisão do Sylas em Demacia?', 38),
('A importância de se adaptar ao meta', 'comunidade', 'Como manter-se relevante no jogo.', 39),
('Os campeões mais fáceis para aprender jungle', 'comunidade', 'Comece a selvar com facilidade.', 40),
('Como usar pings de forma eficaz', 'estrategia', 'Melhore a comunicação com a equipe.', 41),
('Melhores campeões para o late game', 'comunidade', 'Dominância nas fases finais.', 42),
('Quando lutar por Barão é uma boa ideia?', 'estrategia', 'Decisões estratégicas em torno do Barão.', 43),
('Melhores times do compet', 'comunidade', 'Saiba quem está dominando o cenário.', 44),
('Os campeões mais fáceis de dominar no mid', 'comunidade', 'Escolhas para iniciar na rota do meio.', 45),
('Como ser um líder no time', 'meme', 'Perma splitpush de yorick na side', 46),
('As mudanças de itemização para suportes', 'estrategia', 'Adapte-se ao novo meta.', 47),
('Qual o nome da mãe da jinx?', 'lore', 'Qual o nome da mãe da jinx e da vi?', 48),
('Quem carrega as runas primordiais?', 'lore', 'Qual o campeão que carrega as runas primordiais?', 49),
('A evelynn matou os pais da vayne?', 'lore', 'Teria os pais da vayne sidos mortos pela evelynn?', 50);

INSERT INTO resposta(descricao, fkUsuario, fkPost) VALUES ('Adorei as dicas, comecei a subir no mesmo dia!', 2, 1), ('Prefiro focar em campeões carry para subir de elo.', 3, 1), ('Alguém me ajuda com meu time troll? rs', 4, 1), ('Ahri é um ótimo campeão para começar.', 5, 2);

INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Ryze é complicado, não recomendaria para iniciantes.', 6, 2);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Ótima lista, funcionou bem comigo!', 7, 2);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Wardar tri-bush salva vidas!', 8, 3);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Sempre esqueço de comprar sentinela... vou melhorar!', 9, 3);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Ótimas dicas, agora consigo evitar ganks.', 10, 3);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Finalmente posso testar a Ahri de graça!', 11, 4);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Gostei da rotação dessa semana!', 12, 4);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Tem campeão OP de graça? Vou aproveitar!', 13, 4);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Camille está muito forte atualmente.', 14, 5);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Essa tier list está bem precisa.', 15, 5);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Só jogo com campeões que gosto, não ligo pro meta.', 16, 5);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('A dica de mutar o time foi a melhor!', 17, 6);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Concordo, foco em si mesmo é essencial.', 18, 6);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Alguém me carrega? rs', 19, 6);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Runas secundárias também fazem muita diferença.', 20, 7);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Runas resolvem metade do jogo, excelente guia!', 21, 7);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Alguém tem dicas específicas para suporte?', 22, 7);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Ser suporte é mais divertido do que parece.', 23, 8);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Suporte é a alma do time.', 24, 8);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Quem quer duo com um suporte prata?', 25, 8);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Mudança no Jax foi muito boa!', 26, 9);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Espero que não nerfem meu main.', 27, 9);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Quando o Udyr vai parar de ser tão forte?', 28, 9);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Irelia está dominando o topo.', 29, 10);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Renekton é imortal nessa rota!', 30, 10);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Alguém me ensina Fiora?', 31, 10);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Controle de dragão faz muita diferença.', 32, 11);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Lutar por arauto vale muito a pena no early game.', 33, 11);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('O segredo é o timing para fazer os objetivos.', 34, 11);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Mid sempre tem que rotacionar bem.', 35, 12);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Ser mid é carregar o time nas costas.', 36, 12);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Adorei as dicas, valeu!', 37, 12);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('ADC com um bom suporte carrega fácil.', 38, 13);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Varus está muito forte como ADC.', 39, 13);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Preciso melhorar meu farm urgente.', 40, 13);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Split de Sion é hilário! Adorei a ideia.', 41, 14);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Acho Yorick melhor no split.', 42, 14);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Split push só funciona se o time colaborar.', 43, 14);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Comunicação salva o jogo.', 44, 15);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Use pings corretamente, pessoal!', 45, 15);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Falar menos no chat e mais pings.', 46, 15);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Sempre bane quem você acha OP.', 47, 16);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Gosto de campeões equilibrados no meta.', 48, 16);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Dá pra counterar, é só se adaptar.', 49, 16);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Forçar lutas ruins é game over.', 50, 17);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Adorei as dicas, valeu por compartilhar.', 1, 17);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('O segredo é paciência nas teamfights.', 2, 17);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Gragas KDA é a melhor skin ever!', 3, 18);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Só falta liberar a minha Riot Points...', 4, 18);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Gragas KDA ou nada!', 5, 18);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Já tentei Trynda AP, é divertido demais.', 6, 19);
INSERT INTO resposta (descricao, fkUsuario, fkPost)
VALUES
('Build alternativa só em normal game.', 7, 19);