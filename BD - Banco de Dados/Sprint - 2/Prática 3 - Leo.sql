-- Criar o banco de dados e utilizá-lo
CREATE DATABASE Sprint2;

-- Exercício 1

USE Sprint2;

-- Criar a tabela Atleta
CREATE TABLE Atleta (
    idAtleta INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    modalidade VARCHAR(40),
    qtdMedalha INT
);

-- Inserir dados na tabela Atleta
INSERT INTO Atleta (nome, modalidade, qtdMedalha) VALUES
('Usain Bolt', 'Atletismo', 8),
('Carl Lewis', 'Atletismo', 9),
('Michael Phelps', 'Natação', 23),
('Ryan Lochte', 'Natação', 12),
('Neymar', 'Futebol', 2);

-- Criar a tabela País
CREATE TABLE Pais (
    idPais INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    capital VARCHAR(40)
);

-- Inserir dados na tabela País
INSERT INTO Pais (nome, capital) VALUES
('Jamaica', 'Kingston'),
('Estados Unidos', 'Washington'),
('Brasil', 'Brasília'),
('França', 'Paris');

-- Adicionar chave estrangeira na tabela Atleta para associá-los a um país
ALTER TABLE Atleta ADD COLUMN idPais INT;
ALTER TABLE Atleta ADD CONSTRAINT fk_atleta_pais FOREIGN KEY (idPais) REFERENCES Pais(idPais);

-- Atualizar o país de todos os atletas
UPDATE Atleta SET idPais = 1 WHERE idAtleta = 1;
UPDATE Atleta SET idPais = 2 WHERE idAtleta = 2;
UPDATE Atleta SET idPais = 2 WHERE idAtleta = 3;
UPDATE Atleta SET idPais = 2 WHERE idAtleta = 4;
UPDATE Atleta SET idPais = 3 WHERE idAtleta = 5;

-- Exibir os atletas e seu respectivo país
SELECT Atleta.*, Pais.nome AS nomePais
FROM Atleta
JOIN Pais ON Atleta.idPais = Pais.idPais;

-- Exibir apenas o nome do atleta e o nome do respectivo país
SELECT Atleta.nome AS Atleta, Pais.nome AS Pais
FROM Atleta
JOIN Pais ON Atleta.idPais = Pais.idPais;

-- Exibir os dados dos atletas, seus respectivos países, de uma determinada capital
SELECT Atleta.*, Pais.nome AS nomePais, Pais.capital
FROM Atleta
JOIN Pais ON Atleta.idPais = Pais.idPais
WHERE Pais.capital = 'Washington';

-- Exercício 2

-- Usar o banco de dados sprint2
USE Sprint2;

-- Criar a tabela Album 
CREATE TABLE Album (
    idAlbum INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    tipo VARCHAR(10),
    dtLancamento DATE,
    CONSTRAINT check_tipo CHECK (tipo IN ('Digital', 'Físico'))
);

-- Criar a tabela Musica
CREATE TABLE Musica (
    idMusica INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40),
    fkAlbum INT,
    CONSTRAINT fk_musica_album FOREIGN KEY (fkAlbum) REFERENCES Album(idAlbum)
);

-- Inserir dados na tabela Album
INSERT INTO Album (nome, tipo, dtLancamento) VALUES
('A Night at the Opera', 'Físico', '1975-11-21'),
('After Hours', 'Digital', '2020-03-20');

-- Inserir dados na tabela Musica
INSERT INTO Musica (titulo, artista, genero, fkAlbum) VALUES
('Bohemian Rhapsody', 'Queen', 'Rock', 1),
('Don’t Stop Me Now', 'Queen', 'Rock', 1),
('Blinding Lights', 'The Weeknd', 'Pop', 2);

-- Exibir os dados das tabelas separadamente
SELECT * FROM Musica;
SELECT * FROM Album;

-- Exibir as músicas e seus respectivos álbuns
SELECT Musica.*, Album.nome AS nomeAlbum
FROM Musica
JOIN Album ON Musica.fkAlbum = Album.idAlbum;

