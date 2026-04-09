
use ecommerce;

-- ====================================
-- VIEW - RELATÓRIO DE VENDAS
-- ====================================

CREATE VIEW VW_RELATORIO AS
SELECT 
    p.name AS 'PRODUTO', 
    o.order_date AS 'DATA', 
    u.nome AS 'USUARIO', 
    p.price AS 'PRECO', 
    oi.quantity AS 'QUANTIDADE',
    (p.price * oi.quantity) AS 'TOTAL'
FROM ORDER_ITEMS oi
INNER JOIN PRODUCTS p ON p.id = oi.product_id
INNER JOIN ORDERS o ON o.id = oi.order_id
INNER JOIN USERS u ON u.id = o.user_id;

-- ====================================
-- QUERY - TOTAL DE VENDAS POR USUÁRIO
-- ====================================

SELECT USUARIO, SUM(TOTAL) AS 'TOTAL_VENDIDO'
FROM VW_RELATORIO
GROUP BY USUARIO
ORDER BY TOTAL_VENDIDO DESC;

select * from vw_relatorio;
