{{config(materialized='table')}}

with ORDERS as (
    select * from {{ref('staging_orders')}}
),

CUSTOMERS as (
    select * from {{ref('staging_customers')}}
)

select
    CUSTOMERS.ID,
    CUSTOMERS.FIRST_NAME,
    CUSTOMERS.LAST_NAME,
    ORDERS.first_order_date,
    ORDERS.most_recent_order_date,
    coalesce(ORDERS.number_of_orders, 0) as number_of_orders

from CUSTOMERS

left join ORDERS on ORDERS.USER_ID=CUSTOMERS.ID