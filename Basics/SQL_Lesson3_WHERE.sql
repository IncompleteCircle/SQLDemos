--------------------------------------------------------------------------
-- SQL Tutorial | Lesson 3 | WHERE Statements
-- Description:
-- Core SQL techniques explored in this tutorial.
-- Focus: Creating tables and inserting values into a created database.
-- Source: Tutorial Presented by Alex Freberg
-- Series: SQL Tutorials for Beginners
--------------------------------------------------------------------------

--------------------------------------------------------------------------
/*
Concepts Covered
Syntax - WHERE statement

Operators
 - =
 - <>
 - <
 - >
 - AND
 - OR
 - LIKE
 - NULL
 - NOT NULL
 - IN
*/
--------------------------------------------------------------------------

-- Query: WHERE statement - Return based on: '='
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
-- Description: Query returns records on a simple where clause based on
-- an employee's name.
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
WHERE SQLTutorial.dbo.tblEmployeeDemographics.FirstName = 'Jim'


-- Query: WHERE statement - Return based on: '<>'
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
-- Description: Query returns records on a simple where clause based on
-- not being the given employee's name.
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
WHERE SQLTutorial.dbo.tblEmployeeDemographics.FirstName <> 'Jim'

-- Query: WHERE statement - Return based on: '>='
-- DB: SQLTutorial
-- Table: EmployeeDemographics
-- Description: Returns records based on a greater than or equal to operator
-- on all records of the employees' ages.
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
WHERE SQLTutorial.dbo.tblEmployeeDemographics.Age >= 30

-- Query: WHERE statement - Return based on: '<='
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
-- Description: Returns records based on a less than or equal to operator
-- on all records of the employees' ages.
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
WHERE SQLTutorial.dbo.tblEmployeeDemographics.Age <= 31

-- Query: WHERE statement + "<=" + AND
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
-- Description: Returns records based on employee age criteria and gender.
-- Logical conjunction used.
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
WHERE 
	SQLTutorial.dbo.tblEmployeeDemographics.Age <= 32 AND
	SQLTutorial.dbo.tblEmployeeDemographics.Gender = 'Male'

-- Query: WHERE statement + "<=" + OR
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
-- Description: Returns records based on employee age criteria and gender.
-- Logical disjunction used.
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
WHERE 
	SQLTutorial.dbo.tblEmployeeDemographics.Age <= 32 OR
	SQLTutorial.dbo.tblEmployeeDemographics.Gender = 'Male'

-- Query: WHERE Statement + LIKE + Wildcard '[]%'
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
-- Description: Query returns all columns records based on a WHERE
-- statement with a LIKE + Wildcard operator. Wildcard operator here
-- '[]%' is based on all records starting with the following character.
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
WHERE SQLTutorial.dbo.tblEmployeeDemographics.LastName LIKE 'S%'

-- Query: WHERE Statement + LIKE + Wildcard '%[]%'
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
-- Description: Query returns all columns records based on a WHERE
-- statement with a LIKE + Wildcard operator. Wildcard operator here
-- '[]%' is based on all records having the following character anywhere.
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
WHERE SQLTutorial.dbo.tblEmployeeDemographics.LastName LIKE '%S%'

-- Query: WHERE Statement + LIKE + Wildcard '%[]'
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
-- Description: Query returns all columns records based on a WHERE
-- statement with a LIKE + Wildcard operator. Wildcard operator here
-- '[]%' is based on all records ending with following character.
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
WHERE SQLTutorial.dbo.tblEmployeeDemographics.LastName LIKE '%N'

-- Query: WHERE Statement + LIKE + Wildcard '[]%[]%'
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
-- Description: Query returns all column records based on a WHERE
-- statement with a LIKE + Wildcard operator. Wildcard operator here
-- '[]%[]%' is based on all records that starts with a given '[]' character
-- and '%[]%' somewhere in it.
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
WHERE SQLTutorial.dbo.tblEmployeeDemographics.LastName LIKE 'S%o%'

-- Query: WHERE statement + NULL
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
-- Description: Query returns all columns records where the value of a given
-- record is NULL.
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
WHERE SQLTutorial.dbo.tblEmployeeDemographics.FirstName is NULL

-- Query: WHERE statement + NOT NULL
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
-- Description: Query returns all columns records where the value of a given
-- record is NOT NULL.
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
WHERE SQLTutorial.dbo.tblEmployeeDemographics.FirstName is NOT NULL

-- Query: WHERE statement + IN
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
-- Description: IN statement (equivalent to multiple equal statements)
-- Query will return a column's records that fulfill any value in the IN list. 
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
WHERE SQLTutorial.dbo.tblEmployeeDemographics.FirstName IN ('Jim', 'Michael', 'Stanley', 'Dwight', 'Pam')