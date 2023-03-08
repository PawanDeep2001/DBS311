CREATE OR REPLACE PROCEDURE GetMin(n1 IN NUMBER, n2 IN NUMBER, n3 OUT NUMBER) AS
BEGIN
IF n1 > n2 THEN
n3:=n2;
ELSIF n2 > n1 THEN
n3:=n1;
ELSE
dbms_output.put_line('same number');
END IF;
END;


DECLARE
    n1 NUMBER:=0;
BEGIN
    GetMin(10,500,n1);
    dbms_output.put_line('the minimum is ' || n1);
END;


DROP PROCEDURE GetMin;

select employee_id, job_title, hire_date, manager_id
from employees
minus
select employee_id, job_title, hire_date, manager_id
from employees
where manager_id is null
order by 1;


select first_name|| ' ' || last_name as "employee",
(select first_name|| ' ' || last_name from employees m where m.employee_id=e.manager_id) as "manager"
from employees e
order by 1;

select first_name|| ' ' || last_name as "employee",first_name|| ' ' || last_name as "manager"
from employees e, employees m
where m.employee_id=e.manager_id
order by 1;
declare
n1 number:=&x;
n2 number:=&y;
n3 number:= &y;
total number;
begin 
total:= n1+n2+n3;
dbms_output.put_line('the sum of the 3 num is :' || total);
end;


create procedure sum_3(s1 out number) as
begin
select sum(list_price) into s1
from products;
end;
declare 
s number:=0;
begin 
sum_3(s);
dbms_output.put_line(s);
end;

set serveroutput on;

begin 
dbms_output.put_line('Advanced');
end;