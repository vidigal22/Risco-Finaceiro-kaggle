/*1-Distribuição Demográfica*/
# Contagem de registros por gênero:
SELECT Gênero, COUNT(*) AS Contagem FROM dados_br GROUP BY Gênero;
-- M = 1852
-- F = 1948
-- N = 1916

#Contagem de registros por estado civil:
SELECT `Estado Civil`, COUNT(*) AS Contagem FROM dados_br GROUP BY `Estado Civil`;
-- Divorciado = 1444
-- Solteiro = 1412
-- Casado = 1378
-- Viuva = 1482

#Contagem de registros por nível educacional:
SELECT `Nível Educacional`, COUNT(*) AS Contagem FROM dados_br GROUP BY `Nível Educacional`;
-- Doutorado = 1408
-- Mestrado = 1420
-- Bacharel = 1449
-- Ensino Medio = 1439
-- ----------------------------------------------------------------------------------------------------------------------------------------------------
/*2-Renda e Empréstimos*/
#Média de renda por estado:
SELECT Estado, AVG(Renda) AS Media_Renda FROM dados_br GROUP BY Estado ORDER BY Media_Renda;

#Média do montante do empréstimo por finalidade:
SELECT `Finalidade do Empréstimo`, AVG(`Montante do Empréstimo`) AS Media_Emprestimo FROM dados_br GROUP BY `Finalidade do Empréstimo`;
-- Negocios = 26628,10
-- Casa = 27389,20
-- Pessoal = 28144,88
-- Auto = 28185,98
-- ----------------------------------------------------------------------------------------------------------------------------------------------------
/*3-Histórico de Pagamento e Classificação de Risco*/
#Contagem de clientes por classificação de risco:
SELECT `Classificação de Risco`, COUNT(*) AS Contagem FROM dados_br GROUP BY `Classificação de Risco`;
-- Baixo = 3424
-- Medio = 1728
-- alto = 563

#Média de pontuação de crédito por classificação de risco:
SELECT `Classificação de Risco`, AVG(`Pontuação de Crédito`) AS Media_Credito FROM dados_br GROUP BY `Classificação de Risco`;
-- Baixo = 698,34
-- Medio = 700,21
-- Alto = 700,54
-- ----------------------------------------------------------------------------------------------------------------------------------------------------
/*4-Situação de Emprego*/
#Contagem de registros por situação de emprego:
SELECT `Situação de Emprego`, COUNT(*) AS Contagem FROM dados_br GROUP BY `Situação de Emprego`;
-- Desempregados = 1894
-- Empregado = 1910
-- Autonomo = 1912

#Relação entre renda e situação de emprego.
-- acaba pedindo mais emprestimo pessoas autonomas, por em pessoas desempregadas pedem emprestimos com valores mais alto
SELECT * FROM dados_br;
SELECT `Situação de Emprego`, count(*) AS pessoas FROM dados_br GROUP BY `Situação de Emprego`;
SELECT sum(`Montante do Empréstimo`) FROM dados_br WHERE `Situação de Emprego` = 'Desempregado'; 
SELECT sum(`Montante do Empréstimo`) FROM dados_br WHERE `Situação de Emprego` = 'Empregado';
SELECT sum(`Montante do Empréstimo`) FROM dados_br WHERE `Situação de Emprego` = 'Autonomo';
-- ----------------------------------------------------------------------------------------------------------------------------------------------------c  
/*5-Padrões Regionais*/
# Relação à concessão de empréstimos
SELECT País, count(*) FROM dados_br GROUP BY País ORDER BY count(*);
SELECT count(distinct(País)) FROM dados_br;
SELECT DISTINCT(País) FROM dados_br;
 
 #5 primeiro paises com mais emprestimo
 -- 1-congo 56 (ensino medio 17)
 -- 2-korea 41 (mestrado e ensino medio empatado com 12)
 -- 3-tajikistan 37 (ensino medio com 13)
 -- 4-trinidad adn tobago 35 (mestrado com 11)
 -- 5-yemen 35 ('doutorado com 12)
 