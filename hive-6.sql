create table b_orders
like problem10a.orders
stored as textfile;

alter table b_orders
clustered by (order_id) into 5 buckets;

create table b_order_items
like problem10a.orders_items
stored as textfile;

alter table b_order_items
clustered by (order_item_order_id) into 5 buckets;

set hive.enforce.bucketing=true;

insert into b_orders
select * from problem10a.orders;

insert into b_order_items
select * from problem10a.order_items;
