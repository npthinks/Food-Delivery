select distinct
    customer_id,
    gender,
    age as age_group,
    city,
    signup_date,
    last_order_date,
    order_frequency,
    loyalty_points,
    churned as churned_flag
from {{ ref('stg_foodpanda') }}
