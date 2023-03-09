/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Douglas Leonel de Almeida
DATA: 09/03/2023 
*/

/*
OUTER JOIN:
*/

SELECT *
FROM presas_encontradas
FULL OUTER JOIN presas_nao_encontradas
ON presas_encontradas.tipo = presas_nao_encontradas.tipo;

/*
O OUTER JOIN é utilizado para obter todas as presas conhecidas, tanto as encontradas em fósseis quanto as não encontradas.
*/
