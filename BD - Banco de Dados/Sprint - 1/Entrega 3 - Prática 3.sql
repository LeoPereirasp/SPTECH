-- EXERCÍCIO 1 -- 

CREATE DATABASE game_store;

USE game_store;

CREATE TABLE jogo(
idJogo INT PRIMARY KEY auto_increment,
nmjogo VARCHAR(30),
diretor VARCHAR(30),
genero VARCHAR(30),
dtLancamento DATE,
nota INT,
constraint chkNota
	check(nota between 0 and 10),
quant INT
);

-- 1. INSIRA PELO MENOS 5 REGISTROS PARA A TABELA. 
INSERT INTO jogo VALUES
	(default, 'Red Dead Redemption 2', 'Michael Unsworth', 'Faroeste', '2018-10-26', 9, 5),
	(default, 'The Last of Us Part II', 'Neil Druckmann', 'Ação', '2020-06-19', 10, 0),
	(default, 'God of War', 'Cory Barlog', 'Ação', '2018-04-20', 9, 10),
	(default, 'Cyberpunk 2077', 'Adam Badowski', 'RPG', '2020-12-10', 7, 6),
	(default, 'GTA V', 'Dan Houser', 'Ação', '2013-09-17', 9, 15),
	(default, 'Elden Ring', 'Hidetaka Miyazaki', 'RPG', '2022-02-25', 10, 7);

-- 2. ALTERE A TABELA PARA INSERIR UMA COLUNA QUE REPRESENTE O TIPO DE MÍDIA QUE DEVE ARMAZENAR O TIPO DE JOGO APENAS COM OS VALORES “FÍSICA” OU “DIGITAL”. 
ALTER TABLE jogo ADD COLUMN midia varchar(20) CHECK (midia IN ( 'FÍSICA', 'DIGITAL'));

-- 3. ATUALIZE OS REGISTROS DOS JOGOS INSERIDOS ANTERIORMENTE. 
UPDATE jogo SET midia = 'Física' WHERE idJogo = 1;
UPDATE jogo SET midia = 'Física' WHERE idJogo = 2;
UPDATE jogo SET midia = 'Física' WHERE idJogo = 3;
UPDATE jogo SET midia = 'Digital' WHERE idJogo = 4;
UPDATE jogo SET midia = 'Digital' WHERE idJogo = 5;
UPDATE jogo SET midia = 'Digital' WHERE idJogo = 6;

-- 4. EXIBA APENAS OS JOGOS COM DATA DE LANÇAMENTO A PARTIR DE 2015. 
SELECT * FROM jogo WHERE dtLancamento >= '2015-01-01';

-- 5. EXIBA OS JOGOS QUE TENHAM A LETRA “A” EM SEU NOME E SÃO DE MÍDIA FÍSICA. 
SELECT * FROM jogo WHERE nmjogo LIKE '%A%' AND midia = 'Física';

-- 6. EXIBA OS JOGOS ONDE O NOME DO DIRETOR NÃO CONTENHA A LETRA “E”. 
SELECT * FROM jogo WHERE diretor NOT LIKE'%e%';

-- 7. ALTERE A TABELA PARA CRIAR UMA CHECAGEM NA INSERÇÃO DA NOTA, ONDE O VALOR NÃO PODE SER MENOR QUE 0 E NEM MAIOR QUE 10. 
-- CHECADO NO INÍCIO NA CRIAÇÃO DA TABELA CONFORME O ENUNCIADO;

-- 8. EXIBA OS JOGOS DE UM DETERMINADO GÊNERO E QUE AINDA ESTEJA EM ESTOQUE. 
SELECT * FROM jogo WHERE genero = 'ação' AND quant > 0;

-- 9. EXCLUA OS JOGOS QUE NÃO TÊM MAIS UNIDADES DISPONÍVEIS EM ESTOQUE. 
DELETE FROM jogo WHERE idJogo = 0;

-- 10. RENOMEIE A COLUNA “DIRETOR” PARA “CRIADOR” E EXIBA COMO FICOU A ESTRUTURA DA TABELA.
ALTER TABLE jogo RENAME COLUMN diretor TO criador;
DESC jogo;

-- EXERCÍCIO 2 --

CREATE DATABASE olimpiadas;

USE olimpiadas;

CREATE TABLE esporte (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    categoria VARCHAR(20)
    constraint chkcategoria
		check(categoria IN ('Coletivo', 'Individual')),
    num_jogadores INT,
    estreia DATE,
    pais_origem VARCHAR(30)
);

