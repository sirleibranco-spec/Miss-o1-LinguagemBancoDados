-- Nome, preço e preço arredondado para baixo
SELECT nome, preco, FLOOR(preco) AS preco_arredondado_baixo
FROM produtos;

-- Caixas completas de 6 unidades
SELECT nome, estoque, FLOOR(estoque / 6) AS caixas_completas
FROM produtos;

-- Kits completos de 4 unidades
SELECT nome, estoque, FLOOR(estoque / 4) AS kits_completos
FROM produtos;

-- Preço médio por categoria: original e arredondado para baixo
SELECT categoria,
       ROUND(AVG(preco), 2) AS media_original,
       FLOOR(AVG(preco))    AS media_arredondada_baixo
FROM produtos
GROUP BY categoria;


-- Nome, preço e preço arredondado para cima
SELECT nome, preco, CEILING(preco) AS preco_arredondado_cima
FROM produtos;

-- Caixas necessárias por produto, incluindo caixa incompleta
SELECT nome, estoque, CEILING(estoque / 6) AS caixas_necessarias
FROM produtos;

-- Pacotes de 8 unidades para atingir 25 unidades (resultado igual para todos os produtos: 4 pacotes = 32 unidades)
SELECT nome, CEILING(25 / 8) AS pacotes_a_comprar
FROM produtos;

-- Preço original, arredondado para baixo, arredondado para cima e diferença
SELECT nome,
       preco,
       FLOOR(preco)   AS preco_baixo,
       CEILING(preco) AS preco_cima,
       CEILING(preco) - FLOOR(preco) AS diferenca
FROM produtos;

-- Categorias com mais de 3 produtos
SELECT categoria, COUNT(*) AS qtd_produtos
FROM produtos
GROUP BY categoria
HAVING COUNT(*) > 3;

-- Categorias com soma do estoque superior a 50
SELECT categoria, SUM(estoque) AS total_unidades
FROM produtos
GROUP BY categoria
HAVING SUM(estoque) > 50;

-- Categorias com preço médio maior que R$ 100,00
SELECT categoria, ROUND(AVG(preco), 2) AS preco_medio
FROM produtos
GROUP BY categoria
HAVING AVG(preco) > 100;

-- Somente produtos com estoque > 0, valor total do estoque acima de R$ 5.000,00
SELECT categoria, SUM(estoque * preco) AS valor_total_estoque
FROM produtos
WHERE estoque > 0
GROUP BY categoria
HAVING SUM(estoque * preco) > 5000;


-- Classificação por disponibilidade
SELECT nome, estoque,
       CASE WHEN estoque = 0 THEN 'Fora de estoque'
            ELSE 'Disponível'
       END AS classificacao
FROM produtos;

-- Classificação por quantidade em estoque
SELECT nome, estoque,
       CASE WHEN estoque = 0               THEN 'Esgotado'
            WHEN estoque BETWEEN 1 AND 5   THEN 'Estoque crítico'
            WHEN estoque BETWEEN 6 AND 20  THEN 'Estoque moderado'
            ELSE 'Estoque adequado'
       END AS classificacao
FROM produtos;

-- Faixas de preço
SELECT nome, preco,
       CASE WHEN preco < 100            THEN 'Econômico'
            WHEN preco <= 500           THEN 'Intermediário'
            ELSE 'Premium'
       END AS faixa
FROM produtos;

-- Reposição para manter 20 unidades (zero quando já atingido)
SELECT nome, estoque,
       GREATEST(0, 20 - estoque) AS quantidade_reposicao
FROM produtos;

SELECT categoria,
       COUNT(*)                          AS total_produtos,
       SUM(estoque)                      AS total_unidades,
       ROUND(AVG(preco), 2)              AS preco_medio_original,
       CEILING(AVG(preco))               AS preco_medio_arred_cima,
       SUM(estoque * preco)              AS valor_total_estoque,
       CASE WHEN SUM(estoque) < 20       THEN 'Reposição urgente'
            WHEN SUM(estoque) <= 50      THEN 'Atenção'
            ELSE 'Estoque confortável'
       END AS classificacao_estoque
FROM produtos
GROUP BY categoria
HAVING COUNT(*) >= 2
ORDER BY total_unidades ASC;

