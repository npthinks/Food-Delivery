SELECT *
FROM {{ ref('analytics') }}
WHERE payment_method NOT IN ('Cash', 'Card', 'Wallet')
