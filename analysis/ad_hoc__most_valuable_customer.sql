with order_items as (
    select * from {{ ref('stg_ecommerce_backend__order_items') }}
),

final as (
    select
        -- primary key
        order_items.user_id as user_id,

        -- dates
        min(order_items.created_at) as first_purchase_at,
        max(order_items.created_at) as recent_purchase_at,

        -- metrics
        count(order_items.order_id) as total_lifetime_orders_placed,
        sum(order_items.sale_price) as total_lifetime_revenue_from_user

    from order_items
    where order_items.status in ('Complete', 'Shipped', 'Processing')
    group by 1
)

select * from final
