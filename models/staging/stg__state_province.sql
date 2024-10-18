with

source as (
    select *
    from {{ source('raw-data','stateprovince') }}
)

, renamed as (
    select
        StateProvinceID as state_province_id
        , StateProvinceCode as state_province_code
        , CountryRegionCode as coutry_region_code
        , IsOnlyStateProvinceFlag as is_only_state_province_flag
        , Name as state_province_name
        , TerritoryID as territory_id
        , rowguid
        , ModifiedDate as modified_date
    from source
)

select * from renamed
