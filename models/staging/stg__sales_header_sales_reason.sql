with

source as (
    select *
    from {{ source('raw-data','salesorderheadersalesreason') }}
)

, renamed as (
    select
        md5(SalesOrderID || SalesReasonID) as unique_id
        , SalesOrderID as sales_order_id
        , SalesReasonID as sales_reason_id
        , ModifiedDate as modified_date
    from source
)

select * from renamed
