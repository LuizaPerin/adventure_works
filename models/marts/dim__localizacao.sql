with

address_table as (
    select *
    from {{ ref('stg__address') }}
    )

, state_province as (
    select *
    from {{ ref('stg__state_province') }}
    )

, county_region as (
    select *
    from {{ ref('stg__country_region') }}
    )

, dim_localizacao as (
    select
        address_table.address_id as adress_id
        , state_province.coutry_region_code as country_region_code
        , address_table.address_line_1 as address_line_1
        , address_table.city as city
        , address_table.postal_code as postal_code
        , address_table.spatial_location as spatial_location
        , state_province.state_province_code as state_province_code
        , state_province.state_province_name as state_province_name
        , county_region.coutry_region_name as country_region_name
    from address_table
    inner join state_province on address_table.state_province_id = state_province.state_province_id
    inner join county_region on state_province.coutry_region_code = county_region.country_region_code
)

select * from dim_localizacao
