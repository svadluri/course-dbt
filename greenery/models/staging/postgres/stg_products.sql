{{
  config(
    materialized='view'
  )
}}

SELECT 
    product_id AS product_uuid,
    name AS product_name,
    price AS price_usd,
    inventory
FROM {{ source('postgres', 'products') }}