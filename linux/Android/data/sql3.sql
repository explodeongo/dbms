create database compsci3;
use compsci3;

create table customer
(
c_cid varchar(5) PRIMARY KEY,
email Varchar(20),
name varchar(20),
phone bigint(10),
refer_id varchar(20)
);

INSERT INTO customer VALUES ('C101', '14YYZ@GMAIL.COM', 'RAM', 9874563210, 'C1');
INSERT INTO customer VALUES ('C102', 'VINAY@GMAIL.COM', 'VINAY', 850697412, 'C1');
INSERT INTO customer VALUES ('C103', 'AMIT@GMAIL.COM', 'AMIT', 8146235897, 'C5');
INSERT INTO customer VALUES ('C104', '12BHUSHAN@GMAIL.COM', 'BHUSHAN', 875210369, 'C3');
INSERT INTO customer VALUES ('C105', 'SANJAY67@GMAIL.COM', 'SANJAY', 4545123698, 'C4');

create table bicyclemodel
(
bmodel_no varchar(5) primary key,
manufacturer varchar(20),
style varchar(10),
c_cid varchar(5),
foreign key (c_cid) references customer(c_cid)
);


INSERT INTO bicyclemodel VALUES('M101', 'HONDA', 'GEAR SHIFT', 'C101');
INSERT INTO bicyclemodel VALUES('M102', 'TATA', 'SIMPLE', 'C101');
INSERT INTO bicyclemodel VALUES('M103', 'TOYOTA', 'GEAR SHIFT', 'C103');
INSERT INTO bicyclemodel VALUES('M104', 'HONDA', 'SIMPLE', 'C105');
INSERT INTO bicyclemodel VALUES('M105', 'MARUTI', 'SIMPLE', 'C102');

create table bicycle
(
b_id varchar(5) primary key,
purchase_date date,
color varchar(10),
b_cid varchar(5),
model_no varchar(10),
foreign key (b_cid) references customer (c_cid),
foreign key (model_no) references bicyclemodel(bmodel_no)
);



INSERT INTO bicycle VALUES('B101', '2003-12-13', 'RED','C102', 'M101');
INSERT INTO bicycle VALUES('B102', '2006-10-13', 'RED','C101', 'M101');
INSERT INTO bicycle VALUES('B103', '2006-02-13', 'BLUE','C103', 'M103');
INSERT INTO bicycle VALUES('B104', '2005-05-13', 'BLACK','C103', 'M104');
INSERT INTO bicycle VALUES('B105', '2004-07-13', 'PURPLE','C105', 'M105');

create table service
(
bicycle_id varchar(10) primary key,
startdate date,
enddate date,
foreign key (bicycle_id) references bicycle(b_id)
);



INSERT INTO service VALUES('B101', '2005-12-13', '2005-12-13');
INSERT INTO service VALUES('B102', '2006-10-13', '2006-10-13');
INSERT INTO service VALUES('B103', '2006-02-13', '2005-02-25');
INSERT INTO service VALUES('B104', '2005-05-13', '2005-05-20');
INSERT INTO service VALUES('B105', '2004-07-13', '2005-07-28');

SELECT name from customer, bicyclemodel where manufacturer='HONDA'
And customer.c_cid=bicyclemodel.c_cid;




select b_id from bicycle, customer
WHERE customer.refer_id='C1' And customer.c_cid=bicycle.b_cid;


SELECT distinct manufacturer from bicyclemodel, bicycle
WHERE bicycle.color="RED"
AND bicycle.model_no=bicyclemodel.bmodel_no;

select distinct bmodel_no from bicyclemodel, bicycle, service where service.bicycle_id=bicycle.b_id
AND bicyclemodel.bmodel_no=bicycle.model_no;


