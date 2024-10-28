with

credit_card as (
    select *
    from {{ ref('stg__credit_card') }}
)

, dim_cartao as (
    select
        credit_card_id
        , card_type
    from credit_card
)

select * from dim_cartao
