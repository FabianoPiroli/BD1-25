CREATE DATABASE SIMPOSIO;

USE SIMPOSIO;

CREATE TABLE `simposio` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`curso` VARCHAR(255),
	`data` DATETIME,
	PRIMARY KEY(`id`)
);

CREATE TABLE `pessoa` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`nome` VARCHAR(255),
	`data_nascimento` DATETIME,
	`sexo` VARCHAR(1),
	PRIMARY KEY(`id`)
);

CREATE TABLE `organizadores` (
	`id_pessoa` INTEGER,
	`id_simposio` INTEGER,
	FOREIGN KEY (id_pessoa) REFERENCES pessoa(id),
    FOREIGN KEY (id_simposio) REFERENCES simposio(id)
);

CREATE TABLE `temas` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`nome` VARCHAR(255),
	PRIMARY KEY(`id`)
);

CREATE TABLE `artigos` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`nome` VARCHAR(255),
  `id_tema` INTEGER,
	 PRIMARY KEY(`id`),
   FOREIGN KEY (id_tema) REFERENCES temas(id)
);

CREATE TABLE `autores` (
	`id_pessoa` INTEGER,
    `id_artigo` INTEGER,
	FOREIGN KEY (id_pessoa) REFERENCES pessoa(id),
    FOREIGN KEY (id_artigo) REFERENCES artigos(id)
);

CREATE TABLE `comissao` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`id_artigo` INTEGER,
	PRIMARY KEY(`id`),
    FOREIGN KEY (id_artigo) REFERENCES artigos(id)
);

CREATE TABLE `comissarios` (
	`id_pessoa` INTEGER,
	`id_comissao` INTEGER,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id),
    FOREIGN KEY (id_comissao) REFERENCES comissao(id)
);

CREATE TABLE `mini_cursos` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
  `nome` VARCHAR(255),
	`id_tema` INTEGER,
	`id_ministrante` INTEGER,
	`data` DATETIME,
	PRIMARY KEY(`id`),
    FOREIGN KEY (id_tema) REFERENCES temas(id),
    FOREIGN KEY (id_ministrante) REFERENCES pessoa(id)
);

CREATE TABLE `inscricao_minicurso` (
	`id_pessoa` INTEGER,
	`id_minicurso` INTEGER,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id),
    FOREIGN KEY (id_minicurso) REFERENCES mini_cursos(id)
);

CREATE TABLE `palestras` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`nome` VARCHAR(255),
	`id_tema` INTEGER,
	`id_ministrante` INTEGER,
	PRIMARY KEY(`id`),
    FOREIGN KEY (id_tema) REFERENCES temas(id),
    FOREIGN KEY (id_ministrante) REFERENCES pessoa(id)
);

CREATE TABLE `inscricao_palestra` (
	`id_pessoa` INTEGER,
	`id_palestra` INTEGER,
	FOREIGN KEY (id_pessoa) REFERENCES pessoa(id),
    FOREIGN KEY (id_palestra) REFERENCES palestras(id)
);



-- criando simposio
INSERT INTO simposio (curso, data) VALUES
('Ciências da Computação', '2025-06-02');


-- Organizadores do simpósio
INSERT INTO organizadores (id_pessoa, id_simposio) VALUES
(1, 1),
(2, 1),
(3, 1);


-- criando pessoa
INSERT INTO pessoa (nome, data_nascimento, sexo) VALUES
('Maria Silva', '1984-04-05', 'F'),
('João Santos', '1995-03-11', 'M'),
('Ana Pereira', '1977-08-01', 'F'),
('Carlos Lima', '1998-11-28', 'M'),
('Júlia Fernandes', '1999-05-27', 'F'),
('Fernando Costa', '2000-03-14', 'M'),
('Mariana Oliveira', '2002-12-19', 'F'),
('Lucas Almeida', '1980-07-22', 'M'),
('Fernanda Rocha', '1969-10-13', 'F'),
('Roberto Dias', '1997-02-08', 'M');

-- criando temas
INSERT INTO temas (nome) VALUES
('Banco de Dados'),
('Programação I'),
('Programação II'),
('Tecnologias da Informação'),
('Arquitetura de Computadores'),
('Arduínos'),
('Acumuladores'),
('Flags'),
('Funções Recursivas');

-- criando artigos 
INSERT INTO artigos (nome, id_tema) VALUES 
('A Inteligência Artificial na Educação', 1),
('Tecnologias Sustentáveis para o Futuro', 1),
('Cibersegurança e Privacidade Digital', 2),
('Desenvolvimento de Software Ágil', 2),
('Machine Learning Aplicado à Medicina', 1),
('Inclusão Digital em Comunidades Rurais', 3),
('Robótica Educacional no Ensino Fundamental', 1),
('Redes Neurais e Reconhecimento de Imagens', 2),
('Blockchain e Segurança de Dados', 2),
('Jogos Digitais como Ferramenta de Aprendizagem', 3);

-- criando mini-cursos
INSERT INTO mini_cursos (nome, id_tema, id_ministrante, data) VALUES
('Aplicação da Criptográfia em Sistemas Financeiros', 4, 2, '2025-06-01'),
('Html', 4, 2, '2025-06-05'),
('Python', 4, '2, 2025-06-10'),
('C++', 4, 2, '2025-06-12'),
('Java', 4, 2, '2025-06-01');


-- Criando 3 comissões 
INSERT INTO comissao (id_artigo) VALUES (1); -- Comissão Científica (id = 1)
INSERT INTO comissao (id_artigo) VALUES (2); -- Comissão Organizadora (id = 2)
INSERT INTO comissao (id_artigo) VALUES (3); -- Comissão de Divulgação (id = 3)

-- Adicionando 5 pessoas nas comissões
-- Comissão Científica (id_comissao = 1)
INSERT INTO comissarios (id_pessoa, id_comissao) VALUES (1, 1);
INSERT INTO comissarios (id_pessoa, id_comissao) VALUES (2, 1);
-- Comissão Organizadora (id_comissao = 2)
INSERT INTO comissarios (id_pessoa, id_comissao) VALUES (3, 2);
INSERT INTO comissarios (id_pessoa, id_comissao) VALUES (4, 2);
-- Comissão de Divulgação (id_comissao = 3)
INSERT INTO comissarios (id_pessoa, id_comissao) VALUES (5, 3);

INSERT INTO inscricao_minicurso (id_pessoa, id_minicurso) VALUES
(4, 1),
(5, 1),
(6, 2),
(7, 2),
(8, 3),
(9, 3);

-- Palestras
INSERT INTO palestras (nome, id_tema, id_ministrante) VALUES
('A importância do Banco de Dados na Indústria', 1, 4),
('Desmistificando Recursividade', 9, 5),
('Flags e seus usos em baixo nível', 8, 6);

-- Inscrições em palestras
INSERT INTO inscricao_palestra (id_pessoa, id_palestra) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3);