/*
Curso de Engenharia de Software - UniEVANGÉLICA
Disciplina de Sistemas Gerenciadores de Banco de Dados
Dev: Douglas Leonel de Almeida
DATA: 08/05/2023
*/

-- Criação das tabelas
CREATE TABLE consultorios
             (
                          id_consultorio INT PRIMARY KEY,
                          nome           VARCHAR(50),
                          localizacao    VARCHAR(50)
             );CREATE TABLE profissionais
             (
                          id_profissional   INT PRIMARY KEY,
                          nome              VARCHAR(50),
                          id_especialidade  INT,
                          registro_medicina VARCHAR(50),
                          id_consultorio    INT,
                          FOREIGN KEY (id_especialidade) REFERENCES especialidade(id),
                          FOREIGN KEY (id_consultorio) REFERENCES consultorios(id_consultorio)
             );CREATE TABLE pacientes
             (
                          id_paciente     INT PRIMARY KEY,
                          nome            VARCHAR(50),
                          data_nascimento DATE,
                          cartao_convenio VARCHAR(50)
             );CREATE TABLE agendamentos
             (
                          id_agendamento  INT PRIMARY KEY,
                          data_hora       DATETIME,
                          id_paciente     INT,
                          id_profissional INT,
                          FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
                          FOREIGN KEY (id_profissional) REFERENCES profissionais(id_profissional)
             );CREATE TABLE auditoriaagendamentos
             (
                          id_auditoria   INT PRIMARY KEY,
                          id_agendamento INT,
                          data_hora      DATETIME
             );CREATE TRIGGER tr_auditagendamentos ON agendamentos after
UPDATE,
INSERT,
DELETE AS BEGIN
DECLARE @id_agendamento INT;
SELECT @id_agendamento = id_agendamento
FROM   inserted;

INSERT INTO auditoriaagendamentos
            (
                        id_agendamento,
                        data_hora
            )
            VALUES
            (
                        @id_agendamento,
                        Getdate()
            );

END;

-- Stored procedure para facilitar a inserção de um novo agendamento, verificando a disponibilidade do profissional e garantindo que não haja conflito de horáriosCREATE PROCEDURE Sp_inseriragendamento
  @data_hora       DATETIME,
  @id_paciente     INT,
  @id_profissional INT
AS
  BEGIN
    IF EXISTS
    (
           SELECT 1
           FROM   agendamentos
           WHERE  id_profissional = @id_profissional
           AND    data_hora = @data_hora
    )
    BEGIN
      RAISERROR('O profissional já possui um agendamento neste horário.', 16, 1);
      RETURN;
    END
    INSERT INTO agendamentos
                (
                            data_hora,
                            id_paciente,
                            id_profissional
                )
                VALUES
                (
                            @data_hora,
                            @id_paciente,
                            @id_profissional
                );
  
  END;

  -- Função que calcule a idade dos pacientes a partir de suas datas de nascimentoCREATE FUNCTION Fn_calcularidade (@data_nascimento DATE)
returns INT AS
BEGIN
  DECLARE @idade INT;
  SET @idade = Datediff(year, @data_nascimento, Getdate());
  IF Month(@data_nascimento) > Month(Getdate())
  OR
  (
    Month(@data_nascimento) = Month(Getdate())
    AND
    Day(@data_nascimento) > Day(Getdate())
  )
  BEGIN
    SET @idade = @idade - 1;
  END
  RETURN @idade;
END;

-- View que mostre uma lista de todos os agendamentos, incluindo informações detalhadas sobre o paciente, o profissional e o consultórioCREATE VIEW vw_listaagendamentos AS
SELECT     a.id_agendamento,
           a.data_hora,
           p.nome  AS nome_paciente,
           pr.nome AS nome_profissional,
           e.nome  AS nome_especialidade,
           c.nome  AS nome_consultorio,
           c.localizacao
FROM       agendamentos a
INNER JOIN pacientes p
ON         a.id_paciente = p.id_paciente
INNER JOIN profissionais pr
ON         a.id_profissional = pr.id_profissional
INNER JOIN consultorios c
ON         pr.id_consultorio = c.id_consultorio
INNER JOIN especialidade e
ON         pr.id_especialidade = e.id;

-- Criação de usuários e permissõesCREATE login admin WITH password = 'senha_admin';CREATE login profissional WITH password = 'senha_profissional';CREATE login recepcionista WITH password = 'senha_recepcionista';CREATE USER admin FOR login admin;CREATE USER profissional FOR login profissional;CREATE USER recepcionista FOR login recepcionista;GRANT
SELECT,
INSERT,
UPDATE,
DELETE
ON agendamentos TO admin;GRANT
SELECT
ON pacientes,
       consultorios,
       especialidade TO profissional;GRANT
SELECT,
INSERT,
UPDATE,
DELETE
ON agendamentos TO recepcionista;GRANT
SELECT
ON pacientes,
       profissionais,
       consultorios,
       especialidade TO recepcionista;
