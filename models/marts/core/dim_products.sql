with stg_products as (
    select * from {{ ref("stg_production__products") }}
),

stg_order_items as (
    select * from {{ ref("stg_transactions__order_items") }}
),

product_full_name_mapping as (
    select * from {{ ref('product_full_name_mapping') }}
),

agg_order_items as (
    select
        product_id,
        sum(quantity) as total_units_sold,
        sum(price) as total_product_revenue,
        min(order_created_at) as product_first_order_at,
        max(order_created_at) as product_recent_order_at,
        count(distinct customer_id) as total_unique_buyers

    from stg_order_items
    group by product_id
),

product_price_mapping as (
    select * from {{ ref('product_category_and_price_mapping') }}
),

final as (
    select
        -- primary key
        stg_products.product_id,

        -- details
        product_full_name_mapping.product_name,
        stg_products.product_price,
        stg_products.product_description,
        stg_products.product_size,
        stg_products.product_type,
        agg_order_items.product_first_order_at,
        agg_order_items.product_recent_order_at,
        product_price_mapping.category as product_category,
        product_price_mapping.price_multiplier as price_multiplier,

        -- metrics
        coalesce(agg_order_items.total_unique_buyers, 0) as total_unique_buyers,
        coalesce(agg_order_items.total_units_sold, 0) as total_units_sold,
        coalesce(
            agg_order_items.total_product_revenue, 0
        ) as total_product_revenue,
        rank() over(
            order by
                agg_order_items.total_units_sold
                desc)
        as total_units_sold_rank,
        rank() over(
            order by
                agg_order_items.total_product_revenue
                desc)
        as total_product_revenue_rank,
        (stg_products.product_price * product_price_mapping.price_multiplier)
        as product_retail_price,
        (stg_products.product_price * product_price_mapping.price_multiplier
         * 1.13
        )
        as product_retail_price_with_tax

    from stg_products
    left join agg_order_items
        on stg_products.product_id = agg_order_items.product_id
    left join product_full_name_mapping
        on stg_products.product_id = product_full_name_mapping.product_id
    left join product_price_mapping
        on stg_products.product_id = product_price_mapping.product_id
)

select * from final
