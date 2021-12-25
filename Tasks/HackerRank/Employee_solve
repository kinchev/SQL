# select MAX(salary * months), COUNT(salary * months)
# from employees
# where (months*salary)=(SELECT MAX(months*salary)
#     FROM employees
# );
SELECT (months*salary) as earnings,
COUNT(*) as count FROM Employees
 GROUP BY 1
ORDER BY earnings DESC
LIMIT 1;

-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than  and less than .
-- Truncate your answer to  decimal places.