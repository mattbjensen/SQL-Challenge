-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from public."Employees" as e
join public."Salaries" as s on e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from public."Employees"
where DATE_PART('year', hire_date) = 1986;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from public."Dept_Managers" as dm
join public."Departments" as d on dm.dept_no = d.dept_no
join public."Employees" as e on dm.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from public."Employees" as e
join public."Dept_Employees" as de on e.emp_no = de.emp_no
join public."Departments" as d ON de.dept_no = d.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from public."Employees"
where first_name = 'Hercules' and last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select * from public."Departments";
-- Sales department = 'd007'

select e.emp_no, e.last_name, e.first_name, d.dept_name
from public."Employees" as e
join public."Dept_Employees" as de ON e.emp_no = de.emp_no
join public."Departments" as d on de.dept_no = d.dept_no
where d.dept_no = 'd007';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select * from public."Departments";
-- Sales department = 'd007' and the Development department = 'd005'

select e.emp_no, e.last_name, e.first_name, d.dept_name
from public."Employees" as e
join public."Dept_Employees" as de on e.emp_no = de.emp_no
join public."Departments" as d on de.dept_no = d.dept_no
where d.dept_no = 'd005' or d.dept_no = 'd007';


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count( last_name) as "Frequency count"
from public."Employees"
group by last_name
order by "Frequency count" desc;