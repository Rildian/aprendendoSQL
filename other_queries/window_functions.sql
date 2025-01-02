-- tables created

CREATE TABLE sales (
order_id INT,
order_date DATE,
territory_id INT,
customer_id INT
);

CREATE TABLE sales_details (
order_amount INT,
unit_price INT, 
product_id INT,
order_id INT
);

-- testing window functions

WITH sales_brief AS (
	SELECT 
		sa.territory_id,
        -- sd.unit_price,
		YEAR(sa.order_date) AS 'year_sales',
		SUM(sd.order_amount) AS 'qnt'
	FROM
		sales AS sa
			INNER JOIN
		sales_details AS sd ON sa.order_id = sd.order_id
	GROUP BY sa.territory_id , sa.order_date
	ORDER BY sa.territory_id
)
SELECT 
	territory_id,
    year_sales,
    qnt,
    SUM(qnt) OVER (PARTITION BY territory_id ORDER BY year_sales) AS qnt_general,
	LAG(qnt, 1, 0) OVER (PARTITION BY territory_id ORDER BY year_sales ASC) AS previous_year,
    RANK() OVER (PARTITION BY territory_id ORDER BY qnt DESC) AS "ranking",
    ROW_NUMBER() OVER (PARTITION BY territory_id ORDER BY qnt DESC) AS "row_number"
FROM
	sales_brief 
ORDER BY
	territory_id;

-- table created to test moving avg 

CREATE TABLE test_moving (
id INT,
faturamento INT,
data_venda DATE
);

-- avg preceding and current row and avg preceding and following
SELECT 
	id,
    faturamento,
    AVG(faturamento) OVER(
			PARTITION BY id 
            ORDER BY data_venda 
            ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS "avg_moving1",
	AVG(faturamento) OVER(
			 PARTITION BY id 
           ORDER BY data_venda 
           ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS "avg_follow",
	LAG(faturamento, 1, 0) OVER (PARTITION BY id ORDER BY data_venda ASC) AS "lag", 
    faturamento - LAG(faturamento, 1, 0) OVER (PARTITION BY id ORDER BY data_venda ASC) AS "atual_anterior",
    LEAD(faturamento, 1, 0) OVER (PARTITION BY id ORDER BY data_venda ASC) AS "lead", 
    faturamento - LEAD(faturamento, 1, 0) OVER (PARTITION BY id ORDER BY data_venda ASC) AS "atual_prox",
    data_venda
FROM 
	test_moving;
    
-- desen_rank() vs rank() vs row_number()
SELECT 
	id,
    faturamento,
    DENSE_RANK() OVER (PARTITION BY id ORDER BY faturamento DESC) AS "d_rank",
    RANK () OVER (PARTITION BY id ORDER BY faturamento DESC) AS "rank",
    ROW_NUMBER() OVER (PARTITION BY id ORDER BY faturamento DESC) AS "row_number"
FROM
	test_moving;

-- selecting n groups basing on rank, change the "r" to whatever values do you want.alter

SELECT *
	FROM (SELECT *, 
		ROW_NUMBER() OVER (PARTITION BY id ORDER BY faturamento DESC) AS r
		FROM test_moving) AS sub_query
	WHERE r <= 2;





