SELECT f.order_id
FROM {{ ref('fact_orders') }} f
LEFT JOIN {{ ref('dim_dish') }} di
  ON f.dish_id = di.dish_id
WHERE di.dish_id IS NULL
