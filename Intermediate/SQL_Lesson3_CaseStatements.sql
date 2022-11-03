--------------------------------------------------------------------------
-- SQL Tutorial | Lesson 3 | Case Statements, Use Cases
-- Description:
-- Core SQL techniques explored in this tutorial.
-- Focus: Case Statements, Use Cases
-- Source: Tutorial Presented by Alex Freberg
-- Series: SQL Tutorials Intermediate Level
--------------------------------------------------------------------------

--------------------------------------------------------------------------
/*
Concepts:
	Case Statement + WHEN/THEN + ELSE
	Operators:
		- >, <, =, <>
		- BETWEEN
		- AND
		- OR

Case Statment Core Concept:
Allows for one to specify a condition and what value to be returned
when that condition is met. Conditions are satisfied by whichever statement
is first.
*/
--------------------------------------------------------------------------

-- Query: Case Statement
-- DB: SQLTutorial
-- Table: SQLTutorial.dbo.tblEmployeeDemographics
-- Description:
-- Case Statement used to state a categorical description of each age group
-- per each given record (in the age field).
SELECT
	SQLTutorial.dbo.tblEmployeeDemographics.FirstName,
	SQLTutorial.dbo.tblEmployeeDemographics.LastName,
	SQLTutorial.dbo.tblEmployeeDemographics.Age,
	CASE
		WHEN SQLTutorial.dbo.tblEmployeeDemographics.Age > 30 THEN 'Old'
		WHEN SQLTutorial.dbo.tblEmployeeDemographics.Age BETWEEN 27 AND 30 THEN 'Young'
		ELSE 'Baby'
	END
FROM
	SQLTutorial.dbo.tblEmployeeDemographics
WHERE
	SQLTutorial.dbo.tblEmployeeDemographics.AGE is NOT NULL
ORDER BY
	SQLTutorial.dbo.tblEmployeeDemographics.AGE

-- Query: Inner Join + Case Statement to Solve Salary Increases by Job Title
-- DB: SQLTutorial
-- Tables:
--		- Left Table:  tblEmployeeDemographics
--		- Right Table: tblEmployeeSalary
-- Description:
-- The query uses an inner join on the condition of employee IDs between both tables,
-- to which afterwards it will display the first name, last name, job title, and salary
-- of employees. It utilizes a case statement to calculate the salary increase
-- cumulative sum for each employee based on their position.
SELECT
	SQLTutorial.dbo.tblEmployeeDemographics.FirstName,
	SQLTutorial.dbo.tblEmployeeDemographics.LastName,
	SQLTutorial.dbo.tblEmployeeSalary.JobTitle,
	SQLTutorial.dbo.tblEmployeeSalary.Salary,
	CASE
		WHEN SQLTutorial.dbo.tblEmployeeSalary.JobTitle = 'Salesperson' THEN SQLTutorial.dbo.tblEmployeeSalary.Salary + (SQLTutorial.dbo.tblEmployeeSalary.Salary * .10)
		WHEN SQLTutorial.dbo.tblEmployeeSalary.JobTitle = 'Accountant' THEN SQLTutorial.dbo.tblEmployeeSalary.Salary + (SQLTutorial.dbo.tblEmployeeSalary.Salary * .05)
		WHEN SQLTutorial.dbo.tblEmployeeSalary.JobTitle = 'HR' THEN SQLTutorial.dbo.tblEmployeeSalary.Salary + (SQLTutorial.dbo.tblEmployeeSalary.Salary * .000001)
		ELSE SQLTutorial.dbo.tblEmployeeSalary.Salary + (SQLTutorial.dbo.tblEmployeeSalary.Salary * .03)
	END as SalaryAfterRaise
FROM SQLTutorial.dbo.tblEmployeeDemographics
INNER JOIN SQLTutorial.dbo.tblEmployeeSalary
	ON SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID = SQLTutorial.dbo.tblEmployeeSalary.EmployeeID
ORDER BY
	SalaryAfterRaise DESC

-- Query: Inner Join + Case Statement to Solve Salary Increases By Age
-- DB: SQLTutorial
-- Tables:
--		- Left Table:  tblEmployeeDemographics
--		- Right Table: tblEmployeeSalary
-- Description:
-- This query utilizes case statements from an inner join table, and subqueries to solve
-- the salary increase based on an employee's age in the company.
SELECT
	SQLTutorial.dbo.tblEmployeeDemographics.FirstName,
	SQLTutorial.dbo.tblEmployeeDemographics.LastName,
	SQLTutorial.dbo.tblEmployeeSalary.JobTitle,
	SQLTutorial.dbo.tblEmployeeDemographics.Age,
	SQLTutorial.dbo.tblEmployeeSalary.Salary,
	CASE
		-- Checks if employee is the max age
		WHEN SQLTutorial.dbo.tblEmployeeDemographics.Age = 
		(
			SELECT Top 1 MAX(SQLTutorial.dbo.tblEmployeeDemographics.Age) as MaxAge
			FROM SQLTutorial.dbo.tblEmployeeDemographics
			WHERE EmployeeID is NOT NULL AND Age is NOT NULL
			GROUP BY Gender
			ORDER BY MaxAge DESC
		) THEN SQLTutorial.dbo.tblEmployeeSalary.Salary * .125
		-- Checks if the employee is the min age
		WHEN SQLTutorial.dbo.tblEmployeeDemographics.Age = 
		(
			SELECT Top 1 MIN(SQLTutorial.dbo.tblEmployeeDemographics.Age) as MinAge
			FROM SQLTutorial.dbo.tblEmployeeDemographics
			WHERE EmployeeID is NOT NULL
			GROUP BY Gender
			ORDER BY MinAge ASC
		) THEN SQLTutorial.dbo.tblEmployeeSalary.Salary * .025
		ELSE SQLTutorial.dbo.tblEmployeeSalary.Salary * .075
	END AS SalaryRaiseAmt
