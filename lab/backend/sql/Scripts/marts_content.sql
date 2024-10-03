DESC;

SELECT * FROM information_schema.schemata WHERE catalog_name = 'youtube_data';


CREATE SCHEMA IF NOT EXISTS marts;


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
	"Visningstid (timmar)" DESC OFFSET 1
);



SELECT * FROM marts.content_view_time;


CREATE TABLE IF NOT EXISTS marts.views_per_date AS
(
SELECT
	STRFTIME('%Y-%m-%d',
	Datum) AS Datum,
	Visningar
FROM
	innehall.totalt
);

	
SELECT
	*
FROM
	information_schema.tables
WHERE
	table_schema = 'marts';
	
SELECT * FROM marts.views_per_date;



CREATE TABLE IF NOT EXISTS marts.viewers_gender AS
(
SELECT 
	"Tittarnas kön", 
	"Visningar (%)"
FROM
	tittare.tabelldata_alder
);


CREATE TABLE IF NOT EXISTS marts.viewers_age AS
(
SELECT
	"Tittarnas ålder",
	"Visningar (%)"
FROM
	tittare.tabelldata_kon
);

SELECT * FROM marts.viewers_age;
