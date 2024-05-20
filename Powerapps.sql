--1.
select first_name, last_name
from [sample project].[dbo].[Employees$]


--2
select *
from [sample project].[dbo].departments$

--3
select count(*)
from [sample project].[dbo].[Employees$]

--4
select AVG(salary) AS Average_salary
from [sample project].[dbo].[salaries$]

--5
select first_name, last_name, birth_date, hire_date 
FROM [sample project].[dbo].[Employees$]
where emp_no = 10003


--6
select  (first_name + ' ' + last_name) AS Employee_fullname, title
from employee_titles$ a
right join Employees$ b 
on a. emp_no = b.emp_no

--7
select count(dep_name) AS number_of_departments
from departments$

--8
select dept_no, dep_name
from departments$ a
right join dept_emp$ b
on a.dep_no = b.dept_no
where emp_no = 10004

--9
select gender
from Employees$
where emp_no = 10007

--10
select max(salary)
from salaries$

--11
select first_name, last_name, dep_name, title
from employee_titles$ a
left join  dept_emp$ b
on a.emp_no = b.emp_no
left join Employees$ c
on a.emp_no = c.emp_no
left join departments$ d
on b.dept_no = d.dep_no
where title = 'manager'


--12
select dep_name, count(emp_no) Number_of_employees
from dept_emp$ a
left join departments$ b
on a.dept_no = b.dep_no
group by dep_name 
order by dep_name desc

--13
select a.emp_no,first_name,last_name,salary
from Employees$ a
left join salaries$ b
on a.emp_no = b.emp_no
where salary > 60000

--14
select AVG(salary) Average_salary$, dep_name
from dept_emp$ a
left join departments$ b
on a.dept_no = b.dep_no
right join salaries$ c
on c.emp_no = a.emp_no
group by dep_name


--15
select a.emp_no,first_name,last_name, title
from employee_titles$ a
right join Employees$ b 
on a. emp_no = b.emp_no
left join salaries$ c
on b.emp_no = c.emp_no
where a.title = 'manager'

--16
select dep_name, count(emp_no) Number_of_employees
from dept_emp$ a
left join departments$ b
on a.dept_no = b.dep_no
group by dep_name 



--19
select a.emp_no, first_name, last_name, title
from  Employees$ a
left join employee_titles$ b
on a.emp_no = b.emp_no
where year(hire_date) = 2005

--20
select TOP 1 dep_name, (AVG(salary)) average_salary
from departments$ a
join dept_emp$ b
on a.dep_no = b.dept_no
right join salaries$ c
on b.emp_no = c.emp_no
group by dep_name
order by average_salary desc

--21
select a.emp_no, first_name, last_name, title,salary
from  Employees$ a
left join employee_titles$ b
on a.emp_no = b.emp_no
left join salaries$ c
on b.emp_no = c.emp_no
where year(a.hire_date) < 2005

--23
select a.emp_no,first_name,last_name,dep_name
from Employees$ a
left join  dept_emp$ b
on a.emp_no= b.emp_no
left join departments$ c
on b.dept_no = c.dep_no
where dep_name = 'finance'

--24
select max(salary) highest_salary, dep_name
from departments$ a
right join dept_emp$ b
on a.dep_no = b.dept_no
right join salaries$ c
on b.emp_no = c.emp_no
group by dep_name




select max(b.hire_date)
from employee_titles$ a
right join Employees$ b 
on a. emp_no = b.emp_no
left join salaries$ c
on b.emp_no = c.emp_no
where a.title = 'manager'


--25
select c.emp_no, first_name, last_name,dep_name,title
from dept_emp$ a
left join departments$ b 
on a.dept_no = b.dep_no
left join employee_titles$ c
on a.emp_no = c.emp_no
left join Employees$ d
on c.emp_no = d.emp_no 
where c.title like '%manager%'

--26 
select count(*) count
from employee_titles$ a
right join Employees$ b 
on a. emp_no = b.emp_no
where title = 'senior manager'

								   
--28
select TOP 1 first_name, year(hire_date) year_recruited, to_date,from_date
from Employees$ a
left join dept_emp$ b
on a.emp_no = b.emp_no
order by year_recruited asc

--29.
select dept_no,first_name, last_name, title,hire_date
from Employees$ a
left join dept_emp$ b
on a.emp_no = b.emp_no
left join employee_titles$ c
on a.emp_no =c.emp_no
where hire_date between '2005-01-01' and '2006-01-01'

