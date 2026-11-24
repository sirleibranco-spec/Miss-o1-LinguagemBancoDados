/* =============================================================
   AgroTech Solutions | Auditoria de Dados e Indicadores Gerenciais
   Arquivo: AgroTech_Integrantes.sql
   Conteúdo: Preparação | Parte 1 | Parte 2 | Parte 3
   SGBD: MySQL 8.x
   ============================================================= */


/* -------------------------------------------------------------
   PREPARAÇÃO DA BASE
   ------------------------------------------------------------- */

DROP DATABASE IF EXISTS agropecuaria_db;
CREATE DATABASE agropecuaria_db;
USE agropecuaria_db;

CREATE TABLE tb_vendas_agro (
    id INT PRIMARY KEY,
    produto VARCHAR(100),
    categoria VARCHAR(50),
    fornecedor VARCHAR(100),
    estado VARCHAR(50),
    quantidade INT,
    valor_unitario DECIMAL(10,2),
    data_venda DATE,
    estoque BOOLEAN
);

INSERT INTO tb_vendas_agro
(id, produto, categoria, fornecedor, estado, quantidade, valor_unitario, data_venda, estoque)
VALUES
(1, 'Milho Safrinha', 'Grãos', 'AgroSul', 'PR', 120, 89.90, '2025-01-10', true),
(2, 'Soja Premium', 'Grãos', 'Campo Verde', 'MT', 200, 145.50, '2025-01-15', true),
(3, 'Ração Bovina 25kg', 'Rações', 'NutriCampo', 'SC', 80, 110.00, '2025-01-18', true),
(4, 'Fertilizante NPK', 'Fertilizantes', 'AgroMax', 'GO', 50, 320.75, '2025-01-22', false),
(5, 'Herbicida ForteMax', 'Defensivos', 'BioPlant', 'MS', 30, 450.00, '2025-01-25', true),
(6, 'Calcário Agrícola', 'Minerais', 'Solo Forte', 'PR', 300, 45.90, '2025-01-27', true),
(7, 'Semente de Trigo', 'Sementes', 'AgroSul', 'RS', 90, 99.99, '2025-02-01', false),
(8, 'Inseticida Power', 'Defensivos', 'Campo Verde', 'MT', 25, 599.00, '2025-02-03', true),
(9, 'Farelo de Soja', 'Rações', 'NutriCampo', 'SC', 110, 76.50, '2025-02-05', true),
(10, 'Adubo Orgânico', 'Fertilizantes', 'BioPlant', 'SP', 60, 180.00, '2025-02-08', true),
(11, 'Milheto', 'Sementes', 'AgroSul', 'GO', 70, 88.80, '2025-02-10', false),
(12, 'Sal Mineral Bovino', 'Minerais', 'NutriCampo', 'MG', 95, 67.40, '2025-02-12', true),
(13, 'Soja Convencional', 'Grãos', 'Campo Verde', 'MT', 180, 139.00, '2025-02-15', true),
(14, 'Ração Suína 20kg', 'Rações', 'NutriCampo', 'SC', 55, 98.00, '2025-02-17', false),
(15, 'Fungicida Max', 'Defensivos', 'AgroMax', 'PR', 22, 799.90, '2025-02-20', true),
(16, 'Semente de Aveia', 'Sementes', 'AgroSul', 'RS', 65, 72.30, '2025-02-22', true),
(17, 'Ureia Agrícola', 'Fertilizantes', 'Solo Forte', 'GO', 140, 210.00, '2025-02-25', true),
(18, 'Milho Híbrido', 'Grãos', 'Campo Verde', 'MS', 210, 155.90, '2025-03-01', false),
(19, 'Ração Equina', 'Rações', 'NutriCampo', 'SP', 40, 132.75, '2025-03-04', true),
(20, 'Herbicida Select', 'Defensivos', 'BioPlant', 'MT', 28, 499.90, '2025-03-06', true),
(21, 'Calcário Premium', 'Minerais', 'Solo Forte', 'PR', 310, 55.50, '2025-03-08', true),
(22, 'Semente de Pastagem', 'Sementes', 'AgroSul', 'GO', 85, 120.00, '2025-03-10', false),
(23, 'Soja Exportação', 'Grãos', 'Campo Verde', 'MT', 260, 160.00, '2025-03-12', true),
(24, 'Fertilizante Potássico', 'Fertilizantes', 'AgroMax', 'MS', 48, 420.00, '2025-03-14', true),
(25, 'Inseticida Ultra', 'Defensivos', 'BioPlant', 'SP', 18, 890.00, '2025-03-16', false),
(26, 'Ração Avícola', 'Rações', 'NutriCampo', 'SC', 130, 89.50, '2025-03-18', true),
(27, 'Milho Orgânico', 'Grãos', 'AgroSul', 'PR', 95, 110.00, '2025-03-20', true),
(28, 'Adubo Nitrogenado', 'Fertilizantes', 'Solo Forte', 'GO', 75, 275.00, '2025-03-22', true),
(29, 'Semente de Arroz', 'Sementes', 'Campo Verde', 'RS', 60, 140.00, '2025-03-24', false),
(30, 'Fungicida Premium', 'Defensivos', 'AgroMax', 'MT', 15, 950.00, '2025-03-26', true),
(31, 'Farelo Bovino', 'Rações', 'NutriCampo', 'MG', 120, 82.30, '2025-03-28', true),
(32, 'Soja Safra 2025', 'Grãos', 'Campo Verde', 'MS', 230, 150.00, '2025-03-30', false),
(33, 'Calcário Fino', 'Minerais', 'Solo Forte', 'PR', 340, 42.00, '2025-04-01', true),
(34, 'Herbicida AgroPlus', 'Defensivos', 'BioPlant', 'GO', 26, 620.00, '2025-04-03', true),
(35, 'Ração Premium Bovina', 'Rações', 'NutriCampo', 'SC', 88, 145.00, '2025-04-05', false),
(36, 'Semente de Feijão', 'Sementes', 'AgroSul', 'PR', 77, 115.90, '2025-04-07', true),
(37, 'Milho Tradicional', 'Grãos', 'Campo Verde', 'MT', 170, 100.00, '2025-04-10', true),
(38, 'Fertilizante Especial', 'Fertilizantes', 'AgroMax', 'SP', 54, 380.00, '2025-04-12', true),
(39, 'Inseticida Verde', 'Defensivos', 'BioPlant', 'MS', 19, 720.00, '2025-04-15', false),
(40, 'Sal Mineral Premium', 'Minerais', 'Solo Forte', 'MG', 105, 92.00, '2025-04-18', true),
(41, 'Ração Ovina', 'Rações', 'NutriCampo', 'RS', 66, 118.00, '2025-04-20', true),
(42, 'Soja Natural', 'Grãos', 'Campo Verde', 'GO', 190, 148.00, '2025-04-22', false),
(43, 'Semente Especial', 'Sementes', 'AgroSul', 'PR', 59, 132.50, '2025-04-24', true),
(44, 'Fungicida Rural', 'Defensivos', 'AgroMax', 'MT', 24, 845.00, '2025-04-26', true),
(45, 'Adubo Premium', 'Fertilizantes', 'Solo Forte', 'SC', 81, 299.90, '2025-04-28', false),
(46, 'Milho Exportação', 'Grãos', 'Campo Verde', 'MS', 250, 170.00, '2025-05-01', true),
(47, 'Ração Campo Forte', 'Rações', 'NutriCampo', 'GO', 74, 136.40, '2025-05-03', true),
(48, 'Calcário Rural', 'Minerais', 'Solo Forte', 'PR', 330, 48.90, '2025-05-05', false),
(49, 'Herbicida Platinum', 'Defensivos', 'BioPlant', 'SP', 17, 980.00, '2025-05-07', true),
(50, 'Semente Premium', 'Sementes', 'AgroSul', 'RS', 68, 155.00, '2025-05-10', true),
(51, 'Milho Safrinha', 'Grãos', 'AgroSul', 'PR', 120, 89.90, '2025-05-12', true),
(52, 'Soja Premium', 'Grãos', 'Campo Verde', 'MT', 200, 145.50, '2025-05-12', true),
(53, 'Ração Bovina 25kg', 'Rações', 'NutriCampo', 'SC', 80, 110.00, '2025-05-12', true),
(54, 'Milhho Safrinha', 'Grãos', 'AgroSul', 'PR', 95, 88.00, '2025-05-13', true),
(55, 'Sojjja Premium', 'Grãos', 'Campo Verde', 'MT', 180, 140.00, '2025-05-13', true),
(56, 'Racão Bovina 25kg', 'Rações', 'NutriCampo', 'SC', 70, 105.00, '2025-05-13', true),
(57, 'Fertilizanti NPK', 'Fertilizantes', 'AgroMax', 'GO', 45, 310.00, '2025-05-13', false),
(58, 'Insetcida Power', 'Defensivos', 'Campo Verde', 'MT', 20, 580.00, '2025-05-13', true),
(59, 'Milho Híbrido', 'Grãos', 'Campo Vrede', 'MS', 190, 150.00, '2025-05-14', true),
(60, 'Ração Equina', 'Rações', 'NutriCamp', 'SP', 38, 130.00, '2025-05-14', true),
(61, 'Herbicida Select', 'Defensivos', 'Bio Planti', 'MT', 27, 495.00, '2025-05-14', true),
(62, 'Soja Exportação', 'Grãos', 'Campo Verde', 'MT', 250, 1.99, '2025-05-15', true),
(63, 'Fungicida Premium', 'Defensivos', 'AgroMax', 'MT', 12, 99999.99, '2025-05-15', true),
(64, 'Calcário Premium', 'Minerais', 'Solo Forte', 'PR', 300, -45.00, '2025-05-15', true),
(65, 'Adubo Nitrogenado', 'Fertilizantes', 'Solo Forte', 'GO', 70, 0.00, '2025-05-15', true),
(66, 'Milho Tradicional', 'Grãos', 'Campo Verde', 'MT', -10, 100.00, '2025-05-16', true),
(67, 'Ração Ovina', 'Rações', 'NutriCampo', 'RS', 0, 118.00, '2025-05-16', true),
(68, 'Semente Especial', 'Sementes', 'AgroSul', 'PARANA', 59, 132.50, '2025-05-16', true),
(69, 'Herbicida Platinum', 'Defensivos', 'BioPlant', 'SÃO PAULO', 17, 980.00, '2025-05-16', true),
(70, 'Milho Exportação', 'Graos', 'Campo Verde', 'MS', 250, 170.00, '2025-05-17', true),
(71, 'Ração Campo Forte', 'Racao', 'NutriCampo', 'GO', 74, 136.40, '2025-05-17', true),
(72, 'Calcário Rural', 'Minerais', 'Solo Forte', 'PR', 330, 48.90, '2035-01-01', false),
(73, 'Semente Premium', 'Sementes', 'AgroSul', 'RS', 68, 155.00, '2028-12-30', true),
(74, 'XXXXX', 'ERRO', 'DESCONHECIDO', 'XX', -999, -500.00, '2040-01-01', false),
(75, 'TESTE PRODUTO', 'TESTE', 'TESTE', 'TT', 99999, 999999.99, '2099-01-01', true);

