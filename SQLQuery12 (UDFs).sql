-- User defined Function(UDFs)
--UDFs are routines that respect that accept parameters, perform an action (complex calculation), and
--return the result the result of that action as a value.The return value can be either be a single scalar
--value or a result set.
--Why UDFs
--1. Modular Prog.
--a.  create the function once,
--b.  store it in the database,and
--c.  call it any number of times in your program.
--2. Faster exceution
--a.  reduce the compilation cost of Transact-SQL code.
--.  (UDFs does not need to be reprased and reoptimized with each use resulting in much faster execution times.)


--3.  Reduce network traffic
--    function can be ivolved in the WHERE clause to reduce the number of rows sent to client.

--  TYPES

--1.  System = SQL server provides many system functions that you can use to perform a varity of operations.They cannot be modified.
--2.  Scalar = A function return a single dat value of the type defined in the RETURNS clause.
--3.  Table-valued = table-valued functions return a table data type.

--   Before creating a function , thing to know..
--User-defined function always returns a value.
-- User-defined functions have only input parameters for it.
-- User-defined functions can not return multiple results sets.
-- Error handling is restricted in a user-defined function.A UDF does not support TRY..CATCH, @ERROR or RAISERROR.
--Set statements are not allowed in a user -defined function.
--User-defined functions cannot call a stored procedure.
--User -defined function can be nested .user-defined functions can be nested up to 32 levels.

--- Example : Create a function to get employee salary by passing employee name.

select * from employee;
CREATE FUNCTION salary(@name as VARCHAR(50))
 RETURNS decimal
 BEGIN
 DECLARE @sal decimal;

 SELECT @sal=emp_salary from employee 
 WHERE emp_name=@name;
 RETURN @sal;
 END;

 SELECT dbo.salary('MIKE') as 'Employee Salary';

 --TABLE-VALUED FUNCTIONS
 -- User -defined table-valued functions return a table data type.
 -- a tabled-valued function accepts zero or more parameters.

 --TYPES
 --1. Inline Table-valued Function--
 --There is no function body (i.e. there is no need for a BEGIN-END block in Inline function)
 -- The table is the result set of a single SELECT statement.

 --EXAMPLE: Create a function to get employee information by passing employee salary.
 CREATE FUNCTION getAllEmployees(@salary decimal)
 returns TABLE
 AS
 RETURN
 SELECT*FROM employee WHERE emp_salary=@salary;





 SELECT*FROM dbo.getAllEmployees(80000);
 select*from employee;

 --2 Multi-satement Table-Valued Function--
 --It contains multiple SQL statements enclosed in BEGIN-END blocks.
 -- The return vlaue is declared as a table-variable.The RETURN statement is without a value and the declared table variable is reurned.

 --Example: Create a function to get list of employees by passing department id.

 CREATE FUNCTION getEmployees(@id varchar(50))
 RETURNS @result TABLE
 (ID int, NAME varchar(50),SALARY decimal, DEPTID varchar(50))
 AS
 BEGIN
 INSERT INTO @result
 SELECT*FROM employee WHERE emp_deptId=@id;
 RETURN
 END;

 SELECT* FROM getEmployees('d2');


 SELECT*FROM[dbo].[getAllEmployees](80000)