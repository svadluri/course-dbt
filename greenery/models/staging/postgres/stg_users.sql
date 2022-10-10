{{
  config(
    materialized='view'
  )
}}

SELECT 
    user_id AS user_uuid,
    first_name,
    last_name,
    email,
    phone_number,
    created_at AS user_created_at_utc,
    updated_at AS user_updated_at_utc,
    address_id AS address_uuid
FROM {{ source('postgres', 'users') }}