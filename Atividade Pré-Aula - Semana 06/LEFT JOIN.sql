/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Douglas Leonel de Almeida
DATA: 09/03/2023 
*/

/*
LEFT JOIN:
*/

SELECT *
FROM especimes_megalodonte
LEFT JOIN medicoes_megalodonte
ON especimes_megalodonte.id = medicoes_megalodonte.id_especime;

/*
O LEFT JOIN é utilizado para obter todos os espécimes da tabela de espécimes, independentemente de haver medições para eles na tabela de medições, e combinar as medições apenas para os espécimes que tiverem medições disponíveis.
*/
