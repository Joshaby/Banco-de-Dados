CREATE DATABASE ControleAcademico;

CREATE TABLE Aluno(matricula INT NOT NULL, nome VARCHAR(50) NOT NULL, filiacao VARCHAR(50), rua VARCHAR(50) NOT NULL, numero SMALLINT NOT NULL, bairro VARCHAR(50) NOT NULL, CEP VARCHAR(9) NOT NULL, sexo ENUM('M', 'F') NOT NULL, codigoCurso TINYINT NOT NULL, codigoTurma TINYINT NOT NULL, semestre VARCHAR(6) NOT NULL, PRIMARY KEY(matricula), FOREIGN KEY(codigoCurso) REFERENCES Curso(codigo), FOREIGN KEY(codigoTurma) REFERENCES Turma(codigo));

CREATE TABLE EmailAluno(matriculaAluno INT NOT NULL UNIQUE, email VARCHAR(50) UNIQUE);

CREATE TABLE Historico(codigo SMALLINT NOT NULL, matriculaAluno INT NOT NULL, codigoCurso TINYINT NOT NULL, PRIMARY KEY(codigo), FOREIGN KEY(matriculaAluno) REFERENCES Aluno(matricula), FOREIGN KEY(codigoCurso) REFERENCES Curso(codigo));

CREATE TABLE HistoricoDisciplina(codigoHistorico SMALLINT NOT NULL, codigoDisciplina TINYINT NOT NULL, semestre VARCHAR(6) NOT NULL, PRIMARY KEY(codigoHistorico, codigoDisciplina), FOREIGN KEY(codigoHistorico) REFERENCES Historico(codigo), FOREIGN KEY(codigoDisciplina) REFERENCES Disciplina(codigo));

CREATE TABLE Disciplina(codigo TINYINT NOT NULL, nome VARCHAR(50) NOT NULL, cargaHoraria TINYINT NOT NULL, ementa TINYINT NOT NULL, PRIMARY KEY(codigo));

CREATE TABLE DisciplinaCurso(codigoDisciplina TINYINT NOT NULL, codigoCurso TINYINT NOT NULL, PRIMARY KEY(codigoDisciplina, codigoCurso), FOREIGN KEY(codigoDisciplina) REFERENCES Disciplina(codigo), FOREIGN KEY(codigoCurso) REFERENCES Curso(Codigo));

CREATE TABLE Curso(codigo TINYINT NOT NULL, nome VARCHAR(50) NOT NULL, duracao TINYINT, PRIMARY KEY(codigo));

CREATE TABLE AlunoDisciplina(matriculaAluno INT NOT NULL, codigoDisciplina TINYINT NOT NULL, semestre VARCHAR(6) NOT NULL, nota DECIMAL(5, 2) NOT NULL, PRIMARY KEY(matriculaAluno, codigoDisciplina), FOREIGN KEY(matriculaAluno) REFERENCES Aluno(matricula), FOREIGN KEY(codigoDisciplina) REFERENCES Disciplina(codigo));

CREATE TABLE Turma(codigo TINYINT NOT NULL, codigoCurso TINYINT NOT NULL, semestre VARCHAR(6) NOT NULL, PRIMARY KEY(codigo), FOREIGN KEY(codigoCurso) REFERENCES Curso(codigo));

CREATE TABLE TurmaDisciplina(codigoTurma TINYINT NOT NULL, codigoDisciplina TINYINT NOT NULL, PRIMARY KEY(codigoTurma, codigoDisciplina), FOREIGN KEY(codigoTurma) REFERENCES Turma(codigo), FOREIGN KEY(codigoDisciplina) REFERENCES Disciplina(codigo));

CREATE TABLE EmailProfessor(matriculaProfessor INT NOT NULL UNIQUE, email VARCHAR(50) UNIQUE);

CREATE TABLE Professor(matricula INT NOT NULL, nome VARCHAR(50) NOT NULL, sexo ENUM('M', 'F') NOT NULL, salario DECIMAL(8, 2) NOT NULL, rua VARCHAR(50) NOT NULL, numero SMALLINT NOT NULL, bairro VARCHAR(50) NOT NULL, CEP VARCHAR(9) NOT NULL, PRIMARY KEY(matricula));

CREATE TABLE ProfessorDisciplina(matriculaProfessor INT NOT NULL, codigoDisciplina TINYINT NOT NULL, PRIMARY KEY(matriculaProfessor, codigoDisciplina), FOREIGN KEY(matriculaProfessor) REFERENCES Professor(matricula), FOREIGN KEY(codigoDisciplina) REFERENCES Disciplina(codigo));

CREATE TABLE DisciplinaPreRequisito(codigoDisciplina TINYINT NOT NULL, codigoDisciplinaPreRequisito TINYINT NOT NULL, PRIMARY KEY(codigoDisciplina, codigoDisciplinaPreRequisito), FOREIGN KEY(codigoDisciplina) REFERENCES Disciplina(codigo));

CREATE TABLE TCC(codigo INT NOT NULL, nota DECIMAL(5, 2) NOT NULL, tema VARCHAR(50) NOT NULL, matriculaAluno INT NOT NULL, matriculaProfessor INT NOT NULL, PRIMARY KEY(codigo), FOREIGN KEY(matriculaProfessor) REFERENCES Professor(matricula), FOREIGN KEY(matriculaAluno) REFERENCES Aluno(matricula));

CREATE TABLE AvaliadorTCC(matriculaProfessor INT NOT NULL, codigoTCC INT NOT NULL, PRIMARY KEY(matriculaProfessor, codigoTCC), FOREIGN KEY(matriculaProfessor) REFERENCES Professor(matricula), FOREIGN KEY(codigoTCC) REFERENCES TCC(codigo));

