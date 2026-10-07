select
    ProductID,
    count(*) as versoes_atuais
from {{ ref('snap_product') }}
where dbt_valid_to is null
group by ProductID
having count(*) > 1