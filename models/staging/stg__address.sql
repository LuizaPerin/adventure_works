with

source as (
    select *
    from {{ source('raw-data','address') }}
)

, renamed as (
    select
        AddressID as address_id
        , AddressLine1 as address_line_1
        , AddressLine2 as address_line_2
        , City
        , StateProvinceID as state_province_id
        , PostalCode as postal_code
        , SpatialLocation as spatial_location
        , rowguid
        , ModifiedDate as modified_date
    from source
)

select * from renamed
