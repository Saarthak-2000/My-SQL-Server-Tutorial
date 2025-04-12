/*
VIEW:
A view is virtual table whose contents are defined by a query.
A view does not require any storage in a database.
It is Saved Query.It acts as afilter on the tables referenced in the view query.
THE main use case of a view to maintain the security at row and column level.
SYNTAX:
CREATE VIEW view_name 
AS [simple select query] | [join query];

CREATE VIEW v_employeeDetails
AS select empName,empSalary,loc FROM employee;
*/
use COMPANY_DB
go

SELECT * FROM employee;
SELECT * FROM department;
--display employee name & salary
select name,salary from employee;

--dislpay employee details whose department is sales

SELECT name, salary, location, dname
FROM employee e
INNER JOIN department d ON e.deptid = d.did
WHERE d.dname = 'sales';


/*ALTER TABLE employee ADD deptid INT;

-- Example update to assign departments
UPDATE employee SET deptid = 2 WHERE name = 'JOHN'; -- Sales
UPDATE employee SET deptid = 2 WHERE name = 'SMITH'; -- Sales
UPDATE employee SET deptid = 1 WHERE name = 'MIKE'; -- Accounts
UPDATE employee SET deptid = 1 WHERE name = 'JAMES'; -- Accounts
*/
CREATE VIEW v_EmpNameSalary
AS select name,salary from employee;

select *from v_EmpNameSalary;

create view v_EmpDetailsWithDeptName
AS select name,salary,location,dname 
from employee e inner join department d
on e.deptid=d.did where d.dname='sales';
select * from v_EmpDetailsWithDeptName;

--dislpay employee details withou salary
SELECT name, location, dname
FROM employee e
INNER JOIN department d ON e.deptid = d.did; 

Create view v_EmployeePublicData
AS SELECT name, location, dname
FROM employee e
INNER JOIN department d ON e.deptid = d.did; 

select * from v_EmployeePublicData;

--dsiplay employee who works for india only
select*from employee where location='india';

create view v_EmpWorksForIndia
AS select*from employee where location='india';

select * from v_EmpWorksForIndia;

sp_helptext v_EmpWorksForIndia



