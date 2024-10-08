DESC;

SELECT * FROM information_schema.schemata WHERE catalog_name = 'youtube_data';

-- skapa marts schema
CREATE SCHEMA IF NOT EXISTS marts;

-- skapa tabell med innehållets visningstid
CREATE TABLE IF NOT EXISTS marts.content_view_time AS
(
SELECT
	Videotitel,
	"Publiceringstid för video" AS Publiceringstid,
	Visningar,
	"Visningstid (timmar)" AS Visningstid_timmar,
	Exponeringar,
	Prenumeranter,
	"Klickfrekvens för exponeringar (%)" AS "Klickfrekvens_exponering_%"
FROM
	innehall.tabelldata
ORDER BY
	"Visningstid (timmar)" DESC OFFSET 1);


SELECT * FROM marts.content_view_time;


-- skapa tabell visningar per datum 
CREATE TABLE IF NOT EXISTS marts.views_per_date AS
(
SELECT
	STRFTIME('%Y-%m-%d',
	Datum) AS Datum,
	Visningar
FROM
	innehall.totalt);

SELECT * FROM marts.views_per_date;



-- visa alla tabeller där table_schema är marts	
SELECT
	*
FROM
	information_schema.tables
WHERE
	table_schema = 'marts';


-- skapa tabell med tittarnas kön
CREATE TABLE IF NOT EXISTS marts.viewers_gender AS
(
SELECT 
	"Tittarnas kön", 
	"Visningar (%)"
FROM
	tittare.tabelldata_alder);


-- skapa tabell med tittarnas ålder
CREATE TABLE IF NOT EXISTS marts.viewers_age AS
(
SELECT
	"Tittarnas ålder",
	"Visningar (%)"
FROM
	tittare.tabelldata_kon);

SELECT * FROM marts.viewers_age;



SELECT * FROM trafikkalla.tabelldata;

-- skapa tabell med trafikkällor
CREATE TABLE IF NOT EXISTS marts.traffic_source AS
(
SELECT 
    Trafikkälla,
    Visningar,
    "Visningstid (timmar)",
    "Genomsnittlig visningslängd"
FROM
    trafikkalla.tabelldata);
   

-- avrunda timmar i Visningstid (timmar)
SELECT * FROM marts.traffic_source

UPDATE marts.traffic_source 
SET "Visningstid (timmar)" = ROUND("Visningstid (timmar)");

-- ta bort kolumn Genomsnittlig visningslängd
ALTER TABLE marts.traffic_source 
DROP COLUMN "Genomsnittlig visningslängd";



-- skapa tabell visningar per video
SELECT * FROM innehall.tabelldata;	

CREATE TABLE IF NOT EXISTS marts.views_per_video AS
(
SELECT
	Videotitel, Visningar
FROM
	innehall.tabelldata OFFSET 1
LIMIT (SELECT COUNT(*) FROM innehall.tabelldata) - 7);

SELECT * FROM marts.views_per_video;


SELECT * FROM enhetstyp.tabelldata;

