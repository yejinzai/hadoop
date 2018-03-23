create table pt_orders ()
partitioned by (id int)
row format delimited
fields terminated by '~'

insert into table pt_orders
partition (id=8999)
select * from orders where order_id <9000

insert into table pt_orders
partition(id=9000)
select * from orders where order_id >9000
