CREATE DATABASE estoque;

USE estoque;

CREATE TABLE Fornecedor(
id_fornecedor int(11) AUTO_INCREMENT PRIMARY KEY,
razao_social varchar(180) NOT NULL,
cnpj varchar(50) NOT NULL,
endereco varchar(200) NOT NULL,
telefone varchar(50) NOT NULL
);

CREATE TABLE Produto(
id_produto int(11)NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome_produto varchar(150) NOT NULL,
valor double NOT NULL,
qtd_produto float NOT NULL,
data_entrada DATE NOT NULL,
id_fornecedor int(11),
FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
);

CREATE TABLE Saida(
    id_saida int(11) AUTO_INCREMENT PRIMARY KEY,
    qtd_saida float NOT NULL,
    valor double NOT NULL,
    data_saida DATE NOT NULL,
    id_produto int(11),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

