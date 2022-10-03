with src_orders as (
    select * from {{ source('transactions', 'orders') }}
),

final as (
    select
        -- primary key
        order_id,

        -- foreign keys
        customer_id,
        shop_id,

        -- dates & timestamps
        created_at as order_created_at,

        -- metrics
        quantity as order_quantity,
        subtotal as order_subtotal,
        tax as order_tax,
        total as order_total

    from src_orders
    -- remove duplicates by keeping the most recent created_at per order_id
    qualify
        row_number() over (
            partition by order_id
            order by created_at desc
        ) = 1
)

select * from final
