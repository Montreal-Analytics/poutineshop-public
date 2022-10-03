with shops as (
    select * from {{ ref('stg_production__shops') }}
),

final as (
    select
        -- primary key
        shop_id,

        -- details
        shop_address,
        shop_city,
        shop_province,
        shop_country,
        shop_postal_code,
        shop_latitude,
        shop_longitude

    from shops
)

select * from final
