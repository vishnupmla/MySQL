create database organization;

use organization;

CREATE TABLE employees(Emp_no varchar(10) primary key,Emp_name varchar(30),DOB date, Address varchar(30),Mobile_no varchar(15), Dept_no varchar(10),Salary varchar(10));

CREATE TABLE department(Dept_no varchar(10), Dept_name varchar(20), Location varchar(20));

desc employees,department;


----------------------------------------------------------
insert into employees(Emp_no,Emp_name,DOB,Address,Mobile_no,Dept_no,Salary) values(10003,"Raju","1999-05-20","abc-xmx-nn","9786432154",102,"45000");

insert into employees(Emp_no,Emp_name,DOB,Address,Mobile_no,Dept_no,Salary) values(10001,"Vishnu","2000-05-24","abc-xx-vv","97302185402",101,"40000");

show tables;

select * from employees;

ALTER TABLE employees ADD COLUMN designation varchar(20);

ALTER TABLE department DROP COLUMN Location;

desc employees;

desc department;


