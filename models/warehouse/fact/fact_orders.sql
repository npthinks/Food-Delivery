{{ config(materialized='table') }}

WITH base AS (
    SELECT DISTINCT
        o.order_id,
        o.order_date,
        o.customer_id,
        o.restaurant_name,
        o.dish_name,
        o.category,
        o.price,
        o.quantity
    FROM {{ ref('dim_orders') }} AS o
)

SELECT
    -- Foreign Keys
    o.order_id,
    c.customer_id,
    dt.date_key AS order_date_key,
    
    -- Metrics
    o.price AS order_price,
    o.quantity

FROM base AS o
-- Join to customer dimension (if you want customer info for each order)
LEFT JOIN {{ ref('dim_customer') }} AS c
    ON c.customer_id = o.customer_id -- optionally, you can map if you have customer_id in orders

-- Join to date dimension
LEFT JOIN {{ ref('dim_date') }} AS dt
    ON o.order_date = dt.full_date
