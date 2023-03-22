/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Douglas Leonel de Almeida
DATA: 21/03/2023 
*/

-- Código SQL para gerar os 100 registros

INSERT INTO Presas (comprimento, diametro, peso, material, local_descoberta, imagem, megalodon_id)
SELECT 
    FLOOR(RAND() * 1000) + 1, -- comprimento entre 1 e 1000
    FLOOR(RAND() * 100) + 1, -- diâmetro entre 1 e 100
    ROUND(RAND() * 100, 2), -- peso entre 0 e 100 com duas casas decimais
    CONCAT('Material', FLOOR(RAND() * 10) + 1), -- material com nome aleatório
    CONCAT('Local', FLOOR(RAND() * 20) + 1), -- local de descoberta com nome aleatório
    NULL, -- imagem vazia
    FLOOR(RAND() * 10) + 1 -- id do megalodon entre 1 e 10
FROM 
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) a
    CROSS JOIN 
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) b
LIMIT 100;

/*
Nessa consulta, utilizamos a função RAND() para gerar valores aleatórios para cada coluna da tabela. Usamos a função FLOOR() para arredondar para baixo os valores gerados para as colunas "comprimento" e "diametro". Usamos a função ROUND() para arredondar os valores gerados para a coluna "peso". Concatenamos strings aleatórias para as colunas "material" e "local_descoberta".

Para gerar 100 registros, utilizamos uma tabela derivada com 10 linhas (representada pelas subconsultas com a palavra-chave UNION) e fazemos um "CROSS JOIN" dela mesma para obter 100 combinações possíveis. Em seguida, limitamos a consulta a 100 linhas com a palavra-chave "LIMIT".

Cada registro gerado terá um valor aleatório para as colunas "comprimento", "diametro", "peso", "material", "local_descoberta" e "megalodon_id". A coluna "imagem" será vazia (NULL) em todos os registros gerados. A coluna "id" será preenchida automaticamente com valores sequenciais a partir de 1, por causa da definição "AUTO_INCREMENT" na sua declaração.
*/

/*
1. Operadores de comparação (2 exemplos):
*/

-- Exemplo 1:
SELECT * FROM Presas WHERE comprimento > 100;

-- Exemplo 2:
SELECT * FROM Megalodon WHERE id = 10;

/*
2. Combinando diferentes operadores lógicos (2 exemplos):
*/

-- Exemplo 1:
SELECT * FROM Presas WHERE comprimento > 100 AND peso < 500;

-- Exemplo 2:
SELECT * FROM Presas WHERE (comprimento > 100 OR diametro > 20) AND material = 'Fossilizado';

/*
3. Operadores de intervalo (2 exemplos):
*/


-- Exemplo 1:
SELECT * FROM Presas WHERE comprimento BETWEEN 50 AND 150;

-- Exemplo 2:
SELECT * FROM Presas WHERE local_descoberta IN ('Brasil', 'Argentina', 'Chile');

/*
4. Operadores de padrão (2 exemplos):
*/

-- Exemplo 1:
SELECT * FROM Presas WHERE material LIKE '%ossil%';

-- Exemplo 2:
SELECT * FROM Presas WHERE local_descoberta NOT LIKE 'Brasil%';

/*
5. Operadores de agregação (4 exemplos):
*/

-- Exemplo 1:
SELECT COUNT(*) FROM Presas;

-- Exemplo 2:
SELECT megalodon_id, AVG(peso) as media_peso FROM Presas GROUP BY megalodon_id;

-- Exemplo 3:
SELECT megalodon_id, SUM(peso) as peso_total FROM Presas GROUP BY megalodon_id HAVING peso_total > 1000;

-- Exemplo 4:
SELECT Megalodon.id, COUNT(Presas.id) as num_presas FROM Megalodon
JOIN Presas ON Megalodon.id = Presas.megalodon_id
GROUP BY Megalodon.id;
