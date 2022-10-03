{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- elif custom_schema_name.lower() == 'dbt_artifacts' -%}

        {{ custom_schema_name | trim }}

    {%- elif target.name == 'prod' %}

        {# in prod, do not prepend the default_schema #}
        {{ custom_schema_name | trim }}

    {%- else -%}

        {# in dev/ci, build all tables in the default_schema, ignoring custom schemas #}
        {{ default_schema }}

    {%- endif -%}

{%- endmacro %}
