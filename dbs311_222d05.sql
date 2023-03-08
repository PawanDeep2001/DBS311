select name,credit_limit
from customers
where credit_limit=(select max(credit_limit) from customers);

select p.category_id, product_id, product_name, l
FROM products p left join(select min(list_price) l, category_id from products
group by category_id) b on p.list_price=b.l;


select last_name, hire_date 
from employees
where to_char(hire_date,'DD-MM-YYYY')> (select to_char(hire_date,'DD-MM-YYYY') from employees where employee_id=107)  and
to_char(hire_date,'MM')>'11'
order by hire_date, employee_id;