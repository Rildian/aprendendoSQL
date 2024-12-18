CREATE UNLOGGED TABLE IF NOT EXISTS faculdade.pedidos (
	cliente_id INTEGER,
	dia DATE, 
	valor double precision
)  WITH (autovacuum_enabled = false);


CREATE UNLOGGED TABLE faculdade.funcionarios (
	nome TEXT
)  WITH (autovacuum_enabled = false);

BEGIN;

SET synchronous_commit = off; -- antes da operação


INSERT INTO pedidos (cliente_id, dia, valor)

SELECT

(1 + floor(random() * (SELECT MAX(id) FROM clientes)))::int AS cliente_id,

'2021-01-01'::date + (random() * (CURRENT_DATE - '2021-01-01'::date))::int AS dia,

round((random() * 5000000 + 100)::numeric, 2) AS valor

FROM generate_series(1, 5000000) s;

INSERT INTO funcionarios (nome)

SELECT
'Funcionario ' || s.id::text

FROM generate_series(1, 5000000) AS s(id);


SET synchronous_commit = on; -- depois da operação

COMMIT;


