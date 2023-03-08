-- ***********************
-- Name: Pawan Deep
-- ID: 111144218
-- Date: 07/20/2022
-- Purpose: Lab 7 DBS311
-- ***********************

-- Question 1 – DISPLAY THE FACTORIAL OF A NUMBER
-- Q1 SOLUTION –
CREATE OR REPLACE procedure fact(n IN number) as
  result number:=1;
  i number:=0;
begin
i:=n;
  LOOP
    IF n>1 then
        result:=result*(i);
        i:=i-1;
    END IF;
    EXIT WHEN i=1;
  end LOOP;
  DBMS_OUTPUT.PUT_LINE(result);
  EXCEPTION 
  WHEN TOO_MANY_ROWS
    THEN DBMS_OUTPUT.PUT_LINE('TOO MANY ROWS!');
  WHEN NO_DATA_FOUND
    THEN DBMS_OUTPUT.PUT_LINE('NO DATA!');
  WHEN OTHERS
    THEN DBMS_OUTPUT.PUT_LINE('ERROR!');
end fact;

-- Question 2 – Display current salary with the employee id
-- Q2 SOLUTION –
CREATE OR REPLACE procedure calculate_salary(id IN number) as
    salary number:=10000;
    years number:=0;
    hDate date;
    fName VARCHAR2(255 byte);
    lName VARCHAR2(255 byte);
begin
    select hire_date, first_name, last_name into hDate, fName,lName
    from employees
    where employee_id=id;
    years:=to_char(sysdate(),'YYYY')-to_char(hDate, 'YYYY');
    FOR i IN 1..years loop
    salary:=salary*105/100;
    end loop;
    DBMS_OUTPUT.PUT_LINE('First Name: ' || fName);
    DBMS_OUTPUT.PUT_LINE('Last Name: ' || lName);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || round(salary,2));
    EXCEPTION
    WHEN NO_DATA_FOUND
        THEN DBMS_OUTPUT.PUT_LINE('employee id does not exist!');
    WHEN TOO_MANY_ROWS
        THEN DBMS_OUTPUT.PUT_LINE('TOO MANY ROWS!');
    WHEN OTHERS
        THEN DBMS_OUTPUT.PUT_LINE('ERROR!!!');
end calculate_salary;

-- Question 3 – print all the warehouses id, name, city, state
-- Q3 SOLUTION –
CREATE OR REPLACE procedure warehouses_report as
    id number;
    name VARCHAR2(255 byte);
    city VARCHAR2(255 byte);
    state VARCHAR2(255 byte);
    i number;
    m number;
begin
    select count(warehouse_id) into m
    from warehouses;
    FOR i in 1.. m loop-- m or 9 
    select warehouse_id,warehouse_name, city, nvl(state,'no state') into id, name, city, state
    from warehouses left join locations using(location_id)
    where warehouse_id=i;
    DBMS_OUTPUT.PUT_LINE('Warehouse ID: ' || id);
    DBMS_OUTPUT.PUT_LINE('Warehouse name: ' || name);
    DBMS_OUTPUT.PUT_LINE('City: ' || city);
    DBMS_OUTPUT.PUT_LINE('State: ' || state);
    DBMS_OUTPUT.PUT_LINE('');
    end loop;
    EXCEPTION 
    WHEN TOO_MANY_ROWS
        THEN DBMS_OUTPUT.PUT_LINE('TOO MANY ROWS!');
    WHEN NO_DATA_FOUND
        THEN DBMS_OUTPUT.PUT_LINE('NO DATA!');
    WHEN OTHERS
        THEN DBMS_OUTPUT.PUT_LINE('ERROR!!!!');
end warehouses_report;





