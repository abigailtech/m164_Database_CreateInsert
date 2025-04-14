# Praxisarbeit: Steuerdaten Stadt Zürich


## Aufgaben

### 1. Analysieren Sie die CSV-Datei und normalisieren Sie wo nötig.

![dfg](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Images/OpendataZH_CSV.png) 

---

### 2. Identifizieren Sie die Attribute und legen Sie die Datentypen fest. Bereinigen sie die Quelldatei (1.NF, Überflüssige Daten raus).

| Feldname        | Datentyp       | Notwendig (NN) |
|-----------------|----------------|----------------|
| stichtag_jahr   | INT            | Ja             |
| quartal_sort    | INT            | Ja             | 
| tarif_code      | VARCHAR(5)     | Ja             | 
| quartal_code    | VARCHAR(5)     | 
| quartal_lang    | VARCHAR(20)    | 
| tarif_sort      | INT            | 
| tarif_lang      | VARCHAR(50)    | 
| einkommen_p25   | FLOAT          | 
| einkommen_p50   | FLOAT          | 
| einkommen_p75   | FLOAT          | 

---

### 3. Erstellen Sie ein phys. ERD mit dem dazugehörigen DDL-Script. Importieren Sie nun die Steuerdaten in die Datenbank per Bulkimport. Schreiben Sie ein DML Skript.

![dfg](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Images/Opendata_Bulkimport.png)

---

### 4. Analysieren Sie nun die Daten. Was bedeuten die Felder _p25, _p50, _p75? 

Die Felder _p25, _p50, und _p75 beziehen sich auf bestimmte Quantile der statistischen Verteilung der Steuereinkommen. Diese Werte gehören zu den sogenannten Perzentilen:

_p25: Das 25. Perzentil (auch unteres Quartil genannt) gibt an, dass 25% der Werte kleiner oder gleich diesem Wert sind.
_p50: Das 50. Perzentil (auch Median genannt) teilt die Daten in zwei gleich große Hälften. 50% der Werte sind kleiner oder gleich diesem Wert.
_p75: Das 75. Perzentil (auch oberes Quartil genannt) gibt an, dass 75% der Werte kleiner oder gleich diesem Wert sind.

Diese Werte sind nützlich, um die Verteilung der Daten zu verstehen, insbesondere die Streuung und die Unterschiede zwischen den unteren und oberen 25% der Werte.

---

### 5. Lösen Sie folgende Fragen: 
a.	Ermitteln Sie das Quartier mit maximalem Steuereinkommen für _p75?

![a](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Images/Opendata_p50.png)

b.	Welches Quartier hat das niedrigste Steuereinkommen für _p50?

![b](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Images/Opendata_p50.png)

c.	Welches Quartier hat das höchste Steuereinkommen für _p50?

![c](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Images/Opendata_p50%20(c).png)

---

### 6. Erstellen Sie ein Backup der Datenbank.

![dump](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Images/Opendata_dump%20erstellt.png)

![dump](https://github.com/abigailtech/m164_Database_CreateInsert/blob/main/02_Tasks/Images/Opendata_dump%20sichtbar.png)
