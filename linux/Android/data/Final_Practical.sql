show databases;

create database myDatabase;
use myDatabase;

-- Creating DEPARTMENT table
CREATE TABLE DEPARTMENT (
    Dno INTEGER NOT NULL PRIMARY KEY,
    Dname VARCHAR(50),
    Location VARCHAR(50) default "New Delhi"
);

desc DEPARTMENT;

-- Inserting data into DEPARTMENT table
INSERT INTO DEPARTMENT (Dno, Dname, Location)
VALUES  (10,'Accounting','New York'),
		(20,'Research','Dallas'),
		(30,'Sales','Chicago'),
		(40,'Operation','Boston'),
		(50,'Marketing','New Delhi'),
		(60,'HR','India'),
		(70,'Editorial','New Delhi');
        
select * from DEPARTMENT;

desc DEPARTMENT;

-- Creating EMPLOYEE table
CREATE TABLE EMPLOYEE (
    Eno CHAR(3) NOT NULL PRIMARY KEY,
    Ename VARCHAR(50) NOT NULL,
    Job_type VARCHAR(50) NOT NULL,
    Manager CHAR(3),
    Hire_date DATE NOT NULL,
    Dno INTEGER,
    Commission DECIMAL(10,2),
    Salary DECIMAL(7,2) NOT NULL,
    FOREIGN KEY (Manager) REFERENCES EMPLOYEE(Eno),
    FOREIGN KEY (Dno) REFERENCES DEPARTMENT(Dno)
);

desc EMPLOYEE;

-- Inserting data into EMPLOYEE table
INSERT INTO EMPLOYEE (Eno, Ename, Job_type, Manager, Hire_date, Dno, Commission, Salary)
VALUES 
	('736','Durgesh','Manager',NULL,'1981-12-17',30,200.00,10000.00),
('749','Ritik','Sales_Officer','736','1981-02-20',30,300.00,2000.00),
('752','Jam','Sales_Officer','749','1981-02-22',30,500.00,1300.00),
('756','Sam','Manager','752','1981-04-02',20,200.00,2300.00),
('765','Aambika','Sales_Officer','752','1981-04-22',30,1400.00,1250.00),
('769','Nitu','Manager','756','1981-05-01',50,300.00,2870.00),
('778','Kulkarni','Manager',NULL,'1981-06-09',60,100.00,2900.00),
('783','Tata','President','769','1981-11-17',70,100.00,2950.00),
('787','Bunny','Sales_Officer','778','1981-09-08',50,300.00,1450.00),
('790','Ronit','Clerk','783','1983-01-12',70,200.00,1150.00),
('794','Ronit','Worker','787','1985-07-24',30,200.00,1550.00),
('797','Ronit','Worker','790','1973-03-14',20,350.00,1650.00),
('799','Utkarsh','Worker','794','1989-07-30',10,400.00,1900.00);
    
select * from EMPLOYEE;

-- Query 1: Display employee Ename, Job_type, Hire Date, employee Number; for each employee with the employee Number appearing first.
SELECT Eno, Ename, Job_type, Hire_Date
FROM employee
ORDER BY Eno;

-- Query 2: Display unique Job_types from the employee Table.
SELECT DISTINCT Job_type
FROM employee;

-- Query 3: Display the employee Ename concatenated by a Job_type separated by a comma.
SELECT CONCAT(Ename, ', ', Job_type) AS employeeEnameAndJob_type
FROM employee;

-- Query 4: Display all the data from the employee Table. Separate each Column by a comma and Ename the said column as THE_OUTPUT.
SELECT CONCAT_WS(Eno, ', ', Ename, ', ', Job_type, ', ', Hire_Date, ', ', Manager, ',', Salary, ', ', Commission, ', ', Dno) AS THE_OUTPUT
FROM employee;

SELECT CONCAT_WS( ', ',Eno, Ename, Job_type, Manager, Hire_Date, Salary, Commission, Dno) AS THE_OUTPUT
FROM employee;

-- Query 5: Display the employee Ename and Salary of all the employee earning more than $2850.
SELECT Ename, Salary
FROM employee
WHERE Salary > 2850;

-- Query 6: Display employee Ename and Department Number for the employee No= 7900.
SELECT Ename, Dno
FROM employee
WHERE Eno = 736;

-- Query 7: Display employee Ename and Salary for all employee whose salary is not in the range of $1500 and $2850.
SELECT Ename, Salary
FROM employee
WHERE Salary NOT BETWEEN 1500 AND 2850;

-- Query 8: Display employee Ename and Department No. of all the employee in Dept 10 and Dept 30 in the alphabetical order by Ename.
SELECT Ename, Dno
FROM employee
WHERE Dno IN (10, 30)
ORDER BY Ename;

