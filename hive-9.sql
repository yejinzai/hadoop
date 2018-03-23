with a as (
  select d.department_id
  , sum(oi.order_item_subtotal) as subtotal
  from orders o
  inner join order_items oi on oi.order_item_order_id = o.order_id
  inner join products p on oi.order_item_product_id = p.product_id
  inner join categories c on c.category_id = p.product_category_id
  inner join departments d on d.department_id = c.category_department_id 
  WHERE o.order_status in ('COMPLETE', 'CLOSED')
  group by d.department_id
), b as (
  select sum(a.subtotal) as grandtotal
  from a
)
select d.department_name, round((a.subtotal/b.grandtotal)*100,2) as pct
, percent_rank() over (order by a.subtotal desc) as pctrank
from a, b
inner join departments d on d.department_id = a.department_id 
order by pct desc
