-- ============================================================
-- ATIVIDADE PRÁTICA — MANIPULAÇÃO DE DADOS NA BIBLIOTECA
-- Tabela: tb_livros (id, titulo, autor, ano_publicacao, disponivel)
-- SGBD: MySQL 8.x
-- ============================================================

-- Desativa a proteção do Workbench (evita erro 1175 em
-- UPDATE/DELETE sem chave primária na cláusula WHERE)
SET SQL_SAFE_UPDATES = 0;


-- ============================================================
-- ETAPA 1 — EXCLUSÃO, LIMPEZA E RECARGA INICIAL
-- ============================================================

-- ------------------------------------------------------------
-- QUESTÃO 01 — Remover apenas o duplicado de "O Cortiço" (id = 71)
-- ------------------------------------------------------------
-- Conferência prévia
SELECT id, titulo, autor, ano_publicacao, disponivel
FROM tb_livros
WHERE titulo = 'O Cortiço';

DELETE FROM tb_livros
WHERE id = 71;

-- Conferência pós-exclusão (deve restar apenas o id = 3)
SELECT id, titulo, autor, ano_publicacao, disponivel
FROM tb_livros
WHERE titulo = 'O Cortiço';


-- ------------------------------------------------------------
-- QUESTÃO 02 — Limpar todos os registros preservando a estrutura
-- ------------------------------------------------------------
TRUNCATE TABLE tb_livros;

-- Conferência (deve retornar 0)
SELECT COUNT(*) AS total_registros FROM tb_livros;


-- ------------------------------------------------------------
-- QUESTÃO 03 — Recarga da base original (71 registros)
-- ------------------------------------------------------------
-- >>> COLE AQUI O SCRIPT INSERT FORNECIDO PELO PROFESSOR <<<
-- Não altere os dados originais, apenas execute a carga.

-- >>> INÍCIO DO INSERT DO PROFESSOR <<<
-- INSERT INTO tb_livros (id, titulo, autor, ano_publicacao, disponivel) VALUES
--   (1,  '...', '...', NULL, TRUE),
--   ...
--   (71, 'O Cortiço', '...', NULL, TRUE);
-- >>> FIM DO INSERT DO PROFESSOR <<<

-- Conferência da carga (deve retornar 71)
SELECT COUNT(*) AS total_registros FROM tb_livros;


-- ============================================================
-- ETAPA 2 — INSERÇÃO DE NOVOS LIVROS
-- ============================================================

-- ------------------------------------------------------------
-- QUESTÃO 04 — "A Montanha Mágica" (id = 72, disponível)
-- ------------------------------------------------------------
INSERT INTO tb_livros (id, titulo, autor, ano_publicacao, disponivel)
VALUES (72, 'A Montanha Mágica', 'Thomas Mann', 1924, TRUE);


-- ------------------------------------------------------------
-- QUESTÃO 05 — "O Lobo da Estepe" (id = 73, indisponível)
-- ------------------------------------------------------------
INSERT INTO tb_livros (id, titulo, autor, ano_publicacao, disponivel)
VALUES (73, 'O Lobo da Estepe', 'Hermann Hesse', 1927, FALSE);


-- ------------------------------------------------------------
-- QUESTÃO 06 — "Solaris" (id = 74) omitindo a coluna disponivel
-- ------------------------------------------------------------
INSERT INTO tb_livros (id, titulo, autor, ano_publicacao)
VALUES (74, 'Solaris', 'Stanisław Lem', 1961);

-- Conferência do valor padrão (deve retornar 1 / TRUE)
SELECT id, titulo, autor, ano_publicacao, disponivel
FROM tb_livros
WHERE id = 74;


-- ------------------------------------------------------------
-- QUESTÃO 07 — "O Som e a Fúria" (id = 75, disponível)
-- ------------------------------------------------------------
INSERT INTO tb_livros (id, titulo, autor, ano_publicacao, disponivel)
VALUES (75, 'O Som e a Fúria', 'William Faulkner', 1929, TRUE);


