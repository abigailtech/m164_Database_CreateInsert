# Inhalt
1. [Aggregatsfunktionen]()
2. [Sag Fritz, warum geht Herbert oft Laufen?]()
3. [Group by]()
4. [Having]()


## 1. Aggregatsfunktionen
* dienen dazu, Daten innerhalb einer Spalte oder Gruppe zusammenzufassen. Sie werden häufig mit GROUP BY verwendet, um Berechnungen auf Gruppen von Datensätzen durchzuführen.  

### Wichtige Aggregatsfunktionen:  

- **COUNT()** → Zählt die Anzahl der Zeilen (optional ohne NULL-Werte)  
  *Beispiel:* `SELECT COUNT(*) FROM customers;`  
- **SUM()** → Berechnet die Summe aller Werte einer Spalte  
  *Beispiel:* `SELECT SUM(salary) FROM employees;`  
- **AVG()** → Ermittelt den Durchschnittswert einer Spalte  
  *Beispiel:* `SELECT AVG(salary) FROM employees;`  
- **MIN()** → Gibt den kleinsten Wert einer Spalte zurück  
  *Beispiel:* `SELECT MIN(salary) FROM employees;`  
- **MAX()** → Gibt den größten Wert einer Spalte zurück  
  *Beispiel:* `SELECT MAX(salary) FROM employees;`  


## 2. Merksatz für Select

![Syntax](https://github.com/user-attachments/assets/398bc510-c8b1-4f14-b32c-2b344a62397e)


## 3. Group by

Funktionsweise:  
- GROUP BY fasst alle Zeilen mit demselben Wert in einer bestimmten Spalte zu einer Gruppe zusammen.  
- Aggregatsfunktionen werden dann auf jede Gruppe angewendet.  

Beispiel:  
Die folgende Abfrage berechnet den Gesamtwert der Bestellungen für jeden Kunden:  
```sql
SELECT customer_id, SUM(order_total)  
FROM orders  
GROUP BY customer_id;
```  
Das Ergebnis zeigt pro `customer_id` den Gesamtwert aller Bestellungen.  

Beispielergebnis:  

| customer_id | SUM(order_total) |  
|------------|----------------|  
| 1          | 350.50         |  
| 2          | 210.00         |  
| 3          | 450.25         |  

`GROUP BY` ist nützlich, um Daten in Kategorien zu unterteilen und aussagekräftige Berichte zu erstellen.


## 4. Having

* Das HAVING-Statement wird in MySQL verwendet, um Ergebnisse von Gruppierungsoperationen (GROUP BY) zu filtern. E

Unterschied zwischen WHERE und HAVING:  
- WHERE filtert vor der Gruppierung einzelne Zeilen.  
- HAVING filtert nach der Gruppierung auf Basis aggregierter Werte.  

Beispiel:  
```sql
SELECT customer_id, SUM(order_total)  
FROM orders  
GROUP BY customer_id  
HAVING SUM(order_total) > 500;
```  

Beispielergebnis:  

| customer_id | SUM(order_total) |  
|------------|----------------|  
| 1          | 650.50         |  
| 3          | 900.25         |  

