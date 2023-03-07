/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Douglas Leonel de Almeida
DATA: 07/03/2023 
*/

/*
Este bloco de código cria a tabela Megalodon, que armazenará informações sobre o megalodonte. A tabela tem um identificador único id como chave primária e sete outros campos - nome, tamanho, peso, cor, localizacao, era e imagem - que armazenam informações relevantes sobre o megalodonte. O campo id é definido como um AUTO_INCREMENT, o que significa que ele será incrementado automaticamente a cada nova linha inserida na tabela.
*/

CREATE TABLE Megalodon (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    tamanho INT NOT NULL,
    peso FLOAT NOT NULL,
    cor VARCHAR(50) NOT NULL,
    localizacao VARCHAR(100) NOT NULL,
    era VARCHAR(50) NOT NULL,
    imagem BLOB NOT NULL
);

/* 
Este bloco de código cria a tabela Fósseis, que armazena informações sobre os fósseis do megalodonte encontrados. As colunas incluem informações como data de descoberta, local de descoberta, tipo de fóssil, idade estimada, imagem do fóssil e o ID do megalodonte ao qual o fóssil pertence. A última linha adiciona uma restrição de chave estrangeira à coluna megalodon_id, referenciando a coluna ID da tabela Megalodon, e definindo a ação ON DELETE como CASCADE.
*/

CREATE TABLE Fosseis (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_descoberta DATE NOT NULL,
    local_descoberta VARCHAR(100) NOT NULL,
    tipo_fossil VARCHAR(50) NOT NULL,
    idade_estimada INT NOT NULL,
    imagem BLOB NOT NULL,
    megalodon_id INT NOT NULL,
    CONSTRAINT fk_fosseis_megalodon FOREIGN KEY (megalodon_id)
        REFERENCES Megalodon(id)
        ON DELETE CASCADE
);

/*
Este bloco de código cria a tabela Presas, que armazena informações sobre as presas do megalodonte encontradas. As colunas incluem informações como comprimento, diâmetro, peso, material, local de descoberta, imagem da presa e o ID do megalodonte ao qual a presa pertence. A última linha adiciona uma restrição de chave estrangeira à coluna megalodon_id, referenciando a coluna ID da tabela Megalodon, e definindo a ação ON DELETE como CASCADE.
*/

CREATE TABLE Presas (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    comprimento INT NOT NULL,
    diametro INT NOT NULL,
    peso FLOAT NOT NULL,
    material VARCHAR(50) NOT NULL,
    local_descoberta VARCHAR(100) NOT NULL,
    imagem BLOB NOT NULL,
    megalodon_id INT NOT NULL,
    CONSTRAINT fk_presas_megalodon FOREIGN KEY (megalodon_id)
        REFERENCES Megalodon(id)
        ON DELETE CASCADE
);

/*
Este bloco de código cria a tabela chamada "Alimentacao". A tabela possui 6 colunas: "id", "tipo_presa", "localizacao_caça", "frequencia_alimentacao", "imagem" e "megalodon_id". A coluna "id" é definida como chave primária e será auto-incrementada. A coluna "tipo_presa" e "localizacao_caça" são definidas como não nulas (NOT NULL), o que significa que um valor deve ser inserido nessas colunas para cada linha. A coluna "imagem" é definida como um objeto blob que armazena dados binários. A coluna "megalodon_id" é definida como chave estrangeira que faz referência à tabela "Megalodon" através da coluna "id". Se um registro da tabela "Megalodon" for excluído, todas as entradas da tabela "Alimentacao" associadas a esse registro também serão excluídas.
*/

CREATE TABLE Alimentacao (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo_presa VARCHAR(50) NOT NULL,
    localizacao_caça VARCHAR(100) NOT NULL,
    frequencia_alimentacao INT NOT NULL,
    imagem BLOB NOT NULL,
    megalodon_id INT NOT NULL,
    CONSTRAINT fk_alimentacao_megalodon FOREIGN KEY (megalodon_id)
        REFERENCES Megalodon(id)
        ON DELETE CASCADE
);

