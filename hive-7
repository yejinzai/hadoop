set hive.exec.dynamic.partition.mode=nonstrict;

create table partitioned_orders
(
order_id int,
order_date string,
order_customer_id int,
order_status string
)
partitioned by (order_month string)
row format delimited
fields terminated by ','
stored as textfile;

--static
insert into partitioned_orders
partition (order_month='07')
select * 
from problem10a.orders 
where substring(order_date, 6,2) = '07';


--dynamic
insert overwrite table partitioned_orders
partition (order_month)
select *, substring(order_date, 6, 2) as order_month 
from problem10a.orders
