
#zad1
ALTER TABLE projekt DROP FOREIGN KEY projekt_ibfk_1;
ALTER TABLE zadanie DROP FOREIGN KEY fk_zadania_pracownicy;


ALTER TABLE pracownik MODIFY COLUMN id_pracownika INT NOT NULL;
ALTER TABLE pracownik DROP PRIMARY KEY;

ALTER TABLE pracownik ADD PRIMARY KEY (id_pracownika);
ALTER TABLE pracownik MODIFY COLUMN id_pracownika INT NOT NULL AUTO_INCREMENT;

ALTER TABLE zadanie ADD FOREIGN KEY (pracownik) REFERENCES
pracownik(id_pracownika) ON DELETE SET NULL;

ALTER TABLE projekt ADD FOREIGN KEY (menadzer_projektu)
REFERENCES pracownik(id_pracownika);

#zad2
ALTER TABLE zadanie ADD COLUMN godziny_szacowane INT DEFAULT 8;

UPDATE zadanie SET godziny_szacowane = 4 WHERE id_zadania = 1;
UPDATE zadanie SET godziny_szacowane = 12 WHERE id_zadania = 2;
UPDATE zadanie SET godziny_szacowane = 16 WHERE id_zadania = 3;

ALTER TABLE zadanie ALTER COLUMN godziny_szacowane SET DEFAULT 6;

INSERT INTO zadanie (nazwa_zadania) VALUES ("pisanie");

SELECT * FROM zadanie WHERE nazwa_zadania = "pisanie";
DELETE FROM zadanie WHERE id_zadania = 4;

#zad3
ALTER TABLE projekt ADD COLUMN opis_kratki VARCHAR(50) NULL;

ALTER TABLE projekt MODIFY COLUMN opis_kratki VARCHAR(200);

UPDATE projekt SET opis_kratki = 'MVP' WHERE id_projektu = 1;
UPDATE projekt SET opis_kratki = 'Pilne wdrozenie' WHERE id_projektu = 2;

ALTER TABLE projekt DROP COLUMN opis_kratki;

#zad4
SHOW CREATE TABLE zadanie;

ALTER TABLE zadanie DROP FOREIGN KEY zadanie_ibfk_1;

ALTER TABLE zadanie ADD FOREIGN KEY (projekt)
	REFERENCES projekt(id_projektu) ON DELETE SET NULL;
    
    
SELECT * FROM projekt;
DELETE FROM projekt WHERE id_projektu = 1;

SELECT * FROM zadanie;


