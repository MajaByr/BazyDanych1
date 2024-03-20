--------1--------

--Wykorzystuj¹c wyra¿enie CTE zbuduj zapytanie, które znajdzie informacje na temat stawki
--pracownika oraz jego danych, a nastêpnie zapisze je do tabeli tymczasowej
--TempEmployeeInfo. Rozwi¹¿ w oparciu o AdventureWorks


WITH Salary (BusinessEntityID, Rate)
AS
( 
	SELECT BusinessEntityID, Rate
	FROM HumanResources.EmployeePayHistory
	WHERE HumanResources.EmployeePayHistory.Rate IS NOT NULL
)
SELECT p.BusinessEntityID, p.FirstName, p.MiddleName, p.LastName, p.PersonType, Salary.Rate 
FROM Salary
LEFT JOIN Person.Person p
ON Salary.BusinessEntityID=p.BusinessEntityID;

/*
--------2--------
WITH sales (CustomerID, SubTotal) AS
(
SELECT CustomerID, SUM(SubTotal) FROM SalesLT.SalesOrderHeader
GROUP BY CustomerID
)
SELECT CONCAT(c.CompanyName, ' (', c.FirstName, ' ', c.LastName, ')') AS CompanyContact,
		sales.SubTotal AS Revenue
FROM sales
LEFT JOIN SalesLT.Customer c
ON sales.CustomerID=c.CustomerID;

--------3--------
WITH sales (ProductID, SalesValue) AS
(
SELECT ProductID, sum((UnitPrice - UnitPriceDiscount)*OrderQty)
FROM SalesLT.SalesOrderDetail
GROUP BY ProductID
)
SELECT cat.Name, SUM(sales.SalesValue)  AS SalesValue
FROM SalesLT.ProductCategory cat
LEFT JOIN SalesLT.Product pr
ON pr.ProductCategoryID=cat.ProductCategoryID
LEFT JOIN sales
ON sales.ProductID=pr.ProductID
GROUP BY cat.Name;
*/