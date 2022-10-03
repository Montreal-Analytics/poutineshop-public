with order_items as (
    select * from {{ ref('stg_transactions__order_items') }}
),

customers as (
    select * from {{ ref('stg_production__customers') }}
),

orders as (
    select * from {{ ref('stg_transactions__orders') }}
),

final as (

    select
        -- primary key
        {{ dbt_utils.surrogate_key(['order_items.order_item_unique_sk',
            'order_items.order_id']) 
        }} as orders_sk,

        -- foreign keys
        order_items.order_item_unique_sk,
        order_items.order_id,
        order_items.product_id,
        order_items.customer_id,
        orders.shop_id,

        -- dates & timestamps
        order_items.order_created_at,

        -- metrics
        order_items.quantity,
        order_items.unit_price,
        order_items.price

    from order_items
    left join customers
        on order_items.customer_id = customers.customer_id
    left join orders
        on order_items.order_id = orders.order_id
)

select * from final
