-- Main Table
-- Stores the details of the Workers
CREATE TABLE Worker 
( 
  Worker_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,  
  First_Name CHAR(25),
  Last_Name CHAR(25),
  Salary INT(15),
  Joining_Date DATETIME,
  Department CHAR(25)
);  

Insert INTO Worker 
    (Worker_id, First_Name, Last_Name, Salary, Joining_Date, Department) 
    VALUES
    (001, 'Monika' , 'Arora', 100000, '14-02-20 09:00:00'  , 'HR'),
    (002, 'Niharika' , 'Verma', 80000, '14-06-11 09:00:00' , 'Admin'),
    (003, 'Vishal' , 'Singhal', 300000, '14-02-20 09:00:00' , 'HR'),
    (004, 'Amitabh' , 'Singh', 500000, '14-02-20 09:00:00' , 'Admin'),
    (005, 'Vivek' , 'Bhati', 500000, '14-06-11 09:00:00' , 'Admin'), 
    (006, 'Vipul' , 'Diwan' , 200000 , '14-06-11 09:00:00' , 'Account'),
    (007, 'Satish' , 'Kumar' , 75000, '14-01-20 09:00:00' , 'Account'),
    (008, 'Geetika' , 'Chauhan' , 90000, '14-04-11 09:00:00' , 'Admin'); 
        
SELECT * FROM Worker;

-- References from the Main Table 'Worker'
-- Stores the Amount of Bonus being given to some Worker Corresponding to their 'Worker_id'
CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
    ON DELETE CASCADE
);

INSERT INTO Bonus
       (WORKER_REF_ID , BONUS_AMOUNT , BONUS_DATE)
       VALUES
       (001, 5000, '16-02-20'),
		   (002, 3000, '16-06-11'),
		   (003, 4000, '16-02-20'),
		   (001, 4500, '16-02-20'),
		   (002, 3500, '16-06-11');
		   
SELECT * FROM Bonus;

-- References the Main Table 'Worker'
-- Stores the Title assigned to a worker Corresponding to their 'Worker_id'
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title
         (WORKER_REF_ID , WORKER_TITLE , AFFECTED_FROM)
         VALUES
          (001, 'Manager', '2016-02-20 00:00:00'),
          (002, 'Executive', '2016-06-11 00:00:00'),
          (008, 'Executive', '2016-06-11 00:00:00'),
          (005, 'Manager', '2016-06-11 00:00:00'),
          (004, 'Asst. Manager', '2016-06-11 00:00:00'),
          (007, 'Executive', '2016-06-11 00:00:00'),
          (006, 'Lead', '2016-06-11 00:00:00'),
          (003, 'Lead', '2016-06-11 00:00:00');
    
SELECT * FROM Title;


--  Query1
-- Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT First_Name FROM Worker AS WORKER_NAME;

-- Query 2
-- Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT UPPER(FIRST_NAME) from Worker;

-- Query 3
-- Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT distinct(DEPARTMENT) FROM Worker;

-- Query 4
-- Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
-- SUBSTRING(string, start, length)
-- The start position. The first position in string is 1.
SELECT SUBSTRING(FIRST_NAME , 1, 3) FROM Worker;

-- Query 5
--  Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
/*
The Below Query Would give me the Entries where the first Name is Amitabh.
SELECT * FROM Worker 
WHERE first_name = 'Amitabh';

Now to find the position of a SubString in a String, we use INSTR Function
INSTR(string1, string2)
String1 - the main string to be searched in
String2 - The string to be searched in string1 - 0 returned if not found
Note: Ye Function Case Insensitive Search Karta Hai, meaning that case ka farak ni padta isse - both would be treated in a Similar Manner.
*/

SELECT INSTR(FIRST_NAME, 'b')
FROM Worker
WHERE FIRST_NAME = 'Amitabh';

-- Query 6
-- Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
-- LTRIM() would remove it from the left Side.
SELECT RTRIM(FIRST_NAME) from Worker;

-- Query 7
-- Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT LTRIM(DEPARTMENT) from Worker;
-- Query 8
-- Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
-- Length() Function is used to find the length of the string in a Table.
SELECT DISTINCT(DEPARTMENT), LENGTH(DEPARTMENT) FROM Worker;

-- Query 9
-- Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
-- REPLACE(string, from_string, new_string)
SELECT Replace(FIRST_NAME, 'a', 'A') FROM Worker;

-- Query 10
-- Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them and the concat Function can take Whatever number of Arguments are given to it.
-- CONCAT(expression1, expression2, expression3,...)
SELECT CONCAT(FIRST_NAME , ' ', LAST_NAME)AS COMPLETE_NAME FROM Worker;

