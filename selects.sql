-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)

SELECT *
FROM produtos_pedidos pp
JOIN produtos p ON p.id = pp.produto_id 
JOIN pedidos pd ON pd.id = pp.pedido_id
;

-- 2)


-- BUSCA SEM O ID DE FRITAS
SELECT pedidos.id
FROM produtos_pedidos 
JOIN pedidos ON pedidos.id = produtos_pedidos.pedido_id
JOIN produtos ON produtos.id = produtos_pedidos.produto_id
WHERE produtos.nome LIKE 'Fritas'
;


-- BUSCA PELO ID DE FRITAS
SELECT pedidos.id
FROM produtos_pedidos 
JOIN pedidos ON pedidos.id = produtos_pedidos.pedido_id
WHERE produtos_pedidos.produto_id = 6;


-- 3)
-- BUSCA SEM O ID
SELECT cl.nome gostam_de_fritas
FROM pedidos ped
JOIN clientes cl ON cl.id = ped.cliente_id
JOIN produtos_pedidos pp ON pp.pedido_id = ped.id
JOIN produtos p ON p.id = pp.produto_id
WHERE p.nome = 'Fritas'
;

-- BUSCA PELO ID
SELECT cl.nome gostam_de_fritas
FROM pedidos ped
JOIN clientes cl ON cl.id = ped.cliente_id
JOIN produtos_pedidos pp ON pp.pedido_id = ped.id
WHERE pp.produto_id = 6;
;

-- 4)
SELECT SUM(preço)
FROM produtos p
JOIN produtos_pedidos pp ON pp.produto_id = p.id
JOIN pedidos pd ON pd.id = pp.pedido_id
JOIN clientes cl ON cl.id = pd.cliente_id
WHERE cl.nome LIKE 'Laura'
;

-- 5)

SELECT nome, COUNT(nome)
FROM produtos p
JOIN produtos_pedidos pp ON pp.produto_id = p.id
GROUP BY nome
;


