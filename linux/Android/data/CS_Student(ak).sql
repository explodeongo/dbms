create database CS_Student;
use CS_Student;

create table PersonalInfo(College_roll int primary key,
Name varchar(20) NOT NULL,
DOB date,
Marks int,
Phone_No int);
Alter table PersonalInfo add Address varchar(50);
desc PersonalInfo;
Select * from PersonalInfo;
insert into PersonalInfo values(3440, "Akash", "2000-01-13", 98, 0012234145, "Delhi");
insert into PersonalInfo values(3441, "Rakhi", "2001-04-23", 80, 829447294, "Kerela");
insert into PersonalInfo values(3442, "Ram", "1999-06-20", 75, 829474384, "Rajasthan");
insert into PersonalInfo values(3443, "Ramesh", "2003-09-13", 89, 243435294, "UP");
insert into PersonalInfo values(3444, "Seema", "2000-11-03", 90, 434354243, "Delhi");
Select * from PersonalInfo;

create table PaperDetails(PaperCode int primary key ,
NameOfPaper varchar(20) NOT NULL);
desc PaperDetails;
Alter table PaperDetails add constraint primary key(PaperCode);
insert into PaperDetails values(301, "Cpp");
insert into PaperDetails values(302, "Java");
insert into PaperDetails values(303, "Python");
insert into PaperDetails values(304, "React");
insert into PaperDetails values(305, "PHP");
Select * from PaperDetails;

create table Academic(College_roll int references PersonalInfo(College_roll),
PaperCode int references PaperDetails(PaperCode),
Attendance int,
MarksHome Decimal(10,2),
primary key(College_roll, PaperCode));
Alter table Academic add constraint foreign key(College_roll) references PersonalInfo(College_roll);
Alter table Academic add constraint foreign key(PaperCode) references PaperDetails(PaperCode);
desc Academic;
insert into Academic values(3440, 301, 75, 98);
insert into Academic values(3441, 302, 86, 50);
insert into Academic values(3442, 303, 65, 88);
insert into Academic values(3443, 304, 35, 67);
insert into Academic values(3444, 305, 55, 88);
select * from Academic;

/* queries in ques */
/*a. Primary key=College_roll in PersonalInfo, PaperCode in PaperDetails, College_roll+PaperCode in Academic,
foreign key= College_roll in Academic*, PaperCode in Academic */
Select * from PersonalInfo, PaperDetails, Academic where PersonalInfo.College_roll=Academic.College_roll and Academic.Attendance>75 
and PaperDetails.PaperCode=302 and Academic.MarksHome>40 ; /* b */
 Select * from PersonalInfo, PaperDetails, Academic where PersonalInfo.College_roll=Academic.College_roll 
 and PaperDetails.PaperCode=301 and PersonalInfo.Address="Delhi"and Academic.MarksHome>60 ;/* c */
select  College_roll, sum(Attendance), sum(MarksHome) from Academic group by College_roll;/*d*/
select PersonalInfo.Name, max(Academic.MarksHome) from PersonalInfo, Academic where 
PersonalInfo.College_roll=Academic.College_roll and Academic.PaperCode=303  ;

#keys are minimal super keys,use concatenated key
/*primary key=college roll in 1st, Paper code 2nd, college roll+paper code in 3rd combine
foreign keys= college roll in 3rd, paper code in 3rd
foreign keys can have different column name ,but domain, purpose should be same- and foreign key values can be repeated
*/
/*concatenated key,
create table tablename(colname datatype, ...., ......, Primary key(column name, column name), foreign key(column name) 
references tablename(column name)
*/


