LOAD DATA LOCAL INFILE 'C:/Users/abiga/Documents/GitHub/m164_Database_CreateInsert/02_Tasks/CSV/tbl_lehrerin.csv'  
INTO TABLE tbl_lehrerin 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES  
(@ID, @Vorname, @Nachname, @Geburtsdatum)
SET 
  ID_Lehrer = @ID,
  Vorname = @Vorname,
  Nachname = @Nachname,
  Geburtsdatum = STR_TO_DATE(@Geburtsdatum, '%d.%m.%Y');  