with shops as (
    select * from {{ ref('dim_shops') }}
),

orders as (
    select * from {{ ref('fct_orders') }}
),

aggregated as (
    select
        shops.shop_id,
        count(distinct orders.order_id) as order_count,
        sum(orders.quantity) as item_quantity,
        sum(orders.price) as revenue,
        min(orders.order_created_at) as first_order_created_at,
        max(orders.order_created_at) as latest_order_created_at,
        count(distinct orders.customer_id) as customer_count

    from shops
    left join orders
        on shops.shop_id = orders.shop_id
    group by 1
),

final as (
    select
        -- primary key
        shop_id,

        -- dates & timestamps
        first_order_created_at,
        latest_order_created_at,

        -- details
        rank() over(
            order by
                order_count
                desc)
        as order_count_rank,
        rank() over(
            order by
                item_quantity
                desc)
        as item_quantity_rank,
        rank() over(
            order by
                customer_count
                desc)
        as customer_count_rank,
        rank() over(
            order by
                revenue
                desc)
        as revenue_rank,

        -- metrics
        coalesce(order_count, 0) as order_count,
        coalesce(item_quantity, 0) as item_quantity,
        coalesce(customer_count, 0) as customer_count,
        coalesce(revenue, 0) as revenue


    from aggregated
)

select * from final
