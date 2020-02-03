-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

select employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
from employees
INNER JOIN salaries on employees.emp_no = salaries.emp_no;

-- 2. List employees who were hired in 1986.

select *
from employees
where hire_date between '1986-01-01' and '1987-01-01';

-- 3. List the manager of each department with the following information: department number, department name, \
--the manager's employee number, last name, first name, and start and end employment dates.

select dept_manager.dept_no as "Department Number", departments.dept_name as "Department",
employees.emp_no as "Employee Number", 
employees.first_name as "First Name", employees.last_name as "Last Name", dept_manager.emp_no,
dept_manager.from_date as "Start Date", dept_manager.to_date as "End Date"
from employees
Inner Join dept_manager on employees.emp_no = dept_manager.emp_no
inner join departments on dept_manager.dept_no = departments.dept_no;


-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select employees.emp_no, employees.last_name, employees.first_name,
departments.dept_name as "Department Name"
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no;



-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

select *
from employees
where first_name = 'Hercules' and last_name LIKE 'B%';


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employees.emp_no as "Employee Number", titles.title, departments.dept_name as "Department",
employees.first_name as "First Name", employees.last_name as "Last Name"
from employees
INNER JOIN dept_emp on employees.emp_no = dept_emp.emp_no
INNER JOIN departments on dept_emp.dept_no = departments.dept_no 
INNER JOIN titles on employees.emp_no = titles.emp_no
where departments.dept_name LIKE '%Sales%';
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no as "Employee Number", departments.dept_name as "Department",
employees.first_name as "First Name", employees.last_name as "Last Name"
from employees
INNER JOIN dept_emp on employees.emp_no = dept_emp.emp_no
INNER JOIN departments on dept_emp.dept_no = departments.dept_no 
INNER JOIN titles on employees.emp_no = titles.emp_no
where departments.dept_name LIKE '%Sales%' or departments.dept_name LIKE 'Devlopment';
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name)
from employees
group by last_name
order by 2 DESC;