SELECT DISTINCT
        customer_id,
        -- Utilisation de COALESCE pour gérer les valeurs NULL
        TRIM(COALESCE(CAST(first_name AS STRING), '')) AS first_name,
        TRIM(COALESCE(CAST(last_name AS STRING), '')) AS last_name,
        -- Normalisation de l'email
        LOWER(COALESCE(CAST(email AS STRING), '')) AS email,
        TRIM(COALESCE(CAST(street AS STRING), '')) AS street,
        TRIM(COALESCE(CAST(city AS STRING), '')) AS city,
        TRIM(COALESCE(CAST(state AS STRING), '')) AS state,
        -- Nettoyage du code postal
        TRIM(COALESCE(CAST(zip_code AS STRING), '')) AS zip_code
FROM {{ ref('stg_customers') }}
WHERE customer_id IS NOT NULL