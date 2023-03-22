/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Douglas Leonel de Almeida
DATA: 21/03/2023 
*/

-- Loop em uma linguagem de programação ou um procedimento armazenado banco de dados para gerar os 100 registros.
 
DELIMITER //
CREATE PROCEDURE InsertMegalodonRecords()
BEGIN
  DECLARE counter INT DEFAULT 1;
  WHILE counter <= 100 DO
    INSERT INTO Megalodon (nome, tamanho, peso, cor, localizacao, era, imagem)
    VALUES (CONCAT('Megalodon ', counter), 1600, 7500, 'Cinza', 'Oceano Atlântico', 'Mioceno', NULL);
    SET counter = counter + 1;
  END WHILE;
END //
DELIMITER ;

-- Exemplo de tabelas que serão criadas.

CALL InsertMegalodonRecords();
INSERT INTO Megalodon (nome, tamanho, peso, cor, localizacao, era, imagem)
VALUES
('Megalodon 1', 1600, 7500, 'Cinza', 'Oceano Atlântico', 'Mioceno', NULL),
('Megalodon 2', 1500, 7200, 'Branco', 'Oceano Pacífico', 'Plioceno', NULL),
('Megalodon 3', 1400, 6900, 'Preto', 'Oceano Índico', 'Mioceno', NULL),
...

/*
1 - Operadores de comparação:
*/

-- Consulta todos os registros da tabela Megalodon com tamanho maior ou igual a 1500
SELECT * FROM Megalodon WHERE tamanho >= 1500;

-- Consulta todos os registros da tabela Fósseis com idade estimada menor que 10 mil anos
SELECT * FROM Fosseis WHERE idade_estimada < 10000;

/*
2 - Combinando diferentes operadores lógicos:
*/

-- Consulta todos os registros da tabela Megalodon que são da era Mioceno e têm tamanho maior ou igual a 1400
SELECT * FROM Megalodon WHERE era = 'Mioceno' AND tamanho >= 1400;

-- Consulta todos os registros da tabela Presas que têm comprimento maior que 200 e material igual a 'dente'
SELECT * FROM Presas WHERE comprimento > 200 AND material = 'dente';

/*
3 - Operadores de intervalo:
*/

-- Consulta todos os registros da tabela Fósseis com idade estimada entre 5 e 10 mil anos
SELECT * FROM Fosseis WHERE idade_estimada BETWEEN 5000 AND 10000;

-- Consulta todos os registros da tabela Presas com comprimento maior que 150 e menor que 200
SELECT * FROM Presas WHERE comprimento > 150 AND comprimento < 200;

/*
4 - Operadores de padrão:
*/

-- Consulta todos os registros da tabela Megalodon que têm a palavra 'Pacífico' no campo localização
SELECT * FROM Megalodon WHERE localizacao LIKE '%Pacífico%';

-- Consulta todos os registros da tabela Fósseis que têm a palavra 'dente' no campo tipo_fossil
SELECT * FROM Fosseis WHERE tipo_fossil LIKE '%dente%';

/*
5 - Operadores de agregação:
*/

-- COUNT: conta o número de linhas em uma tabela ou o número de valores não nulos em uma coluna.
-- Conta o número de registros na tabela Megalodon
SELECT COUNT(*) FROM Megalodon;

-- Conta o número de registros na tabela Fósseis com idade estimada maior que 5000
SELECT COUNT(*) FROM Fosseis WHERE idade_estimada > 5000;

-- SUM: calcula a soma dos valores em uma coluna.
-- Soma o tamanho de todos os Megalodons na tabela
SELECT SUM(tamanho) FROM Megalodon;

-- Soma o comprimento de todas as Presas na tabela
SELECT SUM(comprimento) FROM Presas;

-- AVG: calcula a média dos valores em uma coluna.
-- Calcula a média do peso dos Megalodons na tabela
SELECT AVG(peso) FROM Megalodon;

-- Calcula a média da idade estimada dos Fósseis na tabela
SELECT AVG(idade_estimada) FROM Fosseis;

-- MAX: encontra o valor máximo em uma coluna.
-- Encontra o Megalodon com o tamanho máximo na tabela
SELECT MAX(tamanho) FROM Megalodon;

-- Encontra a Presa com o comprimento máximo na tabela
SELECT MAX(comprimento) FROM Presas;
