SELECT 
    FORMAT_DATE('%Y', order_date) as year,
    COUNT(DISTINCT order_id) as number_of_orders,
    COUNT(DISTINCT customer_id) as number_of_customers,
    SUM(quantity) as units_sold,
    SUM(gross_revenue) as gross_revenue,
    SUM(discount_amount) as total_discounts,
    SUM(net_revenue) as net_revenue,
    ROUND(AVG(discount_amount/NULLIF(gross_revenue, 0)) * 100, 2) as avg_discount_rate,
    ROUND(SUM(net_revenue)/COUNT(DISTINCT order_id), 2) as avg_basket_value
FROM {{ ref('int_orders_base') }}
GROUP BY 1
ORDER BY 1