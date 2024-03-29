CREATE TABLE funcionarios (
    id_funcionario BIGSERIAL PRIMARY KEY NOT NULL,
    cpf VARCHAR(12) NOT NULL,
    nome VARCHAR(81) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR (51) NOT NULL,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE funcionario_perfis (
    id_funcionario BIGINT NOT NULL,
    id_perfil BIGINT NOT NULL,
    
    PRIMARY KEY (id_funcionario, id_perfil),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id_funcionario),
    FOREIGN KEY (id_perfil) REFERENCES perfis (id_perfil)
);

CREATE TABLE perfis (
    id_perfil BIGSERIAL PRIMARY KEY NOT NULL,
    nome VARCHAR(20) NOT NULL
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
    tipo VARCHAR(3) NOT NULL
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

CREATE TABLE produtos (
    id_produto BIGSERIAL PRIMARY KEY NOT NULL,
    nome VARCHAR(81) NOT NULL,
    marca VARCHAR(81) NOT NULL,
    quantidade_estoque BIGINT NOT NULL,
    volume REAL NOT NULL,
    preco REAL NOT NULL
);

CREATE TABLE materiais (
    id_material BIGSERIAL PRIMARY KEY NOT NULL,
    nome VARCHAR(81) NOT NULL,
    quantidade INTEGER NOT NULL
);

CREATE TABLE pagamentos (
    id_pagamento BIGSERIAL NOT NULL,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    tipo VARCHAR(12) NOT NULL,
    status VARCHAR(12) NOT NULL
);

CREATE TABLE compras (
    id_funcionario BIGINT NOT NULL,
    id_fornecedor BIGINT NOT NULL,
    data DATE NOT NULL,
    hora TIME NOT NULL,

    PRIMARY KEY (id_funcionario, id_fornecedor),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id_funcionario),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores (id_fornecedor) 
);

CREATE TABLE vendas (
    id_venda BIGSERIAL PRIMARY KEY NOT NULL,
    id_funcionario BIGINT NOT NULL,
    id_cliente BIGINT NOT NULL,
    id_pagamento BIGINT NOT NULL, /*para permitir vendas sem pagamento (fiado) basta remover o atributo 'not null'*/
    data DATE NOT NULL,
    hora TIME NOT NULL,

    FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id_funcionario),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
    FOREIGN KEY (id_pagamento) REFERENCES pagamentos (id_pagamento) 
);

CREATE TABLE itens_compra (
    id_funcionario BIGINT NOT NULL,
    id_fornecedor BIGINT NOT NULL,
    id_produto BIGINT NOT NULL,
    quantidade BIGINT NOT NULL,
    preco_unitario REAL NOT NULL,

    PRIMARY KEY (id_fornecedor, id_produto, id_funcionario),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id_funcionario),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores (id_fornecedor),
    FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
);

CREATE TABLE es_materiais (
    id_funcionario BIGINT NOT NULL,
    id_material BIGINT NOT NULL,
    data DATE NOT NULL,
    quantidade BIGINT NOT NULL,
    tipo VARCHAR(12) NOT NULL,

    PRIMARY KEY (id_funcionario, id_material),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id_funcionario),
    FOREIGN KEY (id_material) REFERENCES materiais (id_material)
);

CREATE TABLE itens_venda (
    id_item_venda BIGSERIAL PRIMARY KEY NOT NULL,
    id_venda BIGINT NOT NULL,
    id_produto BIGINT NOT NULL,
    quantidade BIGINT NOT NULL,
    preco_unitario REAL NOT NULL,

    FOREIGN KEY (id_venda) REFERENCES vendas (id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
);

CREATE TABLE enderecos_cliente (
    id_cliente BIGINT PRIMARY KEY NOT NULL,
    cep VARCHAR(9) NOT NULL,
    numero VARCHAR(6) NOT NULL,
    logradouro VARCHAR(81) NOT NULL,
    bairro VARCHAR(81) NOT NULL,
    cidade VARCHAR(81) NOT NULL,
    estado VARCHAR(81) NOT NULL,

    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

CREATE TABLE enderecos_fornecedor (
    id_fornecedor BIGINT PRIMARY KEY NOT NULL,
    cep VARCHAR(9) NOT NULL,
    numero VARCHAR(6) NOT NULL,
    logradouro VARCHAR(81) NOT NULL,
    bairro VARCHAR(81) NOT NULL,
    cidade VARCHAR(81) NOT NULL,
    estado VARCHAR(81) NOT NULL,

    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores (id_fornecedor)
);
