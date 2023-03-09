/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Douglas Leonel de Almeida
DATA: 09/03/2023 
*/

/*
FULL JOIN:
*/

SELECT *
FROM especimes_megalodonte
FULL JOIN medicoes_megalodonte
ON especimes_megalodonte.id = medicoes_megalodonte.id_especime
FULL JOIN observacoes_megalodonte
ON especimes_megalodonte.id = observacoes_megalodonte.id_especime;

/*
O FULL JOIN é utilizado para obter todos os espécimes, independentemente de haver medições ou observações para eles, e combinar as medições e observações apenas para os espécimes que tiverem dados disponíveis em ambas as tabelas.
*/
