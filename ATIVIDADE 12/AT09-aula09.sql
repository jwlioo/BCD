DROP DATABASE IF EXISTS db_senai;
 
 CREATE DATABASE IF NOT EXISTS db_senai;
 
 USE db_senai;
 
 CREATE TABLE IF NOT EXISTS tb_curso (
 id_curso INT PRIMARY KEY AUTO_INCREMENT,
 nome_curso VARCHAR(45) NOT NULL UNIQUE,
 carga_horaria INT UNSIGNED,
 ano YEAR
 );
 INSERT INTO tb_curso (nome_curso, carga_horaria, ano) Value
 ('Engenharia de Software', 360, 2022),
 ('Administraçao', 400, 2021),
 ('Medicina', 360, Null),
 ('Direito', NULL, NULL),
 ('Arquitetura', 420, 2019),
 ('Psicologia', 480, 2023),
 ('Biomedicina', NULL, 2021),
 ('Educaçao Fisica', 360, 2022),
 ('Ciencia da Computaçao', 480, 2020),
 ('Engenharia Civil',400, 2018),
 ('Farmacia', 400, 2022),
 ('Veterinaria', 500, Null),
 ('Design Grafico', 360, 2023),
 ('Contabilidade', 400, 2019),
 ('Gestao de Recursos Humanos', 360,2021),
 ('Sistemas de informaçao', 480, 2022),
 ('Engenharia Elétrica', 400, 2020),
 ('Marketing', 360, 2021),
 ('Turismo', 320, 2023),
 ('Ciencias Biologicas', 420, 2019);
 
 desc tb_curso;
 
select*  from tb_curso
ORDER BY nome_curso DESC;
 
SELECT nome_curso, ano FROM tb_curso
ORDER BY ano DESC;

SELECT nome_curso, ano FROM tb_curso
WHERE ano = 2020
ORDER BY nome_curso;

SELECT nome_curso, ano FROM tb_curso
WHERE ano >2020
ORDER BY nome_curso;
 
 
 SELECT nome_curso, ano FROM tb_curso
WHERE ano <= 2020
ORDER BY nome_curso;

SELECT nome_curso, ano FROM tb_curso
WHERE ano != 2020
ORDER BY nome_curso;

SELECT nome_curso, ano FROM tb_curso
WHERE carga_horaria > 360 AND carga_horaria < 500
ORDER BY ano;
 
 SELECT nome_curso FROM tb_curso
 Where carga_horaria > 360 or ano = 2018
 ORDER BY nome_curso;
 
 
 SELECT nome_curso FROM tb_curso
 Where not carga_horaria > 360 or ano = 2018
 ORDER BY nome_curso;
 
 SELECT nome_curso, ano from tb_curso
 Where ano is NULL;

  SELECT nome_curso, ano from tb_curso
 Where ano IS NOT NULL;
 
  SELECT nome_curso, carga_horaria, ano FROM tb_curso
 Where carga_horaria BETWEEN 400 and 480
 ORDER BY ano asc, nome_curso desc;
 
 
 SELECT nome_curso, ano from tb_curso
 WHERE ano IN ( 2018, 2020,2023);
 
SELECT * FROM tb_curso
WHERE nome_curso LIKE 'A%';

SELECT * FROM tb_curso
WHERE nome_curso LIKE '%A';

SELECT * FROM tb_curso
WHERE nome_curso LIKE '%A%';

SELECT * FROM tb_curso
WHERE nome_curso NOT LIKE 'A%';

SELECT * FROM tb_curso
WHERE nome_curso LIKE 'Adm%o';

SELECT * FROM tb_curso
WHERE nome_curso LIKE 'Eng%a%';

SELECT * FROM tb_curso
WHERE nome_curso LIKE 'Eng%a__';

SELECT * FROM tb_curso
WHERE nome_curso LIKE 'Dir__to';

SELECT COUNT(*) FROM tb_curso;

SELECT COUNT(*) FROM tb_curso
where carga_horaria > 400;

SELECT MAX(carga_horaria) FROM tb_curso;

SELECT MAX(carga_horaria) FROM tb_curso
where ano = 2018;

SELECT MAX(carga_horaria) FROM tb_curso
where ano = 2020;

SELECT MIN(carga_horaria) FROM tb_curso
where ano = 2020;

SELECT SUM(carga_horaria) FROM tb_curso
where ano = 2021;

SELECT AVG(carga_horaria) AS Media
from tb_curso
WHERE ano = 2023;


SELECT carga_horaria AS Carga, COUNT(*) AS Contagem
FROM tb_curso
GROUP BY carga_horaria 
ORDER BY carga_horaria;

SELECT carga_horaria AS Carga, COUNT(*) AS Contagem
FROM tb_curso
WHERE ano > 2019
GROUP BY carga_horaria
HAVING carga_horaria > (SELECT AVG( carga_horaria) FROM tb_curso)
 ORDER BY carga_horaria