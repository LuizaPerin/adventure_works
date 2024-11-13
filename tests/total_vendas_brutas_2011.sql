with

    source as (
        select *
        from {{ ref('fct__vendas') }}
    )

    , test as (
        select
            12646112.16 as expected_total
            , round(sum(gross_amount), 2) as total
            , expected_total != total as is_expected_different_than_total
        from source
        where year(order_date) = 2011
    )

select *
from test
where is_expected_different_than_total
