SELECT *
FROM {{ ref('analytics') }}
WHERE order_price <= 0
   OR quantity <= 0
