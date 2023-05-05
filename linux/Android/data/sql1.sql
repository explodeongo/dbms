create database compsci;
use compsci;
create table LibraryBooks(
Accession_no int(4) PRIMARY KEY,
Title varchar(40),
Author varchar(30),
Department Varchar(30),
DOP date,
Price int(5)
);

insert into LibraryBooks values(101,'Database System Concepts', 'Navathe', 'CS', '1989-10-14', 150);
insert into LibraryBooks values (102,'Computer Fundamentals', 'Anita Goel', 'Discrete Maths', '1999-08-20', 200);
insert into LibraryBooks values (103,'Multimedia', 'Tay Vaugan', 'Discrete Maths', '2000-09-20', 300);
insert into LibraryBooks values (104,'Visual Basics', 'Bayross', 'CS', '2003-11-10', 450);
insert into LibraryBooks values (105,'Micro Economics', 'Forte', 'Economics', '2004-10-14', 500);
insert into LibraryBooks values (106,'GE', 'Coronel', 'Hindi', '2005-09-21', 350);

Create table IssuedBooks
(
Accession_no int(4),
Borrower varchar(40),

FOREIGN KEY (Accession_no) REFERENCES LibraryBooks(Accession_no)
);


insert into IssuedBooks VALUES(102, 'SONIA');
insert into IssuedBooks VALUES(103, 'RITU');
insert into IssuedBooks VALUES(104, 'AMRESH');
insert into IssuedBooks VALUES(105, 'Raju');
insert into IssuedBooks VALUES(106, 'Mohit');
Delete from LibraryBooks Where Title ='Database System Concepts';

UPDATE LibraryBooks set Department = 'CS' WHERE Department='Discrete Maths';
SELECT * from LibraryBooks Where Department='CS';

Select * from LibraryBooks Where Department = 'CS' AND Author='Navathe';
Select * From LibraryBooks, IssuedBooks
WHERE LibraryBooks.Accession_no = IssuedBooks.Accession_no
AND Department = 'CS'; 
SELECT * From LibraryBooks
WHERE price<500 OR DOP BETWEEN '1999-01-01' AND '2004-01-01';