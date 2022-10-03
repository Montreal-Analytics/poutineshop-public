with order_items as (
    select * from {{ source('ecommerce_backend','order_items') }}
),

final as (
    select
        -- primary key
        id as order_item_id,

        -- foreign keys
        order_id,
        user_id,
        inventory_item_id,

        -- dates & timestamps
        created_at,
        returned_at,
        shipped_at,
        delivered_at,

        -- details
        sale_price,
        status

    from order_items
    where order_item_id not in (
        -- records with 'Test' value as status
        298433,
        56567,
        68410,
        84202,
        -- record with null order_id
        289395
    )
)

select * from final
