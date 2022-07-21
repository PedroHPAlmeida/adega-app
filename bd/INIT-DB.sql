/* ML_Adega: */
DROP DATABASE adega;
CREATE DATABASE IF NOT EXISTS adega;
USE adega;

CREATE TABLE funcionarios (
    id_funcionario BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cpf VARCHAR(12) NOT NULL,
    nome VARCHAR(81) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR (51) NOT NULL,
    senha VARCHAR(21) NOT NULL,
    nivel_acesso SMALLINT NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE fornecedores (
    id_fornecedor BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    razao_social VARCHAR(81) NOT NULL,
    nome_fantasia VARCHAR(81) NOT NULL,
    cnpj VARCHAR(15) NOT NULL, 
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR (51) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE clientes (
    id_cliente BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    telefone VARCHAR(15) NULL,
    email VARCHAR(51) NULL,
    tipo SMALLINT NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE clientes_pf (
    id_cliente BIGINT PRIMARY KEY,
    cpf VARCHAR(12) NOT NULL,
    nome VARCHAR(81) NULL
) ENGINE=InnoDB;

CREATE TABLE clientes_pj (
    id_cliente BIGINT PRIMARY KEY,
    cnpj VARCHAR(15) NOT NULL,
    nome_fantasia VARCHAR(81) NOT NULL,
    razao_social VARCHAR(81) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE produtos (
    id_produto BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(81) NOT NULL,
    marca VARCHAR(81) NOT NULL,
    quantidade_estoque BIGINT NOT NULL,
    volume DOUBLE NOT NULL,
    preco DOUBLE NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE materiais (
    id_material BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(81) NOT NULL,
    quantidade INTEGER NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE pagamentos (
    id_funcionario BIGINT NOT NULL,
    id_cliente BIGINT NOT NULL,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    tipo SMALLINT NOT NULL,
    status SMALLINT NOT NULL,
    PRIMARY KEY (id_cliente, id_funcionario)
) ENGINE=InnoDB;

CREATE TABLE compras (
    id_funcionario BIGINT NOT NULL,
    id_fornecedor BIGINT NOT NULL,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    PRIMARY KEY (id_fornecedor, id_funcionario)
) ENGINE=InnoDB;

CREATE TABLE vendas (
    id_funcionario BIGINT NOT NULL,
    id_cliente BIGINT NOT NULL,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    PRIMARY KEY (id_funcionario, id_cliente)
) ENGINE=InnoDB;

CREATE TABLE itens_compra (
    id_funcionario BIGINT NOT NULL,
    id_fornecedor BIGINT NOT NULL,
    id_produto BIGINT NOT NULL,
    quantidade BIGINT NOT NULL,
    PRIMARY KEY (id_fornecedor, id_produto, id_funcionario)
) ENGINE=InnoDB;

CREATE TABLE es_materiais (
    id_funcionario BIGINT NOT NULL,
    id_material BIGINT NOT NULL,
    data DATE NOT NULL,
    quantidade BIGINT NOT NULL,
    tipo BIT NOT NULL,
    PRIMARY KEY (id_material, id_funcionario)
) ENGINE=InnoDB;

CREATE TABLE itens_venda (
    id_funcionario BIGINT NOT NULL,
    id_cliente BIGINT NOT NULL,
    id_produto BIGINT NOT NULL,
    quantidade BIGINT NOT NULL,
    PRIMARY KEY (id_funcionario, id_produto, id_cliente)
) ENGINE=InnoDB;

CREATE TABLE enderecos_cliente (
    id_cliente BIGINT PRIMARY KEY NOT NULL,
    cep VARCHAR(9) NOT NULL,
    numero VARCHAR(6) NOT NULL,
    logradouro VARCHAR(81) NOT NULL,
    bairro VARCHAR(81) NOT NULL,
    cidade VARCHAR(81) NOT NULL,
    estado VARCHAR(81) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE enderecos_fornecedor (
    id_fornecedor BIGINT PRIMARY KEY NOT NULL,
    cep VARCHAR(9) NOT NULL,
    numero VARCHAR(6) NOT NULL,
    logradouro VARCHAR(81) NOT NULL,
    bairro VARCHAR(81) NOT NULL,
    cidade VARCHAR(81) NOT NULL,
    estado VARCHAR(81) NOT NULL
) ENGINE=InnoDB;
 
ALTER TABLE pagamentos ADD CONSTRAINT fk_venda_pagamento
    FOREIGN KEY (id_cliente, id_funcionario)
    REFERENCES vendas (id_funcionario, id_cliente);

ALTER TABLE clientes_pf ADD CONSTRAINT fk_cliente_pf
    FOREIGN KEY (id_cliente)
    REFERENCES clientes (id_cliente);

ALTER TABLE clientes_pj ADD CONSTRAINT fk_cliente_pj
    FOREIGN KEY (id_cliente)
    REFERENCES clientes (id_cliente);
 
ALTER TABLE compras ADD CONSTRAINT fk_fornecedor_compra
    FOREIGN KEY (id_fornecedor)
    REFERENCES fornecedores (id_fornecedor);
 
ALTER TABLE compras ADD CONSTRAINT fk_funcionario_compras
    FOREIGN KEY (id_funcionario)
    REFERENCES funcionarios (id_funcionario);
 
ALTER TABLE vendas ADD CONSTRAINT fk_funcionario_vendas
    FOREIGN KEY (id_funcionario)
    REFERENCES funcionarios (id_funcionario);
 
ALTER TABLE vendas ADD CONSTRAINT fk_cliente_vendas
    FOREIGN KEY (id_cliente)
    REFERENCES clientes (id_cliente);
 
ALTER TABLE itens_compra ADD CONSTRAINT fk_produto_item_compra
    FOREIGN KEY (id_produto)
    REFERENCES produtos (id_produto)
    ON DELETE RESTRICT;
 
ALTER TABLE itens_compra ADD CONSTRAINT fk_compra_item_compra
    FOREIGN KEY (id_fornecedor, id_funcionario)
    REFERENCES compras (id_funcionario, id_fornecedor);
 
ALTER TABLE es_materiais ADD CONSTRAINT fk_funcionario_es_mat
    FOREIGN KEY (id_funcionario)
    REFERENCES funcionarios (id_funcionario)
    ON DELETE RESTRICT;
 
ALTER TABLE es_materiais ADD CONSTRAINT fk_material_es_mat
    FOREIGN KEY (id_material)
    REFERENCES materiais (id_material)
    ON DELETE RESTRICT;
 
ALTER TABLE itens_venda ADD CONSTRAINT fk_produto_item_venda
    FOREIGN KEY (id_produto)
    REFERENCES produtos (id_produto)
    ON DELETE RESTRICT;
 
ALTER TABLE itens_venda ADD CONSTRAINT fk_venda_item_venda
    FOREIGN KEY (id_funcionario, id_cliente)
    REFERENCES vendas (id_funcionario, id_cliente);
 
ALTER TABLE enderecos_cliente ADD CONSTRAINT fk_cliente_endereco
    FOREIGN KEY (id_cliente)
    REFERENCES clientes (id_cliente);
 
ALTER TABLE enderecos_fornecedor ADD CONSTRAINT fk_fornecedor_endereco
    FOREIGN KEY (id_fornecedor)
    REFERENCES fornecedores (id_fornecedor);