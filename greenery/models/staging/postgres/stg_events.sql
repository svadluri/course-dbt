{{
  config(
    materialized='view'
  )
}}

SELECT 
    event_id AS event_uuid,
    session_id AS session_uuid,
    user_id AS user_uuid,
    event_type,
    page_url,
    created_at AS event_created_at_utc,
    order_id AS order_uuid,
    product_id AS product_uuid
FROM {{ source('postgres', 'events') }}