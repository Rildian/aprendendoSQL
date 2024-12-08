/* estrategia: usar length na coluna de profissao
e ai o numero resultante sera o id daquela profissao
*/
-- Rildian Beserra 552395
-- vamos criar uma coluna

ALTER TABLE faculdade.cliente 
ADD COLUMN idprofissao INTEGER;

-- agora vamos modificar a coluna usando o lenght()
UPDATE faculdade.cliente
SET 
	idprofissao = LENGTH(profissao)

SELECT idprofissao FROM faculdade.cliente

-- posso deletar a coluna profissao caso necessario