{{ config(
    materialized='view',
    persist_docs={"relation": true, "columns": true}
) }}

SELECT 
    brand_id,
    brand_name
FROM {{ source('localbike_source', 'brands') }}