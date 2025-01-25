CREATE VIEW vw_Employee_FullName_DepartmanetName
AS
SELECT P.FirstName+' '+P.LastName AS 'Full Name',HRD.Name FROM
Person.Person AS P
INNER JOIN HumanResources.Employee AS HRE
ON P.BusinessEntityID=HRE.BusinessEntityID
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HREDH
ON HRE.BusinessEntityID=HREDH.BusinessEntityID
INNER JOIN HumanResources.Department AS HRD
ON HREDH.DepartmentID=HRD.DepartmentID

SELECT * FROM vw_Employee_FullName_DepartmanetName


CREATE VIEW vw_Number_Employee_Departman
AS
SELECT HRD.Name,COUNT(*) AS 'Number of Employee' FROM 
HumanResources.Employee AS HRE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HREDH
ON HRE.BusinessEntityID=HREDH.BusinessEntityID
INNER JOIN HumanResources.Department AS HRD
ON HREDH.DepartmentID=HRD.DepartmentID
GROUP BY HRD.Name

SELECT Name,COUNT(*) FROM vw_Employee_FullName_DepartmanetName
GROUP BY Name


CREATE VIEW vw_Number_Of_Products_Category
AS
SELECT PC.Name AS 'Product category',COUNT(*) AS 'Number of product' FROM
Production.Product AS PR
INNER JOIN Production.ProductSubcategory AS PS
ON PR.ProductSubcategoryID=PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC
ON PC.ProductCategoryID=PS.ProductCategoryID
GROUP BY PC.Name

SELECT * FROM vw_Number_Of_Products_Category

CREATE VIEW vw_Number_Of_Products_Category_Subcategory
AS
SELECT PC.Name AS 'Category name',PS.Name AS 'Subcategory name',COUNT(*) AS 'Number of product' FROM
Production.Product AS PR
INNER JOIN Production.ProductSubcategory AS PS
ON PR.ProductSubcategoryID=PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC
ON PC.ProductCategoryID=PS.ProductCategoryID
GROUP BY PC.Name,PS.Name

