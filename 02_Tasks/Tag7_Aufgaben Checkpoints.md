# Inhalt

1. [Ablauf](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Tag7_Aufgaben%20Checkpoints.md#1-daten-in-eine-normalisierte-db-bringen)
2. [logischen und physischem Backup](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Tag7_Aufgaben%20Checkpoints.md#2-unterschied-logisches-vs-physisches-backup)
3. [Restore Prozess](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Tag7_Aufgaben%20Checkpoints.md#3-restore-prozess-full--inkrementell--differenziell)
4. [Backup einer Datenbasis](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Tag7_Aufgaben%20Checkpoints.md#4-drei-m%C3%B6glichkeiten-f%C3%BCr-backups--befehle)
5. [DB in die 3. NF](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Tag7_Aufgaben%20Checkpoints.md#5-schritte-zur-3-normalform-3nf)
6. [Befehl](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Tag7_Aufgaben%20Checkpoints.md#6-was-macht-select-into-outfile)


### **1. Daten in eine normalisierte DB bringen**
1. Rohdaten analysieren: (z. B. Excel, CSV)
3. Erste Normalform (1NF): Atomare Felder, keine Wiederholungsgruppen
5. Zweite Normalform (2NF): Teilabhängigkeiten entfernen, neue Tabellen für abhängige Daten
6. Dritte Normalform (3NF): Transitive Abhängigkeiten entfernen
7. Erstellung logisches Datenmodell (ERD)
8. Übersetzung in SQL-Datenmodell (DDL) → Tabellen mit PK, FK, Constraints erstellen
9. Import der Daten via LOAD DATA oder INSERT
10. Datenbereinigung & Beziehungskontrolle


### **2. Unterschied: logisches vs. physisches Backup**

| Backup-Typ | Beschreibung | Beispiel |
|------------|--------------|----------|
| **Logisch** | Export als SQL-Dump mit DDL & DML | mysqldump, phpMyAdmin Export |
| **Physisch** | Kopie der echten Datenbank-Dateien | mariabackup, Datei-Backup |

- **Logisch** = textbasiert (lesbar, portabel)
- **Physisch** = direktes Kopieren von DB-Dateien, schneller bei großen Datenmengen


### **3. Restore-Prozess: FULL / INKREMENTELL / DIFFERENZIELL**

| Backup-Typ | Restore-Vorgehen |
|------------|------------------|
| **FULL** | Direkt einspielen – enthält alles. <br> z. B. mysql < backup.sql |
| **INKREMENTELL** | Erst **Full-Backup** wiederherstellen, danach jede **nachfolgende Änderung** (in Reihenfolge). |
| **DIFFERENZIELL** | Erst Full-Backup, dann **letztes Differenz-Backup** einspielen (enthält alle Änderungen seit Full). |

→ Bei physischem Backup oft mit mariabackup 


### **4. Drei Möglichkeiten für Backups + Befehle**

1. **Logisches Backup mit mysqldump**
   ```bash
   mysqldump -u root -p datenbankname > backup.sql
   ```

2. **Physisches Backup mit mariabackup**
   ```bash
   mariabackup --backup --target-dir=C:/backup --user=root --password=passwort
   ```

3. **phpMyAdmin Export-Funktion**
   - Datenbank auswählen → „Exportieren“ → Format: SQL oder CSV

Weitere: Docker exec + mysqldump, SELECT INTO OUTFILE, Acronis


### **5. Schritte zur 3. Normalform (3NF)**

1. **1NF**: Nur atomare Werte, keine mehrfachen Spalten
2. **2NF**: Entferne Teilabhängigkeiten (nur bei zusammengesetzten PKs relevant)
3. **3NF**: Entferne transitive Abhängigkeiten (wenn A → B → C, trenne B in eigene Tabelle)
4. **Füge Schlüssel hinzu**: Primär- & Fremdschlüssel für Beziehungen setzen
5. **Validiere Beziehungen**: Überprüfe die Kardinalitäten und logischen Abhängigkeiten


### **6. Was macht SELECT INTO OUTFILE?**

- Exportiert das Ergebnis einer SELECT-Abfrage direkt in eine Datei auf dem Server.

**Beispiel:**
```sql
SELECT * 
INTO OUTFILE 'C:/M164/outfile.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
FROM Schueler;
```
