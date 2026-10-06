with source as (

    select * from {{ source('adventureworks_sales', 'SalesOrderHeader') }}

),

renamed as (

    select
        SalesOrderID    as order_id,
        CustomerID      as customer_id,
        TerritoryID     as territory_id,
        cast(OrderDate as date) as order_date,
        cast(DueDate as date)   as due_date,
        cast(ShipDate as date)  as ship_date,
        cast(Status as integer) as order_status_code,
        OnlineOrderFlag as is_online_order,
        cast(SubTotal as decimal(18, 2)) as sub_total,
        cast(TaxAmt as decimal(18, 2))   as tax_amount,
        cast(Freight as decimal(18, 2))  as freight_amount,
        cast(TotalDue as decimal(18, 2)) as total_due,
        cast(ModifiedDate as datetime)   as modified_at

    from source

)

select * from renamed