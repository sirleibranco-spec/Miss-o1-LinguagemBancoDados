A AgroTech Solutions atua na comercialização de produtos agrícolas e consolidou os dados de suas filiais regionais em uma única base. Durante a integração foram identificados registros duplicados, erros de digitação, valores incorretos, datas incompatíveis e dados de teste, todos capazes de comprometer a confiabilidade dos relatórios da diretoria. O objetivo do trabalho é tratar essa base, extrair relatórios gerenciais e construir 10 KPIs que apoiem decisões de disponibilidade, estoque, valor financeiro, fornecedores e distribuição regional. A base tratada final tem 68 registros, sendo 48 disponíveis e 20 indisponíveis.
Parte 1, limpeza e tratamento: remoção de duplicados, padronização de nomes de produto, fornecedores, estados e categorias, correção de valores unitários e quantidades, exclusão de datas inválidas e de registros de teste, e bloqueio comercial de defensivos de alto valor.
Parte 2, relatório gerencial: 10 consultas de análise sobre a base tratada, cobrindo disponibilidade, fornecedores, categorias, estados, volume e valor.
Parte 3, KPIs: 10 indicadores com objetivo, regra de cálculo, resultado e interpretação gerencial, incluindo percentuais, valores em reais e comparações entre fornecedores, categorias e estados.
Parte 4, documentação e publicação: este README, o script SQL único e a apresentação de slides, publicados no repositório GitHub.
2. ESTRUTURA DO REPOSITÓRIO
Arquivo	Descrição
README.md	Documentação do projeto.
AgroTech_Integrantes.sql	Criação do banco, carga dos dados, Parte 1, Parte 2 e consultas dos KPIs da Parte 3, na ordem de execução.
AgroTech_KPIs_Integrantes.pptx	Apresentação dos 10 KPIs e da conclusão gerencial.
3. COMO EXECUTAR
Requisitos:
•	MySQL 8.0 ou superior (o script usa DROP DATABASE IF EXISTS e NULLIF);
•	Cliente de linha de comando, MySQL Workbench ou DBeaver;
•	Nenhuma biblioteca externa, o script é autossuficiente.
Execução por linha de comando
mysql -u root -p < AgroTech_Integrantes.sql
Execução no MySQL Workbench
1.	1. Abrir o arquivo AgroTech_Integrantes.sql;
2.	2. Executar o script completo pelo comando Execute All;
3.	3. Conferir os resultados na aba de saída.
Ordem de execução
4.	Criação do banco agropecuaria_db e da tabela tb_vendas_agro;
5.	Carga dos 75 registros originais, incluindo as falhas propositais;
6.	Parte 1, questões 01 a 10, com SELECT de conferência antes de cada UPDATE e DELETE;
7.	Parte 2, consultas 01 a 10;
8.	Parte 3, consultas de KPI 01 a KPI 10.
Aviso: o script remove e recria o banco agropecuaria_db, portanto deve ser executado em ambiente onde a base da atividade ainda não exista ou possa ser recriada.
Conferência da execução: ao final da Parte 1, a consulta SELECT COUNT(*) AS total_apos_limpeza deve retornar 68. Se retornar outro valor, alguma etapa anterior não foi executada.

