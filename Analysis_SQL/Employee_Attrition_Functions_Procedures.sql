SHOW DATABASES;

USE employee_attrition_db;

SELECT * FROM Employee;

-- Functions and Procedures

-- 1. Create an SQL function that calculates the total working experience of an employee based on their 
-- 'Years At Company' and 'Years In Current Role' columns.

DELIMITER //
CREATE FUNCTION TotalWorkExperience(YearsAtCompany INT, YearsInCurrentRole INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE TotalExperience INT;
	SET TotalExperience = YearsAtCompany + YearsInCurrentRole;
    RETURN TotalExperience;
END;
//
DELIMITER ;

-- Stored Function Call
SELECT EmployeeID,YearsAtCompany, YearsInCurrentRole, TotalWorkExperience(YearsAtCompany, YearsInCurrentRole) AS TotalWorkExp
FROM Employee;

-----------------------------------------------------------------------------------------------------------------------------------
-- 2. Write an SQL procedure to update the 'Job Level' of an employee by one level when they receive a performance rating of 5.

-- SQL procedure that updates the 'Job Level' of an employee by one level when they receive a performance rating of 5

DELIMITER $$
CREATE PROCEDURE UpdateJobLevelForHighPeformer(IN EmployeeNumber INT)
BEGIN
	Update Employee
	SET JobLevel = JobLevel+1
	WHERE PerformanceRating = 5 AND JobLevel<5 AND EmployeeID = EmployeeNumber;
END;
$$
DELIMITER ;

-- CALL FUNCTION: 
-- CALL UpdateJobLevelForHighPeformer(1);


------------------------------------------------------------------------------------------------------------------------------------
-- 3. Design an SQL function that returns the number of employees in a given department with a specific level of job involvement.
DELIMITER $$
CREATE FUNCTION Count_Employee(DepartmentName VARCHAR(6), JobInvolvementRating INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE EmployeeCount INT;
    SELECT COUNT(*) INTO EmployeeCount
    FROM employee
    WHERE Department = DepartmentName AND JobInvolvement = JobInvolvementRating;
    RETURN EmployeeCount;
END;
$$
DELIMITER ;

SELECT Count_Employee('HR', 3) AS Count;
SELECT Count_Employee('Sales', 4) AS Count;

-------------------------------------------------------------------------------------------------------------------------------------------
-- 4. Create an SQL procedure that generates a unique employee number for new hires and inserts the new employee record into the database.
DELIMITER $$
CREATE PROCEDURE InsertNewEmployeeDetails(IN Age_Value INT, IN Department_Name VARCHAR(6), IN Gender_Name ENUM('Male', 'Female'), IN JobRole_Name VARCHAR(25), IN Attrition_Value ENUM('Yes', 'No'))
BEGIN

	DECLARE NewEmployeeID INT;
    
    SELECT IFNULL(MAX(EmployeeID), 0)+1 INTO NewEmployeeID
    FROM Employee;
    
    INSERT INTO Employee(EmployeeID, Attrition, Age, Department, Gender, JobRole)
    VALUES( NewEmployeeID, Attrition_Value, Age_Value, Department_Name, Gender_Name, JobRole_Name);
    
    SELECT CONCAT('A New Employee Number ID', NewEmployeeID, 'has been inserted!') AS MESSAGE;
    
END;
$$
DELIMITER ;

-- TO CHECK THE PROCEDURE
 -- CALL InsertNewEmployeeDetails(24, 'Sales', 'Male', 'Sales Executive', 'No');

-------------------------------------------------------------------------------------------------------------------------------------------
-- 5. Write an SQL function that calculates the average monthly income for employees in a specified age band and department.
-- AgeBand: Under 25, 25 - 34, 35 - 44, 45 - 54, Over 55
-- Deparment: Sales, R&D, HR

DELIMITER $$
CREATE FUNCTION AvgIncomeByAgeAndDepartment ( AgeInput VARCHAR(8), DepartmentName VARCHAR(5))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE AvgIncome DECIMAL(10,2);
    
    SELECT Avg(MonthlyIncome) INTO AvgIncome
    FROM employee
    WHERE AgeBand = AgeInput AND Department = DepartmentName;
    RETURN AvgIncome;
END;
$$
DELIMITER ;

-- TO CHECK FUNCTION 
-- Stored Function Call
SELECT AVGIncomeByAgeAndDepartment('over 55', 'Sales');

--------------------------------------------------------------------------------------------------------------------------------------------
SELECT  avg(MonthlyIncome) 
from employee
where AgeBand='over 55' AND Department='Sales';

