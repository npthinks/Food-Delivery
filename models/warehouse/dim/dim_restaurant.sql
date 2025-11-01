select distinct
    restaurant_name as restaurant_id,
    restaurant_name,
    category,
    city
from {{ ref('stg_foodpanda') }}
