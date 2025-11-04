{{ config(materialized='view') }}

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

    -- 🍽️ Dish & Cuisine Details
    d.dish_id,
    d.dish_name,
    d.category AS cuisine,
    d.price AS dish_price,

    -- 🏪 Restaurant Details
    r.restaurant_id,
    r.restaurant_name,
    r.category AS restaurant_category,
    r.city AS restaurant_city,

    -- 🧾 Fact / Order Details
    f.order_id,
    f.quantity,
    f.order_price,
    ROUND(f.total_revenue, 3) AS total_revenue,
    f.loyalty_points_earned,
    f.churned_flag AS order_churned_flag,
    f.payment_method,
    f.delivery_status

FROM {{ ref('fact_orders') }} AS f

-- Join Dimensions
LEFT JOIN {{ ref('dim_customer') }} AS c
    ON f.customer_id = c.customer_id

LEFT JOIN {{ ref('dim_dish') }} AS d
    ON f.dish_id = d.dish_id

LEFT JOIN {{ ref('dim_restaurant') }} AS r
    ON f.restaurant_id = r.restaurant_id

LEFT JOIN {{ ref('dim_date') }} AS dt
    ON f.order_date_key = dt.date_key

WHERE f.price IS NOT NULL
  AND f.quantity IS NOT NULL

  ---
