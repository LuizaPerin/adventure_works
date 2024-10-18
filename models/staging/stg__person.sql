with

source as (
    select *
    from {{ source('raw-data','person') }}
)

, renamed as (
    select
        BusinessEntityID as business_entity_id
        , PersonType as person_type
        , NameStyle as name_style
        , Title
        , FirstName as first_name
        , MiddleName as middle_name
        , LastName as last_name
        , Suffix
        , EmailPromotion as email_promotion
        , AdditionalContactInfo as additional_contact_info
        , Demographics
        , rowguid
        , ModifiedDate as modified_date
    from source
)

select * from renamed
