CREATE TABLE ofensiva (
	nome VARCHAR(50),
    presente VARCHAR(3),
    dia DATETIME 
);

WITH criacao_da_ofensiva AS (
	SELECT
		nome, presente, dia,
			CASE
			WHEN
				LAG(dia, 1, 0) 
				OVER (PARTITION BY nome ORDER BY dia) =
                dia - INTERVAL 1 DAY
                THEN 0
					ELSE 1
			END AS eh_uma_nova_ofensiva
		FROM ofensiva
		WHERE presente = "Sim"),
juntar_ofensivas AS (
	SELECT
		nome, dia, presente,
        SUM(eh_uma_nova_ofensiva) OVER (PARTITION BY nome ORDER BY dia) AS grupos_de_ofensivas
        FROM criacao_da_ofensiva
),
tamanho_da_ofensiva AS (
	SELECT 
		nome, grupos_de_ofensivas,
        COUNT(*) AS dias_consecutivos,
        MAX(dia) AS dia_recente
	FROM juntar_ofensivas
		GROUP BY nome, grupos_de_ofensivas
),
ofensiva_mais_recente AS (
	SELECT 
		nome, dias_consecutivos, dia_recente,
        ROW_NUMBER() OVER (PARTITION BY nome ORDER BY dia_recente DESC) AS omr
	FROM tamanho_da_ofensiva
)

	SELECT
		nome, dias_consecutivos
        FROM ofensiva_mais_recente
			WHERE omr = 1
		ORDER BY
			dias_consecutivos DESC;