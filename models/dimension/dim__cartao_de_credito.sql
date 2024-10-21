with

source as (
    select *
    from {{ ref('stg__credit_card') }}
)

, cartao as (
    select
        credit_card_id
        , card_type
    from source
)

select * from cartao
