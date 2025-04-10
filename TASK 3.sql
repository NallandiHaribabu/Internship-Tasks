
-- select ( Print all data)
select * from myemp;

-- where (Shows only rows where dep_id is greater than 50)
select * from myemp where dep_id >50 order by dep_id ;

-- order by (Sorts the results by salary in descending order (highest to lowest))
select * from myemp order by salary desc;

-- group by (Groups all employees by their department ID)
select dep_id,sum(salary) as salary from myemp group by dep_id order by dep_id;

-- pattern matching ( to show only rows where the first_name starts with the letter 'a')
select * from myemp where first_name like "a%";

-- And
select * from myemp where dep_id = 90 and salary > 10000;

-- Or 
select * from myemp where dep_id = 90 or salary > 10000;

-- Between
select * from myemp where salary between 5000 and 10000 order by salary;

-- JOINS
select * from drinks;
select * from meals;

-- cross join
select meals.mealname ,drinks.drinkname,meals.rate as meal_price,drinks.rate as drink_price from meals cross join drinks;

-- Inner join
select * from movies; 
select * from members; 
select * from movies inner join members on movies.id = members.movieid;

-- left Join
select * from movies left join members on movies.id = members.movieid;

-- right join
select * from movies right join members on movies.id = members.movieid;

-- self join
select emp.emp_id ,emp.first_name,emp.last_name,mgr.first_name,mgr.last_name from 
 myemp as emp left join myemp as mgr on emp.mgr_id = mgr.emp_id;
 
 -- Aggregation function
 -- sum 
 select sum(salary) as salary from myemp;
 
 -- average
 select avg(salary) as avg from myemp;
 
 -- count 
 select count(*) as count from myemp;

-- max 
select max(salary) as max_salary from myemp;

-- min
select min(salary) as min_salary from myemp;

-- VIEWS
create view testing as select ifnull(mm.first_name, "--") as First_name, ifnull(mm.last_name,"--") as Last_name, mo.title, 
mo.category from movies as mo left join members as mm on id = movieid;
select * from testing;

-- Index
create index sample using btree on myemp (hire_date);
show indexes from myemp;
select * from myemp where hire_date > "2000-01-01";

-- SUB QUERY
-- Example of a subquery to find orders with an amount greater than the average order amount
SELECT order_id, order_date, amount
FROM Order_s
WHERE amount > (SELECT AVG(amount) FROM Order_s);

-- Example of a subquery to find the highest salary in each department
select  department_name,(select max(salary)  from employees_1 where employees_1.department_id = departments.department_id) as hightest
from  departments ;

-- Subquery in WHERE Clause
SELECT employee_name, salary
FROM employee_s
WHERE salary > (SELECT AVG(salary) FROM employee_s);

