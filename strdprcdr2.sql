---------------------STORED PROCEDURE------------------------
create table customer_new (cust_id int primary key, name varchar(50), 
                        credits int, city varchar(50));

insert into customer_new values (1,'Karl Pearson',5500,'Trivandrum'),
                            (2,'Nick Shelton',900,'Kochi'),
                            (3,'Steve Brownie',2800,'Kollam'),
                            (4,'Steven Mist',3600,'Kozhikode'),
                            (5,'Ben Stokes',800,'Bangalore');

delimiter $$
create procedure find_membership(in cust_id int,out membership varchar(30))
begin

    declare cust_credit int;
    select credits into cust_credit from customer_new where cust_id = cust_id limit 1;

    if cust_credit > 5000 then
    set membership = 'PLATINUM';

    elseif cust_credit between 1000 and 5000 then
    set membership = 'GOLD';

    else
    set membership = 'SILVER';

    end if;

end $$
delimiter ;

set @rslt = '';
call find_membership(3,@rslt);
select @rslt;