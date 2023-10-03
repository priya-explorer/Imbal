USE employee_attrition_db;

SELECT * FROM EMPLOYEE;
----------------------------------------------------------------------------------------------------------------------------------------
-- 1.	Create an SQL trigger that automatically updates the 'Num Companies Worked' column for employees 
-- whenever their job satisfaction level is updated, and the new satisfaction level is higher than the previous level. 
-- Write the SQL code to create the trigger and ensure it increments the 'Num Companies Worked' column by one 
-- whenever an employee's job satisfaction level increases during an update.
-- DROP TRIGGER UpdateNumCompaniesWorked;

DELIMITER //

CREATE TRIGGER UpdateNumCompaniesWorked
BEFORE UPDATE ON Employee
FOR EACH ROW
BEGIN
    IF NEW.JobSatisfaction > OLD.JobSatisfaction THEN
        SET NEW.NumCompaniesWorked = OLD.NumCompaniesWorked+1;
    END IF;
END;

//

DELIMITER ;


-- TO CHECK THE TRIGGER
UPDATE employee
SET JobSatisfaction = 7
WHERE EmployeeID = 2068;

SELECT *
FROM Employee
WHERE EmployeeID = 2068;

----------------------------------------------------------------------------------------------------------------------------------------
-- 2.	Create a trigger that updates the 'Environment Satisfaction' to 'High' for all employees in the 'Sales' department 
-- when their 'Monthly Income' exceeds a certain threshold. (Change the threshold with any_value you desired)

-- Threshold : '6970.7244'
-- Is the avg monthly salary of employees in sales department when Environment Satisfaction is 'high'

-- DROP TRIGGER UpdateEnvironmentSatisfaction;

DELIMITER //

CREATE TRIGGER UpdateEnvironmentSatisfaction
BEFORE UPDATE ON Employee
FOR EACH ROW
BEGIN
	DECLARE IncomeThreshold INT;
    SET IncomeThreshold = 6971;

    IF (NEW.MonthlyIncome > IncomeThreshold AND NEW.Department= 'Sales')  THEN
        SET NEW.EnvironmentSatisfaction = 4;
    END IF;
END;
//
DELIMITER ;


-- TO CHECK THE TRIGGER
SELECT *
FROM Employee
WHERE MonthlyIncome>6971 AND Department='Sales';

UPDATE Employee
SET MonthlyIncome = 16000
WHERE EmployeeID=23;
