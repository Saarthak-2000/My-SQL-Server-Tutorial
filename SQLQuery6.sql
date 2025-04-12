use employeeDB;
create table emp_details(id int, name varchar(10));
--drop table emp_details;
select *from emp_details;
alter table emp_details add salary decimal;
insert into emp_details values(1,'ishwar',25000);
alter table emp_details add phone varchar(10) null;
alter table emp_details add project_completed int not null default 5;
alter table emp_details add projectId integer null
constraint pId_unique_key unique;

select *from emp_details;

insert into emp_details values(2,'steve',50000,'7894561230',default ,4);
create table company_info(id int);
alter table company_info
add revenue decimal(10,2) null,
projectId integer constraint projId_pk primary key;
--drop table company_info;
select *from company_info;

select * into employee_info_BKCP from employeeDB.dbo.employee_info;

select * into employee_details_BKCP from employeeDB.dbo.emp_details;

select * into company_info_BKCP from employeeDB.dbo.company_info;

select *from employee_info;
alter table employee_info drop column deptId;
--drop table employee_info;
select * from emp_details;
alter table emp_details drop constraint pId_unique_key;

select * from company_info;
alter table company_info drop constraint projId_pk,
column revenue,pojectId;