-- Query 9: Display Ename and Hire Date of every employee who was hired in 1981.
SELECT Ename, Hire_Date
FROM employee
WHERE YEAR(Hire_Date) = 1981;

-- Query 10: Display Ename and Job_type of all employee who don’t have a current Manager.
SELECT Ename, Job_type
FROM employee
WHERE Manager IS NULL;

-- Query 11: Display the Ename, Salary and Commission for all the employee who earn commission.
SELECT Ename, Salary, Commission
FROM employee
WHERE Commission IS NOT NULL;

-- Query 12: Sort the data in descending order of Salary and Commission.
SELECT *
FROM employee
ORDER BY Salary DESC, Commission DESC;

-- Query 13: Display Ename of all the employee where the third letter of their Ename is ‘A’.
SELECT Ename
FROM employee
WHERE SUBSTRING(Ename, 3, 1) = 'A';

-- Query 14: Display Ename of all employee either have two ‘R’s or have two ‘A’s in their Ename and are either in Dept No = 30 or their Manager’s employee No = 7788.
SELECT Ename
FROM employee
WHERE ((CHAR_LENGTH(REPLACE(Ename, 'R', '')) = CHAR_LENGTH(Ename) - 2) OR (CHAR_LENGTH(REPLACE(Ename, 'A', '')) = CHAR_LENGTH(Ename) - 2))
AND (Dno = 30 OR Manager = 7788);

-- Query 15: Display Ename, Salary and Commission for all employee whose Commission amount is 14 greater than their Salary increased by 5%.
SELECT Ename, Salary, Commission
FROM employee
WHERE Commission > (Salary * 1.05 + 14);

-- Query 16: Display the Current Date.
SELECT CURDATE() AS CurrentDate;

-- Query 17: Query to display Name and Department Name for all employee who work in the 'IT' department and have a salary greater than 4000.
SELECT e.Ename, d.Dname
FROM employee e
JOIN DEPARTMENT d ON e.Dno = d.Dno
WHERE d.Dname = 'IT' AND e.Salary > 4000;

-- Query 18: Query to display Name and calculate the number of months between today and the date each employee was hired.

SELECT E.Ename AS Name, 
       TIMESTAMPDIFF(MONTH, E.Hire_date, CURDATE()) AS Months_since_hire
FROM employee E;

-- Query 19: Display employee who earn less than Salary monthly but want more than 3 times their current Salary. Label the column as Dream Salary.
SELECT Ename, (Salary * 3) AS "Dream Salary"
FROM employee
WHERE Salary < Commission;

-- Query 20: Display Name with the first letter capitalized and all other letters in lower case, and length of their name for employee whose name starts with 'J', 'A', or 'M'.
SELECT CONCAT(UPPER(LEFT(Ename, 1)), LOWER(SUBSTRING(Ename, 2, LENGTH(Ename)))) AS Name,
       LENGTH(Ename) AS Name_Length
FROM employee
WHERE Ename LIKE 'J%' OR Ename LIKE 'A%' OR Ename LIKE 'M%';

-- Query 21: Display Name, Hire Date, and Day of the week on which the employee started.
SELECT Ename, Hire_date, DAYNAME( Hire_date) AS Day_of_Week
FROM employee;


-- Query 22: Display Name, Department Name, and Department No. for all employee.
SELECT Ename, Dname AS Department_Name, employee.Dno AS Department_No
FROM employee
INNER JOIN DEPARTMENT ON EMPLOYEE.Dno = DEPARTMENT.Dno;


-- Query 23: Display unique listing of all Jobs that are in Department #30.
SELECT DISTINCT Job_type
FROM employee
WHERE Dno = 30;

-- Query 24: Display Name and Dept Name of all employee who have an 'A' in their name.
SELECT Ename, Dname AS Dept_Name
FROM employee
INNER JOIN DEPARTMENT ON employee.Dno = DEPARTMENT.Dno
WHERE Ename LIKE '%A%';

-- Query 25: Display Name, Job, Department No., and Department Name for all employee working at the Dallas location.
SELECT Ename, Job_type AS Job, employee.Dno AS Department_No, Dname AS Department_Name
FROM employee
INNER JOIN DEPARTMENT ON employee.Dno = DEPARTMENT.Dno
WHERE Location = 'New Delhi';

-- Query 26: Display Name, employee No., Manager's Name, and Manager's employee No., along with the employee' Name who do not have a Manager.
SELECT e1.Ename, e1.Eno AS employee_No, e2.Ename AS Manager_Name, e2.Eno AS Manager_employee_No
FROM employee e1
LEFT JOIN employee e2 ON e1.Manager = e2.Eno;

