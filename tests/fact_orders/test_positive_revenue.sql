SELECT *
FROM {{ ref('fact_orders') }}
WHERE price <= 0 OR quantity <= 0
