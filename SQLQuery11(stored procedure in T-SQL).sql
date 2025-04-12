--What is stored procedure in T-SQL?
--answer:A stored procedure is a group of SQL statements that are created and stored in a database management system,
--allowing multiple users and programs to share and reuse the procedure. 
--A stored procedure can accept input parameters, 
--perform the defined operations, and return multiple output values.


-----Create Stored Procedure in T-SQL.----

-- Parameterized Stored Procedure in T-SQL.?
--ANSWER: In SQL, a parameterized procedure is a type of stored procedure that can accept input parameters. 
--These parameters can be used to customize the behavior of the procedure and perform operations based on the input
--values provided.
use EMP_DEPT_DB;
go

CREATE PROCEDURE proc_allEmployeeDetails
AS
BEGIN
SELECT*FROM employee;
END;
GO

EXECUTE proc_allEmployeeDetails;
SELECT *FROM employee;
EXECUTE DBO.proc_allEmployeeDetails;
go
SELECT *FROM department;
go


CREATE PROCEDURE 
proc_employeeDetailsLocationWise(@location as varchar(100))
as
begin
select*from employee e inner join department d
on e.emp_deptId=d.dept_id
where dept_location=@location;
end;
go

SELECT *FROM employee E
INNER JOIN DEPARTMENT D
ON E.emp_deptId=D.dept_id
WHERE dept_location='MUMBAI';

execute proc_employeeDetailsLocationWise @location='mumbai';
execute proc_employeeDetailsLocationWise @location='new york';

---------ALTER(modify) a Stored Procedure in T-SQL---------

Alter PROCEDURE proc_allEmployeeDetails
AS
BEGIN
select e.emp_name,e.emp_salary,d.dept_location
from employee e inner join department d
on e.emp_deptId=d.dept_id;
END;
go
execute proc_allEmployeeDetails;
go
execute proc_employeeDetailsLocationWise @location='new york';

-------Rename a Stored Procedure in T-SQL--------

--to rename the existing stored procedure ,we need to use system procedure (SYNATX:"sp_rename")
-- execute sp_rename'company_DB.proc_allEmployeeDetails','proc_displayEmployeeDetails';
--DRWABACKS(OR LIMITAIONS): A. renaming a stored procedure does not change the name of the corresponding object name in the defintion language of the 
--sys.sql_modules catlog view.to do that ,you muuts drop and re-create the stored procedure with its new name.
--B. Changing the name or defintion of a procedure can cause dependant objects to fail when the objects are not 
--updated to reflect the changes that have been made to the procedure.

execute sp_rename 'proc_allEmployeeDetails','proc_displayEmployeeDetails';

select * from sys.sql_modules;

CREATE PROCEDURE proc_displayEmployeeDetails
AS
BEGIN
select e.emp_name,e.emp_salary,d.dept_location
from employee e inner join department d
on e.emp_deptId=d.dept_id;
END;

select * from sys.sql_modules;