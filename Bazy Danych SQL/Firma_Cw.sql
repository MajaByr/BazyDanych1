CREATE SCHEMA rozliczenia; 

CREATE TABLE rozliczenia.pracownicy  (
id_pracownika SERIAL PRIMARY KEY,
imie VARCHAR (20) NOT NULL,
nazwisko VARCHAR (20) NOT NULL,
adres VARCHAR (40),
telefon INT );

CREATE TABLE rozliczenia.godziny (
id_godziny SERIAL PRIMARY KEY,
data DATE,
liczba_godzin INT,
id_pracownika INT NOT NULL);

CREATE TABLE rozliczenia.pensje (
id_pensji SERIAL PRIMARY KEY,
stanowisko VARCHAR (30), 
kwota INT,
id_premii INT);

CREATE TABLE rozliczenia.premie (
id_premii SERIAL PRIMARY KEY,
rodzaj VARCHAR(30),
kwota INT NOT NULL);

ALTER TABLE rozliczenia.godziny 
ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);

ALTER TABLE rozliczenia.pensje 
ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);

INSERT INTO rozliczenia.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Jan', 'Kowalski', 'Warszawa', 111222333);

INSERT INTO rozliczenia.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Mateusz', 'Nowak', 'Grudziądz', 182635676);

INSERT INTO rozliczenia.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Elżbieta', 'Chmielewska', 'Kraków', 999999949);

INSERT INTO rozliczenia.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Arleta', 'Mazurek', 'Szczecin', 343782139);

INSERT INTO rozliczenia.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Bogumiła', 'Urbańska', 'Poznań', 239476239);

INSERT INTO rozliczenia.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Patryk', 'Szymański', 'Białystok', 167688866);

INSERT INTO rozliczenia.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Heronim', 'Sawicki', 'Lublin', 778765409);

INSERT INTO rozliczenia.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Magdalena', 'Głowacka', 'Toruń', 556127522);

INSERT INTO rozliczenia.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Adolf', 'Prus', 'Kielce', 989893363);

INSERT INTO rozliczenia.pracownicy (IMIE, NAZWISKO, ADRES, TELEFON)
VALUES ( 'Ilona', 'Mickiewicz', 'Kołobrzeg', 428424363);


INSERT INTO rozliczenia.premie (RODZAJ, KWOTA)
VALUES('uznaniowa', 170);

INSERT INTO rozliczenia.premie (RODZAJ, KWOTA)
VALUES('uznaniowa', 170);

INSERT INTO rozliczenia.premie (RODZAJ, KWOTA)
VALUES('zespołowa', 110);

INSERT INTO rozliczenia.premie (RODZAJ, KWOTA)
VALUES('zespołowa', 110);

INSERT INTO rozliczenia.premie (RODZAJ, KWOTA)
VALUES('zespołowa', 109);

INSERT INTO rozliczenia.premie (RODZAJ, KWOTA)
VALUES('regulaminowa', 200);

INSERT INTO rozliczenia.premie (RODZAJ, KWOTA)
VALUES('frekwencyjna', 340);

INSERT INTO rozliczenia.premie (RODZAJ, KWOTA)
VALUES('zadaniowa', 1000);

INSERT INTO rozliczenia.premie (RODZAJ, KWOTA)
VALUES('frekwencyjna', 490);

INSERT INTO rozliczenia.premie (RODZAJ, KWOTA)
VALUES('uznaniowa', 350); 


INSERT INTO rozliczenia.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-10-28', 4, 3); 

INSERT INTO rozliczenia.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2022-03-23', 6, 2);

INSERT INTO rozliczenia.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2022-11-11', 14, 10);

INSERT INTO rozliczenia.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-09-12', 4, 9);

INSERT INTO rozliczenia.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-08-24', 12, 8);

INSERT INTO rozliczenia.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-07-01', 9, 5);

INSERT INTO rozliczenia.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-10-15', 8, 7);

INSERT INTO rozliczenia.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-11-01', 1, 1);

INSERT INTO rozliczenia.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-10-27', 5, 4);

INSERT INTO rozliczenia.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-08-19', 7, 2);

INSERT INTO rozliczenia.godziny (DATA, LICZBA_GODZIN, ID_PRACOWNIKA)
VALUES('2023-09-04', 8, 10);

INSERT INTO rozliczenia.pensje (STANOWISKO, KWOTA, ID_PREMII)
VALUES('Księgowy', 16000, 2);

INSERT INTO rozliczenia.pensje (STANOWISKO, KWOTA, ID_PREMII)
VALUES('Asystent Handlowy', 8000, 7);

INSERT INTO rozliczenia.pensje (STANOWISKO, KWOTA, ID_PREMII)
VALUES('Kierowca', 3900, 1);

INSERT INTO rozliczenia.pensje (STANOWISKO, KWOTA, ID_PREMII)
VALUES('Archiwista', 5100, 3);

INSERT INTO rozliczenia.pensje (STANOWISKO, KWOTA, ID_PREMII)
VALUES('Sekretarz', 10000, 4);

INSERT INTO rozliczenia.pensje (STANOWISKO, KWOTA, ID_PREMII)
VALUES('Technik', 11200, 5);

INSERT INTO rozliczenia.pensje (STANOWISKO, KWOTA, ID_PREMII)
VALUES('Junior Developer', 4800, 6);

INSERT INTO rozliczenia.pensje (STANOWISKO, KWOTA, ID_PREMII)
VALUES('Mid Developer', 15400, 10);

INSERT INTO rozliczenia.pensje (STANOWISKO, KWOTA, ID_PREMII)
VALUES('Senior Developer', 21000, 9);

INSERT INTO rozliczenia.pensje (STANOWISKO, KWOTA, ID_PREMII)
VALUES('Backend Developer', 12000, 8); 

SELECT Nazwisko, Adres FROM rozliczenia.pracownicy;


SELECT DATE_PART('dow', data), DATE_PART('month', data) FROM rozliczenia.godziny;

ALTER TABLE rozliczenia.pensje
RENAME COLUMN kwota TO kwota_brutto; 

ALTER TABLE rozliczenia.pensje
ADD COLUMN kwota_netto int NULL; 

/*Dla uproszczenia przyjęte: kwota_brutto/1,23=kwota_netto*/
UPDATE rozliczenia.pensje 
SET kwota_netto = kwota_brutto/1.23;