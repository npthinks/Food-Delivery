SELECT *
FROM {{ ref('food_delivery_analytics') }}
WHERE order_price <= 0
   OR quantity <= 0
