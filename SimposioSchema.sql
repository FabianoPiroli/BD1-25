CREATE DATABASE SIMPOSIO;

USE SIMPOSIO;

-- deve ser a tabela principal 

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

    -- faltou chave primaria composta
    
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

-- evitar redundancia
-- eliminar relacionamento
-- adicionar booleano para verificar se é ou nao mistrante da palestra

CREATE TABLE `inscricao_palestra` (
	`id_pessoa` INTEGER,
	`id_palestra` INTEGER,
	FOREIGN KEY (id_pessoa) REFERENCES pessoa(id),
    FOREIGN KEY (id_palestra) REFERENCES palestras(id)
);