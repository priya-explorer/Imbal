SHOW DATABASES;

DROP DATABASE employee_attrition_db;

CREATE DATABASE employee_attrition_db;

SHOW CREATE DATABASE employee_attrition_db;

USE employee_attrition_db;

SHOW TABLES;

-- Create table
CREATE TABLE Employee(
	EmployeeID INT  NOT NULL,
    Attrition ENUM('Yes', 'No') NOT NULL,
    AgeBand VARCHAR(8),
    Age INT NOT NULL,
    Department VARCHAR(5)  NOT NULL,
    Education VARCHAR(17),
    EducationField VARCHAR(17),
    Gender ENUM('Male', 'Female')  NOT NULL,
    JobRole VARCHAR(25)  NOT NULL,
    MaritalStatus VARCHAR(8),
    BusinessTravel VARCHAR(17),
    OverTime VARCHAR(3),
    TrainingTimesLastYear INT,
    DailyRate INT,
    DistanceFromHome INT,
    EnvironmentSatisfaction INT,
    HourlyRate INT,
    JobInvolvement INT,
    JobLevel INT,
    JobSatisfaction INT,
    MonthlyIncome INT,
    MonthlyRate INT,
    NumCompaniesWorked INT,
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT,
	StockOptionLevel INT,
    TotalWorkingYears INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT,
    PRIMARY KEY(EmployeeID)
    );
    
DESCRIBE Employee;
    
SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = TRUE;

SET FOREIGN_KEY_CHECKS=0;
SET GLOBAL FOREIGN_KEY_CHECKS=0;
    
LOAD DATA LOCAL INFILE "C:/Users/priya/Documents/DS/SQL/Attrition_Analysis/Employee.csv" 
INTO TABLE Employee
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

SET GLOBAL local_infile = FALSE;

SET FOREIGN_KEY_CHECKS=1;
SET GLOBAL FOREIGN_KEY_CHECKS=1;

SELECT * FROM employee;
