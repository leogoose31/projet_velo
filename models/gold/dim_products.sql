SELECT DISTINCT
    p.product_id,
    p.product_name,
    p.category_id,
    p.category_name,
    p.brand_id,
    p.brand_name,
    p.model_year,
    p.list_price,
    SUM(o.quantity) AS total_quantity_sold,
    SUM(o.total_price) AS total_revenue
FROM {{ ref('silver_dim_products') }} p
LEFT JOIN {{ ref('silver_fact_orders') }} o ON p.product_id = o.product_id
GROUP BY
    p.product_id, p.product_name, p.category_id, p.category_name, 
    p.brand_id, p.brand_name, p.model_year, p.list_price
