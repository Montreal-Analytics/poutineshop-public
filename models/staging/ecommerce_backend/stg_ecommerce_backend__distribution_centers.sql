with distribution_centers as (
    select * from {{ source('ecommerce_backend', 'distribution_centers') }}
),

final as (
    select
        -- primary key
        id as distribution_center_id,

        -- details
        name,
        latitude,
        longitude

    from distribution_centers
)

select * from final
