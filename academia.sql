-- 1. Tabela: Aluno
CREATE TABLE Aluno (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14),
    data_nascimento DATE,
    telefone VARCHAR(15),
    email VARCHAR(100),
    endereco VARCHAR(255)
);

-- 2. Tabela: Instrutor
CREATE TABLE Instrutor (
    id_instrutor INT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14),
    especialidade VARCHAR(50),
    telefone VARCHAR(15)
);

-- 3. Tabela: Aula
CREATE TABLE Aula (
    id_aula INT PRIMARY KEY,
    nome_aula VARCHAR(100),
    horario TIME,
    dias_semana VARCHAR(50),
    id_instrutor INT NULL,
    FOREIGN KEY (id_instrutor) REFERENCES Instrutor(id_instrutor)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- 4. Tabela: Aluno_Aula (associativa N:N)
CREATE TABLE Aluno_Aula (
    id_aluno INT,
    id_aula INT,
    PRIMARY KEY (id_aluno, id_aula),
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno) ON DELETE CASCADE,
    FOREIGN KEY (id_aula) REFERENCES Aula(id_aula) ON DELETE CASCADE
);

-- 5. Tabela: Matricula
CREATE TABLE Matricula (
    id_matricula INT PRIMARY KEY,
    data_inicio DATE,
    data_fim DATE,
    status VARCHAR(20),
    id_aluno INT,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno) ON DELETE CASCADE
);

-- 6. Tabela: Pagamento
CREATE TABLE Pagamento (
    id_pagamento INT PRIMARY KEY,
    valor DECIMAL(10,2),
    data_pagamento DATE,
    forma_pagamento VARCHAR(30),
    id_aluno INT,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno) ON DELETE CASCADE
);

-- 7. Tabela: Ficha_Treino
CREATE TABLE Ficha_Treino (
    id_ficha INT PRIMARY KEY,
    data_criacao DATE,
    objetivo VARCHAR(100),
    id_aluno INT,
    id_instrutor INT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno) ON DELETE CASCADE,
    FOREIGN KEY (id_instrutor) REFERENCES Instrutor(id_instrutor) ON DELETE SET NULL
);

-- 8. Tabela: Exercicio
CREATE TABLE Exercicio (
    id_exercicio INT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    grupo_muscular VARCHAR(50)
);

-- 9. Tabela: Ficha_Exercicio (associativa N:N)
CREATE TABLE Ficha_Exercicio (
    id_ficha INT,
    id_exercicio INT,
    PRIMARY KEY (id_ficha, id_exercicio),
    FOREIGN KEY (id_ficha) REFERENCES Ficha_Treino(id_ficha) ON DELETE CASCADE,
    FOREIGN KEY (id_exercicio) REFERENCES Exercicio(id_exercicio) ON DELETE CASCADE
);
