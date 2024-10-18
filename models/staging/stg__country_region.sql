with

source as (
    select *
    from {{ source('raw-data','countryregion') }}
)

, renamed as (
    select
        CountryRegionCode as country_region_code
        , Name as coutry_region_name
        , ModifiedDate as modified_date
    from source
)

select * from renamed
