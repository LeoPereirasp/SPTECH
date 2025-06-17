CREATE DATABASE continuada1;

USE continuada1;

CREATE TABLE historico (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(200) NOT NULL,
dataHora DATETIME DEFAULT current_timestamp,
url VARCHAR(250) NOT NULL,
navegador VARCHAR(100)
);

INSERT INTO historico (nome, url, navegador) VALUES
	('São Paulo Tech School', 'https://moodle.sptech.school/', 'Microsoft Edge'),
	('Página Inicial - Microsoft Azure', 'https://portal.azure.com/#home', 'Microsoft Edge'),
	('Ofertas e Promoções | Amazon.com.br', 'https://www.amazon.com.br/deals?ref_=nav_cs_gb', 'Firefox Developer Edition'),
	('404 Not Found', 'http://moodletech.azurewebsites.net/', 'Firefox Developer Edition'),
	('Working...', 'https://login.microsoftonline.com/kmsi', 'Firefox Developer Edition'),
	('Email - Usuario Aluno - Outlook', 'https://outlook.office.com/mail/', 'Firefox Developer Edition'),
	('Solicitações - Suporte - Digital Building', 'https://bandtec.sdpondemand.manageengine.com/app/itdesk/ui/requests', 'Firefox Developer Edition'),
	('Carrinho de compras da Amazon.com', 'https://www.amazon.com.br/gp/cart/view.html?ref_=nav_cart', 'Firefox Developer Edition'),
	('MySQL | Begin Your Download', 'https://dev.mysql.com/downloads/file/?id=516926', 'Firefox Developer Edition'),
	('MySQL | Download MySQL Installer', 'https://dev.mysql.com/downloads/installer/', 'Firefox Developer Edition');
    
-- 1- RENOMEAR O CAMPO nome PARA titulo DA TABELA historico;
    ALTER TABLE historico RENAME COLUMN nome TO titulo;
    
-- 2- ADICIONAR UM CAMPO NA TABELA historico CHAMADO sistOp (30 caracteres), ONDE GUARDARÁ O SISTEMA OPERACIONAL DO HISTÓRICO DE NAVEGAÇÃO;    
ALTER TABLE historico ADD COLUMN sistOp VARCHAR(30);

-- 3- - INSERIR OS DADOS NA TABELA historico CONFORME ABAIXO:
INSERT INTO historico (nome, url, navegador) VALUES  
    ('404 Not Found', 'http://moodletech.azurewebsites.net/', 'Google Chrome');  
SELECT * FROM historico WHERE nome = '404 Not Found' AND navegador = 'Google Chrome';

-- 4- EXCLUIR A TABELA historico DO BANCO DE DADOS continuada1;
DROP TABLE historico;

-- 5- EXIBIR OS DADOS DA TABELA historico CUJO O nome COMEÇA COM A LETRA M;
SELECT * FROM historico WHERE nome LIKE 'M%';

-- 6- AUMENTAR A QUANTIDADE DE CARACTERES DO CAMPO url NA TABELA historico PARA 500 caracteres;
ALTER TABLE historico MODIFY COLUMN url VARCHAR(500);

-- 7- INSERIR UM REGISTRO NA TABELA HISTÓRICO CONFORME DADOS ABAIXO:

INSERT INTO historico (nome, url, dataHora) VALUES
	('Fazer login no Canvas (instructure.com)', 'https://awsacademy.instructure.com/login/canvas', '2023-02-16 10:36:00');

-- 8- - EXIBIR OS DADOS DA TABELA historico CUJO A url TERMINA COM O CARACTER /;
SELECT * FROM historico WHERE url LIKE '%/';

-- 9- EXCLUIR A TUPLA DA TABELA historico CUJO O nome CONTÉM A PALAVRA Download;
SELECT * FROM historico WHERE nome LIKE '%Download%';
DELETE FROM historico WHERE id in (9,10);

-- 10- EXIBIR APENAS O CAMPO navegador DA TABELA historico ONDE O navegador É DIFERENTE DE 'Microsoft Edge';
SELECT navegador FROM historico WHERE navegador != 'Microsoft Edge';

-- 11- ERRO DE SELEÇÃO DE BD - CODE 1046
-- O funcionário não selecionou o banco de dados que a tabela produto será criada. O comando para corrigir este erro é USE nomeDoDB;

-- 12- EXIBIR APENAS OS NOMES DA TABELA historico CUJO O navegador É 'Microsoft Edge';
SELECT nome FROM historico WHERE navegador = 'Microsoft Edge';

-- 13- EXCLUIR O CAMPO NA TABELA historico CHAMADO navegador;
ALTER TABLE historico DROP COLUMN navegador;

-- 14- NO CAMPO navegador DA TABELA historico, ADICIONAR A CONSTRAINT CHECK PARA INSERIR NO CAMPO APENAS OS SEGUINTES DADOS: 'Microsoft Edge', 'Firefox Developer Edition', 'Google Chrome';
ALTER TABLE historico ADD CONSTRAINT  
CHECK (navegador IN ('Microsoft Edge', 'Firefox Developer Edition', 'Google Chrome'));

-- 15-EXIBIR OS DADOS DA TABELA historico CUJO A url CONTEM A PALAVRA 'AMAZON';
SELECT * FROM historico WHERE url LIKE '%amazon%';

-- 16-  ATUALIZAR O DADO DO CAMPO navegador DA TABELA historico PARA 'Google Chrome' ONDE O nome É IGUAL A  'Working...';
SELECT id FROM historico WHERE nome = 'Working...';
UPDATE historico SET navegador = 'Google Chrome' WHERE id = 5;

-- 17- TRUNCATE TABLE;
-- é um DDL que limpa a tabela

-- 18- EXIBIR OS DADOS DA TABELA historico CUJO A url TEM COMO PENÚLTIMA LETRA, A LETRA T;
SELECT * FROM historico WHERE url LIKE '%t_';

-- 19- ATUALIZAR O DADO DO CAMPO dataHora DA TABELA historico PARA '2023-02-31 08:00:00' ONDE O nome É IGUAL A  'Página Inicial - Microsoft Azure';
-- error code 1292

