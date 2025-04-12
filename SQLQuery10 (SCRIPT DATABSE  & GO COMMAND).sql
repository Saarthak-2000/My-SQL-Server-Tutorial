
USE [sample-emp_dept-db]
GO
/****** Object:  Table [dbo].[department]    Script Date: 05-04-2025 6.31.53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[dept_id] [varchar](10) NULL,
	[dept_name] [varchar](50) NULL,
	[dept_location] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 05-04-2025 6.31.53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[emp_id] [int] NOT NULL,
	[emp_name] [varchar](50) NULL,
	[emp_salary] [decimal](10, 2) NULL,
	[emp_deptId] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[department] ([dept_id], [dept_name], [dept_location]) VALUES (N'D1', N'DEVELOPMENT', N'CALIFORNIA')
INSERT [dbo].[department] ([dept_id], [dept_name], [dept_location]) VALUES (N'D2', N'MARKETING', N'MUMBAI')
INSERT [dbo].[department] ([dept_id], [dept_name], [dept_location]) VALUES (N'D3', N'ACCOUNTS', N'NEW YORK')
INSERT [dbo].[department] ([dept_id], [dept_name], [dept_location]) VALUES (N'D4', N'MANAGEMENT', N'SYDNEY')
GO
INSERT [dbo].[employee] ([emp_id], [emp_name], [emp_salary], [emp_deptId]) VALUES (1111, N'STEVE', CAST(35000.00 AS Decimal(10, 2)), N'D1')
INSERT [dbo].[employee] ([emp_id], [emp_name], [emp_salary], [emp_deptId]) VALUES (1112, N'ADAM', CAST(28000.00 AS Decimal(10, 2)), N'D2')
INSERT [dbo].[employee] ([emp_id], [emp_name], [emp_salary], [emp_deptId]) VALUES (1113, N'JOHN', CAST(50000.00 AS Decimal(10, 2)), N'D3')
INSERT [dbo].[employee] ([emp_id], [emp_name], [emp_salary], [emp_deptId]) VALUES (1114, N'MIKE', CAST(45000.00 AS Decimal(10, 2)), N'D2')
INSERT [dbo].[employee] ([emp_id], [emp_name], [emp_salary], [emp_deptId]) VALUES (1115, N'PETER', CAST(60000.00 AS Decimal(10, 2)), N'D5')
GO

select *from dbo.department;
--har ek stament ke baad 'GO' command woh hai batch's
--DEFINE BATCH---a group of two or more SQL statements or a single SQL 
--statement that has the same effect as a group of two or more SQL statements
--batch of sql statment can have- DDL,DML,DCL staments
--standard types of BATCHES
--1. Explicit batch - two or more SQL statments seperated by semicoln.
--insert into employee (emp_name,emp_salary)values('brad',4500);

--2. procedure- if a procedure contains more than one SQL statement it is considered to be a batch.
--bina 'GO' command aap batch create nhi kr sakte ,batch its more important
-- GO is not T-SQL statement it is a commmand recognized by SQl seerver utilites.
--GO can be exccuted by any user.it requires no permissions.
--it signals the end of a batch to the sql server utilites.
--SYNTAX- GO[count] ,count-- it a +ve integer .the batch will execute the specified number of times.
--Example- use company_Db;
--GO
--declare @name varchar(50);
--select @name='microsoft';
--go


--RUNNING TIMES
--declare @name varchar(50);
--select @name='microsoft';
--go

declare @name varchar(50);
select @name='MICROSOFT';
select @name as 'NAME';
go

declare @name varchar(50);
select @name='GOOGLE';
select @name as 'NAME';
go
SELECT @NAME;--MUST DECLARE THE SCALABEL VARIABLE @NAME

--THE FIRST BATCH CONTAINS ONLY A USE COMPANY_DB STATEMENT TO SET THE DATABASE.
--THE REMAINING STATEMENTS USE A LOCAL VARIABLE.
--THEREFORE,ALL LOCAL VARIABLE DECLARTIONS MUST BE GROUPED IN A SINGLE BATCH.
--THIS IS DONE BY NOT HAVING A GO COMMAND UNTIL AFTER THE LAST STATEMENT THAT REFERNCES THE VARIABLE.