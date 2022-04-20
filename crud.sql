
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
    *
FROM
    produtos_pedidos pp
    JOIN produtos pro ON pro.id = pp.produto_id
    JOIN pedidos pe ON pp.pedido_id = pe.id
    JOIN clientes c ON c.id = pe.cliente_id
WHERE
    c.nome LIKE 'Georgia';

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
            c.nome LIKE 'Georgia'
    )
WHERE
    nome LIKE 'Georgia' RETURNING *;

-- Deleção
-- 1)
DELETE FROM
    clientes
WHERE
    id = 4 RETURNING *;