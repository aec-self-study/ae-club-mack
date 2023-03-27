with orders_grouped as (
  select
    customer_id,
    count(distinct id) number_of_orders, 
    min(created_at) first_order_at
  from `analytics-engineers-club.coffee_shop.orders`
  group by customer_id
)
select 
  customer_id, 
  name, 
  email, 
  first_order_at, 
  number_of_orders
from `analytics-engineers-club.coffee_shop.customers` c
left join orders_grouped og on og.customer_id = c.id
order by first_order_at limit 5