use employeeDB;
select * from employee_info;
create database sample_emp_db;
drop table sample_emp_db;
use sample_emp_db;
select * into emp_details from employeeDB.dbo.employee_info;
select*from emp_details;


