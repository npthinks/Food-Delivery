SELECT *
FROM {{ ref('analytics') }}
WHERE customer_id IS NULL 
   OR dish_name IS NULL
