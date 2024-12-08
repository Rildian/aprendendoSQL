CREATE USER priscila IDENTIFIED BY 'Test';
-- é assim que dá permissão
GRANT 
	SELECT, UPDATE, DELETE
    ON sakila.*
TO priscila;

-- é assim que seta senha
SET PASSWORD FOR priscila = '32';

-- remover os privilégios
REVOKE 
	UPDATE ON sakila.*
FROM priscila

-- revoke (o que?) em qual tabela? De quem?
