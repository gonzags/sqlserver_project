select
    CustomerID,
    count(*) as versoes_atuais
from {{ ref('snap_customer') }}
where dbt_valid_to is null
group by CustomerID
having count(*) > 1