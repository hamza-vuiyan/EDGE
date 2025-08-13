1.
select * from Employees where salary > 50000;

2.
select e.emp_name, p.proj_name from Employees e join Assignments a on e.emp_id = a.emp_id
join Projects p on a.proj_id = p.proj_id;

3.
select d.dept_name, COUNT(p.proj_id) as total_projects from Departments d left join Projects p on d.dept_id = p.dept_id
group by d.dept_id, d.dept_name;

4.
select e.* from Employees e
left join Assignments a on e.emp_id = a.emp_id
where a.proj_id is NULL;