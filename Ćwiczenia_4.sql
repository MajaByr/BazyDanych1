/*
CREATE SCHEMA ksiegowosc; 

CREATE TABLE ksiegowosc.pracownicy  (
id_pracownika SERIAL PRIMARY KEY,
imie VARCHAR (20) NOT NULL,
nazwisko VARCHAR (20) NOT NULL,
adres VARCHAR (40),
telefon INT );

CREATE TABLE ksiegowosc.godziny (
id_godziny SERIAL PRIMARY KEY,
data DATE,
liczba_godzin INT NOT NULL,
id_pracownika INT NOT NULL);

CREATE TABLE ksiegowosc.pensje (
id_pensji SERIAL PRIMARY KEY,
stanowisko VARCHAR (30), 
kwota INT);

CREATE TABLE ksiegowosc.premie (
id_premii SERIAL PRIMARY KEY,
rodzaj VARCHAR(30),
kwota INT NOT NULL);

CREATE TABLE ksiegowosc.wynagrodzenie (
id_wynagrodzenia SERIAL PRIMARY KEY,
data DATE,
id_pracownika INT NOT NULL,
id_godziny INT NOT NULL,
id_pensji INT NOT NULL,
id_premii INT ); 

ALTER TABLE ksiegowosc.godziny 
ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensje(id_pensji);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie(id_premii);


COMMENT ON TABLE ksiegowosc.pracownicy IS 'Komentarz';
COMMENT ON TABLE ksiegowosc.godziny IS 'Komentarz';
COMMENT ON TABLE ksiegowosc.pensje IS 'Komentarz';
COMMENT ON TABLE ksiegowosc.premie IS 'Komentarz';
COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Komentarz';

INSERT INTO ksiegowosc.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Jan', 'Kowalski', 'Warszawa', 111222333);
INSERT INTO ksiegowosc.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Mateusz', 'Nowak', 'Grudziądz', 182635676);
INSERT INTO ksiegowosc.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Elżbieta', 'Chmielewska', 'Kraków', 999999949);
INSERT INTO ksiegowosc.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Arleta', 'Mazurek', 'Szczecin', 343782139);
INSERT INTO ksiegowosc.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Bogumiła', 'Urbańska', 'Poznań', 239476239);
INSERT INTO ksiegowosc.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Patryk', 'Szymański', 'Białystok', 167688866);
INSERT INTO ksiegowosc.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Heronim', 'Sawicki', 'Lublin', 778765409);
INSERT INTO ksiegowosc.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Magdalena', 'Głowacka', 'Toruń', 556127522);
INSERT INTO ksiegowosc.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Andrzej', 'Pająk', 'Kołobrzeg', 95552363);
INSERT INTO ksiegowosc.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Ilona', 'Mickiewicz', 'Kołobrzeg', 428424363);
INSERT INTO ksiegowosc.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Dave', 'Anderson', 'AX22', 777245900);

INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-10-28', 14, 11); 
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2022-03-23', 20, 11);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2022-11-11', 14, 11);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-10-29', 10, 11); 
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2022-10-23', 20, 11);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2022-10-11', 14, 11);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-09-12', 18, 11);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-08-24', 12, 11);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-10-28', 4, 3); 
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2022-03-23', 6, 2);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2022-11-11', 14, 10);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-09-12', 4, 9);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-08-24', 12, 8);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-07-01', 9, 5);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-10-15', 8, 7);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-11-01', 1, 1);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-10-27', 5, 4);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2021-10-27', 2, 10);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-10-20', 6, 3); 
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2022-03-25', 4, 2);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2022-11-18', 20, 10);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-09-22', 13, 9);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-08-14', 10, 8);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-07-31', 11, 5);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-10-05', 19, 7);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-11-22', 4, 1);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-10-17', 2, 4);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2021-10-25', 1, 10);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-10-21', 8, 3); 
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2022-03-26', 9, 2);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2022-11-19', 4, 10);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-09-23', 14, 9);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-08-15', 22, 8);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-08-01', 4, 5);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-10-06', 7, 7);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-12-01', 8, 1);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-10-18', 8, 4);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2021-10-22', 8, 10);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-10-01', 12, 11);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-10-18', 8, 11);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2021-10-22', 10, 6);


INSERT INTO ksiegowosc.pensje (STANOWISKO, KWOTA)
VALUES('Księgowy', 16000);
INSERT INTO ksiegowosc.pensje (STANOWISKO, KWOTA)
VALUES('Asystent Handlowy', 8000);
INSERT INTO ksiegowosc.pensje (STANOWISKO, KWOTA)
VALUES('Kierowca', 3900);
INSERT INTO ksiegowosc.pensje (STANOWISKO, KWOTA)
VALUES('Archiwista', 5100);
INSERT INTO ksiegowosc.pensje (STANOWISKO, KWOTA)
VALUES('Sekretarz', 10000);
INSERT INTO ksiegowosc.pensje (STANOWISKO, KWOTA)
VALUES('Technik', 11200);
INSERT INTO ksiegowosc.pensje (STANOWISKO, KWOTA)
VALUES('Junior Developer', 4800);
INSERT INTO ksiegowosc.pensje (STANOWISKO, KWOTA)
VALUES('Mid Developer', 15400);
INSERT INTO ksiegowosc.pensje (STANOWISKO, KWOTA)
VALUES('Senior Developer', 21000);
INSERT INTO ksiegowosc.pensje (STANOWISKO, KWOTA)
VALUES('Backend Developer', 12000); 
INSERT INTO ksiegowosc.pensje (STANOWISKO, KWOTA)
VALUES('Sekretarz', 8000); 
INSERT INTO ksiegowosc.pensje (STANOWISKO, KWOTA)
VALUES('Konserwator', 7000); 

INSERT INTO ksiegowosc.premie (RODZAJ, KWOTA)
VALUES('uznaniowa', 170);
INSERT INTO ksiegowosc.premie (RODZAJ, KWOTA)
VALUES('uznaniowa', 170);
INSERT INTO ksiegowosc.premie (RODZAJ, KWOTA)
VALUES('zespołowa', 110);
INSERT INTO ksiegowosc.premie (RODZAJ, KWOTA)
VALUES('zespołowa', 110);
INSERT INTO ksiegowosc.premie (RODZAJ, KWOTA)
VALUES('zespołowa', 109);
INSERT INTO ksiegowosc.premie (RODZAJ, KWOTA)
VALUES('regulaminowa', 200);
INSERT INTO ksiegowosc.premie (RODZAJ, KWOTA)
VALUES('frekwencyjna', 340);
INSERT INTO ksiegowosc.premie (RODZAJ, KWOTA)
VALUES('zadaniowa', 1000);
INSERT INTO ksiegowosc.premie (RODZAJ, KWOTA)
VALUES('frekwencyjna', 490);
INSERT INTO ksiegowosc.premie (RODZAJ, KWOTA)
VALUES('uznaniowa', 350); 

INSERT INTO ksiegowosc.wynagrodzenie (DATA, ID_PRACOWNIKA, ID_GODZINY, ID_PENSJI, ID_PREMII)
VALUES('2023-08-19', 1, 26, 1, 1); 
INSERT INTO ksiegowosc.wynagrodzenie (DATA, ID_PRACOWNIKA, ID_GODZINY, ID_PENSJI, ID_PREMII)
VALUES('2023-08-29', 4, 27, 10, NULL);
INSERT INTO ksiegowosc.wynagrodzenie (DATA, ID_PRACOWNIKA, ID_GODZINY, ID_PENSJI, ID_PREMII)
VALUES('2023-10-19', 10, 28, 6, 9);
INSERT INTO ksiegowosc.wynagrodzenie (DATA, ID_PRACOWNIKA, ID_GODZINY, ID_PENSJI, ID_PREMII)
VALUES('2023-11-08', 3, 29, 3, 10);
INSERT INTO ksiegowosc.wynagrodzenie (DATA, ID_PRACOWNIKA, ID_GODZINY, ID_PENSJI, ID_PREMII)
VALUES('2023-08-19', 2, 30, 7, 8);
INSERT INTO ksiegowosc.wynagrodzenie (DATA, ID_PRACOWNIKA, ID_GODZINY, ID_PENSJI, ID_PREMII)
VALUES('2023-08-25', 10, 31, 7, NULL);
INSERT INTO ksiegowosc.wynagrodzenie (DATA, ID_PRACOWNIKA, ID_GODZINY, ID_PENSJI, ID_PREMII)
VALUES('2023-08-19', 9, 32, 2, 1);
INSERT INTO ksiegowosc.wynagrodzenie (DATA, ID_PRACOWNIKA, ID_GODZINY, ID_PENSJI, ID_PREMII)
VALUES('2023-08-19', 8, 33, 4, 5);
INSERT INTO ksiegowosc.wynagrodzenie (DATA, ID_PRACOWNIKA, ID_GODZINY, ID_PENSJI, ID_PREMII)
VALUES('2023-08-19', 5, 34, 5, 2);
INSERT INTO ksiegowosc.wynagrodzenie (DATA, ID_PRACOWNIKA, ID_GODZINY, ID_PENSJI, ID_PREMII)
VALUES('2023-08-19', 7, 35, 8, NULL);
INSERT INTO ksiegowosc.wynagrodzenie (DATA, ID_PRACOWNIKA, ID_GODZINY, ID_PENSJI, ID_PREMII)
VALUES('2023-08-19', 1, 36, 9, 1);
INSERT INTO ksiegowosc.wynagrodzenie (DATA, ID_PRACOWNIKA, ID_GODZINY, ID_PENSJI, ID_PREMII)
VALUES('2023-08-19', 4, 37, 9, 1);
INSERT INTO ksiegowosc.wynagrodzenie (DATA, ID_PRACOWNIKA, ID_GODZINY, ID_PENSJI, ID_PREMII)
VALUES('2023-09-19', 10, 38, 11, NULL);
INSERT INTO ksiegowosc.wynagrodzenie (DATA, ID_PRACOWNIKA, ID_GODZINY, ID_PENSJI, ID_PREMII)
VALUES('2023-08-19', 11, 39, 12, NULL);*/

