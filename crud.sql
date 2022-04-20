
-- Simulações de um CRUD
-- Criação
-- 1)
INSERT INTO
    clientes (nome, lealdade)
VALUES
    ('Georgia', 0);

-- 2)
INSERT INTO
    pedidos(status, cliente_id)
VALUES
    ('Recebido', 6);

-- 3)
INSERT INTO
    produtos_pedidos(pedido_id, produto_id)
VALUES
    (6, 1),
    (6, 2),
    (6, 6),
    (6, 8),
    (6, 8);

-- Leitura
-- 1) pedidos e os produtos dos pedidos da cliente Georgia.
SELECT
    c.id,
    c.nome,
    c.lealdade,
    pe.id,
    pe.status,
    pe.cliente_id,
    pro.id,
    pro.nome,
    pro.tipo,
    pro.preco,
    pro.pts_de_lealdade
FROM
    produtos_pedidos pp
    JOIN produtos pro ON pro.id = pp.produto_id
    JOIN pedidos pe ON pp.pedido_id = pe.id
    JOIN clientes c ON c.id = pe.cliente_id
WHERE
    pe.cliente_id = 6;

-- Atualização
-- 1) Some os pontos de lealdade da cliente Georgia e faça uma query para atualizar somente os pontos de lealdade dela para o valor somado.
UPDATE
    clientes
SET
    lealdade = (
        SELECT
            SUM(pro.pts_de_lealdade)
        FROM
            produtos_pedidos pp
            JOIN produtos pro ON pro.id = pp.produto_id
            JOIN pedidos pe ON pp.pedido_id = pe.id
            JOIN clientes c ON c.id = pe.cliente_id
        WHERE
            pe.cliente_id = 6
    )
WHERE
    id = 6 RETURNING *;

-- Deleção
-- 1)
DELETE FROM
    clientes
WHERE
    id = 4 RETURNING *;