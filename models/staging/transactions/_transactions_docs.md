# Model-Level Descriptions

{% docs stg_transactions__order %}
One row per order with a key to link it to its customer and details like
quantity and total price
{% enddocs %}

{% docs stg_transactions__order_items %}
One table per order item with keys for the relevant product and order;
the order is linked to 1+ order items
{% enddocs %}

# Column-Level Descriptions

## Shared Descriptions

{% docs transactions__order_id %}
Unique order id; this has duplicates in the raw data
{% enddocs %}

## Orders Descriptions

{% docs transactions_orders__quantity %}
Number of goods
{% enddocs %}

{% docs transactions_orders__subtotal %}
Subtotal of goods without tax
{% enddocs %}

{% docs transactions_orders__tax %}
Tax amount
{% enddocs %}

{% docs transactions_orders__total %}
Total amount (Subtotal + Tax)
{% enddocs %}

{% docs transactions_orders__created_at %}
Created at date
{% enddocs %}

## Order Items Descriptions

{% docs transactions_orders_items__unit_price %}
Price of 1 unit of the product
{% enddocs %}

{% docs transactions_orders_items__price %}
Combined price for all units in order item (i.e. unit_price
multiplied by quantity)
{% enddocs %}

{% docs transactions_orders_items__order_item_unique_sk %}
Unique identifier for each ordered item
{% enddocs %}
