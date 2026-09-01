----Get the total salary of employees in each department

select* from employees
select department_id,  sum( salary) from employees
group by department_id

----Count the number of employees in each department.
select department_id, count( employee_id) from employees
group by department_id

--- Find the highest salary in each department.
select department_id, max( salary) from employees
group by department_id

------Find the lowest salary in each department.

select department_id, min( salary) from employees
group by department_id

----Find the average salary in each department.

select department_id, avg( salary) from employees
group by department_id

----- Exercise 6: List the departments and their total salary, but only for departments with total salary > 50000.
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 50000;

---- Get the number of employees who joined after January 1, 2020.
select count(employee_id) from employees
where hire_date> '2020-01-01'

----Get the average salary of employees who have a salary greater than 60000.
select department_id, avg( salary) from employees
group by department_id
having avg( salary) >60000.00

---- Find the department with the maximum total salary.
select department_id, min( salary) from employees
group by department_id

---Get the total number of employees with non-null salary.
select  count ( employee_id) from employees
where salary is not null

-----Get the average salary in departments where the number of employees is greater than 10

select department_id,count(employee_id), avg(salary ) as avg from employees
group by department_id
having count(employee_id)>10

-------- Get the number of employees per department and their average salary.
select department_id, count (employee_id)as emplyees_number,avg( salary)  from employees
group by department_id 


select department_id, sum(salary) from employees
where department_id in ( 1,3)
group by department_id

