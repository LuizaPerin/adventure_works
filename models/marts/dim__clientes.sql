with

customer as (
    select *
    from {{ ref('stg__customer') }}
)

, person as (
    select *
    from {{ ref('stg__person') }}
)

, store as (
    select *
    from {{ ref('stg__store') }}
)

, dim_clientes as (
    select
        customer.customer_id as customer_id
        , customer.person_id as person_id
        , person.first_name as first_name
        , person.middle_name as middle_name
        , person.last_name as last_name
        , person.first_name || ' ' || person.last_name as nome_customer
        , customer.store_id as store_id
        , store.store_name as store_name
    from customer
    left join person on customer.person_id = person.business_entity_id
    left join store on customer.store_id = store.business_entity_id
)

select * from dim_clientes