-- Exibir somente o título da música e o nome do seu respectivo álbum
SELECT Musica.titulo AS Musica, Album.nome AS Album
FROM Musica
JOIN Album ON Musica.fkAlbum = Album.idAlbum;

-- Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo (Exemplo: Digital)
SELECT Musica.*, Album.nome AS nomeAlbum, Album.tipo
FROM Musica
JOIN Album ON Musica.fkAlbum = Album.idAlbum
WHERE Album.tipo = 'Digital';

-- Exercício 3

-- Usar o banco de dados sprint2
USE Sprint2;

-- Criar a tabela Pessoa
CREATE TABLE Pessoa (
    idPessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11) UNIQUE
);

-- Criar a tabela Reserva
CREATE TABLE Reserva (
    idReserva INT PRIMARY KEY AUTO_INCREMENT,
    dtReserva DATETIME,
    dtRetirada DATETIME,
    dtDevolucao DATETIME,
    fkPessoa INT NOT NULL,
    CONSTRAINT fk_reserva_pessoa FOREIGN KEY (fkPessoa) REFERENCES Pessoa(idPessoa)
);

-- Inserir registros na tabela Pessoa
INSERT INTO Pessoa (nome, cpf) VALUES
('Carlos Silva', '12345678901'),
('Mariana Souza', '23456789012'),
('Fernando Lima', '34567890123'),
('Ana Beatriz', '45678901234'),
('Rafael Costa', '56789012345');

-- Inserir registros na tabela Reserva
INSERT INTO Reserva (dtReserva, dtRetirada, dtDevolucao, fkPessoa) VALUES
('2025-03-20 10:00:00', '2025-03-21 14:00:00', '2025-03-25 18:00:00', 1),
('2025-03-21 11:30:00', '2025-03-22 16:00:00', '2025-03-26 19:00:00', 2),
('2025-03-22 12:45:00', '2025-03-23 17:00:00', '2025-03-27 20:00:00', 3),
('2025-03-23 13:15:00', '2025-03-24 18:00:00', '2025-03-28 21:00:00', 4),
('2025-03-24 14:30:00', '2025-03-25 19:00:00', NULL, 5); -- Deixando uma devolução como NULL para teste de IFNULL

-- Exibir todos os dados das tabelas separadamente
SELECT * FROM Pessoa;
SELECT * FROM Reserva;

-- Exibir dados com alias (AS)
SELECT p.nome AS NomePessoa, 
    r.dtReserva AS DataReserva, 
    r.dtRetirada AS DataRetirada, 
    r.dtDevolucao AS DataDevolucao
FROM Pessoa p
JOIN Reserva r ON p.idPessoa = r.fkPessoa;

-- Exibir dados com CASE (Exemplo: Categorizar reservas com base na data de retirada)
SELECT p.nome, 
    r.dtReserva, 
    r.dtRetirada, 
    r.dtDevolucao,
    CASE 
        WHEN r.dtRetirada < '2025-03-23' THEN 'Retirada Antecipada'
        WHEN r.dtRetirada BETWEEN '2025-03-23' AND '2025-03-25' THEN 'Retirada no Prazo'
        ELSE 'Retirada Atrasada'
    END AS StatusRetirada
FROM Pessoa p
JOIN Reserva r ON p.idPessoa = r.fkPessoa;

-- Exibir dados com IFNULL 
SELECT p.nome AS NomePessoa, 
    r.dtReserva, 
    r.dtRetirada, 
    IFNULL(r.dtDevolucao, 'Data não registrada') AS DataDevolucao
FROM Pessoa p
JOIN Reserva r ON p.idPessoa = r.fkPessoa;

-- Exercício 4

-- Usar o banco de dados sprint2
USE Sprint2;

-- Criar a tabela Pessoa1
CREATE TABLE Pessoa1 (
    idPessoa1 INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    dtNascimento DATE NOT NULL
);

