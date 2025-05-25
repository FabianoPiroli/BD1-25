CREATE DATABASE FORMULARIO;

USE FORMULARIO;


CREATE TABLE `estado-civil` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`estado` VARCHAR(255),
	PRIMARY KEY(`id`)
);


CREATE TABLE `cargo` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`cargo` VARCHAR(255),
	PRIMARY KEY(`id`)
);


CREATE TABLE `departamento` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`nome` VARCHAR(255),
	PRIMARY KEY(`id`)
);


CREATE TABLE `sexo` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`sexo` CHAR(1),
	PRIMARY KEY(`id`)
);


CREATE TABLE `endereco` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`Logradouro` VARCHAR(255),
	`Número` INTEGER,
	`Bairro` VARCHAR(255),
	`Cidade` VARCHAR(255),
	`Estado` VARCHAR(255),
	PRIMARY KEY(`id`)
);


CREATE TABLE `matricula` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`data-nascimento` DATETIME,
	`nacionalidade` VARCHAR(255),
	`sexo` INT NOT NULL,
	`estado-civil` INTEGER,
	`rg` INTEGER,
	`cpf` INTEGER,
	`endereco` INT NOT NULL,
	`data-admissao` DATETIME,
	PRIMARY KEY(`id`),
    FOREIGN KEY(`endereco`) REFERENCES `endereco`(`id`),
    FOREIGN KEY(`estado-civil`) REFERENCES `estado-civil`(`id`),
	FOREIGN KEY(`sexo`) REFERENCES `sexo`(`id`)
);


CREATE TABLE `cargos-ocupados` (
	`id-matricula` INTEGER NOT NULL AUTO_INCREMENT,
	`cargo` INTEGER NOT NULL,
	`data-inicio` DATETIME,
	`data-fim` DATETIME,
    FOREIGN KEY(`id-matricula`) REFERENCES `matricula`(`id`),
    FOREIGN KEY(`cargo`) REFERENCES `cargo`(`id`)
);


CREATE TABLE `departamento-lotacao` (
	`id-matricula` INTEGER NOT NULL AUTO_INCREMENT,
	`departamento` INTEGER,
	`data-inicio` DATETIME,
	`data-fim` DATETIME,
    FOREIGN KEY(`id-matricula`) REFERENCES `matricula`(`id`),
    FOREIGN KEY(`departamento`) REFERENCES `departamento`(`id`)
);


CREATE TABLE `dependentes` (
	`id-matricula` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`nome` VARCHAR(255),
	`data-nascimento` DATETIME,
    FOREIGN KEY(`id-matricula`) REFERENCES `matricula`(`id`)
);



### **Tabela `estado-civil`**

INSERT INTO `estado-civil` (`estado`) VALUES 
('Solteiro'),
('Casado'),
('Divorciado'),
('Viúvo'),
('União Estável');


### **Tabela `cargo`**

INSERT INTO `cargo` (`cargo`) VALUES 
('Analista de Sistemas'),
('Engenheiro de Software'),
('Gerente de Projetos'),
('Designer UX/UI'),
('Administrativo');


### **Tabela `departamento`**

INSERT INTO `departamento` (`nome`) VALUES 
('TI'),
('Recursos Humanos'),
('Marketing'),
('Vendas'),
('Financeiro');


### **Tabela `endereco`**

INSERT INTO `endereco` (`Logradouro`, `Número`, `Bairro`, `Cidade`, `Estado`) VALUES 
('Rua das Flores', 123, 'Centro', 'São Paulo', 'SP'),
('Avenida Brasil', 456, 'Jardins', 'Rio de Janeiro', 'RJ'),
('Travessa dos Pinheiros', 789, 'Zona Sul', 'Porto Alegre', 'RS'),
('Rua da Paz', 101, 'Boa Vista', 'Curitiba', 'PR'),
('Avenida Central', 202, 'Zona Oeste', 'Belo Horizonte', 'MG');


### **Tabela `sexo`**

INSERT INTO `sexo` (`sexo`) VALUES 
('M'),
('F');


### **Tabela `matricula`**

INSERT INTO `matricula` (`data-nascimento`, `nacionalidade`, `sexo`, `estado-civil`, `rg`, `cpf`, `endereco`, `data-admissao`) VALUES 
('1990-05-12', 'Brasileira', 1, 2, 12345678, 987654321, 1, '2022-03-15'),
('1985-07-23', 'Argentina', 2, 1, 87654321, 123456789, 2, '2021-11-10'),
('1998-11-30', 'Chilena', 1, 3, 11223344, 556677889, 3, '2023-01-05'),
('2000-01-01', 'Peruana', 2, 4, 44332211, 998877665, 4, '2020-07-20'),
('1995-06-18', 'Mexicana', 1, 1, 22446688, 334455667, 5, '2019-05-25');


### **Tabela `cargos-ocupados`**

INSERT INTO `cargos-ocupados` (`id-matricula`, `cargo`, `data-inicio`, `data-fim`) VALUES 
(1, 2, '2022-03-15', NULL),
(2, 3, '2021-11-10', '2024-05-01'),
(3, 5, '2023-01-05', NULL),
(4, 1, '2020-07-20', '2023-12-31'),
(5, 4, '2019-05-25', NULL);


### **Tabela `departamento-lotacao`**

INSERT INTO `departamento-lotacao` (`id-matricula`, `departamento`, `data-inicio`, `data-fim`) VALUES 
(1, 1, '2022-03-15', NULL),
(2, 3, '2021-11-10', NULL),
(3, 5, '2023-01-05', '2024-02-01'),
(4, 2, '2020-07-20', NULL),
(5, 4, '2019-05-25', '2023-08-10');


### **Tabela `dependentes`**

INSERT INTO `dependentes` (`id-matricula`, `nome`, `data-nascimento`) VALUES 
(1, 'Pedro Silva', '2015-06-20'),
(2, 'Ana Souza', '2010-09-15'),
(3, 'Carlos Mendes', '2018-12-05'),
(4, 'Fernanda Oliveira', '2012-03-30'),
(5, 'Lucas Ferreira', '2016-07-10');


SELECT * FROM matricula;
SELECT * FROM dependentes;
SELECT * FROM `departamento-lotacao`;
SELECT * FROM departamento;
SELECT * FROM cargo;
SELECT * FROM `cargos-ocupados`;
SELECT * FROM `sexo`;
SELECT * FROM `endereco`;
SELECT * FROM `estado-civil`;

### **Ajustar relacionamentos das tabelas`**







