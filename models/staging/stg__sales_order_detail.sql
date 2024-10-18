with

source as (
    select *
    from {{ source('raw-data','salesorderdetail') }}
)

, renamed as (
    select
        SalesOrderID as sales_order_id
        , SalesOrderDetailID as sales_order_detail_id
        , CarrierTrackingNumber as carrier_tracking_number
        , OrderQty as order_quantity
        , ProductID as product_id
        , SpecialOfferID as special_offer_id
        , UnitPrice as unit_price
        , UnitPriceDiscount as unit_price_discount
        , rowguid
        , ModifiedDate as modified_date
    from source
)

select * from renamed
