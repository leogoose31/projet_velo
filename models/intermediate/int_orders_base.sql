-- Base enrichie des commandes
SELECT 
    o.order_id,
    o.order_date,
    o.customer_id,
    o.store_id,
    oi.product_id,
    oi.quantity,
    oi.list_price as unit_price,
    oi.discount,
    ROUND(oi.quantity * oi.list_price, 2) as gross_revenue,
    ROUND(oi.quantity * oi.list_price * COALESCE(oi.discount, 0), 2) as discount_amount,
    ROUND(oi.quantity * oi.list_price * (1 - COALESCE(oi.discount, 0)), 2) as net_revenue
FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('stg_order_items') }} oi 
    ON o.order_id = oi.order_id