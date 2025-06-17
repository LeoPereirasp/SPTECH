-- EXERCÍCIO 1 --

-- CRIE UM BANCO DE DADOS 'sprint1'. 
CREATE DATABASE sprint1;

-- UTILIZAR O BANCO DE DADOS CRIADO
USE sprint1;

-- CRIAR A TABELA 'atleta'
CREATE TABLE atleta (
idAtleta INT PRIMARY KEY auto_increment,
nome VARCHAR(40),
modalidade VARCHAR(40),
qtdMedalha INT
);

-- INSERIR OS DADOS
INSERT INTO atleta VALUES
( default, 'Jonathan Calleri', 'Futebol', 4),
( default, 'Lionel Messi', 'Futebol', 44),
( default, 'Bruninho', 'Voleibol', 21),
( default, 'Lucarelli', 'Voleibol', 14),
( default, 'LeBron James', 'Basquete', 8),
( default, 'Sthephen Curry', 'Basquete', 17);

-- a) EXIBIR TODOS OS DADOS TABELA.
SELECT * FROM atleta;

-- b) ATUALIZAR A QUANTIDADE DE MEDALHAS DO ATLETA COM ID=1;
UPDATE atleta SET qtdmedalha = 7
	WHERE IdAtleta = 1;  

-- c) ATUALIZAR A QUANTIDADE DE MEDALHAS DO ATLETA COM ID=2 E COM O ID=3;
UPDATE atleta SET qtdMedalha = 47 WHERE IdAtleta IN (2,3);

-- d) ATUALIZAR O NOME DO ATLETA COM O ID=4;
UPDATE atleta SET nome = 'Serginho'
	WHERE idAtleta = 4;

-- e) ADICIONAR O CAMPO DTNASC NA TABELA, COM A DATA DE NASCIMENTO DOS ATLETAS, TIPO DATE;
ALTER TABLE atleta ADD COLUMN dtnasc DATE;

-- f) ATUALIZAR A DATA DE NASCIMENTO DE TODOS OS ATLETAS;
UPDATE atleta SET dtnasc = '1993-09-23'
	WHERE idAtleta = 1;
UPDATE atleta SET dtnasc = '1987-06-24'
	WHERE idAtleta = 2;
UPDATE atleta SET dtnasc = '1986-07-02'
	WHERE idAtleta = 3;    
UPDATE atleta SET dtnasc = '1975-10-15'
	WHERE idAtleta = 4;
UPDATE atleta SET dtnasc = '1984-12-30'
	WHERE idAtleta = 5;
UPDATE atleta SET dtnasc = '1988-03-14'
	WHERE idAtleta = 6; 
    
-- g) EXCLUIR O ATLETA COM O ID=5;
DELETE FROM atleta WHERE idAtleta = 5;

-- h) EXIBIR OS ATLETAS ONDE A MODALIDADE É DIFERENTE DE NATAÇÃO; NESSE CASO UTILIZAREI 'BASQUETE', POIS NÃO POSSUO 'NATAÇÃO' NA TABELA.
SELECT * FROM atleta WHERE modalidade != 'Basquete';

-- i) EXIBIR OS DADOS DOS ATLETAS QUE TEM A QUANTIDADE DE MEDALHAS MAIOR OU IGUAL A 3;
SELECT * FROM atleta WHERE qtdMedalha >=15;

-- j) MODIFICAR O CAMPO MODALIDADE DO TAMANHO 40 PARA O TAMANHO 60;
ALTER TABLE atleta MODIFY COLUMN modalidade VARCHAR(60);

-- k) DESCREVER OS CAMPOS DA TABELA MOSTRANDO A ATUALIZAÇÃO DO CAMPO MODALIDADE;
DESCRIBE atleta;

-- l) LIMPAR OS DADOS DA TABELA;
TRUNCATE TABLE atleta;

-- EXERCÍCIO 2 --

-- UTILIZAR O BANCO DE DADOS 'sprint1'
USE sprint1;

-- CRIE A TABELA 'musica'
CREATE TABLE musica(
idMusica INT PRIMARY KEY auto_increment,
titulo VARCHAR(40),
artista VARCHAR(40),
genero VARCHAR(40)
);

