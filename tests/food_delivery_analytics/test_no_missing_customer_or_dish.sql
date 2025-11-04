SELECT *
FROM {{ ref('food_delivery_analytics') }}
WHERE customer_id IS NULL OR dish_id IS NULL
