USE COMPANY_DB;
DECLARE @NAME VARCHAR(50);
SET @NAME='KAARTIK';
SELECT @NAME;

DECLARE @NAME VARCHAR(50),@AGE INT,@SALARY DECIMAL(7,2)=45000;
SELECT @NAME='KAARTIK',@AGE=25;
SELECT @NAME AS 'NAME',@AGE AS 'AGE',@SALARY AS 'SALARY';

DECLARE @NUMBER INT =100;
SET @NUMBER+=50;
SELECT @NUMBER AS 'NUMBER';

SET @NUMBER*=50;
SELECT @NUMBER AS 'NUMBER';

SET @NUMBER=@NUMBER-50;
SELECT @NUMBER AS 'NUMBER';


USE EMP_DEPT_DB;
SELECT * FROM employee;

DECLARE @NAME VARCHAR(50),@SALARY DECIMAL(7,2);
SELECT @NAME=EMP_NAME, @SALARY=EMP_SALARY FROM EMPLOYEE;
SELECT @NAME AS 'NAME' , @SALARY AS'SALARY';
