USE employee_attrition_db;

SHOW TABLES;

SELECT * FROM Employee;

-- 1. Write a SQL query to find the average, minimum, and maximum total working years for employees 
-- who have 'High' environment satisfaction 
-- but have not received any promotions ('Years Since Last Promotion' is 0) in their current role.
SELECT AVG(TotalWorkingYears) AS AvgWorkingYears,
	MIN(TotalWorkingYears) AS MinWorkingYears,
    MAX(TotalWorkingYears) AS MaxWorkingYears
FROM Employee
WHERE EnvironmentSatisfaction = 4 AND YearsSinceLastPromotion = 0;


-- 2.  Identify any patterns in performance ratings for employees who have 'Over Time' enabled 
-- and 'Job Involvement' level greater than 3.

SELECT PerformanceRating, COUNT(*) AS Count, AVG(MonthlyIncome) AS AvgMonthlyIncome
FROM Employee
WHERE OverTime = 'Yes' AND JobInvolvement > 3
GROUP BY PerformanceRating
ORDER BY PerformanceRating;

-- Find the attrition rate in performance ratings for employees who have 'Over Time' enabled 
-- and 'Job Involvement' level greater than 3.
SELECT PerformanceRating,
COUNT(*) AS TotalEmployees,
SUM(CASE WHEN Attrition="Yes" THEN 1 ELSE 0 END) AS AttritionCount,
(SUM(CASE WHEN Attrition="Yes" THEN 1 ELSE 0 END)/COUNT(*))*100 AS AttritionRate
FROM Employee
WHERE OverTime="Yes" AND JobInvolvement>3
GROUP BY PerformanceRating
ORDER BY PerformanceRating;


-- 3 Calculate the attrition rate of employees in the company. 
-- The attrition rate is defined as the percentage of employees who have left the company (Attrition = 'Yes') 
-- compared to the total number of employees. Round the attrition rate to two decimal places.

-- Attrition Rate
SELECT ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)/ COUNT(*)) * 100, 2) AS AttritionRate
FROM Employee;

-- 4. Determine the probability of an employee receiving a promotion. 
-- The promotion probability is defined as the percentage of employees 
-- who have received at least one promotion ('Years Since Last Promotion' > 0) compared to the total number of employees. 
-- Round the probability to two decimal places.

-- Promotion Probability
SELECT round((SUM(CASE WHEN YearsSinceLastPromotion > 0 THEN 1 ELSE 0 END)/ COUNT(*))*100, 2) AS PromotionProbability
FROM Employee;


-- 5. Find the top 5 employees who received the maximum salary hike ('Percent Salary Hike') during their last performance review.
-- Display the employee name(ID) and the corresponding salary hike in descending order.

SELECT EmployeeID AS EmployeeNumber, Department, PercentSalaryHike
FROM Employee
ORDER BY PercentSalaryHike DESC
LIMIT 15;

SELECT Department, EmployeeID, PercentSalaryHike
FROM (
    SELECT
        EmployeeID,
        PercentSalaryHike,
        Department,
        ROW_NUMBER() OVER (PARTITION BY Department ORDER BY PercentSalaryHike DESC) AS rownumber
    FROM Employee
) AS ranked
WHERE rownumber <= 5
ORDER BY Department, PercentSalaryHike DESC;


SELECT
        EmployeeID,
        PercentSalaryHike,
        Department,
        ROW_NUMBER() OVER (PARTITION BY Department ORDER BY PercentSalaryHike DESC) AS rownumber
FROM Employee
ORDER BY Department, PercentSalaryHike DESC;

