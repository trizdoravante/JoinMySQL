CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
    id_categoria INT PRIMARY KEY,
    nome_categoria VARCHAR(50),
    descricao_categoria VARCHAR(255)
);

CREATE TABLE tb_produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    preco DECIMAL(10, 2),
    estoque INT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);


INSERT INTO tb_categorias (id_categoria, nome_categoria, descricao_categoria)
VALUES
    (1, 'Medicamentos', 'Produtos para saúde e tratamentos médicos'),
    (2, 'Cosméticos', 'Produtos de beleza e cuidados pessoais'),
    (3, 'Higiene', 'Produtos para higiene pessoal e do lar'),
    (4, 'Vitaminas', 'Suplementos vitamínicos e minerais'),
    (5, 'Alimentos', 'Produtos alimentícios e suplementos');

INSERT INTO tb_produtos (id_produto, nome_produto, preco, estoque, id_categoria)
VALUES
    (1, 'Paracetamol 500mg', 10.50, 100, 1),
    (2, 'Shampoo Anticaspa', 15.75, 50, 2),
    (3, 'Sabonete Líquido', 5.25, 80, 3),
    (4, 'Vitamina C', 25.00, 30, 4),
    (5, 'Barrinha de Cereal', 2.50, 200, 5),
    (6, 'Ibuprofeno 400mg', 12.00, 75, 1),
    (7, 'Creme Hidratante', 20.50, 40, 2),
    (8, 'Escova Dental', 3.75, 150, 3);


SELECT * FROM tb_produtos WHERE preco > 50.00;

SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;

SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';

SELECT p.*, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria;

SELECT p.*, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Cosméticos';
