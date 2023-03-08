create table new_employees as
select * from employees
where hire_date<= '16-02-01'
order by hire_date;



select * from new_employees;
select * from employees
where first_name like 'L%'
union 
select * from new_employees
where first_name like 'O%';

--107
select * from employees--107
union
select * from new_employees;--14

--121
select * from employees--107
union all
select * from new_employees;--14

SELECT employee_id, job_title, manager_id
FROM employees
INTERSECT
SELECT employee_id, job_title, manager_id
FROM new_employees
ORDER BY employee_id;

SELECT employee_id as "Emp#", job_title as "Job Title"
FROM employees
UNION ALL
SELECT employee_id, job_title
FROM new_employees
ORDER BY 1, 2;

SELECT employee_id, job_title ---A
FROM employees
MINUS
SELECT employee_id, job_title ---B A-B >>> 107-14=93
FROM new_employees
ORDER BY 1, 2;

SELECT customer_id,name,order_id
from customers join orders using(customer_id);


select customers.customer_id,name,orders.order_id
from customers,orders
where orders.customer_id=customers.customer_id;

create table employee_no_manager as
select *
from employees
where manager_id is null;

select *
from employee_no_manager;

select first_name
from employees e
minus
select first_name
from employee_no_manager
order by first_name;

select first_name, last_name
from employees
where lower(first_name) like('a%')
union
select first_name,last_name
from employee_no_manager
order by first_name desc;

select category_id 
from products
intersect
select category_id
from product_categories;

select category_id, category_name, count(product_id) "number of products"
from product_categories
right join products
using(category_id)
where category_id=4
group by category_id,category_name
union all
select category_id, category_name, count(product_id)
from product_categories
right join products
using(category_id)
where category_id=1
group by category_id,category_name
union all
select category_id, category_name, count(product_id)
from product_categories
right join products
using(category_id)
where category_id=2
group by category_id,category_name;

select category_id, category_name, count(product_id)
from product_categories
left join products
using(category_id)
where category_id in(1,4,2)
group by category_id,category_name;