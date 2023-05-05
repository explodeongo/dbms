create database Customer;
use customer;

Create table Customer(CustID varchar(4) primary key, 
Email varchar(10), 
Name char(10) NOT NULL,
Phone int,
ReferrerID varchar(4));
alter table Customer add constraint foreign key(ReferrerID) references Customer(CustID);  /*issue with foreign key not inserting records */
desc Customer;
insert into Customer values("C1", "c1@gmail", "Akash", 245428743, "R1");
insert into Customer values("C2", "c2@gmail", "Ramesh", 245629374, "R2");
insert into Customer values("C3", "c3@gmail", "Akhil", 38218023, "R3");
insert into Customer values("C4", "c4@gmail", "Akhshi", 54328673, "R4");
insert into Customer values("C5", "c5@gmail", "Reems", 637281947, "R5");
Select * from Customer;

create table Bicycle(BicycleID varchar(4) primary key,
DatePurchased date,
Color varchar(8),  
CustID varchar(4) references Customer(CustID),
ModelNo varchar(4));
alter table Bicycle  add constraint foreign key(CustID) references Customer(CustID);
desc Bicycle;
insert into Bicycle values("B1","2022-02-12", "red", "C2", "M1");
insert into Bicycle values("B2","2002-03-22", "blue", "C1", "M2");
insert into Bicycle values("B3","2005-05-02", "black", "C5", "M3");
insert into Bicycle values("B4","2020-12-12", "white", "C4", "M4");
insert into Bicycle values("B5","2021-02-12", "yellow", "C3", "M5");
select * from Bicycle;

create table BicycleModel(ModelNo varchar(4) primary key,
Manufacturer varchar(20) NOT NULL,
Style varchar(4));
desc BicycleModel;
insert into BicycleModel values("M1", "Honda", "S1");
insert into BicycleModel values("M2", "Hero", "S2");
insert into BicycleModel values("M3", "Atlas", "S3");
insert into BicycleModel values("M4", "Rockstar", "S4");
insert into BicycleModel values("M5", "A1", "S5");
select * from BicycleModel;

create table Service(StartDate date,
BicycleID varchar(4),
EndDate date,
primary key(StartDate,BicycleID));
desc service;
insert into Service values("2012-03-12", "B2", "2012-03-30");
insert into Service values("2002-06-02", "B1", "2002-06-12");
insert into Service values("2005-09-12", "B4", "2005-09-24");
insert into Service values("2008-02-22", "B5", "2008-02-28");
insert into Service values("2012-04-09", "B3", "2012-04-19");
select * from Service;

/*primary keys= CustId in Customer, BicycleID in Bicycle, ModelNo in BicycleMOdel, StartDate+BicycleID in Service */
/* Foreign keys= ReferrerID in Customer, CustID in Bicycle */
Select * from Bicycle, BicycleModel where Bicycle.ModelNo = BicycleModel.ModelNo and BicycleModel.Manufacturer="Honda" ;

select BicycleID from Bicycle where CustID="C1";

select BicycleModel.Manufacturer from Bicycle, BicycleModel where Bicycle.ModelNo = BicycleModel.ModelNo 
and Bicycle.Color="red";

select Bicycle.ModelNo from Bicycle, Service where Bicycle.BicycleID=Service.BicycleID ;


/* recursive relationship = when tables refers to itself like reffID and custID/or use alter table 
primary=custID in 1, bicycleid 2, modelno 3, startDate+ bicycleID in 4
foreign=ReferrId in 1, 
*/


