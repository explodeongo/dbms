create database library;
use library;
create table LibraryBooks(Accessio_No int primary key,
Title char(100) NOT NULL,
Author char(50) NOT NULL,
Department varchar(20) NOT NULL,
Purchase_date  date,
Price decimal(10,2));

desc LibraryBooks;


insert into LibraryBooks values(2101, "DatabaseSystem", "Navathe", "CS", '2000-02-12', 2000);
insert into LibraryBooks values(2102, "DiscreteMaths", "Mosh", "Maths", '2000-10-02', 400);
insert into LibraryBooks values(2103, "EVS", "Erach", "GE", '2001-04-30', 2100);
insert into LibraryBooks values(2104, "Algorithms", "Thomas", "CS", '2003-06-22', 4000);
insert into LibraryBooks values(2105, "OS", "Abraham", "CS", '2002-02-12', 2450);
insert into LibraryBooks values(2106, "DatabaseSystem", "Navathe", "CS", '2000-02-12', 2000);

select*from Librarybooks;

create table IssuedBooks(Accession_No int primary key, 
Borrower varchar(20) NOT NULL);

Alter table IssuedBooks drop primary key;

desc Issuedbooks;

insert into IssuedBooks values(2102,"Ram");
insert into IssuedBooks values(2104, "Sita");
insert into IssuedBooks values(2101, "Rahul");
insert into IssuedBooks values(2103, "Ramesh");
insert into IssuedBooks values(2105, "Sam");
insert into IssuedBooks values(2106, "Sam");
select * from  LibraryBooks;
select * from IssuedBooks;

/* queries given in ques*/
/*primary key= Accession_no in LibraryBooks, foreign key= Accession_No in IssuedBooks ,a*/
Delete from LibraryBooks where Title="DatabaseSystem"; /* b*/
select * from LibraryBooks;
Update LibraryBooks 
set Department= "CS" where Title="DiscreteMaths"; /*c */
Select * from LibraryBooks;
Select * from LibraryBooks where Department like "CS";  /*d*/
Select * from LibraryBooks where Department like "CS" and Author like "Navathe"; /*e */
Alter table IssuedBooks add constraint foreign key(Accession_No) references LibraryBooks(Accessio_No);
Select * from LibraryBooks,IssuedBooks where LibraryBooks.Accessio_No = IssuedBooks.Accession_No and LibraryBooks.Department="CS"; /*f */
Select * from LibraryBooks where Price<500 or Purchase_date between '1999-01-01' and '2004-01-01';/*g*/
desc librarybooks;
desc issuedbooks;

/* accesion no + borrower can be primary key in IssuedBooks*/




