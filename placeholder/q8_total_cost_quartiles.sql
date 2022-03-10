-- QUERY

WITH Expenditures AS (SELECT IFNULL (Cstmr.CompanyName, 'MISSING_NAME') AS CompanyName, Ordr.CustomerId, ROUND (SUM(OrdrDetail.Quantity * OrdrDetail.UnitPrice), 2) AS TotalExpenditure
FROM 'Order' AS Ordr
INNER JOIN OrderDetail OrdrDetail on OrdrDetail.OrderId = Ordr.Id
LEFT JOIN Customer Cstmr on Cstmr.Id = Ordr.CustomerId
GROUP BY Ordr.CustomerId),

Quartiles AS (SELECT *, NTILE (4) OVER (ORDER BY TotalExpenditure ASC) AS Total
FROM Expenditures)

SELECT CompanyName, CustomerId, TotalExpenditure
FROM Quartiles
WHERE Total = 1
ORDER BY TotalExpenditure ASC;

-- OUTPUT

-- MISSING_NAME|DUMO|1615.9
-- MISSING_NAME|OCEA|3460.2
-- MISSING_NAME|ANTO|7515.35
-- MISSING_NAME|QUEE|30226.1
-- Trail's Head Gourmet Provisioners|TRAIH|3874502.02
-- Blondesddsl pere et fils|BLONP|3879728.69
-- Around the Horn|AROUT|4395636.28
-- Hungry Owl All-Night Grocers|HUNGO|4431457.1
-- Bon app|BONAP|4485708.49
-- Bolido Comidas preparadas|BOLID|4520121.88
-- Galeria del gastronomo|GALED|4533089.9
-- FISSA Fabrica Inter. Salchichas S.A.|FISSA|4554591.02
-- Maison Dewey|MAISD|4555931.37
-- Cactus Comidas para llevar|CACTU|4559046.87
-- Specialites du monde|SPECD|4571764.89
-- Magazzini Alimentari Riuniti|MAGAA|4572382.35
-- Toms Spezialitaten|TOMSP|4628403.36
-- Split Rail Beer & Ale|SPLIR|4641383.53
-- Sante Gourmet|SANTG|4647668.15
-- Morgenstern Gesundkost|MORGK|4676234.2
-- White Clover Markets|WHITC|4681531.74
-- La corne d'abondance|LACOR|4724494.22
-- Victuailles en stock|VICTE|4726476.33
-- Lonesome Pine Restaurant|LONEP|4735780.66