-- ------------------------------------------------------------
-- QUESTÃO 08 — Livro fictício de Albert Camus (id = 76, indisponível)
-- ------------------------------------------------------------
INSERT INTO tb_livros (id, titulo, autor, ano_publicacao, disponivel)
VALUES (76, 'Horizontes do Amanhã', 'Albert Camus', 2020, FALSE);


-- ============================================================
-- ETAPA 3 — CONSULTAS E ANÁLISE DO CATÁLOGO
-- ============================================================

-- ------------------------------------------------------------
-- QUESTÃO 09 — Quantidade de livros disponíveis para empréstimo
-- ------------------------------------------------------------
SELECT COUNT(*) AS livros_disponiveis
FROM tb_livros
WHERE disponivel = TRUE;


-- ------------------------------------------------------------
-- QUESTÃO 10 — Registros por autor (maior quantidade primeiro,
-- empate pelo nome do autor em ordem alfabética)
-- ------------------------------------------------------------
SELECT autor,
       COUNT(*) AS quantidade_registros
FROM tb_livros
GROUP BY autor
ORDER BY quantidade_registros DESC, autor ASC;


-- ------------------------------------------------------------
-- QUESTÃO 11 — Livro(s) com o menor ano de publicação (subquery com MIN)
-- ------------------------------------------------------------
SELECT id, titulo, autor, ano_publicacao, disponivel
FROM tb_livros
WHERE ano_publicacao = (
    SELECT MIN(ano_publicacao)
    FROM tb_livros
);


-- ------------------------------------------------------------
-- QUESTÃO 12 — Autores com mais de dois registros (GROUP BY + HAVING)
-- ------------------------------------------------------------
SELECT autor,
       COUNT(*) AS quantidade_registros
FROM tb_livros
GROUP BY autor
HAVING COUNT(*) > 2
ORDER BY quantidade_registros DESC, autor ASC;


-- ============================================================
-- ETAPA 4 — ATUALIZAÇÕES BÁSICAS
-- ============================================================

-- ------------------------------------------------------------
-- QUESTÃO 13 — "Dom Casmurro" como indisponível
-- ------------------------------------------------------------
SELECT id, titulo, autor, disponivel
FROM tb_livros
WHERE titulo = 'Dom Casmurro';

UPDATE tb_livros
SET disponivel = FALSE
WHERE titulo = 'Dom Casmurro';


-- ------------------------------------------------------------
-- QUESTÃO 14 — Corrigir o ano de "O Cortiço" para 1891 (todos os registros)
-- ------------------------------------------------------------
SELECT id, titulo, ano_publicacao
FROM tb_livros
WHERE titulo = 'O Cortiço';

UPDATE tb_livros
SET ano_publicacao = 1891
WHERE titulo = 'O Cortiço';


-- ------------------------------------------------------------
-- QUESTÃO 15 — "Vidas Secas" (id = 6) como disponível
-- ------------------------------------------------------------
SELECT id, titulo, autor, disponivel
FROM tb_livros
WHERE id = 6;

UPDATE tb_livros
SET disponivel = TRUE
WHERE id = 6;


-- ------------------------------------------------------------
-- QUESTÃO 16 — Renomear o autor "George Orwell"
-- ------------------------------------------------------------
SELECT id, titulo, autor
FROM tb_livros
WHERE autor = 'George Orwell';

UPDATE tb_livros
SET autor = 'George Orwell (Verificado)'
WHERE autor = 'George Orwell';


-- ------------------------------------------------------------
-- QUESTÃO 17 — Todas as obras de Fiódor Dostoiévski como disponíveis
-- ------------------------------------------------------------
SELECT id, titulo, autor, disponivel
FROM tb_livros
WHERE autor LIKE '%Dostoiévski%';

UPDATE tb_livros
SET disponivel = TRUE
WHERE autor LIKE '%Dostoiévski%';


