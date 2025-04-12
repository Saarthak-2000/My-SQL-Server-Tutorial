--create database employeeDB;
use employeeDB;
create table employee_info
( empID integer primary key,
  empName varchar(20) not null,
  empSalary decimal(10,2) not null,
  job varchar(50),
  phone varchar(50),
  deptId integer 
);
--drop table employee_info;
SELECT * FROM dbo.employee_info; 
create table department_info
(
deptId integer not null,
deptname varchar(20) not null,
deptLocation varchar(50)
);
--drop table department_info;
INSERT INTO employee_info VALUES
(1, 'ADAM', 25000.00, 'jr.developer','9875649456', 10);
INSERT INTO employee_info VALUES
(3, 'Brian', 32000.00, 'Accountant','7894651230', 10);
INSERT INTO employee_info VALUES
(6, 'Mike', 25000.00, 'Marketing','9567894123', 30);
INSERT INTO employee_info VALUES
(4, 'James', 25000.00, 'SDE','9875649478', 40);
INSERT INTO employee_info VALUES
(5, 'KARNA', 25000.00, 'DA','9875649231', 60);






INSERT INTO employee_info(empId,empName,empSalary)
VALUES(02,'Smith',98000);


select * from employee_info;

select * from dbo.employee_info;

select empName,empSalary from employee_info;

update employee_info
set empSalary = empSalary +1000;
select * from employee_info;

update employee_info
set job='Tester'
--where empID=2;
where empName='Smith';

update employee_info
set phone='7894561230',deptId=20
where empID=2;


select * from employee_info;
delete from employee_info
where deptId=10;

delete from employee_info;

select * from employee_info order by empSalary DESC;

select empName from employee_info
order by empName DESC;

select * from employee_info where deptId=10;

select * from employee_info where job='sde';

select empName,empSalary from employee_info where job='sde';

update employee_info set empSalary=empSalary+5000
where deptId=20;
select *from employee_info;

delete from employee_info
where deptId=30;  --delete in dept_id from employee_info
select *from employee_info;


select sum(empSalary)from employee_info;
select avg(empSalary)from employee_info;
select max(empSalary)from employee_info;
select min(empSalary)from employee_info;
select count(empName)from employee_info;
select count(job)from employee_info;

select *from employee_info where empSalary=max(empSalary);
--An aggregate may not appear in the WHERE clause unless it is 
--in a subquery contained in a HAVING clause or a select list,
--and the column being aggregated is an outer reference.
INSERT INTO employee_info(empId,empName,empSalary) VALUES(06,'Janhavi',18000);
select *from employee_info;

select ABS(-10);
select CEILING(76.12);
select FLOOR(76.12);
select sign(15),sign(-10),sign(0);
select square(5),sqrt(81), pi(),cos(30),sin(91),tan(45);
select exp(2);
select empName,len(empName) from employee_info; 

select upper('this is a statement');--every statment in a captial letters

select empName,lower(empName) from employee_info;

select LTRIM('     anystring'),RTRIM('anystring          ');--spacing remove left &right trim

select substring('microsoft',6,9)

select replace('microsoft','micro','major');
select replicate('dummy   ',5);





/* create table employee_info
( empID integer primary key,
  empName varchar(20) not null,
  empSalary decimal(10,2) not null,
  job varchar(50),
  phone varchar(50),
  deptId integer 
);*/
select*from employee_info;
select deptId from employee_info Group by deptId;
select sum(empSalary) from employee_info Group by deptId;

select deptId,sum(empSalary)as 'total salary' from employee_info Group by deptId;
select deptId,min(empSalary)as 'min salary' from employee_info Group by deptId;
select deptId,avg(empSalary)as 'avg salary' from employee_info Group by deptId;

SELECT deptId, ROUND(AVG(empSalary), 2) AS 'avg salary'
FROM employee_info
WHERE deptId IS NOT NULL
GROUP BY deptId;

SELECT deptId, CAST(ROUND(AVG(empSalary), 2) AS DECIMAL(10, 2)) AS 'avg salary'
FROM employee_info
GROUP BY deptId;

select * from employee_info;
select deptId,sum(empSalary)as 'Total Salary'from employee_info group by deptId;
select deptId,sum(empSalary)as 'Total Salary'from employee_info group by deptId having deptId=20;

select deptId,sum(empSalary)as 'Total Salary'from employee_info where deptId=20group by deptId;

select deptId,sum(empSalary)as 'Total Salary'from employee_info 
group by deptId where deptId=20; --where clause use karna group by se phle where ana chaiye

select deptId,sum(empSalary)as 'Total Salary'from employee_info group by deptId having sum(empSalary) between 10000 and 150000;


select empSalary from employee_info order by empSalary;

select top(3)empSalary from employee_info order by empSalary desc;

