-- media, clientes mais q 15 compras
-- e mais q a media

SELECT
	c.first_name, c.last_name,
    count(p.amount) AS qnt,
    sum(p.amount) AS gastos
FROM 
	customer AS c
JOIN payment AS p ON
c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name
HAVING gastos > 
(SELECT 
	AVG(amount) AS media)
AND
qnt > 1;