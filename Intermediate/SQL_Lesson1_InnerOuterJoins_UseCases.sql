--------------------------------------------------------------------------
-- SQL Tutorial | Lesson 1 | Inner & Outer Joins | Use Cases
-- Description:
-- Core SQL techniques explored in this tutorial.
-- Focus: Utilizing Inner and Outer Joins + Use Cases
-- Source: Tutorial Presented by Alex Freberg
-- Series: SQL Tutorials Intermediate Level
--------------------------------------------------------------------------

--------------------------------------------------------------------------
/*
Concepts
- INNER JOINS
- FULL JOINS
- LEFT JOINS
- RIGHT JOINS
- OUTER JOINS
- Use Cases
*/
--------------------------------------------------------------------------

-- Query: Inspect the tables to be used for the JOIN 
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics

SELECT *
FROM SQLTutorial.dbo.tblEmployeeSalary

-- Query: Insert additional values into the table
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
INSERT INTO SQLTutorial.dbo.tblEmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

-- Query: Insert additional values into the table
-- DB: SQLTutorial
-- Table: tblEmployeeSalary
INSERT INTO SQLTutorial.dbo.tblEmployeeSalary VALUES
(1010, NULL, 47000),
(NULL, 'Salesperson', 43000)

-- Query: INNER JOIN
-- DB: SQLTutorial
-- LEFT Table:	tblEmployeeDemographics
-- RIGHT Table: tblEmployeeSalary
-- Description: INNER JOIN (default) will match both tables' employee IDs
-- to return back the records of all columns in both tables.
SELECT 
	*
FROM
	SQLTutorial.dbo.tblEmployeeDemographics
INNER JOIN
	SQLTutorial.dbo.tblEmployeeSalary ON
	SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID = SQLTutorial.dbo.tblEmployeeSalary.EmployeeID

-- Query: FULL OUTER JOIN
-- DB: SQLTutorial
-- Table: tblEmployeeSalary; tblEmployeeDemographics
-- Description: FULL OUTER JOIN will return all values back from both tables,
-- with it placing a NULL in a column's row value if it has nothing
-- to match it with.
SELECT 
	*
FROM
	SQLTutorial.dbo.tblEmployeeDemographics
FULL OUTER JOIN
	SQLTutorial.dbo.tblEmployeeSalary ON
	SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID = SQLTutorial.dbo.tblEmployeeSalary.EmployeeID

-- Query: LEFT OUTER JOIN
-- DB: SQLTutorial
-- LEFT Table:	tblEmployeeDemographics
-- RIGHT Table: tblEmployeeSalary
-- Description:
-- LEFT OUTER JOIN will return all selected columns' records back
-- from the left table, and only return those that are matching with the
-- criteria set between the focused column's between both tables. 
-- All empty values that do not have a match will be set to NULL on the
-- right table.
SELECT
	* 
FROM
	SQLTutorial.dbo.tblEmployeeDemographics -- Left Table
LEFT OUTER JOIN
	SQLTutorial.dbo.tblEmployeeSalary ON -- Right Table
	SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID = SQLTutorial.dbo.tblEmployeeSalary.EmployeeID

-- Query: RIGHT OUTER JOIN
-- DB: SQLTutorial
-- LEFT Table:	tblEmployeeDemographics
-- RIGHT Table: tblEmployeeSalary
-- Description:
-- RIGHT OUTER JOIN will return all selected columns' record back
-- from the right table, and only return those that are matching with
-- the criteria set between the two tables. All empty values that do not
-- have a match will be set to NULL on the left table.
SELECT
	*
FROM
	SQLTutorial.dbo.tblEmployeeDemographics -- Left Table
RIGHT OUTER JOIN
	SQLTutorial.dbo.tblEmployeeSalary ON -- Right Table
	SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID = SQLTutorial.dbo.tblEmployeeSalary.EmployeeID

-- Query: INNER JOIN on selected columns
-- DB: SQLTutorial
-- LEFT Table:	tblEmployeeDemographics
-- RIGHT Table: tblEmployeeSalary
SELECT
	SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID,
	SQLTutorial.dbo.tblEmployeeDemographics.FirstName,
	SQLTutorial.dbo.tblEmployeeDemographics.LastName,
	SQLTutorial.dbo.tblEmployeeSalary.JobTitle,
	SQLTutorial.dbo.tblEmployeeSalary.Salary
FROM
	--Left Table
	SQLTutorial.dbo.tblEmployeeDemographics
INNER JOIN
	-- Right Table
	SQLTutorial.dbo.tblEmployeeSalary ON
	SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID = SQLTutorial.dbo.tblEmployeeSalary.EmployeeID

