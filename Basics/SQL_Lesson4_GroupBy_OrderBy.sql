--------------------------------------------------------------------------
-- SQL Tutorial | Lesson 4 | Group By and Order By Statements
-- Description:
-- Core SQL techniques explored in this tutorial.
-- Focus: Using the Group By and Order By Statements
-- Source: Tutorial Presented by Alex Freberg
-- Series: SQL Tutorials for Beginners
--------------------------------------------------------------------------

--------------------------------------------------------------------------
/*
Concepts:
 - Group By
 - Order By

Aggregate Functions
- COUNT()
*/
--------------------------------------------------------------------------

--------------------------------------------------------------------------
-- Query: Group By [By One Column]
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
-- Description:
-- Run both queries to inspect how Group By groups and returns the total
-- number of rows associated to a column's unique distinct characteristics.
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics

SELECT SQLTutorial.dbo.tblEmployeeDemographics.Gender, COUNT(Gender)
FROM SQLTutorial.dbo.tblEmployeeDemographics
GROUP BY SQLTutorial.dbo.tblEmployeeDemographics.Gender

-- Query: Group By [By Two Columns]
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics

SELECT
	SQLTutorial.dbo.tblEmployeeDemographics.Gender,
	SQLTutorial.dbo.tblEmployeeDemographics.Age,
	COUNT(SQLTutorial.dbo.tblEmployeeDemographics.Gender)
FROM
	SQLTutorial.dbo.tblEmployeeDemographics
GROUP BY
	SQLTutorial.dbo.tblEmployeeDemographics.Gender,
	SQLTutorial.dbo.tblEmployeeDemographics.Age

-- Query: Group By [One Column] + WHERE Statement
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
-- Description: Query will return the COUNT of a single column
-- with a WHERE criteria statement implemented.

-- Query: Group By [By Two Columns] + WHERE statement
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics

SELECT
	SQLTutorial.dbo.tblEmployeeDemographics.Gender,
	COUNT(SQLTutorial.dbo.tblEmployeeDemographics.Gender) AS CountEmployeeGender
FROM 
	SQLTutorial.dbo.tblEmployeeDemographics
WHERE 
	SQLTutorial.dbo.tblEmployeeDemographics.Age > 31
GROUP BY 
	SQLTutorial.dbo.tblEmployeeDemographics.Gender

-- Query: Group By + Order By + WHERE
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
-- Description: Perform similar Group By query, but added a Order By
-- to sort the data by descending order.
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics

SELECT 
	SQLTutorial.dbo.tblEmployeeDemographics.Gender,
	COUNT(SQLTutorial.dbo.tblEmployeeDemographics.Gender)
FROM 
	SQLTutorial.dbo.tblEmployeeDemographics
WHERE
	SQLTutorial.dbo.tblEmployeeDemographics.Age >= 31
GROUP BY
	SQLTutorial.dbo.tblEmployeeDemographics.Gender
ORDER BY
	SQLTutorial.dbo.tblEmployeeDemographics.Gender DESC

-- Query: Order By [Single Column]
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
-- Description:
-- Orders the queries return based on a given column, default: ascending
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
ORDER BY SQLTutorial.dbo.tblEmployeeDemographics.Age ASC

-- Query: Order By [Two Columns]
-- DB: SQLTutorial
-- Table: tblEmployeeDemographics
-- Description:
-- Orders the queries return based on a given column
-- Can alter the choice of each order by a given order type [ASC or DESC]
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
ORDER BY 
	SQLTutorial.dbo.tblEmployeeDemographics.Age ASC, 
	SQLTutorial.dbo.tblEmployeeDemographics.Gender ASC

SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
ORDER BY 
	SQLTutorial.dbo.tblEmployeeDemographics.Age DESC, 
	SQLTutorial.dbo.tblEmployeeDemographics.Gender ASC