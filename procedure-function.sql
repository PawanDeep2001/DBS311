SET SERVEROUTPUT ON;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Welcome to dbs!!');
END;

declare
num1 number:=100;
num2 number:=0;
operation1 number;
operation2 number;
operation3 number;
operation4 float;
begin
operation1:=num1+num2;
operation2:=num1-num2;
operation3:=num1*num2;
operation4:=num1/num2;
DBMS_OUTPUT.PUT_LINE('operation 1: '|| operation1);
DBMS_OUTPUT.PUT_LINE('operation 2: '|| operation2);
DBMS_OUTPUT.PUT_LINE('operation 3: '|| operation3);
DBMS_OUTPUT.PUT_LINE('operation 4: '|| operation4);
EXCEPTION
WHEN Others
THEN 
DBMS_OUTPUT.PUT_LINE ('Error!');
end;


DECLARE
value_1 NUMBER := 20;
value_2 NUMBER := 5;
addition NUMBER;
subtraction NUMBER;
multiplication NUMBER;
division FLOAT;
BEGIN

addition := value_1 + value_2;
subtraction := value_1 - value_2;
multiplication := value_1 * value_2;
division := value_1 / value_2;
DBMS_OUTPUT.PUT_LINE ('addition: ' || addition);
DBMS_OUTPUT.PUT_LINE ('subtraction: ' || subtraction);
DBMS_OUTPUT.PUT_LINE ('multiplication: ' || multiplication);
DBMS_OUTPUT.PUT_LINE ('division: ' || division);
END;

DECLARE
value_1 NUMBER := 20;
value_2 NUMBER := 0;
division NUMBER;
BEGIN
division := value_1 / value_2;
DBMS_OUTPUT.PUT_LINE ('division: ' || division);
EXCEPTION
WHEN OTHERS
THEN
DBMS_OUTPUT.PUT_LINE ('Error!');
END;

DECLARE
productId NUMBER := 2;
productName VARCHAR2(255 BYTE);
price NUMBER(9,2);
BEGIN
SELECT product_name, List_price INTO productName, price
FROM products
WHERE product_id = productID;
DBMS_OUTPUT.PUT_LINE ('Product Name: ' || productName);
DBMS_OUTPUT.PUT_LINE ('Product Price: ' || price);
END;


DECLARE
productId NUMBER := 300;
productName VARCHAR2(255 BYTE);
price NUMBER(9,2);
BEGIN
SELECT product_name, List_price INTO productName, price
FROM products
WHERE product_id = productId;
DBMS_OUTPUT.PUT_LINE ('Product Name: ' || productName);
DBMS_OUTPUT.PUT_LINE ('Product Price: ' || price);
EXCEPTION
WHEN NO_DATA_FOUND
THEN
DBMS_OUTPUT.PUT_LINE ('No Data Found!');
END;


DECLARE
semester CHAR(1);
BEGIN
semester := 'S';
CASE semester
WHEN 'F' THEN DBMS_OUTPUT.PUT_LINE('Fall Term');
WHEN 'W' THEN DBMS_OUTPUT.PUT_LINE('Winter Term');
WHEN 'S' THEN DBMS_OUTPUT.PUT_LINE('Summer Term');
ELSE DBMS_OUTPUT.PUT_LINE('Wrong Value');
END CASE;
END;


DECLARE
semester CHAR(1);
BEGIN
semester := 'S';-- 'X' ''
IF semester = 'F' THEN
DBMS_OUTPUT.PUT_LINE('Fall Term');
ELSIF semester = 'W' THEN
DBMS_OUTPUT.PUT_LINE('Winter Term');
ELSIF semester = 'S' THEN
DBMS_OUTPUT.PUT_LINE('Summer Term');
ELSE
DBMS_OUTPUT.PUT_LINE('Wrong Value');
END IF;
END;


create or replace procedure Factorial(num in out number) as
begin
num:=num;
end;

declare
begin
x:=Factorial(5);
dbms_output.put_line(x);
end;