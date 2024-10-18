{{ config(enabled=false) }}

with

source as (
    select *
    from {{ source('raw-data','salesterritory') }}
)

, renamed as (
    select
        TerritoryID as territory_id
        , Name as territory_name
        , CountryRegionCode as country_region_code
        , Group as territory_group
        , SalesYTD as sales_ytd
        , SalesLastYear as sales_last_year
        , CostYTD as cost_ytd
        , CostLastYear as cost_last_year
        , rowguid
        , ModifiedDate as modified_date
    from source
)

select * from renamed
