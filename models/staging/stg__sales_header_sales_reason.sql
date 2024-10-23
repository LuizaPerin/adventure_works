with

source as (
    select *
    from {{ source('raw-data','salesorderheadersalesreason') }}
)

, renamed as (
    select
        SalesOrderID as sales_order_id
        , SalesReasonID as sales_reason_id
        , ModifiedDate as modified_date
    from source
)

select * from renamed