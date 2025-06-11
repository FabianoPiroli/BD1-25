-- Populando a tabela cargo
INSERT INTO especializacao (nome) VALUES
('Cirurgião'),
('Clínico Geral'),
('Pediatra'),
('Cardiologista'),
('Dermatologista'),
('Ortopedista'),
('Neurologista'),
('Gastroenterologista'),
('Pediatra'),
('Cirurgião Plástico'),
('Endocrinologista');


-- Populando a tabela medico
INSERT INTO medico (nome, crm, data_entrada, data_saida, taxa_sucesso, id_especializacao) VALUES
('Dr. João Silva', 123456789, '2020-01-15 08:00:00', NULL, 95.5, 1), 
('Dra. Ana Souza', 987654321, '2018-06-10 09:30:00', NULL, 98.0, 2), 
('Dr. Ricardo Mendes', 112233445, '2015-03-20 08:00:00', NULL, 97.2, 3),
('Dra. Fernanda Oliveira', 223344556, '2017-07-15 09:30:00', NULL, 96.5, 4),
('Dr. Gustavo Pereira', 334455667, '2019-11-10 10:00:00', NULL, 94.8, 5),
('Dra. Camila Andrade', 445566778, '2016-05-25 08:45:00', NULL, 98.1, 6),
('Dr. Eduardo Lima', 556677889, '2018-09-12 11:15:00', NULL, 95.7, 7), 
('Dra. Juliana Costa', 667788990, '2020-02-28 07:50:00', NULL, 99.0, 8);



-- Populando a tabela experiencia
INSERT INTO experiencia (id_especializacao, data_entrada, data_saida) VALUES
(1, '2020-01-15', NULL),
(3, '2018-06-10', NULL),
(5, '2019-11-10', NULL), 
(4, '2016-05-25', NULL), 
(6, '2018-09-12', NULL),
(3, '2020-02-28', NULL), 
(7, '2014-06-05', NULL), 
(8, '2021-01-18', NULL),
(1, '2020-01-15', NULL),
(2, '2018-06-10', NULL);


-- Populando a tabela diagnostico
INSERT INTO diagnostico (enfermidade) VALUES
('Gripe'),
('Fratura óssea'),
('Hipertensão'),
('Diabetes Tipo 2'),
('Hipotireoidismo'),
('Asma'),
('Doença de Alzheimer'),
('Insuficiência Cardíaca'),
('Depressão'),
('Anemia'),
('Gastrite'),
('Hepatite B'),
('Doença Renal Crônica'),
('Artrite Reumatoide'),
('Bronquite Crônica'),
('Dermatite Atópica'),
('Enxaqueca'),
('Osteoporose');


-- Populando a tabela consulta
INSERT INTO consulta (data, id_medico, id_diagnostico) VALUES
('2023-04-05 14:30:00', 1, 1),
('2023-04-07 10:00:00', 2, 2),
('2023-06-01 09:00:00', 1, 3), 
('2023-06-02 11:30:00', 2, 5),
('2023-06-03 14:45:00', 1, 7), 
('2023-06-04 16:20:00', 2, 10), 
('2023-06-05 08:10:00', 1, 13), 
('2023-06-06 10:40:00', 2, 15), 
('2023-06-07 12:00:00', 1, 2),
('2023-06-08 15:30:00', 2, 8), 
('2023-06-09 17:10:00', 1, 4), 
('2023-06-10 09:50:00', 2, 6);


-- Populando a tabela tipo_exame
INSERT INTO tipo_exame (tipo) VALUES
('Raio-X'),
('Exame de sangue'),
('Ultrassom'),
('Eletrocardiograma'),
('Ressonância Magnética'),
('Tomografia Computadorizada'),
('Teste de Esforço'),
('Endoscopia'),
('Ecocardiograma'),
('Hemograma Completo'),
('Exame de Urina'),
('Teste de Glicemia'),
('Colonoscopia'),
('Teste de Alergia');