-- 1. INSIRA PELO MENOS 5 REGISTROS NA TABELA. 
INSERT INTO esporte VALUES
    (default, 'Futebol', 'Coletivo', 11, '1900-10-28', 'Inglaterra'),
    (default, 'Basquete', 'Coletivo', 5, '1936-08-07', 'Estados Unidos'),
    (default, 'Tênis', 'Individual', 1, '1896-04-06', 'França'),
    (default, 'Judô', 'Individual', 1, '1964-10-20', 'Japão'),
    (default, 'Vôlei', 'Coletivo', 6, '2000-10-23', 'Estados Unidos');

-- 2. ALTERE A TABELA PARA ADICIONAR UMA COLUNA POPULARIDADE QUE ARMAZENE A POPULARIDADE DO ESPORTE COMO UM VALOR DECIMAL ENTRE 0 E 10 E EXIBA COMO FICOU A ESTRUTURA DA TABELA.
ALTER TABLE esporte ADD COLUMN popularidade DECIMAL(3,1)
	CONSTRAINT chkpopular CHECK (popularidade between 0 and 10);
DESC esporte;
 
-- 3. ATUALIZE OS REGISTROS PARA DEFINIR A POPULARIDADE DOS ESPORTES INSERIDOS ANTERIORMENTE. 
UPDATE esporte SET popularidade = CASE
	WHEN id = 1 THEN 10
    WHEN id = 2 THEN 7.5
	WHEN id = 3 THEN 4.5
    WHEN id = 4 THEN 5.5
    WHEN id = 5 THEN 6.9
    END
    WHERE id;
    
-- 4. EXIBA OS ESPORTES ORDENADOS POR POPULARIDADE EM ORDEM CRESCENTE. 
SELECT * FROM esporte ORDER BY popularidade ASC;

-- 5. EXIBA APENAS OS ESPORTES QUE ESTREARAM NAS OLIMPÍADAS A PARTIR DO ANO 2000. 
SELECT * FROM esporte WHERE estreia > '2000-01-01';

-- 6. CRIE UMA CHECAGEM PARA QUE NÃO POSSA SER INSERIDO VALORES DENTRO DE ESTREIA QUE SEJA MENOR QUE 06 DE ABRIL DE 1896 E DEPOIS DA DATA ATUAL. 
ALTER TABLE esporte ADD CONSTRAINT chkEstreia CHECK (estreia between '1896-04-06' AND '2025-02-19');

-- 7. ALTERE A TABELA PARA EXCLUIR A REGRA DE INSERÇÃO DE CATEGORIA, ASSIM PODENDO COLOCAR VALORES ALÉM DE "INDIVIDUAL" OU "COLETIVO". 
ALTER TABLE esporte DROP CONSTRAINT chkcategoria;

-- 8. EXIBA APENAS OS ESPORTES CUJO NOME DO PAÍS DE ORIGEM TENHA "A" NA SEGUNDA LETRA. 
SELECT * FROM esporte WHERE pais_origem LIKE '_a%';

-- 9. EXIBA OS DADOS ONDE O NÚMERO DE JOGADORES POR EQUIPE ESTEJA ENTRE 4 E 11. 
SELECT * FROM esporte WHERE num_jogadores BETWEEN 4 AND 11;

-- 10. REMOVA OS REGISTROS ONDE ID SEJA 1, 3 E 5.
DELETE FROM esporte WHERE id IN (1, 3, 5);


-- EXERCÍCIO 3 --

CREATE DATABASE desenho;

USE desenho;

CREATE TABLE desenhos (
    idDesenho INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50),
    dt_Lancamento DATE,
    emissora_Original VARCHAR(50),
    classificacao ENUM('L', '10', '12', '14', '16', '18'),
    statusdesenho VARCHAR(15),
    nota INT,
    CONSTRAINT chkNota CHECK (nota BETWEEN 1 AND 5)
) AUTO_INCREMENT = 10;

-- INSERIR DADOS
INSERT INTO desenhos (titulo, dt_Lancamento, emissora_Original, classificacao, statusdesenho, nota) 
VALUES 
    ('Scooby-Doo', '1969-09-13', 'Hanna-Barbera', '10', 'exibindo', 4),
    ('Tom e Jerry', '1940-02-10', 'MGM', '10', 'exibindo', 5),
    ('Pica-Pau', '1940-05-09', 'Walter Lantz', '12', 'exibindo', 4),
    ('Dragon Ball Z', '1989-04-26', 'Toei Animation', '14', 'finalizado', 5),
    ('Os Flintstones', '1960-09-30', 'Hanna-Barbera', '10', 'cancelado', 3);

-- 1.EXIBIR TODOS OS DADOS DA TABELA. 
SELECT * FROM desenhos;

