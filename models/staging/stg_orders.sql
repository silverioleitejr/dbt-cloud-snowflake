-- stg_tpch_orders.sql
{{ config(materialized='view') }}  -- Herda do project.yml
select 
    o_orderkey as order_key,
    o_custkey as customer_key,
    o_orderstatus as status_code,
    o_totalprice as total_price,
    o_orderdate as order_date,
    o_orderpriority as order_priority   
from 
    {{ source('tpch', 'orders') }}   