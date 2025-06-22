CREATE DATABASE CINEMA;
USE CINEMA;

CREATE TABLE `EmpresaDistribuidora` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL
);

CREATE TABLE `Cinema` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome_fantasia` VARCHAR(100) NOT NULL,
  `endereco` VARCHAR(200),
  `telefone` VARCHAR(20),
  `email` VARCHAR(100),
  `id_empresa` INT
);

CREATE TABLE `Diretor` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `nacionalidade` VARCHAR(50),
  `data_nascimento` DATE
);

CREATE TABLE `Genero_Filme` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `genero` VARCHAR(50)
);

CREATE TABLE `Filme` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `titulo_original` VARCHAR(150) NOT NULL,
  `id_genero` INT,
  `duracao` INT,
  `id_diretor` INT,
  `diretor_atuando` BOOL
);

CREATE TABLE `Ator` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `nacionalidade` VARCHAR(50),
  `data_nascimento` DATE
);

CREATE TABLE `Filme_Ator` (
  `id_filme` INT,
  `id_ator` INT
);

CREATE TABLE `Sessao` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `id_cinema` INT,
  `id_filme` INT,
  `horario_inicio` TIME
);

CREATE TABLE `Ingresso` (
  `id` INT PRIMARY KEY,
  `id_cliente` INT,
  `id_sessao` INT,
  `valor_total` DECIMAL(15,2),
  `valor_desconto` DECIMAL(15,2),
  `data_compra` DATETIME,
  `assento` VARCHAR(10)
);

CREATE TABLE `Cliente` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(50),
  `email` VARCHAR(255),
  `cpf` BIGINT,
  `telefone` BIGINT,
  `data_nascimento` DATE,
  `estudante` BOOL
);

CREATE INDEX `Filme_Ator_index_0` ON `Filme_Ator` (`id_filme`, `id_ator`);

ALTER TABLE `Cinema` ADD FOREIGN KEY (`id_empresa`) REFERENCES `EmpresaDistribuidora` (`id`);

ALTER TABLE `Filme` ADD FOREIGN KEY (`id_diretor`) REFERENCES `Diretor` (`id`);

ALTER TABLE `Filme_Ator` ADD FOREIGN KEY (`id_filme`) REFERENCES `Filme` (`id`);

ALTER TABLE `Filme` ADD FOREIGN KEY (`id_genero`) REFERENCES `Genero_Filme` (`id`);

ALTER TABLE `Filme_Ator` ADD FOREIGN KEY (`id_ator`) REFERENCES `Ator` (`id`);

ALTER TABLE `Sessao` ADD FOREIGN KEY (`id_cinema`) REFERENCES `Cinema` (`id`);

ALTER TABLE `Sessao` ADD FOREIGN KEY (`id_filme`) REFERENCES `Filme` (`id`);

ALTER TABLE `Ingresso` ADD FOREIGN KEY (`id_cliente`) REFERENCES `Cliente` (`id`);

ALTER TABLE `Ingresso` ADD FOREIGN KEY (`id_sessao`) REFERENCES `Sessao` (`id`);


