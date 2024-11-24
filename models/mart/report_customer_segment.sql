SELECT 
    CASE 
        WHEN total_revenue >= 1000 THEN 'High Value'
        WHEN total_revenue >= 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END as customer_segment,
    COUNT(*) as number_of_customers,
    ROUND(AVG(total_revenue), 2) as avg_revenue_per_customer,
    ROUND(AVG(number_of_orders), 1) as avg_orders_per_customer,
    SUM(total_revenue) as total_segment_revenue
FROM {{ ref('int_customer_stats') }}
GROUP BY 1