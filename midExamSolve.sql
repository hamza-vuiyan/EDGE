#Part A
1.
create table Departments (
    dept_id INT primary key,
    dept_name varchar(100) not NULL,
    location varchar(100) default 'Dhaka'
);

2.
insert into Departments (dept_id, dept_name, location)
values (101, 'IT', 'Chattogram');

3.
select *
from Employees
where salary > 50000;

4.
select distinct designation
from Employees;

5.
delete from Employees
where dept_id = 103;


#Part B
1.
select e.emp_name, d.dept_name, d.location
from Employees e
join Departments d on e.dept_id = d.dept_id;

2.
select e.*
from Employees e
left join Assignments a on e.emp_id = a.emp_id
where a.proj_id is NULL;

3.
select d.dept_name, AVG(e.salary) as avg_salary
from Employees e
join Departments d on e.dept_id = d.dept_id
group by d.dept_id, d.dept_name
having avg(e.salary) > 60000;

4.
select p.proj_name, SUM(a.hours_worked) as total_hours
from Projects p
left join Assignments a on p.proj_id = a.proj_id
group by p.proj_id, p.proj_name;

5.
select e.*
from Employees e
join (
    select dept_id, AVG(salary) as avg_salary
    from Employees
    group by dept_id
) dept_avg on e.dept_id = dept_avg.dept_id
where e.salary > dept_avg.avg_salary;

#Part C

1.
select d.dept_name,
       COUNT(p.proj_id) as number_of_projects,
       SUM(p.budget) as total_budget
from Departments d
join Projects p on d.dept_id = p.dept_id
group by d.dept_id, d.dept_name
HAVING COUNT(p.proj_id) > 2 AND SUM(p.budget) > 5000000
ORDER BY total_budget DESC;