-- Query 11
-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
-- By default, the Order that is given out would be in Ascending Order, therefore it is not important to mention the 'ASC' Clause
SELECT * FROM Worker
ORDER BY FIRST_NAME ASC;

-- Query 12
-- Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
-- The order by clause can be passed multiple statements & not just ordering by some single column!
SELECT * FROM Worker
ORDER BY FIRST_NAME ASC, DEPARTMENT desc;

-- Query 13
-- Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
-- 'IN' Keyword can be used to pass Multiple Possible Arguments for the column being asked values from.
SELECT * FROM Worker
WHERE FIRST_NAME IN ("Vipul" , "Satish");

-- Query 14
-- Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
-- The 'NOT' Keyword would exclude the values given in the Arguments mentioned by the user.
SELECT * FROM Worker
WHERE FIRST_NAME NOT IN ("Vipul" , "Satish");

-- Query 15
-- Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
-- The '*' means that after the 'admin' text you can have any text & it would be still shown in the results.
-- Therefore, we'll be using Wildcards here.
SELECT * FROM Worker
WHERE DEPARTMENT 
LIKE 'Admin%';

-- Query 16
-- Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
-- The '%' sign is helpul where there are no characters [NULL Character] or even when they are there, there can be n number of characters
SELECT *
FROM Worker
WHERE FIRST_NAME LIKE '%a%';

-- Query 17
-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT *
FROM Worker
WHERE FIRST_NAME LIKE '%a';


-- Query 18
-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
-- Now here, we can't place '%' because it can then be replaced with any number of characters - but here all we want are 6 total alphaberts in the output.
-- Since we are sure about the number of alphabets, we'll be using the '_'.
-- Therefore, the h character would be placed at the 6th position in the String like -> '_____ h'
SELECT * 
FROM Worker
where FIRST_NAME LIKE '_____h';

-- Query 19
-- Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
-- We'll be using the 'BETWEEN' Keyword.
SELECT * FROM Worker
WHERE SALARY BETWEEN 100000 AND 500000;

-- Query 20
-- Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM Worker
WHERE YEAR(Joining_Date) = 2014 AND MONTH(Joining_Date) = 02;

-- Query 21
-- Write an SQL query to fetch the count of employees working in the department ‘Admin’.
-- We'll Have to use the 'Aggregate' functions here - they perform calculations on a set of values & return a single value.
SELECT department, COUNT(department) 
FROM Worker
WHERE department = "Admin";

-- Query 22
-- Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
SELECT CONCAT(FIRST_NAME, ' ', Last_Name) AS Full_Name
From Worker WHERE (Salary >= 50000 AND Salary <= 100000);

-- Query 23
-- Write an SQL query to fetch the no. of workers for each department in the descending order.
-- Clearly, Grouping requires to be done here!
SELECT department , COUNT(department) AS "Total Workers"
FROM Worker
GROUP BY(department)
ORDER BY COUNT(department) DESC;

-- Query 24
-- Write an SQL query to print details of the Workers who are also Managers.
-- We've the worker details in the 'Workers' table & all the title details in the 'titles' table.
-- We'll apply an inner join on 'Workers' table with 'title' table
-- Since after applying Join, we would get all the column titles from both the tables, if you want to get only one table's columns, you can write it like
-- 'SELECT w.*' FROM ...
SELECT * FROM 
Worker as w INNER JOIN Title as t
ON w.WORKER_ID = t.WORKER_REF_ID
WHERE t.WORKER_TITLE = 'Manager';

-- Query 25
-- Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
-- We clearly need the Aggregation Function to Group the same worker tiles together
-- And if we've to put the filtering on the group values being returned, we'll be using the 'Having' Keyword.
SELECT WORKER_TITLE, count(WORKER_TITLE) AS "Count"
FROM Title 
GROUP BY WORKER_TITLE
HAVING count(WORKER_TITLE) > 1;

-- Query 26 [An IMPORTANT interesting Query]
-- Write an SQL query to show only odd rows from a table.
-- To do this, we'll be using the MOD Keyword 
-- The MOD() function returns the remainder of a number divided by another number.
-- Syntax: MOD(x,y) or (x MOD y) or (x%y)
SELECT * FROM Worker 
where MOD(WORKER_ID , 2) != 0;
-- We did the Mod with 'Worker ID' as it was Auto Incremented, so we'll get the odd ones out easily!
-- Also, there is one more sign that behaves exactly similar to the 'not equal to' sign which is '<>'

-- Query 27
-- Write an SQL query to show only even rows from a table.
SELECT * FROM Worker
WHERE WORKER_ID%2 = 0;

