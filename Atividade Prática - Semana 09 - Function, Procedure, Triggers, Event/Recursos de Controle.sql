/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Douglas Leonel de Almeida
DATA: 17/04/2023 
*/

-- Para aplicar recursos de controle de acesso e permissão em um banco de dados, devemos definir as permissões de acesso para cada objeto do banco de dados. Nesse caso, iremos definir permissões para 6 objetos: uma função, uma procedure, um trigger e dois eventos.

-- A seguir, segue um exemplo de como podemos definir permissões de acesso para um usuário "usuario1" e um usuário "usuario2" no banco de dados com as tabelas e campos já definidos anteriormente:

-- Criação do usuário usuario1
CREATE USER 'usuario1'@'localhost' IDENTIFIED BY 'senha';

-- Concessão de privilégios de leitura e escrita para o usuário usuario1 na tabela Megalodon
GRANT SELECT, INSERT, UPDATE, DELETE ON Megalodon TO 'usuario1'@'localhost';

-- Concessão de privilégios de leitura e escrita para o usuário usuario1 na tabela Fosseis
GRANT SELECT, INSERT, UPDATE, DELETE ON Fosseis TO 'usuario1'@'localhost';

-- Concessão de privilégios de leitura e escrita para o usuário usuario1 na tabela Presas
GRANT SELECT, INSERT, UPDATE, DELETE ON Presas TO 'usuario1'@'localhost';

-- Concessão de privilégios de leitura e escrita para o usuário usuario1 na tabela Alimentacao
GRANT SELECT, INSERT, UPDATE, DELETE ON Alimentacao TO 'usuario1'@'localhost';

-- Criação do usuário usuario2
CREATE USER 'usuario2'@'localhost' IDENTIFIED BY 'senha';

-- Concessão de privilégios de leitura e escrita para o usuário usuario2 na tabela Megalodon
GRANT SELECT, INSERT, UPDATE, DELETE ON Megalodon TO 'usuario2'@'localhost';

-- Concessão de privilégios de leitura e escrita para o usuário usuario2 na tabela Fosseis
GRANT SELECT, INSERT, UPDATE, DELETE ON Fosseis TO 'usuario2'@'localhost';

-- Concessão de privilégios de leitura e escrita para o usuário usuario2 na tabela Presas
GRANT SELECT, INSERT, UPDATE, DELETE ON Presas TO 'usuario2'@'localhost';

-- Concessão de privilégios de leitura e escrita para o usuário usuario2 na tabela Alimentacao
GRANT SELECT, INSERT, UPDATE, DELETE ON Alimentacao TO 'usuario2'@'localhost';

-- Concessão de privilégios de execução para a procedure ObterFosseis, a função ObterAlimentacao e o trigger AtualizarPeso
GRANT EXECUTE ON PROCEDURE ObterFosseis TO 'usuario1'@'localhost';
GRANT EXECUTE ON FUNCTION ObterAlimentacao TO 'usuario1'@'localhost';
GRANT TRIGGER ON Megalodon AFTER UPDATE TO 'usuario1'@'localhost';

-- Observe que as permissões de acesso são definidas com base nos privilégios que os usuários têm nas tabelas e objetos do banco de dados. Além disso, é possível conceder privilégios de execução para procedures, functions e triggers, permitindo que usuários executem esses objetos dentro do banco de dados.