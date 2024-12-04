SELECT DISTINCT
    p.product_id,
    p.product_name,
    p.category_id,
    c.category_name,
    p.brand_id,
    b.brand_name,
    p.model_year,
    p.list_price
FROM {{ ref('stg_products') }} p
LEFT JOIN {{ ref('stg_categories') }} c ON p.category_id = c.category_id
LEFT JOIN {{ ref('stg_brands') }} b ON p.brand_id = b.brand_id
WHERE p.product_id IS NOT NULL
