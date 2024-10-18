with

source as (
    select *
    from {{ source('raw-data','salesreason') }}
)

, renamed as (
    select
        SalesReasonID as sales_reason_id
        , 'Name' as sales_reason_name
        , ReasonType as reason_type
        , ModifiedDate as modified_date
    from source
)

select * from renamed