FROM SQLTutorial.dbo.tblEmployeeDemographics
INNER JOIN SQLTutorial.dbo.tblEmployeeSalary
	ON SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID = SQLTutorial.dbo.tblEmployeeSalary.EmployeeID
ORDER BY
	SQLTutorial.dbo.tblEmployeeDemographics.Age DESC

-- End Lesson												
--------------------------------------------------------------------------
-- Query: Proof Check Values
-- Description: This query is for the user for learning purposes to see
-- how the subqueries and inner join were used in the age based salary calculations.
-- Inner Join
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
INNER JOIN SQLTutorial.dbo.tblEmployeeSalary
	ON SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID = SQLTutorial.dbo.tblEmployeeSalary.EmployeeID
ORDER BY
	SQLTutorial.dbo.tblEmployeeDemographics.Age DESC

-- Min Age Returned
SELECT Top 1
	MIN(SQLTutorial.dbo.tblEmployeeDemographics.Age) as MinAge
FROM
	SQLTutorial.dbo.tblEmployeeDemographics
WHERE EmployeeID is NOT NULL
GROUP BY
	Gender
ORDER BY
	MinAge ASC

-- Max Age Returned
SELECT Top 1
	MAX(SQLTutorial.dbo.tblEmployeeDemographics.Age) as MaxAge
FROM
	SQLTutorial.dbo.tblEmployeeDemographics
WHERE EmployeeID is NOT NULL
GROUP BY
	Gender
ORDER BY
	MaxAge DESC

--------------------------------------------------------------------------
-- Query: Extended Example
-- DB: SQLTutorial + SysDB
-- Tables:
--	- tblEmployeeSalary
--	- tblEmployeeDemographics
-- Temp Tables:
--	- #temptblJobPositionAvgSalary
--
-- Description:
-- Query obtains employee IDs and their job title and states
-- if they are either below, at, or above average salary levels.

-- Preliminary Step: Check to see if temp table exists, if so drop its.
-- Then create a temporary table to store average salary by job title
IF OBJECT_ID(N'tempdb..#temptblJobPositionAvgSalary') IS NOT NULL
BEGIN
DROP TABLE #temptblJobPositionAvgSalary
END
GO
CREATE TABLE #temptblJobPositionAvgSalary
(
	JobTitle varchar(50),
	AvgSalaryByPosition int
)
-- After creating table, populate values into temp table.
INSERT INTO #temptblJobPositionAvgSalary -- temporary table
SELECT
	SQLTutorial.dbo.tblEmployeeSalary.JobTitle,
	AVG(SQLTutorial.dbo.tblEmployeeSalary.Salary)
FROM
	SQLTutorial.dbo.tblEmployeeDemographics
JOIN SQLTutorial.dbo.tblEmployeeSalary
	ON SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID = SQLTutorial.dbo.tblEmployeeSalary.EmployeeID
GROUP BY
	SQLTutorial.dbo.tblEmployeeSalary.JobTitle
ORDER BY
	AVG(SQLTutorial.dbo.tblEmployeeSalary.Salary) DESC

-- View temporary table
SELECT *
FROM #temptblJobPositionAvgSalary

-- Join on tblEmployeeSalary and temp table: #temptblJobPositionAvgSalary
-- Uses Case When statements to check if salary is above, at, or below average levels.
SELECT
	SQLTutorial.dbo.tblEmployeeSalary.EmployeeID,
	SQLTutorial.dbo.tblEmployeeSalary.JobTitle,
	SQLTutorial.dbo.tblEmployeeSalary.Salary,
	#temptblJobPositionAvgSalary.AvgSalaryByPosition,
	CASE
		WHEN SQLTutorial.dbo.tblEmployeeSalary.Salary > #temptblJobPositionAvgSalary.AvgSalaryByPosition THEN 'Above Average'
		WHEN SQLTutorial.dbo.tblEmployeeSalary.Salary = #temptblJobPositionAvgSalary.AvgSalaryByPosition THEN 'Average'
		WHEN SQLTutorial.dbo.tblEmployeeSalary.Salary < #temptblJobPositionAvgSalary.AvgSalaryByPosition THEN 'Below Average'
		ELSE NULL
	END as IncomeLevelStatus
FROM
	SQLTutorial.dbo.tblEmployeeSalary
JOIN #temptblJobPositionAvgSalary
	ON SQLTutorial.dbo.tblEmployeeSalary.JobTitle = #temptblJobPositionAvgSalary.JobTitle
WHERE 
	SQLTutorial.dbo.tblEmployeeSalary.EmployeeID is NOT NULL AND
	SQLTutorial.dbo.tblEmployeeSalary.Salary >= #temptblJobPositionAvgSalary.AvgSalaryByPosition
ORDER BY
	SQLTutorial.dbo.tblEmployeeSalary.Salary DESC

-- Drops Table After Running Above Queries
IF OBJECT_ID(N'tempdb..#temptblJobPositionAvgSalary') IS NOT NULL
BEGIN
DROP TABLE #temptblJobPositionAvgSalary
END
--------------------------------------------------------------------------