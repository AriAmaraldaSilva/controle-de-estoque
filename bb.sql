create database controle_de_estoque;
use controle_de_estoque ;


CREATE TABLE Usuario (
id_usuario int(11) PRIMARY KEY AUTO_INCREMENT,
nome_usuario char(50) not null unique,
email char(100) not null unique,
senha char(50) not null,
cargo char(100)not null
);
CREATE TABLE Fornecedor (
id_fornecedor int(11) PRIMARY KEY AUTO_INCREMENT,
razao_social char(100) not null unique,
cnpj char(18) not null unique,
endereco char(100) not null,
telefone char(11) not null,
id_usuario int(11),
FOREIGN KEY(id_usuario) REFERENCES Usuario (id_usuario)
);
CREATE TABLE Produto (
id_produto int(11) PRIMARY KEY AUTO_INCREMENT,
nome_produto char(100) not null unique,
marca char(100) not null,
volume char(50) not null,
valor int not null,
id_usuario int(11),
FOREIGN KEY(id_usuario) REFERENCES Usuario (id_usuario)
);
CREATE TABLE Fornece (
id_fornecedor int(11),
id_produto int(11),
FOREIGN KEY(id_fornecedor) REFERENCES Fornecedor (id_fornecedor),
FOREIGN KEY(id_produto) REFERENCES Produto (id_produto)
);
CREATE TABLE Entrada (
id_entrada int(11) PRIMARY KEY AUTO_INCREMENT,
fornecedor char(100) not null,
nome_produto char(100) not null,
qtd_produto int not null,
valor int not null,
data_entrada date not null,
id_usuario int(11),
FOREIGN KEY(id_usuario) REFERENCES Usuario (id_usuario)
);
CREATE TABLE Item (
id_item int(11) PRIMARY KEY AUTO_INCREMENT,
nome_item char(100) not null,
qtd_item int not null,
volume char(100) not null,
validade date not null,
valor int not null
);
CREATE TABLE Existem_em (
id_item int(11),
id_entrada int(11),
FOREIGN KEY(id_item) REFERENCES Item (id_item),
FOREIGN KEY(id_entrada) REFERENCES Entrada (id_entrada)
);
CREATE TABLE É (
id_item int(11),
id_produto int(11),
FOREIGN KEY(id_item) REFERENCES Item (id_item),
FOREIGN KEY(id_produto) REFERENCES Produto (id_produto)
);
CREATE TABLE Estoque (
id_estoque int(11) PRIMARY KEY AUTO_INCREMENT,
nome_produto char(100) not null unique,
qtd_produto int not null,
id_item int(11) not null,
FOREIGN KEY(id_item) REFERENCES Item (id_item)
);
CREATE TABLE Saida (
id_saida int(11) PRIMARY KEY AUTO_INCREMENT,
nome_items char(100) not null,
qtd_items int not null,
valor int not null,
data_saida date not null,
id_usuario int(11) not null,
FOREIGN KEY(id_usuario) REFERENCES Usuario (id_usuario)
);

CREATE TABLE Exitem_em1 (
id_saida int(11),
id_item int(11),
FOREIGN KEY(id_saida) REFERENCES Saida (id_saida),
FOREIGN KEY(id_item) REFERENCES Item (id_item)
);



CREATE TABLE Fornecedor (
    id_fornecedor INT PRIMARY KEY,
    razao_social CHAR,
    cnpj CHAR,
    telefone CHAR,
    endereco CHAR,
    FK_Usuario_id_usuario INT,
    FOREIGN KEY (FK_Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)

);
