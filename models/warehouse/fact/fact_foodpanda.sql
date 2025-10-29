with base as (
    select
        order_id,
        customer_id,
        restaurant_name,
        dish_name,
        category,
        order_date,
        quantity,
        price,
        payment_method,
        loyalty_points,
        churned as churned_flag,
        delivery_status
    from {{ ref('stg_foodpanda') }}
)

select
    order_id,
    customer_id,
    restaurant_name as restaurant_id,
    dish_name as dish_id,
    order_date as order_date_id,
    quantity,
    price,
    payment_method,
    loyalty_points as loyalty_points_earned,
    churned_flag,
    delivery_status
from base
