SELECT
  customer_id,
  gender,
  age AS age_group,
  city,
  signup_date,
  order_id,
  order_date,
  restaurant_name,
  dish_name,
  category,
  quantity,
  price,
  payment_method,
  order_frequency,
  last_order_date,
  loyalty_points,
  churned AS churned_flag,
  rating,
  rating_date,
  delivery_status
FROM {{ source('bigquery_source', 'foodpanda') }}


