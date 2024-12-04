SELECT
    s.store_id,
    s.store_name,
    s.city,
    s.state,
    s.zip_code,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_price) AS total_revenue
FROM {{ ref('silver_dim_stores') }} s
LEFT JOIN {{ ref('silver_fact_orders') }} o ON s.store_id = o.store_id
GROUP BY
    s.store_id, s.store_name, s.city, s.state, s.zip_code
