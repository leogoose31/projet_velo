SELECT
    o.order_id,
    o.customer_id,
    o.store_id,
    o.staff_id,
    o.order_date,
    o.shipped_date,
    p.product_id,
    p.category_id,
    p.brand_id,
    s.city,
    SUM(o.total_price) AS total_sales,
    SUM(o.quantity) AS total_quantity,
    AVG(p.list_price) AS avg_price,
    CASE
        WHEN o.shipped_date = 'NULL' THEN NULL
        ELSE DATE_DIFF(DATE(shipped_date), order_date, DAY)
    END AS shipping_days
FROM {{ ref('silver_fact_orders') }} o
LEFT JOIN {{ ref('dim_products') }} p ON o.product_id = p.product_id
LEFT JOIN {{ ref('dim_stores') }} s ON o.store_id = s.store_id
GROUP BY 1,2,3,4,5,6,7,8,9,10