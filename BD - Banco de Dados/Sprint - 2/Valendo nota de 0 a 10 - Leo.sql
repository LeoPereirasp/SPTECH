CREATE DATABASE Entrega;

USE Entrega;

CREATE TABLE Projeto(
idProjeto INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
descricao VARCHAR(200)
);


CREATE TABLE Alunos(
ra CHAR(8) PRIMARY KEY,
nome VARCHAR(45),
telefone CHAR(15),
fkRepresentante CHAR(8) NOT NULL,
fkProjeto INT NOT NULL,
CONSTRAINT fkalunorepresentante   FOREIGN KEY(fkRepresentante) REFERENCES Alunos(ra),
CONSTRAINT fkalunoprojeto   FOREIGN KEY(fkprojeto) REFERENCES Projeto(idProjeto));

INSERT INTO Projeto (nome,descricao) VALUES
	('BeeAware', 'Monitoramento Temperatura em apiários'),
    ('Pitayas', 'monitoramneto de Umiddae do solo em plantações de pitaias'),
    ('SITUT', 'Sistema de irrigação e umudidade da terra');
    
INSERT INTO Alunos VALUES
	('01251111','Homero','(11) 99999-9999', '01251111', 2),
    ('01251116', 'Leo','(11) 98888-9090', '01251116',3),
    ('01251120', 'Hugo', '(11) 90909-9090', '01251120',1),
    ('01251150', 'Bigode', '(11) 97878-7878', '01251116',3),
    ('01251156', 'Samuel', '(11) 97656-7676', '01251111',2),
    ('01251222', 'Nando', '(11) 98888-8888', '01251120',1);
    
-- Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM Alunos;
SELECT * FROM Projeto;

-- Exibir os dados dos alunos e dos projetos correspondentes.
SELECT Alunos.nome as 'Nome do Aluno',
	Projeto.nome as 'Nome do Projeto',
    Projeto.descricao as 'Descrição do Projeto',
	Alunos.ra as 'RA do Aluno',
    Alunos.telefone as Telefone
    FROM Alunos JOIN Projeto
    ON idprojeto = fkprojeto;
    
-- Exibir os dados dos alunos e dos seus representantes.
SELECT Alunos.nome as 'Nome do Aluno',
	Alunos.ra as 'RA do Aluno',
    Alunos.telefone as 'Telefone do Representante',
    rep.nome AS "Nome do Representante", 
    rep.ra AS "RA do Representante",
    rep.telefone AS "Telefone do Representante"
    FROM Alunos JOIN Alunos AS rep
	ON Alunos.fkRepresentante = rep.RA;
    
-- Exibir os dados dos alunos e dos projetos correspondentes, mas somente de um determinado projeto (indicar o nome do projeto na consulta)
SELECT Alunos.nome as 'Nome do Aluno',
	Projeto.nome as 'Nome do Projeto',
    Projeto.descricao as 'Descrição do Projeto',
	Alunos.ra as 'RA do Aluno',
    Alunos.telefone as Telefone
    FROM Alunos JOIN Projeto
    ON idprojeto = fkprojeto
	WHERE Projeto.nome = 'SITUT';
   
   -- EXERCÍCIO 2
   
-- a) Criar um banco de dados chamado Campanha.
CREATE DATABASE Campanha;
 
-- b) Selecionar esse banco de dados.
USE Campanha;

-- c) Criar as tabelas correspondentes à sua modelagem.
    CREATE TABLE Campanha(
    idCampanha INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(45),
    instituicao1 VARCHAR(45),
    instituicao2 VARCHAR(45),
    dtFinal DATE
    ) auto_increment = 500;
    
    CREATE TABLE Organizador(
    idOrganizador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    rua VARCHAR(100),
    bairro VARCHAR(45),
    email VARCHAR(45),
    fkExperiente INT NOT NULL,
    fkCampanha INT NOT NULL,
    CONSTRAINT fkorganizadorexperiente   FOREIGN KEY(fkExperiente) REFERENCES Organizador(idOrganizador),
	CONSTRAINT fkcampanhadoar   FOREIGN KEY(fkCampanha) REFERENCES campanha(idCampanha)
    ) auto_increment = 30;
    
-- d) Inserir dados nas tabelas, de forma que exista mais de uma campanha para algum organizador, e mais de um organizador novato sendo orientado por algum organizador mais experiente.
-- Inserindo campanhas
INSERT INTO Campanha (categoria, instituicao1, instituicao2, dtFinal) VALUES
    ('Produto de higiene', 'Salvando Vidas', 'Recomeço', '2025-04-01'),
    ('Alimentos não perecíveis', 'Ação Solidária', 'Esperança Viva', '2025-06-15'),
    ('Material Escolar', 'Educação para Todos', 'Mãos Dadas', '2025-08-20');

