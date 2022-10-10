{{
  config(
    materialized='view'
  )
}}

SELECT 
    order_id AS order_uuid,
    user_id AS user_uuid,
    promo_id AS promo_id,
    address_id AS address_uuid,
    created_at AS order_created_at_utc,
    order_cost AS order_cost_usd,
    shipping_cost AS shipping_cost_usd,
    order_total AS order_total_usd,
    tracking_id AS order_tracking_id,
    shipping_service,
    estimated_delivery_at AS estimated_delivery_at_utc,
    delivered_at AS delivered_at_utc,
    status AS order_status       

FROM {{ source('postgres', 'orders') }}