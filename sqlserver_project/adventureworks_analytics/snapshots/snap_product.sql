{% snapshot snap_product %}

{{
    config(
        target_schema='snapshots',
        unique_key='ProductID',
        strategy='check',
        check_cols=['Name', 'StandardCost', 'ListPrice']
    )
}}

select
    cast(ProductID as int) as ProductID,
    Name,
    ProductNumber,
    StandardCost,
    ListPrice,
    ModifiedDate
from {{ source('adventureworks_production', 'Product') }}

{% endsnapshot %}