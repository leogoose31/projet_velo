SELECT
    o.order_id,
    o.customer_id,
    o.store_id,
    o.staff_id,
    o.order_status,
    o.order_date,
    o.required_date,
    o.shipped_date,
    oi.product_id,
    oi.quantity,
    oi.list_price,
    oi.discount,
    (oi.quantity * oi.list_price * (1 - oi.discount)) AS total_price
FROM {{ ref('stg_orders') }} o
JOIN {{ ref('stg_order_items') }} oi ON o.order_id = oi.order_id
WHERE o.order_id IS NOT NULL
