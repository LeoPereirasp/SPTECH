-- AULA 3 --

-- CHECK
-- ALIAS
-- CASE
-- IFNULL
-- NOT NULL
-- UNIQUE
-- DEFAULT

SHOW DATABASES;
USE sprint1;

SHOW TABLES;

CREATE TABLE sensor (
idSensor int primary key auto_increment,
tipo varchar(30) not null,
dtManutencao datetime,
statusSensor varchar(40),
constraint chkStatus
	check(statusSensor in ('Ativo', 'Inativo', 'Manutenção'))
);

-- o próximo comando dará erro de constraint
INSERT INTO sensor VALUES
	(default, 'DHT11', '2025-02-17', 'PENDENTE');
    -- check constraint 'chkstatus' is violated.

INSERT INTO sensor (tipo, dtmanutencao, statusSensor) VALUES
	('DHT11', '2025-02-17 13:16:00', 'Ativo'),
    ('LM35', '2025-02-16 14:00:00', 'Inativo');
    
SELECT * FROM sensor;    
    
DESCRIBE sensor;

ALTER TABLE sensor 
	MODIFY COLUMN dtmanutencao datetime default current_timestamp;
    
INSERT INTO  sensor(tipo, statusSensor) VALUES
		('DHT11', 'Manutenção');
        
SELECT * FROM sensor;

-- EXCLUIR UMA CONSTRAINT
ALTER TABLE sensor DROP CONSTRAINT chkstatus;

INSERT INTO sensor(tipo,statusSensor) VALUES
			('LM35', 'Pendente');
            
 SELECT * FROM sensor;  
 
 -- ADICIONAR UM CAMPO COM NÚMERO DE SÉRIE DO SENSOR
 ALTER TABLE sensor ADD COLUMN numSerie char(3) unique;
 
 UPDATE sensor SET numserie = '001' WHERE idSensor = 1;
-- o comando abaixo dará erro devido ao unique.            
UPDATE sensor SET numserie = '001' WHERE idSensor = 2;
-- Duplicate entry '001' for key 'sensor.numserie'

-- ALIAS - APELIDO
SELECT * FROM sensor;
SELECT tipo AS 'Tipo de Sensor',
	dtmanutencao AS 'Data de Manutenção' FROM sensor;
    
-- IFNULL
SELECT * FROM sensor;
SELECT IFNULL(numSerie, 'Sem número de série') AS numSerie FROM sensor;    

-- CASE 
SELECT tipo,
	CASE
	WHEN
    statussensor = 'Manutenção' THEN 1
    ELSE 0
    END AS A FROM sensor;
    
-- CASE 
SELECT tipo,
	CASE
	WHEN statusSensor = 'Manutenção' THEN 1
    WHEN statusSensor = 'Pendente' then 'Joga Fora'
    ELSE 0
    END AS A FROM sensor;    
    
-- DEFAULT
ALTER TABLE sensor ADD COLUMN nome varchar(20) default 'Sem nome';

INSERT INTO sensor (tipo) VALUES
		('LM35');
        
INSERT INTO sensor (tipo, nome) VALUES
		('DHAT11', 'Sensível');
        
SELECT * FROM sensor;        

    