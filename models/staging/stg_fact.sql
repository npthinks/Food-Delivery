{{ config(materialized='table') }}

WITH base AS (
    SELECT
        order_id,
        customer_id,
        restaurant_name,
        dish_name,
        order_date,
        quantity,
        price,
        payment_method,
        loyalty_points,
        churned_flag,
        delivery_status
    FROM {{ ref('stg_foodpanda') }}
    WHERE price IS NOT NULL
      AND quantity IS NOT NULL
)

SELECT
    order_id,
    customer_id,
    dish_name AS dish_id,
    restaurant_name AS restaurant_id,
    FORMAT_DATE('%Y%m%d', order_date) AS order_date_key,

    -- Metrics
    quantity,
    price,
    ROUND(price * quantity, 3) AS total_revenue,
    loyalty_points AS loyalty_points_earned,
    CAST(churned_flag AS STRING) AS churned_flag,
    payment_method,
    delivery_status

FROM base
