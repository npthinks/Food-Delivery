SELECT *
FROM {{ ref('food_delivery_analytics') }}
WHERE total_revenue <= 0
