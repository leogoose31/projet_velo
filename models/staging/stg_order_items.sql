{{ config(
    materialized='view',
    persist_docs={"relation": true, "columns": true}
) }}

SELECT 
    order_id,
    item_id,
    product_id,
    quantity,
    list_price,
    discount
FROM {{ source('localbike_source', 'order_items') }}