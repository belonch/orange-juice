/* 
    Step one: Load the source data into a table called "varietals"
*/

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP TABLE IF EXISTS varietals;

CREATE TABLE varietals
(
	varietal_id            SERIAL NOT NULL,
	varietal_name          TEXT NOT NULL,
	region                 TEXT NOT NULL,
	qty_available          NUMERIC NOT NULL,
	brix_acid_ratio        NUMERIC NOT NULL,
	acid_pct               NUMERIC NOT NULL,
	astringency            NUMERIC NOT NULL,
	color                  NUMERIC NOT NULL,
	price                  NUMERIC NOT NULL,
	shipping               NUMERIC NOT NULL,
	PRIMARY KEY (varietal_id)
);

COPY varietals (varietal_name, region, qty_available, brix_acid_ratio, acid_pct, astringency, color, price, shipping) FROM stdin;
Hamlin	Brazil	672	10.5	0.60	3	3	500	100
Mosambi	India	400	6.5	1.4	7	1	310	150
Valencia	Florida	1200	12	0.95	3	3	750.00	0
Hamlin	California	168	11	1.00	3	5	600.00	60.00
Gardner	Arizona	84	12	0.70	1	5	600.00	75.00
Sunstar	Texas	210	10	0.70	1	5	625.00	50.00
Jincheng	China	588	9	1.35	7	3	440.00	120.00
Berna	Spain	168	15	1.10	4	8	600.00	110.00
Verna	Mexico	300	8	1.30	8	3	300.00	90.00
Biondo	Commune Egypt	210	13	1.30	3	5	460.00	130.00
Belladonna	Italy	180	14	0.50	3	9	505.00	115.00
\.

VACUUM ANALYZE varietals;