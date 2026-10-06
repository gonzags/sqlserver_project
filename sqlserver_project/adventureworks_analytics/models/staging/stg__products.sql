with source as (

    select * from {{ source('adventureworks_production', 'Product') }}

),

renamed as (

    select
        ProductID         as product_id,
        trim(Name)        as product_name,
        ProductNumber     as product_number,
        MakeFlag          as is_manufactured,
        FinishedGoodsFlag as is_finished_good,
        Color             as product_color,
        cast(StandardCost as decimal(12, 4)) as standard_cost,
        cast(ListPrice as decimal(12, 2))    as list_price,
        ProductLine       as product_line,
        cast(SellStartDate as date)    as sell_start_date,
        cast(SellEndDate as date)      as sell_end_date,
        cast(DiscontinuedDate as date) as discontinued_date,
        cast(ModifiedDate as datetime) as modified_at

    from source

)

select * from renamed