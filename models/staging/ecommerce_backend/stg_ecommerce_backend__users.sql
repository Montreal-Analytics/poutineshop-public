with users as (
    select * from {{ source('ecommerce_backend','users') }}
),

final as (
    select
        -- primary key
        id as user_id,

        -- dates & timestamps
        created_at,

        -- details
        first_name,
        last_name,
        email,
        age,
        city,
        state,
        country,
        zip,
        latitude,
        longitude,
        gender,
        traffic_source

    from users
)

select * from final
