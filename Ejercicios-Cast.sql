/*Ejercicio introductorio para casting de String al tipo de dato Fecha en sql*/

SELECT (RIGHT(REPLACE(LEFT(s.date,10), '/',''),4) || '-' || LEFT(REPLACE(LEFT(s.date,10), '/',''), 2) || '-' || SUBSTR(REPLACE(LEFT(s.date,10), '/',''), 3, 2))::DATE
FROM sf_crime_data s

