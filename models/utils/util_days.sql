{% if target.type == 'bigquery' %}
    {% set util_days_start_date = "date('" ~ var('util_days_start_date') ~ "')" %}
    {% set util_days_end_date = 'current_date() + 1' %}

{% elif target.type == 'snowflake' %}
{% set util_days_start_date = "'" ~ var('util_days_start_date') ~ "'::date" %}
{% set util_days_end_date = "current_date + 1" %}

{% else %}
    {{ exceptions.raise_compiler_error("Model util_days must be modified to support " ~ target.type) }}
{% endif %}

{{
    dbt_utils.date_spine(
        datepart="day",
        start_date=util_days_start_date,
        end_date=util_days_end_date
    )
}}
