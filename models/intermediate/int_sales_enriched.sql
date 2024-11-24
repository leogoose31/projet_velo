-- Ventes enrichies avec dimensions principales
SELECT 
    ob.*,
    p.product_name,
    p.category_id,
    c.category_name,
    s.store_name,
    s.state as store_state,
    st.quantity as current_stock
FROM {{ ref('int_orders_base') }} ob
LEFT JOIN {{ ref('stg_products') }} p 
    ON ob.product_id = p.product_id
LEFT JOIN {{ ref('stg_categories') }} c 
    ON p.category_id = c.category_id
LEFT JOIN {{ ref('stg_stores') }} s 
    ON ob.store_id = s.store_id
LEFT JOIN {{ ref('stg_stocks') }} st 
    ON ob.product_id = st.product_id 
    AND ob.store_id = st.store_id
