{{ config(
    materialized='view',
    persist_docs={"relation": true, "columns": true}
) }}

SELECT 
    store_id,
    product_id,
    quantity
FROM {{ source('localbike_source', 'stocks') }}