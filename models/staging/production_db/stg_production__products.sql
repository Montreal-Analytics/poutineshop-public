with src_products as (
    select * from {{ source('production_db', 'products') }}
),

final as (
    select
        -- primary key
        product_id,

        -- details
        cost as product_price,
        description as product_description,
        size as product_size,
        type as product_type

    from src_products
)

select * from final
