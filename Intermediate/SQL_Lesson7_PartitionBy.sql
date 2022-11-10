--------------------------------------------------------------------------
-- SQL Tutorial | Lesson 7 | Partition By
-- Description:
-- Core SQL techniques explored in this tutorial.
-- Focus: Partition By
-- Source: Tutorial Presented by Alex Freberg
-- Series: SQL Tutorials Intermediate Level
--------------------------------------------------------------------------

--------------------------------------------------------------------------
/*
Concepts Covered:
	- Partition By

Partition By:
	Syntax: OVER (PARTITION BY expression1, expression2, ...)
	Partition By clause is analytic, while Group By clause is
	aggregate.

Group By vs. Partition By:
	Group By statements will reduce the number of rows in the output by
	grouping the elements into their respective subsets.

	Partition By statements will divide the result into partitions but does not
	reduce the number of rows in the output, that Group By would.
*/
--------------------------------------------------------------------------

-- Query: View the data in both tables to be used
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics

SELECT *
FROM SQLTutorial.dbo.tblEmployeeSalary

-- Query: Partition By
-- Three basic queries are written to illustrate how the outputs differ
-- between partition by, a group by 'Gender', and a group by 'FirstName',
-- 'LastName', 'Gender', 'Salary'.

-- Partition By: Gender
SELECT
	EmpDemo.FirstName,
	EmpDemo.LastName,
	EmpDemo.Gender,
	EmpSal.Salary,
	COUNT(EmpDemo.Gender) OVER (PARTITION BY EmpDemo.Gender) as TotalGender
FROM SQLTutorial.dbo.tblEmployeeDemographics AS EmpDemo
JOIN SQLTutorial.dbo.tblEmployeeSalary AS EmpSal
	ON EmpDemo.EmployeeID = EmpSal.EmployeeID

-- Group By: 'Gender'
SELECT
	Gender,
	COUNT(EmpDemo.Gender) AS TotalGender
FROM
	SQLTutorial.dbo.tblEmployeeDemographics As EmpDemo
JOIN SQLTutorial.dbo.tblEmployeeSalary As EmpSal
	ON EmpDemo.EmployeeID = EmpSal.EmployeeID
GROUP BY
	Gender

-- Group By: 'FirstName', 'LastName', 'Gender', 'Salary'
SELECT
	EmpDemo.FirstName,
	EmpDemo.LastName,
	EmpDemo.Gender,
	EmpSal.Salary,
	COUNT(EmpDemo.Gender) AS TotalGender
FROM SQLTutorial.dbo.tblEmployeeDemographics AS EmpDemo
JOIN SQLTutorial.dbo.tblEmployeeSalary AS EmpSal
	ON EmpDemo.EmployeeID = EmpSal.EmployeeID
GROUP BY
	FirstName, LastName, Gender, Salary

-- Focus: Comparing between the different outputs.
-- Query: Partition By Average Salary
SELECT
	empSal.JobTitle,
	empDemo.FirstName,
	empDemo.LastName,
	empDemo.Age,
	empDemo.Gender,
	empSal.Salary,
	AVG(empSal.Salary) OVER (PARTITION BY empSal.JobTitle) AS AvgSalary
FROM SQLTutorial.dbo.tblEmployeeDemographics empDemo
JOIN SQLTutorial.dbo.tblEmployeeSalary empSal
	ON empDemo.EmployeeID = empSal.EmployeeID
ORDER BY
	empSal.JobTitle ASC,
	empSal.Salary DESC

-- Query: Group BY Average Salary
SELECT
	empSal.JobTitle,
	COUNT(empSal.JobTitle) AS NumEmployees,
	AVG(empSal.Salary) AS AvgSalary
FROM SQLTutorial.dbo.tblEmployeeDemographics empDemo
JOIN SQLTutorial.dbo.tblEmployeeSalary empSal
	ON empDemo.EmployeeID = empSal.EmployeeID
GROUP BY
	empSal.JobTitle
ORDER BY
	AvgSalary DESC

-- Group By: Here the output for average salary will be the same as there
-- aren't individuals of the same full name, title, age, gender, and salary.
SELECT
	empSal.JobTitle,
	empDemo.FirstName,
	empDemo.LastName,
	empDemo.Age,
	empDemo.Gender,
	empSal.Salary,
	AVG(empSal.Salary) AS AvgSalary
FROM SQLTutorial.dbo.tblEmployeeDemographics empDemo
JOIN SQLTutorial.dbo.tblEmployeeSalary empSal
	ON empDemo.EmployeeID = empSal.EmployeeID
GROUP BY
	empSal.JobTitle,
	empDemo.FirstName,
	empDemo.LastName,
	empDemo.Age,
	empDemo.Gender,
	empSal.Salary