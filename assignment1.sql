--q1
select product_id,product_name, list_price
from products
where list_price=(select max(list_price) from products)
union
select product_id,product_name, list_price
from products
where list_price=(select min(list_price) from products);

--q2-q4
select customer_id, name, nvl(count(order_id),0)
from customers left join orders
using(customer_id)
where customer_id between 10 and 30
group by customer_id, name
order by nvl(count(order_id),0);

--q3- q14 check
select customer_id, order_id, sum(unit_price*quantity) sum, round((select avg(unit_price*quantity) from order_items)) average
from orders o full join order_items a
using(order_id)
group by customer_id, order_id, quantity, unit_price
having sum(unit_price*quantity)> (select avg(unit_price*quantity) from order_items)
order by customer_id;

select count(order_id) from orders right join order_items using(order_id);

select count(customer_id) from orders;

--check q5- q13
select customer_id, name, count(order_id) 
from customers right join orders
using(customer_id)
group by customer_id, name
having count(order_id)<(select sum(count(order_id)) from orders group by order_id)/count(distinct customer_id) 
order by customer_id;

--q6- q10
select customer_id, name, order_id, order_date, sum(quantity), sum(unit_price*quantity) sum
from order_items left join orders using(order_id) left join customers using(customer_id)
where customer_id=1
group by customer_id, name, order_id, order_date
order by sum(unit_price*quantity) desc;

-- q7 - q8
select nvl(salesman_id,0), sum(unit_price*quantity) sum
from order_items full join orders
using (order_id)
group by salesman_id
order by nvl(salesman_id,0);


--q9 -q15
select employee_id, first_name||' ' || last_name "full name", job_title, hire_date
from employees
where to_char(hire_date,'MM')=1
order by hire_date desc;


--q11- q12
select customer_id, name, count(order_id), sum(quantity), sum(quantity*unit_price)
from customers left join orders using(customer_id) left join order_items using(order_id)
group by customer_id, name
having count(order_id) >25
order by count(order_id);





