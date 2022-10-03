# Model-Level Descriptions

{% docs stg_production__customers %}
One row per customer with details like address and birth date.
{% enddocs %}

{% docs stg_production__fulfillments %}
One row per fulfillment event (e.g. order_packaged, order_shipped) with
keys for both the relevant order and customer
{% enddocs %}

{% docs stg_production__products %}
Table from production database describing shop location.
{% enddocs %}

{% docs stg_production__shops %}
One row per product with details about its cost, size, and type
{% enddocs %}

# Column-Level Descriptions

## Shared Descriptions

{% docs production__customer_id %}
customer unique identifier
{% enddocs %}

{% docs production__shop_id %}
Unique shop id
{% enddocs %}

{% docs production__product_id %}
Unique identifier for products
{% enddocs %}

## Customers Descriptions

{% docs production_customers__customer_name %}
Customer Name
{% enddocs %}

{% docs production_customers__customer_birth_date %}
Customer birthdate
{% enddocs %}

{% docs production_customers__customer_city %}
Customer city
{% enddocs %}

{% docs production_customers__customer_state %}
Customer state
{% enddocs %}

{% docs production_customers__customer_zip_code %}
Customer zipcode
{% enddocs %}

{% docs production_customers__customer_phone_number %}
Customer phone number
{% enddocs %}

{% docs production_customers__customer_email %}
Customer email
{% enddocs %}

{% docs production_customers__customer_gender %}
Customer gender
{% enddocs %}

## Product Descriptions

{% docs production_products__product_price %}
Price of product
{% enddocs %}

{% docs production_products__product_description %}
Description of product
{% enddocs %}

{% docs production_products__product_size %}
Size of product
{% enddocs %}

{% docs production_products__product_type %}
Type of product
{% enddocs %}

## Shop Descriptions

{% docs production_shops__address %}
Street address of the poutine shop.
{% enddocs %}

{% docs production_shops__city %}
City name of the poutine shop location.
{% enddocs %}

{% docs production_shops__province %}
Two character province code for the poutine shop location.
{% enddocs %}

{% docs production_shops__country %}
Two character country code for the poutine shop location.
{% enddocs %}

{% docs production_shops__postal_code %}
Postal code of the poutine shop location.
{% enddocs %}

{% docs production_shops__latitude %}
Latitude coordinates for the location of the poutine shop.
{% enddocs %}

{% docs production_shops__longitude %}
Longitude coordinates for the location of the poutine shop.
{% enddocs %}

## Fulfillment Descriptions

{% docs production_fulfillments__event_name %}
The event name of a fulfillment action during the delivery of a poutine shop product.
{% enddocs %}
