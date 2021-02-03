--hire and birth date both contains mixed formats, so they were imported as varchar
-- change them here to date format

ALTER TABLE employee
ALTER COLUMN hire_date SET DATA TYPE date
	USING to_date(hire_date, 'mm/dd/yyyy');
	
ALTER TABLE employee
ALTER COLUMN birth_date SET DATA TYPE date
	USING to_date(birth_date, 'mm/dd/yyyy');
select * FROM employee
LIMIT 20	

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employee AS e
JOIN
	salary as s
	ON (e.emp_no=s.emp_no);
	
	
	
-- List first name, last name, and hire date for employees who were hired in 1986

SELECT first_name, last_name, hire_date
FROM employee
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


--create view 1
CREATE VIEW emp_dept_view AS
SELECT de.dept_no, d.dept_name, de.emp_no, e.last_name, e.first_name
FROM employee AS e
JOIN
	dept_emp as de
	ON (e.emp_no=de.emp_no)
JOIN
	dept as d
	ON (de.dept_no=d.dept_no);
	
--List the manager of each department with: department number, department name, the manager's employee number, last name, first name.
SELECT dept_no, dept_name, emp_no, last_name, first_name
FROM emp_dept_view;	
	
-- List the department of each employee with: employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM emp_dept_view;	

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employee
WHERE first_name= 'Hercules'
AND last_name LIKE 'B%';


--List all employees in the Sales department, incl. employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM emp_dept_view
WHERE dept_name = 'Sales';


--List all employees in the Sales and Development departments, incl. employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM emp_dept_view
WHERE dept_name = 'Sales'
OR dept_name = 'Development';


--In desc order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT
	last_name, COUNT(last_name) AS "Frequency"
	FROM employee
	GROUP BY last_name
	ORDER BY "Frequency" DESC;
	