-- INSERIR OS DADOS
INSERT INTO musica VALUES
(default, 'Evidências', 'Chitãozinho & Xororó', 'Sertanejo'),
(default, 'Sinônimos', 'Chitãozinho & Xororó', 'Sertanejo'),
(default, 'Até Que Durou', 'Péricles', 'Pagode'),
(default, 'Melhor Eu IR', 'Péricles', 'Pagode'),
(default, 'Carry on Wayward Son', 'Kansas', 'Rock'),
(default, 'Something In The Way', 'Nirvana', 'Rock'),
(default, 'Zeca Pagodinho', 'Deixa a Vida Me Levar', 'Samba'),
(default, 'Lancinho', 'Turma do Pagode', 'Samba');

-- a) EXIBIR TODOS OS DADOS DA TABELA.
SELECT * FROM musica;

-- b) ADICIONAR O CAMPO CURTIDAS DO TIPO INT NA TABELA;
ALTER TABLE musica ADD COLUMN curtidas INT;

-- c) ATUALIZAR O CAMPO CURTIDAS DE TODAS AS MÚSICAS INSERIDAS;
UPDATE musica SET curtidas = 200000
	WHERE idMusica = 1;
UPDATE musica SET curtidas = 455555
	WHERE idMusica = 2;
UPDATE musica SET curtidas = 777777
	WHERE idMusica = 3;
UPDATE musica SET curtidas = 123456
	WHERE idMusica = 4;
UPDATE musica SET curtidas = 767878
	WHERE idMusica = 5;
UPDATE musica SET curtidas = 999998
	WHERE idMusica = 6;
UPDATE musica SET curtidas = 129000
	WHERE idMusica = 7;
UPDATE musica SET curtidas = 667667
	WHERE idMusica = 8;
-- d) MODIFICAR O CAMPO ARTISTA DO TAMANHO 40 PARA O TAMANHO 80;
ALTER TABLE musica MODIFY COLUMN artista VARCHAR(80);

-- e) ATUALIZAR A QUANTIDADE DE CURTIDAS DA MÚSICA COM ID=1;
UPDATE musica SET curtidas = 787887
	WHERE idMusica = 1;
    
-- f) ATUALIZAR A QUANTIDADE DE CURTIDAS DAS MÚSICAS COM ID=2 E COM O ID=3;
UPDATE musica SET curtidas = 343000 
	WHERE idMusica IN (2,3);

-- g) ATUALIZAR O NOME DA MÚSICA COM O ID=5;
UPDATE musica SET titulo = 'Supernatural Music' 
	WHERE idMusica = 5;

-- h) EXCLUIR A MÚSICA COM O ID=4;
DELETE FROM musica WHERE idMusica = 4;

-- i) EXIBIR AS MÚSICAS ONDE O GÊNERO É DIFERENTE DE FUNK; NESSE CASO UTILIZAREI 'ROCK', POIS NÃO POSSUO 'FUNK' NA TABELA.
SELECT * FROM musica WHERE genero !='Rock';

-- j) EXIBIR OS DADOS DAS MÚSICAS QUE TEM CURTIDAS MAIOR OU IGUAL A 20;
SELECT * FROM musica WHERE curtidas >=350000;

-- k) DESCREVER OS CAMPOS DA TABELA MOSTRANDO A ATUALIZAÇÃO DO CAMPO ARTISTA;
DESCRIBE musica;

-- l) LIMPAR OS DADOS DA TABELA;
TRUNCATE TABLE musica;

-- EXERCÍCIO 3 --

-- UTILIZAR O BANCO DE DADOS 'sprint1'
USE sprint1;

-- CRIE A TABELA 'filme'
CREATE TABLE filme(
idFilme INT PRIMARY KEY,
titulo VARCHAR(50),
genero VARCHAR(40),
diretor VARCHAR(40)
);

-- INSERIR OS DADOS
INSERT INTO filme (idfilme, titulo, genero, diretor) VALUES
(1, 'Bad Boys 4', 'Ação', 'Adil El Arbi'),
(2, 'Busca Implacável', 'Ação', 'Pierre Morel'),
(3, 'Se Beber Não Case!', 'Comédia', 'Todd Phillips'),
(4, 'Projeto X - Uma Festa Fora de Controle', 'Comédia', 'Todd Phillips'),
(5, 'Transformers: O Lado Oculto da Lua', 'Ficção Científica', 'Michael Bay'),
(6, 'Transformers: A Vingança dos Derrotados', 'Ficção Científica', 'Michael Bay'),
(7, 'Annabelle', 'Terror', 'John R. Leonetti'),
(8, 'O Abutre', 'Suspense', 'Dan Gilroy');

-- a) EXIBIR TODOS OS DADOS DA TABELA.
SELECT * FROM filme;