-- Query 28
-- Write an SQL query to clone a new table from another table.
-- The 'Like' Clause can be used to create the clone of one table from some other.
-- It would completely copy the Schems but not the values!
CREATE TABLE WORKER_CLONE like Worker;
-- If you also wish to insert the same data into the clone from the parent table (the one you cloned this table from), you can write the following query
INSERT INTO WORKER_CLONE 
SELECT * FROM Worker;

SELECT * FROM WORKER_CLONE;

-- Query 29
-- Write an SQL query to fetch INTERSECTING records of two tables.
-- There is no Keyword like Intersect in SQL, & therefore we'lll be using the JOIN Keyword.
SELECT w1.* FROM
Worker as w1 INNER JOIN WORKER_CLONE as w2
using(WORKER_ID);

-- Query 30
-- Write an SQL query to show records from one table that another table does not have.
-- Here, we'll use the MINUS SET Operation
-- The result Set where the Match doesn't happen for the WORKER_IDs get shown.
SELECT * from 
Worker LEFT JOIN WORKER_CLONE
Using(WORKER_ID)
WHERE WORKER_CLONE.WORKER_ID is NULL;

-- Query 31
-- Write an SQL query to show the current date and time.
-- For current Date And Time Operation, we are going to use the Dual Table.
-- The DUAL is special one row, one column table present by default in all Oracle databases.
SELECT curdate();

-- For time, we use the now() function - but it gives the complete date & time [the timestamp]
-- The time returned back are that of the server, it might not necessarily be similar to that of your current Location.
SELECT now();

-- Query 32
-- Write an SQL query to show the top n (say 5) records of a table order by descending salary.
-- The 'Limit' Keyword restricts the number of values being returned.
SELECT DISTINCT SALARY FROM Worker
ORDER BY Salary DESC
LIMIT 5;

-- Query 33
-- Write an SQL query to determine the nth (say n=5) highest salary from a table.
-- There are two ways of doing it:
-- Way 1 [by using the limit keyword And the Offset Keyword]
-- The 'OFFSET' argument is used to identify the starting point to return rows from a result set. Basically, it excludes the first set of records.
-- The 'limit' keyword would be restricting the number of rows that should be given as an output.
-- The value of the OFFSET Keyword is 'n-1', it means that to get the nth highest record, you wish to start printing the values from n-1th row as indexing starts from 0.
SELECT DISTINCT(Salary) 
FROM Worker
ORDER BY Salary DESC
LIMIT 1 Offset 4;

-- OR it can also be done by this 
-- SELECT DISTINCT(Salary) 
-- FROM Worker
-- ORDER BY Salary DESC
-- LIMIT n-1, 1;

-- OR it can also be done by this 
-- SELECT DISTINCT(Salary) 
-- FROM Worker
-- ORDER BY Salary DESC
-- LIMIT 1 OFFSET n-1;

-- Way 2 [by using Correlated sub-query] Shown in the Query 34
-- Query 34
-- Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
SELECT Salary FROM Worker as w1
where 4  = (
  Select count(distinct(w2.salary))
  FROM Worker as w2
  WHERE w2.salary >= w1.salary
);

-- Query 35
-- Write an SQL query to fetch the list of employees with the same salary.
-- The below query [a default Inner Join] would also do the comparison of the employee with himself/herself but we don't want this.
SELECT * FROM 
Worker as w1 , Worker as w2 
WHERE w1.salary = w2.salary;

-- To improve on that, we'll make the IDs dissimilar so that the same workers are not compared
SELECT * FROM
Worker as w1, Worker as w2
WHERE (w1.Salary = w2.Salary AND w1.WORKER_ID <> w2.WORKER_ID);

-- Query 36
-- Write an SQL query to show the second highest salary from a table using sub-query.
SELECT MAX(DISTINCT(Salary))
From Worker
WHERE salary < (
  SELECT MAX(DISTINCT(SALARY))
  FROM Worker
);

-- The Above Query can be rewritten as:
SELECT MAX(Salary) FROM Worker
Where Salary NOT IN (SELECT MAX(SALARY) FROM Worker);

-- Query 37
-- Write an SQL query to show one row twice in results from a table. [Not a that useful query but it is useful in clearing the concept about Unions]
-- We know that When we take the 'Union' of two sets, we only get the Distinct values in the resulting set but to get all thos similar values in the resulting set we can use the 'UNION ALL' Clause - this would result in us getting those multiple values
SELECT * FROM
Worker 
UNION 
SELECT * FROM
Worker;

