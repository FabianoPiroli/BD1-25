create database Veterinaria;

use Veterinaria;

CREATE TABLE TIPO_ANIMAL(
	ID int not null auto_increment primary key,
    NOME varchar(255)
);

CREATE TABLE ANIMAL(
	ID int not null auto_increment primary key,
    NOME varchar(255),
    ID_TIPO_ANIMAL INT NOT NULL,
    DT_NASCIMENTO INT NOT NULL,
    COR VARCHAR(30),
    PESO INT NOT NULL,
    ALTURA INT NOT NULL
);

CREATE TABLE VACINA (
	ID int not null auto_increment primary key,
     NOME varchar(255),
     DATA_APLICACAO INT NOT NULL,
     ID_ANIMAL INT NOT NULL,
      CONSTRAINT FK_ID_ANIMAL_VACINA
		foreign key (ID)
        references ANIMAL(ID)
);

CREATE INDEX IDX_ANIMAL_TIPO_ANIMAL
    ON ANIMAL (ID_TIPO_ANIMAL);

CREATE INDEX IDX_VACINA_ID_ANIMAL
    ON VACINA (ID_ANIMAL);


INSERT INTO TIPO_ANIMAL (NOME) VALUES ('CANINO');
INSERT INTO TIPO_ANIMAL (NOME) VALUES ('FELINO');
INSERT INTO TIPO_ANIMAL (NOME) VALUES ('SUÍNO');
INSERT INTO TIPO_ANIMAL (NOME) VALUES ('CAPRINO');
INSERT INTO TIPO_ANIMAL (NOME) VALUES ('EQUINO');


INSERT INTO ANIMAL (NOME, ID_TIPO_ANIMAL, DT_NASCIMENTO, COR, PESO, ALTURA) 
VALUES ('Rex', 1, '2018-05-01', 'Marrom', 25.5, 0.8); 
INSERT INTO ANIMAL (NOME, ID_TIPO_ANIMAL, DT_NASCIMENTO, COR, PESO, ALTURA) 
VALUES ('Miau', 2, '2019-08-15', 'Preto', 4.2, 0.4); 


INSERT INTO VACINA (NOME, DATA_APLICACAO, ID_ANIMAL) 
VALUES ('Vacina Antirrábica', '2023-06-15', 1); 
INSERT INTO VACINA (NOME, DATA_APLICACAO, ID_ANIMAL) 
VALUES ('Vacina V8', '2023-07-20', 1); 

INSERT INTO VACINA (NOME, DATA_APLICACAO, ID_ANIMAL) 
VALUES ('Vacina Felina', '2023-09-05', 2);

