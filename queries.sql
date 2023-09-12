insert into student values(222064,'Vishnu Prathap','XYZ home place',7845231245,'Male'),
                (222021,'Kiran Reji','yzx home place',9021345678,'Male');

insert into semsec values (1,1,'B'),(2,1,'A'),
        (3,2,'D'),(4,2,'E');

insert into class values(222064,3),(222021,4);

insert into subject values(1,'IOT',2,10),(2,'Cloud Computing',1,8),
            (3,'Algroithm',2,8);

create table iamarks(USN int,subcode int,ssid int,test1 int,
    test2 int,test3 int,finalia int,
    foreign key(USN) references student(USN),
    foreign key(subcode) references subject(subcode),
    foreign key(ssid) references semsec(ssid));

    insert into iamarks values(222064,1,3,45,48,36,null);

select * from student where USN = (
select c.USN from class c join semsec s on c.ssid = s.ssid where 
(select ssid from semsec where sem = 2 and sec ='D') limit 1)

mysql> select * from semsec;     
+------+------+------+
| ssid | sem  | sec  |
+------+------+------+
|    1 |    1 | B    |
|    2 |    1 | A    |
|    3 |    2 | D    |
|    4 |    2 | E    |
+------+------+------+

mysql> select * from student;
+--------+----------------+----------------+------------+--------+
| USN    | sName          | Address        | Phone      | Gender |
+--------+----------------+----------------+------------+--------+
| 222021 | Kiran Reji     | yzx home place | 9021345678 | Male   |
| 222064 | Vishnu Prathap | XYZ home place | 7845231245 | Male   |
+--------+----------------+----------------+------------+--------+

select * from student where