-- Populando a tabela exame
INSERT INTO exame (id_tipo_exame, data) VALUES
(1, '2023-04-05 15:00:00'),
(2, '2023-04-07 11:00:00'),
(3, '2023-05-10 08:30:00'), 
(4, '2023-05-11 10:15:00'), 
(5, '2023-05-12 14:00:00'),
(6, '2023-05-13 16:45:00'), 
(7, '2023-05-14 09:30:00'), 
(8, '2023-05-15 11:20:00'),
(9, '2023-05-16 13:50:00'), 
(10, '2023-05-17 15:10:00'), 
(11, '2023-05-18 17:30:00'), 
(12, '2023-05-19 08:00:00'); 


-- Populando a tabela estado_civil
INSERT INTO estado_civil (estado) VALUES
('Solteiro(a)'),
('Casado(a)'),
('Divorciado(a)'),
('Separado(a)'),
('Viúvo(a)'),
('União-Estável');

-- Populando a tabela sexo
INSERT INTO sexo (sexo) VALUES
('M'),
('F');

-- Populando a tabela endereco
INSERT INTO endereco (logradouro, numero, bairro, cidade, estado) VALUES
('Rua das Flores', 123, 'Centro', 'São Paulo', 'SP'),
('Av. Brasil', 456, 'Zona Sul', 'Rio de Janeiro', 'RJ'),
('Av. Paulista', 1000, 'Bela Vista', 'São Paulo', 'SP'),
('Rua XV de Novembro', 500, 'Centro', 'Curitiba', 'PR'),
('Av. Atlântica', 250, 'Copacabana', 'Rio de Janeiro', 'RJ'),
('Rua das Palmeiras', 87, 'Jardins', 'São Paulo', 'SP'),
('Av. Independência', 120, 'Boa Vista', 'Porto Alegre', 'RS'),
('Rua João Pessoa', 75, 'Centro', 'Recife', 'PE'),
('Av. Tancredo Neves', 430, 'Caminho das Árvores', 'Salvador', 'BA'),
('Rua Dom Pedro II', 300, 'Centro', 'Brasília', 'DF');


-- Populando a tabela tipo_sanguineo
INSERT INTO tipo_sanguineo (tipo) VALUES
('O+'),
('O-'),
('A+'),
('A-'),
('B+'),
('B-'),
('AB+'),
('AB-');


-- Populando a tabela convenio
INSERT INTO convenio (nome, cobertura) VALUES
('Plano Saúde Premium', 'Cobertura completa'),
('Saúde Básico', 'Consultas e exames');

-- Populando a tabela ficha
INSERT INTO ficha (nome, data_nascimento, id_tipo_sanguineo, id_sexo, id_convenio, id_exame, id_consulta, id_estado_civil, id_endereco, rg, cpf, telefone) VALUES
('Carlos Oliveira', '1990-07-20', 1, 1, 1, 1, 1, 2, 1, 1234567, 98765432100, 11987654321),
('Mariana Santos', '1985-09-15', 2, 2, 2, 2, 2, 1, 2, 7654321, 11223344556, 21987654321),
('Pedro Almeida', '1992-02-11', 3, 1, 1, 1, 2, 1, 3, 3456789, 33445566778, 11965432178),
('Laura Ferreira', '1988-08-30', 4, 2, 2, 2, 1, 2, 4, 8765432, 22334455667, 21976543219),
('Fernando Costa', '1995-06-18', 5, 1, 1, 1, 2, 1, 5, 2345678, 44556677889, 11987651234),
('Camila Ramos', '1993-11-22', 6, 2, 2, 2, 1, 2, 6, 9876543, 55667788990, 21998765432),
('Lucas Martins', '1980-12-05', 7, 1, 1, 1, 2, 1, 7, 8765432, 66778899011, 11976543210),
('Beatriz Lima', '1997-04-14', 8, 2, 2, 2, 1, 2, 8, 5432167, 77889900122, 21976543211);