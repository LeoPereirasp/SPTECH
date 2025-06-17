-- EXERCÍCIO 1 --

-- CRIE UM BANCO DE DADOS 'sprint1'. 
CREATE DATABASE sprint1;

-- UTILIZAR O BANCO DE DADOS CRIADO
USE sprint1;

-- CRIAR A TABELA 'atleta'
CREATE TABLE atleta (
idAtleta INT PRIMARY KEY,
nome VARCHAR(40),
modalidade VARCHAR(40),
qtdMedalha INT
);

-- INSERIR OS DADOS
INSERT INTO atleta VALUES
('9', 'Jonathan Calleri', 'Futebol', '4'),
('10', 'Lionel Messi', 'Futebol', '44'),
('1', 'Bruninho', 'Voleibol', '21'),
('19', 'Lucarelli', 'Voleibol', '14'),
('23', 'LeBron James', 'Basquete', '8'),
('30', 'Sthephen Curry', 'Basquete', '17');

-- a) EXIBIR TODOS OS DADOS TABELA.
SELECT * FROM atleta;

-- b) EXIBIR APENAS OS NOMES E QUANTIDADE DE MEDALHAS DOS ATLETAS.
SELECT nome, qtdMedalha FROM atleta;

-- c) EXIBIR APENAS OS DADOS DOS ATLETAS DE UMA DETERMINADA MODALIDADE.
SELECT * FROM atleta WHERE modalidade = 'Futebol';

-- d) EXIBIR OS DADOS DA TABELA ORDENADOS PELA MODALIDADE.
SELECT * FROM atleta ORDER BY modalidade;

-- e) EXIBIR OS DADOS DA TABELA, ORDENADOS PELA QUANTIDADE DE MEDALHAS, EM ORDEM DECRESCENTE.
SELECT * FROM atleta ORDER BY qtdMedalha DESC;

-- f) EXIBIR OS DADOS DA TABELA, DOS ATLETAS CUJO NOME CONTENHA A LETRA S.
SELECT * FROM atleta WHERE nome LIKE '%s%';

-- g) EXIBIR OS DADOS DA TABELA, DOS ATLETAS CUJO NOME COMECE COM UMA DETERMINADA LETRA. NESSE CASO USAREI 'L'.
SELECT * FROM atleta WHERE nome LIKE 'L%';

-- h) EXIBIR OS DADOS DA TABELA, DOS ATLETAS CUJO NOME TERMINE COM A LETRA O.
SELECT * FROM atleta WHERE nome LIKE '%o';

-- i) EXIBIR OS DADOS DA TABELA, DOS ATLETAS CUJO NOME TENHA A PENÚLTIMA LETRA R.
SELECT * FROM atleta WHERE nome LIKE '%r_';

-- j) ELIMINAR A TABELA.
DROP TABLE atleta;

-- EXERCÍCIO 2 --

-- UTILIZAR O BANCO DE DADOS 'sprint1'
USE sprint1;

-- CRIE A TABELA 'musica'
CREATE TABLE musica(
idMusica INT PRIMARY KEY,
titulo VARCHAR(40),
artista VARCHAR(40),
genero VARCHAR(40)
);

-- INSERIR OS DADOS
INSERT INTO musica VALUES
('1', 'Evidências', 'Chitãozinho & Xororó', 'Sertanejo'),
('2', 'Sinônimos', 'Chitãozinho & Xororó', 'Sertanejo'),
('3', 'Até Que Durou', 'Péricles', 'Pagode'),
('4', 'Melhor Eu IR', 'Péricles', 'Pagode'),
('5', 'Carry on Wayward Son', 'Kansas', 'Rock'),
('6', 'Something In The Way', 'Nirvana', 'Rock'),
('7', 'Zeca Pagodinho', 'Deixa a Vida Me Levar', 'Samba'),
('8', 'Lancinho', 'Turma do Pagode', 'Samba');

-- a) EXIBIR TODOS OS DADOS DA TABELA.
SELECT * FROM musica;

-- b) EXIBIR APENAS OS TÍTULOS E OS ARTISTAS DAS MÚSICAS.
SELECT titulo, artista FROM musica;

-- c) EXIBIR APENAS OS DADOS DAS MÚSICAS DE UM DETERMINADO GÊNERO.
SELECT * FROM musica WHERE genero = 'Sertanejo';

-- d) EXIBIR APENAS OS DADOS DAS MÚSICAS DE UM DETERMINADO ARTISTA.
SELECT * FROM musica WHERE artista = 'Péricles';

-- e) EXIBIR OS DADOS DA TABELA ORDENADOS PELO TÍTULO DA MÚSICA.
SELECT * FROM musica ORDER BY titulo;

-- f) EXIBIR OS DADOS DA TABELA ORDENADOS PELO ARTISTA EM ORDEM DECRESCENTE.
SELECT * FROM musica ORDER BY artista DESC;

