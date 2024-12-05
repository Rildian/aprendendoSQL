-- usos interessantes do operador LIKE

-- encontre os primeiros nomes que começam c/ a
SELECT 
	first_name, actor_id, last_name
FROM 
	actor
WHERE 
	first_name LIKE 'A%';


-- encontre primeiros nomes que terminam com A
SELECT 
	first_name, last_name, actor_id
FROM
	actor
WHERE 
	first_name LIKE '%A';

-- encontre qualquer nome q tenha a (qlqr posição)
SELECT 
	first_name, last_name, actor_id
FROM 
	actor
WHERE 
	first_name LIKE '%a%';

-- encontre o nome que tenha a exatamente na 2a posição
SELECT 
	first_name, last_name, actor_id
FROM 
	actor 
WHERE
	first_name LIKE '_a%';
    
-- pensa tipo:
/* quero a, antes (começo)? 
a%, 
quero depois? (fim) 
%a, a 
porcentagem indica isso /*