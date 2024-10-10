### __main__
Koden kör filen dashboard.py med Streamlit för att starta en webbapplikation.

### dashboard
Koden skapar en Streamlit-baserad dashboard för att visualisera data från Kokchuns YouTube-kanal. Den använder klasserna ContentKPI för att visa nyckeltal om innehållet och ViewsTrend för att visa en graf över visningstrender. Layouten definieras i funktionen layout() som skapar rubriker och de två visualiseringarna när applikationen kör.

## backend

### database.py
Skriptet innehåller två klasser Database och DatabaseDataframe.
Klassen Database hanterar anslutningen till databasen. Kontexthanteraren with används för att öppna och stänga anslutningar på ett säkert sätt. 
Klassen DatabaseDataframe ärver från klassen Database. Istället för att returnera en lista med resultat så returnerar den resultatet som en DataFrame.

### constants.py
Constants används för att lagra konstanter, värden som är oföränderliga och används på flera ställen i koden. Här finns sökvägen till databasen samt cleaned_data. 

### change_name_data.py
Om mappen cleaned_data_path redan finns så raderas den och en ny skapas. Vi itererar över alla mappar i raw_data och splittar så att de nya mappnamnen endast består av de första ordet i namnet. Sedan använder vi funktionen copytree som kopierar mapparna med deras nya namn och dess innehåll till mappen cleaned_data_path.

### ingest_data_to_database.py
Koden laddar in CSV-filer i databasen och organiserar datan i tabeller. Varje katalogs namn används som ett schema i databasen och varje CSV-fil skapar en motsvarande tabell. Svenska tecken som ä, å, och ö byts ut. 

### EDA.sql
Antal visningar per video.
Tittarnas kön och deras respektive andel av visningar i procent.
Tittarnas ålder och deras respektive andel av visningar i procent
Vilken typ av enhet tittaren använt.
Antalet visningar per trafikkälla.






