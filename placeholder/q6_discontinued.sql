-- QUERY

SELECT PrdctName, CompanyName, ContactName
FROM (SELECT PrdctName, min (OrderDate), CompanyName, ContactName
FROM (SELECT ProductName AS PrdctName ,Id AS PrdctId FROM 'Product' WHERE Discontinued != 0) as DiscontinuedPrdct
INNER JOIN OrderDetail on ProductId = PrdctId
INNER JOIN 'Order' on 'Order'.Id = OrderDetail.OrderId
INNER JOIN Customer on CustomerId = Customer.Id
GROUP BY PrdctId)
ORDER BY PrdctName ASC;

-- OUTPUT

-- Alice Mutton|Consolidated Holdings|Elizabeth Brown
-- Chef Anton's Gumbo Mix|Piccolo und mehr|Georg Pipps
-- Guarana Fantastica|Piccolo und mehr|Georg Pipps
-- Mishi Kobe Niku|Old World Delicatessen|Rene Phillips
-- Perth Pasties|Piccolo und mehr|Georg Pipps
-- Rossle Sauerkraut|Piccolo und mehr|Georg Pipps
-- Singaporean Hokkien Fried Mee|Vins et alcools Chevalier|Paul Henriot
-- Thuringer Rostbratwurst|Piccolo und mehr|Georg Pipps