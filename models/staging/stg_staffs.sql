{{ config(
    materialized='view',
    persist_docs={"relation": true, "columns": true}
) }}

SELECT 
    staff_id,
    first_name,
    last_name,
    email,
    phone,
    active,
    store_id,
    manager_id
FROM {{ source('localbike_source', 'staffs') }}