
-- Criação das tabelas

CREATE TABLE Aluno (
  id_aluno INT PRIMARY KEY,
  nome VARCHAR(100),
  cpf VARCHAR(14),
  data_nascimento DATE,
  telefone VARCHAR(15),
  email VARCHAR(100),
  endereco VARCHAR(255)
);

CREATE TABLE Instrutor (
  id_instrutor INT PRIMARY KEY,
  nome VARCHAR(100),
  cpf VARCHAR(14),
  especialidade VARCHAR(50),
  telefone VARCHAR(15)
);

CREATE TABLE Aula (
  id_aula INT PRIMARY KEY,
  nome_aula VARCHAR(100),
  horario TIME,
  dias_semana VARCHAR(50),
  id_instrutor INT,
  FOREIGN KEY (id_instrutor) REFERENCES Instrutor(id_instrutor)
    ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE Aluno_Aula (
  id_aluno INT,
  id_aula INT,
  PRIMARY KEY (id_aluno, id_aula),
  FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno) ON DELETE CASCADE,
  FOREIGN KEY (id_aula) REFERENCES Aula(id_aula) ON DELETE CASCADE
);

CREATE TABLE Matricula (
  id_matricula INT PRIMARY KEY,
  data_inicio DATE,
  data_fim DATE,
  status VARCHAR(20),
  id_aluno INT,
  FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno) ON DELETE CASCADE
);

CREATE TABLE Pagamento (
  id_pagamento INT PRIMARY KEY,
  valor DECIMAL(10,2),
  data_pagamento DATE,
  forma_pagamento VARCHAR(30),
  id_aluno INT,
  FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno) ON DELETE CASCADE
);

CREATE TABLE Ficha_Treino (
  id_ficha INT PRIMARY KEY,
  data_criacao DATE,
  objetivo VARCHAR(100),
  id_aluno INT,
  id_instrutor INT,
  FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno) ON DELETE CASCADE,
  FOREIGN KEY (id_instrutor) REFERENCES Instrutor(id_instrutor) ON DELETE SET NULL
);

CREATE TABLE Exercicio (
  id_exercicio INT PRIMARY KEY,
  nome VARCHAR(100),
  descricao TEXT,
  grupo_muscular VARCHAR(50)
);

CREATE TABLE Ficha_Exercicio (
  id_ficha INT,
  id_exercicio INT,
  PRIMARY KEY (id_ficha, id_exercicio),
  FOREIGN KEY (id_ficha) REFERENCES Ficha_Treino(id_ficha) ON DELETE CASCADE,
  FOREIGN KEY (id_exercicio) REFERENCES Exercicio(id_exercicio) ON DELETE CASCADE
);

-- Inserções de dados

INSERT INTO Aluno VALUES (1, 'João Silva', '123.456.789-00', '1995-04-20', '(11) 99999-9999', 'joao@email.com', 'Rua A, 123');
INSERT INTO Instrutor VALUES (1, 'Maria Souza', '987.654.321-00', 'Musculação', '(11) 98888-8888');
INSERT INTO Aula VALUES (1, 'Spinning', '18:00', 'Segunda, Quarta, Sexta', 1);
INSERT INTO Aluno_Aula VALUES (1, 1);
INSERT INTO Matricula VALUES (1, '2024-01-01', '2024-12-31', 'ativa', 1);
INSERT INTO Pagamento VALUES (1, 150.00, '2024-05-01', 'Cartão de Crédito', 1);
INSERT INTO Ficha_Treino VALUES (1, '2024-05-15', 'Hipertrofia', 1, 1);
INSERT INTO Exercicio VALUES (1, 'Supino Reto', 'Exercício para peitoral', 'Peitoral');
INSERT INTO Ficha_Exercicio VALUES (1, 1);

-- Consultas SQL

-- Alunos e suas fichas
SELECT a.nome, f.id_ficha, f.objetivo
FROM Aluno a
JOIN Ficha_Treino f ON a.id_aluno = f.id_aluno;

-- Aulas e instrutores
SELECT au.nome_aula, i.nome AS instrutor
FROM Aula au
JOIN Instrutor i ON au.id_instrutor = i.id_instrutor;

-- Alunos matriculados na aula 1
SELECT al.nome
FROM Aluno al
JOIN Aluno_Aula aa ON al.id_aluno = aa.id_aluno
WHERE aa.id_aula = 1;

-- Total pago por aluno
SELECT al.nome, SUM(p.valor) AS total_pago
FROM Aluno al
JOIN Pagamento p ON al.id_aluno = p.id_aluno
GROUP BY al.nome;

-- Exercícios da ficha do João
SELECT e.nome, e.grupo_muscular
FROM Exercicio e
JOIN Ficha_Exercicio fe ON e.id_exercicio = fe.id_exercicio
JOIN Ficha_Treino ft ON fe.id_ficha = ft.id_ficha
JOIN Aluno a ON ft.id_aluno = a.id_aluno
WHERE a.nome = 'João Silva';
