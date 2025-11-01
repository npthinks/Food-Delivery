select distinct
    customer_id,
    gender,
    age_group,
    city,
    signup_date,
    last_order_date,
    order_frequency,
    loyalty_points,
    churned_flag
from {{ ref('stg_foodpanda') }}
