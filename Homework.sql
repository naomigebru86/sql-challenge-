
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
