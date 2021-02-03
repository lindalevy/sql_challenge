--create view 2 for Bonus exercise
CREATE VIEW emp_sal_title AS
SELECT e.emp_no, t.title, s.salary
FROM employee AS e
JOIN
	titles as t
	ON (t.title_id=e.emp_title)
JOIN
	salary as s
	ON (e.emp_no=s.emp_no)
ORDER BY s.salary DESC;
	
SELECT * from emp_sal_title;