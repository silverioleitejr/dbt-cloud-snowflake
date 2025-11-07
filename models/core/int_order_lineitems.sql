WITH joined_data AS (
  SELECT
    li.order_item_key,
    li.part_key,
    li.line_number,
    o.order_key,
    o.customer_key,
    o.order_date
  FROM {{ ref('stg_orders') }} o  -- Correção: Use ref() para staging (padronizado)
  INNER JOIN {{ ref('stg_lineitem') }} li  -- Alias consistente
    ON o.order_key = li.order_key
)
SELECT
  *,
  {{ dbt_utils.generate_surrogate_key(['order_key', 'line_number']) }} AS surrogate_key  -- Chave composta idempotente
FROM joined_data
