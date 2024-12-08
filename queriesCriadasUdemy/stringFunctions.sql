-- remover todos os espaços em brancos
SELECT TRIM(' DEXTER MORGAN   ') AS 'Remover espaços em branco';
-- remover todos os espaços em branco da direita
SELECT RTRIM('DEXTER      ') AS 'Direita';
-- remover todos os espaços em branco da esquerda
SELECT LTRIM('   DEXTER') AS 'Esquerda';
-- remove caracteres repetidos E espaços em brancos
SELECT TRIM(BOTH 'b' FROM 'bbbbbDEXTER   ');
-- remove caracteres repetidos do INICIO e espaços em branco
SELECT TRIM(LEADING 'a' FROM  'aaaaaaaaaaDexter');
-- remove caracteres repetidos do FINAL e espaços em branco
SELECT TRIM(TRAILING 'c' FROM 'Dexterccccccc');

-- localizar a posição de um caractere na string
SELECT LOCATE('D', 'Dexter');

-- mudar os upper/lower case
-- upper casa
SELECT ucase('debra morgan');
-- lower case
SELECT lcase('DEBRA MORGAN');

-- pegar caracteres a partir de x posição
-- da direita
SELECT RIGHT('Dexter Morgan', 2);
-- da esquerda
SELECT LEFT('Debra Morgan', 2);