-- 2. EXIBIR TODOS OS DESENHOS COM A CLASSIFICAÇÃO MENOR OU IGUAL A 14 ANOS. 
SELECT * FROM desenhos WHERE classificacao <= 14;

-- 3. EXIBIR TODOS OS DESENHOS DE UMA MESMA EMISSORA ORIGINAL. 
SELECT * FROM desenhos WHERE emissora_Original = 'Hanna-Barbera'; 

-- 4. MODIFICAR O CAMPO STATUS, PARA QUE ACEITE APENAS O STATUS 'EXIBINDO', 'FINALIZADO', 'CANCELADO', TENTE INSERIR ALGUM OUTRO VALOR PARA VER SE A REGRA FOI APLICADA. 
ALTER TABLE desenhos ADD CONSTRAINT chk_status CHECK (statusdesenho IN ('exibindo', 'finalizado', 'cancelado'));

-- TESTE
INSERT INTO desenhos (titulo, dt_Lancamento, emissora_Original, classificacao, statusdesenho, nota) VALUES 
('Novo Desenho', '2025-02-23', 'Emissora X', '10', 'pausado', 4);

-- 5. MODIFICAR O STATUS 'EXIBINDO' PARA 'FINALIZADO' DE 2 DESENHOS PELO ID. 
UPDATE desenhos SET statusdesenho = 'finalizado' WHERE idDesenho IN (1, 2);  

-- 6. DELETAR A LINHA DO DESENHO DE ID 12. 
DELETE FROM desenhos WHERE idDesenho = 12;

-- 7. EXIBIR APENAS OS DESENHOS QUE COMECEM COM UMA DETERMINADA LETRA. NESSE CASO UTILIZAREI "O". 
SELECT * FROM desenhos WHERE titulo LIKE 'O%';

-- 8. RENOMEAR A COLUNA CLASSIFICACAO PARA CLASSIFICACAOINDICATIVA.
ALTER TABLE desenhos RENAME COLUMN classificacao TO classificacaoIndicativa;

-- 9. ATUALIZAR A NOTA E DATA DE LANÇAMENTO DO DESENHO DE ID 11.
UPDATE desenhos  SET nota = 4, dt_Lancamento = '2000-01-01' WHERE idDesenho = 2; 

-- 10. LIMPE TODOS OS DADOS DA TABELA.
TRUNCATE TABLE desenhos;

-- 11. REMOVER A REGRA DO STATUS DO DESENHO.
ALTER TABLE desenhos DROP CONSTRAINT chk_status;


-- EXERCÍCIO 4 --

CREATE DATABASE estoque;

USE estoque;

CREATE TABLE MisteriosSA (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    data_compra DATE,
    preco DECIMAL(10,2),
    peso DECIMAL(10,2),
    data_retirada DATE
);

-- 1. INSIRA NA TABELA, NO MÍNIMO 5 COMPRAS DE ALIMENTOS COM DATAS DIFERENTES. POR AGORA, NÃO PREENCHA A COLUNA REFERENTE A "DATA DE RETIRADA". 
INSERT INTO MisteriosSA (nome, data_compra, preco, peso) VALUES
	('Biscoitos Scooby', '2024-01-10', 15.50, 0.5), 
    ('Cachorro-Quente', '2024-02-15', 10.00, 0.2), 
    ('Biscoitos Scooby', '2024-03-05', 20.00, 0.4), 
    ('Cachorro-Quente', '2024-04-01', 12.75, 0.3), 
    ('Biscoitos Scooby', '2024-05-20', 30.99, 1.0); 

-- 2. VERIFIQUE SE OS VALORES FORAM INSERIDOS CORRETAMENTE. 
SELECT * FROM MisteriosSA;

-- 3. EXIBA OS NOMES, AS DATAS DE COMPRA E RETIRADA E O ID DOS ALIMENTOS ORDENADOS A PARTIR DA DATA DE COMPRA MAIS ANTIGA. 
SELECT id, nome, data_compra, data_retirada FROM MisteriosSA ORDER BY data_compra ASC;

-- 4. ALGUÉM COMEU UMA CAIXA DE BISCOITOS, ATUALIZE A DATA DE RETIRADA DA CAIXA DE “BISCOITOS SCOOBY” QUE FOI COMPRADA A MAIS TEMPO. 
SELECT * FROM MisteriosSA WHERE nome = "Biscoitos Scooby" ORDER BY data_compra ASC;
UPDATE MisteriosSA SET DtRetirada = '2025-02-20' WHERE idAlimento = 1;

