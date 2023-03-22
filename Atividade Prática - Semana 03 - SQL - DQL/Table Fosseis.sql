/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Douglas Leonel de Almeida
DATA: 21/03/2023 
*/

-- Código SQL para gerar os 100 registros

INSERT INTO Fosseis (data_descoberta, local_descoberta, tipo_fossil, idade_estimada, imagem, megalodon_id)
VALUES
('2022-01-01', 'Local A', 'Dente', 10000000, 'imagem_blob_1', 1),
('2022-01-02', 'Local B', 'Dente', 9000000, 'imagem_blob_2', 1),
...

-- Será adicionado mais 98 registros aqui

/*
1. Operadores de comparação (2 exemplos):
*/

-- 1.1. Selecionar fósseis com idade estimada maior que 9000000
SELECT * FROM Fosseis WHERE idade_estimada > 9000000;

-- 1.2. Selecionar fósseis descobertos em 'Local A'
SELECT * FROM Fosseis WHERE local_descoberta = 'Local A';

/*
2. Combinando diferentes operadores lógicos (2 exemplos):
*/

-- 2.1. Selecionar fósseis descobertos em 'Local A' e com idade estimada maior que 9000000
SELECT * FROM Fosseis WHERE local_descoberta = 'Local A' AND idade_estimada > 9000000;

-- 2.2. Selecionar fósseis descobertos em 'Local A' ou com idade estimada maior que 9000000
SELECT * FROM Fosseis WHERE local_descoberta = 'Local A' OR idade_estimada > 9000000;

/*
3. Operadores de intervalo (2 exemplos):
*/

-- 3.1. Selecionar fósseis com idade estimada entre 8000000 e 10000000
SELECT * FROM Fosseis WHERE idade_estimada BETWEEN 8000000 AND 10000000;

-- 3.2. Selecionar fósseis descobertos entre '2022-01-01' e '2022-01-31'
SELECT * FROM Fosseis WHERE data_descoberta BETWEEN '2022-01-01' AND '2022-01-31';

/*
4. Operadores de padrão (2 exemplos):
*/

-- 4.1. Selecionar fósseis descobertos em locais que começam com 'Local'
SELECT * FROM Fosseis WHERE local_descoberta LIKE 'Local%';

-- 4.2. Selecionar fósseis do tipo 'Dente'
SELECT * FROM Fosseis WHERE tipo_fossil LIKE 'Dente';

/*
5. Operadores de agregação (4 exemplos):
*/

-- 5.1. Contar o número total de fósseis
SELECT COUNT(*) FROM Fosseis;

-- 5.2. Encontrar a idade média estimada dos fósseis
SELECT AVG(idade_estimada) FROM Fosseis;

-- 5.3. Encontrar a idade mínima e máxima estimada dos fósseis
SELECT MIN(idade_estimada), MAX(idade_estimada) FROM Fosseis;

-- 5.4. Agrupar fósseis por local de descoberta e contar o número de fósseis em cada local
SELECT local_descoberta, COUNT(*) FROM Fosseis GROUP BY local_descoberta;
