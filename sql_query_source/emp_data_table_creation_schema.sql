--Creating tables and importing csv data files

--List the employee number, last name, first name, sex, and salary of each employee.
	SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
	FROM employee AS e
	JOIN salaries AS s
	ON (e.emp_no = s.emp_no)
	LIMIT(50)

--List the first name, last name, and hire date for the employees who were hired in 1986.
	SELECT e.first_name, e.last_name, e.hire_date
	FROM employee e
	WHERE DATE_PART('year', e.hire_date) = 1986

/*
----
List the manager of each department along with their department number, 
department name, employee number, last name, and first name.
----
*/
SELECT  dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_mgr dm
JOIN department d
	ON(dm.dept_no = d.dept_no)
JOIN employee e
	ON(dm.emp_no = e.emp_no)
LIMIT(50)


/**	List the department number for each employee along with that employee’s employee number, 
last name, first name, and department name.
	Will Need Following Tables:
	--department
	--employee
	--dept_emp
**/
SELECT  de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employee e
	ON(de.emp_no = e.emp_no)
JOIN department d
 ON(d.dept_no = de.dept_no)
 LIMIT(50)
 
 
 /***	List first name, last name, and sex of each employee whose 
   first name is Hercules and whose last name begins with the letter B.
 ***/
 SELECT e.first_name, e.last_name, e.sex
 FROM employee e
 WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%'

/***	List each employee in the Sales department, 
including their employee number, last name, and first name.
***/
SELECT  d.dept_name, de.emp_no, e.last_name, e.first_name
FROM dept_emp de
JOIN employee e
	ON(de.emp_no = e.emp_no)
JOIN department d
 ON(d.dept_no = de.dept_no)
WHERE d.dept_name = 'Sales'
LIMIT(50)

/***  List each employee in the Sales and Development departments, 
including their employee number, last name, first name, and department name.
***/
SELECT   de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employee e
	ON(de.emp_no = e.emp_no)
JOIN department d
 ON(d.dept_no = de.dept_no)
WHERE d.dept_name IN ('Sales', 'Development')
LIMIT(50)

/***  List the frequency counts, in descending order, 
of all the employee last names (that is, how many employees share each last name).
***/
SELECT e.last_name, COUNT(e.last_name) AS frequent
FROM employee e
GROUP BY e.last_name
ORDER BY frequent DESC


