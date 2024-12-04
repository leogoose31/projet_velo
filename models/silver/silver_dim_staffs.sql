SELECT DISTINCT
    staff_id,
    TRIM(first_name) AS first_name,
    TRIM(last_name) AS last_name,
    LOWER(email) AS email,
    phone,
    active,
    store_id,
    manager_id
FROM {{ ref('stg_staffs') }}
WHERE staff_id IS NOT NULL