-- b) ADICIONAR O CAMPO PROTAGONISTA DO TIPO VARCHAR(50) NA TABELA;
ALTER TABLE filme ADD COLUMN protagonista VARCHAR(50);

-- c) ATUALIZAR O CAMPO PROTAGONISTA DE TODOS OS FILMES INSERIDOS;
UPDATE filme SET protagonista = 'The Rock'
	WHERE idFilme = 1;
UPDATE filme SET protagonista = 'Jason Statham'
	WHERE idFilme = 2;
UPDATE filme SET protagonista = 'Rob Schneider'
	WHERE idFilme = 3;  
UPDATE filme SET protagonista = 'Ben Stiller'
	WHERE idFilme = 4;
UPDATE filme SET protagonista = 'Mark Wahlberg'
	WHERE idFilme = 5;
UPDATE filme SET protagonista = 'Mark Wahlberg'
	WHERE idFilme = 6;
UPDATE filme SET protagonista = 'Margot Robbie'
	WHERE idFilme = 7;
UPDATE filme SET protagonista = 'Ryan Reinolds'
	WHERE idFilme = 8;

-- d) MODIFICAR O CAMPO DIRETOR DO TAMANHO 40 PARA O TAMANHO 150;
ALTER TABLE filme MODIFY diretor VARCHAR(150);

-- e) ATUALIZAR O DIRETOR DO FILME COM ID=5;
UPDATE filme SET diretor = 'Steven Spielberg'
	WHERE idFilme = 5;

-- f) ATUALIZAR O DIRETOR DOS FILMES COM ID=2 E COM O ID=7;
UPDATE filme SET diretor = 'Keanu Reeves'
	WHERE idFilme IN (2,7);

-- g) ATUALIZAR O TÍTULO DO FILME COM O ID=6;
UPDATE filme SET titulo = 'Transformers: A volta dos que não foram'
	WHERE idFilme = 6;

-- h) EXCLUIR O FILME COM O ID=3;
DELETE FROM filme WHERE idFilme = 3;

-- i) EXIBIR OS FILMES EM QUE O GÊNERO É DIFERENTE DE DRAMA; NESSE CASO UTILIZAREI 'COMÉDIA', POIS NÃO POSSUO 'DRAMA' NA TABELA.
SELECT * FROM FILME WHERE genero !='Comédia';

-- j) EXIBIR OS DADOS DOS FILMES QUE O GÊNERO É IGUAL ‘SUSPENSE’;
SELECT * FROM FILME WHERE genero ='Suspense';

-- k) DESCREVER OS CAMPOS DA TABELA MOSTRANDO A ATUALIZAÇÃO DO CAMPO PROTAGONISTA E DIRETOR;
DESCRIBE filme;

-- l) LIMPAR OS DADOS DA TABELA;
TRUNCATE TABLE filme;

-- EXERCÍCIO 4 --

-- UTILIZAR O BANCO DE DADOS 'sprint1'
USE sprint1;

-- CRIE A TABELA 'professor'
CREATE TABLE professor(
idProfessor INT PRIMARY KEY auto_increment,
nome VARCHAR(50),
especialidade VARCHAR(40),
dtNasc DATE
);

-- INSERIR OS DADOS
INSERT INTO professor VALUES
(default , 'JP', 'Algoritmos', '1993-12-01'),
(default , 'Viviane', 'Biologia', '1987-10-08'),
(default , 'Marcio', 'Matemática', '1996-02-15'),
(default , 'Mauricio', 'Língua Portuguesa', '1981-03-18'),
(default , 'Paula', 'Química', '1989-07-07'),
(default , 'Frizza', 'Matemática', '1969-01-19');

-- a) EXIBIR TODOS OS DADOS DA TABELA PROFESSOR.
SELECT * FROM professor;

-- b) ADICIONAR O CAMPO FUNCAO DO TIPO VARCHAR(50), ONDE A FUNÇÃO SÓ PODE SER ‘MONITOR’,‘ASSISTENTE’ OU ‘TITULAR’; USANDO O CHECK.
ALTER TABLE professor ADD COLUMN funcao VARCHAR(50) CHECK (funcao IN ('MONITOR', 'ASSISTENTE', 'TITULAR'));

-- c) ATUALIZAR OS PROFESSORES INSERIDOS E SUAS RESPECTIVAS FUNÇÕES;
UPDATE professor SET funcao = 'TITULAR' WHERE idProfessor IN (5,6);
UPDATE professor SET funcao = 'ASSISTENTE'WHERE idProfessor IN (1,3);
UPDATE professor SET funcao = 'MONITOR' WHERE idProfessor IN (2,4);

