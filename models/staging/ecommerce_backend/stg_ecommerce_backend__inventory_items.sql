with inventory_items as (
    select * from {{ source('ecommerce_backend', 'inventory_items') }}
),

final as (
    select
        -- primary key
        id as inventory_item_id,

        -- foreign keys
        product_id,
        product_distribution_center_id,

        -- dates & timestamps
        created_at,
        sold_at,

        -- details
        cost,
        product_category,
        product_name,
        product_brand,
        product_retail_price,
        product_department,
        product_sku

    from inventory_items
    where inventory_item_id not in (
        -- records with null product_id
        288038,
        218960,
        325238,
        45766,
        99912
    )
)

select * from final