-- g) EXIBIR OS DADOS DA TABELA, DAS MÚSICAS CUJO TÍTULO COMECE COM UMA DETERMINADA LETRA. NESSE CASO USAREI 'S'.
SELECT * FROM musica WHERE titulo LIKE 'S%';

-- h) EXIBIR OS DADOS DA TABELA, DAS MÚSICAS CUJO ARTISTA TERMINE COM UMA DETERMINADA LETRA. NESSE CASO USAREI 'S'.
SELECT * FROM musica WHERE artista LIKE '%S';

-- i) EXIBIR OS DADOS DA TABELA, DAS MÚSICAS CUJO GÊNERO TENHA COMO SEGUNDA LETRA UMA DETERMINADA LETRA. NESSE CASO USAREI 'A'.
SELECT * FROM musica WHERE genero LIKE '_A%';

-- j) EXIBIR OS DADOS DA TABELA, DAS MÚSICAS CUJO TÍTULO TENHA COMO PENÚLTIMA LETRA UMA DETERMINADA LETRA. NESSE CASO USAREI 'H'.
SELECT * FROM musica WHERE titulo LIKE '%H_';

-- k) ELIMINAR A TABELA.
DROP TABLE musica;

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

-- b) EXIBIR APENAS OS TÍTULOS E OS DIRETORES DOS FILMES.
SELECT titulo, diretor FROM filme;

-- c) EXIBIR APENAS OS DADOS DOS FILMES DE UM DETERMINADO GÊNERO.
SELECT * FROM filme WHERE genero = 'Comédia';

-- d) EXIBIR APENAS OS DADOS DOS FILMES DE UM DETERMINADO DIRETOR.
SELECT * FROM filme WHERE diretor = 'Michael Bay';

-- e) EXIBIR OS DADOS DA TABELA ORDENADOS PELO TÍTULO DO FILME.
SELECT * FROM filme ORDER BY titulo;

-- f) EXIBIR OS DADOS DA TABELA ORDENADOS PELO DIRETOR EM ORDEM DECRESCENTE.
SELECT * FROM filme ORDER BY diretor DESC;

-- g) EXIBIR OS DADOS DA TABELA, DOS FILMES CUJO TÍTULO COMECE COM UMA DETERMINADA LETRA. NESSE CASO USAREI 'B'.
SELECT * FROM filme WHERE titulo LIKE 'B%';

-- h) EXIBIR OS DADOS DA TABELA, DOS FILMES CUJO DIRETOR TERMINE COM UMA DETERMINADA LETRA. NESSE CASO USAREI 'I'.
SELECT * FROM filme WHERE diretor LIKE '%I';

-- i) EXIBIR OS DADOS DA TABELA, DOS FILMES CUJO GÊNERO TENHA COMO SEGUNDA LETRA UMA DETERMINADA LETRA. NESSE CASO USAREI 'E'.
SELECT * FROM filme WHERE genero LIKE '_E%';

-- j) EXIBIR OS DADOS DA TABELA, DOS FILMES CUJO TÍTULO TENHA COMO PENÚLTIMA LETRA UMA DETERMINADA LETRA. NESSE CASO USAREI 'L'.
SELECT * FROM filme WHERE titulo LIKE '%L_';

-- k) ELIMINAR A TABELA.
DROP TABLE filme;

-- EXERCÍCIO 4 --

-- UTILIZAR O BANCO DE DADOS 'sprint1'
USE sprint1;

-- CRIE A TABELA 'professor'
CREATE TABLE professor(
idProfessor INT PRIMARY KEY,
nome VARCHAR(50),
especialidade VARCHAR(40),
dtNasc DATE
);

-- INSERIR OS DADOS
INSERT INTO professor VALUES
('12', 'JP', 'Algoritmos', '1993-12-01'),
('2', 'Viviane', 'Biologia', '1987-10-08'),
('8', 'Marcio', 'Matemática', '1996-02-15'),
('24', 'Mauricio', 'Língua Portuguesa', '1981-03-18'),
('42', 'Paula', 'Química', '1989-07-07'),
('62', 'Frizza', 'Matemática', '1969-01-19');

-- a) EXIBIR TODOS OS DADOS DA TABELA PROFESSOR.
SELECT * FROM professor;

-- b) EXIBIR APENAS AS ESPECIALIDADES DOS PROFESSORES.
SELECT especialidade FROM professor;

-- c) EXIBIR APENAS OS DADOS DOS PROFESSORES DE UMA DETERMINADA ESPECIALIDADE.
SELECT * FROM professor WHERE especialidade = 'Matemática';

-- d) EXIBIR OS DADOS DA TABELA ORDENADOS PELO NOME DO PROFESSOR.
SELECT * FROM professor ORDER BY nome;

