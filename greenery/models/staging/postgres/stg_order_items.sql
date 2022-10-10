{{
  config(
    materialized='view'
  )
}}

SELECT 
    order_id AS order_uuid,
    product_id AS product_uuid,
    quantity
FROM {{ source('postgres', 'order_items') }}