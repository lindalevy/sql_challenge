
CREATE TABLE dept(
	dept_no VARCHAR (4) Not NULL,
	dept_name VARCHAR (25) NOT NULL,
	PRIMARY KEY (dept_no)
);


--titles masterfile
CREATE TABLE titles(
	title_id VARCHAR (5),
	Title VARCHAR (30) NOT NULL,	
	PRIMARY KEY (title_id)
);

--employee masterfile, 1 record per employee
CREATE TABLE employee(
	emp_no INT,
	emp_title VARCHAR (5) NOT Null,
	birth_date VARCHAR (10),
	first_name VARCHAR (20) Not Null,
	last_name VARCHAR (20),
	sex VARCHAR (1),    
	hire_date VARCHAR (10),
	PRIMARY KEY (emp_no),
	check(sex in ('M', 'F', ' ')),
	FOREIGN KEY (emp_title) REFERENCES titles (title_id)
);

--which department is an employee in, multiple records per employee can exist
CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR (4),
	FOREIGN KEY (emp_no) REFERENCES employee (emp_no),
	FOREIGN KEY (dept_no) REFERENCES dept (dept_no)
);


--which employee manages a department, multiple records per department can exist
CREATE TABLE dept_manager(
	dept_no VARCHAR (4) Not NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee (emp_no),
	FOREIGN KEY (dept_no) REFERENCES dept (dept_no)
);



--what salary does an employee earn, single record per employee
CREATE TABLE salary(
	emp_no INT NOT NULL,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employee (emp_no)
);



