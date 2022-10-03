{% macro grant_select(role) %}
{% set sql %}
      grant select on {{ this }} to role {{ role }}
{% endset %}

{% do run_query(sql) %}
{% do log("Privileges granted", info=True) %}
{% endmacro %}
