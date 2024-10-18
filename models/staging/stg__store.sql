with

source as (
    select *
    from {{ source('raw-data','store') }}
)

, renamed as (
    select
        BusinessEntityID as business_entity_id
        , Name as store_name
        , SalesPersonID as sales_person_id
        , Demographics
        , rowguid
        , ModifiedDate as modified_date
    from source
)

select * from renamed
