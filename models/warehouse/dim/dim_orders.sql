SELECT DISTINCT
    order_date,
    restaurant_name,
    dish_name,
    category,
    price,
    quantity

FROM {{ ref('stg_foodpanda') }}

WHERE order_id IS NOT NULL