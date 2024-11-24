SELECT 
    product_name,
    category_name,
    total_units_sold as units_sold,
    total_revenue as revenue,
    number_of_orders,
    ROUND(total_revenue/NULLIF(total_units_sold, 0), 2) as avg_unit_price,
    current_stock
FROM {{ ref('int_product_stats') }}
WHERE total_units_sold > 0
ORDER BY revenue DESC