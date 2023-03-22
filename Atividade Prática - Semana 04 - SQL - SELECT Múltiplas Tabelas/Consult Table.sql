/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Douglas Leonel de Almeida
DATA: 22/03/2023 
*/

-- A consulta SQL abaixo relaciona as duas tabelas, Megalodon e Pesquisadores, utilizando SELECT e WHERE:


SELECT M.nome AS Megalodon_Nome, P.nome AS Pesquisador_Nome, P.instituicao, P.area_pesquisa
FROM Megalodon M, Pesquisadores P
WHERE M.localizacao = P.area_pesquisa;

-- Esta consulta retorna o nome do Megalodon, o nome do pesquisador, a instituição e a área de pesquisa em que a localização do Megalodon corresponde à área.
