SELECT 
    c.category_name,
    COUNT(DISTINCT ob.order_id) as number_of_orders,
    SUM(ob.quantity) as units_sold,
    SUM(ob.net_revenue) as revenue,
    ROUND(SUM(ob.net_revenue)/NULLIF(SUM(ob.quantity), 0), 2) as avg_unit_price,
    ROUND(SUM(ob.discount_amount)/NULLIF(SUM(ob.gross_revenue), 0) * 100, 2) as avg_discount_rate,
    SUM(st.quantity) as current_stock
FROM {{ ref('stg_categories') }} c
LEFT JOIN {{ ref('stg_products') }} p 
    ON c.category_id = p.category_id
LEFT JOIN {{ ref('int_orders_base') }} ob 
    ON p.product_id = ob.product_id
LEFT JOIN {{ ref('stg_stocks') }} st 
    ON p.product_id = st.product_id
GROUP BY 1
ORDER BY revenue DESC