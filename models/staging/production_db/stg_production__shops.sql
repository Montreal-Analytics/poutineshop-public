with src_shops as (
    select * from {{ source('production_db', 'shops') }}
),

final as (
    select
        -- primary key
        id as shop_id,

        -- details
        address as shop_address,
        city as shop_city,
        province as shop_province,
        country as shop_country,
        postal_code as shop_postal_code,
        latitude as shop_latitude,
        longitude as shop_longitude

    from src_shops
)

select * from final
