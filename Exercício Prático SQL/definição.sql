/* Criação e edição de tabelas */

CREATE TABLE departamento(nome varchar(30) NOT NULL, sigla varchar(5) NOT NULL, codigo int NOT NULL, coordenador int, PRIMARY KEY(codigo));

CREATE TABLE professor(nome VARCHAR(20) NOT NULL, snome VARCHAR(40) NOT NULL, matricula INT NOT NULL, datanasc DATE, sexo VARCHAR(1), salario DECIMAL(7, 2), matric_coord_area INT, depto INT, PRIMARY KEY(matricula), FOREIGN KEY(depto) REFERENCES departamento(codigo));

ALTER TABLE departamento ADD CONSTRAINT FOREIGN KEY(coordenador) REFERENCES professor(matricula);

CREATE TABLE projeto(nome VARCHAR(40) NOT NULL, codigo INT NOT NULL, depto INT, duracao INT, PRIMARY KEY(codigo), FOREIGN KEY(depto) REFERENCES departamento(codigo));

CREATE TABLE trabalha_em(matricprof INT NOT NULL, codproj INT NOT NULL, horas TIME, FOREIGN KEY(matricprof) REFERENCES professor(matricula), FOREIGN KEY(codproj) REFERENCES projeto(codigo), PRIMARY KEY(matricprof, codproj));

CREATE TABLE dependente(matricprof INT NOT NULL, nome VARCHAR(40) NOT NULL, RG INT NOT NULL, sexo VARCHAR(1), datanasc DATE);

ALTER TABLE dependente ADD CONSTRAINT FOREIGN KEY(matricprof) REFERENCES professor(matricula);

ALTER TABLE dependente ADD CONSTRAINT PRIMARY KEY(matricprof, RG);

CREATE TABLE telefone(matricprof INT NOT NULL, telefone INT NOT NULL, FOREIGN KEY(matricprof) REFERENCES professor(matricula), PRIMARY KEY(matricprof, telefone));

CREATE TABLE email(matricprof INT NOT NULL, email VARCHAR(40) NOT NULL, FOREIGN KEY(matricprof) REFERENCES professor(matricula), PRIMARY KEY(matricprof, email));

/* Inserção e atualização */

INSERT INTO professor(nome, snome, matricula, datanasc, sexo, salario, matric_coord_area, depto) VALUES("Pedro", "Pereira da Silva", 121003, "1982-03-25", "M", 4000.00, NULL, NULL);

INSERT INTO professor(nome, snome, matricula, datanasc, sexo, salario, matric_coord_area, depto) VALUES("José Maria", "Campos", 121031, "1978-04-10", "M", 7000.00, 121003, NULL);

INSERT INTO professor(nome, snome, matricula, datanasc, sexo, salario, matric_coord_area, depto) VALUES("Bento", "Diniz Costa", 122045, "1980-11-27", "M", 4000.00, NULL, NULL);

INSERT INTO professor(nome, snome, matricula, datanasc, sexo, salario, matric_coord_area, depto) VALUES("Ana Clara", "Araújo Santos", 122047, "1994-12-30", "F", 7200.00, 122045, NULL);

INSERT INTO professor(nome, snome, matricula, datanasc, sexo, salario, matric_coord_area, depto) VALUES("Joana Maria", "Pereira", 125332, "1990-06-12", "F", 4500.00, NULL, NULL);

INSERT INTO professor(nome, snome, matricula, datanasc, sexo, salario, matric_coord_area, depto) VALUES("João Carlos", "Matos Cavalcanti", 125335, "1976-07-22", "M", 3700.00, 125332, NULL);

INSERT INTO professor(nome, snome, matricula, datanasc, sexo, salario, matric_coord_area, depto) VALUES("Maria Luiza", "Machado", 125331, "1974-08-16", "F", 6800.00, 125332, NULL);

INSERT INTO departamento(nome, sigla, codigo, coordenador) VALUES("Tec. Telemática", "DTT", 121, 121031);

INSERT INTO departamento(nome, sigla, codigo, coordenador) VALUES("Tec. Construção de Edifícios", "DCE", 122, 122047);

INSERT INTO departamento(nome, sigla, codigo, coordenador) VALUES("Eng. Computação", "DEC", 125, 125331);

UPDATE professor SET depto = 121 WHERE nome = 'Pedro' OR nome = 'José Maria';

UPDATE professor SET depto = 122 WHERE nome = 'Ana Clara' OR nome = 'Bento';

UPDATE professor SET depto = 125 WHERE nome = 'Joana Maria' OR nome = 'João Carlos' OR nome = 'Maria Luiza';
