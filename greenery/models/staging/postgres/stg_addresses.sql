{{
  config(
    materialized='view'
  )
}}

SELECT 
    address_id AS address_uuid,
    address,
    CAST(zipcode AS VARCHAR) AS zipcode,
    state,
    country
FROM {{ source('postgres', 'addresses') }}