-- d) INSERIR UM NOVO PROFESSOR;
INSERT INTO professor (nome, especialidade, dtNasc, funcao) 
VALUES ('Vivian', 'Banco de dados', '1982-06-21', 'TITULAR');

-- e) EXCLUIR O PROFESSOR ONDE O IDPROFESSOR É IGUAL A 5;
DELETE FROM professor WHERE idProfessor = 5;

-- f) EXIBIR APENAS OS NOMES DOS PROFESSORES TITULARES;
SELECT nome FROM professor WHERE funcao = 'TITULAR';

-- g) EXIBIR APENAS AS ESPECIALIDADES E AS DATAS DE NASCIMENTO DOS PROFESSORES MONITORES;
SELECT especialidade, dtNasc FROM professor WHERE funcao = 'MONITOR';

-- h) ATUALIZAR A DATA DE NASCIMENTO DO IDPROFESSOR IGUAL A 3;
 UPDATE professor SET dtNasc = '1989-09-28' WHERE idProfessor = 3;

-- i) LIMPAR A TABELA PROFESSOR;
TRUNCATE TABLE professor;

-- EXERCÍCIO 5 --

-- UTILIZAR O BANCO DE DADOS 'sprint1'
USE sprint1;

-- CRIE A TABELA 'curso'
CREATE TABLE curso(
idCurso INT PRIMARY KEY auto_increment,
nome VARCHAR(50),
sigla VARCHAR(3),
coordenador VARCHAR(30)
);

-- INSERIR OS DADOS
INSERT INTO curso VALUES
(default , 'Análise e Desenvolvimento de Sistemas', 'ADS', 'Gerson'),
(default , 'Ciências da Computação', 'CCO', 'Fernanda'),
(default , 'Sistemas da Informação', 'SIS', 'Alex'),
(default , 'Administração', 'ADM', 'Marcos');

-- a) EXIBIR TODOS OS DADOS DA TABELA PROFESSOR.
SELECT * FROM curso;

-- b) EXIBIR APENAS OS COORDENADORES DOS CURSOS.
SELECT coordenador FROM curso;

-- c) EXIBIR APENAS OS DADOS DOS CURSOS DE UMA DETERMINADA SIGLA. NESSE CASO A SIGLA SERÁ "ADS".
SELECT * FROM curso WHERE sigla = 'ADS';

-- d) EXIBIR OS DADOS DA TABELA ORDENADOS PELO NOME DO CURSO.
SELECT * FROM curso ORDER BY nome;

-- e) EXIBIR OS DADOS DA TABELA ORDENADOS PELO NOME DO COORDENADOR EM ORDEM DECRESCENTE.
SELECT * FROM curso ORDER BY coordenador DESC;

-- f) EXIBIR OS DADOS DA TABELA, DOS CURSOS CUJO NOME COMECE COM UMA DETERMINADA LETRA. NESSE CASO A LETRA SERÁ "C".
SELECT * FROM curso WHERE nome LIKE 'C%';

-- g) EXIBIR OS DADOS DA TABELA, DOS CURSOS CUJO NOME TERMINE COM UMA DETERMINADA LETRA. NESSE CASO A LETRA SERÁ "O".
SELECT * FROM curso WHERE nome LIKE '%O';

-- h) EXIBIR OS DADOS DA TABELA, DOS CURSOS CUJO NOME TENHA COMO SEGUNDA LETRA UMA DETERMINADA LETRA. NESSE CASO A LETRA SERÁ "I".
SELECT * FROM curso WHERE nome LIKE '_I%';

-- i) EXIBIR OS DADOS DA TABELA, DOS CURSOS CUJO NOME TENHA COMO PENÚLTIMA LETRA UMA DETERMINADA LETRA. NESSE CASO A LETRA SERÁ "A".
SELECT * FROM curso WHERE nome LIKE '%A_';

-- j) ELIMINE A TABELA.
DROP TABLE curso;

-- EXERCÍCIO 6 --

-- UTILIZAR O BANCO DE DADOS 'sprint1'
USE sprint1;

-- CRIE A TABELA 'Revista'
CREATE TABLE Revista (
    idRevista INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    categoria VARCHAR(30)
);

