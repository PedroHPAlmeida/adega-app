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
    id_funcionario BIGINT NOT NULL,
    id_cliente BIGINT NOT NULL,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    tipo SMALLINT NOT NULL,
    status SMALLINT NOT NULL,

    PRIMARY KEY (id_cliente, id_funcionario),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id_funcionario) 
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
    id_funcionario BIGINT NOT NULL,
    id_cliente BIGINT NOT NULL,
    data DATE NOT NULL,
    hora TIME NOT NULL,

    PRIMARY KEY (id_funcionario, id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id_funcionario),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente) 
);

CREATE TABLE itens_compra (
    id_funcionario BIGINT NOT NULL,
    id_fornecedor BIGINT NOT NULL,
    id_produto BIGINT NOT NULL,
    quantidade BIGINT NOT NULL,

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
    tipo BIT NOT NULL,

    PRIMARY KEY (id_funcionario, id_material),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id_funcionario),
    FOREIGN KEY (id_material) REFERENCES materiais (id_material)
);

CREATE TABLE itens_venda (
    id_funcionario BIGINT NOT NULL,
    id_cliente BIGINT NOT NULL,
    id_produto BIGINT NOT NULL,
    quantidade BIGINT NOT NULL,

    PRIMARY KEY (id_funcionario, id_cliente, id_produto),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id_funcionario),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
);
