--Zadanie 1

--Napisz zapytanie, które wykorzystuje transakcjê (zaczyna j¹), a nastêpnie aktualizuje cenê
--produktu o ProductID równym 680 w tabeli Production.Product o 10% i nastêpnie
--zatwierdza transakcjê

/*BEGIN TRANSACTION;
UPDATE Production.Product 
SET ListPrice = 1.1 * ListPrice
WHERE ProductID = 600;

SELECT ProductID, ListPrice FROM Production.Product
WHERE ProductID = 680;

COMMIT;*/

--Zadanie 2
--Napisz zapytanie, które zaczyna transakcjê, dodaje nowy produkt do tabeli
--Production.Product, a nastêpnie zatwierdza transakcjê

/*BEGIN TRANSACTION;
INSERT INTO Production.Product 
(Name, ListPrice, ProductNumber, SafetyStockLevel, ReorderPoint, StandardCost, 
DaysToManufacture, SellStartDate) 
VALUES ( 'Xyz', 999.99, 472319, 4, 2, 1000.99, 12, 31-12-2022);

SELECT * FROM Production.Product
WHERE Name = 'Xyz';

COMMIT;*/

--Zadanie 3
--Napisz zapytanie, które zaczyna transakcjê, usuwa produkt (o ProductID równym temu
--dodanemu w poprzednim zadaniu) z tabeli Production.Product, ale nastêpnie wycofuje
--transakcjê

BEGIN TRANSACTION;
DELETE FROM Production.Product
WHERE ProductID = 1013;
ROLLBACK;

--Zadanie 4
--Napisz zapytanie, które zaczyna transakcjê i aktualizuje StandardCost wszystkich 
--produktóww tabeli Production.Product o 10%, je¿eli suma wszystkich StandardCost 
--po aktualizacji nie przekracza 50000. W przeciwnym razie zapytanie powinno wycofaæ 
--transakcjê
/*
BEGIN TRANSACTION;
UPDATE Production.Product
SET StandardCost = StandardCost * 1.1;
IF (SELECT SUM(StandardCost) FROM Production.Product)<50000 COMMIT;
ELSE ROLLBACK; */

--Zadanie 5
--Napisz zapytanie SQL, które zaczyna transakcjê i próbuje dodaæ nowy produkt do tabeli
--Production.Product. Jeœli ProductNumber ju¿ istnieje w tabeli, zapytanie powinno wycofaæ
--transakcjê. Nale¿y najpierw usun¹æ indeksy o nazwach AK_Product_ProductNumber oraz
--AK_Product_Name.

/*
BEGIN TRANSACTION;
INSERT INTO Production.Product 
	(Name, ListPrice, ProductNumber, SafetyStockLevel, ReorderPoint, StandardCost, 
	DaysToManufacture, SellStartDate) 
VALUES ( 'Zyx', 230.99, 472319, 4, 2, 1000.99, 12, 31-12-2022);

IF (SELECT COUNT(ProductID) FROM Production.Product
	WHERE ProductNumber = '472319') IS NULL
	COMMIT;
ELSE ROLLBACK; 
*/

--Zadanie 6
--Napisz zapytanie SQL, które zaczyna transakcjê i aktualizuje wartoœæ OrderQty dla ka¿dego
--zamówienia w tabeli Sales.SalesOrderDetail. Je¿eli którykolwiek z zamówieñ ma OrderQty
--równ¹ 0, zapytanie powinno wycofaæ transakcjê

BEGIN TRANSACTION;
UPDATE Sales.SalesOrderDetail
SET OrderQty = OrderQty + 12;
IF (SELECT COUNT(ProductID) FROM Sales.SalesOrderDetail
	WHERE OrderQty = 0)>0 ROLLBACK;
ELSE COMMIT;

--Zadanie 7
--Napisz zapytanie SQL, które zaczyna transakcjê i modyfikuje (jako StandardCost wpisuje
--wartoœæ œredni¹ - szczegó³y dalej) wszystkie produkty, których StandardCost jest wy¿szy ni¿
--œredni koszt wszystkich produktów w tabeli Production.Product. Je¿eli liczba produktów do
--zmodyfikowania przekracza 200, zapytanie powinno wycofaæ transakcjê.

BEGIN TRANSACTION;
UPDATE Production.Product
SET StandardCost = (SELECT AVG(StandardCost) FROM Production.Product);
IF (SELECT COUNT(StandardCost) FROM Production.Product 
WHERE StandardCost>(SELECT AVG(StandardCost) FROM Production.Product))>200 ROLLBACK;
ELSE COMMIT;
