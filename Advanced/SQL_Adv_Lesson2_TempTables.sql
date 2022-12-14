--------------------------------------------------------------------------
-- SQL Tutorial | Lesson 2 | Temp Tables
-- Description:
-- SQL techniques explored in this tutorial.
-- Focus: Temp Tables
-- Source: Tutorial Presented by Alex Freberg
-- Series: Advanced SQL Tutorials
--------------------------------------------------------------------------

/*
Concept Covered: Temp Tables

Syntax - Create Temp Table:
	CREATE TABLE #(table name)

Syntax - Insert Row into Temp Table
	INSERT INTO #(temp table) (Field1, Field2, ..., Field 'n')
	VALUES (Val1, Val2, ..., Val 'n')

Syntax - Copy and Extract Table into Temp Table
	INSERT INTO #(temp table)
	SELECT [* or Same Fields]
	FROM DB.dbo.SomeTable
*/

/*
	This query creates a temp table to illustrate both its
	creation syntax and populating it with records.
*/
-- Query: Start
DROP TABLE IF EXISTS #temp_Employee
CREATE TABLE #temp_Employee (
	EmployeeID int,
	JobTitle varchar(100),
	Salary int
)

INSERT INTO #temp_Employee (EmployeeID, JobTitle, Salary)
VALUES 
	(1001, 'HR', 45000),
	(1002, 'Salesperson', 65000)

SELECT * FROM #temp_Employee
-- End

/*
	This query creates a temp table similar as above,
	however, it populates the relevant fields with records
	from another table. The other table has the same field 
	structure as the temp table.
*/
-- Query: Start	
DROP TABLE IF EXISTS #temp_Employee
CREATE TABLE #temp_Employee (
	EmployeeID int,
	JobTitle varchar(100),
	Salary int
)
INSERT INTO #temp_Employee
SELECT *
FROM SQLTutorial.dbo.tblEmployeeSalary

SELECT * FROM #temp_Employee
-- End

/*
	Query Description:
	This query creates a temp table, #temp_Employee2 to which it will
	store the following (aggregated) fields and their records.
	It will insert from two other tables that are (inner) joined, and
	perform their aggregate functions accordingly. The joined tables
	records are grouped by the respective job title found in them.
*/
-- Query - Start
DROP TABLE IF EXISTS #temp_Employee2
CREATE TABLE #temp_Employee2 (
	JobTitle varchar(50),
	EmployeesPerJob int,
	AvgAge int,
	AvgSalary int
)

INSERT INTO #temp_Employee2
SELECT 
	JobTitle,
	COUNT(JobTitle),
	AVG(Age),
	AVG(Salary)
FROM
	SQLTutorial.dbo.tblEmployeeDemographics emp
JOIN SQLTutorial.dbo.tblEmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
GROUP BY
	JobTitle
	
SELECT * FROM #temp_Employee2
-- End

-- Drop temp tables
DROP TABLE IF EXISTS #temp_Employee, #temp_Employee2