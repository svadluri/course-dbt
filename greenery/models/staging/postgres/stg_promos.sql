{{
  config(
    materialized='view'
  )
}}

SELECT 
    promo_id,
    discount AS discount_usd,
    status AS promo_status
FROM {{ source('postgres', 'promos') }}