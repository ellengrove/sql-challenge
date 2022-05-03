-- titles.csv
CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARCHAR(20) NOT NULL);

-- employees.csv
CREATE TABLE employees (
	emp_no VARCHAR(6) PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id));

-- salaries.csv
CREATE TABLE salaries (
	emp_no VARCHAR(6) PRIMARY KEY NOT NULL,
	salary FLOAT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

-- dept_emp.csv
-- TO FIX: can't have multiple primary keys
-- COMPOSITE KEY WON'T WORK EITHER
CREATE TABLE dept_emp (
	emp_no VARCHAR(6) PRIMARY KEY NOT NULL,
	dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

-- dept_manager.csv
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	emp_no VARCHAR(6) PRIMARY KEY NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES dept_emp(dept_no));

-- departments.csv
CREATE TABLE departments (
	dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(20) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES dept_emp(dept_no));
	