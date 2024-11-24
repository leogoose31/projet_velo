SELECT 
    store_name,
    state,
    number_of_orders,
    number_of_customers,
    total_revenue as revenue,
    ROUND(total_revenue/NULLIF(number_of_orders, 0), 2) as avg_order_value,
    number_of_products_sold
FROM {{ ref('int_store_stats') }}