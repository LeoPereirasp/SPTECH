-- Exercício 1

-- Criação das tabelas
CREATE TABLE Area (
    idArea INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE Funcionario (
    idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    fkArea INT,
    fkSupervisor INT,
    CONSTRAINT fkFuncionarioArea FOREIGN KEY (fkArea) REFERENCES Area(idArea),
    CONSTRAINT fkFuncionarioSupervisor FOREIGN KEY (fkSupervisor) REFERENCES Funcionario(idFuncionario)
);

-- Inserção de dados
INSERT INTO Area (nome) VALUES ('Marketing'), ('Financeiro'), ('TI');

INSERT INTO Funcionario (nome, fkArea, fkSupervisor) VALUES
('Carlos', 1, NULL),
('Ana', 1, 1),
('Bruno', 2, 1),
('Mariana', 3, 3),
('Lucas', 3, 3);

-- SELECT com JOIN
SELECT f.idFuncionario, f.nome, a.nome AS area 
FROM Funcionario f 
JOIN Area a ON f.fkArea = a.idArea;

-- SELECT com JOIN e WHERE
SELECT f.idFuncionario, f.nome, a.nome AS area 
FROM Funcionario f 
JOIN Area a ON f.fkArea = a.idArea
WHERE a.nome = 'TI';

-- SELECT com JOIN e CASE
SELECT f.idFuncionario, f.nome, a.nome AS area,
       CASE WHEN f.fkSupervisor IS NULL THEN 'Sem Supervisor' ELSE 'Tem Supervisor' END AS status_supervisor
FROM Funcionario f 
JOIN Area a ON f.fkArea = a.idArea;


-- Exercício 2

-- Criação das tabelas
CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    fkGerente INT,
    CONSTRAINT fkUsuarioGerente FOREIGN KEY (fkGerente) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Email (
    idEmail INT PRIMARY KEY AUTO_INCREMENT,
    fkUsuario INT,
    email VARCHAR(255) UNIQUE,
    CONSTRAINT fkEmailUsuario FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUsuario)
);

-- Inserção de dados
INSERT INTO Usuario (nome, fkGerente) VALUES 
('Admin', NULL),
('João', 1),
('Maria', 1),
('Carlos', 2);

INSERT INTO Email (fkUsuario, email) VALUES
(1, 'admin@gmail.com'),
(2, 'joao@gmail.com'),
(3, 'maria@gmail.com'),
(4, 'carlos@gmail.com'),
(2, 'joao.trabalho@gmail.com');

-- SELECT com JOIN
SELECT u.idUsuario, u.nome, e.email 
FROM Usuario u 
JOIN Email e ON u.idUsuario = e.fkUsuario;

-- SELECT com JOIN e WHERE
SELECT u.idUsuario, u.nome, e.email 
FROM Usuario u 
JOIN Email e ON u.idUsuario = e.fkUsuario
WHERE u.nome = 'João';

-- SELECT com JOIN e CASE
SELECT u.idUsuario, u.nome, e.email,
       CASE WHEN u.fkGerente IS NULL THEN 'Não Gerenciado' ELSE 'Gerenciado' END AS status_gerente
FROM Usuario u 
JOIN Email e ON u.idUsuario = e.fkUsuario;

