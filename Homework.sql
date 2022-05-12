
--  #1 List the following details of each employee: [employee number, last name, first name, sex] employees, and salary[salary].\
SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
INNER JOIN salary
ON salary.emp_no=employees.emp_no;
-- #2 List first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees 
WHERE EXTRACT(YEAR FROM hire_date)= '1986';
-- #3List the manager of each department with the following information: 
-- departments[department number, department name], manager[the manager's employee number], employes[last name, first name.]
SELECT manager.dept_no, dept_name, manager.emp_no,last_name, first_name
FROM manager
INNER JOIN dept_emp ON manager.emp_no=dept_emp.emp_no
INNER JOIN employees ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON departments.dept_no=manager.dept_no
-- #4 List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp on
employees.emp_no=dept_emp.emp_no
join departments on
departments.dept_no=dept_emp.dept_no;
--#5 List first name, last name, and sex for employees 
--whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name like 'Hercules' and last_name like 'B%';
--#6 List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp on
employees.emp_no=dept_emp.emp_no
join departments on
departments.dept_no=dept_emp.dept_no
where dept_name like 'Sales';


--#7 List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp on
employees.emp_no=dept_emp.emp_no
join departments on
departments.dept_no=dept_emp.dept_no
where dept_name like 'Sales' or dept_name like 'Development';


--#8 In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.
select last_name, count(last_name) as "Last name frequency"
from employees
group by last_name
order by "Last name frequency" desc;

