-- Statistiques par magasin
SELECT 
    s.store_id,
    s.store_name,
    s.state,
    COUNT(DISTINCT ob.order_id) as number_of_orders,
    COUNT(DISTINCT ob.customer_id) as number_of_customers,
    SUM(ob.quantity) as total_units_sold,
    SUM(ob.gross_revenue) as total_gross_revenue,
    SUM(ob.discount_amount) as total_discounts,
    SUM(ob.net_revenue) as total_revenue,
    COUNT(DISTINCT ob.product_id) as number_of_products_sold
FROM {{ ref('stg_stores') }} s
LEFT JOIN {{ ref('int_orders_base') }} ob 
    ON s.store_id = ob.store_id
GROUP BY 1, 2, 3