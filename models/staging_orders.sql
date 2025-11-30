select
    USER_ID,
    min(ORDER_DATE) as first_order_date,
    max(ORDER_DATE) as most_recent_order_date,
    count(ID) as number_of_orders

from `dbt-tutorial.jaffle_shop.orders`

group by 1