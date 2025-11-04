SELECT
  -- 📆 Date Details
  d.date_key,
  d.year,
  d.month,
  d.day,
  d.week_of_year,
  d.day_of_week,

  -- 👤 Customer Details
  c.customer_id,
  c.gender,
  c.age_group,
  c.city,
  c.signup_date,
  c.last_order_date,
  c.order_frequency,
  CAST(c.loyalty_points AS FLOAT64) AS loyalty_points,
  c.churned_flag AS customer_churn_flag,

  -- 🍽️ Dish & Cuisine Details
  di.dish_id,
  di.dish_name,
  di.category AS cuisine,
  di.price AS dish_price,

  -- 🧾 Fact Details
  f.order_id,
  f.restaurant_id,
  f.payment_method,
  f.quantity,
  f.price AS order_price,
  ROUND(f.price * f.quantity, 3) AS total_revenue,
  f.loyalty_points_earned,
  f.delivery_status

FROM {{ ref('fact_orders') }} AS f
LEFT JOIN {{ ref('dim_customer') }} AS c
  ON f.customer_id = c.customer_id
LEFT JOIN {{ ref('dim_dish') }} AS di
  ON f.dish_id = di.dish_id
LEFT JOIN {{ ref('dim_date') }} AS d
  ON f.order_date_key = d.date_key
WHERE f.price IS NOT NULL
  AND f.quantity IS NOT NULL
