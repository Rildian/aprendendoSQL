-- optmized solution, without using joins
SELECT
    name AS 'Customers'
FROM
    Customers
WHERE id not in (SELECT customerId FROM Orders)

-- using joins (not so good, but it worked as well)
SELECT
    c.name AS 'Customers'
FROM 
    Customers AS c
LEFT JOIN
    Orders AS o ON c.id = o.customerId
WHERE
    o.customerId IS NULL