-- Conferência da carga: esperado 75 registros
SELECT COUNT(*) AS total_inicial FROM tb_vendas_agro;


/* =============================================================
   PARTE 1 | LIMPEZA E TRATAMENTO
   ============================================================= */

/* 01. Remoção de duplicados: Milho Safrinha, Soja Premium e
       Ração Bovina 25kg. Preserva o registro de menor ID.      */

SELECT id, produto, data_venda FROM tb_vendas_agro
WHERE produto IN ('Milho Safrinha','Soja Premium','Ração Bovina 25kg')
ORDER BY produto, id;

DELETE v
FROM tb_vendas_agro v
JOIN (
    SELECT produto, MIN(id) AS id_original
    FROM tb_vendas_agro
    WHERE produto IN ('Milho Safrinha','Soja Premium','Ração Bovina 25kg')
    GROUP BY produto
) AS orig
  ON v.produto = orig.produto
 AND v.id <> orig.id_original;
-- Remove 51, 52 e 53. Sobram 72 registros.


/* 02. Padronização dos nomes dos produtos */

SELECT id, produto FROM tb_vendas_agro
WHERE produto IN ('Milhho Safrinha','Sojjja Premium','Racão Bovina 25kg',
                  'Fertilizanti NPK','Insetcida Power');

UPDATE tb_vendas_agro SET produto = 'Milho Safrinha'    WHERE produto = 'Milhho Safrinha';
UPDATE tb_vendas_agro SET produto = 'Soja Premium'      WHERE produto = 'Sojjja Premium';
UPDATE tb_vendas_agro SET produto = 'Ração Bovina 25kg' WHERE produto = 'Racão Bovina 25kg';
UPDATE tb_vendas_agro SET produto = 'Fertilizante NPK'  WHERE produto = 'Fertilizanti NPK';
UPDATE tb_vendas_agro SET produto = 'Inseticida Power'  WHERE produto = 'Insetcida Power';


