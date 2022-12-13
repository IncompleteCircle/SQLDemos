--------------------------------------------------------------------------
-- SQL Tutorial | Lesson 1 | CTE (Common Table Expressions)
-- Description:
-- Core SQL techniques explored in this tutorial.
-- Focus: CTE (Common Table Expressions) 
-- Source: Tutorial Presented by Alex Freberg
-- Series: Advanced SQL Tutorials
--------------------------------------------------------------------------

/*
Concepts Covered:
	- CTE [Common Table Expression]

CTE: Common Table Expression
	A CTE is a named temporary result set. It is created by utilizng a
	WITH query, then referenced within a SELECT, INSERT, UPDATE, or
	DELETE statement.

	CTEs provide an alternative to creating and dropping a table.
	Reference the temporary result set created by the CTE by its alias.
*/
USE SQLTutorial

-- Query: CTE_Employee
WITH CTE_Employee as 
(
	SELECT
		emp.FirstName,
		emp.LastName,
		emp.Gender,
		sal.Salary,
		COUNT(emp.Gender) OVER (PARTITION BY emp.Gender) as TotalGender,
		AVG(sal.Salary) OVER (PARTITION BY  emp.Gender) as AvgSalary
	FROM SQLTutorial.dbo.tblEmployeeDemographics emp
	JOIN SQLTutorial.dbo.tblEmployeeSalary sal
		ON emp.EmployeeID = sal.EmployeeID
	WHERE
		sal.Salary > '45000'
)
SELECT 
	CONCAT(FirstName,' ', LastName) as EmployeeName,
	Salary,
	AvgSalary
FROM CTE_Employee
ORDER BY AvgSalary ASC

-- Query: CTE_Salary
WITH CTE_Salary as
(
	SELECT
		sal.EmployeeID,
		sal.JobTitle,
		sal.Salary,
		emp.FirstName,
		emp.LastName,
		AVG(sal.Salary) OVER (PARTITION BY sal.JobTitle) as AvgSalary
	FROM SQLTutorial.dbo.tblEmployeeSalary sal
	JOIN SQLTutorial.dbo.tblEmployeeDemographics emp
		ON emp.EmployeeID = sal.EmployeeID
)
SELECT 
	COUNT(EmployeeID) as 'Total Employees',
	SUM(Salary) as 'Total Salary',	
	AVG(Salary) as 'Average Salary',
	MAX(Salary) as 'Maximum Salary',
	MIN(Salary) as 'Minimum Salary'
FROM CTE_Salary
