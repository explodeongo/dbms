create database compsci5;
use compsci5;
create table suppliers
(
sno varchar(5) primary key,
sname varchar(30),
status int(5),
scity varchar(10)
);

insert into suppliers values ('s101', 's1', 18, 'new york');
insert into suppliers values ('s102', 's2', 20, 'london');
insert into suppliers values ('s103', 's3', 25, 'paris');
insert into suppliers values ('s104', 's4', 28, 'london');
insert into suppliers values ('s105', 's5', 30, 'paris');



create table parts
(
pno varchar(5) primary key,
pname varchar(30),
pcolor varchar(10),
pweight float(5),
pcity varchar(30)
);

insert into parts values('p101', 'p1', 'orange', 20, 'new york');
insert into parts values('p102', 'p2', 'white', 18, 'london');
insert into parts values('p103', 'p3', 'pink', 16, 'paris');
insert into parts values('p104', 'p4', 'red', 15, 'london');
insert into parts values('p105', 'p5', 'yellow', 11, 'new york');

create table  project
(
jno varchar(5) primary key,
jname varchar(30),
jcity varchar(30)
);


insert into project values('j101', 'main', 'new york');
insert into project values('j102', 'action', 'london');
insert into project values('j103', 'nothing', 'paris');
insert into project values('j104', 'zoom', 'london');
insert into project values('j105', 'game', 'paris');

create table shipment
(
s_sno varchar(5),
s_pno varchar(5),
s_jno varchar(5),
quantity float(5),
primary key (s_sno, s_pno, s_jno),
foreign key(s_sno) references suppliers(sno),
foreign key(s_pno) references parts(pno),
foreign key(s_jno) references project(jno)
);

insert into shipment values ('s101', 'p101', 'j101', 200);
insert into shipment values ('s102', 'p102', 'j102', 325);
insert into shipment values ('s103', 'p103', 'j103', 800);
insert into shipment values ('s104', 'p104', 'j104', 400);
insert into shipment values ('s105', 'p105', 'j105', 300);

select sno, status from suppliers where scity='Paris' and status>20;


select sno, sname from suppliers, parts, shipment where parts.pname='P2' and suppliers.sno=shipment.s_sno and parts.pno=shipment.s_pno;

select sno, sname from suppliers, parts, shipment where suppliers.sno=shipment.s_sno and parts.pno=shipment.s_pno and not parts.pname='p2';


select s_sno, s_pno, s_jno, parts.pweight*shipment.quantity as " shipment" from shipment, parts where parts.pno=shipment.s_pno;

select * from shipment where quantity between 300 and 700;

select distinct pno from parts, suppliers where parts.pweight>16 or suppliers.sname='s2';

select pcity from parts, shipment where parts.pno=shipment.s_pno and parts.pcolor='red' and shipment.quantity>5;

select pno, pname, pcolor, pcity, pweight from parts, shipment, suppliers where suppliers.sno=shipment.s_sno and shipment.s_pno=parts.pno and suppliers.scity='london';


select pno from parts, suppliers, shipment, project where project.jcity='london' and suppliers.scity='london' and suppliers.sno=shipment.s_sno and shipment.s_pno= parts.pno and project.jno=shipment.s_jno;

select count(jno) from suppliers, shipment, project where suppliers.sno = shipment.s_sno and project.jno=shipment.s_jno and suppliers.sname='s1' group by jno;

select sum(quantity) from suppliers, parts, shipment where suppliers.sname = 's1' and parts.pname='p1' and suppliers.sno=shipment.s_sno and parts.pno = shipment.s_pno group by sno;

