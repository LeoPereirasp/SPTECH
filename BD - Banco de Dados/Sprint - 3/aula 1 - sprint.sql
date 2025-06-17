CREATE DATABASE sprint3;

USE sprint3;

CREATE TABLE aluno (
idAluno INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
dtNasc date) auto_increment = 100;

INSERT INTO aluno VALUES
	(DEFAULT, 'Hugo', '2000-01-20'),
    (DEFAULT, 'Cássio', '1988-03-23'),
    (DEFAULT, 'Donelli','1990-05-28');
   
CREATE TABLE curso (
idCurso INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cargaHoraria INT);

INSERT INTO curso VALUES
	(DEFAULT, 'Inglês', 100 ),
    (DEFAULT, 'Espanhol', 80),
    (DEFAULT, 'Mandarim',120);
    
SELECT * FROM aluno;
SELECT * FROM curso;


CREATE TABLE matricula (
idMatricula INT AUTO_INCREMENT,
fkAluno INT,
fkCurso INT,
constraint pkcomposta 
	primary key (idMatricula, fkAluno, fkCurso),
nota DECIMAL(4,2),
statusMat VARCHAR(45),
dtMatricula DATE,
constraint fkAunoMat 
	foreign key (fkAluno) references aluno(idAluno), 
foreign key (fkCurso) references curso(idCurso)
);

INSERT INTO matricula VALUES
	(DEFAULT, 100, 1, 9.5, 'aprovado','2024-01-01' ),
    (DEFAULT, 100, 2, 4.5, 'reprovado','2024-01-01' ),
    (DEFAULT, 101, 1, null , 'cursando','2025-01-01' ),
    (DEFAULT, 102, 2, null , 'cursando','2025-01-01' );
    
SELECT aluno.nome AS Aluno,
	curso.nome AS Curso,
    ifnull(nota, 'Sem Nota') as Nota
    FROM aluno JOIN  matricula
    ON idAluno = fkAluno
    RIGHT JOIN curso 
    ON idCurso = fkCurso
    WHERE fkAluno is null;
    
