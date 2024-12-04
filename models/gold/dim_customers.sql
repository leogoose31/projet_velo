SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.city,
    c.state,
    c.zip_code,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_price) AS total_spent
FROM {{ ref('silver_dim_customers') }} c
LEFT JOIN {{ ref('silver_fact_orders') }} o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id, c.first_name, c.last_name, c.email, c.city, c.state, c.zip_code
