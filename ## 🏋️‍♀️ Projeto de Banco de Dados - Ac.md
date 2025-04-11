## 🏋️‍♀️ Projeto de Banco de Dados - Academia

### Etapa 1: Modelo Entidade-Relacionamento (MER)

---

### 📌 1. Análise dos Requisitos

O sistema da academia deverá gerenciar informações relacionadas a:

- Alunos
- Instrutores
- Planos de treino
- Aulas/Modalidades
- Matrículas
- Pagamentos
- Fichas de treino
- Equipamentos (opcional)

---

### 🧹 2. Entidades, Atributos e Relacionamentos

#### **1. Aluno**

- **Descrição**: Representa o cliente que utiliza os serviços da academia.
- **Atributos**:
  - `id_aluno` (PK, int)
  - `nome` (varchar)
  - `cpf` (varchar)
  - `data_nascimento` (date)
  - `telefone` (varchar)
  - `email` (varchar)
  - `endereco` (varchar)
- **Relacionamentos**:
  - Possui matrícula(s)
  - Possui ficha(s) de treino
  - Realiza pagamento(s)

#### **2. Instrutor**

- **Descrição**: Responsável por orientar os alunos, montar fichas e ministrar aulas.
- **Atributos**:
  - `id_instrutor` (PK, int)
  - `nome` (varchar)
  - `cpf` (varchar)
  - `especialidade` (varchar)
  - `telefone` (varchar)
- **Relacionamentos**:
  - Responsável por ficha(s) de treino
  - Pode ministrar aula(s)

#### **3. Aula**

- **Descrição**: Representa uma modalidade ou sessão de exercício com horário definido.
- **Atributos**:
  - `id_aula` (PK, int)
  - `nome_aula` (varchar)
  - `horario` (time)
  - `dias_semana` (varchar)
  - `id_instrutor` (FK)
- **Relacionamentos**:
  - Ministrada por instrutor
  - Pode ter alunos inscritos (relacionamento N\:N com Aluno)

#### **4. Matrícula**

- **Descrição**: Representa o vínculo entre o aluno e a academia.
- **Atributos**:
  - `id_matricula` (PK, int)
  - `data_inicio` (date)
  - `data_fim` (date)
  - `status` (varchar)
  - `id_aluno` (FK)
- **Relacionamentos**:
  - Vinculada a um aluno

#### **5. Pagamento**

- **Descrição**: Registra os pagamentos efetuados pelo aluno.
- **Atributos**:
  - `id_pagamento` (PK, int)
  - `valor` (decimal)
  - `data_pagamento` (date)
  - `forma_pagamento` (varchar)
  - `id_aluno` (FK)
- **Relacionamentos**:
  - Feito por um aluno

#### **6. Ficha\_Treino**

- **Descrição**: Contém os exercícios e rotinas destinados a um aluno.
- **Atributos**:
  - `id_ficha` (PK, int)
  - `data_criacao` (date)
  - `objetivo` (varchar)
  - `id_aluno` (FK)
  - `id_instrutor` (FK)
- **Relacionamentos**:
  - Criada por instrutor
  - Pertence a um aluno

#### **7. Exercício**

- **Descrição**: Define os exercícios utilizados nas fichas de treino.
- **Atributos**:
  - `id_exercicio` (PK, int)
  - `nome` (varchar)
  - `descricao` (text)
  - `grupo_muscular` (varchar)
- **Relacionamentos**:
  - Pode estar em várias fichas (N\:N com ficha de treino)

---

### 🔗 3. Justificativas das Cardinalidades

- **Aluno - Ficha\_Treino**: 1\:N → Um aluno pode ter várias fichas, mas cada ficha pertence a um único aluno.
- **Instrutor - Ficha\_Treino**: 1\:N → Um instrutor pode montar várias fichas, mas cada ficha tem um único responsável.
- **Aluno - Aula**: N\:N → Um aluno pode participar de várias aulas e cada aula pode ter vários alunos (entidade associativa `Aluno_Aula`).
- **Ficha\_Treino - Exercício**: N\:N → Exercícios podem ser reutilizados em diferentes fichas.

---

### 📂 4. Modelo no brModelo

> ...

---

