--------------------------------------------------------------------------
-- SQL Tutorial | Lesson 1 | Create Tables
-- Description:
-- Core SQL techniques explored in this tutorial.
-- Focus: Creating tables and inserting values into a created database.
-- Source: Tutorial Presented by Alex Freberg
-- Series: SQL Tutorials for Beginners
--------------------------------------------------------------------------

--------------------------------------------------------------------------
-- Step 1: Create Two Tables
--------------------------------------------------------------------------
-- Query: Create Table
-- DB: SQLTutorial
-- Table: EmployeeDemographics
-- Description: Contains basic employee information

-- Use created database: SQLTutorial
-- Checks to see if the table exists prior to initialization
USE SQLTutorial
GO
IF EXISTS 
	(SELECT *
	FROM sys.tables
	WHERE SCHEMA_NAME(schema_id) LIKE 'dbo'
	AND name like 'tblEmployeeDemographics'
	)
DROP TABLE dbo.tblEmployeeDemographics;
GO
CREATE TABLE SQLTutorial.dbo.tblEmployeeDemographics
(
	EmployeeID int,
	FirstName varchar(50),
	LastName varchar(50),
	Age int,
	Gender varchar(50)
)

-- Query: Create Table
-- DB: SQLTutorial
-- Table: EmployeeSalary
-- Description: Table that contains employee position + salary information

-- Use created database: SQLTutorial
-- Checks to see if the table exists prior to initialization
USE SQLTutorial
GO
IF EXISTS 
	(SELECT *
	FROM sys.tables
	WHERE SCHEMA_NAME(schema_id) LIKE 'dbo'
	AND name like 'tblEmployeeSalary'
	)
DROP TABLE dbo.tblEmployeeSalary;
GO
CREATE TABLE SQLTutorial.dbo.tblEmployeeSalary
(
	EmployeeID int,
	JobTitle varchar(50),
	Salary int
)
--------------------------------------------------------------------------

--------------------------------------------------------------------------
-- Step 2: Insert Data into Tables
--------------------------------------------------------------------------
-- Query: Inserting Data Into Table
-- DB: SQLTutorial
-- Table: EmployeeDemographics
-- Description: Inserts basic employee information
INSERT INTO SQLTutorial.dbo.tblEmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

-- Query: Inserting Data Into Table
-- DB: SQLTutorial
-- Table: EmployeeSalary
-- Description: Inserts employee position and salary information
INSERT INTO SQLTutorial.dbo.tblEmployeeSalary VALUES
(1001, 'Salesperson', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesperson', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesperson', 48000),
(1009, 'Accountant', 42000)
--------------------------------------------------------------------------