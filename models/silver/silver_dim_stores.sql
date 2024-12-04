    SELECT DISTINCT
        store_id,
        TRIM(CAST(store_name AS STRING)) AS store_name,
        TRIM(CAST(state AS STRING)) AS state,
        city,
        zip_code
    FROM {{ ref('stg_stores') }}
    WHERE store_id IS NOT NULL
