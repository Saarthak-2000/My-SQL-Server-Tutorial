/*
          --TRIGGER--
A trigger is a type of stored procedure,that automatically runs when an event occurs in the database server.

TYPES
1. DDL Trigger: DDL trigger is fired when DDl statements like Drop Table, Create Table or Alter Table occurs.DDL Triggers are always After Triggers.

2. DML Trigger: We can create Trigger on DMl statements(like INSERT, UPDATE and DELETE) and Stored Procedures. DML Triggers are three types.
 A triggeer is type of stored procedure, that automatically runs when an events occurs in the databaseserver.
Here, events are DML operations (INSERT, DELETE, UPDATE).

1. After triggers: 
These triggers executes after the action of the INSERT, UPDATE, MERGE or DELETE statement is performed.

--2. INSTEAD of Triggers: 
     A. These triggers overrides the standard actions of the triggering statements.
     B. It can be used to perform error / value checking on one or more columns.
     C. These triggers perform additional actions before insert, updating or deleting the row or rows.


--3. CLR Triggers
   A. It can be either an AFTER / INSTEAD OF Trigger.
   B. It can also be a DDL trigger.

--Magic Tables: SQl Sever automatically creates and manages magic tables.DML trigger statements use two magic tables.
1.     Inserted Table: This table tores copies of the affected rows during INSERT and UPDATE statements. During these transactions, new rows are added to both the inserted table and the trigger table.

2.     Deleted Table: This table copies of the affected rows during DELETE and UPDATE statements. During the execution of these statements, rows are deleted from the trigger table and stored into the deleted table.

--Example: Create a trigger when new employee added to employee table
*/

use EMP_DEPT_DB;
go

select * from employee;

CREATE TRIGGER tr_message
ON employee
AFTER INSERT 
AS 
BEGIN 
Print 'Welcome to our Company..!';
end;

insert into employee values(1007,'Rahul',50000,'D3');

select * from employee;


select * from employeeLogs;

CREATE TABLE employeeLogs
(id int,name varchar(255),salary decimal,deptid varchar(255),
modifiedBy varchar(255),modifiedOn date);

Create Trigger tr_employee_after_insert
ON employee
AFTER INSERT
AS 
BEGIN 
insert into employeeLogs
select emp_id,emp_name,emp_salary,emp_deptId,'ishwar',getdate()
from inserted
end;

insert into employee values(1008,'mike',45000,'D2');


Create Trigger tr_employee_after_update
ON employee
AFTER UPDATE
AS 
BEGIN 
insert into employeeLogs
select emp_id,emp_name,emp_salary,emp_deptId,'ishwar',getdate()
from inserted
end;

update employee set emp_salary=80000 where emp_id=1007;
select * from employeeLogs;


Create Trigger tr_employee_after_delete
ON employee
AFTER DELETE
AS 
BEGIN 
insert into employeeLogs
select emp_id,emp_name,emp_salary,emp_deptId,'ishwar',getdate()
from deleted;
end;

delete from employee where emp_name='mike';
select * from employee;
select * from employeeLogs;

CREATE or AlTER TRIGGER tr_employee_allDMLOperations
ON employee
AFTER INSERT,DELETE,UPDATE
AS
BEGIN
--INSERT
	IF exists(select * from inserted) AND not EXISTS(select * from deleted)
		INSERT INTO employeeLogs
		select emp_id,emp_name,emp_salary,emp_id,'ISHWAR',GETDATE()
        from deleted


--UPDATE
    ELSE IF exists(select * from inserted) AND not EXISTS(select * from deleted)
		INSERT INTO employeeLogs
		select emp_id,emp_name,emp_salary,emp_id,'ISHWAR',GETDATE()
        from  deleted

--DELETE
    ELSE IF exists(select * from deleted) AND not EXISTS(select * from inserted)
		INSERT INTO employeeLogs
		select emp_id,emp_name,emp_salary,emp_id,'ISHWAR',GETDATE()
        from deleted


else 
begin 
Print 'Nothing changed...'
return
end

END

select * from employee;
select * from employeeLogs;
insert into employee values(1010,'SATISH',50000,'d3')

update employee set emp_salary=90000 where emp_id=1008

delete from employee where emp_name='steve';
/*
              --DDL TRIGGER--
DDL trigger file in response to a different DDL events correspond to SQL statements such as CREATE, ALTER, DROP, GRANT, REVOKE, etc. 
Also, some system stored procedures that perform DDL-like operations(for example,sp_rename) can also fire DDL triggers.

DDL events Reference:https://learn.microsoft.com/en-us/sql/relational-databases/triggers/ddl-events?view=sql-server-ver16
*/
--WHY DDL trigger?
---prevent certain changes to your database schema.
--Have something occur in the database in response to change in your database schema.
--Record changes or events in database schema.
--Example: Create a trigger when new table is created in a database.

CREATE or ALTER TRIGGER tr_onTableCreate
ON DATABASE
FOR CREATE_TABLE,DROP_TABLE
AS 
BEGIN
PRINT 'New table is created or dropped succesfully';
END

CREATE TABLE sampleTable(id int,name varchar(20));
DROP TABLE sampleTable;

