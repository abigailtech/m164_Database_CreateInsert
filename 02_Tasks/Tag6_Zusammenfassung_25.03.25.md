# Inhalt
1. [Einsatz von Subqueries](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Tag6_Zusammenfassung_25.03.25.md#1-einsatz-von-subqueries)
2. [Unterschied zwischen skalaren und nicht-skalaren Subqueries](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Tag6_Zusammenfassung_25.03.25.md#2-unterschied-zwischen-skalaren-und-nicht-skalaren-subqueries)
3. [Subselects](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Tag6_Zusammenfassung_25.03.25.md#3-gefahren-bei-der-verwendung-von-subselects)
4. [IGNORE und Load Data Files](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Tag6_Zusammenfassung_25.03.25.md#4-bedeutung-von-ignore-1-lines-in-load-data-infile)
5. [CSV](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Tag6_Zusammenfassung_25.03.25.md#5-problem-bei-windows-csv-mit-lines-terminated-by-n)
6. [Einstellungen CSV](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Tag6_Zusammenfassung_25.03.25.md#6-erforderliche-einstellungen-f%C3%BCr-csv-import-durch-den-klienten)
7. [Import von Spalte](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Tag6_Zusammenfassung_25.03.25.md#7-import-von-spalten-in-einer-anderen-reihenfolge)


## 1. **Einsatz von Subqueries**   
Subqueries werden verwendet, um komplexe Abfragen zu vereinfachen, indem sie eine Abfrage innerhalb einer anderen ausführen. Dadurch können Zwischenergebnisse genutzt und redundante Berechnungen vermieden werden.  

**Beispiel:** 
Die folgende Abfrage findet den Mitarbeiter mit dem höchsten Gehalt:  
```sql
SELECT name, gehalt 
FROM mitarbeiter 
WHERE gehalt = (SELECT MAX(gehalt) FROM mitarbeiter);
```

Die Subquery (SELECT MAX(gehalt) FROM mitarbeiter) berechnet den höchsten Gehalt, und die äussere Abfrage sucht den Mitarbeiter mit diesem Gehalt.


## 2. **Unterschied zwischen skalaren und nicht-skalaren Subqueries**  

- **Skalare Subquery:** Gibt genau einen Wert zurück.  
  ```sql
  SELECT name, (SELECT MAX(gehalt) FROM mitarbeiter) AS hoechstgehalt  
  FROM mitarbeiter  
  LIMIT 1;
  ```
  **Erklärung:** Die Subquery liefert einen einzelnen Wert (den höchsten Gehalt), der in der Hauptabfrage verwendet wird.

- **Nicht-skalare Subquery:** Gibt mehrere Werte oder eine ganze Tabelle zurück.  
  ```sql
  SELECT name FROM mitarbeiter  
  WHERE abteilung_id IN (SELECT id FROM abteilungen WHERE name = 'IT');
  ```
  **Erklärung:** Die Subquery gibt eine Liste von abteilung_ids zurück, die dann in der Hauptabfrage genutzt wird.


## 3. **Gefahren bei der Verwendung von Subselects**  
 
- Subselects können ineffizient sein, da sie möglicherweise für jede Zeile der Hauptabfrage erneut ausgeführt werden.  
- Sie können zu schlechter Performance führen, insbesondere bei großen Datenmengen.  

**Beispiel:**  
Die folgende Abfrage vergleicht jedes Gehalt mit dem Durchschnittsgehalt aller Mitarbeiter:  
```sql
SELECT name FROM mitarbeiter  
WHERE gehalt > (SELECT AVG(gehalt) FROM mitarbeiter);
```
**Problem:**  
Wenn die Tabelle viele Zeilen hat, wird die Subquery für jede Zeile erneut ausgeführt, was die Performance verschlechtert.  
Ein effizienterer Ansatz wäre ein JOIN oder das vorherige Speichern des Durchschnitts in einer Variablen.


## 4. **Bedeutung von IGNORE 1 LINES in LOAD DATA INFILE**  

Der Zusatz IGNORE 1 LINES überspringt die erste Zeile der Datei. Das ist nützlich, wenn eine CSV-Datei eine Kopfzeile mit Spaltennamen enthält.  

**Beispiel:**  
Eine CSV-Datei enthält:  
```
id,name,gehalt  
1,Max,4000  
2,Lisa,5000  
```
Zum Import kann man folgende Abfrage nutzen:  
```sql
LOAD DATA INFILE 'daten.csv' INTO TABLE mitarbeiter  
FIELDS TERMINATED BY ','  
LINES TERMINATED BY '\n'  
IGNORE 1 LINES;
```
Die erste Zeile (id,name,gehalt) wird ignoriert, und nur die eigentlichen Daten werden importiert.



## 5. **Problem bei Windows-CSV mit LINES TERMINATED BY /n**  

Windows verwendet \r\n als Zeilenumbruch. Wenn LINES TERMINATED BY '\n' verwendet wird, bleibt das \r (Carriage Return) in der letzten Spalte erhalten.  

**Beispiel:**  
Eine CSV-Datei mit Windows-Zeilenumbrüchen:  
```
1,Max,4000\r\n  
2,Lisa,5000\r\n  
```
Falsche Einstellung:  
```sql
LOAD DATA INFILE 'daten.csv' INTO TABLE mitarbeiter  
FIELDS TERMINATED BY ','  
LINES TERMINATED BY '\n';
``` 
Die letzte Spalte enthält ein zusätzliches \r, also:  
```
1 | Max  | 4000\r  
2 | Lisa | 5000\r  
```
**Lösung:**  
```sql
LINES TERMINATED BY '\r\n';
```
Dadurch wird das Problem vermieden.


## 6. **Erforderliche Einstellungen für CSV-Import durch den Klienten**  

Damit ein Klient eine CSV-Datei an den Server senden kann, müssen folgende Einstellungen vorgenommen werden:  
- **Server-Konfiguration (my.cnf oder my.ini):**  
  ```
  [mysqld]
  local-infile=1
  ```
- **Beim Starten des MySQL-Klienten:**  
  ```
  mysql --local-infile=1 -u benutzer -p
  ```
- **Berechtigung für den Nutzer:**  
  ```sql
  GRANT FILE ON *.* TO 'benutzer'@'localhost';
  ```


## 7. **Import von Spalten in einer anderen Reihenfolge**  

Falls die Spalten in der CSV-Datei in einer anderen Reihenfolge als in der Tabelle gespeichert sind, kann die Reihenfolge beim Import explizit angegeben werden.  

**Beispiel:**  
CSV-Datei:  
```
gehalt,name,id  
4000,Max,1  
5000,Lisa,2  
```
Die Tabelle hat jedoch die Reihenfolge id, name, gehalt.  
Der Import kann angepasst werden:  
```sql
LOAD DATA INFILE 'daten.csv' INTO TABLE mitarbeiter  
FIELDS TERMINATED BY ','  
LINES TERMINATED BY '\n'  
(gehalt, name, id);
```
Die CSV-Daten werden korrekt den Tabellen-Spalten zugeordnet.
