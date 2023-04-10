/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Douglas Leonel de Almeida
DATA: 10/04/2023 
*/

CREATE VIEW relatorio_megalodon AS
SELECT 
    Megalodon.nome AS Nome, 
    Megalodon.tamanho AS Tamanho, 
    Megalodon.peso AS Peso, 
    Megalodon.cor AS Cor, 
    Megalodon.localizacao AS Localizacao, 
    Megalodon.era AS Era, 
    Fosseis.data_descoberta AS Data_Descoberta, 
    Fosseis.local_descoberta AS Local_Descoberta, 
    Fosseis.tipo_fossil AS Tipo_Fossil, 
    Fosseis.idade_estimada AS Idade_Estimada, 
    Presas.comprimento AS Comprimento_Presa, 
    Presas.diametro AS Diametro_Presa, 
    Presas.peso AS Peso_Presa, 
    Presas.material AS Material_Presa, 
    Alimentacao.tipo_presa AS Tipo_Presa_Alimentacao, 
    Alimentacao.localizacao_caça AS Localizacao_Caca, 
    Alimentacao.frequencia_alimentacao AS Frequencia_Alimentacao, 
    Pesquisadores.nome AS Nome_Pesquisador, 
    Pesquisadores.instituicao AS Instituicao_Pesquisador, 
    Pesquisadores.area_pesquisa AS Area_Pesquisa_Pesquisador
FROM Megalodon 
LEFT JOIN Fosseis ON Megalodon.id = Fosseis.megalodon_id 
LEFT JOIN Presas ON Megalodon.id = Presas.megalodon_id 
LEFT JOIN Alimentacao ON Megalodon.id = Alimentacao.megalodon_id 
LEFT JOIN Pesquisadores ON Megalodon.id = Pesquisadores.id;

-- Essa view inclui informações sobre o megalodonte, fósseis, presas, alimentação e pesquisadores, juntando informações de todas as tabelas relevantes do banco de dados. A função LEFT JOIN é utilizada para combinar as tabelas, permitindo que todas as informações sobre o megalodonte sejam exibidas, mesmo que não existam registros em todas as tabelas relacionadas.

-- Para restringir o acesso à view, pode-se utilizar a função GRANT no MySQL, criando um usuário com as permissões necessárias e concedendo acesso somente à view criada. 

-- Por exemplo:

GRANT SELECT ON nome_do_banco_de_dados.relatorio_megalodon TO 'usuario_restrito'@'localhost';

-- Isso garante que o usuário 'usuario_restrito' só poderá visualizar a view relatorio_megalodon, sem ter acesso direto às tabelas do banco de dados