/*
----------------------CZĘŚĆ 6-----------------------
---a---
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy; 

---b---
SELECT id_pracownika FROM ksiegowosc.wynagrodzenie 
WHERE id_pensji in (SELECT id_pensji FROM ksiegowosc.pensje
			WHERE kwota>10000); 	
			
--Alternatywnie:
/*SELECT kw.id_pracownika, kpen.kwota, kprem.kwota
FROM ksiegowosc.wynagrodzenie kw, ksiegowosc.pensje kpen, ksiegowosc.premie kprem
WHERE kw.id_pensji = kpen.id_pensji
AND kw.id_premii = kprem.id_premii
AND kprem.kwota + kpen.kwota > 10000; */
---c---
SELECT ksiegowosc.wynagrodzenie.id_pracownika, ksiegowosc.wynagrodzenie.id_premii, ksiegowosc.wynagrodzenie.id_pensji, ksiegowosc.pensje.kwota
FROM ksiegowosc.wynagrodzenie LEFT JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
WHERE ( ksiegowosc.wynagrodzenie.id_premii IS NULL
AND ksiegowosc.pensje.kwota > 2000 ); --full outer join --łączy wszystkie dopasowanie
--join -- łączy tabele ale tylko dla wierszy, które są wspólne (jak gdzieś jest null to się nie wyświetla)
--group by
--save as sql - ten plik wrzucić do repozytorium
--order
--coalesce - zamiast nulla można wstawić 0

