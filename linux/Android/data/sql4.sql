create database compsci4;
use compsci4;

create table employee
(
e_pid varchar(5) primary key,
person_name varchar(30),
street varchar(30),
city varchar(10)
);


insert into employee values('p101', 'shyam kumar', 'a/11', 'delhi');
insert into employee values('p102', 'rohan sharma', 'b block', 'delhi');
insert into employee values('p103', 'aniket singh', 'alpha i', 'ghaziabad');
insert into employee values('p104', 'vibha', 'beta ii', 'noida');
insert into employee values('p105', 'divya dutta', 'phase ii', 'noida');
insert into employee values('p106', 'priya', 'vasundhra', 'ghaziabad');


create table company
(
c_id varchar(5) primary key,
company_name varchar(30),
city varchar(10)
);


insert into company values('b1', 'samba bank', 'delhi');
insert into company values('b3', 'samba bank', 'noida');
insert into company values('b4', 'ncb bank', 'delhi');
insert into company values('b5', 'ncb bank', 'noida');
insert into company values('b6', 'icici bank', 'delhi');
insert into company values('b7', 'axis bank', 'madras');

create table works
(
w_pid varchar(5),
w_id varchar(5), 
wp_name varchar(30),
wcompany_name varchar(30),
salary varchar(10),
primary key (w_pid, w_id),
foreign key (w_pid) references employee (e_pid),
foreign key (w_id) references company(c_id)
);


insert into works values('p101',  'b1','shyam kumar', 'samba bank', 15000);
insert into works values('p102', 'b3','rohan sharma', 'ncb bank', 22000);
insert into works values('p103', 'b5','aniket singh', 'icici bank', 10000);
insert into works values('p104', 'b2','vibha', 'samba bank', 8000);
insert into works values('p105', 'b4','divya dutta', 'ncb bank', 11000);
insert into works values('p106', 'b6','priya', 'axis bank', 7000);


create table manager
(
m_id varchar(5) primary key,
mp_name varchar(30),
m_name varchar(30),
foreign key (m_id) references employee(e_pid)
);



insert into manager values ('p101', 'vibha', 'shyam kumar');    
insert into manager values ('p102', 'divya dutta', 'rohan sharma');
insert into manager values ('p103', 'aniket singh', 'aniket singh');



alter table employee add(email varchar(20));

select m_name from manager, works where manager.m_id=works.w_pid and (works.wcompany_name = 'samba bank' or works.wcompany_name='ncb bank');

 select person_name, street, city, salary from employee, works where employee.e_pid =works.w_pid
 and (works.salary >'100000' AND works.wcompany_name='samba bank');
 select distinct person_name from employee, company where employee.city=company.city;


 select wcompany_name, max(salary), min(salary) from works group by wcompany_name;
 select sum(salary), count(w_pid) from works group by wcompany_name;
 select wcompany_name from works where salary = (select max(salary) from works);
