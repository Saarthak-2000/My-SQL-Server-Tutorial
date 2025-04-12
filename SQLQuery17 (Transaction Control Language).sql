/*
Transaction Control Language
If a transaction is suucessfull, all of the data modifications made during the transactions are committed and become a permanent part of the database.
If a transaction encounters errors and must be canceled or rolled back,then all of the data modifications are erased.
-commit
-rollback
-save

SYNATX:
Begin Transaction;
SQL statements
COMMIT|ROLLBACK|SAVE

*/
CREATE TABLE sampleTable(id int);
insert into sampleTable values(1);
insert into sampleTable values(2);

select * from sampleTable;

Begin transaction;
insert into sampleTable values(3);
insert into sampleTable values(4);

ROLLBACK;


Begin transaction;
insert into sampleTable values(3);
insert into sampleTable values(4);

SAVE Transaction A;
insert into sampleTable values(5);
insert into sampleTable values(6);

SAVE Transaction B;

ROLLBACK TRANSACTION A;

select * from sampleTable;

COMMIT; --DATA nhi laa sakte wapis bcz commmit kardiya