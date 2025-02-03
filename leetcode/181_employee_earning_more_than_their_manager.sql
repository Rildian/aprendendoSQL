-- employer: id, name, salary, managerId (employee)
-- questão horrivel

SELECT
    e1.name AS 'Employee'
FROM
    Employee AS e1
WHERE e1.Salary >
    (SELECT 
        salary 
    FROM 
        Employee AS e2 
    WHERE 
        e2.id = e1.managerId);


-- e2.id = e1.managerId, to selecionando os id da subquery que são iguais aos managerId da externa