CREATE DATABASE Hr_data;

select * from hr_1;
select * from hr_2;

----------- Q1. Average Attrition rate for all Departments
SELECT 
    Department,
		ROUND(
			SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 
			/ COUNT(*), 2
		) AS AttritionRate_Percent
FROM hr_1
GROUP BY Department;

----------- Q2. Average Hourly rate of Male Research Scientist

SELECT 
    AVG(HourlyRate) AS AvgHourlyRate
FROM hr_1
WHERE Gender = 'Male'
AND JobRole = 'Research Scientist';

----------- Q3. Attrition rate Vs Monthly income stats
SELECT 
    Attrition,
    COUNT(*) AS TotalEmployees,
    AVG(MonthlyIncome) AS AvgMonthlyIncome,
    MIN(MonthlyIncome) AS MinIncome,
    MAX(MonthlyIncome) AS MaxIncome
FROM hr_1 h join hr_2 r on h.EmployeeNumber=r.Employee_id
GROUP BY Attrition;

----------- Q4. Average working years for each Department
SELECT 
    Department,
    AVG(TotalWorkingYears) AS AvgWorkingYears
FROM hr_1 h join hr_2 r on h.EmployeeNumber=r.Employee_id
GROUP BY Department;


----------- Q5. Job Role Vs Work life balance
SELECT 
    JobRole,
    AVG(WorkLifeBalance) AS AvgWorkLifeBalance
FROM hr_1 h join hr_2 r on h.EmployeeNumber=r.Employee_id
GROUP BY JobRole
ORDER BY AvgWorkLifeBalance DESC;

----------- Q6. Attrition rate Vs Year since last promotion relation

SELECT 
    YearsSinceLastPromotion,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*), 2
    ) AS AttritionRate_Percent,
    COUNT(*) AS TotalEmployees
FROM hr_1 h join hr_2 r on h.EmployeeNumber=r.Employee_id
GROUP BY YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion;






