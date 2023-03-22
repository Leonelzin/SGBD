/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Douglas Leonel de Almeida
DATA: 21/03/2023 
*/

-- Código SQL para gerar os 100 registros

INSERT INTO Alimentacao (tipo_presa, localizacao_caça, frequencia_alimentacao, imagem, megalodon_id)
SELECT 
  CONCAT('Presa ',FLOOR(RAND() * 10) + 1),
  CONCAT('Localização ',FLOOR(RAND() * 10) + 1),
  FLOOR(RAND() * 10) + 1,
  'imagem_dummy',
  FLOOR(RAND() * 100) + 1
FROM
  (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 
   UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
  (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 
   UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t2,
  (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 
   UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t3
LIMIT 100;

/*
Este comando SQL insere dados em uma tabela chamada "Alimentacao". A tabela tem cinco colunas: "tipo_presa", "localizacao_caça", "frequencia_alimentacao", "imagem" e "megalodon_id".

A instrução INSERT INTO é usada para inserir dados na tabela. A cláusula SELECT é usada para selecionar os valores que serão inseridos nas colunas.

O comando RAND() é usado para gerar valores aleatórios.

As três subconsultas SELECT dentro dos parênteses são usadas para gerar uma tabela temporária com valores de 1 a 10. Essas tabelas são combinadas usando a cláusula UNION para criar uma tabela temporária com 1000 linhas (10 x 10 x 10).

A função CONCAT() é usada para concatenar o texto 'Presa ' com um número aleatório entre 1 e 10 para gerar valores aleatórios para a coluna "tipo_presa". O mesmo é feito para a coluna "localizacao_caça".

A coluna "frequencia_alimentacao" recebe um número inteiro aleatório entre 1 e 10.

A coluna "imagem" recebe a string 'imagem_dummy' para todos os registros.

A coluna "megalodon_id" recebe um número aleatório entre 1 e 100.

O comando LIMIT 100 é usado para limitar o número de linhas inseridas na tabela a 100.
*/

/*
1 - Consulta usando o operador de igualdade:
*/

SELECT * FROM Alimentacao WHERE tipo_presa = 'Peixe';

/*
2 - Consulta usando o operador "menor que":
*/

SELECT * FROM Alimentacao WHERE frequencia_alimentacao < 10;

/*
3 - Consulta usando o operador "maior que":
*/

SELECT * FROM Alimentacao WHERE frequencia_alimentacao > 50;

/*
4 - Consulta combinando os operadores "menor que" e "maior que":
*/

SELECT * FROM Alimentacao WHERE frequencia_alimentacao < 20 AND frequencia_alimentacao > 10;

/*
5 - Consulta combinando os operadores "menor que" e "ou":
*/

SELECT * FROM Alimentacao WHERE frequencia_alimentacao < 5 OR frequencia_alimentacao > 50;

/*
6 - Consulta usando o operador "entre":
*/

SELECT * FROM Alimentacao WHERE frequencia_alimentacao BETWEEN 20 AND 30;

/*
7 - Consulta usando o operador "não entre":
*/

SELECT * FROM Alimentacao WHERE frequencia_alimentacao NOT BETWEEN 20 AND 30;

/*
8 - Consulta usando o operador "LIKE":
*/

SELECT * FROM Alimentacao WHERE localizacao_caça LIKE '%Atlântico%';

/*
9 - Consulta usando o operador "NOT LIKE":
*/

SELECT * FROM Alimentacao WHERE localizacao_caça NOT LIKE '%Índico%';

/*
10 - Consulta usando o operador "COUNT":
*/

SELECT megalodon_id, COUNT(*) AS total_alimentacao FROM Alimentacao GROUP BY megalodon

/*
11 - Consultas com operadores de comparação:
a) Selecionar as presas cuja frequência de alimentação é maior que 5:
*/

SELECT tipo_presa, localizacao_caça, frequencia_alimentacao
FROM Alimentacao
WHERE frequencia_alimentacao > 5;

/*
b) Selecionar as presas cuja localização de caça é "Oceano Atlântico":
*/

SELECT tipo_presa, localizacao_caça, frequencia_alimentacao
FROM Alimentacao
WHERE localizacao_caça = 'Oceano Atlântico';

/*
12 - Consultas combinando diferentes operadores lógicos:
a) Selecionar as presas que são caçadas com frequência maior que 2 no Oceano Pacífico, ou que são caçadas com frequência maior que 5 em qualquer outro local:
*/

SELECT tipo_presa, localizacao_caça, frequencia_alimentacao
FROM Alimentacao
WHERE (localizacao_caça = 'Oceano Pacífico' AND frequencia_alimentacao > 2)
    OR (localizacao_caça != 'Oceano Pacífico' AND frequencia_alimentacao > 5);

/*
b) Selecionar as presas que não são caçadas com frequência menor que 3 no Oceano Índico, e que são caçadas com frequência maior que 1 em qualquer outro local:
*/

SELECT tipo_presa, localizacao_caça, frequencia_alimentacao
FROM Alimentacao
WHERE NOT (localizacao_caça = 'Oceano Índico' AND frequencia_alimentacao < 3)
    AND frequencia_alimentacao > 1;
