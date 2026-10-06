with source as (

    select * from {{ source('adventureworks_person', 'Person') }}

),

renamed as (

    select
        BusinessEntityID as person_id,
        trim(PersonType) as person_type,
        trim(FirstName)  as first_name,
        trim(LastName)   as last_name,
        cast(ModifiedDate as datetime) as modified_at

    from source

)

select * from renamed