/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Douglas Leonel de Almeida
DATA: 10/04/2023 
*/

-- Início da transação
BEGIN TRANSACTION;

-- Seleciona a quantidade atual do produto no estoque
SELECT quantidade FROM estoque WHERE produto = 'Dente de Tubarão Megalodonte';

-- Se a quantidade atual for maior do que zero, decrementa a quantidade em 1
UPDATE estoque SET quantidade = quantidade - 1 WHERE produto = 'Dente de Tubarão Megalodonte' AND quantidade > 0;

-- Se a quantidade atual for igual a zero, exibe uma mensagem de erro e reverte a transação
IF @@ROWCOUNT = 0
BEGIN
    PRINT 'Não há mais Dentes de Tubarões Megalodonte em estoque.';
    ROLLBACK TRANSACTION;
END

-- Se a quantidade foi atualizada com sucesso, confirma a transação
ELSE
BEGIN
    COMMIT TRANSACTION;
    PRINT 'Uma unidade de Dente de Tubarão Megalodonte foi vendida.';
END

/*
Explicação:
*/

Este exemplo simula uma venda de um produto fictício chamado "Dente de Tubarão Megalodonte". O código SQL inicia uma transação usando a instrução BEGIN TRANSACTION. Em seguida, a quantidade atual do produto no estoque é selecionada usando uma instrução SELECT.

Se a quantidade atual for maior do que zero, a quantidade é decrementada em 1 usando uma instrução UPDATE. Se a quantidade atual for igual a zero, uma mensagem de erro é exibida usando a instrução PRINT e a transação é revertida usando a instrução ROLLBACK TRANSACTION.

Se a quantidade foi atualizada com sucesso, a transação é confirmada usando a instrução COMMIT TRANSACTION e uma mensagem de sucesso é exibida usando a instrução PRINT.

O uso de recursos de controle de transação neste exemplo garante que a quantidade de estoque do produto nunca se torne negativa. Além disso, em caso de erro, a transação é revertida e o banco de dados é mantido consistente.
