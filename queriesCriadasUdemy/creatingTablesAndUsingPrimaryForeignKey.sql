CREATE TABLE marcas (
	id INTEGER NOT NULL AUTO_INCREMENT,
	nomeDaMarca VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

-- inventario vai ser relacionado a marcas

CREATE TABLE inventario (
	id INTEGER NOT NULL AUTO_INCREMENT,
    modelo VARCHAR(255) NOT NULL,
    transmissao VARCHAR(255) NOT NULL,
	motor VARCHAR(255) NOT NULL,
    tipoCombustivel VARCHAR(255) NOT NULL,
    marcasId INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (marcasId) REFERENCES marcas(id)
);
-- a chave estrangeira (marcasId) se referencia ao id da tabela marcas