-- Inserindo organizadores (incluindo experientes e novatos)
INSERT INTO Organizador (nome, rua, bairro, email, fkExperiente, fkCampanha) VALUES
    ('Hugo', 'Rua Haddock Lobo, 94', 'Bairro dos Casa', 'hugocarlos@gmail.com', 30, 500),
    ('Mariana', 'Avenida Paulista, 1500', 'Bela Vista', 'mariana.silva@gmail.com', 31, 501),
    ('Carlos', 'Rua das Flores, 200', 'Centro', 'carlos.oliveira@gmail.com', 30, 502),
    ('Fernanda', 'Rua da Paz, 300', 'Vila Nova', 'fernanda.santos@gmail.com', 31, 500),
    ('Ricardo', 'Alameda dos Anjos, 45', 'Jardins', 'ricardo.mendes@gmail.com', 31, 501);

-- e) Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM Campanha;
SELECT * FROM Organizador;

-- f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação das tabelas.
-- JÁ FEITO.

-- g) Exibir os dados dos organizadores e os dados de suas respectivas campanhas.
SELECT Organizador.nome as 'Nome do Organizador',
	Organizador.rua as 'Rua do Organizador',
    Organizador.bairro as 'Bairro do organizador',
    Organizador.bairro as 'E-mail do Organizador',
	Campanha.instituicao1 as 'Nome da instituição 1',
    Campanha.instituicao2 as 'Nome da instituição 2',
    Campanha.dtFinal as 'Data Final',
    Campanha.categoria as 'Categoria'
    FROM Organizador JOIN Campanha
    ON idcampanha = fkcampanha;

-- h) Exibir os dados de um determinado organizador (informar o nome do organizador na consulta) e os dados de suas respectivas campanhas.
SELECT Organizador.nome as 'Nome do Organizador',
	Organizador.rua as 'Rua do Organizador',
    Organizador.bairro as 'Bairro do organizador',
    Organizador.bairro as 'E-mail do Organizador',
	Campanha.instituicao1 as 'Nome da instituição 1',
    Campanha.instituicao2 as 'Nome da instituição 2',
    Campanha.dtFinal as 'Data Final',
    Campanha.categoria as 'Categoria'
    FROM Organizador JOIN Campanha
    ON idcampanha = fkcampanha
    WHERE Organizador.nome = 'Hugo';

-- i) Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores.
SELECT Novato.nome as 'Nome',
    Novato.email as 'Email',
    Experiente.nome as 'Nome do Orientador',
    Experiente.email as 'Email do Orientador'
FROM Organizador Novato JOIN Organizador Experiente
ON Novato.fkExperiente = Experiente.idOrganizador;
 
-- j) Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores, porém somente de um determinado organizador orientador (informar o nome do organizador orientador na consulta).
SELECT Novato.nome as 'Nome do Novato',
    Novato.email as 'Email do Novato',
    Experiente.nome as 'Nome do Orientador',
    Experiente.email as 'Email do Orientador'
FROM Organizador Novato JOIN Organizador Experiente
ON Novato.fkExperiente = Experiente.idOrganizador
WHERE Experiente.nome = 'Mariana';
 
-- l) Exibir os dados dos organizadores novatos, os dados das respectivas campanhas organizadas e os dados dos respectivos organizadores orientadores.
SELECT Novato.nome as 'Nome',
    Novato.email as 'Email',
    Campanha.categoria as 'Categoria da Campanha',
    Campanha.dtFinal as 'Data Final',
    Experiente.nome as 'Nome do Orientador'
FROM Organizador Novato
JOIN Campanha ON Novato.fkCampanha = Campanha.idCampanha
JOIN Organizador Experiente ON Novato.fkExperiente = Experiente.idOrganizador;
 
-- m) Exibir os dados de um organizador novato (informar o seu nome na consulta), os dados das respectivas campanhas em que trabalha e os dados do seu organizador orientador.
SELECT Novato.nome as 'Nome do Novato',
    Novato.email as 'Email do Novato',
    Campanha.categoria as 'Categoria da Campanha',
    Campanha.dtFinal as 'Data Final',
    Experiente.nome as 'Nome do Orientador'
FROM Organizador Novato
JOIN Campanha ON Novato.fkCampanha = Campanha.idCampanha
JOIN Organizador Experiente ON Novato.fkExperiente = Experiente.idOrganizador
WHERE Novato.nome = 'Carlos';
 
    
    
    
    
    
    
    
