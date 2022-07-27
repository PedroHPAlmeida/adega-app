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

