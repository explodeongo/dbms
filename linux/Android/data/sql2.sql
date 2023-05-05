create database compsci2;
use compsci2;
create table studentinfo
(
croll varchar(5) PRIMARY KEY,
name varchar(40),
dob date,
address varchar(40),
marks int(5),
phone bigint(15)
);


INSERT into studentinfo values('A101','Mohit','1989-05-16', 'Delhi',75,7894561239);
INSERT into studentinfo values('A102','Parul','1989-10-12','Mumbai',80,9258963140);
INSERT into studentinfo values('A103','Sanjay','1989-07-18','Delhi',50,8954632107);
INSERT into studentinfo values('A104','Vivek','1989-03-30','UP',30,5544112233);
INSERT into studentinfo values('A105','Arjun','1989-08-22','Delhi',80,1236547790);

create table paper_details
(
paper_code varchar(5) PRIMARY KEY,
paper_name varchar(5),
croll varchar(5),
foreign key (croll) references studentinfo(croll)
);

INSERT INTO paper_details values('P101','P1','A101');
INSERT INTO paper_details values('P102','P2','A102');
INSERT INTO paper_details values('P103','P3','A103');
INSERT INTO paper_details values('P104','P4','A104');
INSERT INTO paper_details values('P105','P5','A105');

create table academic_details
(
croll varchar(5),
paper_code varchar(5),
Attendence int(5),
moh int(5),
primary key (croll,paper_code),
foreign key (croll) references studentinfo(croll),
foreign key (paper_code) references paper_details(paper_code)
);

INSERT INTO academic_details values('A101','P101',70,85);
INSERT INTO academic_details values('A102','P102',92,75);
INSERT INTO academic_details values('A103','P103',80,80);
INSERT INTO academic_details values('A104','P104',93,70);
INSERT INTO academic_details values('A105','P105',50,90);
select name, paper_name FROM studentinfo, paper_details, academic_details
WHERE Attendence>75 AND moh>60
AND paper_name ='P2'
AND studentinfo.croll = paper_details.croll AND paper_details.paper_code=academic_details.paper_code;

SELECT name FROM paper_details, studentinfo, academic_details
WHERE studentinfo.address = 'Delhi' AND paper_details.paper_name='P1' AND academic_details.moh>60
AND studentinfo.croll = paper_details.croll AND paper_details.paper_code = academic_details.paper_code;

SELECT name FROM studentinfo, paper_details, academic_details
WHERE studentinfo.address = 'Delhi' AND paper_details.paper_name='P1' AND academic_details.moh>60
AND studentinfo.croll = paper_details.croll AND paper_details.paper_code = academic_details.paper_code;

SELECT SUM(academic_details.moh) as 'Total Marks', SUM(academic_details.Attendence) as 'Total Attendence'FROM academic_details;
SELECT studentinfo.name, max(academic_details.moh) FROM studentinfo, paper_details, academic_details
WHERE paper_name='P2'
AND studentinfo.croll = paper_details.croll AND paper_details.paper_code = academic_details.paper_code;



