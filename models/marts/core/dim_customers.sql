with customers as (
    select * from {{ ref('stg_production__customers') }}
),

orders as (
    select * from {{ ref('stg_transactions__orders') }}
),

fill_events as (
    select * from {{ ref('stg_production__fulfillments') }}
),

customers_orders as (
    select
        customer_id,
        min(order_created_at) as first_order_created_at,
        max(order_created_at) as latest_order_created_at,
        sum(order_total) as sum_order_revenue,
        count(order_id) as count_orders,
        iff(
            (count_orders >= {{ var('true_canadian_order_treshold') }}
                or sum_order_revenue >= {{ var('true_canadian_revenue_treshold') }}),
            true,
            false
        ) as is_true_canadian
    from orders
    group by 1
),

customers_fulfillments as (
    select
        customer_id,
        count(distinct fulfillment_event_id) as count_unique_events
    from fill_events
    group by 1
),

final as (
    select
        -- primary key
        customers.customer_id,

        -- dates & timestamps
        customers_orders.first_order_created_at,
        customers_orders.latest_order_created_at,

        -- details
        customers.customer_name,
        customers.customer_gender,
        customers_orders.is_true_canadian,

        -- metrics
        coalesce(customers_orders.count_orders, 0) as count_orders,
        coalesce(
            customers_fulfillments.count_unique_events, 0
        ) as count_unique_events,
        coalesce(customers_orders.sum_order_revenue, 0) as sum_order_revenue

    from customers
    left join customers_orders
              on customers.customer_id = customers_orders.customer_id
    left join customers_fulfillments
              on customers.customer_id = customers_fulfillments.customer_id
)

select * from final
