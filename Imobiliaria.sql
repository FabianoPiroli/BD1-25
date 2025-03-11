CREATE DATABASE IMOBILIARIA;

USE IMOBILIARIA;

CREATE TABLE `IMOVEL` (
`ID` INT auto_increment PRIMARY KEY,
`PROPERTY_NAME` CHAR (30) NOT NULL,
`LOCAL_DESCRIPTION` CHAR (255) NOT NULL,
`ROOMS` INT NOT NULL,
`SALE_VALUE` FLOAT DEFAULT 0.00 NOT NULL
);

INSERT INTO IMOVEL (PROPERTY_NAME, LOCAL_DESCRIPTION, ROOMS, SALE_VALUE)
VALUES 
('Residencial Central', 'Apartamento moderno no centro da cidade', 3, 450000.00),
('Vila Tranquila', 'Casa espaçosa em bairro residencial calmo', 4, 750000.00),
('Condomínio Verde', 'Apartamento com vista para o parque', 2, 350000.00),
('Casa de Campo', 'Casa rústica em área rural', 5, 980000.00),
('Edifício Luxor', 'Cobertura de luxo com piscina', 4, 1500000.00),
('Residencial Familiar', 'Casa com quintal grande e jardim', 3, 630000.00),
('Apartamento Urbano', 'Apartamento compacto em localização central', 1, 280000.00),
('Casa Solar', 'Casa sustentável com energia solar', 4, 820000.00),
('Condomínio Azul', 'Apartamento à beira-mar', 2, 690000.00),
('Morada dos Pássaros', 'Chacara com ampla área verde', 3, 1200000.00);

SELECT * FROM IMOVEL;

SELECT PROPERTY_NAME, LOCAL_DESCRIPTION, ROOMS, SALE_VALUE
FROM IMOVEL
WHERE ROOMS > 3 AND SALE_VALUE > 100000;

SELECT PROPERTY_NAME, SALE_VALUE
FROM IMOVEL
ORDER BY SALE_VALUE DESC;








