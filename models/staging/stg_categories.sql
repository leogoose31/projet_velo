{{ config(
    materialized='view',
    persist_docs={"relation": true, "columns": true}
) }}

SELECT 
    category_id,
    category_name
FROM {{ source('localbike_source', 'categories') }}