{{ config(materialized='table') }}

WITH base AS (
    SELECT
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
        churned_flag,
        delivery_status
    FROM {{ ref('stg_foodpanda') }}
)

SELECT
    order_id,
    customer_id,
    restaurant_name AS restaurant_id,
    dish_name AS dish_id,
    FORMAT_DATE('%Y%m%d', order_date) AS order_date_key,
    order_date,
    quantity,
    price,
    payment_method,
    loyalty_points AS loyalty_points_earned,
    churned_flag,
    delivery_status
FROM base
