{% macro dicounted_amount(extended_price, discount_percentage,scale=2) %}
    (-1 * {{ extended_price }} *{{discount_percentage}})::numeric(16, {{ scale }})
{% endmacro %}