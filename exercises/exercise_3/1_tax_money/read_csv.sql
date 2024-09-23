CREATE TABLE tax07 AS
SELECT *
FROM read_csv_auto('../../../data/Leveratorsfaktura202407.csv');

CREATE TABLE tax08 AS
SELECT *
FROM read_csv_auto('../../../data/Leverantorsfaktura202408.csv');