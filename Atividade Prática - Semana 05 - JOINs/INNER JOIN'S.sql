/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Douglas Leonel de Almeida
DATA: 09/03/2023 
*/

/*
1 - Combinação de dados de diferentes fontes sobre megalodontes:
*/

SELECT *
FROM megalodonte_museus
INNER JOIN megalodonte_bibliotecas
ON megalodonte_museus.especie = megalodonte_bibliotecas.especie
INNER JOIN megalodonte_universidades
ON megalodonte_bibliotecas.especie = megalodonte_universidades.especie

/*
Essa consulta combina dados de três tabelas diferentes (museus, bibliotecas e universidades) sobre espécimes de megalodonte com base na espécie de cada espécime.
*/

/*
2 - Comparação de dados de diferentes espécimes de megalodontes:
*/

SELECT *
FROM megalodonte_especimes
INNER JOIN megalodonte_caracteristicas
ON megalodonte_especimes.especie = megalodonte_caracteristicas.especie

/*
Essa consulta combina dados de duas tabelas diferentes (especimes e características) sobre diferentes espécimes de megalodonte com base na espécie de cada espécime, permitindo uma comparação das características de cada espécime.
*/

/*
3 - Análise de dados sobre a alimentação de megalodontes:
*/

SELECT megalodonte_fosseis.id, megalodonte_fosseis.localizacao, megalodonte_presas.tipo
FROM megalodonte_fosseis
INNER JOIN megalodonte_presas
ON megalodonte_fosseis.especie = megalodonte_presas.especie

/*
Essa consulta combina dados de duas tabelas diferentes (fosseis e presas) sobre espécimes de megalodonte com base na espécie de cada espécime. A consulta retorna o ID do fóssil, sua localização e o tipo de presa encontrado no fóssil, permitindo uma análise da dieta dos megalodontes.
*/
