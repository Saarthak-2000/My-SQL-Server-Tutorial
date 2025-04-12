/*
CTE(Common Table Expression)
Cte is temporay named result set
a CTE must be followed by a single SELECT,INSERT,UPDATE or DELETE statement that references some or all the CTE columns . A CTE can also be specified in a CREATE VIEW statement as part of the defining SELECt statement of the view
 multiple CTE query defintions can be defined.
 SYNTAX:
 WITH cte_name As (cte_query) followed_query
 With cte_name(col1,col2,...) AS (cte_query) followed_query
 */ 
 /*
 WITH cte_name As (cte_query) followed_query
 
 WITH cte_avgSalary AS
 (
 SELECT avg(salary) as AvgSalary From employee
 )
 SELECT avgSalary FROM cte_avgSalary;
 */

 SELECT * from employee;
WITH cte_avgSalary AS
( 
SELECT avg(salary) as avgSalary From employee
)
SELECT avgSalary from cte_avgSalary;

WITH cte_empCount(deptid,employeeCount)AS
(
select deptid,count(*) as employeeCount
FROM employee GROUP by deptid
)
SELECT dname,employeeCount 
from department join cte_empCount
on department.did=cte_empCount.deptid




