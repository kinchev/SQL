-- 1.Write a SQL query to find books which titles start with “The”.
-- Order the result by id.
# Fastest
SELECT title
FROM books
WHERE SUBSTRING(title,1 ,3)='The'
ORDER BY id;

SELECT title
FROM books
WHERE title LIKE 'The%'
ORDER BY id;

SELECT title
FROM books
WHERE title REGEXP '^The.'
ORDER BY id;

SELECT title
FROM books
WHERE LEFT(title,3)='The'
ORDER BY id;

-- 2.Write a SQL query to find books which titles start with “The” and replace the substring with 3 asterisks.
-- Retrieve data about the updated titles.
-- Order the result by id
SELECT REPLACE(title,'The','***')
FROM books
WHERE SUBSTRING(title,1 ,3)='The'
ORDER BY id;

-- 3.Write a SQL query to sum prices of all books. Format the output to 2 digits after decimal point.
SELECT SUM(ROUND(cost,2))
FROM books;

-- 4.Write a SQL query to calculate the days that the authors have lived.
-- NULL values mean that the author is still alive.
SELECT CONCAT_WS(' ',first_name,last_name) AS 'Full Name',(DATEDIFF(died,born)) as 'Days Lived'
FROM authors;

-- 5.Write a SQL query to retrieve titles of all the Harry Potter books. Order the information by id.


SELECT title
FROM books
WHERE title REGEXP '^Harry Potter.'
ORDER BY author_id