-- INSERIR OS DADOS SEM INFORMAR A CATEGORIA
INSERT INTO Revista(nome) VALUES
('Veja'),
('Isto É'),
('Época'),
('Quatro Rodas');

-- a) Exibir todos os dados da tabela
SELECT * FROM Revista;

-- b) ATUALIZE OS DADOS DAS CATEGORIAS DAS 3 REVISTAS INSERIDAS. EXIBIR OS DADOS DA TABELA NOVAMENTE PARA VERIFICAR SE ATUALIZOU CORRETAMENTE.
UPDATE Revista SET categoria = 'Notícias' WHERE idRevista IN (1,2,3);
UPDATE Revista SET categoria = 'Automobilismo' WHERE idRevista = 4;
SELECT * FROM Revista;

-- c) INSIRA MAIS 3 REGISTROS COMPLETOS.
INSERT INTO Revista (nome, categoria) VALUES
('Claudia', 'Moda e Beleza'),
('Superinteressante', 'Ciência'),
('Auto Esporte', 'Automobilismo');

-- d) EXIBIR NOVAMENTE OS DADOS DA TABELA.
SELECT * FROM Revista;

-- e) EXIBIR A DESCRIÇÃO DA ESTRUTURA DA TABELA.
DESC Revista;

-- f) Alterar o tamanho da coluna 'categoria' para 40 caracteres
ALTER TABLE Revista MODIFY categoria VARCHAR(40);

-- g) Exibir novamente a estrutura da tabela para verificar a alteração
DESC Revista;

-- h) ACRESCENTAR A COLUNA PERIODICIDADE À TABELA, QUE É VARCHAR(15).
ALTER TABLE Revista ADD periodicidade VARCHAR(15);

-- i) EXIBIR OS DADOS DA TABELA.
SELECT * FROM Revista;

-- j) EXCLUIR A COLUNA PERIODICIDADE DA TABELA.
ALTER TABLE Revista DROP COLUMN periodicidade;

-- EXERCÍCIO 7 --

-- UTILIZAR O BANCO DE DADOS 'sprint1'
USE sprint1;

-- CRIAR A TABELA 'CARRO' COM IDCARRO INICIANDO EM 1000
CREATE TABLE carro (
    idCarro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    placa CHAR(7)
) AUTO_INCREMENT = 1000;

-- INSERIR DADOS
INSERT INTO carro VALUES
(default, 'Gol', 'ABC1234'),
(default, 'Fusca', 'DEF5678'),
(default, 'Chevy Impala', 'GHI9012'),
(default, 'Camaro', 'JKL3456');

-- a) EXIBIR TODOS OS DADOS DA TABELA.
SELECT * FROM carro;

-- b) INSIRA MAIS 3 REGISTROS SEM A PLACA DOS CARROS.
INSERT INTO carro (nome) VALUES
('Mustang'),
('Celta'),
('Palio');

-- c) EXIBIR NOVAMENTE OS DADOS DA TABELA.
SELECT * FROM carro;

-- d) EXIBIR A DESCRIÇÃO DA ESTRUTURA DA TABELA.
DESC carro;

-- e) ALTERAR A TABELA PARA QUE A COLUNA NOME POSSA TER NO MÁXIMO 28 CARACTERES.
ALTER TABLE carro MODIFY nome VARCHAR(28);

-- f) EXIBIR NOVAMENTE A DESCRIÇÃO DA ESTRUTURA DA TABELA, PARA VERIFICAR SE ALTEROU O TAMANHO DA COLUNA.
DESC carro;

-- g) ACRESCENTAR A COLUNA ANO À TABELA, QUE É CHAR(4).
ALTER TABLE Carro ADD ano CHAR(4);

-- h) ATUALIZAR TODOS OS DADOS NULOS DA TABELA;
UPDATE carro SET placa = 'KLM5C89' WHERE idCarro = '1004';
UPDATE carro SET placa = 'HFP3D67' WHERE idCarro = '1005';
UPDATE carro SET placa = 'YKR7H45' WHERE idCarro = '1006';
UPDATE carro SET ano = '1998' WHERE idCarro = '1000';
UPDATE carro SET ano = '1969' WHERE idCarro = '1001';
UPDATE carro SET ano = '1967' WHERE idCarro = '1002';
UPDATE carro SET ano = '2007' WHERE idCarro = '1003';
UPDATE carro SET ano = '1993' WHERE idCarro = '1004';
UPDATE carro SET ano = '2005' WHERE idCarro = '1005';
UPDATE carro SET ano = '2008' WHERE idCarro = '1006';




