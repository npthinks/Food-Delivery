select distinct
    dish_name as dish_id,
    dish_name,
    category,
    price
from {{ ref('stg_foodpanda') }}
