-- QUERY

SELECT Id, ShipCountry,
CASE WHEN ShipCountry IN ('USA', 'Mexico', 'Canada') THEN 'NorthAmerica' ELSE 'OtherCountry' END 
FROM 'Order'
WHERE Id >= 15445
ORDER BY Id ASC
LIMIT 20;

-- OUTPUT

-- 15445|France|OtherCountry
-- 15446|Italy|OtherCountry
-- 15447|Portugal|OtherCountry
-- 15448|Argentina|OtherCountry
-- 15449|Portugal|OtherCountry
-- 15450|Venezuela|OtherCountry
-- 15451|Brazil|OtherCountry
-- 15452|France|OtherCountry
-- 15453|France|OtherCountry
-- 15454|Canada|NorthAmerica
-- 15455|USA|NorthAmerica
-- 15456|France|OtherCountry
-- 15457|Mexico|NorthAmerica
-- 15458|USA|NorthAmerica
-- 15459|Germany|OtherCountry
-- 15460|Argentina|OtherCountry
-- 15461|Austria|OtherCountry
-- 15462|Austria|OtherCountry
-- 15463|Finland|OtherCountry
-- 15464|Brazil|OthersCountry