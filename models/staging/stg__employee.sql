with

source as (
    select *
    from {{ source('raw-data','employee') }}
)

, renamed as (
    select
        BusinessEntityID as business_entity_id
        , NationalIDNumber as national_id_number
        , LoginID as login_id
        , JobTitle as job_title
        , BirthDate as birth_date
        , MaritalStatus as marital_status
        , Gender
        , HireDate as hire_date
        , SalariedFlag as salaried_flag
        , VacationHours as vacation_hours
        , SickLeaveHours as sick_leave_hours
        , CurrentFlag as current_flag
        , rowguid
        , ModifiedDate as modified_date
        , OrganizationNode as organization_node
    from source
)

select * from renamed