-- Criar a tabela Pessoa2 com chave estrangeira referenciando Pessoa1
CREATE TABLE Pessoa2 (
    idPessoa2 INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    dtNascimento DATE NOT NULL,
    fkPessoa1 INT NOT NULL,
    CONSTRAINT fk_pessoa2_pessoa1 FOREIGN KEY (fkPessoa1) REFERENCES Pessoa1(idPessoa1)
);

-- Inserir registros na tabela Pessoa1
INSERT INTO Pessoa1 (nome, dtNascimento) VALUES
('Carlos Silva', '1985-04-12'),
('Mariana Souza', '1990-07-23'),
('Fernando Lima', '1995-02-15'),
('Ana Beatriz', '1988-09-30'),
('Rafael Costa', '2000-01-10');

-- Inserir registros na tabela Pessoa2, associando com Pessoa1
INSERT INTO Pessoa2 (nome, dtNascimento, fkPessoa1) VALUES
('Julia Mendes', '2005-06-22', 1),
('Roberto Farias', '1998-11-05', 2),
('Tatiane Lopes', '2003-12-08', 3),
('Eduardo Martins', '2010-05-18', 4),
('Beatriz Nunes', '2015-09-25', 5);

-- Exibir todos os dados das tabelas separadamente
SELECT * FROM Pessoa1;
SELECT * FROM Pessoa2;

-- Exibir dados com alias (AS)
SELECT 
    p1.nome AS NomePessoa1, 
    p2.nome AS NomePessoa2, 
    p2.dtNascimento AS DataNascimentoPessoa2
FROM Pessoa1 p1
JOIN Pessoa2 p2 ON p1.idPessoa1 = p2.fkPessoa1;

-- Exibir dados com CASE (Exemplo: Classificar pessoas pela idade)
-- Exibir dados com CASE (Exemplo: Classificar pessoas pela idade)
SELECT 
    p2.nome AS NomePessoa2, 
    p2.dtNascimento AS DataNascimento,
    CASE 
        WHEN p2.dtNascimento > '2007-03-23' THEN 'Menor de Idade'  -- 18 anos atrás a partir de 2025-03-23
        ELSE 'Maior de Idade'
    END AS ClassificacaoIdade
FROM Pessoa2 p2;

-- Exibir dados com IFNULL (Caso alguma data de nascimento seja NULL)
SELECT 
    p2.nome AS NomePessoa2, 
    IFNULL(p2.dtNascimento, 'Data não registrada') AS DataNascimento
FROM Pessoa2 p2;

-- Exercício 5

USE sprint2;

-- 1. Criar a Candidato
CREATE TABLE Candidato (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    categoria VARCHAR(10) NOT NULL
);

-- Criar a tabela Habilitação
CREATE TABLE Habilitacao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    candidato_id INT,
    validade DATE NOT NULL,
    FOREIGN KEY (candidato_id) REFERENCES Candidato(id)
);

-- 2. Inserir 5 registros
INSERT INTO Candidato (nome, idade, categoria) VALUES
('João Silva', 22, 'A'),
('Maria Oliveira', 19, 'B'),
('Pedro Santos', 25, 'A'),
('Ana Lima', 21, 'B'),
('Lucas Pereira', 30, 'A');

INSERT INTO Habilitacao (candidato_id, validade) VALUES
(1, '2024-10-01'),
(2, '2024-10-01'),
(3, '2024-10-01'),
(4, '2024-10-01'),
(5, '2024-10-01');

-- 3. Configurar chave estrangeira
-- Chave já foi configurada na criação da tabela Habilitação

-- 4. Exibir dados
SELECT * FROM Candidato;
SELECT * FROM Habilitacao;

-- 5. Exibir dados com AS
SELECT id AS CandidatoID, nome AS NomeCandidato, idade AS IdadeCandidato FROM Candidato;

SELECT h.id AS HabilitacaoID, c.nome AS NomeCandidato, h.validade AS Validade FROM Habilitacao h
JOIN Candidato c ON h.candidato_id = c.id;

