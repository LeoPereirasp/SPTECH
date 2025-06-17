SHOW databases;

USE sprint1;

CREATE TABLE pessoa (
idPessoa int primary key auto_increment,  -- autoconfigura seu id
nome varchar(40),
dtNasc date
);

INSERT INTO pessoa VALUES
	(default, 'Homem Aranha' , '1984-01-10');
    
INSERT INTO pessoa VALUES
	(default, 'Super Homem' , '1943-03-30');    
    
INSERT INTO pessoa VALUES
	(null, 'Mulher Maravilha' , '1954-10-30');
    
INSERT INTO pessoa (nome, dtNasc) VALUES
	('Batman' , '1911-05-18');    
    
SELECT * FROM pessoa;   

-- DATE 'aaaa-mm-dd' '1983-10-13'
-- DATETIME  'AAAA-MM-DD HH:MM:SS' '1983-10-13 14:01:01'

-- MOSTRA OS CAMPOS DA TABELA
DESCRIBE pessoa;

/*
CAMPOS NUMÉRICOS:
NÚMEROS INTEIROS - 
INT
TINYINT

NÚMEROS DECIMAIS -
FLOAT - 7 CARACTERES: 12345.67
DOUBLE - 15 CARACTERES: 12345678998.7456
DECIMAL(5,2) - 32 CARACTERES 
			123.45
DECIMAL(7,3) - 9874.561
*/

-- ADICIONAR A COLUNA ALTURA
ALTER TABLE pessoa ADD COLUMN altura float;

DESCRIBE pessoa;
SELECT * FROM pessoa;

ALTER TABLE pessoa ADD COLUMN salario DECIMAL(10,2);

INSERT INTO pessoa (nome,salario) VALUES
	('Hulk',1.99);
    
SELECT * FROM pessoa;   
 
 -- SE A LINHA JÁ EXISTE, EU VOU ATUALIZAR O DADO
 -- ATUALIZAR O SALARIO DO HOMEM ARANHA;
 UPDATE pessoa SET salario = 50.99
	WHERE idPessoa = 1;
    
-- NÃO EXISTE UPDATE SEM O WHERE
-- NO MYSQL NO WHERE SEMPRE DEVE SER A CHAVE PRIMÁRIA

-- EXCLUIR UM CAMPO DA TABELA
ALTER TABLE pessoa DROP COLUMN altura;

SELECT * FROM pessoa;    

-- MODIFICAR O CAMPO NOME PARA VARCHAR(50)
DESCRIBE pessoa;
ALTER TABLE pessoa MODIFY COLUMN nome VARCHAR(50);
 
-- RENOMEAR O CAMPO DATA DE NASCALTER TABLE pessoa RENAME
ALTER TABLE pessoa RENAME COLUMN dtNasc TO dataNasc;

SELECT * FROM pessoa; 

-- EXCLUIR UMA LINHA DA TABELA
DELETE FROM pessoa WHERE idPessoa = 2;

INSERT INTO pessoa (nome, salario) VALUES
	('Homem de Ferro', 1000.98);

SELECT * FROM pessoa; 

-- A PEDIDO EMILLY
UPDATE pessoa SET dataNasc = '1912-05-18'
	WHERE idPessoa = 4;
    
-- A PARTIR DE AGORA O AUTO-INCREMENT VAI COMEÇAR POR 1000
ALTER TABLE pessoa auto_increment = 1000;

INSERT INTO pessoa (nome, dataNasc, salario) VALUES
		('Chapolin', '1859-01-01', '0.99');
        
SELECT * FROM pessoa; 

-- LIMPAR OS DADOS DA TABELA
-- LIMPA INCLUSIVE O AUTO-INCREMENT
TRUNCATE TABLE pessoa;
SELECT * FROM pessoa;    
     

 
