/*ALTER TABLE ksiegowosc.pracownicy
ALTER COLUMN telefon TYPE VARCHAR(17);

UPDATE ksiegowosc.pracownicy 
SET telefon = CONCAT('(+48)',telefon);*/

/*
UPDATE ksiegowosc.pracownicy 
SET telefon = CONCAT(erste, '-', zweite, '-', dritte)
FROM (
	SELECT LEFT(telefon, 8) as erste, 
	SUBSTRING(telefon, 9, 3) as zweite,
	RIGHT(telefon, 3) as dritte 
	FROM ksiegowosc.pracownicy) ;*/

/*SELECT id_pracownika,
UPPER(IMIE),
UPPER(NAZWISKO),
UPPER(ADRES),
telefon
FROM ksiegowosc.pracownicy
WHERE LENGTH(nazwisko) = 
( SELECT MAX(LENGTH(nazwisko))
FROM ksiegowosc.pracownicy);

SELECT md5(imie), md5(nazwisko), md5(adres), md5('kpe.kwota')
FROM ksiegowosc.pracownicy kpr
LEFT JOIN ksiegowosc.wynagrodzenie kwy ON kpr.id_pracownika=kwy.id_pracownika
LEFT JOIN ksiegowosc.pensje kpe ON kpe.id_pensji=kwy.id_pensji;

SELECT imie, nazwisko, kpe.kwota AS pensja, 
kpr.rodzaj AS rodzaj_premii, kpr.kwota AS premia
FROM ksiegowosc.pracownicy kprac
LEFT JOIN ksiegowosc.wynagrodzenie kwy
ON kwy.id_pracownika = kprac.id_pracownika
LEFT JOIN ksiegowosc.pensje kpe
ON kpe.id_pensji=kwy.id_pensji
LEFT JOIN ksiegowosc.premie kpr
ON kpr.id_premii = kwy.id_premii; */

SELECT CONCAT('Pracownik ', imie, ' ', nazwisko, ', w dniu ', kw.data,
			 ' otrzymał pensję całkowitą na kwotę ', kpe.kwota+kpr.kwota, 
			  ', gdzie wynagrodzenie zasadnicze wynosiło: ', kpe.kwota,
			 'zł, premia: ', kpr.kwota, 'zł, nadgodziny: ', kg.liczba_godzin-10)
FROM ksiegowosc.pracownicy pr
LEFT JOIN ksiegowosc.wynagrodzenie kw ON pr.id_pracownika=kw.id_pracownika
LEFT JOIN ksiegowosc.pensje kpe ON kw.id_pensji=kpe.id_pensji
LEFT JOIN ksiegowosc.premie kpr ON kpr.id_premii=kw.id_premii
LEFT JOIN ksiegowosc.godziny kg ON kg.id_godziny = kw.id_godziny
WHERE kpr.id_premii IS NOT NULL
AND RIGHT(pr.imie,1) != 'a';








