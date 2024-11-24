SELECT 
    customer_id,
    COUNT(DISTINCT order_id) as number_of_orders,
    SUM(quantity) as total_units_purchased,
    SUM(gross_revenue) as total_gross_revenue,
    SUM(discount_amount) as total_discounts,
    SUM(net_revenue) as total_revenue,
    MIN(order_date) as first_order_date,
    MAX(order_date) as last_order_date
FROM {{ ref('int_orders_base') }}
GROUP BY customer_id