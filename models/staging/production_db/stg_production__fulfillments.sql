with src_fulfillments as (
    select * from {{ source('production_db', 'fulfillment') }}
),

final as (
    select
        -- primary key
        event_id as fulfillment_event_id,

        -- foreign keys
        order_id,
        customer_id,

        -- dates & timestamps
        created_at,

        -- details
        event_name

    from src_fulfillments
)

select * from final