---d---
SELECT * FROM ksiegowosc.pracownicy 
WHERE ksiegowosc.pracownicy.imie LIKE 'J%';

---e---
SELECT * FROM ksiegowosc.pracownicy 
WHERE (ksiegowosc.pracownicy.nazwisko LIKE '%m%a' OR ksiegowosc.pracownicy.nazwisko LIKE 'M%a');

---f--- 
--przyjęty wymiar godzin to 25h miesięcznie 

SELECT * FROM (
SELECT ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko,
EXTRACT(MONTH FROM ksiegowosc.godziny.data) AS miesiąc,
SUM(ksiegowosc.godziny.liczba_godzin)-25 AS ilosc_nadgodzin
FROM ksiegowosc.pracownicy
LEFT JOIN ksiegowosc.godziny
ON ksiegowosc.pracownicy.id_pracownika=ksiegowosc.godziny.id_pracownika
GROUP BY ksiegowosc.pracownicy.id_pracownika, EXTRACT(MONTH FROM ksiegowosc.godziny.data)
ORDER BY nazwisko
	)
WHERE ilosc_nadgodzin>0;


/*Wyświetla ilość godzin z danego miesiąca
SELECT ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko,
EXTRACT(MONTH FROM ksiegowosc.godziny.data) AS month,
SUM(ksiegowosc.godziny.liczba_godzin) AS hours
FROM ksiegowosc.pracownicy
LEFT JOIN ksiegowosc.godziny
ON ksiegowosc.pracownicy.id_pracownika=ksiegowosc.godziny.id_pracownika
GROUP BY ksiegowosc.pracownicy.nazwisko, ksiegowosc.pracownicy.imie, EXTRACT(MONTH FROM ksiegowosc.godziny.data)
ORDER BY nazwisko;*/

