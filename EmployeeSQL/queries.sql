-- List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.
SELECT emp_no, last_name, first_name, sex, (
	SELECT salary
	FROM salaries
	WHERE employees.emp_no = salaries.emp_no)
FROM employees;

-- List first name, last name, and hire date
-- for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE 
	(hire_date >= '01/01/1986') AND
	(hire_date <= '12/31/1986')
;

-- List the manager of each department 
-- with the following information: department number, 
-- department name, the manager's employee number, 
-- last name, first name.
SELECT m.dept_no, d.dept_name, m.emp_no, e.first_name, e.last_name
FROM dept_manager m
LEFT JOIN departments d ON
	m.dept_no = d.dept_no
	LEFT JOIN employees e ON
		m.emp_no = e.emp_no
;


-- List the department of each employee 
-- with the following information: employee number, 
-- last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
LEFT JOIN departments d ON
	de.dept_no = d.dept_no
	LEFT JOIN employees e ON
		de.emp_no = e.emp_no;

	
-- List first name, last name, and sex for employees
-- whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE 
	first_name = 'Hercules' AND
	last_name LIKE 'B%'
;

-- List all employees in the Sales department, 
-- including their employee number, last name, 
-- first name, and department name.
CREATE VIEW sales As
	SELECT e.emp_no, e.dept_no, d.dept_name
	FROM dept_emp As e
	LEFT JOIN departments As d
		ON e.dept_no = d.dept_no
	WHERE 
		d.dept_name = 'Sales'
;

SELECT emp_no, last_name, first_name, (
	SELECT dept_name
	FROM sales
	WHERE employees.emp_no = sales.emp_no)
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM sales)
;

-- List all employees in the Sales and Development departments,
-- including their employee number, last name, first name,
-- and department name.
CREATE VIEW sales_dev As
	SELECT e.emp_no, e.dept_no, d.dept_name
	FROM dept_emp As e
	LEFT JOIN departments As d
		ON e.dept_no = d.dept_no
	WHERE 
		d.dept_name = 'Development' OR
		d.dept_name = 'Sales'
;

SELECT emp_no, last_name, first_name, (
	SELECT dept_name
	FROM sales_dev
	WHERE employees.emp_no = sales_dev.emp_no
	)
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM sales_dev)
;

-- List the frequency count of employee last names 
-- (i.e., how many employees share each last name) 
-- in descending order.
SELECT last_name, COUNT(last_name) As frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC, last_name;