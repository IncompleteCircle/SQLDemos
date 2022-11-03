--------------------------------------------------------------------------
-- SQL Tutorial | Lesson 2 | Unions
-- Description:
-- Core SQL techniques explored in this tutorial.
-- Focus: Unions
-- Source: Tutorial Presented by Alex Freberg
-- Series: SQL Tutorials Intermediate Level
--------------------------------------------------------------------------

--------------------------------------------------------------------------
/*
Concepts
- Union
- Union All

Unions Core Concept:
Using two tables to create one output. It differs from joins, such that
joins are combined using a common column. Whereas unions will select all
data from both tables and put it into one output where all of the data
from the columns are in one column. Union will not have an additional
column from both tables where it was binded in conjunction.

Union:	Will not return duplicate values found in both tables, and only
		produce a single row value if duplicate found.

Union All:	Will return duplicate values found in both tables when
			producing a single output.
*/
--------------------------------------------------------------------------

--------------------------------------------------------------------------
-- Preliminary Step One: Create Table
-- Table: tblWarehouseEmployeeDemographics
USE SQLTutorial
GO
IF EXISTS
	(SELECT *
	FROM sys.tables
	WHERE SCHEMA_NAME(schema_id) LIKE 'dbo'
	AND name like 'tblWarehouseEmployeeDemographics'
	)
DROP TABLE dbo.tblWarehouseEmployeeDemographics
GO
CREATE TABLE SQLTutorial.dbo.tblWarehouseEmployeeDemographics
(
	EmployeeID int,
	FirstName varchar(50),
	LastName varchar(50),
	Age int,
	Gender varchar(50)
)

-- Preliminary Step Two: Populate Table
-- Table: tblWarehouseEmployeeDemographics
INSERT INTO SQLTutorial.dbo.tblWarehouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')
--------------------------------------------------------------------------

-- Query: Illustrate Full Outer Join
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
FULL OUTER JOIN SQLTutorial.DBO.tblWarehouseEmployeeDemographics
	ON SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID = SQLTutorial.dbo.tblWarehouseEmployeeDemographics.EmployeeID

-- Query: UNION
-- DB: SQLTutorial
-- Tables:
--		- tblEmployeeDemographics
--		- tblWarehouseEmployeeDemographics
-- Description:
-- Running a union on both tables to combine into a single output.
-- Union will also take out duplicate values in the tables when producing
-- a single output.
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
UNION
SELECT *
FROM SQLTutorial.dbo.tblWarehouseEmployeeDemographics

-- Query: UNION ALL
-- DB: SQLTutorial
-- Tables:
--		- tblEmployeeDemographics
--		- tblWarehouseEmployeeDemographics
-- Description:
-- Union All will return duplicate values found in both tables in their
-- single output.
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
UNION ALL
SELECT *
FROM SQLTutorial.dbo.tblWarehouseEmployeeDemographics
ORDER BY EmployeeID

-- Query: Running Union on Tables with Different Column Fields
-- DB: SQLTutorial
-- Tables:
--		- tblEmployeeDemographics
--		- tblEmployeeSalary
-- Description:
-- Union here works, as the fields between both tables selected
-- all contain similar data types. Even though the data types
-- in the columns are the same for both tables, one must make
-- sure that both tables logic of the union makes sense. They're the
-- 
SELECT 
	SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID,
	SQLTutorial.dbo.tblEmployeeDemographics.FirstName,
	SQLTutorial.dbo.tblEmployeeDemographics.Age
FROM
	SQLTutorial.dbo.tblEmployeeDemographics
UNION
SELECT
	SQLTutorial.dbo.tblEmployeeSalary.EmployeeID,
	SQLTutorial.dbo.tblEmployeeSalary.JobTitle,
	SQLTutorial.dbo.tblEmployeeSalary.Salary
FROM
	SQLTutorial.dbo.tblEmployeeSalary
ORDER BY
	EmployeeID

-- Query: Union
-- DB: SQLTutorial
-- Tables:
--		- tblEmployeeDemographics
--		- tblWarehouseEmployeeDemographics
SELECT
	SQLTutorial.dbo.tblEmployeeDemographics.EmployeeID,
	SQLTutorial.dbo.tblEmployeeDemographics.FirstName,
	SQLTutorial.dbo.tblEmployeeDemographics.Age
FROM 
	SQLTutorial.dbo.tblEmployeeDemographics
UNION
SELECT
	SQLTutorial.dbo.tblWarehouseEmployeeDemographics.EmployeeID,
	SQLTutorial.dbo.tblWarehouseEmployeeDemographics.FirstName,
	SQLTutorial.dbo.tblWarehouseEmployeeDemographics.Age
FROM
	SQLTutorial.dbo.tblWarehouseEmployeeDemographics
ORDER BY
	Age