{% snapshot snap_customer %}

{{
    config(
        target_schema='snapshots',
        unique_key='CustomerID',
        strategy='check',
        check_cols=['TerritoryID', 'PersonID', 'StoreID']
    )
}}

select
    cast(CustomerID as int) as CustomerID,
    PersonID,
    StoreID,
    TerritoryID,
    ModifiedDate
from {{ source('adventureworks_sales', 'Customer') }}

{% endsnapshot %}
