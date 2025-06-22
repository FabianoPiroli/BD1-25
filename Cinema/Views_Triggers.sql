/*Views*/

-- Filmes em Cartaz
CREATE VIEW FILMES_EM_CARTAZ AS
SELECT
	f.id AS id_filme,
	f.titulo_original,
	g.genero,
	d.nome AS diretor,
	c.nome_fantasia AS cinema,
	s.horario_inicio
FROM Filme f
JOIN Genero_Filme g ON f.id_genero = g.id
JOIN Diretor d ON f.id_diretor = d.id
JOIN Sessao s ON f.id = s.id_filme
JOIN Cinema c ON s.id_cinema = c.id;

SELECT * FROM FILMES_EM_CARTAZ;

-- Detalhes do Filme
CREATE VIEW FilmesDetalhados AS
SELECT f.titulo_original, g.genero, d.nome AS diretor
FROM Filme f
JOIN Genero_Filme g ON f.id_genero = g.id
JOIN Diretor d ON f.id_diretor = d.id;

-- Sessões com lugares ocupados
CREATE VIEW OcupacaoPorSessao AS
SELECT f.titulo_original, s.horario_inicio, c.nome_fantasia, COUNT(i.id) AS lugares_ocupados
FROM Sessao s
JOIN Filme f ON s.id_filme = f.id
JOIN Cinema c ON s.id_cinema = c.id
LEFT JOIN Ingresso i ON i.id_sessao = s.id
GROUP BY s.id;

/*Triggers*/

-- Desconto para estudantes
DELIMITER //
CREATE TRIGGER aplicar_desconto_estudante
BEFORE INSERT ON Ingresso
FOR EACH ROW
BEGIN
  DECLARE v_estudante BOOL;

  -- Consulta se o cliente é estudante
  SELECT estudante INTO v_estudante
  FROM Cliente
  WHERE id = NEW.id_cliente;

  -- Armazena o valor total original
  SET NEW.valor_total = NEW.valor_desconto;

  -- Se for estudante, aplica o desconto
  IF v_estudante = TRUE THEN
    SET NEW.valor_desconto = NEW.valor_total * 0.5;
  END IF;
END;
//
DELIMITER ;

-- Registrar data da compra automaticamente
DELIMITER //
CREATE TRIGGER DataCompraAutomatica
BEFORE INSERT ON Ingresso
FOR EACH ROW
BEGIN
  SET NEW.data_compra = NOW();
END;
//
DELIMITER ;

/*Joins*/

-- Gêneros e Diretores
SELECT f.titulo_original, g.genero, d.nome AS diretor
FROM Filme f
JOIN Genero_Filme g ON f.id_genero = g.id
JOIN Diretor d ON f.id_diretor = d.id;

-- Atores que participaram em cada filme
SELECT f.titulo_original, a.nome AS ator
FROM Filme f
JOIN Filme_Ator fa ON f.id = fa.id_filme
JOIN Ator a ON fa.id_ator = a.id;

-- Sessões com o cinema e filme
SELECT c.nome_fantasia AS cinema, f.titulo_original AS filme, s.horario_inicio
FROM Sessao s
JOIN Cinema c ON s.id_cinema = c.id
JOIN Filme f ON s.id_filme = f.id;

-- Ingressos com dados do cliente e filme assistido
SELECT cli.nome AS cliente, f.titulo_original, i.valor_total, i.assento, i.data_compra
FROM Ingresso i
JOIN Cliente cli ON i.id_cliente = cli.id
JOIN Sessao s ON i.id_sessao = s.id
JOIN Filme f ON s.id_filme = f.id;