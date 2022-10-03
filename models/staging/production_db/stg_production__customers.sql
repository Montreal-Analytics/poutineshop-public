with src_customers as (
    select * from {{ source('production_db', 'customers') }}
),

final as (
    select
        -- primary key
        customer_id,

        -- details
        name as customer_name,
        birthdate as customer_birth_date,
        city as customer_city,
        state as customer_state,
        zipcode as customer_zip_code,
        -- L057 fails for this line because it includes the special char "-"
        "phone-number" as customer_phone_number, --noqa
        email as customer_email,
        gender as customer_gender

    from src_customers
)

select * from final
