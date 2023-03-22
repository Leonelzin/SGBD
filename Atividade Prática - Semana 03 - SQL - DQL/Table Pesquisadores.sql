/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Douglas Leonel de Almeida
DATA: 21/03/2023 
*/

-- Código SQL (python) para gerar os 100 registros

import mysql.connector
from faker import Faker

-- Crie uma instância do gerador de dados Faker
fake = Faker()

-- Conecte-se ao banco de dados usando suas credenciais e informações do banco de dados
db = mysql.connector.connect(
    host="localhost",
    user="your_username",
    password="your_password",
    database="your_database"
)

-- Crie um cursor para executar consultas SQL
cursor = db.cursor()

-- Insira 100 registros na tabela Pesquisadores usando um loop
for _ in range(100):
    nome = fake.name()
    instituicao = fake.company()
    area_pesquisa = fake.job()
    imagem = fake.binary(length=1024)

    -- Crie a consulta SQL para inserir os dados gerados na tabela
    query = "INSERT INTO Pesquisadores (nome, instituicao, area_pesquisa, imagem) VALUES (%s, %s, %s, %s)"
    values = (nome, instituicao, area_pesquisa, imagem)

    -- Execute a consulta usando o cursor
    cursor.execute(query, values)

-- Faça commit das mudanças realizadas no banco de dados
db.commit()
-- Feche a conexão com o banco de dados
db.close()

/*
1. Operadores de comparação (2 consultas):
*/

-- 1.1 
SELECT * FROM Pesquisadores WHERE id = 5;

-- 1.2
SELECT * FROM Pesquisadores WHERE area_pesquisa <> 'Paleontologia';

/*
2. Combinando diferentes operadores lógicos (2 consultas):
*/

-- 2.1 
SELECT * FROM Pesquisadores WHERE instituicao = 'Universidade X' AND area_pesquisa = 'Megalodon';

-- 2.2
SELECT * FROM Pesquisadores WHERE area_pesquisa = 'Megalodon' OR instituicao = 'Universidade Y';

/*
3. Operadores de intervalo (2 consultas):
*/

-- 3.1
SELECT * FROM Pesquisadores WHERE id BETWEEN 1 AND 10;

-- 3.2
SELECT * FROM Pesquisadores WHERE area_pesquisa IN ('Megalodon', 'Paleontologia');

/*
4. Operadores de padrão (2 consultas):
*/

-- 4.1
SELECT * FROM Pesquisadores WHERE nome LIKE '%Silva%';

-- 4.2
SELECT * FROM Pesquisadores WHERE instituicao NOT LIKE 'Universidade%';

/*
5. Operadores de agregação (4 consultas):
*/

-- 5.1
SELECT COUNT(*) FROM Pesquisadores;

-- 5.2
SELECT instituicao, COUNT(*) FROM Pesquisadores GROUP BY instituicao;

-- 5.3
SELECT area_pesquisa, COUNT(*) FROM Pesquisadores WHERE area_pesquisa = 'Megalodon' GROUP BY area_pesquisa;

-- 5.4
SELECT instituicao, COUNT(*) AS qtd_pesquisadores FROM Pesquisadores GROUP BY instituicao HAVING qtd_pesquisadores > 5;