/*
Este bloco de código cria a tabela chamada "Pesquisadores". A tabela possui 5 colunas: "id", "nome", "instituicao", "area_pesquisa" e "imagem". A coluna "id" é definida como chave primária e será auto-incrementada. As colunas "nome", "instituicao" e "area_pesquisa" são definidas como não nulas (NOT NULL), o que significa que um valor deve ser inserido nessas colunas para cada linha. A coluna "imagem" é definida como um objeto blob que armazena dados binários.
*/

CREATE TABLE Pesquisadores (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    instituicao VARCHAR(50) NOT NULL,
    area_pesquisa VARCHAR(100) NOT NULL,
    imagem BLOB NOT NULL
);

/*
Este código adiciona uma chave estrangeira à tabela "Fosseis" que faz referência à tabela "Megalodon" através da coluna "id". Se um registro da tabela "Megalodon" for excluído, todas as entradas da tabela "Fosseis" associadas a esse registro também serão excluídas.
*/

ALTER TABLE Fosseis ADD CONSTRAINT fk_fosseis_megalodon FOREIGN KEY (megalodon_id)
    REFERENCES Megalodon(id)
    ON DELETE CASCADE;

/*
Este código adiciona uma chave estrangeira à tabela "Presas" que faz referência à tabela "Megalodon" através da coluna "id". Se um registro da tabela "Megalodon" for excluído, todas as entradas da tabela "Presas" associadas a esse registro também serão excluídas.
*/

ALTER TABLE Presas ADD CONSTRAINT fk_presas_megalodon FOREIGN KEY (megalodon_id)
    REFERENCES Megalodon(id)
    ON DELETE CASCADE;
    
/*
Este código adiciona uma restrição de chave estrangeira (FK) na tabela Alimentacao. O objetivo dessa restrição é garantir que o campo megalodon_id na tabela Alimentacao faça referência a uma chave primária válida na tabela Megalodon. O ON DELETE CASCADE especifica que, caso uma linha na tabela Megalodon seja excluída, todas as linhas relacionadas na tabela Alimentacao também serão excluídas.
*/

ALTER TABLE Alimentacao ADD CONSTRAINT fk_alimentacao_megalodon FOREIGN KEY (megalodon_id)
    REFERENCES Megalodon(id)
    ON DELETE CASCADE;

/*
Este código cria uma nova tabela chamada Megalodon_Pesquisador. Essa tabela tem duas colunas, megalodon_id e pesquisador_id, que servem como chave estrangeira para as tabelas Megalodon e Pesquisadores, respectivamente. A restrição pk_megalodon_pesquisador define que a combinação de megalodon_id e pesquisador_id deve ser exclusiva e serve como chave primária para a tabela Megalodon_Pesquisador. As restrições de chave estrangeira (fk_megalodon_pesquisador_megalodon e fk_megalodon_pesquisador_pesquisador) garantem que as colunas megalodon_id e pesquisador_id sejam referências válidas para as tabelas Megalodon e Pesquisadores. Novamente, o ON DELETE CASCADE é usado para garantir que a exclusão de uma linha na tabela Megalodon ou Pesquisadores resulte na exclusão de todas as linhas relacionadas na tabela Megalodon_Pesquisador.
*/

CREATE TABLE Megalodon_Pesquisador (
    megalodon_id INT NOT NULL,
    pesquisador_id INT NOT NULL,
    CONSTRAINT pk_megalodon_pesquisador PRIMARY KEY (megalodon_id, pesquisador_id),
    CONSTRAINT fk_megalodon_pesquisador_megalodon FOREIGN KEY (megalodon_id)
        REFERENCES Megalodon(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_megalodon_pesquisador_pesquisador FOREIGN KEY (pesquisador_id)
        REFERENCES Pesquisadores(id)
        ON DELETE CASCADE
);
