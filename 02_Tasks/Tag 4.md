# Inhalt 
### Zusammenfassung der Fragen 

1. [NN erstellen](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Tag%204.md#1-wie-wird-beim-fremdschl%C3%BCssel-der-constraint-not-null-erstellt)
2. [Index beim Fremdschlüssel](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Tag%204.md#2-weshalb-wird-f%C3%BCr-jeden-fremdschl%C3%BCssel-ein-index-erstellt)
3. [UNIQUE mit Foreign Engineering erstellen](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Tag%204.md#3-wie-wird-der-constraint-unique-f%C3%BCr-einen-fremdschl%C3%BCssel-im-workbench-mit-forward-engineering-erstellt)
4. [Syntax für die Anweisungen](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Tag%204.md#4-allgemeine-syntax-f%C3%BCr-die-constraint-anweisung-mit-fremdschl%C3%BCsselpr%C3%BCfung)
5. [Referezielle Integrität](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Tag%204.md#5-was-ist-referenzielle-integrit%C3%A4t)
6. [Umsetzung einer 1:1- und einer c:m-Beziehung](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Tag%204.md#6-umsetzung-einer-11--und-einer-cm-beziehung--warum)
7. [Nachteil, wenn Beziehung nur mit Primär- und Fremdschlüssel](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Tag%204.md#7-nachteil-wenn-eine-beziehung-nur-mit-prim%C3%A4r--und-fremdschl%C3%BCssel-ohne-constraints-definiert-wird)

## 1. Wie wird beim Fremdschlüssel der Constraint NOT NULL erstellt?
   * Ein Fremdschlüssel verweist auf einen Primärschlüssel einer anderen Tabelle. Damit die referenzielle Integrität gewahrt bleibt, sollte der Fremdschlüssel in den meisten Fällen nicht NULL sein. Dies wird durch die NOT NULL Constraint bei der Spaltendefinition erreicht:  

   ```sql
   CREATE TABLE Bestellungen (
       BestellID INT PRIMARY KEY,
       KundeID INT NOT NULL,
       FOREIGN KEY (KundeID) REFERENCES Kunden(KundeID)
   );
   ```

## 2. Weshalb wird für jeden Fremdschlüssel ein Index erstellt?
   - Ein Index verbessert die Leistung von Suchanfragen und Joins zwischen Tabellen.  
   - Datenbanksysteme verwenden einen Index auf dem Fremdschlüssel, um das Auffinden der referenzierten Datensätze in der Zieltabelle zu beschleunigen.  
   - Ohne Index könnten Joins und referenzielle Integritätsprüfungen deutlich langsamer sein.  

## 3. Wie wird der Constraint UNIQUE für einen Fremdschlüssel im Workbench mit Forward Engineering erstellt?
   - Eine Fremdschlüssel-Spalte als UNIQUE definieren.  

     ```sql
     CREATE TABLE Bestellungen (
         BestellID INT PRIMARY KEY,
         KundeID INT NOT NULL UNIQUE,
         FOREIGN KEY (KundeID) REFERENCES Kunden(KundeID)
     );
     ```

## 4. Allgemeine Syntax für die CONSTRAINT-Anweisung mit Fremdschlüsselprüfung:

   ```sql
   CREATE TABLE Tabelle1 (
       Spalte1 DATENTYP CONSTRAINT constraint_name PRIMARY KEY,
       Spalte2 DATENTYP CONSTRAINT constraint_name UNIQUE,
       Spalte3 DATENTYP NOT NULL,
       Spalte4 DATENTYP,
       CONSTRAINT fk_name FOREIGN KEY (Spalte4) REFERENCES Tabelle2(SpalteX)
   );
   ```

## 5. Was ist referenzielle Integrität? 

* Stellt sicher, dass Beziehungen zwischen Tabellen in einer relationalen Datenbank konsistent bleiben. Ein Fremdschlüssel darf nur auf existierende Primärschlüssel einer anderen Tabelle verweisen oder NULL sein.  

```sql
CREATE TABLE Kunden (
    KundeID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Bestellungen (
    BestellID INT PRIMARY KEY,
    KundeID INT,
    FOREIGN KEY (KundeID) REFERENCES Kunden(KundeID) ON DELETE CASCADE
);
```


## 6. Umsetzung einer 1:1- und einer c:m-Beziehung & Warum? 

**1:1-Beziehung (Eins-zu-Eins)**  

- Eine Tabelle enthält eine Fremdschlüsselspalte mit UNIQUE Constraint oder als Primärschlüssel.  
- Vermeidung redundanter Daten.  
* Jede Person kann maximal einen Pass haben.  

```sql
CREATE TABLE Person (
    PersonID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Pass (
    PassID INT PRIMARY KEY,
    PersonID INT UNIQUE,
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID) ON DELETE CASCADE
);
```


## 7. Nachteil, wenn eine Beziehung nur mit Primär- und Fremdschlüssel ohne Constraints definiert wird 
- Keine referenzielle Integrität  
- Ungültige Fremdschlüsselwerte möglich  
- Kein Schutz vor versehentlichem Löschen von Primärschlüsseln  
- Keine automatische Aktualisierung von Fremdschlüsseln  
- Gefahr inkonsistenter Daten  
- Fehlende ON DELETE und ON UPDATE Regeln
