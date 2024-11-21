SELECT *
FROM {{ source('localbike_source', 'customers') }}