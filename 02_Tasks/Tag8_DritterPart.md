# Praxisarbeit: Bundesamt für Statistik

## Aufgaben

### 1. Analysieren Sie das EXCEL File und normalisieren Sie wo nötig.

![sdf](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Images/Statistik_Create%20Table.png)


---

### 2. Identifizieren Sie die Attribute und legen Sie die Datentypen fest. Bereinigen Sie die Quelldatei (1.NF, Überflüssige Daten raus) und exportieren Sie die Daten in mehrere CSV-Dateien. 


| Feldname                     | Datentyp       | Notwendig (NN) |
|------------------------------|----------------|----------------|
| land_id                      | INT            | Ja             |
| land                          | VARCHAR(50)    | Ja             |
| jahr                          | INT            | Ja             |
| schulbesuchsquote_15_19       | FLOAT          |                |
| schulbesuchsquote_20_24       | FLOAT          |                |
| obligatorische_schule        | FLOAT          |                |
| sekundarstufe_ii              | FLOAT          |                |
| tertiaerstufe                 | FLOAT          |                |
| durchschnitt_einkommen_frauen  | FLOAT          |                |


---


### 3. Erstellen Sie ein phys. ERD mit dem dazugehörigen DDL-Script. Importieren Sie nun die CSV-Daten in die Datenbank per Bulkimport. Schreiben Sie ein DML Skript.

![sdf](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Images/Statistik_Import%20(2).png)
![fdg](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Images/Statistik_csvIMPOET.png)
![fg](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Images/sTATISTIK_iMPORT.png)

---

### 4. Lösen Sie folgende Fragen:
   
a.	Bei welchen Ländern liegt die Schulbesuchsquote der 15-19 Jährigen unter dem OECD-Mittel? Gruppiert pro Jahr!

b.	Weches Land hat die höchste Anzahl tertiärer Ausbildung über alle (importierten) Jahre hinweg?

c.	Welches Land hat die grösste Steigerung der Anzahl an abgeschlossenener oblig. Schule innerhalb einers Jahres?

![df](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Images/Statistik_Aufgabe4.png)

---

### 5. Erstellen Sie ein Backup dar Datenbank.

![df](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Images/Statistik_Dump%20erstellt.png)
