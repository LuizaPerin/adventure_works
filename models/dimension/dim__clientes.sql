with

cliente as (
    select *
    from {{ ref('stg__customer') }}
)

, pessoa as (
    select *
    from {{ ref('stg__person') }}
)

, loja as (
    select *
    from {{ ref('stg__store') }}
)

, clientes as (
    select
        cliente.customer_id
        , cliente.person_id
        , pessoa.first_name
        , pessoa.middle_name
        , pessoa.last_name
        , cliente.store_id
        , loja.store_name
    from cliente
    left join pessoa on cliente.person_id = pessoa.business_entity_id
    left join loja on cliente.store_id = loja.business_entity_id
)

select * from clientes
