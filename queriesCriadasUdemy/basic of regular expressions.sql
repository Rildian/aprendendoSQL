-- uso do regular expression
USE sakila;
-- comando pra verificar se há a letra a na string
SELECT 
	*
FROM 
	actor
WHERE
	first_name REGEXP 'a';

-- selecionar nomes que comecem c/ a letra A    
SELECT 
	*
FROM 
	actor
WHERE first_name REGEXP '^a';

/* selecione atores q comecem com 
a letra A e contenha B */

SELECT 
	*
FROM 
	actor
WHERE first_name REGEXP '^a|b';

-- nomes que comecem com a ou b
SELECT 
	*
FROM 
	actor
WHERE first_name REGEXP '^a|^b';

/* retorne combinações de ga, 
independente
da posição, mas retorne strings q contenha
*/ 
SELECT 
	*
FROM 
	actor 
WHERE first_name REGEXP '[g]a';

-- combinações de ea, ga
SELECT 
	*
FROM 
	actor 
WHERE first_name REGEXP '[eg]a';

/* as mesmas combinações, 
mas começando
por elas */
SELECT 
	* 
FROM 
	actor
WHERE 
	first_name REGEXP '^[eg]a';

/* encontre nomes que 
comecem nesse intervalo de a-d */

SELECT 
	* 
FROM 
	actor
WHERE 
	first_name REGEXP '^[a-d]'
ORDER BY
	first_name;

