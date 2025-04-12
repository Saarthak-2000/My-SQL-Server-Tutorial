--DATE & TIME FUNCTIONS
--1.GETDATE()<getDate(),current_timestamp,sysdatetime()
--2.datename(),
--3.datediff()
--4.dateadd()

select GETDATE() AS TODAY_DATE;
select SYSDATETIME() aS today_date;
select CURRENT_TIMESTAMP aS today_date;

select DATENAME(MONTH,CURRENT_TIMESTAMP) AS 'MONTH';
select DATENAME(year,current_timestamp) as'year';
select DATENAME(hour,current_timestamp) as'hour';

select DATEDIFF(YEAR,'JANUARY 6 1995',current_timestamp) as "AgeInYears";
select DATEDIFF(MONTH,'JANUARY 6 1995',current_timestamp) as "AgeInMonths";
select DATEDIFF(YEAR,'JANUARY 10 1997','December 31 2019') as "AgeInYears";

select DATEADD(year,100,current_timestamp) as "100YearFromNow";
select DATEADD(MONTH,10,current_timestamp) as "100MonthFromNow";
