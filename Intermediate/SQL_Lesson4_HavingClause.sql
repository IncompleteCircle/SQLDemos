--------------------------------------------------------------------------
-- SQL Tutorial | Lesson 4 | Having Clause
-- Description:
-- Core SQL techniques explored in this tutorial.
-- Focus: Having Clause
-- Source: Tutorial Presented by Alex Freberg
-- Series: SQL Tutorials Intermediate Level
--------------------------------------------------------------------------

--------------------------------------------------------------------------
/*
Concepts:
	- Having Clause

Having Clause Concept:
	-	Having Clause statements are completely dependent on Group By
		statements.
	-	Having Clause statements must be compiled after the aggregated
		data and their associated statements.
	-	Aggregate based statement, alternative usage to the WHERE clause
*/
--------------------------------------------------------------------------

-- Query: Having + Group By + Inner Join
-- DB: SQLTutorial
-- Tables:
--		- tblEmployeeDemographics
--		- tblEmployeeSalary
-- Description:
-- Performs an inner join on the two tables based on the condition check on
-- employee ID. Groups By 'job title' in the employee salary table, and then
-- states to return those only with a job count greater than one.
SELECT
	SQLTutorial.dbo.tblEmployeeSalary.JobTitle,
	COUNT(SQLTutorial.dbo.tblEmployeeSalary.JobTitle) as JobTitleCount
FROM SQLTutorial.dbo.tblEmployeeDemographics
JOIN SQLTutorial.dbo.tblEmployeeSalary
	ON SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID = SQLTutorial.dbo.tblEmployeeSalary.EmployeeID
GROUP BY
	SQLTutorial.dbo.tblEmployeeSalary.JobTitle
HAVING COUNT(SQLTutorial.dbo.tblEmployeeSalary.JobTitle) > 1

-- Query: Having + Group By + Inner Join
-- DB: SQLTutorial
-- Tables:
--		- tblEmployeeDemographics
--		- tblEmployeeSalary
-- Description:
-- Performs an inner join on the two tables based on the condition check on
-- employee ID. Groups By 'salary' in the employee salary table, and then
-- orders it by the average salary greater than 45000.
SELECT
	SQLTutorial.dbo.tblEmployeeSalary.JobTitle,
	AVG(SQLTutorial.dbo.tblEmployeeSalary.Salary) as AvgSalary
FROM
	SQLTutorial.dbo.tblEmployeeDemographics
JOIN SQLTutorial.dbo.tblEmployeeSalary
	ON SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID = SQLTutorial.dbo.tblEmployeeSalary.EmployeeID
GROUP BY
	SQLTutorial.dbo.tblEmployeeSalary.JobTitle
HAVING
	AVG(SQLTutorial.dbo.tblEmployeeSalary.Salary) > 45000
ORDER BY
	AVG(SQLTutorial.dbo.tblEmployeeSalary.Salary) DESC