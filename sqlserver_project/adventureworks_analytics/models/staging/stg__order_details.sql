with source as (

    select * from {{ source('adventureworks_sales', 'SalesOrderDetail') }}

),

renamed as (

    select
        SalesOrderID       as order_id,
        SalesOrderDetailID as order_detail_id,
        ProductID          as product_id,
        OrderQty           as order_qty,
        cast(UnitPrice as decimal(18, 2))         as unit_price,
        cast(UnitPriceDiscount as decimal(18, 4)) as unit_price_discount,
        cast(LineTotal as decimal(18, 2))         as line_total,
        cast(ModifiedDate as datetime)            as modified_at

    from source

)

select * from renamed