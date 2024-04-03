CREATE TABLE employee_salary_info AS
SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

CREATE TABLE employee_1986_info AS
SELECT 
	e.first_name, 
	e.last_name, 
	e.hire_date
FROM employees e
WHERE hire_date LIKE '%/1986';

CREATE TABLE employee_managers_info AS
SELECT 
    d.dept_no,
    d.dept_name,
    dm.emp_no AS manager_employee_number,
    e.last_name,
    e.first_name
FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

CREATE TABLE employee_department_info AS
SELECT
	de.dept_no AS department_number,
	de.emp_no AS employee_number,
	e.last_name,
	e.first_name,
	d.dept_name AS department_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

CREATE TABLE hercules_B AS
SELECT
	first_name, 
	last_name,
	sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

CREATE TABLE sales_dept AS
SELECT 
	e.emp_no,
	d.dept_name,
	e.last_name, 
	e.first_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

CREATE TABLE sales_and_dev AS
SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

CREATE TABLE last_name_count AS
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

SELECT * FROM employee_salary_info
SELECT * FROM employee_1986_info
SELECT * FROM employee_managers_info
SELECT * FROM employee_department_info
SELECT * FROM hercules_B
SELECT * FROM sales_dept
SELECT * FROM sales_and_dev
SELECT * FROM last_name_count