-- Empresa Distribuidora
INSERT INTO EmpresaDistribuidora (nome) VALUES
('UniCine');

-- Cinemas
INSERT INTO Cinema (nome_fantasia, endereco, telefone, email, id_empresa) VALUES
('CineLuz', 'Rua das Estrelas, 100', '4832-1234', 'contato@cineluz.com', 1),
('CineVida', 'Av. Central, 456', '4833-5678', 'contato@cinevida.com', 1),
('CineEstação', 'Rua do Filme, 789', '4834-7890', 'info@cineestacao.com', 1);

-- Diretores
INSERT INTO Diretor (nome, nacionalidade, data_nascimento) VALUES
('Christopher Nolan', 'Britânico', '1970-07-30'),
('Greta Gerwig', 'Americana', '1983-08-04'),
('Steven Spielberg', 'Americano', '1946-12-18');

-- Mais Gêneros
INSERT INTO Genero_Filme (genero) VALUES
('Comédia'), ('Suspense'), ('Animação'), ('Ação'), ('Ficção Científica'), ('Drama');

-- Filmes
INSERT INTO Filme (titulo_original, id_genero, duracao, id_diretor, diretor_atuando) VALUES
('Interestelar', 2, 169, 1, FALSE),
('Barbie', 4, 114, 2, FALSE),
('Jurassic Park', 5, 127, 3, TRUE),
('Divertida Mente', 6, 95, NULL, FALSE),
('Oppenheimer', 2, 180, 1, TRUE),
('Lady Bird', 4, 94, 2, FALSE),
('E.T. - O Extraterrestre', 5, 115, 3, FALSE);


-- Atores
INSERT INTO Ator (nome, nacionalidade, data_nascimento) VALUES
('Matthew McConaughey', 'Americano', '1969-11-04'),
('Margot Robbie', 'Australiana', '1990-07-02'),
('Sam Neill', 'Neozelandês', '1947-09-14'),
('Amy Poehler', 'Americana', '1971-09-16'),
('Cillian Murphy', 'Irlandês', '1976-05-25'),
('Saoirse Ronan', 'Irlandesa', '1994-04-12'),
('Henry Thomas', 'Americano', '1971-09-09');

-- Associação Filme ↔ Ator
INSERT INTO Filme_Ator (id_filme, id_ator)
VALUES
(1, 1),  -- Interestelar ↔ Matthew
(2, 2),  -- Barbie ↔ Margot
(3, 3),  -- Jurassic Park ↔ Sam Neill
(4, 4),  -- Divertida Mente ↔ Amy Poehler
(1, 2),  -- Intererstelar ↔ Margot
(2, 5),  -- Barbie ↔ Cillian
(3, 3);  -- Jurassic Park ↔ Sam Neill

-- Sessões
INSERT INTO Sessao (id_cinema, id_filme, horario_inicio) VALUES
(1, 1, '20:30:00'),
(2, 2, '18:00:00'),
(3, 3, '19:30:00'),
(1, 4, '16:00:00'),
(2, 5, '21:00:00'),
(3, 6, '17:15:00'),
(1, 7, '15:00:00');

-- Clientes
INSERT INTO Cliente (nome, email, cpf, telefone, data_nascimento, estudante) VALUES
('Ana Souza', 'ana@email.com', 12345678901, 48991234567, '2000-05-14', TRUE),
('Carlos Lima', 'carlos@email.com', 23456789012, 48991234568, '1988-11-22', FALSE),
('Beatriz Nunes', 'bia@email.com', 34567890123, 48991234569, '2005-01-10', TRUE),
('João Pedro', 'joao@email.com', 45678901234, 48999999999, '1995-08-09', TRUE),
('Mariana Silva', 'mariana@email.com', 56789012345, 48998887777, '1985-06-22', FALSE);

-- Ingressos
INSERT INTO Ingresso (id, id_cliente, id_sessao, valor_total, valor_desconto, data_compra, assento) VALUES
(1, 1, 1, 30.00, 15.00, NOW(), 'B12'),
(2, 2, 2, 35.00, 0.00, NOW(), 'C10'),
(3, 3, 3, 32.00, 16.00, NOW(), 'A03'),
(4, 4, 4, 40.00, 20.00, NOW(), 'D09'),
(5, 5, 5, 33.00, 0.00, NOW(), 'E01');
