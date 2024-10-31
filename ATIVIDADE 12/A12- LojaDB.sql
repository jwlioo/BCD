CREATE DATABASE lojadb;

use lojadb;

 CREATE TABLE IF NOT EXISTS tb_vendas(
 ID_NF int,
 ID_ITEM int,
 COD_PROD INT,
 VALOR_UNIT DECIMAL (10, 2),
 QUANTIDADE int,
 DESCONTO INT
 );

SELECT * FROM tb_vendas;

INSERT INTO tb_vendas(id_nf, id_item, cod_prod, valor_unit, quantidade, desconto) VALUES
(1,1,1,25.00, 10,5),
(1,2,2,13.50,3, NULL),
(1,3,3, 15.00,2, NULL),
(1,4,4, 10.00,5, NULL),
(1,5,5, 30.00,1, NULL),
(2,1,3,15.00, 4 , NULL),
(2,2,5,10.00,5, NULL),
(2,3,4, 30.00,7, NULL),
(3,1,5,25.00, 5, NULL),
(4,4,2,13.50,15,5),
(5,1,3, 15.00,3, NULL),
(6, 1,5, 25.00,22,15),
(6,2 ,3,15.00, 25,20),
(6,3,4, 25.00, 10,3 ),
(7,1,5,13.50,10,4),
(7,3,4, 30.00, 10, 1);

SELECT * FROM tb_vendas;