-- ------------------------------------------------------------
-- QUESTÃO 18 — Atualizar o título do livro de id = 18
-- ------------------------------------------------------------
SELECT id, titulo
FROM tb_livros
WHERE id = 18;

UPDATE tb_livros
SET titulo = 'O Senhor dos Anéis: A Sociedade do Anel'
WHERE id = 18;


-- ============================================================
-- ETAPA 5 — ATUALIZAÇÕES COM FILTROS E SUBQUERIES
-- ============================================================

-- ------------------------------------------------------------
-- QUESTÃO 19 — J.K. Rowling publicados antes de 1999 -> indisponíveis
-- ------------------------------------------------------------
SELECT id, titulo, autor, ano_publicacao, disponivel
FROM tb_livros
WHERE autor LIKE '%J.K. Rowling%'
  AND ano_publicacao < 1999;

UPDATE tb_livros
SET disponivel = FALSE
WHERE autor LIKE '%J.K. Rowling%'
  AND ano_publicacao < 1999;


-- ------------------------------------------------------------
-- QUESTÃO 20 — Indisponíveis de 1950 a 2000 -> disponíveis (BETWEEN + AND)
-- ------------------------------------------------------------
SELECT id, titulo, ano_publicacao, disponivel
FROM tb_livros
WHERE ano_publicacao BETWEEN 1950 AND 2000
  AND disponivel = FALSE;

UPDATE tb_livros
SET disponivel = TRUE
WHERE ano_publicacao BETWEEN 1950 AND 2000
  AND disponivel = FALSE;


-- ------------------------------------------------------------
-- QUESTÃO 21 — Victor Hugo -> indisponíveis (subquery com IDs)
-- Tabela derivada para contornar a restrição do MySQL de não
-- permitir subquery na própria tabela em UPDATE.
-- ------------------------------------------------------------
SELECT id, titulo, autor, disponivel
FROM tb_livros
WHERE autor LIKE '%Victor Hugo%';

UPDATE tb_livros
SET disponivel = FALSE
WHERE id IN (
    SELECT id FROM (
        SELECT id
        FROM tb_livros
        WHERE autor LIKE '%Victor Hugo%'
    ) AS livros_victor_hugo
);


-- ------------------------------------------------------------
-- QUESTÃO 22 — Indisponíveis de 1930 a 1950 -> disponíveis (subquery com IDs)
-- ------------------------------------------------------------
SELECT id, titulo, ano_publicacao, disponivel
FROM tb_livros
WHERE ano_publicacao BETWEEN 1930 AND 1950
  AND disponivel = FALSE;

UPDATE tb_livros
SET disponivel = TRUE
WHERE id IN (
    SELECT id FROM (
        SELECT id
        FROM tb_livros
        WHERE ano_publicacao BETWEEN 1930 AND 1950
          AND disponivel = FALSE
    ) AS livros_1930_1950
);


-- ------------------------------------------------------------
-- QUESTÃO 23 — Autores com "Kafka" no nome -> disponíveis (LIKE)
-- ------------------------------------------------------------
SELECT id, titulo, autor, disponivel
FROM tb_livros
WHERE autor LIKE '%Kafka%';

UPDATE tb_livros
SET disponivel = TRUE
WHERE autor LIKE '%Kafka%';


-- ------------------------------------------------------------
-- QUESTÃO 24 — Dan Brown, George Orwell (Verificado) e H.G. Wells -> indisponíveis (IN)
-- ------------------------------------------------------------
SELECT id, titulo, autor, disponivel
FROM tb_livros
WHERE autor IN ('Dan Brown', 'George Orwell (Verificado)', 'H.G. Wells');

UPDATE tb_livros
SET disponivel = FALSE
WHERE autor IN ('Dan Brown', 'George Orwell (Verificado)', 'H.G. Wells');


-- ------------------------------------------------------------
-- QUESTÃO 25 — Publicados de 1930 a 1969 -> disponíveis (BETWEEN)
-- independentemente do status atual
-- ------------------------------------------------------------
SELECT id, titulo, ano_publicacao, disponivel
FROM tb_livros
WHERE ano_publicacao BETWEEN 1930 AND 1969;

