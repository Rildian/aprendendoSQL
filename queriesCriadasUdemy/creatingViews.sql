CREATE VIEW customer_sales AS

SELECT 
	c.customer_id,
    c.first_name, 
    c.last_name,
    SUM(p.amount) AS Total
FROM customer AS c
JOIN payment AS p ON
	c.customer_id = p.customer_id
GROUP BY 
	c.customer_id,
    c.first_name, 
    c.last_name
ORDER BY Total DESC;