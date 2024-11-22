{{ config(
    materialized='view',
    persist_docs={"relation": true, "columns": true}
) }}

SELECT 
    store_id,
    store_name,
    phone,
    email,
    city,
    state,
    zip_code
FROM {{ source('localbike_source', 'stores') }}