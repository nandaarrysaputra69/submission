-- QUERY

SELECT DISTINCT ShipName, SUBSTR (ShipName, 0, INSTR(ShipName, '-')) AS PrecedingHyphen
FROM 'Order'
WHERE ShipName LIKE '%-%'
ORDER BY ShipName ASC;

-- OUTPUT

-- Bottom-Dollar Markets|Bottom
-- Chop-suey Chinese|Chop
-- GROSELLA-Restaurante|GROSELLA
-- HILARION-Abastos|HILARION
-- Hungry Owl All-Night Grocers|Hungry Owl All
-- LILA-Supermercado|LILA
-- LINO-Delicateses|LINO
-- QUICK-Stop|QUICK
-- Save-a-lot Markets|Save