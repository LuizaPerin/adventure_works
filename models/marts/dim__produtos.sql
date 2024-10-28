with

product as (
    select *
    from {{ ref('stg__product') }}
    )

, dim_produtos as (
    select
        product_id
        , product_name
        , product_number
        , safety_stock_level
        , reorder_point
        , Color
        , product_size
        , size_unit_measure_code
        , product_weight
        , weight_unit_measure_code
        , days_to_manufacture
        , Class
        , Style
        , sell_start_date
        , sell_end_date
        , discontinued_date
    from product
)

select * from dim_produtos
