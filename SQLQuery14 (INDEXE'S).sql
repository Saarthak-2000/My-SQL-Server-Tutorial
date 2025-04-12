/* 
INDEX
In general,index is used to measure the performance
Database sysytems uses indices to provide fast access to relational data
it is a special type of physical data structure used to access one or more data rows fast.
Database index can exchange each time the corresponding data is changed.
*/
/*
Differences of INDEX:
1.BOOK INDEX : 
A book reader can decide whether or not use the book index
A particular book index is edited together with th book and does not change at all. this means that you can find a topic exactly on the page where it is determined in the index

2. Database Index:
the system compoent callled the query optimizer decides whether or not to use an existing index
A datebase index can change each time the corresponding data is changed.

*/
/* EXAMPLE:
Q . Find employee names whose salary is greater than 50000.
Solution:    select * from employee where salary>50000;

SYNTAX: CREATE INEX IDX_EMPLOYEE_SALARY ON EMPLOYEE(SALARY ASC);
*/
CREATE TABLE employee
(ID INT ,
NAME VARCHAR (50),
SALARY DECIMAL,
LOCATION VARCHAR(50));
 insert into employee values(1003,'SMITH',65000,'USA'),
 (1001,'JAMES',30000,'INDIA'),
 (1002,'MIKE',48000,'INDIA'),
 (1004,'JOHN',55000,'USA');

 SELECT * FROM EMPLOYEE;

 drop TABLE employee
 CREATE INDEX IDX_EMPLOYEE_SALARY
 ON EMPLOYEE (SALARY ASC);

 SELECT * FROM EMPLOYEE WHERE SALARY>50000;


 /*
 CLUSTERED INDEX:
 A clustered index determines the physical order of the data in a table . Hence, a table can
 have only one clustered index.
 When a clustered index is created , the database engine sorts the data in the table based on thee defined index keys and stores the table in that order.
 Example, a telephone book.  A telephone book is always in sorted order, based on the last name of the individula followed by the first name.
 The sorted order makes it easy to find the phone number of the person you are looking for.

 A primary key constraint creates clustered index automatically if there is no clustered exists on the table
 An index can contain multiple columns, known as composite index (we will see this in later video).
 Syntax:
 CREATE CLUSTERED INDEX index_name on Table_name(column_name <ASC | DESC>);
 CREATE CLUSTERED INDEX idx_employee_name on employee(name ASSC);
 */

 select * from employee;

 create clustered index idx_employee_name
 on employee(name asc);

 create clustered index idx_employee_loc
 on employee(id desc,location asc);
  select * from employee;

/*
NON-CLUSTER INDEX
A non-cluster index does not change the physical order of the rows in the table.
In other (simple )words, A non cluster index is similar to an index in a textbook.The data is stored in one place,the index in another place.
The index will have pointer to the storage location of the data.
Since, the inndex is stored seperately from the actual data, a table can have more than one nonclustered index.
SYNTAX:
CREATE NONCLUSTERED INDEX index_name
ON table_name<ASC |DESC>);
CREATE NONCLUSTERED INDEX idx_employee_name
ON employee(name ASC);

*/

select * from employee;
CREATE NONCLUSTERED INDEX idx_employee_name
ON employee(NAME ASC);

select*from employee where name='mike';

/*
Unique Index
A unique index ensures that the index key contains no duplicates values
there are no differences betwwen creating a UNIQUE constraint and creating a unique index.
Creating a unique constraint on the column makes the purpose of the index clear.

Implementaion:
1. Primary Key: when you create a primary key constraint , a unique clustered index on the column or columns is automatically.
2. Unique constraint: when you create a UNIQUE constarint, a unique nonclustered index is created to enforce a UNIQUE constraint by default.
3. Index independent of constarint: Multiple unique nonclustered indexes can be defined on a table.
SYNTAX:
create unique nonclustered index index_name
on table_name(column_name);
create unique nonclustered index
idx_employee_id on employee(id);
*/

CREATE TABLE department(
did int primary key,
dname varchar(50),
dloc varchar(50)
);

INSERT INTO department VALUES(2,'SALES','MUMBAI'),(1,'ACCOUNTS','PUNE');
select * from department;

ALTER TABLE department
ADD CONSTRAINT UQ_department_dname
UNIQUE(dname);

CREATE UNIQUE NONCLUSTERED INDEX idx_department_dloc
on department(dloc);

ALTER TABLE department
ADD CONSTRAINT UQ_department_did  ---UQ_department_dname table mai key ,indexes  both table  delete
UNIQUE(did);


