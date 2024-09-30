DESC;

-- antal visningar per video
SELECT * FROM innehall.tabelldata;

SELECT
    Videotitel,
    Visningar
FROM
    innehall.tabelldata
ORDER BY
    Visningar DESC
OFFSET 1;


-- tittarnas kön och deras respektive andel av visningar i procent
SELECT * FROM tittare.tabelldata_alder; 

SELECT
    "Tittarnas kön",
    "Visningar (%)"
FROM
    tittare.tabelldata_alder;
   
   

-- tittarnas ålder och deras respektive andel av visningar i procent
SELECT * FROM tittare.tabelldata_kon;

SELECT
    "Tittarnas ålder",
    "Visningar (%)"
FROM
    tittare.tabelldata_kon;

   
-- vilken typ av enhet tittaren använt 
SELECT * FROM enhetstyp.tabelldata;

SELECT
	Enhetstyp,
	Visningar
FROM
	enhetstyp.tabelldata;


-- antalet visningar per trafikkälla
SELECT * FROM trafikkalla.tabelldata;

SELECT 
	Trafikkälla,
	Visningar, 
FROM
	trafikkalla.tabelldata;

