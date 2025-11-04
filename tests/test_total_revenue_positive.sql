SELECT *
FROM {{ ref('analytics') }}
WHERE total_revenue <= 0
