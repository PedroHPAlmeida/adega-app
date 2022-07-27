CREATE TABLE funcionarios (
    id_funcionario BIGSERIAL PRIMARY KEY NOT NULL,
    cpf VARCHAR(12) NOT NULL,
    nome VARCHAR(81) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR (51) NOT NULL,
    senha VARCHAR(21) NOT NULL,
    nivel_acesso SMALLINT NOT NULL
);

CREATE TABLE fornecedores (
    id_fornecedor BIGSERIAL PRIMARY KEY NOT NULL,
    razao_social VARCHAR(81) NOT NULL,
    nome_fantasia VARCHAR(81) NOT NULL,
    cnpj VARCHAR(15) NOT NULL, 
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR (51) NOT NULL
);

CREATE TABLE clientes (
    id_cliente BIGSERIAL PRIMARY KEY NOT NULL,
    telefone VARCHAR(15) NULL,
    email VARCHAR(51) NULL,
    tipo SMALLINT NOT NULL
);

CREATE TABLE clientes_pf (
    id_cliente BIGINT PRIMARY KEY,
    cpf VARCHAR(12) NOT NULL,
    nome VARCHAR(81) NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente) 
);

CREATE TABLE clientes_pj (
    id_cliente BIGINT PRIMARY KEY,
    cnpj VARCHAR(15) NOT NULL,
    nome_fantasia VARCHAR(81) NOT NULL,
    razao_social VARCHAR(81) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente) 
);

