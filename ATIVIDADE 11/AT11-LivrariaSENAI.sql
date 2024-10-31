CREATE DATABASE tb_livrariaSENAI;
USE tb_livrariaSENAI;


CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    cpf VARCHAR(11),
    rg VARCHAR(11),
    email VARCHAR(45)
);


CREATE TABLE CLIENTES_TELEFONES (
    id_telefone INT AUTO_INCREMENT PRIMARY KEY,
    telefone VARCHAR(15),
    CLIENTE_id_cliente INT,
    FOREIGN KEY (CLIENTE_id_cliente) REFERENCES CLIENTE(id_cliente)
);


CREATE TABLE CLIENTES_ENDERECO (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    rua VARCHAR(45),
    bairro VARCHAR(45),
    numero INT,
    cidade VARCHAR(45),
    estado VARCHAR(45),
    CLIENTE_id_cliente INT,
    FOREIGN KEY (CLIENTE_id_cliente) REFERENCES CLIENTE(id_cliente)
);


CREATE TABLE EDITORA (
    id_editora INT AUTO_INCREMENT PRIMARY KEY,
    nome_editora VARCHAR(45),
    nome_contato VARCHAR(45),
    email VARCHAR(45)
);


CREATE TABLE LIVRO (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(45),
    categoria VARCHAR(45),
    isbn VARCHAR(13),
    ano DATE,
    valor DECIMAL(10,2),
    autor VARCHAR(45),
    EDITORA_id_editora INT,
    FOREIGN KEY (EDITORA_id_editora) REFERENCES EDITORA(id_editora)
);


CREATE TABLE ESTOQUE (
    quantidade INT,
    LIVRO_id_livro INT,
    FOREIGN KEY (LIVRO_id_livro) REFERENCES LIVRO(id_livro)
);


CREATE TABLE PEDIDO (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data DATE,
    CLIENTE_id_cliente INT,
    FOREIGN KEY (CLIENTE_id_cliente) REFERENCES CLIENTE(id_cliente)
);


CREATE TABLE ITEM_PEDIDO (
    PEDIDO_id_pedido INT,
    LIVRO_id_livro INT,
    quantidade INT,
    PRIMARY KEY (PEDIDO_id_pedido, LIVRO_id_livro),
    FOREIGN KEY (PEDIDO_id_pedido) REFERENCES PEDIDO(id_pedido),
    FOREIGN KEY (LIVRO_id_livro) REFERENCES LIVRO(id_livro)
);

INSERT INTO CLIENTE (nome, cpf, rg, email) VALUES
('João Silva', '12345678900', '1234567', 'joao@email.com'),
('Maria Oliveira', '23456789001', '2345678', 'maria@email.com'),
('José Souza', '34567890123', '3456789', 'jose@email.com');

INSERT INTO CLIENTES_TELEFONES (telefone, CLIENTE_id_cliente) VALUES
('11987654321', 1),
('11987654322', 2);



INSERT INTO CLIENTES_ENDERECO (rua, bairro, numero, cidade, estado, CLIENTE_id_cliente) VALUES
('Rua A', 'Bairro 1', 10, 'São Paulo', 'SP', 1),
('Rua B', 'Bairro 2', 20, 'Rio de Janeiro', 'RJ', 2);



INSERT INTO EDITORA (nome_editora, nome_contato, email) VALUES
('Editora A', 'Carlos', 'contatoA@editora.com'),
('Editora B', 'Ana', 'contatoB@editora.com');


INSERT INTO LIVRO (titulo, categoria, isbn, ano, valor, autor, EDITORA_id_editora) VALUES
('Livro 1', 'Ficção', '9781234567890', '2020-01-01', 59.90, 'Autor 1', 1),
('Livro 2', 'Romance', '9781234567891', '2019-05-10', 45.50, 'Autor 2', 2);



INSERT INTO ESTOQUE (quantidade, LIVRO_id_livro) VALUES
(100, 1),
(50, 2);



INSERT INTO PEDIDO (data, CLIENTE_id_cliente) VALUES
('2023-10-01', 1),
('2023-10-02', 2);



INSERT INTO ITEM_PEDIDO (PEDIDO_id_pedido, LIVRO_id_livro, quantidade) VALUES
(1, 1, 2),
(1, 2, 1);

SELECT * FROM tb_livrariaSENAI;