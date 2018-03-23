create external table categories(category_id int, category_department_id int, category_name string)
row format delimited
fields terminated by ','
location '/user/problem10/a/categories'


create external table customers(
customer_id int,
customer_fname string,
customer_lname string,
customer_email string,
customer_password string,
customer_street string,
customer_city string,
customer_state string,
customer_zipcode string
)
row format delimited
fields terminated by ','
location '/user/problem10/a/customers'


create external table departments(department_id int, department_name string)
row format delimited
fields terminated by ','
location '/user/problem10/a/departments'


create external table orders (
order_id int,
order_date string,
order_customer_id int,
order_status      string
)
row format delimited
fields terminated by ','
location '/user/problem10/a/orders'


create external table order_items (
order_item_id            int,
order_item_order_id      int,
order_item_product_id    int,
order_item_quantity      tinyint,
order_item_subtotal      float,
order_item_product_price float 
)
row format delimited
fields terminated by ','
location '/user/problem10/a/order_items'


create external table products(
product_id int,
product_category_id int,
product_name string,
product_description string,
product_price float,
product_image string
)
row format delimited
fields terminated by ','
location '/user/problem10/a/products'
