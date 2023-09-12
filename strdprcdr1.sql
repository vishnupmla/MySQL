delimiter $$
create procedure get_customer()
begin
    select * from customer;
end $$
delimiter ;


--7
create table employee(employee_id int primary key,employee_name varchar(50),
                        employee_dep varchar(30));

create table employee_history(employee_id int primary key,employee_name varchar(50),
                        employee_dep varchar(30),date_of_deletion date);

insert into employee values(1,'Sivadas','IT'),
                            (2,'Vishnu','IT'),
                            (3,'Sreenivas','Finance'),
                            (4,'Raghav','Sales');

-----------------------TRIGGERS----------------------

delimiter $$
create trigger after_employee_delete
after delete on employee
for each row

begin

    insert into employee_history values(old.employee_id,old.employee_name,
                                        old.employee_dep,curdate());

end $$
delimiter ;

create table employee_details (employee_id int primary key,
                first_name varchar(30),last_name varchar(30),job_id varchar(30));

delimiter $$
create trigger before_update_employee_details
before insert on employee_details
for each row
begin
        set new.first_name = trim(new.first_name);
        set new.last_name = trim(new.last_name);
        set new.job_id = upper(new.job_id);
end $$
delimiter ;

insert into employee_details values (2,'Vish nu',' Pra tha p','developer'),
                                    (3,'Kart h ick',' S','Testing'),
                                    (4,'Ada rsh ','She k h ar','devops');

create table exam_rslt(student_id int primary key,name varchar(30),sub1 decimal(5,2),
                sub2 decimal(5,2),sub3 decimal(5,2),sub4 decimal(5,2),
                sub5 decimal(5,2),total decimal(5,2),per_marks decimal(5,2),
                grade varchar(10));           

delimiter $$
create trigger calc_mark_on_update
before update on exam_rslt
for each row

begin
    set new.total = new.sub1+new.sub2+new.sub3+new.sub4+new.sub5;
    set new.per_marks = (new.total /5);

    if new.per_marks >= 90 then
    set new.grade = 'EXCELLENT';

    elseif new.per_marks >= 75 and new.per_marks < 90 then
    set new.grade = 'VERY GOOD';

    elseif new.per_marks >=60 and new.per_marks <75 then
    set new.grade = 'GOOD';

    elseif new.per_marks >= 40 and new.per_marks <60 then
    set new.grade = 'AVERAGE';

    else
    set new.grade = 'NOT PRMTD';

    end if;
end $$
delimiter ;

insert into exam_rslt values (1,'Kiran Shaji',42,36,21,49,45,null,null,null)



-----------------------STORED PROCEDURE-----------------------

create table emp_salary (emp_id int primary key,emp_name varchar(50),
        noof_working_days int,designation varchar(20),salary int);

insert into emp_salary values(1,'Karl Pearson',27,'Assistant Professor',null),
                            (2,'Stuart Binny',29,'clerk',null),
                            (3,'Roger Finn',27,'Programmer',null);

delimiter $$
create procedure calc_salary()
begin

    declare done int default 0;
    declare daily_rate int;
    declare emp_id int;
    declare working_days int;
    declare designation varchar(20);

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    declare emp_cursor cursor for 
    select emp_id, noof_working_days, designation
    from emp_salary;

    open emp_cursor;

    emp_loop : loop;
        fetch emp_cursor into emp_id,working_days,designation;

        if done = 1 then
        leave emp_loop;
        end if;

    case designation
        when 'Assisstant Professor' then
        set daily_rate = 1750;

        when 'Clerk' then
        set daily_rate = 750;

        when 'Programmer' then
        set  daily_rate = 1250;

        else
        set daily_rate = 0;
    end case;

    update emp_salary set salary = daily_rate * working_days 
    where emp_id = emp_id;

end loop;
close emp_cursor;


end $$
delimiter ;


delimiter $$
create function getempcount(empname varchar(50))
    
begin
        declare empcount int;
        select count(*) into empcount from employee where employee_name = empname;
        return empcount;
end $$
delimiter ;