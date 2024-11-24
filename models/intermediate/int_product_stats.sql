-- Statistiques par produit
SELECT 
    p.product_id,
    p.product_name,
    p.category_id,
    c.category_name,
    COUNT(DISTINCT ob.order_id) as number_of_orders,
    SUM(ob.quantity) as total_units_sold,
    SUM(ob.gross_revenue) as total_gross_revenue,
    SUM(ob.discount_amount) as total_discounts,
    SUM(ob.net_revenue) as total_revenue,
    COALESCE(SUM(s.quantity), 0) as current_stock
FROM {{ ref('stg_products') }} p
LEFT JOIN {{ ref('int_orders_base') }} ob 
    ON p.product_id = ob.product_id
LEFT JOIN {{ ref('stg_categories') }} c 
    ON p.category_id = c.category_id
LEFT JOIN {{ ref('stg_stocks') }} s 
    ON p.product_id = s.product_id
GROUP BY 1, 2, 3, 4