create database college;

use college;

create table student(Roll_no varchar(20) primary key,Name varchar(50), DOB date, Phone_Number varchar(15),Blood_group varchar(5));

create table course(Course_Id varchar(10) primary key, Course_name varchar(30), Course_duration varchar(20));

insert into student(Roll_no,Name,DOB,Phone_Number,Blood_group) values (121, "Stephin" , "2000-04-23","9636524130","A+");

insert into student(Roll_no,Name,DOB,Phone_Number,Blood_group) values (122,"Jiss","1999-10-08","9234561289","O-");

insert into student(Roll_no,Name,DOB,Phone_Number,Blood_group) values (123,"Allen","2000-10-22","2134561399","B+");

insert into student(Roll_no,Name,DOB,Phone_Number,Blood_group) values (124,"Raghu","1999-05-29","6432167899","B+");

select*from student;

--------------------------------------------------

insert into course (Course_ID,Course_name,Course_Duration) values ("MC201","MCA","2 yrs");

insert into course (Course_ID,Course_name,Course_Duration) values ("BC211","BCA","3 yrs");

insert into course (Course_ID,Course_name,Course_Duration) values ("BT110","BTech","4yrs");

select * from course;

------------------------------------------------------

show tables;

select*from student;

ALTER TABLE student DROP COLUMN Blood_group;

select * from student;

ALTER TABLE student ADD COLUMN Number_of varchar(10);

ALTER TABLE student MODIFY COLUMN Phone_number bigint(15);

DROP TABLE student,course;

drop database college;