-- e) EXIBIR OS DADOS DA TABELA ORDENADOS PELA DATA DE NASCIMENTO DO PROFESSOR EM ORDEM DECRESCENTE.
SELECT * FROM professor ORDER BY dtNasc DESC;

-- f) EXIBIR OS DADOS DA TABELA, DOS PROFESSORES CUJO NOME COMECE COM UMA DETERMINADA LETRA. NESSE CASO USAREI 'M'.
SELECT * FROM professor WHERE nome LIKE 'M%';

-- g) EXIBIR OS DADOS DA TABELA, DOS PROFESSORES CUJO NOME TERMINE COM UMA DETERMINADA LETRA. NESSE CASO USAREI '0'.
SELECT * FROM professor WHERE nome LIKE '%O';

-- h) EXIBIR OS DADOS DA TABELA, DOS PROFESSORES CUJO NOME TENHA COMO SEGUNDA LETRA UMA DETERMINADA LETRA. NESSE CASO USAREI 'I'.
SELECT * FROM professor WHERE nome LIKE '_I%';

-- i) EXIBIR OS DADOS DA TABELA, DOS PROFESSORES CUJO NOME TENHA COMO PENÚLTIMA LETRA UMA DETERMINADA LETRA. NESSE CASO USAREI 'Z'.
SELECT * FROM professor WHERE nome LIKE '%Z_';

-- j) ELIMINE A TABELA.
DROP TABLE professor;

-- EXERCÍCIO 5 --

-- UTILIZAR O BANCO DE DADOS 'sprint1'
USE sprint1;

-- CRIE A TABELA 'jogo'
CREATE TABLE jogo(
idJogo INT PRIMARY KEY,
nome VARCHAR(50),
comentario VARCHAR(200),
ranking INT
);

-- INSERIR OS DADOS
INSERT INTO jogo VALUES
(1, 'GTA V (Grand Theft Auto V)', 'Um jogo de mundo aberto com uma narrativa envolvente e ação intensa em Los Santos.', 4),
(2, 'Minecraft', 'Um jogo sandbox onde você pode criar, explorar e sobreviver em um mundo de blocos.', 6),
(3, 'FIFA', 'A maior franquia de simuladores de futebol, com várias edições e atualizações anuais.', 1),
(4, 'LEGO Indiana Jones', 'Um jogo de aventura onde você controla Indiana Jones em mundos feitos de peças LEGO.', 2),
(5, 'Sniper Elite 4', 'Jogo de tiro em terceira pessoa focado em mecânicas de sniping durante a Segunda Guerra Mundial.', 3),
(6, 'Red Dead Redemption', 'Aventura épica ambientada no Velho Oeste com uma narrativa cinematográfica e mundo aberto imersivo.', 5);

-- a) EXIBIR TODOS OS DADOS DA TABELA.
SELECT * FROM jogo;

-- b) EXIBIR APENAS OS NOMES DOS JOGOS.
SELECT nome FROM jogo;

-- c) EXIBIR APENAS O COMENTÁRIO DE UM DETERMINADO JOGO.
SELECT comentario FROM jogo WHERE nome = 'FIFA';

-- d) EXIBIR OS DADOS DA TABELA ORDENADOS PELO NOME DO JOGO.
SELECT * FROM jogo ORDER BY nome;

-- e) EXIBIR OS DADOS DA TABELA ORDENADOS PELO RANKING EM ORDEM DECRESCENTE.
SELECT * FROM jogo ORDER BY ranking DESC;

-- f) EXIBIR OS DADOS DA TABELA, DOS JOGOS CUJO NOME COMECE COM UMA DETERMINADA LETRA. NESSE CASO USAREI 'R'.
SELECT * FROM jogo WHERE nome LIKE 'R%';

-- g) EXIBIR OS DADOS DA TABELA, DOS JOGOS CUJO NOME TERMINE COM UMA DETERMINADA LETRA. NESSE CASO USAREI 'S'.
SELECT * FROM jogo WHERE nome LIKE '%S';

-- h) EXIBIR OS DADOS DA TABELA, DOS JOGOS CUJO NOME TENHA COMO SEGUNDA LETRA UMA DETERMINADA LETRA. NESSE CASO USAREI 'I'.
SELECT * FROM jogo WHERE nome LIKE '_I%'; 

-- i) EXIBIR OS DADOS DA TABELA, DOS JOGOS CUJO NOME TENHA COMO PENÚLTIMA LETRA UMA DETERMINADA LETRA. NESSE CASO USAREI 'F'.
SELECT * FROM jogo WHERE nome LIKE '%F_';

-- j) EXIBIR OS DADOS DA TABELA, DOS JOGOS CUJO NOME SEJA DIFERENTE DE MINECRAFT.
SELECT * FROM jogo WHERE nome != 'Minecraft';

-- k) ELIMINE A TABELA.
DROP TABLE jogo;








