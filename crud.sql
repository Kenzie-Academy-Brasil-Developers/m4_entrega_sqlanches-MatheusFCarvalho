-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)

INSERT INTO clientes(nome,lealdade)
VALUES('Georgia',0);

-- 2)

INSERT INTO pedidos(status,cliente_id)
VALUES ('Recebido', 6);

-- 3)

INSERT INTO produtos_pedidos(pedido_id,produto_id)
	VALUES (6 , 1),
    (6 , 2),
    (6 , 6),
    (6 , 8),
    (6 , 8);

-- Leitura

-- 1)
SELECT cl.id, cl.nome, cl.lealdade, pd.id, pd.status, pd.cliente_id,p.id,p.nome,p.tipo,p.preço,p.pts_de_lealdade
FROM clientes cl
JOIN pedidos pd ON pd.cliente_id = cl.id
JOIN produtos_pedidos pp ON pp.pedido_id = pd.id
JOIN produtos p ON p.id = pp.produto_id
WHERE cl.nome ='Georgia';


-- Atualização

-- 1)

-- JEITO MOCADO DUAS ETAPAS

SELECT SUM(pts_de_lealdade)
FROM produtos p
JOIN produtos_pedidos pp ON pp.produto_id = p.id
WHERE pp.pedido_id = 6;

UPDATE clientes
SET lealdade = 48
WHERE clientes.nome = 'Georgia';


-- JEITO DIRETO C NOME + ID

UPDATE clientes c
SET lealdade = lealdade_total.sum
FROM (
  SELECT SUM(pts_de_lealdade)
  FROM produtos p
  JOIN produtos_pedidos pp ON pp.produto_id = p.id
  GROUP BY pp.pedido_id
  HAVING pp.pedido_id = 6
) lealdade_total
WHERE c.nome = 'Georgia';


-- JEITO DIRETO SÓ C NOME

UPDATE clientes c
SET lealdade = lealdade_total.sum
FROM (
  SELECT SUM(pts_de_lealdade)
  FROM produtos p
  JOIN produtos_pedidos pp ON pp.produto_id = p.id
  JOIN pedidos ped ON ped.id = pp.pedido_id
  JOIN clientes cl ON cl.id = ped.cliente_id
  GROUP BY cl.nome
  HAVING cl.nome = 'Georgia'
) lealdade_total
WHERE c.nome = 'Georgia';


-- Deleção

-- 1)

DELETE FROM clientes cl
WHERE cl.nome = 'Marcelo';




