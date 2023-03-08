-- ***********************
-- Name: Pawan Deep
-- ID: 111144218
-- Date: 05/18/2022
-- Purpose: Lab 1 DBS311
-- ***********************

-- Question 1 – Print tomorrow's date in a defined format
-- Q1 SOLUTION --

SELECT TO_CHAR(sysdate+1, 'Month DD"th of year "YYYY') AS "Tomorrow"
FROM dual;

-- Question 2 display product id, name, previous price and new price where
-- categoty id is 2, 3 or 5 – 
-- Q2 Solution –

SELECT product_id,
       product_name,
       list_price,
       ROUND(list_price*102/100,0) AS new_price,
       ROUND((list_price*102/100) - list_price,0) AS difference
FROM products
WHERE category_id IN(2,3,5);

-- Question 3 display in a defined format employee's fullname and job title – 
-- Q3 Solution –

SELECT CONCAT(CONCAT(CONCAT(CONCAT(UPPER(first_name),', '), UPPER(last_name)),' is '), job_title|| '.') AS "Employees information"
FROM employees
WHERE manager_id=2;


-- Question 4 display the years each employee worked for, for those hired before
-- october 2016 – 
-- Q4 Solution –

SELECT last_name,
       hire_date,
       ROUND((sysdate-hire_date)/365,0) AS "Years worked"
FROM employees
WHERE TO_CHAR(hire_date,'YYYY')<=2016
AND TO_CHAR(hire_date,'MM')<10
ORDER BY "Years worked";

-- Question 5 display the hire date and review date in a defined format for 
-- all the employees hired after 2016, in this case none because all employees
-- are hired in 2016 – 
-- Q5 Solution –

SELECT last_name,
       TO_CHAR(hire_date,'DAY, Month "the" Ddspth "of year" YYYY') AS hire_date,
       TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date,12),'TUESDAY'),'DAY, Month "the" ddspth "of year" YYYY') AS "REVIEW DAY"
FROM employees
WHERE TO_CHAR(hire_date,'YYYY') > '2016'
ORDER BY "REVIEW DAY";       
       

-- Question 6 display warehouse information and replace null state with unknown – 
-- Q6 Solution –

SELECT warehouse_id,
       warehouse_name,
       city,
       NVL(state, 'unknown') AS state
FROM locations
RIGHT JOIN warehouses
USING(location_id);

