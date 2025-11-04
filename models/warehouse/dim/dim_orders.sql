SELECT DISTINCT
    order_id,
    customer_id,
    order_date,
    restaurant_name,
    dish_name,
    category,
    price,
    quantity,
    payment_method

FROM {{ ref('stg_foodpanda') }}

WHERE order_id IS NOT NULL