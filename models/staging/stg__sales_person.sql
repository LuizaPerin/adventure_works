with

source as (
    select *
    from {{ source('raw-data','salesperson') }}
)

, renamed as (
    select
        BusinessEntityID as business_entity_id
        , TerritoryID as territory_id
        , SalesQuota as sales_quota
        , Bonus
        , CommissionPct as commission_pct
        , SalesYTD as sales_ytd
        , SalesLastYear as sales_last_year
        , rowguid
        , ModifiedDate as modified_date
    from source
)

select * from renamed
