CREATE DATABASE FICHA_MEDICA;
USE FICHA_MEDICA;

CREATE TABLE especializacao (
	id INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
    nome VARCHAR(255),
	PRIMARY KEY(id)
);

CREATE TABLE medico (
	id INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	nome VARCHAR(255),
	crm BIGINT,
	data_entrada DATETIME,
	data_saida DATETIME,
	taxa_sucesso DECIMAL,
	id_especializacao INTEGER,
	PRIMARY KEY(id),
    FOREIGN KEY(id_especializacao) REFERENCES especializacao(id)
);
CREATE TABLE experiencia (
    id_especializacao INTEGER,
    data_entrada DATETIME,
    data_saida DATETIME,
    FOREIGN KEY(id_especializacao) REFERENCES especializacao(id)
);

CREATE TABLE diagnostico (
	id INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	enfermidade VARCHAR(100),
	PRIMARY KEY(id)
);

CREATE TABLE consulta (
	id INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
    data DATETIME,
    id_medico INT,
	id_diagnostico INT,
	PRIMARY KEY(id),
	FOREIGN KEY(id_medico) REFERENCES medico(id),
	FOREIGN KEY(id_diagnostico) REFERENCES diagnostico(id)
);

CREATE TABLE tipo_exame (
	id INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	tipo VARCHAR(255),
	PRIMARY KEY(id)
);

CREATE TABLE exame (
	id INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	id_tipo_exame INTEGER,
	data DATETIME,
	PRIMARY KEY(id),
    FOREIGN KEY(id_tipo_exame) REFERENCES tipo_exame(id)
);

CREATE TABLE estado_civil (
	id INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	estado VARCHAR(255),
	PRIMARY KEY(id)
);

CREATE TABLE sexo (
	id INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	sexo CHAR(1),
	PRIMARY KEY(id)
);

CREATE TABLE endereco (
	id INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	logradouro VARCHAR(255),
	numero INTEGER,
	bairro VARCHAR(255),
	cidade VARCHAR(255),
	estado VARCHAR(255),
	PRIMARY KEY(id)
);

CREATE TABLE tipo_sanguineo (
	id INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	tipo CHAR(3),
	PRIMARY KEY(id)
);

CREATE TABLE convenio (
	id INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	nome VARCHAR(255),
	cobertura VARCHAR(255),
	PRIMARY KEY(id)
);

CREATE TABLE ficha (
	id INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	nome VARCHAR(255),
	data_nascimento DATETIME,
	id_tipo_sanguineo INTEGER,
	id_sexo INTEGER,
	id_convenio INTEGER,
	id_exame INTEGER,
	id_consulta INTEGER,
	id_estado_civil INTEGER,
	id_endereco INTEGER,
	rg INTEGER,
	cpf BIGINT,
	telefone BIGINT,
	PRIMARY KEY(id),
	FOREIGN KEY(id_tipo_sanguineo) REFERENCES tipo_sanguineo(id),
	FOREIGN KEY(id_sexo) REFERENCES sexo(id),
	FOREIGN KEY(id_convenio) REFERENCES convenio(id),
	FOREIGN KEY(id_exame) REFERENCES exame(id),
	FOREIGN KEY(id_consulta) REFERENCES consulta(id),
    FOREIGN KEY(id_estado_civil) REFERENCES estado_civil(id),
    FOREIGN KEY(id_endereco) REFERENCES endereco(id)
);