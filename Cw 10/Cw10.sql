--Zadanie 1

--Napisz zapytanie, które wykorzystuje transakcję (zaczyna ją), a następnie aktualizuje cenę
--produktu o ProductID równym 680 w tabeli Production.Product o 10% i następnie
--zatwierdza transakcję

/*BEGIN TRANSACTION;
UPDATE Production.Product 
SET ListPrice = 1.1 * ListPrice
WHERE ProductID = 600;

SELECT ProductID, ListPrice FROM Production.Product
WHERE ProductID = 680;

COMMIT;*/

--Zadanie 2
--Napisz zapytanie, które zaczyna transakcję, dodaje nowy produkt do tabeli
--Production.Product, a następnie zatwierdza transakcję

/*BEGIN TRANSACTION;
INSERT INTO Production.Product 
(Name, ListPrice, ProductNumber, SafetyStockLevel, ReorderPoint, StandardCost, 
DaysToManufacture, SellStartDate) 
VALUES ( 'Xyz', 999.99, 472319, 4, 2, 1000.99, 12, 31-12-2022);

SELECT * FROM Production.Product
WHERE Name = 'Xyz';

COMMIT;*/

--Zadanie 3
--Napisz zapytanie, które zaczyna transakcję, usuwa produkt (o ProductID równym temu
--dodanemu w poprzednim zadaniu) z tabeli Production.Product, ale następnie wycofuje
--transakcję

BEGIN TRANSACTION;
DELETE FROM Production.Product
WHERE ProductID = 1013;
ROLLBACK;

--Zadanie 4
--Napisz zapytanie, które zaczyna transakcję i aktualizuje StandardCost wszystkich 
--produktóww tabeli Production.Product o 10%, jeżeli suma wszystkich StandardCost 
--po aktualizacji nie przekracza 50000. W przeciwnym razie zapytanie powinno wycofać
--transakcję
/*
BEGIN TRANSACTION;
UPDATE Production.Product
SET StandardCost = StandardCost * 1.1;
IF (SELECT SUM(StandardCost) FROM Production.Product)<50000 COMMIT;
ELSE ROLLBACK; */

--Zadanie 5
--Napisz zapytanie SQL, które zaczyna transakcję i próbuje dodać nowy produkt do tabeli
--Production.Product. Jeśli ProductNumber już istnieje w tabeli, zapytanie powinno wycofać
--transakcję. Należy najpierw usunąć indeksy o nazwach AK_Product_ProductNumber oraz
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
--Napisz zapytanie SQL, które zaczyna transakcję i aktualizuje wartość OrderQty dla każdego
--zamówienia w tabeli Sales.SalesOrderDetail. Jeżeli którykolwiek z zamówień ma OrderQty
--równą 0, zapytanie powinno wycofać transakcję

BEGIN TRANSACTION;
UPDATE Sales.SalesOrderDetail
SET OrderQty = OrderQty + 12;
IF (SELECT COUNT(ProductID) FROM Sales.SalesOrderDetail
	WHERE OrderQty = 0)>0 ROLLBACK;
ELSE COMMIT;

--Zadanie 7
--Napisz zapytanie SQL, które zaczyna transakcję i modyfikuje (jako StandardCost wpisuje
--wartość średnią - szczegóły dalej) wszystkie produkty, których StandardCost jest wyższy niż
--średni koszt wszystkich produktów w tabeli Production.Product. Jeżeli liczba produktów do
--zmodyfikowania przekracza 200, zapytanie powinno wycofać transakcję.

BEGIN TRANSACTION;
UPDATE Production.Product
SET StandardCost = (SELECT AVG(StandardCost) FROM Production.Product);
IF (SELECT COUNT(StandardCost) FROM Production.Product 
WHERE StandardCost>(SELECT AVG(StandardCost) FROM Production.Product))>200 ROLLBACK;
ELSE COMMIT;
