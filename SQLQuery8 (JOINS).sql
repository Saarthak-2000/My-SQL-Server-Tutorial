USE EMP_DEPT_DB;
-- Create the DEPARTMENT table
CREATE TABLE department (
    dept_id VARCHAR(10) , 
    dept_name VARCHAR(50), 
    dept_location VARCHAR(50)
);
--DROP TABLE DEPARTMENT;
-- Create the EMPLOYEE table
CREATE TABLE employee (
    emp_id INT PRIMARY KEY, 
    emp_name VARCHAR(50), 
    emp_salary DECIMAL(10, 2), 
    emp_deptId VARCHAR(10),
    --FOREIGN KEY (emp_deptId) REFERENCES department(dept_id)
);
--DROP TABLE employee;
-- Insert sample data into DEPARTMENT table
INSERT INTO department (dept_id, dept_name, dept_location) VALUES 
('D1', 'DEVELOPMENT', 'CALIFORNIA'),
('D2', 'MARKETING', 'MUMBAI'),
('D3', 'ACCOUNTS', 'NEW YORK'),
('D4', 'MANAGEMENT', 'SYDNEY');

-- Insert sample data into EMPLOYEE table
INSERT INTO employee (emp_id, emp_name, emp_salary, emp_deptId) VALUES 
(1111, 'STEVE', 35000, 'D1'),
(1112, 'ADAM', 28000, 'D2'),
(1113, 'JOHN', 50000, 'D3'),
(1114, 'MIKE', 45000, 'D2'),
(1115, 'PETER', 60000, 'D5');  -- This department ID does not exist in the department table

-- Verify data
SELECT * FROM department;
SELECT * FROM employee;
-- INNER Join to get EMPLOYEE_RECORD table format
SELECT E.emp_id, E.emp_name, E.emp_salary, D.dept_name, D.dept_location 
FROM employee E 
INNER JOIN department D 
ON E.emp_deptId = D.dept_id;

-- Left Join to get EMPLOYEE_RECORD table format
SELECT E.emp_id, E.emp_name, E.emp_salary, D.dept_name, D.dept_location 
FROM employee E 
LEFT JOIN department D 
ON E.emp_deptId = D.dept_id;

-- RIGHT OUTER Join to get EMPLOYEE_RECORD table format
SELECT E.emp_id, E.emp_name, E.emp_salary, D.dept_name, D.dept_location 
FROM employee E 
RIGHT OUTER JOIN department D 
ON E.emp_deptId = D.dept_id;

SELECT E.emp_id, E.emp_name, E.emp_salary, D.dept_name, D.dept_location 
FROM department D
RIGHT OUTER JOIN employee E
ON E.emp_deptId = D.dept_id; -- DEPT & EMP NAMES SWITCHED TOH YEH APNA HOGAYA LEFTF OUTER JOIN BOTH RESULT SAME.


-- FULL OUTER JOIN to get EMPLOYEE_RECORD table format
SELECT E.emp_id, E.emp_name, E.emp_salary, D.dept_name, D.dept_location 
FROM employee E 
FULL OUTER JOIN department D 
ON E.emp_deptId = D.dept_id;

SELECT E.emp_id, E.emp_name, E.emp_salary, D.dept_name, D.dept_location 
FROM department D 
FULL OUTER JOIN employee E 
ON E.emp_deptId = D.dept_id;-- DEPT & EMP NAMES SWITCHED, TOH YEH APNA HOGAYA FULL OUTER JOIN BOTH RESULT SAME.

--dispaly name,salarY of employer whose salary is greater than mike salary..
SELECT EMP_NAME,EMP_SALARY
FROM EMPLOYEE WHERE EMP_SALARY > (select emp_salary from EMPLOYEE WHERE EMP_NAME='MIKE');

--dispaly name,salarY of employer whose salary is greater than ADAM salary AND DEPT_NO SAME AS ADAM DEPT_NO..
-- AND DEPT_nO SAME AS ADAM;S DEPTno..
SELECT EMP_NAME,EMP_SALARY FROM EMPLOYEE 
WHERE EMP_SALARY > (select emp_salary from EMPLOYEE WHERE EMP_NAME='ADAM')
AND emp_deptId=(select emp_deptId from EMPLOYEE WHERE EMP_NAME='ADAM');


-- DISPLAY THE EMPLOYEE INFORMATION WHOSE DEPARTMENT IS LOCATED AT NEW YORK..
select emp_id , emp_name , emp_salary , dept_name , dept_location from employee inner join department on employee.emp_deptid = department.dept_id
where dept_id in (select dept_id from department where dept_location = 'New york');

--select * from employee where emp_deptid=(select dept_id from department where dept_location ='New York');

--select dept_name,dept_location from department where dept_name =(select dept_name from department where dept_location ='new york');
