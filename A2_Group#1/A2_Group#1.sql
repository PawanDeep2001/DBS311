/*
Name: Pawan Deep 
id: 111144218
Name: Tarlok Kaur 
id: 159117209
Name: Anmoldeep Singh 
id: 142668201
Name: Pushpinder Kaur 
id: 141578203
Name: Ajitpal Singh
id: 113194211
*/
-- create find_customer module which return 1 if the customer is found, 0 otherwise
CREATE OR REPLACE PROCEDURE find_customer (customer_id IN NUMBER, found OUT NUMBER) AS
    a NUMBER:=0;
BEGIN
    found:=1; 
    SELECT c.customer_id INTO a
    FROM customers c
    WHERE c.customer_id=find_customer.customer_id; -- select that customer id where the entered customer ID is equal to it
    EXCEPTION
        WHEN no_data_found THEN -- exceptional case if no data is found, return 0
    	found := 0;
END;
/

-- create find_product procedure which returns the price of the entered product
CREATE OR REPLACE PROCEDURE find_product (product_id IN NUMBER, price OUT products.list_price%TYPE) AS
BEGIN
    SELECT p.list_price INTO price
    FROM products p
    WHERE p.product_id=find_product.product_id;
    EXCEPTION
        WHEN no_data_found THEN -- exceptional case if no data is found, return 0
    	price := 0;
END;
/
-- create add_order procedure which returns the new_order_id and adds customer_id entered by the user, the order_id, status as 'shipped', salesman_id as 56 and today's date in order_date
CREATE OR REPLACE PROCEDURE add_order (customer_id IN NUMBER, new_order_id OUT NUMBER) AS
BEGIN
    select max(order_id)+1 a into new_order_id from orders; -- select the order_id one more than the maximum one and add it in new_order_id
    INSERT INTO new_orders(order_id,
                       customer_id,
                       status,
                       salesman_id,
                       order_date)
          VALUES( new_order_id,
                 add_order.customer_id,
                 'shipped',
                 56,
                 sysdate());
END;
/

-- create add_order_item procedure which adds the new order_id, item_id, product_id, quantity and unit_price in new table new_order_items
CREATE OR REPLACE PROCEDURE add_order_item (orderId IN order_items.order_id%type, itemId IN order_items.item_id%type, productId IN order_items.product_id%type, quantity IN order_items.quantity%type, price IN order_items.unit_price%type) AS
BEGIN
    INSERT INTO new_order_items(order_id,
                       item_id,
                       product_id,
                       quantity,
                       unit_price)
          VALUES(add_order_item.orderId,
                 add_order_item.itemId,
                 add_order_item.productId,
                 add_order_item.quantity,
                 add_order_item.price);
END;
/

