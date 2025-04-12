create table tbl_user_login(
user_id int primary key identity,
username varchar(50) not null unique,
email varchar(50) not null unique,
password varchar(50) not null
);
--drop table tbl_user_login;
insert into tbl_user_login(username,email,password)values
('ironman','tony@stark.com','tony123'),
('captain','steve@captain.com','steve123'),
('spidy','peter@parker.com','peter123'),
('wonder','wonder@woman.com','wonder123');
select * from tbl_user_login;
select username from tbl_user_login;

select username from tbl_user_login where email='steve@captain.com'
and password='steve123';
select * from tbl_user_login where email='steve@captain.com'
and password='steve123'; --table show hogi [AND] use krne command run NHI hoga

select password from tbl_user_login
where username='spidy' or email='peter@peter.com';--(atleat ondition is true or might be false)
select *from tbl_user_login
where username='spidy' or email='peter@peter.com';

select* from tbl_user_login
where username='spidy' or email='peter@pete'; --table show hogi [or] use krne command run hoga

select * from tbl_user_login
where not username='wonder';
select * from tbl_user_login
where username!='wonder';