4. DICIONÁRIO DE DADOS
A finalidade da tabela tb_vendas_agro é registrar operações de comercialização de produtos agrícolas consolidadas a partir das filiais regionais. Cada linha representa um registro de venda de um produto, com seu fornecedor, a unidade federativa da operação, a quantidade negociada, o valor unitário praticado, a data da venda e a situação de disponibilidade em estoque.
Coluna	Tipo	Descrição	Restrições e regras	Exemplo na base tratada
id	INT	Identificador único do registro	Chave primária, obrigatório e único	23
produto	VARCHAR(100)	Nome comercial do produto	Padronizado quanto à grafia e à acentuação na questão 02	Soja Exportação
categoria	VARCHAR(50)	Segmento do produto	Valores oficiais Grãos, Rações, Fertilizantes, Defensivos, Minerais e Sementes	Grãos
fornecedor	VARCHAR(100)	Empresa fornecedora	Padronizado na questão 03	Campo Verde
estado	VARCHAR(50)	Unidade federativa da operação	Sempre em sigla de duas letras, conforme questão 06	MT
quantidade	INT	Unidades armazenadas ou negociadas	Deve ser maior que zero e foi corrigida na questão 05	260
valor_unitario	DECIMAL(10,2)	Preço por unidade em reais	Deve ser maior que zero e dentro do padrão comercial, corrigido na questão 04	160.00
data_venda	DATE	Data da operação	Deve estar entre 01/01/2025 e 31/12/2025, data limite operacional	2025-03-12
estoque	BOOLEAN	Indica se o produto está disponível para comercialização	true para disponível e false para indisponível	true
Interpretação das colunas de negócio
Quantidade: é o volume físico em unidades. Não confundir com a quantidade de registros, pois COUNT(*) conta linhas e SUM(quantidade) conta unidades.
Estoque: funciona como sinalizador comercial. Quando true, o produto está liberado para venda e entra nos cálculos de valor potencial disponível. Quando false, está bloqueado para reavaliação e entra apenas nas análises de indisponibilidade. Na questão 10 da Parte 1, defensivos com valor unitário acima de R$ 800,00 foram marcados como false e permaneceram na base.
Data_venda: delimita o período operacional. A base considera válidas apenas datas até 31/12/2025 e registros posteriores foram removidos. A coluna também permite análises temporais, como o recorte entre março e maio de 2025.
5. RESULTADOS DO TRATAMENTO
Questão	Ação	Resultado
01	Remoção de duplicados de Milho Safrinha, Soja Premium e Ração Bovina 25kg	3 registros removidos (IDs 51, 52 e 53), preservando o menor ID de cada produto
02	Padronização de nomes de produto	5 registros corrigidos
03	Padronização de fornecedores	3 registros corrigidos
04	Correção de valores unitários	4 registros corrigidos: Soja Exportação, Fungicida Premium, Calcário Premium e Adubo Nitrogenado
05	Correção de quantidades	2 registros corrigidos: Milho Tradicional e Ração Ovina
06	Padronização de estados	2 registros corrigidos: PARANA para PR e SÃO PAULO para SP
07	Padronização de categorias	2 registros corrigidos: Graos para Grãos e Racao para Rações
08	Exclusão de datas posteriores a 31/12/2025	4 registros removidos (IDs 72, 73, 74 e 75)
09	Exclusão de registros de teste	0 registros afetados, pois já haviam sido removidos na questão 08
10	Bloqueio de defensivos acima de R$ 800,00	5 registros atualizados para estoque false: IDs 30, 44, 49, 63 e 69
Efeito na base: de 75 registros originais restaram 68. Foram 7 exclusões (3 duplicados e 4 datas inválidas) e nenhuma exclusão indevida de registro válido. Todos os registros com erro de digitação foram corrigidos e preservados, conforme exigido pelo enunciado.
6. RESULTADOS DO RELATÓRIO GERENCIAL
Consulta	Resultado
01. Produtos disponíveis	48 registros com estoque true
02. Produtos por fornecedor	Campo Verde 16, NutriCampo 14, AgroSul 11, Solo Forte 10, BioPlant 9, AgroMax 8
03. Maiores valores unitários	Liderado por Herbicida Platinum (R$ 980,00) e Fungicida Premium (R$ 950,00)
04. Valor unitário médio por categoria	Defensivos R$ 739,91, Fertilizantes R$ 296,74, Grãos R$ 136,02, Sementes R$ 117,44, Rações R$ 113,68, Minerais R$ 58,17
05. Produtos por estado	MT 14, PR 12, GO 11, MS 8, SC 7, SP 7, RS 6, MG 3
06. Sementes e Grãos disponíveis	18 registros
07. Quantidade acima de 200 unidades	8 registros
08. Valor potencial do estoque disponível	R$ 769.784,00
09. Categorias com produtos indisponíveis	Defensivos 7, Sementes 4, Grãos 3, Fertilizantes 3, Rações 2, Minerais 1
10. Vendas entre março e maio de 2025	51 registros
Disponibilidade e valor: a disponibilidade da base é de 70,59%, com 48 dos 68 registros liberados para comercialização. O valor potencial do estoque disponível soma R$ 769.784,00, e esse montante não representa faturamento nem lucro, pois a base não informa custos nem a quantidade efetivamente vendida em cada operação.
Fornecedores: a carteira é pulverizada. Campo Verde lidera com 16 registros, o equivalente a 23,53% da base, seguido por NutriCampo com 14 registros e 20,59%. Nenhum fornecedor concentra mais de um quarto dos registros.
Estados: a concentração regional é maior que a concentração de fornecedores. Mato Grosso reúne 14 registros, seguido por Paraná com 12 e Goiás com 11. Em valor potencial disponível, Mato Grosso concentra R$ 248.857,20, cerca de um terço do total da empresa, enquanto Minas Gerais responde por apenas R$ 25.939,00.
Categorias: Defensivos tem o maior valor unitário médio, R$ 739,91, e também a maior taxa de indisponibilidade, 50,00%. É o segmento mais valioso e o mais bloqueado ao mesmo tempo.
7. CATÁLOGO E RESULTADOS DOS 10 KPIs
Todos os indicadores usam a tabela tb_vendas_agro após o tratamento da Parte 1. Os códigos abaixo correspondem exatamente aos comentários do arquivo SQL. Todas as divisões usam NULLIF no denominador para evitar erro de divisão por zero, retornando NULL quando o denominador é zero.
KPI 01, Percentual de produtos disponíveis
Objetivo: medir a fatia da base apta para comercialização.
Tabela e colunas: tb_vendas_agro, colunas id e estoque.
Regra de cálculo: registros com estoque true dividido pelo total de registros, vezes 100, com numerador de 48 registros e denominador de 68 registros.
Filtros e unidade: nenhum filtro, percentual, considera todos os registros.
Resultado: 70,59%.
Interpretação gerencial: sete em cada dez produtos estão liberados, mas 20 seguem travados; a decisão apoiada é priorizar a liberação dos itens bloqueados.
KPI 02, Valor potencial do estoque disponível
Objetivo: dimensionar o valor financeiro pronto para venda.
Tabela e colunas: tb_vendas_agro, colunas quantidade, valor_unitario e estoque.
Regra de cálculo: soma de quantidade multiplicada por valor unitário, apenas com estoque true.
Filtros e unidade: estoque true, reais, apenas disponíveis.
Resultado: R$ 769.784,00.
Interpretação gerencial: representa capital potencial parado em estoque; a decisão apoiada é dimensionar meta comercial e necessidade de capital de giro.
KPI 03, Concentração do valor nos cinco produtos mais valiosos
Objetivo: medir a dependência do valor total em poucos itens.
Tabela e colunas: tb_vendas_agro, colunas quantidade e valor_unitario.
Regra de cálculo: valor potencial dos cinco maiores produtos dividido pelo valor potencial disponível total, vezes 100, com numerador de R$ 196.000,00 e denominador de R$ 769.784,00, usando subquery com LIMIT 5.
Filtros e unidade: estoque true, percentual, apenas disponíveis.
Resultado: 25,46%.
Interpretação gerencial: concentração moderada, sem dependência crítica de um único item; a decisão apoiada é diversificar o mix de produtos.
KPI 04, Total de unidades armazenadas disponíveis
Objetivo: medir o volume físico disponível.
Tabela e colunas: tb_vendas_agro, coluna quantidade.
Regra de cálculo: soma de quantidade com estoque true.
Filtros e unidade: estoque true, unidades, apenas disponíveis.
Resultado: 5.681 unidades.
Interpretação gerencial: volume relevante, concentrado em grãos e calcário; a decisão apoiada é planejar capacidade de armazenagem e escoamento.
KPI 05, Concentração de fornecedores
Objetivo: avaliar a dependência da carteira em relação aos fornecedores.
Tabela e colunas: tb_vendas_agro, colunas fornecedor e id.
Regra de cálculo: registros do fornecedor dividido pelo total de registros, vezes 100, com numerador de registros do fornecedor e denominador de 68, usando subquery para o total.
Filtros e unidade: nenhum filtro, percentual e comparativo, todos os registros.
Resultado: Campo Verde 23,53%, NutriCampo 20,59%, AgroSul 16,18%, Solo Forte 14,71%, BioPlant 13,24%, AgroMax 11,76%.
Interpretação gerencial: nenhum fornecedor concentra mais de um quarto da base; a decisão apoiada é manter a política de diversificação de fornecedores.
KPI 06, Taxa de indisponibilidade por categoria
Objetivo: identificar as categorias com maior bloqueio de venda.
Tabela e colunas: tb_vendas_agro, colunas categoria e estoque.
Regra de cálculo: registros indisponíveis da categoria dividido pelo total de registros da categoria, vezes 100, com numerador de registros com estoque false e denominador do total da categoria.
Filtros e unidade: HAVING para exibir apenas categorias com pelo menos um indisponível, percentual e comparativo, todos os registros da categoria.
Resultado: Defensivos 50,00%, Sementes 44,44%, Fertilizantes 33,33%, Grãos 18,75%, Rações 15,38%, Minerais 14,29%.
Interpretação gerencial: Defensivos e Sementes concentram o bloqueio; a decisão apoiada é revisar a política de bloqueio por categoria.
KPI 07, Valor médio por unidade disponível
Objetivo: medir o valor médio carregado por unidade em estoque.
Tabela e colunas: tb_vendas_agro, colunas quantidade e valor_unitario.
Regra de cálculo: valor potencial disponível dividido pelo total de unidades disponíveis.
Filtros e unidade: estoque true, reais por unidade, apenas disponíveis.
Resultado: R$ 135,50 por unidade.
Interpretação gerencial: o mix tem ticket por unidade relativamente alto, puxado por defensivos e fertilizantes; a decisão apoiada é calibrar precificação e política de giro.
KPI 08, Percentual do valor de Defensivos bloqueado
Objetivo: medir o impacto financeiro do bloqueio comercial.
Tabela e colunas: tb_vendas_agro, colunas categoria, estoque, quantidade e valor_unitario.
Regra de cálculo: valor potencial dos defensivos indisponíveis dividido pelo valor potencial total da categoria Defensivos, vezes 100, com numerador de R$ 108.950,00 e denominador de R$ 210.105,00.
Filtros e unidade: categoria igual a Defensivos, percentual e financeiro, todos os registros da categoria.
Resultado: 51,86%.
Interpretação gerencial: mais da metade do valor da categoria está fora de venda; a decisão apoiada é reavaliar o bloqueio com urgência.
KPI 09, Valor potencial disponível por estado
Objetivo: comparar a distribuição regional do valor em estoque.
Tabela e colunas: tb_vendas_agro, colunas estado, quantidade e valor_unitario.
Regra de cálculo: soma de quantidade multiplicada por valor unitário com estoque true, agrupada por estado.
Filtros e unidade: estoque true, reais e comparativo, apenas disponíveis.
Resultado: MT R$ 248.857,20, MS R$ 147.160,00, PR R$ 133.660,10, GO R$ 105.582,20, SP R$ 41.570,00, SC R$ 36.200,00, RS R$ 30.815,50 e MG R$ 25.939,00, somando os R$ 769.784,00 do KPI 02.
Interpretação gerencial: Mato Grosso concentra cerca de um terço do valor disponível; a decisão apoiada é priorizar logística e operação comercial no Centro-Oeste.
KPI 10, Percentual de produtos com valor unitário acima da média
Objetivo: medir o peso dos itens de alto valor na base.
Tabela e colunas: tb_vendas_agro, colunas valor_unitario e id.
Regra de cálculo: registros com valor unitário acima da média da base dividido pelo total de registros, vezes 100, com numerador de 21 registros e denominador de 68, usando subquery SELECT AVG(valor_unitario) para calcular a média.
Filtros e unidade: nenhum filtro, percentual, todos os registros.
Resultado: 30,88%, com média da base de R$ 266,88.
Interpretação gerencial: a base é puxada por poucos itens caros; a decisão apoiada é acompanhar a exposição de capital nos itens de maior valor.
8. CONCLUSÃO GERENCIAL
Entre os 10 indicadores, três se destacam para a diretoria.
KPI 02, valor potencial do estoque disponível (R$ 769.784,00): é o indicador que quantifica a oportunidade comercial real da empresa no período. Serve de base para definir meta de vendas, planejar capital de giro e negociar condições com fornecedores. Sem ele, as demais análises ficam sem escala financeira.
KPI 08, percentual do valor de Defensivos bloqueado (51,86%): é o indicador mais acionável do conjunto, porque revela um problema concreto e com causa conhecida, já que mais da metade do valor da categoria mais rentável está fora de venda por decisão administrativa. Reverter parte desse bloqueio tem efeito direto sobre o valor potencial disponível, com R$ 108.950,00 em jogo.
KPI 05, concentração de fornecedores (maior participante com 23,53%): é o indicador de risco. Mostra que a política de diversificação está funcionando e que não há dependência crítica de um único parceiro, o que protege a operação em caso de ruptura de fornecimento. Também serve de alerta, pois se a concentração voltar a subir acima de 25%, a empresa retoma exposição indesejada.
Recomendações para a diretoria:
9.	Priorizar a liberação dos 20 itens bloqueados, começando pela categoria Defensivos, que responde por 7 dos 20 registros indisponíveis.
10.	Reavaliar o bloqueio comercial dos defensivos de alto valor, dado o impacto de R$ 108.950,00, ou seja, 51,86% do valor da categoria.
11.	Usar os R$ 769.784,00 de valor potencial como referência de meta comercial e de capital de giro, sem tratá-los como receita ou lucro.
12.	Concentrar esforço logístico e comercial no Centro-Oeste, onde Mato Grosso responde por R$ 248.857,20, cerca de um terço do valor disponível.
13.	Manter a diversificação de fornecedores e monitorar a concentração do mix nos itens de valor unitário acima da média.
As metas citadas são sugestões do grupo, não foram fornecidas pela empresa.
9. LIMITAÇÕES DA BASE
A base não contém custos de aquisição, quantidade efetivamente vendida por operação, prazo de entrega nem dados de satisfação de clientes. Por isso não é possível calcular margem de lucro, faturamento realizado, lucratividade por categoria ou desempenho logístico com os dados disponíveis. O cálculo de quantidade multiplicada por valor unitário representa valor potencial do estoque, nunca faturamento ou lucro.


