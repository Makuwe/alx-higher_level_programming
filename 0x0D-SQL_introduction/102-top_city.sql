-- Import in hbtn_0c_0 database this table dump
-- a script that displays the top 3 of cities temperature during July and August ordered by temperature (descending)
SELECT*FROM temperatures
WHERE month = 7 OR month = 8;
SELECT city, VAG(value) AS avg_temp
FROM temp_july_aug
GROUP BY city
ORDER BY avg_temp DESC limit 3;

