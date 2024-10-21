with

vendedor as (
    select *
    from {{ ref('stg__sales_person') }}
)

, empregado as (
    select *
    from {{ ref('stg__employee') }}
)

, pessoa as (
    select *
    from {{ ref('stg__person') }}
)

, vendedores as (
    select
        vendedor.business_entity_id
        , pessoa.first_name
        , pessoa.middle_name
        , pessoa.last_name
        , empregado.job_title
        , empregado.birth_date
        , empregado.marital_status
        , empregado.gender
        , empregado.hire_date
        , vendedor.sales_quota
        , vendedor.Bonus
        , vendedor.commission_pct
        , vendedor.sales_ytd
        , vendedor.sales_last_year
    from vendedor
    left join empregado on vendedor.business_entity_id = empregado.business_entity_id
    left join pessoa on vendedor.business_entity_id = pessoa.business_entity_id
    where job_title like 'Sales Representative'
)

select * from vendedores