/* 03. Padronização dos fornecedores */

SELECT id, fornecedor FROM tb_vendas_agro
WHERE fornecedor IN ('Campo Vrede','NutriCamp','Bio Planti');

UPDATE tb_vendas_agro SET fornecedor = 'Campo Verde' WHERE fornecedor = 'Campo Vrede';
UPDATE tb_vendas_agro SET fornecedor = 'NutriCampo'  WHERE fornecedor = 'NutriCamp';
UPDATE tb_vendas_agro SET fornecedor = 'BioPlant'    WHERE fornecedor = 'Bio Planti';


/* 04. Correção dos valores unitários */

SELECT id, produto, valor_unitario FROM tb_vendas_agro
WHERE valor_unitario <= 0
   OR valor_unitario < 10
   OR valor_unitario > 5000;

UPDATE tb_vendas_agro SET valor_unitario = 160.00 WHERE produto = 'Soja Exportação'   AND valor_unitario < 10;
UPDATE tb_vendas_agro SET valor_unitario = 950.00 WHERE produto = 'Fungicida Premium' AND valor_unitario > 5000;
UPDATE tb_vendas_agro SET valor_unitario = 55.50  WHERE produto = 'Calcário Premium'  AND valor_unitario < 0;
UPDATE tb_vendas_agro SET valor_unitario = 275.00 WHERE produto = 'Adubo Nitrogenado' AND valor_unitario = 0;