---g---
SELECT ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, ksiegowosc.pensje.kwota
FROM ksiegowosc.pracownicy
LEFT JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika=ksiegowosc.wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
WHERE (ksiegowosc.pensje.kwota>12000 AND ksiegowosc.pensje.kwota<20000);

---h---
SELECT * FROM (
SELECT ksiegowosc.pracownicy.id_pracownika as idp, ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko,
EXTRACT(MONTH FROM ksiegowosc.godziny.data) AS miesiąc,
SUM(ksiegowosc.godziny.liczba_godzin)-25 AS ilosc_nadgodzin
FROM ksiegowosc.pracownicy
LEFT JOIN ksiegowosc.godziny
ON ksiegowosc.pracownicy.id_pracownika=ksiegowosc.godziny.id_pracownika
GROUP BY ksiegowosc.pracownicy.id_pracownika, EXTRACT(MONTH FROM ksiegowosc.godziny.data)
ORDER BY nazwisko
	)
LEFT JOIN ksiegowosc.wynagrodzenie
ON idp=ksiegowosc.wynagrodzenie.id_pracownika
WHERE ilosc_nadgodzin>0 AND ksiegowosc.wynagrodzenie.id_premii IS NULL;

---i---
SELECT kprac.*, ksiegowosc.pensje.kwota FROM ksiegowosc.pracownicy kprac
LEFT JOIN ksiegowosc.wynagrodzenie ON kprac.id_pracownika=ksiegowosc.wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
ORDER BY ksiegowosc.pensje.kwota;

---j---
SELECT kprac.*, ksiegowosc.pensje.kwota AS pensja, ksiegowosc.premie.kwota AS premia 
FROM ksiegowosc.pracownicy kprac
LEFT JOIN ksiegowosc.wynagrodzenie ON kprac.id_pracownika=ksiegowosc.wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
LEFT JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premie.id_premii
ORDER BY ksiegowosc.pensje.kwota DESC, ksiegowosc.premie.kwota DESC; 

---k---
SELECT COUNT(kprac.id_pracownika) AS ilosc, ksiegowosc.pensje.stanowisko
FROM ksiegowosc.pracownicy kprac
LEFT JOIN ksiegowosc.wynagrodzenie kwyn
ON kprac.id_pracownika=kwyn.id_pracownika
LEFT JOIN ksiegowosc.pensje
ON kwyn.id_pensji=ksiegowosc.pensje.id_pensji
GROUP BY ksiegowosc.pensje.stanowisko
ORDER BY ilosc DESC;

