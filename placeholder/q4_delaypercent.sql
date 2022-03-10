-- QUERY

SELECT CompanyName, ROUND (DelayCount * 100.0 / TotalCount, 2) AS DelayPercent
FROM (SELECT ShipVia, COUNT (*) AS DelayCount FROM 'Order' WHERE ShippedDate > RequiredDate GROUP BY ShipVia) AS DelayC
INNER JOIN (SELECT ShipVia, COUNT (*) AS TotalCount FROM 'Order' GROUP BY ShipVia) AS TotalC
ON DelayC.ShipVia = TotalC.ShipVia
INNER JOIN Shipper on TotalC.ShipVia = Shipper.Id
ORDER BY DelayPercent DESC;

-- OUTPUT

-- Federal Shipping|23.61
-- Speedy Express|23.46
-- United Package|23.44