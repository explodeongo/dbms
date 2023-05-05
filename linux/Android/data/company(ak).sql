create database Company;
use Company;

create table Employee(Person_Name varchar(30) primary key,
Street varchar(50) NOT NULL,
City varchar(50));
desc Employee;
insert into Employee values("Akram","S1","Delhi");
insert into Employee values("Mahesh","S2","Noida");
insert into Employee values("Mahi","S3","Delhi");
insert into Employee values("Akhil","S4","Gurgao");
insert into Employee values("Akii","S5","Noida");
insert into Employee values("Akshay","S6","Delhi");
select * from Employee;

create table Company(Company_Name varchar(20) primary key,
City varchar(10));
desc Company;
insert into Company values("Samba Bank","Delhi");
insert into Company values("NCB Bank","Delhi");
insert into Company values("XYZ Bank","Noida");
insert into Company values("State Bank","Gurgao");
insert into Company values("PNB Bank","Noida");
Select * from Company;

create table Works(Person_Name varchar(10) NOT NULL,
Company_Name varchar(20) NOT NULL,
Salary int,
foreign key(Person_Name) references Employee(Person_Name),
foreign key(Company_Name) references Company(Company_Name));
desc works;
insert into Works values ("Akram", "Samba Bank", 10000);
insert into Works values ("Mahesh", "NCB Bank", 100024);
insert into Works values ("Mahi", "XYZ Bank", 15000);
insert into Works values ("Akii", "State Bank", 20000); 
insert into Works values ("Akhil", "PNB Bank", 20000);
insert into Works values("Akshay","PNB Bank",20000);
insert into Works values ("Akram", "NCB Bank", 10000);

select * from Works;

create table Manages(Person_Name varchar(20) NOT NULL,
Manager_Name varchar(20) NOT NULL,
foreign key(Person_Name) references Employee(Person_Name));
desc Manages;
insert into Manages values("Akram", "Rahul");
insert into Manages values("Mahesh", "VK");
insert into Manages values("Mahi", "Dongria");
insert into Manages values("Akhil", "Vikram");
insert into Manages values("Akii", "Mahesh");
insert into Manages values("Akshay","Akram");

select * from Manages;

/*primary keys=Person_Name in Employee, Company_Name in Company*/
/* foreign keys=Person_Name in Works and Manages, Company_Name in Works */
Alter table Employee add email varchar(20); 
desc Employee;  -- b

select  Works.Person_Name from Manages, Works where Works.Company_Name="NCB Bank" and Manages.Manager_Name=Works.Person_Name and Works.Person_Name in
(Select Person_Name from Works where Company_Name="Samba Bank" );
Select Person_Name from Works where Company_Name="NCB Bank";
-- c

Select Employee.Person_Name, Employee.Street, Employee.City, Works.Salary, Works.Company_Name 
from Employee, Works where Employee.Person_Name=Works.Person_Name and Works.Company_Name="Samba Bank" and Works.Salary>=10000 ;     -- d 

Select distinct Employee.Person_Name, Company.City, Employee.City  from Employee, Works, Company where Employee.Person_Name= Works.Person_Name 
and Works.Company_Name=Company.Company_Name and Employee.City=Company.City;-- e

Select Company_Name, max(Salary), min(Salary), avg(Salary) from Works group by Company_Name;  -- f

Select Company_Name, count(Person_Name), sum(Salary) from Works group by Company_Name;   -- g ??

select  Company_Name, Salary from Works where Salary=(select max(Salary) from Works);-- h



