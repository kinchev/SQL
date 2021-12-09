-- 1. Write a SQL query to find the average salary of employees who have been hired before year 2000 incl. Round it down to the nearest integer.
select floor(avg(salary))
from employees
where hire_date < '2001-01-01 00:00:00';

select floor(avg(salary))
from employees
where (YEAR(hire_date)) <= 2000;
-- 2. Write a SQL query to find all town names that end with a vowel (a,o,u,e,i).
select name
from towns
where right(name, 1) in ('a', 'o', 'u', 'e', 'i');

select name
from towns
where name regexp '[aouei]$';

-- 3. Write a SQL query to find all town names that start with a vowel (a,o,u,e,i).
select name
from towns
where left(name, 1) in ('a', 'o', 'u', 'e', 'i');

select name
from towns
where name regexp '^[aouei]';

select name
from towns
where name Like '%at'
   or name like '%oy'
   or name like '%uu'
   or name like '%ey'
   or name like '%it';
-- 4. Write a SQL query that outputs the name and the length of the town with the longest name.
select name, length(name)
from towns
order by length(name) desc
    limit 1;

select name, length(name)
from towns
where length(name) = (select max(length(name))
                      from towns);
-- 5. Write a SQL query that outputs the name and the length of the town with the shortest name.
select name, length(name)
from towns
order by length(name)
    limit 1;

select name, length(name)
from towns
where length(name) = (select min(length(name))
                      from towns);

-- 6. Write a SQL query to find all employees with even IDs.
select first_name, employee_id
from employees
where employee_id % 2 = 0;

select first_name, employee_id
from employees
where mod(employee_id, 2) = 0;
-- 7. Write a SQL query to find the names and salaries of the employees that take
-- the minimal salary in the company.
select first_name,salary
from employees
where salary = (select min(salary) from employees);

-- 8. Write a SQL query to find the names and salaries of the employees that
-- have a salary that is up to 10% higher than the minimal salary for the company.
select first_name,salary
from employees
where salary < (select 1.1 * min(salary) from employees);

-- 9. Write a SQL query to find the full name,
-- salary and department of the employees
-- that take the minimal salary in their department.
select concat(first_name, ' ', last_name) as 'Full Name', salary, t.name
from employees e
         join departments t on t.department_id = e.department_id
where salary = (select min(salary)
                from employees d
                where d.department_id = e.department_id
                group by d.department_id);
-- 10. Write a SQL query to find the average salary in department #1.
select avg(salary)
from employees
where department_id = 1;

-- 11. Write a SQL query to find the average salary in the "Sales" department.
select round(avg(salary)) as 'Average Salary in Sales'
from employees
         join departments d on d.department_id = employees.department_id
where d.name like 'Sales';

-- 12. Write a SQL query that outputs the number of employees in the "Sales" department.
select count(e.first_name), d.name
from employees e
         join departments d on d.department_id = e.department_id
where d.name like 'Sales';

select count(*), d.name
from employees e
         join departments d on d.department_id = e.department_id
where d.name like 'Sales';

-- 13. Write a SQL query that outputs the number of employees that have manager.
select COUNT(first_name)
from employees
where manager_id is not null ;

-- 14. Write a SQL query that outputs the number of employees that don't have manager.
select COUNT(first_name)
from employees
where manager_id is null ;

-- 15. Write a SQL query to find all departments, along with the average salary for each of them.
select d.name, round(avg(salary))
from employees e
         join departments d on d.department_id = e.department_id
group by d.name;

-- 16. Write a SQL query to find all projects that took less than 1 year (365 days) to complete.
select e.name, (to_days(e.end_date) - to_days(e.start_date)) as 'days to complete'
from projects e
where to_days(e.end_date) - to_days(e.start_date) < 365;

select e.name, (to_days(e.end_date) - to_days(e.start_date)) as 'days to complete'
from projects e
where datediff(end_date, start_date) < 365;
-- 17. Write a SQL query that outputs the number for employees from each town,
-- grouped by department.
-- For example how many people from Bellevue work in Sales.
-- How many people from Calgary work in Marketing, and so on...
select COUNT(*), d.name, t.name
from employees e
         join departments d on d.department_id = e.department_id
         join addresses a on a.address_id = e.address_id
         join towns t on t.town_id = a.town_id
group by t.name, d.name
order by count(*) desc ;

-- 18. Write a SQL query that outputs the first and last name of all managers
-- that have exactly 5 employees.
select m.first_name, m.last_name, count(e.employee_id)
from employees e
         join employees m on e.manager_id = m.employee_id
group by e.manager_id
having count(e.employee_id) = 5;

SELECT
    m.`first_name` AS 'First Name',
        m.`last_name` AS 'Last Name',
        COUNT(e.manager_id) AS 'Count of Employees'
FROM
    `employees` e
        INNER JOIN
    `employees` m ON e.manager_id = m.`employee_id`
GROUP BY
    e.`manager_id`
HAVING
        COUNT(e.`manager_id`) = 5;

SELECT m.first_name, m.last_name, count(*)
FROM employees e,
     employees m
WHERE e.manager_id = m.employee_id
GROUP BY e.manager_id
HAVING count(*) = 5;

