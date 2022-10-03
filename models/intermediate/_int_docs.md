# Model-Level Descriptions

{% docs int_shop_orders_dimensionalized %}
Dimensionalized order facts with one record per shop. Table with details
about first and latest order date and time, count of orders, quantity of
items, revenue, count of customers and ranking of those metrics. This
table can be joined to any fact table which contains shop_id as the
foreign key.
{% enddocs %}

# Column-Level Descriptions

{% docs int_orders__order_count_rank %}
Ranking of count of orders across shops
rank 1 is first across all shops.
{% enddocs %}

{% docs int_orders__item_quantity_rank %}
Ranking of quantity of items ordered across shops
rank 1 is first across all shops.
{% enddocs %}

{% docs int_orders__customer_count_rank %}
Ranking of count of customers across shops
rank 1 is first across all shops.
{% enddocs %}

{% docs int_orders__revenue_rank %}
Ranking of revenue across shops
rank 1 is highest revenue across all shops.
{% enddocs %}

{% docs int_orders__order_count %}
Count of orders in each shop.
{% enddocs %}

{% docs int_orders__item_quantity %}
Quantity of items ordered.
{% enddocs %}

{% docs int_orders__customer_count %}
Count of customers.
{% enddocs %}

{% docs int_orders__revenue %}
Total revenue.
{% enddocs %}
