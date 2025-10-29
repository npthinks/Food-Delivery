SELECT *
FROM {{ source('bigquery_source', 'foodpanda') }}
LIMIT 10
