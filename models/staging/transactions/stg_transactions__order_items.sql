with src_order_items as (
    select * from {{ source('transactions', 'order_items') }}
),

final as (
    select
        -- primary key
        {{ dbt_utils.surrogate_key(
            ['order_id', 'product_id']
        ) }} as order_item_unique_sk,

        -- foreign keys
        order_id,
        product_id,
        customer_id,

        -- dates & timestamps
        created_at as order_created_at,

        -- details
        name as product_name,

        -- metrics
        quantity,
        cost as unit_price,
        quantity * cost as price

    from src_order_items
)

select * from final
