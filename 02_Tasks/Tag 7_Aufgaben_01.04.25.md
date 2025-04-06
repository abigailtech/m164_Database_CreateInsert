# Aufgabe

## **1. Erste Normalform (1NF)**
Excel-Tabelle in atomare Felder umwandeln (jede Zelle nur ein Wert).

- Ich habe zusammengesetzte Werte (z. B. mehrere Freifächer in einer Zelle) in einzelne Zeilen zerlegt.
- Exportierte die bereinigte Tabelle als .csv 
- Redundanzen sind erlaubt (in 1NF noch nicht eliminiert).


## **2. Logisches ERD**
Modell in 2NF (min. 5 Tabellen), Kardinalitäten und Beziehungen klar definiert.

**Tabellenvorschlag:**
1. `Schueler` (ID, Name, Geburtsdatum, KlassenID)
2. `Klasse` (ID, Klassenname)
3. `Freifach` (ID, Bezeichnung, LehrpersonID)
4. `Lehrperson` (ID, Name)
5. `Belegung` (SchuelerID, FreifachID) → m:n-Beziehung

**Kardinalitäten:**
- Klasse ⟶ Schueler = 1:n
- Lehrperson ⟶ Freifach = 1:n
- Schueler ⟷ Freifach = m:n über Belegung


## **3. Physisches ERD mit Constraints**
Attribut-Typen, PK/FK-Constraints, NN/UQ setzen

**Beispiel:**
```sql
CREATE TABLE Schueler (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Geburtsdatum DATE NOT NULL,
  KlassenID INT NOT NULL,
  FOREIGN KEY (KlassenID) REFERENCES Klasse(ID)
);

CREATE TABLE Belegung (
  SchuelerID INT,
  FreifachID INT,
  PRIMARY KEY (SchuelerID, FreifachID),
  FOREIGN KEY (SchuelerID) REFERENCES Schueler(ID),
  FOREIGN KEY (FreifachID) REFERENCES Freifach(ID)
);
```

→ Exportierte DDL über Workbench (Forward Engineering).



## **4. CSV-Daten importieren mit LOAD DATA**
```sql
LOAD DATA LOCAL INFILE 'C:/M164/schueler.csv'
INTO TABLE Schueler
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```


## **5. Daten bereinigen**
- NULLs oder leere Strings durch UPDATE ... SET feld = ... WHERE feld IS NULL bereinigen
- Doppelte prüfen mit GROUP BY ... HAVING COUNT(*) > 1
- Inkonsistenzen mit JOIN-Prüfungen feststellen


## **6. Test der Daten**
- SELECT-Abfragen auf CSV-Daten und importierte Tabellen vergleichen

```sql
SELECT * FROM Schueler WHERE Name = 'Max Muster';
-- Ergebnis muss identisch zur Zeile aus CSV sein
```


## **7. +290 Test-Datensätze generieren**
- In Excel mit RANDBETWEEN, TEXTJOIN, etc. → CSV erstellen
- Inhalte gut mischen
- Wiederholung von Punkt 4–6


## **8. SELECT-Abfragen**

### a) Anzahl Teilnehmer bei Inge Sommer:
```sql
SELECT COUNT(*) AS Teilnehmer
FROM Belegung
JOIN Freifach ON Belegung.FreifachID = Freifach.ID
JOIN Lehrperson ON Freifach.LehrpersonID = Lehrperson.ID
WHERE Lehrperson.Name = 'Inge Sommer';
```

### b) Klassen mit Schüleranzahl in Freifächern:
```sql
SELECT Klasse.Klassenname, COUNT(DISTINCT Schueler.ID) AS Anzahl_Schueler
FROM Klasse
JOIN Schueler ON Klasse.ID = Schueler.KlassenID
JOIN Belegung ON Schueler.ID = Belegung.SchuelerID
GROUP BY Klasse.Klassenname
ORDER BY Klasse.Klassenname;
```

### c) Schüler im Chor oder Elektronik:
```sql
SELECT DISTINCT Schueler.Name
FROM Schueler
JOIN Belegung ON Schueler.ID = Belegung.SchuelerID
JOIN Freifach ON Belegung.FreifachID = Freifach.ID
WHERE Freifach.Bezeichnung IN ('Chor', 'Elektronik');
```


## **9. SELECT INTO OUTFILE (Ausgabe speichern)**
```sql
SELECT * 
INTO OUTFILE 'C:/M164/outfile.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM Schueler;
```


## **10. Backup der Datenbank Freifächer**
```bash
mysqldump -u root -p freifaecher > C:/M164/freifaecher_backup.sql
```
