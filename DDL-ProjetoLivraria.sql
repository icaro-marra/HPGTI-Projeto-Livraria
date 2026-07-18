CREATE DATABASE IF NOT EXISTS LivrariaProjetoFinal
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE LivrariaProjetoFinal;

-- Criar tabela autores

CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    no_autor VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50) NOT NULL
);

-- Criar a tabela categorias

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    no_categoria VARCHAR(100) NOT NULL
);

-- Criar a tabela livros

CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    no_titulo VARCHAR(150) NOT NULL,
    ano_publicacao YEAR NOT NULL,
    vl_preco DECIMAL(10, 2) NOT NULL CHECK (vl_preco >= 0),
    qtd_estoque INT NOT NULL CHECK (qtd_estoque >= 0),
    id_autor INT NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor) ON DELETE RESTRICT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria) ON DELETE RESTRICT
);

-- Criar a tabela vendas

CREATE TABLE vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    email_cliente VARCHAR(100) NOT NULL,
    id_livro INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    data_venda DATE NOT NULL,
    status_venda ENUM('finalizada', 'pendente', 'cancelada') DEFAULT 'pendente',
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro) ON DELETE RESTRICT
);
