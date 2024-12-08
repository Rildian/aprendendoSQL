-- da todas as permissões p/ ana no database sakila
GRANT ALL ON sakila.*
TO ana;
-- ver todas as permissões q ela tem
SHOW GRANTS FOR ana;

-- garante TODOS os acessos a Rildian
GRANT ALL
ON *
TO Rildian@localhost;
SHOW GRANTS FOR Rildian@localhost;