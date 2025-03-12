1. Query the following two values from the **STATION** table:
    1. The sum of all values in *LAT_N* rounded to a scale of  decimal places.
    2. The sum of all values in *LONG_W* rounded to a scale of  decimal places.

    SELECT ROUND(SUM(LAT_N), 2), ROUND(SUM(LONG_W),2) FROM STATION


2. Query the sum of Northern Latitudes (LAT_N) from **STATION** having values greater than 38.7880 and less than 137.2345. Truncate your answer to 4 decimal places.

    SELECT ROUND(SUM(LAT_N), 4) FROM STATION WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;

3. Query the sum of all values in *LONG_W* rounded to a scale of  2 decimal places.

    SELECT ROUND(SUM(LONG_W), 2) FROM STATION;

4. Query the greatest value of the Northern Latitudes (LAT_N) from **STATION** that is less than 137.2345. Truncate your answer to 4 decimal places.

    SELECT ROUND(MAX(LAT_N), 4) FROM STATION WHERE LAT_N < 137.2345;


5. Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in **STATION** that is less than 137.2345. Round your answer to 4 decimal places.

    SELECT ROUND(LONG_W, 4) FROM STATION WHERE LAT_N < 137.2345 ORDER BY LAT_N DESC LIMIT 1;


6. Query the smallest Northern Latitude (LAT_N) from **STATION** that is greater than 38.7880. Round your answer to 4 decimal places.

    SELECT ROUND(MIN(LAT_N), 4) FROM STATION WHERE LAT_N > 38.7880;

7. Query the Western Longitude (LONG_W) where the smallest Northern Latitude (LAT_N) in **STATION** is greater than 38.7880. Round your answer to 4 decimal places.

    SELECT ROUND(LONG_W, 4) FROM STATION WHERE LAT_N > 38.7880 ORDER BY LAT_N LIMIT 1;

8. Consider **P1(a,b)** and **P2(c,d)** to be two points on a 2D plane.

    - a happens to equal the minimum value in Northern Latitude (LAT_N in **STATION**).
    - b happens to equal the minimum value in Western Longitude (LONG_W in **STATION**).
    - c happens to equal the maximum value in Northern Latitude (LAT_N in **STATION**).
    - d happens to equal the maximum value in Western Longitude (LONG_W in **STATION**).

    Query the Manhattan Distance between points **P1** and **P2** and round it to a scale of 4 decimal places.

    SELECT ROUND(ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)), 4) FROM STATION;