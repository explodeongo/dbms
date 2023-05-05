create database Project;
use Project;

create table Suppliers(SNo varchar(4) primary key,
Sname varchar(30) NOT NULL,
Status int,
SCity varchar(30) NOT NULL);
desc suppliers;
insert into Suppliers value("S1", "Sname1", 50, "Paris");
insert into Suppliers value("S2", "Sname2", 70, "London");
insert into Suppliers value("S3", "Sname3", 30, "USA");
insert into Suppliers value("S4", "Sname4", 10, "New York");
insert into Suppliers value("S5", "Sname5", 20, "Paris");
insert into Suppliers value("S6", "Sname6", 100, "London");
select * from Suppliers;


create table Parts(PNo varchar(10) primary key,
Pname varchar(20) NOT NULL, 
Colour varchar(10),
Weight decimal(10,2),
City varchar(20));
desc parts;
insert into Parts values("P1", "Pname1", "red", 30, "London");
insert into Parts values("P2", "Pname2", "yellow", 50, "Paris");
insert into Parts values("P3", "Pname3", "black", 22, "New York");
insert into Parts values("P4", "Pname4", "green", 40, "USA");
insert into Parts values("P5", "Pname5", "red", 70, "London");
insert into Parts values("P6", "Pname6", "yellow", 90, "USA");
insert into Parts values("P7", "Pname7", "red", 30, "UK");
select * from Parts;

create table Project(JNo varchar(10) primary key,
Jname varchar(20) NOT NULL,
Jcity varchar(20));
desc project;
insert into Project values("J1", "Jname1" ,"Paris");
insert into Project values("J2", "Jname2", "London");
insert into Project values("J3", "Jname3", "USA");
insert into Project values("J4", "Jname4", "New York");
insert into Project values("J5", "Jname5" ,"Paris");
insert into Project values("J6", "Jname6" ,"London");
select * from Project;

create table Shipment(SNo varchar(10),
PNo varchar(10),
JNo varchar(10),
Quantity decimal(10,2),
primary key(SNo, PNo, JNo));
Alter table Shipment add constraint foreign key(SNo) references Suppliers(SNo);
Alter table Shipment add constraint foreign key(PNo) references Parts(PNo);
Alter table Shipment add constraint foreign key(JNo) references Project(JNo);
desc shipment;
insert into Shipment values("S1", "P1", "J1", 500);
insert into Shipment values("S2", "P2", "J3", 250);
insert into Shipment values("S3", "P5", "J6", 700);
insert into Shipment values("S4", "P3", "J5", 900);
insert into Shipment values("S5", "P6", "J2", 100);
insert into Shipment values("S6", "P4", "J4", 800);
insert into Shipment values("S2","P5","J1",500);
select * from Shipment;

/* a.) Primary key- SNo in suppliers,PNo in parts,JNo in projects, SNo+PNo+JNo in shipment
Foreign keys- SNo, Pno, Jno in Shipment
*/
Select SNo, Status from Suppliers where Scity="Paris" and Status>20;  -- b  

Select  Suppliers.SNo, Suppliers.Sname, Shipment.PNo from Suppliers, Shipment where Shipment.SNo=Suppliers.SNo
 and Shipment.PNo="P2" order by Suppliers.SNo;    -- c

Select Suppliers.SName, Shipment.PNo from Suppliers, Shipment where Shipment.SNo=Suppliers.SNo and Shipment.SNo not in 
(select Shipment.SNo from Shipment where Shipment.PNo="P2"); -- d   //do subquery

Select SNo, Shipment.PNo, Quantity, Parts.Weight, Parts.Weight*Quantity as "Total Weight" from Shipment,Parts where Shipment.PNo=Parts.PNo;-- e

Select * from Shipment where Quantity between 300 and 750; -- f

Select  Shipment.SNo, Parts.PNo, Parts.Weight from Shipment, Parts, Suppliers where Suppliers.SNO=Shipment.SNo 
and Parts.PNo=Shipment.PNo and (Parts.Weight>16 or Shipment.SNo="S2"); -- g

Select City, count(Colour) from Parts where Colour="red" group by Parts.City having count(Colour)>1;-- h

select Parts.PNo, Parts.PName, Parts.Colour, Parts.Weight, Parts.City, Shipment.SNo, Suppliers.SCity from Parts, Shipment, Suppliers
where Parts.PNo=Shipment.PNo and Shipment.SNo = Suppliers.SNo and Suppliers.SCity= 'London';-- i

select Parts.PNo, Suppliers.SNo, Project.JNo, Project.JCity, Suppliers.SCity from Parts, Suppliers, Shipment, Project where Shipment.PNo = Parts.PNo and Shipment.SNo=Suppliers.SNo 
and Shipment.JNo=Project.JNo and Suppliers.SCity= 'Paris' and Project.JCity= 'Paris'; -- j 
select Suppliers.SNo from Suppliers where SCity="Paris"; 
select Parts.PNo from Parts where City="Paris"; 
select Project.JNo from Project where JCity="Paris"; 
-- changed london to paris due to inserted data,
-- london
-- s2,s6 //supplier 
-- j2,j6 //project
-- //paris
-- s1,s5  //supplier
-- j1,j5    //project

select Suppliers.Sno, count(Shipment.jno) as "Projects" from Suppliers, Shipment where Shipment.Sno=Suppliers.Sno 
group by Shipment.Jno;-- k

select Shipment.Sno, Shipment.Pno, sum(Quantity) as "Total Quantity" from Shipment group by Shipment.Pno, Shipment.Sno; -- l
