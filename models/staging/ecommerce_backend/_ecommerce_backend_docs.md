# Model-Level Descriptions

{% docs stg_ecommerce_backend__distribution_centers %}
One row per distribution center for Poutine Shop inventory
{% enddocs %}

{% docs stg_ecommerce_backend__events %}
One row per page visit event on the Poutine Shop website with details about the session context
{% enddocs %}

{% docs stg_ecommerce_backend__inventory_items %}
One row per item in the Poutine Shop inventory with a key for its product and details about when it was created and when it was sold
{% enddocs %}

{% docs stg_ecommerce_backend__order_items %}
One row per order item that was purchsed from the Poutine Shop; every order has 1+ order items
{% enddocs %}

{% docs stg_ecommerce_backend__products %}
One row per product available in the Poutine Shop
{% enddocs %}

{% docs stg_ecommerce_backend__users %}
One row per user that shopped at Poutine Shop with details like their name and non-specific address
{% enddocs %}

# Column-Level Descriptions

## Shared Descriptions

{% docs ecommerce_backend__distribution_center_id %}
Unique ID for a given Poutine Shop distribution center
{% enddocs %}

{% docs ecommerce_backend__event_id %}
Unique ID for each Poutine Shop events
{% enddocs %}

{% docs ecommerce_backend__order_id %}
Unique ID for each order at Poutine Shop
{% enddocs %}

{% docs ecommerce_backend__inventory_item_id %}
Unique ID given to each inventory_item records
{% enddocs %}

{% docs ecommerce_backend__order_item_id %}
Unique ID given to each order_item records
{% enddocs %}

{% docs ecommerce_backend__product_id %}
Unique ID for each Poutine Shop product
{% enddocs %}

{% docs ecommerce_backend__user_id %}
Unique ID for each user that shopped at Poutine Shop
{% enddocs %}

{% docs ecommerce_backend__browser %}
Internet browser used
{% enddocs %}

{% docs ecommerce_backend__city %}
City associated to the record
{% enddocs %}

{% docs ecommerce_backend__country %}
Country associated to the record
{% enddocs %}

{% docs ecommerce_backend__zip %}
Zip code associated to the record
{% enddocs %}

{% docs ecommerce_backend__ip_address %}
A unique IPV4 address that identifies a device on the internet associated to the record
{% enddocs %}

{% docs ecommerce_backend__latitude %}
A geographic coordinate that specifies the north-south position on Earth, that is associated to the record.
{% enddocs %}

{% docs ecommerce_backend__longitude %}
A geographic coordinate that specifies the east–west position on Earth, that is associated to the record
{% enddocs %}

{% docs ecommerce_backend__os %}
Operating System of the device
{% enddocs %}

{% docs ecommerce_backend__state %}
State associated to the record
{% enddocs %}

{% docs ecommerce_backend__gender %}
User's gender
{% enddocs %}

{% docs ecommerce_backend__returned_at %}
Date and timestamp when the item was returned at
{% enddocs %}

{% docs ecommerce_backend__shipped_at %}
Date and timestamp when the item was shipped at
{% enddocs %}

{% docs ecommerce_backend__created_at %}
Date and timestamp when record is created
{% enddocs %}

{% docs ecommerce_backend__delivered_at %}
Date and timestamp of when the item was delivered at
{% enddocs %}

# Distribution Center Descriptions

{% docs ecommerce_backend_distribution_centers__name %}
The city and province name of the Poutine Shop distribution center
{% enddocs %}

# Events Descriptions

{% docs ecommerce_backend_events__event_type %}
The event type - description associated to the event record
{% enddocs %}

{% docs ecommerce_backend_events__sequence_number %}
A number indicating the position of the event over a series of events from a session
{% enddocs %}

{% docs ecommerce_backend_events__session_id %}
Unique ID given to a Poutine Shop session
{% enddocs %}

{% docs ecommerce_backend_events__traffic_source %}
The traffic source associated to the record
{% enddocs %}

{% docs ecommerce_backend_events__uri %}
URI associated to the record
{% enddocs %}

## Inventory Item Descriptions

{% docs ecommerce_backend_inventory_items__cost %}
Cost amount in CAD for the item
{% enddocs %}

{% docs ecommerce_backend_inventory_items__sold_at %}
Date and timestamp when item was sold at
{% enddocs %}

## Order Item Descriptions

{% docs ecommerce_backend_order_items__sale_price %}
The final selling price the cutomer bought the item at
{% enddocs %}

{% docs ecommerce_backend_order_items__status %}
The status of the order

| Status | Definition |
| ---- | ---- |
| Complete | Order is completed |
| Cancelled | Order is cancelled |
| Shipped | Order is shipped |
| Processing | Order is still in process |
| Returned | Order is returned |
{% enddocs %}

## Product Descriptions

{% docs ecommerce_backend_products__brand %}
The brand of the product
{% enddocs %}

{% docs ecommerce_backend_products__category %}
The Poutine category the product belongs in
{% enddocs %}

{% docs ecommerce_backend_products__cost %}
Cost amount in CAD for the item
{% enddocs %}

{% docs ecommerce_backend_products__department %}
The department of the product
{% enddocs %}

{% docs ecommerce_backend_products__name %}
The name of the product
{% enddocs %}

{% docs ecommerce_backend_products__retail_price %}
The retail selling price of the product
{% enddocs %}

{% docs ecommerce_backend_products__sku %}
The sku code of the product
{% enddocs %}

## User Descriptions

{% docs ecommerce_backend_users__age %}
User's years old
{% enddocs %}

{% docs ecommerce_backend_users__email %}
User's email address
{% enddocs %}

{% docs ecommerce_backend_users__first_name %}
User's first name
{% enddocs %}

{% docs ecommerce_backend_users__last_name %}
User's last name
{% enddocs %}

{% docs ecommerce_backend_users__traffic_source %}
The traffic source associated to the record
{% enddocs %}
