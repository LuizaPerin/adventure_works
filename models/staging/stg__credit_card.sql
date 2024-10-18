with

source as (
    select *
    from {{ source('raw-data','creditcard') }}
)

, renamed as (
    select
        CreditCardID as credit_card_id
        , CardType as card_type
        , CardNumber as card_number
        , ExpMonth as exp_month
        , ExpYear as exp_year
        , ModifiedDate as modified_date
    from source
)

select * from renamed
