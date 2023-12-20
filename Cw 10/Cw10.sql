--Zadanie 1

--Napisz zapytanie, kt�re wykorzystuje transakcj� (zaczyna j�), a nast�pnie aktualizuje cen�
--produktu o ProductID r�wnym 680 w tabeli Production.Product o 10% i nast�pnie
--zatwierdza transakcj�

/*BEGIN TRANSACTION;
UPDATE Production.Product 
SET ListPrice = 1.1 * ListPrice
WHERE ProductID = 600;

SELECT ProductID, ListPrice FROM Production.Product
WHERE ProductID = 680;

COMMIT;*/

--Zadanie 2
--Napisz zapytanie, kt�re zaczyna transakcj�, dodaje nowy produkt do tabeli
--Production.Product, a nast�pnie zatwierdza transakcj�

/*BEGIN TRANSACTION;
INSERT INTO Production.Product 
(Name, ListPrice, ProductNumber, SafetyStockLevel, ReorderPoint, StandardCost, 
DaysToManufacture, SellStartDate) 
VALUES ( 'Xyz', 999.99, 472319, 4, 2, 1000.99, 12, 31-12-2022);

SELECT * FROM Production.Product
WHERE Name = 'Xyz';

COMMIT;*/

--Zadanie 3
--Napisz zapytanie, kt�re zaczyna transakcj�, usuwa produkt (o ProductID r�wnym temu
--dodanemu w poprzednim zadaniu) z tabeli Production.Product, ale nast�pnie wycofuje
--transakcj�

BEGIN TRANSACTION;
DELETE FROM Production.Product
WHERE ProductID = 1013;
ROLLBACK;

--Zadanie 4
--Napisz zapytanie, kt�re zaczyna transakcj� i aktualizuje StandardCost wszystkich 
--produkt�ww tabeli Production.Product o 10%, je�eli suma wszystkich StandardCost 
--po aktualizacji nie przekracza 50000. W przeciwnym razie zapytanie powinno wycofa� 
--transakcj�
/*
BEGIN TRANSACTION;
UPDATE Production.Product
SET StandardCost = StandardCost * 1.1;
IF (SELECT SUM(StandardCost) FROM Production.Product)<50000 COMMIT;
ELSE ROLLBACK; */

--Zadanie 5
--Napisz zapytanie SQL, kt�re zaczyna transakcj� i pr�buje doda� nowy produkt do tabeli
--Production.Product. Je�li ProductNumber ju� istnieje w tabeli, zapytanie powinno wycofa�
--transakcj�. Nale�y najpierw usun�� indeksy o nazwach AK_Product_ProductNumber oraz
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
--Napisz zapytanie SQL, kt�re zaczyna transakcj� i aktualizuje warto�� OrderQty dla ka�dego
--zam�wienia w tabeli Sales.SalesOrderDetail. Je�eli kt�rykolwiek z zam�wie� ma OrderQty
--r�wn� 0, zapytanie powinno wycofa� transakcj�

BEGIN TRANSACTION;
UPDATE Sales.SalesOrderDetail
SET OrderQty = OrderQty + 12;
IF (SELECT COUNT(ProductID) FROM Sales.SalesOrderDetail
	WHERE OrderQty = 0)>0 ROLLBACK;
ELSE COMMIT;

--Zadanie 7
--Napisz zapytanie SQL, kt�re zaczyna transakcj� i modyfikuje (jako StandardCost wpisuje
--warto�� �redni� - szczeg�y dalej) wszystkie produkty, kt�rych StandardCost jest wy�szy ni�
--�redni koszt wszystkich produkt�w w tabeli Production.Product. Je�eli liczba produkt�w do
--zmodyfikowania przekracza 200, zapytanie powinno wycofa� transakcj�.

BEGIN TRANSACTION;
UPDATE Production.Product
SET StandardCost = (SELECT AVG(StandardCost) FROM Production.Product);
IF (SELECT COUNT(StandardCost) FROM Production.Product 
WHERE StandardCost>(SELECT AVG(StandardCost) FROM Production.Product))>200 ROLLBACK;
ELSE COMMIT;
