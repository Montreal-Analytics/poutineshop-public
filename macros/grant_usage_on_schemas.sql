{% macro grant_usage_on_schemas(schemas, role) %}
    {% for schema in schemas %}
        grant usage on schema {{ schema }} to role {{ role }};
    {% endfor %}
{% endmacro %}
