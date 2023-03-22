/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Douglas Leonel de Almeida
DATA: 21/03/2023 
*/

-- Código SQL para gerar os 100 registros

DO $$
DECLARE
  i INTEGER := 1;
BEGIN
  WHILE i <= 100 LOOP
    INSERT INTO Megalodon_Pesquisador (megalodon_id, pesquisador_id)
    VALUES (1 + floor(random() * 100)::integer, 1 + floor(random() * 100)::integer);
    i := i + 1;
  END LOOP;
END $$;

-- O Código acima realiza as seguintes definições:

/*
1. Declara uma variável inteira chamada "i" e atribui o valor 1 a ela.
2. Inicia um loop WHILE que continuará até que "i" seja maior que 100.
3. Dentro do loop, insere um registro na tabela Megalodon_Pesquisador com os seguintes valores:
   - megalodon_id: um número inteiro aleatório entre 1 e 100 (inclusive).
   - pesquisador_id: um número inteiro aleatório entre 1 e 100 (inclusive).
4. Incrementa o valor de "i" em 1 a cada iteração do loop.
5. O loop termina quando "i" é maior que 100, e o bloco de código é finalizado.
*/

/*
1. Operadores de comparação (2 consultas):
*/

-- 1.1 Selecionar megalodons com tamanho maior que 15 metros:
SELECT * FROM Megalodon WHERE tamanho > 15;

-- 1.2 Selecionar pesquisadores com idade menor ou igual a 40 anos:
SELECT * FROM Pesquisadores WHERE idade <= 40;

/*
2. Combinando diferentes operadores lógicos (2 consultas):
*/

-- 2.1 Selecionar megalodons com tamanho entre 10 e 20 metros e encontrados após o ano 2000:
SELECT * FROM Megalodon WHERE tamanho BETWEEN 10 AND 20 AND ano_encontrado > 2000;

-- 2.2 Selecionar pesquisadores com idade maior que 30 anos e trabalhando em instituições brasileiras ou americanas:
SELECT * FROM Pesquisadores WHERE idade > 30 AND (pais = 'Brasil' OR pais = 'Estados Unidos');

/*
3. Operadores de intervalo (2 consultas):
*/

-- 3.1 Selecionar megalodons encontrados entre 1990 e 2010:
SELECT * FROM Megalodon WHERE ano_encontrado BETWEEN 1990 AND 2010;

-- 3.2 Selecionar pesquisadores com idade entre 25 e 50 anos:
SELECT * FROM Pesquisadores WHERE idade BETWEEN 25 AND 50;

/*
4. Operadores de padrão (2 consultas):
*/

-- 4.1 Selecionar megalodons cujo local de descoberta começa com 'Oceano':
SELECT * FROM Megalodon WHERE localizacao LIKE 'Oceano%';

-- 4.2 Selecionar pesquisadores cujos nomes terminam com 'Silva':
SELECT * FROM Pesquisadores WHERE nome LIKE '%Silva';

/*
5. Operadores de agregação (2 consultas):
*/

-- 5.1 Encontrar a média de tamanho dos megalodons:
SELECT AVG(tamanho) as media_tamanho FROM Megalodon;

-- 5.2 Contar o número de pesquisadores por país:
SELECT pais, COUNT(*) as numero_pesquisadores FROM Pesquisadores GROUP BY pais;
