-- 1. Write a SQL query that outputs all information about all departments.
select *
from departments;

-- 2. Write a SQL query that outputs all department names.
select name as 'Department name'
from departments;

-- 3. Write a SQL query that outputs first and last name of each employee,
-- along with their salary.
select first_name as 'First Name', last_name as 'Last Name', salary
from employees;

-- 4. Write a SQL query that outputs the full name of each employee.
select concat(first_name, ' ', last_name) as 'Full Name'
from employees;

select concat_ws(' ', first_name, last_name) as 'Full name'
from employees;

-- 5. Write a SQL query to generate an email addresses for each employee.
-- Consider that the email domain is telerikacademy.com.
-- For example, John Doe's email would be "John.Doe@telerikacademy.com".
-- The produced column should be named "Full Email Addresses".
select concat(first_name, '.', last_name, '@telerikacademy.com') as 'Full Email Addresses'
from employees;

-- 6. Write a SQL query to find all the different employee salaries.
select DISTINCT salary
from employees;

-- 7. Write a SQL query that outputs all information about the employees
-- whose job title is "Sales Representative".
select *
from employees
where job_title = 'Sales Representative';

-- 8. Write an SQL query to find all employees who have a salary that is
-- bigger than their manager's.
select e.first_name, e.salary, m.first_name, m.salary
from employees e
         inner join employees m on e.manager_id = m.employee_id
where e.salary > m.salary;

-- 9. Write a SQL query to find the names of all employees
-- whose first name starts with "SA".
select first_name
from employees
where first_name like 'sa%';

-- 10. Write a SQL query to find the names of all employees
-- whose last name contains "ei".
select last_name
from employees
where last_name like '%ei%';

-- 11. Write a SQL query to find all employees
-- whose salary is in the range [20000…30000].
select first_name, salary
from employees
where salary BETWEEN 20000 and 30000;

select first_name, salary
from employees
where salary < 30000
  and salary > 20000;

-- 12. Write a SQL query to find the names of all employees
-- whose salary is 25000, 14000, 12500 or 23600.
select first_name, salary
from employees
where salary in (25000, 14000, 12500, 23600);

-- 13. Write a SQL query to find all employees that do not have manager.
select first_name, last_name, job_title
from employees
where manager_id is null;

-- 14. Write a SQL query to find the names of all employees
-- who were hired before their managers.
select e.first_name, e.last_name, e.hire_date, m.first_name, m.hire_date
from employees e
         join employees m on e.manager_id = m.employee_id
where e.hire_date < m.hire_date AND e.manager_id = m.employee_id;

-- 15. Write a SQL query to find all employees whose salary is more than 50000.
-- Order them in decreasing order, based on their salary.
select first_name, last_name, salary
from employees
where salary < 50000
order by salary desc;

-- 16. Write a SQL query to find the top 5 best paid employees.
select first_name, last_name, salary
from employees
order by salary desc
    limit 5;

-- 17. Write a SQL query that outputs all employees along their address.
select e.first_name, e.last_name, a.text
from employees e
         join addresses a on a.address_id = e.address_id;

-- 18. Write a SQL query to find all employees
-- whose middle name is the same as the first letter of their town.
select e.first_name, e.middle_name, e.last_name, a.text, t.name
from employees e
         join addresses a on a.address_id = e.address_id
         join towns t on t.town_id = a.town_id
where e.middle_name = left(t.name, 1);

-- 19. Write a SQL query that outputs all employees (first and last name)
-- that have a manager, along with their manager (first and last name).
select concat(e.first_name, ' ', e.last_name) as 'Employee',
        concat(m.first_name, ' ', m.last_name) as 'Manager'
from employees e
         join employees m on e.manager_id = m.employee_id;

-- 20. Write a SQL query that outputs all employees that have a
-- manager (first and last name),
-- along with their manager (first and last name) and the employee's address.
select concat(e.first_name, ' ', e.last_name)       as 'Employee',
        concat('Street: ', a.text, ' , City: ', t.name) as 'Street and City',
        concat(m.first_name, ' ', m.last_name)       as 'Manager'
from employees e
         join employees m on e.manager_id = m.employee_id
         join addresses a on a.address_id = e.address_id
         join towns t on t.town_id = a.town_id;

-- 21. Write a SQL query to find all departments and all town names
-- in a single column.
select name
from departments
union
select name
from towns;

-- 22. Write a SQL query to find all employees and their manager,
-- along with the employees that do not have manager.
-- If they do not have a manager, output "n/a".
select e.first_name, e.last_name,
       if(e.manager_id is not null, m.first_name, 'n/a') as 'Manager First name',
        if(e.manager_id is not null, m.last_name, 'n/a') as 'Manager Last Name'
from employees e
         left join employees m on e.manager_id = m.employee_id;

select e.first_name, e.last_name,
       ifnull(concat((m.first_name), ' ', (m.last_name)), 'n/a') as 'Manager Name'
from employees e
         left join employees m on e.manager_id = m.employee_id;

-- 23. Write a SQL query to find the names of all employees from the
-- departments "Sales" AND "Finance" whose hire year is between
-- 2002 january and 2003 february.
select e.first_name, e.last_name,d.name, e.hire_date
from employees e
         join departments d on d.department_id = e.department_id
where d.name in ('Sales','Finance')
  and left(e.hire_date, 4) >= 2000 and left(e.hire_date, 4) <= 2003;

select e.first_name, e.last_name,d.name, e.hire_date
from employees e
         join departments d on d.department_id = e.department_id
where d.name in ('Sales','Finance')
  and e.hire_date >= '2001-01-19 00:00:00' and e.hire_date <= '2003-02-01 00:00:00';
