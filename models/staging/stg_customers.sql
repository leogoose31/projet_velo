{{ config(
    materialized='view',
    persist_docs={"relation": true, "columns": true}
) }}

SELECT *
FROM {{ source('localbike_source', 'customers') }}