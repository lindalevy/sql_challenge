CREATE TABLE dept(
	dept_no VARCHAR (4) Not NULL,
	dept_name VARCHAR (25) NOT NULL,
	PRIMARY KEY (dept_no),
)
--titles masterfile
CREATE TABLE titles(
	title_ref INT,
	Title VARCHAR (30) NOT NULL,	
	PRIMARY KEY (title_ref)
);
CREATE TABLE employee(
	emp_no INT,
	emp_title VARCHAR (5) Not NULL,
	birth_date DATE,
	first_name VARCHAR (20) Not Null,
	last_name VARCHAR (20) NOT NULL,
	sex VARCHAR (1),        
	hire_date DATE,
	PRIMARY KEY (emp_no),
	check(sex in ('M', 'F', ' ')),
	FOREIGN KEY (emp_title) REFERENCES titles (title_ref)
);
--which department is an employee in, multiple records per employee can exist
CREATE TABLE dept_emp(
	id SERIAL PRIMARY KEY,	
	emp_no INT,
	dept_no VARCHAR (4) Not NULL,
	FOREIGN KEY (emp_no) REFERENCES employee (emp_no),
	FOREIGN KEY (dept_no) REFERENCES dept (dept_no)
);
--which employee manages a department, multiple records per department can exist
CREATE TABLE dept_manager(
	id SERIAL PRIMARY KEY,
	emp_no INT,
	dept_no VARCHAR (4) Not NULL,
	FOREIGN KEY (emp_no) REFERENCES employee (emp_no),
	FOREIGN KEY (dept_no) REFERENCES dept (dept_no)
);
--what salary does an employee earn, single record per employee
CREATE TABLE salary(
	id SERIAL PRIMARY KEY,
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employee (emp_no)
);



