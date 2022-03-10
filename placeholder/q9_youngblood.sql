-- QUERY

SELECT RegionDescription, FirstName, LastName, Birth
FROM (SELECT FirstName, LastName, Birthdate, RegionId, EmployeeId
FROM 'Employee'
INNER JOIN EmployeeTerritory ON Employee.Id = EmployeeTerritory.EmployeeId
INNER JOIN Territory ON TerritoryId = Territory.Id)
INNER JOIN (SELECT RegionId AS RgnID, MAX(Employee.Birthdate) AS Birth 
FROM 'Employee'
INNER JOIN EmployeeTerritory ON Employee.Id = EmployeeTerritory.EmployeeId
INNER JOIN Territory ON TerritoryId = Territory.Id
GROUP BY RegionId)
ON Birthdate = Birth AND RgnID = RegionId
INNER JOIN Region ON Region.Id = RegionId
GROUP BY EmployeeId
ORDER BY RgnID;

-- OUTPUT

-- Eastern|Steven|Buchanan|1987-03-04
-- Western|Michael|Suyama|1995-07-02
-- Northern|Anne|Dodsworth|1998-01-27
-- Southern|Janet|Leverling|1995-08-30