/*
EVENTDATA()
--its a built-in function
--it returns the information about the events executed the DDL trigger.
--the information is in XML format.
--EventType(Create Table,Alter Table,Drop Table,etc..)
--PostTime(Event trigger time)
--SPID(SQL Server session Id)
--ServerName(SQL Server instance name)
--LoginName(SQL Server Login name)
--UserName(username for login, by default dbo schema as username)
--DatabaseName(name of database where DDL Trigger was executed)
--SchemaName(schema name of table)
--ObjectName(name of the table)
--ObjectType(Objects type.such as Table,view,procedure,etc..)
--TSQLCommand(Schema deployement Query which is excuted by user)
--SetOptions(SET Option which are apllied while Creating table or Modify it)
--CommandText(create ,alter or ddrop object command)
*/
CREATE OR ALTER TRIGGER tr_TableRename
on DATABASE
FOR RENAME
AS
BEGIN
Print 'Table is renamed.';
end;

sp_rename 'newtemp','triggerdemo';



CREATE TABLE ddl_logs(
id int identity primary key,
event_data XML,
performed_by SYSNAME,
event_type VARCHAR(200)
);

CREATE OR ALTER TRIGGER tr_ddlEventTrigger
ON DATABASE
FOR CREATE_TABLE,RENAME,DROP_TABLE
AS
BEGIN
INSERT INTO ddl_logs(event_data,performed_by,event_type)
values(EVENTDATA(),USER,EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]','varchar(max)'));
end;

sp_rename 'triggerdemo','triggereventcapture';

--SELECT * INTO demo FROM triggerdemo;

CREATE TABLE demo(id int,value varchar(20));
SELECT * FROM ddl_logs;
drop table demo;



---MERGED staement --
--Merge is a logical combinatiion of an insert and an update.
--it combines the sequence of conditional INSERT,UPDATE and DELETE statements in a single statements.
--Uisng merge statement, you can sync two different tables so that the content of the largest table is modified based on the differences found in the source table.

/*Why Merge?
It is specially used to maintain a history of data warehousing during the ETL(Extract,Transform, Load)cycle.
Scenario:Suppose, tables need to be refershed peroidcally with new data arriving from online
transaction processing(OLTP) systems.This new data may contain changes to existing rows in tables and/or new rows that need to be inserted.
*/
/*
Actions/Conditions:
1. ROWS in the source table are not found in the target table.Then,rows from the source will be added to the target table.
2. Rows in the target table are not found in the source table.then, delete rows from the target table.
3.Rows in the source and target have the same keys,but, they have different values in the non-key columns. Then,update the rows in the target table with data from the source table.
*/
/*
SYNTAX:
merge targettable
using sourcetable
on join-conditions
when matched
then DML statement
when not matched by target
then DML statement
When not matched by source 
then DML statment;
*/
/*
STATES:
1. MATCHED: These are the rows that match the merge condition.For the matching rows you need to update the rows columns in the target table with values from the source table.
2. NOT MATCHED BY TARGET: These are the rows from the source table that does not have any matching rows in the target table.In this case, you need to add the rows from the source table to the target table.
3. NOT MATCHED BY SOURCE: These are the rows in the target table that does not match any rows in the source table.f you want to sychronize the target table with the data from the source table, 
then you will need to use this match condition to delete rows from the target table.
*/
/*
SYNTAX:
merge targettable
using sourcetable
on join-conditions
when matched
then update
when not matched by target
then insert
When not matched by source 
then delete
*/
CREATE TABLE flightPassengers
(
flightId INT IDENTITY PRIMARY KEY,
firstName VARCHAR(20) NOT NULL,
flightCode VARCHAR(20) NOT NULL,
flightDate Date not null,
seat VARCHAR(5)
);
INSERT INTO flightPassengers(firstName,flightCode,flightDate,seat)
VALUES('SMITH','SQL2022',GETDATE(),'7F'),
('ADAM','SQL2022',GETDATE(),'20A'),
('MIKE','SQL2022',GETDATE(),'4B');
--drop table flightPassengers


CREATE TABLE checkIn
(
flightId INT IDENTITY PRIMARY KEY,
firstName VARCHAR(20) NOT NULL,
flightCode VARCHAR(20) NOT NULL,
flightDate Date not null,
seat VARCHAR(5)
);
INSERT INTO checkIn(firstName,flightCode,flightDate,seat)
VALUES('SMITH','SQL2022',GETDATE(),'7F'),
('ADAM','SQL2022',GETDATE(),'2B'),
('MIKE','SQL2022',GETDATE(),'17A');


select * from flightPassengers;
select * from checkIn;

Merge flightPassengers F
using checkIn C
ON C.firstName=F.firstName
AND C.flightCode=F.flightCode
AND C.flightDate=F.flightDate
WHEN MATCHED
THEN UPDATE SET F.seat=C.seat
WHEN NOT MATCHED BY TARGET
THEN INSERT(firstName,flightCode,flightDate,seat)
VALUES(firstName,flightCode,flightDate,seat)
WHEN NOT MATCHED BY SOURCE
THEN DELETE;






