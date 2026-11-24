CREATE DATABASE aula10;
USE aula10;

CREATE TABLE tb_livros (
    id            INT PRIMARY KEY,
    titulo        VARCHAR(100) NOT NULL,
    autor         VARCHAR(100) NOT NULL,
    ano_publicacao INT,
    disponivel    BOOLEAN DEFAULT TRUE
);

-- 01
UPDATE tb_livros
SET titulo = 'Dom Casmurro - Edição Comentada'
WHERE id = 1;

-- 02
UPDATE tb_livros
SET autor = 'Machado Assis'
WHERE autor = 'Machado de Assis';

-- 03
UPDATE tb_livros
SET autor = 'Machado de Assis'
WHERE autor = 'Machado Assis';

-- 04
UPDATE tb_livros
SET ano_publicacao = 1891
WHERE titulo = 'O Cortiço';

-- 05
UPDATE tb_livros
SET disponivel = FALSE
WHERE titulo = 'Iracema';

-- 06
UPDATE tb_livros
SET titulo = 'Odisseia'
WHERE titulo = 'Odisséia';


-- 07
UPDATE tb_livros
SET disponivel = TRUE
WHERE autor = 'George Orwell';

-- 08
UPDATE tb_livros
SET ano_publicacao = 2000
WHERE autor = 'J.K. Rowling';

-- 09
UPDATE tb_livros
SET disponivel = FALSE
WHERE ano_publicacao < 1900;

-- 10
UPDATE tb_livros
SET disponivel = FALSE
WHERE autor = 'J.R.R. Tolkien';

-- 11
UPDATE tb_livros
SET titulo = 'A Hora da Estrela - Edição Definitiva'
WHERE titulo = 'A Hora da Estrela';

-- 12
UPDATE tb_livros
SET disponivel = TRUE
WHERE titulo LIKE '%Harry Potter%';

-- 13
UPDATE tb_livros
SET titulo = CONCAT(titulo, ' - Volume Único')
WHERE autor = 'Victor Hugo';

-- 14
UPDATE tb_livros
SET titulo = CONCAT('[Kafka] ', titulo)
WHERE autor = 'Franz Kafka';

-- 15
UPDATE tb_livros
SET disponivel = FALSE
WHERE ano_publicacao BETWEEN 1940 AND 1980;

-- 16
UPDATE tb_livros
SET autor = UPPER(autor)
WHERE autor = 'H.G. Wells';

UPDATE tb_livros
SET titulo = CONCAT('[Kafka] ', titulo)
WHERE autor = 'Franz Kafka'
  AND titulo NOT LIKE '[Kafka]%';
    
  SELECT autor, COUNT(*) AS quantidade
FROM tb_livros
GROUP BY autor
ORDER BY quantidade DESC, autor;

SELECT autor, COUNT(*) AS quantidade
FROM tb_livros
GROUP BY autor
HAVING COUNT(*) > 2;

SELECT AVG(ano_publicacao) AS media_ano_disponiveis
FROM tb_livros
WHERE disponivel = TRUE;

SELECT id, titulo, autor, ano_publicacao
FROM tb_livros
WHERE ano_publicacao < (SELECT AVG(ano_publicacao) FROM tb_livros)
ORDER BY ano_publicacao;

SELECT autor, AVG(ano_publicacao) AS media_ano
FROM tb_livros
GROUP BY autor
ORDER BY media_ano DESC;

SELECT titulo
FROM tb_livros
WHERE titulo LIKE '%e%'
ORDER BY titulo ASC;

SELECT disponivel, COUNT(*) AS quantidade
FROM tb_livros
GROUP BY disponivel;

SELECT (ano_publicacao DIV 100) AS seculo, COUNT(*) AS quantidade
FROM tb_livros
GROUP BY (ano_publicacao DIV 100)
ORDER BY seculo;

SELECT l.titulo, l.autor, l.ano_publicacao
FROM tb_livros AS l
WHERE l.ano_publicacao IN (
    SELECT ano_publicacao
    FROM tb_livros
    GROUP BY ano_publicacao
    HAVING COUNT(*) > 1
)
ORDER BY l.ano_publicacao, l.titulo;

SELECT autor
FROM tb_livros
GROUP BY autor
HAVING SUM(CASE WHEN disponivel = TRUE THEN 1 ELSE 0 END) = 0;