UPDATE tb_livros
SET disponivel = TRUE
WHERE ano_publicacao BETWEEN 1930 AND 1969;


-- ------------------------------------------------------------
-- QUESTÃO 26 — Obras de Tolstói -> autor "Autor Revisado" (LIKE)
-- ------------------------------------------------------------
SELECT id, titulo, autor
FROM tb_livros
WHERE autor LIKE '%Tolstói%';

UPDATE tb_livros
SET autor = 'Autor Revisado'
WHERE autor LIKE '%Tolstói%';


-- ------------------------------------------------------------
-- QUESTÃO 27 — Antes de 1950 OU título contendo "Mundo" -> indisponíveis (OR)
-- ------------------------------------------------------------
SELECT id, titulo, ano_publicacao, disponivel
FROM tb_livros
WHERE ano_publicacao < 1950
   OR titulo LIKE '%Mundo%';

UPDATE tb_livros
SET disponivel = FALSE
WHERE ano_publicacao < 1950
   OR titulo LIKE '%Mundo%';


-- ------------------------------------------------------------
-- QUESTÃO 28 — IDs 3, 6, 11, 18 e 45 -> disponíveis (IN)
-- independentemente da disponibilidade atual
-- ------------------------------------------------------------
SELECT id, titulo, disponivel
FROM tb_livros
WHERE id IN (3, 6, 11, 18, 45);

UPDATE tb_livros
SET disponivel = TRUE
WHERE id IN (3, 6, 11, 18, 45);


-- ------------------------------------------------------------
-- QUESTÃO 29 — Títulos com "Senhor" ou "Nárnia" -> acrescentar sufixo
-- ------------------------------------------------------------
SELECT id, titulo
FROM tb_livros
WHERE titulo LIKE '%Senhor%'
   OR titulo LIKE '%Nárnia%';

UPDATE tb_livros
SET titulo = CONCAT(titulo, ' (Coleção Especial)')
WHERE titulo LIKE '%Senhor%'
   OR titulo LIKE '%Nárnia%';

-- Conferência
SELECT id, titulo
FROM tb_livros
WHERE titulo LIKE '%Coleção Especial%';


-- ============================================================
-- ETAPA 6 — EXCLUSÕES ESPECÍFICAS E COM MÚLTIPLAS CONDIÇÕES
-- ============================================================

-- ------------------------------------------------------------
-- QUESTÃO 30 — Excluir "O Código Da Vinci"
-- ------------------------------------------------------------
SELECT id, titulo, autor
FROM tb_livros
WHERE titulo = 'O Código Da Vinci';

DELETE FROM tb_livros
WHERE titulo = 'O Código Da Vinci';


-- ------------------------------------------------------------
-- QUESTÃO 31 — Excluir livros indisponíveis de H.G. Wells
-- ------------------------------------------------------------
SELECT id, titulo, autor, disponivel
FROM tb_livros
WHERE autor = 'H.G. Wells'
  AND disponivel = FALSE;

DELETE FROM tb_livros
WHERE autor = 'H.G. Wells'
  AND disponivel = FALSE;


-- ------------------------------------------------------------
-- QUESTÃO 32 — Remover todos os livros de Eça de Queirós
-- ------------------------------------------------------------
SELECT id, titulo, autor
FROM tb_livros
WHERE autor LIKE '%Eça de Queirós%';

DELETE FROM tb_livros
WHERE autor LIKE '%Eça de Queirós%';


-- ------------------------------------------------------------
-- QUESTÃO 33 — Excluir livros com ano de publicação negativo
-- ------------------------------------------------------------
SELECT id, titulo, ano_publicacao
FROM tb_livros
WHERE ano_publicacao < 0;

DELETE FROM tb_livros
WHERE ano_publicacao < 0;


