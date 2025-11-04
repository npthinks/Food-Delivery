{{ config(materialized='table') }}

SELECT
    -- 📆 Date Details
    dt.date_key,
    dt.year,
    dt.month,
    dt.day,
    dt.week_of_year,
    dt.day_of_week,

    -- 👤 Customer Details
    c.customer_id,
    c.gender,
    c.age_group,
    c.city AS customer_city,
    c.signup_date,
    c.last_order_date,
    c.order_frequency,
    CAST(c.loyalty_points AS FLOAT64) AS loyalty_points,
    c.churned_flag AS customer_churn_flag,

    -- 🧾 Order / Fact Details
    f.order_id,
    o.restaurant_name,
    o.dish_name,
    o.category AS cuisine,
    o.payment_method,
    f.order_price,
    f.quantity,
    ROUND(f.order_price * f.quantity, 2) AS total_revenue

FROM {{ ref('fact_orders') }} AS f

-- Join Dimensions
LEFT JOIN {{ ref('dim_customer') }} AS c
    ON f.customer_id = c.customer_id

LEFT JOIN {{ ref('dim_date') }} AS dt
    ON f.order_date_key = dt.date_key

-- Join orders dimension to get dish/restaurant info
LEFT JOIN {{ ref('dim_orders') }} AS o
    ON f.order_id = o.order_id

WHERE f.order_price IS NOT NULL
  AND f.quantity IS NOT NULL
