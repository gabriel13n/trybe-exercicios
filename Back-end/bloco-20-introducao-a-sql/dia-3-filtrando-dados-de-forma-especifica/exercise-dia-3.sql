--  Para realizar as tarefas do 1 ao 7, restaure o seguinte banco de dados:

DROP SCHEMA IF EXISTS PecasFornecedores;
CREATE SCHEMA PecasFornecedores;
USE PecasFornecedores;

CREATE TABLE Pecas (
  code INTEGER PRIMARY KEY NOT NULL,
  name TEXT NOT NULL
);

CREATE TABLE Fornecedores (
  code VARCHAR(40) PRIMARY KEY NOT NULL,
  name TEXT NOT NULL
);

CREATE TABLE Fornecimentos (
  code INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  peca INTEGER,
  FOREIGN KEY (peca) REFERENCES Pecas (code),
  Fornecedor VARCHAR(40),
  FOREIGN KEY (fornecedor) REFERENCES Fornecedores (code),
  Preco INTEGER NOT NULL
);

CREATE TABLE Vendas (
  code INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  fornecimento INTEGER,
  quantity INTEGER,
  order_date DATETIME,
  FOREIGN KEY (fornecimento) REFERENCES Fornecimentos (code)
);

INSERT INTO Fornecedores(code, name)
  VALUES ('ROB', 'Robauto SA'),
    ('CNF', 'Confiauto LTDA'),
    ('MAP', 'Malok Auto Peças'),
    ('INF', 'Infinity Peças LTDA');

INSERT INTO Pecas(code, name)
  VALUES (1, 'Rebimboca'),
    (2, 'Parafuseta'),
    (3, 'Grampola'),
    (4, 'Grapeta');

INSERT INTO Fornecimentos(peca, fornecedor, preco)
  VALUES (1, 'CNF', 10),
    (1, 'ROB', 15),
    (2, 'CNF', 20),
    (2, 'ROB', 25),
    (2, 'MAP', 14),
    (3, 'INF', 50),
    (3, 'MAP', 45),
    (4, 'CNF', 5),
    (4, 'ROB', 7);

INSERT INTO Vendas(fornecimento, quantity, order_date)
  VALUES (1, 3, '2017-05-22 11:28:36'),
    (2, 2, '2018-03-22 11:35:24'),
    (3, 8, '2018-11-16 15:51:36'),
    (3, 10, '2019-02-13 13:23:22'),
    (8, 5, '2019-06-11 12:22:48'),
    (6, 1, '2019-09-07 09:53:58'),
    (7, 3, '2020-01-05 08:39:33'),
    (9, 5, '2020-05-13 14:05:19');

-- Faça uma consulta que retorne todas as peças que começam com as letras GR

SELECT 
    *
FROM
    PecasFornecedores.Pecas
WHERE
    name LIKE 'GR%'
;

-- Agora, escreva uma query para retornar todos os fornecimentos em que a coluna peca possua o valor 2. Organize o resultado por ordem alfabética de fornecedor.

SELECT 
    *
FROM
    PecasFornecedores.Fornecimentos
WHERE
    peca IN (2)
ORDER BY fornecedor
;

-- Em seguida, faça uma consulta para exibir as peças, preço e fornecedor de todos os fornecimentos em que o código do fornecedor tenha a letra N.

SELECT 
    peca, preco, fornecedor
FROM
    PecasFornecedores.Fornecimentos
WHERE
    Fornecedor LIKE '%N%'

;

-- Avante, falta pouco! Escreva uma query para exibir todas as informações dos fornecedores que são empresas limitadas (LTDA). Ordene esses resultados em ordem alfabética decrescente.

SELECT 
    *
FROM
    PecasFornecedores.Fornecedores
WHERE
    name LIKE '%LTDA'
ORDER BY name DESC
;

--Agora, faça uma consulta para exibir o número de empresas (fornecedores) que contém a letra F no código.

SELECT 
    COUNT(*)
FROM
    PecasFornecedores.Fornecedores
WHERE
    code LIKE '%F%';

-- Agora escreva uma query para exibir os fornecimentos onde as peças custam mais de R$15,00 e menos de $40,00. Ordene os resultados por ordem crescente.

SELECT 
    *
FROM
    PecasFornecedores.Fornecimentos
WHERE
    Preco BETWEEN 15 AND 40
ORDER BY Preco;

-- Por fim, faça uma query para exibir o número de vendas feitas entre o dia 15/04/2018 e o dia 30/07/2019

USE PecasFornecedores;
SELECT 
    COUNT(*)
FROM
    Vendas
WHERE
    DATE(order_date) BETWEEN '2018-04-15' AND '2019-07-30';