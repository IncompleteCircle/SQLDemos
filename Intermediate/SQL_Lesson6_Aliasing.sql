--------------------------------------------------------------------------
-- SQL Tutorial | Lesson 6 | Aliasing
-- Description:
-- Core SQL techniques explored in this tutorial.
-- Focus: Aliasing
-- Source: Tutorial Presented by Alex Freberg
-- Series: SQL Tutorials Intermediate Level
--------------------------------------------------------------------------

--------------------------------------------------------------------------
/*
Concept:
	- Aliasing

Aliasing:
	Its designed to temporarily changing the column (field) or table name
	in a given script. It does not affect the output of the script,
	but rather focused on providing user readability.
*/
--------------------------------------------------------------------------

-- Query: Aliasing column names
-- Break it down into two examples.

-- Example 1: No Aliasing
-- Column will be referred to as (No column name)
SELECT
	FirstName + ' ' + LastName
FROM SQLTutorial.dbo.tblEmployeeDemographics

-- Example 2: Aliasing
-- Column will be aliased as 'FullName'
SELECT
	FirstName + ' ' + LastName AS FullName
FROM SQLTutorial.dbo.tblEmployeeDemographics

-- Query: Aliasing with Aggregate Functions
-- Aggregate Function: AVG()
SELECT
	AVG(Age) AS AvgAge
FROM
	SQLTutorial.dbo.tblEmployeeDemographics

-- Query: Inner Join with Aliasing
SELECT EmpDemo.EmployeeID
FROM SQLTutorial.dbo.tblEmployeeDemographics AS EmpDemo
JOIN SQLTutorial.dbo.tblEmployeeSalary AS EmpSal
	ON EmpDemo.EmployeeID = EmpSal.EmployeeID


-- Query: Two LEFT JOINS with Aliasing
-- DB: SQLTutorial
-- Tables:
--		tblEmployeeDemographics - Alias: EmpDemo
--		tblEmployeeSalary -- Alias EmpSal
--		tblWarehouseEmployeeDemographics -- Alias: WEmpDemo
SELECT
	EmpDemo.EmployeeID,
	EmpDemo.FirstName,
	EmpDemo.LastName,
	EmpSal.JobTitle,
	WEmpDemo.Age
FROM SQLTutorial.dbo.tblWarehouseEmployeeDemographics AS EmpDemo -- Left Table
LEFT JOIN 
	SQLTutorial.dbo.tblEmployeeSalary AS EmpSal -- Right Table
	ON EmpDemo.EmployeeID = EmpSal.EmployeeID
LEFT JOIN
	SQLTutorial.dbo.tblWarehouseEmployeeDemographics AS WEmpDemo -- Right Table
	ON EmpDemo.EmployeeID = WEmpDemo.EmployeeID
