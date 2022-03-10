-- QUERY

WITH ProductNames AS (SELECT Product.Id, Product.ProductName AS PrdctName
FROM Product
INNER JOIN OrderDetail ON Product.id = OrderDetail.ProductId
INNER JOIN'Order' ON 'Order'.Id = OrderDetail.OrderId
INNER JOIN Customer ON CustomerId = Customer.Id
WHERE DATE(OrderDate) = '2014-12-25' AND CompanyName = 'Queen Cozinha'
GROUP BY Product.id),

Company AS (SELECT row_number() OVER (ORDER BY ProductNames.Id ASC) AS RowNum, ProductNames.PrdctName AS PName
FROM ProductNames),

CommaString AS (SELECT RowNum, PName AS NameP
FROM Company
WHERE RowNum = 1
UNION ALL
SELECT Company.RowNum, CString.NameP || ', ' || Company.PName
FROM Company
JOIN CommaString CString
ON Company.RowNum = CString.RowNum + 1
)

SELECT NameP FROM CommaString
ORDER BY RowNum DESC
LIMIT 1;

-- OUTPUT

-- Mishi Kobe Niku, NuNuCa Nus-Nougat-Creme, Schoggi Schokolade, Mascarpone Fabioli, Sasquatch Ale, Boston Crab Meat, Manjimup Dried Apples, Longlife Tofu, Lakkalikoori