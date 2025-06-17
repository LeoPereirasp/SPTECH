SHOW DATABASES;
USE sprint2;

CREATE TABLE pet (
idPet int primary key auto_increment,
nome varchar(45),
raca varchar(45),
fkMae int,
fkPai int,
constraint fkFilhoMae foreign key (fkMae)
	references pet(idPet),
constraint fkFilhoPai foreign key (fkPai)
	references pet(idPet));
    
INSERT INTO pet VALUES 
	(default, 'Homero', 'vira-lata', null, null),
	(default, 'Marge', 'vira-lata', null, null),
	(default, 'Bart', 'vira-lata', 2, 1);

INSERT INTO pet VALUES 
	(default, 'Scooby doo pai', 'vira-lata', null, null),
	(default, 'Scooby doo mae', 'vira-lata', null, null),
	(default, 'Scooy doo', 'vira-lata', 5, 4);
    
SELECT filho.nome as Nome_filho,
	mae.nome as Nome_mae,
    pai.nome as Nome_pai
    FROM pet as filho JOIN pet as mae
    ON filho.fkMae = mae.idPet
    JOIN pet as pai
    ON filho.fkPai = pai.idPet;
    
INSERT INTO pet (nome) VALUES
	('Scooby doo avó (mãe da mãe)'),
	('Scooby doo avô (pai da mãe)');

SELECT * FROM pet;

UPDATE pet SET fkMae = 7, fkPai = 8
	where idPet = 5;
    
SELECT filho.nome as Filho,
mae.nome as Mãe,
avó.nome as Avó,
avô.nome as Avô
FROM pet as filho JOIN pet as mae
ON filho.fkMae = mae.idPet
JOIN pet as avó
ON mae.fkMae = avó.idPet
JOIN pet as avô
ON mae.fkPai = avô.idPet;