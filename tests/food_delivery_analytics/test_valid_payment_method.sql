SELECT *
FROM {{ ref('food_delivery_analytics') }}
WHERE payment_method NOT IN ('Cash', 'Card', 'UPI', 'Wallet')
