with products as (
    select * from {{ source('ecommerce_backend', 'products') }}
),

final as (
    select
        -- primary key
        id as product_id,

        -- foreign keys
        distribution_center_id,

        -- details
        cost,
        category,
        name,
        brand,
        retail_price,
        department,
        sku

    from products
    where product_id not in (
        -- records with null sku
        425,
        1009,
        8903,
        29000,
        100,
        -- records with non-unique sku code
        18166,
        683,
        14717,
        27398,
        -- record with no matching distribution centers relationship
        11033
    )
)

select * from final
