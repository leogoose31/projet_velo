{{ config(
    materialized='view',
    persist_docs={"relation": true, "columns": true}
) }}

SELECT 
    product_id,
    product_name,
    brand_id,
    category_id,
    model_year,
    list_price
FROM {{ source('localbike_source', 'products') }}