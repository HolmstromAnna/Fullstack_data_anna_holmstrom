### database.py
Skriptet innehåller två klasser Database och DatabaseDataframe.
Klassen Database hanterar anslutningen till databasen. Kontexthanteraren with används för att öppna och stänga anslutningar på ett säkert sätt. 
Klassen DatabaseDataframe ärver från klassen Database. Istället för att returnera en lista med resultat så returnar den resultatet som en DataFrame.


### constants.py
Constants används för att lagra konstanter, värden som är oföränderliga och används på flera ställen i koden. Här finns sökvägen till databasen samt cleaned_data. 


### change_name_data.py
Om mappen cleaned_data_path redan finns så raderas den och en ny skapas. Vi itererar över alla mappar i raw_data och splittar så att de nya mappnamnen endast består av de första ordet i namnet. Sedan använder vi funktionen copytree som kopierar mapparna med deras nya namn och dess innehåll till mappen cleaned_data_path.


### ingest_data_to_database.py
Koden laddar in CSV-filer i databasen och organiserar datan i tabeller. Varje katalogs namn används som ett schema i databasen och varje CSV-fil skapar en motsvarande tabell. Svenska tecken som ä, å, och ö byts ut. 


# SQL
### EDA


