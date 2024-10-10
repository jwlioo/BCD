CREATE DATABASE Livraria;

use Livraria

-- criando tabela cliente
CREATE TABLE CLIENTE (
 id_cliente INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(45), 
 cpf VARCHAR(11), 
 rg VARCHAR(11), 
 email VARCHAR(45) 
 ); 
 -- criando tabela telefone
 CREATE TABLE CLIENTES_TELEFONE ( 
 id_telefone INT PRIMARY KEY AUTO_INCREMENT, 
 telefone VARCHAR(15), 
 CLIENTE_id_cliente INT, 
 FOREIGN KEY (CLIENTE_id_cliente) REFERENCES CLIENTE(id_cliente) 
 ); 
 -- criando tabela endereco de clientes
 CREATE TABLE CLIENTES_ENDERECO ( 
 id_endereco INT PRIMARY KEY AUTO_INCREMENT, 
 rua VARCHAR(45), 
 numero INT, 
 cidade VARCHAR(45), 
 estado VARCHAR(45), 
 CLIENTE_id_cliente INT, FOREIGN KEY (CLIENTE_id_cliente) 
 REFERENCES CLIENTE(id_cliente) 
 ); 
  -- criando tabela pedido
 CREATE TABLE PEDIDO ( 
 id_pedido INT PRIMARY KEY AUTO_INCREMENT, 
 valor DECIMAL(10, 2), 
 data DATE, 
 CLIENTE_id_cliente INT, 
 FOREIGN KEY (CLIENTE_id_cliente) REFERENCES CLIENTE(id_cliente)
 );
 -- criando tabela editora
  CREATE TABLE EDITORA ( 
 id_editora INT PRIMARY KEY AUTO_INCREMENT, 
 nome_editora VARCHAR(30), 
 nome_contato VARCHAR(30), 
 email VARCHAR(45), 
 contato VARCHAR(20)
 );
 
 -- criando tabela livro
 CREATE TABLE LIVRO ( 
 id_livro INT PRIMARY KEY AUTO_INCREMENT, 
 titulo VARCHAR(45), 
 categoria VARCHAR(45), 
 isbn VARCHAR(13), 
 ano DATE, 
 valor DECIMAL(10, 2), 
 autor VARCHAR(45), 
 EDITORA_id_editora INT, 
 FOREIGN KEY (EDITORA_id_editora) REFERENCES EDITORA(id_editora)
 ); 
 
-- criando tabela pedido
 
 CREATE TABLE ITEM_PEDIDO ( 
 quantidade INT, 
 valor DECIMAL(10, 2), 
 PEDIDO_id_pedido INT, 
 LIVRO_id_livro INT, PRIMARY KEY (PEDIDO_id_pedido, LIVRO_id_livro), 
 FOREIGN KEY (PEDIDO_id_pedido) REFERENCES PEDIDO(id_pedido), 
 FOREIGN KEY (LIVRO_id_livro) REFERENCES LIVRO(id_livro)
 ); 
 
-- criando tabela estoque 
 
CREATE TABLE ESTOQUE ( 
quantidade INT, 
LIVRO_id_livro INT, 
PRIMARY KEY (LIVRO_id_livro), 
FOREIGN KEY (LIVRO_id_livro) REFERENCES LIVRO(id_livro) );