--------1---------

CREATE OR ALTER FUNCTION nFib(@n INT)
RETURNS INT AS 
BEGIN 
	IF @n<=0  RETURN 0;
	IF @n=1 RETURN 1;
	RETURN dbo.nFib(@n-1) + dbo.nFib(@n-2);
END;

CREATE OR ALTER PROCEDURE print_fib @n INT AS 
DECLARE @ctr INT = 1;
DECLARE	@fib_n INT;
BEGIN
	WHILE (@ctr <= @n)
	BEGIN;
		SET @fib_n = dbo.nFib(@ctr);
		PRINT 'Fibonacci no. ' + CONVERT(VARCHAR, @ctr) + ': ' + CONVERT(VARCHAR, @fib_n);
		SET @ctr = @ctr + 1;
	END;
END;

EXEC dbo.print_fib 10;

--------2---------
--Napisz trigger DML, który po wprowadzeniu danych do tabeli Persons zmodyfikuje nazwisko
--tak, aby by³o napisane du¿ymi literami.

CREATE OR ALTER TRIGGER uppercaseBefInsert
ON Person.Person
AFTER INSERT 
AS
UPDATE Person.Person SET LastName = UPPER(LastName)
WHERE LastName = (SELECT LastName FROM INSERTED);

--------3---------
--Przygotuj trigger ‘taxRateMonitoring’, który wyœwietli komunikat o b³êdzie, je¿eli nast¹pi
--zmiana wartoœci w polu ‘TaxRate’ o wiêcej ni¿ 30%.
CREATE OR ALTER TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate
FOR UPDATE
AS
	IF ABS(((SELECT TaxRate FROM UPDATED)-TaxRate)/TaxRate)*100 > 30
		RAISERROR (15600, -1, -1, 'Value change > 30%');
