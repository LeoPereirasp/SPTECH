-- a) Criar um banco de dados chamado Venda
CREATE DATABASE Venda;

-- b) Selecionar esse banco de dados
USE Venda;

-- c) Criar as tabelas correspondentes à sua modelagem
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    endereco VARCHAR(200),
    idIndicador INT,
    FOREIGN KEY (idIndicador) REFERENCES Cliente(idCliente)
);

CREATE TABLE Venda (
    idVenda INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    data_venda DATE NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Venda_Produto (
    idVenda INT NOT NULL,
    idProduto INT NOT NULL,
    quantidade INT NOT NULL,
    desconto DECIMAL(5, 2) DEFAULT 0.00,
    PRIMARY KEY (idVenda, idProduto),
    FOREIGN KEY (idVenda) REFERENCES Venda(idVenda),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

-- d) Inserir dados nas tabelas
INSERT INTO Cliente (nome, email, endereco, idIndicador) VALUES
('Ana Silva', 'ana.silva@email.com', 'Rua das Flores, 123', NULL),
('Bruno Oliveira', 'bruno.oliveira@email.com', 'Avenida Central, 456', 1),
('Carla Souza', 'carla.souza@email.com', 'Travessa da Praia, 789', 1),
('Daniel Pereira', 'daniel.pereira@email.com', 'Alameda dos Bosques, 101', 2),
('Elisa Costa', 'elisa.costa@email.com', 'Rua do Sol, 222', 3);

INSERT INTO Venda (idCliente, total, data_venda) VALUES
(1, 150.00, '2025-04-20'),
(1, 220.50, '2025-04-25'),
(2, 85.00, '2025-04-22'),
(3, 310.75, '2025-04-28'),
(2, 120.00, '2025-04-28');

INSERT INTO Produto (nome, descricao, preco) VALUES
('Camiseta', 'Camiseta de algodão básica', 25.00),
('Calça Jeans', 'Calça jeans skinny', 80.00),
('Tênis Esportivo', 'Tênis para corrida', 120.00),
('Moletom', 'Moletom felpudo com capuz', 65.00),
('Boné', 'Boné de aba reta', 30.00);

INSERT INTO Venda_Produto (idVenda, idProduto, quantidade, desconto) VALUES
(1, 1, 2, 0.00),
(1, 2, 1, 0.05),
(2, 3, 1, 0.10),
(2, 1, 1, 0.00),
(3, 4, 1, 0.00),
(4, 2, 1, 0.00),
(4, 3, 1, 0.05),
(4, 5, 2, 0.00),
(5, 1, 3, 0.15),
(5, 4, 1, 0.00);

-- e) Exibir todos os dados de cada tabela criada, separadamente
SELECT * FROM Cliente;
SELECT * FROM Venda;
SELECT * FROM Produto;
SELECT * FROM Venda_Produto;

-- f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação das tabelas.
-- As chaves estrangeiras foram definidas durante a criação das tabelas.
-- Caso precisasse adicionar posteriormente, usaríamos o comando ALTER TABLE:
-- ALTER TABLE Venda ADD CONSTRAINT fk_venda_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente);
-- ALTER TABLE Cliente ADD CONSTRAINT fk_cliente_indicador FOREIGN KEY (idIndicador) REFERENCES Cliente(idCliente);
-- ALTER TABLE Venda_Produto ADD CONSTRAINT fk_venda_produto_venda FOREIGN KEY (idVenda) REFERENCES Venda(idVenda);
-- ALTER TABLE Venda_Produto ADD CONSTRAINT fk_venda_produto_produto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto);

-- g) Exibir os dados dos clientes e os dados de suas respectivas vendas
SELECT c.idCliente, c.nome AS NomeCliente, c.email AS EmailCliente, v.idVenda, v.data_venda AS DataVenda, v.total AS TotalVenda
FROM Cliente c
JOIN Venda v ON c.idCliente = v.idCliente;

-- h) Exibir os dados de um determinado cliente (informar o nome do cliente na consulta) e os dados de suas respectivas vendas
SELECT c.idCliente, c.nome AS NomeCliente, c.email AS EmailCliente, v.idVenda, v.data_venda AS DataVenda, v.total AS TotalVenda
FROM Cliente c
JOIN Venda v ON c.idCliente = v.idCliente
WHERE c.nome = 'Ana Silva';

