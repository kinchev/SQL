-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 37.7880  and less than 137,2345.
-- Truncate your answer to  decimal places.

SELECT ROUND(SUM(LAT_N),4)
FROM STATION
WHERE LAT_N BETWEEN 38.7880 AND 137.2345;

--Weather Observation Station 14
--Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137,2345 .
-- Truncate your answer to 4 decimal places.
SELECT ROUND(MAX(LAT_N),4)
FROM STATION
WHERE LAT_N < 137.2345;





--Weather Observation Station 15
--Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345 . Round your answer to 4 decimal places.
Select round(LONG_W,4)
from station
where LAT_N =(select MAX(LAT_N)FROM STATION WHERE LAT_N<137.2345);