-- Query 27: Display Name, Dept No., and Salary of any employee whose Department No. and Salary matches both the Department No. and the Salary of any employee who earns a commission.
SELECT Ename, employee.Dno AS Dept_No, Salary
FROM employee
WHERE EXISTS (
    SELECT *
    FROM employee
    INNER JOIN DEPARTMENT ON employee.Dno = DEPARTMENT.Dno
    WHERE Commission IS NOT NULL AND Salary = Commission
);


-- Query 28: Display Name and Salaries represented by asterisks, where each asterisk (*) signifies $100.
SELECT Ename, RPAD('*', Salary/100, '*') AS Salary_Asterisks
FROM employee;

-- Query 29: Highest, Lowest, Sum and Average Salaries of all employee
SELECT MAX(Salary) AS HighestSalary, MIN(Salary) AS LowestSalary, SUM(Salary) AS TotalSalary, AVG(Salary) AS AverageSalary
FROM employee;

-- Query 30: Number of employee performing the same Job type functions
SELECT Job_type, COUNT(*) AS employeeCount
FROM employee
GROUP BY Job_type;

-- Query 31: Number of managers without listing their names
SELECT COUNT(*) AS ManagerCount
FROM employee
WHERE Eno IN (
  SELECT DISTINCT Manager
  FROM employee
);

-- Query 32: Department Name, Location Name, No. of employee and Average Salary for all employee in that department
SELECT D.Dname AS Department_Name,
       D.Location AS Location_Name,
       COUNT(E.Eno) AS Number_of_Employees,
       AVG(E.Salary) AS Average_Salary
FROM DEPARTMENT D
LEFT JOIN EMPLOYEE E ON D.Dno = E.Dno
GROUP BY D.Dname, D.Location;


-- Query 33: Name and Hire Date for all employee in the same dept. as Blake
SELECT e.Ename, e.Hire_Date
FROM employee e
JOIN employee ronit ON e.Dno = ronit.Dno
WHERE ronit.Ename = 'Ronit';

select Eno, Ename, Hire_date from EMPLOYEE where Eno=(select Eno from employee where Ename='Ronit');

-- Query 34: employee No. and Name for all employee who earn more than the average salary
SELECT Eno, Ename
FROM employee
WHERE Salary > (SELECT AVG(Salary) FROM employee);

-- Query 35: employee Number and Name for all employee who work in a department with any employee whose name contains a 'T'
SELECT e.Eno, e.Ename
FROM employee e
JOIN DEPARTMENT d ON e.Dno = d.Dno
WHERE d.Dno IN (
  SELECT Dno
  FROM employee
  WHERE Ename LIKE '%T%'
);

-- Query 36: Names and Salaries of all employee who report to King
SELECT e1.Ename, e1.Salary
FROM employee e1
JOIN employee e2 ON e1.Manager = e2.Eno
WHERE e2.Ename = 'King';

-- Query 37: Department No, Name, and Job for all employee in the Sales department
SELECT e.Eno, e.Ename, d.Dno, d.Dname, e.Job_type
FROM employee e
JOIN DEPARTMENT d ON e.Dno = d.Dno
WHERE d.Dname = 'Sales';

-- Q.38: Display names of employees along with their department name who have more than 20 years experience
SELECT E.Ename, D.Dname
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.Dno = D.Dno
WHERE DATEDIFF(CURDATE(), E.Hire_date) > 7300;

-- Q.39: Display total number of departments at each location
SELECT Location, COUNT(DISTINCT Dno) AS Total_Departments
FROM DEPARTMENT
GROUP BY Location;

-- Q.40: Find the department name in which at least 20 employees work in.
SELECT D.Dname, COUNT(*) AS Total_Employees
FROM DEPARTMENT D
JOIN EMPLOYEE E ON D.Dno = E.Dno
GROUP BY D.Dname
HAVING COUNT(*) >= 20;

-- Q.41: Query to find the employee’ name who is not supervisor and name of supervisor supervising more than 5 employees
SELECT E1.Eno, E1.Ename, E1.SupervisonENO, COUNT(*) AS SuperviseeCount
FROM EMPLOYEE E1
LEFT JOIN EMPLOYEE E2 ON E1.Eno = E2.SupervisonENO
GROUP BY E1.Eno, E1.Ename, E1.SupervisonENO
HAVING E1.SupervisonENO IS NULL OR COUNT(*) > 5;

-- Q.42: Query to display the job type with maximum and minimum employees
SELECT job_type, COUNT(*) AS num_employees
FROM employee
GROUP BY job_type
HAVING COUNT(*) = (SELECT MAX(emp_count) FROM (SELECT COUNT(*) AS emp_count FROM employee GROUP BY job_type) AS counts)
OR COUNT(*) = (SELECT MIN(emp_count) FROM (SELECT COUNT(*) AS emp_count FROM employee GROUP BY job_type) AS counts);


drop database myDatabase;