/* 05. Correção das quantidades */

SELECT id, produto, quantidade FROM tb_vendas_agro WHERE quantidade <= 0;

UPDATE tb_vendas_agro SET quantidade = 170 WHERE produto = 'Milho Tradicional' AND quantidade = -10;
UPDATE tb_vendas_agro SET quantidade = 66  WHERE produto = 'Ração Ovina'       AND quantidade = 0;


/* 06. Padronização dos estados */

SELECT id, produto, estado FROM tb_vendas_agro WHERE estado IN ('PARANA','SÃO PAULO');

UPDATE tb_vendas_agro SET estado = 'PR' WHERE estado = 'PARANA';
UPDATE tb_vendas_agro SET estado = 'SP' WHERE estado = 'SÃO PAULO';


/* 07. Padronização das categorias */

SELECT id, produto, categoria FROM tb_vendas_agro WHERE categoria IN ('Graos','Racao');

UPDATE tb_vendas_agro SET categoria = 'Grãos'  WHERE categoria = 'Graos';
UPDATE tb_vendas_agro SET categoria = 'Rações' WHERE categoria = 'Racao';


/* 08. Exclusão de datas posteriores a 31/12/2025 */

SELECT id, produto, data_venda FROM tb_vendas_agro WHERE data_venda > '2025-12-31';

DELETE FROM tb_vendas_agro WHERE data_venda > '2025-12-31';
-- Remove 72, 73, 74 e 75. Sobram 68 registros.


/* 09. Exclusão de registros de teste
       Esperado: 0 linhas afetadas, pois já saíram na questão 08. */

SELECT id, produto, categoria, fornecedor FROM tb_vendas_agro
WHERE produto IN ('XXXXX','TESTE PRODUTO')
   OR categoria IN ('ERRO','TESTE')
   OR fornecedor IN ('DESCONHECIDO','TESTE');

DELETE FROM tb_vendas_agro
WHERE produto IN ('XXXXX','TESTE PRODUTO')
   OR categoria IN ('ERRO','TESTE')
   OR fornecedor IN ('DESCONHECIDO','TESTE');


/* 10. Bloqueio de defensivos acima de R$ 800,00 */

SELECT id, produto, valor_unitario, estoque FROM tb_vendas_agro
WHERE categoria = 'Defensivos' AND valor_unitario > 800.00;

UPDATE tb_vendas_agro
SET estoque = false
WHERE categoria = 'Defensivos' AND valor_unitario > 800.00;
-- Afeta 30, 44, 49, 63 e 69. O 25 já estava false.

SELECT COUNT(*) AS total_apos_limpeza FROM tb_vendas_agro;  -- 68


/* =============================================================
   PARTE 2 | RELATÓRIO GERENCIAL
   ============================================================= */

-- 01. Produtos disponíveis (estoque = true): 48
SELECT COUNT(*) AS qtd_produtos_disponiveis
FROM tb_vendas_agro
WHERE estoque = true;

