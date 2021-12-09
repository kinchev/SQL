<img src="https://webassets.telerikacademy.com/images/default-source/logos/telerik-academy.svg" alt="logo" width="300px" style="margin-top: 20px;"/>

# SQL - Tasks

## Instructions

1. Start your favorite SQL Client and create new database "telerikacademy", using the [provided script](./telerikacademy_database.sql.sql)
1. Connect to the database "telerikacademy" and examine the major tables.
1. Use the "telerikacademy" database for all tasks.
1. Happy querying :)


## Tasks

1. Write a SQL query to find the average salary of employees who have been hired before year 2000 incl. Round it down to the nearest integer.
1. Write a SQL query to find all town names that end with a vowel (a,o,u,e,i).
   - *Hint*: [MySQL right() function](https://www.w3schools.com/sql/func_mysql_right.asp)
1. Write a SQL query to find all town names that start with a vowel (a,o,u,e,i).
1. Write a SQL query that outputs the name and the length of the town with the longest name.
1. Write a SQL query that outputs the name and the length of the town with the shortest name.
1. Write a SQL query to find all employees with even IDs.
1. Write a SQL query to find the names and salaries of the employees that take the minimal salary in the company.
1. Write a SQL query to find the names and salaries of the employees that have a salary that is up to 10% higher than the minimal salary for the company.
1. Write a SQL query to find the full name, salary and department of the employees that take the minimal salary in their department.
1. Write a SQL query to find the average salary in department #1.
1. Write a SQL query to find the average salary in the "Sales" department.
1. Write a SQL query that outputs the number of employees in the "Sales" department.
1. Write a SQL query that outputs the number of employees that have manager.
1. Write a SQL query that outputs the number of employees that don't have manager.
1. Write a SQL query to find all departments, along with the average salary for each of them.
1. Write a SQL query to find all projects that took less than 1 year (365 days) to complete.
   - *Hint*: [Datediff](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_datediff)
1. Write a SQL query that outputs the number for employees from each town, grouped by department. For example how many people from Bellevue work in Sales. How many people from Calgary work in Marketing, and so on...
1. Write a SQL query that outputs the first and last name of all managers that have exactly 5 employees.
1. Write a SQL query to find all employees along with their managers. For employees that do not have manager display the value "(no manager)".
1. Write a SQL query that outputs the names of all employees whose last name is exactly 5 characters long.
   - *Hint*: [MySQL length](https://dev.mysql.com/doc/refman/8.0/en/string-functions.html#function_length)
1. Write a SQL query that outputs the current date and time in the following format "`day.month.year hour:minutes:seconds:milliseconds`".
   - *Hint*: [MySQL date functions](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html)
1. Write a SQL query to display the average employee salary by department and job title. For example, the average salary in Engineering for Design Engineer is 32,700.
1. Write a SQL query that outputs the town with most employees.
1. Write a SQL query that outputs the number of managers from each town.
1. Write a SQL query to find the manager who is in charge of the most employees and his average salary.
1. Write a SQL query that outputs the names of the employees who have worked on the most projects.