DROP TABLE Cliente;
CREATE TABLE Cliente 
( 
 ID INT PRIMARY KEY AUTO_INCREMENT,  
 Nome VARCHAR (100) NOT NULL,  
 CPF CHAR (14) UNIQUE,   
 Email VARCHAR (200) NOT NULL UNIQUE,  
 Senha VARCHAR(255) NOT NULL,  
 Celular CHAR(11)
); 

CREATE TABLE Compra 
( 
 Idcliente INT,  
 Idendereço INT,  
 data DATE NOT NULL,  
 Forma_pagamente VARCHAR (200) NOT NULL,  
 Valor_total FLOAT NOT NULL,  
 UNIQUE (Idendereço)
); 

CREATE TABLE Endereço 
( 
 Idcliente INT,  
 Rua VARCHAR (300) NOT NULL,  
 Numero INT,  
 Bairro VARCHAR (200) NOT NULL,  
 Cidade VARCHAR (100) NOT NULL,  
 Estado VARCHAR (100) NOT NULL,  
 UNIQUE (Numero)
); 
CREATE TABLE Produto (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(100) NOT NULL,
  Descricao VARCHAR(200) NOT NULL,
  Categoria VARCHAR(200) NOT NULL,
  Preco DECIMAL(10,2) NOT NULL,
  Caminho_img VARCHAR(400) NOT NULL,
  Quantidade INT NOT NULL DEFAULT 0
);
CREATE TABLE Possui (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Id_compra INT NOT NULL,
  Id_produto INT NOT NULL,
  Quantidade INT NOT NULL,
  Valor_unitario DECIMAL(10,2) NOT NULL,
  UNIQUE (Id_compra, Id_produto),
  FOREIGN KEY (Id_compra) REFERENCES Compra(id),
  FOREIGN KEY (Id_produto) REFERENCES Produto(id)
);
ALTER TABLE Compra ADD FOREIGN KEY(Idcliente) REFERENCES Cliente (Idcliente)
ALTER TABLE Compra ADD FOREIGN KEY(Idendereço) REFERENCES Endereço (Idendereço)
ALTER TABLE Endereço ADD FOREIGN KEY(Idcliente) REFERENCES Cliente (Idcliente)
ALTER TABLE Possui ADD FOREIGN KEY(ID) REFERENCES Compra (ID)
ALTER TABLE Possui ADD FOREIGN KEY(ID) REFERENCES Produto (ID)