-- 02. Produtos por fornecedor
SELECT fornecedor, COUNT(*) AS qtd_registros
FROM tb_vendas_agro
GROUP BY fornecedor
ORDER BY qtd_registros DESC;
-- Campo Verde 16 | NutriCampo 14 | AgroSul 11 | BioPlant 10
-- Solo Forte 10 | AgroMax 7

-- 03. Top 10 por valor unitário
SELECT produto, categoria, valor_unitario, estado
FROM tb_vendas_agro
ORDER BY valor_unitario DESC
LIMIT 10;

-- 04. Valor unitário médio por categoria
SELECT categoria, ROUND(AVG(valor_unitario), 2) AS valor_unitario_medio
FROM tb_vendas_agro
GROUP BY categoria
ORDER BY valor_unitario_medio DESC;
-- Defensivos 739.91 | Fertilizantes 296.74 | Grãos 136.02
-- Sementes 117.44 | Rações 113.68 | Minerais 58.17

-- 05. Produtos por estado
SELECT estado, COUNT(*) AS qtd_registros
FROM tb_vendas_agro
GROUP BY estado
ORDER BY qtd_registros DESC;
-- MT 14 | PR 12 | GO 11 | MS 8 | SC 7 | SP 7 | RS 6 | MG 3

-- 06. Sementes e Grãos disponíveis: 18 registros
SELECT produto, categoria, quantidade, valor_unitario, estado
FROM tb_vendas_agro
WHERE categoria IN ('Sementes','Grãos') AND estoque = true
ORDER BY categoria, produto;

-- 07. Quantidade acima de 200 unidades: 10 registros
SELECT produto, quantidade, estado
FROM tb_vendas_agro
WHERE quantidade > 200
ORDER BY quantidade DESC;

-- 08. Valor potencial do estoque disponível: R$ 769.784,00
SELECT ROUND(SUM(quantidade * valor_unitario), 2) AS valor_potencial_disponivel
FROM tb_vendas_agro
WHERE estoque = true;

-- 09. Categorias com produtos indisponíveis
SELECT categoria, COUNT(*) AS qtd_indisponiveis
FROM tb_vendas_agro
WHERE estoque = false
GROUP BY categoria
HAVING COUNT(*) >= 1
ORDER BY qtd_indisponiveis DESC;
-- Defensivos 7 | Sementes 4 | Grãos 3 | Fertilizantes 3 | Rações 2 | Minerais 1

-- 10. Vendas entre 01/03/2025 e 31/05/2025: 51 registros
SELECT produto, categoria, data_venda, valor_unitario, estado
FROM tb_vendas_agro
WHERE data_venda BETWEEN '2025-03-01' AND '2025-05-31'
ORDER BY data_venda ASC;


/* =============================================================
   PARTE 3 | KPIs DA AGROTECH SOLUTIONS
   Base: 68 registros, sendo 48 disponíveis e 20 indisponíveis.
   ============================================================= */

/* KPI 1 | Percentual de produtos disponíveis
   Objetivo: medir a fatia da base apta para comercialização.
   Regra: (registros com estoque = true / total) * 100
   Base: todos os registros.                                     */
SELECT ROUND(100.0 * SUM(CASE WHEN estoque THEN 1 ELSE 0 END)
             / NULLIF(COUNT(*), 0), 2) AS pct_produtos_disponiveis
FROM tb_vendas_agro;
-- 70.59


/* KPI 2 | Valor potencial do estoque disponível (R$)
   Objetivo: dimensionar o valor financeiro pronto para venda.
   Regra: SUM(quantidade * valor_unitario) com estoque = true
   Base: apenas disponíveis.                                     */
SELECT ROUND(SUM(quantidade * valor_unitario), 2) AS valor_potencial_disponivel
FROM tb_vendas_agro
WHERE estoque = true;
-- 769784.00


/* KPI 3 | Concentração do valor nos 5 produtos mais valiosos (%)
   Objetivo: medir dependência do valor em poucos itens.
   Regra: (soma dos 5 maiores / valor disponível total) * 100
   Base: apenas disponíveis.                                     */
SELECT ROUND(
         100.0 * (
             SELECT SUM(quantidade * valor_unitario) FROM (
                 SELECT quantidade, valor_unitario FROM tb_vendas_agro
                 WHERE estoque = true
                 ORDER BY quantidade * valor_unitario DESC
                 LIMIT 5
             ) AS top5
         )
         / NULLIF((SELECT SUM(quantidade * valor_unitario)
                   FROM tb_vendas_agro WHERE estoque = true), 0), 2
       ) AS pct_valor_top5;
-- 25.46  (196000.00 de 769784.00)


