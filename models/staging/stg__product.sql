with

source as (
    select *
    from {{ source('raw-data','product') }}
)

, renamed as (
    select
        ProductID as product_id
        , 'Name' as product_name
        , ProductNumber as product_number
        , MakeFlag as make_flag
        , FinishedGoodsFlag as fineshed_goods_flag
        , Color
        , SafetyStockLevel as safety_stock_level
        , ReorderPoint as reorder_point
        , StandardCost as standard_cost
        , ListPrice as list_price
        , Size as product_size
        , SizeUnitMeasureCode as size_unit_measure_code
        , WeightUnitMeasureCode as weight_unit_measure_code
        , Weight as product_weight
        , DaysToManufacture as days_to_manufacture
        , ProductLine as product_line
        , Class
        , Style
        , ProductSubcategoryID as product_subcategory_id
        , ProductModelID as product_model_id
        , SellStartDate as sell_start_date
        , SellEndDate as sell_end_date
        , DiscontinuedDate as discontinued_date
        , rowguid
        , ModifiedDate as modified_date
    from source
)

select * from renamed
