-- example of correlation
WITH global_averages AS (
	SELECT
		AVG(monthly_charges) AS avg_monthly_charges,
        AVG(churn_score) AS avg_churn_score
	FROM
		payment_info, status_analysis -- nem sabia que podia fazer isso
),
variance_x AS (
	SELECT
		customer_id,
		monthly_charges - (SELECT avg_monthly_charges FROM global_averages) x_minus_avg,
        POWER(monthly_charges - (SELECT avg_monthly_charges FROM global_averages), 2) AS x_square_minus_avg
	FROM
		payment_info 
),
variance_y AS (
	SELECT
		customer_id,
		churn_score - (SELECT avg_churn_score FROM global_averages) AS y_minus_avg,
        POWER(churn_score - (SELECT avg_churn_score FROM global_averages), 2) AS y_square_minus_avg
	FROM
		status_analysis
),
get_correlation AS (
	SELECT
        SUM(x_square_minus_avg) AS variance_of_x,
        SUM(y_square_minus_avg) AS variance_of_y,
        SUM(x.x_minus_avg * y.y_minus_avg) AS numerator
	FROM	
		variance_x AS x
	JOIN
		variance_y AS y ON x.customer_id = y.customer_id 
)
SELECT numerator/sqrt(variance_of_x * variance_of_y) AS correlation FROM get_correlation