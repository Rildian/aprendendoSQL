SELECT
    email
FROM 
    Person
HAVING
    count(email) >= 2 