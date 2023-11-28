CREATE DATABASE loja;
use loja;

CREATE TABLE estado (
    Id INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Uf char(2) NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE municipio (
    Id INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Cod INT,
    fk_id INT, 
    PRIMARY KEY (id),
    CONSTRAINT fk_estado FOREIGN KEY (fk_id) REFERENCES estado(Id)
);

CREATE TABLE cliente (
    Id INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Cpf char(11),
    Celular char(11),
    EndNumero INT,
    EndMunicipio INT,
    EndCEP char(8),
    Municipio_id INT, 
    PRIMARY KEY (id),
    CONSTRAINT fk_municipio FOREIGN KEY (Municipio_id) REFERENCES municipio(Id)
);


CREATE TABLE conta_receber (
    Id INT NOT NULL AUTO_INCREMENT,
    cliente_id INT, 
    factura_ventaid INT,
    dataconta DATE,
    data_vencimiento DATE,
    valor DECIMAL (18.2),
    situaçao ENUM ('1','2','3'),
    PRIMARY KEY (Id),
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(Id)
);






