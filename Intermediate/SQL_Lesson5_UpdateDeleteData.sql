--------------------------------------------------------------------------
-- SQL Tutorial | Lesson 4 | Update & Delete Data
-- Description:
-- Core SQL techniques explored in this tutorial.
-- Focus: Updating and Deleting Data
-- Source: Tutorial Presented by Alex Freberg
-- Series: SQL Tutorials Intermediate Level
--------------------------------------------------------------------------

--------------------------------------------------------------------------
/*
Concepts:
- Update Data
- Delete Data

INSERT INTO vs. UPDATE:
'INSERT INTO' creates a new row (record) in the specified table, while
'UPDATE' is going to alter a pre-existing row (record).

Delete Data:
Deleting will specify which rows (records) the user wishes to delete
in a specified table.

UPDATE Clause Syntax:
	UPDATE [DB].dbo.[Table]
	SET [Column] = [value]
	WHERE ... [conditions]

DELETE Clause Syntax:
	DELETE FROM [DB].dbo.[Table]
	WHERE ... [conditions]
*/
--------------------------------------------------------------------------

-- Query: View employee demographics table to inspect if any null or invalid
-- values are present.
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics

-- Query: Update table records that contain null with correct input.
UPDATE 
	SQLTutorial.dbo.tblEmployeeDemographics
SET 
	EmployeeID = 1012, Age = 31, Gender = 'Female'
WHERE 
	SQLTutorial.dbo.tblEmployeeDemographics.FirstName = 'Holly' AND
	SQLTutorial.dbo.tblEmployeeDemographics.LastName = 'Flax'

-- Query: Delete table record
-- Temporary insert a value for demonstrative purposes
INSERT INTO SQLTutorial.dbo.tblEmployeeDemographics VALUES
(1014, 'Robert', 'California', 55, 'Male')

-- View the new inserted record
SELECT *
FROM SQLTutorial.dbo.tblEmployeeDemographics
WHERE EmployeeID = 1014

-- Now delete the specified row with the employee ID = 1014
DELETE
FROM SQLTutorial.dbo.tblEmployeeDemographics
WHERE EmployeeID = 1014