## Nome do Projeto

A definir

## Integrantes
Amanda, Ícaro e Luan

## Comandos Git Mais Utilizados
-git commit -m ""  
-git pull  
-git push  
-git add .

## Principais Consultas Realizadas

![teste](img/print-DDL.png)
## Estrutura do Banco de Dados

Tabelas mapeadas a partir do arquivo DDL-ProjetoLivraria.sql

### Tabela `autores`
Armazena o cadastro dos autores dos livros.

| Campo | Tipo | Descrição / Finalidade |
| :--- | :--- | :--- |
| `id_autor` | INT | Chave primária autoincrementada que identifica unicamente o autor. |
| `no_autor` | VARCHAR(100) | Nome completo do autor. |
| `nacionalidade` | VARCHAR(50) | País de origem ou nacionalidade do autor. |

### Tabela `categorias`
Armazena o cadastro de categorias/gêneros literários dos livros.

| Campo | Tipo | Descrição / Finalidade |
| :--- | :--- | :--- |
| `id_categoria` | INT | Chave primária autoincrementada que identifica unicamente a categoria. |
| `no_categoria` | VARCHAR(100) | Nome da categoria (ex: Romance, Ficção Científica, Biografia). |

### Tabela `livros`
Armazena o acervo de livros disponíveis na livraria e suas informações de preço e estoque.

| Campo | Tipo | Descrição / Finalidade |
| :--- | :--- | :--- |
| `id_livro` | INT | Chave primária autoincrementada que identifica unicamente o livro. |
| `no_titulo` | VARCHAR(150) | Título do livro. |
| `ano_publicacao` | YEAR | Ano de publicação do livro. |
| `vl_preco` | DECIMAL(10, 2) | Preço unitário de venda do livro. Deve ser um valor maior ou igual a 0,00. |
| `qtd_estoque` | INT | Quantidade disponível do livro em estoque. Deve ser um valor maior ou igual a 0. |
| `id_autor` | INT | Chave estrangeira que referencia o autor correspondente na tabela `autores`. |
| `id_categoria` | INT | Chave estrangeira que referencia a categoria correspondente na tabela `categorias`. |

### Tabela `vendas`
Registra as transações de venda de livros para clientes.

| Campo | Tipo | Descrição / Finalidade |
| :--- | :--- | :--- |
| `id_venda` | INT | Chave primária autoincrementada que identifica unicamente a venda. |
| `nome_cliente` | VARCHAR(100) | Nome completo do cliente comprador. |
| `email_cliente` | VARCHAR(100) | Endereço de e-mail do cliente comprador. |
| `id_livro` | INT | Chave estrangeira que referencia o livro vendido na tabela `livros`. |
| `quantidade` | INT | Quantidade de exemplares vendidos na transação. Deve ser maior que 0. |
| `data_venda` | DATE | Data em que a venda foi efetuada. |
| `status_venda` | ENUM('finalizada', 'pendente', 'cancelada') | Situação atual da venda (padrão é 'pendente'). |
