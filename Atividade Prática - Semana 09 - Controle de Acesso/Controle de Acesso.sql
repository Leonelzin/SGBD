/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Douglas Leonel de Almeida
DATA: 10/04/2023 
*/

-- Criando a view de relatório
CREATE VIEW relatorio_megalodonte AS
SELECT nome, tamanho, peso, cor, localizacao, era
FROM Megalodon;

-- Criando um usuário com acesso limitado que só pode visualizar dados na view de relatório
CREATE USER relatorio_usuario IDENTIFIED BY 'senha123';
GRANT SELECT ON relatorio_megalodonte TO relatorio_usuario;

-- Criando um usuário com permissão de leitura em todo banco de dados
CREATE USER leitura_usuario IDENTIFIED BY 'senha456';
GRANT SELECT ON Megalodon TO leitura_usuario;
GRANT SELECT ON Fosseis TO leitura_usuario;
GRANT SELECT ON Presas TO leitura_usuario;
GRANT SELECT ON Alimentacao TO leitura_usuario;
GRANT SELECT ON Pesquisadores TO leitura_usuario;

/*
Explicando o código SQL:
*/

Primeiro, criamos a view de relatório com o comando CREATE VIEW. A view seleciona os campos mais importantes da tabela Megalodon e os apresenta em uma nova tabela virtual chamada "relatorio_megalodonte".

Em seguida, criamos um usuário chamado "relatorio_usuario" com a senha "senha123" usando o comando CREATE USER.

A permissão GRANT SELECT é usada para conceder ao usuário "relatorio_usuario" o acesso somente leitura para a view de relatório "relatorio_megalodonte".

Depois, criamos um usuário chamado "leitura_usuario" com a senha "senha456" usando o comando CREATE USER.

A permissão GRANT SELECT é usada novamente para conceder ao usuário "leitura_usuario" permissão somente de leitura em todas as tabelas do banco de dados.
