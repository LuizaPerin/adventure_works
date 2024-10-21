{{ config(materialized='table') }}

with

source as (
    {{ dbt_date.get_date_dimension("2011-01-05", "2014-07-01") }}
)

, dates as (
    select
        date_day
        , day_of_month
        , day_of_week
        , day_of_week_name
        , month_of_year
        , month_name
        , quarter_of_year
        , week_of_year
        , year_number
    from source
)

select * from dates
