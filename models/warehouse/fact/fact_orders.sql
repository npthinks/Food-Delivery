{{ config(materialized='table') }}

SELECT
    -- Foreign Keys
    f.order_id,
    c.customer_id,
    d.dish_id,
    r.restaurant_id,
    dt.date_key AS order_date_key,

    -- Metrics
    f.quantity,
    f.price AS order_price,
    f.total_revenue,
    f.loyalty_points_earned,
    f.churned_flag,
    f.payment_method,
    f.delivery_status

FROM {{ ref('stg_fact') }} AS f

-- Join to Dimensions for Keys
LEFT JOIN {{ ref('dim_customer') }} AS c
    ON f.customer_id = c.customer_id

LEFT JOIN {{ ref('dim_dish') }} AS d
    ON f.dish_id = d.dish_id

LEFT JOIN {{ ref('dim_restaurant') }} AS r
    ON f.restaurant_id = r.restaurant_id

LEFT JOIN {{ ref('dim_date') }} AS dt
    ON f.order_date_key = dt.date_key
