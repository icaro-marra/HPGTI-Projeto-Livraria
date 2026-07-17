-- DML - Inserção de Dados (LivrariaProjetoFinal)
-- Projeto Final - HPGTI
-- Integrantes: Ícaro Marra Souza, Amanda e Luan

USE LivrariaProjetoFinal;

-- =========================================================================
-- 1. INSERÇÃO NA TABELA autores (Mínimo de 5 registros)
-- =========================================================================

INSERT INTO autores (no_autor, nacionalidade) VALUES
('Machado de Assis', 'Brasileira'),
('Stephen King', 'Norte-americana'),
('J.K. Rowling', 'Britânica'),
('Clarice Lispector', 'Brasileira'),
('George Orwell', 'Britânica');

-- =========================================================================
-- 2. INSERÇÃO NA TABELA categorias (Mínimo de 4 registros)
-- =========================================================================

INSERT INTO categorias (no_categoria) VALUES
('Ficção Científica'),
('Romance'),
('Terror'),
('Fantasia');

-- =========================================================================
-- 3. INSERÇÃO NA TABELA livros (Mínimo de 8 registros)
-- Requisitos atendidos:
-- - Autores com mais de um livro (Machado de Assis, Stephen King e George Orwell)
-- - Categorias com mais de um livro (Ficção Científica, Romance e Terror)
-- - Livro não vendido para testes de JOIN (Livro 7: 'A Revolução dos Bichos')
-- =========================================================================

INSERT INTO livros (no_titulo, ano_publicacao, vl_preco, qtd_estoque, id_autor, id_categoria) VALUES
-- Livros de Machado de Assis (id_autor = 1) na categoria Romance (id_categoria = 2)
('Dom Casmurro', 1899, 34.90, 15, 1, 2),
('Memórias Póstumas de Brás Cubas', 1881, 39.90, 8, 1, 2),

-- Livros de Stephen King (id_autor = 2) na categoria Terror (id_categoria = 3)
('It: A Coisa', 1986, 89.90, 12, 2, 3),
('O Iluminado', 1977, 59.90, 5, 2, 3),

-- Livro de J.K. Rowling (id_autor = 3) na categoria Fantasia (id_categoria = 4)
('Harry Potter e a Pedra Filosofal', 1997, 49.90, 25, 3, 4),

-- Livros de George Orwell (id_autor = 5) na categoria Ficção Científica (id_categoria = 1)
('1984', 1949, 45.00, 3, 5, 1),
('A Revolução dos Bichos', 1945, 24.90, 10, 5, 1),

-- Livro de Clarice Lispector (id_autor = 4) na categoria Romance (id_categoria = 2)
('A Hora da Estrela', 1977, 29.90, 20, 4, 2);

-- =========================================================================
-- 4. INSERÇÃO NA TABELA vendas (Mínimo de 8 registros)
-- Restrição: email_cliente é UNIQUE, portanto cada registro exige um e-mail diferente.
-- Requisitos atendidos:
-- - Vendas finalizadas, pendentes e canceladas.
-- - Livro não vendido: 'A Revolução dos Bichos' (id_livro = 7) não está nesta lista.
-- =========================================================================

INSERT INTO vendas (nome_cliente, email_cliente, id_livro, quantidade, data_venda, status_venda) VALUES
-- Venda 1: Livro 1 (Dom Casmurro) - Finalizada
('Carlos Silva', 'carlos.silva@email.com', 1, 2, '2026-07-01', 'finalizada'),

-- Venda 2: Livro 2 (Memórias Póstumas) - Finalizada
('Mariana Souza', 'mariana.souza@email.com', 2, 1, '2026-07-02', 'finalizada'),

-- Venda 3: Livro 3 (It: A Coisa) - Pendente
('João Pereira', 'joao.pereira@email.com', 3, 1, '2026-07-03', 'pendente'),

-- Venda 4: Livro 4 (O Iluminado) - Cancelada
('Ana Costa', 'ana.costa@email.com', 4, 3, '2026-07-04', 'cancelada'),

-- Venda 5: Livro 5 (Harry Potter) - Finalizada
('Pedro Rocha', 'pedro.rocha@email.com', 5, 1, '2026-07-05', 'finalizada'),

-- Venda 6: Livro 6 (1984) - Finalizada
('Beatriz Alves', 'beatriz.alves@email.com', 6, 2, '2026-07-06', 'finalizada'),

-- Venda 7: Livro 8 (A Hora da Estrela) - Pendente
-- Note: id_livro = 8 (A Hora da Estrela), e id_livro = 7 (A Revolução dos Bichos) não foi vendido
('Lucas Lima', 'lucas.lima@email.com', 8, 1, '2026-07-07', 'pendente'),

-- Venda 8: Livro 1 (Dom Casmurro) - Finalizada
('Fernanda Dias', 'fernanda.dias@email.com', 1, 1, '2026-07-08', 'finalizada');
