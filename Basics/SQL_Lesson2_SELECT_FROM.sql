--------------------------------------------------------------------------
-- SQL Tutorial | Lesson 2 | SELECT and FROM Statements
-- Description:
-- Core SQL techniques explored in this tutorial.
-- Focus: Creating tables and inserting values into a created database.
-- Source: Tutorial Presented by Alex Freberg
-- Series: SQL Tutorials for Beginners
--------------------------------------------------------------------------

--------------------------------------------------------------------------
/* Concepts Covered
SELECT Statement with the following syntax and aggregate functions
 - *
 - Top
 - Distinct
 - Count
 - As
 - Max
 - Min
 - Avg
*/
--------------------------------------------------------------------------

-- Query: SELECT *
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
-- Description: Select all columns (fields) and rows (records) from 
-- the given table
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics

-- Query: SELECT TOP()
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
-- Description: Selects the top 'n' records from either all columns (*) or
-- selected column/s (field/s)
SELECT TOP 5 *
FROM SQLTutorial.dbo.tblEmployeeDemographics

-- Query: SELECT DISTINCT()
-- Description: Select the unique values from a specific column (field).
-- Query will only return the unique values in a given column (field).
SELECT DISTINCT(SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID)
FROM SQLTutorial.dbo.tblEmployeeDemographics

SELECT DISTINCT(SQLTutorial.dbo.tblEmployeeDemographics.Gender)
FROM SQLTutorial.dbo.tblEmployeeDemographics

-- Query: SELECT COUNT()
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
-- Description: Will return all of the non-null values in a column (field)
-- If an entire column was null, then the return value is 0.
-- 'AS' is a count of the LastName
SELECT COUNT(SQLTutorial.dbo.tblEmployeeDemographics.LastName) AS LastNameCount
FROM SQLTutorial.dbo.tblEmployeeDemographics

-- Query: SELECT MAX()
-- DB: SQLTutorial
-- Table: tblEmployeeSalary
-- Description: Query will return from the selected column (field) the maximum
-- record (row) value, in this case employee salary.
SELECT MAX(SQLTutorial.dbo.tblEmployeeSalary.Salary) AS MaxSalary
FROM SQLTutorial.dbo.tblEmployeeSalary

-- Query: SELECT MIN()
-- DB: SQLTutorial
-- Table: tblEmployeeSalary
-- Description: Query will return from the selected column (field) the minimum
-- record (row) value, in this case employee salary.
SELECT MIN(SQLTutorial.dbo.tblEmployeeSalary.Salary) AS MinSalary
FROM SQLTutorial.dbo.tblEmployeeSalary

-- Query: SELECT AVG()
-- DB: SQLTutorial
-- Table: tblEmployeeSalary
-- Description: Query will return from the selected column (field) the average
-- records (rows) average, in this case employee salary.
SELECT AVG(SQLTutorial.dbo.tblEmployeeSalary.Salary) AS AvgSalary
FROM SQLTutorial.dbo.tblEmployeeSalary


-- Query: Combine SELECT Statements + MAX + Subquery
-- DB: SQLTutorial
-- Table: tblEmployeeSalary
-- Description: Query returns the information of the employee (ID, title)
-- that contains the max salary in the table.
SELECT
	SQLTutorial.dbo.tblEmployeeSalary.EmployeeID,
	SQLTutorial.dbo.tblEmployeeSalary.JobTitle,
	SQLTutorial.dbo.tblEmployeeSalary.Salary
FROM
	SQLTutorial.dbo.tblEmployeeSalary
WHERE
	SQLTutorial.dbo.tblEmployeeSalary.Salary = (SELECT MAX(SQLTutorial.dbo.tblEmployeeSalary.Salary)
										FROM SQLTutorial.dbo.tblEmployeeSalary);

-- Query: Combine SELECT Statements + MIN + Subquery
-- DB: SQLTutorial
-- Table: tblEmployeeSalary
-- Description: Query returns the information of the employee (ID, title)
-- that contains the min salary in the table.
SELECT
	SQLTutorial.dbo.tblEmployeeSalary.EmployeeID,
	SQLTutorial.dbo.tblEmployeeSalary.JobTitle,
	SQLTutorial.dbo.tblEmployeeSalary.Salary
FROM
	SQLTutorial.dbo.tblEmployeeSalary
WHERE
	SQLTutorial.dbo.tblEmployeeSalary.Salary = (SELECT MIN(SQLTutorial.dbo.tblEmployeeSalary.Salary)
										FROM SQLTutorial.dbo.tblEmployeeSalary);