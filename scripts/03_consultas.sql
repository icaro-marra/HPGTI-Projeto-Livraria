-- DQL - Consultas Obrigatórias (LivrariaProjetoFinal)
-- Projeto Final - HPGTI

USE LivrariaProjetoFinal;

-- 1. Listar todos os livros com seus respectivos autores e categorias.
SELECT 
    l.id_livro,
    l.no_titulo AS titulo_livro,
    a.no_autor AS autor,
    c.no_categoria AS categoria
FROM livros l
INNER JOIN autores a ON l.id_autor = a.id_autor
INNER JOIN categorias c ON l.id_categoria = c.id_categoria;

-- 2. Listar todos os livros e suas vendas, incluindo livros que ainda não foram vendidos.
SELECT 
    l.id_livro,
    l.no_titulo AS titulo_livro,
    v.id_venda,
    v.nome_cliente,
    v.quantidade,
    v.data_venda,
    v.status_venda
FROM livros l
LEFT JOIN vendas v ON l.id_livro = v.id_livro;

-- 3. Listar todas as vendas com o título do livro vendido.
SELECT 
    v.id_venda,
    v.nome_cliente,
    l.no_titulo AS titulo_livro,
    v.quantidade,
    v.data_venda
FROM vendas v
INNER JOIN livros l ON v.id_livro = l.id_livro;

-- 4. Listar todos os livros vendidos, mostrando título, quantidade vendida e data da venda.
SELECT 
    l.no_titulo AS titulo_livro,
    v.quantidade AS quantidade_vendida,
    v.data_venda
FROM vendas v
INNER JOIN livros l ON v.id_livro = l.id_livro;

-- 5. Exibir os livros que ainda não foram vendidos.
SELECT 
    l.id_livro,
    l.no_titulo AS titulo_livro,
    l.qtd_estoque
FROM livros l
LEFT JOIN vendas v ON l.id_livro = v.id_livro
WHERE v.id_venda IS NULL;

-- 6. Exibir os livros vendidos utilizando INNER JOIN.
SELECT DISTINCT
    l.id_livro,
    l.no_titulo AS titulo_livro
FROM livros l
INNER JOIN vendas v ON l.id_livro = v.id_livro;

-- 7. Exibir todos os livros, inclusive os que não possuem venda, utilizando LEFT JOIN.
SELECT 
    l.id_livro,
    l.no_titulo AS titulo_livro,
    v.id_venda
FROM livros l
LEFT JOIN vendas v ON l.id_livro = v.id_livro;

-- 8. Exibir todas as vendas e seus respectivos livros utilizando RIGHT JOIN.
SELECT 
    v.id_venda,
    v.nome_cliente,
    l.no_titulo AS titulo_livro
FROM livros l
RIGHT JOIN vendas v ON l.id_livro = v.id_livro;

-- 9. Calcular o valor total de cada venda.
SELECT 
    v.id_venda,
    v.nome_cliente,
    l.no_titulo AS titulo_livro,
    v.quantidade,
    l.vl_preco AS preco_unitario,
    (v.quantidade * l.vl_preco) AS valor_total
FROM vendas v
INNER JOIN livros l ON v.id_livro = l.id_livro;

-- 10. Calcular o valor total vendido pela livraria.
SELECT 
    SUM(v.quantidade * l.vl_preco) AS valor_total_vendido
FROM vendas v
INNER JOIN livros l ON v.id_livro = l.id_livro;

-- 11. Listar os livros com estoque menor que 10 unidades.
SELECT 
    id_livro,
    no_titulo AS titulo_livro,
    qtd_estoque
FROM livros
WHERE qtd_estoque < 10;

-- 12. Listar os livros publicados a partir de 2018.
SELECT 
    id_livro,
    no_titulo AS titulo_livro,
    ano_publicacao
FROM livros
WHERE ano_publicacao >= 2018;

-- 13. Listar os livros cujo preço esteja entre R$ 50,00 e R$ 120,00.
SELECT 
    id_livro,
    no_titulo AS titulo_livro,
    vl_preco
FROM livros
WHERE vl_preco BETWEEN 50.00 AND 120.00;

-- 14. Exibir a média de preço dos livros.
SELECT 
    AVG(vl_preco) AS media_preco_livros
FROM livros;

-- 15. Exibir a quantidade total de livros em estoque por categoria.
SELECT 
    c.no_categoria AS categoria,
    SUM(l.qtd_estoque) AS total_estoque
FROM categorias c
LEFT JOIN livros l ON c.id_categoria = l.id_categoria
GROUP BY c.id_categoria, c.no_categoria;

-- 16. Listar os autores e a quantidade de livros cadastrados para cada um.
SELECT 
    a.no_autor AS autor,
    COUNT(l.id_livro) AS quantidade_livros
FROM autores a
LEFT JOIN livros l ON a.id_autor = l.id_autor
GROUP BY a.id_autor, a.no_autor;