-- Query: LEFT OUTER JOIN
-- DB: SQLTutorial
-- LEFT Table:	tblEmployeeDemographics
-- RIGHT Table: tblEmployeeSalary
SELECT
	SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID,
	SQLTutorial.dbo.tblEmployeeDemographics.FirstName,
	SQLTutorial.dbo.tblEmployeeDemographics.LastName,
	SQLTutorial.dbo.tblEmployeeSalary.JobTitle,
	SQLTutorial.dbo.tblEmployeeSalary.Salary
FROM
	--Left Table
	SQLTutorial.dbo.tblEmployeeDemographics
LEFT OUTER JOIN
	-- Right Table
	SQLTutorial.dbo.tblEmployeeSalary ON
	SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID = SQLTutorial.dbo.tblEmployeeSalary.EmployeeID

-- Query: USE Case
-- DB: SQLTutorial
-- LEFT Table:	tblEmployeeDemographics
-- RIGHT Table: tblEmployeeSalary
-- Description: This query will perform a INNER JOIN to return back
-- all relevant employee ID records and their column informations specified.
-- The USE case here is using the WHERE clause to remove a selected employee out,
-- and then usees the ORDER BY statement to re-arrange the salary of the employees
-- in descending order.
SELECT
	SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID,
	SQLTutorial.dbo.tblEmployeeDemographics.FirstName,
	SQLTutorial.dbo.tblEmployeeDemographics.LastName,
	SQLTutorial.dbo.tblEmployeeSalary.Salary
FROM
	--Left Table
	SQLTutorial.dbo.tblEmployeeDemographics
INNER JOIN
	-- Right Table
	SQLTutorial.dbo.tblEmployeeSalary ON
	SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID = SQLTutorial.dbo.tblEmployeeSalary.EmployeeID
WHERE
	SQLTutorial.dbo.tblEmployeeDemographics.FirstName <> 'Michael' OR
	SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID <> 1006
ORDER BY
	SQLTutorial.dbo.tblEmployeeSalary.Salary DESC

-- Query: INNER JOIN
-- DB: SQLTutorial
-- LEFT Table:	tblEmployeeSalary
-- RIGHT Table: tblEmployeeDemographics
-- Description:
-- Obtain the average salary of all (unique) job title's in the company.
-- Order by average salary by descending order. Match all job title's average salary
-- between both tables on the employee ID numbers.
SELECT
	SQLTutorial.dbo.tblEmployeeSalary.JobTitle,
	AVG(SQLTutorial.dbo.tblEmployeeSalary.Salary) AS AvgSalary
FROM
	SQLTutorial.dbo.tblEmployeeSalary
INNER JOIN
	SQLTutorial.dbo.tblEmployeeDemographics ON
	SQLTutorial.dbo.tblEmployeeSalary.EmployeeID = SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID
GROUP BY
	SQLTutorial.dbo.tblEmployeeSalary.JobTitle
ORDER BY
	AvgSalary DESC

-- Query: INNER JOIN
-- DB: SQLTutorial
-- LEFT Table:	tblEmployeeSalary
-- RIGHT Table: tblEmployeeDemographics
-- Description: Same concept as the above query, however,
-- set it only on returning the job title's average salary for
-- 'salesperson'.
SELECT
	SQLTutorial.dbo.tblEmployeeSalary.JobTitle,
	AVG(SQLTutorial.dbo.tblEmployeeSalary.Salary) AS AvgSalary
FROM
	SQLTutorial.dbo.tblEmployeeSalary
INNER JOIN
	SQLTutorial.dbo.tblEmployeeDemographics ON
	SQLTutorial.dbo.tblEmployeeSalary.EmployeeID = SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID
WHERE
	SQLTutorial.dbo.tblEmployeeSalary.JobTitle = 'Salesperson'
GROUP BY
	SQLTutorial.dbo.tblEmployeeSalary.JobTitle

-- Query: INNER JOIN
-- DB: SQLTutorial
-- LEFT Table:	tblEmployeeDemographics
-- RIGHT Table: tblEmployeeSalary
-- Description:
-- Similar to query above, with this one returning the average salary
-- by employee gender and their total count of gender.
SELECT
	SQLTutorial.dbo.tblEmployeeDemographics.Gender,
	COUNT(SQLTutorial.dbo.tblEmployeeDemographics.Gender) AS CountGender,
	SUM(SQLTutorial.dbo.tblEmployeeSalary.Salary) AS SumSalary,
	AVG(SQLTutorial.dbo.tblEmployeeSalary.Salary) AS AvgSalary
FROM
	SQLTutorial.dbo.tblEmployeeDemographics
INNER JOIN
	SQLTutorial.dbo.tblEmployeeSalary ON
	SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID = SQLTutorial.dbo.tblEmployeeSalary.EmployeeID
GROUP BY
	SQLTutorial.dbo.tblEmployeeDemographics.Gender
ORDER BY
	AvgSalary DESC