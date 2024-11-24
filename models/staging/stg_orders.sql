{{ config(
    materialized='view',
    persist_docs={"relation": true, "columns": true}
) }}

SELECT 
    order_id,
    customer_id,
    order_status,
    order_date,
    required_date,
    shipped_date,
    store_id,
    staff_id
FROM {{ source('localbike_source', 'orders') }}