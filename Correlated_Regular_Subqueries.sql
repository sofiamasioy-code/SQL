
 -1. Find employees who earn more than the average salary of their department

 SELECT * FROM employees e
WHERE salary > (
    SELECT AVG(salary) 
    FROM employees d
    WHERE  d.department_id = e.department_id)

-- 2. Find employees who earn the highest salary in their department

select *from employees e
where salary =(select max(salary) from employees m
where e.department_id= m.department_id)

-- 3. Find employees hired after the earliest hire date in their department

select *from employees e
where hire_date = (select min (hire_date)from employees h
where e.department_id =h.department_id)

-- 4. Find departments that have at least one employee (EXISTS)

SELECT department_name
FROM departments d
WHERE EXISTS (SELECT 0 FROM employees e
WHERE e.department_id = d.department_id)

-- 5. Find departments that have NO employees (NOT EXISTS)

SELECT department_name
FROM departments d
WHERE not exists (SELECT 0 FROM employees e
WHERE e.department_id = d.department_id)

-- 6. Find employees who work in departments that have projects (EXISTS)

select *from employees e
where exists (select * from projects p
where p.department_id= e.department_id)

-- 7. Find employees who work in departments with NO projects (NOT EXISTS)

select *from departments d
where not exists(select 0 from projects p
where d.department_id = p.department_id)

-- 8. Find employees whose salary is above the average salary of ALL employees hired in the same year

SELECT CONCAT(last_name,' ', first_name) AS full_name, salary
FROM employees e
WHERE salary > (SELECT AVG(salary) FROM employees m
    WHERE YEAR(e.hire_date) = YEAR(m.hire_date))


-- 9. Find projects where the department has employees (EXISTS)

select * from projects p
where exists (select 0 from employees e
where e.department_id= p.department_id)

-- 10. Find projects where the department has NO employees (NOT EXISTS)

select * from projects p
where not exists (select 0 from employees e
where e.department_id= p.department_id)
