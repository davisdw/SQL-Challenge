--Test tables if exists
	DROP TABLE IF EXISTS employee;
	DROP TABLE IF EXISTS job_title;
	DROP TABLE IF EXISTS salaries;
	DROP TABLE IF EXISTS department;
	DROP TABLE IF EXISTS dept_emp;
	DROP TABLE IF EXISTS dept_mgr;
	

--create employee table
	
	CREATE TABLE employee(
					  emp_no INT PRIMARY KEY NOT NULL,
					  emp_title_id VARCHAR(5) NOT NULL, 
					  birth_date VARCHAR(255) NOT NULL,
					  first_name VARCHAR(255),
					  last_name VARCHAR(255),
					  sex CHAR NOT NULL,
					  hire_date DATE NOT NULL
					  );
					  
					  
	SELECT * FROM employee

					  
--Section where insert the live data into this query schema

--Create Job Title, Salaries Department tables

	CREATE TABLE salaries(
					emp_no INT PRIMARY KEY,
					salary MONEY,
					FOREIGN KEY(emp_no) REFERENCES employee(emp_no)
					);
	
	SELECT * FROM salaries
	
	
	CREATE TABLE job_title(
					  title_id VARCHAR(5) NOT NULL,
					  title VARCHAR(30),
					  PRIMARY KEY (title_id)
					  );
					  
	SELECT * FROM job_title
					
	CREATE TABLE department(
					dept_no VARCHAR(4) NOT NULL,
					dept_name VARCHAR(50) NOT NULL,
					PRIMARY KEY(dept_no)
					);
					
	SELECT * FROM department
	
--Create junction tables Department_Employees and Department_Managers

	CREATE TABLE dept_emp(
				  emp_no INT NOT NULL,
				  dept_no VARCHAR(4) NOT NULL,
				  FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
				  FOREIGN KEY (dept_no) REFERENCES department(dept_no)
				  );
				  
	SELECT * FROM dept_emp
	
	CREATE TABLE dept_mgr(
				 dept_no VARCHAR(4) NOT NULL,
		 		 emp_no INT NOT NULL,
				 FOREIGN KEY (dept_no) REFERENCES department(dept_no),
				 FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
				 );
	
	SELECT * FROM dept_mgr