-- ------------------------------------------------------------
-- QUESTÃO 34 — Remover livros disponíveis de José de Alencar
-- ------------------------------------------------------------
SELECT id, titulo, autor, disponivel
FROM tb_livros
WHERE autor LIKE '%José de Alencar%'
  AND disponivel = TRUE;

DELETE FROM tb_livros
WHERE autor LIKE '%José de Alencar%'
  AND disponivel = TRUE;


-- ------------------------------------------------------------
-- QUESTÃO 35 — Remover indisponíveis de Victor Hugo e Franz Kafka (IN + AND)
-- ------------------------------------------------------------
SELECT id, titulo, autor, disponivel
FROM tb_livros
WHERE autor IN ('Victor Hugo', 'Franz Kafka')
  AND disponivel = FALSE;

DELETE FROM tb_livros
WHERE autor IN ('Victor Hugo', 'Franz Kafka')
  AND disponivel = FALSE;


-- ------------------------------------------------------------
-- QUESTÃO 36 — Remover indisponíveis de 1800 a 1900 (BETWEEN + AND)
-- ------------------------------------------------------------
SELECT id, titulo, ano_publicacao, disponivel
FROM tb_livros
WHERE ano_publicacao BETWEEN 1800 AND 1900
  AND disponivel = FALSE;

DELETE FROM tb_livros
WHERE ano_publicacao BETWEEN 1800 AND 1900
  AND disponivel = FALSE;


-- ------------------------------------------------------------
-- QUESTÃO 37 — Após a limpeza, excluir indisponíveis anteriores a 1900
-- ------------------------------------------------------------
SELECT id, titulo, ano_publicacao, disponivel
FROM tb_livros
WHERE ano_publicacao < 1900
  AND disponivel = FALSE;

DELETE FROM tb_livros
WHERE ano_publicacao < 1900
  AND disponivel = FALSE;


-- ------------------------------------------------------------
-- QUESTÃO 38 — Excluir indisponíveis publicados a partir de 2000 (AND)
-- ------------------------------------------------------------
SELECT id, titulo, ano_publicacao, disponivel
FROM tb_livros
WHERE ano_publicacao >= 2000
  AND disponivel = FALSE;

DELETE FROM tb_livros
WHERE ano_publicacao >= 2000
  AND disponivel = FALSE;


-- ============================================================
-- ETAPA 7 — EXCLUSÃO COM SUBQUERY E COLEÇÃO TEMÁTICA
-- ============================================================

-- ------------------------------------------------------------
-- QUESTÃO 39 — Excluir livros de autores com mais de dois registros
-- (subquery com GROUP BY + HAVING COUNT(*) > 2 em tabela derivada)
-- ------------------------------------------------------------
-- Conferência: autores afetados
SELECT autor,
       COUNT(*) AS quantidade_registros
FROM tb_livros
GROUP BY autor
HAVING COUNT(*) > 2
ORDER BY quantidade_registros DESC, autor ASC;

-- Conferência: livros que serão excluídos
SELECT id, titulo, autor
FROM tb_livros
WHERE autor IN (
    SELECT autor FROM (
        SELECT autor
        FROM tb_livros
        GROUP BY autor
        HAVING COUNT(*) > 2
    ) AS autores_recorrentes
);

DELETE FROM tb_livros
WHERE autor IN (
    SELECT autor FROM (
        SELECT autor
        FROM tb_livros
        GROUP BY autor
        HAVING COUNT(*) > 2
    ) AS autores_recorrentes
);


-- ------------------------------------------------------------
-- QUESTÃO 40 — Manter apenas a coleção de J.K. Rowling (NOT LIKE)
-- ------------------------------------------------------------
-- Conferência prévia
SELECT id, titulo, autor
FROM tb_livros
ORDER BY id;

DELETE FROM tb_livros
WHERE autor NOT LIKE '%J.K. Rowling%';

-- Conferência final (devem restar os 2 livros da autora)
SELECT id, titulo, autor, ano_publicacao, disponivel
FROM tb_livros
ORDER BY id;