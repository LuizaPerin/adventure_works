with

source as (
    select *
    from {{ source('raw-data','customer') }}
)

, renamed as (
    select
        CustomerID as customer_id
        , PersonID as person_id
        , StoreID as store_id
        , TerritoryID as territory_id
        , rowguid
        , ModifiedDate as modified_date
    from source
)

select * from renamed
