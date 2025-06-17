-- Modelo Lógico
-- Aluno x Empresa x Responsavel

CREATE DATABASE sprint2;
USE sprint2;

-- Criar a tabela responsavel
CREATE TABLE responsavel (
idResponsavel int primary key auto_increment,
nome varchar(45));

INSERT INTO responsavel (nome) VALUES
	('Andresa'),
    ('Joana');
    
-- Criar a tabela empresa
CREATE TABLE empresa (
idEmpresa int primary key auto_increment,
nome varchar(45),
fkResponsavel int unique,
constraint fkEmpresaResponsa 
	foreign key (fkResponsavel)
		references responsavel(idResponsavel)
);

-- Num relacionamento 1:1, a fk sempre vai ser UNIQUE

INSERT INTO empresa VALUES 
	(default, 'C6Bank', 1),
	(default, 'Stefanini', 2);
    
-- Criar a tabela aluno
CREATE TABLE aluno (
ra char(8) primary key,
nome varchar(45),
email varchar(45),
fkEmpresa int,
constraint fkAlunoEmpresa
	foreign key (fkEmpresa)
    references empresa(idEmpresa)
);

INSERT INTO aluno (ra, nome, fkEmpresa) VALUES
	('01251100', 'Yuri', 1),
	('01251101', 'Bianca', 1),
	('01251102', 'Caio', 2);
    
-- Nosso primeiro join
-- JUNÇÃO/RELACIONAR

SELECT * FROM responsavel JOIN empresa
ON idResponsavel = fkResponsavel;

SELECT responsavel.nome as Responsa,
empresa.nome as Empresa
FROM responsavel JOIN empresa
	ON idResponsavel = fkResponsavel;

SELECT * FROM empresa JOIN aluno
	ON idEmpresa = fkEmpresa;
    
SELECT empresa.nome as Empresa,
	aluno.nome as Aluno
    FROM empresa JOIN aluno
    ON idEmpresa = fkEmpresa;
    
-- INNER JOIN = JOIN

SELECT a.nome as NomeAluno,
	e.nome as NomeEmpresa,
    r.nome as NomeResponsa
    FROM aluno as a JOIN empresa as e
    ON a.fkEmpresa = e.idEmpresa
    JOIN responsavel as r
    ON e.fkResponsavel = r.idResponsavel;

SELECT a.nome as NomeAluno, -- tabela aluno campo nome
	e.nome as NomeEmpresa, -- tabela empresa campo nome
    r.nome as NomeResponsa -- tabela responsavel campo nome
    FROM aluno as a JOIN empresa as e -- juntando aluno com empresa e apelidando as tabelas
    ON a.fkEmpresa = e.idEmpresa -- aliança de aluno e empresa
    JOIN responsavel as r -- juntando empresa com responsavel e apelidando a tabela
    ON e.fkResponsavel = r.idResponsavel -- aliança entre empresa e responsavel
		WHERE a.nome = 'Yuri'; -- condição de filtro, com where (onde)

SELECT aluninho.nome as AlunoNome,
	empresa.nome as EmpresaNome
    FROM aluno as aluninho JOIN empresa
		ON idEmpresa = fkEmpresa;
/*    
-- Se criar primeiro a tabela aluno
CREATE TABLE aluno (
ra char(8) primary key,
nome varchar(45),
email varchar(45),
fkEmpresa int);

CREATE TABLE empresa (
idEmpresa int primary key auto_increment,
nome varchar(45));

ALTER TABLE aluno ADD CONSTRAINT fkAlunoEmpresa
	foreign key (fkEmpresa) references empresa(idEmpresa);
*/

INSERT INTO responsavel (nome) VALUES
	('Ícaro');

SELECT * FROM responsavel;

SELECT * FROM responsavel JOIN empresa
	ON idResponsavel = fkResponsavel;

SELECT a.nome as NomeAluno,
	e.nome as NomeEmpresa,
    CASE 
		WHEN e.nome = 'C6Bank' THEN 'Empresa Topzera'
        WHEN e.nome = 'Stefanini' THEN 'Empresa Top'
	ELSE 'Empresa não cadastrada'
    END Empresa
    FROM aluno as a JOIN empresa as e
    ON idEmpresa = fkEmpresa;