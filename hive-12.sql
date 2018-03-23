use problem10a;

select count(1) 
from orders 
where cast(substring(order_date, 1, 10) as date) = '2013-12-14' 
order by order_status

select order_date, count(1) 
from orders 
where order_status = 'COMPLETE' 
and cast(substring(order_date, 1, 10) as date) < '2013-12-14'  
group by order_date

select order_date, order_status, count(1) 
from orders 
where order_status in ('PENDING', 'PAYMENT_REVIEW', 'ON_HOLD') 
and substring(order_date, 1, 7) = '2013-12' 
group by order_date, order_status

select order_date, order_status, count(1) 
from orders 
where order_status in ('PENDING', 'PAYMENT_REVIEW', 'ON_HOLD') 
and cast(substring(order_date, 1, 10) as date) BETWEEN '2013-12-01' AND '2013-12-31' 
group by order_date, order_status


