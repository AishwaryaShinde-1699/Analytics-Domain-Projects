-- Lead Score Case Study 

-- select the database
use new;

-- show tables 
show tables;

-- select the leads table
select * from leads;

-- Checking null values
SELECT * FROM leads WHERE TotalVisits IS NULL;

DELETE FROM leads WHERE TotalVisits IS NULL;

SELECT * FROM leads WHERE Country IS NULL;

UPDATE leads
SET Country = 'Unknown'
WHERE Country IS NULL OR Country = '';

update leads 
set Country = 'Other'
where Country is null or Country = 'Unknwon';

SELECT country FROM leads;

update leads
set Specialization = 'Other'
where Specialization is null or Specialization = '';

select Specialization from leads;

-- UPDATE leads
-- SET Country = 'Other'
-- WHERE Country = 'Unknown';

-- UPDATE leads
-- SET Country = 'Unknown'
-- WHERE Country IS NULL OR Country = '';

-- Select converted leads
SELECT * FROM leads WHERE Converted = 1;

-- Count leads from Google
select count(*) from leads where 'Lead Source' = 'Google'

-- Finding distinct values in a column:
SELECT DISTINCT Specialization FROM leads;

SELECT DISTINCT Newspaper FROM leads;

SELECT DISTINCT City FROM leads;

-- Aggregating data with grouping and counting:
SELECT Converted , COUNT(*) FROM leads
GROUP BY Converted;

-- Sorting data based on a specific column:
SELECT * FROM leads ORDER BY Converted ;

SELECT * FROM leads ORDER BY TotalVisits ;

SELECT * FROM leads ORDER BY City ;

-- Filterning Data

SELECT * FROM leads WHERE Converted = '1' ;

SELECT * FROM leads WHERE City = 'Mumbai' ;

SELECT * FROM leads WHERE Specialization = 'Finance Management' ;

-- Formatting data 
-- Converting text to lowercase or uppercase: 
UPDATE leads
SET `Country` = LOWER(`Country`);

UPDATE leads
SET `Specialization` = UPPER(`Specialization`);

-- Removing leading and trailing spaces from a column: 
UPDATE leads
SET `Lead Source` = TRIM(`Lead Source`);

-- Applying specific formatting rules: 
UPDATE leads
SET `Last Activity` = REPLACE(`Last Activity`, 'N/A', 'Not Available');

select * from leads;

