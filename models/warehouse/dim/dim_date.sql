SELECT
    FORMAT_DATE('%Y%m%d', order_date) AS date_key,
    order_date AS full_date,
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    EXTRACT(DAY FROM order_date) AS day,
    EXTRACT(DAYOFWEEK FROM order_date) AS day_of_week,
    EXTRACT(WEEK FROM order_date) AS week_of_year
FROM {{ ref('stg_foodpanda') }}
GROUP BY order_date
