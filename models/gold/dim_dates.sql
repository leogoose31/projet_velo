SELECT DISTINCT
    o.order_date AS date,
    EXTRACT(YEAR FROM o.order_date) AS year,
    EXTRACT(MONTH FROM o.order_date) AS month,
    EXTRACT(DAY FROM o.order_date) AS day,
    EXTRACT(DAYOFWEEK FROM o.order_date) AS day_of_week,
    EXTRACT(WEEK FROM o.order_date) AS week,
    CASE
        WHEN EXTRACT(DAYOFWEEK FROM o.order_date) IN (1, 7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS is_weekend
FROM {{ ref('silver_fact_orders') }} o
