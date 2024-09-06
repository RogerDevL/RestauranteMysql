CREATE DATABASE restaurantedalibbs;
USE restaurantedalibbs;


CREATE TABLE clientes(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(100),
	email VARCHAR(100),
	telefone VARCHAR(100)
);

CREATE TABLE pedidos(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	data_pedido DATE,
    clienteId INT,
 	FOREIGN KEY (clienteId) REFERENCES clientes(id)
);

CREATE TABLE pagamentos(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    metodo_pagamento VARCHAR(100),
    valor_pago INT,
    data_pagamento DATE,
    pedidoId INT,
    FOREIGN KEY (pedidoId) REFERENCES pedidos(id)
);

CREATE TABLE categorias(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(100)
);

CREATE TABLE produtos(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(100),
	preco VARCHAR(100),
	categoriaId INT,
	FOREIGN KEY (categoriaId) REFERENCES categorias(id)
);


CREATE TABLE  itenspedido(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    quantidade INT,
    preco_unitario INT,
    pedidoId INT,
    produtoId INT,
    FOREIGN KEY (pedidoId) REFERENCES pedidos(id),
    FOREIGN KEY (produtoId) REFERENCES produtos(id)
);

INSERT INTO clientes(nome, email, telefone)VALUES
('Roger', 'rogeralveslemos@gmail.com', '11911280718'), ('Suyane', 'suyane@gmail.com', '119863421');
SELECT * FROM clientes;


INSERT INTO pedidos(data_pedido, clienteId)VALUES
('2005-08-24', 1), ('2005-12-04', 2);
SELECT * FROM pedidos;

INSERT INTO pagamentos(metodo_pagamento, valor_pago, data_pagamento, pedidoId)VALUES
('Debito', 120, '1978-09-01', 1), ('Credito', 80, '1988-07-22', 2);
SELECT * FROM pagamentos;

INSERT INTO categorias(nome)VALUES
('Bebidas'), ('Carnes');
SELECT * FROM categorias;

INSERT INTO produtos(nome, preco, categoriaId)VALUES
('Fraldinha', '50,00', 2), ('Coca-cola', '10,00', 1);
SELECT * FROM produtos;

INSERT INTO itenspedido(quantidade, preco_unitario, pedidoId, produtoId)VALUES
(1, 30, 1, 2), (4, 5, 2, 1);
SELECT * FROM itenspedido;

-- inner join 
-- selecione todos os produtos e suas categorias
SELECT prod.nome, prod.preco, categorias.nome
FROM produtos AS prod
INNER JOIN categorias ON prod.categoriaId = categorias.id;

SELECT cli.nome, cli.email, cli.telefone, pedidos.id
FROM clientes AS cli
INNER JOIN pedidos ON cli.id = pedidos.clienteId;

SELECT ped.data_pedido, clientes.id
FROM pedidos AS ped  
INNER JOIN clientes ON ped.id = clientes.id;


SELECT cat.nome AS Categorias, produtos.nome AS Produtos, itenspedido.quantidade AS Quantidade, pedidos.data_pedido AS data_pedido
FROM categorias AS cat
INNER JOIN produtos ON cat.id = produtos.categoriaId
INNER JOIN itenspedido ON produtos.id = itenspedido.produtoId
INNER JOIN pedidos ON pedidos.id = itenspedido.pedidoId; 