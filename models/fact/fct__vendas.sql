with

sales_header as (
    select *
    from {{ ref('stg__sales_order_header') }}
)

, sales_detail as (
    select *
    from {{ ref('stg__sales_order_detail') }}
)

, sales_reason as (
    select *
    from {{ ref('dim__motivo_de_venda') }}
)


, vendas as (
    select
        md5(sales_header.sales_order_id || sales_detail.product_id) as unique_id
        , sales_header.sales_order_id
        , sales_header.order_date
        , sales_header.customer_id
        , sales_header.sales_person_id
        , sales_header.ship_to_address_id
        , sales_header.credit_card_id
        , sales_detail.product_id
        , sales_detail.order_quantity
        , sales_detail.unit_price
        , sales_detail.unit_price_discount
        , unit_price * order_quantity as gross_amount
        , unit_price * (1 - unit_price_discount) * order_quantity as net_amount
        , gross_amount - net_amount as discount_amount
        , sales_header.sub_total
        , sales_header.tax_amt
        , sales_header.Freight
        , sales_header.total_due
        , listagg(sales_reason.sales_reason_name, ', ') as sales_reason_name
    from sales_header
    left join sales_detail on sales_header.sales_order_id = sales_detail.sales_order_id
    left join sales_reason on sales_header.sales_order_id = sales_reason.sales_order_id
    group by all
)

select * from vendas
