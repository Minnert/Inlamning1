-- Skapar databasen Bokhandel
DROP DATABASE IF EXISTS Bokhandel;
CREATE DATABASE Bokhandel;
USE Bokhandel;

-- Skapar kundtabell
CREATE TABLE kund (
    KundID INT AUTO_INCREMENT PRIMARY KEY,
    Namn VARCHAR(100) NOT NULL,
    Epost VARCHAR(100) NOT NULL,
    Telefon VARCHAR(30) NOT NULL,
    Adress VARCHAR(200) NOT NULL
);

-- Skapar boktabell
CREATE TABLE bok (
    BokID INT AUTO_INCREMENT PRIMARY KEY, -- Autogenerera ID PK
    Titel VARCHAR(200) NOT NULL,
    ISBN VARCHAR(20) NOT NULL UNIQUE, -- Sätter VARCHAR istället för INT/BIGINT Pga att det är ett ID som kan innefatta bindestreck sen kräver jag att det ska vara unikt.
    Forfattare VARCHAR(100) NOT NULL,
    Pris DECIMAL(10,2) NOT NULL,
    Lagerstatus INT NOT NULL
);

-- Skapar beställningstabell
CREATE TABLE bestallning (
    BestallningsID INT AUTO_INCREMENT PRIMARY KEY,
    KundID INT NOT NULL,
    Datum TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Totalbelopp DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (KundID) REFERENCES kund(KundID)
);

-- Skapar orderradtabell
CREATE TABLE orderrad (
    RadNr INT AUTO_INCREMENT PRIMARY KEY, -- Autogenerera radNr PK
    BestallningsID INT NOT NULL,
    BokID INT NOT NULL,
    Antal INT NOT NULL,
    RadPris DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (BestallningsID) REFERENCES bestallning(BestallningsID),
    FOREIGN KEY (BokID) REFERENCES bok(BokID)
);

-- Exempeldata: kund
INSERT INTO kund (Namn, Epost, Telefon, Adress) VALUES
('Frodo Bagger',    'frodo@shire.me',     '070-111 11 11', 'Baggershus, Fylke'),
('Sam Gamgi',       'sam@shire.me',       '070-222 22 22', 'Gamgis gård, Fylke'),
('Gandalf Grå',     'gandalf@valinor.ma', '070-333 33 33', 'Vandraren utan adress'),
('Aragorn Elessar', 'aragorn@gondor.nu',  '070-444 44 44', 'Minas Tirith, Gondor'),
('Legolas Grönblad','legolas@skogarna.se','070-555 55 55', 'Dimmiga bergen, Midgård');

-- Exempeldata: bok
INSERT INTO bok (Titel, ISBN, Forfattare, Pris, Lagerstatus) VALUES
('Sagan om ringen: Ringens brödraskap',  '9789100123451', 'J.R.R. Tolkien', 129.00, 20),
('Sagan om ringen: De två tornen',       '9789100123452', 'J.R.R. Tolkien', 129.00, 18),
('Sagan om ringen: Konungens återkomst', '9789100123453', 'J.R.R. Tolkien', 129.00, 15),
('Bilbo – En hobbits äventyr',           '9789100123450', 'J.R.R. Tolkien', 119.00, 25);

-- Exempeldata: beställning
INSERT INTO bestallning (KundID, Totalbelopp) VALUES
(1, 258.00),  -- 1x bok 1 + 1x bok 2
(2, 367.00),  -- 2x Bilbo + 1x bok 3
(1, 506.00);  -- trilogin + Bilbo

-- Exempeldata: orderrad
INSERT INTO orderrad (BestallningsID, BokID, Antal, RadPris) VALUES
(1, 1, 1, 129.00),
(1, 2, 1, 129.00),
(2, 4, 2, 119.00),
(2, 3, 1, 129.00),
(3, 1, 1, 129.00),
(3, 2, 1, 129.00),
(3, 3, 1, 129.00),
(3, 4, 1, 119.00);

-- Se tabeller
SELECT * FROM kund;
SELECT * FROM bok;
SELECT * FROM bestallning;
SELECT * FROM orderrad;
-- Lite enkla SELECT-exempel
-- Visa alla böcker sorterade efter pris (dyrast först)
SELECT Titel, Pris
FROM bok
ORDER BY Pris DESC;

-- Visa alla böcker som har lågt lagersaldo ( under 20 st)
SELECT Titel, Lagerstatus
FROM bok
WHERE Lagerstatus < 20;

-- Visa alla beställningar där totalbeloppet är över 300 kr
SELECT BestallningsID, KundID, Datum, Totalbelopp
FROM bestallning
WHERE Totalbelopp > 300;

-- Visa alla orderrader för en viss beställning 
SELECT RadNr, BestallningsID, BokID, Antal, RadPris
FROM orderrad
WHERE BestallningsID = 1;