-- 5. ALTERE O NOME DA COLUNA ID PARA IDCOMIDA. 
ALTER TABLE MisteriosSA RENAME COLUMN id TO idcomida;

-- 6. ALTERE O TIPO DO CHECK PARA QUE OS ALIMENTOS SÓ POSSAM SER “BISCOITOS SCOOBY” OU “CACHORRO-QUENTE”. 
ALTER TABLE MisteriosSA ADD CONSTRAINT check_nome CHECK (nome IN ('Biscoitos Scooby', 'Cachorro-Quente'));

-- 7. EXIBA OS PRODUTOS ONDE O NOME SEJA "BISCOITOS SCOOBY" DE FORMA QUE O NOME DAS COLUNAS DATACOMPRA APAREÇA COMO "DATA DA COMPRA" E DATARETIRADA APAREÇA COMO "DATA DA RETIRADA". 
SELECT nome AS "Nome", data_compra AS "Data da Compra", data_retirada AS "Data da Retirada" FROM MisteriosSA WHERE nome = 'Biscoitos Scooby';

-- 8. EXIBA OS ALIMENTOS QUE FORAM COMPRADOS ANTES DO DIA 25 DE JULHO DE 2024. 
SELECT * FROM MisteriosSA WHERE data_compra < '2024-07-25';

-- 9. EXIBA OS ALIMENTOS QUE POSSUEM UM PREÇO ACIMA OU IGUAL A 30.50. 
SELECT * FROM MisteriosSA WHERE preco >= 30.50;

-- 10. LIMPE A TABELA.
TRUNCATE TABLE MisteriosSA;

-- EXERCÍCIO 5 --

CREATE DATABASE vingadores;

USE vingadores;

CREATE TABLE heroi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    versao VARCHAR(45),
    habilidade VARCHAR(100) NOT NULL,
    altura INT 
);

-- Inserindo 5 heróis para derrotar o Doutor Destino
INSERT INTO heroi (nome, versao, habilidade, altura) VALUES 
('Homem de Ferro', 'Vingadores: Ultimato', 'Tecnologia avançada', 185),
('Capitão América', 'Vingadores: Guerra Infinita', 'Força e liderança', 185),
('Thor', 'Vingadores: Ragnarok', 'Controle do trovão', 190),
('Hulk', 'Vingadores: Guerra Infinita', 'Força sobre-humana', 244),
('Viúva Negra', 'Vingadores: Endgame', 'Agilidade e combate', 170);

-- 1. EXIBA OS DADOS INSERIDOS NA TABELA. 
SELECT * FROM heroi;

-- 2. ADICIONE UM CAMPO DE REGENERAÇÃO, ONDE ELE ACEITARÁ APENAS OS VALORES BOOLEANOS DE TRUE OU FALSE. 
ALTER TABLE heroi ADD COLUMN regeneracao BOOLEAN;

-- 3. MODIFIQUE O CAMPO VERSÃO PARA ACEITAR ATÉ 100 CARACTERES. 
ALTER TABLE heroi MODIFY COLUMN versao VARCHAR(100);

-- 4. REMOVA O HERÓI DE ID 3 POIS ELE SE MORREU EM BATALHA. 
DELETE FROM heroi WHERE id = 3;

-- 5. CHEGOU REFORÇOS, INSIRA UM NOVO HERÓI PARA A EQUIPE. 
INSERT INTO heroi (nome, versao, habilidade, altura) VALUES 
('Pantera Negra', 'Vingadores: Guerra Infinita', 'Super força e agilidade', 185);

-- 6. EXIBA TODOS OS DADOS INSERIDOS NA TABELA ONDE O NOME DO HERÓI COMEÇA COM “C” OU “H”. 
SELECT * FROM heroi WHERE nome LIKE 'C%' OR nome LIKE 'H%';

-- 7. EXIBA TODOS OS DADOS INSERIDOS NA TABELA ONDE O NOME DO HERÓI NÃO CONTÉM A LETRA “A” NO CAMPO NOME. 
SELECT * FROM heroi WHERE nome NOT LIKE '%A%';

-- 8. EXIBA APENAS O NOME DO HERÓI ONDE A ALTURA FOR MAIOR QUE 190. 
SELECT nome FROM heroi WHERE altura > 190;

-- 9. EXIBA TODOS OS DADOS DA TABELA DE FORMA DECRESCENTE PELO NOME ONDE A ALTURA DO HERÓI FOR MAIOR QUE 180. 
SELECT * FROM heroi WHERE altura > 180 ORDER BY nome DESC;

-- 10. LIMPE OS DADOS DA TABELA.
TRUNCATE TABLE heroi;
