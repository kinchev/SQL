-- 1.Write a SQL query to find first and last names of all employees whose first name starts with “Sa” (case insensitively).
-- Order the information by id.
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'Sa%';

-- 2.Write a SQL query to find first and last names of all employees whose last name contains “ei” (case insensitively).
-- Order the information by id

SELECT first_name, last_name
FROM employees
WHERE last_name REGEXP 'ei'
ORDER BY employee_id;

-- 3.Write a SQL query to find the first names of all employees in the departments with ID 3 or 10 and whose hire year is between 1995 and 2005 inclusively.
-- Order the information by id.
SELECT first_name
FROM employees
WHERE department_id IN (3, 10)
  AND (SELECT YEAR(hire_date) BETWEEN 1995 and 2005);

-- 4.Write a SQL query to find the first and last names of all employees whose job titles does not contain “engineer”.
-- Order the information by id

SELECT first_name, last_name, job_title
FROM employees
WHERE NOT (job_title Like '%engineer%');

-- 5.Write a SQL query to find town names that are 5 or 6 symbols long and order them alphabetically by town name.
SELECT name
FROM towns
WHERE CHARACTER_LENGTH(name) IN (5, 6)
ORDER BY name ASC;

-- 6.Write a SQL query to find all towns that start with letters M, K, B or E (case insensitively).
-- Order them alphabetically by town name.
SELECT town_id, name
FROM towns
WHERE name REGEXP '^[M,K,B,E]'
ORDER BY name ASC;

-- 7.Write a SQL query to find all towns that do not start with letters R, B or D (case insensitively).
-- Order them alphabetically by name.
SELECT town_id, name
FROM towns
WHERE name REGEXP '^[^R,B,D]'
ORDER BY name ASC;

-- 8.Write a SQL query to create view v_employees_hired_after_2000 with the first and the last name of all employees hired after 2000 year
CREATE VIEW v_employees_hired_after_2000 AS
SELECT first_name, last_name
FROM employees
WHERE YEAR(hire_date) > 2000;

-- 9.Write a SQL query to find the names of all employees whose last name is exactly 5 characters long.
SELECT first_name,last_name
FROM employees
WHERE CHARACTER_LENGTH(last_name)=5;



-- 12.Find the top 50 games ordered by start date, then by name. Display only the games from the years 2011 and 2012.
-- Display the start date in the format “YYYY-MM-DD”
SELECT name, DATE_FORMAT(start, '%Y-%m-%d')
FROM games
WHERE YEAR(start) BETWEEN 2011 AND 2012
ORDER BY start, name
LIMIT 50;

-- 13.Find information about the email providers of all users. Display the user_name and the email provider.
-- Sort the results by email provider alphabetically, then by username.
SELECT user_name, SUBSTRING(email FROM LOCATE('@', email) + 1) AS 'Email Provider'
FROM users
ORDER BY `Email Provider` ASC, user_name;

-- 14.Find the user_name and the ip_address for each user, sorted by user_name alphabetically.
-- Display only the rows, where the ip_address matches the pattern: “___.1%.%.___”.
SELECT user_name, ip_address
FROM users
WHERE users.ip_address LIKE '___.1%.%.___'
ORDER BY user_name ASC;

-- 15.Find all games with their corresponding part of the day and duration.
-- Parts of the day should be Morning (start time is >= 0 and < 12), Afternoon (start time is >= 12 and < 18), Evening (start time is >= 18 and < 24).
-- Duration should be Extra Short (smaller or equal to 3), Short (between 3 and 6 including),
-- Long (between 6 and 10 including) and Extra Long in any other cases or without duration.

SELECT name AS 'Game',
       CASE
           WHEN HOUR(start) BETWEEN 0 AND 11 THEN 'Morning'
           WHEN HOUR(start) BETWEEN 12 AND 17 THEN 'Afternoon'
           WHEN HOUR(start) BETWEEN 18 AND 23 THEN 'Evening'
           END,
       CASE
           WHEN duration <= 3 THEN 'Extra Short'
           WHEN duration BETWEEN 4 AND 6 THEN 'Short'
           WHEN duration BETWEEN 7 AND 10 THEN 'Long'
           WHEN duration IS NULL OR duration > 10 THEN 'Extra Long'
           END
FROM games
ORDER BY name, duration;




