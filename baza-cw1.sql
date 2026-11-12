
/*zad1
CREATE TABLE pracownik (
	id_pracownika INT PRIMARY KEY AUTO_INCREMENT, 
	imie VARCHAR(40) NOT NULL,
    nazwisko VARCHAR(60) NOT NULL,
    data_urodzenia DATE NOT NULL
);

INSERT INTO pracownik (imie, nazwisko, data_urodzenia) VALUES 
	("Jan", "Kowalski", "1995-10-03"),
	("Marek", "Nowak", "2000-02-03"),
	("Janusz", "Słoneczny", "1993-05-20");

UPDATE pracownik SET data_urodzenia = "1995-10-04" WHERE id_pracownika = 1;

SELECT * FROM pracownik;
*/



/*zad2
CREATE TABLE zadanie (
	id_zadania INT PRIMARY KEY AUTO_INCREMENT, 
	nazwa_zadania VARCHAR(150) NOT NULL,
    priorytet ENUM('normalny', 'wysoki', 'niski'),
    opis TEXT NULL,
    pracownik INT, 
    CONSTRAINT fk_zadania_pracownicy
    FOREIGN KEY(pracownik)
		REFERENCES pracownik(id_pracownika)
        ON DELETE SET NULL
);


ALTER TABLE zadanie ALTER COLUMN priorytet SET DEFAULT 'normalny';

INSERT INTO zadanie (nazwa_zadania, priorytet, opis, pracownik) 
	VALUES ('inwertaryzacja', 'normalny', 'zadanie do wykonania do 20.11.2026', '1');
    
INSERT INTO zadanie (nazwa_zadania, priorytet, opis, pracownik) 
	VALUES ('sprzatanie', 'niski', 'sprzatanie pietra 1, do 17.11.2026', '2');

INSERT INTO zadanie (nazwa_zadania, priorytet, opis, pracownik) 
	VALUES ('dokumentacja', 'wysoki', 'wykonac dokumentacje projektu do konca 12.11.2026', '3');

SELECT * FROM zadanie;

*/

/*zad2
CREATE TABLE projekt (
	id_projektu INT PRIMARY KEY AUTO_INCREMENT,
    nazwa_projektu VARCHAR(150),
    data_rozpoczecia DATE,
    data_zakonczenia DATE
);


ALTER TABLE projekt ADD COLUMN menadzer_projektu INT;

ALTER TABLE projekt 
ADD FOREIGN KEY (menadzer_projektu)
	REFERENCES pracownik(id_pracownika);

INSERT INTO projekt (nazwa_projektu, data_rozpoczecia, data_zakonczenia, menadzer_projektu)
	VALUES ('strona','2026-10-1','2026-10-20','1'), ('analiza_danych','2026-10-10','2026-10-15','2');

ALTER TABLE projekt ADD COLUMN projekt INT;

ALTER TABLE zadanie ADD COLUMN projekt INT;

ALTER TABLE projekt
ADD FOREIGN KEY (projekt)
	REFERENCES projekt(id_projektu)
    ON DELETE CASCADE;

UPDATE zadanie SET projekt = '2' WHERE id_zadania = 1;
UPDATE zadanie SET projekt = '2' WHERE id_zadania = 2;
UPDATE zadanie SET projekt = '1' WHERE id_zadania = 3;

SELECT * FROM zadanie;
*/

CREATE TABLE sprint (
	id_sprintu INT PRIMARY KEY AUTO_INCREMENT,
    numer_sprintu INT UNSIGNED,
    data_rozpoczecia DATE,
    data_zakonczenia DATE
);

ALTER TABLE zadanie ADD COLUMN sprint INT;
ALTER TABLE sprint ADD COLUMN sprint INT;

ALTER TABLE zadanie
ADD FOREIGN KEY (sprint)
	REFERENCES sprint(id_sprintu)
    ON DELETE SET NULL;

INSERT INTO sprint(numer_sprintu, data_rozpoczecia, data_zakonczenia) VALUES ('1','2026-10-5','2026-10-6');

UPDATE zadanie SET sprint = 1 WHERE id_zadania = 1;
UPDATE zadanie SET sprint = 1 WHERE id_zadania = 2;


SELECT * FROM zadanie;

CREATE TABLE status (
	id_statusu INT AUTO_INCREMENT PRIMARY KEY,
    nazwa_statusu VARCHAR(20)
    );

INSERT INTO status (nazwa_statusu) VALUES ('W trakcie'), ('Oczekujace'), ('Zakonczone');

CREATE TABLE zadanie_has_status (
	id_zdarzenia INT AUTO_INCREMENT PRIMARY KEY,
    id_zadania INT,
    id_statusu INT,
    data_zdarzenia DATETIME DEFAULT CURRENT_TIMESTAMP,
		FOREIGN KEY (id_zadania)
			REFERENCES zadanie(id_zadania),
		FOREIGN KEY (id_statusu)
			REFERENCES status(id_statusu)
    );

INSERT INTO zadanie_has_status (id_zadania,id_statusu) VALUES (1,1),(2,2),(3,3);

DELETE projekt FROM zadanie_has_status WHERE id_zadania IN (1,2);

DROP TABLE sprint;