/* KPI 4 | Total de unidades armazenadas disponíveis
   Objetivo: medir o volume físico disponível.
   Regra: SUM(quantidade) com estoque = true
   Base: apenas disponíveis.                                     */
SELECT SUM(quantidade) AS total_unidades_disponiveis
FROM tb_vendas_agro
WHERE estoque = true;
-- 5681


/* KPI 5 | Concentração de fornecedores (%)
   Objetivo: avaliar a dependência da carteira por fornecedor.
   Regra: (registros do fornecedor / total de registros) * 100
   Base: todos os registros.                                     */
SELECT fornecedor,
       COUNT(*) AS qtd_registros,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM tb_vendas_agro), 2) AS pct_participacao
FROM tb_vendas_agro
GROUP BY fornecedor
ORDER BY qtd_registros DESC;
-- Campo Verde 23.53 | NutriCampo 20.59 | AgroSul 16.18
-- BioPlant 14.71 | Solo Forte 14.71 | AgroMax 10.29


/* KPI 6 | Taxa de indisponibilidade por categoria (%)
   Objetivo: identificar categorias com maior bloqueio de venda.
   Regra: (indisponíveis da categoria / total da categoria) * 100
   Base: todos os registros da categoria.                        */
SELECT categoria,
       COUNT(*) AS total_categoria,
       SUM(CASE WHEN estoque = false THEN 1 ELSE 0 END) AS qtd_indisponiveis,
       ROUND(100.0 * SUM(CASE WHEN estoque = false THEN 1 ELSE 0 END)
             / NULLIF(COUNT(*), 0), 2) AS pct_indisponivel
FROM tb_vendas_agro
GROUP BY categoria
HAVING SUM(CASE WHEN estoque = false THEN 1 ELSE 0 END) >= 1
ORDER BY pct_indisponivel DESC;
-- Defensivos 50.00 | Sementes 44.44 | Fertilizantes 33.33
-- Grãos 18.75 | Rações 15.38 | Minerais 14.29


/* KPI 7 | Valor médio por unidade disponível (R$)
   Objetivo: medir o valor médio carregado por unidade em estoque.
   Regra: valor potencial disponível / total de unidades disponíveis
   Base: apenas disponíveis.                                     */
SELECT ROUND(SUM(quantidade * valor_unitario) / NULLIF(SUM(quantidade), 0), 2)
       AS valor_medio_por_unidade
FROM tb_vendas_agro
WHERE estoque = true;
-- 135.50


/* KPI 8 | Percentual do valor de Defensivos bloqueado (%)
   Objetivo: medir o impacto financeiro do bloqueio comercial.
   Regra: (valor de Defensivos indisponíveis / valor total da
   categoria Defensivos) * 100. Base: todos os Defensivos.       */
SELECT ROUND(100.0 * SUM(CASE WHEN estoque = false THEN quantidade * valor_unitario ELSE 0 END)
             / NULLIF(SUM(quantidade * valor_unitario), 0), 2)
       AS pct_valor_defensivos_bloqueado
FROM tb_vendas_agro
WHERE categoria = 'Defensivos';
-- 51.86  (108950.00 de 210105.00)


/* KPI 9 | Valor potencial disponível por estado (R$)
   Objetivo: comparar a distribuição regional do valor em estoque.
   Regra: SUM(quantidade * valor_unitario) com estoque = true,
   agrupado por estado. Base: apenas disponíveis.                */
SELECT estado, ROUND(SUM(quantidade * valor_unitario), 2) AS valor_potencial
FROM tb_vendas_agro
WHERE estoque = true
GROUP BY estado
ORDER BY valor_potencial DESC;
-- MT 248857.20 | MS 147160.00 | PR 133660.10 | GO 105582.20
-- SP 41570.00 | SC 36200.00 | RS 30815.50 | MG 25939.00


/* KPI 10 | Percentual de produtos com valor unitário acima da média (%)
   Objetivo: medir o peso dos itens de alto valor na base.
   Regra: (registros acima da média / total de registros) * 100,
   com subquery para a média. Base: todos os registros.          */
SELECT ROUND(100.0 * SUM(CASE WHEN valor_unitario > (SELECT AVG(valor_unitario) FROM tb_vendas_agro)
                             THEN 1 ELSE 0 END)
             / NULLIF(COUNT(*), 0), 2) AS pct_acima_da_media
FROM tb_vendas_agro;
-- 30.88  (21 de 68; média 266.88)