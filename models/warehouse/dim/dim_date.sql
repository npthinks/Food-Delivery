select
    order_date as date_id,
    extract(year from order_date) as year,
    extract(month from order_date) as month,
    extract(day from order_date) as day,
    extract(dayofweek from order_date) as day_of_week,
    extract(week from order_date) as week_of_year
from {{ ref('stg_foodpanda') }}
group by order_date