SELECT * FROM
Worker 
UNION ALL
SELECT * FROM
Worker
ORDER BY worker_id;

-- Query 38
-- Write an SQL query to list worker_id who does not get bonus.
-- The 'Bonus' table is not storing the data of all the employees, therefore clearly if we know what employees are there in the bonus table, we'll get their data out;
SELECT worker_id FROM Worker
where worker_id NOT IN (SELECT WORKER_REF_ID FROM Bonus);

-- Query 39
-- Write an SQL query to fetch the first 50% records from a table.
-- The worker table currently has 8 rows and we also know that the worker_id column is self-Incrementing therefore the actual ans would be where worker_id <= total count of worker ids in the table.
SELECT * 
FROM Worker
where worker_id <= (SELECT COUNT(worker_id)/2 from Worker);

-- Query 40
-- Write an SQL query to fetch the departments that have less than 4 people in it.
SELECT department, COUNT(department)
FROM Worker
GROUP BY department
HAVING COUNT(department) < 4;

-- Query 41
-- Write an SQL query to show all departments along with the number of people in there.
SELECT department, COUNT(department)
FROM Worker
GROUP BY department;

-- Query 42 [Interesting]
-- Write an SQL query to show the last record from a table.
-- We know that the worker id  is self-Incrementing, therefore we'll find the the max worker_id first and print the data corresponding to it
SELECT * 
FROM Worker
where worker_id = (
  SELECT MAX(worker_id)
  FROM Worker
);

-- Query 43
-- Write an SQL query to fetch the first row of a table.
-- Similar to the previous query, but here we find the Minimum value of Worker_id
SELECT * 
FROM Worker
where worker_id = (
  SELECT MIN(worker_id)
  FROM Worker
);

-- Query 44
-- Write an SQL query to fetch the last five records from a table.
-- Again, we use the Auto Incrmenting Property of Worker_id & order them in the descending order & then limit the results
SELECT * 
FROM Worker
ORDER BY worker_id DESC
LIMIT 5;
-- But the above query is actually reversing the order in which how the values were present in the table, so we need to correct this well & reverse its output to get the original way how the rows were stored in the Table
(
  SELECT * 
  FROM Worker
  ORDER BY worker_id DESC
  LIMIT 5
)ORDER BY worker_id;

-- Query 45
-- Write an SQL query to print the name of employees having the highest salary in each department.
SELECT department, MAX(Salary) 
FROM Worker 
GROUP BY department;

-- Another way of doing it by using Joins
SELECT w.department, w.first_name, w.salary
FROM(
  SELECT MAX(Salary) as Maxsal, department
  FROM Worker
  GROUP BY Department
) AS temp
Inner Join Worker as w 
ON w.Salary = temp.MaxSal;

-- Query 46
-- Write an SQL query to fetch three max salaries from a table using co-related subquery.
Select Distinct(Salary)
From Worker as w1
where 3>= (
  SELECT COUNT(DISTINCT(Salary))
  From Worker as w2
  where w2.Salary >= w1.Salary
) ORDER By Salary Desc;

-- Its Limit Form:
SELECT Distinct(Salary)
From Worker 
ORDER By Salary DESC
LIMIT 3;

-- Query 47
-- Write an SQL query to fetch three min salaries from a table using co-related subquery
Select Distinct(Salary)
From Worker as w1
where 3>= (
  SELECT COUNT(DISTINCT(Salary))
  From Worker as w2
  where w2.Salary <= w1.Salary
) ORDER By Salary;

-- For obtaining the 'n' Minimum salaries, we can have a general form for the query like below with just the comparison values changed:
-- Select Distinct(Salary)
-- From Worker as w1
-- where n>= (
--   SELECT COUNT(DISTINCT(Salary))
--   From Worker as w2
--   where w2.Salary >= w1.Salary
-- ) ORDER By Salary;

-- Query 48
-- Write an SQL query to fetch nth max salaries from a table.
-- For obtaining the 'n' Maximum salaries, we can have a general form for the query like below:
-- Select Distinct(Salary)
-- From Worker as w1
-- where n>= (
--   SELECT COUNT(DISTINCT(Salary))
--   From Worker as w2
--   where w2.Salary <= w1.Salary
-- ) ORDER By Salary;

-- Query 49
-- Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT Department, SUM(salary) as depSal
FROM Worker
Group BY Department
ORDER BY depSal DESC;

-- Query 50
-- Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT first_name, salary
FROM Worker Where 
Salary = (
  SELECT Max(Salary)
  FROM Worker
;

-- Query 51
-- Remove the Reversed Number Pair from the given Table