-- 6. Exibir dados com CASE
SELECT id,
       nome,
       CASE
           WHEN categoria = 'A' THEN 'Motocicleta'
           WHEN categoria = 'B' THEN 'Automóvel'
           ELSE 'Categoria Desconhecida'
       END AS TipoCategoria
FROM Candidato;

-- Exibir dados com IFNULL

SELECT h.id AS HabilitacaoID, 
       IFNULL(c.nome, 'Nome não disponível') AS NomeCandidato, 
       IFNULL(h.validade, 'Data não disponível') AS Validade
FROM Habilitacao h
JOIN Candidato c ON h.candidato_id = c.id;

-- Exercício 6

USE sprint2;

-- Criar a tabela Endereco
CREATE TABLE Endereco (
    idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(50),
    cidade VARCHAR(40),
    estado VARCHAR(20)
);

-- Criar a tabela Farmacia
CREATE TABLE Farmacia (
    idFarmacia INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    fkEndereco INT UNIQUE, -- Relacionamento 1 para 1
    CONSTRAINT fk_farmacia_endereco FOREIGN KEY (fkEndereco) REFERENCES Endereco(idEndereco)
);

-- Criar a tabela Farmaceutico
CREATE TABLE Farmaceutico (
    idFarmaceutico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    especialidade VARCHAR(40),
    fkFarmacia INT, -- Relacionamento 1 para N
    CONSTRAINT fk_farmaceutico_farmacia FOREIGN KEY (fkFarmacia) REFERENCES Farmacia(idFarmacia)
);

-- Inserir registros na tabela Endereco
INSERT INTO Endereco (rua, cidade, estado) VALUES
('Rua A', 'São Paulo', 'SP'),
('Rua B', 'Rio de Janeiro', 'RJ'),
('Rua C', 'Belo Horizonte', 'MG'),
('Rua D', 'Curitiba', 'PR'),
('Rua E', 'Porto Alegre', 'RS');

-- Inserir registros na tabela Farmacia
INSERT INTO Farmacia (nome, fkEndereco) VALUES
('Farmácia Vida', 1),
('Drogaria Saúde', 2),
('Farmácia Bem-Estar', 3),
('Drogaria Popular', 4),
('Farmácia Central', 5);

-- Inserir registros na tabela Farmaceutico
INSERT INTO Farmaceutico (nome, especialidade, fkFarmacia) VALUES
('Carlos Silva', 'Manipulação', 1),
('Mariana Souza', 'Homeopatia', 2),
('Fernando Lima', 'Farmácia Clínica', 3),
('Ana Beatriz', 'Bioquímica', 4),
('Rafael Costa', 'Análises Clínicas', 5);

-- Exibir todos os dados das tabelas separadamente
SELECT * FROM Endereco;
SELECT * FROM Farmacia;
SELECT * FROM Farmaceutico;

-- Exibir dados com alias (AS)
SELECT f.nome AS Nome_Farmacia, e.rua AS Rua, e.cidade AS Cidade, e.estado AS Estado
FROM Farmacia f
JOIN Endereco e ON f.fkEndereco = e.idEndereco;

-- Exibir dados com CASE (Exemplo: Categorizar farmacêuticos por especialidade)
SELECT nome, especialidade,
    CASE 
        WHEN especialidade = 'Manipulação' THEN 'Área Técnica'
        WHEN especialidade = 'Homeopatia' THEN 'Área Alternativa'
        WHEN especialidade = 'Farmácia Clínica' THEN 'Área Hospitalar'
        ELSE 'Outra Área'
    END AS Categoria
FROM Farmaceutico;

-- Exibir dados com IFNULL
SELECT f.nome AS Farmaceutico, 
    IFNULL(
        (SELECT nome FROM Farmacia WHERE idFarmacia = f.fkFarmacia), 
        'Não Vinculado'
    ) AS Farmacia
FROM Farmaceutico f;