-- 19. Write a SQL query to find all employees along with their managers.
-- For employees that do not have manager display the value "(no manager)".
select concat(e.first_name, '', e.last_name) as 'Employee Name', concat(ifnull(m.first_name, 'no'),' ', ifnull(m.last_name, 'manager'))
from employees e
         left join employees m on e.manager_id = m.employee_id;

select *
from employees e
         left join employees m on e.manager_id = m.employee_id;
-- 20. Write a SQL query that outputs the names of all employees whose last name is exactly 5 characters long.
select first_name, last_name
from employees
where length(last_name) = 5;

-- 21. Write a SQL query that outputs the current date and time in the following format "`
-- day.month.year hour:minutes:seconds:milliseconds`".
select DATE_FORMAT(NOW(), '%d.%m.%Y %H:%i:%s:%f');
select timestamp(now(6));

-- 22. Write a SQL query to display the average employee salary by department and job title.
-- For example, the average salary in Engineering for Design Engineer is 32,700.
select d.name as Department, e.job_title, avg(e.salary) as 'Average Salary'
from employees e
         join departments d on d.department_id = e.department_id
group by e.job_title, d.name;

-- 23. Write a SQL query that outputs the town with most employees.
-- Solution 1.
select towns.name, townWithMaxCountResult.EmployeesCount
from
    (select t.town_id, count(employee_id) as EmployeesCount
     from towns t
              join addresses a on a.town_id = t.town_id
              join employees e on e.address_id = a.address_id
     group by t.town_id
     having EmployeesCount = (
         select max(employeesCountTable.EmployeesCount)
         from
             (select count(e.employee_id) as EmployeesCount
              from towns t
                       join addresses a on a.town_id = t.town_id
                       join employees e on e.address_id = a.address_id
              group by t.town_id) as employeesCountTable
     )
    ) as townWithMaxCountResult
        join towns on towns.town_id = townWithMaxCountResult.town_id;
-- Solution 2.
select COUNT(e.employee_id), t.name
from employees e
         join addresses a on a.address_id = e.address_id
         join towns t on t.town_id = a.town_id
group by t.name
having count(e.employee_id) = (select COUNT(t.name), t.name
                               from employees
                                        join addresses a on a.address_id = employees.address_id
                                        join towns t on t.town_id = a.town_id
                               group by t.name
                               order by count(employee_id));

-- 24. Write a SQL query that outputs the number of managers from each town.
-- Solution 1.
select t.name, count(e.employee_id) ManagersCount
from employees e
         join addresses a on a.address_id = e.employee_id
         join towns t on t.town_id = a.town_id
where e.employee_id in (select distinct manager_id from employees where manager_id is not null)
group by t.name;

-- Solution 2.
select t.name, count(distinct m.employee_id) as 'Managers count'
from employees e
         inner join employees m on e.manager_id = m.employee_id
         inner join addresses a on m.address_id = a.address_id
         inner join towns t on a.town_id = t.town_id
group by t.name
order by `Managers count` desc;

-- 25. Write a SQL query to find the manager who is in charge of the most employees.
-- Solution 1
select m.first_name, m.last_name, COUNT(*)
from employees e
         join employees m on e.manager_id = m.employee_id
group by m.first_name, m.last_name, m.employee_id
having count(*) = (select count(*)
                   from employees m
                   group by manager_id
                   order by count(m.manager_id) desc
    limit 1);
-- Solution 2
select manager_id, round(avg(salary),0) employeesAvgSalary
from employees
where manager_id in
      (select managersWithMaxCountResult.manager_id
       from
           (select manager_id, count(*) as employeesCount
            from employees
            group by manager_id
            having  employeesCount =
                    (select max(employeesCountTable.employeesCount)
                     from
                         (select count(*) as employeesCount
                          from employees
                          group by manager_id) as employeesCountTable
                    )
           ) as managersWithMaxCountResult
      );

-- 26. Write a SQL query that outputs the names of the employees who have worked on the most projects.
-- Solution 1.
select first_name, last_name, count(*)
from employees_projects ep
         join employees e on ep.employee_id = e.employee_id
group by ep.employee_id, first_name, last_name
having count(*) = (select count(project_id)
    as count
from employees_projects ep
group by ep.employee_id
order by count desc
    limit 1);

-- Solution 2.
SELECT COUNT(*) AS 'Count', e.first_name, e.last_name
FROM employees_projects p
         JOIN employees e ON p.employee_id = e.employee_id
GROUP BY e.employee_id
HAVING Count = (
    SELECT MAX(c1)
    FROM (
             SELECT COUNT(*) AS 'c1'
             FROM employees_projects p
                      JOIN employees e ON p.employee_id = e.employee_id
             GROUP BY e.employee_id
         ) AS c2
);

-- Solution 3.
select concat(first_name, ' ',  last_name)
from employees
where employee_id in
      (
          select employeesWithMaxProjects.employee_id
          from
              (select employee_id, count(*) as projectsCount
               from employees_projects
               group by employee_id
               having  projectsCount =
                       (select max(projectsCountTable.projectsCount)
                        from
                            (select count(*) as projectsCount
                             from employees_projects
                             group by employee_id) as projectsCountTable
                       )
              ) as employeesWithMaxProjects
      );

