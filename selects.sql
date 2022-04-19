-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados
-- 1)
SELECT
    pe.id,
    pe.status,
    pe.cliente_id,
    pro.nome,
    pro.tipo,
    pro.preco,
    pro.pts_de_lealdade
FROM
    produtos_pedidos pp
    JOIN produtos pro ON pro.id = pp.produto_id
    JOIN pedidos pe ON pp.pedido_id = pe.id;

-- 2)
SELECT
    pe.id
FROM
    produtos_pedidos pp
    JOIN produtos pro ON pro.id = pp.produto_id
    JOIN pedidos pe ON pp.pedido_id = pe.id
WHERE
    pro.id = 6;

-- 3)
SELECT
    c.nome AS gostam_de_fritas
FROM
    produtos_pedidos pp
    JOIN produtos pro ON pro.id = pp.produto_id
    JOIN pedidos pe ON pp.pedido_id = pe.id
    JOIN clientes c ON c.id = pe.cliente_id
WHERE
    pro.id = 6;

-- 4)
SELECT
    SUM(pro.preco)
FROM
    produtos_pedidos pp
    JOIN produtos pro ON pro.id = pp.produto_id
    JOIN pedidos pe ON pp.pedido_id = pe.id
    JOIN clientes c ON c.id = pe.cliente_id
WHERE
    pe.cliente_id = 5;

-- 5)
SELECT
    COUNT(pp.produto_id) AS numero_de_ocorrencias,
    pro.nome AS nome_do_produto
FROM
    produtos_pedidos pp
    JOIN produtos pro ON pro.id = pp.produto_id
    JOIN pedidos pe ON pp.pedido_id = pe.id
    JOIN clientes c ON c.id = pe.cliente_id
GROUP BY
    pro.nome
ORDER BY
    numero_de_ocorrencias DESC;