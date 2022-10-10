{% snapshot order_status_snapshot %}

{{
  config(
    target_database = target.database,
    target_schema = target.schema,
    strategy='check',
    unique_key='order_uuid',
    check_cols=['order_status'],
   )
}}

  SELECT * FROM {{ ref('stg_orders') }}
{% endsnapshot %}