-- i) Exibir os dados dos clientes e de suas respectivas indicações de clientes
SELECT c1.idCliente, c1.nome AS NomeCliente, c1.email AS EmailCliente, c2.idCliente AS idIndicador, c2.nome AS NomeIndicador
FROM Cliente c1
LEFT JOIN Cliente c2 ON c1.idIndicador = c2.idCliente;

-- j) Exibir os dados dos clientes indicados e os dados dos respectivos clientes indicadores, porém somente de um determinado cliente indicador (informar o nome do cliente que indicou na consulta)
SELECT c1.idCliente AS idClienteIndicado, c1.nome AS NomeIndicado, c1.email AS EmailIndicado, c2.idCliente AS idIndicador, c2.nome AS NomeIndicador
FROM Cliente c1
JOIN Cliente c2 ON c1.idIndicador = c2.idCliente
WHERE c2.nome = 'Ana Silva';

-- l) Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os dados das respectivas vendas e dos produtos
SELECT
    c1.idCliente,
    c1.nome AS NomeCliente,
    ci.idCliente AS idIndicador,
    ci.nome AS NomeIndicador,
    v.idVenda,
    v.data_venda AS DataVenda,
    p.idProduto,
    p.nome AS NomeProduto
FROM Cliente c1
LEFT JOIN Cliente ci ON c1.idIndicador = ci.idCliente
JOIN Venda v ON c1.idCliente = v.idCliente
JOIN Venda_Produto vp ON v.idVenda = vp.idVenda
JOIN Produto p ON vp.idProduto = p.idProduto;

-- m) Exibir apenas a data da venda, o nome do produto e a quantidade do produto numa determinada venda.
SELECT v.data_venda AS DataVenda, p.nome AS NomeProduto, vp.quantidade AS Quantidade
FROM Venda v
JOIN Venda_Produto vp ON v.idVenda = vp.idVenda
JOIN Produto p ON vp.idProduto = p.idProduto
WHERE v.idVenda = 1; -- Exemplo para a venda com ID 1

-- n) Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de produtos vendidos agrupados pelo nome do produto.
SELECT p.nome AS NomeProduto, p.preco AS PrecoProduto, SUM(vp.quantidade) AS TotalVendido
FROM Produto p
JOIN Venda_Produto vp ON p.idProduto = vp.idProduto
GROUP BY p.nome, p.preco;

-- o) Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas vendas, e os clientes que não realizaram nenhuma venda.
INSERT INTO Cliente (nome, email, endereco, idIndicador) VALUES
('Fernanda Lima', 'fernanda.lima@email.com', 'Rua das Palmeiras, 55', 4);

SELECT c.idCliente, c.nome AS NomeCliente, c.email AS EmailCliente, v.idVenda, v.data_venda AS DataVenda
FROM Cliente c
LEFT JOIN Venda v ON c.idCliente = v.idCliente;

SELECT c.nome AS ClienteSemVenda
FROM Cliente c
LEFT JOIN Venda v ON c.idCliente = v.idCliente
WHERE v.idVenda IS NULL;

-- p) Exibir o valor mínimo e o valor máximo dos preços dos produtos;
SELECT MIN(preco) AS PrecoMinimo, MAX(preco) AS PrecoMaximo
FROM Produto;

-- q) Exibir a soma e a média dos preços dos produtos;
SELECT SUM(preco) AS SomaPrecos, AVG(preco) AS MediaPrecos
FROM Produto;

-- r) Exibir a quantidade de preços acima da média entre todos os produtos;
SELECT COUNT(*) AS QuantidadeAcimaMedia
FROM Produto
WHERE preco > (SELECT AVG(preco) FROM Produto);

-- s) Exibir a soma dos preços distintos dos produtos;
SELECT SUM(DISTINCT preco) AS SomaPrecosDistintos
FROM Produto;

-- t) Exibir a soma dos preços dos produtos agrupado por uma determinada venda;
SELECT v.idVenda, SUM(p.preco * vp.quantidade) AS SomaPrecosVenda
FROM Venda v
JOIN Venda_Produto vp ON v.idVenda = vp.idVenda
JOIN Produto p ON vp.idProduto = p.idProduto
WHERE v.idVenda = 1 -- Exemplo para a venda com ID 1
GROUP BY v.idVenda;