---l---
SELECT AVG(kpen.kwota) as srednia, 
	   MIN(kpen.kwota) as minimalna, 
	   MAX(kpen.kwota) as maksymalna
FROM ksiegowosc.pensje kpen
WHERE kpen.stanowisko LIKE 'Sekretarz';

---m---
SELECT SUM(ksiegowosc.pensje.kwota) + SUM(ksiegowosc.premie.kwota) 
FROM ksiegowosc.pensje, ksiegowosc.premie;

---n---
SELECT ksiegowosc.pensje.stanowisko, 
	   CASE
	   WHEN SUM(COALESCE(ksiegowosc.wynagrodzenie.id_premii)) IS NULL
	   THEN SUM(ksiegowosc.pensje.kwota)
	   ELSE SUM(ksiegowosc.pensje.kwota)+SUM(ksiegowosc.premie.kwota)
	   END
	   AS suma
FROM ksiegowosc.wynagrodzenie
LEFT JOIN ksiegowosc.pensje 
ON ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
LEFT JOIN ksiegowosc.premie
ON ksiegowosc.premie.id_premii=ksiegowosc.wynagrodzenie.id_premii
GROUP BY ksiegowosc.pensje.stanowisko;

---o---
SELECT ksiegowosc.pensje.stanowisko,
	   COUNT(ksiegowosc.wynagrodzenie.id_premii) as ilosc_premii
FROM ksiegowosc.pensje
LEFT JOIN ksiegowosc.wynagrodzenie
ON ksiegowosc.pensje.id_pensji=ksiegowosc.wynagrodzenie.id_pensji
GROUP BY ksiegowosc.pensje.stanowisko
ORDER BY ilosc_premii DESC;*/

---p---
--Usuń wszystkich pracowników mających pensję mniejszą niż 1200 zł

--Dodanie pacowników z pensją mniejszą niż 1200zł
/*INSERT INTO ksiegowosc.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Krzysztof', 'Kałuziński', 'Szczebrzeszyn', 777245834);
INSERT INTO ksiegowosc.pensje (STANOWISKO, KWOTA)
VALUES('Mechanik', 1199);
INSERT INTO ksiegowosc.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2021-09-10', 10, 12);
INSERT INTO ksiegowosc.wynagrodzenie (DATA, ID_PRACOWNIKA, ID_GODZINY, ID_PENSJI, ID_PREMII)
VALUES('2023-09-19', 12, 42, 13, NULL);

ALTER TABLE ksiegowosc.godziny
drop CONSTRAINT godziny_id_pracownika_fkey;

ALTER TABLE ksiegowosc.godziny
ADD CONSTRAINT id_pracownika 
FOREIGN KEY (id_pracownika) 
REFERENCES ksiegowosc.pracownicy(id_pracownika) 
ON DELETE CASCADE;
  
ALTER TABLE ksiegowosc.wynagrodzenie
drop CONSTRAINT wynagrodzenie_id_pracownika_fkey;

ALTER TABLE ksiegowosc.wynagrodzenie
ADD CONSTRAINT id_pracownika 
FOREIGN KEY (id_pracownika) 
REFERENCES ksiegowosc.pracownicy(id_pracownika) 
ON DELETE CASCADE;
  
DELETE FROM ksiegowosc.pracownicy
WHERE ksiegowosc.pracownicy.id_pracownika
NOT IN (
SELECT ksiegowosc.pracownicy.id_pracownika FROM ksiegowosc.pracownicy
LEFT JOIN ksiegowosc.wynagrodzenie 
ON ksiegowosc.pracownicy.id_pracownika=ksiegowosc.wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensje
ON ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
WHERE ksiegowosc.pensje.kwota>=1200
);*/