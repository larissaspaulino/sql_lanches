
-- 1) Consulte por todos os pedidos juntamente com todas as informações dos produtos que estão em cada um dos pedidos.
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

-- 2) Consulte pelo ID de todos os pedidos que incluam 'Fritas'.
SELECT
    pe.id
FROM
    produtos_pedidos pp
    JOIN produtos pro ON pro.id = pp.produto_id
    JOIN pedidos pe ON pp.pedido_id = pe.id
WHERE
    pro.id = 6;

-- 3) Consulte novamente por pedidos que incluam 'Fritas', porém agora, retorne apenas uma coluna (gostam_de_fritas) com o nome dos Clientes que fizeram os pedidos.
SELECT
    c.nome AS gostam_de_fritas
FROM
    produtos_pedidos pp
    JOIN produtos pro ON pro.id = pp.produto_id
    JOIN pedidos pe ON pp.pedido_id = pe.id
    JOIN clientes c ON c.id = pe.cliente_id
WHERE
    pro.id = 6;

-- 4) Crie uma query que retorne o custo total dos pedidos da 'Laura'.
SELECT
    SUM(pro.preco)
FROM
    produtos_pedidos pp
    JOIN produtos pro ON pro.id = pp.produto_id
    JOIN pedidos pe ON pp.pedido_id = pe.id
    JOIN clientes c ON c.id = pe.cliente_id
WHERE
    pe.cliente_id = 5;

-- 5) Crie uma query que retorne em uma coluna o nome do produto, e na outra, o número de vezes que ele foi pedido. Dica: a função built-in COUNT pode somar o número de ocorrências de um id em uma coluna.
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