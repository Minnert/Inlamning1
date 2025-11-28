
-- Skapar databasen Bokhandel
DROP DATABASE IF EXISTS Bokhandel;
CREATE DATABASE Bokhandel;
USE Bokhandel;

-- Skapar kundtabell
CREATE TABLE kund (
    KundID INT AUTO_INCREMENT PRIMARY KEY,
    Namn VARCHAR(100) NOT NULL,
    Epost VARCHAR(100) NOT NULL,
    Telefon VARCHAR(30),
    Adress VARCHAR(200)
);

-- Skapar boktabell
CREATE TABLE bok (
    BokID INT AUTO_INCREMENT PRIMARY KEY,
    Titel VARCHAR(200) NOT NULL,
    ISBN VARCHAR(20) NOT NULL,
    Forfattare VARCHAR(100) NOT NULL,
    Pris DECIMAL(10 , 2 ) NOT NULL,
    Lagerstatus INT NOT NULL
);

-- Skapar beställningstabell
CREATE TABLE bestallning (
    BestallningsID INT AUTO_INCREMENT PRIMARY KEY,
    KundID INT NOT NULL,
    Datum DATE NOT NULL,
    Totalbelopp DECIMAL(10 , 2 ) NOT NULL,
    CONSTRAINT fk_best_kund FOREIGN KEY (KundID)
        REFERENCES kund (KundID)
);

-- Skapar orderradtabell
CREATE TABLE orderrad (
    RadNr INT AUTO_INCREMENT PRIMARY KEY,
    BestallningsID INT NOT NULL,
    BokID INT NOT NULL,
    Antal INT NOT NULL,
    RadPris DECIMAL(10 , 2 ) NOT NULL,
    CONSTRAINT fk_ord_best FOREIGN KEY (BestallningsID)
        REFERENCES bestallning (BestallningsID),
    CONSTRAINT fk_ord_bok FOREIGN KEY (BokID)
        REFERENCES bok (BokID)
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
INSERT INTO bestallning (KundID, Datum, Totalbelopp) VALUES
(1, '2025-11-25', 258.00),  -- 1x bok 1 + 1x bok 2
(2, '2025-11-26', 367.00),  -- 2x Bilbo + 1x bok 3
(1, '2025-11-27', 506.00);  -- trilogin + Bilbo

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

