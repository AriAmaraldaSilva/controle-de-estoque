drop DATABASE controle_de_estoque;
create database controle_de_estoque;
use controle_de_estoque;


CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY,
    nome_usuario CHAR,
    email CHAR,
    senha INT,
    cargo CHAR
);

CREATE TABLE Fornecedor (
    id_fornecedor INT PRIMARY KEY,
    razao_social CHAR,
    cnpj CHAR,
    telefone CHAR,
    endereco CHAR,
    FK_Usuario_id_usuario INT
);

CREATE TABLE Produto (
    id_produto INT PRIMARY KEY,
    nome_produto CHAR,
    marca CHAR,
    volume CHAR,
    valor FLOAT,
    FK_Usuario_id_usuario INT
);

CREATE TABLE Estoque (
    id_estoque INT PRIMARY KEY,
    qtd_produto FLOAT,
    validade DATE,
    FK_Produto_id_produto INT
);

CREATE TABLE Fornece (
    FK_Fornecedor_id_fornecedor INT,
    FK_Produto_id_produto INT
);

CREATE TABLE realiza_entrada (
    FK_Usuario_id_usuario INT,
    FK_Estoque_id_estoque INT,
    qtd_produto FLOAT,
    data DATE
);

CREATE TABLE realiza_saida (
    FK_Usuario_id_usuario INT,
    FK_Estoque_id_estoque INT,
    qtd_produto FLOAT,
    data DATE
);
 
ALTER TABLE Fornecedor ADD CONSTRAINT FK_Fornecedor_1
    FOREIGN KEY (FK_Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Produto ADD CONSTRAINT FK_Produto_1
    FOREIGN KEY (FK_Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Estoque ADD CONSTRAINT FK_Estoque_1
    FOREIGN KEY (FK_Produto_id_produto)
    REFERENCES Produto (id_produto)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Fornece ADD CONSTRAINT FK_Fornece_0
    FOREIGN KEY (FK_Fornecedor_id_fornecedor)
    REFERENCES Fornecedor (id_fornecedor)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Fornece ADD CONSTRAINT FK_Fornece_1
    FOREIGN KEY (FK_Produto_id_produto)
    REFERENCES Produto (id_produto)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE realiza_entrada ADD CONSTRAINT FK_realiza_entrada_0
    FOREIGN KEY (FK_Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE realiza_entrada ADD CONSTRAINT FK_realiza_entrada_1
    FOREIGN KEY (FK_Estoque_id_estoque)
    REFERENCES Estoque (id_estoque)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE realiza_saida ADD CONSTRAINT FK_realiza_saida_0
    FOREIGN KEY (FK_Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE realiza_saida ADD CONSTRAINT FK_realiza_saida_1
    FOREIGN KEY (FK_Estoque_id_estoque)
    REFERENCES Estoque (id_estoque)
    ON DELETE RESTRICT ON UPDATE RESTRICT;